Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD833C3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9399010E501;
	Tue,  2 Jul 2024 23:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ua24L5QL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860B710E50A
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962946; x=1751498946;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=6tMnB3UhsLhlOunaUAJHPhXkZCH8XWqZDxWK9Tv2lds=;
 b=Ua24L5QL0BD/XQrUjSo/JnQa9TGsTJ1aGPUS7tAub2GQS9dYOPyVdQO4
 pi/P9BIV1IjJVIWW3pHdqsjVazfrYk/Ro5ScmsakhPSxjmw95cUVp80j8
 OTFmAKEKJcq9Vy+2ren4Nk7vMnkBXLzxhnlE1vfZOQLzx00O+k6jvLvHj
 lidsujon5dwp+yAdnvSwjc7pbmO2we7YHwoMnSa6/cq/0YIsGBwZtnL9e
 3kddPlSVKvrU0jjnDe9riA0LpxsbaXb32GbNTZks3yPpyTXxtiSV0n7LY
 NBF6XkRbsgRqAVl7pKqEYkJH1sek/Co3j3/Vv6cjXqkJZekpNVdrg4GKw A==;
X-CSE-ConnectionGUID: 7/1rYyN6SUmzeQmLxSR6XQ==
X-CSE-MsgGUID: z757CUMBTRGhy4iMx5ERAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559577"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559577"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:06 -0700
X-CSE-ConnectionGUID: hnFQnEXAQhqBtPvVgsLEIw==
X-CSE-MsgGUID: P4h6X0/hSYO5/84mIQdgVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043844"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:02 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 16/37] lib/igt_fb: Require enginecopy for clear color
Date: Wed,  3 Jul 2024 02:27:56 +0300
Message-ID: <20240702232817.31147-17-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
References: <20240702232817.31147-1-ville.syrjala@linux.intel.com>
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

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 6c9b4b7f3107..80e3c0a48bda 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2496,6 +2496,9 @@ static bool block_copy_ok(const struct igt_fb *fb)
 
 static bool ccs_needs_enginecopy(const struct igt_fb *fb)
 {
+	if (is_gen12_rc_ccs_cc_modifier(fb->modifier))
+		return true;
+
 	if (is_gen12_mc_ccs_modifier(fb->modifier))
 		return true;
 
-- 
2.44.2

