Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E81C3065C
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:29:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8345710E1C7;
	Tue,  2 Jul 2024 23:29:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H6//GmCy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EDE10E1C7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962976; x=1751498976;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=L9XyNsGkQWY9i8CigvWzwSmmHbu4pJ3JcBrJj15hTNE=;
 b=H6//GmCy+9wJls8I9qaoOb+c0URDwfW/jvZhQ4lwh/DlsliXTj0B4Lvh
 KKrI3wWdYmJ0/ECuVPfmWObZIt4JAlQuipQSwH1BLgGH0zqnNHqjHVBZi
 dGoDDoiVUrlLKeJdXLuB1/od48Yai0ONMyZgjUVCSkv1TPBxAlsONnvkg
 U7Pyu5ckpRGNHyunxTjVl5Y0hpWqtFOJqZ3EcbGvfB4U2woU8OeltIBMG
 l2qmLCvOkXjw+UuYsz7EAfm7fUlmFMrKbTvfxLaymV3fLXwJ5Pv6xayYI
 m8H49KFc08s4FD0htT9hIm/W9C4eBh2cpoZLPGWO6LsfceKudKbwVBc1O w==;
X-CSE-ConnectionGUID: t5wWpfIQQhSWKMiB3gCKZw==
X-CSE-MsgGUID: n0Af9QvuS2SE6hulvhN2mg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559668"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559668"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:29:36 -0700
X-CSE-ConnectionGUID: eF0wlPg9TDKttblCuTBUDg==
X-CSE-MsgGUID: tl3jDcuhTX6sxP7DwWDY4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043905"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:29:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:29:32 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 27/37] lib/vebox: Add support for fp16 RGB formats
Date: Wed,  3 Jul 2024 02:28:07 +0300
Message-ID: <20240702232817.31147-28-ville.syrjala@linux.intel.com>
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

Support VEBOX copies with fp16 RGB formats.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/veboxcopy_gen12.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/veboxcopy_gen12.c b/lib/veboxcopy_gen12.c
index 44c914e7f2bf..af52a96578d9 100644
--- a/lib/veboxcopy_gen12.c
+++ b/lib/veboxcopy_gen12.c
@@ -32,6 +32,7 @@
 #define R8G8B8A8_UNORM	8
 #define PACKED_444_16	9
 #define PLANAR_420_16	12
+#define R16G16B16A16	13
 
 struct vebox_surface_state {
 	struct {
@@ -165,6 +166,8 @@ static uint32_t compression_format(int format, struct intel_buf *buf)
 		return 0;
 
 	switch (format) {
+	case R16G16B16A16:
+		return 0x1;
 	case R8G8B8A8_UNORM:
 		return 0xa;
 	case PLANAR_420_8:
@@ -344,8 +347,9 @@ void gen12_vebox_copyfunc(struct intel_bb *ibb,
 					      R8G8B8A8_UNORM;
 		break;
 	case 64:
-		igt_assert(!src->format_is_yuv_semiplanar && src->format_is_yuv);
-		format = PACKED_444_16;
+		igt_assert(!src->format_is_yuv_semiplanar);
+		format = src->format_is_yuv ? PACKED_444_16 :
+					      R16G16B16A16;
 		break;
 	default:
 		igt_assert_f(0, "Unsupported bpp: %u\n", src->bpp);
-- 
2.44.2

