echo -e "1) Basic sanity metrics (length, % gaps, #informative sites)"
echo -e "A) Alignment length and gap fraction:\n"
echo -e "First prints number of sequences and alignment length (rough).\n"

DIR_PATH="/mnt/home/benucci/Phylogenetics/Phylogeny_with_RAXml/muscle"

for f in "$DIR_PATH"/results/otus99_aln_muscle.fasta results/otus99_muscle_trim.fasta "$DIR_PATH"/results/otus99_muscle_trim_gappy.fasta; do
  echo "== $f =="
  awk '
    BEGIN{seq=""; n=0; gaps=0; len=0}
    /^>/{
      if(n>0){
        if(len==0) len=length(seq)
        # assume equal length alignment
      }
      seq=""
      n++
      next
    }
    {
      gsub(/[ \t\r\n]/,"")
      seq=seq $0
    }
    END{
      # cannot compute gaps without reading all seqs; do second pass
      print "seqs:", n
      print "aln_len(first seq):", length(seq)
    }
  ' "$f"
done

echo -e "\n"
echo -e "B) Compute overall gap proportion (more useful):"
for f in "$DIR_PATH"/results/otus99_aln_muscle.fasta results/otus99_muscle_trim.fasta "$DIR_PATH"/results/otus99_muscle_trim_gappy.fasta; do
  echo "== $f =="
  awk '
    /^>/ {next}
    {
      gsub(/[ \t\r\n]/,"")
      total += length($0)
      gaps  += gsub(/-/, "-", $0)
    }
    END{
      printf("total_chars=%d gaps=%d gap_frac=%.4f\n", total, gaps, gaps/total)
    }
  ' "$f"
done

echo -e "\nPick the alignment that:" 
echo -e "* keeps a reasonable length (not ridiculously short)."
echo -e "* has meaningfully reduced gap fraction vs raw."
echo -e "* doesn’t look like it nuked everything into a tiny core."
