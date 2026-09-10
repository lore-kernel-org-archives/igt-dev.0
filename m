Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFB9C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 19:12:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F18F10E248;
	Thu, 10 Sep 2026 19:12:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cdy3RWiI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E520910E27F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 18:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789066773; x=1820602773;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KlwwVeXbPvdlsFGBDo+6q4XiyLbNFO2yPjqT/aS5+6U=;
 b=Cdy3RWiIvfrr2IK5FFMBevYg1zgOr/WIq2hIoYQmvJG/5KNXU7qJ4l5x
 xjsCR2TC5HMXcz05vuxbUkyKfeWkSgUsrPTxUTzB0wTBWKkKq/U5mCKKw
 /2M0LnOq+3mlEi3ebjNp/J18iVcz8r25pdcEauNTiM19gCQ2n6qfil/10
 q/LSTj5CjTBdfloSF1G+LSQjFNUbwsC59fLpcxFjxbf0fU5CcJQMBHMDH
 ZczUzFJhyBKiCTXVy3OS1Ndr11J87Ud/KfdohU0wnHAiYUypYEawRtxlC
 5kMTKT6KsnkA+4JBBvbx1enPgLamPgb9HvJInRheoGabaTy00o9SKpeVd w==;
X-CSE-ConnectionGUID: o9mdH/8nRLSx1TQ0cSUZVw==
X-CSE-MsgGUID: XYfHcixwSoWxc0lAqAQVHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="89400098"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89400098"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2026 11:59:32 -0700
X-CSE-ConnectionGUID: xsVj0AUnTAeWKCyo6/7ihA==
X-CSE-MsgGUID: mqBaFGaiS9mxkcfc5XCZLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; d="scan'208";a="295199537"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa002.fm.intel.com with ESMTP; 10 Sep 2026 11:59:31 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Nemesa Garg <nemesa.garg@intel.com>, Karthik B S <karthik.b.s@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v4 15/17] tests/intel/kms_ccs: limit #outputs tested
 during suspend
Date: Thu, 10 Sep 2026 20:59:00 +0200
Message-ID: <20260910185902.2728276-16-michal.grzelak@intel.com>
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

Each suspend test is executed per output. Limit number of outputs tested
to 3 by default. Add command-line option enabling execution on every
output.

v3->v4
- reset output_count per each dynamic subtest (Mohammed)
- correct description from help string (Mohammed)

v1->v2
- fix off-by-one error

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_ccs.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 9ac0ac8e2b..bf3a5f4e9c 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -141,6 +141,8 @@
  * @yf-tiled-ccs:              YF tiled ccs
  */
 
+#define OUTPUT_LIMIT 3
+
 #define SDR_PLANE_BASE	3
 
 IGT_TEST_DESCRIPTION("Test render compression (RC), in which the main surface "
@@ -188,6 +190,7 @@ typedef struct {
 	enum igt_commit_style commit;
 	int fb_list_length;
 	bool do_hibernate;
+	bool all_outputs;
 	struct {
 		struct igt_fb fb;
 		int width, height;
@@ -1128,6 +1131,7 @@ static void test_output(data_t *data, const int testnum)
 {
 	igt_crtc_t *crtc;
 	uint16_t dev_id;
+	int output_count = 0;
 
 	igt_fixture()
 		dev_id = intel_get_drm_devid(data->drm_fd);
@@ -1152,7 +1156,15 @@ static void test_output(data_t *data, const int testnum)
 					      "Older than Xe2 platform needed.\n");
 			}
 
+			output_count = 0;
+
 			for_each_connected_output(&data->display, data->output) {
+				if (!data->all_outputs && (data->flags & TEST_SUSPEND) &&
+				    output_count >= OUTPUT_LIMIT)
+					continue;
+
+				output_count++;
+
 				for_each_crtc(&data->display, crtc) {
 					if (!igt_crtc_connector_valid(crtc, data->output))
 						continue;
@@ -1221,6 +1233,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 	case 'r':
 		data->do_hibernate = true;
 		break;
+	case 'n':
+		data->all_outputs = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1234,9 +1249,10 @@ static const char *help_str =
 "  -c\t\tCheck the presence of compression meta-data\n"
 "  -s <seed>\tSeed for random number generator\n"
 "  -r\t\tOn suspend test do full hibernate with reboot\n"
+"  -n\t\tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
 ;
 
-int igt_main_args("csr:", NULL, help_str, opt_handler, &data)
+int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.45.2

