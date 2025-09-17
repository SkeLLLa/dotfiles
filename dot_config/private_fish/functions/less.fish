function less
    # Ensure at least one argument is passed
    if test (count $argv) -eq 0
        echo "less: missing filename"
        return 1
    end

    set file $argv[1]

    # Check if file exists
    if not test -f "$file"
        echo "less: file '$file' not found"
        return 1
    end

    # Check if file extension is .json (case-insensitive)
    if string match -iq '*.json' $file
        fx $file
        return $status
    end

    # If no .json extension, check if content *looks* like JSON
    set first_line (head -n 1 $file | string trim)

    if echo "$first_line" | string match -qr '^\s*[\[\{]'
        # Try parsing with fx to confirm it's valid JSON
        if fx "$file" >/dev/null 2>&1
            fx $file
            return $status
        end
    end

    # Fallback to ov for all other file types
    ov $argv
end
