Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E8F010E18B
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Oct 2022 10:24:52 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon, 31 Oct 2022 12:24:31 +0200
Message-Id: <20221031102434.2250160-4-petri.latvala@intel.com>
In-Reply-To: <20221031102434.2250160-1-petri.latvala@intel.com>
References: <20221031102434.2250160-1-petri.latvala@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 4/7] runner/runner_tests: Add tests for
 socket communications
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Test that initializing resumes from various states of execution gets
the correct resume-state up.

v2: Flesh out commit message (Kamil)

Signed-off-by: Petri Latvala <petri.latvala@intel.com>
Cc: Arkadiusz Hiler <arek@hiler.eu>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 runner/runner_tests.c | 186 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 186 insertions(+)

diff --git a/runner/runner_tests.c b/runner/runner_tests.c
index db0ce2ac..a7e968f8 100644
--- a/runner/runner_tests.c
+++ b/runner/runner_tests.c
@@ -7,6 +7,7 @@
 #include <json.h>
 
 #include "igt.h"
+#include "runnercomms.h"
 
 #include "settings.h"
 #include "job_list.h"
@@ -239,6 +240,16 @@ static void assert_execution_results_exist(int dirfd)
 	assert_execution_created(dirfd, "dmesg.txt");
 }
 
+static void write_packet_with_canary(int fd, struct runnerpacket *packet)
+{
+	uint32_t canary = socket_dump_canary();
+
+	write(fd, &canary, sizeof(canary));
+	write(fd, packet, packet->size);
+
+	free(packet);
+}
+
 igt_main
 {
 	struct settings *settings = malloc(sizeof(*settings));
@@ -1226,6 +1237,62 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		char dirname[] = "tmpdirXXXXXX";
+		struct job_list *list = malloc(sizeof(*list));
+		volatile int dirfd = -1, subdirfd = -1, fd = -1;
+
+		igt_fixture {
+			init_job_list(list);
+			igt_require(mkdtemp(dirname) != NULL);
+		}
+
+		igt_subtest("execute-initialize-subtest-started-comms") {
+			struct execute_state state;
+			const char *argv[] = { "runner",
+					       "--allow-non-root",
+					       "--multiple-mode",
+					       "-t", "successtest",
+					       testdatadir,
+					       dirname,
+			};
+			const char excludestring[] = "!first-subtest";
+
+			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+			igt_assert(create_job_list(list, settings));
+			igt_assert(list->size == 1);
+			igt_assert(list->entries[0].subtest_count == 0);
+
+			igt_assert(serialize_settings(settings));
+			igt_assert(serialize_job_list(list, settings));
+
+			igt_assert((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0);
+			igt_assert(mkdirat(dirfd, "0", 0770) == 0);
+			igt_assert((subdirfd = openat(dirfd, "0", O_DIRECTORY | O_RDONLY)) >= 0);
+			igt_assert((fd = openat(subdirfd, "comms", O_CREAT | O_WRONLY | O_EXCL, 0660)) >= 0);
+			write_packet_with_canary(fd, runnerpacket_subtest_start("first-subtest"));
+
+			free_job_list(list);
+			clear_settings(settings);
+			igt_assert(initialize_execute_state_from_resume(dirfd, &state, settings, list));
+
+			igt_assert_eq(state.next, 0);
+			igt_assert_eq(list->size, 1);
+			igt_assert_eq(list->entries[0].subtest_count, 2);
+			igt_assert_eqstr(list->entries[0].subtests[0], "*");
+			igt_assert_eqstr(list->entries[0].subtests[1], excludestring);
+		}
+
+		igt_fixture {
+			close(fd);
+			close(subdirfd);
+			close(dirfd);
+			clear_directory(dirname);
+			free_job_list(list);
+			free(list);
+		}
+	}
+
 	igt_subtest_group {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
@@ -1282,6 +1349,62 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		char dirname[] = "tmpdirXXXXXX";
+		struct job_list *list = malloc(sizeof(*list));
+		volatile int dirfd = -1, subdirfd = -1, fd = -1;
+
+		igt_fixture {
+			init_job_list(list);
+			igt_require(mkdtemp(dirname) != NULL);
+		}
+
+		igt_subtest("execute-initialize-all-subtests-started-comms") {
+			struct execute_state state;
+			const char *argv[] = { "runner",
+					       "--allow-non-root",
+					       "--multiple-mode",
+					       "-t", "successtest@first-subtest",
+					       "-t", "successtest@second-subtest",
+					       testdatadir,
+					       dirname,
+			};
+
+			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+			igt_assert(create_job_list(list, settings));
+			igt_assert(list->size == 1);
+			igt_assert(list->entries[0].subtest_count == 2);
+
+			igt_assert(serialize_settings(settings));
+			igt_assert(serialize_job_list(list, settings));
+
+			igt_assert((dirfd = open(dirname, O_DIRECTORY | O_RDONLY)) >= 0);
+			igt_assert(mkdirat(dirfd, "0", 0770) == 0);
+			igt_assert((subdirfd = openat(dirfd, "0", O_DIRECTORY | O_RDONLY)) >= 0);
+			igt_assert((fd = openat(subdirfd, "comms", O_CREAT | O_WRONLY | O_EXCL, 0660)) >= 0);
+			write_packet_with_canary(fd, runnerpacket_subtest_start("first-subtest"));
+			write_packet_with_canary(fd, runnerpacket_subtest_start("second-subtest"));
+
+			free_job_list(list);
+			clear_settings(settings);
+			igt_assert(initialize_execute_state_from_resume(dirfd, &state, settings, list));
+
+			/* All subtests are in journal, the entry should be considered completed */
+			igt_assert_eq(state.next, 1);
+			igt_assert_eq(list->size, 1);
+			igt_assert_eq(list->entries[0].subtest_count, 4);
+		}
+
+		igt_fixture {
+			close(fd);
+			close(subdirfd);
+			close(dirfd);
+			clear_directory(dirname);
+			free_job_list(list);
+			free(list);
+		}
+	}
+
 	igt_subtest_group {
 		char dirname[] = "tmpdirXXXXXX";
 		struct job_list *list = malloc(sizeof(*list));
@@ -1341,6 +1464,66 @@ igt_main
 		}
 	}
 
