Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EB31C2BBCA
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:32:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D5210E58B;
	Tue, 18 Jun 2024 06:32:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fEXcQAbl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5392E10E583
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692331; x=1750228331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IX67FKnGos3Xz/nlBKZstIrB/LqsMTyKipDrfTbYEPU=;
 b=fEXcQAblnX2JSM7BZfao/TYH2MyQPf5R9SU7pagfGB49ZAGek6ULN7vz
 6Tn1I3Q1eX+LpsX1YGG8mZGH3uHaSG5lnkxhlUDjcoMmS0hVDXyXcDAR0
 ZmwTipTxlrAK0KiIppWZ/zJvfnXfvE/5XzNS/LY7ApQ+lZjThpu6NQnDa
 oSzeSzJxAX8m2Ojsq6PogzfZTtfgEsah3c00U1Iyivecc2ptDyvfKVU9H
 kgd38R4OS3tXgfDSMhaejrnNbxtf9Yi9iMdRrLZFL3qw3hxRcUUl8jtgv
 iRqM03cIq1WKt0ZMAxSa4GxZp/OeCtfF6F7zv1KPpyt88EA3Wk+e1k/1H Q==;
X-CSE-ConnectionGUID: s3QyHLVYQyy5SRgxfdtoOA==
X-CSE-MsgGUID: 9rlas5tPTP+pgwMg7BoCng==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26960469"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26960469"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:11 -0700
X-CSE-ConnectionGUID: JIYl2XUeQDm6hUccs/ivTQ==
X-CSE-MsgGUID: 2X0JoMW/RuKvj3DFwzcuWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41304988"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:09 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V6 5/6] tests/kms_dither: Use lib helper to check the
 pipe/output combo validity
Date: Tue, 18 Jun 2024 11:54:04 +0530
Message-ID: <20240618062405.4004955-6-bhanuprakash.modem@intel.com>
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

Use IGT lib helper intel_pipe_output_combo_valid() to make sure the
selected pipe/output/mode combo is valid.

V2: - Split the patch into multiple.

Cc: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_dither.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/tests/kms_dither.c b/tests/kms_dither.c
index af7b7f05c..21b1210b4 100644
--- a/tests/kms_dither.c
+++ b/tests/kms_dither.c
@@ -76,13 +76,10 @@ typedef struct {
 /* Prepare test data. */
 static void prepare_test(data_t *data, igt_output_t *output, enum pipe p)
 {
-	igt_display_t *display = &data->display;
 	igt_pipe_t *pipe = &data->display.pipes[p];
 
 	igt_assert(pipe);
 
-	igt_display_reset(display);
-
 	data->primary =
 		igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
 
@@ -205,6 +202,8 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 	igt_output_t *output;
 	igt_display_t *display = &data->display;
 
+	igt_display_reset(display);
+
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
 
@@ -215,15 +214,20 @@ run_dither_test(data_t *data, int fb_bpc, int fb_format, int output_bpc)
 			continue;
 
 		for_each_pipe(display, pipe) {
-			if (igt_pipe_connector_valid(pipe, output)) {
-				igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe), output->name)
-					test_dithering(data, pipe, output, fb_bpc,
-							fb_format, output_bpc);
+			igt_output_set_pipe(output, pipe);
 
-				/* One pipe is enough */
-				break;
+			if (!intel_pipe_output_combo_valid(display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
+				continue;
 			}
+
+			igt_dynamic_f("pipe-%s-%s",
+					      kmstest_pipe_name(pipe), output->name)
+				test_dithering(data, pipe, output, fb_bpc,
+							   fb_format, output_bpc);
+
+			/* One pipe is enough */
+			break;
 		}
 	}
 }
-- 
2.43.2

