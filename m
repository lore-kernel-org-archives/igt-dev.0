Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8206F10E099
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 08:32:45 +0000 (UTC)
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 16 Nov 2023 13:55:53 +0530
Message-Id: <20231116082553.400258-1-ankit.k.nautiyal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t] lib/igt_kms: Fix typo in documentation
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

Fix few typographical errors in comments/documentation.

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 lib/igt_kms.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 89510ff22b40..c381fed71e30 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -749,7 +749,7 @@ igt_plane_rotations(igt_display_t *display, igt_plane_t *plane,
 }
 
 /*
- * Retrieve all the properies specified in props_name and store them into
+ * Retrieve all the properties specified in props_name and store them into
  * plane->props.
  */
 static void
@@ -789,7 +789,7 @@ igt_fill_plane_props(igt_display_t *display, igt_plane_t *plane,
 }
 
 /*
- * Retrieve all the properies specified in props_name and store them into
+ * Retrieve all the properties specified in props_name and store them into
  * config->atomic_props_crtc and config->atomic_props_connector.
  */
 static void
@@ -4511,7 +4511,7 @@ void igt_display_commit_atomic(igt_display_t *display, uint32_t flags, void *use
  * This function should only be used to commit changes that are expected to
  * succeed, since any failure during the commit process will cause the IGT
  * subtest to fail.  To commit changes that are expected to fail, use
- * @igt_try_display_commit2 instead.
+ * @igt_display_try_commit2 instead.
  *
  * Returns: 0 upon success.  This function will never return upon failure
  * since igt_fail() at lower levels will longjmp out of it.
@@ -4568,7 +4568,7 @@ int igt_display_commit(igt_display_t *display)
  * @display: DRM device handle
  *
  * Nonblockingly reads all current events and drops them, for highest
- * reliablility, call igt_display_commit2() first to flush all outstanding
+ * reliability, call igt_display_commit2() first to flush all outstanding
  * events.
  *
  * This will be called on the first commit after igt_display_reset() too,
@@ -5691,7 +5691,7 @@ void igt_parse_connector_tile_blob(drmModePropertyBlobPtr blob,
  *
  * Reduce @format to a base format. The aim is to allow grouping
  * sufficiently similar formats into classes. Formats with identical
- * component sizes, overall pixel size, chroma subsamling, etc. are
+ * component sizes, overall pixel size, chroma subsampling, etc. are
  * considered part of the same class, no matter in which order the
  * components appear. We arbitrarily choose one of the formats in
  * the class as the base format. Note that the base format itself
-- 
2.40.1
