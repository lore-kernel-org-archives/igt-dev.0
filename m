Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05684C88E41
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 20:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E0A210E2E3;
	Thu, 10 Sep 2026 20:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nrT2q4tl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3666E10E2F9
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 20:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789071289; x=1820607289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YimBAIq9WZNqbXHw9RYAN3HaiZPu6HsDiGJpVYgm3jo=;
 b=nrT2q4tl3xVGYJ2saU+ScBzk2149Y8b6vUtZJC2G38R2fQmhnY7i7sv7
 aIsaVjjHbqadXF/SA3eYD1wzPCzZ05zvL2oS9DryozwYsdF5CDDtT/i3f
 kXr02YJxBPvzz4FWe2puUsXumczBb/UsxVOnf8LmuehQI8iYq1hgrJGsH
 vmaFLe5RZp/vvfSCEFj7owFfro+PaGToBm4BkSqlEHr/v2xfEGC47sfJ7
 mCSD6TSAJKcUXXuZeLtw1iSWCCZ+PJQYyxa9uV1ltr0QuauDyJXds8xxx
 TeRYASOtgRxSHVUZCfwoAY/EBNtMp4ou2Ij0QHrQ/ThY7ME6ExLExTNo2 w==;
X-CSE-ConnectionGUID: y+sBjwEkRn+kau+fxfAFjQ==
X-CSE-MsgGUID: C6llQgqRRNCvbCA3mxxuSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89657279"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89657279"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 13:14:49 -0700
X-CSE-ConnectionGUID: k8DU0iuPReeZDJ6Av15D+g==
X-CSE-MsgGUID: mEDFtGoOS/6IxLBC0618eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="309978249"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by orviesa001.jf.intel.com with ESMTP; 10 Sep 2026 13:14:48 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v5 16/17] tests/intel/kms_ccs: limit #crtcs tested
 during suspend
Date: Thu, 10 Sep 2026 22:14:12 +0200
Message-ID: <20260910201413.2730574-17-michal.grzelak@intel.com>
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
using `extended` flag. This reduces default execution time of the test.
In turn this can lower chances of hitting CI timeout.

When `first' and `last' is set outside of dynamic subtest scope, it
results in build failure caused by Meson receiving SIGSEGV:

	FAILED: tests/kms_ccs.testlist
	/usr/bin/meson --internal exe --capture tests/kms_ccs.testlist -- [..]/tests/kms_ccs --show-testlist
	--- stderr ---
	Received signal SIGSEGV.

	ninja: build stopped: subcommand failed.

Thus set them inside dynamic subtest's scope.

v3->v4
- set `first' and `last' indices outside of crtc loop (Mohammed)

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_ccs.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 8526f1ccfd..5bc5215eb7 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -191,6 +191,7 @@ typedef struct {
 	int fb_list_length;
 	bool do_hibernate;
 	bool all_outputs;
+	bool all_crtcs;
 	struct {
 		struct igt_fb fb;
 		int width, height;
@@ -1132,6 +1133,8 @@ static void test_output(data_t *data, const int testnum)
 	igt_crtc_t *crtc;
 	uint16_t dev_id;
 	int output_count = 0;
+	uint32_t first;
+	uint32_t last;
 
 	igt_fixture()
 		dev_id = intel_get_drm_devid(data->drm_fd);
@@ -1147,6 +1150,9 @@ static void test_output(data_t *data, const int testnum)
 
 		igt_describe(tests[testnum].description);
 		igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, ccs_modifiers[i].str) {
+			first = data->display.crtcs[0].crtc_index;
+			last = data->display.crtcs[data->display.n_crtcs - 1].crtc_index;
+
 			if (ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_BMG_CCS ||
 			    ccs_modifiers[i].modifier == I915_FORMAT_MOD_4_TILED_LNL_CCS) {
 				igt_require_f(intel_gen(dev_id) >= 20,
@@ -1176,6 +1182,10 @@ static void test_output(data_t *data, const int testnum)
 					if (!intel_pipe_output_combo_valid(&data->display))
 						continue;
 
+					if (!data->all_crtcs && (data->flags & TEST_SUSPEND) &&
+					    crtc->crtc_index != first && crtc->crtc_index != last)
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
 						int valid_tests = 0;
 
@@ -1232,6 +1242,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 	case 'n':
 		data->all_outputs = true;
 		break;
+	case 'e':
+		data->all_crtcs = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1246,9 +1259,10 @@ static const char *help_str =
 "  -s <seed>\tSeed for random number generator\n"
 "  -r\t\tOn suspend test do full hibernate with reboot\n"
 "  -n\t\tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
+"  -e\t\tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
 ;
 
-int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
+int igt_main_args("csrne:", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.45.2

