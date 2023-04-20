Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D85410E086
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Apr 2023 18:24:48 +0000 (UTC)
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 20 Apr 2023 20:24:38 +0200
Message-Id: <20230420182440.49442-2-kamil.konieczny@linux.intel.com>
In-Reply-To: <20230420182440.49442-1-kamil.konieczny@linux.intel.com>
References: <20230420182440.49442-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 1/3] tests/i915_hangman: make sysfs var local
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

Global sysfs variable make it hard to use with multiGPU tests,
so make it local.

Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/i915/i915_hangman.c | 56 +++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
index 8acce8f1a..274a0ede1 100644
--- a/tests/i915/i915_hangman.c
+++ b/tests/i915/i915_hangman.c
@@ -46,7 +46,6 @@
 #endif
 
 static int device = -1;
-static int sysfs = -1;
 
 #define OFFSET_ALIVE	10
 
@@ -118,7 +117,7 @@ static bool has_error_state(int dir)
 	return result;
 }
 
-static void assert_entry(const char *s, bool expect)
+static void assert_entry(int sysfs, const char *s, bool expect)
 {
 	char *error;
 
@@ -132,40 +131,40 @@ static void assert_entry(const char *s, bool expect)
 	free(error);
 }
 
-static void assert_error_state_clear(void)
+static void assert_error_state_clear(int sysfs)
 {
-	assert_entry("no error state collected", true);
+	assert_entry(sysfs, "no error state collected", true);
 }
 
-static void assert_error_state_collected(void)
+static void assert_error_state_collected(int sysfs)
 {
-	assert_entry("no error state collected", false);
+	assert_entry(sysfs, "no error state collected", false);
 }
 
-static void clear_error_state(void)
+static void clear_error_state(int sysfs)
 {
 	igt_sysfs_write(sysfs, "error", "", 1);
 }
 
-static void test_error_state_basic(void)
+static void test_error_state_basic(int i915, int sysfs)
 {
 	int fd;
 
-	clear_error_state();
-	assert_error_state_clear();
+	clear_error_state(sysfs);
+	assert_error_state_clear(sysfs);
 
 	/* Manually trigger a hang by request a reset */
 	fd = igt_debugfs_open(device, "i915_wedged", O_WRONLY);
 	igt_ignore_warn(write(fd, "1\n", 2));
 	close(fd);
 
-	assert_error_state_collected();
+	assert_error_state_collected(sysfs);
 
-	clear_error_state();
-	assert_error_state_clear();
+	clear_error_state(sysfs);
+	assert_error_state_clear(sysfs);
 }
 
-static FILE *open_error(void)
+static FILE *open_error(int sysfs)
 {
 	int fd;
 
@@ -188,12 +187,12 @@ static bool uses_cmd_parser(void)
 	return parser_version > 0;
 }
 
-static void check_error_state(const char *expected_ring_name,
+static void check_error_state(int sysfs, const char *expected_ring_name,
 			      uint64_t expected_offset,
 			      const uint32_t *batch)
 {
 	bool cmd_parser = uses_cmd_parser();
-	FILE *file = open_error();
+	FILE *file = open_error(sysfs);
 	char *line = NULL;
 	size_t line_size = 0;
 	bool found = false;
@@ -254,12 +253,12 @@ static void check_error_state(const char *expected_ring_name,
 	free(line);
 	fclose(file);
 
-	clear_error_state();
+	clear_error_state(sysfs);
 
 	igt_assert(found);
 }
 
-static void test_error_state_capture(const intel_ctx_t *ctx,
+static void test_error_state_capture(int sysfs, const intel_ctx_t *ctx,
 				     const struct intel_execution_engine2 *e)
 {
 	uint32_t *batch;
@@ -267,7 +266,7 @@ static void test_error_state_capture(const intel_ctx_t *ctx,
 	uint64_t offset;
 	uint64_t ahnd = get_reloc_ahnd(device, ctx->id);
 
-	clear_error_state();
+	clear_error_state(sysfs);
 
 	hang = igt_hang_ctx_with_ahnd(device, ahnd, ctx->id, e->flags,
 				      HANG_ALLOW_CAPTURE);
@@ -278,7 +277,7 @@ static void test_error_state_capture(const intel_ctx_t *ctx,
 
 	igt_post_hang_ring(device, hang);
 
-	check_error_state(e->name, offset, batch);
+	check_error_state(sysfs, e->name, offset, batch);
 	munmap(batch, 4096);
 	put_ahnd(ahnd);
 
@@ -457,7 +456,7 @@ static void hangcheck_unterminated(const intel_ctx_t *ctx)
 	check_alive();
 }
 
-static void do_tests(const char *name, const char *prefix,
+static void do_tests(int sysfs, const char *name, const char *prefix,
 		     const intel_ctx_t *ctx)
 {
 	const struct intel_execution_engine2 *e;
@@ -469,7 +468,7 @@ static void do_tests(const char *name, const char *prefix,
 	igt_subtest_with_dynamic(buff) {
 		for_each_ctx_engine(device, ctx, e) {
 			igt_dynamic_f("%s", e->name)
-				test_error_state_capture(ctx, e);
+				test_error_state_capture(sysfs, ctx, e);
 		}
 	}
 
@@ -521,6 +520,7 @@ igt_main
 	igt_hang_t hang = {};
 	struct gem_engine_properties saved_params[GEM_MAX_ENGINES];
 	int num_engines = 0;
+	int sysfs_fd = -1;
 
 	igt_fixture {
 		const struct intel_execution_engine2 *e;
@@ -532,10 +532,10 @@ igt_main
 
 		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE);
 
-		sysfs = igt_sysfs_open(device);
-		igt_assert(sysfs != -1);
+		sysfs_fd = igt_sysfs_open(device);
+		igt_assert(sysfs_fd != -1);
 
-		igt_require(has_error_state(sysfs));
+		igt_require(has_error_state(sysfs_fd));
 
 		gem_require_mmap_device_coherent(device);
 
@@ -549,7 +549,7 @@ igt_main
 
 	igt_describe("Basic error capture");
 	igt_subtest("error-state-basic")
-		test_error_state_basic();
+		test_error_state_basic(sysfs_fd, device);
 
 	igt_describe("Check that executing unintialised memory causes a hang");
 	igt_subtest("hangcheck-unterminated")
@@ -565,7 +565,7 @@ igt_main
 		}
 	}
 
-	do_tests("GT", "gt", ctx);
+	do_tests(sysfs_fd, "GT", "gt", ctx);
 
 	igt_fixture {
 		igt_disallow_hang(device, hang);
@@ -573,7 +573,7 @@ igt_main
 		hang = igt_allow_hang(device, ctx->id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
 	}
 
-	do_tests("engine", "engine", ctx);
+	do_tests(sysfs_fd, "engine", "engine", ctx);
 
 	igt_fixture {
 		int i;
-- 
2.37.2
