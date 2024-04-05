Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB42CD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 12:56:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B897113BD3;
	Fri,  5 Apr 2024 12:56:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V+h7BQ2Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F347113BD1
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 12:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712321772; x=1743857772;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HpBAX9ccDBrcnEoqD5oWdjdGOc1vXWl8BWL/IPl19Ks=;
 b=V+h7BQ2QqfDGboJ5sQ0zBMS7YzGEwg2owENn5TSAQgHI9lqDcev57H6a
 KTi/AjSiS6G0lbJkMTVe8s3bkjAVTNRpD9p/GGp6DmgIrc311/u6zW9lE
 UAIv1+hL1SPFdhvh53QREvcJ5NA5dErujRlbURYFVf2YfIcWBhFJjh4lE
 X4tsmpi7xuzfi7OS7gW+d/i98y1gzj1X564QkCuL1Kh0jYBgKeKUJMA5C
 ELNUXEA5O+3fvnvju3pnKiRbbpRiEq3WDXIuZW4TJc6IggE4+lPNS3i8L
 dBGZ380tFRDPCb1rBi2EomwMITS3Ma3WUYMcmEtQ2Uqfs5hFO/LRxrv8a Q==;
X-CSE-ConnectionGUID: TkX2lXzKSvCYm0y2jZvO3w==
X-CSE-MsgGUID: jg8F6SplR2eYOu1w/ptUOA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7775553"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7775553"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:56:11 -0700
X-CSE-ConnectionGUID: VA1ZepRwRY2wc5uE5E/x+g==
X-CSE-MsgGUID: yLBRNyD3QZGxP6LpeZICzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19011003"
Received: from unknown (HELO localhost) ([10.245.246.109])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 05:56:10 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH i-g-t] tests/device_reset: move later skips into subtests
Date: Fri,  5 Apr 2024 14:56:05 +0200
Message-ID: <20240405125605.10425-1-kamil.konieczny@linux.intel.com>
X-Mailer: git-send-email 2.42.0
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

It is safe to use skips just after igt_main() for skipping all
subtests but later on they produce logs and even if CI will
ignore that, such logs can mislead developers reading them.

Move a skip from middle of igt_main() code block into subtests
which needed them.

v2: add space after while (Kamil)

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/device_reset.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 583a59039..de9e9d8c9 100644
--- a/tests/device_reset.c
+++ b/tests/device_reset.c
@@ -424,22 +424,25 @@ igt_main
 		healthcheck(&dev);
 	}
 
-	igt_subtest_group {
-		igt_fixture {
-			igt_skip_on_f(dev.fds.slot_dir < 0, "Gfx Card does not support any "
-				      "pcie slot for cold reset\n");
-			igt_skip_on(!is_sysfs_cold_reset_supported(dev.fds.slot_dir));
-		}
+#define SKIP_IF_NO_COLD_RESET(slot_dir) \
+	do { \
+		igt_skip_on_f(slot_dir < 0, "Gfx Card does not support any " \
+			      "pcie slot for cold reset\n"); \
+		igt_skip_on(!is_sysfs_cold_reset_supported(slot_dir)); \
+	} while (0)
 
+	igt_subtest_group {
 		igt_describe("Unbinds driver from device, initiates cold reset"
 			     " then rebinds driver to device");
 		igt_subtest("unbind-cold-reset-rebind") {
+			SKIP_IF_NO_COLD_RESET(dev.fds.slot_dir);
 			unbind_reset_rebind(&dev, COLD_RESET);
 			healthcheck(&dev);
 		}
 
 		igt_describe("Cold Resets device with bound driver");
 		igt_subtest("cold-reset-bound") {
+			SKIP_IF_NO_COLD_RESET(dev.fds.slot_dir);
 			initiate_device_reset(&dev, COLD_RESET);
 			/*
 			 * Cold reset will initiate card boot sequence again,
-- 
2.42.0

