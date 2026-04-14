Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBDDF531F1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:16:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB91610E072;
	Tue, 14 Apr 2026 07:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GJVmy83e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCE410E28D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150926; x=1807686926;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=JLL0eKg3N99PkulEa7dyvRfzc2l5oPLpgoCIFykCJRY=;
 b=GJVmy83eFEHftZSP1FZ3MHoqLpho3WLLyOVigTWfhzBEuHUSXpMhxATo
 Dxn7WXjaaYpfdg4nMcAjlGZBG5O+NHQXPsWvwifeYl+kRciCjfWbofmKs
 tWZloQk226qfs/M0CtlXmOtTvhRjRDGMj3m3qtOxZ8YZjxvKw0gaqd4nl
 3sr1Rvkoxwci/Vxt00ZRrUtzU2jMHxeUwRuTt+HZOCtdG3dzFZAXdGPUZ
 y7kK9orj7WMq0J7RJdCxFiHzzTjov2wlipDAt35Syn4teOSeWDgLeRugs
 A+tUhnFRamILgmx9Iod9r0QuSD3oAQ4twBqMNyOWU1bfBQOG4iEgy5Uu6 Q==;
X-CSE-ConnectionGUID: epa3ELKFQ7GgjfYzKkLFEg==
X-CSE-MsgGUID: a5YvAX4LTNi87XSdvEAoIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80690978"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80690978"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:26 -0700
X-CSE-ConnectionGUID: vWyxRCIdRvGC3u0ZjTwZEg==
X-CSE-MsgGUID: EHvsM0fhSjaVPoXR0Uw+sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225712484"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:24 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 09/16] tests/amdgpu/amd_subvp: use for_each_output()
Date: Tue, 14 Apr 2026 10:14:29 +0300
Message-ID: <ecb9826bd2fb054c6b06732370dea050362b9e87.1776150714.git.jani.nikula@intel.com>
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

Tweak the CRTC limit check slightly when removing the for loop.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/amdgpu/amd_subvp.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_subvp.c b/tests/amdgpu/amd_subvp.c
index 61b93e6af509..7cc51c7047e1 100644
--- a/tests/amdgpu/amd_subvp.c
+++ b/tests/amdgpu/amd_subvp.c
@@ -58,8 +58,9 @@ static void force_output_mode(struct data *d, igt_output_t *output,
 static void test_init(struct data *data)
 {
 	igt_display_t *display = &data->display;
+	igt_output_t *output;
 	igt_crtc_t *crtc;
-	int i, n;
+	int n = 0;
 	bool subvp_capable = false;
 	bool subvp_en = false;
 
@@ -71,9 +72,9 @@ static void test_init(struct data *data)
 			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
-	for (i = 0,
-	     n = 0; i < display->n_outputs && n < igt_display_n_crtcs(display); ++i) {
-		igt_output_t *output = &display->outputs[i];
+	for_each_output(display, output) {
+		if (n == igt_display_n_crtcs(display))
+			break;
 
 		data->output[n] = output;
 		/* Only allow physically connected displays for the tests. */
-- 
2.47.3

