Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F97C6EB97
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Sep 2020 04:52:32 +0000 (UTC)
From: Karthik B S <karthik.b.s@intel.com>
Date: Fri, 25 Sep 2020 09:56:12 +0530
Message-Id: <20200925042613.18301-2-karthik.b.s@intel.com>
In-Reply-To: <20200925042613.18301-1-karthik.b.s@intel.com>
References: <20200925042613.18301-1-karthik.b.s@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v11 1/2] lib/igt_ioctl_wrappers: Add
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

v11: -Pass cap ID instead of the whole structure. (Ville)
     -Fix the patch ordering. (Ville)

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
---
 lib/ioctl_wrappers.c | 17 +++++++++++++++++
 lib/ioctl_wrappers.h |  1 +
 2 files changed, 18 insertions(+)

diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
index 3781286d..3f35609a 100644
--- a/lib/ioctl_wrappers.c
+++ b/lib/ioctl_wrappers.c
@@ -1318,3 +1318,20 @@ int __kms_addfb(int fd, uint32_t handle,
 
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
+bool igt_has_drm_cap(int fd, uint64_t flag)
+{
+	struct drm_get_cap cap = { .capability = flag };
+
+	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
+	return cap.value;
+}
diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
index 870ac8b7..e0ec203d 100644
--- a/lib/ioctl_wrappers.h
+++ b/lib/ioctl_wrappers.h
@@ -196,6 +196,7 @@ struct local_drm_mode_fb_cmd2 {
 
 bool igt_has_fb_modifiers(int fd);
 void igt_require_fb_modifiers(int fd);
+bool igt_has_drm_cap(int fd, uint64_t flag);
 
 /**
  * __kms_addfb:
-- 
2.22.0

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
