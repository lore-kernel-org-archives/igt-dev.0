Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AA9C2BD05
	for <igt-dev@archiver.kernel.org>; Mon, 24 Jun 2024 09:17:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74EE610E3CA;
	Mon, 24 Jun 2024 09:17:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bSqceLzO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B5710E3C7
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Jun 2024 09:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719220657; x=1750756657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BuJ0XSs3QW0Xgtt0wyEMZdEY9jR077Kr9Bqm78y1eLU=;
 b=bSqceLzON0w8c/zi1arGc8pVEHAVM4xzo+QIPeLPzmZjfJGqJoJuJycW
 J3Min6tkQv5Nw/y+DiH2/6YikVsWv5oROVzc7ofb5XQZwaszcTjZxkTxK
 MJOP0gtPNMtl9JLaDeW+LxlIeSkbTvNpYNuXmGU191+c2ok4Swbqnw3sK
 oy9DwnxCTTRwF0NhFTQKwUKro+KpihOMjQRkwnLoIBXDuiv3R62Cz1ebm
 f6fP98cMgzWEQNll6uBdWledlWjlb5G//G/g6CcE7fZPissnWmXlrtEgx
 BZsykAaVoi61yKCw1a/aU5pRULUmibvGronOILL3knivc34olyjq3X3jh A==;
X-CSE-ConnectionGUID: 9FyFBAUCSqWBEsAd8hIOnQ==
X-CSE-MsgGUID: Bu7CSk8hQpiUOEIpaQ9vow==
X-IronPort-AV: E=McAfee;i="6700,10204,11112"; a="26771092"
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="26771092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 02:17:37 -0700
X-CSE-ConnectionGUID: YUYEoaawTCu2t5T2pjKObQ==
X-CSE-MsgGUID: cNbagnHsQcOWlMmyJ8OPFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,261,1712646000"; d="scan'208";a="43353964"
Received: from melanie-nuc10i7fnh.iind.intel.com ([10.223.167.49])
 by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2024 02:17:33 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 ville.syrjala@intel.com, Melanie Lobo <melanie.lobo@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 1/2] lib/intel_aux_pgtable: Library to add support for
 RGB16161616_64B format
Date: Mon, 24 Jun 2024 20:12:47 +0530
Message-Id: <20240624144248.216308-2-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240624144248.216308-1-melanie.lobo@intel.com>
References: <20240603081607.30930-1-melanie.lobo@intel.com>
 <20240624144248.216308-1-melanie.lobo@intel.com>
MIME-Version: 1.0
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

MTL supports RGB16161616_64B FP16 format which is a binary
floating-point computer number format that occupies 16 bits
in computer memory.

This was tested with kernel patch,
https://patchwork.freedesktop.org/series/124957/
https://lore.kernel.org/all/20231201091133.23508-1-melanie.lobo@intel.com/

cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
cc: Swati Sharma <swati2.sharma@intel.com>
cc: Ville Syrjala <ville.syrjala@intel.com>
Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
---
 lib/intel_aux_pgtable.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 3cbb0e26f35c..e31b9ba57c0a 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -22,6 +22,7 @@
 #define AUX_FORMAT_AYUV		0x09
 #define AUX_FORMAT_ARGB_8B	0x0A
 #define AUX_FORMAT_NV12_21	0x0F
+#define AUX_FORMAT_RGBA16_FLOAT	0x1
 
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
2.34.1

