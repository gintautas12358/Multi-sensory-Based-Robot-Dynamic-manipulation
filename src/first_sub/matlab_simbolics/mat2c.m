
function code = mat2c(a)
   code = a;
   t = strfind(code,'^');
   [s0, s] = size(t);
   while (s > 0)
       anchor = t(1);
       end_index = anchor + 1;
       begin_index = anchor - 2;
       while (code(begin_index) ~= 'L' & code(begin_index) ~= 'c')
           begin_index = begin_index -1;
       end
       code = join([code(1:begin_index-1) 'pow('  code(begin_index:anchor-1) ',' code(end_index)  ')' code(end_index+1:end)]);
        t = strfind(code,'^');
        [s0, s] = size(t);
   end
 
    t = strfind(code,'^');
   [s0, s] = size(t);
   while (s > 0)
       anchor = t(1);
       end_index = anchor + 1;
       begin_index = anchor - 2;
       while (code(begin_index) ~= 'q')
           begin_index = begin_index -1;
       end
       code = join([code(1:begin_index-1) 'pow('  code(begin_index:anchor-1) ',' code(end_index)  ')' code(end_index+1:end)]);
        t = strfind(code,'^');
        [s0, s] = size(t);
   end
end
