Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF59CD11C2
	for <igt-dev@archiver.kernel.org>; Fri,  5 Apr 2024 09:53:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1755F10E792;
	Fri,  5 Apr 2024 09:53:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BgbNDmCQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFC7E10E792
 for <igt-dev@lists.freedesktop.org>; Fri,  5 Apr 2024 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712310791; x=1743846791;
 h=from:to:cc:subject:date:message-id;
 bh=UmBfRZnPXByxPvUso8Bvzk9BX8/9xWU5QuQiHwvC2NA=;
 b=BgbNDmCQ6Epr+4prlHWglc7wR+/WCtj2AACR4sQI8asD6a9dgaCGKrR1
 2M1kuLxAPM6nWEmNkpTuxu3ZMP5mnWk8ocIjO+MjsF5rTx830wNRX6zqS
 6JHGKkMZKmth/kFcOuHZWNTcG9bqG+yHNG9Po18j7Pbnov6Xkd2VffvT5
 3o01dlCuKW+Dl8+gT4ZAdgb4NdG0muvlQg7PUmzDWyKLlbWqRpkyRg+Ei
 vbHH00L642mezRqGa+aZ2A7aCb5hIdbB78rffWV3PUNWKKtRPf6asMhZN
 rEw4s2XwHH4opr62iu7afWPcNiyaQheKtNV/9zO8UjO5ss/pQH1AkZthq A==;
X-CSE-ConnectionGUID: CjZjnTrbR2W4yFqwIoU4Aw==
X-CSE-MsgGUID: ApfSldBeSZW38NvpZAmoAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25074449"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="25074449"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:53:10 -0700
X-CSE-ConnectionGUID: Ymvk9UINR8y1OMCk9CsGTQ==
X-CSE-MsgGUID: g89afCZtTPq3hIxjxaUqNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="19676519"
Received: from basicluh01.gar.corp.intel.com (HELO localhost.localdomain)
 ([10.223.131.46])
 by orviesa008.jf.intel.com with ESMTP; 05 Apr 2024 02:53:09 -0700
From: Melanie Lobo <melanie.lobo@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juha-pekka.heikkila@intel.com, vidya.srinivas@intel.com,
 Melanie Lobo <melanie.lobo@intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH 1/2] lib/intel_aux_pgtable: Library to add support for FP16
 compressed formats
Date: Fri,  5 Apr 2024 15:33:37 +0530
Message-Id: <20240405100338.10668-1-melanie.lobo@intel.com>
X-Mailer: git-send-email 2.17.1
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

MTL supports FP16 format which is a binary floating-point computer
number format that occupies 16 bits in computer memory. In this test
platform shall render compression in display engine to receive
FP16 compressed formats.

This was tested with kernel patch,
https://patchwork.freedesktop.org/patch/563854

Test-with: 20231012062620.23886-1-melanie.lobo@intel.com

cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
cc: Swati Sharma <swati2.sharma@intel.com>

Signed-off-by: Melanie Lobo <melanie.lobo@intel.com>
---
 lib/intel_aux_pgtable.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/lib/intel_aux_pgtable.c b/lib/intel_aux_pgtable.c
index 3cbb0e26f35c..1741c41af9a9 100644
--- a/lib/intel_aux_pgtable.c
+++ b/lib/intel_aux_pgtable.c
@@ -22,6 +22,7 @@
 #define AUX_FORMAT_AYUV		0x09
 #define AUX_FORMAT_ARGB_8B	0x0A
 #define AUX_FORMAT_NV12_21	0x0F
+#define AUX_FORMAT_XRGB16161616_64B 0x10
 
 struct pgtable_level_desc {
 	int idx_shift;
@@ -306,6 +307,10 @@ static uint64_t pgt_get_l1_flags(const struct intel_buf *buf, int surface_idx)
 			entry.e.format = AUX_FORMAT_ARGB_8B;
 			entry.e.depth = bpp_to_depth_val(32);
 			break;
+		case 64:
+			entry.e.format = AUX_FORMAT_XRGB16161616_64B;
+			entry.e.depth = bpp_to_depth_val(64);
+			break;
 		default:
 			igt_assert(0);
 		}
-- 
2.17.1

