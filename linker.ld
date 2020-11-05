ENTRY(start)

SECTIONS{
  . = 1M;

  .boot :
  {
    *(.mboot)
  }

  .text :
  {
    *(.text)
  }

}
