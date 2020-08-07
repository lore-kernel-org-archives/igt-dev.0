Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri,  7 Aug 2020 09:45:06 +0100
Message-Id: <20200807084506.473089-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_fence: Use default-context
 for syncobj-timeline-wait
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

syncobj-timeline-wait is only exercising waits on the syncobj along a
single timeline, for which it can use the universally available default
context, and so not try and fail to create a HW context on very old
platforms.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/2308
Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
---
 tests/i915/gem_exec_fence.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
index c9b95fe64..b240c30bf 100644
--- a/tests/i915/gem_exec_fence.c
+++ b/tests/i915/gem_exec_fence.c
@@ -1970,7 +1970,6 @@ static void test_syncobj_timeline_wait(int fd)
 		MI_BATCH_BUFFER_END,
 		MI_NOOP,
 	};
-	uint32_t gem_context = gem_context_clone_with_engines(fd, 0);
 	struct drm_i915_gem_exec_object2 obj;
 	struct drm_i915_gem_execbuffer2 execbuf;
 	struct drm_i915_gem_execbuffer_ext_timeline_fences timeline_fences;
@@ -1988,7 +1987,7 @@ static void test_syncobj_timeline_wait(int fd)
 
 	gem_quiescent_gpu(fd);
 
-	spin = igt_spin_new(fd, .ctx = gem_context, .engine = ALL_ENGINES);
+	spin = igt_spin_new(fd, .engine = ALL_ENGINES);
 
 	memset(&timeline_fences, 0, sizeof(timeline_fences));
 	timeline_fences.base.name = DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES;
@@ -2000,7 +1999,6 @@ static void test_syncobj_timeline_wait(int fd)
 	execbuf.buffers_ptr = to_user_pointer(&obj);
 	execbuf.buffer_count = 1;
 	execbuf.batch_len = sizeof(bbe);
-	execbuf.rsvd1 = gem_context;
 
 	memset(&obj, 0, sizeof(obj));
 	obj.handle = gem_create(fd, 4096);
@@ -2055,8 +2053,6 @@ static void test_syncobj_timeline_wait(int fd)
 		gem_sync(fd, handle[i]);
 		gem_close(fd, handle[i]);
 	}
-
-	gem_context_destroy(fd, gem_context);
 }
 
 static const char *test_syncobj_timeline_export_desc =
-- 
2.28.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
