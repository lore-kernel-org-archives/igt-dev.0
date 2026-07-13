Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80089C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:01:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 274A910E5AB;
	Mon, 13 Jul 2026 09:01:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lIVnr3Cy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E452E10E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932976; x=1815468976;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oQjksIaHbq68s3aN+Zb2I2hWFwLq3D5I0GMF2EaJJpM=;
 b=lIVnr3CyOGrtxf30YoSFSTrZk8piohWj+oQwEXyqJuGv3IbAZAI2e5Ix
 f3h7xiRXC7nBr3nNzQdnoBOthPGDVfOStdHAfKV0GNmGN3cUxjv6NQcmn
 Q+khhw6wg+rXj6Q8WfGvTePJX7jc1BHFPP8VaQ/bEXF2/TSmZaK+I+koz
 fWr1CYaWUOlG2PN2eC6tSwzXASHaJGPRqSmSJSgbvn75eb3dFO+spizIq
 evptEad8hT+xdXAFYrrpCPRxhwVV7yLRBbR+tn4wR4SOs9kyDaR1wcsnO
 gyteqhzfSPhhnDlCz8ZArzMpfF7rIricUYwiYETgLaLZI3ojh9z+kvWbb A==;
X-CSE-ConnectionGUID: APRvZj0HT+GkbbOZl/NgmQ==
X-CSE-MsgGUID: oXJ/jG/VQJ6JXE09zLpKNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081330"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081330"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:16 -0700
X-CSE-ConnectionGUID: dPUcctJtREyH7lKXBoBRdw==
X-CSE-MsgGUID: EAxD1bL+QSGKKX5B4zi42A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385909"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:14 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 09/16] tests/kms_vblank: split outer test loop into
 two
Date: Mon, 13 Jul 2026 10:55:08 +0200
Message-ID: <20260713085515.463575-10-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260713085515.463575-1-michal.grzelak@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
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

