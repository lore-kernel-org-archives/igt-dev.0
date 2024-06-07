Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93265C27C53
	for <igt-dev@archiver.kernel.org>; Fri,  7 Jun 2024 13:58:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD3E10EC6F;
	Fri,  7 Jun 2024 13:58:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G7hm6nMs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496F610EC6F
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jun 2024 13:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717768684; x=1749304684;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=vFHduCENWwO5t3jVjdqIaZRIkx3U7cQ6CfOmyDFgr+A=;
 b=G7hm6nMs4Z33mOMZ3/E3CTRf6QMVFuHVgAcPclbhMyPCqWaiCVe9lsvK
 RUgOLraFL1ghd6xzbtM3ddAtPt8PPuAHWrqasj86bM5jDlcFoZIxmZ3CY
 Fo0HxCgFNbA7M/YbUFdyFz/Y6H+XqxSPGOmyhNUv1JpMG/3Q9phPzvMV8
 zQKLBrKN6E+ZS3qcGvz4aaoENM4h9enVxtbrJEhBxL9IuayG/NdjHF7pq
 1OtljqqoBPY969QcEcW+BpAnLM1lOvoH4woZUdgh4YZHIFLo2ja29jljc
 EvHeDdNIUOg6gioKAZ6tO1Pgjqikyw1c7tPXDt3yzpAwNMF6zDi5rWh1j Q==;
X-CSE-ConnectionGUID: MnFBhxyCRE6zDB1eXjP8RA==
X-CSE-MsgGUID: TG8xVjxsT5qOuT96lIqu8w==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25116766"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="25116766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 06:58:04 -0700
X-CSE-ConnectionGUID: tvqcc3/pS/2GEyAYWwJkig==
X-CSE-MsgGUID: ZbrtWWvuQruy2AVjJcqQWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38323716"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 07 Jun 2024 06:58:02 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Jun 2024 16:58:01 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/27] tools/intel_vbt_decode: sync intel_vbt_defs.h
 with kernel commit 80c414772d93
Date: Fri,  7 Jun 2024 16:57:32 +0300
Message-ID: <20240607135758.31421-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
References: <20240607135758.31421-1-ville.syrjala@linux.intel.com>
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

Synchronize intel_vbt_defs.h with kernel commit:

80c414772d93 ("drm/i915/bios: Define block 46 chromaticity coordinates properly")

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tools/intel_vbt_defs.h | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/tools/intel_vbt_defs.h b/tools/intel_vbt_defs.h
index 862c5923b83d..da8694771f69 100644
--- a/tools/intel_vbt_defs.h
+++ b/tools/intel_vbt_defs.h
@@ -1376,16 +1376,23 @@ struct chromaticity {
 	u8 chromaticity_from_edid_base_block:1;
 	u8 rsvd:6;
 
-	u8 red_green;
-	u8 blue_white;
-	u8 red_x;
-	u8 red_y;
-	u8 green_x;
-	u8 green_y;
-	u8 blue_x;
-	u8 blue_y;
-	u8 white_x;
-	u8 white_y;
+	u8 green_y_lo:2;
+	u8 green_x_lo:2;
+	u8 red_y_lo:2;
+	u8 red_x_lo:2;
+	u8 white_y_lo:2;
+	u8 white_x_lo:2;
+	u8 blue_y_lo:2;
+	u8 blue_x_lo:2;
+
+	u8 red_x_hi;
+	u8 red_y_hi;
+	u8 green_x_hi;
+	u8 green_y_hi;
+	u8 blue_x_hi;
+	u8 blue_y_hi;
+	u8 white_x_hi;
+	u8 white_y_hi;
 } __packed;
 
 struct bdb_chromaticity {
-- 
2.44.2

