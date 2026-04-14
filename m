Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8261F531F8
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB1010E072;
	Tue, 14 Apr 2026 07:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m/P2bXHC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF33310E072
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150922; x=1807686922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mLdAHoOCPl7Ve9H8glRzK8Whie66KW7Ikh8IbB1ds2c=;
 b=m/P2bXHCBwEXtJPdSQboXUoMV72IejkHsGQ7L3XUIar/WE21Jgfjppg9
 ulFGeTMELxH2Y5jOvONp96wnRGMfKWvUdaRD3qtLqvkXov5dH8GWVLLOQ
 H+hV2t/rWwQZr5gA2XOQAEHHtPlk9IHlynW/eQl0NXMTKbiEa9fJasjjO
 jEgGnVvIfXeGWWR/iAbQnVqZnsVG5XwI2O7s0BLk6E0ePgkhiG+SM2cU2
 MJhaGMbzmE47WeDuM/rI5JATaR/cmo5Gg1+jEpkAZrDQXSg9wT6Efx2/w
 DW4b7eGlEPZpy67W+ZNCSop6qPP8Y8OYvfqtFbnvq+FGRuuNu6KEhnPfP A==;
X-CSE-ConnectionGUID: 766Nrg1DSZaEH7ojLQsCeg==
X-CSE-MsgGUID: lw9ggH3BQq6TU5ykgbr63Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80690974"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80690974"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:21 -0700
X-CSE-ConnectionGUID: +7JzEcXuSS2HJelsnFsvag==
X-CSE-MsgGUID: 9Kb3NxOiTK+s/VZmY4z3/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225712431"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:20 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 08/16] tests/amdgpu/amd_hotplug: use for_each_output()
Date: Tue, 14 Apr 2026 10:14:28 +0300
Message-ID: <d96f785b326d8160859f7276dcc33b1738f65b82.1776150714.git.jani.nikula@intel.com>
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
 tests/amdgpu/amd_hotplug.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 5049eca88439..83ad55ea0cf6 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -50,7 +50,8 @@ typedef struct data {
 static void test_init(data_t *data)
 {
 	igt_display_t *display = &data->display;
-	int i, n, max_pipes = igt_display_n_crtcs(display);
+	int n = 0;
+	igt_output_t *output;
 	igt_crtc_t *crtc;
 
 	for_each_crtc(display, crtc) {
@@ -65,8 +66,9 @@ static void test_init(data_t *data)
 			igt_crtc_crc_new(crtc, IGT_PIPE_CRC_SOURCE_AUTO);
 	}
 
-	for (i = 0, n = 0; i < display->n_outputs && n < max_pipes; ++i) {
-		igt_output_t *output = &display->outputs[i];
+	for_each_output(display, output) {
+		if (n == igt_display_n_crtcs(display))
+			break;
 
 		data->output[n] = output;
 
-- 
2.47.3

