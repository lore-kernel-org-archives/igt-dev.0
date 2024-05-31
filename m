Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0018C25B7E
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7AB10E21E;
	Fri, 31 May 2024 14:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X0xogRbq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C954010E417
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165509; x=1748701509;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Aw2Z9DIawByTdAr1qvamGMWeobGwHXtEo1puQUInR9Q=;
 b=X0xogRbqX2bE8s0AUiDdoWcin/ow+/MV/yyJcYqWOAN265u3nGBwTZBd
 JzcMsmXKwemXlrj7v9jIJXTOQtI3zabhAGBfC8AHheCIHbf8S7obkuQT3
 eIEe1lhzDHKvb44T0sd5xppLo1mcNFbgIkoerKrjsEqeEnwmh4IbWXo2g
 swqiArpb9HtiFa6fGxHhyHdNSsQymHAbriD1BUaLaTxW06u5Sgq167QBp
 HgfI4OSc61HhVyTtrzvC9jB+Rk6qiSSEsYGrNi8YFjoCZQ40Ovay6SzHi
 HK36jrLzvtLfPEYJWoZuoc7i8vkYMh6/7Bic8Dd5S2hhpBnqqQAZnFJ8j A==;
X-CSE-ConnectionGUID: m49vTuPNRuekfdJkgb5LOQ==
X-CSE-MsgGUID: L0SQAW9hS6STNTGdEJWaLg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113726"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113726"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:33 -0700
X-CSE-ConnectionGUID: EOBhy8P8RVKZus/H1SdL2Q==
X-CSE-MsgGUID: h05VyAIPRGmbYoW/AsUhIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160883"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:30 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:30 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 13/20] tools/intel_vbt_decode: Use .min_bdb_version to
 filter out PSR block on pre-165 VBTs
Date: Fri, 31 May 2024 17:23:47 +0300
Message-ID: <20240531142354.16528-14-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
References: <20240531142354.16528-1-ville.syrjala@linux.intel.com>
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

Block 9 on ALM was something different, then disappeared until
it got repurposed to serve as the PSR block starting from
version 165.

Utilize the new .min_bdb_version to filter out this block on
older VBTs. We'll make more use of this mechanism when we start
decoding the other side of this coin.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index e414a1436a01..a77c1ec3335d 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -1791,10 +1791,6 @@ static void dump_psr(struct context *context,
 	int i;
 	uint32_t psr2_tp_time;
 
-	/* The same block ID was used for something else before? */
-	if (context->bdb->version < 165)
-		return;
-
 	psr2_tp_time = psr_block->psr2_tp2_tp3_wakeup_time;
 	for (i = 0; i < 16; i++) {
 		const struct psr_table *psr = &psr_block->psr_table[i];
@@ -2722,6 +2718,7 @@ struct dumper dumpers[] = {
 	},
 	{
 		.id = BDB_PSR,
+		.min_bdb_version = 165,
 		.name = "PSR block",
 		.dump = dump_psr,
 	},
-- 
2.44.1

