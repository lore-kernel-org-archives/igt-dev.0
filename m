Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E58D10E266
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 09:52:11 +0000 (UTC)
Received: from linux.intel.com (maurocar-mobl2.ger.corp.intel.com
 [10.252.2.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by linux.intel.com (Postfix) with ESMTPS id 2BCA2580EA0
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 02:52:10 -0700 (PDT)
Received: from maurocar by linux.intel.com with local (Exim 4.96.1)
 (envelope-from <mauro.chehab@linux.intel.com>) id 1qxOwK-000S8G-0L
 for igt-dev@lists.freedesktop.org; Mon, 30 Oct 2023 10:52:08 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 30 Oct 2023 10:50:02 +0100
Message-ID: <20231030095206.108025-8-mauro.chehab@linux.intel.com>
In-Reply-To: <20231030095206.108025-1-mauro.chehab@linux.intel.com>
References: <20231030095206.108025-1-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 7/7] runner/runner_tests: add a test to
 check case-insensitive match
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

As regular expressions are now case-insensitive, add ab
unit test to verify that case-insensitive logic is working
as expected.

CC: Petri Latvala <adrinael@adrinael.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 runner/runner_tests.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 11ff05bc0e7e..0aa7dd6626b7 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -1813,13 +1813,16 @@ igt_main
 	igt_subtest_group {
 		const char testlisttext[] = "igt@successtest";
 		const char blocktext[] = "igt@successtest@first";
+		const char blocktext_upper[] = "igt@successTEST@first";
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
 		char dirname[] = "tmpdirXXXXXX";
 		volatile int listfd;
 		volatile int blockfd;
+		volatile int blockfd_upper;
 		char listfilename[] = "tmplistXXXXXX";
 		char blockfilename[] = "tmpblockXXXXXX";
+		char blockfilename_upper[] = "tmpBLOCKXXXXXX";
 
 		igt_fixture {
 			igt_require(mkdtemp(dirname) != NULL);
@@ -1829,8 +1832,11 @@ igt_main
 			igt_require(write(listfd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
 			igt_require((blockfd = mkstemp(blockfilename)) >= 0);
 			igt_require(write(blockfd, blocktext, strlen(blocktext)) == strlen(blocktext));
+			igt_require((blockfd_upper = mkstemp(blockfilename_upper)) >= 0);
+			igt_require(write(blockfd_upper, blocktext_upper, strlen(blocktext_upper)) == strlen(blocktext_upper));
 			close(listfd);
 			close(blockfd);
+			close(blockfd_upper);
 
 			init_job_list(list);
 		}
@@ -1870,9 +1876,28 @@ igt_main
 			igt_assert_eqstr(list->entries[0].subtests[0], "second-subtest");
 		}
 
+		igt_subtest("only-binary-name-in-testlist-with-case-insensitive-blocklist") {
+			const char *argv[] = { "runner",
+				"--allow-non-root",
+				"--test-list", listfilename,
+				"-b", blockfilename_upper,
+				testdatadir,
+				dirname,
+			};
+
+			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+
+			igt_assert(create_job_list(list, settings));
+			/* No multi-mode, binary has two subtests, one of them blocked */
+			igt_assert_eq(list->size, 1);
+			igt_assert_eq(list->entries[0].subtest_count, 1);
+			igt_assert_eqstr(list->entries[0].subtests[0], "second-subtest");
+		}
+
 		igt_fixture {
 			unlink(listfilename);
 			unlink(blockfilename);
+			unlink(blockfilename_upper);
 			close(dirfd);
 			clear_directory(dirname);
 			free_job_list(list);
-- 
2.41.0
