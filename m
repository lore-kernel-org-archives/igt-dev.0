Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DCF510E1BF
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 06:52:10 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 07:51:42 +0100
Message-Id: <20231109065147.9479-4-lukasz.laguna@intel.com>
In-Reply-To: <20231109065147.9479-1-lukasz.laguna@intel.com>
References: <20231109065147.9479-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 3/8] lib/igt_sriov_device: add helper for
 checking if VF DRM driver is probed
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

From: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>

Probe check is based on existence of the DRM subsystem attribute in
sysfs.

Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
Reviewed-by: Katarzyna Dec <katarzyna.dec@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sriov_device.c | 30 ++++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 2 files changed, 31 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 3fab2a822..384e303dc 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -222,3 +222,33 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
 
 	return drm_open_device(dev_name, DRIVER_ANY);
 }
+
+/**
+ * igt_sriov_is_vf_drm_driver_probed:
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based to identify single VF)
+ *
+ * This function verifies if DRM driver is bound to VF device.
+ *
+ * Probe check is based on existence of the DRM subsystem attribute in sysfs.
+ *
+ * Returns:
+ * True if VF has DRM driver loaded, false if not.
+ */
+bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num)
+{
+	char path[PATH_MAX];
+	int sysfs;
+	bool ret;
+
+	igt_assert(vf_num > 0);
+
+	sysfs = igt_sysfs_open(pf);
+	igt_assert_fd(sysfs);
+	/* vf_num is 1-based, but virtfn is 0-based */
+	snprintf(path, sizeof(path), "device/virtfn%u/drm", vf_num - 1);
+	ret = igt_sysfs_has_attr(sysfs, path);
+	close(sysfs);
+
+	return ret;
+}
diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index b58dd4098..be4e56cf3 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -17,5 +17,6 @@ bool igt_sriov_is_driver_autoprobe_enabled(int pf);
 bool igt_sriov_enable_driver_autoprobe(int pf);
 bool igt_sriov_disable_driver_autoprobe(int pf);
 int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
+bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
 
 #endif /* __IGT_SRIOV_DEVICE_H__ */
-- 
2.40.0
