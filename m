Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2025EF3C26D
	for <igt-dev@archiver.kernel.org>; Mon,  9 Mar 2026 14:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C380B10E15A;
	Mon,  9 Mar 2026 14:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Kx8Z1gjV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB45B10E15A
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Mar 2026 14:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773066149; x=1804602149;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nJQO25rRpRCawX9qBUdOrBZx8FY2GRPn/Lm37RMD+QU=;
 b=Kx8Z1gjVU1KheFgnJyq10DDf7naR4LtH+P+4GeiPB6VESe8BNzx6zNKD
 dfklxZO3za8P3S3SP7KJH5+ZW6x5NK1h65Vp04jL88J1D6Mnj31o6ZTPZ
 loKhg46dCi7sJoAfjLbB13aPTxqlj3N9ZMmIlKudCXSauHdyiwFNO10qu
 le1we9o8PRI4lneoqFdFOUDCp+ggsUxCBU2TUs1Znubm/aE/ct5rjS36Z
 shnBeiU2xcN7rg1e5lWvNhwBlM1cpJ2ltMAru9/TBrkoPmQAIZC4fjcuW
 rwC1LVARu+Qp6MZgmJFnyBhNxz4JQ4QQIuZC/NGaLpkcWsFgSAyZx6jHe Q==;
X-CSE-ConnectionGUID: 7qMQwpCLRAa5wo+yOOeedQ==
X-CSE-MsgGUID: EwzDMcyqTMilXB+SkoFSUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="91660521"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="91660521"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:28 -0700
X-CSE-ConnectionGUID: pLqkLbHQTm+To5ZxnzEQYg==
X-CSE-MsgGUID: 6u6PcI0/TxOjBpKtG77wcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; d="scan'208";a="250241396"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.239])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 07:22:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: jani.nikula@intel.com,
	ville.syrjala@linux.intel.com
Subject: [PATCH i-g-t 07/10] tests/kms_plane_alpha_blend: use CRTC indexes
 instead of pipes for CRTC tracking
Date: Mon,  9 Mar 2026 16:21:41 +0200
Message-ID: <b0fabd93ac9223a32dd51d0a80790398595f9f52.1773066012.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1773066012.git.jani.nikula@intel.com>
References: <cover.1773066012.git.jani.nikula@intel.com>
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

The test tracks	"active" CRTCs in a dedicated array. This does not
depend on pipes in any way. Switch to using CRTC indexes instead.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 tests/kms_plane_alpha_blend.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
index a3a993fd28c5..3a67dd8cd2fd 100644
--- a/tests/kms_plane_alpha_blend.c
+++ b/tests/kms_plane_alpha_blend.c
@@ -68,8 +68,8 @@
 IGT_TEST_DESCRIPTION("Test plane alpha and blending mode properties");
 
 static bool extended;
-static enum pipe active_pipes[IGT_MAX_PIPES];
-static uint32_t last_pipe;
+static int active_crtcs[IGT_MAX_PIPES];
+static uint32_t last_crtc_index;
 
 typedef struct {
 	int gfx_fd;
@@ -705,8 +705,8 @@ static void run_subtests(data_t *data)
 			for_each_crtc_with_single_output(&data->display, crtc,
 							 output) {
 				if (!extended &&
-				    crtc->pipe != active_pipes[0] &&
-				    crtc->pipe != active_pipes[last_pipe])
+				    crtc->crtc_index != active_crtcs[0] &&
+				    crtc->crtc_index != active_crtcs[last_crtc_index])
 					continue;
 
 				igt_display_reset(&data->display);
@@ -757,7 +757,7 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 	igt_fixture() {
 		igt_crtc_t *crtc;
 
-		last_pipe = 0;
+		last_crtc_index = 0;
 
 		data.gfx_fd = drm_open_driver_master(DRIVER_ANY);
 		igt_require_pipe_crc(data.gfx_fd);
@@ -766,8 +766,8 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 
 		/* Get active pipes. */
 		for_each_crtc(&data.display, crtc)
-			active_pipes[last_pipe++] = crtc->pipe;
-		last_pipe--;
+			active_crtcs[last_crtc_index++] = crtc->crtc_index;
+		last_crtc_index--;
 
 		in_simulation = igt_run_in_simulation();
 	}
-- 
2.47.3

