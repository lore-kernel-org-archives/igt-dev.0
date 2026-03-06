Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F81F513F9
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 04:17:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C54AA10E344;
	Fri,  6 Mar 2026 04:17:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dMdwrXMy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BC2E10E323
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 04:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772770655; x=1804306655;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Rgvyco56kUmttjaKVraPx/rYTyHAQGbfV8VRUP6fwjE=;
 b=dMdwrXMyIGSkW0lyznzO86jToPcr6LUTzCyf+a44WuzMTcQcClVF0gXH
 RevIy7InhGunXB99BY8EKEpjJ4vt3XI266O3c9BGU+3F/ZjzJDQRQHDkT
 /zKle9o8xQdeQC0tPeNXUGwbP4jzrmy9VpGJ+tFbdLumlrvgxgZHQ9dxs
 MSbOKaNc3PozHpSS/Je6KzPLdpi75zGWPpXFX8fziocKI6n8nPhBOYIHr
 7xOb+wkRaQqG3fmil8+WbiTZPmP5YpqKpo/Bc4bmnnmLfk2kxIXG8PwkY
 hs0fiDYBb/NfHluBwu/KtwHbhDRRYmlb2HPCGNeyLIg1H6eUti30BWXXJ Q==;
X-CSE-ConnectionGUID: EASjdRERTo2kdQf6nFEKfg==
X-CSE-MsgGUID: MYQUY9DqREWHIoPIRajBRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="85223365"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="85223365"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 20:17:35 -0800
X-CSE-ConnectionGUID: TkxEeIC/QqaL9EeMLNThUQ==
X-CSE-MsgGUID: I2seXL+SQB6tSj7UqB6q7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="256799146"
Received: from priyanka.iind.intel.com ([10.190.216.153])
 by orviesa001.jf.intel.com with ESMTP; 05 Mar 2026 20:17:34 -0800
From: priyanka.dandamudi@intel.com
To: igt-dev@lists.freedesktop.org,
	priyanka.dandamudi@intel.com
Subject: [PATCH i-g-t 5/5] tests/intel/xe_pat: Validate XA App Transient
 feature
Date: Fri,  6 Mar 2026 09:47:26 +0530
Message-ID: <20260306041720.1760867-12-priyanka.dandamudi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260306041720.1760867-7-priyanka.dandamudi@intel.com>
References: <20260306041720.1760867-7-priyanka.dandamudi@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Priyanka Dandamudi <priyanka.dandamudi@intel.com>

Test the scenarios when media is on/off.
When media is off/on, for xa app transient buffer, data should be coherent
between cpu and gpu. Coherency should be maintained from KMD side
irrespective of media engine on/off.

v2: Added comment to explain the reason of forcewaking.
Added 2way also in the index along with XA.(Matt)
Reordered headers.(Kamil)

v3:Reordered headers.Renamed string xa-l3-2way to xa-l3-1way
in xe3p_lpg_coherency_pat_index_modes structure.Updated comments for
forcewaking.

Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 tests/intel/xe_pat.c | 105 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tests/intel/xe_pat.c b/tests/intel/xe_pat.c
index aeb84dbb7..b92512164 100644
--- a/tests/intel/xe_pat.c
+++ b/tests/intel/xe_pat.c
@@ -14,13 +14,19 @@
 #include <fcntl.h>
 
 #include "igt.h"
+#include "igt_configfs.h"
+#include "igt_device.h"
+#include "igt_fs.h"
+#include "igt_kmod.h"
 #include "igt_syncobj.h"
+#include "igt_sysfs.h"
 #include "igt_vgem.h"
 #include "intel_blt.h"
 #include "intel_mocs.h"
 #include "intel_pat.h"
 #include "linux_scaffold.h"
 
+#include "xe/xe_gt.h"
 #include "xe/xe_ioctl.h"
 #include "xe/xe_query.h"
 #include "xe/xe_util.h"
@@ -29,6 +35,8 @@
 #define XE_COH_AT_LEAST_1WAY 2
 
 static bool do_slow_check;
+static char bus_addr[NAME_MAX];
+static struct pci_device *pci_dev;
 
 static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
 			      bool force_cpu_wc);
@@ -1184,6 +1192,11 @@ const struct pat_index_entry bmg_g21_pat_index_modes[] = {
 	{ NULL, 27, false, "c2-2way",     XE_COH_AT_LEAST_1WAY       },
 };
 
