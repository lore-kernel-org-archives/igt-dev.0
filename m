Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AC9C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 12:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A917C10E38A;
	Mon, 21 Sep 2026 12:47:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QairqyHW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7314610E151
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789994654; x=1821530654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=su5Xy1mw6RJOUPsqiFzB1AXDaH/R8/yZGI1pSiT1pFI=;
 b=QairqyHWyE2mrf8npMKesotJZm1Eei+fvThXq8NurWKzKfpYgwKUByG5
 dvkvR2H/DcSrquE7f8s5HBqkHwjU5sGq2PZKvl5WWKIMAmyhHYhDpbomr
 iNIUUJ3Kh8l7veWcjQcA7k8xie5qPerQvLJIjhszJB2rDkV+A8ptxCr05
 A8e0RcwumNKCOmXNRSgWOp9BWJrGWI24XrpZORFcepDfInCd2HjkJnBf3
 Eo7NYhIwV5Td+Egf3Q6SOSEFiv5LmDyQDN96Xfu1wcWH7xsDD3GjhA+KU
 cEeR4xpuf20wTZIshdUsIbC7Fc8fV38XBmDN6Ve9bS+rkkZSGMV2zOjMB g==;
X-CSE-ConnectionGUID: mcNRe4PWSsuaPLz778NsoA==
X-CSE-MsgGUID: 1sZhPF1QS2azglaFD2Y8Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11911"; a="1007034"
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; 
   d="scan'208";a="1007034"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 05:44:13 -0700
X-CSE-ConnectionGUID: gwYzHeddS3u6V/gHGJVfWQ==
X-CSE-MsgGUID: F57eYqy9R7KjOnB0SgIUoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,114,1787036400"; d="scan'208";a="272798030"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa008.fm.intel.com with ESMTP; 21 Sep 2026 05:44:12 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_psr2_sf: Handle the joiner
Date: Mon, 21 Sep 2026 12:44:08 +0000
Message-ID: <20260921124408.358774-4-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921124408.358774-1-mika.kahola@intel.com>
References: <20260921124408.358774-1-mika.kahola@intel.com>
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

PSR with joiner is only supported when the joiner pipe mask is
PIPE_A|PIPE_B, so skip the configs that don't land on that pair.

psr_enable() makes the kernel force a modeset on whatever is currently
committed, and that fails if another output is still driving the joiner
secondary. Reset the display first.

Assisted-by: Copilot:claude-opus-5
Signed-off-by: Mika Kahola <mika.kahola@intel.com>
---
 tests/intel/kms_psr2_sf.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/intel/kms_psr2_sf.c b/tests/intel/kms_psr2_sf.c
index eec916c25..e75f9c7f8 100644
--- a/tests/intel/kms_psr2_sf.c
+++ b/tests/intel/kms_psr2_sf.c
@@ -407,6 +407,9 @@ static void prepare(data_t *data)
 	igt_plane_t *primary, *sprite = NULL, *cursor = NULL;
 	int fb_w, fb_h, x, y, view_w, view_h;
 
+	igt_display_reset(&data->display);
+	igt_display_commit2(&data->display, COMMIT_ATOMIC);
+
 	psr_enable(data->drm_fd, data->debugfs_fd, data->psr_mode,
 		   data->output);
 
@@ -1044,6 +1047,22 @@ static void cleanup(data_t *data)
 	igt_remove_fb(data->drm_fd, &data->fb_test);
 }
 
+/* PSR/Panel Replay with joiner is only supported on the pipe A/B pair. */
+static bool sel_fetch_joiner_combo_valid(data_t *data)
+{
+	drmModeModeInfo *mode = igt_output_get_mode(data->output);
+	int max_dotclock = igt_get_max_dotclock(data->drm_fd);
+
+	if (igt_ultrajoiner_possible(data->drm_fd, mode, max_dotclock))
+		return false;
+
+	if (!igt_check_force_joiner_status(data->drm_fd, data->output->name) &&
+	    !igt_bigjoiner_possible(data->drm_fd, mode, max_dotclock))
+		return true;
+
+	return data->crtc->pipe == PIPE_A;
+}
+
 static bool sel_fetch_pipe_combo_valid(data_t *data)
 {
 	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->crtc->pipe != PIPE_A)
@@ -1053,6 +1072,9 @@ static bool sel_fetch_pipe_combo_valid(data_t *data)
 	    data->crtc->pipe != PIPE_A && data->crtc->pipe != PIPE_B)
 		return false;
 
+	if (!sel_fetch_joiner_combo_valid(data))
+		return false;
+
 	return true;
 }
 
-- 
2.43.0

