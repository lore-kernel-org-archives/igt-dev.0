Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3C8C47DAF
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 14:28:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F8B10E9F9;
	Fri, 19 Jan 2024 14:28:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5B9110E9F9
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 14:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705674519; x=1737210519;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LkfXi6bFaQXqVrtdPgW+oU/rix0bbQb/gdFv4prQW/8=;
 b=BIrolYEY+Cv4LxRyYWr69i+WKoXUAInyhoYpSZF5dKBw8wyJXGSchTdr
 bCdWpQA/dTrCisEa6yqF+ogG/IhBNc48SuuQQ2P25uAmsGVw3wUltMD3t
 6wXWVK6ixlnqu3fPWStjednyzpRZB5jL6+q8b1dcEoqQaXaz5qGa4wgTb
 bWU9E18HLsr5yplgx4HF0r5Xg19wgpa8kY9G1AIqmNyyfxLzzZxQhIVZ2
 Z+UC0Oz/KwCG5cK4Eq3gAoGcJcsRjvmjgSa6hz32j8wyenNLBkjZZVHK3
 6Tkx5ZVAB9roxXCfP6SWxUP0XYHgNWNTdmvLKJy/K4ndq2M7HosfrwUSb Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="14278428"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="14278428"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 06:28:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="1031963547"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="1031963547"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 06:28:37 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 3/4] tests/xe_pm: Add d3-mmap IGT test
Date: Fri, 19 Jan 2024 19:58:22 +0530
Message-Id: <20240119142823.1711688-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119142823.1711688-1-anshuman.gupta@intel.com>
References: <20240119142823.1711688-1-anshuman.gupta@intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Adding a test to validate mmap memory mappings along with runtime
suspend and resume for both xe device and it's pci parent bridge
in device hierarchy.

v2:
- Use 0xc00fee pattern. [Rodrigo]
- Test the pagefault case on read and write the mapping. [Rodrigo]

v3:
- Cosmetic comment. [Kamil]
- Use MAGIC macro for 0xc0ffe and 0xdeadbeef. [Kamil]
- Fix xe_bo_create() with respect to Xe uapi.
- Set auto_suspend delay to 1000ms and restore it.

v4:
- Set autosuspend delay to 1 sec for entire test. [Badal]

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 tests/intel/xe_pm.c | 99 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 99 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index f793fd24e..9cb25d47c 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -30,6 +30,8 @@
 #define NO_RPM -1
 
 #define SIZE (4096 * 1024)
+#define MAGIC_1 0xc0ffee
+#define MAGIC_2 0xdeadbeef
 
 typedef struct {
 	int fd_xe;
@@ -476,6 +478,79 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	igt_assert(in_d3(device, IGT_ACPI_D3Cold));
 }
 
+/**
+ * SUBTEST: d3-mmap-%s
+ * Description:
+ *	Validate mmap memory mapping with d3 state, for %arg[1] region,
+ *	if supported by device.
+ * arg[1]:
+ *
+ * @vram:	vram region
+ * @system:	system region
+ *
+ * Functionality: pm-d3
+ * Run type: FULL
+ */
+static void test_mmap(device_t device, uint32_t placement, uint32_t flags)
+{
+	size_t bo_size = 8192;
+	uint32_t *map = NULL;
+	uint32_t bo;
+	int i;
+
+	igt_require_f(placement, "Device doesn't support such memory region\n");
+
+	bo_size = ALIGN(bo_size, xe_get_default_alignment(device.fd_xe));
+
+	bo = xe_bo_create(device.fd_xe, 0, bo_size, placement, flags);
+	map = xe_bo_map(device.fd_xe, bo, bo_size);
+	igt_assert(map);
+	memset(map, 0, bo_size);
+
+	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+
+	igt_assert(fw_handle >= 0);
+	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		map[i] = MAGIC_1;
+
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		igt_assert(map[i] == MAGIC_1);
+
+	/* Runtime suspend and validate the pattern and changed the pattern */
+	close(fw_handle);
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		igt_assert(map[i] == MAGIC_1);
+
+	/* dgfx page-fault on mmaping should wake the gpu */
+	if (xe_has_vram(device.fd_xe))
+		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		map[i] = MAGIC_2;
+
+	if (xe_has_vram(device.fd_xe))
+		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	/* Runtime resume and check the pattern */
+	fw_handle = igt_debugfs_open(device.fd_xe, "forcewake_all", O_RDONLY);
+	igt_assert(fw_handle >= 0);
+	igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		igt_assert(map[i] == MAGIC_2);
+
+	igt_assert(munmap(map, bo_size) == 0);
+	gem_close(device.fd_xe, bo);
+	close(fw_handle);
+}
+
 igt_main
 {
 	struct drm_xe_engine_class_instance *hwe;
@@ -591,6 +666,30 @@ igt_main
 			igt_install_exit_handler(vram_d3cold_threshold_restore);
 			test_vram_d3cold_threshold(device, sysfs_fd);
 		}
+
+		igt_describe("Validate mmap memory mappings with system region,"
+			     "when device along with parent bridge in d3");
+		igt_subtest("d3-mmap-system") {
+			test_mmap(device, system_memory(device.fd_xe), 0);
+		}
+
+		igt_describe("Validate mmap memory mappings with vram region,"
+			     "when device along with parent bridge in d3");
+		igt_subtest("d3-mmap-vram") {
+			int delay_ms;
+
+			if (device.pci_root != device.pci_xe) {
+				igt_pm_enable_pci_card_runtime_pm(device.pci_root, NULL);
+				igt_pm_set_d3cold_allowed(device.pci_slot_name, 1);
+			}
+
+			delay_ms = igt_pm_get_autosuspend_delay(device.pci_xe);
+
+			/* Give some auto suspend delay to validate rpm active during page fault */
+			igt_pm_set_autosuspend_delay(device.pci_xe, 1000);
+			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

