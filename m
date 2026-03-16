Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9DAEF46452
	for <igt-dev@archiver.kernel.org>; Mon, 16 Mar 2026 11:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 994DB10E4B3;
	Mon, 16 Mar 2026 11:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfYCVgE4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A890110E4AA
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Mar 2026 11:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773660008; x=1805196008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yRqaYu/j8r3MSTUfj3JB48AOJOGbafb0rMoGkY/f9uI=;
 b=SfYCVgE4za3EJezbcCczSdOavNnAdjaW8J/cLAOY42H/E1xkiVRmctEp
 8dqelzmnC/ztLo2AzpjvYZ+jthrccLsdi9UQcP4Ceb9f3nfBO135vtRFX
 Y+HwSaE1dSYhWchz8OYiiJ3pVz+7lqJd+k7W0G77MRkJpnKJM+rVbz1JL
 9QvnBMFwYknr2bv54nPlkqh91dgOSWwvTgAn6W7M67WJtPzq1UHrixpA9
 D+7p02ztYJiYEFsngnGXD1zZRENrrJf9OKTErHpUCJUrc7c/4ZVneAiwT
 hCdNboPOiOQBzHzR0cX/+ZfVJtN9eXf3X5455L9/8KUp4V7dsfHGwX6D9 g==;
X-CSE-ConnectionGUID: 5UJcMdrmTqG8IuATg0u11w==
X-CSE-MsgGUID: CLhq7EegTIulIGs935g06Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11730"; a="74562432"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="74562432"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:20:08 -0700
X-CSE-ConnectionGUID: 1LSFN0L+SNSEx9g+uQn1Eg==
X-CSE-MsgGUID: JokRWw2qR6WIHqecXOkRoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; d="scan'208";a="221833009"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2026 04:20:07 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 10/12] tests/kms_bw: avoid igt_crtc_for_pipe() and
 crtc->pipe usage
Date: Mon, 16 Mar 2026 13:19:12 +0200
Message-ID: <de69d2495b6690cab66e6569141b3e050c9e18bf.1773659680.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773659680.git.jani.nikula@intel.com>
References: <cover.1773659680.git.jani.nikula@intel.com>
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

The test doesn't really care about pipes. It does conflate a lot of
loops with pipes. Try to avoid that by using the CRTC index instead.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_bw.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index 056aa667d795..4df5c2cee885 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -125,12 +125,11 @@ static void test_init(data_t *data, bool physical)
 	data->connected_outputs = 0;
 
 	for_each_crtc(display, crtc) {
-		data->crtc[crtc->pipe] = crtc;
-		data->primary[crtc->pipe] = igt_crtc_get_plane_type(crtc,
-								    DRM_PLANE_TYPE_PRIMARY);
-		data->pipe_crc[crtc->pipe] =
-			igt_crtc_crc_new(crtc,
-					 IGT_PIPE_CRC_SOURCE_AUTO);
+		data->crtc[crtc->crtc_index] = crtc;
+		data->primary[crtc->crtc_index] =
+			igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY);
+		data->pipe_crc[crtc->crtc_index] =
+			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
 	for (i = 0; i < display->n_outputs && i < max_pipes; i++) {
@@ -163,8 +162,8 @@ static void test_fini(data_t *data)
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
-		if (data->pipe_crc[crtc->pipe])
-			igt_pipe_crc_free(data->pipe_crc[crtc->pipe]);
+		if (data->pipe_crc[crtc->crtc_index])
+			igt_pipe_crc_free(data->pipe_crc[crtc->crtc_index]);
 	}
 
 	igt_display_reset(display);
@@ -240,7 +239,7 @@ static void run_test_linear_tiling(data_t *data, int n_crtcs, const drmModeModeI
 
 	/* create buffers */
 	for (i = 0; i < n_crtcs; i++) {
-		crtc = igt_crtc_for_pipe(display, i);
+		crtc = data->crtc[i];
 
 		output = physical ? data->connected_output[i] : data->output[i];
 		if (!output || !output_mode_supported(output, mode)) {
-- 
2.47.3

