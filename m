Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A87B4CA0FF9
	for <igt-dev@archiver.kernel.org>; Fri, 29 Aug 2025 19:05:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DFE110EC32;
	Fri, 29 Aug 2025 19:05:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SebmSL3+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD5510E1E9
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Aug 2025 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756494307; x=1788030307;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uniTjfhN8vyP/2C4/jX67hNSQMN2qeLCcHj3kFG9YHE=;
 b=SebmSL3+sjQV+KbjZXKrqTRD/iuVJERIZyQ2NkdwfA8EBrTwDq3bbox+
 dg/K26Qw0Z3ik2tqKHVRlfCGKz8+CUoenK83fzIoSvF7kk9fk8TSrH6IL
 ERTmr81CkmBR2/mxfPjXYrpap2/S/XNMnfLEWx+Wsh6mGYfQUrHi4ygr/
 Ni4MZPkXrLMwxStnspEt6F2C1UAwBP+EbTyZbGMBtNxESz5JiYfVqyg6h
 6F1UCkZ+vrf0sqT5s9S6m11M5KxH/w9He1X9pUZmvvTUHmJ58F76FJtPh
 EGON4tMZaGHE3aG9guQ52j7mXHyYvciDnmHZPyGARb/RvwyK3dgqLd5WQ Q==;
X-CSE-ConnectionGUID: Dp01fJ7vSCWbMNZNvcPFzA==
X-CSE-MsgGUID: qmndMK/7RfG6tZZvFna8iA==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="46358256"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; d="scan'208";a="46358256"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 12:05:07 -0700
X-CSE-ConnectionGUID: I+ImDHwVQKG7eGA/wLt70w==
X-CSE-MsgGUID: mZUALIlIS6aVSgTmAmi9IQ==
X-ExtLoop1: 1
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2025 12:05:05 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 sk.anirban@intel.com
Cc: soham.purkait@intel.com, riana.tauro@intel.com, lucas.demarchi@intel.com
Subject: [PATCH i-g-t v2] tests/intel/xe_pm: Test to validate vram-sr through
 Mods during host s2idle
Date: Sat, 30 Aug 2025 00:26:58 +0530
Message-Id: <20250829185658.3418527-1-soham.purkait@intel.com>
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
index a3a26f62a..8ddc01bf1 100644
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
@@ -907,6 +1004,8 @@ igt_main
 	igt_fixture {
 		memset(&device, 0, sizeof(device));
 		device.fd_xe = drm_open_driver(DRIVER_XE);
+		device.debugfs_dir = igt_debugfs_dir(device.fd_xe);
+		igt_assert(device.debugfs_dir >= 0);
 		device.pci_xe = igt_device_get_pci_device(device.fd_xe);
 		device.pci_root = igt_device_get_pci_root_port(device.fd_xe);
 		igt_device_get_pci_slot_name(device.fd_xe, device.pci_slot_name);
@@ -1040,11 +1139,17 @@ igt_main
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
 		igt_restore_runtime_pm();
 		drmModeFreeResources(device.res);
+		close(device.debugfs_dir);
 		drm_close_driver(device.fd_xe);
 	}
 }
-- 
2.34.1

