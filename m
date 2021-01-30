Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48AE6E071
 for <igt-dev@lists.freedesktop.org>; Sat, 30 Jan 2021 12:42:48 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat, 30 Jan 2021 12:42:40 +0000
Message-Id: <20210130124240.3336947-1-chris@chris-wilson.co.uk>
In-Reply-To: <20210130064421.30389-1-ashutosh.dixit@intel.com>
References: <20210130064421.30389-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] meson: Turn on -Werror
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
List-ID: <igt-dev@lists.freedesktop.org>

From: Ashutosh Dixit <ashutosh.dixit@intel.com>

We can choose which compile warnings to enable, but once they are enabled
treat all warnings as error. This enforces stricter checks against compile
warnings creeping in.

v2: Fix redefinition warning errors from i915/gem_userptr_blits
v3: Fix the even more pedantic clang compilation
v4: Do not alter whitespace in lib/tests/igt_describe!

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 benchmarks/kms_vblank.c              |  8 +++----
 lib/igt_aux.c                        |  8 +++----
 lib/igt_core.c                       |  7 +++---
 lib/igt_core.h                       | 33 ++++++++++++++--------------
 lib/igt_gt.c                         |  3 +--
 lib/igt_primes.c                     | 10 ---------
 lib/igt_sysrq.h                      |  2 +-
 lib/tests/igt_abort.c                | 12 +++++-----
 lib/tests/igt_assert.c               |  2 +-
 lib/tests/igt_conflicting_args.c     |  2 +-
 lib/tests/igt_describe.c             |  2 +-
 lib/tests/igt_dynamic_subtests.c     | 14 ++++++------
 lib/tests/igt_fork.c                 | 12 +++++-----
 lib/tests/igt_invalid_subtest_name.c |  4 ++--
 lib/tests/igt_nesting.c              | 28 +++++++++++------------
 lib/tests/igt_segfault.c             |  2 +-
 lib/tests/igt_simulation.c           |  2 +-
 lib/tests/igt_thread.c               | 14 +++++++-----
 meson.build                          | 28 ++++++++++++-----------
 tests/dumb_buffer.c                  |  2 +-
 tests/i915/gem_gtt_speed.c           |  2 +-
 tests/i915/gem_madvise.c             |  2 +-
 tests/i915/gem_userptr_blits.c       |  5 ++---
 tests/i915/i915_pm_rpm.c             |  2 +-
 tests/i915/perf_pmu.c                |  2 +-
 tests/kms_atomic.c                   | 10 +++++----
 tests/kms_vblank.c                   | 18 +++++++--------
 tests/prime_nv_pcopy.c               |  2 +-
 tests/prime_nv_test.c                |  2 +-
 tests/testdisplay.c                  |  2 +-
 tests/vc4_purgeable_bo.c             |  2 +-
 tools/skl_ddb_allocation.c           |  9 --------
 32 files changed, 120 insertions(+), 133 deletions(-)

diff --git a/benchmarks/kms_vblank.c b/benchmarks/kms_vblank.c
index 838afa0dd..f32cc9e32 100644
--- a/benchmarks/kms_vblank.c
+++ b/benchmarks/kms_vblank.c
@@ -55,7 +55,7 @@ static int crtc0_active(int fd)
 	union drm_wait_vblank vbl;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE;
+	vbl.request.type = _DRM_VBLANK_RELATIVE;
 	return drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl) == 0;
 }
 
@@ -74,14 +74,14 @@ static void vblank_query(int fd, int busy)
 		drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl);
 	}
 
-	vbl.request.type = DRM_VBLANK_RELATIVE;
+	vbl.request.type = _DRM_VBLANK_RELATIVE;
 	vbl.request.sequence = 0;
 	drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl);
 	seq = vbl.reply.sequence;
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
-		vbl.request.type = DRM_VBLANK_RELATIVE;
+		vbl.request.type = _DRM_VBLANK_RELATIVE;
 		vbl.request.sequence = 0;
 		drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl);
 		count++;
@@ -108,7 +108,7 @@ static void vblank_event(int fd, int busy)
 		drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl);
 	}
 
-	vbl.request.type = DRM_VBLANK_RELATIVE;
+	vbl.request.type = _DRM_VBLANK_RELATIVE;
 	vbl.request.sequence = 0;
 	drmIoctl(fd, DRM_IOCTL_WAIT_VBLANK, &vbl);
 	seq = vbl.reply.sequence;
diff --git a/lib/igt_aux.c b/lib/igt_aux.c
index fba349334..1217f5e88 100644
--- a/lib/igt_aux.c
+++ b/lib/igt_aux.c
@@ -276,7 +276,7 @@ bool __igt_sigiter_continue(struct __igt_sigiter *iter, bool enable)
 
 static struct igt_helper_process signal_helper;
 long long int sig_stat;
