Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D075FCA0EFA
	for <igt-dev@archiver.kernel.org>; Tue, 26 Aug 2025 13:38:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E7C110E37A;
	Tue, 26 Aug 2025 13:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P9HuNRQL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 147FC10E37A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Aug 2025 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756215533; x=1787751533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4bgweftez/fJ5bz+e82PAgqXSQT1hspy2u3JvUZ8g18=;
 b=P9HuNRQLghAWwAxRC+3LXK/JHhmRob2ncLgZj8SDtdrK7oMZ6kGEv9Wf
 VLTiACaMBAmkKxmCat2Gjk1a5en49xYUeNp2UwkrEWG3TrYKSMZGWPBu1
 yIHKJULh1cK0jaNjshiPl47RtHndnORaCAYAbugupUYpSxcENrsCRRDPf
 82YHDB2Fd90ypGgrB/75SghO+eaxEkGPbryK3pRkBX6hoes6T/7EfgoIz
 11TYaeBeusnIDZx557lxUhwnhr5MuIAbckmreXfozGkvvBGNb+O6jGR6H
 wFeqo0y4Kawk1owhgTMzXZdziOqSjm93/2VIFetKImBGdYVMCFVRz83cZ Q==;
X-CSE-ConnectionGUID: PakXy3irTRq2nJ2cwFXCoQ==
X-CSE-MsgGUID: P3GVbCvjQnqMc76IDCrUeg==
X-IronPort-AV: E=McAfee;i="6800,10657,11534"; a="69550594"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="69550594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 06:38:52 -0700
X-CSE-ConnectionGUID: wFACdUznTVGGvghlw/fGug==
X-CSE-MsgGUID: NJHLpvIWSJux3ECJeHZCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="173743035"
Received: from psoham-nuc7i7bnh.iind.intel.com ([10.190.216.151])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2025 06:38:51 -0700
From: Soham Purkait <soham.purkait@intel.com>
To: igt-dev@lists.freedesktop.org, anshuman.gupta@intel.com,
 sk.anirban@intel.com
Cc: soham.purkait@intel.com, riana.tauro@intel.com, lucas.demarchi@intel.com
Subject: [PATCH i-g-t v1] tests/intel/xe_pm: Test to validate vram-sr through
 Mods during host s2idle
Date: Tue, 26 Aug 2025 19:01:05 +0530
Message-Id: <20250826133105.3380147-1-soham.purkait@intel.com>
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

Signed-off-by: Soham Purkait <soham.purkait@intel.com>
---
 tests/intel/xe_pm.c | 98 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index a3a26f62a..918431641 100644
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
@@ -423,6 +428,46 @@ child_exec(void *arguments)
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
@@ -871,6 +916,54 @@ static void i2c_test(device_t device, int sysfs_fd, enum igt_acpi_d_state d_stat
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
+	int dir, ret;
+	char buf[4096] = {0};
+	char *result;
+	void *map;
+
+	dir = igt_debugfs_dir(device.fd_xe);
+	ret = igt_debugfs_simple_read(dir, "vrsr_capable",
+				      buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "vrsr_capable node is not present in debugfs.\n");
+	igt_assert_f(strstr(buf, "true"), "VRSR capability is not supported.");
+
+	placement = vram_memory(device.fd_xe, 0);
+	bo = xe_bo_create(device.fd_xe, 0, XE_BO_SIZE, placement, 0);
+	map = xe_bo_map(device.fd_xe, bo, XE_BO_SIZE);
+	memset(map, 0, XE_BO_SIZE);
+
+	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "dgfx_pkg_residencies node is not present in debugfs.\n");
+
+	result = read_content_line(buf, MODS_PREFIX);
+	igt_assert(result);
+	s2idle_start_mods = (uint64_t)strtoull(result, NULL, 10);
+	free(result);
+
+	igt_system_suspend_autoresume(SUSPEND_STATE_FREEZE, SUSPEND_TEST_NONE);
+	munmap(map, XE_BO_SIZE);
+	memset(buf, 0, sizeof(buf));
+	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
+
+	result = read_content_line(buf, MODS_PREFIX);
+	igt_assert(result);
+
+	s2idle_end_mods = (uint64_t)strtoull(result, NULL, 10);
+	free(result);
+
+	igt_assert(s2idle_start_mods != s2idle_end_mods);
+}
+
 igt_main
 {
 	device_t device;
@@ -1040,6 +1133,11 @@ igt_main
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
-- 
2.34.1

