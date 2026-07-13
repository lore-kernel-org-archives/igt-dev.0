Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0A4C43458
	for <igt-dev@archiver.kernel.org>; Mon, 13 Jul 2026 08:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A201110E879;
	Mon, 13 Jul 2026 08:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TiPuY8OE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D82310E5B3
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jul 2026 08:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783932970; x=1815468970;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MIz2+MVE4SckNJolDdAppMAe4+HjAVGV4Uypx36xeTE=;
 b=TiPuY8OEe7RuO39By7FowiNxVTrk1vqrlbk+0pWd4+sSmJ9dn3ovkRs3
 igUwUNMLZeyglDg3akJhXVUlph/HOlknR0inO3yQ603vO/c3ADyS0aGLE
 6uPfuotHjkcQkiETwJSqcdVn8+Q5wgKjYteQohWPPkVsgZauQIpJTox7s
 VtTO1IOkmMsBC6a1WPFiTvqTRn99Xa/LfrPlNu/IBnsGrAXUminEPtRVC
 Cu2VmzgplZ2H2JR+TZgjwfIQR4LzL3QQ2N/osYfSIbUXAcSnyNGuyHTTX
 8ZLb/+mnWVzgx+rvmon7PNZH7uST+cPY1Ub5HmNmPewmMauBconOnVRdw Q==;
X-CSE-ConnectionGUID: xQJTQg5FR3i/XwbugMkAkg==
X-CSE-MsgGUID: USiGsZY9SA2/AJzHondYAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="87081323"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="87081323"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2026 01:56:10 -0700
X-CSE-ConnectionGUID: 9+Ylctn1T8Cr6PD7SCxJKQ==
X-CSE-MsgGUID: T39IVMuESuar7HJpUizsYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; d="scan'208";a="260385862"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by fmviesa005.fm.intel.com with ESMTP; 13 Jul 2026 01:56:09 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>
Subject: [PATCH i-g-t v1 04/16] tests/kms_async_flips: limit #outputs tested
 during suspend
Date: Mon, 13 Jul 2026 10:55:03 +0200
Message-ID: <20260713085515.463575-5-michal.grzelak@intel.com>
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

We are iterating through each output while testing suspend. This results
in extended execution time. In turn this leads to hitting CI enforced
timeout.

By default limit number of tested outputs to 2. Test each connected
output when passing command-line parameter.

Signed-off-by: Michał Grzelak <michal.grzelak@intel.com>
---
 tests/kms_async_flips.c | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 03348d958d..7ef31a8ea5 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -119,6 +119,8 @@
 #define MIN_FLIPS_PER_FRAME_60HZ 5
 #define NUM_FBS 4
 
+#define OUTPUT_LIMIT 2
+
 IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
 
 typedef struct {
@@ -150,6 +152,7 @@ typedef struct {
 	unsigned int plane_format;
 	bool async_mod_formats;
 	bool single_pipe;
+	bool all_outputs;
 } data_t;
 
 struct format_mod {
@@ -873,11 +876,16 @@ static void run_test(data_t *data, void (*test)(data_t *))
 {
 	igt_crtc_t *crtc;
 	igt_display_t *display = &data->display;
+	int output_count = 0;
 
 	if (data->atomic_path)
 		require_atomic_async_cap(data);
 
 	for_each_connected_output(display, data->output) {
+		if (!data->all_outputs && data->suspend_resume && output_count > OUTPUT_LIMIT)
+			continue;
+
+		output_count++;
 		for_each_crtc(&data->display, crtc) {
 			if(!igt_crtc_connector_valid(crtc, data->output))
 				continue;
@@ -1039,9 +1047,27 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 	}
 }
 
+static int opt_handler(int opt, int opt_index, void *opt_data)
+{
+	data_t *data = opt_data;
+
+	switch (opt) {
+		case 'o':
+			data->all_outputs = true;
+			break;
+		default:
+			return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
 static data_t data;
 
-int igt_main()
+const char *help_str =
+	"  -o \tRun on all outputs. (By default subtests will run on two outputs)\n";
+
+int igt_main_args("o", NULL, help_str, opt_handler, &data)
 {
 	int i;
 
-- 
2.45.2

