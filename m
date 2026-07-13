Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD2D5C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 08:58:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D69110E5B3;
	Mon, 13 Jul 2026 08:58:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HD0O+blh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C99EA10E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932974; x=1815468974;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NCMVoy174dLa9HRw5WxnZwh//6V9AUkD3OKgsNyiWc4=;
 b=HD0O+blh5ygPD/C4T9Pzd2M6LzWwgWe4wPVg1kY97idGAKS4Z1q78IEQ
 yqPSSmq/Xr69YKM4qOR2+Eps5KPFOBNHu+5MHaJ5PZww/EUreyJXabfRU
 yGRrF893O7vkTm8DiTR/vUlBbIkA5FHi0RcNdAWb0IZHO7vO5b8891ITU
 cu0LuKg0Yyk6gJM0dkd+4SW18fBDoZBNhOf8uFj6BvVcElAxIVXvIm2TN
 xKWfG6DL4BEbNgft4cgzzkriCtBwWAyypjmVydUapnDEuaab+7OgXmgT6
 UfDJEqNHf03YoADVbQfoBuQ58O6zyq+roMis0Mrjzt6TZ1qkxE5L0f8wx Q==;
X-CSE-ConnectionGUID: 20P8RjtWSIqw7S+HdzHuCg==
X-CSE-MsgGUID: m2dhBKCaSoq/wUwffGACWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081327"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081327"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:14 -0700
X-CSE-ConnectionGUID: SGYHgld/S0icWFRmFXXlNg==
X-CSE-MsgGUID: WBFVOufuT1uAFT5FJ7iECA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385896"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:12 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 07/16] tests/kms_pipe_crc_basic: limit #crtcs tested
 during suspend
Date: Mon, 13 Jul 2026 10:55:06 +0200
Message-ID: <20260713085515.463575-8-michal.grzelak@intel.com>
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

Limit execution of suspend tests to first and last active CRTC unless
using `extended` flag. This helps with reducing default execution time
of the test which can lower number of hitting CI timeout.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_pipe_crc_basic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 42e1415452..9ea04a0f3b 100644
--- a/tests/kms_pipe_crc_basic.c
+++ b/tests/kms_pipe_crc_basic.c
@@ -127,6 +127,16 @@ enum {
 	TEST_HANG = 1 << 3,
 };
 
+static bool suspend_constraint(unsigned flags, igt_crtc_t *crtc)
+{
+	if (!extended && (flags & TEST_SUSPEND) &&
+	    crtc->crtc_index != active_crtcs[0] &&
+	    crtc->crtc_index != active_crtcs[last_crtc_index])
+		return true;
+
+	return false;
+}
+
 static void test_read_crc(data_t *data, igt_crtc_t *crtc,
 			  igt_output_t *output, unsigned flags)
 {
@@ -428,6 +438,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				if(!crtc_output_combo_valid(&data.display, crtc, output))
 					continue;
 
+				if (suspend_constraint(tests[i].flags, crtc))
+					continue;
+
 				igt_dynamic_f("pipe-%s-%s",
 					      igt_crtc_name(crtc),
 					      output->name) {
-- 
2.45.2

