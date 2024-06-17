Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656F8C27C77
	for <igt-dev@archiver.kernel.org>; Mon, 17 Jun 2024 07:52:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 954E510E2CE;
	Mon, 17 Jun 2024 07:52:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CLLDz4mv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E163210E293
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2024 07:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718610726; x=1750146726;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=DJBMGD0cKQsHDcjvBsKHxPLeSc5Xc+oGlVqMsOTUZEo=;
 b=CLLDz4mvoPf3vBmoapgvHVRAR+FZn6glmlk3sGh0L8f3/rwABFY9GTaw
 rQLy40LY2U19wtEShudCDLAhUzjaKt7kVbXI5ed/fn2aD1vra9vnB7ne3
 KMi4/YmdE2321jeqRRHftWhFW9QJlxPvv+rLvEm2iLf6SD2KwpO3fXViy
 bJY1L95LKqc0QmNAMa8ugOrECqOg5dHbVUnjTR28ZpJWKO+dYV60cvfch
 KjbhwgCrRdKAdD16ODUIi4alwI9OYjRMr917UADuOXdX2c3IZmHTtC1WO
 NnEfvtVowSkEfuSSwstHW08YKozQAaFOLUmV9OWGs04eosWfhxtjdvkJ5 Q==;
X-CSE-ConnectionGUID: t0KPvyaCTaCUfQQshZSWCw==
X-CSE-MsgGUID: wHLCC+99T6mn+CaboYEw7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="37950945"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="37950945"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 00:52:06 -0700
X-CSE-ConnectionGUID: 7m+cwMZZRM2O7+GQr+hRsQ==
X-CSE-MsgGUID: tgsHoyLRSyiBBg3GZuRXJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; d="scan'208";a="41249540"
Received: from lab-ah.igk.intel.com ([10.102.138.202])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 00:52:05 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Mon, 17 Jun 2024 09:51:44 +0200
Subject: [PATCH 1/2] lib: sync xe_pciids.h with kernel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240617-bmg_chipset_info-v1-1-289e3215141e@intel.com>
References: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
In-Reply-To: <20240617-bmg_chipset_info-v1-0-289e3215141e@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Ewelina Musial <ewelina.musial@intel.com>, 
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=693;
 i=andrzej.hajda@intel.com; h=from:subject:message-id;
 bh=DJBMGD0cKQsHDcjvBsKHxPLeSc5Xc+oGlVqMsOTUZEo=;
 b=owEB7QES/pANAwAKASNispPeEP3XAcsmYgBmb+sisnUxcQmtnU05e0Zbikj0OWo/PAaMaun0NXLG
 shMTmC6JAbMEAAEKAB0WIQT8qEQxNN2/XeF/A00jYrKT3hD91wUCZm/rIgAKCRAjYrKT3hD91+5nDA
 CxtRfAAegnJ8MIpcZ/xdGA6edscqWbfy8H6L2SCBDT+7+NNsHPpIZpUJtlqGoEcrCRiaPbHxmxoZvB
 fiJ7ZRUJ9wqwM2pJMOdIqypxdzooL/VbJAjJiR4ElrSntQw8LYZ4u2lWrQtj0CEIRU3PTLCaqHLcV/
 7zC6NiiKLVMwqO50CzknSrBQ+LLhEBnjB/TlJEUtlPMkFxNTnc7YWgqrjKdqEGqHIaZ1OmOWt2EC69
 Tnqpk7WqWAB6W15nPlCMRiBdn9H/Gn1hbOIt0NS7ETH1W6U69/G0FrUL8VNByChdN8GU8XOLbB/heU
 F1EnWOoEcO++sA/y0LgHH3UjZhcwGX3+XF3v9441eU6vIdjMwdXBlObGniNJvIIi+8K9JXCGhpIFqI
 iQEbCpTqb6LAtOph0UKmJFOnnubMjoA1jZvniPBFcYSI7fYf+To9r8NWKVqQJ9oFbalTetbKZlkM0B
 JmxnGD/pQ599yRdG4CAP1RgjyUD4BBF81As2C2wP0xxh4=
X-Developer-Key: i=andrzej.hajda@intel.com; a=openpgp;
 fpr=FCA8443134DDBF5DE17F034D2362B293DE10FDD7
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

This synchronizes with kernel commit
e54700f7d6aa ("drm/xe/bmg: Add PCI IDs")

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 lib/xe_pciids.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/lib/xe_pciids.h b/lib/xe_pciids.h
index c7fc288dacee..73d972a8aca1 100644
--- a/lib/xe_pciids.h
+++ b/lib/xe_pciids.h
@@ -208,4 +208,11 @@
 	MACRO__(0x64A0, ## __VA_ARGS__), \
 	MACRO__(0x64B0, ## __VA_ARGS__)
 
+#define XE_BMG_IDS(MACRO__, ...) \
+	MACRO__(0xE202, ## __VA_ARGS__), \
+	MACRO__(0xE20B, ## __VA_ARGS__), \
+	MACRO__(0xE20C, ## __VA_ARGS__), \
+	MACRO__(0xE20D, ## __VA_ARGS__), \
+	MACRO__(0xE212, ## __VA_ARGS__)
+
 #endif

-- 
2.34.1

