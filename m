Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D485FC27C4F
	for <igt-dev@archiver.kernel.org>; Mon,  3 Jun 2024 08:03:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D5A10E2F7;
	Mon,  3 Jun 2024 08:03:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DX5Khspd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8BE310E2F7
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Jun 2024 08:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717401830; x=1748937830;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xHIl62QTL9cQYckMMIY3lEcZqKikqMkjvxl3JnNKBZA=;
 b=DX5KhspdtxKoHn1Bm2GHkTITgOWYKopKVHxx4kpCF1/mVBh9CXrsIjz/
 hsshAZVpmtNvJ345V45KzNwSKF8cd5m/Oe1YHW5LitsugJ5SHX5Rpdu/A
 9u7QfJ34/VaCN3iV/5bUh/sGOIj+IM21o4FEibMKvz3UPiOnZs7YJGZdw
 +6PIXSsuoz1UGksHKX7SV7/F1g2HTes63fmm5Eazm5eJj3PAaXzm0XlH+
 W0IFXdCW8VZs64fLedkQ39rxmHS49I55x1mLpEI7yjQwXVNVVuesth6aP
 nwUpw+CNS0JptT6oux7UHlVyHgzCoGXKJyj+9smiOOX6dVvi0RBQi+D0x w==;
X-CSE-ConnectionGUID: QENZAk1YTXyjlIjyMVL0Wg==
X-CSE-MsgGUID: nH+PRvg3QsafcdKIKs5CMg==
X-IronPort-AV: E=McAfee;i="6600,9927,11091"; a="11870472"
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="11870472"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 01:03:50 -0700
X-CSE-ConnectionGUID: Sd4qIMRPTU+k46Cd54V1Kw==
X-CSE-MsgGUID: lG0zqywfQM+qSw8YzydRwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,211,1712646000"; d="scan'208";a="74293343"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa001.jf.intel.com with ESMTP; 03 Jun 2024 01:03:48 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: vidya.srinivas@intel.com, Melanie Lobo <melanie.lobo@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 1/2] lib/intel_aux_pgtable: Library to add support for
 RGB16161616_64B format
Date: Mon,  3 Jun 2024 13:46:06 +0530
Message-Id: <20240603081607.30930-2-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240603081607.30930-1-melanie.lobo@intel.com>
References: <20240603081607.30930-1-melanie.lobo@intel.com>
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

MTL supports RGB16161616_64B FP16 format which is a binary
floating-point computer number format that occupies 16 bits
in computer memory.

This was tested with kernel patch,
https://patchwork.freedesktop.org/series/124957/
https://lore.kernel.org/all/20231201091133.23508-1-melanie.lobo@intel.com/

cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
---
 lib/intel_aux_pgtable.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 3cbb0e26f35c..87df50e71bbd 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -22,6 +22,7 @@
 #define AUX_FORMAT_AYUV		0x09
 #define AUX_FORMAT_ARGB_8B	0x0A
 #define AUX_FORMAT_NV12_21	0x0F
+#define AUX_FORMAT_RGBA16_FLOAT        0x1
 
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
2.17.1

