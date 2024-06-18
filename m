Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B81B6C27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:29:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B7C010E582;
	Tue, 18 Jun 2024 06:29:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AXdRC+Et";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 273E310E582
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692193; x=1750228193;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=SDazcbG+ia5oXKIDMrGOB5SrDE5AWS/hQT2p0xo5Wqc=;
 b=AXdRC+EtIAhOeUR3W3dpQ/00z7Do1UFEhHU2cMRt08YEzQ1+D7kRTVXY
 DhOcGpwhGgKdN3Zl4fIS1x0HCrK3euO6z0zfEWW66LckJc39yIr/eLklp
 2Dr4P3w8tmIFegbaUOVkaVBi6RVl75Ci3judTeyqX+6sbntLfhmNiHcnd
 tOQfx49brLwyH099Bff1t5eL240GYcbxHm3MbrAyl0U79uotxy7JNVrFn
 QlB7YRcLfuIVcYBjO5jL07apqYOzOLqF7eVlHABBOqUe8xhtZ0I1vFyff
 DQR0oPvgxZCsTIwSSHVsA5+zLDo5WmPLVQ0bcaqFy+uNgl+s/HG1ZPJtu w==;
X-CSE-ConnectionGUID: np9PcimmTzip/gTXnDNGKw==
X-CSE-MsgGUID: 2dftZgE5StG436NGpmgG1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26177404"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26177404"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:29:53 -0700
X-CSE-ConnectionGUID: aWSeBXwpRcGBvGXCk5WqHA==
X-CSE-MsgGUID: X+qZNIycQv2BNgBf50w4qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41360322"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:29:53 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V6 3/6] tests/chamelium: Use lib helper to check the
 pipe/output combo validity
Date: Tue, 18 Jun 2024 11:51:47 +0530
Message-ID: <20240618062150.4004768-4-bhanuprakash.modem@intel.com>
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

