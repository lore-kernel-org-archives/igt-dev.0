Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A45F3C26D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:22:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D485F10E4FA;
	Mon,  9 Mar 2026 14:22:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MoeGxNub";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B922710E4FA
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066154; x=1804602154;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o7kcLH7rjAdd5g77FK4zC1h+CElAwMIOsDwmP1BrH0g=;
 b=MoeGxNubtcll7XKnbYZqQaGof6HO6uaPrRZjZsJ8RqYakh2UrGxRTuTv
 iQBk74THLND6mdGBw8i6DV3Ndm6wuSEBVbvwRee5dDDDnMbPwtJAuJuw+
 vBJB26JLDBH05CcIBHr0PmnythH7zbT0C112HmKmcRBZnUw7yowFGr41v
 YDh/b3q75FunhtJiafD1WlsZD/kS+V504DQDnE1EONU/cHiVLX5oLBrQg
 XnElelqSHa0c0vf8i269ZKpvz+yfhPGdxh0Zw7m6xvqQysbHbpZvSnc9v
 b/1qmBxZXPmboW5huUhn+/z/CTf+3p8r/LBUl1cauke8c60tSG13/p4Bg g==;
X-CSE-ConnectionGUID: cNK5qNxCQTSIJx+4ZkAE3A==
X-CSE-MsgGUID: IKtx5OgySSOxyFTMYsWm4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="84799120"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="84799120"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:33 -0700
X-CSE-ConnectionGUID: eVspUJyXQ9iShB3Oik6xDQ==
X-CSE-MsgGUID: Oy/Ma04KS2ycs+3amrBM7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218915027"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:31 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 08/10] tests/kms_vblank: use CRTC indexes instead of
 pipes for CRTC tracking
Date: Mon,  9 Mar 2026 16:21:42 +0200
Message-ID: <e5066cc6d24aad560a51f9de37e5d26a46e4dd47.1773066012.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773066012.git.jani.nikula@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
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

The test tracks	"active" CRTCs in a dedicated array. This does not
depend on pipes in any way. Switch to using CRTC indexes instead.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_vblank.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index e79b2535c599..395a722bdb13 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -110,8 +110,8 @@ typedef struct {
 } data_t;
 
 static bool all_pipes;
-static enum pipe active_pipes[IGT_MAX_PIPES];
-static uint32_t last_pipe;
+static enum pipe active_crtcs[IGT_MAX_PIPES];
+static uint32_t last_crtc_index;
 
 static double elapsed(const struct timespec *start,
 		      const struct timespec *end,
@@ -522,8 +522,8 @@ static void run_subtests(data_t *data)
 					if (!crtc_output_combo_valid(&data->display, crtc, data->output))
 						continue;
 
-					if (!all_pipes && crtc->pipe != active_pipes[0] &&
-					    crtc->pipe != active_pipes[last_pipe]) {
+					if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
+					    crtc->crtc_index != active_crtcs[last_crtc_index]) {
 						igt_info("Skipping pipe %s\n",
 							 igt_crtc_name(crtc));
 						continue;
@@ -554,8 +554,8 @@ static void run_subtests(data_t *data)
 					if (!crtc_output_combo_valid(&data->display, crtc, data->output))
 						continue;
 
-					if (!all_pipes && crtc->pipe != active_pipes[0] &&
-					    crtc->pipe != active_pipes[last_pipe]) {
+					if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
+					    crtc->crtc_index != active_crtcs[last_crtc_index]) {
 						igt_info("Skipping pipe %s\n",
 							 igt_crtc_name(crtc));
 						continue;
@@ -650,9 +650,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 		/* Get active pipes. */
 		for_each_crtc(&data.display, crtc) {
 			data.crtc = crtc;
-			active_pipes[last_pipe++] = crtc->pipe;
+			active_crtcs[last_crtc_index++] = crtc->crtc_index;
 		}
-		last_pipe--;
+		last_crtc_index--;
 	}
 
 	igt_describe("Negative test for vblank request.");
@@ -679,8 +679,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 			if (!crtc_output_combo_valid(&data.display, crtc, data.output))
 				continue;
 
-			if (!all_pipes && crtc->pipe != active_pipes[0] &&
-					  crtc->pipe != active_pipes[last_pipe]) {
+			if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
+					  crtc->crtc_index != active_crtcs[last_crtc_index]) {
 				igt_info("Skipping pipe %s\n",
 					 igt_crtc_name(crtc));
 				continue;
-- 
2.47.3

