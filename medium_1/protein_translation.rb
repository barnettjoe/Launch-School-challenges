class Translation
  CODONS = { "AUG" =>    "Methionine",
             "UUU" => "Phenylalanine",
             "UUC" => "Phenylalanine",
             "UUA" =>       "Leucine",
             "UUG" =>       "Leucine",
             "UCU" =>        "Serine",
             "UCC" =>        "Serine",
             "UCA" =>        "Serine",
             "UCG" =>        "Serine",
             "UAU" =>      "Tyrosine",
             "UAC" =>      "Tyrosine",
             "UGU" =>      "Cysteine",
             "UGC" =>      "Cysteine",
             "UGG" =>    "Tryptophan",
             "UAA" =>          "STOP",
             "UAG" =>          "STOP",
             "UGA" =>          "STOP" }

  def self.of_codon(str)
    CODONS[str] || raise(InvalidCodonError)
  end

  def self.of_rna(str)
    codons = str.chars.each_slice(3).map { |x| of_codon(x.join) }
    codons.take_while { |x| x != "STOP" }
  end
end

class InvalidCodonError < StandardError
end