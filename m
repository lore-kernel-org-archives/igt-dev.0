Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7609C53209
	for <igt-dev@archiver.kernel.org>; Mon, 27 Jul 2026 18:33:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACF410E6CA;
	Mon, 27 Jul 2026 18:33:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CiTx+UAz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B14F10E6D1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jul 2026 18:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785177188; x=1816713188;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PiYrnvJyCbf3aGoaQawy+tdAT+ju/m36gka0M1+4dxk=;
 b=CiTx+UAz3tn3UwENKforJu1xPcQTYgh4ZKjzOKvN4iuYsrjhf2sjRHIr
 MDcqokzE+bFFgDWXc6rc9v6wnri3EjKxMDutm1VNaltgZ/q4OqLbRxmHL
 BhMFOVmgP2X8Fxp92ZO0pKavaiy5VSDetOv4mLosZGFj+bCKnmBNDZH/t
 9kxOUD33xBDu3hXRrOZUEVz9y07voxo1b3T6uQkcOl4TfvPFVNbdrtNu2
 j8hDuc00KK0YCeEFIK7MJHyCacZNAh0zGm5E7arKpoEJWdlOQVD4Bzct7
 knqm1oCXHqP6D2mazi6K3ypShCIU1x7Owiive/5dXEqz7PbEK7JKy7WqV A==;
X-CSE-ConnectionGUID: Xdr4xtJMQwiTD/P3OCWD7g==
X-CSE-MsgGUID: HqLkYvBVTn+dnV6F0uz13Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="89422922"
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="89422922"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:33:08 -0700
X-CSE-ConnectionGUID: gadrLan5T3uayNx+43Hg6w==
X-CSE-MsgGUID: gOBD1V+2RQuoP3t65YraaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,188,1779174000"; d="scan'208";a="261461161"
Received: from anirban-z690i-a-ultra-plus.iind.intel.com ([10.190.216.83])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2026 11:33:02 -0700
From: Sk Anirban <sk.anirban@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: anshuman.gupta@intel.com, badal.nilawar@intel.com, riana.tauro@intel.com,
 karthik.poosa@intel.com, raag.jadav@intel.com, soham.purkait@intel.com,
 mallesh.koujalagi@intel.com, Sk Anirban <sk.anirban@intel.com>
Subject: [PATCH v2] tests/intel/xe_pm: include PCI domain in i2c adapter name
Date: Mon, 27 Jul 2026 23:54:22 +0530
Message-ID: <20260727182421.2872627-2-sk.anirban@intel.com>
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

The i2c_designware adapter name only encoded bus and device, which
fails on non-zero PCI domains. Include the full domain/bus/device and
widen the format specifier.
Also fix IGT by using the devfn in the adapter id to match the kernel.

v2: Fix code (Raag)

Link: https://patchwork.freedesktop.org/series/170812/
Signed-off-by: Sk Anirban <sk.anirban@intel.com>
Reviewed-by: Raag Jadav <raag.jadav@intel.com>
---
 tests/intel/xe_pm.c            | 5 +++--
 tests/intel/xe_survivability.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/intel/xe_pm.c b/tests/intel/xe_pm.c
index 6fbc13e43..7faba7c2b 100644
--- a/tests/intel/xe_pm.c
+++ b/tests/intel/xe_pm.c
@@ -866,8 +866,9 @@ static int find_i2c_adapter(device_t device, int sysfs_fd)
 	/* Make sure the /dev/i2c-* files exist */
 	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
 
-	snprintf(adapter, sizeof(adapter), "%s.%hu", "device/i2c_designware",
-		 (device.pci_xe->bus << 8) | (device.pci_xe->dev));
+	snprintf(adapter, sizeof(adapter), "%s.%d", "device/i2c_designware",
+		 (device.pci_xe->domain << 16 | device.pci_xe->bus << 8 |
+		  (device.pci_xe->dev << 3 | device.pci_xe->func)));
 	adapter_fd = openat(sysfs_fd, adapter, O_RDONLY);
 	igt_require_fd(adapter_fd);
 
diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
index 74488bbea..b4f1dfb38 100644
--- a/tests/intel/xe_survivability.c
+++ b/tests/intel/xe_survivability.c
@@ -126,8 +126,9 @@ static int find_i2c_adapter(struct pci_device *pci_xe)
 
 	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
 
-	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
-		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
+	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%d", bus_addr,
+		 "i2c_designware", (pci_xe->domain << 16 | pci_xe->bus << 8 |
+		  (pci_xe->dev << 3 | pci_xe->func)));
 	device_dir = opendir(device_path);
 
 	if (!device_dir)
-- 
2.43.0

