Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0171AF531F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:17:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB1910E585;
	Tue, 14 Apr 2026 07:17:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eFtqkRPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A518B10E28D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150930; x=1807686930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mzI+QRwOWCdkye5Vq2U9EW4LtkZrI7e1bzxcsfyIzHw=;
 b=eFtqkRPrR6Kgfd86Oo7AyFvwncxlLtWh/dyqe5Eoo+PwdHjsU3vXscXg
 SovGo6/16epFAdqInFYQq0duv958bL9ZgWDJNIktXYlFTWDz8G501qAKq
 ClXKrZy1jViCMbULPhZEFc5OLpr1b6R7oU7IxHSnIhlB5pc1J2ogG9CbY
 KFm0spPP7rtKxdVABWZrRMSzUbmg39MpnbxJP1RhurDImSNms+xEVHxel
 3Qt4b3JQd+b3ybWeY0q0c6Jc/Rul0MMZ8S39V+/DBO7eh+GWbJzXy1kus
 9NfchSDuFicwGhrdwaE/wJgN0Ce/Hp4UZ4/qCUnbQOLqzT6CziohF1aTs g==;
X-CSE-ConnectionGUID: UEyAN+43QUSIH3UZB3t8XA==
X-CSE-MsgGUID: bnAfcKT1SruhzrzmLaVCUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80690983"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80690983"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:30 -0700
X-CSE-ConnectionGUID: tu8AuksNQvekS2x3qrohvQ==
X-CSE-MsgGUID: xos/r8tARHSwJ25V0CTd8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225712528"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:29 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 10/16] tests/amdgpu/amd_dp_dsc: use for_each_output()
Date: Tue, 14 Apr 2026 10:14:30 +0300
Message-ID: <5e76d14a7d4c1e29f5a330259b8e474fb50cba2f.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
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

Use for_each_output() instead of manually iterating display->outputs[i].

Tweak the CRTC limit check slightly when removing the for loop.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/amdgpu/amd_dp_dsc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index c04f4d003267..b8441163681e 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -60,8 +60,9 @@ static void test_fini(data_t *data)
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
+	igt_output_t *output;
 	igt_crtc_t *crtc;
-	int i, n;
+	int n = 0;
 
 	for_each_crtc(display, crtc) {
 		data->crtc[crtc->crtc_index] = crtc;
@@ -71,9 +72,10 @@ static void test_init(data_t *data)
 			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
-	for (i = 0,
-	     n = 0; i < display->n_outputs && n < igt_display_n_crtcs(display); ++i) {
-		igt_output_t *output = &display->outputs[i];
+	for_each_output(display, output) {
+		if (n == igt_display_n_crtcs(display))
+			break;
+
 		data->output[n] = output;
 
 		/* Only allow physically connected displays for the tests. */
-- 
2.47.3

