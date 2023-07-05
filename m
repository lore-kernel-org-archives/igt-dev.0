Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7698E10E3A9
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 15:29:09 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.26.237])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 1556A580DBB
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jul 2023 08:28:56 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qH4R3-001vyG-2W
 for igt-dev@lists.freedesktop.org; Wed, 05 Jul 2023 17:28:53 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Wed,  5 Jul 2023 17:28:47 +0200
Message-Id: <20230705152850.461010-3-mauro.chehab@linux.intel.com>
In-Reply-To: <20230705152850.461010-1-mauro.chehab@linux.intel.com>
References: <20230705152850.461010-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 2/5] lib/igt_core: add an option to show the
 testlist
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

From: Mauro Carvalho Chehab <mchehab@kernel.org>

There are several cases where we need to list the tests the same
way as igt_runner displays them.

That should not return errors on failures and should work also
when igt_simple_main() macro is used.

Ideally, it should also show dynamic subtests, but this is more
complex, specially for Kselftest/KUnit ones. So, for now, let's
not handle dynamic ones.

Add an option to produce such testlist.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 lib/igt_core.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/lib/igt_core.c b/lib/igt_core.c
index 9a0029d294a8..2ae2cb68835e 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -274,6 +274,7 @@ const char *igt_interactive_debug;
 bool igt_skip_crc_compare;
 
 /* subtests helpers */
+static bool show_testlist = false;
 static bool list_subtests = false;
 static bool describe_subtests = false;
 static char *run_single_subtest = NULL;
@@ -326,6 +327,7 @@ enum {
 	 * conflict with core ones
 	 */
 	OPT_LIST_SUBTESTS = 500,
+	OPT_SHOW_TESTLIST,
 	OPT_DESCRIBE_SUBTESTS,
 	OPT_RUN_SUBTEST,
 	OPT_RUN_DYNAMIC_SUBTEST,
@@ -896,6 +898,7 @@ static void print_usage(const char *help_str, bool output_on_stderr)
 
 	fprintf(f, "Usage: %s [OPTIONS]\n", command_str);
 	fprintf(f, "  --list-subtests\n"
+		   "  --show-testlist\n"
 		   "  --run-subtest <pattern>\n"
 		   "  --dynamic-subtest <pattern>\n"
 		   "  --debug[=log-domain]\n"
@@ -1076,6 +1079,7 @@ static int common_init(int *argc, char **argv,
 	int c, option_index = 0, i, x;
 	static struct option long_options[] = {
 		{"list-subtests",     no_argument,       NULL, OPT_LIST_SUBTESTS},
+		{"show-testlist",     no_argument,       NULL, OPT_SHOW_TESTLIST},
 		{"describe",          optional_argument, NULL, OPT_DESCRIBE_SUBTESTS},
 		{"run-subtest",       required_argument, NULL, OPT_RUN_SUBTEST},
 		{"dynamic-subtest",   required_argument, NULL, OPT_RUN_DYNAMIC_SUBTEST},
@@ -1189,6 +1193,9 @@ static int common_init(int *argc, char **argv,
 			if (!run_single_subtest)
 				list_subtests = true;
 			break;
+		case OPT_SHOW_TESTLIST:
+			show_testlist = true;
+			break;
 		case OPT_DESCRIBE_SUBTESTS:
 			if (optarg)
 				run_single_subtest = strdup(optarg);
@@ -1257,6 +1264,10 @@ out:
 			igt_warn("Unknown subtest: %s\n", run_single_subtest);
 			exit(IGT_EXIT_INVALID);
 		}
+		if (show_testlist) {
+			printf("igt@%s\n", igt_test_name());
+			exit(0);
+		}
 		if (list_subtests)
 			exit(IGT_EXIT_INVALID);
 	}
@@ -1449,6 +1460,9 @@ bool __igt_run_subtest(const char *subtest_name, const char *file, const int lin
 		__igt_print_description(subtest_name, file, line);
 		_clear_current_description();
 		return false;
+	} else if (show_testlist) {
+		printf("igt@%s@%s\n", igt_test_name(), subtest_name);
+		return false;
 	} else if (list_subtests) {
 		printf("%s\n", subtest_name);
 		return false;
@@ -1522,7 +1536,7 @@ const char *igt_subtest_name(void)
  */
 bool igt_only_list_subtests(void)
 {
-	return list_subtests;
+	return list_subtests || show_testlist;
 }
 
 
-- 
2.40.1
