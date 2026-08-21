Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FB74C5DF89
	for <igt-dev@archiver.kernel.org>; Fri, 21 Aug 2026 12:56:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D4010E097;
	Fri, 21 Aug 2026 12:56:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jBwyMRBP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE36010E39F
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 12:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787316540; x=1818852540;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5lfHxnCb/FqAEE6h3OXKUV60fsKpyARYG8XxFEwcztU=;
 b=jBwyMRBPQ5CPo/7CQHzennO+OuBbUax8h09Os2JAiG1S10yFFdAJN4v/
 vQHKH/cetgpTvqI21XwvPPJrX+NmpqkZFUsRdKNyFbz8pmgjxv+jim0KM
 ivw0Wz+K/uKnk9B7IKYUWUWfnikEEhSEA+EOPC944fxlujw3pKNnuTnqg
 JT1oP+UklITcZmq4LE6+Qj71DY3+TjilTS3Kq7gYeR0OIb+igqTRtibhd
 XHQRl8z0SDUKYFGWJr0FSKkftT46zw5oYWQXXrd+Xnk7itJpcBDRZuJ/7
 9qfUS63NUQmuVbPwnRsWK9HkYwgyluVIPnULXnoUpN06T0E4i8CMJ304m w==;
X-CSE-ConnectionGUID: l1jgQ5BrQOy5SwfqCewObQ==
X-CSE-MsgGUID: ayw3I1wVQRyNsZLu3trXfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11881"; a="87632935"
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="87632935"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2026 05:49:00 -0700
X-CSE-ConnectionGUID: dI6+V3DLTPmhnToSRtJCzQ==
X-CSE-MsgGUID: BVUiyNPtTsG1TV64y6CFAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,235,1779174000"; d="scan'208";a="291188402"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa001.fm.intel.com with ESMTP; 21 Aug 2026 05:48:58 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v3 15/17] tests/kms_ccs: limit #outputs tested during
 suspend
Date: Fri, 21 Aug 2026 14:48:32 +0200
Message-ID: <20260821124834.1974029-16-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260821124834.1974029-1-michal.grzelak@intel.com>
References: <20260821124834.1974029-1-michal.grzelak@intel.com>
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

v1->v2
- fix off-by-one error

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_ccs.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 9ac0ac8e2b..11bc30769c 100644
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
@@ -1153,6 +1157,12 @@ static void test_output(data_t *data, const int testnum)
 			}
 
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
@@ -1221,6 +1231,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 	case 'r':
 		data->do_hibernate = true;
 		break;
+	case 'n':
+		data->all_outputs = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1234,9 +1247,10 @@ static const char *help_str =
 "  -c\t\tCheck the presence of compression meta-data\n"
 "  -s <seed>\tSeed for random number generator\n"
 "  -r\t\tOn suspend test do full hibernate with reboot\n"
+"  -n\t\tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n"
 ;
 
-int igt_main_args("csr:", NULL, help_str, opt_handler, &data)
+int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.45.2

