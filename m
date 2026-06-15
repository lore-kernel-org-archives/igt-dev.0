Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31B13CD98C5
	for <igt-dev@archiver.kernel.org>; Mon, 15 Jun 2026 09:41:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17E210E30B;
	Mon, 15 Jun 2026 09:41:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ev2otN6z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADC010E30B
 for <igt-dev@lists.freedesktop.org>; Mon, 15 Jun 2026 09:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781516446; x=1813052446;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zauGoo73xmmqZ47XRP2GIdj9Ye64XmCp9g6yoKgOUjE=;
 b=ev2otN6zdxfd2ls3jc91/7GuGBVxDZat7v9aD3NFUOPjwB4vJjVb9Qne
 4XJp2+mQMtgsjAhysqkvij/qZ/LVktcPeocJQLw4MpQgmpIwVvdqRYVVT
 zc4kz/oDIbzV4EKdc/SGJT5wk7vpGYVm4X1JeA/typa76rNLSUicEn0bM
 N438q4s1vsQr6upR8NYbplbLGM1BCzPGmCoIHQRZJyj9YX/2lF4n5Cpyh
 rSQiij1bva/ZmYth6jKVWHvbl2SwjD3vSsozEuXzwO6i4Zfi2S7gDHPbN
 fMz5XtsGT6NijCPO0OwNB0R7KLKzmOUdlsze0cai7gu8Vy9fxX9CzVxgI A==;
X-CSE-ConnectionGUID: tD6dVz4gS4qYjlcP107Kvw==
X-CSE-MsgGUID: 2HAmPk9WTAuwI5CCFNdwpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="82264808"
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="82264808"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2026 02:40:46 -0700
X-CSE-ConnectionGUID: 4/DHZE42SUai7znfE8qZuQ==
X-CSE-MsgGUID: Hp209M17TYiAYoCVS8I98Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,206,1774335600"; d="scan'208";a="244514833"
Received: from dut2116bmgfrd.iind.intel.com ([10.223.34.21])
 by fmviesa007.fm.intel.com with ESMTP; 15 Jun 2026 02:40:45 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org,
	himal.prasad.ghimiray@intel.com
Subject: [PATCH i-g-t] tests/intel/xe_exec_system_allocator: Rename subtest to
 preffered-loc-atomic-device
Date: Mon, 15 Jun 2026 09:40:43 +0000
Message-ID: <20260615094043.3925465-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
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

From: Nishit Sharma <nishit.sharma@intel.com>

The subtest name "preffered-loc-atomic-vram" is misleading because
it exercises the DRM_XE_ATOMIC_DEVICE preferred-location atomic
attribute path, which applies to both dGPU (VRAM) and iGPU (SMEM)
configurations. Running a subtest labelled "-vram" on an iGPU where
no VRAM is present causes unnecessary confusion.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tests/intel/xe_exec_system_allocator.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
index 8fafb503e..48ae738ec 100644
--- a/tests/intel/xe_exec_system_allocator.c
+++ b/tests/intel/xe_exec_system_allocator.c
@@ -508,7 +508,7 @@ static void __aligned_partial_free(struct aligned_alloc_type  *aligned_alloc_typ
  * Description: performs prefetch and page migration
  * Test category: functionality test
  *
- * SUBTEST: madvise-preffered-loc-atomic-vram
+ * SUBTEST: madvise-preffered-loc-atomic-device
  * Description: performs both atomic and preferred loc madvise operations atomic device attributes set
  * Test category: functionality test
  *
@@ -2538,7 +2538,7 @@ int igt_main()
 		{ "atomic-inc", MADVISE_OP | MADVISE_ATOMIC_DEVICE | ATOMIC_BATCH },
 		{ "preffered-loc-sram-migrate-pages",
 		  MADVISE_OP | MADVISE_SWIZZLE | MIGRATE_ALL_PAGES | ATOMIC_BATCH },
-		{ "preffered-loc-atomic-vram",
+		{ "preffered-loc-atomic-device",
 		  MADVISE_OP | PREFERRED_LOC_ATOMIC_DEVICE | ATOMIC_BATCH },
 		{ "preffered-loc-atomic-gl",
 		  MADVISE_OP | PREFERRED_LOC_ATOMIC_GL | ATOMIC_BATCH },
-- 
2.43.0

