Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77DAAC982FF
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 08:43:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19AEB10EBF7;
	Tue, 22 Sep 2026 08:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P5smP5or";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E26B910EB1D
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790066518; x=1821602518;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0OwJBmocDNd8yxIK4DThajjzTMQYOEAHpHCBHsgT/so=;
 b=P5smP5oryg1EGrQa0mniVKSHLlrGS+mSnNxhIZxMTfCnKMfE7heYDG/+
 +ZlGYoWzJVDV9McljkmEtDvuOBLqxEy/GJnuwVvg41xPEGjSSIvZ74c9o
 vdW6w4SzbIVASe9ZGodowAf/ThQEovmdwPkkIZDVyVNPIAOVEuRvhmv2E
 K72uwKrO1O8nbitmHMBQcRek/950UprTdI6+N0VnHYijTf6ZX8y5FDp15
 0Y320F3D9M8akdqTIOBndy8CipuFNO4Fes1yMNtKEz4ew8M/HH2OD9SOL
 GU5bAhCKQ8Rx/peyhHBXzcet0ivddxmQbpZ+w3b1PU6BD8rTUC/RJovT1 g==;
X-CSE-ConnectionGUID: zD8g2RzKRhKvIPEsTLkiVg==
X-CSE-MsgGUID: YP2SHyQJSKWoQxZM77Ri6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="101310557"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="101310557"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2026 01:41:58 -0700
X-CSE-ConnectionGUID: LJuVBv2BTMKcwzJeswOpRw==
X-CSE-MsgGUID: i1dlf64uQEiGqUOzCWj92Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; d="scan'208";a="272539288"
Received: from display-adls.igk.intel.com ([10.211.131.198])
 by fmviesa007.fm.intel.com with ESMTP; 22 Sep 2026 01:41:57 -0700
From: Mika Kahola <mika.kahola@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mika Kahola <mika.kahola@intel.com>
Subject: [PATCH i-g-t 3/3] tests/intel/kms_psr2_sf: Handle the joiner
Date: Tue, 22 Sep 2026 08:41:54 +0000
Message-ID: <20260922084155.403909-1-mika.kahola@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921124408.358774-4-mika.kahola@intel.com>
References: <20260921124408.358774-4-mika.kahola@intel.com>
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
index fa7090ce8..b15488ca6 100644
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
+	return data->crtc->hardware_pipe == PIPE_A;
+}
+
 static bool sel_fetch_pipe_combo_valid(data_t *data)
 {
 	if (data->devid < 14 && !IS_ALDERLAKE_P(data->devid) && data->crtc->hardware_pipe != PIPE_A)
@@ -1053,6 +1072,9 @@ static bool sel_fetch_pipe_combo_valid(data_t *data)
 	    data->crtc->hardware_pipe != PIPE_A && data->crtc->hardware_pipe != PIPE_B)
 		return false;
 
+	if (!sel_fetch_joiner_combo_valid(data))
+		return false;
+
 	return true;
 }
 
-- 
2.43.0

