Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E66FCA5FE6
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 20:20:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E050910E048;
	Fri,  2 Oct 2026 20:20:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A9n71qqy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89DC110E693
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 20:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790972221; x=1822508221;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tsryCHkhwyMwg3Dghki+8om54cBo8WdthYKsj2cPAPQ=;
 b=A9n71qqyMTG1keViYUQr7FFxVwsDiOD19WwocZotdhAWT5IpG7VFYV6E
 YZ06IaUf8emla0FDSxRGfyg/UD1qj7BorHstSpI0kOaramOeA43Ss0htf
 IVKc/jUWtJextSnR1OaOK7sedmlpjgOMML1Tn8ARre+qcYQ7lqsblgHPi
 3HaZ8w/KuJxXOB5iniPGUq9IeXIWauBqWR05f6sJx09jVRhMcLZFTAjhA
 w7o//WJBHAffwztsiXDwgJviqvTq4yNLGasxUKybyb/Po+a+jKM48Npyz
 hW437TXvDXbVDd4/5+rIfDafQZg6SlqtqVGVjbs+VqA3l05QVXX/Nq1yQ A==;
X-CSE-ConnectionGUID: uXhp7OyuS5yH5Fjn/60Vvg==
X-CSE-MsgGUID: cuLmBO0NReiJos5YPHOzMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90877947"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90877947"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:17:01 -0700
X-CSE-ConnectionGUID: idBC7N9CRsKSsv72EjmLsw==
X-CSE-MsgGUID: d4Q57o94S3elYtJt+P9SZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="407120"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:16:59 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, jani.nikula@intel.com,
 michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 4/7] tests/intel/kms_ccs: split outer test loop into
 two
Date: Fri,  2 Oct 2026 22:15:22 +0200
Message-ID: <20261002201525.466080-5-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261002201525.466080-1-michal.grzelak@linux.intel.com>
References: <20261002201525.466080-1-michal.grzelak@linux.intel.com>
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
connected output. Split it into two loops. This is needed to handle per
output and per crtc cases.

v4->v5
- fix indentation (Thasleem)

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/intel/kms_ccs.c | 58 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 4d0bda6a78..1a922792c5 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1152,47 +1152,47 @@ static void test_output(data_t *data, const int testnum)
 					      "Older than Xe2 platform needed.\n");
 			}
 
-			for_each_crtc_with_valid_output(&data->display, crtc,
-							data->output) {
-				data->crtc = crtc;
-				igt_display_reset(&data->display);
+			for_each_connected_output(&data->display, data->output) {
+				for_each_crtc(&data->display, crtc) {
+					if (!igt_crtc_connector_valid(crtc, data->output))
+						continue;
 
-				igt_output_set_crtc(data->output,
-						    crtc);
-				if (!intel_pipe_output_combo_valid(&data->display))
-					continue;
+					data->crtc = crtc;
+					igt_display_reset(&data->display);
 
-				igt_dynamic_f("pipe-%s-%s",
-							    igt_crtc_name(crtc),
-							    data->output->name) {
-					int valid_tests = 0;
+					igt_output_set_crtc(data->output, crtc);
+					if (!intel_pipe_output_combo_valid(&data->display))
+						continue;
 
-					if (data->flags == TEST_RANDOM)
-						igt_info("Testing with seed %d\n", data->seed);
+					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
+						int valid_tests = 0;
 
-					if (data->flags & TEST_ALL_PLANES) {
-						igt_display_require_output_on_crtc(crtc);
+						if (data->flags == TEST_RANDOM)
+							igt_info("Testing with seed %d\n", data->seed);
 
-						for_each_plane_on_crtc(crtc,
-								       data->plane) {
-							if (skip_plane(data, data->plane))
-								continue;
+						if (data->flags & TEST_ALL_PLANES) {
+							igt_display_require_output_on_crtc(crtc);
 
+							for_each_plane_on_crtc(crtc, data->plane) {
+								if (skip_plane(data, data->plane))
+									continue;
+
+								for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+									data->format = formats[j];
+									valid_tests += test_ccs(data);
+								}
+							}
+						} else {
 							for (int j = 0; j < ARRAY_SIZE(formats); j++) {
 								data->format = formats[j];
 								valid_tests += test_ccs(data);
 							}
 						}
-					} else {
-						for (int j = 0; j < ARRAY_SIZE(formats); j++) {
-							data->format = formats[j];
-							valid_tests += test_ccs(data);
-						}
+						igt_require_f(valid_tests > 0,
+							      "no valid tests for %s on pipe %s\n",
+							      ccs_modifiers[i].str,
+							      igt_crtc_name(crtc));
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

