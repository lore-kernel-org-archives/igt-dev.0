Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E19CCD1A3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A0B710E586;
	Wed, 18 Sep 2024 12:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMAdywQ0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E6D910E586
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661151; x=1758197151;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=LEWtZzBg1phW+NSGtGi0kb4gXUDw6ez0ZXDStqaiKTk=;
 b=EMAdywQ0wn5TTKVCIrO3yfKc7fyVHW1HMqloSthCEykRJbLvSX3PzIng
 9IOn0jxGRANoPoE3/YUbjHeL62sCayOkWIqfhebMn+6iK3Y7qZCsFbC2Q
 Ss2nGtaeXDEd2SOYaNnN5RUQQzvmj8PFK5D47KCQM+XaSRZYUyZDEOGm5
 M9nwonyqlPQeoS1m9IfuA0Fch9vDS/b69nzlsCLtD8LvhmCx6nhTAUkzl
 ZCWMF2hTkQX/wQv+nPWHjpiHq0BTiIxSBkdcO1qdHfvtACmSSxNDclagu
 SqwiTu9Z748DD8pRXP5R+uQcfXUOZO02Ml1Qlrp7ogls1aA9t5b7NG1ss g==;
X-CSE-ConnectionGUID: RvePufXaRrS/FxgyZ0dNig==
X-CSE-MsgGUID: HPDrAQUrSxqE8t9s2PyRTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687539"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687539"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:51 -0700
X-CSE-ConnectionGUID: P3IbmVU2RpOXe7bx8stiSQ==
X-CSE-MsgGUID: MSYeD/zoRpuFwE14LbeenQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634451"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:47 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 10/18] tests/kms_ccs: Skip 10bpc formats with media
 compression
Date: Wed, 18 Sep 2024 15:05:10 +0300
Message-ID: <20240918120518.30258-11-ville.syrjala@linux.intel.com>
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

The VEBOX just hangs if we try to use a 10bpc format.
Skip 10bpc with media compression as that would require
using the VEBOX.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_ccs.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 06f40e2c2175..7cda79412d94 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -845,6 +845,11 @@ static bool try_config(data_t *data, enum test_fb_flags fb_flags,
 	    data->format != DRM_FORMAT_XRGB2101010)
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

