Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E367C606A326
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=b3Emrs4s
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D1A10E3F0;
	Fri,  6 Nov 2026 18:14:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08C9610E204
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 18:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793988544; x=1825524544;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/RNiq495J2qwnMCiEmkuRqZ4g5kn+nNnGSyhvTBpa24=;
 b=b3Emrs4s+rftC6sRCfLAvILpbpDQsN45SgBiX+WLr1wcaR4ijJ7Isi+5
 ib4pyh3jw7WVnOD/UcGLzpxBuj3wX+HOYQ+2vpB1CzJMDoYvbL2mjuJBq
 aLxf7YYb1Hc3bKAO8+A6Q/ZbwzjH9pWLNac/tEVBHW/g4VSO8ZlnsstXl
 EUSbLpXleJdcLwaIaWrltTJM7XCVis+ZP7hfi5sMkrlUrEn2IBumpbVtH
 cpW3W3B9d6e3BKU30Sxi1UAcan5FgWAUShWDGasEaCfN+TQWOU29+s+cx
 RwG82ghT8CVR/s3KVKCSZRtknwsm2a2WTCuEt8mSmkg4Y9L1b4xpGDYZU w==;
X-CSE-ConnectionGUID: hu//cc8tQDGj6yPZ+XCeDg==
X-CSE-MsgGUID: oxzmIE1eRs2MhtEZTL2SHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2723906"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2723906"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:04 -0800
X-CSE-ConnectionGUID: Lq45uvJoRKqM01SKHIbOTg==
X-CSE-MsgGUID: aU79wLuCS6ukr+ld7DYVxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7362605"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 10:09:02 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v9 1/9] tests/kms_async_flips: split outer test loop
 into two
Date: Fri,  6 Nov 2026 19:08:41 +0100
Message-ID: <20261106180849.156578-2-michal.grzelak@linux.intel.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
References: <20261106180849.156578-1-michal.grzelak@linux.intel.com>
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

