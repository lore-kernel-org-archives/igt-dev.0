Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D69C31D97
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF1C210E50A;
	Tue,  2 Jul 2024 23:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bawy7EAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570B410E501
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962998; x=1751498998;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vRGHLPi0mc+a5TkGJ/joRW7sUAy/2ewRLigJFiVctY4=;
 b=bawy7EAdVCqtcFxfGGwpeSIEV0RngJ35BrDMoNWLEGosO1BO44dejr5K
 ElzHbcM+Du4CvoDd5+ylqOO4QQGTCbesg+G4svGHde3kjtzB+6N9O/h2n
 q+AxlXkQiSBs6N/u4L0/diILtQikBiIj82RzeIG6Om2rd05TntQBuACoo
 eQUND3WU+U4UDshxoyJ39JAncx55rtK29KjY+tx5gCgCOBqdd/+089cwq
 KTIAQ5VDIcFuduxXYc9AyAF+cnP4xXshSP54LV7PV6Wj/eyKrwBHF9VpI
 bz31w8vOIJ2fWsEvnV59CJ+2KnHVqC1F3Gc4e3j6VsUkpvmaTfi54RzM2 Q==;
X-CSE-ConnectionGUID: n3iUTO7/Qo6XjGcqUeTy6A==
X-CSE-MsgGUID: bmjC0TMOTwadMpaZMTJMXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559708"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559708"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:57 -0700
X-CSE-ConnectionGUID: qTyyjLjlQhWlQE8FMy9Cog==
X-CSE-MsgGUID: HrjJhvXAQ5iLxK0BFYVPVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043937"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:55 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:54 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 35/37] tests/kms_ccs: Skip 10bpc formats with media
 compression
Date: Wed,  3 Jul 2024 02:28:15 +0300
Message-ID: <20240702232817.31147-36-ville.syrjala@linux.intel.com>
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

The VEBOX just hangs if we try to use a 10bpc format.
Skip 10bpc with media compression as that would require
using the VEBOX.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 5c18868a062f..60d8dc132105 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -871,6 +871,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	    data->format != DRM_FORMAT_XBGR16161616F)
 		return false;
 
+	/* VEBOX just hangs with an actual 10bpc format */
+	if (igt_fb_is_gen12_mc_ccs_modifier(data->ccs_modifier) &&
+	    data->format == DRM_FORMAT_XRGB2101010)
+		return false;
+
 	if ((fb_flags & FB_MISALIGN_AUX_STRIDE) ||
 	    (fb_flags & FB_SMALL_AUX_STRIDE))
 		fb_width = max(fb_width, 1536);
-- 
2.44.2

