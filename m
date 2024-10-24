Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088ECD2E03E
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 11:13:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93D510E900;
	Thu, 24 Oct 2024 11:13:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mjNJU+YY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B2B10E900
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 11:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729768417; x=1761304417;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q8MWxvt3xb0kWjHO/NDVvAzfuKbQctdZX0IIDP4B+gY=;
 b=mjNJU+YYRIJshfiWpn2i3t6E8G7StGCfLHkBo3R0w+Zh0ZCFo8J5iyMZ
 rZ2cehsBVwjA7je0McJqSajdUeZORNEAFVX5WvXLzb67p5vX4jjLN9Idi
 5eM6T2EvnzHr+FkGOyqGIQ73PfFnNRCnG+8oVLxQjiavHitBEWp8Ykb57
 tlmEP3NKhCSpb8YECNNcDz/rXIE20lHDrzKI9C8Eysd4mSVT55X2Z5R8v
 d4Sy6uTJmCoEjuDTdDggIlyI39Ey4LaZ297qyfjhmX2JtilTte5zHeLhm
 njhMt/sjW2wL8wDdvsm6nT7U+2OJDlIsgelySUFEdoANcnBWvrxjKMWAH g==;
X-CSE-ConnectionGUID: f2c1UOmJSly4VYEt+xuhRg==
X-CSE-MsgGUID: yXX/Jx/SQLSoH18oqpausg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="28850073"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="28850073"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2024 04:13:37 -0700
X-CSE-ConnectionGUID: rAwD+ETZRIqIQ4MRdPKEyw==
X-CSE-MsgGUID: nVobTcxZR2KpXKT2pMXl5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; d="scan'208";a="80219568"
Received: from rgsanthosh-z690i-a-ultra-plus.iind.intel.com ([10.145.162.135])
 by fmviesa007-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 04:13:35 -0700
From: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, kunal1.joshi@intel.com,
 Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Subject: [PATCH i-g-t v2] tests/kms_async_flips: Skip Async flips on joiner
 output
Date: Thu, 24 Oct 2024 16:41:05 +0530
Message-Id: <20241024111105.2261777-1-santhosh.reddy.guddati@intel.com>
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

Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
---
 tests/kms_async_flips.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 5dec71291..77f68b773 100644
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
@@ -653,6 +674,8 @@ static void run_test(data_t *data, void (*test)(data_t *))
 		data->allow_fail = false;
 		data->modifier = default_modifier(data);
 		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
+			igt_skip_on_f(is_joiner_mode(data),
+				      "Joiner mode found, skipping the test\n");
 			test_init_fbs(data);
 			test(data);
 		}
@@ -674,6 +697,8 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
 				      data->output->name,
 				      igt_fb_modifier_name(data->modifier)) {
+				      igt_skip_on_f(is_joiner_mode(data),
+						     "Joiner mode found, skipping the test\n");
 				test_init_fbs(data);
 				test(data);
 			}
-- 
2.34.1

