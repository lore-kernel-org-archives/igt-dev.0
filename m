Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B5AFC7EE33
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 10:11:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D561910E25A;
	Thu, 26 Jun 2025 10:11:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N0IV4Atd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03AE110E25A
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 10:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750932717; x=1782468717;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dEDvQl2Ft3NFhfOlgxwFD461cWQFUxBOhV0XpOuV+SQ=;
 b=N0IV4AtduzsPop+ShZ406YuVRqeDHYvIAhjaB/feAWi0xbNQBvj0oce8
 UPaLJMBXYlRSvTSrWlgR9uRMxYU9V3fuGhX3RpV05lOSQvdbPbUX4LUbm
 xsvDsr4vY2Pm0CFGd5L+0pq1rOomJ1AinhKOb5hrGSGP5HdDCeRhPNyvf
 Bqwvl/RZeDI9vERRqSAif//EY95rMn7lkP8kqwmdUqpWrj7JJQCAS+uc9
 fq2KK39tq/+dkDO5W25/feNf5oDmK5c9FdgyHldV+5QcbUog+KCbBbqLW
 N30nKguiyWqE8jD7iBqErxaPK5QNzUBAjMqzitQdNu0Byu19Lu3n1uGzF w==;
X-CSE-ConnectionGUID: WxtaZxZSS5u7cmyt0TCREg==
X-CSE-MsgGUID: QZDXERNxRwmAK5fRujOGmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52450084"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="52450084"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 03:11:56 -0700
X-CSE-ConnectionGUID: l31cRmwXSQCT1XhYfG1PiA==
X-CSE-MsgGUID: pdWwCqjDRdKZdhUWcEtCOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="157040249"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.140])
 by orviesa004.jf.intel.com with ESMTP; 26 Jun 2025 03:11:54 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 ramanaidu.naladala@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t v2] tests/kms_bw: Restrict linear-tiling subtest to HDMI
 outputs and improve skip logic
Date: Thu, 26 Jun 2025 15:49:32 +0530
Message-Id: <20250626101932.605649-1-pranay.samala@intel.com>
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

v2: Skip the test instead of continue (Rama)
    Remove hdmi_count (Rama)
Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/kms_bw.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/kms_bw.c b/tests/kms_bw.c
index ca05695d3..3ebfdcebd 100644
--- a/tests/kms_bw.c
+++ b/tests/kms_bw.c
@@ -195,6 +195,7 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 	int i = 0, num_pipes = 0;
 	enum pipe p;
 	int ret;
+	uint32_t conn_type;
 
 	/* Cannot use igt_display_get_n_pipes() due to fused pipes on i915 where they do
 	 * not give the numver of valid crtcs and always return IGT_MAX_PIPES */
@@ -215,6 +216,13 @@ static void run_test_linear_tiling(data_t *data, int pipe, const drmModeModeInfo
 			continue;
 		}
 
+		conn_type = output->config.connector->connector_type;
+
+		igt_skip_on_f(!physical &&
+			      conn_type != DRM_MODE_CONNECTOR_HDMIA &&
+			      conn_type != DRM_MODE_CONNECTOR_HDMIB,
+			      "Cannot force mode, connected output is not HDMI\n");
+
 		force_output_mode(data, output, mode);
 
 		igt_create_color_fb(display->drm_fd, mode->hdisplay,
-- 
2.34.1

