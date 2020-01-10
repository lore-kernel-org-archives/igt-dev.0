Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6ED56E9DE
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2020 12:06:51 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Fri, 10 Jan 2020 14:06:41 +0200
Message-Id: <20200110120642.19844-2-petri.latvala@intel.com>
In-Reply-To: <20200110120642.19844-1-petri.latvala@intel.com>
References: <20200110120642.19844-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/2] runner: Ensure generated json is
 properly UTF8-encoded
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Sometimes tests output garbage (e.g. due to extreme occurrences of
https://gitlab.freedesktop.org/drm/igt-gpu-tools/issues/55) but we
need to present the garbage as results.

We already ignore any test output after the first \0, and for the rest
of the bytes that are not directly UTF-8 as-is, we can quite easily
represent them with two-byte UTF-8 encoding.

libjson-c already expects the string you feed it through
json_object_new_string* functions to be UTF-8.

v2: Rebase, adjust for dynamic subtest parsing

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com> #v1
---
 runner/resultgen.c | 45 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 35 insertions(+), 10 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 2c8a55da..105ec887 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -405,15 +405,40 @@ static void free_matches(struct matches *matches)
 	free(matches->items);
 }
 
+static struct json_object *new_escaped_json_string(const char *buf, size_t len)
+{
+	struct json_object *obj;
+	char *str = NULL;
+	size_t strsize = 0;
+	size_t i;
+
+	for (i = 0; i < len; i++) {
+		if (buf[i] > 0 && buf[i] < 128) {
+			str = realloc(str, strsize + 1);
+			str[strsize] = buf[i];
+			++strsize;
+		} else {
+			/* Encode > 128 character to UTF-8. */
+			str = realloc(str, strsize + 2);
+			str[strsize] = ((unsigned char)buf[i] >> 6) | 0xC0;
+			str[strsize + 1] = ((unsigned char)buf[i] & 0x3F) | 0x80;
+			strsize += 2;
+		}
+	}
+
+	obj = json_object_new_string_len(str, strsize);
+	free(str);
+
+	return obj;
+}
+
 static void add_igt_version(struct json_object *testobj,
 			    const char *igt_version,
 			    size_t igt_version_len)
 {
 	if (igt_version)
 		json_object_object_add(testobj, "igt-version",
-				       json_object_new_string_len(igt_version,
-								  igt_version_len));
-
+				       new_escaped_json_string(igt_version, igt_version_len));
 }
 
 enum subtest_find_pattern {
@@ -608,7 +633,7 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 		current_dynamic_test = get_or_create_json_object(tests, dynamic_piglit_name);
 
 		json_object_object_add(current_dynamic_test, key,
-				       json_object_new_string_len(dynbeg, dynend - dynbeg));
+				       new_escaped_json_string(dynbeg, dynend - dynbeg));
 		add_igt_version(current_dynamic_test, igt_version, igt_version_len);
 
 		if (!json_object_object_get_ex(current_dynamic_test, "result", NULL)) {
@@ -680,7 +705,7 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 		current_test = get_or_create_json_object(tests, piglit_name);
 
 		json_object_object_add(current_test, key,
-				       json_object_new_string_len(buf, statbuf.st_size));
+				       new_escaped_json_string(buf, statbuf.st_size));
 		add_igt_version(current_test, igt_version, igt_version_len);
 
 		return true;
@@ -704,7 +729,7 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 		end = find_subtest_end_limit(matches, begin_idx, result_idx, buf, bufend);
 
 		json_object_object_add(current_test, key,
-				       json_object_new_string_len(beg, end - beg));
+				       new_escaped_json_string(beg, end - beg));
 
 		add_igt_version(current_test, igt_version, igt_version_len);
 
@@ -863,11 +888,11 @@ static void add_dmesg(struct json_object *obj,
 		      const char *warnings, size_t warningslen)
 {
 	json_object_object_add(obj, "dmesg",
-			       json_object_new_string_len(dmesg, dmesglen));
+			       new_escaped_json_string(dmesg, dmesglen));
 
 	if (warnings) {
 		json_object_object_add(obj, "dmesg-warnings",
-				       json_object_new_string_len(warnings, warningslen));
+				       new_escaped_json_string(warnings, warningslen));
 	}
 }
 
@@ -1482,7 +1507,7 @@ struct json_object *generate_results_json(int dirfd)
 			r--;
 
 		json_object_object_add(obj, "uname",
-				       json_object_new_string_len(buf, r));
+				       new_escaped_json_string(buf, r));
 		close(fd);
 	}
 
@@ -1545,7 +1570,7 @@ struct json_object *generate_results_json(int dirfd)
 		s = read(fd, buf, sizeof(buf));
 
 		json_object_object_add(aborttest, "out",
-				       json_object_new_string_len(buf, s));
+				       new_escaped_json_string(buf, s));
 		json_object_object_add(aborttest, "err",
 				       json_object_new_string(""));
 		json_object_object_add(aborttest, "dmesg",
-- 
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
