Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A96EC36013
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 20:53:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26C3210E086;
	Thu, 27 Mar 2025 20:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L71Bfl1m";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148F610E079
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 20:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743108808; x=1774644808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WggnkahuMaRLxnDEa0KL5bPiHDqzaFT3mih1SWM/cAI=;
 b=L71Bfl1m5SmMzW0KwzxnhIETGf7MzwaY5t4qQl6OxekspE9mhjRqE7+a
 Q77s07VoH0aFERvObxvraYlrM/UKQMpOPemdMzCzwPt9JvJBewVAeWEDz
 2RngjiMUSG7hOAlNPFuxeWAZZNMGuLLTcsFEbQr5bWoXA3MxMBgiirkob
 D68MCcc4MlUoSSsLYBsSnOcc+1v+UnIuP9y4F7fILL925ijLoEW4zgRi/
 Dp9tuCY1jqGcxglDhaXwAGqDEtkPbjDxFESJSZ3NV8w6oI8cEKEV1Euoy
 s2O/RZ6QHrxf+s6R7V/6VorXFr48qHe7ua+PwU/uFnMRUqgvuYY74VhN0 Q==;
X-CSE-ConnectionGUID: T1wwhRO0Rfm/dvpNxBZLLA==
X-CSE-MsgGUID: ksnRXss2TjyDlKjyLqs3Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44478176"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="44478176"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:53:27 -0700
X-CSE-ConnectionGUID: t5ROd0PUR6upRyupSfQymA==
X-CSE-MsgGUID: gURw7Ny1RvedO9pPX/ZEFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; d="scan'208";a="125012294"
Received: from unknown (HELO rgsanthosh-System-Product-Name.iind.intel.com)
 ([10.190.238.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 13:53:25 -0700
From: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, Naladala Ramanaidu <ramanaidu.naladala@intel.com>
Subject: [PATCH i-g-t v1 2/3] tests/kms_plane_scaling: Reduce Log Level by
 Skipping Unsupported Modes in Scaling Tests
Date: Fri, 28 Mar 2025 02:23:00 +0530
Message-ID: <20250327205301.3400440-3-ramanaidu.naladala@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250327205301.3400440-1-ramanaidu.naladala@intel.com>
References: <20250327205301.3400440-1-ramanaidu.naladala@intel.com>
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

Implement a check to bypass modes that do not support scaling on
Intel hardware. Added a condition to skip tests if no compatible
mode is found, thereby reducing unnecessary log entries.

Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
---
 tests/kms_plane_scaling.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
index 63d35d76b..40a5b098a 100644
--- a/tests/kms_plane_scaling.c
+++ b/tests/kms_plane_scaling.c
@@ -578,9 +578,15 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 	int commit_ret;
 	int w, h;
 	int width, height;
+	bool found_mode = 0;
 
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
+
+		if (is_intel_device(display->drm_fd) &&
+		    !is_intel_support_scaling(mode))
+			continue;
+
 		igt_output_override_mode(output, mode);
 		igt_debug("Trying mode %dx%d\n",
 			  mode->hdisplay, mode->vdisplay);
@@ -629,9 +635,12 @@ check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
 		igt_plane_set_fb(plane, NULL);
 		igt_plane_set_position(plane, 0, 0);
 		cleanup_fbs(d);
-		if (commit_ret == 0)
+		if (commit_ret == 0) {
+			found_mode = 1;
 			break;
+		}
 	}
+	igt_skip_on_f(found_mode == 0, "No suitable mode found for required scaling operation\n");
 	return commit_ret;
 }
 
@@ -942,12 +951,19 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 	int n_planes;
 	int w1, h1, w2, h2;
 	int ret;
+	bool found_mode = 0;
 
 	cleanup_crtc(d);
 
 	igt_output_set_pipe(output, pipe);
 	for_each_connector_mode(output) {
 		mode = &output->config.connector->modes[j__];
+
+		if (is_intel_device(display->drm_fd) &&
+		    !is_intel_support_scaling(mode)) {
+			continue;
+		}
+
 		igt_output_override_mode(output, mode);
 		igt_debug("Trying mode %dx%d\n",
 			  mode->hdisplay, mode->vdisplay);
@@ -998,9 +1014,12 @@ test_planes_scaling_combo(data_t *d, double sf_plane1,
 				break;
 		}
 		cleanup_fbs(d);
-		if (ret == 0)
+		if (ret == 0) {
+			found_mode = 1;
 			break;
+		}
 	}
+	igt_skip_on_f(found_mode == 0, "No suitable mode found for required scaling operation\n");
 	return ret;
 }
 
-- 
2.43.0

