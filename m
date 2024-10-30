Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35AF3D74951
	for <igt-dev@archiver.kernel.org>; Wed, 30 Oct 2024 06:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8AA610E02E;
	Wed, 30 Oct 2024 06:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZ+mltO0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDAC410E02E
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Oct 2024 06:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730271551; x=1761807551;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yo/klsIg3rbdTuyxd4n5QKKe9y+uwrZ62eV+ZR1SnlE=;
 b=BZ+mltO0d4kzXUmV04NhcUBkIQK37RgqJpu5ELuPHdB3Ocf2Oz6JME1U
 RcH3UYJm0CR9DBqtPgbPENgeyBkHB1lz4Ef9bGMN/EX2m9Zc+hW7+qEft
 QZvETIykKANKEmQxmtrl2vrkSAELpXPxO5er2mQ5JjZVc7EDMiOP5oBZ8
 BjjtEcRlk6/4ESpQn2U8e/uI0CILDkyembD0sMhK6/P4llu5FUkCxy4D7
 /JrLI06uc5HHNCbe1QQSj1By55Q+m2NEJD7Du/Zgue0CizH8sdxtPR6iC
 gRzy5jlLHbrOJupYxDw14UwPIwrjb3K6VzLgb8mNi8iW244WWIGeYS3Zd w==;
X-CSE-ConnectionGUID: ndMc7053T8GJ6d3k74eP6g==
X-CSE-MsgGUID: JnlrDWlCTRKP08fTOmFMbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29722528"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29722528"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 23:58:41 -0700
X-CSE-ConnectionGUID: hnXUSlWQRfOibUHRD1P0EA==
X-CSE-MsgGUID: R1zzuZTwQ4G+vdiF+mSg2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,244,1725346800"; d="scan'208";a="82317866"
Received: from ettammin-desk.ger.corp.intel.com (HELO jhogande-mobl1..)
 ([10.245.244.200])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2024 23:58:38 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH i-g-t] lib/igt_psr: Check sink status only when wanted
Date: Wed, 30 Oct 2024 08:58:27 +0200
Message-Id: <20241030065827.2392745-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Checking sink PSR status seems to be causing problems as it is performed
by reading dcpd status registers over AUX channel.

Generally having still possibility to check also sink status is a good idea
-> disable them by default and enabled if environment variable
IGT_PSR_SINK_STATUS_CHECKS is set.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 lib/igt_psr.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/lib/igt_psr.c b/lib/igt_psr.c
index 0eb002633..83c21e6ba 100644
--- a/lib/igt_psr.c
+++ b/lib/igt_psr.c
@@ -79,13 +79,21 @@ bool early_transport_check(int debugfs_fd)
 	return strstr(buf, "enabled (Early Transport)");
 }
 
+static bool sink_status_checks(void)
+{
+	const char *env;
+
+	env = getenv("IGT_PSR_SINK_STATUS_CHECKS");
+
+	return env && atoi(env);
+}
+
 static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *output)
 {
 	char debugfs_file[128] = {0};
 	char buf[PSR_STATUS_MAX_LEN];
 	drmModeConnector *c;
 	const char *state;
-	const char *env;
 	bool active;
 	int ret;
 
@@ -116,8 +124,7 @@ static bool psr_active_check(int debugfs_fd, enum psr_mode mode, igt_output_t *o
 
 	active = strstr(buf, state);
 
-	env = getenv("IGT_PANEL_REPLAY_IGNORE_SINK_STATUS");
-	if (active && output && (!env || !atoi(env))) {
+	if (active && output && sink_status_checks()) {
 		active = psr_active_sink_check(debugfs_fd, output);
 		igt_assert_f(active, "PSR sink/source state mismatch\n");
 	}
@@ -351,6 +358,9 @@ void psr_sink_error_check(int debugfs_fd, enum psr_mode mode, igt_output_t *outp
 	char buf[PSR_STATUS_MAX_LEN];
 	int ret;
 
+	if (!sink_status_checks())
+		return;
+
 	sprintf(debugfs_file, "%s/i915_psr_sink_status", output->name);
 	ret = igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
 				      sizeof(buf));
-- 
2.34.1

