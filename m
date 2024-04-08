Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8DBCD129A
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 06:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73E9112115;
	Mon,  8 Apr 2024 06:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mwrxAA9c";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E987112124
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 06:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712557113; x=1744093113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=nNoCYzlCNSZX2Ed5kGkjpijQAMxScXOQAz5l2jk+k3E=;
 b=mwrxAA9cEzZkV+2G9/EnKSjLW4JLpXdeZdxOu/yLP7y67yKH0f1vVxM0
 gw3SHUYxh6sr++4EQmEvg9DAvKSORJcvnPwsCIM7cG9k1uRXbSSXGcfMT
 7Kf7WfcYNxLe+hMcKXgWKWPYfpNWKkV6mSYgRSAPQ3uVvcyXNy6Bs8TDw
 ZrtXxW5j+w/mGraJBK0dJehRkO0O72hsZ02Ayeu5H3iZodoReMN2zXNPU
 bwXNq62hUV8a1Y/w+qdfs+IzCcwpTTOszBBRNK/zpP85dB5hMbKcHiWkI
 bUM4hPvUzknVY5hWNzQRlm6yCk0D7PwNJ9XoCUYiBxoXQWU5XuzZA7SV7 g==;
X-CSE-ConnectionGUID: uKfzBk8KQs6DBKeDZPnmxQ==
X-CSE-MsgGUID: NDcukchyTUGRIriK56CGjQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7940250"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7940250"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:19 -0700
X-CSE-ConnectionGUID: BpoZXxmVTaWzSmZ1pm9x3g==
X-CSE-MsgGUID: pON51MvaT0OeT37POpF7hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="50976985"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:18 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 4/5] tests/intel/kms: Use lib helper to check the
 pipe/output combo validity
Date: Mon,  8 Apr 2024 11:42:20 +0530
Message-ID: <20240408061221.291523-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
References: <20240408061221.291523-1-bhanuprakash.modem@intel.com>
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

Use IGT lib helper intel_pipe_output_combo_valid() to make sure the
selected pipe/output/mode combo is valid.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/intel/kms_pm_backlight.c |  7 ++++---
 tests/intel/kms_psr.c          | 17 ++++++++++++-----
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/tests/intel/kms_pm_backlight.c b/tests/intel/kms_pm_backlight.c
index 2e691dab0..8672afa7a 100644
--- a/tests/intel/kms_pm_backlight.c
+++ b/tests/intel/kms_pm_backlight.c
@@ -234,10 +234,11 @@ static void test_setup(igt_display_t display, igt_output_t *output)
 	igt_display_reset(&display);
 
 	for_each_pipe(&display, pipe) {
-		if (!igt_pipe_connector_valid(pipe, output))
-			continue;
-
 		igt_output_set_pipe(output, pipe);
+		if (!intel_pipe_output_combo_valid(&display)) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
+		}
 		mode = igt_output_get_mode(output);
 
 		igt_create_pattern_fb(display.drm_fd,
diff --git a/tests/intel/kms_psr.c b/tests/intel/kms_psr.c
index c90612426..f3caa9ecc 100644
--- a/tests/intel/kms_psr.c
+++ b/tests/intel/kms_psr.c
@@ -728,9 +728,14 @@ static enum pipe get_pipe_for_output(igt_display_t *display,
 	enum pipe pipe;
 
 	for_each_pipe(display, pipe) {
-		if (igt_pipe_connector_valid(pipe, output)) {
-			return pipe;
+		igt_output_set_pipe(output, pipe);
+
+		if (!intel_pipe_output_combo_valid(display)) {
+			igt_output_set_pipe(output, PIPE_NONE);
+			continue;
 		}
+
+		return pipe;
 	}
 
 	igt_assert_f(false, "No pipe found for output %s\n",
@@ -750,9 +755,6 @@ static void test_setup(data_t *data)
 			      "Can't test FBC with PSR\n");
 
 	pipe = get_pipe_for_output(&data->display, data->output);
-	igt_output_set_pipe(data->output, pipe);
-	igt_require_f(intel_pipe_output_combo_valid(&data->display),
-		      "output pipe combo not valid\n");
 	data->crtc_id = data->output->config.crtc->crtc_id;
 	connector = data->output->config.connector;
 
@@ -763,6 +765,11 @@ static void test_setup(data_t *data)
 
 		igt_output_override_mode(data->output, data->mode);
 
+		if (!intel_pipe_output_combo_valid(&data->display)) {
+			igt_info("Skipping mode, not compatible with selected pipe/output\n");
+			continue;
+		}
+
 		psr_enable_if_enabled(data);
 		setup_test_plane(data, data->test_plane_id);
 		if (psr_wait_entry_if_enabled(data)) {
-- 
2.43.2

