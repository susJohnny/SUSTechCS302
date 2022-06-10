#include <stdio.h>
#include <malloc.h>
struct Student
{
	int number;
	int score;
};

int main()
{
	int n;
	scanf("%d", &n);
	struct Student *students = (struct Student *)malloc(n * sizeof(struct Student));
	for (int i = 0; i < n; i++)
	{
		scanf("%d %d", &(students + i)->number, &(students + i)->score);
	}
	for (int i = 0; i < n - 1; i++)
	{
		int min = 10000;
		int id = -1;
		for (int j = i; j < n; j++)
		{
			if (students[j].score < min)
			{
				min = students[j].score;
				id = j;
			}
		}
		if (id > 0)
		{
			struct Student tmp = students[i];
			students[i] = students[id];
			students[id] = tmp;
		}
	}
	printf("Output:\n");
	for (int i = 0; i < n; i++)
	{
		printf("%d %d\n", students[i].number, students[i].score);
	}
}