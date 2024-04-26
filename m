Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE71CC19F53
	for <igt-dev@archiver.kernel.org>; Fri, 26 Apr 2024 09:02:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F333410F075;
	Fri, 26 Apr 2024 09:02:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dNZOREko";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AB210F013
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2024 09:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714122117; x=1745658117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b+V0ysQ3s21uWD/XMzBvgpfWmbp8zHK8J1MHJPNlxVo=;
 b=dNZOREkojm+TTF2GxrgHRhf1F6qYA+ydz8Y1cH1VsrVAB1kECx0bwVwU
 nVe2yTIps8bnL8oQUq7zwbsFlAlV2JIWtjSzWgD1a3VMueRTjJ4Zh8bWH
 wylT5Unj6y2kHt7ZCgdAXDpJdLawMkZOlDRiT/WrWq9Mmfe9eOVM33s7q
 3PVlqr3r4imuVxAUKUrIKAUt1a8bWFtyQL/z0ICcn8HdfapbOtkfRUGJG
 GPHwCypbi46gStroJofqlu1qsW788ZIglaD2fyEQ3B9nmGU2TQpHv0/hi
 A7CZhBd3G2FQklcWF/VRmi37/3jBsBXLo1IGCeHJ76WCNlM5uJ1FLhUoL Q==;
X-CSE-ConnectionGUID: CAatFbjiSLyCNz6PXncwUw==
X-CSE-MsgGUID: q1qlOSDzSTy5eZNtvVTosA==
X-IronPort-AV: E=McAfee;i="6600,9927,11055"; a="9717802"
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; 
   d="scan'208";a="9717802"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:47 -0700
X-CSE-ConnectionGUID: atUnhyAJQRmWzglcXrTR8Q==
X-CSE-MsgGUID: 5as3SRmrSautDreX5SkBZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,232,1708416000"; d="scan'208";a="25402869"
Received: from mklonows-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.61])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2024 02:01:46 -0700
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: [PATCH i-g-t v2 06/10] lib/rendercopy_gen9: Allow to use all tilings
 on flatccs platforms
Date: Fri, 26 Apr 2024 11:01:13 +0200
Message-Id: <20240426090117.78060-7-zbigniew.kempczynski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
References: <20240426090117.78060-1-zbigniew.kempczynski@intel.com>
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

Instead of limiting compression to Tile4 lets enable it for any
tiling when platform has flatccs area. For integrated leave Tile4
condition to properly configure compression on those platforms.

Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
---
 lib/rendercopy_gen9.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 7c7563d50c..c73f815efc 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -268,7 +268,7 @@ gen9_bind_buf(struct intel_bb *ibb, const struct intel_buf *buf, int is_dst,
 			ss->ss13.clear_address_hi = (address + buf->cc.offset) >> 32;
 		}
 
-		if (HAS_4TILE(ibb->devid)) {
+		if (HAS_4TILE(ibb->devid) || HAS_FLATCCS(ibb->devid)) {
 			ss->ss7.dg2.memory_compression_type = 0;
 			ss->ss7.dg2.memory_compression_enable = 0;
 			ss->ss7.dg2.disable_support_for_multi_gpu_partial_writes = 1;
-- 
2.34.1

