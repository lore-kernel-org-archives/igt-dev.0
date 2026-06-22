Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0C5CDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 23:00:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05A9110E2A4;
	Mon, 22 Jun 2026 23:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="beiULqwS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7CE910E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 22:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782169105; x=1813705105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Nl8UpkSiZI+ElasS6pL+QkPMHIxd7mPBHg5ldU2Z++o=;
 b=beiULqwSa9EuiLoCnI/bumTZ3QSkGZP9TDDywKjtm2jUqYNGhY/M7dXA
 hz7dNU1mElEQyuMRfyeEzKT1r7IC7vqtco1Qk7nfQznLezWZfCzffLvb5
 7hQCslfio1vQEHXsAJoy6Ce2gNEap7pQfvtXkjsF4eXkZzCFCilyU+KtE
 eQyrqVBmLsLUAmsLfguTaJhgRxxUqjOPt3xHH8PzZA01tB9iEJ9kCdj2h
 UYgOeKhpGzV5AVHgoYmx4q+5hKxSniRdKDcIdL6v7rsvo+OlydiIff1Xt
 VesGBwpkacDPhafx4q7eweXQJlYpZ3Zncv4tsG82OXDSHHgVLUbUPgRCg g==;
X-CSE-ConnectionGUID: tR2GX8iOR4+EWxu4vh1qbg==
X-CSE-MsgGUID: 1iBntUD/Q6ez7ITkqbCyyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82010420"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="82010420"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 15:58:25 -0700
X-CSE-ConnectionGUID: hkigKLdJS6qw/RC8jXDlPQ==
X-CSE-MsgGUID: CN1HYPtGQmu67NqeEh/7Tw==
X-ExtLoop1: 1
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jun 2026 15:58:24 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 2/3] tests/kms_ccs: split outer test loop into two
Date: Tue, 23 Jun 2026 00:58:10 +0200
Message-ID: <20260622225811.1703400-3-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260622225811.1703400-1-michal.grzelak@intel.com>
References: <20260622225811.1703400-1-michal.grzelak@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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

for_each_crtc_with_valid_output() iterates over every crtc with
connected output. Split it into two loops. This will be needed to handle
per crtc cases.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_ccs.c | 79 ++++++++++++++++++++++---------------------
 1 file changed, 41 insertions(+), 38 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 4d0bda6a78..ba0789f29b 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1152,47 +1152,50 @@ static void test_output(data_t *data, const int testnum)
 					      "Older than Xe2 platform needed.\n");
 			}
 
-			for_each_crtc_with_valid_output(&data->display, crtc,
-							data->output) {
-				data->crtc = crtc;
-				igt_display_reset(&data->display);
-
-				igt_output_set_crtc(data->output,
-						    crtc);
-				if (!intel_pipe_output_combo_valid(&data->display))
-					continue;
-
-				igt_dynamic_f("pipe-%s-%s",
-							    igt_crtc_name(crtc),
-							    data->output->name) {
-					int valid_tests = 0;
-
-					if (data->flags == TEST_RANDOM)
-						igt_info("Testing with seed %d\n", data->seed);
-
-					if (data->flags & TEST_ALL_PLANES) {
-						igt_display_require_output_on_crtc(crtc);
-
-						for_each_plane_on_crtc(crtc,
-								       data->plane) {
-							if (skip_plane(data, data->plane))
-								continue;
-
-							for (int j = 0; j < ARRAY_SIZE(formats); j++) {
-								data->format = formats[j];
-								valid_tests += test_ccs(data);
+			for_each_connected_output(&data->display, data->output) {
+				for_each_crtc(&data->display, crtc) {
+					if (igt_crtc_connector_valid(crtc, data->output)) {
+						data->crtc = crtc;
+						igt_display_reset(&data->display);
+
+						igt_output_set_crtc(data->output,
+								    crtc);
+						if (!intel_pipe_output_combo_valid(&data->display))
+							continue;
+
+						igt_dynamic_f("pipe-%s-%s",
+									    igt_crtc_name(crtc),
+									    data->output->name) {
+							int valid_tests = 0;
+
+							if (data->flags == TEST_RANDOM)
+								igt_info("Testing with seed %d\n", data->seed);
+
+							if (data->flags & TEST_ALL_PLANES) {
+								igt_display_require_output_on_crtc(crtc);
+
+								for_each_plane_on_crtc(crtc,
+										       data->plane) {
+									if (skip_plane(data, data->plane))
+										continue;
+
+									for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+										data->format = formats[j];
+										valid_tests += test_ccs(data);
+									}
+								}
+							} else {
+								for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+									data->format = formats[j];
+									valid_tests += test_ccs(data);
+								}
 							}
-						}
-					} else {
-						for (int j = 0; j < ARRAY_SIZE(formats); j++) {
-							data->format = formats[j];
-							valid_tests += test_ccs(data);
+							igt_require_f(valid_tests > 0,
+								      "no valid tests for %s on pipe %s\n",
+								      ccs_modifiers[i].str,
+								      igt_crtc_name(crtc));
 						}
 					}
-					igt_require_f(valid_tests > 0,
-						      "no valid tests for %s on pipe %s\n",
-						      ccs_modifiers[i].str,
-						      igt_crtc_name(crtc));
 				}
 			}
 		}
-- 
2.45.2

