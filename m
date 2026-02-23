Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DAB6E98E0F
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 09:24:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17F810E2B1;
	Mon, 23 Feb 2026 09:24:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nufyEgVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 683F310E2C9
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 09:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771838649; x=1803374649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xwguf+Nsh48CLN8515/Xwfz5/w1exFdt+S3nn6KnGhU=;
 b=nufyEgVB7RJvHFZ20XXhO0/oD/G++MKV+8Qdy7/K2IjO+OOH6T8cLe5K
 Bs9kfrOenVOpjzuqbgty7Tw3K7h2xInFXpN7lgB/3QhHZtqStEdxO724D
 /rocKq41yW4tGDP07BGsME38WHBFzP4s32p3k7ArhFaUg3hOVpZzjXc2G
 6ZZXNvw5hVG5rs9UYnb06edcjyln2c1Nk3JlV6B1cQUhEBPkVdwbNsiLW
 cMpkVFlt1gmsq4nVmml1AkW1aWQmADFVLVV52+F+sE78D7h0q68YhcgJJ
 7FXFzQ1tdngUpyMSVKkynZzy+l4qr1FCJpEpb0Uyel2B70RmFkJubd5/p w==;
X-CSE-ConnectionGUID: oHdl9mo6Siu4eEJawpPb7A==
X-CSE-MsgGUID: 2MWOJNFzSHmewA27jAhQ3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="75437926"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="75437926"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 01:24:09 -0800
X-CSE-ConnectionGUID: qWzNYE2PQJiUUETiqk9ONg==
X-CSE-MsgGUID: fc34omXLTmmFAwMohvhPtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="243687769"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by fmviesa001.fm.intel.com with ESMTP; 23 Feb 2026 01:24:08 -0800
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t 2/2] tests/intel/kms_sharpness_filter: Detect and bypass
 joiner modes
Date: Mon, 23 Feb 2026 15:04:43 +0530
Message-Id: <20260223093443.1797078-3-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260223093443.1797078-1-pranay.samala@intel.com>
References: <20260223093443.1797078-1-pranay.samala@intel.com>
MIME-Version: 1.0
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

When the output configured to a joiner mode (Big Joiner or Ultra Joiner),
switch to a non-joiner mode before running the sharpness filter test,
since CASF is not supported on joiner configurations.
This ensures the sharpness filter test runs on a single pipe configuration
and avoid false failures.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index eddfad6b9..e1a6be676 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -440,7 +440,16 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 			data->output = output;
 			data->pipe_id = crtc->pipe;
 			data->crtc = igt_crtc_for_pipe(display, data->pipe_id);
-			data->mode = igt_output_get_mode(data->output);
+
+			if (is_joiner_mode(data->drm_fd, data->output)) {
+				data->mode = igt_get_non_joiner_mode(data->drm_fd, data->output);
+				igt_info("Executing on mode %dx%d@%d\n",
+					 data->mode->hdisplay,
+					 data->mode->vdisplay,
+					 data->mode->vrefresh);
+			} else {
+				data->mode = igt_output_get_mode(data->output);
+			}
 
 			if (!has_sharpness_filter(data->crtc)) {
 				igt_info("%s: Doesn't support IGT_CRTC_SHARPNESS_STRENGTH.\n",
-- 
2.34.1

