Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A805C44501
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 09:03:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB3C210E885;
	Mon, 13 Jul 2026 09:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BQNVQoMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F5DD10E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932984; x=1815468984;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MUYekZr7A9TGSKusvyh84DlhJ3iusJ5ZLIGWvIHcltw=;
 b=BQNVQoMSlUKhglWX7DSRe1VbGHN7sF5ecdz92DRDp/o980lL2HzAQpu2
 pLvB6NOqsyKTsBFQITBBDVhJIYkJK+JKE/D2NvQ83iXlkjBMBA21Q4t8/
 Ndlun8FAsO+N5elsNCghE5zXhAswENULT7Ml68kBA8EmnVqVdUgSMP5Fa
 EhCVyyLj6cB3+GpKVgwdoRZH1GQDR3wsyvI8pg0Or0CXtLxkKu1UN5KJU
 2MyVoVKeqs65h9vhw1oAwt31zSCwTLSyyAVdRPWTzXpgv0CONtkfmcVNT
 dKPoP5qG2tCbxVpC1sKdFKc+8nDFMhzozt5acRqy11jA3NVSh0A/n0hRa A==;
X-CSE-ConnectionGUID: Qy+qns3JSb6jZw8VoOFnBA==
X-CSE-MsgGUID: d47mgcJ6T0eDgfZUhBpktw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081339"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081339"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:24 -0700
X-CSE-ConnectionGUID: GQbMg74yTW2+TUcezNZTag==
X-CSE-MsgGUID: qftB0TWCRcWc6GQkKEvKkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385978"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:22 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 16/16] tests/kms_ccs: limit #crtcs tested during
 suspend
Date: Mon, 13 Jul 2026 10:55:15 +0200
Message-ID: <20260713085515.463575-17-michal.grzelak@intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20260713085515.463575-1-michal.grzelak@intel.com>
References: <20260713085515.463575-1-michal.grzelak@intel.com>
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
index 0c57b0cd5c..fd55fd8683 100644
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
 				    output_count > OUTPUT_LIMIT)
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

