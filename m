Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5937AC47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 10:52:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0933113B28;
	Wed, 31 Jan 2024 10:52:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D53C113B28
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 10:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706698325; x=1738234325;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VTnOqJ3OrqD0qa3IQqwM/6lszHLnb/EEUNB3iORFlZc=;
 b=jfd2+N0vYMcKkK1Uzqg4AXBp4C5ALXoa97ip7NSOPuD6WzTUT6x+7OI/
 3O1T5I6+AjZbXdbtAkiqwbma1PbNM5UvmKI+mX/fFiT3a+oZEeU+xMIM1
 NuFQOhQRkuyBgTr92BYis3+aIT/lbrKGsJUnLHrEd3tDba0+z2n01+PMs
 oL5I/WB8sU4Ax8o55pcyAluuCnjzfyrUvN13YJnNwvoBuv2brZrBtiAz1
 0KWkg6eahP10qnvwjbvzMWfHEtT0LaSmS3WfTnEBrNXhMJT6/RR2PEj0P
 pOuw8S395AhISXGgQS8D4xoO5G/GdQ9dS4P/BghLmgfvGzzE2Ga9FTRZf Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10666479"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10666479"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:52:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911753103"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="911753103"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 02:52:03 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 3/4] lib/intel_blt: Change surface size calculation
Date: Wed, 31 Jan 2024 11:51:47 +0100
Message-Id: <20240131105148.182261-4-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131105148.182261-1-zbigniew.kempczynski@intel.com>
References: <20240131105148.182261-1-zbigniew.kempczynski@intel.com>
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
index 77017f4432..b2286934ce 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1846,13 +1846,21 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
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
+	aligned_height = blt_get_aligned_height(height, tiling);
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

