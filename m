Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9FBD58CD1
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 05:00:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E85F510E3C8;
	Mon, 23 Mar 2026 05:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bRR+3gi7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 922F710E3C4
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 05:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774242010; x=1805778010;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=VN9bEz3pIRr6iqwS1zQG1CTChiTwdtUElzkeyvZfIVE=;
 b=bRR+3gi7VSdkhONqrXXPWk3WRiXEnispPHiEZ6kByjst+Zj/ZgpkMj60
 lkTq0jySEmt7U52AGkKrtFRF0SN8tRopn/Jc/6BPvd2TWI4tE/SVRSdAW
 vHstNsFvflA+EbboWslyvt3VxoV8fjyxkMv4O5r6TQSbHKrXvvFbw42JD
 +xQHXWzdZRM9L/D4E60ZWkgcLz2NBDa4TZ6pbnrfYR0sb2Szk1BtTQWxD
 PRhfVoQevKenEI1NlOlmsbhKnoW5b1yWN9RDEPmBjzBwJLrc8ihfmjxdB
 lYlp8gfQJR6H73OPuPfujHEn3NN+9MckizM4w0BwHW+RJibEbGKGJOYKe A==;
X-CSE-ConnectionGUID: B5fa6J2LThaP/b4p14k53Q==
X-CSE-MsgGUID: duf3kxNwRqKznm5QnvYwzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100687854"
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="100687854"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2026 22:00:10 -0700
X-CSE-ConnectionGUID: W6VUjfdSTLa2WAwsC4wbzA==
X-CSE-MsgGUID: svoBUbw8T1GY6kXktvmJpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,136,1770624000"; d="scan'208";a="219124965"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa006.fm.intel.com with ESMTP; 22 Mar 2026 22:00:09 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Use stable
 non-joiner mode for joiner bypass
Date: Mon, 23 Mar 2026 10:40:49 +0530
Message-Id: <20260323051049.2627387-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260323051049.2627387-1-pranay.samala@intel.com>
References: <20260323051049.2627387-1-pranay.samala@intel.com>
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

When joiner mode is detected, fetch a non-joiner mode into local
variable and store it into the caller-owned copy.

Also override the selected mode before commit so the programmed
output mode matches the mode used by the test.

Fixes: 10dccc7fc82f ("tests/intel/kms_sharpness_filter: Detect and bypass joiner modes")
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index 96fb139ae..881fab746 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -430,6 +430,7 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
+	drmModeModeInfo selected_mode;
 	char name[40];
 
 	for_each_connected_output(display, output) {
@@ -438,15 +439,17 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			data->output = output;
 			data->crtc = crtc;
-			data->mode = igt_output_get_mode(data->output);
 
 			/*
 			 * FIXME: Joiner + CASF currently unsupported.
 			 * Remove this check once support is implemented.
 			 * Until then, run on non-joiner mode in joiner configuration.
 			 */
-			if (is_joiner_mode(data->drm_fd, data->output)) {
-				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
+			if (is_joiner_mode(data->drm_fd, data->output) &&
+			    igt_get_non_joiner_mode(data->drm_fd,
+						    data->output,
+						    &selected_mode)) {
+				data->mode = &selected_mode;
 				igt_info("Executing on mode %dx%d@%d\n",
 					 data->mode->hdisplay,
 					 data->mode->vdisplay,
@@ -463,6 +466,7 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			igt_output_set_crtc(data->output,
 					    data->crtc);
+			igt_output_override_mode(data->output, data->mode);
 
 			if (!intel_pipe_output_combo_valid(display)) {
 				igt_output_set_crtc(data->output, NULL);
-- 
2.34.1

