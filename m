Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE729CAC58E
	for <igt-dev@archiver.kernel.org>; Fri, 12 Sep 2025 03:15:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508C810E40F;
	Fri, 12 Sep 2025 03:15:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WCMGjQOH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D2CB10E41D
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Sep 2025 03:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757646912; x=1789182912;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pON1S09gk+z1fBLTTLrCuWXAxY1nx/hcatPbFGZCdSs=;
 b=WCMGjQOHVZ0J2qwuwlCqYLNKzdNGvGAaEEkti2wQFiaXc8Bwn+Px/4fl
 VTO7HpvphzH8QxPksKcYXkUNYC6NQRdB6R3mJJjRe012AAX6cSRnPepxB
 l1weLc29WpLtvEBlL0oHeJ+fljuMiQWBpTpZOwuc1fZ0+XNFFqSUJWM/9
 eaIil1nHOCLhSRq9zJTTFqR46blLiLLhpxOGF+om8bk6w92ElHRGHDrlT
 ZgURk3BqjXyt0mQ9jY4+Z4nVQEW/zwuF966soR4K6O6zHC1KC3Rv9L5fk
 pzsFDcBLh5erHx7ZYtCrhxC7QgwUCzd1GfBdWZqWS++1sotLgNw2RdmxG w==;
X-CSE-ConnectionGUID: YMxvU0nqTbWG9C9cFhc8Ng==
X-CSE-MsgGUID: 3uVVKBoMQLa0juud3xYjiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="71416045"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="71416045"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 20:15:11 -0700
X-CSE-ConnectionGUID: NmQxBdZ4QXCaR+ajT4AXjg==
X-CSE-MsgGUID: W3ava0eCTWeVbAetnMbkAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="179072190"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by fmviesa004-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2025 20:15:10 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: kunal1.joshi@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/chamelium/kms_chamelium_audio: Reset chamelium
 before audio test and retry ALSA open
Date: Fri, 12 Sep 2025 08:45:02 +0530
Message-ID: <20250912031502.1306841-1-jeevan.b@intel.com>
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

Ensure chamelium is reset at the start of audio tests and retry ALSA
output open once after reset to improve test stability.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/chamelium/kms_chamelium_audio.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/tests/chamelium/kms_chamelium_audio.c b/tests/chamelium/kms_chamelium_audio.c
index 4feae6a93..a251bfb72 100644
--- a/tests/chamelium/kms_chamelium_audio.c
+++ b/tests/chamelium/kms_chamelium_audio.c
@@ -722,6 +722,9 @@ static void test_display_audio(chamelium_data_t *data,
 	 * chamelium_get_audio_format support. */
 	igt_require(chamelium_has_audio_support(data->chamelium, port));
 
+	chamelium_reset(data->chamelium);
+	igt_info("Chamelium reset at start of audio test\n");
+
 	alsa = alsa_init();
 	igt_assert(alsa);
 
@@ -752,7 +755,12 @@ static void test_display_audio(chamelium_data_t *data,
 	for (i = 0; i < test_sampling_rates_count; i++) {
 		for (j = 0; j < test_formats_count; j++) {
 			ret = alsa_open_output(alsa, audio_device);
-			igt_assert_f(ret >= 0, "Failed to open ALSA output\n");
+			if (ret < 0) {
+				sleep(1);
+				igt_info("ALSA open failed, resetting Chamelium and retrying once\n");
+				ret = alsa_open_output(alsa, audio_device);
+			}
+			igt_assert_f(ret >= 0, "Failed to open ALSA output after reset\n");
 
 			/* TODO: playback on all 8 available channels (this
 			 * isn't supported by Chamelium devices yet, see
-- 
2.43.0

