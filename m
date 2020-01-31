Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Date: Fri, 31 Jan 2020 14:20:37 +0100
Message-Id: <20200131132037.23319-2-janusz.krzysztofik@linux.intel.com>
In-Reply-To: <20200131132037.23319-1-janusz.krzysztofik@linux.intel.com>
References: <20200131132037.23319-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC PATCH 1/1] drm/i915: Never allow userptr into the
 new mapping types
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
Cc: igt-dev@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Commit 4f2a572eda67 ("drm/i915/userptr: Never allow userptr into the
mappable GGTT") made I915_GEM_MMAP_GTT IOCTLs to fail when atepmted
on a userptr object in order to protect from a lockdep splat.  Later
on, new mapping types were introduced by commit cc662126b413
("drm/i915: Introduce DRM_I915_GEM_MMAP_OFFSET").  Those new mapping
types suffer from the same lockdep splat issue but they now succeed
when tried on top of a userptr object.  Fix it.

While being at it, return -EINVAL which seems to better reflect the
reason for the failure than -ENODEV.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Abdiel Janulgue <abdiel.janulgue@linux.intel.com>
Cc: Chris Wilson <chris@chris-wilson.co.uk>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c         | 5 ++---
 drivers/gpu/drm/i915/gem/i915_gem_object.h       | 4 ++--
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_userptr.c      | 2 +-
 drivers/gpu/drm/i915/i915_gem.c                  | 4 ++--
 5 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index 879fff8adc48..c2d39418ef6b 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -553,9 +553,8 @@ __assign_mmap_offset(struct drm_file *file,
 	if (!obj)
 		return -ENOENT;
 
-	if (mmap_type == I915_MMAP_TYPE_GTT &&
-	    i915_gem_object_never_bind_ggtt(obj)) {
-		err = -ENODEV;
+	if (i915_gem_object_never_mmap(obj)) {
+		err = -EINVAL;
 		goto out;
 	}
 
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object.h b/drivers/gpu/drm/i915/gem/i915_gem_object.h
index 858f8bf49a04..3fd0d6e9eec8 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object.h
@@ -185,9 +185,9 @@ i915_gem_object_is_proxy(const struct drm_i915_gem_object *obj)
 }
 
 static inline bool
-i915_gem_object_never_bind_ggtt(const struct drm_i915_gem_object *obj)
+i915_gem_object_never_mmap(const struct drm_i915_gem_object *obj)
 {
-	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_NO_GGTT);
+	return i915_gem_object_type_has(obj, I915_GEM_OBJECT_NO_MMAP);
 }
 
 static inline bool
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
index 88e268633fdc..bb66d44fc1c4 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_types.h
@@ -34,7 +34,7 @@ struct drm_i915_gem_object_ops {
 #define I915_GEM_OBJECT_HAS_IOMEM	BIT(1)
 #define I915_GEM_OBJECT_IS_SHRINKABLE	BIT(2)
 #define I915_GEM_OBJECT_IS_PROXY	BIT(3)
-#define I915_GEM_OBJECT_NO_GGTT		BIT(4)
+#define I915_GEM_OBJECT_NO_MMAP		BIT(4)
 #define I915_GEM_OBJECT_ASYNC_CANCEL	BIT(5)
 
 	/* Interface between the GEM object and its backing storage.
diff --git a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
index e5558af111e2..da79cc9e57bf 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_userptr.c
@@ -703,7 +703,7 @@ i915_gem_userptr_dmabuf_export(struct drm_i915_gem_object *obj)
 static const struct drm_i915_gem_object_ops i915_gem_userptr_ops = {
 	.flags = I915_GEM_OBJECT_HAS_STRUCT_PAGE |
 		 I915_GEM_OBJECT_IS_SHRINKABLE |
-		 I915_GEM_OBJECT_NO_GGTT |
+		 I915_GEM_OBJECT_NO_MMAP |
 		 I915_GEM_OBJECT_ASYNC_CANCEL,
 	.get_pages = i915_gem_userptr_get_pages,
 	.put_pages = i915_gem_userptr_put_pages,
diff --git a/drivers/gpu/drm/i915/i915_gem.c b/drivers/gpu/drm/i915/i915_gem.c
index 9ddcf17230e6..1034e1db4fc0 100644
--- a/drivers/gpu/drm/i915/i915_gem.c
+++ b/drivers/gpu/drm/i915/i915_gem.c
@@ -923,8 +923,8 @@ i915_gem_object_ggtt_pin(struct drm_i915_gem_object *obj,
 	struct i915_vma *vma;
 	int ret;
 
-	if (i915_gem_object_never_bind_ggtt(obj))
-		return ERR_PTR(-ENODEV);
+	if (i915_gem_object_never_mmap(obj))
+		return ERR_PTR(-EINVAL);
 
 	if (flags & PIN_MAPPABLE &&
 	    (!view || view->type == I915_GGTT_VIEW_NORMAL)) {
-- 
2.21.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
