Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCF4C48286
	for <igt-dev@archiver.kernel.org>; Thu,  1 Feb 2024 20:03:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7136A10EC36;
	Thu,  1 Feb 2024 20:03:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P69ooUMM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB5F10EC36
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2024 20:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706817811; x=1738353811;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UTKHp8ZXjnsgm+IW6tcBnucZIRogFYI5iz7AdewFNk8=;
 b=P69ooUMMlbDclaAX7K8yoZ/9UrnWVDFcoKq8Nw1yC3CM0HsV89XV2vN2
 YiXOv9yqH3jWns5GcqQ0ldK5tK7iDdyWmvLjJFG/yKlqFS+ZxpeQW5tVn
 1caMZuFHfmOHIw/p2vXH8v+c7Q1nmkyXs8lvfpwvYbSEJl8ZevY046G/s
 eH4nusQbP+sESvSuC2Q2iY1ikqQgkklQq3OGnkiRDvAuNEjTWMeSipkbt
 KoXieDzKeynYEqLmgtcvRNztYzjHNe+o65GXzM28dJm9fFSO5nLVnUHFl
 7uvRpSeBr6Ud010sO+wNpEa1dcZJFepC29BhCbbVEQYmRl5+hCy91fG0h w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="3855426"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="3855426"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:03:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="30690625"
Received: from unknown (HELO localhost) ([10.245.85.128])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 12:03:29 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, 
 Karolina Drobnik <karolina.drobnik@intel.com>,
 Karolina Stolarek <karolina.stolarek@intel.com>
Subject: [PATCH i-g-t v5 2/5] lib/intel_blt: Change surface size calculation
Date: Thu,  1 Feb 2024 21:03:09 +0100
Message-Id: <20240201200312.428474-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201200312.428474-1-zbigniew.kempczynski@intel.com>
References: <20240201200312.428474-1-zbigniew.kempczynski@intel.com>
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

For tiled surfaces we need to ensure stride and height are valid
from the blit operation perspective. Calculate required surface
size according to tiling constraints.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
Cc: Karolina Drobnik <karolina.drobnik@intel.com>
Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>
---
 lib/intel_blt.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/lib/intel_blt.c b/lib/intel_blt.c
index 755e708f15..315ae86922 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1859,13 +1859,21 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
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

