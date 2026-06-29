Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91854C43602
	for <igt-dev@archiver.kernel.org>; Mon, 29 Jun 2026 09:09:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4101410E799;
	Mon, 29 Jun 2026 09:09:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WG2m0ezR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56C4510E799
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Jun 2026 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782724068; x=1814260068;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2WkgTtFbRoMyWB0G1G5EvcV7HV3zozsf59D6JNzP64k=;
 b=WG2m0ezRi19jZzeMVWiqO3+yenw1V3NCz/RTr6b17UBZtLLa29RwBlSo
 yTPot/uPeatlBChOCItPHF0B8fIXe8rpQecZeR8uzh6l+izPZpYHsOmwv
 BR0+bRbIkb8feR++EYAbx+9xaiX9ZdlcopLYkWnwBYk6pfuAh1mdb5kcm
 h7rw/C5e+x1R95vsbHSDehkrCwi1lv7ueDCki2kUh3WX5oQjmU6dknOOQ
 idk7nWbAM3EYi9yArNHLGP59mKTJH08wr/BEWaad+v9VEsl9bUMmvgbir
 UlmTQIaLK2du2uhVN8MDgwyrfkbZd45qOUngEO5IYIw+Vw+1zH9+tkRCR g==;
X-CSE-ConnectionGUID: g1/MdRF2SE22SvhrqXNaFQ==
X-CSE-MsgGUID: /BNkRnJqS1+zoB0g+++UGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="94893485"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="94893485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2026 02:07:48 -0700
X-CSE-ConnectionGUID: rBpcYKt8QmWW0vhaeZIc0Q==
X-CSE-MsgGUID: 5LR6coshSuWCKM7/EQ+wrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; d="scan'208";a="247449771"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa006.fm.intel.com with ESMTP; 29 Jun 2026 02:07:46 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: juhapekka.heikkila@gmail.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/sharpness_filter: limit #crtcs tested
 during suspend
Date: Mon, 29 Jun 2026 11:07:40 +0200
Message-ID: <20260629090740.2706320-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260629090740.2706320-1-michal.grzelak@intel.com>
References: <20260629090740.2706320-1-michal.grzelak@intel.com>
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
in extended execution time, in turn leading to hitting CI enforced
timeout. Limit number of tested crtcs to first and last. Test each
crtc when passing dedicated commandline parameter.

Cc: Juha-Pekka Heikkilä <juhapekka.heikkila@gmail.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index fc7074b1c7..ae700cb5b3 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -231,6 +231,7 @@ static const struct subtest_entry {
 typedef struct {
 	int drm_fd;
 	bool limited;
+	bool all_crtcs;
 	bool all_outps;
 	struct igt_fb fb[4];
 	igt_crtc_t *crtc;
@@ -601,6 +602,7 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 	igt_output_t *output;
 	igt_crtc_t *crtc;
 	int outp_cntr = 0;
+	int crtc_cntr = 0;
 	char name[40];
 
 	for_each_connected_output(display, output) {
@@ -617,6 +619,12 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 
 			igt_output_set_crtc(data->output, data->crtc);
 
+			if (type == TEST_FILTER_SUSPEND && !data->all_crtcs && crtc->crtc_index != 0 &&
+						crtc->crtc_index != display->n_crtcs-1)
+					continue;
+
+			crtc_cntr++;
+
 			/*
 			 * FIXME: Joiner + CASF currently unsupported.
 			 * Remove this check once support is implemented.
@@ -751,6 +759,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'l':
 		data->limited = true;
 		break;
+	case 'c':
+		data->all_crtcs = true;
+		break;
 	case 'o':
 		data->all_outps = true;
 		break;
@@ -763,11 +774,12 @@ static int opt_handler(int opt, int opt_index, void *_data)
 
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

