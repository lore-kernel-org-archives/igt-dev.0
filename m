Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9716EA812D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E8F210E5AB;
	Tue, 10 Feb 2026 15:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bs+QcGIE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A0810E5AB
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737099; x=1802273099;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W7V1tCDTUQx6zJ70zTKp4FlrGYxP3FGym442mD1eFYI=;
 b=Bs+QcGIEGOpLsjAwaIKGwzqQqr3fVUGfPEl+JEoY3VXbqI8GH6AflSlt
 XWAqShuH+PDzkE9dNP9JmkTkHXoKRKcr/ySTXazWrLVYXD0C0bnamyGRe
 Am3NXO8kudhuYY1DoXc+zD/cwt6gpZYL2kTePrE3n0FcDqY6bCStLChDk
 2Ewt2NW3cI9Cm54qwaeTCNrBaFKJV775k07T1G4UyVSi2vHcqdm8ZXWio
 SPcp8NvFUFg72yAXEku2aSoB9IkzyH6akp/+HPoo96mxhcIvm9P2/DjbS
 o3DAdDru+8SQV7ts9tPwpKzHUoEee0tqi91g+SkqzBJJ+nEqOjZakrfns g==;
X-CSE-ConnectionGUID: Xd3i9Ai2RZi/Ew5dZvMMRQ==
X-CSE-MsgGUID: s7pe0jtLSciyUN6hZpGcgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71912103"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71912103"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:59 -0800
X-CSE-ConnectionGUID: 0yB8LR+0T4uQouLSNv3eQA==
X-CSE-MsgGUID: 3Es5NLFnS0uS6YqGIxr6sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212030392"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:57 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 09/11] lib/igt_kms: remove __get_crtc_mask_for_pipe()
Date: Tue, 10 Feb 2026 17:23:50 +0200
Message-ID: <030cf07f0a825b2492833858a47dd1d425df1ef1.1770736961.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770736961.git.jani.nikula@intel.com>
References: <cover.1770736961.git.jani.nikula@intel.com>
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

The whole __get_crtc_mask_for_pipe() function is a complicated and
confusing way to say 1 << crtc->crtc_index. Just inline it for clarity.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 20 ++------------------
 1 file changed, 2 insertions(+), 18 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 9e90ee8bc54f..e6f45bb0ef9d 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2830,21 +2830,6 @@ void igt_require_pipe(igt_display_t *display, enum pipe pipe)
 			kmstest_pipe_name(pipe));
 }
 
-/* Get crtc mask for a pipe using crtc id */
-static int
-__get_crtc_mask_for_pipe(drmModeRes *resources, igt_crtc_t *crtc)
-{
-	int offset;
-
-	for (offset = 0; offset < resources->count_crtcs; offset++)
-	{
-		if(crtc->crtc_id == resources->crtcs[offset])
-			break;
-	}
-
-	return (1 << offset);
-}
-
 static bool igt_pipe_has_valid_output(igt_display_t *display, enum pipe pipe)
 {
 	igt_output_t *output;
@@ -3081,7 +3066,7 @@ static void igt_crtc_init(igt_display_t *display,
 			  drmModeRes *resources, int i)
 {
 	igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
-	int crtc_mask = 0;
+	int crtc_mask;
 	int j;
 
 	crtc->display = display;
@@ -3090,8 +3075,7 @@ static void igt_crtc_init(igt_display_t *display,
 
 	igt_fill_crtc_props(crtc, IGT_NUM_CRTC_PROPS, igt_crtc_prop_names);
 
-	/* Get valid crtc index from crtcs for a pipe */
-	crtc_mask = __get_crtc_mask_for_pipe(resources, crtc);
+	crtc_mask = 1 << crtc->crtc_index;
 
 	/* count number of valid planes */
 	for (j = 0; j < display->n_planes; j++) {
-- 
2.47.3

