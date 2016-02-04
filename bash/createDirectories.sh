#!/bin/bash

sourceRoot="/home"
group="instructors"
permissions="770"

cat "students.data" | \
while read student; do
	mkdir -p $sourceRoot/$student/{submit,returned,mynotes}
	sudo chown -R "$student:$group" $sourceRoot/$student/{submit,returned,mynotes}
	sudo chown "$student:$student" $sourceRoot/$student
	sudo chmod $permissions $sourceRoot/$student/{submit,returned,mynotes}

	if \
	[ -d $sourceRoot/$student/submit ] && \
	[ -d $sourceRoot/$student/returned ] && \
	[ -d $sourceRoot/$student/mynotes ];
	then
		echo "Directories created successfully for $student"
	else
		>&2 echo "Failed to create directories for $student"
	fi
done

