Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E6C2C47DDF
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 10:07:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A130010E9B5;
	Thu,  1 Feb 2024 10:07:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B052910E9B5
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706782059; x=1738318059;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Cu1912CqaNE+ZxMpjKC9eieVh1JEvGWuYoh0utEXjVI=;
 b=Cvk+ASpR4Kthrg6w6zucZ4HDiiMd7fMSIxsC22vBi95R2CoesomxfYJo
 ZPNjh0G3Pe8J30cEyFCoS+kXYTt/LDC+F5zy+ZrTgRkYdmk0xc/jcHmNx
 q2eEKu7+KbnhYkv4EwLy0C3ALrXwtfnCwWD/7j5Kr3S9fO5+Mla451ljR
 n/GwB5sVHLfUNvcYJN2qU81g+RXyElzlAGV1UZU2gk0PVojCbe89Uu+du
 re14ksoj9W5Vt94JZ95wIrCCR4jGqv2F3B7wEyose5OG2ocHuWFM0ZvsB
 ELRdyBW6lscVzCE0EB6FLzlqZDVOppOVuEksuhcUOL6jRgnff/rsWfzXu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="407578740"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="407578740"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="859110813"
X-IronPort-AV: E=Sophos;i="6.05,234,1701158400"; d="scan'208";a="859110813"
Received: from kniesyn-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.112.105])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 02:07:37 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v4 2/5] lib/intel_blt: Change surface size calculation
Date: Thu,  1 Feb 2024 11:07:21 +0100
Message-Id: <20240201100724.257845-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
References: <20240201100724.257845-1-zbigniew.kempczynski@intel.com>
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
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

For tiled surfaces we need to ensure stride and height are valid
from the blit operation perspective. Calculate required surface
size according to tiling constraints.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
---
 lib/intel_blt.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 13b1dbba4f..00208fc243 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1858,13 +1858,21 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
 		  bool create_mapping)
 {
 	struct blt_copy_object *obj;
-	uint64_t size = width * height * bpp / 8;
-	uint32_t stride = tiling == T_LINEAR ? width * 4 : width;
+	uint32_t stride, aligned_height;
+	uint64_t size;
 	uint32_t handle;
 	uint8_t pat_index = DEFAULT_PAT_INDEX;
 
 	igt_assert_f(blt->driver, "Driver isn't set, have you called blt_copy_init()?\n");
 
+	stride = blt_get_min_stride(width, bpp, tiling);
+	aligned_height = blt_get_aligned_height(height, bpp, tiling);
+	size = stride * aligned_height;
+
+	/* blitter command expects stride in dwords on tiled surfaces */
+	if (tiling)
+		stride /= 4;
+
 	obj = calloc(1, sizeof(*obj));
 
 	obj->size = size;
-- 
2.34.1

