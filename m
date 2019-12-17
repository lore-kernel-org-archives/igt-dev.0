Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EDC6E0CA
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Dec 2019 09:48:09 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Tue, 17 Dec 2019 11:47:50 +0200
Message-Id: <20191217094800.30687-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/11] runner/resultgen: Extract igt-version
 field handling to a helper
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

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Reviewed-by: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/resultgen.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index aa438000..31bc0bb1 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -365,6 +365,17 @@ static void free_matches(struct matches *matches)
 	free(matches->items);
 }
 
+static void add_igt_version(struct json_object *testobj,
+			    const char *igt_version,
+			    size_t igt_version_len)
+{
+	if (igt_version)
+		json_object_object_add(testobj, "igt-version",
+				       json_object_new_string_len(igt_version,
+								  igt_version_len));
+
+}
+
 static bool fill_from_output(int fd, const char *binary, const char *key,
 			     struct subtest_list *subtests,
 			     struct json_object *tests)
@@ -420,10 +431,7 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 
 		json_object_object_add(current_test, key,
 				       json_object_new_string_len(buf, statbuf.st_size));
-		if (igt_version)
-			json_object_object_add(current_test, "igt-version",
-					       json_object_new_string_len(igt_version,
-									  igt_version_len));
+		add_igt_version(current_test, igt_version, igt_version_len);
 
 		return true;
 	}
@@ -522,11 +530,7 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 		json_object_object_add(current_test, key,
 				       json_object_new_string_len(beg, end - beg));
 
-		if (igt_version) {
-			json_object_object_add(current_test, "igt-version",
-					       json_object_new_string_len(igt_version,
-									  igt_version_len));
-		}
+		add_igt_version(current_test, igt_version, igt_version_len);
 
 		if (!json_object_object_get_ex(current_test, "result", NULL)) {
 			parse_subtest_result(subtests->subs[i].name,
@@ -608,10 +612,7 @@ static bool fill_from_output(int fd, const char *binary, const char *key,
 
 				json_object_object_add(current_dynamic_test, key,
 						       json_object_new_string_len(dynbeg, dynend - dynbeg));
-				if (igt_version)
-					json_object_object_add(current_dynamic_test, "igt-version",
-							       json_object_new_string_len(igt_version,
-											  igt_version_len));
+				add_igt_version(current_dynamic_test, igt_version, igt_version_len);
 
 				if (!json_object_object_get_ex(current_dynamic_test, "result", NULL)) {
 					const char *dynresulttext;
-- 
2.19.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
