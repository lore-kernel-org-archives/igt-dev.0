Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322426F53E
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jan 2020 13:18:05 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 29 Jan 2020 15:17:53 +0200
Message-Id: <20200129131753.12460-2-petri.latvala@intel.com>
In-Reply-To: <20200129131753.12460-1-petri.latvala@intel.com>
References: <20200129131753.12460-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] runner_tests: Unit test dynamic subtest
 testlist support
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
Cc: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
---
 runner/runner_tests.c | 125 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index 6b0e6cc4..ed30b3f9 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -740,6 +740,66 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		char filename[] = "tmplistXXXXXX";
+		const char testlisttext[] = "igt@dynamic@dynamic-subtest@passing\n"
+			"igt@dynamic@dynamic-subtest@failing\n"
+			"igt@dynamic@different-subtest@passing\n";
+		int multiple;
+		struct job_list *list = malloc(sizeof(*list));
+
+		igt_fixture {
+			int fd;
+			igt_require((fd = mkstemp(filename)) >= 0);
+			igt_require(write(fd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
+			close(fd);
+			init_job_list(list);
+		}
+
+		for (multiple = 0; multiple < 2; multiple++) {
+			igt_subtest_f("job-list-testlist-dynamic-%s", multiple ? "multiple" : "normal") {
+				const char *argv[] = { "runner",
+						       "--test-list", filename,
+						       multiple ? "--multiple-mode" : "--sync",
+						       testdatadir,
+						       "path-to-results",
+				};
+
+				igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+				igt_assert(create_job_list(list, settings));
+
+				/*
+				 * Normally we would combine different
+				 * subtests of the same binary to the
+				 * same execution when using
+				 * multiple-mode. If dynamic subtests
+				 * are used, no execution combining
+				 * should occur.
+				 */
+
+				igt_assert_eq(list->size, 3);
+
+				igt_assert_eqstr(list->entries[0].binary, "dynamic");
+				igt_assert_eqstr(list->entries[1].binary, "dynamic");
+				igt_assert_eqstr(list->entries[2].binary, "dynamic");
+
+				igt_assert_eq(list->entries[0].subtest_count, 1);
+				igt_assert_eq(list->entries[1].subtest_count, 1);
+				igt_assert_eq(list->entries[2].subtest_count, 1);
+
+				igt_assert_eqstr(list->entries[0].subtests[0], "dynamic-subtest@passing");
+				igt_assert_eqstr(list->entries[1].subtests[0], "dynamic-subtest@failing");
+				igt_assert_eqstr(list->entries[2].subtests[0], "different-subtest@passing");
+			}
+		}
+
+		igt_fixture {
+			unlink(filename);
+			free_job_list(list);
+			free(list);
+		}
+	}
+
 	igt_subtest_group {
 		char dirname[] = "tmpdirXXXXXX";
 		volatile int dirfd = -1, fd = -1;
@@ -1351,6 +1411,71 @@ igt_main
 			free(list);
 	}
 
+	igt_subtest_group {
+		const char testlisttext[] = "igt@dynamic@dynamic-subtest@passing\n";
+		struct job_list *list = malloc(sizeof(*list));
+		volatile int dirfd = -1;
+		char dirname[] = "tmpdirXXXXXX";
+		volatile int fd;
+		char filename[] = "tmplistXXXXXX";
+
+		igt_fixture {
+			igt_require(mkdtemp(dirname) != NULL);
+			rmdir(dirname);
+
+			igt_require((fd = mkstemp(filename)) >= 0);
+			igt_require(write(fd, testlisttext, strlen(testlisttext)) == strlen(testlisttext));
+			close(fd);
+
+			init_job_list(list);
+		}
+
+		igt_subtest("dynamic-subtests-in-testlist") {
+			struct execute_state state;
+			struct json_object *results, *obj;
+			const char *argv[] = { "runner",
+					       "--test-list", filename,
+					       testdatadir,
+					       dirname,
+			};
+
+			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+
+			igt_assert(create_job_list(list, settings));
+			igt_assert_eq(list->size, 1);
+			igt_assert_eq(list->entries[0].subtest_count, 1);
+
+			igt_assert(initialize_execute_state(&state, settings, list));
+			igt_assert(execute(&state, settings, list));
+
+			igt_assert_f((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0,
+				     "Execute didn't create the results directory\n");
+			igt_assert_f((results = generate_results_json(dirfd)) != NULL,
+				     "Results parsing failed\n");
+
+			obj = results;
+			igt_assert(json_object_object_get_ex(obj, "tests", &obj));
+
+			/* Check that the dynamic subtest we didn't request is not reported */
+			igt_assert(!json_object_object_get_ex(obj, "igt@dynamic@dynamic-subtest@failing", NULL));
+
+			/* Check that the dynamic subtest we did request is */
+			igt_assert(json_object_object_get_ex(obj, "igt@dynamic@dynamic-subtest@passing", &obj));
+			igt_assert(json_object_object_get_ex(obj, "result", &obj));
+			igt_assert_eqstr(json_object_get_string(obj), "pass");
+
+			igt_assert_eq(json_object_put(results), 1);
+		}
+
+		igt_fixture {
+			unlink(filename);
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
2.20.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
