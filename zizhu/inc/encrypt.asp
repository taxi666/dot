
<% function encrypt(prestring)

      Dim texts
      Dim seed
      Dim i,length
      prestring = trim(preString)
      length = len(preString)
      seed = length
      Randomize(length)
      texts = ""
      for i = 1 to length
            seed = int(95*rnd(-asc(mid(preString,i,1))-seed*asc(right(prestring,1)))+32)
            texts = texts & chr(seed) & chr(int(95*rnd(-seed)+32))
      next
      encrypt = texts
      end function 
%>

