Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4355BC25B75
	for <igt-dev@archiver.kernel.org>; Fri, 31 May 2024 14:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C352710E58A;
	Fri, 31 May 2024 14:26:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ac7ebA9B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B6D810E417
 for <igt-dev@lists.freedesktop.org>; Fri, 31 May 2024 14:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717165500; x=1748701500;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=tPxCgOM3ywJwWRzEOwTZdjyj6XvHg0PRkYc9aBCb1HY=;
 b=Ac7ebA9B9ZzfPXGiDMntNtwlkYDTjokB3E11wxBcD1H2HUB0hDxXrAeC
 Bm/jwFIszQsuRAmqaf6Edxl03Sfk9H+YyXq02a6wZ7Ikg1/8gOxxjpK/D
 UvdEDsFWN3SigW2Pox0PWznR/tE7N6ynz8ib3adc2w5c9QjNhAQin3bv1
 YXXREqN+S9eR2SmO3GrjK74yWEN+tb5rXc9yCs1IQhsVj2W23NS3Wc+9R
 93LuOVscRNDtErGGmgFGaXFXWv+fwiymmH0TbtkuDAaL/bJpDcX0NBfrv
 xS3NALciz4MimTyhh8uvPu2f4cceYnWnQgmRePhcBvtwiZyFX9OUkdMkF Q==;
X-CSE-ConnectionGUID: Af2x13oBSSSx6G5bNZGMkg==
X-CSE-MsgGUID: oMp9OGvvSgO4j+QBJ23ZZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="25113689"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25113689"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 07:24:16 -0700
X-CSE-ConnectionGUID: AfbjPxVwRkyG1bP0Z/j4gQ==
X-CSE-MsgGUID: fm9Dsrg2SnGDeUii/5aR4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36160833"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 31 May 2024 07:24:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 31 May 2024 17:24:13 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 07/20] tools/intel_vbt_decode: Use "(LFP<n>)" to
 indicate LFP panel type
Date: Fri, 31 May 2024 17:23:41 +0300
Message-ID: <20240531142354.16528-8-ville.syrjala@linux.intel.com>
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

The normal panel type is for "LFP" panels. It is also possible
that some of the LFP blocks (IIRC blocks 43 and 44) would
also apply to EFP panels (declared via the child devices' efp_index).
To make that somewhat possible in the future use the "(LFP<n>)" format
when indicating the LFP panel type match.

TODO: figure out how to dig out the index/indices and indicate
which LFP data applies to which EFP panels...

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_decode.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/intel_vbt_decode.c b/tools/intel_vbt_decode.c
index 318069ee948e..f01f90b301f7 100644
--- a/tools/intel_vbt_decode.c
+++ b/tools/intel_vbt_decode.c
@@ -101,13 +101,13 @@ static const char *panel_str(const struct context *context, int panel_type)
 {
 	if (panel_type == context->panel_type &&
 	    panel_type == context->panel_type2)
-		return " (1)(2)";
+		return " (LFP1)(LFP2)";
 
 	if (panel_type == context->panel_type)
-		return " (1)";
+		return " (LFP1)";
 
 	if (panel_type == context->panel_type2)
-		return " (2)";
+		return " (LFP2)";
 
 	return "";
 }
-- 
2.44.1