-static void __attribute__((noreturn)) signal_helper_process(pid_t pid)
+__noreturn static void signal_helper_process(pid_t pid)
 {
 	/* Interrupt the parent process at 500Hz, just to be annoying */
 	while (1) {
@@ -391,7 +391,7 @@ void igt_resume_signal_helper(void)
 }
 
 static struct igt_helper_process shrink_helper;
-static void __attribute__((noreturn)) shrink_helper_process(int fd, pid_t pid)
+__noreturn static void shrink_helper_process(int fd, pid_t pid)
 {
 	while (1) {
 		igt_drop_caches_set(fd, DROP_SHRINK_ALL);
@@ -449,7 +449,7 @@ static void show_kernel_stack(pid_t pid)
 }
 
 static struct igt_helper_process hang_detector;
-static void __attribute__((noreturn))
+__noreturn static void
 hang_detector_process(int fd, pid_t pid, dev_t rdev)
 {
 	struct udev_monitor *mon =
@@ -496,7 +496,7 @@ hang_detector_process(int fd, pid_t pid, dev_t rdev)
 	exit(0);
 }
 
-static void sig_abort(int sig)
+__noreturn static void sig_abort(int sig)
 {
 	errno = 0; /* inside a signal, last errno reporting is confusing */
 	igt_assert(!"GPU hung");
diff --git a/lib/igt_core.c b/lib/igt_core.c
index 739e3efab..f9dfaa0dd 100644
--- a/lib/igt_core.c
+++ b/lib/igt_core.c
@@ -1376,8 +1376,7 @@ bool __igt_enter_dynamic_container(void)
 	return true;
 }
 
-static void exit_subtest(const char *) __attribute__((noreturn));
-static void exit_subtest(const char *result)
+__noreturn static void exit_subtest(const char *result)
 {
 	struct timespec now;
 	const char *subtest_text = in_dynamic_subtest ? "Dynamic subtest" : "Subtest";
@@ -1610,7 +1609,7 @@ void igt_fail(int exitcode)
  * Since out test runner (piglit) does support fatal test exit codes, we
  * implement the default behaviour by waiting endlessly.
  */
-void  __attribute__((noreturn)) igt_fatal_error(void)
+void igt_fatal_error(void)
 {
 	if (igt_check_boolean_env_var("IGT_REBOOT_ON_FATAL_ERROR", false)) {
 		igt_warn("FATAL ERROR - REBOOTING\n");
@@ -2825,7 +2824,7 @@ out:
 }
 
 static const char *timeout_op;
-static void __attribute__((noreturn)) igt_alarm_handler(int signal)
+__noreturn static void igt_alarm_handler(int signal)
 {
 	if (timeout_op)
 		igt_info("Timed out: %s\n", timeout_op);
diff --git a/lib/igt_core.h b/lib/igt_core.h
index 206673875..6075d1539 100644
--- a/lib/igt_core.h
+++ b/lib/igt_core.h
@@ -79,6 +79,9 @@
 #define igt_assume(e) BUILD_BUG_ON_INVALID(e)
 #endif
 
+#define __noreturn __attribute__((noreturn))
+#define __maybe_unused __attribute__((unused))
+
 extern const char* __igt_test_description __attribute__((weak));
 extern bool __igt_plain_output;
 extern char *igt_frame_dump_path;
@@ -133,7 +136,7 @@ struct _GKeyFile *igt_load_igtrc(void);
 
 bool __igt_fixture(void);
 void __igt_fixture_complete(void);
-void __igt_fixture_end(void) __attribute__((noreturn));
+__noreturn void __igt_fixture_end(void);
 /**
  * igt_fixture:
  *
@@ -489,31 +492,29 @@ void igt_simple_init_parse_opts(int *argc, char **argv,
 	__attribute__((constructor)) \
 	static void igt_tokencat(__igt_constructor_l, __LINE__)(void)
 
-__attribute__((format(printf, 1, 2)))
-void igt_skip(const char *f, ...) __attribute__((noreturn));
-__attribute__((format(printf, 5, 6)))
+__noreturn __attribute__((format(printf, 1, 2)))
+void igt_skip(const char *f, ...);
+__noreturn __attribute__((format(printf, 5, 6)))
 void __igt_skip_check(const char *file, const int line,
 		      const char *func, const char *check,
-		      const char *format, ...) __attribute__((noreturn));
+		      const char *format, ...);
 #define igt_skip_check(E, F...) \
 	__igt_skip_check(__FILE__, __LINE__, __func__, E, F)
 void igt_success(void);
 
 bool igt_can_fail(void);
 
-void igt_fail(int exitcode) __attribute__((noreturn));
-__attribute__((format(printf, 6, 7)))
+__noreturn void igt_fail(int exitcode);
+__noreturn __attribute__((format(printf, 6, 7)))
 void __igt_fail_assert(const char *domain, const char *file,
 		       const int line, const char *func, const char *assertion,
-		       const char *format, ...)
-	__attribute__((noreturn));
-__attribute__((format(printf, 6, 7)))
-void __igt_abort(const char *domain, const char *file, const int line,
-		 const char *func, const char *expression,
-		 const char *f, ...)
-	__attribute__((noreturn));
-void igt_exit(void) __attribute__((noreturn));
-void igt_fatal_error(void) __attribute__((noreturn));
+		       const char *format, ...);
+__noreturn __attribute__((format(printf, 6, 7)))
+void __igt_abort(const char *domain, const char *file,
+		 const int line, const char *func, const char *expression,
+		 const char *f, ...);
+__noreturn void igt_exit(void);
+__noreturn void igt_fatal_error(void);
 
 /**
  * igt_ignore_warn:
diff --git a/lib/igt_gt.c b/lib/igt_gt.c
index 7dfcac038..f601d7260 100644
--- a/lib/igt_gt.c
+++ b/lib/igt_gt.c
@@ -380,8 +380,7 @@ void igt_force_gpu_reset(int drm_fd)
 
 /* GPU abusers */
 static struct igt_helper_process hang_helper;
-static void __attribute__((noreturn))
-hang_helper_process(pid_t pid, int fd)
+__noreturn static void hang_helper_process(pid_t pid, int fd)
 {
 	while (1) {
 		if (kill(pid, 0)) /* Parent has died, so must we. */
diff --git a/lib/igt_primes.c b/lib/igt_primes.c
index 3578a3c69..3941bb21a 100644
--- a/lib/igt_primes.c
+++ b/lib/igt_primes.c
@@ -64,21 +64,11 @@ static inline unsigned long __bit__(unsigned long nr)
 	return 1UL << (nr % BITS_PER_LONG);
 }
 
-static inline void set_bit(unsigned long nr, unsigned long *addr)
-{
-	addr[nr / BITS_PER_LONG] |= __bit__(nr);
-}
-
 static inline void clear_bit(unsigned long nr, unsigned long *addr)
 {
 	addr[nr / BITS_PER_LONG] &= ~__bit__(nr);
 }
 
-static inline bool test_bit(unsigned long nr, const unsigned long *addr)
-{
-	return addr[nr / BITS_PER_LONG] & __bit__(nr);
-}
-
 static unsigned long
 __find_next_bit(const unsigned long *addr,
 		unsigned long nbits, unsigned long start,
diff --git a/lib/igt_sysrq.h b/lib/igt_sysrq.h
index 422473d2a..c941029d5 100644
--- a/lib/igt_sysrq.h
+++ b/lib/igt_sysrq.h
@@ -25,6 +25,6 @@
 #ifndef __IGT_SYSRQ_H__
 #define __IGT_SYSRQ_H__
 
-void igt_sysrq_reboot(void) __attribute__((noreturn));
+__noreturn void igt_sysrq_reboot(void);
 
 #endif /* __IGT_SYSRQ_H__ */
diff --git a/lib/tests/igt_abort.c b/lib/tests/igt_abort.c
index 53b7d4fd5..356e41679 100644
--- a/lib/tests/igt_abort.c
+++ b/lib/tests/igt_abort.c
@@ -31,7 +31,7 @@ char test[] = "test";
 char *fake_argv[] = { test };
 int fake_argc = ARRAY_SIZE(fake_argv);
 
-static void fake_simple_test(void)
+__noreturn static void fake_simple_test(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -40,7 +40,7 @@ static void fake_simple_test(void)
 	exit(0); /* unreachable */
 }
 
-static void fake_fixture_test(void)
+__noreturn static void fake_fixture_test(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -51,7 +51,7 @@ static void fake_fixture_test(void)
 	exit(0); /* unreachable */
 }
 
-static void fake_outside_fixture_test(void)
+__noreturn static void fake_outside_fixture_test(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -60,7 +60,7 @@ static void fake_outside_fixture_test(void)
 	exit(0); /* unreachable */
 }
 
-static void fake_subtest_test(void)
+__noreturn static void fake_subtest_test(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -76,7 +76,7 @@ static void fake_subtest_test(void)
 	exit(0); /* unreachable */
 }
 
-static void fake_dynamic_test(void)
+__noreturn static void fake_dynamic_test(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -97,7 +97,7 @@ static void fake_dynamic_test(void)
 	exit(0); /* unreachable */
 }
 
-static void fake_outside_dynamic_test(void)
+__noreturn static void fake_outside_dynamic_test(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
diff --git a/lib/tests/igt_assert.c b/lib/tests/igt_assert.c
index c94ac6989..3523a4649 100644
--- a/lib/tests/igt_assert.c
+++ b/lib/tests/igt_assert.c
@@ -53,7 +53,7 @@ void (*test_to_run)(void) = NULL;
 	exec_total++; \
 }
 
-static void fake_test(void)
+__noreturn static void fake_test(void)
 {
 	char test[] = "test";
 	char *argv_run[] = { test };
diff --git a/lib/tests/igt_conflicting_args.c b/lib/tests/igt_conflicting_args.c
index b644fd4bc..b5fe2d781 100644
--- a/lib/tests/igt_conflicting_args.c
+++ b/lib/tests/igt_conflicting_args.c
@@ -43,7 +43,7 @@ static int opt_handler(int option, int option_index, void *input)
 	return 0;
 }
 
-static void fake_test(void)
+__noreturn static void fake_test(void)
 {
 	char test_name[] = "test";
 	char *argv[] = { test_name };
diff --git a/lib/tests/igt_describe.c b/lib/tests/igt_describe.c
index ff45a6c4b..d71e051e7 100644
--- a/lib/tests/igt_describe.c
+++ b/lib/tests/igt_describe.c
@@ -34,7 +34,7 @@ char *fake_argv[] = {prog, fake_arg};
 int fake_argc = ARRAY_SIZE(fake_argv);
 
 IGT_TEST_DESCRIPTION("the top level description");
-static void fake_main(void)
+__noreturn static void fake_main(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
diff --git a/lib/tests/igt_dynamic_subtests.c b/lib/tests/igt_dynamic_subtests.c
index bd1e16758..b18cfae6c 100644
--- a/lib/tests/igt_dynamic_subtests.c
+++ b/lib/tests/igt_dynamic_subtests.c
@@ -29,7 +29,7 @@
 
 #include "igt_tests_common.h"
 
-static void dynamic_subtest_in_normal_subtest(void)
+__noreturn static void dynamic_subtest_in_normal_subtest(void)
 {
 	char prog[] = "igt_no_exit";
 	char *fake_argv[] = {prog};
@@ -46,7 +46,7 @@ static void dynamic_subtest_in_normal_subtest(void)
 	igt_exit();
 }
 
-static void invalid_dynamic_subtest_name(void)
+__noreturn static void invalid_dynamic_subtest_name(void)
 {
 	char prog[] = "igt_no_exit";
 	char *fake_argv[] = {prog};
@@ -63,7 +63,7 @@ static void invalid_dynamic_subtest_name(void)
 	igt_exit();
 }
 
-static void dynamic_subtest_in_toplevel(void)
+__noreturn static void dynamic_subtest_in_toplevel(void)
 {
 	char prog[] = "igt_no_exit";
 	char *fake_argv[] = {prog};
@@ -78,7 +78,7 @@ static void dynamic_subtest_in_toplevel(void)
 	igt_exit();
 }
 
-static void subtest_itself_failing(void)
+__noreturn static void subtest_itself_failing(void)
 {
 	char prog[] = "igt_no_exit";
 	char *fake_argv[] = {prog};
@@ -93,7 +93,7 @@ static void subtest_itself_failing(void)
 	igt_exit();
 }
 
-static void subtest_itself_skipping(void)
+__noreturn static void subtest_itself_skipping(void)
 {
 	char prog[] = "igt_no_exit";
 	char *fake_argv[] = {prog};
@@ -108,7 +108,7 @@ static void subtest_itself_skipping(void)
 	igt_exit();
 }
 
-static void dynamic_subtest_failure_leads_to_fail(void)
+__noreturn static void dynamic_subtest_failure_leads_to_fail(void)
 {
 	char prog[] = "igt_no_exit";
 	char *fake_argv[] = {prog};
@@ -125,7 +125,7 @@ static void dynamic_subtest_failure_leads_to_fail(void)
 	igt_exit();
 }
 
-static void no_dynamic_subtests_entered_leads_to_skip(void)
+__noreturn static void no_dynamic_subtests_entered_leads_to_skip(void)
 {
 	char prog[] = "igt_no_exit";
 	char *fake_argv[] = {prog};
diff --git a/lib/tests/igt_fork.c b/lib/tests/igt_fork.c
index 84492b2d1..d19d09452 100644
--- a/lib/tests/igt_fork.c
+++ b/lib/tests/igt_fork.c
@@ -38,7 +38,7 @@ char test[] = "test";
 char *fake_argv[] = { test };
 int fake_argc = ARRAY_SIZE(fake_argv);
 
-static void igt_fork_vs_skip(void)
+__noreturn static void igt_fork_vs_skip(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -51,7 +51,7 @@ static void igt_fork_vs_skip(void)
 	igt_exit();
 }
 
-static void igt_fork_vs_assert(void)
+__noreturn static void igt_fork_vs_assert(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -64,7 +64,7 @@ static void igt_fork_vs_assert(void)
 	igt_exit();
 }
 
-static void igt_fork_leak(void)
+__noreturn static void igt_fork_leak(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -75,7 +75,7 @@ static void igt_fork_leak(void)
 	igt_exit();
 }
 
-static void plain_fork_leak(void)
+__noreturn static void plain_fork_leak(void)
 {
 	int pid;
 
@@ -93,7 +93,7 @@ static void plain_fork_leak(void)
 	igt_exit();
 }
 
-static void igt_fork_timeout_leak(void)
+__noreturn static void igt_fork_timeout_leak(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -106,7 +106,7 @@ static void igt_fork_timeout_leak(void)
 	igt_exit();
 }
 
-static void subtest_leak(void)
+__noreturn static void subtest_leak(void)
 {
 	pid_t *children =
 		mmap(0, 4096, PROT_WRITE, MAP_SHARED | MAP_ANON, -1, 0);
diff --git a/lib/tests/igt_invalid_subtest_name.c b/lib/tests/igt_invalid_subtest_name.c
index 32c4bcbc9..b790482c0 100644
--- a/lib/tests/igt_invalid_subtest_name.c
+++ b/lib/tests/igt_invalid_subtest_name.c
@@ -29,7 +29,7 @@
 
 #include "igt_tests_common.h"
 
-static void invalid_subtest_name(void)
+__noreturn static void invalid_subtest_name(void)
 {
 	char prog[] = "igt_no_exit";
 	char *fake_argv[] = {prog};
@@ -44,7 +44,7 @@ static void invalid_subtest_name(void)
 	igt_exit();
 }
 
-static void nonexisting_subtest(void)
+__noreturn static void nonexisting_subtest(void)
 {
 	char prog[] = "igt_no_exit";
 	char arg1[] = "--run-subtest";
diff --git a/lib/tests/igt_nesting.c b/lib/tests/igt_nesting.c
index de674b6b8..6b209af82 100644
--- a/lib/tests/igt_nesting.c
+++ b/lib/tests/igt_nesting.c
@@ -30,7 +30,7 @@ char test[] = "test";
 char *fake_argv[] = { test };
 int fake_argc = ARRAY_SIZE(fake_argv);
 
-static void all_valid_simple_test(void)
+__noreturn static void all_valid_simple_test(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -40,7 +40,7 @@ static void all_valid_simple_test(void)
 	igt_exit();
 }
 
-static void all_valid(void)
+__noreturn static void all_valid(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -87,7 +87,7 @@ static void all_valid(void)
 	igt_exit();
 }
 
-static void invalid_subtest_in_simple_test(void)
+__noreturn static void invalid_subtest_in_simple_test(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -97,7 +97,7 @@ static void invalid_subtest_in_simple_test(void)
 	igt_exit();
 }
 
-static void invalid_subtest_group_in_simple_test(void)
+__noreturn static void invalid_subtest_group_in_simple_test(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -107,7 +107,7 @@ static void invalid_subtest_group_in_simple_test(void)
 	igt_exit();
 }
 
-static void invalid_subtest_with_dynamic_in_simple_test(void)
+__noreturn static void invalid_subtest_with_dynamic_in_simple_test(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -117,7 +117,7 @@ static void invalid_subtest_with_dynamic_in_simple_test(void)
 	igt_exit();
 }
 
-static void invalid_dynamic_in_simple_test(void)
+__noreturn static void invalid_dynamic_in_simple_test(void)
 {
 	igt_simple_init(fake_argc, fake_argv);
 
@@ -127,7 +127,7 @@ static void invalid_dynamic_in_simple_test(void)
 	igt_exit();
 }
 
-static void invalid_fixture_in_fixture(void)
+__noreturn static void invalid_fixture_in_fixture(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -139,7 +139,7 @@ static void invalid_fixture_in_fixture(void)
 	igt_exit();
 }
 
-static void invalid_subtest_in_subtest(void)
+__noreturn static void invalid_subtest_in_subtest(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -151,7 +151,7 @@ static void invalid_subtest_in_subtest(void)
 	igt_exit();
 }
 
-static void invalid_top_level_dynamic(void)
+__noreturn static void invalid_top_level_dynamic(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -161,7 +161,7 @@ static void invalid_top_level_dynamic(void)
 	igt_exit();
 }
 
-static void invalid_dynamic_in_regular_subtest(void)
+__noreturn static void invalid_dynamic_in_regular_subtest(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -173,7 +173,7 @@ static void invalid_dynamic_in_regular_subtest(void)
 	igt_exit();
 }
 
-static void invalid_fixture_in_subtest(void)
+__noreturn static void invalid_fixture_in_subtest(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -185,7 +185,7 @@ static void invalid_fixture_in_subtest(void)
 	igt_exit();
 }
 
-static void invalid_top_level_skip(void)
+__noreturn static void invalid_top_level_skip(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -194,7 +194,7 @@ static void invalid_top_level_skip(void)
 	igt_exit();
 }
 
-static void invalid_top_level_assert(void)
+__noreturn static void invalid_top_level_assert(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
@@ -203,7 +203,7 @@ static void invalid_top_level_assert(void)
 	igt_exit();
 }
 
-static void invalid_dynamic_in_dynamic(void)
+__noreturn static void invalid_dynamic_in_dynamic(void)
 {
 	igt_subtest_init(fake_argc, fake_argv);
 
diff --git a/lib/tests/igt_segfault.c b/lib/tests/igt_segfault.c
index 38c040a6f..56efa9125 100644
--- a/lib/tests/igt_segfault.c
+++ b/lib/tests/igt_segfault.c
@@ -54,7 +54,7 @@ static void crashme(void)
 	raise(SIGSEGV);
 }
 
-static void fake_test(void)
+__noreturn static void fake_test(void)
 {
 	char prog[] = "test";
 	char *fake_argv[] = { prog };
diff --git a/lib/tests/igt_simulation.c b/lib/tests/igt_simulation.c
index a0ea70008..9a2cf2aae 100644
--- a/lib/tests/igt_simulation.c
+++ b/lib/tests/igt_simulation.c
@@ -40,7 +40,7 @@ bool list_subtests;
 bool in_fixture;
 bool in_subtest;
 
-static void fake_test(void)
+__noreturn static void fake_test(void)
 {
 	char test[] = "test";
 	char list[] = "--list-subtests";
diff --git a/lib/tests/igt_thread.c b/lib/tests/igt_thread.c
index e9d37584c..eb92326dc 100644
--- a/lib/tests/igt_thread.c
+++ b/lib/tests/igt_thread.c
@@ -49,7 +49,8 @@ static void *require_thread(void *data)
 	return NULL;
 }
 
-static void one_subtest_fail(void) {
+__noreturn static void one_subtest_fail(void)
+{
 	igt_subtest_init(fake_argc, fake_argv);
 
 	igt_subtest("subtest-a") {
@@ -67,7 +68,8 @@ static void one_subtest_fail(void) {
 	igt_exit();
 }
 
-static void one_dynamic_fail(void) {
+__noreturn static void one_dynamic_fail(void)
+{
 	igt_subtest_init(fake_argc, fake_argv);
 
 	igt_subtest_with_dynamic("dynamic-container") {
@@ -87,7 +89,7 @@ static void one_dynamic_fail(void) {
 	igt_exit();
 }
 
-static void simple_success(void) {
+__noreturn static void simple_success(void) {
 	pthread_t thread;
 
 	igt_simple_init(fake_argc, fake_argv);
@@ -98,7 +100,8 @@ static void simple_success(void) {
 	igt_exit();
 }
 
-static void simple_failure(void) {
+__noreturn static void simple_failure(void)
+{
 	pthread_t thread;
 
 	igt_simple_init(fake_argc, fake_argv);
@@ -109,7 +112,8 @@ static void simple_failure(void) {
 	igt_exit();
 }
 
-static void require_non_main_thread(void) {
+__noreturn static void require_non_main_thread(void)
+{
 	pthread_t thread;
 
 	igt_simple_init(fake_argc, fake_argv);
diff --git a/meson.build b/meson.build
index f4ee14f14..3f3693f99 100644
--- a/meson.build
+++ b/meson.build
@@ -51,19 +51,21 @@ cc_args = [
 	'-Wno-unused-parameter',
 	'-Wno-unused-result',
 
-	'-Werror=address',
-	'-Werror=array-bounds',
-	'-Werror=implicit',
-	'-Werror=init-self',
-	'-Werror=int-to-pointer-cast',
-	'-Werror=main',
-	'-Werror=missing-braces',
-	'-Werror=nonnull',
-	'-Werror=pointer-to-int-cast',
-	'-Werror=return-type',
-	'-Werror=sequence-point',
-	'-Werror=trigraphs',
-	'-Werror=write-strings',
+	'-Waddress',
+	'-Warray-bounds',
+	'-Wimplicit',
+	'-Winit-self',
+	'-Wint-to-pointer-cast',
+	'-Wmain',
+	'-Wmissing-braces',
+	'-Wnonnull',
+	'-Wpointer-to-int-cast',
+	'-Wreturn-type',
+	'-Wsequence-point',
+	'-Wtrigraphs',
+	'-Wwrite-strings',
+
+	'-Werror',
 # Disable the memory allocating builtins as they may cause unexpected behavior
 # with our framework. They *may* get optimized out in favor of a register or
 # stack variable, making them effectively local. Local variables do not play
diff --git a/tests/dumb_buffer.c b/tests/dumb_buffer.c
index 44f60b6f1..cb8d2f518 100644
--- a/tests/dumb_buffer.c
+++ b/tests/dumb_buffer.c
@@ -278,7 +278,7 @@ static void *thread_clear(void *data)
 
 static jmp_buf sigjmp;
 
-static void sigprobe(int sig)
+__noreturn static void sigprobe(int sig)
 {
 	longjmp(sigjmp, sig);
 }
diff --git a/tests/i915/gem_gtt_speed.c b/tests/i915/gem_gtt_speed.c
index 06fe70f84..644af3d38 100644
--- a/tests/i915/gem_gtt_speed.c
+++ b/tests/i915/gem_gtt_speed.c
@@ -82,7 +82,7 @@ static inline unsigned x86_64_features(void)
 {
 	return 0;
 }
-static void streaming_load(void *src, int len)
+__noreturn static void streaming_load(void *src, int len)
 {
 	igt_assert(!"reached");
 }
diff --git a/tests/i915/gem_madvise.c b/tests/i915/gem_madvise.c
index 623c8b091..2cd0b5d7c 100644
--- a/tests/i915/gem_madvise.c
+++ b/tests/i915/gem_madvise.c
@@ -51,7 +51,7 @@ IGT_TEST_DESCRIPTION("Checks that the kernel reports EFAULT when trying to use"
 
 static jmp_buf jmp;
 
-static void __attribute__((noreturn)) sigtrap(int sig)
+__noreturn static void sigtrap(int sig)
 {
 	siglongjmp(jmp, sig);
 }
diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
index 2f3954c5d..1bc2d3600 100644
--- a/tests/i915/gem_userptr_blits.c
+++ b/tests/i915/gem_userptr_blits.c
@@ -55,8 +55,6 @@
 #include <pthread.h>
 #include <time.h>
 
-#include <linux/memfd.h>
-
 #include "drm.h"
 #include "i915_drm.h"
 
@@ -1550,7 +1548,8 @@ static void test_readonly(int i915)
 }
 
 static jmp_buf sigjmp;
-static void sigjmp_handler(int sig)
+
+__noreturn static void sigjmp_handler(int sig)
 {
 	siglongjmp(sigjmp, sig);
 }
diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
index 6321dd403..d9ec0388c 100644
--- a/tests/i915/i915_pm_rpm.c
+++ b/tests/i915/i915_pm_rpm.c
@@ -1483,7 +1483,7 @@ static void pci_d3_state_subtest(void)
 	}
 }
 
-static void __attribute__((noreturn)) stay_subtest(void)
+__noreturn static void stay_subtest(void)
 {
 	disable_all_screens_and_wait(&ms_data);
 
diff --git a/tests/i915/perf_pmu.c b/tests/i915/perf_pmu.c
index 7b175ea8d..50b5c82bc 100644
--- a/tests/i915/perf_pmu.c
+++ b/tests/i915/perf_pmu.c
@@ -1092,7 +1092,7 @@ event_wait(int gem_fd, const struct intel_execution_engine2 *e)
 			for (;;) {
 				union drm_wait_vblank vbl = { };
 
-				vbl.request.type = DRM_VBLANK_RELATIVE;
+				vbl.request.type = _DRM_VBLANK_RELATIVE;
 				vbl.request.type |= pipe_id_flag;
 				vbl.request.sequence = 1;
 				igt_assert_eq(wait_vblank(gem_fd, &vbl), 0);
diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index fa6190c9b..2965b350b 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -448,11 +448,11 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 	for (int i = 0; i < n_planes - 1; i++) {
 		igt_plane_t *plane_lower, *plane_upper;
 
-		if (plane_ptr[i] != NULL)
-			plane_lower = plane_ptr[i];
-		else
+		if (plane_ptr[i] == NULL)
 			continue;
 
+		plane_lower = plane_ptr[i];
+		plane_upper = NULL;
 		while (i  < (n_planes - 1)) {
 			if (plane_ptr[i + 1] != NULL) {
 				plane_upper = plane_ptr[i + 1];
@@ -462,9 +462,11 @@ plane_immutable_zpos(igt_display_t *display, igt_pipe_t *pipe,
 				continue;
 			}
 		}
+		if (!plane_upper)
+			continue;
 
 		if ((plane_upper->type == DRM_PLANE_TYPE_CURSOR) ||
-			(plane_lower->type == DRM_PLANE_TYPE_CURSOR))
+		    (plane_lower->type == DRM_PLANE_TYPE_CURSOR))
 				continue;
 
 		igt_plane_set_position(plane_lower, 0, 0);
diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index b00ebec53..31b3f0a69 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -230,14 +230,14 @@ static void accuracy(data_t *data, int fd, int nchildren)
 	int n;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE;
+	vbl.request.type = _DRM_VBLANK_RELATIVE;
 	vbl.request.type |= pipe_id_flag;
 	vbl.request.sequence = 1;
 	igt_assert_eq(wait_vblank(fd, &vbl), 0);
 
 	target = vbl.reply.sequence + total;
 	for (n = 0; n < total; n++) {
-		vbl.request.type = DRM_VBLANK_RELATIVE;
+		vbl.request.type = _DRM_VBLANK_RELATIVE;
 		vbl.request.type |= pipe_id_flag;
 		vbl.request.sequence = 1;
 		igt_assert_eq(wait_vblank(fd, &vbl), 0);
@@ -247,7 +247,7 @@ static void accuracy(data_t *data, int fd, int nchildren)
 		vbl.request.sequence = target;
 		igt_assert_eq(wait_vblank(fd, &vbl), 0);
 	}
-	vbl.request.type = DRM_VBLANK_RELATIVE;
+	vbl.request.type = _DRM_VBLANK_RELATIVE;
 	vbl.request.type |= pipe_id_flag;
 	vbl.request.sequence = 0;
 	igt_assert_eq(wait_vblank(fd, &vbl), 0);
@@ -268,7 +268,7 @@ static void vblank_query(data_t *data, int fd, int nchildren)
 	unsigned long sq, count = 0;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE;
+	vbl.request.type = _DRM_VBLANK_RELATIVE;
 	vbl.request.type |= pipe_id_flag;
 	vbl.request.sequence = 0;
 	igt_assert_eq(wait_vblank(fd, &vbl), 0);
@@ -277,7 +277,7 @@ static void vblank_query(data_t *data, int fd, int nchildren)
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
-		vbl.request.type = DRM_VBLANK_RELATIVE;
+		vbl.request.type = _DRM_VBLANK_RELATIVE;
 		vbl.request.type |= pipe_id_flag;
 		vbl.request.sequence = 0;
 		igt_assert_eq(wait_vblank(fd, &vbl), 0);
@@ -297,7 +297,7 @@ static void vblank_wait(data_t *data, int fd, int nchildren)
 	unsigned long sq, count = 0;
 
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE;
+	vbl.request.type = _DRM_VBLANK_RELATIVE;
 	vbl.request.type |= pipe_id_flag;
 	vbl.request.sequence = 0;
 	igt_assert_eq(wait_vblank(fd, &vbl), 0);
@@ -306,7 +306,7 @@ static void vblank_wait(data_t *data, int fd, int nchildren)
 
 	clock_gettime(CLOCK_MONOTONIC, &start);
 	do {
-		vbl.request.type = DRM_VBLANK_RELATIVE;
+		vbl.request.type = _DRM_VBLANK_RELATIVE;
 		vbl.request.type |= pipe_id_flag;
 		vbl.request.sequence = 1;
 		igt_assert_eq(wait_vblank(fd, &vbl), 0);
@@ -367,7 +367,7 @@ static void vblank_ts_cont(data_t *data, int fd, int nchildren)
 	if (data->flags & (MODESET | DPMS)) {
 		/* Attempting to do a vblank while disabled should return -EINVAL */
 		memset(&vbl, 0, sizeof(vbl));
-		vbl.request.type = DRM_VBLANK_RELATIVE;
+		vbl.request.type = _DRM_VBLANK_RELATIVE;
 		vbl.request.type |= kmstest_get_vbl_flag(data->pipe);
 		igt_assert_eq(wait_vblank(fd, &vbl), -EINVAL);
 	}
@@ -476,7 +476,7 @@ static void invalid_subtest(data_t *data, int fd)
 
 	/* First check all is well with a simple query */
 	memset(&vbl, 0, sizeof(vbl));
-	vbl.request.type = DRM_VBLANK_RELATIVE;
+	vbl.request.type = _DRM_VBLANK_RELATIVE;
 	igt_assert_eq(wait_vblank(fd, &vbl), 0);
 
 	valid_flags = (_DRM_VBLANK_TYPES_MASK |
diff --git a/tests/prime_nv_pcopy.c b/tests/prime_nv_pcopy.c
index bbcf76807..e465e5fc0 100644
--- a/tests/prime_nv_pcopy.c
+++ b/tests/prime_nv_pcopy.c
@@ -139,7 +139,7 @@ BEGIN_NV04(struct nouveau_pushbuf *push, int subc, int mthd, int size)
 	PUSH_DATA (push, 0x00000000 | (size << 18) | (subc << 13) | mthd);
 }
 
-static inline void
+__maybe_unused static inline void
 BEGIN_NI04(struct nouveau_pushbuf *push, int subc, int mthd, int size)
 {
 	PUSH_DATA (push, 0x40000000 | (size << 18) | (subc << 13) | mthd);
diff --git a/tests/prime_nv_test.c b/tests/prime_nv_test.c
index b4714dcb5..81d142f42 100644
--- a/tests/prime_nv_test.c
+++ b/tests/prime_nv_test.c
@@ -190,7 +190,7 @@ static void test_nv_write_i915_gtt_mmap_read(void)
 /* test drm_intel_bo_map doesn't work properly,
    this tries to map the backing shmem fd, which doesn't exist
    for these objects */
-static void test_i915_import_cpu_mmap(void)
+__noreturn static void test_i915_import_cpu_mmap(void)
 {
 	drm_intel_bo *test_intel_bo;
 	int prime_fd;
diff --git a/tests/testdisplay.c b/tests/testdisplay.c
index ef033dc60..e2560eaf5 100644
--- a/tests/testdisplay.c
+++ b/tests/testdisplay.c
@@ -542,7 +542,7 @@ int update_display(bool probe)
 
 #define dump_resource(res) if (res) dump_##res()
 
-static void __attribute__((noreturn)) cleanup_and_exit(int ret)
+__noreturn static void cleanup_and_exit(int ret)
 {
 	close(drm_fd);
 	exit(ret);
diff --git a/tests/vc4_purgeable_bo.c b/tests/vc4_purgeable_bo.c
index ee89e153f..d9f7547f5 100644
--- a/tests/vc4_purgeable_bo.c
+++ b/tests/vc4_purgeable_bo.c
@@ -44,7 +44,7 @@ struct igt_vc4_bo {
 
 static jmp_buf jmp;
 
-static void __attribute__((noreturn)) sigtrap(int sig)
+__noreturn static void sigtrap(int sig)
 {
 	longjmp(jmp, sig);
 }
diff --git a/tools/skl_ddb_allocation.c b/tools/skl_ddb_allocation.c
index c7bfb2791..ff4c0aaff 100644
--- a/tools/skl_ddb_allocation.c
+++ b/tools/skl_ddb_allocation.c
@@ -140,15 +140,6 @@ static inline uint16_t skl_ddb_entry_size(const struct skl_ddb_entry *entry)
 	return entry->end - entry->start;
 }
 
-static inline bool skl_ddb_entry_equal(const struct skl_ddb_entry *e1,
-				       const struct skl_ddb_entry *e2)
-{
-	if (e1->start == e2->start && e1->end == e2->end)
-		return true;
-
-	return false;
-}
-
 struct skl_ddb_allocation {
 	struct skl_ddb_entry plane[I915_MAX_PIPES][I915_MAX_PLANES];
 	struct skl_ddb_entry cursor[I915_MAX_PIPES];
-- 
2.30.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
