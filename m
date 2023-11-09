Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F6C10E1C0
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Nov 2023 06:52:12 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu,  9 Nov 2023 07:51:43 +0100
Message-Id: <20231109065147.9479-5-lukasz.laguna@intel.com>
In-Reply-To: <20231109065147.9479-1-lukasz.laguna@intel.com>
References: <20231109065147.9479-1-lukasz.laguna@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH i-g-t 4/8] lib/igt_sriov_device: add helpers for
 operations in different VFs scenarios
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

Added helpers:
- for_each_vf and for_each_num_vfs
- for_random_vf and for_random_num_vfs
- for_last_vf and for_max_num_vfs

Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
 lib/igt_sriov_device.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index be4e56cf3..1b99fb8ce 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -19,4 +19,45 @@ bool igt_sriov_disable_driver_autoprobe(int pf);
 int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
 bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
 
+/**
+ * for_each_vf:
+ * @__pf_fd: PF device file descriptor
+ * @__vf_num: VFs iterator
+ *
+ * For loop that iterates over all VFs associated with given PF @__pf_fd.
+ */
+#define for_each_vf(__pf_fd, __vf_num) \
+	for (unsigned int __vf_num = 1, __total_vfs = igt_sriov_get_total_vfs(__pf_fd); \
+	     __vf_num <= __total_vfs; \
+	     ++__vf_num)
+#define for_each_num_vfs for_each_vf
+
+/**
+ * for_random_vf:
+ * @__pf_fd: PF device file descriptor
+ * @__vf_num: stores random VF
+ *
+ * Helper allows to run code using random VF number (stored in @__vf_num)
+ * picked from the range of all VFs associated with given PF @__pf_fd.
+ */
+#define for_random_vf(__pf_fd, __vf_num) \
+	for (unsigned int __vf_num = 1 + random() % igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
+	     __tmp < 1; \
+	     ++__tmp)
+#define for_random_num_vfs for_random_vf
+
+/**
+ * for_last_vf:
+ * @__pf_fd: PF device file descriptor
+ * @__vf_num: stores last VF number
+ *
+ * Helper allows to run code using last VF number (stored in @__vf_num)
+ * associated with given PF @__pf_fd.
+ */
+#define for_last_vf(__pf_fd, __vf_num) \
+	for (unsigned int __vf_num = igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
+	     __tmp < 1; \
+	     ++__tmp)
+#define for_max_num_vfs for_last_vf
+
 #endif /* __IGT_SRIOV_DEVICE_H__ */
-- 
2.40.0
