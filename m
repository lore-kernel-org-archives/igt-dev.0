Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF6610EA49
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Dec 2023 15:51:12 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH v1 07/10] drm-uapi/xe: Ensure every uapi struct has drm_xe
 prefix
Date: Fri, 15 Dec 2023 15:50:47 +0000
Message-Id: <20231215155050.7-8-francois.dugast@intel.com>
In-Reply-To: <20231215155050.7-1-francois.dugast@intel.com>
References: <20231215155050.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Ensure every uapi struct has drm_xe prefix")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h | 18 +++++++++---------
 tests/intel/xe_mmap.c     |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index b1839df48..9609194c1 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -27,7 +27,7 @@ extern "C" {
 #define DRM_XE_RESET_FAILED_UEVENT "DEVICE_STATUS"
 
 /**
- * struct xe_user_extension - Base class for defining a chain of extensions
+ * struct drm_xe_user_extension - Base class for defining a chain of extensions
  *
  * Many interfaces need to grow over time. In most cases we can simply
  * extend the struct and have userspace pass in more data. Another option,
@@ -45,29 +45,29 @@ extern "C" {
  *
  * .. code-block:: C
  *
- *	struct xe_user_extension ext3 {
+ *	struct drm_xe_user_extension ext3 {
  *		.next_extension = 0, // end
  *		.name = ...,
  *	};
- *	struct xe_user_extension ext2 {
+ *	struct drm_xe_user_extension ext2 {
  *		.next_extension = (uintptr_t)&ext3,
  *		.name = ...,
  *	};
- *	struct xe_user_extension ext1 {
+ *	struct drm_xe_user_extension ext1 {
  *		.next_extension = (uintptr_t)&ext2,
  *		.name = ...,
  *	};
  *
- * Typically the struct xe_user_extension would be embedded in some uAPI
+ * Typically the struct drm_xe_user_extension would be embedded in some uAPI
  * struct, and in this case we would feed it the head of the chain(i.e ext1),
  * which would then apply all of the above extensions.
  *
  */
-struct xe_user_extension {
+struct drm_xe_user_extension {
 	/**
 	 * @next_extension:
 	 *
-	 * Pointer to the next struct xe_user_extension, or zero if the end.
+	 * Pointer to the next struct drm_xe_user_extension, or zero if the end.
 	 */
 	__u64 next_extension;
 
@@ -78,7 +78,7 @@ struct xe_user_extension {
 	 *
 	 * Also note that the name space for this is not global for the whole
 	 * driver, but rather its scope/meaning is limited to the specific piece
-	 * of uAPI which has embedded the struct xe_user_extension.
+	 * of uAPI which has embedded the struct drm_xe_user_extension.
 	 */
 	__u32 name;
 
@@ -625,7 +625,7 @@ struct drm_xe_gem_mmap_offset {
 /** struct drm_xe_ext_set_property - XE set property extension */
 struct drm_xe_ext_set_property {
 	/** @base: base user extension */
-	struct xe_user_extension base;
+	struct drm_xe_user_extension base;
 
 	/** @property: property to set */
 	__u32 property;
diff --git a/tests/intel/xe_mmap.c b/tests/intel/xe_mmap.c
index 63fdf46a8..e96192d23 100644
--- a/tests/intel/xe_mmap.c
+++ b/tests/intel/xe_mmap.c
@@ -92,7 +92,7 @@ static void test_bad_flags(int fd)
 static void test_bad_extensions(int fd)
 {
 	uint64_t size = xe_get_default_alignment(fd);
-	struct xe_user_extension ext;
+	struct drm_xe_user_extension ext;
 	struct drm_xe_gem_mmap_offset mmo = {
 		.handle = xe_bo_create(fd, 0, size,
 				       vram_if_possible(fd, 0),
-- 
2.34.1
