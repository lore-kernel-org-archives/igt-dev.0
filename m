Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56128D172DC
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 06:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0929110E27F;
	Mon,  2 Feb 2026 06:29:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="if1HP7Fe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6126710E27F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 06:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770013773; x=1801549773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6iv/rZZylaQOyteXc/oaEBEZPrfsiIXchBUrhogGND0=;
 b=if1HP7FeRF2wPfQtl9Mggy51UqXmJh575ubKqjmw0QmZceVLh6cyTbe6
 ip23t3xVRnJMwpY2D/LSiM+kwUUV2BRw1SdyFwXBOuF2yXxqM1hrVdEMy
 oKGaOyyDWCW9CQC7l0+lkYN7v57c8Vs2Jfuzu7zrPBzDd6M6p98w4kU1f
 FB3tublg9e8rfSbohrKzhxK7zZ9H1F0FG3GK28IIN1tmUD538izklnL86
 +yn2xkjkKOnvkrYhzDj75SnA4jqW0nC8769t40TMwYh3GIYFfFF24eCoc
 Mwz9ndj8pUga+zA7BjonwluDqh5ZBKU6NBPerwFwQw6/fWcGS+03cGKYP w==;
X-CSE-ConnectionGUID: 0tFJG148Q8OP6QADgITcCQ==
X-CSE-MsgGUID: YZDEyHOGQt26TPisATciUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11689"; a="82276739"
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="82276739"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2026 22:29:33 -0800
X-CSE-ConnectionGUID: fJ2OeHiVQS+XAvTywBC/Zw==
X-CSE-MsgGUID: NSxZ53DcRuufZuO+ck5log==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,268,1763452800"; d="scan'208";a="213966520"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by orviesa004.jf.intel.com with ESMTP; 01 Feb 2026 22:29:31 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 chaitanya.kumar.borah@intel.com
Subject: [PATCH i-g-t 3/4] tests/kms_color_pipeline: Disable pipe color
 properties in test setup
Date: Mon,  2 Feb 2026 11:34:14 +0530
Message-Id: <20260202060415.2680288-3-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
References: <20260202060415.2680288-1-chaitanya.kumar.borah@intel.com>
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

Move disabling of pipe-level color properties (CTM, degamma, gamma)
from the individual plane color tests into the common test setup.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 tests/kms_color_pipeline.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
index dd2eed637..e15f4d79a 100644
--- a/tests/kms_color_pipeline.c
+++ b/tests/kms_color_pipeline.c
@@ -65,6 +65,11 @@ static void test_setup(data_t *data, enum pipe p)
 	data->pipe_crc = igt_crtc_crc_new(crtc,
 					  IGT_PIPE_CRC_SOURCE_AUTO);
 
+	/* Disable Pipe color props. */
+	disable_ctm(crtc);
+	disable_degamma(crtc);
+	disable_gamma(crtc);
+
 	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 }
 
@@ -107,10 +112,6 @@ static void _test_plane_colorops(data_t *data, enum pipe pipe,
 				 &fb));
 	igt_plane_set_fb(plane, &fb);
 
-	/* Disable Pipe color props. */
-	disable_ctm(plane->crtc);
-	disable_degamma(plane->crtc);
-	disable_gamma(plane->crtc);
 	igt_display_commit_atomic(&data->display, 0, NULL);
 
 	/* Reference (software-equivalent) CRC */
-- 
2.25.1

