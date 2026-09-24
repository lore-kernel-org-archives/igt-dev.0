Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A583C98314
	for <igt-dev@archiver.kernel.org>; Thu, 24 Sep 2026 07:57:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A2910F396;
	Thu, 24 Sep 2026 07:57:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MeeHnGFI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DDB010F37E
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Sep 2026 07:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790236262; x=1821772262;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=UP1O5himPo1XxiGWktdbQw4C/XuYnq6ipHHYG1A+ReA=;
 b=MeeHnGFI9l/B7/H9iqfKchFCybl3Y/L0678nCG4i/dCa1pYPjTzGW6Df
 7ZAx6tauJt4/N5uICqYNKH1YEuQalaVKwpg7Nr1orx3KRyn0PZa3PFPnQ
 iVFNbuM7q4iRKOtSB55qvaj1xOp7J3HVv9dGajruLDwtTrGlh8LLW+fVn
 aGt9gyEL3VXi+tO2RFGeYWAGcxNRNdUj5Iqi4v2dHZ0flTlAUA4QzWpVt
 RJMf4MkgsPe2cZmfipT3jrb0OslsctPmJMzDJ8eofBN87CaVMU3ODsHzS
 ZlJYPWRwZRY/aOE42RRE6w0GEbBIRXSQMJqczY4iYXczy5VZtOLklw826 w==;
X-CSE-ConnectionGUID: jsQQ5l5fRoCHpRYDJq/XRw==
X-CSE-MsgGUID: adHjMyNsTxK7QbZYp4oazg==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="90119606"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="90119606"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:51:02 -0700
X-CSE-ConnectionGUID: l0gBtFwKRzWCEemgGLVvag==
X-CSE-MsgGUID: iuZA55NRRjevKJyrX113Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; d="scan'208";a="311854764"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 00:51:00 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v6 5/7] tests/intel/kms_ccs: limit #outputs tested
 during suspend
Date: Thu, 24 Sep 2026 09:50:17 +0200
Message-ID: <20260924075019.4151374-6-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260924075019.4151374-1-michal.grzelak@linux.intel.com>
References: <20260924075019.4151374-1-michal.grzelak@linux.intel.com>
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

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/intel/kms_ccs.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 1a922792c5..8526f1ccfd 100644
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
@@ -1217,6 +1229,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 	case 'r':
 		data->do_hibernate = true;
 		break;
+	case 'n':
+		data->all_outputs = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1230,9 +1245,10 @@ static const char *help_str =
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

