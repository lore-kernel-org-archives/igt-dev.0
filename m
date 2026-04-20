Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7CAF36C41
	for <igt-dev@archiver.kernel.org>; Mon, 20 Apr 2026 08:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDB0710E13A;
	Mon, 20 Apr 2026 08:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PaLlG4JE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A87110E0FE
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2026 08:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776672586; x=1808208586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=s4ZPIcjNrmzhoINxE1aTY5/WZzNarnpFEiBPesLbiD8=;
 b=PaLlG4JE9xuCB56XtSe6CsLeS+tZLiIjz+UPlQtsIyn464Pii72+bNdd
 9i7rO25uFO6Q9fnFegK/grkUwGHd0NULx3OvzYtYHGAhaFQ8eYs0cK6kv
 S7rA7gwu8W74Z+phKOD9fezj1Mvx3wZHN4DSEMeM0OhDcLED6H8xqyx7U
 o+4JoPHOa+lTOasQWp2N40JXNT0CZZ4EZPGZ94+jfEUOBR2Zr2UXQUcF2
 EwSUaWXC3InhVArDykPdJoMxum1+iKZUFAoiyEDopcctE7IXndaYEsex9
 eai42q7TZrXKWPRCYzD80L/uL+GgEyFhEQeMRDTfpJ9Wjz39dy0cqiYCy A==;
X-CSE-ConnectionGUID: M3cAVTgTTLygH3DTJNbGIA==
X-CSE-MsgGUID: 0isZWYyrTayO6mU11TH0kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="77596243"
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="77596243"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:09:45 -0700
X-CSE-ConnectionGUID: sC77JYevSAGDYjo0lMeYlg==
X-CSE-MsgGUID: wCKbM+AiQ8CS2FUakil42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,189,1770624000"; d="scan'208";a="225160427"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.126])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 01:09:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t] tests/kms_bw: use igt_display_n_crtcs()
Date: Mon, 20 Apr 2026 11:09:33 +0300
Message-ID: <20260420080933.2850063-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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

Now that igt_display_n_crtcs() returns the actual number of CRTCs again,
use it instead of iterating and counting separately.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_bw.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 4df5c2cee885..00677b4ae765 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -220,16 +220,12 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 	igt_output_t *output;
 	struct igt_fb buffer[IGT_MAX_PIPES];
 	igt_crc_t zero, captured[IGT_MAX_PIPES];
-	int i = 0, num_pipes = 0;
+	int i = 0;
 	igt_crtc_t *crtc;
 	int ret;
 	bool has_supported_mode = false;
 
-	/* Cannot use igt_display_n_crtcs() due to fused pipes on i915 where they do
-	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
-	for_each_crtc(display, crtc) num_pipes++;
-
-	igt_skip_on_f(n_crtcs > num_pipes,
+	igt_skip_on_f(n_crtcs > igt_display_n_crtcs(display),
                       "ASIC does not have %d pipes\n", n_crtcs);
 
 	test_init(data, physical);
-- 
2.47.3

