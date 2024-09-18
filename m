Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4555CCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B4E10E237;
	Wed, 18 Sep 2024 12:05:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XkD7hhO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5953B10E237
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661134; x=1758197134;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RgyEnXfN/895jCyVaE7bIx3U+XvcUQ7D94GfM0kwu9A=;
 b=XkD7hhO5EGRPbcilfjmmsB+MsFuFdaYTZ3czsYYxFFHanguylvfGI9TT
 pczgft/w9X6SQzpDqjyIYJ9B+mszMHSIUp8UhddMxXgK6s7omXCrVYfZ/
 MGA34ZN/o7lSD5VLx4UmfGi7G29Fe6uamKcKdSUoijq5wsKbfBT3zQU6+
 MmIi9KDy9drB+Mln1oPJcpWJ0A6OfFQDhbGY6wblaGmK5n5EUtt18FnJs
 9KmLl0Xv/1T2Hoz4zj6IC+XiQvKEsIivIBjzUPOm+Nlvb+VvszvdGQlmx
 Nh+pHYkGZwq2z2x6P9uDCh3WNp4RGZwxLzyLrcNNqlgXnizgAu14JuaOr w==;
X-CSE-ConnectionGUID: tLhezzBtROiwLPSUkdZ1Gw==
X-CSE-MsgGUID: P/i/LRdTRgacreuFgCJGWA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687518"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687518"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:34 -0700
X-CSE-ConnectionGUID: AALyrOJmRQa+UU8iCfQOdg==
X-CSE-MsgGUID: 4Zyx1knZQimNBrxSEav+xg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634443"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:31 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:30 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 04/18] lib/rendercopy: Use the proper compression
 format for 16bpc on dg2/lnl+
Date: Wed, 18 Sep 2024 15:05:04 +0300
Message-ID: <20240918120518.30258-5-ville.syrjala@linux.intel.com>
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

Setup the dg2/lnl+ compression format correctly for 16bpc formats.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/rendercopy_gen9.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/rendercopy_gen9.c b/lib/rendercopy_gen9.c
index 291ee99fd257..b33e7fc9feba 100644
--- a/lib/rendercopy_gen9.c
+++ b/lib/rendercopy_gen9.c
@@ -149,6 +149,8 @@ static const uint32_t xe2_render_copy[][4] = {
 static uint32_t lnl_compression_format(const struct intel_buf *buf)
 {
 	switch (buf->bpp) {
+	case 64:
+		return 0x7; /* CMF_R16_G16_B16_A16 */
 	case 32:
 		if (buf->depth == 30)
 			return 0x3; /* CMF_R10_G10_B10_A2 */
@@ -163,6 +165,8 @@ static uint32_t lnl_compression_format(const struct intel_buf *buf)
 static uint32_t dg2_compression_format(const struct intel_buf *buf)
 {
 	switch (buf->bpp) {
+	case 64:
+		return 0x5;
 	case 32:
 		if (buf->depth == 30)
 			return 0xc;
-- 
2.44.2

