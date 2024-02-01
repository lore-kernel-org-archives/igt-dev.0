Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738E7C4828D
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 17:18:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D66B10EF48;
	Thu,  1 Feb 2024 17:18:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="czE2pXz6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A96B110EF48
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706807930; x=1738343930;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eBSd0yHwZIDLnGXfS8hGt1yJ9Zt7YIVgwG1ARotsSk4=;
 b=czE2pXz6Hk9xHyipjwRatrgzixKygrvyRPKyFyhaPOn3JhjhrDpVpqld
 reHjJ0w2UeRaerAxBQyex5f63VFWXmMzHqJ4BRMND8+AVwwCoksQ6A05s
 5F8Gu7gGv/ydgirEGawQOT73asehZDoL12LMcqDzm5wbdlYFO1n6d7GbA
 rn+ypZkr2uLLZ9nv1EiOC1MH/FJXBZQ3v/zgN2Olcpv8dPrPHDOA5wZhy
 J09e54RlOmoZUgfVNBUPIfU5dgnb4oSl0Smuo+07wlGN/l+wYLIe2qtWR
 EEZN4tozTx5DdaYjfHs2jaVb6UF2Sr1V9nsizlGJs6HQ8OkizQs5MeOPa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="11323975"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="11323975"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:18:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="23152956"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 09:18:47 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t v2] lib/rendercopy_gen9: Fix Xe2 missing pixels on
 non-modulo-16 surfaces
Date: Thu,  1 Feb 2024 18:18:40 +0100
Message-Id: <20240201171840.412905-1-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
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

Missing setting Kernel0Enable bit results in lack of rasterization
of right and bottom part of the surface. Fix this as kms tests depends
on that.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Tested-by: Jouni Högander <jouni.hogander@intel.com>
---
v2: set Kernel0Enable bit only on Xe2+ keeping older platforms intact
---
 lib/rendercopy_gen9.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index bdfd9be087..a4220d78da 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -863,7 +863,10 @@ gen8_emit_ps(struct intel_bb *ibb, uint32_t kernel, bool fast_clear) {
 	intel_bb_out(ibb, 0);
 
 	intel_bb_out(ibb, GEN7_3DSTATE_PS | (12-2));
-	intel_bb_out(ibb, kernel);
+	if (AT_LEAST_GEN(intel_get_drm_devid(ibb->fd), 20))
+		intel_bb_out(ibb, kernel | 1);
+	else
+		intel_bb_out(ibb, kernel);
 	intel_bb_out(ibb, 0); /* kernel hi */
 
 	if (fast_clear)
-- 
2.34.1

