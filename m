Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A5B9D11183
	for <igt-dev@archiver.kernel.org>; Thu, 27 Nov 2025 13:54:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC2F10E761;
	Thu, 27 Nov 2025 13:54:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4abpD0g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C2CB10E757
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Nov 2025 13:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764251661; x=1795787661;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nh+egS4N1wZMyL7CK2Xod1mD3ZDEqycKuVQmroV4/Zo=;
 b=B4abpD0gubJcJRZLNRo5gYngdXYoERxLlIIFUH6PJ9UTLb76OsoTaQcC
 3EiZbmKsO87KcR5h4xf4HcoNpW4iLASY2lze6mTODN2ZKYxYpRjefC+0n
 qoPMk2E20ZdSJkpw289V8wYPMXHUmy3sfLgz8IApUuJfqELXmvWHOOF+6
 sYlqw9cn5MAQD75z5T2JaNjYxXaEVyBWrBSNu0C/AAzwQzprgbOMOPAFk
 di1ZYjFse7XFZCbkkq3CZ8N7TTMc3AhmFXGyGwbWUN4q6IABVjWnRkoHC
 Ucdu2sjxOPnQ+tbQcVnYi8+P1SQeTYgFnJXnwZ+n5FYB6yEZE4wocmRQU Q==;
X-CSE-ConnectionGUID: 3tmag4OkQwGlgXyhMjCRGg==
X-CSE-MsgGUID: LfuPQjjcQYm9D44nkKvGwA==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="77400866"
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="77400866"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2025 05:54:21 -0800
X-CSE-ConnectionGUID: VIQFtRrlQca0zaZRKXPa3g==
X-CSE-MsgGUID: Bc9k3bRTShabwULC6q5ynQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,231,1758610800"; d="scan'208";a="192496098"
Received: from rgsanthosh-system-product-name.iind.intel.com ([10.190.238.65])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2025 05:54:19 -0800
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, karthik.b.s@intel.com,
 santhosh.reddy.guddati@intel.com,
 Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/2] tests/kms_async_flips: Fix vblank sequence check
 for simulation
Date: Thu, 27 Nov 2025 19:23:48 +0530
Message-ID: <20251127135348.2158579-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251127135348.2158579-1-ramanaidu.naladala@intel.com>
References: <20251127135348.2158579-1-ramanaidu.naladala@intel.com>
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

Update the timestamp validation logic to handle cases where the
vblank sequence may advance by more than one during a single
wait-for-vblank interval in simulation environments.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_async_flips.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index cbe38889e..ad6d3e18e 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -576,9 +576,13 @@ static void test_timestamp(data_t *data)
 	unsigned long vbl_time, vbl_time1;
 	unsigned int seq, seq1;
 	int ret;
+	uint32_t vbi_step;
+
 
 	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
 
+	vbi_step = kmstest_simu_vblank_seq_diff(data->drm_fd, data->pipe);
+
 	/*
 	 * In older platforms(<= gen10), async address update bit is double buffered.
 	 * So flip timestamp can be verified only from the second flip.
@@ -606,7 +610,7 @@ static void test_timestamp(data_t *data)
 
 	/* TODO: Make changes to do as many flips as possbile between two vblanks */
 
-	igt_assert_f(seq1 == seq + 1,
+	igt_assert_f(seq1 == seq + vbi_step + 1,
 		     "Vblank sequence is expected to be incremented by one(%d != (%d + 1)\n", seq1, seq);
 
 	igt_info("vbl1_timestamp = %ldus\nflip_timestamp = %ldus\nvbl2_timestamp = %ldus\n",
-- 
2.43.0

