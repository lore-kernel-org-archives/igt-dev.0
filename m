Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F13C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E78C010E2AA;
	Tue,  2 Jul 2024 23:29:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lkR2CJex";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E7F10E4A1
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962979; x=1751498979;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=Ko1QdR0Pq10kHlViWCCZhpFeXs15e1Arlu8Ai2T/nDM=;
 b=lkR2CJexGBygraMhlFnW9aaxEyyMiN4q2gXmNwCrmahiTKx3/gOjoS3r
 ZESfyFDBSiwS3yY6rfA647zQtq2sOw4bebw7+uqd4iyeJZPnX1F7k/qMX
 GJaPnUS6pr7mcaZapv4tCJ9VlKyB1ny28x4XY/OvpCVTl9PtoPM13yE/D
 NrRxqn34/DmBBOZIBSgOuBzfmr2StO+vEnwIo2AzfS0Zf/6Veiun1JXVQ
 tU6rvfw7wTONVSyxTAlF9oibJ9uSAITY2MudteiDRl3WXy3vvLAcXOh4G
 91dBM8Xxe3HLoJnrSUebq/TMQpN+F3i0ckrnJl+Rv/IPXcIQsuHj4xzIK w==;
X-CSE-ConnectionGUID: vE4KY+vBShaa67tGnVbs0g==
X-CSE-MsgGUID: oqcJg9D1R+iWkQ7SIgv4vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559673"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559673"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:38 -0700
X-CSE-ConnectionGUID: ZR5r23T9TH+EvdRk4ebm0g==
X-CSE-MsgGUID: m953aCYRTvyQy2+Yo7HHKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043912"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:35 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 28/37] lib/vebox: Add 10bpc support
Date: Wed,  3 Jul 2024 02:28:08 +0300
Message-ID: <20240702232817.31147-29-ville.syrjala@linux.intel.com>
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

Add specific 10bpc support for VEBOX.

FIXME: This just hangs the VEBOX :(
       Bspec did have some notes that this is only
       supported for IECP on earlier platforms, but
       that restriction is no longer listed for more modern
       stuff, but maybe it's still there?

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/veboxcopy_gen12.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index af52a96578d9..fedefb0842a2 100644
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
@@ -344,7 +347,8 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 	case 32:
 		igt_assert(!src->format_is_yuv_semiplanar);
 		format = src->format_is_yuv ? PACKED_444A_8 :
-					      R8G8B8A8_UNORM;
+			 src->depth == 30 ? R10G10B10A2_UNORM :
+					    R8G8B8A8_UNORM;
 		break;
 	case 64:
 		igt_assert(!src->format_is_yuv_semiplanar);
-- 
2.44.2

