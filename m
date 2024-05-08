Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 571C5C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 16:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0887D112EAF;
	Wed,  8 May 2024 16:45:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RY406KUM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669CE112EAF
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 16:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715186757; x=1746722757;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zrk6ZcNYfSYYoDMab7SvkOWs31e7M73gX/q+Di/j4+8=;
 b=RY406KUMP3B/N0Woy8XKQUTS5icYDMLChBNadMIM/DxQIGQZNZZ0HKYQ
 Z3Hxii3z/zzZu6eduUTo2HcVuvZND01Mwv8KrR6V2zeu/rYbt6IhGnrd7
 hhpOwLeq6ZEzUx4SRB0fwCELJ01ofo75ZvLdYjDkjemSYKe8InG0Spful
 yy6fyfmifWe3ncTphkTzfnpxuSD3kngyXD5nIVbFCwxQGjsmdwKQZJpq6
 YORo3OIwl9fJoS44yxh63ujcwhgzspVSOqHi2APphQ95bwZhcYr14aERn
 S6arFDih9Yk7ee5dEG6a+pzNa7sHL8wj/7hvZrdkkL0jad6c/HgM4Z49i Q==;
X-CSE-ConnectionGUID: 5aWXhmbNQaKGA1m5sFysog==
X-CSE-MsgGUID: HjeeHR3tQDafNO5TnO6INA==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11000458"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="11000458"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 09:45:57 -0700
X-CSE-ConnectionGUID: 0slAaPQBQuif1KkXJrR4SA==
X-CSE-MsgGUID: NtVv3/C7TW+E1uPRpp447g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33638385"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.68])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 09:45:55 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>,
 =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH v5 i-g-t] tests/device_reset: move later skips into subtests
Date: Wed,  8 May 2024 18:45:50 +0200
Message-ID: <20240508164550.52434-1-kamil.konieczny@linux.intel.com>
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
v5: correct function behaviour after name change (Kamil)

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Cc: "Zbigniew Kempczyński" <zbigniew.kempczynski@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 tests/device_reset.c | 46 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 583a59039..6a63a5925 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -299,6 +299,39 @@ static bool is_sysfs_cold_reset_supported(int slot_fd)
 	return true;
 }
 
+/**
+ * has_cold_reset:
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
+		return false;
+	}
+
+	if (!is_sysfs_cold_reset_supported(slot_dir)) {
+		if (reason)
+			*reason = not_supported;
+
+		return false;
+	}
+
+	return true;
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

