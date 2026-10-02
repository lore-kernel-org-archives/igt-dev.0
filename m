Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E07D1CA5FDD
	for <igt-dev@archiver.kernel.org>; Fri,  2 Oct 2026 20:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894DA10E048;
	Fri,  2 Oct 2026 20:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQF8yMxK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17C7210E693
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Oct 2026 20:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790972216; x=1822508216;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/RNiq495J2qwnMCiEmkuRqZ4g5kn+nNnGSyhvTBpa24=;
 b=GQF8yMxKhvm4+ioHYKt1tmDxvXgn3AR73YMg3Nt4vLScrZg8ercrg6Fu
 U1WG95c26+WiNqs5xn+Grwh9j1aDvKRXThNKVwPbSt5aIq4jFaIlAIemX
 p6VcIDj9mAfOSp1hpHPTnELKxjXDqIPeUI1KtiefiImOxprft3WqaNmEm
 W7XCA8U6A+Q60l0f3W8/XCpad48H2CgqNdmgp4ZIBmw3OnTQBVjSO5cSh
 RFCv52MCakeCL4YYGkU5171Zm+QMS/o/HNpEMIRFY3gXjzOT0AASQr0qS
 ZhQTQA3Um1ATlDfYekhJCfcBwB0AqrGxcbFmt5g6+5LrL8LETTmqVGC3Y g==;
X-CSE-ConnectionGUID: Si40Da4lQkSgNyjbqS2s7g==
X-CSE-MsgGUID: Xq4yQ9LBShOgv/IkW1v+cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90877939"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; d="scan'208";a="90877939"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:16:56 -0700
X-CSE-ConnectionGUID: +Hvy2nlRTkSVi7AujMLypg==
X-CSE-MsgGUID: rHvNR4HHQuOKrfKdZYZZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="407080"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2026 13:16:54 -0700
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, swati2.sharma@intel.com,
 juhapekka.heikkila@gmail.com, jani.nikula@intel.com,
 michal.grzelak@intel.com,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v7 1/7] tests/kms_async_flips: split outer test loop
 into two
Date: Fri,  2 Oct 2026 22:15:19 +0200
Message-ID: <20261002201525.466080-2-michal.grzelak@linux.intel.com>
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

for_each_crtc_with_valid_output() iterates over every crtc with
connected output. Split it into two loops. This is needed to handle
cases per output.

v3->v4
- break outer loop as well (Thasleem)
- add missing space (Thasleem)

Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/kms_async_flips.c | 63 ++++++++++++++++++++++-------------------
 1 file changed, 34 insertions(+), 29 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index ef4b28eb52..8884efd8ba 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -877,39 +877,44 @@ static void run_test(data_t *data, void (*test)(data_t *))
 	if (data->atomic_path)
 		require_atomic_async_cap(data);
 
-	for_each_crtc_with_valid_output(display, crtc, data->output) {
-		data->crtc = crtc;
-		igt_display_reset(display);
+	for_each_connected_output(display, data->output) {
+		for_each_crtc(&data->display, crtc) {
+			if (!igt_crtc_connector_valid(crtc, data->output))
+				continue;
 
-		igt_output_set_crtc(data->output,
-				    crtc);
-		if (!intel_pipe_output_combo_valid(display))
-			continue;
+			data->crtc = crtc;
+			igt_display_reset(display);
 
-		test_init(data);
+			igt_output_set_crtc(data->output,
+					    crtc);
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
 
-		if (data->linear_modifier)
-			data->modifier = DRM_FORMAT_MOD_LINEAR;
-		else
-			data->modifier = default_modifier(data);
-
-		igt_require(igt_format_mods_has_modifier(&data->plane->format_mods_async,
-							 data->modifier));
-
-		igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
-			      data->output->name) {
-			/*
-			 * FIXME: joiner+async flip is busted currently in KMD.
-			 * Remove this check once the issues are fixed in KMD.
-			 */
-			igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
-				      "Skipping, async flip not supported on joiner mode\n");
-			test_init_fbs(data);
-			test(data);
+			test_init(data);
+
+			if (data->linear_modifier)
+				data->modifier = DRM_FORMAT_MOD_LINEAR;
+			else
+				data->modifier = default_modifier(data);
+
+			igt_require(igt_format_mods_has_modifier(&data->plane->format_mods_async,
+								 data->modifier));
+
+			igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
+				      data->output->name) {
+				/*
+				 * FIXME: joiner+async flip is busted currently in KMD.
+				 * Remove this check once the issues are fixed in KMD.
+				 */
+				igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
+					      "Skipping, async flip not supported on joiner mode\n");
+				test_init_fbs(data);
+				test(data);
+			}
+			/* Restrict to single pipe in simulation */
+			if (data->single_pipe)
+				return;
 		}
-		/* Restrict to single pipe in simulation */
-		if (data->single_pipe)
-			break;
 	}
 }
 
-- 
2.45.2

