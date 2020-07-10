Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 10 Jul 2020 10:32:34 +0100
Message-Id: <20200710093234.1438712-6-chris@chris-wilson.co.uk>
In-Reply-To: <20200710093234.1438712-1-chris@chris-wilson.co.uk>
References: <20200710093234.1438712-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/6] i915/gem_softpin: Active rebinds
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

Verify that we do not block userspace [controlling fence progress] if it
requires vma recycling.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 tests/i915/gem_softpin.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
index 202abdd88..55ceb1bf2 100644
--- a/tests/i915/gem_softpin.c
+++ b/tests/i915/gem_softpin.c
@@ -263,6 +263,33 @@ static void test_reverse(int i915)
 	gem_close(i915, handle);
 }
 
+static void test_active(int i915)
+{
+	const uint32_t bbe = MI_BATCH_BUFFER_END;
+	struct drm_i915_gem_exec_object2 obj = {
+		.handle = gem_create(i915, 4096),
+	};
+	struct drm_i915_gem_execbuffer2 execbuf = {
+		.buffers_ptr = to_user_pointer(&obj),
+		.buffer_count = 1,
+	};
+	igt_spin_t *spin;
+
+	gem_write(i915, obj.handle, 0, &bbe, sizeof(bbe));
+
+	/* Make a busy spot */
+	spin = igt_spin_new(i915);
+
+	/* Reuse it for ourselves */
+	obj.offset = spin->obj[IGT_SPIN_BATCH].offset;
+	obj.flags = EXEC_OBJECT_PINNED;
+	gem_execbuf(i915, &execbuf);
+	igt_assert_eq_u64(obj.offset, spin->obj[IGT_SPIN_BATCH].offset);
+
+	gem_close(i915, obj.handle);
+	igt_spin_free(i915, spin);
+}
+
 static uint64_t busy_batch(int fd)
 {
 	const int gen = intel_gen(intel_get_drm_devid(fd));
@@ -565,6 +592,8 @@ igt_main
 		test_overlap(fd);
 	igt_subtest("reverse")
 		test_reverse(fd);
+	igt_subtest("active")
+		test_active(fd);
 
 	igt_subtest("noreloc")
 		test_noreloc(fd, NOSLEEP, 0);
-- 
2.27.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
