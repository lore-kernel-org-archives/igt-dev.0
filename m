Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4D2C25B79
	for <igt-dev@archiver.kernel.org>; Wed, 15 May 2024 12:20:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A2210E56E;
	Wed, 15 May 2024 12:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kuaHGtpd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7C310E56E
 for <igt-dev@lists.freedesktop.org>; Wed, 15 May 2024 12:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715775605; x=1747311605;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M1R/vENmYfPcV0pPP/Ldk8PqLyMiqSpIqXyDc31gY8Y=;
 b=kuaHGtpd5lR/9xrXl5Cxlw1xjWh+Eon30ZXDNwB0KYRyMndKeNDoQ5kx
 1OgAAZyb96aJTJZhppZZq+Tq1k2osYvX64r2U2yyarssbTcfRUfLKnHso
 2/mYLh169Ki45+7YPDuFHglMXsY+xCIo0LcfTQScajwXvSLOVHUMVVdnM
 r6iikF60K6GG1QbXuvjwVAPYV3naTbso7Y6ucspXKFAsE9hwwRUBGU82p
 sytn8TYz+q5DqC5XHtl0NXkvXGDqYC3zC7ZuU7i/taSeEutdzJTGc4KsA
 Ib02GEaorcSAvJqq/IV/xGkyB4lLfi//c4LFvegxx4/7snVKVoMlePm4R g==;
X-CSE-ConnectionGUID: d4xo28BzREW2s424A6Whqg==
X-CSE-MsgGUID: uyX4IXl2TlKrXOseNGNfrw==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="12036147"
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="12036147"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:04 -0700
X-CSE-ConnectionGUID: c97fI0vNSbKIuz3fsSlU/w==
X-CSE-MsgGUID: NNeTsuT1RAe/FxBr+rOKWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,161,1712646000"; d="scan'208";a="31039691"
Received: from unknown (HELO localhost) ([10.245.246.122])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 05:20:04 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v6 2/9] lib/intel_bufops: Restrict tilings on
 non-flatccs platforms
Date: Wed, 15 May 2024 14:19:42 +0200
Message-Id: <20240515121949.245280-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
References: <20240515121949.245280-1-zbigniew.kempczynski@intel.com>
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

