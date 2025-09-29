Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D92CCAC5B9
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 19:21:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C9989ABE;
	Mon, 29 Sep 2025 19:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="De73gyHF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D759710E48C
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 19:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759173708; x=1790709708;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tLeLZ9JLzYaAxT8ISj+VroRA1cjrCJGSHwcpKbB1nhA=;
 b=De73gyHFCfocwxjSxPICCtntcg/kB2Kbje+c5CE3A2S9pTrDHfilVBIm
 Bq+GVbWIvKZCIsbP5+lTX4GlWFoWfsDmMMH3UMIRwW9zqBWuKZ9Ue2pVT
 O4pc3j9PjwhebK2aCEhuG2nUMuWgw+GemguCBS90CedXoKAZir+/V+bxw
 lOfctMD89p/1qftOB+7jdxvF3GJvqId9UM34o4KlxA8JFQuo6QLCm9J5k
 atkjeP3W3IEcqvpes7VVN6yQVcQV8aC4kCnLkcsxJkZrXNn4+Ee1QJqfx
 KzNAQEgu+Yg/YPq5/7Rpl/2CJeQrrL2SEicWrWOA8cJw3GulXXl6Q3RK3 g==;
X-CSE-ConnectionGUID: JFXOkKNmTROKfwB7kK8uBQ==
X-CSE-MsgGUID: p3yGE0AoRPqICq9+kOM5VA==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61589848"
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="61589848"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:48 -0700
X-CSE-ConnectionGUID: EyAy8aC4RHyYDBNfXTj8KA==
X-CSE-MsgGUID: fK6IFHHLTBmfzi6w3TZETg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,302,1751266800"; d="scan'208";a="178250202"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.245.198])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 12:21:46 -0700
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 5/6] tools/intel_vbt_decode: Decode display refclk mode
Date: Mon, 29 Sep 2025 22:21:25 +0300
Message-ID: <20250929192127.5865-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
References: <20250929192127.5865-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On ilk (at least) the display clock mode bit tells us whether
the display reference clock is coming from an internal or
external (CK505) source. Decode that bit correctly.

Not entirely sure what the last VBT version/platform is where
this actually means anything, but we can keep decoding it until
VBT version 183 when the bit was repurposed to indicate dynamic
CDCLK instead. Between these two cases I'm not aware of a third
use for the same bit.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index a049f0b4e32f..68d02aee9f5a 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -687,6 +687,11 @@ static void dump_general_features(struct context *context,
 	       YESNO(features->underscan_vga_timings));
 	if (context->bdb->version >= 183)
 		printf("\tDynamic CD clock: %s\n", YESNO(features->display_clock_mode));
+	else
+		printf("\tReference clock mode: %s\n",
+		       features->display_clock_mode ?
+		       "BTM (Legacy Buffer Through Mode)" :
+		       "DCI (Display Clock Integration)");
 	printf("\tHotplug support in VBIOS: %s\n",
 	       YESNO(features->vbios_hotplug_support));
 
-- 
2.49.1

