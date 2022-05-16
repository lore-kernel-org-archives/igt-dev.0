Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7644810E890
 for <igt-dev@lists.freedesktop.org>; Mon, 16 May 2022 20:50:09 +0000 (UTC)
From: Adrian Larumbe <adrian.larumbe@collabora.com>
To: daniel@ffwll.ch, matthew.d.roper@intel.com, igt-dev@lists.freedesktop.org
Date: Mon, 16 May 2022 21:49:59 +0100
Message-Id: <20220516205000.2960491-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t v2 1/2] i915_drm.h sync uapi engine class
 enum with drm-next
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: bob.beckett@collabora.com, adrian.larumbe@collabora.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

gem_ctx_isolation@preservation needs to take into account the shared reset
domain between RCS and CCS engines.

Remove local compute engine definition as it's no longer necessary.

Taken from ecf8eca51f33 ("drm/i915/xehp: Add compute engine ABI")

Signed-Off-By: Adrian Larumbe <adrian.larumbe@collabora.com>
---
 include/drm-uapi/i915_drm.h    | 62 ++++++++++++++++++++++++++++++----
 lib/i915/i915_drm_local.h      |  2 --
 tests/i915/gem_ctx_isolation.c |  2 ++
 3 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
index 9c9e1afa61ba..f0067d26123e 100644
--- a/include/drm-uapi/i915_drm.h
+++ b/include/drm-uapi/i915_drm.h
@@ -154,21 +154,71 @@ enum i915_mocs_table_index {
 	I915_MOCS_CACHED,
 };
 
-/*
+/**
+ * enum drm_i915_gem_engine_class - uapi engine type enumeration
+ *
  * Different engines serve different roles, and there may be more than one
- * engine serving each role. enum drm_i915_gem_engine_class provides a
- * classification of the role of the engine, which may be used when requesting
- * operations to be performed on a certain subset of engines, or for providing
- * information about that group.
+ * engine serving each role.  This enum provides a classification of the role
+ * of the engine, which may be used when requesting operations to be performed
+ * on a certain subset of engines, or for providing information about that
+ * group.
  */
 enum drm_i915_gem_engine_class {
+	/**
+	 * @I915_ENGINE_CLASS_RENDER:
+	 *
+	 * Render engines support instructions used for 3D, Compute (GPGPU),
+	 * and programmable media workloads.  These instructions fetch data and
+	 * dispatch individual work items to threads that operate in parallel.
+	 * The threads run small programs (called "kernels" or "shaders") on
+	 * the GPU's execution units (EUs).
+	 */
 	I915_ENGINE_CLASS_RENDER	= 0,
+
+	/**
+	 * @I915_ENGINE_CLASS_COPY:
+	 *
+	 * Copy engines (also referred to as "blitters") support instructions
+	 * that move blocks of data from one location in memory to another,
+	 * or that fill a specified location of memory with fixed data.
+	 * Copy engines can perform pre-defined logical or bitwise operations
+	 * on the source, destination, or pattern data.
+	 */
 	I915_ENGINE_CLASS_COPY		= 1,
+
+	/**
+	 * @I915_ENGINE_CLASS_VIDEO:
+	 *
+	 * Video engines (also referred to as "bit stream decode" (BSD) or
+	 * "vdbox") support instructions that perform fixed-function media
+	 * decode and encode.
+	 */
 	I915_ENGINE_CLASS_VIDEO		= 2,
+
+	/**
+	 * @I915_ENGINE_CLASS_VIDEO_ENHANCE:
+	 *
+	 * Video enhancement engines (also referred to as "vebox") support
+	 * instructions related to image enhancement.
+	 */
 	I915_ENGINE_CLASS_VIDEO_ENHANCE	= 3,
 
-	/* should be kept compact */
+	/**
+	 * @I915_ENGINE_CLASS_COMPUTE:
+	 *
+	 * Compute engines support a subset of the instructions available
+	 * on render engines:  compute engines support Compute (GPGPU) and
+	 * programmable media workloads, but do not support the 3D pipeline.
+	 */
+	I915_ENGINE_CLASS_COMPUTE	= 4,
+
+	/* Values in this enum should be kept compact. */
 
+	/**
+	 * @I915_ENGINE_CLASS_INVALID:
+	 *
+	 * Placeholder value to represent an invalid engine class assignment.
+	 */
 	I915_ENGINE_CLASS_INVALID	= -1
 };
 
diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
index 9a2273c4e4a9..17e823564f11 100644
--- a/lib/i915/i915_drm_local.h
+++ b/lib/i915/i915_drm_local.h
@@ -19,8 +19,6 @@ extern "C" {
  * or local_ prefix and without any #ifndef's. Attempt should be made to
  * clean these up when kernel uapi headers are sync'd.
  */
-#define I915_ENGINE_CLASS_COMPUTE 4
-
 #define DRM_I915_QUERY_GEOMETRY_SUBSLICES      6
 
 #if defined(__cplusplus)
diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
index 95d13969fa61..4233ea5784dc 100644
--- a/tests/i915/gem_ctx_isolation.c
+++ b/tests/i915/gem_ctx_isolation.c
@@ -164,6 +164,8 @@ static const struct named_register {
 
 	{ "xCS_GPR", GEN9, ALL, 0x600, 32, .relative = true },
 
+        /* TODO: add CCS0 registers */
+
 	{}
 }, ignore_registers[] = {
 	{ "RCS timestamp", GEN6, ~0u, 0x2358 },
-- 
2.35.1
