Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A71C47258
	for <igt-dev@archiver.kernel.org>; Wed, 31 Jan 2024 13:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D8E10E210;
	Wed, 31 Jan 2024 13:26:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CABF810E210
 for <igt-dev@lists.freedesktop.org>; Wed, 31 Jan 2024 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706707573; x=1738243573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MNx210itE5cLAbRHF6tsumJS8qnPFfoMzYi7uvpIAUo=;
 b=D9GRM/0eWLM+Z/DASYStsLVK0ccaFrYlndM07uurQ9XGQMYo3UO2tADe
 1fElZuFiJ4SHZXyeEg3w8N2Gxzkn1iN6kW6GliwzgiM/ThFSQPKgeiE5P
 C9vnxBvEyz1+03lPHSnEVJZ47ivzWhkpApfQJoujrk7q/zrH7hfwlaZgl
 hqL+BRrjc3qCQVZ0vKUNqa6FIS6SF+3rH/0BwEny0YVNYJIZdOGSZMlqT
 BMXbwcbo3C1cxZTCLQDgYpdBdHiFipe2omWla+8KI1f3VvPOhR2o8mrJn
 BfmBlzFxnfTnC0HYNKFBNDZYmdbTiCm5xznIzUEm8QkVjyGWRFTyF1D2H A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="10984144"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="10984144"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:26:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911787064"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; d="scan'208";a="911787064"
Received: from mmackowi-mobl.ger.corp.intel.com (HELO localhost)
 ([10.246.18.126])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2024 05:26:10 -0800
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 2/4] lib/intel_blt: Change surface size calculation
Date: Wed, 31 Jan 2024 14:25:56 +0100
Message-Id: <20240131132558.208971-3-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240131132558.208971-1-zbigniew.kempczynski@intel.com>
References: <20240131132558.208971-1-zbigniew.kempczynski@intel.com>
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
index 6d1aa0608f..2076cb56c4 100644
--- a/lib/intel_blt.c
+++ b/lib/intel_blt.c
@@ -1857,13 +1857,21 @@ blt_create_object(const struct blt_copy_data *blt, uint32_t region,
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

