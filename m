Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F14E010E3F3
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Nov 2023 20:00:11 +0000 (UTC)
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Mon,  6 Nov 2023 20:59:43 +0100
Message-Id: <20231106195947.14640-5-lukasz.laguna@intel.com>
In-Reply-To: <20231106195947.14640-1-lukasz.laguna@intel.com>
References: <20231106195947.14640-1-lukasz.laguna@intel.com>
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
 lib/igt_sriov_device.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/lib/igt_sriov_device.h b/lib/igt_sriov_device.h
index be4e56cf3..78cb0e73b 100644
--- a/lib/igt_sriov_device.h
+++ b/lib/igt_sriov_device.h
@@ -19,4 +19,22 @@ bool igt_sriov_disable_driver_autoprobe(int pf);
 int igt_sriov_open_vf_drm_device(int pf, unsigned int vf_num);
 bool igt_sriov_is_vf_drm_driver_probed(int pf, unsigned int vf_num);
 
+#define for_each_vf(__pf_fd, __vf_num) \
+	for (unsigned int __vf_num = 1, __total_vfs = igt_sriov_get_total_vfs(__pf_fd); \
+	     __vf_num <= __total_vfs; \
+	     ++__vf_num)
+#define for_each_num_vfs for_each_vf
+
+#define for_random_vf(__pf_fd, __vf_num) \
+	for (unsigned int __vf_num = 1 + random() % igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
+	     __tmp < 1; \
+	     ++__tmp)
+#define for_random_num_vfs for_random_vf
+
+#define for_last_vf(__pf_fd, __vf_num) \
+	for (unsigned int __vf_num = igt_sriov_get_total_vfs(__pf_fd), __tmp = 0; \
+	     __tmp < 1; \
+	     ++__tmp)
+#define for_max_num_vfs for_last_vf
+
 #endif /* __IGT_SRIOV_DEVICE_H__ */
-- 
2.40.0
