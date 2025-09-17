Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDA5CAC59A
	for <igt-dev@archiver.kernel.org>; Wed, 17 Sep 2025 13:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED7410E835;
	Wed, 17 Sep 2025 13:11:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kuy5NloL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E4F10E832
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Sep 2025 13:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758114711; x=1789650711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UxwVZic43hc5HpkoMfmnZ1fNdRBj/SkYvQDqfavyGsA=;
 b=Kuy5NloL8jri8jZYN5AEGKPSjezqUpNhL4bIVVke6IZAeaHk7YQXP+QI
 VLGKjzZroqAdA0CwOK6r7h5cWYeBXtapG0llf8OdEcDh5eX4wDqTSBYNw
 YSmKnOO1NcKhoGpq4pFysaaixeLceuSRyC6lIobQ5zA9h1ZLvYx8WWPh0
 9EUMKah2kGJEOX1cVQLuDsVG0HiZABacy14oTnZCrAiHO+zT6iIefqzfz
 XiQ5IX14B548T1QIEzRHgNsUTaab3RS7eTfPY2yIAaprGARWrI9ywfaHO
 CJF5MvcNnBz+eWdubcjM/RVm6RElu48dcmSsO9Zv+m4ZiTfhB5XxOQ+1Y w==;
X-CSE-ConnectionGUID: rEh/ZQB2QDG1XFQ+rQZnDA==
X-CSE-MsgGUID: kkgrlxxjSya1FN3JKRIAVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11556"; a="60348579"
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="60348579"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:11:51 -0700
X-CSE-ConnectionGUID: 38ZuPj13R1ivPgJ4QZz6pw==
X-CSE-MsgGUID: MHbruJiFQqic5qUBbXc4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; d="scan'208";a="175656092"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 06:11:49 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 sk.anirban@intel.com
Cc: soham.purkait@intel.com, riana.tauro@intel.com, lucas.demarchi@intel.com
Subject: [PATCH i-g-t v3] tests/intel/xe_pm: Test to validate vram-sr through
 Mods during host s2idle
Date: Wed, 17 Sep 2025 18:33:23 +0530
Message-Id: <20250917130323.3560097-1-soham.purkait@intel.com>
X-Mailer: git-send-email 2.34.1
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

Add test to validate vram-sr through Mods during host s2idle. It checks
whether vram self refresh capability is supported through debugfs node and
then introduce host s2idle to check ModS residency to confirm vram self
refresh capability upon success.

v1:
 - Define macros at the top. (Anirban)
v2:
 - gtidle no longer exists. (Anirban)
 - Skip test if the system is not VRSR-capable. (Anirban)
 - Release bo to avoid resource leaking. (Anirban)

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pm.c | 105 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 1db28a899..9b51ca7e2 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -10,10 +10,12 @@
  * Sub-category: Suspend-resume tests
  * Test category: functionality test
  */
+#include <ctype.h>
 
 #include <dirent.h>
 #include <limits.h>
 #include <fcntl.h>
+#include <stddef.h>
 #include <string.h>
 #include <sys/ioctl.h>
 
@@ -48,6 +50,9 @@
 #define I2C_AMC_ADDR	0x40
 #define I2C_AMC_REG	0x00
 
