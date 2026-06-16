Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3EACD98CF
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jun 2026 09:06:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2548E10E944;
	Tue, 16 Jun 2026 09:06:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+8XHYS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6809410E944
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jun 2026 09:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781600777; x=1813136777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=osZgEDzJkD2Y6pRXe3M5UrHODRO8Q33vXWJuV8VE/iI=;
 b=M+8XHYS8lochAZLPe2+GHkn7hrWShrusOjYpTkb0p7x4AmC6pPyvi/TC
 EyehuhMf4m3O4AsCYPo8jsoRNmFD9eZoaan6Gx+Ba/GDfxSjPPdP1XnIJ
 tD8kOOXa29lgzykX33ubQ4vNbLZ3IKU+Vemmuz1V2SD4q8KJ/9G/NvGiG
 XJ+DbQJBNWgP33MzgnIdSyEJPJRerv2aQrHGOEQD7KMhWKrJer46AusH3
 AbjxxrD2Kc2ZcvNgkqTE2O8GoeTL/qYyW4NjR6E4cgnnebmQeevhEu/m5
 hYZYwFWxWF/TEfkfBHXaj7fefpAEL5ycciPHJ0IhaEwRJKddrLUodDXZi A==;
X-CSE-ConnectionGUID: HkTb9TzgS8CDke0991EIHw==
X-CSE-MsgGUID: fJSDly4KSjW7KJy4D2NUow==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="107790249"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="107790249"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:06:17 -0700
X-CSE-ConnectionGUID: cssj+55bSH+eUM+EELiwyQ==
X-CSE-MsgGUID: Z3JFHo2AT5ujomv7IHWq3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; d="scan'208";a="243556897"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.244.167])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2026 02:06:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 1/3] tests/kms_bw: use igt_display_n_crtcs()
Date: Tue, 16 Jun 2026 12:06:08 +0300
Message-ID: <20260616090610.2106378-1-jani.nikula@intel.com>
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
index 42b7a0123575..ea7cf7bacde8 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -240,15 +240,11 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 	drmModeModeInfo fb_mode;
 	struct igt_fb buffer[IGT_MAX_PIPES];
 	igt_crc_t zero, captured[IGT_MAX_PIPES];
-	int i = 0, num_pipes = 0;
+	int i = 0;
 	igt_crtc_t *crtc;
 	int ret;
 
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

