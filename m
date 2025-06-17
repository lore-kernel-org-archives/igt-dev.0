Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA44C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 06:23:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC2610E4E9;
	Tue, 17 Jun 2025 06:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2sM2Yss";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC5E10E4E9
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 06:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750141422; x=1781677422;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E/Pmsze9ll4z2t5mGvR8TAPhLiH7fiofgMYvkfTMgP8=;
 b=k2sM2YssbtFMJU1hmrWzyNg01gUJZpDEdPgll1tUnCTYBpvnAVnJ8L0T
 rRKe+T2EplKDQZVtjL5JkSz33bPbqjazzWlOWcuEMyy7tPefdqGztKAsz
 Lr5xd53BCs5KsltpRD1RrtXcbH4/yX9rWBXrkT+lAU/ul8PP2g8LIpAZo
 +Tsu1COXBV21dtjqE65808Wx6RfEJgEciL3ztMLt8SRlVK6FiZCm3IZg9
 C8FovTHFt0rtsli5w1eLjdoyBvk13ij/nmPMXKRszVH/aktfuTbl78Rxf
 NwH63efZjgmzq142bGhNg3xysEfnNSdFQEwg2S+yqYWASYq0KDYDWUT7c w==;
X-CSE-ConnectionGUID: c/XMMj24RVydACniCUKLyQ==
X-CSE-MsgGUID: /9wvx1xMQmC0ozp/QxMJyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63653185"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="63653185"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 23:23:41 -0700
X-CSE-ConnectionGUID: TnOnKugkTEu2aVbofIa9dA==
X-CSE-MsgGUID: WvCHHPobRWS4B4nYy+AUMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; d="scan'208";a="148583464"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa010.jf.intel.com with ESMTP; 16 Jun 2025 23:23:39 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 sameer.lattannavar@intel.com, pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/kms_bw: Restrict linear-tiling subtest to HDMI
 outputs and improve skip logic
Date: Tue, 17 Jun 2025 12:01:19 +0530
Message-Id: <20250617063119.36344-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This patch updates the linear-tiling subtest in kms_bw to only use HDMI
connector. If the platform does not have enough HDMI outputs to match the
number of requested pipes, the test is skipped with a clear message
indicating the requirement and the number of HDMI outputs found.

This avoids attempting to force modes on non-HDMI connectors and makes 
the test results clearer and more reliable on systems that don’t have 
enough HDMI connectivity.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_bw.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index ca05695d3..042edf32f 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -194,7 +194,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	igt_crc_t zero, captured[IGT_MAX_PIPES];
 	int i = 0, num_pipes = 0;
 	enum pipe p;
-	int ret;
+	int ret, hdmi_count = 0;
 
 	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
@@ -215,6 +215,13 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 			continue;
 		}
 
+		if (!physical &&
+		    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIA &&
+		    output->config.connector->connector_type != DRM_MODE_CONNECTOR_HDMIB)
+			continue;
+
+		hdmi_count++;
+
 		force_output_mode(data, output, mode);
 
 		igt_create_color_fb(display->drm_fd, mode->hdisplay,
@@ -229,6 +236,10 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 			 kmstest_pipe_name(i), igt_output_name(output), mode->name);
 	}
 
+	if (!physical && hdmi_count < (pipe + 1))
+		igt_skip("Skipping test: required %d HDMI outputs, but only found %d HDMI "
+			 "outputs to force mode\n", pipe + 1, hdmi_count);
+
 	ret = igt_display_try_commit_atomic(display,
 					    DRM_MODE_ATOMIC_ALLOW_MODESET |
 					    DRM_MODE_ATOMIC_TEST_ONLY,
-- 
2.34.1

