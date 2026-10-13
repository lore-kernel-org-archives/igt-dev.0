Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1972FCC6B19
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 16:17:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B16EC10E0E9;
	Tue, 13 Oct 2026 16:17:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8947110E51D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 16:11:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791907866; x=1823443866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ik4aNuF5CcvcH/ivQsZPxk4KkDlVCRgIszQ9eetkUIQ=;
 b=MFWQjustOVhcWy67SgHGhprOmJsq5PseZQcKUxdjOsICRQGq4DMo618i
 wN4wRzhjEi61/zctbGmzuy5FlIirLqVgKkk/AQwbW3B4BctTaZheIRwbr
 uLAd51UYP78N0MWQplFKcQRwLu+T6qtFSKvKIW4Rt9KaVlsa3oIZERiRh
 /1tDOirv1xHE6Wu1zujaAeN1DNtUBhyZymcbHwwNerRL+2ddwv0ztb8vP
 EqP5imPOSvfjgHqdluANaz/iWY8QTC4FREEKJ7lmSn+dxv8Ny1rPF61ju
 HBcxdQVj+SJivJcasNSYkGa3nRlAAuZVrv102Y/UTaxh+XoL1TbQsqzJg A==;
X-CSE-ConnectionGUID: jXLL6TngR+idTNMQGzai1Q==
X-CSE-MsgGUID: 3R6b1DKySfiJXq4+7B0fIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="656323"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="656323"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:11:06 -0700
X-CSE-ConnectionGUID: i/9+njQlTPGapLESfI3mkA==
X-CSE-MsgGUID: pynMI5g8RvaEpxvQIsgjWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="1096336"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2026 09:11:04 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v8 6/9] tests/intel/kms_ccs: limit #outputs tested
 during suspend
Date: Tue, 13 Oct 2026 18:10:10 +0200
Message-ID: <20261013161013.1364753-7-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
References: <20261013161013.1364753-1-michal.grzelak@linux.intel.com>
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
- reset output_count per each dynamic subtest (Thasleem)
- correct description from help string (Thasleem)

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

