Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E49B9C25B79
	for <igt-dev@archiver.kernel.org>; Fri, 24 May 2024 10:43:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4361710EAB2;
	Fri, 24 May 2024 10:43:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSW5ccrD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F85410EAB2
 for <igt-dev@lists.freedesktop.org>; Fri, 24 May 2024 10:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716547421; x=1748083421;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ycAz9UFvFa/s+SSqhFdBPjtS85v2kwRucZFFOB8mQNk=;
 b=fSW5ccrDA2IHsig+/M+GU0duKR8gfMRY5HAsWZ86tgmH2I6IOvG+0eiK
 ZfTBQoc8qvqFDUy7u/ajKdFe4oHJdX1sVBpXohOeIabLcOYDu3ZarNiit
 okm4X7Zrxg/CetUG5QDW4ooSeg9q2PKgisgK6DcthKj3fu/Jch4SE4NXC
 QOC1nhBwlNVXqFjWrnbffAXrRTH9VbZIzlDmDYGvnxNgMZ39sSNBoKWSV
 7i4vXs3GOaEhMnYgehlSetFhf0rE/TywZQO0FGe0+7FV3CF0t8jxNtmdr
 6Tgqa+NMB3IuLyqoFhSIAGeC+US2EI6Y9A0fj+Tven+izOvfWJ6dLswt7 Q==;
X-CSE-ConnectionGUID: wNtXbMDiRm+Ec4L/5eRTIQ==
X-CSE-MsgGUID: o7QQE35sQ8uu7VX0/QJt6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="12703092"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="12703092"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 03:43:40 -0700
X-CSE-ConnectionGUID: UZglahduTxCYDUsEVLl+cA==
X-CSE-MsgGUID: aPZT03TDSYSSSloMl4VkwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; d="scan'208";a="34088693"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2024 03:43:39 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH i-g-t] tests/kms_hdr: Add more logs to skips
Date: Fri, 24 May 2024 16:06:27 +0530
Message-ID: <20240524103627.2737535-1-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
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

It would be easy to debug if we have some logs in case of
test failures/skips.

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdr.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 99b78f7ef..98241c4ac 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -264,11 +264,16 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
 
-		if (!has_max_bpc(output))
+		if (!has_max_bpc(output)) {
+			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC.\n",
+				 igt_output_name(output));
 			continue;
+		}
 
-		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
+		if (igt_get_output_max_bpc(data->fd, output->name) < 10) {
+			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
 			continue;
+		}
 
 		for_each_pipe(display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
@@ -276,6 +281,9 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 
 				if (is_intel_device(data->fd) &&
 				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						 igt_output_name(output));
+
 					test_fini(data);
 					break;
 				}
@@ -621,18 +629,29 @@ static void test_hdr(data_t *data, uint32_t flags)
 		 * set MAX_BPC property to 10bpc prior to setting
 		 * HDR metadata property. Therefore, checking.
 		 */
-		if (!has_max_bpc(output) || !has_hdr(output))
+		if (!has_max_bpc(output) || !has_hdr(output)) {
+			igt_info("%s: Doesn't support IGT_CONNECTOR_MAX_BPC or IGT_CONNECTOR_HDR_OUTPUT_METADATA.\n",
+				 igt_output_name(output));
 			continue;
+		}
 
 		/* For negative test, panel should be non-hdr. */
-		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output))
+		if ((flags & TEST_INVALID_HDR) && is_panel_hdr(data, output)) {
+			igt_info("%s: Can't run negative test on HDR panel.\n",
+				 igt_output_name(output));
 			continue;
+		}
 
-		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output))
+		if ((flags & ~TEST_INVALID_HDR) && !is_panel_hdr(data, output)) {
+			igt_info("%s: Can't run HDR tests on non-HDR panel.\n",
+				 igt_output_name(output));
 			continue;
+		}
 
-		if (igt_get_output_max_bpc(data->fd, output->name) < 10)
+		if (igt_get_output_max_bpc(data->fd, output->name) < 10) {
+			igt_info("%s: Doesn't support 10 bpc.\n", igt_output_name(output));
 			continue;
+		}
 
 		for_each_pipe(display, pipe) {
 			if (igt_pipe_connector_valid(pipe, output)) {
@@ -640,6 +659,9 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 				if (is_intel_device(data->fd) &&
 				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+					igt_info("%s: No suitable mode found to use 10 bpc.\n",
+						 igt_output_name(output));
+
 					test_fini(data);
 					break;
 				}
-- 
2.43.2

