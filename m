Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Tue, 12 May 2020 16:07:36 +0200
Message-Id: <20200512140736.22096-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/gem_test_engine: Add no device reopen
 variant
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
Cc: intel-gfx@lists.freedesktop.org, Marcin Bernatowicz <marcin.bernatowicz@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Some tests may need to take care of closing all device file descriptors
even on subtest failure.  For example, if a test would like to
effectively unload the driver module after a subtest failure, that
wouldn't be possible if any device file descriptors were kept open.
That may happen if the subtest wants to use gem_test_engine() helper as
it reopens the device for its internal use and may certainly leave it
open on failure.

Provide a variant of the helper that doesn't reopen the device.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 lib/i915/gem_submission.c | 31 ++++++++++++++++++++++++++++---
 lib/i915/gem_submission.h |  1 +
 2 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
index 72de0c223..48defd4a0 100644
--- a/lib/i915/gem_submission.c
+++ b/lib/i915/gem_submission.c
@@ -186,14 +186,16 @@ static bool is_wedged(int i915)
 }
 
 /**
- * gem_test_engine:
+ * __gem_test_engine:
  * @i915: open i915 drm file descriptor
  * @engine: the engine (I915_EXEC_RING id) to exercise
  *
  * Execute a nop batch on the engine specified, or ALL_ENGINES for all,
  * and check it executes.
+ *
+ * Note: This version does not reopen the device.
  */
-void gem_test_engine(int i915, unsigned int engine)
+void __gem_test_engine(int i915, unsigned int engine)
 {
 	const uint32_t bbe = MI_BATCH_BUFFER_END;
 	struct drm_i915_gem_exec_object2 obj = { };
@@ -202,7 +204,6 @@ void gem_test_engine(int i915, unsigned int engine)
 		.buffer_count = 1,
 	};
 
-	i915 = gem_reopen_driver(i915);
 	igt_assert(!is_wedged(i915));
 
 	obj.handle = gem_create(i915, 4096);
@@ -223,6 +224,30 @@ void gem_test_engine(int i915, unsigned int engine)
 	gem_close(i915, obj.handle);
 
 	igt_assert(!is_wedged(i915));
+}
+
+/**
+ * gem_test_engine:
+ * @i915: open i915 drm file descriptor
+ * @engine: the engine (I915_EXEC_RING id) to exercise
+ *
+ * Reopen the device so the test is run in an isolated context, then
+ * execute a nop batch on the engine specified, or ALL_ENGINES for all,
+ * and check it executes.
+ */
+void gem_test_engine(int i915, unsigned int engine)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_exec_object2 obj = { };
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+	};
+
+	i915 = gem_reopen_driver(i915);
+
+	__gem_test_engine(i915, engine);
+
 	close(i915);
 }
 
diff --git a/lib/i915/gem_submission.h b/lib/i915/gem_submission.h
index acd24bcbf..32b737169 100644
--- a/lib/i915/gem_submission.h
+++ b/lib/i915/gem_submission.h
@@ -46,6 +46,7 @@ static inline bool gem_has_cmdparser(int i915, uint32_t engine)
 bool gem_has_blitter(int i915);
 void gem_require_blitter(int i915);
 
+void __gem_test_engine(int fd, unsigned int engine);
 void gem_test_engine(int fd, unsigned int engine);
 
 int gem_reopen_driver(int fd);
-- 
2.21.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
