Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79A310E0F4
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Aug 2023 19:22:11 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 18 Aug 2023 21:22:01 +0200
Message-Id: <20230818192203.75155-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230818192203.75155-1-kamil.konieczny@linux.intel.com>
References: <20230818192203.75155-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] runner/resultgen: limit dmesg added
 into results
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

When disk limit option is used, check if size of collected
kernel dmesg log exceeded it and then copy into results
only limited number of lines. This should be better then
stopping collecting dmesg during tests as such cutted down
dmesg log may later limit search for problem solution.

Now solution is a little simplistic, just copy a few lines
from beginning and end of it into results.json

TODO: improve finding offending line for later processing
allow to specify in option number of lines copied before/after
maybe, instead of numbers, giver percentage for it
add a check if what we want to copy is still too big

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 139 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 121 insertions(+), 18 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index b00bb6ba5..0dc26b335 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -919,16 +919,103 @@ static void generate_formatted_dmesg_line(char *message,
 	*f = '\0';
 }
 
+static size_t dmesg_limit_append(size_t maxsize, char *str, size_t strsize,
+				 const char *buf, size_t bufsize)
+{
+	size_t append;
+
+	if (maxsize - strsize > bufsize)
+		append = bufsize;
+	else
+		append = maxsize - strsize;
+
+	memcpy(str + strsize, buf, append);
+
+	return strsize + append;
+}
+
+/*
+ * TODO: add option for number of included lines and max size of dmesg
+ */
+#define DMESG_LINE_SIZE 1024
+#define DMESG_LIMIT_BEGIN_LINES  500
+#define DMESG_LIMIT_END_LINES   1500
+#define DMESG_LIMIT_ERROR_LINES 2500
+
+#define DMESG_LIMIT_MAX_SIZE (DMESG_LIMIT_ERROR_LINES * DMESG_LINE_SIZE)
+
+static void add_dmesg_limited(struct json_object *obj, const char *dname,
+			      const char *dmesg, size_t dmesglen)
+{
+	char *small_buf;
+	size_t small_len = 0;
+	const char *sptr, *stmp;
+	int line;
+	size_t len;
+
+	small_buf = malloc(DMESG_LIMIT_MAX_SIZE);
+	if (!small_buf) {
+		fprintf(stderr, "Malloc error %d\n", errno);
+		return;
+	}
+
+	small_len = snprintf(small_buf, DMESG_LIMIT_MAX_SIZE, "igt_runner: disk limit exceeded\n");
+
+	sptr = dmesg;
+	len = 0;
+	for (line = 0; line < DMESG_LIMIT_BEGIN_LINES && len < dmesglen; line++) {
+		stmp = memchr(sptr, '\n', dmesglen - len);
+		if (!stmp)
+			break;
+
+		++stmp;
+		len += stmp - sptr;
+		sptr = stmp;
+	}
+
+	small_len = dmesg_limit_append(DMESG_LIMIT_MAX_SIZE, small_buf, small_len, dmesg, sptr - dmesg);
+
+	len = dmesglen - 1;
+	sptr = dmesg + len;
+	for (line = 0; line < DMESG_LIMIT_END_LINES && len > 0; line++) {
+		stmp = memrchr(dmesg, '\n', len);
+		if (!stmp)
+			break;
+
+		len = stmp - dmesg;
+		if (len == 0)
+			break;
+
+		--len;
+	}
+
+	len += 2;
+	if (len < dmesglen)
+		small_len = dmesg_limit_append(DMESG_LIMIT_MAX_SIZE, small_buf, small_len, dmesg + len, dmesglen - len);
+
+	json_object_object_add(obj, dname,
+			       new_escaped_json_string(small_buf, small_len));
+
+	free(small_buf);
+}
+
 static void add_dmesg(struct json_object *obj,
 		      const char *dmesg, size_t dmesglen,
-		      const char *warnings, size_t warningslen)
+		      const char *warnings, size_t warningslen,
+		      size_t limit)
 {
-	json_object_object_add(obj, "dmesg",
-			       new_escaped_json_string(dmesg, dmesglen));
+	if (limit)
+		add_dmesg_limited(obj, "dmesg", dmesg, dmesglen);
+	else
+		json_object_object_add(obj, "dmesg",
+				       new_escaped_json_string(dmesg, dmesglen));
 
 	if (warnings) {
-		json_object_object_add(obj, "dmesg-warnings",
-				       new_escaped_json_string(warnings, warningslen));
+		if (limit)
+			add_dmesg_limited(obj, "dmesg-warnings", warnings, warningslen);
+		else
+			json_object_object_add(obj, "dmesg-warnings",
+					       new_escaped_json_string(warnings, warningslen));
 	}
 }
 
@@ -945,7 +1032,7 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 		generate_piglit_name(binary, subtests->subs[i].name, piglit_name, sizeof(piglit_name));
 		current_test = get_or_create_json_object(tests, piglit_name);
 		if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
-			add_dmesg(current_test, "", 0, NULL, 0);
+			add_dmesg(current_test, "", 0, NULL, 0, 0);
 		}
 
 		for (k = 0; k < subtests->subs[i].dynamic_size; k++) {
@@ -953,14 +1040,14 @@ static void add_empty_dmesgs_where_missing(struct json_object *tests,
 							 dynamic_piglit_name, sizeof(dynamic_piglit_name));
 			current_test = get_or_create_json_object(tests, dynamic_piglit_name);
 			if (!json_object_object_get_ex(current_test, "dmesg", NULL)) {
-				add_dmesg(current_test, "", 0, NULL, 0);
+				add_dmesg(current_test, "", 0, NULL, 0, 0);
 			}
 		}
 	}
 
 }
 
