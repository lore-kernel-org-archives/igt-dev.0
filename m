Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690C110E7C0
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 08:53:16 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Fri, 24 Nov 2023 09:52:54 +0100
Message-Id: <20231124085259.1777-4-lukasz.laguna@intel.com>
In-Reply-To: <20231124085259.1777-1-lukasz.laguna@intel.com>
References: <20231124085259.1777-1-lukasz.laguna@intel.com>
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

Cc: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
---
 lib/igt_sriov_device.c | 29 +++++++++++++++++++++++++++++
 lib/igt_sriov_device.h |  1 +
 2 files changed, 30 insertions(+)

diff --git a/lib/igt_sriov_device.c b/lib/igt_sriov_device.c
index 8e4d30b91..051161096 100644
--- a/lib/igt_sriov_device.c
+++ b/lib/igt_sriov_device.c
@@ -257,3 +257,32 @@ int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num)
 
 	return __drm_open_device(dev_name, DRIVER_ANY);
 }
+
+/**
+ * igt_sriov_is_vf_drm_driver_probed - Check if VF DRM driver is probed
+ * @pf: PF device file descriptor
+ * @vf_num: VF number (1-based to identify single VF)
+ *
+ * Verify if DRM driver is bound to VF device. Probe check is based on
+ * existence of the DRM subsystem attribute in sysfs.
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
index 4e57f0dcb..84f033f52 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -26,5 +26,6 @@ bool igt_sriov_is_driver_autoprobe_enabled(int pf);
 void igt_sriov_enable_driver_autoprobe(int pf);
 void igt_sriov_disable_driver_autoprobe(int pf);
 int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
+bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
 
 #endif /* __IGT_SRIOV_DEVICE_H__ */
-- 
2.40.0
