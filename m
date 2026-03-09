Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D3EF3C241
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 12:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F61210E4DE;
	Mon,  9 Mar 2026 12:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pw7y5CiQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFF110E4DE
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 12:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773060037; x=1804596037;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=woT/CSG1Q0wtYjgnQ4hKxEWXtP2A1nF/NDG48WMInIM=;
 b=Pw7y5CiQhrAkbx78uoWyZN6mykldnPA8K2Z6fEQhk1TpeJNacVtTmvYO
 Kt3i5AZC5RD0MeD/u3D575MUXejYlDUQYQrFzrYQdbM+BYvVhKR4QZVB5
 8Ug77d3V+7eJpEVp/zK4Huwj0CMg9Ds4r2tvU427nm3eeNr8CFNNJjsCp
 77tfmrekr3PY/61L96y6HsNy7IvDZ/wRSoM6Sx7oh/yxaopKk3R/l26gv
 YENcomI+dCr3NSwBqMvw3SVVtn3mP6GUUqrapI5/u8wilci2ujRtzo4VW
 iE/5d070o4Tjxw8l5g30+jYLQ0UKMAi9dLh2SDn9tTwgwla/Ct3dfQbPZ A==;
X-CSE-ConnectionGUID: LwqZ9t61RhGOrpw78Z7G9Q==
X-CSE-MsgGUID: kp+cDvEETESFkD7YUICb1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="73958094"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="73958094"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:40:36 -0700
X-CSE-ConnectionGUID: 0FXk6p0TTVmbfLLQBT3eAA==
X-CSE-MsgGUID: 3IrFn1zuTCaJiW6DpTMB3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="218952920"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 05:40:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 3/3] lib/kms: avoid mixing CRTC index and pipe masks in
 __igt_pipe_populate_outputs()
Date: Mon,  9 Mar 2026 14:40:14 +0200
Message-ID: <933bd53009555d326efaddf9eb0fb9d67fa9702a.1773059939.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773059939.git.jani.nikula@intel.com>
References: <cover.1773059939.git.jani.nikula@intel.com>
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

Prefer using CRTC indexes in __igt_pipe_populate_outputs() when
possible. The output->config.valid_crtc_index_mask is already a mask of
CRTC indexes, and should not be mixed with a pipe mask.

For variable naming, always prefer _mask suffix over just s for plural.

The output array remains in pipe order.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 4aeeef70eadd..2a96498d7a50 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3589,7 +3589,7 @@ bool output_is_internal_panel(igt_output_t *output)
 
 igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t **chosen_outputs)
 {
-	unsigned full_pipe_mask = 0, assigned_pipes = 0;
+	unsigned int full_crtc_index_mask = 0, assigned_crtc_index_mask = 0;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	int i;
@@ -3598,7 +3598,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
 
 	for_each_crtc(display, crtc)
-		full_pipe_mask |= 1 << crtc->pipe;
+		full_crtc_index_mask |= 1 << crtc->crtc_index;
 
 	/*
 	 * Try to assign all outputs to the first available CRTC for
@@ -3607,7 +3607,7 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 	 */
 	for (i = 0; i <= igt_display_n_crtcs(display); i++) {
 		for_each_connected_output(display, output) {
-			uint32_t pipe_mask = output->config.valid_crtc_index_mask & full_pipe_mask;
+			uint32_t crtc_index_mask = output->config.valid_crtc_index_mask & full_crtc_index_mask;
 			bool found = false;
 
 			if (output_is_internal_panel(output)) {
@@ -3619,20 +3619,20 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 
 				if (i)
 					continue;
-			} else if (__builtin_popcount(pipe_mask) != i) {
+			} else if (__builtin_popcount(crtc_index_mask) != i) {
 				continue;
 			}
 
 			for_each_crtc(display, crtc) {
-				bool pipe_assigned = assigned_pipes & (1 << crtc->pipe);
+				bool crtc_assigned = assigned_crtc_index_mask & (1 << crtc->crtc_index);
 
-				if (pipe_assigned || !(pipe_mask & (1 << crtc->pipe)))
+				if (crtc_assigned || !(crtc_index_mask & (1 << crtc->crtc_index)))
 					continue;
 
 				if (!found) {
-					/* We found an unassigned pipe, use it! */
+					/* We found an unassigned CRTC, use it! */
 					found = true;
-					assigned_pipes |= 1 << crtc->pipe;
+					assigned_crtc_index_mask |= 1 << crtc->crtc_index;
 					chosen_outputs[crtc->pipe] = output;
 				} else if (!chosen_outputs[crtc->pipe] ||
 					   output_is_internal_panel(chosen_outputs[crtc->pipe])) {
-- 
2.47.3

