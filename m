Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FFA810E311
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Nov 2023 15:09:38 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 30 Nov 2023 16:09:23 +0100
Message-ID: <20231130150923.17707-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] runner/resultgen: Fix subtest runtimes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Piotr Kira <piotr.kira@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Piotr Kira <piotr.kira@intel.com>

Runtimes for single subtest are not included in results json object
after switching to socket communication. Make times for both subtests
and dynamic subtests when using comms.

v2: added GitLab issue number, added Petri to Cc (Kamil)
  reformat so it could be applied (Kamil)

Cc: Petri Latvala <adrinael@adrinael.net>
Fixes: 9d889fa6b8f0 ("runner: Use socket communications")
Closes: https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/issues/132
Signed-off-by: Piotr Kira <piotr.kira@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/resultgen.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/runner/resultgen.c b/runner/resultgen.c
index b00bb6ba5..63f5b26d7 100644
--- a/runner/resultgen.c
+++ b/runner/resultgen.c
@@ -1262,6 +1262,9 @@ struct comms_context
 	char *subtestresult;
 	char *dynamicsubtestresult;
 
+	double subtest_execution_time;
+	double dynamic_subtest_execution_time;
+
 	char *cmdline;
 	int exitcode;
 
@@ -1321,6 +1324,7 @@ static void comms_finish_subtest(struct comms_context *context)
 	if (context->subtestresult == NULL)
 		context->subtestresult = strdup("incomplete");
 	set_result(context->current_test, context->subtestresult);
+	add_runtime(context->current_test, context->subtest_execution_time);
 
 	free(context->subtestresult);
 	context->subtestresult = NULL;
@@ -1343,6 +1347,7 @@ static void comms_finish_dynamic_subtest(struct comms_context *context)
 	if (context->dynamicsubtestresult == NULL)
 		context->dynamicsubtestresult = strdup("incomplete");
 	set_result(context->current_dynamic_subtest, context->dynamicsubtestresult);
+	add_runtime(context->current_dynamic_subtest, context->dynamic_subtest_execution_time);
 
 	free(context->dynamicsubtestresult);
 	context->dynamicsubtestresult = NULL;
@@ -1617,6 +1622,7 @@ static bool comms_handle_subtest_result(const struct runnerpacket *packet,
 				    strlen(helper.subtestresult.result),
 				    &mappedresult, NULL);
 		context->subtestresult = strdup(mappedresult);
+		context->subtest_execution_time = strtod(helper.subtestresult.timeused, NULL);
 	}
 
 	context->state = STATE_BETWEEN_SUBTESTS;
@@ -1757,6 +1763,7 @@ static bool comms_handle_dynamic_subtest_result(const struct runnerpacket *packe
 				    strlen(helper.dynamicsubtestresult.result),
 				    &mappedresult, NULL);
 		context->dynamicsubtestresult = strdup(mappedresult);
+		context->dynamic_subtest_execution_time = strtod(helper.dynamicsubtestresult.timeused, NULL);
 	}
 
 	context->state = STATE_BETWEEN_DYNAMIC_SUBTESTS;
-- 
2.42.0
