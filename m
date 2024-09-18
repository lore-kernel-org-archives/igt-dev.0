Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE03CCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821D410E57C;
	Wed, 18 Sep 2024 12:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jpvoGpZY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE3F10E57C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661148; x=1758197148;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yJpojAjV0Dq2AMAVB2J8lfUOtVvPOjY8+i+6j2cASjU=;
 b=jpvoGpZYqQ1j8lzP0o8UWun3hT6FcMFOOfvXUe03GrcI8fNa2DM/2rlG
 plSGihvvMh4CkG6khP8/vPafDoNGeFGe/UohjXaO8Dg/BEpQvII5rvI0x
 MRfeRR0+Ls6JyhmH7m/65Oex65Pxjs4voSCqcaRbkGyZZqYeV3MRiVH2Y
 GlBsp2eEeU7tvmZsogheJmORGWR04VgaB/S1ow43rfrzfVqqyJBqXQJAG
 7qxvSdQDqIl+f66ZQR/iEtX4IdvEuPN1spCVcfF82CPBMG7hONghPxAL8
 6x3JS/p34HBY2rqchqeIztGdkkE9etfq7nYd2tRk2vr1nFaBH7R/7Phq+ w==;
X-CSE-ConnectionGUID: 7nyRrAoFTFGaOJuNNfFwPQ==
X-CSE-MsgGUID: bQdt6fm1QluKMNCJcnFwkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687534"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687534"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:48 -0700
X-CSE-ConnectionGUID: I4R9qzo3SvahD6tNxsRTng==
X-CSE-MsgGUID: oiZxcCXKSLabI5eHubmq1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634450"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:46 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:44 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t v2 09/18] tests/kms_plane: Skip 10bpc formats with media
 compression
Date: Wed, 18 Sep 2024 15:05:09 +0300
Message-ID: <20240918120518.30258-10-ville.syrjala@linux.intel.com>
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/kms_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_plane.c b/tests/kms_plane.c
index a6b5d4f8aa2a..77a669dc540b 100644
--- a/tests/kms_plane.c
+++ b/tests/kms_plane.c
@@ -1012,6 +1012,11 @@ static bool skip_format_mod(data_t *data,
 	    modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
 		return true;
 
+	/* VEBOX just hangs with an actual 10bpc format */
+	if (igt_fb_is_gen12_mc_ccs_modifier(modifier) &&
+	    igt_reduce_format(format) == DRM_FORMAT_XRGB2101010)
+		return true;
+
 	/* test each format "class" only once in non-extended tests */
 	if (!data->extended && modifier != DRM_FORMAT_MOD_LINEAR) {
 		struct format_mod rf = {
-- 
2.44.2

