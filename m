Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807A5606A32C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=c6y42u95
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308A510E628;
	Tue, 17 Nov 2026 15:22:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD7510E626
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 15:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794928438; x=1826464438;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WDlTkocmyrJ0FjdMMazTO4ca5TdqdLLKNjs9DFrOjtU=;
 b=c6y42u95hDjtVChRxs7vrHR+Ymb8iPxQ4bwEig62TTFOQTUhwlqOAs3C
 WLgwDoEe29BkL/uZvGwM2S0t4z6kWYC4r1FTVw4X/zrZsXP+2RI9ZEL2w
 luqPFhLMOgwb2uZQNQn9qwKxJYhJPSbocp+yHjyb8EuoyZNPtOGmqhXIG
 hS4WGgOcrIh9G6/11ePZo6kMzEBxwdQga9xxNAPKtMGyQ0jpdKTkYgBVi
 GFFHQE/+txvynkfVxl8sh5JJ1LMtvUA9Xm9a1bdcteBvYbH+vvQI2drsp
 qG/yTU+vN8KnN/xNmOHNTFosJrM1JqZ/1iNrK9Wa+NA/FFh48Ggxi93uN g==;
X-CSE-ConnectionGUID: HPkbMeodRfenBGMqEbAK9w==
X-CSE-MsgGUID: jcPo2bpdSFmejx/8tSSDbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3568807"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3568807"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:13:58 -0800
X-CSE-ConnectionGUID: N6yNM0MTTB2EK+49GqigCg==
X-CSE-MsgGUID: 6pR4lRkoTD2AEE8y8Ddadg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9724585"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:13:56 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v10 6/9] tests/intel/kms_ccs: limit #outputs tested
 during suspend
Date: Tue, 17 Nov 2026 16:13:23 +0100
Message-ID: <20261117151326.2074274-7-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261117151326.2074274-1-michal.grzelak@linux.intel.com>
References: <20261117151326.2074274-1-michal.grzelak@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
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
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Each suspend test is executed per output. Limit number of outputs tested
to 3 by default. Add command-line option enabling execution on every
output.

v3->v4
- reset output_count per each dynamic subtest (Thasleem)
- correct description from help string (Thasleem)

v1->v2
- fix off-by-one error

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
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

