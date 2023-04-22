Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43D7910E158
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Apr 2023 05:44:07 +0000 (UTC)
From: fei.yang@intel.com
To: igt-dev@lists.freedesktop.org
Date: Fri, 21 Apr 2023 22:45:16 -0700
Message-Id: <20230422054516.3383009-2-fei.yang@intel.com>
In-Reply-To: <20230422054516.3383009-1-fei.yang@intel.com>
References: <20230422054516.3383009-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH 1/1] test/gem_create: exercise
 gem_create_ext_set_pat
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Fei Yang <fei.yang@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

From: Fei Yang <fei.yang@intel.com>

Gem_create uAPI has been extended with capability of setting PAT index.
Add a test case to exercise this new extension.

Signed-off-by: Fei Yang <fei.yang@intel.com>
---
 include/drm-uapi/i915_drm.h | 33 +++++++++++++++++++++++++++++++++
 tests/i915/gem_create.c     | 28 ++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index a0876ee4..1fdaa372 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -3499,6 +3499,7 @@ struct drm_i915_gem_create_ext {
 	 */
 #define I915_GEM_CREATE_EXT_MEMORY_REGIONS 0
 #define I915_GEM_CREATE_EXT_PROTECTED_CONTENT 1
+#define I915_GEM_CREATE_EXT_SET_PAT 2
 	__u64 extensions;
 };
 
@@ -3616,6 +3617,38 @@ struct drm_i915_gem_create_ext_protected_content {
 /* ID of the protected content session managed by i915 when PXP is active */
 #define I915_PROTECTED_CONTENT_DEFAULT_SESSION 0xf
 
+/**
+ * struct drm_i915_gem_create_ext_set_pat - The
+ * I915_GEM_CREATE_EXT_SET_PAT extension.
+ *
+ * If this extension is provided, the specified caching policy (PAT index) is
+ * applied to the buffer object.
+ *
+ * Below is an example on how to create an object with specific caching policy:
+ *
+ * .. code-block:: C
+ *
+ *      struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
+ *              .base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
+ *              .pat_index = 0,
+ *      };
+ *      struct drm_i915_gem_create_ext create_ext = {
+ *              .size = PAGE_SIZE,
+ *              .extensions = (uintptr_t)&set_pat_ext,
+ *      };
+ *
+ *      int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
+ *      if (err) ...
+ */
+struct drm_i915_gem_create_ext_set_pat {
+	/** @base: Extension link. See struct i915_user_extension. */
+	struct i915_user_extension base;
+	/** @pat_index: PAT index to be set */
+	__u32 pat_index;
+	/** @rsvd: reserved for future use */
+	__u32 rsvd;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
index c719ab6c..7f514355 100644
--- a/tests/i915/gem_create.c
+++ b/tests/i915/gem_create.c
@@ -537,6 +537,29 @@ static void create_ext_placement_each(int fd)
 	free(regions);
 }
 
+static void create_ext_set_pat(int fd)
+{
+	struct drm_i915_gem_create_ext_set_pat setparam_pat = {
+		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
+		.pat_index = 0,
+	};
+	struct drm_i915_gem_create_ext_set_pat setparam_inv_pat = {
+		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
+		.pat_index = 65,
+	};
+	uint64_t size;
+	uint32_t handle;
+
+	size = PAGE_SIZE;
+
+	igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle,
+				       &setparam_pat.base), 0);
+
+	igt_assert_lt(__gem_create_ext(fd, &size, 0, &handle,
+				       &setparam_inv_pat.base), 0);
+	gem_close(fd, handle);
+}
+
 static bool supports_needs_cpu_access(int fd)
 {
 	struct drm_i915_gem_memory_class_instance regions[] = {
@@ -897,6 +920,11 @@ igt_main
 	igt_subtest("create-ext-placement-all")
 		create_ext_placement_all(fd);
 
+	igt_describe("Create objects with specific cache setting"
+		     " create-ext.");
+	igt_subtest("create-ext-set-pat")
+		    create_ext_set_pat(fd);
+
 	igt_describe("Verify the basic functionally and expected ABI contract around I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS");
 	igt_subtest("create-ext-cpu-access-sanity-check") {
 		igt_require(supports_needs_cpu_access(fd));
-- 
2.25.1
