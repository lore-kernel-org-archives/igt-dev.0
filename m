Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CE6D41C04
	for <igt-dev@archiver.kernel.org>; Wed, 13 Nov 2024 12:24:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B10FF10E20D;
	Wed, 13 Nov 2024 12:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iO6UDve7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF4B10E20D
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Nov 2024 12:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731500657; x=1763036657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EaaD6IPmQ3iY68LQu97Y0uR5Pm6dStAPZx8yEudA8Q4=;
 b=iO6UDve7DuW5rKkH6wMTaGACA+g4TmKQhbug90a3b5Ymw4GAGKM5D7XC
 m6QRTawvrLGFRcpWGrHMrHupNONmed9y8gWMfkoF3QPCZhfw/K3XRw/YK
 Z/WKIm9Oi8krYqxa0o5ZiB7YIETruD74u2kzmIem48WZnnywDnUSrgOpc
 V13nZs5g/XDlGCWozh3jYiyjn8QGpXge2vNjsQDUq0bJHVfRn9U+TfzCQ
 8hk8o/5AKeKv/f+z4NqMnxkVPWMH0muyhxJXQqKIbM3pPm7w4k8NaxV0U
 MuogC4K77xtzlaajz81ZfcV8MUKJIdoqPDaMmxvNpJ8j8ydC5C4vdL0Xa w==;
X-CSE-ConnectionGUID: V9kwRkeTQiGuUmyT18ZqMw==
X-CSE-MsgGUID: 8Ht4Hu5gSxyJwSrtgqSRRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42016810"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="42016810"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2024 04:24:17 -0800
X-CSE-ConnectionGUID: F1p1SbH9R4S/D6tw616Z2Q==
X-CSE-MsgGUID: pwjqpeBhRIux6LmPKOBccQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; d="scan'208";a="88023987"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by orviesa006-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 04:24:16 -0800
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v3 1/1] tests/kms_async_flips: Skip Async flips on
 joiner output
Date: Wed, 13 Nov 2024 17:50:26 +0530
Message-Id: <20241113122026.2788989-1-santhosh.reddy.guddati@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023031620.3632362-1-santhosh.reddy.guddati@intel.com>
References: <20241023031620.3632362-1-santhosh.reddy.guddati@intel.com>
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

Async flips are disallowed with joiner, but the test commit still
goes through and causes failures. Update the tests to skip on
joiner outputs.

V2: Skip tests only on joiner outputs (Kunal).
V3: Add a todo to remove workaround when async flips with joiner is
    supported in kernel.

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/kms_async_flips.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5dec71291..4a9cf2ae4 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -638,6 +638,27 @@ static void test_crc(data_t *data)
 	igt_assert_lt(data->frame_count * 2, data->flip_count);
 }
 
+static bool is_joiner_mode(data_t *data)
+{
+	bool is_joiner = false;
+	bool is_ultra_joiner = false;
+	int max_dotclock;
+	drmModeModeInfo mode;
+
+	max_dotclock = igt_get_max_dotclock(data->drm_fd);
+	is_joiner = bigjoiner_mode_found(data->drm_fd,
+					 data->output->config.connector,
+					 max_dotclock, &mode);
+	is_ultra_joiner = ultrajoiner_mode_found(data->drm_fd,
+						 data->output->config.connector,
+						 max_dotclock, &mode);
+
+	if (is_joiner || is_ultra_joiner)
+		return true;
+
+	return false;
+}
+
 static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_display_t *display = &data->display;
@@ -653,6 +674,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		data->allow_fail = false;
 		data->modifier = default_modifier(data);
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
+			/* TODO: Remove this workaround when Async+joiner is supported */
+			igt_skip_on_f(is_joiner_mode(data),
+				      "Joiner mode found, skipping the test\n");
 			test_init_fbs(data);
 			test(data);
 		}
@@ -674,6 +698,9 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
 				      igt_fb_modifier_name(data->modifier)) {
+					/* TODO: Remove workaround when Async+joiner is supported */
+				      igt_skip_on_f(is_joiner_mode(data),
+						     "Joiner mode found, skipping the test\n");
 				test_init_fbs(data);
 				test(data);
 			}
-- 
2.34.1

