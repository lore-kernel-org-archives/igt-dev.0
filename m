Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DA95C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA7EC10E2D7;
	Thu, 10 Sep 2026 19:07:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OSdbWqc8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1585310E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066764; x=1820602764;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+rv8dmRvYQXBuUnDRMazfKjt+Hi6ppo8AzUODxU01NI=;
 b=OSdbWqc8ZCVgr+upzZD+cwSli1lWqC24cx09CP61+z+f1jls7qz/qPk7
 xhvjE0wKKhTqmuRvHtVtBoFdh/RWzUGW/WT2FX3dW5etIqsGMa43JVUFx
 W9uCeKNALWAQP2BoB9VRVQmz7MI1xlyX96+aGx4i/OWv54dZgLpWCePAb
 Ns3i0YAk3VrpZDiFwmWeLCllqRYBn/rYseJYsZDi7VCEsFyXS6Okb5ZDe
 BRT1bDAApT+UFDlOylNfppWXV7C1U6LI9CZYbRAvgFHhiUCXw+VHqzV7t
 /JrMJBs6bf4NUkRCEe2n7UpGBfC/7yK43IYZhcl9Ut9HaZ+SW5/Y3yxl4 A==;
X-CSE-ConnectionGUID: KnPO4L8qTbuyIXw5oGFU7A==
X-CSE-MsgGUID: Sfx6UKvnTRGniEIo1z3/qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89400088"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89400088"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:59:24 -0700
X-CSE-ConnectionGUID: QuQNyEeiThOAYcOZ7wYeAQ==
X-CSE-MsgGUID: /eW3zQsAS3KFs7AGPjGpEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295199506"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 11:59:22 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 09/17] tests/kms_vblank: split outer test loop into
 two
Date: Thu, 10 Sep 2026 20:58:54 +0200
Message-ID: <20260910185902.2728276-10-michal.grzelak@intel.com>
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

