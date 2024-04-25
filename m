Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F77C4345F
	for <igt-dev@archiver.kernel.org>; Thu, 25 Apr 2024 14:05:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EF8E112072;
	Thu, 25 Apr 2024 14:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AxMr4nDT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2BD112072
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2024 14:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714053952; x=1745589952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4CsjKMJUvp1HYQUHoqmoDK7VPRiAIDw88RyBBisSQa4=;
 b=AxMr4nDTFZADwd0QhgjFOp75IA/RaA+2BzKyLXFbPiM5loy+Z1GNSQUO
 zMm0giUgCdTQcNyheBsxMrdIGXQeShLGsbJzkBFG3FJlOmjDALvjVMj5M
 VGxmn0DCC8rHlfAxGEZv5DlPYVgt9Wh4zMBJoWtPbt5J3akBPLmRCGJHe
 yiLKVeWtVgo2VozjYH+AKZspOwMa4XrZo/CBKbXZuVubT1hwq9R2q9M2I
 DiK5xWWHobHBS2UmbmjaWuf2Z5Zq5fjkxdmUpDhDxSGUTQxfv3Z18l9Xp
 TVi2Z9ttsYazzcA7pyTEYZTZbwm2MqnsH+KbWUZgzx2D+cWgfbJKisIOU A==;
X-CSE-ConnectionGUID: SdW9Cy9TSwuhd1I+KW4QCg==
X-CSE-MsgGUID: URKmwJpwTU+iTmsxf0r2og==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="20894739"
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="20894739"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:05:52 -0700
X-CSE-ConnectionGUID: rHsoWE9qSRurUVQ2XyjAFA==
X-CSE-MsgGUID: LiaUuYJsS8GaxAUye3dF4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,229,1708416000"; d="scan'208";a="25567888"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.53])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Apr 2024 07:05:51 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t] tests/device_reset: move later skips into subtests
Date: Thu, 25 Apr 2024 16:05:44 +0200
Message-ID: <20240425140544.41750-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

It is safe to use skips just after igt_main() for skipping all
subtests but later on they produce logs and even if CI will
ignore that, such logs can mislead developers reading them.

Move a skip from middle of igt_main() code block into subtests
which needed them.

v2: add space after while (Kamil)
v3: remove macro in favor of function (Zbigniew)

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/device_reset.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 583a59039..09558ff20 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -299,6 +299,29 @@ static bool is_sysfs_cold_reset_supported(int slot_fd)
 	return true;
 }
 
+/**
+ * cold_reset_not_supported:
+ * @fd: opened sysfs pci slot descriptor
+ *
+ * Check if device supports cold reset based on slot dir or sysfs file presence.
+ *
+ * Returns:
+ * NULL if device supports cold reset, otherwise a string description
+ */
+static const char *cold_reset_not_supported(int slot_dir)
+{
+	static const char *no_slot = "Gfx Card does not support any pcie slot for cold reset";
+	static const char *not_supported = "Gfx Card does not support cold reset";
+
+	if (slot_dir < 0)
+		return no_slot;
+
+	if (!is_sysfs_cold_reset_supported(slot_dir))
+		return not_supported;
+
+	return NULL;
+}
+
 /* Unbind the driver from the device */
 static void driver_unbind(struct device_fds *dev)
 {
@@ -424,22 +447,23 @@ igt_main
 		healthcheck(&dev);
 	}
 
-	igt_subtest_group {
-		igt_fixture {
-			igt_skip_on_f(dev.fds.slot_dir < 0, "Gfx Card does not support any "
-				      "pcie slot for cold reset\n");
-			igt_skip_on(!is_sysfs_cold_reset_supported(dev.fds.slot_dir));
-		}
 
+	igt_subtest_group {
 		igt_describe("Unbinds driver from device, initiates cold reset"
 			     " then rebinds driver to device");
 		igt_subtest("unbind-cold-reset-rebind") {
+			const char *reason = cold_reset_not_supported(dev.fds.slot_dir);
+
+			igt_skip_on_f(reason, "%s\n", reason);
 			unbind_reset_rebind(&dev, COLD_RESET);
 			healthcheck(&dev);
 		}
 
 		igt_describe("Cold Resets device with bound driver");
 		igt_subtest("cold-reset-bound") {
+			const char *reason = cold_reset_not_supported(dev.fds.slot_dir);
+
+			igt_skip_on_f(reason, "%s\n", reason);
 			initiate_device_reset(&dev, COLD_RESET);
 			/*
 			 * Cold reset will initiate card boot sequence again,
-- 
2.42.0

