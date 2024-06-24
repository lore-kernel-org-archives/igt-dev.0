Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030ABC2D0D1
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 15:18:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0ED10E481;
	Mon, 24 Jun 2024 15:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaH5hbFS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D87D10E481
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 15:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719242318; x=1750778318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OFOJXzWzKcedGfntSIg1ccU0Ek3Uwcwo85EoEJ9HqEI=;
 b=QaH5hbFSla79fxaqUoeh7FbHDaJTxv59DMrzaVywW6u1BQXpWvchxdfr
 OY3chQayXJgOI/aM5dPqWKu6+B9hZu7D9S6KTCL5BQjn3wvQwzusHbBtU
 AE7mwJPEEz9sNzEPWOej0oMYKVmUsJdlLfVqnfNRcuGpfsA/MEorAjbdO
 0z9apHPSmxAJLQGmP/8k7NEuQSHscqV9Jf0YRyJzxkQ9/8w5D3cDveSNy
 ejIK9AGcYUqpr9m2b21Qx+FvLapYJcB/CwBUBKMA4aeYbscJLZea7SaFf
 ttgpNK/RMxo2K3rs0c/WlgK/QTQcwfzcZ0oO78xJ6rT7QRjXX3H9F2aRD g==;
X-CSE-ConnectionGUID: a99riDZOQxWwxKMixzMVYA==
X-CSE-MsgGUID: 9CBhLiOFQ4ul0j3I5BYg7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16184792"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="16184792"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 08:18:37 -0700
X-CSE-ConnectionGUID: ZRndc9k6Shqa6lwdmg43bg==
X-CSE-MsgGUID: Z1TqUp5PSGm6P1xtByk/iA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; d="scan'208";a="66557256"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 08:18:35 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [i-g-t] lib/igt_kms: Format cleanup in DRM mode printing
Date: Mon, 24 Jun 2024 20:40:28 +0530
Message-ID: <20240624151028.205562-1-bhanuprakash.modem@intel.com>
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
 New:- "2880x1800": 60 347710 2880 2928 2960 3040 1800 1803 1809 1906 0x48 0xa

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 2e6f44e3c..1c096ec5b 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1144,13 +1144,13 @@ void kmstest_dump_mode(drmModeModeInfo *mode)
 	const char *stereo = mode_stereo_name(mode);
 	const char *aspect = mode_picture_aspect_name(mode);
 
-	igt_info("  %s %d %d %d %d %d %d %d %d %d 0x%x 0x%x %d%s%s%s%s%s%s\n",
-		 mode->name, mode->vrefresh,
+	igt_info("  \"%s\": %d %d %d %d %d %d %d %d %d %d 0x%x 0x%x %s%s%s%s%s%s\n",
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

