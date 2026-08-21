Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78C8EC5DF8E
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 12:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D29BC10E296;
	Fri, 21 Aug 2026 12:54:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iQ0tOoy3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2395D10E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316531; x=1818852531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+rv8dmRvYQXBuUnDRMazfKjt+Hi6ppo8AzUODxU01NI=;
 b=iQ0tOoy3c1XKEXu6qrT2qPPd2n36UYenxjeOjfo0xxvbMFdN2zZ5C65d
 gFCGbZD7ExtkpOCD540hpm9yq7zDNRljOZgDzcyMuNKm527o3qhbpfYIe
 Jhr0L2We6nlbL6+67SNvEC2PGaLwkmFeo/ywe3ORynHB/fmcKyHBHPBwq
 v9YqbCLqbjD3s74YEYq7EFSLjLnUBJGy97ENbiRW6zon3o9BWSz3mY9ax
 zAC7jGT39s+dAyvkrmBoP2d01fXjVssxV2isoPfen9cCbN8+jVojjQWfL
 3kvXNv23WqoEc957t6+7ny0+jTwO6HX1j+2doCq8gT8RA4mysZRV6Bmaa A==;
X-CSE-ConnectionGUID: 7kuuv670QMW7PSd8kpu8rQ==
X-CSE-MsgGUID: u78exPEVQ0OooldhSHvd4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632925"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632925"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:48:51 -0700
X-CSE-ConnectionGUID: FSw+LxIcQCi1uQ3seYNd4Q==
X-CSE-MsgGUID: YEFFH83bQ3ygg5ddePc4lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188371"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:48:49 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 09/17] tests/kms_vblank: split outer test loop into
 two
Date: Fri, 21 Aug 2026 14:48:26 +0200
Message-ID: <20260821124834.1974029-10-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821124834.1974029-1-michal.grzelak@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
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
connected output. Split it into two loops. This is needed to handle
cases per output.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_vblank.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/tests/kms_vblank.c b/tests/kms_vblank.c
index 7fb7de0a70..47b733af15 100644
--- a/tests/kms_vblank.c
+++ b/tests/kms_vblank.c
@@ -515,25 +515,28 @@ static void run_subtests(data_t *data)
 
 			igt_describe("Check if test run while hanging by introducing NOHANG flag.");
 			igt_subtest_with_dynamic_f("%s-%s", f->name, m->name) {
-				for_each_crtc_with_valid_output(&data->display,
-								crtc,
-								data->output) {
-					data->crtc = crtc;
-					if (!crtc_output_combo_valid(&data->display, crtc, data->output))
-						continue;
-
-					if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
-					    crtc->crtc_index != active_crtcs[last_crtc_index]) {
-						igt_info("Skipping pipe %s\n",
-							 igt_crtc_name(crtc));
-						continue;
-					}
-
-					igt_dynamic_f("pipe-%s-%s",
-						      igt_crtc_name(crtc),
-						      data->output->name) {
-						data->flags = m->flags | NOHANG;
-						run_test(data, f->func);
+				for_each_connected_output(&data->display, data->output) {
+					for_each_crtc(&data->display, crtc) {
+						if(!igt_crtc_connector_valid(crtc, data->output))
+							continue;
+
+						data->crtc = crtc;
+						if (!crtc_output_combo_valid(&data->display, crtc, data->output))
+							continue;
+
+						if (!all_pipes && crtc->crtc_index != active_crtcs[0] &&
+						    crtc->crtc_index != active_crtcs[last_crtc_index]) {
+							igt_info("Skipping pipe %s\n",
+								 igt_crtc_name(crtc));
+							continue;
+						}
+
+						igt_dynamic_f("pipe-%s-%s",
+							      igt_crtc_name(crtc),
+							      data->output->name) {
+							data->flags = m->flags | NOHANG;
+							run_test(data, f->func);
+						}
 					}
 				}
 			}
-- 
2.45.2

