Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30AEEC79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:10:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C65FF10E248;
	Thu, 10 Sep 2026 19:10:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bNyadyrY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA3E10E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066771; x=1820602771;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8YycD+UD5u9zks1jj1ITMjXgte9swArvTnuJdarYcGs=;
 b=bNyadyrYGSx2nWavYA+Z+AJwQ6BVIMf14ULAtxYwaEsUWQy/7YM3+66/
 D9Q0iI1ord1xuIFrsAzfva8RNSPzuTbjW2NsMkLbaHGN4k8Wgx/v7wynr
 zFAlcSmwGa6fOInynaZZkF6KNFKsb+p2jbp7sko15uYZrCzhrGJzVlgB9
 l8cZqy2uGF0TumYjscByPhEuPrlC8WgJKEx8cW+upGIQUxOeEHaT0nyb3
 dPv9LOz3dxMu0MHE5rBN+21kZ/siV4VDGlahJB75/jqXPWnuOikYjzBnL
 pr5NoAm7yi1M8SaThG1MshF9qqko5nudBIlA36B4oX94OvqTxlor8uD/F w==;
X-CSE-ConnectionGUID: 4t1QXuuQTs6a/0PQHwc5Fg==
X-CSE-MsgGUID: jQwJx5jYTq2f2rW8Ha/P2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89400096"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89400096"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:59:31 -0700
X-CSE-ConnectionGUID: PjSyVT43QuKQOrxtpbEggQ==
X-CSE-MsgGUID: hepH3mgHROiiSqu100NRUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295199533"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 11:59:29 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 14/17] tests/intel/kms_ccs: split outer test loop
 into two
Date: Thu, 10 Sep 2026 20:58:59 +0200
Message-ID: <20260910185902.2728276-15-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910185902.2728276-1-michal.grzelak@intel.com>
References: <20260910185902.2728276-1-michal.grzelak@intel.com>
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

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_ccs.c | 74 +++++++++++++++++++++++--------------------
 1 file changed, 39 insertions(+), 35 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 4d0bda6a78..9ac0ac8e2b 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1152,47 +1152,51 @@ static void test_output(data_t *data, const int testnum)
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
+			for_each_connected_output(&data->display, data->output) {
+				for_each_crtc(&data->display, crtc) {
+					if (!igt_crtc_connector_valid(crtc, data->output))
+						continue;
+
+					data->crtc = crtc;
+					igt_display_reset(&data->display);
+
+					igt_output_set_crtc(data->output,
+							    crtc);
+					if (!intel_pipe_output_combo_valid(&data->display))
+						continue;
+
+					igt_dynamic_f("pipe-%s-%s",
+								    igt_crtc_name(crtc),
+								    data->output->name) {
+						int valid_tests = 0;
+
+						if (data->flags == TEST_RANDOM)
+							igt_info("Testing with seed %d\n", data->seed);
+
+						if (data->flags & TEST_ALL_PLANES) {
+							igt_display_require_output_on_crtc(crtc);
+
+							for_each_plane_on_crtc(crtc,
+									       data->plane) {
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

