Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0ED2CCD1A0
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 12:05:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C9B10E585;
	Wed, 18 Sep 2024 12:05:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TpIj3un/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E7610E57C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 12:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726661125; x=1758197125;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7MmAFsIm8ChIVPyTP/gVWXFuBJPXvoRwrUsatBFeAk=;
 b=TpIj3un/75ZRPSoeR49WbcGNOvlmGLHR8ZD4nUtHVhViX2AGuHfS9wlD
 MwA4zysGzHle0AqH0SNBUmr5qxLc5WXHCdXan/71oODGnkz2dnrS5tHfZ
 8cuRXV52+7jJ6FxOTBZ1iT1l/S0wtlZDgCcJnBn/o7RJmlrfh9qJnAThh
 3GUFcUpvD0uG0sMrg22+qm92bW3uWaRiIOFFsXkXul7TaMq0rgwCMqxRd
 GYOu1ZSZw1XWQ8D/Wqwr2wGzQO0auo+4WyF60gt5i8fEk28bTduQvxDH0
 bM8VhTf7gkiUMXRFMSyqIZgxVl0bs0OdrNyxvTGAHjzCbYEUZRwqm474l w==;
X-CSE-ConnectionGUID: lNAoIBGmT92jiz7MyyhX6w==
X-CSE-MsgGUID: yUheDwKnQRKuI4I00cLV1A==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25687504"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="25687504"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 05:05:25 -0700
X-CSE-ConnectionGUID: h6LVHdmzRN20ThXKDtBjJQ==
X-CSE-MsgGUID: CnP9FBUCSDeGlTPQr8YiyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69634439"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 18 Sep 2024 05:05:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 18 Sep 2024 15:05:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t v2 01/18] lib/intel_aux_pgtable: Library to add support
 for RGB16161616_64B format
Date: Wed, 18 Sep 2024 15:05:01 +0300
Message-ID: <20240918120518.30258-2-ville.syrjala@linux.intel.com>
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

From: Melanie Lobo <melanie.lobo@intel.com>

TGL+ supports RGB16161616_64B FP16 format which is a binary
floating-point computer number format that occupies 16 bits
in computer memory.

This was tested with kernel patch,
https://patchwork.freedesktop.org/series/124957/
https://lore.kernel.org/all/20231201091133.23508-1-melanie.lobo@intel.com/

[vsyrjala: s/0x1/0x10/ to make the format correct for TGL.
The original number was for DG2/MTL media compression, but
for those platforms bspec says:
 "Compression format from AUX page walk is ignored.
  Instead compression format from Surface State is used."
 so we can just always use the TGL numbers here.
]

Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
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

