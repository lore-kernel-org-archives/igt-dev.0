Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4115C2BA18
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:29:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A60710E585;
	Tue, 18 Jun 2024 06:29:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ajMGQarq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE73610E582
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692195; x=1750228195;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=C0mi/eP2YiX9jeACtgQ3b7thhoX3LyiXaSElEV/VGSM=;
 b=ajMGQarqhP07lao2ZXQkxBt50zNVmcG1glC+41N+kpaZdHpFJuapcN2t
 wnHRiLJs3qsay24Hu+4vZzOrgeGfjkgcxRt6mrq77DYQGNZ22QaeGZL97
 nCkgAf3HSgJA9ymXh1PozeQri9BqZhc5wPZ+uoD0KsNvESvzx9sAMSmQz
 xm76WeA5EjpiFv68v879o8ARBkKIttzXBUIot7ZYqdXqrGTAuBmEhho5J
 ZgKBDdT7hu5Ab7PsgeNhEWbDDbHZKIEThtf/iR4HsrGUUyoZaGIsbFR27
 143+6nPUnlTTblP+NhO2vJc76ANzgBlT4U2nfJwXrizFK1ZPuxHiGUTiC A==;
X-CSE-ConnectionGUID: jzbcwi0TRImTaQSIi0dpcA==
X-CSE-MsgGUID: 6Sw7s6WFTyyI7GeLPDsZ6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26177407"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26177407"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:29:55 -0700
X-CSE-ConnectionGUID: /CHUMxhbT5GICyr5P7P2CQ==
X-CSE-MsgGUID: 72X8xt+UTn+jtMgej9C08g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41360328"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:29:54 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V6 4/6] tests/intel/kms: Use lib helper to check the
 pipe/output combo validity
Date: Tue, 18 Jun 2024 11:51:48 +0530
Message-ID: <20240618062150.4004768-5-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618062150.4004768-1-bhanuprakash.modem@intel.com>
References: <20240618062150.4004768-1-bhanuprakash.modem@intel.com>
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
Reviewed-by: Jeevan B <jeevan.b@intel.com>
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

