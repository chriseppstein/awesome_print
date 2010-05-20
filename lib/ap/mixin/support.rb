module AwesomePrint::Support
  # Align strings according to tab stops
  # Two adjacent tabs will cause the next column to be right aligned.
  def align(string)
    # First we break up our string into lines and columns.
    # and record the max widths of each column
    widths = []
    lines = string.split("\n").map do |line|
      cols = line.split("\t")
      cols.each_with_index {|col, i| widths[i] = [widths[i] ||0, col.size].max }
      cols
    end
    # Then we reformat the string
    # It's a shame they didn't add map_with_index until 1.9
    j = 0
    lines.map! do |line|
      rjust = false
      i = 0
      l = line.map! do |col|
        c = if widths[i] == 0
          rjust = true
          nil
        else
          if rjust
            rjust = false
            col.rjust(widths[i])
          else
            (i == line.size - 1) ? col : col.ljust(widths[i])
          end
        end
        i += 1
        c
      end.compact.join(" ")
      j += 1
      l
    end.join("\n")
  end
end