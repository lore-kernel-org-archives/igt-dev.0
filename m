Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3034ACD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 06:26:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EBA210E0EB;
	Wed, 13 May 2026 06:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IA43wNyv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CFE8953E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 06:25:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778653534; x=1810189534;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ghU5JK5Ti2X4FefacgVGGJapvYGJhjGEATPzBmqdgjU=;
 b=IA43wNyvxYb8qQwDt7nPNhH2JkywwnXTkTzsts53xvza/oqBxGwS88MN
 VETsb+nYMhpj9punSaScnIT5uuL46m/jZzbU8E5eSDlYTry3PgcXGY04Z
 EpRO+hj/y/5RYkZDqBg1ePGJs+NVl/L5GR8O9KpkK8PFJHkYljWPtXtyD
 JxUNYTTdOWTfA4oukCKWCgVBcgPb69vo1/Djr+yg0uqFJy426qEj/JgIP
 v7jGooswGxcvjQb6leuOnvVMiyvkQp3fKGM3w0vO7YrydnQQ/cVtOkrTT
 LTCEUel9xJyy7LyimnysBoYHTXTvyx6LQGXQN9qgWlAkZ/TCyUPOXW7e3 Q==;
X-CSE-ConnectionGUID: 0E9/BcvNTy6U+GCKzPhACw==
X-CSE-MsgGUID: 6OXn1q03TsuVg+ILWSlPSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="96999752"
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="96999752"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2026 23:25:34 -0700
X-CSE-ConnectionGUID: PekrdwYIRje4F506Lk9R0Q==
X-CSE-MsgGUID: Q2rSFNx8QSKWjyr6EBaJsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,232,1770624000"; d="scan'208";a="268333848"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa002.jf.intel.com with ESMTP; 12 May 2026 23:25:33 -0700
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Mohammed Bilal <mohammed.bilal@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/kms_chamelium_color: Free captured frame dumps
 after use
Date: Wed, 13 May 2026 11:31:04 +0530
Message-Id: <20260513060104.3235845-1-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
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

chamelium_read_captured_frame() allocates a chamelium_frame_dump that
must be freed by the caller using chamelium_destroy_frame_dump().

Add the missing chamelium_destroy_frame_dump() calls.

Cc: Mohammed Bilal <mohammed.bilal@intel.com>
Cc: Swati Sharma <swati2.sharma@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/chamelium/kms_chamelium_color.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/chamelium/kms_chamelium_color.c b/tests/chamelium/kms_chamelium_color.c
index d43c3be77..31629ec58 100644
--- a/tests/chamelium/kms_chamelium_color.c
+++ b/tests/chamelium/kms_chamelium_color.c
@@ -137,6 +137,7 @@ static bool test_pipe_degamma(data_t *data,
 	ret = chamelium_frame_match_or_dump(data->chamelium, port,
 					    frame_fullcolors, &fbref,
 					    CHAMELIUM_CHECK_ANALOG);
+	chamelium_destroy_frame_dump(frame_fullcolors);
 
 	disable_degamma(primary->crtc);
 	igt_plane_set_fb(primary, NULL);
@@ -226,6 +227,7 @@ static bool test_pipe_gamma(data_t *data,
 	ret = chamelium_frame_match_or_dump(data->chamelium, port,
 					    frame_fullcolors, &fbref,
 					    CHAMELIUM_CHECK_ANALOG);
+	chamelium_destroy_frame_dump(frame_fullcolors);
 
 	disable_gamma(primary->crtc);
 	igt_plane_set_fb(primary, NULL);
@@ -320,6 +322,7 @@ static bool test_pipe_ctm(data_t *data,
 					     frame_hardware,
 					     &fbref,
 					     CHAMELIUM_CHECK_ANALOG);
+	chamelium_destroy_frame_dump(frame_hardware);
 
 	igt_plane_set_fb(primary, NULL);
 	disable_degamma(primary->crtc);
@@ -421,6 +424,8 @@ static bool test_pipe_limited_range_ctm(data_t *data,
 	ret = chamelium_frame_match_or_dump_frame_pair(data->chamelium, port,
 						       frame_full, frame_limited,
 						       CHAMELIUM_CHECK_ANALOG);
+	chamelium_destroy_frame_dump(frame_full);
+	chamelium_destroy_frame_dump(frame_limited);
 
 	free_lut(gamma_linear);
 	free_lut(degamma_linear);
-- 
2.25.1

