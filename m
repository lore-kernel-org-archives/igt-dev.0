Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69988C04FFE
	for <igt-dev@archiver.kernel.org>; Wed,  8 May 2024 12:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076021128CE;
	Wed,  8 May 2024 12:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P4i14DUD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206401128CC
 for <igt-dev@lists.freedesktop.org>; Wed,  8 May 2024 12:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715172910; x=1746708910;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M1R/vENmYfPcV0pPP/Ldk8PqLyMiqSpIqXyDc31gY8Y=;
 b=P4i14DUDZjio8p/tu2tzrDYXf78zmV7VJ787CSR00K1UVUEWX9T8Ahgp
 IaATZ7UoaoCf1Jc99/SyyRHEVnJud7xvKW8Inp0OkwBAbHx4dO1AMpkdc
 /n+3+g6RNnsClEAmdMhe6mq2MMTg/vfu09/qVeIuADtX/uR4c/DVoUFgD
 zHO2FI91bCjqObWR/CHr3TyKB7z4fCK+xdsEJ8aADsA6HukLLDMsnWPmd
 0iV/g8Uo8ZhiupmSk2TuVdwHvspXNpv1FWEfqmpfxj2nONoJnLsR6zKCX
 Y+Ps7czkAhzjB8W7CJsMJG1Y0+sCLSFEOLk+AfNCkdB7pIinGbe/nCmmS Q==;
X-CSE-ConnectionGUID: tcCA7DdYRo6v40pufrlXZw==
X-CSE-MsgGUID: TuhKin9DRGWJSriAyw0dsA==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10865087"
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="10865087"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:55:10 -0700
X-CSE-ConnectionGUID: Qo+i9AHJReKTDJuh4ZSpDA==
X-CSE-MsgGUID: hHzqP15sS9eYjuip1qqODw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,145,1712646000"; d="scan'208";a="33716318"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.90])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2024 05:55:08 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v4 04/11] lib/intel_bufops: Restrict tilings on
 non-flatccs platforms
Date: Wed,  8 May 2024 14:54:36 +0200
Message-Id: <20240508125443.404402-5-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
References: <20240508125443.404402-1-zbigniew.kempczynski@intel.com>
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

JP noticed after last changes introduced in bufops we keep unnecessary
two conditions instead of pack them to single one. This is refactor,
no functional change.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Suggested-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_bufops.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
index 43d6dd5b43..7118272e5f 100644
--- a/lib/intel_bufops.c
+++ b/lib/intel_bufops.c
@@ -896,7 +896,9 @@ static void __intel_buf_init(struct buf_ops *bops,
 
 	size = buf->surface[0].size = buf->surface[0].stride * aligned_height;
 
-	if (compression) {
+	if (compression && !HAS_FLATCCS(buf_ops_get_devid(bops))) {
+		int aux_width, aux_height;
+
 		igt_require(bops->intel_gen >= 9);
 		igt_assert(req_tiling == I915_TILING_Y ||
 			   req_tiling == I915_TILING_Yf ||
@@ -907,17 +909,12 @@ static void __intel_buf_init(struct buf_ops *bops,
 		 * CCS units, that is 4 * 64 bytes. These 4 CCS units are in
 		 * turn mapped by one L1 AUX page table entry.
 		 */
+		aux_width = intel_buf_ccs_width(bops->intel_gen, buf);
+		aux_height = intel_buf_ccs_height(bops->intel_gen, buf);
 
-		if (!HAS_FLATCCS(intel_get_drm_devid(bops->fd))) {
-			int aux_width, aux_height;
-
-			aux_width = intel_buf_ccs_width(bops->intel_gen, buf);
-			aux_height = intel_buf_ccs_height(bops->intel_gen, buf);
-
-			buf->ccs[0].offset = buf->surface[0].stride * ALIGN(height, 32);
-			buf->ccs[0].stride = aux_width;
-			size = buf->ccs[0].offset + aux_width * aux_height;
-		}
+		buf->ccs[0].offset = buf->surface[0].stride * ALIGN(height, 32);
+		buf->ccs[0].stride = aux_width;
+		size = buf->ccs[0].offset + aux_width * aux_height;
 	}
 
 	/* Store buffer size to avoid mistakes in calculating it again */
-- 
2.34.1

