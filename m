Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3734CC83026
	for <igt-dev@archiver.kernel.org>; Mon, 30 Jun 2025 05:11:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D880010E388;
	Mon, 30 Jun 2025 05:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GYKx/Qa0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EACB10E388
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Jun 2025 05:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751260301; x=1782796301;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ynd113BLW1K9lRsBWs7kyPVXtEVlWckDV0oEU9u9zxs=;
 b=GYKx/Qa0+WlSIlIWgrOHlQTeQoIq8b+XhZWyMAn+INAGK4HHb+SbR5EA
 JJ8p1MbFF0khzkvsOpfxHExyGhbc90F/tHRqdt6G1P/cfY19N7gCfT5zp
 7Y3lzNDWq94b/Ilstat86X2z3/krWoIsRUcvhtIIxCqjwXmQ0BLfpf13T
 eM+TPX/OTkPViLlZvaA8i+ao8x9WCtW/LSAiVeq7Q8NTRP8tglWW4oZrF
 nm9yqSycYkHp6RdfFoIjF+24hNhXMIiQiDqxeZuPunVfQf4txBJVmpkYP
 7SW/LuIElPPVT5XtRaHnNDNCnXsypW1FFc+LF1DInXQLtavCUgfCMMoli Q==;
X-CSE-ConnectionGUID: WEqBhW3mSMaXt48NTls7oA==
X-CSE-MsgGUID: LDKYrBYBQR+GRJge+Pq2dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11479"; a="53568214"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="53568214"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 22:11:38 -0700
X-CSE-ConnectionGUID: jzSJgfRzRvitx4rsVgqQTw==
X-CSE-MsgGUID: 28kmP9uYSZ2kOpb1i5B3Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="157742877"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2025 22:11:36 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.poosa@intel.com,
	Sk Anirban <sk.anirban@intel.com>
Subject: [i-g-t,
 v3] tests/intel/xe_pm: Enhance vram-d3cold-threshold test to verify
 VRAM self-refresh
Date: Mon, 30 Jun 2025 10:41:46 +0530
Message-ID: <20250630051145.2572003-2-sk.anirban@intel.com>
X-Mailer: git-send-email 2.43.0
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

Update the vram-d3cold-threshold test to include validation of VRAM
self-refresh (VRSR) functionality, by including checks for VRSR capability
and ModS residency. The test now differentiates between D3Cold and D3Hot
states based on VRAM self-refresh capability.

v2: Buffer size reduced from 4K to 256 and 8 bytes (Karthik)
v3: Update error message (Karthik)

Signed-off-by: Sk Anirban <sk.anirban@intel.com>
---
 tests/intel/xe_pm.c | 49 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 48 insertions(+), 1 deletion(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 7e9324eec..c9582d337 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -144,6 +144,27 @@ static void vram_d3cold_threshold_restore(int sig)
 	close(fd);
 }
 
+static uint64_t read_mods(device_t device)
+{
+	uint64_t mods_value;
+	char buf[256];
+	int dir, ret;
+	char *mods_ptr;
+
+	dir = igt_debugfs_dir(device.fd_xe);
+	igt_assert(dir >= 0);
+	ret = igt_debugfs_simple_read(dir, "gtidle/dgfx_pkg_residencies", buf, sizeof(buf));
+	igt_assert_f(ret >= 0, "Debugfs dgfx_pkg_residencies is not present.\n");
+
+	close(dir);
+
+	mods_ptr = strstr(buf, "Package ModS: ");
+	if (mods_ptr)
+		sscanf(mods_ptr, "Package ModS: %"PRIu64"\n", &mods_value);
+
+	return mods_value;
+}
+
 static bool setup_d3(device_t device, enum igt_acpi_d_state state)
 {
 	igt_require_f(igt_has_pci_pm_capability(device.pci_xe),
@@ -561,10 +582,25 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
 	};
 	uint64_t vram_used_mb = 0, vram_total_mb = 0, threshold;
 	uint32_t bo, placement;
+	int vrsr_capability = 0;
+	uint64_t mods_value = 0;
+	char buf[8];
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
@@ -595,10 +631,21 @@ static void test_vram_d3cold_threshold(device_t device, int sysfs_fd)
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
+			     "GPU couldn't enter ModS!");
+	} else {
+		igt_assert(in_d3(device, IGT_ACPI_D3Hot));
+	}
+
 	igt_assert(igt_pm_get_acpi_real_d_state(device.pci_root) == IGT_ACPI_D0);
 	gem_close(device.fd_xe, bo);
 
-- 
2.43.0