+	igt_subtest_group {
+		char dirname[] = "tmpdirXXXXXX";
+		struct job_list *list = malloc(sizeof(*list));
+		volatile int dirfd = -1, subdirfd = -1, fd = -1;
+
+		igt_fixture {
+			init_job_list(list);
+			igt_require(mkdtemp(dirname) != NULL);
+		}
+
+		igt_subtest("execute-initialize-subtests-complete-comms") {
+			struct execute_state state;
+			const char *argv[] = { "runner",
+					       "--allow-non-root",
+					       "--multiple-mode",
+					       testdatadir,
+					       dirname,
+			};
+
+			igt_assert(parse_options(ARRAY_SIZE(argv), (char**)argv, settings));
+			igt_assert(create_job_list(list, settings));
+			igt_assert(list->size == NUM_TESTDATA_BINARIES);
+
+			if (!strcmp(list->entries[0].binary, "no-subtests")) {
+				struct job_list_entry tmp = list->entries[0];
+				list->entries[0] = list->entries[1];
+				list->entries[1] = tmp;
+			}
+
+			igt_assert(list->entries[0].subtest_count == 0);
+
+			igt_assert(serialize_settings(settings));
+			igt_assert(serialize_job_list(list, settings));
+
+			igt_assert_lte(0, dirfd = open(dirname, O_DIRECTORY | O_RDONLY));
+			igt_assert_eq(mkdirat(dirfd, "0", 0770), 0);
+			igt_assert((subdirfd = openat(dirfd, "0", O_DIRECTORY | O_RDONLY)) >= 0);
+			igt_assert((fd = openat(subdirfd, "comms", O_CREAT | O_WRONLY | O_EXCL, 0660)) >= 0);
+			write_packet_with_canary(fd, runnerpacket_subtest_start("first-subtest"));
+			write_packet_with_canary(fd, runnerpacket_subtest_start("second-subtest"));
+			write_packet_with_canary(fd, runnerpacket_exit(0, "0.000s"));
+
+			free_job_list(list);
+			clear_settings(settings);
+			igt_assert(initialize_execute_state_from_resume(dirfd, &state, settings, list));
+
+			igt_assert_eq(state.next, 1);
+			igt_assert_eq(list->size, NUM_TESTDATA_BINARIES);
+		}
+
+		igt_fixture {
+			close(fd);
+			close(subdirfd);
+			close(dirfd);
+			clear_directory(dirname);
+			free_job_list(list);
+			free(list);
+		}
+	}
+
 	igt_subtest_group {
 		struct job_list *list = malloc(sizeof(*list));
 		volatile int dirfd = -1, subdirfd = -1, fd = -1;
@@ -1490,6 +1673,8 @@ igt_main
 			char dirname[] = "tmpdirXXXXXX";
 
 			igt_fixture {
+				/* This test checks that the stdout parsing for result without time data works, so use that */
+				setenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION", "1", 1);
 				igt_require(mkdtemp(dirname) != NULL);
 				rmdir(dirname);
 			}
@@ -1554,6 +1739,7 @@ igt_main
 				close(dirfd);
 				clear_directory(dirname);
 				free_job_list(list);
+				unsetenv("IGT_RUNNER_DISABLE_SOCKET_COMMUNICATION");
 			}
 		}
 
-- 
2.30.2
