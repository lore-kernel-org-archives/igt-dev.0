Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82335D59D65
	for <igt-dev@archiver.kernel.org>; Fri, 12 Dec 2025 15:46:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E0110E90E;
	Fri, 12 Dec 2025 15:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsi3lKe3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF23910E907
 for <igt-dev@lists.freedesktop.org>; Fri, 12 Dec 2025 15:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765554409; x=1797090409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NvMF2K0Pcq9GrtcY4QGmpGa1prSrqYX28OYlN3x+jTs=;
 b=fsi3lKe3Tjbu7YMkuufcprB0JG29creb0JRI/l02qalhkZ3ualW/NowP
 94bwbT7g4gfCdmCGIHGK6LPtBo/+V6w0DgagSZdapubh73Cto/cNs2E6m
 zvJE0rGsQ/LWGm6vms6ZR4ZaxUKq/4JNniKvBwcFhTIavC7gHZdpvsMpE
 I2vE2doi6QZYEkMEhfxoETTENp7b56QN8WdMwAzNq8NpDlqZxGewS12SK
 S5Lf38xpHBpEqpU/TFds6AL3Z2GRcdZn0EVVQJ0Csuh0G8GcrwWKHI8eH
 dXWd5PArQwO+56PI8tFkGcNp6p3SPgZ+EgNn9OQI35fBGW1DFShOdHPGc A==;
X-CSE-ConnectionGUID: d/BzNXOoRJOACNhIiFjYpg==
X-CSE-MsgGUID: hiX2zdW+QCCIZCfZ0N/DiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="70141989"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="70141989"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:49 -0800
X-CSE-ConnectionGUID: FsbHKepjQZCJ0InFzlJHHQ==
X-CSE-MsgGUID: n/Y9b9ICRkGB+W/LtDAsPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="220491035"
Received: from egrumbac-mobl6.ger.corp.intel.com (HELO localhost)
 ([10.245.245.152])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 07:46:46 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH i-g-t v2 04/10] lib/kms: Introduce igt_crtc_for_pipe()
Date: Fri, 12 Dec 2025 17:46:20 +0200
Message-ID: <20251212154626.29471-5-ville.syrjala@linux.intel.com>
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

