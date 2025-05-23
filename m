Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B07C54ED0
	for <igt-dev@archiver.kernel.org>; Fri, 23 May 2025 09:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E3F210E7A9;
	Fri, 23 May 2025 09:11:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GWeP0eVc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA7A210E738
 for <igt-dev@lists.freedesktop.org>; Fri, 23 May 2025 09:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747991482; x=1779527482;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tfwW+WhTJ75VU2DJfde8o8iVPZtqHAqd/2AwSnZaDXI=;
 b=GWeP0eVc5AfjxfHgLqkytlFLawpEjor1lippJMGr0WhT4z8+wJRu7nWc
 +1yrfwdVH+W8Dz9Pu2olbwgmjyAh4TSGzgTMqaAM3DHzQvEqKTirYhmJJ
 Hg47xPlPhTsuJkGtpMCjz9PX6f6PGJ0z5Y/Rj87/0vxuiQtzSLofKvt09
 iJjvAXT4KH2M4o9D1yhCzFhzOp0oGVm7DQ9mDpeIIMgN6K2w1lYwOkYg7
 LGhXwrbIa/5lNxyeXtCVHmN044FbMmPtHu0UckNa8GlNXrUaNxy4mgOF+
 HXa6TgCbPXVgTizYqJJFbIGLenwLf5EuHFydbzSBLwoqLXcotRfbf0Tgf A==;
X-CSE-ConnectionGUID: V/HfB63zQnmhnBiOGyv9jQ==
X-CSE-MsgGUID: X7Dmk+Y6TS2rFHkIWD+7gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53853105"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="53853105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 02:11:22 -0700
X-CSE-ConnectionGUID: 7unzV5poQsS3uW7gfvXBXQ==
X-CSE-MsgGUID: yEYgt+7uQYy/MqR2CebeHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; d="scan'208";a="140941573"
Received: from dut2122ptlh.iind.intel.com (HELO
 linux-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.223.34.115])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 02:11:20 -0700
From: Swati Sharma <swati2.sharma@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Swati Sharma <swati2.sharma@intel.com>
Subject: [PATCH i-g-t] tests/intel/kms_cdclk: Skip mode-transition subtest on
 eDP outputs with fixed modes
Date: Fri, 23 May 2025 14:46:52 +0530
Message-Id: <20250523091652.1407070-1-swati2.sharma@intel.com>
X-Mailer: git-send-email 2.25.1
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

eDP panels typically advertise a limited set of fixed modes, often with
minimal variation (e.g., only differing in refresh rate). As a result,
the computed CDCLK frequency for both high and low refresh rate modes
can be identical, preventing a CDCLK bump and causing the test to fail
unnecessarily.

To avoid such false negatives, skip the CDCLK bump test on eDP outputs
and restrict testing to external outputs like DP and HDMI, where a wider
range of modes is available and CDCLK bumps can be meaningfully
validated.

Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
---
 tests/intel/kms_cdclk.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
index 0c7c235f3..4c6dd9276 100644
--- a/tests/intel/kms_cdclk.c
+++ b/tests/intel/kms_cdclk.c
@@ -325,6 +325,13 @@ static void run_cdclk_test(data_t *data, uint32_t flags)
 	enum pipe pipe;
 
 	for_each_pipe_with_valid_output(display, pipe, output) {
+		drmModeConnectorPtr c = output->config.connector;
+
+		/* Skip eDP outputs as they typically have fixed
+		 * modes and won't trigger CDCLK bump. */
+		if (c->connector_type == DRM_MODE_CONNECTOR_eDP)
+			continue;
+
 		igt_output_set_pipe(output, pipe);
 		if (!intel_pipe_output_combo_valid(display)) {
 			igt_output_set_pipe(output, PIPE_NONE);
-- 
2.25.1

