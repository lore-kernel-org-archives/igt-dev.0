Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7071C54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 18:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFA710E00C;
	Tue, 27 May 2025 18:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CuRRwLZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694CC10E00C
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 18:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748371649; x=1779907649;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IuVG2J3YpaBDFYO90ey83HCyC3JH2Z2XeuEHZ7ZUZ9M=;
 b=CuRRwLZklyv1onG749s223SS8BoQWynCaJVUQIG8rahbQWIKV3N921ly
 dR73FoFISKgzs7vwVwyH9GiXwv9s1fsFUWxMCYlSijAcu1xt/XyX9WX6t
 EAyonzB8KjNUtvwO0u9eN8H7g3PgQ0xbBuktcD6558BXTbvDBlWMMTL8N
 uliLHdUg1HYufkDhBHltG/OU/g1llx3F/Muj9a6WpAKNDLt6FkUdMhfar
 J+//GE1b5Y0OeKLD1gjBgsZDsyECs4uNINHlA7JeqWn+LyGUIMa5hYvlM
 qRZgQC6mMl/061mBtUjQ5z/IBzLFUk1ZjRcQUCs0I5vK/Y5AktA+kmILS A==;
X-CSE-ConnectionGUID: 1F6Jeb1eSVqEa+t2f90p3A==
X-CSE-MsgGUID: KsjrfY48QPS0savb3cdUkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11446"; a="50537375"
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="50537375"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:47:29 -0700
X-CSE-ConnectionGUID: byjdEuU1TfmOAwlVAQHxuw==
X-CSE-MsgGUID: IItkG+jqS9uYn0KdCVZRsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,319,1739865600"; d="scan'208";a="143277499"
Received: from unknown (HELO anirban-Z690I-A-ULTRA-PLUS.iind.intel.com)
 ([10.190.216.83])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2025 11:47:26 -0700
From: sk.anirban@intel.com
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, ravi.kishore.koppuravuri@intel.com,
 Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t] tests/intel/xe_pm: Enhance vram-d3cold-threshold test to
 verify VRAM self-refresh
Date: Wed, 28 May 2025 00:09:57 +0530
Message-Id: <20250527183957.4137136-1-sk.anirban@intel.com>
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

From: Sk Anirban <sk.anirban@intel.com>

Update the vram-d3cold-threshold test to include validation of
VRAM self-refresh functionality. It introduces checks for VRAM
self-refresh capability and verifies the ModS residency to ensure
accurate self-refresh behavior.
The test now distinguishes between D3Cold and D3Hot states based on
VRAM self-refresh capability.

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm.c | 51 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 6eb21d5ec..f8074a9c6 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -144,6 +144,29 @@ static void vram_d3cold_threshold_restore(int sig)
 	close(fd);
 }
 
+static uint64_t read_mods(device_t device)
+{
+	uint64_t mods_value;
+	char buf[4096];
+	int dir, ret;
+	char *mods_ptr;
+
+	dir = igt_debugfs_dir(device.fd_xe);
+	igt_assert(dir >= 0);
+
+	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
+
+	close(dir);
+
+	mods_ptr = strstr(buf, "Package ModS: ");
+
+	if (mods_ptr)
+		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n", &mods_value);
+
+	return mods_value;
+}
+
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
 	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
@@ -561,10 +584,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	};
 	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
 	uint32_t bo, placement;
+	int vrsr_capability = 0;
+	uint64_t mods_value = 0;
+	char buf[4096];
+	int dir, ret;
 	bool active;
 	void *map;
 	int i;
 
+	dir = igt_debugfs_dir(device.fd_xe);
+	igt_assert(dir >= 0);
+
+	ret = igt_debugfs_simple_read(dir, "vrsr_capable",
+				      buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Debugfs vrsr_capable is not present.\n");
+	close(dir);
+
+	if (strstr(buf, "true"))
+		vrsr_capability = 1;
+
 	igt_require(xe_has_vram(device.fd_xe));
 
 	placement = vram_memory(device.fd_xe, 0);
@@ -595,10 +633,21 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	munmap(map, SIZE);
 	set_vram_d3cold_threshold(sysfs_fd, threshold);
 
+	if (vrsr_capability)
+		mods_value = read_mods(device);
+
 	/* Setup D3Cold but card should be in D3hot */
 	igt_assert(setup_d3(device, IGT_ACPI_D3Cold));
 	sleep(1);
-	igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	if (vrsr_capability) {
+		igt_assert(in_d3(device, IGT_ACPI_D3Cold));
+		mods_value = read_mods(device) - mods_value;
+		igt_assert_f(mods_value > 0,
+			     "Mods residency is inaccurate: %"PRIu64"\n", mods_value);
+	} else {
+		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	}
+
 	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D0);
 	gem_close(device.fd_xe, bo);
 
-- 
2.34.1

