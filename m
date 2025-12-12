Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D371FD59D6A
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 15:47:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 863CD10E903;
	Fri, 12 Dec 2025 15:47:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kO7dlV4g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0AE810E903
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 15:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765554426; x=1797090426;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BUiROLr17aiwu2pY9PDiteS77bh2i8k36+a2dHMWLLY=;
 b=kO7dlV4gavnmnMg0lmlTjSBDC6m/ke492SugSRY1Qg3mdH0Gtjl/jvT7
 Sk9MLCgDCff4WxjWMi4dtOSusA9kDMUXC86puac/RxZm820OFe74nmU70
 7fToxKktBug6VJKTku+R3lXVcuA6dE0qCLp/XHaGykLzMX+YxiMsYIVOq
 a0iMP7P8YlWFNVsNf4HFkC5W0rcMmBqTdOzNFS5ajO+l5u8QgViJTCPTQ
 qp0+SKqflowT30PfU0xRllCxCISL4hAIQ9Ox1dt9HAX8b/MZNwmJm62sH
 Wjvc/g7DKRVTMH2GLSTVFaf2RseYcR/Z6YzCOyDK+EgwQVmtIZHt/mLus g==;
X-CSE-ConnectionGUID: FVz7383rRuywECBTPMyMfg==
X-CSE-MsgGUID: ympVxFahSlO5t+bqQX5c2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71184436"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="71184436"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:47:05 -0800
X-CSE-ConnectionGUID: oOXW59MJQ6a0dQcm6rlxKg==
X-CSE-MsgGUID: trDB2+/ITkOgZVBnDxv0aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="220491099"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:47:02 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 08/10] lib/kms: Introduce igt_output_set_crtc()
Date: Fri, 12 Dec 2025 17:46:24 +0200
Message-ID: <20251212154626.29471-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
References: <20251212154626.29471-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Introduce igt_output_set_crtc() as the intended replacement for
igt_output_set_pipe().

One step towards using 'crtcs' instead of 'pipes'.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 44 +++++++++++++++++++++++++++++++-------------
 lib/igt_kms.h |  1 +
 2 files changed, 32 insertions(+), 13 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3b71cee61635..40c521b3a331 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -5277,31 +5277,35 @@ int igt_output_preferred_vrefresh(igt_output_t *output)
 		return 60;
 }
 
+static const char *igt_crtc_name(igt_pipe_t *crtc)
+{
+	if (crtc == NULL)
+		return "None";
+
+	return kmstest_pipe_name(crtc->pipe);
+}
+
 /**
- * igt_output_set_pipe:
+ * igt_output_set_crtc:
  * @output: Target output for which the pipe is being set to
- * @pipe: Display pipe to set to
+ * @pipe_obj: CRTC to set to
  *
- * This function sets a @pipe to a specific @output connector by
- * setting the CRTC_ID property of the @pipe. The pipe
- * is only activated for all pipes except PIPE_NONE.
+ * This function sets a @crtc to a specific @output connector by
+ * setting the CRTC_ID property of the @crtc.
  */
-void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
+void igt_output_set_crtc(igt_output_t *output, igt_pipe_t *pipe_obj)
 {
 	igt_display_t *display = output->display;
-	igt_pipe_t *old_pipe = NULL, *pipe_obj = NULL;;
+	igt_pipe_t *old_pipe = NULL;
 
 	igt_assert(output->name);
 
 	if (output->pending_pipe != PIPE_NONE)
 		old_pipe = igt_output_get_driving_pipe(output);
 
-	if (pipe != PIPE_NONE)
-		pipe_obj = igt_crtc_for_pipe(display, pipe);
-
 	LOG(display, "%s: set_pipe(%s)\n", igt_output_name(output),
-	    kmstest_pipe_name(pipe));
-	output->pending_pipe = pipe;
+	    igt_crtc_name(pipe_obj));
+	output->pending_pipe = pipe_obj ? pipe_obj->pipe : PIPE_NONE;
 
 	if (old_pipe) {
 		igt_output_t *old_output;
@@ -5318,7 +5322,7 @@ void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
 	}
 
 	igt_output_set_prop_value(output, IGT_CONNECTOR_CRTC_ID,
-				  pipe == PIPE_NONE ? 0 : igt_crtc_for_pipe(display, pipe)->crtc_id);
+				  pipe_obj ? pipe_obj->crtc_id : 0);
 
 	igt_output_refresh(output);
 
@@ -5332,6 +5336,20 @@ void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
 	}
 }
 
+/**
+ * igt_output_set_pipe:
+ * @output: Target output for which the pipe is being set to
+ * @pipe_obj: Display pipe to set to
+ *
+ * This function sets a @pipe to a specific @output connector by
+ * setting the CRTC_ID property of the @pipe. The pipe
+ * is only activated for all pipes except PIPE_NONE.
+ */
+void igt_output_set_pipe(igt_output_t *output, enum pipe pipe)
+{
+	igt_output_set_crtc(output, igt_crtc_for_pipe(output->display, pipe));
+}
+
 static
 bool __override_all_active_output_modes_to_fit_bw(igt_display_t *display,
 						  igt_output_t *outputs[IGT_MAX_PIPES],
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 5c097eedd50c..17183d5b0965 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -592,6 +592,7 @@ drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_lowres_mode(igt_output_t *output);
 void igt_output_override_mode(igt_output_t *output, const drmModeModeInfo *mode);
 int igt_output_preferred_vrefresh(igt_output_t *output);
+void igt_output_set_crtc(igt_output_t *output, igt_pipe_t *pipe_obj);
 void igt_output_set_pipe(igt_output_t *output, enum pipe pipe);
 igt_plane_t *igt_output_get_plane(igt_output_t *output, int plane_idx);
 igt_plane_t *igt_output_get_plane_type(igt_output_t *output, int plane_type);
-- 
2.51.2

