Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FC4C88E41
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 20:19:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAC9C10E30B;
	Thu, 10 Sep 2026 20:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JwzRuqVY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DDCB10E2F9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 20:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789071276; x=1820607276;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uUTJ+G4VqBNVDHl3Av3MJ04Nx5tYihPAEBCemupXA2Q=;
 b=JwzRuqVY1UL5IZzVWN5wkEZr1CWOB48KjwM9PSpQ5x2ice0OR9PUxwty
 BEAP6Heewo+K3LPSe6SPxJKiPUfXGaZGmY4w5hO5tSM/UWunOvwJLtTSO
 0anvcQP3FuuUc9ZVE4M5CsXgzGb9vFO4xG8WdJOEaZQMHdYjEfsgVmkDo
 xNCbAoTTjnefyvAeVKUsdki19vs6DVPWIK//OaDR2gzp9bRszq2hJUBfu
 WHAPQ4w7li/M2maNbX5BKBEJiWzhoPGl3/rT+Hc+QJFbVzPhYfSdYK8Xi
 UB9KUDmhNYvsU+qQrP8m+7/ZOHkIDjPt3F5+5Bq+IUUtSoLFTBFGjUFBn Q==;
X-CSE-ConnectionGUID: u4dSx/vQRNmrKkj2+4e/2A==
X-CSE-MsgGUID: e88GPWcnTQqlFByWiFsqlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89657262"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89657262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 13:14:35 -0700
X-CSE-ConnectionGUID: CDt1645sTq2fspi6fVJmbw==
X-CSE-MsgGUID: 89zSCLKkT8GSonzKeyuOvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309978203"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 13:14:35 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 07/17] tests/kms_pipe_crc_basic: limit #crtcs tested
 during suspend
Date: Thu, 10 Sep 2026 22:14:03 +0200
Message-ID: <20260910201413.2730574-8-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260910201413.2730574-1-michal.grzelak@intel.com>
References: <20260910201413.2730574-1-michal.grzelak@intel.com>
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

v1->v2
- move constraint before crtc_output_combo_valid() (Mohammed)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/kms_pipe_crc_basic.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/kms_pipe_crc_basic.c b/tests/kms_pipe_crc_basic.c
index 42e1415452..f1f89f11f8 100644
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
@@ -425,6 +435,9 @@ int igt_main_args("e", NULL, help_str, opt_handler, NULL)
 				if (simulation_constraint(crtc))
 					continue;
 
+				if (suspend_constraint(tests[i].flags, crtc))
+					continue;
+
 				if(!crtc_output_combo_valid(&data.display, crtc, output))
 					continue;
 
-- 
2.45.2

