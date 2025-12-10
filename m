Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F3B2D3C928
	for <igt-dev@archiver.kernel.org>; Wed, 10 Dec 2025 17:16:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53D6410E74D;
	Wed, 10 Dec 2025 17:16:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Atu67VK/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC22B10E74D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Dec 2025 17:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765386983; x=1796922983;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvMF2K0Pcq9GrtcY4QGmpGa1prSrqYX28OYlN3x+jTs=;
 b=Atu67VK/FFSyFLhmnCKvwwVJtSPKF6bAUH6lzf3sru5U0yHJtyB3p5Uf
 6d6BwunCYPKGTtAzJQ/s+/i6V8++xn7Dk1B7XIMSOanVusDGon2PcMiZy
 22D3S/jeBnAJmxLurNgceQ4Crp7s+VcCIcMvxkun/ACDMTKsqDbybZ5zM
 Xj5/Jc0/vlvjoTzDOJXAti/6uAlqrp8igGqJ60DePNRx3SvumgpKA9P4P
 DNzy61AI0E8Kws1xI9IUjblOucofuAjpEx1fDsIp5fAZXSOJc6wzdz6Vc
 C6RbJWoLXEY8aNDTm9wjqtl/WQ8gyt73KqWVHYBIFzc3sFqJemYGwZqX4 w==;
X-CSE-ConnectionGUID: mJIzIde+Rg+XfqVoTxD5Yw==
X-CSE-MsgGUID: aQAo32duQt+iarwwe8xxgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="66544619"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="66544619"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:16:22 -0800
X-CSE-ConnectionGUID: RCk/MHDYR/OjynJMPCHqcw==
X-CSE-MsgGUID: fhFTa7LYSumO8hUAnaIOaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; d="scan'208";a="227211396"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.21])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2025 09:16:21 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 04/10] lib/kms: Introduce igt_crtc_for_pipe()
Date: Wed, 10 Dec 2025 19:16:17 +0200
Message-ID: <20251210171617.28087-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251210093903.15934-5-ville.syrjala@linux.intel.com>
References: <20251210093903.15934-5-ville.syrjala@linux.intel.com>
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

Start weaning everyone off from poking inside display->pipes[]
by hand. Introduce igt_crtc_for_pipe() as the preferred method
for getting the correct crtc.

Done by hand because this needs to be used in a few messy macros
that cocci doesn't like.

v2: Deal with PIPE_NONE (Jani)

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 6e7cf112b1e2..aa0a8496fbff 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -578,6 +578,14 @@ void igt_display_require_output(igt_display_t *display);
 void igt_display_require_output_on_pipe(igt_display_t *display, enum pipe pipe);
 int igt_display_n_crtcs(igt_display_t *display);
 
+static inline igt_pipe_t *igt_crtc_for_pipe(igt_display_t *display, enum pipe pipe)
+{
+	if (pipe == PIPE_NONE)
+		return NULL;
+
+	return &display->pipes[pipe];
+}
+
 const char *igt_output_name(igt_output_t *output);
 drmModeModeInfo *igt_output_get_mode(igt_output_t *output);
 drmModeModeInfo *igt_output_get_highres_mode(igt_output_t *output);
@@ -726,7 +734,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
  */
 #define for_each_pipe(display, pipe) \
 	for_each_pipe_static(pipe) \
-		for_each_if((display)->pipes[(pipe)].valid)
+		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid)
 
 /**
  * for_each_pipe_with_valid_output:
@@ -745,7 +753,7 @@ static inline bool igt_output_is_connected(igt_output_t *output)
 	for (int con__ = (pipe) = 0; \
 	     assert(igt_can_fail()), (pipe) < igt_display_n_crtcs(display) && con__ < (display)->n_outputs; \
 	     con__ = (con__ + 1 < (display)->n_outputs) ? con__ + 1 : (pipe = pipe + 1, 0)) \
-		 for_each_if((display)->pipes[pipe].valid) \
+		for_each_if(igt_crtc_for_pipe((display), (pipe))->valid) \
 			for_each_if ((((output) = &(display)->outputs[con__]), \
 						igt_pipe_connector_valid((pipe), (output))))
 
@@ -793,8 +801,9 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
  * If there are no valid planes for this pipe, nothing happens.
  */
 #define for_each_plane_on_pipe(display, pipe, plane)			\
-	for (int j__ = 0; assert(igt_can_fail()), (plane) = &(display)->pipes[(pipe)].planes[j__], \
-		     j__ < (display)->pipes[(pipe)].n_planes; j__++)
+	for (int j__ = 0; assert(igt_can_fail()), \
+		     (plane) = &igt_crtc_for_pipe((display), (pipe))->planes[j__], \
+		     j__ < igt_crtc_for_pipe((display), (pipe))->n_planes; j__++)
 
 /**
  * for_each_connector_mode:
-- 
2.51.2

