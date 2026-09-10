Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70792C79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:03:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F73310E27F;
	Thu, 10 Sep 2026 19:03:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kOi2G3G4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B239A10E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066769; x=1820602769;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ez2ZZBW0iLfHjwYBTShO+GFdHonSEVZUSi8KWp9hddI=;
 b=kOi2G3G4AGiEsqmFm0Vt8qJp9UjnZvh18WY4ZVpmA+EP+EtP+TakaBy1
 k3mFyJDaUBzQdBlX1BnrG4CiBetK0rYptEJyYs/6xfEniMHZWB70EEr8p
 +BoJbAG5+iHL/1wFA1d8UWMW6K2j2tU6BGqXqWehRn7Z1bxo6VHLBF8Wz
 SRkRgH72tBh/lqu/bsSeybcWcmRKvxbxZXHdnQ4n0X+bDNS5vS6b8WViS
 dhHNF5IrXK7VhyK3xm9GBoBNIa4xPZEfZh5SPsJlCEjjnGwMaM5SPC3V2
 MMlk3wrloFZxHBuAezLDUbBeqf9/o5XgVXYLu6ZcOEToTvzU8Xwb6Fs/h g==;
X-CSE-ConnectionGUID: frCmNwfVS3GuU9+IXJSy+Q==
X-CSE-MsgGUID: kCJtqE9HTfaO2ywnuEFvJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89400093"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89400093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:59:29 -0700
X-CSE-ConnectionGUID: Kq4AXC2HT/eQJ3zp8AyT9w==
X-CSE-MsgGUID: s8gnUbNjSy6RqvsdHbBB2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295199524"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 11:59:28 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 13/17] tests/kms_sharpness_filter: limit #crtcs
 tested during suspend
Date: Thu, 10 Sep 2026 20:58:58 +0200
Message-ID: <20260910185902.2728276-14-michal.grzelak@intel.com>
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

