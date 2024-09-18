Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D352FCCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 871AC10E58A;
	Wed, 18 Sep 2024 12:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V24+R+jM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C72B10E58A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661159; x=1758197159;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=wMQwIyXjJm5NeYmk+oRIJlqsNZ1liXNeFFSa0/H+sFo=;
 b=V24+R+jM6eW9cG9zVTvb76xUs/ARe5xC8+7g81+ESkXMn9WDYPFCGu7k
 /CPh9CNjPDDKE9kMB5IRnFulQOMx9lxAkNAqqhX7ITrWzoz9GscVORVp7
 +wgzbOwnx16w9TVV9heBnBM1vjokD7pJIQdhiel7HsY2ao42J239wgGTS
 PdudE/ded3A194kmIQNrhYwDxiBXd3zc9T7RYsAC9IGaoQUJeMdoGDRfJ
 O6K8LpIM8W+1rjChLcWr21I8PHNxlWX+SwI/Agp6TAzSEEx5nY0QmIVXw
 sxiU2EqAKEgLAvInHPuSmeMKOQxtoX0flk0BsO2jHaa+RGqtAXMa+UaB4 w==;
X-CSE-ConnectionGUID: ATQiE84rQFShXfMqECtE1Q==
X-CSE-MsgGUID: K+4KFpi3RxKFFKv1adaO+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687554"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687554"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:59 -0700
X-CSE-ConnectionGUID: OjOVCXy6SEa5nFt9TNQJ5g==
X-CSE-MsgGUID: fgdadhn6Rd+HfmMDchPOSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634456"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:57 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:56 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t v2 13/18] lib/vebox: Document that 2:10:10:10 is
 unusable with VEBOX
Date: Wed, 18 Sep 2024 15:05:13 +0300
Message-ID: <20240918120518.30258-14-ville.syrjala@linux.intel.com>
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

VEBOX has a specific format for R10G10B10A2_UNORM, but it
just hangs the engine if you try to use it.

For most platforms bsepc says: "Valid format only for when
IECP is enabled and in output state only. Not supported in
HSB mode."

Document this fact so that the next fella doesn't try to
implement it like I did :/

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/veboxcopy_gen12.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index af52a96578d9..4e3aefaf1f44 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -29,6 +29,7 @@
 #define YCRCB_NORMAL	0
 #define PLANAR_420_8	4
 #define PACKED_444A_8	5
+#define R10G10B10A2_UNORM	7
 #define R8G8B8A8_UNORM	8
 #define PACKED_444_16	9
 #define PLANAR_420_16	12
@@ -168,6 +169,8 @@ static uint32_t compression_format(int format, struct intel_buf *buf)
 	switch (format) {
 	case R16G16B16A16:
 		return 0x1;
+	case R10G10B10A2_UNORM:
+		return 0xe;
 	case R8G8B8A8_UNORM:
 		return 0xa;
 	case PLANAR_420_8:
@@ -343,6 +346,15 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 		break;
 	case 32:
 		igt_assert(!src->format_is_yuv_semiplanar);
+		/*
+		 * R10G10B10A2_UNORM is not usable.
+		 *
+		 * Bspec says: "Valid format only for when IECP is enabled
+		 * and in output state only. Not supported in  HSB mode."
+		 *
+		 * VEBOX hangs if you try use it.
+		 */
+		igt_assert(src->depth != 30);
 		format = src->format_is_yuv ? PACKED_444A_8 :
 					      R8G8B8A8_UNORM;
 		break;
-- 
2.44.2

