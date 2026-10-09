# -*- coding: utf-8 -*-
import os
import sys

def split_component(source_file, target_dir, component_name, props_interface=""):
    """
    Helper function to extract a component and its props from a source file into a new file.
    """
    if not os.path.exists(source_file):
        print(f"Error: Source file {source_file} not found.")
        return False
        
    with open(source_file, "r", encoding="utf-8") as f:
        content = f.read()
        
    # Find component boundaries
    start_pattern = f"export function {component_name}"
    start_idx = content.find(start_pattern)
    if start_idx == -1:
        start_pattern = f"function {component_name}"
        start_idx = content.find(start_pattern)
        
    if start_idx == -1:
        print(f"Error: Component {component_name} not found in {source_file}.")
        return False
        
    # Find closing brace of the component function
    # Simple brace matching
    brace_count = 0
    in_block = False
    end_idx = -1
    
    for i in range(start_idx, len(content)):
        char = content[i]
        if char == "{":
            brace_count += 1
            in_block = True
        elif char == "}":
            brace_count -= 1
            if in_block and brace_count == 0:
                end_idx = i + 1
                break
                
    if end_idx == -1:
        print(f"Error: Could not find closing brace for component {component_name}.")
        return False
        
    component_code = content[start_idx:end_idx]
    
    # Extract props interface if specified
    props_code = ""
    if props_interface:
        props_start = content.find(f"interface {props_interface}")
        if props_start != -1:
            props_brace_count = 0
            props_in_block = False
            props_end_idx = -1
            for i in range(props_start, len(content)):
                char = content[i]
                if char == "{":
                    props_brace_count += 1
                    props_in_block = True
                elif char == "}":
                    props_brace_count -= 1
                    if props_in_block and props_brace_count == 0:
                        props_end_idx = i + 1
                        break
            if props_end_idx != -1:
                props_code = content[props_start:props_end_idx] + "\n\n"
                
    # Create target file
    if not os.path.exists(target_dir):
        os.makedirs(target_dir)
        
    target_file = os.path.join(target_dir, f"{component_name}.tsx")
    
    # Simple react/types imports extraction or placeholders
    # In a real tool, it would read from source imports, but here we keep it robust.
    imports = "import React from 'react';\n"
    if "Interval" in props_code or "Interval" in component_code:
        imports += "import { ChoghadiyaInterval, HoraInterval } from '../types';\n"
        
    new_file_content = f"{imports}\n{props_code}{component_code}\n"
    
    with open(target_file, "w", encoding="utf-8") as f:
        f.write(new_file_content)
        
    print(f"Successfully extracted {component_name} to {target_file}")
    
    # Replace in source file
    # Remove props and component blocks
    modified_content = content
    if props_code:
        modified_content = modified_content.replace(content[props_start:props_end_idx], "")
    
    # Reload indices to be safe after deleting props
    start_idx = modified_content.find(start_pattern)
    brace_count = 0
    in_block = False
    end_idx = -1
    for i in range(start_idx, len(modified_content)):
        char = modified_content[i]
        if char == "{":
            brace_count += 1
            in_block = True
        elif char == "}":
            brace_count -= 1
            if in_block and brace_count == 0:
                end_idx = i + 1
                break
                
    if end_idx != -1:
        # Replace with import indicator or remove it
        modified_content = modified_content[:start_idx] + modified_content[end_idx:]
        
    # Insert import statement in source file
    import_line = f"import {{ {component_name} }} from './components/{component_name}';\n"
    subcomponents_marker = "// Subcomponents"
    marker_pos = modified_content.find(subcomponents_marker)
    if marker_pos != -1:
        insert_idx = marker_pos + len(subcomponents_marker)
        modified_content = modified_content[:insert_idx] + "\n" + import_line + modified_content[insert_idx:]
    else:
        modified_content = import_line + modified_content
        
    with open(source_file, "w", encoding="utf-8") as f:
        f.write(modified_content)
        
    print(f"Updated {source_file} to import {component_name}")
    return True

if __name__ == "__main__":
    if len(sys.argv) < 4:
        print("Usage: python universal_split.py <source_file> <target_dir> <component_name> [props_interface]")
    else:
        props = sys.argv[4] if len(sys.argv) > 4 else ""
        split_component(sys.argv[1], sys.argv[2], sys.argv[3], props)
