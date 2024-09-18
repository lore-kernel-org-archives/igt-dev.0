Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F1BCCD1A3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58F6C10E586;
	Wed, 18 Sep 2024 12:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RIbClxBV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE5E10E237
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661131; x=1758197131;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=igb6i1mo15BzdJi4oz08+E4M8tVBhpqNB04/FvjsRoM=;
 b=RIbClxBVQ5zPQhTU1ZYhA4EDocemex3uxMj12p8IYhfuOPM2yR/4qQuw
 tFWK35V1R66R6wuNLr8ywV3n5mjdYnjrPBzdHQrYpcdJggiDUhQ0CjHd8
 Au8fJeo3Pb60lfbBMI/hl0XlC+c0cVTy+I17Mm6J4jkZep0TKpNjVt/99
 +lXUoRRbm+xm9MXaLOx0zBVB+49htxhS49I+sZB5qqCUzsGNT0mx7Mfcs
 +Yb4wS79n1am+l8NI7aR+ytjNvFpkuXgguXu37gRSMueUhjCTjI/xRKbM
 0C5DO+Dfd6K1MGo6uqadx318bgqPfFZrJIkyKkOSng2IfLC+jt6Y8pIkv Q==;
X-CSE-ConnectionGUID: ak4ypBLuQQS1Wc2zCBf/+g==
X-CSE-MsgGUID: 891jner3QNq6Z4lDPbtnPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687515"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687515"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:31 -0700
X-CSE-ConnectionGUID: L4htrS3DQk2Sqep2GP3+xw==
X-CSE-MsgGUID: OtmVPBvvQ7eUYhW3+ynAVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634442"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:28 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:27 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 03/18] lib/rendercopy: Use the proper compression
 format for 10bpc on dg2/lnl+
Date: Wed, 18 Sep 2024 15:05:03 +0300
Message-ID: <20240918120518.30258-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
References: <20240918120518.30258-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Setup the dg2/lnl+ compression format correctly for 10bpc formats.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 9c68d3773b19..291ee99fd257 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -150,7 +150,10 @@ static uint32_t lnl_compression_format(const struct intel_buf *buf)
 {
 	switch (buf->bpp) {
 	case 32:
-		return 0x2; /* CMF_R8_G8_B8_A8 */
+		if (buf->depth == 30)
+			return 0x3; /* CMF_R10_G10_B10_A2 */
+		else
+			return 0x2; /* CMF_R8_G8_B8_A8 */
 	default:
 		igt_assert(0);
 		return 0;
@@ -161,7 +164,10 @@ static uint32_t dg2_compression_format(const struct intel_buf *buf)
 {
 	switch (buf->bpp) {
 	case 32:
-		return 0x8;
+		if (buf->depth == 30)
+			return 0xc;
+		else
+			return 0x8;
 	default:
 		igt_assert(0);
 		return 0;
-- 
2.44.2

