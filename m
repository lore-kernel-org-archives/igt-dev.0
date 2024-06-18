Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDEBC2BA1A
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:32:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005A610E58E;
	Tue, 18 Jun 2024 06:32:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J/7RVIWW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E9310E585
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692326; x=1750228326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RcPZpnveJGeMEH8FAZM5oyWPUEl2zCwm8j8hr00gni8=;
 b=J/7RVIWW6wQV/ciUlYS17JoYBdQpK72kSKWk06Qw30gSaqQ92RHeR2iI
 wEv3NSXlk9XAfiDLp9z202fHmjEEndhqy8p+Tlvc/MgCO7wi9QlOM66Cq
 gvLLCW/2AilbeURC/x+59qzxdqBypa2vaT76uD3N7MN3YglNFJIbTGeJf
 DqGqc+/UuAJWVxZxzs7JQf1sVpLYrES0sYbZY5wCve8IjHOLtjocVrvcA
 EzcGeoesNN4XuWZKl6U42OQ1ihBct3dr8Jw/mXbU9tLWD1mupfH6z6dWP
 0MSQXzunKzh2Kot7h84nm6c7bTJ1GTpF3i5a1mXNqRnNtABRmfeFYfjH/ g==;
X-CSE-ConnectionGUID: MPMAikJOTru+CY3nYxLaog==
X-CSE-MsgGUID: f8esJwYiQdOexnVES+XIZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26960448"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26960448"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:06 -0700
X-CSE-ConnectionGUID: 2Cuc1mL1S4mECSU+ErzYLg==
X-CSE-MsgGUID: R0A2Z04lQlGr2zrksZ1GFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41304960"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:04 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V6 2/6] tests/kms: Drop redundant check for pipe/output combo
 validity
Date: Tue, 18 Jun 2024 11:54:01 +0530
Message-ID: <20240618062405.4004955-3-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240618062405.4004955-1-bhanuprakash.modem@intel.com>
References: <20240618062405.4004955-1-bhanuprakash.modem@intel.com>
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

As intel_pipe_output_combo_valid() is taking care of pipe/output
combo validity, drop other redundant checks.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_content_protection.c |  3 ---
 tests/kms_properties.c         |  3 ---
 tests/kms_vrr.c                | 22 ++++++++++------------
 3 files changed, 10 insertions(+), 18 deletions(-)

diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
index 6858b22e2..e9a468eb0 100644
--- a/tests/kms_content_protection.c
+++ b/tests/kms_content_protection.c
@@ -564,9 +564,6 @@ test_content_protection(enum igt_commit_style s, int content_type)
 
 	for_each_connected_output(display, output) {
 		for_each_pipe(display, pipe) {
-			if (!igt_pipe_connector_valid(pipe, output))
-				continue;
-
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index bd414f534..6f92b218e 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -337,9 +337,6 @@ static void connector_properties(igt_display_t *display, bool atomic)
 		bool found = false;
 
 		for_each_pipe(display, pipe) {
-			if (!igt_pipe_connector_valid(pipe, output))
-				continue;
-
 			igt_display_reset(display);
 
 			igt_output_set_pipe(output, pipe);
diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
index 7f64d6806..5af220b5b 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -794,22 +794,20 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
 			continue;
 
 		for_each_pipe(&data->display, pipe) {
-			if (igt_pipe_connector_valid(pipe, output)) {
-				igt_output_set_pipe(output, pipe);
+			igt_output_set_pipe(output, pipe);
 
-				if (!intel_pipe_output_combo_valid(&data->display)) {
-					igt_output_set_pipe(output, PIPE_NONE);
-					continue;
-				}
+			if (!intel_pipe_output_combo_valid(&data->display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
+				continue;
+			}
 
-				igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe), output->name)
-					test(data, pipe, output, flags);
+			igt_dynamic_f("pipe-%s-%s",
+				      kmstest_pipe_name(pipe), output->name)
+				test(data, pipe, output, flags);
 
-				test_cleanup(data, pipe, output);
+			test_cleanup(data, pipe, output);
 
-				break;
-			}
+			break;
 		}
 	}
 }
-- 
2.43.2

