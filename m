Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27981EC1EB3
	for <igt-dev@archiver.kernel.org>; Thu,  5 Feb 2026 13:30:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF17310E89D;
	Thu,  5 Feb 2026 13:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O9HMCDlR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815A010E89D
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Feb 2026 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770298226; x=1801834226;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=K9ThceEnvBo57TW9AHXT5jWg26OPT3oByiLu/fVXXvI=;
 b=O9HMCDlRHErF8Xonoe965uLvpIZhJd+r2K6LdbHJzYqmw0J4/hIVy5NX
 iyw4hTfGyeuqPdbs4Dfk+m37N/k+ohtNIYEicyw8xyOUVkQzC/d1XuHKE
 v0DtsdWzRCfkPe1fPriDO4Nn8GZ0uTjN9uspbP5rLzonZ3j6hwAxxa7PS
 prNtNVoUCR8keNdGt/g7CNsY4VVWFq8YPZgbVDHm9MQxApSQcelmnWatV
 A+mi9bnGy0/tStu3AbL20Wd+YfV9rH2PIa3oe8WAL2+EyuZGiHzJarnHM
 Rl4vLoTXHhB+a/VczZYfB2ozgB9r2iaIiK6KICLxbAlpyjW3lOIDZLqC6 Q==;
X-CSE-ConnectionGUID: 6YWRV6yKQAWV1CYZKM0YyQ==
X-CSE-MsgGUID: QLG+sSPCThib271rNg8veg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71390491"
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="71390491"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:26 -0800
X-CSE-ConnectionGUID: sD9Sf2TGTNqZUv0dxeLDEQ==
X-CSE-MsgGUID: b13k6YYURoOUQPbT/zIOYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,274,1763452800"; d="scan'208";a="215020976"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.244.121])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2026 05:30:25 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 01/12] tests/intel/kms_frontbuffer_tracking: Convert to
 for_each_crtc()
Date: Thu,  5 Feb 2026 15:30:08 +0200
Message-ID: <20260205133019.9161-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
References: <20260205133019.9161-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Convert kms_frontbuffer_trackin to use for_each_crtc() instead
of for_each_pipe(). Coccinelle hates kms_frontbuffer_tracking
so do this by hand.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index b60874db000a..58bc92a39422 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -4149,8 +4149,8 @@ struct option long_options[] = {
 int igt_main_args("", long_options, help_str, opt_handler, NULL)
 {
 	struct test_mode t;
-	enum pipe pipe;
 	igt_output_t *output;
+	igt_crtc_t *crtc;
 
 	igt_fixture() {
 		setup_drm();
@@ -4225,25 +4225,25 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
 				      "FBC isn't supported on BMG\n");
 
-			for_each_pipe(&drm.display, pipe) {
-				if (pipe == default_pipe) {
-					igt_info("pipe-%s: FBC validated in other subtest\n", kmstest_pipe_name(pipe));
+			for_each_crtc(&drm.display, crtc) {
+				if (crtc->pipe == default_pipe) {
+					igt_info("pipe-%s: FBC validated in other subtest\n", igt_crtc_name(crtc));
 					continue;
 				}
 
-				if (!intel_fbc_supported_on_chipset(drm.fd, pipe)) {
-					igt_info("Can't test FBC: not supported on pipe-%s\n", kmstest_pipe_name(pipe));
+				if (!intel_fbc_supported_on_chipset(drm.fd, crtc->pipe)) {
+					igt_info("Can't test FBC: not supported on pipe-%s\n", igt_crtc_name(crtc));
 					continue;
 				}
 
 				pipe_crc = NULL;
 				setup_crcs();
 
-				for_each_valid_output_on_pipe(&drm.display, pipe, output) {
-					init_mode_params(&prim_mode_params, output, pipe);
+				for_each_valid_output_on_pipe(&drm.display, crtc->pipe, output) {
+					init_mode_params(&prim_mode_params, output, crtc->pipe);
 					setup_fbc();
 
-					igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
 						      igt_output_name(output))
 						rte_subtest(&t);
 
-- 
2.52.0

