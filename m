Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFD89F532FA
	for <igt-dev@archiver.kernel.org>; Tue, 24 Mar 2026 09:02:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D1C10E636;
	Tue, 24 Mar 2026 09:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gI/Et8eu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C51810E5B1
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2026 09:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774342930; x=1805878930;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M2AvNeMbl3f3Se5op0o2kAaJU6Lof5bgtwnRptJbljk=;
 b=gI/Et8euVMXuUvTUfOk6vkb1QnwXAS7UzCQK/hQwXA64tBgHYHNbEjE6
 R5Gydq7hoYGUooiaiK4watVKGIV/D81LVlEWH3x7Z0IIm4Tis8ujIF3vM
 CJQBe1ceCYSSg4NylygdgzMQnwESHVKyr130jmkZEJzqTj1803g0PVvGT
 KLeyERcA9kI6NYlLvFauCghEpy6ymi17ggFoYVNmiiElLKhjIbuyTdoMk
 +bOYuSZmhx0C/71kkzGzdoQWoL/7SyCT2F+pl2PFtn/fsjF+kWburcdNl
 YzdmxGViTXCR/22Fd2t9Qk1HNvX/wgUbZidzYwLv3GCwVdNdFdyEhzGki A==;
X-CSE-ConnectionGUID: 2kNZZZ2eSsuhJbDBdC7FVA==
X-CSE-MsgGUID: ifOLHRTNT4OWvqag6WeTuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86722596"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="86722596"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:10 -0700
X-CSE-ConnectionGUID: WsjKr99iQaGoDypPU9FLBg==
X-CSE-MsgGUID: yoNtQ4RHSYONmiwBcUVB2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; d="scan'208";a="229222644"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.52])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2026 02:02:09 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [CI 3/5] tests/kms_bw: avoid igt_crtc_for_pipe() and crtc->pipe usage
Date: Tue, 24 Mar 2026 11:01:49 +0200
Message-ID: <9ad977e1ec891e1ba11ee44711c30f05377a369e.1774342824.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774342824.git.jani.nikula@intel.com>
References: <cover.1774342824.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
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

