Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599C4CD13CF
	for <igt-dev@archiver.kernel.org>; Mon,  2 Sep 2024 14:38:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CDA910E331;
	Mon,  2 Sep 2024 14:38:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d7pc0o3I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E37D410E331
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Sep 2024 14:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725287916; x=1756823916;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TFQ1Df35VChHKGOfzWgxSMGtmsfB2Kl13SP1x5q3z5s=;
 b=d7pc0o3IsaeIBGh8V8vG6CTU7cXSC6rgsPXnU2TC73MmCTX/x032PJD+
 lZeGD3cTJ/nWumm8hY/+LD8hQKvT2to1mxZ4oSuysvQ9YZTnGQnI7gUWo
 Wbt4Vkzyg1uuib6FkK7nAtB6oSaxFIvQVkIAXKNWjBWpPWmtiPcISjW/X
 hrk2R0eOhQQl/gKfjtGpJeK0Tg2AYZPOB0rY3G6nyfA0vmKEcMjqwfeJs
 QAeBGkMjnk4Sz72f5LTsIvLxF3MKXQvuiLEtOPyNA3F7hDZItxfueMuFT
 ShkyL2suTdvIDEHy4SK3TmorNAFEBVdvoGetYON4apxZrIflWeg4e4Nok w==;
X-CSE-ConnectionGUID: y5osGwh7R3eFfftlsR/kqw==
X-CSE-MsgGUID: gDy3V71RTSqWHBRf7oFXDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="24009475"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="24009475"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 07:38:36 -0700
X-CSE-ConnectionGUID: iViIv13gSbiFTmACKl+/YQ==
X-CSE-MsgGUID: Slb6JeUwSeCgwHjGfbe3AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64639422"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Sep 2024 07:38:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 02 Sep 2024 17:38:33 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 12/23] lib/igt_fb: Require enginecopy for clear color
Date: Mon,  2 Sep 2024 17:37:47 +0300
Message-ID: <20240902143758.21036-13-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
References: <20240902143758.21036-1-ville.syrjala@linux.intel.com>
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

The blitter code can't currently do clear color (looks like there
is some hardware support for it in the block copy comand, but
not currently implemented). Require the use of enginecopy for
clear color modifiers.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 52910b68a534..776c826c0d55 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2503,6 +2503,9 @@ static bool block_copy_ok(const struct igt_fb *fb)
 
 static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 {
+	if (is_gen12_rc_ccs_cc_modifier(fb->modifier))
+		return true;
+
 	if (is_gen12_mc_ccs_modifier(fb->modifier))
 		return true;
 
-- 
2.44.2

