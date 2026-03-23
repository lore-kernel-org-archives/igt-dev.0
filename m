Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25866EC01DD
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 12:07:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87A010E23D;
	Mon, 23 Mar 2026 12:06:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jXGQRrkU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D8D210E33D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 12:06:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774267608; x=1805803608;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MRBdpRjouoh43pQk3Kt0u+qw86jDQfY8KLaVUE8ihEg=;
 b=jXGQRrkU8yOKbsMvtm9GAamY9E2cD0oCxstFraJnGy90Qi2+dJ0+F1bO
 8tDEdg1cFtNTW1oYK+maMJBsHvnOJvthDKxgbWbldW/lacDz835W1IQ48
 d0TYv/hQN8dEqSI4C0t7wLNKMmZJWA56QS14J53ts/doe4eXlc1k4+bS0
 sDtUXErCLcqIXuOfiX0dqabMbnzcwgu959ZkLVZsKMpKGVncs7Q0dXHYO
 WLXP6mu8dfZ7Hy3MUA0YvjRUx9dKFh5WDGCDSsYQgUV4KNV60LyPBWaXx
 bU83F5Rxf8tmKtFERHFpGl2dvJe7cw0cI9x8lmap5FN+DdqMB4fYa+NWp Q==;
X-CSE-ConnectionGUID: vuxLh8CjQmOm95BpQEABjA==
X-CSE-MsgGUID: 7pSMadZBQMGCMzViHlhn1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86736268"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="86736268"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:06:48 -0700
X-CSE-ConnectionGUID: I6LQj4KJR0WKK8gXR856Rw==
X-CSE-MsgGUID: LMX8dT4hRxOOJxYxgfp78Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254481984"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:06:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 3/3] lib/kms: use CRTC index for
 __igt_output_crtc_populate()
Date: Mon, 23 Mar 2026 14:06:26 +0200
Message-ID: <5f13f6e087209ee05ffc9e3cfd0f58cf2f82b83a.1774267502.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774267502.git.jani.nikula@intel.com>
References: <cover.1774267502.git.jani.nikula@intel.com>
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

Fill the valid output/crtc combos in __igt_output_crtc_populate() using
CRTC index instead of pipe. This avoids buffer overruns if we reduce
igt_display_n_crtcs() to the actual number of CRTCs on the device.

To keep the for_each_crtc_with_single_output() iteration in pipe order
on Intel devices, sort the resulting array in a separate
step. Presumably the performance impact of qsort() on an array of at
most 16 elements is neglible.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 42329ad0303c..b92bb16aaf9c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3588,6 +3588,18 @@ bool output_is_internal_panel(igt_output_t *output)
 	}
 }
 
+static int output_crtc_pipe_compare(const void *_a, const void *_b)
+{
+	const igt_output_crtc_t *a = _a, *b = _b;
+
+	/* pipe order for valid output/crtc combos */
+	if (a->crtc && b->crtc)
+		return a->crtc->pipe - b->crtc->pipe;
+
+	/* valid combos before empty elements */
+	return !b->crtc - !a->crtc;
+}
+
 igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display, igt_output_crtc_t *chosen_outputs)
 {
 	unsigned int full_crtc_index_mask = 0, assigned_crtc_index_mask = 0;
@@ -3634,17 +3646,17 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display, igt_output
 					/* We found an unassigned CRTC, use it! */
 					found = true;
 					assigned_crtc_index_mask |= 1 << crtc->crtc_index;
-					chosen_outputs[crtc->pipe].output = output;
-					chosen_outputs[crtc->pipe].crtc = crtc;
-				} else if (!chosen_outputs[crtc->pipe].output ||
-					   output_is_internal_panel(chosen_outputs[crtc->pipe].output)) {
+					chosen_outputs[crtc->crtc_index].output = output;
+					chosen_outputs[crtc->crtc_index].crtc = crtc;
+				} else if (!chosen_outputs[crtc->crtc_index].output ||
+					   output_is_internal_panel(chosen_outputs[crtc->crtc_index].output)) {
 					/*
 					 * Overwrite internal panel if not
 					 * assigned, external outputs are faster
 					 * to do modesets
 					 */
-					chosen_outputs[crtc->pipe].output = output;
-					chosen_outputs[crtc->pipe].crtc = crtc;
+					chosen_outputs[crtc->crtc_index].output = output;
+					chosen_outputs[crtc->crtc_index].crtc = crtc;
 				}
 			}
 
@@ -3654,6 +3666,11 @@ igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display, igt_output
 		}
 	}
 
+	/* For Intel, sort the output/crtc combos in pipe order */
+	if (is_intel_device(display->drm_fd))
+		qsort(chosen_outputs, igt_display_n_crtcs(display),
+		      sizeof(*chosen_outputs), output_crtc_pipe_compare);
+
 	return chosen_outputs;
 }
 
-- 
2.47.3

