Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E270DECE564
	for <igt-dev@archiver.kernel.org>; Tue, 10 Sep 2024 05:16:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 648CB10E061;
	Tue, 10 Sep 2024 05:16:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mYUSB+Kr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 457E310E061
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Sep 2024 05:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725945362; x=1757481362;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=aBobaR/H3mWRHCMyn+/DZFheYPbHjDPW3hFHPfYjZJM=;
 b=mYUSB+Kr/YB91d2ouo5wGmLzaHX31cqOTK33gL3aOblPxSGdwy49NyUJ
 LyfVyEzSyN18fJXflI2PnG/3/esA+ReFTv+iCpkzneY6itgBlR974VnKV
 EI53h3daGNEiWGAx9lkocGaHJQIUzCQ84tWltK6W3nMglYW1nXkIJ/cJM
 Yh6wb1YKO+NCRYHw3lRjZxSYb17YI5yOsttYrbK3p/mgFPIv5quBUxkgv
 +pt1Sdjf/fDcdruLwnaGllYFpkdstgtbMeEr9Z2+KYx+ujotgEwFK8q64
 IFWLVGUolbz4R47swOxCNZ/LPq9dK1SkK+kBFa2d5fitvr9pUe0bzePiG g==;
X-CSE-ConnectionGUID: YI6DUSW6S4aZnRTaku4I0w==
X-CSE-MsgGUID: glb70PsmS/GF7Cfs2AGhig==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24538637"
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="24538637"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 22:16:01 -0700
X-CSE-ConnectionGUID: ECY9hSPrQXiPQFWi06eiSA==
X-CSE-MsgGUID: lAlXpHuMSfalYLqtwgHw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,216,1719903600"; d="scan'208";a="97614330"
Received: from jeevanb-desk.iind.intel.com ([10.223.74.192])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2024 22:15:58 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: mitulkumar.ajitkumar.golani@intel.com, bhanuprakash.modem@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH] tests/kms_vrr: Avoid race between freeing display reseources
Date: Tue, 10 Sep 2024 10:59:06 +0530
Message-Id: <20240910052906.206354-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.25.1
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

While freeing display resources, that schedules driver to execute
panel power off, which races while scheduling next immediate test.
giving time after freeing resources allows driver to avoid race
between next non blocking atomic commit and panel power off from
previous test.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_vrr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 36a22eebe..3c6e06a7f 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -410,7 +410,7 @@ do_flip(data_t *data, igt_fb_t *fb)
 {
 	int ret;
 
-	igt_set_timeout(1, "Scheduling page flip\n");
+	igt_set_timeout(2, "Scheduling page flip\n");
 
 	igt_plane_set_fb(data->primary, fb);
 
-- 
2.25.1

