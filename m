Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E2AC54E90
	for <igt-dev@archiver.kernel.org>; Wed, 21 May 2025 11:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3844B10F070;
	Wed, 21 May 2025 11:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WxNtVueJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB038112E09
 for <igt-dev@lists.freedesktop.org>; Wed, 21 May 2025 11:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747825373; x=1779361373;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VIKn5LkIcr0BXLioCsTlp1KXGwGvz8aQdiH/7qSPkbQ=;
 b=WxNtVueJbxL1GwDXKRU5r5dZcGK7MgubfODf0RK7qrZ++KN+5MgBA9Xp
 79t2sfVMrFRtN+CRHmVj2yOB8BeTaJUIHbDLjSg/+dcajA9yqjmhrz19f
 3Ks8Ygnh+CLcDANt+qU/zBHV+dET7fVddP2Cwcy6IiLUNK3sDVNam3oVv
 RiXZK1qsig8NQKUlBR7hnKEEjuiE6HfBSk8kb8qirRMe33PYRbs36LTEm
 iVV73TtkiXtDr2yoiVhC+Vdq5LrxEZnlLaznR7NFYBOfiZpskP35oXEwR
 VERfkm/dKkuUXtZDHuXwZHlQN1IpMv37BJQvLHyz4vOFF4Kj5iIb+vc/B Q==;
X-CSE-ConnectionGUID: fUjA925aTfWJ6d0kSO27PQ==
X-CSE-MsgGUID: KaN6eXUcRK+S6J75Azul8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="52424794"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="52424794"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:02:52 -0700
X-CSE-ConnectionGUID: eU8LTv/uShiYtQEElW83Xw==
X-CSE-MsgGUID: r4ASvGZ/R5eMOYn6JdbmbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; d="scan'208";a="141082058"
Received: from ifwibot07.gar.corp.intel.com (HELO
 rgsanthosh-Z690I-A-ULTRA-PLUS.iind.intel.com) ([10.190.216.152])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2025 04:02:45 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, arun.r.murthy@intel.com,
 chaitanya.kumar.borah@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v10 5/5] tests/kms_async_flips: Skip Async Flips with
 Linear Modifier
Date: Wed, 21 May 2025 16:23:08 +0530
Message-Id: <20250521105308.4179637-6-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250521105308.4179637-1-santhosh.reddy.guddati@intel.com>
References: <20250521105308.4179637-1-santhosh.reddy.guddati@intel.com>
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

Skip linear modifier async flip subtests on intel platforms with display
version less than 12.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index f824f60f9..66dbbd5ab 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -988,6 +988,9 @@ igt_main
 		igt_describe("Wait for page flip events in between successive asynchronous "
 			     "flips with linear modifiers");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
+			if (is_intel_device(data.drm_fd) &&
+			    intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 12)
+				igt_skip("Async Flips with linear is not supported");
 			test_init_ops(&data);
 			data.linear_modifier = true;
 			run_test(&data, test_async_flip);
@@ -996,6 +999,9 @@ igt_main
 		igt_describe("Wait for page flip events in between successive asynchronous "
 			     "flips using atomic path with linear modifiers");
 		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear-atomic") {
+			if (is_intel_device(data.drm_fd) &&
+			    intel_display_ver(intel_get_drm_devid(data.drm_fd)) < 12)
+				igt_skip("Async Flips with linear is not supported");
 			test_init_ops(&data);
 			data.linear_modifier = true;
 			run_test(&data, test_async_flip);
-- 
2.34.1

