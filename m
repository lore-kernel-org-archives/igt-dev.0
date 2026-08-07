Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4077FC5AD05
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:57:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E02F410E3E1;
	Fri,  7 Aug 2026 22:57:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VGr+5QLB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F6410E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142887; x=1817678887;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gAS1EBPa23E8B0BcQZS0UkB0yqLJIjJJ1FS2FJb7hcg=;
 b=VGr+5QLBQHpjOuYXcp1tzQ2Zv0k5x6qyfwQfKfTnCcjOTK1s+xDi8aQF
 29MS5zfe0uk0BUfUtfmnK989utbDe/10Vlx5uTy6mcxNnI9DBLU231Rsc
 w3T476tbsoNNZ6muAXG8br3Sd7DZcm8d2Ssr/7oIRdrDy+znKOXLtTk9B
 VbH5erF7+fkWHq0umVlqsCetrMrQvcszGj+E8bvzsPZJu/8aTK3pShYbZ
 G7fUYIHHzdEkCtCUYaGNBi5nqqr2CoQzY439HcwBoX0Rr6X57gctQnEbD
 PWkkqqdbOz8AcvZrm5WZSkXfuKGSfBBj56XmzFAanxonyvNUd06aEhSZW w==;
X-CSE-ConnectionGUID: MxvYamasROqIuUkEfLB1qg==
X-CSE-MsgGUID: ZfJDOsJ1QUqv45nqmb4nAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835826"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835826"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:48:07 -0700
X-CSE-ConnectionGUID: 08IX2UvTSCq97hDRGlnyvw==
X-CSE-MsgGUID: GLOY5zucSu+41Nc+gM/7zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655452"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:48:05 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 12/16] tests/kms_sharpness_filter: limit #outputs
 tested during suspend
Date: Sat,  8 Aug 2026 00:47:42 +0200
Message-ID: <20260807224746.3554064-13-michal.grzelak@intel.com>
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

We are iterating through each output while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

By default limit number of tested outputs to 3. Test each connected
output when passing command-line parameter.

v1->v2
- remove abbreviations (Jani)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
Reviewed-by: Nemesa Garg <nemesa.garg@intel.com>
---
 tests/intel/kms_sharpness_filter.c | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_sharpness_filter.c b/tests/intel/kms_sharpness_filter.c
index f2e3fc9494..adec4a60c5 100644
--- a/tests/intel/kms_sharpness_filter.c
+++ b/tests/intel/kms_sharpness_filter.c
@@ -74,6 +74,8 @@ IGT_TEST_DESCRIPTION("Test to validate content adaptive sharpness filter");
  * is seen without corruption for each subtest.
  */
 
+#define OUTPUT_LIMIT 			3
+
 #define TAP_3				3
 #define TAP_5				5
 #define TAP_7				7
@@ -231,6 +233,7 @@ static const struct subtest_entry {
 typedef struct {
 	int drm_fd;
 	bool limited;
+	bool all_outputs;
 	struct igt_fb fb[4];
 	igt_crtc_t *crtc;
 	igt_display_t display;
@@ -614,9 +617,16 @@ run_sharpness_filter_test(data_t *data, enum test_type type)
 	igt_display_t *display = &data->display;
 	igt_output_t *output;
 	igt_crtc_t *crtc;
+	int output_counter = 0;
 	char name[40];
 
 	for_each_connected_output(display, output) {
+		if (type == TEST_FILTER_SUSPEND && !data->all_outputs &&
+		    output_counter > OUTPUT_LIMIT)
+			continue;
+
+		output_counter++;
+
 		for_each_crtc(display, crtc) {
 			igt_display_reset(display);
 
@@ -766,6 +776,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
 	case 'l':
 		data->limited = true;
 		break;
+	case 'o':
+		data->all_outputs = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -774,11 +787,12 @@ static int opt_handler(int opt, int opt_index, void *_data)
 }
 
 static const char help_str[] =
-	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n";
+	"  --limited|-l\t\tLimit execution to 1 valid pipe-output combo\n"
+	"  --all-outputs|-o\t\tExtend suspend tests for all outputs\n";
 
 data_t data = {};
 
-int igt_main_args("l", NULL, help_str, opt_handler, &data)
+int igt_main_args("lo", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
-- 
2.45.2

