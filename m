Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5143FC5AD2B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:55:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC68810E463;
	Fri,  7 Aug 2026 22:55:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g/w/HfEf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75F710E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142888; x=1817678888;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ez2ZZBW0iLfHjwYBTShO+GFdHonSEVZUSi8KWp9hddI=;
 b=g/w/HfEfnm2zF+ONpJr8pHHUZujLv2UU7mik7W1nEkTHlx/qy2UlJCSl
 kgEw6N8j3BmWrxQGKBGBI8sixXfXK3V8m3P77Dg1OXDusRgzFca+C2ALH
 6/uqWpOzoHFJRaupEx9zOItw4uS201Cz1/4bxsrVilTZ20W/z0B8iENtG
 rDgCWrHrALJVoZ/f8wLL/c2qHrhI16OkBQ2Hc0eTqANcqiaZkcgwb4gm8
 2D3JWOt6ECSi7V4SvDws5pa+l4aySnqOHvb4HoDpgNX1Fcj97jBMq0kGz
 KeKg9qzkEDXaxsCyLhw7mWxrIWuxjNXMpLTqsghdwv1qMHyb0HNF0rR0o g==;
X-CSE-ConnectionGUID: RP6PksGkS9y1hZb7Iqcjxw==
X-CSE-MsgGUID: 5UdDwyk+Qxq0EV1LzkfdzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835827"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835827"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:48:08 -0700
X-CSE-ConnectionGUID: xg7Wz/+TTfKVNeqhoe9Cyg==
X-CSE-MsgGUID: knN3kgjiRgawKTz9iMMoBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655460"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:48:07 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 13/16] tests/kms_sharpness_filter: limit #crtcs
 tested during suspend
Date: Sat,  8 Aug 2026 00:47:43 +0200
Message-ID: <20260807224746.3554064-14-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260807224746.3554064-1-michal.grzelak@intel.com>
References: <20260807224746.3554064-1-michal.grzelak@intel.com>
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

We are iterating through each crtc while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

Limit number of tested crtcs to first and last. Test each crtc when
passing commandline parameter.

v1->v2
- remove unused vars (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index adec4a60c5..a8578cf4fc 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -233,6 +233,7 @@ static const struct subtest_entry {
 typedef struct {
 	int drm_fd;
 	bool limited;
+	bool all_crtcs;
 	bool all_outputs;
 	struct igt_fb fb[4];
 	igt_crtc_t *crtc;
@@ -635,6 +636,10 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			igt_output_set_crtc(data->output, data->crtc);
 
+			if (type == TEST_FILTER_SUSPEND && !data->all_crtcs && crtc->crtc_index != 0 &&
+						crtc->crtc_index != display->n_crtcs-1)
+					continue;
+
 			/*
 			 * FIXME: Joiner + CASF currently unsupported.
 			 * Remove this check once support is implemented.
@@ -776,6 +781,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'l':
 		data->limited = true;
 		break;
+	case 'c':
+		data->all_crtcs = true;
+		break;
 	case 'o':
 		data->all_outputs = true;
 		break;
@@ -788,11 +796,12 @@ static int opt_handler(int opt, int opt_index, void *_data)
 
 static const char help_str[] =
 	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n"
-	"  --all-outputs|-o\t\tExtend suspend tests for all outputs\n";
+	"  --all-outputs|-o\t\tExtend suspend tests for all outputs\n"
+	"  --all-crtcs|-c\t\tExtend suspend tests for all crtcs\n";
 
 data_t data = {};
 
-int igt_main_args("lo", NULL, help_str, opt_handler, &data)
+int igt_main_args("loc", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-- 
2.45.2

