Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 28 Sep 2020 23:00:27 +0100
Message-Id: <20200928220027.417167-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gen9_exec_parse: Check parsing of
 large objects
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Simply check that we support parsing of batches as large as the uAPI
allows.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
---
 tests/i915/gen9_exec_parse.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/i915/gen9_exec_parse.c b/tests/i915/gen9_exec_parse.c
index 8cd82f568..db291d17b 100644
--- a/tests/i915/gen9_exec_parse.c
+++ b/tests/i915/gen9_exec_parse.c
@@ -566,6 +566,30 @@ static void test_bb_start(const int i915, const uint32_t handle, int test)
 	gem_close(i915, target_bo);
 }
 
+static void test_bb_large(int i915)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	uint32_t size = (1ull << 32) - 4096;
+	struct drm_i915_gem_exec_object2 obj = {
+		.handle = gem_create(i915, size),
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+		.flags = I915_EXEC_BLT,
+	};
+
+	intel_require_memory(2, size, CHECK_RAM);
+
+	gem_write(i915, obj.handle, size - 64, &bbe, sizeof(bbe));
+	igt_assert_eq(__checked_execbuf(i915, &execbuf), 0);
+
+	execbuf.batch_start_offset = size - 64;
+	igt_assert_eq(__checked_execbuf(i915, &execbuf), 0);
+
+	gem_close(i915, obj.handle);
+}
+
 static void test_bb_chained(const int i915, const uint32_t handle)
 {
 	const uint32_t batch[] = {
@@ -1053,6 +1077,9 @@ igt_main
 	igt_subtest("bb-start-far")
 		test_bb_start(i915, handle, BB_START_FAR);
 
+	igt_subtest("bb-large")
+		test_bb_large(i915);
+
 	igt_fixture {
 		igt_stop_hang_detector();
 		gem_close(i915, handle);
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
