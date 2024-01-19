Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4127BC4725D
	for <igt-dev@archiver.kernel.org>; Fri, 19 Jan 2024 11:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E199110E9E7;
	Fri, 19 Jan 2024 11:58:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA56810E9B7
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Jan 2024 11:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705665505; x=1737201505;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LkfXi6bFaQXqVrtdPgW+oU/rix0bbQb/gdFv4prQW/8=;
 b=LPijAhMiHq5sTNvyfRJP60XqV2V0My++EpgHxbbvlNcBxt677J5T9HW0
 sthMszni8M59zyDAAFh21QiWja2pxsnJMdxDIJmwO2IPYhIZws6T+b+J+
 lc3xXG3Q545Ddw8fKbmRdv1tmPc4fTlC+mPT6oy94TyJwbdavSnrgrUBt
 80i3EfWNVY2GnzW3WTS8ZJwskjWAN+5uzFfF0QTcngCZj6WKDWD2vQHht
 r//f9kzqbOlCEkiq+14sZs/U/fTHQwAxAWogzH4TyK7MxVx1vHVf8GhrE
 U5HIeWongLT12pWYouFgRDQd1vo6Pmgi9radVUWqTOX1x4Q871f41qrlB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="465008198"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="465008198"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:58:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="788346449"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="788346449"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 03:58:23 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v5 3/4] tests/xe_pm: Add d3-mmap IGT test
Date: Fri, 19 Jan 2024 17:25:53 +0530
Message-Id: <20240119115554.1699060-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240119115554.1699060-1-anshuman.gupta@intel.com>
References: <20240119115554.1699060-1-anshuman.gupta@intel.com>
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
Cc: kamil.konieczny@intel.com, rodrigo.vivi@intel.com
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

