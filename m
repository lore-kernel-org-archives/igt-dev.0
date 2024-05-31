Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF4EBC41513
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:25:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4ABD10E4C4;
	Fri, 31 May 2024 14:25:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EF1+QFsT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B74410E458
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165511; x=1748701511;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=irE836EWO73zzLRYlDU/KqQBHUsZ7F5BHnCZEbvJGxQ=;
 b=EF1+QFsTIlEQAd6nab6fwq/eJE9Sw8/zHhzkl5+UVtmypKiVTInkYzwi
 3L8Ax0cXS/ockHkflX4h1+9gL9XFAdRPecTIyYEH1FRwVMthbkI+hOjnt
 woRNaP41QydNjCTQYr3Xs2JXXC6T75HpKiG5RaRXK/j4iXoeEEa4P2jMk
 lA9hQHw8V2v98kGBUeZm930TZ0MFngPsPms93v8rn6pzW6f0CcNVm8PS5
 m5tZsy0/9vX/fYkjWJF5bCpkCM0GsHhsru51e8mgoGZiCg+9O9wOpCXhH
 Brya7rGg9O7AGOlI7HJfAEs0noQYtA0erxxCDGU3rLUMx4+9UeA2HlsMS w==;
X-CSE-ConnectionGUID: gHeEbhqgSPKzWNw0u+O4tw==
X-CSE-MsgGUID: tOpYI2HOTqKjqI8bJAFjuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113740"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113740"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:38 -0700
X-CSE-ConnectionGUID: z5CiWsDxTAiGyjAN9guzJw==
X-CSE-MsgGUID: iAxkz0xDTMOrt8xxibYkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160906"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 15/20] tools/intel_vbt_decode: Use struct
 bdb_sdvo_lvds_dtd
Date: Fri, 31 May 2024 17:23:49 +0300
Message-ID: <20240531142354.16528-16-ville.syrjala@linux.intel.com>
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

Use the full struct bdb_sdvo_lvds_dtd when dumping out the
SDVO LVDS DTD block.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 95ed97c5f499..167b5751ad16 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -316,8 +316,7 @@ static size_t block_min_size(const struct context *context, int section_id)
 	case BDB_SDVO_LVDS_OPTIONS:
 		return sizeof(struct bdb_sdvo_lvds_options);
 	case BDB_SDVO_LVDS_DTD:
-		/* FIXME? */
-		return 0;
+		return sizeof(struct bdb_sdvo_lvds_dtd);
 	case BDB_EDP:
 		return sizeof(struct bdb_edp);
 	case BDB_LFP_OPTIONS:
@@ -1933,13 +1932,11 @@ static void dump_lfp_power(struct context *context,
 static void dump_sdvo_lvds_dtd(struct context *context,
 			       const struct bdb_block *block)
 {
-	const struct bdb_edid_dtd *dvo_timing = block_data(block);
-	int n, count;
+	const struct bdb_sdvo_lvds_dtd *t = block_data(block);
 
-	count = block->size / sizeof(struct bdb_edid_dtd);
-	for (n = 0; n < count; n++) {
+	for (int n = 0; n < ARRAY_SIZE(t->dtd); n++) {
 		printf("%d:\n", n);
-		print_detail_timing_data(dvo_timing++);
+		print_detail_timing_data(&t->dtd[n]);
 	}
 }
 
-- 
2.44.1

