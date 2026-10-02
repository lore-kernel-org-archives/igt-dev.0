Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72310CA5FE5
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 20:19:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 184CD10E048;
	Fri,  2 Oct 2026 20:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcRmk/td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E9810F9CA
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 20:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790972225; x=1822508225;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HLsEmUoDBMOSpGBy0sYHdM2oI2SYh+b4mUKw+99mAaI=;
 b=OcRmk/tduPxUyg+RQ/rTGedj41QFzIxFO0aQEM+8PBWTu00kaSmk6LBG
 T1qXQSVTiIEkMFbA2Z9zt3OJdsGa9KOpfqk60VOhhehH9oVDB/A5fTz18
 /8HVWJifX27q5o01EkYBStQLxEwN9iW4XJs7IYgncpqzj2m0OwFKsHD+3
 qhpm7Kqes2rnXjoPtxFG3tSj13U6QL1n92CGNy6aH9qRklleNM5CnwtPn
 1sfPD2Rs1daqd44AKMQ+KuYiLJydhAnOJyotC38DR4CItAbds8myfIfTd
 9kpv8Xvk4xcaPxZPEKy+J0/TOGEBr6b8FRb7jUoEzrixAYCQAPw5gvVbT g==;
X-CSE-ConnectionGUID: RZGiXT0oS76nCh/TOz7yCg==
X-CSE-MsgGUID: A3QUO4WaR6aMmy8ethcsNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90877955"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90877955"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:17:05 -0700
X-CSE-ConnectionGUID: yca83DKQQP6JbcsNkq6ZCg==
X-CSE-MsgGUID: rdDNjhvURsKy+WcbHWZGHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="407144"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:17:03 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, jani.nikula@intel.com,
 michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 6/7] tests/intel/kms_ccs: limit #pipes tested during
 suspend
Date: Fri,  2 Oct 2026 22:15:24 +0200
Message-ID: <20261002201525.466080-7-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261002201525.466080-1-michal.grzelak@linux.intel.com>
References: <20261002201525.466080-1-michal.grzelak@linux.intel.com>
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

Limit execution of suspend tests to first and last active pipe unless
using `extended` flag. This reduces default execution time of the test.
In turn this can lower chances of hitting CI timeout.

Alternatively test could be run on first and last CRTC; but due to pipe
reordering, this would result in using arbitrary pipes. Thus use first
and last hardware pipe when running suspend tests.

v6->v7
- use first and last hardware pipe instead of CRTCs (J-P, Jani)

v5->v6
- describe how pipe reordering affects the test (Jani)

v3->v4
- set `first' and `last' indices outside of crtc loop (Thasleem)

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/intel/kms_ccs.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 8526f1ccfd..f9c713d85b 100644
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
@@ -1132,12 +1133,15 @@ static void test_output(data_t *data, const int testnum)
 	igt_crtc_t *crtc;
 	uint16_t dev_id;
 	int output_count = 0;
+	int n_crtcs;
 
 	igt_fixture()
 		dev_id = intel_get_drm_devid(data->drm_fd);
 
 	data->flags = tests[testnum].flags;
 
+	n_crtcs = igt_display_n_crtcs(&data->display);
+
 	for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
 		if (!valid_modifier_test(ccs_modifiers[i].modifier,
 					 data->flags))
@@ -1176,6 +1180,10 @@ static void test_output(data_t *data, const int testnum)
 					if (!intel_pipe_output_combo_valid(&data->display))
 						continue;
 
+					if (!data->all_crtcs && (data->flags & TEST_SUSPEND) &&
+					    crtc->hardware_pipe != PIPE_A && crtc->hardware_pipe != PIPE_NONE + n_crtcs)
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
 						int valid_tests = 0;
 
@@ -1232,6 +1240,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 	case 'n':
 		data->all_outputs = true;
 		break;
+	case 'e':
+		data->all_crtcs = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1246,9 +1257,10 @@ static const char *help_str =
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

