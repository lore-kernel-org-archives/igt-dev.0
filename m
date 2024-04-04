Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DBCCD1284
	for <igt-dev@archiver.kernel.org>; Thu,  4 Apr 2024 15:41:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D9311323C;
	Thu,  4 Apr 2024 15:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lwtm6Ldg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7717611323C
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Apr 2024 15:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712245306; x=1743781306;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ur7vYxHS4KUwWEgmAmS/2ulM6TjgM3in2iqtCHnUy8E=;
 b=lwtm6LdgTdFi0lvnT8t34ypLskbvChBy2bbLmp9ezKcnNeWdNIcMv3hV
 u5H4/N0ve1FKZyiX+vd+wHXBOLRdlc8cOP/3xlmho8YaFfG+mIoBNM4KP
 rhzs3flT9bZbj1fcQUt1C7NP1Z+KPOy4NsKgcU98TkBz10d3GYqD6L5B+
 4FAQ/X4Bsl+Fp8HCvKmeeJBwfdN6AP1RtpoM4MGor6vmA+ogCvx6BY4ac
 qXRGhdla972+mGNOyIZGvKRZNlLe2p2wKYsc06PWrGTeh4XTiwUnflMkI
 qdCF7h3fueK17ZqG1m57INpm8NEHUbrM3hDZVUF4hsAESb13nUwAqppvb w==;
X-CSE-ConnectionGUID: HmWM+v55RAiCkp2xa06JcQ==
X-CSE-MsgGUID: /PwCF/KJQPqJY2TcNsvjyQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="10510538"
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="10510538"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:41:44 -0700
X-CSE-ConnectionGUID: 1LrAthTORi2kaoC3nrmSKA==
X-CSE-MsgGUID: yB0HtDDHTGe0q2KejODLxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,179,1708416000"; d="scan'208";a="18870185"
Received: from unknown (HELO localhost) ([10.245.246.95])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Apr 2024 08:41:43 -0700
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Subject: [PATCH i-g-t] tests/device_reset: move later skips into subtests
Date: Thu,  4 Apr 2024 17:41:34 +0200
Message-ID: <20240404154134.90603-1-kamil.konieczny@linux.intel.com>
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

Cc: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/device_reset.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/tests/device_reset.c b/tests/device_reset.c
index 583a59039..9b3b8ee6c 100644
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
+	} while(0)
 
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

