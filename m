Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A48F531F1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:16:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444D210E28D;
	Tue, 14 Apr 2026 07:16:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nQ32ttAo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DDF110E28D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150939; x=1807686939;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QQiqg5b1LdL8SgNKaIFdrhkmBilzMvcRDwFuemjwnxw=;
 b=nQ32ttAoMiqadotrSfJx65fZ3+1oaPxxqOEnN158FboLuRifq2uHU7up
 qg+VTnqH5WRAZPAvzMFjI71yq3rMiCCCPBwyBodRZq7j99gOpMOswjMBp
 6pt0CUvs3dXLSQua3c9VwfQ5cpbxYGQZwYoM8YGuwnInMO4Ch2lRzqb+f
 IFlRBvtaZ3AMWiVZhDMxwPTz+wC56RK2et+sjariy32z+Ad0UF/0cDIf7
 VDSBsdNwohEMkQCOjTH9K3FBJS3iU12x46ksY8E/GJPxPm3nEiP2iLWpX
 vMOiP0rFYVJJ2G7TRh8WN/mdveA6bcobLoaA8KjI+JQ/EEiNrO9TQ2J6+ Q==;
X-CSE-ConnectionGUID: 1HoitPw6SrWklRdbyYUXLA==
X-CSE-MsgGUID: UoiupfuLSKGicE3QwXISjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80690992"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80690992"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:39 -0700
X-CSE-ConnectionGUID: xJHNdM1cRqOCUaz+Jbi0FQ==
X-CSE-MsgGUID: 6ZubUNSPTGq6ztZKJAW2dQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225712601"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 12/16] tests/kms_atomic_transition: use for_each_output()
Date: Tue, 14 Apr 2026 10:14:32 +0300
Message-ID: <ad9aa8dd3ec1697b4a2e8329d93dea9a9d273a87.1776150714.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1776150714.git.jani.nikula@intel.com>
References: <cover.1776150714.git.jani.nikula@intel.com>
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

Use for_each_output() instead of manually iterating display->outputs[i].

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_atomic_transition.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tests/kms_atomic_transition.c b/tests/kms_atomic_transition.c
index 5ae8da3c0cb4..431508a83853 100644
--- a/tests/kms_atomic_transition.c
+++ b/tests/kms_atomic_transition.c
@@ -835,10 +835,10 @@ static void commit_display(data_t *data, unsigned event_mask, bool nonblocking)
 
 static void unset_output_pipe(igt_display_t *display)
 {
-	int i;
+	igt_output_t *output;
 
-	for (i = 0; i < display->n_outputs; i++)
-		igt_output_set_crtc(&display->outputs[i], NULL);
+	for_each_output(display, output)
+		igt_output_set_crtc(output, NULL);
 }
 
 static unsigned set_combinations(data_t *data, unsigned mask, struct igt_fb *fb)
-- 
2.47.3

