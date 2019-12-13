Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482966EDE4
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Dec 2019 22:05:45 +0000 (UTC)
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Date: Fri, 13 Dec 2019 13:54:29 -0800
Message-Id: <20191213215429.24498-8-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
References: <20191213215429.24498-1-niranjana.vishwanathapura@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t 7/7] tests/i915/svm: Add stress test
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
Cc: kenneth.w.graunke@intel.com, sanjay.k.kumar@intel.com, jason.ekstrand@intel.com, dave.hansen@intel.com, jglisse@redhat.com, jon.bloomfield@intel.com, daniel.vetter@intel.com, dan.j.williams@intel.com, ira.weiny@intel.com, jgg@mellanox.com
List-ID: <igt-dev@lists.freedesktop.org>

Run multiple processes in parallel each running a number of random
tests. Make number of processes and number of tests to run configurable.

Usage:
./i915_svm_basic --stress
./i915_svm_basic -s 0x00xxyyzz
where,
xx = delay b/w tests
yy = number of tests each process should run
zz = number of proccesses to run in parallel

Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Jon Bloomfield <jon.bloomfield@intel.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>
Cc: Sudeep Dutt <sudeep.dutt@intel.com>
Signed-off-by: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
---
 tests/i915/i915_svm_basic.c | 81 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 79 insertions(+), 2 deletions(-)

diff --git a/tests/i915/i915_svm_basic.c b/tests/i915/i915_svm_basic.c
index 568ee321..e8ff671d 100644
--- a/tests/i915/i915_svm_basic.c
+++ b/tests/i915/i915_svm_basic.c
@@ -600,7 +600,41 @@ static void run_sys(int fd, uint32_t size, bool migrate, bool copy,
 	igt_waitchildren();
 }
 
-igt_main
+static uint8_t stress_num_child = 2;
+static uint8_t stress_iters = 2;
+static uint8_t stress_delay = 2;
+static bool stress;
+
+static int opt_handler(int opt, int opt_index, void *data)
+{
+	uint32_t tmp;
+
+	switch (opt) {
+	case 's':
+		stress = true;
+		if (optarg) {
+			tmp = strtoul(optarg, NULL, 0);
+			stress_num_child = tmp & 0xff;
+			stress_iters = (tmp & 0x0000ff00) >> 8;
+			stress_delay = (tmp & 0x00ff0000) >> 16;
+		}
+		if (!stress_num_child || !stress_iters)
+			return IGT_OPT_HANDLER_ERROR;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+const char *help_str = "  --stress|-s\t\tRun the stress test.\n";
+static struct option long_options[] = {
+	{"stress", 0, 0, 's'},
+	{ NULL, 0, 0, 0 }
+};
+
+igt_main_args("s:", long_options, help_str, opt_handler, NULL)
 {
 	struct {
 		const char *name;
@@ -685,6 +719,49 @@ igt_main
 		def_size = DEFAULT_BUFF_SIZE;
 	}
 
+	if (stress) {
+		igt_subtest_f("stress") {
+			igt_fork(child, stress_num_child) {
+				uint32_t num_sys_tests, num_rt_tests;
+				uint32_t i, n, type, size;
+				bool migrate;
+
+				srand(__INT_MAX__);
+				num_sys_tests = ARRAY_SIZE(sys_tests);
+				num_rt_tests = ARRAY_SIZE(rt_tests);
+
+				for (i = 0; i < stress_iters; i++) {
+					svm_info("Running iter %d\n", i + 1);
+					type = rand() % 2;
+					if (type) {
+						n = rand() % num_sys_tests;
+						s = &sys_tests[n];
+						migrate = has_lmem ? s->migrate : false;
+						size = s->size ? : def_size;
+
+						svm_info("Running test %s\n", s->name);
+						run_sys(fd, size, migrate, s->copy,
+							s->alloc_type, s->unbind,
+							s->num_ctxts, 0);
+					} else {
+						n = rand() % num_rt_tests;
+						r = &rt_tests[n];
+						migrate = has_lmem ? r->migrate : false;
+						size = r->size ? : def_size;
+
+						svm_info("Running test %s\n", r->name);
+						run_rt(fd, size, migrate, r->copy, r->bind,
+						       r->unbind, r->num_ctxts, r->mmap, 0);
+					}
+					if (stress_delay)
+						sleep(stress_delay);
+				}
+			}
+			igt_waitchildren();
+		}
+		goto out;
+	}
+
 	/* Below are System (sys) allocator tests */
 	for (idx = 0, s = sys_tests; idx < ARRAY_SIZE(sys_tests); idx++, s++) {
 		bool migrate = has_lmem ? s->migrate : false;
@@ -722,7 +799,7 @@ igt_main
 			run_rt(fd, size, migrate, r->copy, r->bind, r->unbind,
 			       r->num_ctxts, r->mmap, NUM_PROCS);
 	}
-
+out:
 	igt_fixture {
 		close(fd);
 	}
-- 
2.21.0.rc0.32.g243a4c7e27

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
