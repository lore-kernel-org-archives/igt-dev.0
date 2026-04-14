Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A83ECF531FA
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3881810E072;
	Tue, 14 Apr 2026 07:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMQ3OApC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9A010E072
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150890; x=1807686890;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UpbRexXM9vooHZVFGBUOV8+dt1YDtI1lKiz9/BUczBY=;
 b=IMQ3OApCAHzTAH8F+wk3Z1PEV5RKQNXs10HRERshEr+cfCPnPQfn/WlB
 OUCwYYCVCuAQTGkpwe7xhg6djFqQ7eXMNJpsggYGKo2vyHObx3dZ1i1K5
 XKeYHqpWH1Z5YHWUAHsXmOlcyOKaPVZkYI3bThRr9y3QPTMYOlG7zOto5
 8YN4J/EzLx6aSyvcBbap2dUW3Ohy3hwek+nLapfy51D200uUSQMUJ4ldI
 cpW2gVJT7c0dyEIC6FX5nUdlql96MSdyfRxoGy/5/R9o4QpSxdY2S/teL
 plSgeBDxqXtUNkO+Gt6VoOaw09XOBo22d0VuVC18uqPjx+fZYV0bHfOnM g==;
X-CSE-ConnectionGUID: zE+iAe+2S7axi/hFR7QpHQ==
X-CSE-MsgGUID: 1yl5CWZ5TlaomeY3dFZvRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102555709"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="102555709"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:14:50 -0700
X-CSE-ConnectionGUID: MgGQkUnPR5Klyw9LWTuE6w==
X-CSE-MsgGUID: oSERLM8OT96HBEn5RCxqbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="234046728"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:14:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 01/16] tests: prefer igt_plane_t over struct igt_plane
Date: Tue, 14 Apr 2026 10:14:21 +0300
Message-ID: <2a3928d26fff5a57743d8a7d312bf953522673c1.1776150714.git.jani.nikula@intel.com>
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

The typedefs are meant to be used instead of the plain structs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/intel/kms_dp_link_training.c      |  4 ++--
 tests/intel/kms_dp_linktrain_fallback.c | 12 ++++++------
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index d859db64b4ff..6aa63cdd8062 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -118,7 +118,7 @@ static void assert_link_status_good(data_t *data, bool mst)
  */
 static void setup_planes_fbs(data_t *data, igt_output_t *outs[],
 			     int count, drmModeModeInfo *modes[],
-			     struct igt_fb fbs[], struct igt_plane *planes[])
+			     struct igt_fb fbs[], igt_plane_t *planes[])
 {
 	int i;
 
@@ -148,7 +148,7 @@ static void do_modeset(data_t *data, bool mst)
 	igt_output_t *outs[IGT_MAX_PIPES];
 	drmModeModeInfo *modes[IGT_MAX_PIPES];
 	struct igt_fb fbs[IGT_MAX_PIPES];
-	struct igt_plane *planes[IGT_MAX_PIPES];
+	igt_plane_t *planes[IGT_MAX_PIPES];
 	int n_pipes = 0;
 	int out_count = 0;
 	igt_crtc_t *crtc;
diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
index 2db5422c211d..661af7d165e7 100644
--- a/tests/intel/kms_dp_linktrain_fallback.c
+++ b/tests/intel/kms_dp_linktrain_fallback.c
@@ -41,7 +41,7 @@ typedef struct {
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	struct igt_fb fb;
-	struct igt_plane *primary;
+	igt_plane_t *primary;
 	int n_pipes;
 } data_t;
 
@@ -115,7 +115,7 @@ static void setup_modeset_on_outputs(data_t *data,
 				     int *output_count,
 				     drmModeModeInfo *mode[],
 				     struct igt_fb fb[],
-				     struct igt_plane *primary[])
+				     igt_plane_t *primary[])
 {
 	int i;
 
@@ -159,7 +159,7 @@ static bool validate_modeset_for_outputs(data_t *data,
 					int *output_count,
 					drmModeModeInfo *mode[],
 					struct igt_fb fb[],
-					struct igt_plane *primary[])
+					igt_plane_t *primary[])
 {
 	igt_require_f(*output_count > 0, "Require at least 1 output\n");
 	setup_pipe_on_outputs(data, outputs, output_count);
@@ -173,7 +173,7 @@ static bool validate_modeset_for_outputs(data_t *data,
 static bool setup_outputs(data_t *data, bool is_mst,
 		      igt_output_t *outputs[],
 		      int *output_count, drmModeModeInfo *mode[],
-		      struct igt_fb fb[], struct igt_plane *primary[])
+		      struct igt_fb fb[], igt_plane_t *primary[])
 {
 	bool ret;
 
@@ -307,7 +307,7 @@ static bool fix_link_status_and_recommit(data_t *data,
 					 int *output_count,
 					 drmModeModeInfo * modes[],
 					 struct igt_fb fbs[],
-					 struct igt_plane *primaries[])
+					 igt_plane_t *primaries[])
 {
 	int i;
 	igt_output_t *out;
@@ -347,7 +347,7 @@ static void test_fallback(data_t *data, bool is_mst)
 	igt_output_t *outputs[IGT_MAX_PIPES];
 	drmModeModeInfo * modes[IGT_MAX_PIPES];
 	struct igt_fb fbs[IGT_MAX_PIPES];
-	struct igt_plane *primaries[IGT_MAX_PIPES];
+	igt_plane_t *primaries[IGT_MAX_PIPES];
 	struct udev_monitor *mon;
 
 	retries = SPURIOUS_HPD_RETRY;
-- 
2.47.3

