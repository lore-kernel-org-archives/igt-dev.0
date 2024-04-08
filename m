Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 417B8CD1296
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 06:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C343112114;
	Mon,  8 Apr 2024 06:18:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnZA/GJX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 492A0112123
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 06:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712557113; x=1744093113;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4woyvGP/1lyCN8KrmWfntW5W9rx9rExmqUn96HT28Fg=;
 b=DnZA/GJXysGP1aSoK7rfbdpA5WRDWQ6LtF264G+Gz33RgmkN1eqB1jVw
 83f2O8sY8RNrujjm9XN9byWnhYIu7X2mOaEQBB7LyOe16xl0d+TgIszgc
 mmeZVu2DUxdXV4VwmIReexemGPKtvHhdBciAztuAv0khiZ5vm92d2xQHY
 JPp6I5W9KaLoCkBcp1fJ+Hr61Cnlmw9td1BYlE5kjKE95rcRiMroFe0RA
 C4ev+xSMue9IyU62wv67tAwYk8GYgVtJLpK0q77CM57TrG4axnxswGggX
 2UQMvHAYlzHygfe0+xEaTR2Psdw76rXEuzeCYPtM2QXCbUudwhT5j+OQg w==;
X-CSE-ConnectionGUID: /uP3enxPRZmCDo18XTkTxg==
X-CSE-MsgGUID: 3MH42D3TSBChnCYkJmVkAQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7940245"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7940245"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:18 -0700
X-CSE-ConnectionGUID: XBRJfF/TTs6GywMgtpHKTA==
X-CSE-MsgGUID: HmrbzgBiTna/2s9nJM8Kgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="50976981"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:17 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 3/5] tests/chamelium: Use lib helper to check the
 pipe/output combo validity
Date: Mon,  8 Apr 2024 11:42:19 +0530
Message-ID: <20240408061221.291523-4-bhanuprakash.modem@intel.com>
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
 tests/chamelium/kms_chamelium_helper.c | 12 +++++++++---
 tests/chamelium/kms_chamelium_hpd.c    |  5 ++---
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/tests/chamelium/kms_chamelium_helper.c b/tests/chamelium/kms_chamelium_helper.c
index 197d29be9..26c5f87f1 100644
--- a/tests/chamelium/kms_chamelium_helper.c
+++ b/tests/chamelium/kms_chamelium_helper.c
@@ -207,9 +207,15 @@ enum pipe chamelium_get_pipe_for_output(igt_display_t *display,
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
+		igt_output_set_pipe(output, PIPE_NONE);
+		return pipe;
 	}
 
 	igt_assert_f(false, "No pipe found for output %s\n",
@@ -344,4 +350,4 @@ bool chamelium_check_analog_bridge(chamelium_data_t *data,
 		return true;
 
 	return false;
-}
\ No newline at end of file
+}
diff --git a/tests/chamelium/kms_chamelium_hpd.c b/tests/chamelium/kms_chamelium_hpd.c
index 858c595cb..52e758087 100644
--- a/tests/chamelium/kms_chamelium_hpd.c
+++ b/tests/chamelium/kms_chamelium_hpd.c
@@ -345,10 +345,9 @@ static void test_hotplug_for_each_pipe(chamelium_data_t *data,
 		output = chamelium_get_output_for_port(data, port);
 
 		/* If pipe is valid for output then set it */
-		if (igt_pipe_connector_valid(pipe, output)) {
-			igt_output_set_pipe(output, pipe);
+		igt_output_set_pipe(output, pipe);
+		if (intel_pipe_output_combo_valid(&data->display))
 			igt_display_commit2(&data->display, COMMIT_ATOMIC);
-		}
 
 		chamelium_unplug(data->chamelium, port);
 		chamelium_wait_for_connector_after_hotplug(
-- 
2.43.2

