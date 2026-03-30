Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24911FF495C
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 07:37:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3BBA10E4C1;
	Mon, 30 Mar 2026 07:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UDh/BBsA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEE910E4B5
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 07:36:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774856210; x=1806392210;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=48QZf+Z2ItNN7yeq82I8hcSNK9AuIm9LrC59ZeHi3iY=;
 b=UDh/BBsAtznJ0J6Nl3lULK7jTnR/S5PGm5CXZk7AeZRpT7TeEMvpoL77
 bUMNgQ1LE6AH4tr1s8NTtE0zA6lZDoHMw765GgtIntnlheQIuYFH9zvc8
 jd6DKAsuWoE4MhEWq1wW5bHizkxgsRG97pCFcS10EqKYA1836G5FunSGo
 OTpocaokyEbSIEQPcB7rhcPz2PWOcM9BNCQsEoZfFPfSgQRD0rQBQfyPC
 bM7S1qGhCGRRn2Q4sTblcJL67w+BWoNpl5VzMqleRW0fdBWE5aaLF584Y
 E0CpCzmss3pViY8P/b2Oq2imYanMZvU7y1QJkTWyTYsq7iXUExHv5eGDZ A==;
X-CSE-ConnectionGUID: 6tKyA+J8Te2B0vwg7Xo5zw==
X-CSE-MsgGUID: b5dCJS1rQbyx0aBRwik1Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="79744455"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; d="scan'208";a="79744455"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:36:50 -0700
X-CSE-ConnectionGUID: nWCY+ZfCQAqgfkDSAayqnA==
X-CSE-MsgGUID: J4Q0fh9NSqmt3qE48E+EmA==
X-ExtLoop1: 1
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.17])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2026 00:36:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 3/3] lib/kms: only keep valid CRTCs in display->crtcs[]
Date: Mon, 30 Mar 2026 10:36:30 +0300
Message-ID: <08338ac33b622174da70ac5d6bbf8eb5ede91322.1774856079.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774856079.git.jani.nikula@intel.com>
References: <cover.1774856079.git.jani.nikula@intel.com>
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

Previously, display->crtcs[] would contain igt_crtc_t for all pipes,
whether they were valid or not, and you could have igt_crtc_t pointers
to CRTCs that were not valid.

Only create igt_crtc_t for valid CRTCs, and make igt_display_n_crtcs()
reflect the number of valid CRTCs. (This will unlock further cleanups in
tests.)

For Intel, which might not have 1:1 CRTC index <-> pipe mapping, keep
the display->crtcs[] array sorted in pipe order, even if it can no
longer be indexed using the pipe. This means for_each_crtc() etc. will
keep iterating the CRTCs in pipe order like before. For simplicity, do
the sorting in a separate step.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 24 ++++++++++++++++--------
 lib/igt_kms.h | 14 ++------------
 2 files changed, 18 insertions(+), 20 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 558a366f29b4..04b1f3972307 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3107,6 +3107,13 @@ static void igt_crtc_init(igt_display_t *display, drmModeRes *resources, igt_crt
 		igt_assert_lte(0, crtc->planes[j].index);
 }
 
+static int crtc_pipe_compare(const void *_a, const void *_b)
+{
+	const igt_crtc_t *a = _a, *b = _b;
+
+	return a->pipe - b->pipe;
+}
+
 /**
  * igt_display_require:
  * @display: a pointer to an #igt_display_t structure
@@ -3164,24 +3171,25 @@ void igt_display_require(igt_display_t *display, int drm_fd)
 		     "count_crtcs exceeds IGT_MAX_PIPES, resources->count_crtcs=%d, IGT_MAX_PIPES=%d\n",
 		     resources->count_crtcs, IGT_MAX_PIPES);
 
-	display->n_crtcs = IGT_MAX_PIPES;
-	display->crtcs = calloc(igt_display_n_crtcs(display),
-				sizeof(igt_crtc_t));
+	display->n_crtcs = resources->count_crtcs;
+	display->crtcs = calloc(igt_display_n_crtcs(display), sizeof(igt_crtc_t));
 	igt_assert_f(display->crtcs,
 		     "Failed to allocate memory for %d CRTCs\n",
 		     igt_display_n_crtcs(display));
 
 	for (crtc_index = 0; crtc_index < resources->count_crtcs; crtc_index++) {
-		int pipe_enum = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
-
-		crtc = &display->crtcs[pipe_enum];
-		crtc->pipe = pipe_enum;
+		crtc = &display->crtcs[crtc_index];
 
-		crtc->valid = true;
 		crtc->crtc_id = resources->crtcs[crtc_index];
 		crtc->crtc_index = crtc_index;
+		crtc->pipe = is_intel_dev ? __intel_get_pipe_from_crtc_index(drm_fd, crtc_index) : crtc_index;
 	}
 
+	/* For Intel, sort the CRTCs in pipe order */
+	if (is_intel_dev)
+		qsort(display->crtcs, igt_display_n_crtcs(display),
+		      sizeof(display->crtcs[0]), crtc_pipe_compare);
+
 	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
 
 	if (drmSetClientCap(drm_fd, LOCAL_DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT, 1) == 0)
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 97647d92f4f0..f994d91d3aa0 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -475,15 +475,6 @@ struct igt_crtc {
 	/* ID of a hardware pipe */
 	enum pipe pipe;
 
-        /*
-         * Indicates whether this pipe struct is valid and can be used. This can
-         * be false when the pipe is allocated as part of an array indexed by
-         * enum pipe, but the respective pipe is not reported by DRM, meaning
-         * that the pipe could not exist in the underlying hardware, could have
-         * been fused off, etc.
-         */
-        bool valid;
-
 	int n_planes;
 	int num_primary_planes;
 	igt_plane_t *planes;
@@ -738,8 +729,7 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
 #define for_each_crtc(display, crtc) \
 	for ((crtc) = &(display)->crtcs[0]; \
 	     (crtc) < &(display)->crtcs[(display)->n_crtcs]; \
-	     (crtc)++) \
-		for_each_if ((crtc)->valid)
+	     (crtc)++)
 
 /**
  * for_each_crtc_with_valid_output:
@@ -760,7 +750,7 @@ static inline bool igt_crtc_connector_valid(igt_crtc_t *crtc, igt_output_t *outp
 		     (output) < &(display)->outputs[(display)->n_outputs]; \
 	     (output) = (output) + 1 < &(display)->outputs[(display)->n_outputs] ? \
 		     (output) + 1 : ((crtc)++, &(display)->outputs[0])) \
-		for_each_if ((crtc)->valid && igt_crtc_connector_valid((crtc), (output)))
+		for_each_if (igt_crtc_connector_valid((crtc), (output)))
 
 igt_output_crtc_t *__igt_output_crtc_populate(igt_display_t *display,
 					      igt_output_crtc_t *chosen_outputs);
-- 
2.47.3

