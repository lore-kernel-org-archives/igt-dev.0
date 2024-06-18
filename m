Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E91FC27C4F
	for <igt-dev@archiver.kernel.org>; Tue, 18 Jun 2024 06:32:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0C510E58F;
	Tue, 18 Jun 2024 06:32:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NoACIWh4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AA210E58F
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Jun 2024 06:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718692332; x=1750228332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HBY1AWRv6/gQbWQfksW6Yu3YnoaKgW0EcGIw5qK08qU=;
 b=NoACIWh4ROhDtwP5HkuS9WCx+M30rdUo4x/784PAnFyQAnSQJka96dA5
 wKLACAR/2pRV6SLOkvPwFJDjmB5O/DmpZMI8B5pnDhA/Z8kYzYg4shmJj
 7e2Q0xVXbdv86wW9h4ukimKqrCFTibiR3flyW40eNTJKQLmxy0GvYgitN
 DPT/FlaMtzlGslHcPZbOd6OeM8JBsflx3Gge+zn6Bl54ez+DH0Lm75krG
 J+qgcN9TKHupgJcOKEpeyRxA0er0x9HzVFMDv2pyHjaBDH9oryL2CA34N
 76I25S1bPK628mM6NAr5/uFSqquc3EY978duQOWPsls9YPp3Yl9oi0YB8 Q==;
X-CSE-ConnectionGUID: mSsTysdDSsimbPrfgSonwg==
X-CSE-MsgGUID: IbZPn224TwSqJz+KQWA4vQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26960477"
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="26960477"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:12 -0700
X-CSE-ConnectionGUID: mVnZQdkMRoyucH8pyD1l0w==
X-CSE-MsgGUID: fC4lcIDKTdO2WucX6hR+Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,247,1712646000"; d="scan'208";a="41304997"
Received: from bhanu-nuclab.iind.intel.com ([10.145.169.172])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2024 23:32:10 -0700
From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>,
 Jeevan B <jeevan.b@intel.com>
Subject: [i-g-t V6 6/6] tests/kms_hdr: Use lib helper to check the pipe/output
 combo validity
Date: Tue, 18 Jun 2024 11:54:05 +0530
Message-ID: <20240618062405.4004955-7-bhanuprakash.modem@intel.com>
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

Cc: Jeevan B <jeevan.b@intel.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 tests/kms_hdr.c | 90 ++++++++++++++++++++++++++++---------------------
 1 file changed, 51 insertions(+), 39 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index 99b78f7ef..475463c21 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -261,6 +261,8 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 
+	igt_display_reset(display);
+
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
 
@@ -271,26 +273,30 @@ static void test_bpc_switch(data_t *data, uint32_t flags)
 			continue;
 
 		for_each_pipe(display, pipe) {
-			if (igt_pipe_connector_valid(pipe, output)) {
-				prepare_test(data, output, pipe);
-
-				if (is_intel_device(data->fd) &&
-				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
-					test_fini(data);
-					break;
-				}
-
-				data->mode = igt_output_get_mode(output);
-				data->w = data->mode->hdisplay;
-				data->h = data->mode->vdisplay;
+			igt_output_set_pipe(output, pipe);
+			if (intel_pipe_output_combo_valid(display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
+				continue;
+			}
 
-				igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe), output->name)
-					test_bpc_switch_on_output(data, pipe, output, flags);
+			prepare_test(data, output, pipe);
 
-				/* One pipe is enough */
+			if (is_intel_device(data->fd) &&
+			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+				test_fini(data);
 				break;
 			}
+
+			data->mode = igt_output_get_mode(output);
+			data->w = data->mode->hdisplay;
+			data->h = data->mode->vdisplay;
+
+			igt_dynamic_f("pipe-%s-%s",
+				      kmstest_pipe_name(pipe), output->name)
+				test_bpc_switch_on_output(data, pipe, output, flags);
+
+			/* One pipe is enough */
+			break;
 		}
 	}
 }
@@ -614,6 +620,8 @@ static void test_hdr(data_t *data, uint32_t flags)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 
+	igt_display_reset(display);
+
 	for_each_connected_output(display, output) {
 		enum pipe pipe;
 
@@ -635,32 +643,36 @@ static void test_hdr(data_t *data, uint32_t flags)
 			continue;
 
 		for_each_pipe(display, pipe) {
-			if (igt_pipe_connector_valid(pipe, output)) {
-				prepare_test(data, output, pipe);
+			igt_output_set_pipe(output, pipe);
+			if (!intel_pipe_output_combo_valid(display)) {
+				igt_output_set_pipe(output, PIPE_NONE);
+				continue;
+			}
 
-				if (is_intel_device(data->fd) &&
-				    !igt_max_bpc_constraint(display, pipe, output, 10)) {
-					test_fini(data);
-					break;
-				}
-
-				data->mode = igt_output_get_mode(output);
-				data->w = data->mode->hdisplay;
-				data->h = data->mode->vdisplay;
-
-				igt_dynamic_f("pipe-%s-%s",
-					      kmstest_pipe_name(pipe), output->name) {
-					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND | TEST_INVALID_HDR))
-						test_static_toggle(data, pipe, output, flags);
-					if (flags & TEST_SWAP)
-						test_static_swap(data, pipe, output);
-					if (flags & TEST_INVALID_METADATA_SIZES)
-						test_invalid_metadata_sizes(data, output);
-				}
-
-				/* One pipe is enough */
+			prepare_test(data, output, pipe);
+
+			if (is_intel_device(data->fd) &&
+			    !igt_max_bpc_constraint(display, pipe, output, 10)) {
+				test_fini(data);
 				break;
 			}
+
+			data->mode = igt_output_get_mode(output);
+			data->w = data->mode->hdisplay;
+			data->h = data->mode->vdisplay;
+
+			igt_dynamic_f("pipe-%s-%s",
+				      kmstest_pipe_name(pipe), output->name) {
+				if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND | TEST_INVALID_HDR))
+					test_static_toggle(data, pipe, output, flags);
+				if (flags & TEST_SWAP)
+					test_static_swap(data, pipe, output);
+				if (flags & TEST_INVALID_METADATA_SIZES)
+					test_invalid_metadata_sizes(data, output);
+			}
+
+			/* One pipe is enough */
+			break;
 		}
 	}
 }
-- 
2.43.2