-static bool fill_from_dmesg(int fd,
+static bool fill_from_dmesg(int fd, char *dirname,
 			    struct settings *settings,
 			    char *binary,
 			    struct subtest_list *subtests,
@@ -972,11 +1059,13 @@ static bool fill_from_dmesg(int fd,
 	size_t linelen = 0;
 	size_t warningslen = 0, dynamic_warnings_len = 0;
 	size_t dmesglen = 0, dynamic_dmesg_len = 0;
+	size_t limit = 0;
 	struct json_object *current_test = NULL;
 	struct json_object *current_dynamic_test = NULL;
 	FILE *f = fdopen(fd, "r");
 	char piglit_name[256];
 	char dynamic_piglit_name[256];
+	struct stat st;
 	size_t i;
 	GRegex *re;
 
@@ -989,6 +1078,19 @@ static bool fill_from_dmesg(int fd,
 		return false;
 	}
 
+	if (!fstat(fd, &st)) {
+		fprintf(stderr, "Cannot stat file, errno: %d\n", errno);
+		fclose(f);
+		return false;
+	}
+
+	if (settings->disk_usage_limit &&
+	    st.st_size > settings->disk_usage_limit) {
+		limit = settings->disk_usage_limit;
+		fprintf(stderr, "Disk limit exceeded, limit %ld < %ld file size\n",
+			limit, st.st_size);
+	}
+
 	while (getline(&line, &linelen, f) > 0) {
 		char *formatted;
 		unsigned flags;
@@ -1004,7 +1106,7 @@ static bool fill_from_dmesg(int fd,
 		if ((subtest = strstr(message, STARTING_SUBTEST_DMESG)) != NULL) {
 			if (current_test != NULL) {
 				/* Done with the previous subtest, file up */
-				add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+				add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen, limit);
 
 				free(dmesg);
 				free(warnings);
@@ -1012,7 +1114,7 @@ static bool fill_from_dmesg(int fd,
 				dmesglen = warningslen = 0;
 
 				if (current_dynamic_test != NULL)
-					add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+					add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len, limit);
 
 				free(dynamic_dmesg);
 				free(dynamic_warnings);
@@ -1030,7 +1132,7 @@ static bool fill_from_dmesg(int fd,
 		    (dynamic_subtest = strstr(message, STARTING_DYNAMIC_SUBTEST_DMESG)) != NULL) {
 			if (current_dynamic_test != NULL) {
 				/* Done with the previous dynamic subtest, file up */
-				add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+				add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len, limit);
 
 				free(dynamic_dmesg);
 				free(dynamic_warnings);
@@ -1065,9 +1167,9 @@ static bool fill_from_dmesg(int fd,
 	free(line);
 
 	if (current_test != NULL) {
-		add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+		add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen, limit);
 		if (current_dynamic_test != NULL) {
-			add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len);
+			add_dmesg(current_dynamic_test, dynamic_dmesg, dynamic_dmesg_len, dynamic_warnings, dynamic_warnings_len, limit);
 		}
 	} else {
 		/*
@@ -1083,13 +1185,13 @@ static bool fill_from_dmesg(int fd,
 			 * there are would have skip as their result
 			 * anyway.
 			 */
-			add_dmesg(current_test, dmesg, dmesglen, NULL, 0);
+			add_dmesg(current_test, dmesg, dmesglen, NULL, 0, limit);
 		}
 
 		if (subtests->size == 0) {
 			generate_piglit_name(binary, NULL, piglit_name, sizeof(piglit_name));
 			current_test = get_or_create_json_object(tests, piglit_name);
-			add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen);
+			add_dmesg(current_test, dmesg, dmesglen, warnings, warningslen, limit);
 		}
 	}
 
@@ -1101,6 +1203,7 @@ static bool fill_from_dmesg(int fd,
 	free(dynamic_warnings);
 	g_regex_unref(re);
 	fclose(f);
+
 	return true;
 }
 
@@ -2110,7 +2213,7 @@ static void add_to_totals(const char *binary,
 	}
 }
 
-static bool parse_test_directory(int dirfd,
+static bool parse_test_directory(int dirfd, char *dirname,
 				 struct job_list_entry *entry,
 				 struct settings *settings,
 				 struct results *results)
@@ -2151,7 +2254,7 @@ static bool parse_test_directory(int dirfd,
 		}
 	}
 
-	if (!fill_from_dmesg(fds[_F_DMESG], settings, entry->binary, &subtests, results->tests)) {
+	if (!fill_from_dmesg(fds[_F_DMESG], dirname, settings, entry->binary, &subtests, results->tests)) {
 		fprintf(stderr, "Error parsing output files (dmesg.txt)\n");
 		status = false;
 		goto parse_output_end;
@@ -2300,7 +2403,7 @@ struct json_object *generate_results_json(int dirfd)
 			continue;
 		}
 
-		if (!parse_test_directory(testdirfd, &job_list.entries[i], &settings, &results)) {
+		if (!parse_test_directory(testdirfd, name, &job_list.entries[i], &settings, &results)) {
 			close(testdirfd);
 			return NULL;
 		}
-- 
2.39.2
