Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 633BAEA812D
	for <igt-dev@archiver.kernel.org>; Tue, 10 Feb 2026 15:24:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11CC110E5AB;
	Tue, 10 Feb 2026 15:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SD2zkIm4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0658910E5AB
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Feb 2026 15:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770737089; x=1802273089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3j6XQAqIizX0lqZ10CqXLbXtF66kA+Te7/gGmbVf+dc=;
 b=SD2zkIm4GmEhJvALHUkQ+8d2DJu0nL9yyREUBk8pyj51T6oOIxMokUxp
 A/DW+AXwmKAEMhunW/MpDuGbwoclZoVVvxPxVv5C1E7EOPUaGinpon8et
 Ler4FpmHZM52YB1qKDdraIjKWsazciIkXLpJ1oqU7BAEj4fY+BB6QEI/5
 OC922twzYohmgEX31t3FVXMLVqE94HAqwmhJ9UcuDxLUct/yZwV6KmU7C
 os1uztMGUPRYbqLwk3qqT/q/IHBr8zjT3O6INF6JbA9PIp4gXGNc+IoQp
 vGm+0xq2XMCjdUp+W4wXPjPKZwgaXRw/lY+zMuKNpim0l82M1jhA9hRN0 Q==;
X-CSE-ConnectionGUID: odBAI1iKTWWf3qix+mJMeg==
X-CSE-MsgGUID: hoqTispsTRmpy3zl1YQvRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="71912083"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="71912083"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:49 -0800
X-CSE-ConnectionGUID: JauUIOlBTgC3RH/t1h8N3A==
X-CSE-MsgGUID: j1NXn2wQTQ6nh7zkWw1yhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212030331"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.246])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 07:24:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com,
	jani.nikula@intel.com
Subject: [PATCH i-g-t 07/11] lib/igt_kms: use for_each_crtc() for iterating
 CRTCs
Date: Tue, 10 Feb 2026 17:23:48 +0200
Message-ID: <ffbff2701a6e818380ac04b61d455d3a277f9a9f.1770736961.git.jani.nikula@intel.com>
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

The loop still figures out the pipe mask, keep using pipe here. The main
thing is not using the loop index as pipe, as that is subject to change
in the future.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c4be889dc696..63fd8095c551 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -3622,16 +3622,14 @@ igt_output_t **__igt_pipe_populate_outputs(igt_display_t *display, igt_output_t
 {
 	unsigned full_pipe_mask = 0, assigned_pipes = 0;
 	igt_output_t *output;
+	igt_crtc_t *crtc;
 	int i, j;
 
 	memset(chosen_outputs, 0,
 	       sizeof(*chosen_outputs) * igt_display_n_crtcs(display));
 
-	for (i = 0; i < igt_display_n_crtcs(display); i++) {
-		igt_crtc_t *crtc = igt_crtc_for_pipe(display, i);
-		if (crtc->valid)
-			full_pipe_mask |= (1 << i);
-	}
+	for_each_crtc(display, crtc)
+		full_pipe_mask |= crtc->pipe;
 
 	/*
 	 * Try to assign all outputs to the first available CRTC for
-- 
2.47.3

