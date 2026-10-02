Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FB0CA5FDD
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 20:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ABEB10E048;
	Fri,  2 Oct 2026 20:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JSj9yyWP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20C910E693
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 20:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790972218; x=1822508218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WGqEGuVsVbvRZQOVt6SXp6hw2zc09Vh4UHpbSbE4KGM=;
 b=JSj9yyWPoyi2dVGtX76TWZN6dTHlPIVRqn0NTGpwCkuNgWBanEyJqFxB
 dK1u00x4RYDaKUnLX2aTc6P9jBVS1w32ATFMB1cIHkkz2HH+8tX8LqPfP
 XFdJZkgPTgJDM0KVxyBDBXwx1MyYPZ5n0KT0kkQnJBX+p1T7DJgy8eNXc
 IibnW6n3GQ+lODOvSKf7/7JYNPLUUiCZoLWtzrPMxU3EQpe3oW4a2IYLI
 x/1OeVz9XtGGMsngtm1WBZ2183kosoo75sAv8RaJWndoh3E4MGlEnqcBZ
 QuwpyKtXrwHdFv46Ic8ln2pzSKoUOmiaUIqEnmRmX8Glsc0FQPNwT/UPC g==;
X-CSE-ConnectionGUID: 8+ifVOksQjWETKhRZg/olA==
X-CSE-MsgGUID: L7DF0i4JSYSRsaFMjJ8hJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90877942"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90877942"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:16:58 -0700
X-CSE-ConnectionGUID: aEuPKv4GS4yAFNjMAhtXrA==
X-CSE-MsgGUID: oD8dneOmRY+IBwzi7ToUpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="407088"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:16:56 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, jani.nikula@intel.com,
 michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 2/7] tests/kms_async_flips: limit #pipes tested
 during suspend
Date: Fri,  2 Oct 2026 22:15:20 +0200
Message-ID: <20261002201525.466080-3-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261002201525.466080-1-michal.grzelak@linux.intel.com>
References: <20261002201525.466080-1-michal.grzelak@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

Test suspend on first and last pipe by default.

Alternatively test could be run on first and last CRTC; but due to pipe
reordering, this would result in using arbitrary pipes. Thus use first
and last hardware pipe when running suspend tests.

v6->v7
- use hardware pipe instead of CRTC (J-P, Jani)

v5->v6
- describe how pipe reordering affects the test (Jani)

v3->v4
- use crtc instead of display->crtcs (Thasleem)
- use proper logic operator (Thasleem)

v2->v3
- add missing S-O-B

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/kms_async_flips.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 8884efd8ba..a802ce4200 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -873,6 +873,7 @@ static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_crtc_t *crtc;
 	igt_display_t *display = &data->display;
+	int n_crtcs = igt_display_n_crtcs(display);
 
 	if (data->atomic_path)
 		require_atomic_async_cap(data);
@@ -885,6 +886,10 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			data->crtc = crtc;
 			igt_display_reset(display);
 
+			if (data->suspend_resume && crtc->hardware_pipe != PIPE_A &&
+			    crtc->hardware_pipe != PIPE_NONE + n_crtcs)
+				continue;
+
 			igt_output_set_crtc(data->output,
 					    crtc);
 			if (!intel_pipe_output_combo_valid(display))
-- 
2.45.2

