Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB049C5AD2B
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 22:51:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A09710E463;
	Fri,  7 Aug 2026 22:51:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BiVYcMDa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413B210E463
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 22:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786142892; x=1817678892;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TvVKmnQcqPeGTXF9FzdBlRjU7O2v5CA1/ARY29Ao8Xw=;
 b=BiVYcMDaJp+qygQ7i+Cm4HpVoCxrtS5Jldms6qZ+sJY4AGHB0isY6Tjw
 tZCdG0NvPYmv6/LtHCeMuann6AipB9+FVoAkEWzQmrl2ORU5f/IWhaHM+
 +i9k44TmlXP4a4sant3mk1A3TAqYCqZerZtjq+LAcpycqvt4G3fzARr//
 sqeGBkIYV/rrRF0FYsByP9wWdRqTapB14DRzNkhUTThIs9MTInlz+0LIB
 wvVjrIkzp6fGorqshkCKkZbX+MgTqgqbghHtOEQb2IbhTzgNbUWOB1Ula
 d5e9SsanO+ZGP9zWFRr8UwSKco3LNAiSCD7cDmhxwOw/kW9Rgv9Rnzkmf g==;
X-CSE-ConnectionGUID: 1QHBojPaSJ6OmUGNm0KE2A==
X-CSE-MsgGUID: pR6+xsBgQ2Wi9bshuQteUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86835831"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="86835831"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2026 15:48:12 -0700
X-CSE-ConnectionGUID: yCaKMPktS9CkkBdrhisadw==
X-CSE-MsgGUID: asDesDH2TFWtG2KZ95BG7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; d="scan'208";a="258655471"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2026 15:48:11 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: nemesa.garg@intel.com, mohammed.thasleem@intel.com, karthik.b.s@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v2 16/16] tests/kms_ccs: limit #crtcs tested during
 suspend
Date: Sat,  8 Aug 2026 00:47:46 +0200
Message-ID: <20260807224746.3554064-17-michal.grzelak@intel.com>
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

Limit execution of suspend tests to first and last active CRTC unless
using `extended` flag. This reduces default execution time of the test.
In turn this can lower chances of hitting CI timeout.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/intel/kms_ccs.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 11bc30769c..3aeb1a57df 100644
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
@@ -1157,6 +1158,9 @@ static void test_output(data_t *data, const int testnum)
 			}
 
 			for_each_connected_output(&data->display, data->output) {
+				int first = data->display.crtcs[0].crtc_index;
+				int last = data->display.crtcs[data->display.n_crtcs-1].crtc_index;
+
 				if (!data->all_outputs && (data->flags & TEST_SUSPEND) &&
 				    output_count >= OUTPUT_LIMIT)
 					continue;
@@ -1175,6 +1179,10 @@ static void test_output(data_t *data, const int testnum)
 					if (!intel_pipe_output_combo_valid(&data->display))
 						continue;
 
+					if (!data->all_crtcs && (data->flags & TEST_SUSPEND) &&
+					    crtc->crtc_index != first && crtc->crtc_index != last)
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s",
 								    igt_crtc_name(crtc),
 								    data->output->name) {
@@ -1234,6 +1242,9 @@ static int opt_handler(int opt, int opt_index, void *opt_data)
 	case 'n':
 		data->all_outputs = true;
 		break;
+	case 'e':
+		data->all_crtcs = true;
+		break;
 	default:
 		return IGT_OPT_HANDLER_ERROR;
 	}
@@ -1248,9 +1259,10 @@ static const char *help_str =
 "  -s <seed>\tSeed for random number generator\n"
 "  -r\t\tOn suspend test do full hibernate with reboot\n"
 "  -n\t\tRun on all connectors. (By default suspend subtests will run on 2 connectors)\n"
+"  -e\t\tRun on all CRTCs. (By default subtests will run on two CRTCs)\n"
 ;
 
-int igt_main_args("csrn:", NULL, help_str, opt_handler, &data)
+int igt_main_args("csrne:", NULL, help_str, opt_handler, &data)
 {
 	igt_fixture() {
 		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
-- 
2.45.2

