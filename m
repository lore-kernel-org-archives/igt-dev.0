Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD89EA3F27
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 09:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDC210E10B;
	Wed, 11 Feb 2026 09:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V6IyFz4w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD2B810E10B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 09:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770801402; x=1802337402;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uPFBIxBB+XkHpdNJKDWuq+kIDKlVlm45tRiACG+RHkA=;
 b=V6IyFz4wpStY0bQ61nBeyMY5kskxWfS3qtJ70hPHGAFzPZ+Gu8aqrqk2
 lkHmTwPj+XXM5rSAjnll2Zhb7LcPrcPQcKSUwLnI6rdNralpYCHq/yUZe
 9Cd04K6i5yJ9oiG3ybnYADajTglx6ppQp/y3zbJmRCGLoiGzQZjwKeTAS
 Ou36fKgsGtyckXFVn9OeAmmHC/ylMKO4IzGTZrZvONTXylTYAAL1SgGzm
 EGsj2axV9kfVRFdKS1sDmK2i254cYB32A8akFnV9gixcoTmXcQoNDbwss
 1QuCY2Phm/1ZAOX3YDvvILAtT+WnSfLQoyMSqSk8vhWV4ZbQesRLuCaW5 Q==;
X-CSE-ConnectionGUID: XXGsVI7PRUarOv9puDamiw==
X-CSE-MsgGUID: KVOFU/OtTNOYXHrmYzNx7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="89354276"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="89354276"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:16:42 -0800
X-CSE-ConnectionGUID: qyQNSQyzQHuEls4L3Q+NOg==
X-CSE-MsgGUID: ++6wQhn5QJGM3jr72aNH9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="212279362"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.57])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Feb 2026 01:16:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	igt-dev@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t v2] lib/igt_kms: use for_each_crtc() for iterating CRTCs
Date: Wed, 11 Feb 2026 11:16:35 +0200
Message-ID: <20260211091635.1075060-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <ffbff2701a6e818380ac04b61d455d3a277f9a9f.1770736961.git.jani.nikula@intel.com>
References: <ffbff2701a6e818380ac04b61d455d3a277f9a9f.1770736961.git.jani.nikula@intel.com>
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

v2: 1 << pipe (Ville)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 lib/igt_kms.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index c4be889dc696..68d61472d9e8 100644
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
+		full_pipe_mask |= 1 << crtc->pipe;
 
 	/*
 	 * Try to assign all outputs to the first available CRTC for
-- 
2.47.3

