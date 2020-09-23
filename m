Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82CAD6E9A4
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2020 14:29:17 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Wed, 23 Sep 2020 19:32:58 +0530
Message-Id: <20200923140258.7553-2-karthik.b.s@intel.com>
In-Reply-To: <20200923140258.7553-1-karthik.b.s@intel.com>
References: <20200923140258.7553-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v10 2/2] lib/igt_ioctl_wrappers: Add
 igt_has_drm_cap ioctl wrapper
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
Cc: michel@daenzer.net, daniel.vetter@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

Add a generic helper for DRM_IOCTL_GET_CAP ioctl.

v10: -No changes.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/ioctl_wrappers.c | 15 +++++++++++++++
 lib/ioctl_wrappers.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 3781286d..3ea60c61 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1318,3 +1318,18 @@ int __kms_addfb(int fd, uint32_t handle,
 
 	return ret < 0 ? -errno : ret;
 }
+
+/**
+ * igt_has_drm_cap:
+ * @fd: Open DRM file descriptor.
+ * @cap: drm_get_cap structure.
+ *
+ * This helper verifies if the passed cap is supported by the kernel
+ *
+ * Returns: Whether the cap is supported or not.
+ */
+bool igt_has_drm_cap(int fd, struct drm_get_cap cap)
+{
+	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
+	return cap.value;
+}
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 870ac8b7..4cf4004d 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -196,6 +196,7 @@ struct local_drm_mode_fb_cmd2 {
 
 bool igt_has_fb_modifiers(int fd);
 void igt_require_fb_modifiers(int fd);
+bool igt_has_drm_cap(int fd, struct drm_get_cap cap);
 
 /**
  * __kms_addfb:
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
