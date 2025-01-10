Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12EEE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 12:34:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAB710E4FE;
	Fri, 10 Jan 2025 12:34:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FK5t783R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A858010F087
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 12:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736512456; x=1768048456;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Gtd+Ail+fxhZ5JwSjSCvi2HxD1JuI54+EdUR0AWH+U=;
 b=FK5t783RWFnwvIxTaijhOgNAHrxzcoNIEGqQyNM1MdehGRYnK0TIUHBr
 3DfNwqc4TlltYL/tx01EK2i2DjdzJNhjQ/LB2UV2RWSYwJ1B4DeTrs/jy
 Cf6KSDDa+7F3SklzAQKemlNAsOfPrEizNsOesFpuDvivkITKwuuINNEJ4
 nuXGB9IDnlolwh+K/xghzhNE24xsrh5tp+wyUX2nJVFUK+/ctSJKrduyp
 hgg2rMM49Q6ErBg8ibL3eihPy+G8k2IXenoPUQoSfCLJ98tu+5ZOtVTwb
 QPyVLA9D442jkPNonWAtXCS6wkTDtUB8x301S9rwFhvXCk966VLABJs67 A==;
X-CSE-ConnectionGUID: /oQH4GytQxaabys51wKMXg==
X-CSE-MsgGUID: HH2zzusDSY2BP4D3z+sjVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36964769"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="36964769"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 04:34:15 -0800
X-CSE-ConnectionGUID: 9VoWglYUQqKx3StQTYLlMA==
X-CSE-MsgGUID: kOsqntEOSOGAjwol9Jrong==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="104279885"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO hazy.intel.com)
 ([10.245.244.132])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2025 04:34:14 -0800
From: Luca Coelho <luciano.coelho@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com
Subject: [PATCH i-g-t] tests/kms_plane_scaling: get mode only after setting
 the output pipe
Date: Fri, 10 Jan 2025 14:34:03 +0200
Message-ID: <20250110123403.1818011-1-luciano.coelho@intel.com>
X-Mailer: git-send-email 2.45.2
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

We find the mode before adding the dynamic intel-max-source-size
subtests because we don't want to add substests that don't have a
valid mode.  However, during the test itself, the mode info instance
is not valid anymore, because it is deallocated when setting the
output pipe.

To solve this, we need to get the mode info _after_ setting the output
pipe.  Avoid passing the mode to intel_max_source_size_test(), pass
the entire invalid_paramtests struct and let the function find the
correct mode info again.

Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
---
 tests/kms_plane_scaling.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 43f578d5553b..4e74f0e107df 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -1271,15 +1271,26 @@ static drmModeModeInfo *find_mode(data_t *data, igt_output_t *output, const stru
  *		max_dst_h = 8192
  */
 static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *output,
-				       drmModeModeInfo *mode, const uint32_t planesize[])
+				       const struct invalid_paramtests *param)
 {
 	igt_fb_t fb;
 	igt_plane_t *plane;
 	int rval;
+	drmModeModeInfo *mode = NULL;
 
 	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
+
+	/*
+	 * Need to get the mode again, because it may have changed
+	 * after setting the pipe.
+	 */
+	mode = find_mode(d, output, param);
+	igt_assert(mode);
+	if (!mode)
+		return;
+
 	igt_output_override_mode(output, mode);
 	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 
@@ -1290,7 +1301,7 @@ static void intel_max_source_size_test(data_t *d, enum pipe pipe, igt_output_t *
 
 	igt_plane_set_position(plane, 0, 0);
 	igt_plane_set_fb(plane, &fb);
-	igt_plane_set_size(plane, planesize[0], planesize[1]);
+	igt_plane_set_size(plane, param->planesize[0], param->planesize[1]);
 
 	rval = igt_display_try_commit2(&d->display, COMMIT_ATOMIC);
 
@@ -1563,27 +1574,23 @@ igt_main_args("", long_opts, help_str, opt_handler, &data)
 				igt_require_intel(data.drm_fd);
 				for_each_pipe(&data.display, pipe) {
 					for_each_valid_output_on_pipe(&data.display, pipe, output) {
-						drmModeModeInfo *mode = NULL;
-
 						if (get_num_scalers(&data.display, pipe) < 1)
 							continue;
 						/*
 						 * Need to find mode with lowest vrefresh else
 						 * we can exceed cdclk limits.
 						 */
-						mode = find_mode(&data, output, &intel_paramtests[index]);
-						if (mode) {
+						if (find_mode(&data, output, &intel_paramtests[index]))
 							igt_dynamic_f("pipe-%s-%s",
-								       kmstest_pipe_name(pipe), igt_output_name(output))
-								intel_max_source_size_test(&data, pipe, output, mode,
-											   intel_paramtests[index].planesize);
-						} else {
+								      kmstest_pipe_name(pipe), igt_output_name(output))
+								intel_max_source_size_test(&data, pipe, output,
+											   &intel_paramtests[index]);
+						else
 							igt_info("Unable to find the lowest " \
 								 "refresh rate mode on output " \
 								 "%s pipe %s\n",
 								 igt_output_name(output),
 								 kmstest_pipe_name(pipe));
-						}
 						continue;
 					}
 					break;
-- 
2.45.2

