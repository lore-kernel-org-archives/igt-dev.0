Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 11 Mar 2020 09:34:44 +0000
Message-Id: <20200311093448.4103262-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/i915: Create a context wrapping one
 specific engine
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Quite frequently we want to execute on one precise engine, so add a
convenience routine to create a context that contains only that engine
in the default [0] slot.

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 lib/i915/gem_context.c | 64 +++++++++++++++++++++++++++++++-----------
 lib/i915/gem_context.h |  2 ++
 2 files changed, 49 insertions(+), 17 deletions(-)

diff --git a/lib/i915/gem_context.c b/lib/i915/gem_context.c
index 50dfee3d1..169e43d2e 100644
--- a/lib/i915/gem_context.c
+++ b/lib/i915/gem_context.c
@@ -43,6 +43,21 @@
  * software features improving submission model (context priority).
  */
 
+static int create_ext_ioctl(int i915,
+			    struct drm_i915_gem_context_create_ext *arg)
+{
+	int err;
+
+	err = 0;
+	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT, arg)) {
+		err = -errno;
+		igt_assume(err);
+	}
+
+	errno = 0;
+	return err;
+}
+
 /**
  * gem_has_contexts:
  * @fd: open i915 drm file descriptor
@@ -324,17 +339,14 @@ __gem_context_clone(int i915,
 		.flags = flags | I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
 		.extensions = to_user_pointer(&clone),
 	};
-	int err = 0;
+	int err;
 
-	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT, &arg)) {
-		err = -errno;
-		igt_assume(err);
-	}
+	err = create_ext_ioctl(i915, &arg);
+	if (err)
+		return err;
 
 	*out = arg.ctx_id;
-
-	errno = 0;
-	return err;
+	return 0;
 }
 
 static bool __gem_context_has(int i915, uint32_t share, unsigned int flags)
@@ -382,16 +394,8 @@ bool gem_has_context_clone(int i915)
 		.flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
 		.extensions = to_user_pointer(&ext),
 	};
-	int err;
-
-	err = 0;
-	if (igt_ioctl(i915, DRM_IOCTL_I915_GEM_CONTEXT_CREATE_EXT, &create)) {
-		err = -errno;
-		igt_assume(err);
-	}
-	errno = 0;
 
-	return err == -ENOENT;
+	return create_ext_ioctl(i915, &create) == -ENOENT;
 }
 
 /**
@@ -492,3 +496,29 @@ gem_context_copy_engines(int src_fd, uint32_t src, int dst_fd, uint32_t dst)
 	param.ctx_id = dst;
 	gem_context_set_param(dst_fd, &param);
 }
+
+uint32_t gem_context_create_for_engine(int i915, unsigned int class, unsigned int inst)
+{
+	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 1) = {
+		.engines = { { .engine_class = class, .engine_instance = inst } }
+	};
+	struct drm_i915_gem_context_create_ext_setparam p_engines = {
+		.base = {
+			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
+			.next_extension = 0, /* end of chain */
+		},
+		.param = {
+			.param = I915_CONTEXT_PARAM_ENGINES,
+			.value = to_user_pointer(&engines),
+			.size = sizeof(engines),
+		},
+	};
+	struct drm_i915_gem_context_create_ext create = {
+		.flags = I915_CONTEXT_CREATE_FLAGS_USE_EXTENSIONS,
+		.extensions = to_user_pointer(&p_engines),
+	};
+
+	igt_assert_eq(create_ext_ioctl(i915, &create), 0);
+	igt_assert_neq(create.ctx_id, 0);
+	return create.ctx_id;
+}
diff --git a/lib/i915/gem_context.h b/lib/i915/gem_context.h
index 15e5db281..b478c47a1 100644
--- a/lib/i915/gem_context.h
+++ b/lib/i915/gem_context.h
@@ -34,6 +34,8 @@ int __gem_context_create(int fd, uint32_t *ctx_id);
 void gem_context_destroy(int fd, uint32_t ctx_id);
 int __gem_context_destroy(int fd, uint32_t ctx_id);
 
+uint32_t gem_context_create_for_engine(int fd, unsigned int class, unsigned int inst);
+
 int __gem_context_clone(int i915,
 			uint32_t src, unsigned int share,
 			unsigned int flags,
-- 
2.25.1

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
