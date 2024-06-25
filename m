Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16FBAC2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 04:07:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F2BC10E1DD;
	Tue, 25 Jun 2024 04:07:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QCVsWugV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20A5E10E1DD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 04:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719288435; x=1750824435;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bAu6kuk5NXwN4ZhOurT4t1Mehx00feUaBhhL0SUw9wI=;
 b=QCVsWugVwZXE31ZjRQO26xwvSZiybQmmC2bM37EFZnMgMCIxuR2B4I9J
 KWSOFiK4T/f6nFp2uA7ie0TqV4xFQxZnwG+tgXeAoRVY5tdUzceu7BcSH
 Up9Uul6On2BQmPSPnjRgFw7ZLQbLfs7BPSpTB08UiqXBbq0XxStQx3Kbh
 2axsU6NLSHMi4N6kMrfIa2SfILMbTUM4vVkybqLif4Q+ah5v+udpxRAHM
 mlvBGEdlCpNmHkPRK35vK0CHuPsh12ex8ylw9lKT7y93a/+CHxSbfeTWV
 EyxVhFD4JPHWO4HeMYmcr0NqwrHYAYbVt9bHDngfjYBZW2j/CVFUDKkDp Q==;
X-CSE-ConnectionGUID: dUDXYUySQUaWD1CzWVupHA==
X-CSE-MsgGUID: okSjCXoQSiO19N55vCgfyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16110858"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16110858"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:07:08 -0700
X-CSE-ConnectionGUID: 6opy2jutSRaj2WVnvCYpTA==
X-CSE-MsgGUID: XrcZLKywQySCYeBJweQrvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="43319041"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:07:06 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V2] lib/igt_kms: Format cleanup in DRM mode printing
Date: Tue, 25 Jun 2024 09:28:56 +0530
Message-ID: <20240625035856.230338-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

While printing the DRM mode, align the style with the
Kernel logs, so that it would be easy to compare & debug.

Example:
 Old:- 2880x1800 60 2880 2928 2960 3040 1800 1803 1809 1906 0xa 0x48 347710
 New:- 2880x1800: 60 347710 2880 2928 2960 3040 1800 1803 1809 1906 0x48 0xa

V2:
- Minor cleanup (Jeevan)

Cc: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2e6f44e3c..174bbe6c4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1144,13 +1144,13 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
 	const char *stereo = mode_stereo_name(mode);
 	const char *aspect = mode_picture_aspect_name(mode);
 
-	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x %d%s%s%s%s%s%s\n",
-		 mode->name, mode->vrefresh,
+	igt_info("  %s: %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x %s%s%s%s%s%s\n",
+		 mode->name, mode->vrefresh, mode->clock,
 		 mode->hdisplay, mode->hsync_start,
 		 mode->hsync_end, mode->htotal,
 		 mode->vdisplay, mode->vsync_start,
 		 mode->vsync_end, mode->vtotal,
-		 mode->flags, mode->type, mode->clock,
+		 mode->type, mode->flags,
 		 stereo ? " (3D:" : "",
 		 stereo ? stereo : "", stereo ? ")" : "",
 		 aspect ? " (PAR:" : "",
-- 
2.43.2

