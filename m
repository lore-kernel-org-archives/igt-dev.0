Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A16CCF9E3
	for <igt-dev@archiver.kernel.org>; Mon, 10 Nov 2025 19:25:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0544F10E374;
	Mon, 10 Nov 2025 19:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BRH2PBTS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC2810E308
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Nov 2025 19:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762802709; x=1794338709;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zvtQNYwODZihKyY1DxNFnT+WR+CDTbZ+wh0ufNrBQtk=;
 b=BRH2PBTS7USzMerqLh9fMo1Ylw0yVlXgdmfQG+sCtWgh+0Y94Kcb3uh3
 b4ziSdG+28ajmW4pPYlJObEk7Scdf/j2hjeX+u22CUf7CxL15xx4woSm7
 zaaucKYuEDrIc1kTS2MbQERxg+I88EOpwjgixUFd2T79X6gXxaM/NulGA
 sRjh9zAkCtRqz6DYIBC32QVIv9cLa4JJUCjtH4yH/eiTlvGnD5f632fLA
 dhp5ZzGkiCf11WlceAhQqIuYVj1r2xZQT/GeW6CUkKF4/k2KIsbYoi+dU
 Tn1+5PdTSva1ufTMgbM9YXCmFDwfEgsYymCuP+LvybOhssGia9xqg5fLr Q==;
X-CSE-ConnectionGUID: OBw3iWBPQaaovW/QnsXzDw==
X-CSE-MsgGUID: g4QEwHpXSPKgJ4t2kSpp7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64900254"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="64900254"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 11:25:09 -0800
X-CSE-ConnectionGUID: Z4XSszsqTACQs/mhfG6ctA==
X-CSE-MsgGUID: ed/ROkoQRF6Jdkm7ZUk2Iw==
X-ExtLoop1: 1
Received: from linux-panther-lake-client-platform.iind.intel.com
 ([10.190.238.55])
 by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 11:25:07 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com, vinod.govindapillai@intel.com,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v1 2/8] Revert "tests/intel/kms_dirtyfb: Enable the tests
 support variations based on the WAs"
Date: Tue, 11 Nov 2025 00:54:48 +0530
Message-ID: <20251110192454.44385-3-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251110192454.44385-1-mohammed.thasleem@intel.com>
References: <20251110192454.44385-1-mohammed.thasleem@intel.com>
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

This reverts commit 692c8ec03ac38699bb4aef87942651d565f578e4.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_dirtyfb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_dirtyfb.c b/tests/intel/kms_dirtyfb.c
index 51b4d446f..a5707c5b1 100644
--- a/tests/intel/kms_dirtyfb.c
+++ b/tests/intel/kms_dirtyfb.c
@@ -381,9 +381,8 @@ igt_main
 					data.mode = igt_output_get_mode(data.output);
 
 					/* FBC disabled: Wa_16023588340 */
-					igt_skip_on_f(data.feature == FEATURE_FBC &&
-						      intel_is_fbc_disabled_by_wa(data.drm_fd),
-						      "WA has disabled FBC on BMG\n");
+					igt_skip_on_f((IS_BATTLEMAGE(data.devid) && data.feature == FEATURE_FBC),
+						       "FBC isn't supported on BMG\n");
 
 					/* FBC Disp_ver 8 and below supports only I915_FORMAT_MOD_X_TILED */
 					if (data.feature == FEATURE_FBC &&
-- 
2.48.1

