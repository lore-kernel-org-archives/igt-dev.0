Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832EDCCD1A3
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:06:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD5E10E58E;
	Wed, 18 Sep 2024 12:06:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5FCARyM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6AE10E58E
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661173; x=1758197173;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ulVpk3OxnskD80gI7mQvNcPTBSi10jar9fx58YCwn8k=;
 b=H5FCARyMhChtPO8ScIdNWYYVaPNJlzZJB8AFM046o+lZVZf5bAEoiXfW
 MXmKLUueBXSgcXt5gknCZuzI562pi4aqd+cVfeF9n7Ge8DjcIEfhXs8ls
 yOqtgXq/FUSWFjwYezqwTX5lV2zdIvGJWbDSy7nYIHlg5+In0eTPGTm4h
 +d5DExgrspnafC+2wqTjKDzmRmxmRLB8y2p/0ANXsMCQofx9ReMcqai6A
 9evlmKbD+q/LCyCC5m4JgIs8OSMs+iP48OixNzLRnaV3As/tKdM3tKzNM
 7F7bB5l6DKgICWmPtFHWNoIaEhHhaKlC5TvGIlLaZce1HiLdJjhUyyfLx w==;
X-CSE-ConnectionGUID: fdCKAIWfR6iaxFpjsJWIzw==
X-CSE-MsgGUID: akq+UbANRZe3QsK7XsTbDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687583"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687583"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:06:13 -0700
X-CSE-ConnectionGUID: 8MJzvd4BQO+5adSumCWWpA==
X-CSE-MsgGUID: OuCckPzqRB2mIcwnXUTuog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634468"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:06:11 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:06:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 18/18] lib/intel_aux_pgtable: Pick a more optimal aux
 format for 10bpc
Date: Wed, 18 Sep 2024 15:05:18 +0300
Message-ID: <20240918120518.30258-19-ville.syrjala@linux.intel.com>
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

Pick the (presumably) more optimal 0x18 aux format for
10bpc formats. This matches what Mesa uses as well.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_aux_pgtable.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 8ff48641619e..de0740e950f8 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -23,6 +23,7 @@
 #define AUX_FORMAT_ARGB_8B	0x0A
 #define AUX_FORMAT_NV12_21	0x0F
 #define AUX_FORMAT_RGBA16_FLOAT	0x10
+#define AUX_FORMAT_ARGB_10B	0x18
 
 struct pgtable_level_desc {
 	int idx_shift;
@@ -304,7 +305,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
 	} else {
 		switch (buf->bpp) {
 		case 32:
-			entry.e.format = AUX_FORMAT_ARGB_8B;
+			if (buf->depth == 30)
+				entry.e.format = AUX_FORMAT_ARGB_10B;
+			else
+				entry.e.format = AUX_FORMAT_ARGB_8B;
 			entry.e.depth = bpp_to_depth_val(32);
 			break;
 		case 64:
-- 
2.44.2

