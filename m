Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581E8C30658
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jul 2024 23:28:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E181010E1C7;
	Tue,  2 Jul 2024 23:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L99ORvkR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6175C10E1C7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2024 23:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719962905; x=1751498905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x2YPJmVS6Lm1D5q1q23id69FogMy6fw4R6WhcjA9qww=;
 b=L99ORvkR2VAWYaDbgTH8HlOCDGs9wsUyb47+ekDjEJsoN7wICSqDkSM7
 oLjTzI2ZwZqFwzbip+DyvR7A+PjmYdAqR3j3URWKEuv60+MpIZhYCXB5a
 Q3TunMObUKSUSKwKf/DEmPYYntYB6y/RpDmDo8jMiKpUgjyX8PlHHSR58
 r34b/h+r13oxkWL4lccfMTH0a/oAf/JKp2PAnrvWaePqp5rhlY1cx9XD/
 DNLIFp+itBEgjjrVJ5Zx6EqUmumydqAKucB2SytO6LbzzKzNdaiGqc1Cy
 XQQHvU6Q1siHRk+0l+JgPkTM38Fifmiqp0FZjwpirPViKR6LbxVGTjuab w==;
X-CSE-ConnectionGUID: nUaDV6+hRPqkiC0zMftGng==
X-CSE-MsgGUID: 1q0d8aIJSBCNRXOIMlUp2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28559473"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="28559473"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2024 16:28:25 -0700
X-CSE-ConnectionGUID: ggaTx+0JRcaeHY44yZi40g==
X-CSE-MsgGUID: mvbrBvBcT82BVWiMtM64Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; d="scan'208";a="46043761"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 02 Jul 2024 16:28:21 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 03 Jul 2024 02:28:20 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t 01/37] lib/intel_aux_pgtable: Library to add support for
 RGB16161616_64B format
Date: Wed,  3 Jul 2024 02:27:41 +0300
Message-ID: <20240702232817.31147-2-ville.syrjala@linux.intel.com>
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

From: Melanie Lobo <melanie.lobo@intel.com>

TGL+ supports RGB16161616_64B FP16 format which is a binary
floating-point computer number format that occupies 16 bits
in computer memory.

This was tested with kernel patch,
https://patchwork.freedesktop.org/series/124957/
https://lore.kernel.org/all/20231201091133.23508-1-melanie.lobo@intel.com/

cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
[vsyrjala: s/0x1/0x10/ to make the format correct, note that it's for TGL+]
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/intel_aux_pgtable.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 3cbb0e26f35c..8ff48641619e 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -22,6 +22,7 @@
 #define AUX_FORMAT_AYUV		0x09
 #define AUX_FORMAT_ARGB_8B	0x0A
 #define AUX_FORMAT_NV12_21	0x0F
+#define AUX_FORMAT_RGBA16_FLOAT	0x10
 
 struct pgtable_level_desc {
 	int idx_shift;
@@ -306,6 +307,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
 			entry.e.format = AUX_FORMAT_ARGB_8B;
 			entry.e.depth = bpp_to_depth_val(32);
 			break;
+		case 64:
+			entry.e.format = AUX_FORMAT_RGBA16_FLOAT;
+			entry.e.depth = bpp_to_depth_val(64);
+			break;
 		default:
 			igt_assert(0);
 		}
-- 
2.44.2

