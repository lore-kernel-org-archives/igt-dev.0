Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC8CACA5FAF
	for <igt-dev@archiver.kernel.org>; Tue, 20 Jan 2026 17:17:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52610E641;
	Tue, 20 Jan 2026 17:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BcI2lmjt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8541010E641
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Jan 2026 17:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768929437; x=1800465437;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=11eqon6mSLsbzPbe7OB1fxzZonUhSp/wonmNRI7VaHM=;
 b=BcI2lmjtCLerfsG2VjYAF0fGVgFCXsn0SFooSwHUtD4CXunAa4vGhShQ
 sBCAQb/b6WKvKOJCjfbNJ+eEC4hyp5hUtm/SrZQbL/MV+KxwaI+1loF29
 TywSz6ISCSdRUwiAP+d/KCip327GCEFfcRgKbA4rFGDz+/uLiZ8cKkkkx
 1//e4fPzTjNWADAakQsnQNErWiqc4S7BIRtlMoqjB9dE6UtviBy1iQg4V
 CVMs/LHlrVBuLMsQiUqMHUNQh3JfN/69cQGjWEwueecHSxOxy7pIf/TUe
 3BPYG7aWfmG8rNrPn9+7GgTVg3tfMkJh/UEZOWYnJv88kXH1mWfkZWS83 w==;
X-CSE-ConnectionGUID: vbGV9KU7RKq9LMPfk+w3Zg==
X-CSE-MsgGUID: Xt8L6b3dTaGzQ6BsJIUSwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="72731876"
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="72731876"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:17 -0800
X-CSE-ConnectionGUID: vzkeRUpBTo+kv2DUCJAfPw==
X-CSE-MsgGUID: BHYq5YylRFaeILveGfWAJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,241,1763452800"; d="scan'208";a="206222084"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.13])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2026 09:17:16 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 04/12] lib/kms: Don't pass 'display' to
 igt_fill_pipe_props)_
Date: Tue, 20 Jan 2026 19:16:47 +0200
Message-ID: <20260120171656.15840-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
References: <20260120171656.15840-1-ville.syrjala@linux.intel.com>
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

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

igt_fill_pipe_props() can dig the display out from
the crtc. No need to pass it in explicitly.

Done with cocci:
 #include "scripts/iterators.cocci"

@@
identifier DISPLAY, CRTC;
@@
igt_fill_pipe_props(
-	igt_display_t *DISPLAY,
	igt_crtc_t *CRTC, ...)
{
+ igt_display_t *DISPLAY = CRTC->display;
...
}

@@
expression DISPLAY;
@@
igt_fill_pipe_props(
-	DISPLAY,
	...)

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 lib/igt_kms.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a7d259923932..33e510acc514 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -964,9 +964,10 @@ igt_atomic_fill_connector_props(igt_display_t *display, igt_output_t *output,
 }
 
 static void
-igt_fill_pipe_props(igt_display_t *display, igt_crtc_t *pipe,
+igt_fill_pipe_props(igt_crtc_t *pipe,
 		    int num_crtc_props, const char * const crtc_prop_names[])
 {
+	igt_display_t *display = pipe->display;
 	drmModeObjectPropertiesPtr props;
 	int i, j, fd;
 
@@ -3123,7 +3124,7 @@ static void igt_crtc_init(igt_display_t *display,
 	pipe->planes = NULL;
 	pipe->num_primary_planes = 0;
 
-	igt_fill_pipe_props(display, pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
+	igt_fill_pipe_props(pipe, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
 
 	/* Get valid crtc index from crtcs for a pipe */
 	crtc_mask = __get_crtc_mask_for_pipe(resources, pipe);
-- 
2.52.0

