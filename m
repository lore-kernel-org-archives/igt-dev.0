Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264E310E5B8
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 13:30:50 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-507a3b8b113so1171041e87.0
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Oct 2023 06:30:50 -0700 (PDT)
From: Petri Latvala <adrinael@adrinael.net>
To: igt-dev@lists.freedesktop.org
Date: Fri, 20 Oct 2023 16:30:40 +0300
Message-Id: <20231020133041.58257-2-adrinael@adrinael.net>
In-Reply-To: <20231020133041.58257-1-adrinael@adrinael.net>
References: <20231020133041.58257-1-adrinael@adrinael.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 2/3] runner/runner_tests: Unit tests for
 binary-name-only testlist entries
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

Signed-off-by: Petri Latvala <adrinael@adrinael.net>
---
 runner/runner_tests.c | 70 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index a7e968f85..e6024de11 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -1810,6 +1810,76 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		const char testlisttext[] = "igt@successtest";
+		const char blocktext[] = "igt@successtest@first";
+		struct job_list *list = malloc(sizeof(*list));
+		volatile int dirfd = -1;
+		char dirname[] = "tmpdirXXXXXX";
+		volatile int listfd;
+		volatile int blockfd;
+		char listfilename[] = "tmplistXXXXXX";
+		char blockfilename[] = "tmpblockXXXXXX";
+
+		igt_fixture {
+			igt_require(mkdtemp(dirname) != NULL);
+			rmdir(dirname);
+
+			igt_require((listfd = mkstemp(listfilename)) >= 0);
+			igt_require(write(listfd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
+			igt_require((blockfd = mkstemp(blockfilename)) >= 0);
+			igt_require(write(blockfd, blocktext, strlen(blocktext)) == strlen(blocktext));
+			close(listfd);
+			close(blockfd);
+
+			init_job_list(list);
+		}
+
+		igt_subtest("only-binary-name-in-testlist") {
+			const char *argv[] = { "runner",
+				"--allow-non-root",
+				"--test-list", listfilename,
+				testdatadir,
+				dirname,
+			};
+
+			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+
+			igt_assert(create_job_list(list, settings));
+			/* No multi-mode, binary has two subtests, should be normalized to have individual subtests */
+			igt_assert_eq(list->size, 2);
+			igt_assert_eq(list->entries[0].subtest_count, 1);
+			igt_assert_eq(list->entries[1].subtest_count, 1);
+		}
+
+		igt_subtest("only-binary-name-in-testlist-with-blocks") {
+			const char *argv[] = { "runner",
+				"--allow-non-root",
+				"--test-list", listfilename,
+				"-b", blockfilename,
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
+		igt_fixture {
+			unlink(listfilename);
+			unlink(blockfilename);
+			close(dirfd);
+			clear_directory(dirname);
+			free_job_list(list);
+			free(list);
+		}
+	}
+
 	igt_subtest_group {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1;
-- 
2.39.2
