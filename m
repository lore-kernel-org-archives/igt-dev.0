Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30A8C4345F
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 17:36:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59792112530;
	Fri, 26 Apr 2024 17:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c/ZupcsL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F392A112530
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 17:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714152973; x=1745688973;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=c9/7qrq7SCQWhFbgoI8reMRH9oVvfeSJh9fn/xt9gk0=;
 b=c/ZupcsL4B398IOrydkZGLmosj2NNCuaDITwV4JzVXEoC7yTO3zfS0II
 2svOM4RCj3UdLbhRMXUXYhvNY6Bg5INgsd/aO++CGBnVzP8HN+/7kGea7
 eZLDRDWfuEgaQ6/XVqlj29MupQ5HgZBdf5ObHaSqS+S+0y149LJFW4faX
 OXOX1I+xXiLVyWIy2W7esmfwfArUMFbX5GsXa3dDUFBTEpTOdO4dwNmHt
 jS7F1pH9D6jkRy1ODkUgF5ZXMR4/wWwqQ4hxt3rnZZRkrs5dOsxgEOSdJ
 3jhGwzOHhZJ9uBOwRexoOgH9VTtnVpGHFLAY+IX4Qn2G0nOY4FBqApUjk w==;
X-CSE-ConnectionGUID: eWlse2C3TtmGeqcRHoo/FA==
X-CSE-MsgGUID: RvaB1Vq1T++vMEGRJ95QAA==
X-IronPort-AV: E=McAfee;i="6600,9927,11056"; a="10057074"
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="10057074"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 10:36:12 -0700
X-CSE-ConnectionGUID: C85iREDGSDecmbdP3olssw==
X-CSE-MsgGUID: cDezOSV5QjSD6Y8yL2Nzqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,233,1708416000"; d="scan'208";a="26121256"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.64])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 10:36:11 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH v4 i-g-t] tests/device_reset: move later skips into subtests
Date: Fri, 26 Apr 2024 19:35:59 +0200
Message-ID: <20240426173559.46528-1-kamil.konieczny@linux.intel.com>
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
v4: rename function and make it compact (Zbigniew)

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/device_reset.c | 46 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 583a59039..b8b292513 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -299,6 +299,39 @@ static bool is_sysfs_cold_reset_supported(int slot_fd)
 	return true;
 }
 
+/**
+ * cold_reset_not_supported:
+ * @fd: opened sysfs pci slot descriptor
+ * @reason: fail description
+ *
+ * Check if device supports cold reset based on slot dir or sysfs file presence.
+ *
+ * Returns:
+ * false if cold reset not supported, also writes a reason for it
+ * true if supported
+ */
+static bool has_cold_reset(int slot_dir, const char **reason)
+{
+	static const char *no_slot = "Gfx Card does not support any pcie slot for cold reset";
+	static const char *not_supported = "Gfx Card does not support cold reset";
+
+	if (slot_dir < 0) {
+		if (reason)
+			*reason = no_slot;
+
+		return true;
+	}
+
+	if (!is_sysfs_cold_reset_supported(slot_dir)) {
+		if (reason)
+			*reason = not_supported;
+
+		return true;
+	}
+
+	return false;
+}
+
 /* Unbind the driver from the device */
 static void driver_unbind(struct device_fds *dev)
 {
@@ -424,22 +457,23 @@ igt_main
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
+			const char *reason;
+
+			igt_skip_on_f(!has_cold_reset(dev.fds.slot_dir, &reason), "%s\n", reason);
 			unbind_reset_rebind(&dev, COLD_RESET);
 			healthcheck(&dev);
 		}
 
 		igt_describe("Cold Resets device with bound driver");
 		igt_subtest("cold-reset-bound") {
+			const char *reason;
+
+			igt_skip_on_f(!has_cold_reset(dev.fds.slot_dir, &reason), "%s\n", reason);
 			initiate_device_reset(&dev, COLD_RESET);
 			/*
 			 * Cold reset will initiate card boot sequence again,
-- 
2.42.0

