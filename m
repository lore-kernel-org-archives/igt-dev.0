Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 939C0C3064D
	for <igt-dev@archiver.kernel.org>; Tue, 25 Jun 2024 04:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 199FA10E1DD;
	Tue, 25 Jun 2024 04:39:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D2Cgj1UR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAE5610E1DD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2024 04:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719290388; x=1750826388;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bEtV+Eh3L3joRzvhdjIZIHGFWjv9dwdlXtDTxa1wSRs=;
 b=D2Cgj1UR77GMpZ48wPPPzGExR9RgtnG9T9chXHTZX610JUsa0TOD8zvx
 SVtVEZYloJaXnf3KkmEW6wHY5db2V9ib0mzIZhA5EBkPGpom8FO8TTPwB
 DOHXo0OKBCD3dm1fBplbCOcz+1hy4FYhdMLHJvl9tYVTgWyxvcBsT31mN
 TWGEvfgJv5rjpnT44CQu9kr29ggRn2rDyYw4xuQfKfWVnyijus5VKMwSU
 MnG1f9Jx6wQPclxTJUS5WMnlbLiy+VKEL6cfaPi268PTxCj5rolpLkQ5G
 9trPBJVu9ZvT0OZ/93WZbwnIkOmCr1RSHulICEdwdY0j/qHWl5YWhBhv2 w==;
X-CSE-ConnectionGUID: BdS+ubaSSxSm+gt+I/OeXw==
X-CSE-MsgGUID: C2AgzMUMQsCQkSxXiE8W9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="41707159"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="41707159"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:39:48 -0700
X-CSE-ConnectionGUID: rkRL8Sg2SoKalxlNEViVCw==
X-CSE-MsgGUID: +y3gX0p4RcSik4uPgA7QkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="48688502"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 21:39:46 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [i-g-t 2/2] tests/kms_hdr: Add more logs to skips
Date: Tue, 25 Jun 2024 10:01:36 +0530
Message-ID: <20240625043136.257253-2-bhanuprakash.modem@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240625043136.257253-1-bhanuprakash.modem@intel.com>
References: <20240625043136.257253-1-bhanuprakash.modem@intel.com>
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

V2: - Rebase

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_hdr.c | 34 ++++++++++++++++++++++++++++------
 1 file changed, 28 insertions(+), 6 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 36ebb4f4e..f123c6b36 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -266,11 +266,16 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
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
 			igt_output_set_pipe(output, pipe);
@@ -283,6 +288,9 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 
 			if (is_intel_device(data->fd) &&
 			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+				igt_info("%s: No suitable mode found to use 10 bpc.\n",
+					 igt_output_name(output));
+
 				test_fini(data);
 				break;
 			}
@@ -629,18 +637,29 @@ static void test_hdr(data_t *data, uint32_t flags)
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
 			igt_output_set_pipe(output, pipe);
@@ -653,6 +672,9 @@ static void test_hdr(data_t *data, uint32_t flags)
 
 			if (is_intel_device(data->fd) &&
 			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+				igt_info("%s: No suitable mode found to use 10 bpc.\n",
+					 igt_output_name(output));
+
 				test_fini(data);
 				break;
 			}
-- 
2.43.2

