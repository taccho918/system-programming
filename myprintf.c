void hexadecimal_print(unsigned int n)
{
  char str[] = "0123456789ABCDEF";

  if (n/16 > 0) hexadecimal_print(n / 16);
  print_char(str[n % 16]);
}

void octal_print(unsigned int n)
{
  char str[]="01234567";

  if(n/8 > 0) octal_print(n/8);
  print_char(str[n % 8]);
}

void myprintf(char *fmt, ...)
{
 
  char *p = (char*)&fmt;
  
  //fmt++で*fmtが指す場所を順に繰り上げていき、
  //*fmtのポインタを指す場所がなくなるまで出力する処理を繰り返す
  
  while(*fmt){//fmtの最初が%から始まるときとそうでない時で分岐する 
    if(*fmt == '%'){ 
      fmt++; //%をとばす
      
      switch(*fmt){
      
      case 'd': //10進数で出力する
	p = (p + ((sizeof(fmt) + 3) / 4) * 4);
	print_int(*(int*)p);
	break;
	
      case 's': //文字列で出力する
	p = (p + ((sizeof(fmt) + 3) / 4) * 4);
	print_string(*(char**)p);
	break;

      case 'c': //1文字で出力する
	p = (p + ((sizeof(fmt) + 3) / 4) * 4);
	print_char(*(char*)p);
	break;

      case 'x': //10進数を16進数に変換して出力する
	p = (p + ((sizeof(fmt) + 3) / 4) * 4);
	hexadecimal_print(*(int*)p);
	break;

      case 'o': //10進数を8進数に変換して出力する
	p = (p + ((sizeof(fmt) + 3) / 4) * 4);
	octal_print(*(int*)p);
	break;
      }

    } else {
      //そのまま*fmtの一文字を表示
      print_char(*fmt);
    }
    fmt++;
  }
}

int main()
{
  char string[]= "ABC";

  myprintf("test: %d, %s, %c, %x, %o\n", 10, string, 'a', 19, 10);
  print_string("Done.\n");
  return 0;
}

