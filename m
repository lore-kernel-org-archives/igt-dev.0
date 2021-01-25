Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67A7689E86
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Jan 2021 13:55:26 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 25 Jan 2021 15:55:14 +0200
Message-Id: <20210125135514.23925-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Fix graceful exit result parsing
 for dynamic subtests
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

Commit 10c83dfa5ad2 ("runner: Introduce a way to stop testing without
marking tests incomplete") added graceful exiting by signaling the
runner with SIGHUP, marking the currently running test as 'notrun'
instead of 'incomplete'. The result handling didn't handle dynamic
subtests though, so the currently executing dynamic subtest was still
marked as 'incomplete'. Handle that now similarly as handling the
'abort' result.

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
---
 runner/resultgen.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index 8d0c6249..b74970a6 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -656,19 +656,24 @@ static void process_dynamic_subtest_output(const char *piglit_name,
 					     dynend);
 
 			/*
-			 * If a dynamic subsubtest is considered incomplete we
-			 * need to check parent's status first, to be sure that
-			 * the binary hasn't aborted (exit code). If it has
-			 * aborted then we have to attribute this status to our
-			 * subsubtest.
+			 * If a dynamic subsubtest is considered
+			 * incomplete we need to check parent's status
+			 * first, to be sure that the binary hasn't
+			 * aborted or stopped gracefully (exit
+			 * code). If it has aborted then we have to
+			 * attribute this status to our subsubtest.
 			 */
 			if (!strcmp(dynresulttext, "incomplete")) {
 				struct json_object *parent_subtest;
 
 				if (json_object_object_get_ex(tests, piglit_name, &parent_subtest) &&
-				    json_object_object_get_ex(parent_subtest, "result", &parent_subtest) &&
-				    !strcmp(json_object_get_string(parent_subtest), "abort"))
-					dynresulttext = "abort";
+				    json_object_object_get_ex(parent_subtest, "result", &parent_subtest)) {
+					const char *resulttext = json_object_get_string(parent_subtest);
+
+					if (!strcmp(resulttext, "abort") ||
+					    !strcmp(resulttext, "notrun"))
+						dynresulttext = resulttext;
+				}
 			}
 
 			set_result(current_dynamic_test, dynresulttext);
-- 
2.29.2

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
