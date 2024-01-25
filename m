Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF90C47422
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 15:41:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BA610F92A;
	Thu, 25 Jan 2024 15:41:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D87F10F92A
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 15:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706197291; x=1737733291;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f9LWrVgsvllhsasuXBxdKWrENF3niqtFHM4Ool4mKnw=;
 b=OhFxMg6EB2xwa726yxZQ2AN2WS6Yzpri9KgM4oLF5dgb7dkUndjtfsdl
 gV4oMSTuANS99lghhFPzW2is9cojPfbUDVb+h9uMynYt2/Z2JSxD/A1iF
 I0pOlUYreRoMtor7T7XcXNwtcKdb79zgyHRUnkcwjj0WV5JGYtAP0X+pZ
 YfIZmxiuyushs30oukP+neqvG4pyEtO02HKqrjHH6GuJReG0YWhBjwdQo
 Qn+yhut4OIFOgf/Qx2V38wZ+bVEkphqjnVkzqDie2znyw/7qqtEiK/b+2
 5vUJRkWBU26qlZnQCeLccOeXm3ZWfLFfNKc0hBv0ENFv767S+HmTNGA47 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="20743810"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="20743810"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:41:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="35137505"
Received: from anshuma1-desk.iind.intel.com ([10.190.239.112])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2024 07:41:30 -0800
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v7 3/4] tests/xe_pm: Add d3-mmap IGT test
Date: Thu, 25 Jan 2024 21:11:13 +0530
Message-Id: <20240125154114.2164080-4-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125154114.2164080-1-anshuman.gupta@intel.com>
References: <20240125154114.2164080-1-anshuman.gupta@intel.com>
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
v5:
- Use DPMS on/off.
v6:
- Fix d3-mmap-system CI failures.

Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
---
 tests/intel/xe_pm.c | 101 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 101 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index f793fd24e..7b61f4ca9 100644
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
+	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
+		igt_assert(igt_get_runtime_pm_status() == IGT_RUNTIME_PM_STATUS_ACTIVE);
+
+	igt_assert(igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED));
+
+	for (i = 0; i < bo_size / sizeof(*map); i++)
+		map[i] = MAGIC_2;
+
+	if (xe_has_vram(device.fd_xe) && flags & DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM)
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
@@ -591,6 +666,32 @@ igt_main
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
+			dpms_on_off(device, DRM_MODE_DPMS_OFF);
+			test_mmap(device, vram_memory(device.fd_xe, 0), DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
+			dpms_on_off(device, DRM_MODE_DPMS_ON);
+			igt_pm_set_autosuspend_delay(device.pci_xe, delay_ms);
+		}
 	}
 
 	igt_fixture {
-- 
2.25.1