+#define XE_BO_SIZE (350 * 1024 * 1024)
+#define MODS_PREFIX "ModS"
+
 enum mem_op {
 	READ,
 	WRITE,
@@ -55,6 +60,7 @@ enum mem_op {
 
 typedef struct {
 	int fd_xe;
+	int debugfs_dir;
 	struct pci_device *pci_xe;
 	struct pci_device *pci_root;
 	char pci_slot_name[NAME_MAX];
@@ -423,6 +429,46 @@ child_exec(void *arguments)
 	return NULL;
 }
 
+static char *read_content_line(const char *content, const char *prefix)
+{
+	const char *line_start = content;
+	char line[1024];
+	char *result;
+	size_t len;
+
+	while (*line_start) {
+		const char *line_end = strchr(line_start, '\n');
+		size_t line_len = line_end ? (size_t)(line_end - line_start) : strlen(line_start);
+
+		if (line_len >= sizeof(line))
+			line_len = sizeof(line) - 1;
+
+		memcpy(line, line_start, line_len);
+		line[line_len] = '\0';
+
+		if (strstr(line, prefix)) {
+			char *colon = strchr(line, ':');
+
+			if (colon) {
+				colon++;
+				while (isspace((unsigned char)*colon))
+					colon++;
+
+				result = strdup(colon);
+				len = strlen(result);
+				if (len > 0 && result[len - 1] == '\n')
+					result[len - 1] = '\0';
+
+				return result;
+			}
+		}
+		line_start = line_end ? line_end + 1 : NULL;
+		if (!line_start)
+			break;
+	}
+	return NULL;
+}
+
 /**
  * SUBTEST: %s-basic
  * Description: test CPU/GPU in and out of s/d state from %arg[1]
@@ -871,6 +917,57 @@ static void i2c_test(device_t device, int sysfs_fd, enum igt_acpi_d_state d_stat
 	close(i2c_fd);
 }
 
+/**
+ * SUBTEST: vrsr-capability-during-host-s2idle
+ * Functionality: pm - vram-sr
+ * Description: Test to validate vram self refresh through
+ * ModS residency counter during host s2idle
+ */
+static void test_vrsr_capability_during_host_s2idle(device_t device)
+{
+	u32 bo, placement;
+	u64 s2idle_start_mods, s2idle_end_mods;
+	int ret;
+	char buf[4096] = {0};
+	char *result;
+	void *map;
+
+	ret = igt_debugfs_simple_read(device.debugfs_dir, "vrsr_capable", buf, sizeof(buf));
+	igt_skip_on_f(ret < 0, "vrsr_capable node is not present in debugfs.\n");
+	igt_skip_on_f(!strstr(buf, "true"), "VRSR capability is not supported.\n");
+
+	placement = vram_memory(device.fd_xe, 0);
+	bo = xe_bo_create(device.fd_xe, 0, XE_BO_SIZE, placement, 0);
+	map = xe_bo_map(device.fd_xe, bo, XE_BO_SIZE);
+	memset(map, 0, XE_BO_SIZE);
+
+	ret = igt_debugfs_simple_read(device.debugfs_dir, "dgfx_pkg_residencies",
+				      buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "cannot read dgfx_pkg_residencies.\n");
+
+	result = read_content_line(buf, MODS_PREFIX);
+	igt_assert(result);
+	s2idle_start_mods = (uint64_t)strtoull(result, NULL, 10);
+	free(result);
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
+	munmap(map, XE_BO_SIZE);
+	memset(buf, 0, sizeof(buf));
+
+	ret = igt_debugfs_simple_read(device.debugfs_dir, "dgfx_pkg_residencies",
+				      buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "cannot read dgfx_pkg_residencies.\n");
+
+	result = read_content_line(buf, MODS_PREFIX);
+	igt_assert(result);
+	s2idle_end_mods = (uint64_t)strtoull(result, NULL, 10);
+	free(result);
+
+	gem_close(device.fd_xe, bo);
+
+	igt_assert(s2idle_start_mods != s2idle_end_mods);
+}
+
 igt_main
 {
 	device_t device;
@@ -908,6 +1005,8 @@ igt_main
 	igt_fixture {
 		memset(&device, 0, sizeof(device));
 		device.fd_xe = drm_open_driver(DRIVER_XE);
+		device.debugfs_dir = igt_debugfs_dir(device.fd_xe);
+		igt_assert(device.debugfs_dir >= 0);
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
 		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
@@ -1052,12 +1151,18 @@ igt_main
 		test_vram_d3cold_threshold(device, sysfs_fd);
 	}
 
+	igt_describe("Validate VRAM self refresh capability during host s2idle");
+	igt_subtest("vrsr-capability-during-host-s2idle") {
+		test_vrsr_capability_during_host_s2idle(device);
+	}
+
 	igt_fixture {
 		close(sysfs_fd);
 		igt_pm_set_d3cold_allowed(device.pci_slot_name, d3cold_allowed);
 		if (has_runtime_pm)
 			igt_restore_runtime_pm();
 		drmModeFreeResources(device.res);
+		close(device.debugfs_dir);
 		drm_close_driver(device.fd_xe);
 	}
 }
-- 
2.34.1

