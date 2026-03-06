Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF47EF01835
	for <igt-dev@archiver.kernel.org>; Fri,  6 Mar 2026 13:24:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A694410ED31;
	Fri,  6 Mar 2026 13:24:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oBstKTtW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A728210ED33
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Mar 2026 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772803472; x=1804339472;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aYp4viauvJryuRIAzuU7ZyyjJNe60MzDz/YMNQT7FqE=;
 b=oBstKTtWJb6Q++sB5v3cE141xBvl9L99zxpSwofWi5QCLKHndAiCGYl6
 cxLsaAdyltnWPm67nbt9vHNWpEciy+8EjjyX+Bodoy009fx6OmUyuYTdq
 Jo+GcpNNXmZdNavsU7dQ8eI+mKKe3fN51C7d64zkaQGhBgQ2enAf2L2n1
 b6OJPVNchcrTYFQfqsC2R/eHwaikQbNhTWI432fMU0goIQcQEFRe3e7aJ
 ogxTjf5JaeY/Ro+my406EVCuSf9SMoUe+7YOOYofrwFWZpfnbdHWnCwcF
 SAWNI42LIKT77CCzCp/lS9BncEweRow0jRyo7hGzJlNtjlMaKawuniB/s w==;
X-CSE-ConnectionGUID: GlWRpoHoRNGF5DXXoL4pIw==
X-CSE-MsgGUID: 2Kwt0A4qQ+KmCGCmKN1Ywg==
X-IronPort-AV: E=McAfee;i="6800,10657,11720"; a="91297464"
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="91297464"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:32 -0800
X-CSE-ConnectionGUID: cH5APyNlR3qx4bNeIvAY6Q==
X-CSE-MsgGUID: cTHrtkrxQ4OON2V86Wvibw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,104,1770624000"; d="scan'208";a="218237323"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.191])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 05:24:30 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 5/5] lib/kms: add igt_random_crtc() and use it in gem_eio
Date: Fri,  6 Mar 2026 15:23:58 +0200
Message-ID: <e304f9f8b906f6b0464227f214e591f5352eb272.1772803372.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772803372.git.jani.nikula@intel.com>
References: <cover.1772803372.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Add a helper for getting a random valid CRTC. There's only one user, and
perhaps there shouldn't be more as it's not deterministic, but avoid the
igt_crtc_for_pipe() usage in tests.

Collect the valid CRTCs in an array first to get away with a single
random selection and O(N) behaviour. Checking the validity after the
random selection on all CRTCs could take several rounds, and indeed the
compiler informs "warning: function might be candidate for attribute
‘noreturn’ [-Wsuggest-attribute=noreturn]".

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c         | 20 ++++++++++++++++++++
 lib/igt_kms.h         |  1 +
 tests/intel/gem_eio.c |  7 +------
 3 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 240200a98772..1b89a3e17d4f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -8040,3 +8040,23 @@ igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc)
 
 	return NULL;
 }
+
+/*
+ * igt_random_crtc:
+ * @display: pointer to igt_display_t
+ *
+ * Returns: A random CRTC on the device
+ */
+igt_crtc_t *igt_random_crtc(igt_display_t *display)
+{
+	igt_crtc_t *crtcs[IGT_MAX_PIPES];
+	igt_crtc_t *crtc;
+	int n = 0;
+
+	for_each_crtc(display, crtc)
+		crtcs[n++] = crtc;
+
+	igt_skip_on_f(!n, "No CRTCs on device\n");
+
+	return crtcs[rand() % n];
+}
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 23169e87ff2d..557b8eedca4d 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -586,6 +586,7 @@ igt_crtc_t *igt_crtc_for_crtc_id(igt_display_t *display, uint32_t crtc_id);
 igt_crtc_t *igt_first_crtc(igt_display_t *display);
 igt_crtc_t *igt_first_crtc_with_single_output(igt_display_t *display, igt_output_t **ret_output);
 igt_crtc_t *igt_next_crtc(igt_display_t *display, igt_crtc_t *crtc);
+igt_crtc_t *igt_random_crtc(igt_display_t *display);
 
 uint32_t igt_crtc_get_vbl_flag(igt_crtc_t *crtc);
 unsigned int igt_crtc_get_vblank(igt_crtc_t *crtc, unsigned int flags);
diff --git a/tests/intel/gem_eio.c b/tests/intel/gem_eio.c
index 546fff14bd5b..729aaf7ccd30 100644
--- a/tests/intel/gem_eio.c
+++ b/tests/intel/gem_eio.c
@@ -1033,13 +1033,8 @@ static void display_helper(igt_display_t *dpy, int *done)
 		igt_plane_t *primary;
 		igt_output_t *output;
 		igt_crtc_t *crtc;
-		int pipe;
 
-		pipe = rand() % igt_display_n_crtcs(dpy);
-
-		crtc = igt_crtc_for_pipe(dpy, pipe);
-		if (!crtc || !crtc->valid)
-			continue;
+		crtc = igt_random_crtc(dpy);
 
 		output = igt_get_single_output_for_crtc(crtc);
 		if (!output)
-- 
2.47.3

