Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4447CD129C
	for <igt-dev@archiver.kernel.org>; Mon,  8 Apr 2024 06:18:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C32B112116;
	Mon,  8 Apr 2024 06:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h+az25LR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AE7611211A
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2024 06:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712557112; x=1744093112;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n7gStZ2pWvb4+6M0NrbiCFrUpWu3spb/HOS4F2SskWc=;
 b=h+az25LRNSxxMGQh6/1VsGmr5SQSLMTwscs+U+zNtWKK9vv/wCU15mh3
 wQ743HBskiBu6Iiom5kcpwkEkZ5F5x96fkoRLxWH6nAkxBQGIuxDZ6tWl
 Wk3riLzJ2eaKy/skbUmnJUPHRAW5rnO1W6twqAkdoItz4r1Z1ClV1PxQr
 voaSg3evfOKCsGQliETgKof3mX7+dxoYR/imK7bfIxvP3pwuNKdaE+ZUb
 uZRMaVwp1N3VfzS07OVGgqhxUqJFAlKjLtXDtUcwfJqy77x8WvezkKnm7
 EGUh0vHIAlco350L+3u/QZwq9JQYrYdqcmSAeZ+2GYhZPo0EiLjPdNGoJ Q==;
X-CSE-ConnectionGUID: dN03FBY1RYS+vWAUN+Hw7Q==
X-CSE-MsgGUID: D4Xchi01TZ+P+wfTgoOqfQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="7940238"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; 
   d="scan'208";a="7940238"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:16 -0700
X-CSE-ConnectionGUID: 90pnOjeESQuShsrbxsJ6EQ==
X-CSE-MsgGUID: Tm4PR4WCRsqH1pH9ve8ptA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="50976978"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2024 23:18:15 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t 2/5] tests/kms: Drop redundant check for pipe/output
 combo validity
Date: Mon,  8 Apr 2024 11:42:18 +0530
Message-ID: <20240408061221.291523-3-bhanuprakash.modem@intel.com>
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

As intel_pipe_output_combo_valid() is taking care of pipe/output
combo validity, drop other redundant checks.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
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
index 15c62b34b..2a160b990 100644
--- a/tests/kms_vrr.c
+++ b/tests/kms_vrr.c
@@ -733,22 +733,20 @@ run_vrr_test(data_t *data, test_t test, uint32_t flags)
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

