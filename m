Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D1BCDB46F
	for <igt-dev@archiver.kernel.org>; Mon, 22 Jun 2026 22:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C374410E8E8;
	Mon, 22 Jun 2026 22:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H9U8k56I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED3110E2A4
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Jun 2026 22:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1782169106; x=1813705106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9pSLHhtJRsougne7UJNYhYOh3NDJY65oO9RoqA7ft3k=;
 b=H9U8k56I/GXi7s2CAMP2g359u733KUaChunuJ07ICUAgympFLP0/+l6t
 c8+xM3b2jrnweMQD4trZEjT2pZDFO2NIBy+DCy1Q4aM0obKAokeye5zi0
 Y9HhA0oCgBU91Y9diOyzZvfaBeHIG5bN0TJJbN6OZ/euedJZ1b6JUXLuv
 AShBDY9ZiKBtq+JIqZkpiGiVnz4vizZf2xDgq1eTsFYsVmnuSe9Sn7x4p
 hXDHcZnnDK7xT7s8JlAbeOg8C9obtcN+QTHnrwDK4fW5s0nHLkmSWvVvF
 mdLr4MdPO6jTlVrveAcz8XWZE9IQh+zgh9WfAZ+4KvzmQZKtD9FxAbahv g==;
X-CSE-ConnectionGUID: fXZDNsrSTqGjr5Ig2s6ypg==
X-CSE-MsgGUID: lOcuVVL8SweX9fEjvP50+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82010429"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; d="scan'208";a="82010429"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2026 15:58:26 -0700
X-CSE-ConnectionGUID: 0z2pLZF3Qa6gjlZvmUbAng==
X-CSE-MsgGUID: Gs+2sltgTweGEyNFAdEMHw==
X-ExtLoop1: 1
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa003.fm.intel.com with ESMTP; 22 Jun 2026 15:58:25 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t v1 3/3] tests/kms_ccs: limit number of suspend tests
Date: Tue, 23 Jun 2026 00:58:11 +0200
Message-ID: <20260622225811.1703400-4-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260622225811.1703400-1-michal.grzelak@intel.com>
References: <20260622225811.1703400-1-michal.grzelak@intel.com>
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

Currently, each suspend is tested per each crtc, per each output. Limit
number of output tested by default to 3. Limit execution of suspend to
first crtc on each output. Add options enabling execution on every
output and on every crtc.

Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_ccs.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index ba0789f29b..0da7ac2f57 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -188,6 +188,8 @@ typedef struct {
 	enum igt_commit_style commit;
 	int fb_list_length;
 	bool do_hibernate;
+	bool all_outps;
+	bool all_crtcs;
 	struct {
 		struct igt_fb fb;
 		int width, height;
@@ -1128,6 +1130,7 @@ static void test_output(data_t *data, const int testnum)
 {
 	igt_crtc_t *crtc;
 	uint16_t dev_id;
+	int outp_count = 0;
 
 	igt_fixture()
 		dev_id = intel_get_drm_devid(data->drm_fd);
@@ -1153,6 +1156,8 @@ static void test_output(data_t *data, const int testnum)
 			}
 
 			for_each_connected_output(&data->display, data->output) {
+				int first = data->display.crtcs[0].crtc_index;
+
 				for_each_crtc(&data->display, crtc) {
 					if (igt_crtc_connector_valid(crtc, data->output)) {
 						data->crtc = crtc;
@@ -1163,6 +1168,14 @@ static void test_output(data_t *data, const int testnum)
 						if (!intel_pipe_output_combo_valid(&data->display))
 							continue;
 
+						if (!data->all_crtcs && crtc->crtc_index != first)
+							continue;
+
+						if (!data->all_outps && outp_count > 3)
+							continue;
+
+						outp_count++;
+
 						igt_dynamic_f("pipe-%s-%s",
 									    igt_crtc_name(crtc),
 									    data->output->name) {
@@ -1220,6 +1233,12 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 	case 'r':
 		data->do_hibernate = true;
 		break;
+	case 'n':
+		data->all_outps = true;
+		break;
+	case 'e':
+		data->all_crtcs = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1233,9 +1252,11 @@ static const char *help_str =
 "  -c\t\tCheck the presence of compression meta-data\n"
 "  -s <seed>\tSeed for random number generator\n"
 "  -r\t\tOn suspend test do full hibernate with reboot\n"
+"  -n\t\tRun on all connectors. (By default suspend subtests will run on 3 connectors)\n"
+"  -e\t\tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
 ;
 
-int igt_main_args("csr:", NULL, help_str, opt_handler, &data)
+int igt_main_args("csrne:", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.45.2

