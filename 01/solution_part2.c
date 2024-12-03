#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

typedef uint64_t u64;
typedef int64_t i64;

#define ABS(a) (a) > 0 ? (a) : -(a);

static i64 huge_ass_array[999999] = {0};

typedef struct {
  char * buffer;
  u64 size;
} String;

String ReadFile(const char * filename) {
  FILE* file = fopen(filename, "r");
  if (file == NULL) {
    perror("");
    exit(EXIT_FAILURE);
  }
  fseek(file, 0, SEEK_END);
  u64 size = ftell(file);
  fseek(file, 0, SEEK_SET);
  char* buffer = calloc(1, size);
  fread(buffer, 1, size, file);
  return (String){.buffer=buffer, .size=size};
}

u64 CountLines(String s) {
  u64 lines = 0;
  for (u64 i = 0; i < s.size; i++) {
    if (s.buffer[i] == '\n') {
      lines++;
    }
  }
  return lines;
}

int Compare(const void * a, const void * b) {
  return *(i64*)a - *(i64*)b;
}

int main() {
  i64 *left, *right;
  String content = ReadFile("01/input.txt");
  u64 lines = CountLines(content);

  left = calloc(lines, sizeof(i64));
  right = calloc(lines, sizeof(i64));

  char * current, * next;
  current = content.buffer;
  for (u64 i = 0; i < lines; i++) {
    left[i] = strtoul(current, &next, 10);
    right[i] = strtoul(next, &current, 10);
  }

  qsort(left, lines, sizeof(i64), &Compare);
  qsort(right, lines, sizeof(i64), &Compare);

  for (u64 i = 0; i < lines; i++) {
    huge_ass_array[right[i]] += 1;
  }

  u64 score = 0;
  for (u64 i = 0; i < lines; i++) {
    score += (left[i] * huge_ass_array[left[i]]);
  }
  printf("%lu\n", score);
  return 0;
}