+const struct pat_index_entry xe3p_lpg_coherency_pat_index_modes[] = {
+	{ NULL, 18, false, "xa-l3-uc",	 XE_COH_NONE          },
+	{ NULL, 19, false, "xa-l3-1way", XE_COH_AT_LEAST_1WAY },
+};
+
 /*
  * Depending on 2M/1G GTT pages we might trigger different PTE layouts for the
  * PAT bits, so make sure we test with and without huge-pages. Also ensure we
@@ -1248,6 +1261,18 @@ static uint32_t create_object(int fd, int r, int size, uint16_t coh_mode,
  * Description: Check some of the xe2 pat_index modes.
  */
 
+/**
+ * SUBTEST: xa-app-transient-media-off
+ * Test category: functionality test
+ * Description: Check some of the xe4-lpg pat_index modes with media off.
+ */
+
+/**
+ * SUBTEST:  xa-app-transient-media-on
+ * Test category: functionality test
+ * Description: Check some of the xe3p-lpg pat_index modes with media on.
+ */
+
 static void subtest_pat_index_modes_with_regions(int fd,
 						 const struct pat_index_entry *modes_arr,
 						 int n_modes)
@@ -1561,6 +1586,56 @@ static void false_sharing(int fd)
 	}
 }
 
+static void reset(int sig)
+{
+	int configfs_fd;
+
+	igt_kmod_unbind("xe", bus_addr);
+
+	/* Drop all custom configfs settings from subtests */
+	configfs_fd = igt_configfs_open("xe");
+	if (configfs_fd >= 0)
+		igt_fs_remove_dir(configfs_fd, bus_addr);
+	close(configfs_fd);
+
+	/* Bind again a clean driver with no custom settings */
+	igt_kmod_bind("xe", bus_addr);
+}
+
+static void xa_app_transient_test(int configfs_device_fd, bool media_on)
+{
+	int fd, fw_handle, gt;
+
+	igt_kmod_unbind("xe", bus_addr);
+
+	if (media_on)
+		igt_assert(igt_sysfs_set(configfs_device_fd,
+					 "gt_types_allowed", "primary,media"));
+	else
+		igt_assert(igt_sysfs_set(configfs_device_fd,
+					 "gt_types_allowed", "primary"));
+
+	igt_kmod_bind("xe", bus_addr);
+
+	fd = drm_open_driver(DRIVER_XE);
+
+	/* Prevent entering C6 for the duration of the test, since this can result
+	 * in randomly flushing the entire device side caches, invalidating our XA
+	 * testing.
+	 */
+	fw_handle = igt_debugfs_open(fd, "forcewake_all", O_RDONLY);
+	igt_require(fw_handle >= 0);
+
+	subtest_pat_index_modes_with_regions(fd, xe3p_lpg_coherency_pat_index_modes,
+					     ARRAY_SIZE(xe3p_lpg_coherency_pat_index_modes));
+
+	/* check status of c state, it should not be in c6 due to forcewake. */
+	xe_for_each_gt(fd, gt)
+		igt_assert(!xe_gt_is_in_c6(fd, gt));
+
+	close(fw_handle);
+}
+
 static int opt_handler(int opt, int opt_index, void *data)
 {
 	switch (opt) {
@@ -1652,6 +1727,36 @@ int igt_main_args("V", NULL, help_str, opt_handler, NULL)
 		false_sharing(fd);
 	}
 
+	igt_subtest_group() {
+		int configfs_fd, configfs_device_fd;
+
+		igt_fixture() {
+			igt_require(intel_graphics_ver(dev_id) == IP_VER(35, 10));
+
+			pci_dev = igt_device_get_pci_device(fd);
+			snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
+				 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
+
+			configfs_fd = igt_configfs_open("xe");
+			igt_require(configfs_fd != -1);
+			configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr,
+							       S_IRWXU | S_IRGRP | S_IXGRP |
+							       S_IROTH | S_IXOTH);
+			igt_install_exit_handler(reset);
+		}
+
+		igt_subtest_with_dynamic("xa-app-transient-media-off")
+			xa_app_transient_test(configfs_device_fd, false);
+
+		igt_subtest_with_dynamic("xa-app-transient-media-on")
+			xa_app_transient_test(configfs_device_fd, true);
+
+		igt_fixture() {
+			close(configfs_device_fd);
+			close(configfs_fd);
+		}
+	}
+
 	igt_fixture()
 		drm_close_driver(fd);
 }
-- 
2.43.0

