Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D064F531F1
	for <igt-dev@archiver.kernel.org>; Tue, 14 Apr 2026 07:16:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB35A10E28D;
	Tue, 14 Apr 2026 07:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIFa1yqU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95F4710E28D
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Apr 2026 07:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776150943; x=1807686943;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qNuvjMRcjBe0HtY96KiiAl9na5NHBzhXNOL/Ctp1Gpg=;
 b=TIFa1yqUr9NSzpUFUWmI1sHNVED65uveQSLzIry5Bf6cTnWT1MXXWaMR
 YZHOtcWLZ2mykfjdvJjyu+BSL/TBYrQceyLsvvjLcPZE8+cgWA0EJ+rv9
 AWmJcbcBN90acK/wcdtMricp8pcl+RePH/itfspdSLbrP7nIx5moiXj1c
 01ka7J46krka/DU4aF7BI+DpjW3AeKDkNIW1OHyjL1n5FmngRw2hWKCaH
 Sn8HFQ6LIIpAk5S3/eWRC39u8lEP3X42zoizIA4dzQmruaVi+CZlkDTvc
 qJpY8usjDAcOUnVK8pI6+QvGAOYD13xDT9A7o8FB3KYT1DxARtnGewkzQ w==;
X-CSE-ConnectionGUID: I4twZ3dHT3SIZ/IwnvItFQ==
X-CSE-MsgGUID: /PT9ZBjiT9uhLjlbUNmK9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="80690998"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="80690998"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:43 -0700
X-CSE-ConnectionGUID: v2df4dE8QRqmxNMcyOD38A==
X-CSE-MsgGUID: slNhMq4BSCqrld6ZH9ZodA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; d="scan'208";a="225712612"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.238])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2026 00:15:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com
Subject: [PATCH i-g-t 13/16] tests/kms_colorop: use for_each_output()
Date: Tue, 14 Apr 2026 10:14:33 +0300
Message-ID: <26bbbc2190dfcdd707ec89faaa9174d8bd664e61.1776150714.git.jani.nikula@intel.com>
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
 tests/kms_colorop.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 125afbb0573a..16db0b8ad37f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -129,7 +129,7 @@ static data_t data;
 
 static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 fourcc_in, __u32 fourcc_out)
 {
-	int i;
+	igt_output_t *output;
 	igt_crtc_t *crtc;
 
 	drmModeModeInfo override_mode = {
@@ -149,9 +149,7 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 four
 		.name = {"640x480-60"},
 	};
 
-	for (i = 0; i < display->n_outputs; i++) {
-		igt_output_t *output = &display->outputs[i];
-
+	for_each_output(display, output) {
 		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
 			continue;
 
-- 
2.47.3

