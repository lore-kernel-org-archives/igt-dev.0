Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C941EC01DD
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 12:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F300810E23D;
	Mon, 23 Mar 2026 12:06:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X3C9gYeB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953B410E33D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774267604; x=1805803604;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4st5P+K89FIVSma/J+BW6kEJJcDND9GIwzjylYxPctc=;
 b=X3C9gYeB1qhuQLl8MZ21WGGyXwJl/xCl3RPHCZe3pvq5PvDDlKp1xQsj
 APHbf16MGStHrcQO17/bQNw/9lhYyg0kH6tR+BhlVPoSixkpwtlUMBTo3
 2C4FUbmwSj6XiBm1yxHGw38Q+OOxghiBsLCu5RlgexvYtSmo8jahXMHt8
 LMYxqnh7w0M+waEheZwQzdLUUCPFqHaMqZfveIlHBr/jkTJ4OZYimikiM
 3HaT/+1ay0m7X49NQsyly6pMM9ICZ/fyI/AV8xftw8u3NYmEbWy1oqRhJ
 Ud5598qv6wu6b+Glszt/1MxG1TNw87ROGmO3ZTjBVvTsWMPdYRoxI4bdV A==;
X-CSE-ConnectionGUID: ZlWfesOSQn+9NSJE28VEAA==
X-CSE-MsgGUID: wUCaqbLVQdqUxatgIVj8DQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="86736257"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="86736257"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:06:43 -0700
X-CSE-ConnectionGUID: IasOFpi/Tx+hb979sKA3zw==
X-CSE-MsgGUID: AQLUbtkpSpKtsisfH6Cpcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208";a="254481969"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.8])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 05:06:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 2/3] lib/kms: refactor
 for_each_crtc_with_single_output() to avoid igt_crtc_for_pipe()
Date: Mon, 23 Mar 2026 14:06:25 +0200
Message-ID: <0bdfa894235e4ae19e47207dc0b7e67f36710ba4.1774267502.git.jani.nikula@intel.com>
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

Using igt_crtc_for_pipe() in for_each_crtc_with_single_output() is
problematic for further conversion from pipe to igt_crtc_t and CRTC
index usage. In particular, if we return igt_display_n_crtcs() to mean
the actual CRTC count for the device, and have a device with a pipe
fused off in the middle, we'll end up with a buffer overflow.

Add a new structure igt_output_crtc_t for holding the valid output/crtc
pointer combos instead of assuming the index in an igt_output_t pointer
array is the pipe. This doesn't fix everything yet, but is a step in the
right direction. Plus makes the whole loop ever so slightly easier to
understand.

For valid combos, both the output and crtc should always be non-NULL,
and for invalid combos, both of them should always be NULL. However,
check for both in the loop for good measure.

C macros being dumb, we have to rename the macro parameters to be able
to use output and crtc as the structure members. Meh.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 12 +++++++-----
 lib/igt_kms.h | 23 ++++++++++++++---------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index b835584bef1e..42329ad0303c 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3588,7 +3588,7 @@ bool output_is_internal_panel(igt_output_t *output)
 	}
 }
 
-igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t **chosen_outputs)
+igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display, igt_output_crtc_t *chosen_outputs)
 {
 	unsigned int full_crtc_index_mask = 0, assigned_crtc_index_mask = 0;
 	igt_output_t *output;
@@ -3634,15 +3634,17 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 					/* We found an unassigned CRTC, use it! */
 					found = true;
 					assigned_crtc_index_mask |= 1 << crtc->crtc_index;
-					chosen_outputs[crtc->pipe] = output;
-				} else if (!chosen_outputs[crtc->pipe] ||
-					   output_is_internal_panel(chosen_outputs[crtc->pipe])) {
+					chosen_outputs[crtc->pipe].output = output;
+					chosen_outputs[crtc->pipe].crtc = crtc;
+				} else if (!chosen_outputs[crtc->pipe].output ||
+					   output_is_internal_panel(chosen_outputs[crtc->pipe].output)) {
 					/*
 					 * Overwrite internal panel if not
 					 * assigned, external outputs are faster
 					 * to do modesets
 					 */
-					chosen_outputs[crtc->pipe] = output;
+					chosen_outputs[crtc->pipe].output = output;
+					chosen_outputs[crtc->pipe].crtc = crtc;
 				}
 			}
 
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index d7cc22d6cd61..aceac18ce240 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -520,6 +520,11 @@ typedef struct {
 	uint64_t values[IGT_NUM_CONNECTOR_PROPS];
 } igt_output_t;
 
+typedef struct {
+	igt_output_t *output;
+	igt_crtc_t *crtc;
+} igt_output_crtc_t;
+
 struct igt_display {
 	int drm_fd;
 	int log_shift;
@@ -763,25 +768,25 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
 		     (output) + 1 : ((crtc)++, &(display)->outputs[0])) \
 		for_each_if ((crtc)->valid && igt_crtc_connector_valid((crtc), (output)))
 
-igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display,
-					   igt_output_t **chosen_outputs);
+igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display,
+					      igt_output_crtc_t *chosen_outputs);
 
 /**
  * for_each_crtc_with_single_output:
  * @display: a pointer to an #igt_display_t structure
- * @crtc: The CRTC for which this @crtc / @output combination is valid.
- * @output: The output for which this @crtc / @output combination is valid.
+ * @_crtc: The CRTC for which this @_crtc / @_output combination is valid.
+ * @_output: The output for which this @_crtc / @_output combination is valid.
  *
  * This loop is called over all CRTCs, and will try to find a compatible output
  * for each CRTC. Unlike for_each_pipe_with_valid_output(), this function will
  * be called at most once for each pipe.
  */
-#define for_each_crtc_with_single_output(display, crtc, output) \
-	for (igt_output_t *__outputs[igt_display_n_crtcs(display)], \
-	     **__output = __igt_pipe_populate_outputs((display), __outputs); \
+#define for_each_crtc_with_single_output(display, _crtc, _output) \
+	for (igt_output_crtc_t __outputs[igt_display_n_crtcs(display)], \
+	     *__output = __igt_output_crtc_populate((display), __outputs); \
 		 __output < &__outputs[igt_display_n_crtcs(display)]; __output++) \
-		for_each_if (*__output && \
-			     ((crtc) = igt_crtc_for_pipe((display), (__output - __outputs)), (output) = *__output, 1))
+		for_each_if (__output->output && __output->crtc && \
+			     ((_output) = __output->output, (_crtc) = __output->crtc, 1))
 
 /**
  * for_each_valid_output_on_crtc:
-- 
2.47.3

