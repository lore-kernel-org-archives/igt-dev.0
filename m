Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01293606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 15:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QTnOE6pV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86C510E52F;
	Tue, 17 Nov 2026 15:22:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4953F10E622
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794928436; x=1826464436;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fFb4Q/JXjLISz/l6NGgDVmYLnDCdBeREGdudYqIHB1Q=;
 b=QTnOE6pVBmZIQ6B8WAfrj7zEfmv4/cV13RZeGx5jWwFPKqTPLrWzwqlV
 PFsdhG8V8XjwcacM08I+vWwrDsFKs8rhEmecu5QeXK+U8UaONEw1h8SeC
 jKP18qr8zqbswh6tJJqFpCmRpAuf1kb2JlH5lmytiICist7ll7XlGSphy
 1DNfZqDpYSDD1GMWu5y5AwqCCe+bcg17ximSXtn+69h9PfBgQAuYsjY1F
 jrjpx8OvV43vD5z07MKN9FCDnrxvsdUlrOMgmHAAW4RP73KfncWh23OEA
 jUXIUsptUyaqzq0iAaNrPFZYqCcsxGiJLfv7YfsuMGw2wB6wk/8fQ3MBx g==;
X-CSE-ConnectionGUID: 7SftDW9kRSaP/iFu/Mkp5g==
X-CSE-MsgGUID: Zqw8TVCFTkunu73usovckA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3568803"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3568803"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:13:56 -0800
X-CSE-ConnectionGUID: KSWOgVvjTvGTgiIL4kAlPQ==
X-CSE-MsgGUID: ZEzfpztuS4K9i46G49zUKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9724578"
Received: from dev-417.igk.intel.com ([10.91.214.181])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2026 07:13:55 -0800
From: =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Karthik B S <karthik.b.s@intel.com>,
 Swati Sharma <swati2.sharma@intel.com>,
 =?UTF-8?q?Juha-Pekka=20Heikkil=C3=A4?= <juhapekka.heikkila@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Grzelak?= <michal.grzelak@linux.intel.com>
Subject: [PATCH i-g-t v10 5/9] tests/intel/kms_ccs: split outer test loop into
 two
Date: Tue, 17 Nov 2026 16:13:22 +0100
Message-ID: <20261117151326.2074274-6-michal.grzelak@linux.intel.com>
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

for_each_crtc_with_valid_output() iterates over every crtc with
connected output. Split it into two loops. This is needed to handle per
output and per crtc cases.

v4->v5
- fix indentation (Thasleem)

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
---
 tests/intel/kms_ccs.c | 58 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
index 4d0bda6a78..1a922792c5 100644
--- a/tests/intel/kms_ccs.c
+++ b/tests/intel/kms_ccs.c
@@ -1152,47 +1152,47 @@ static void test_output(data_t *data, const int testnum)
 					      "Older than Xe2 platform needed.\n");
 			}
 
-			for_each_crtc_with_valid_output(&data->display, crtc,
-							data->output) {
-				data->crtc = crtc;
-				igt_display_reset(&data->display);
+			for_each_connected_output(&data->display, data->output) {
+				for_each_crtc(&data->display, crtc) {
+					if (!igt_crtc_connector_valid(crtc, data->output))
+						continue;
 
-				igt_output_set_crtc(data->output,
-						    crtc);
-				if (!intel_pipe_output_combo_valid(&data->display))
-					continue;
+					data->crtc = crtc;
+					igt_display_reset(&data->display);
 
-				igt_dynamic_f("pipe-%s-%s",
-							    igt_crtc_name(crtc),
-							    data->output->name) {
-					int valid_tests = 0;
+					igt_output_set_crtc(data->output, crtc);
+					if (!intel_pipe_output_combo_valid(&data->display))
+						continue;
 
-					if (data->flags == TEST_RANDOM)
-						igt_info("Testing with seed %d\n", data->seed);
+					igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc), data->output->name) {
+						int valid_tests = 0;
 
-					if (data->flags & TEST_ALL_PLANES) {
-						igt_display_require_output_on_crtc(crtc);
+						if (data->flags == TEST_RANDOM)
+							igt_info("Testing with seed %d\n", data->seed);
 
-						for_each_plane_on_crtc(crtc,
-								       data->plane) {
-							if (skip_plane(data, data->plane))
-								continue;
+						if (data->flags & TEST_ALL_PLANES) {
+							igt_display_require_output_on_crtc(crtc);
 
+							for_each_plane_on_crtc(crtc, data->plane) {
+								if (skip_plane(data, data->plane))
+									continue;
+
+								for (int j = 0; j < ARRAY_SIZE(formats); j++) {
+									data->format = formats[j];
+									valid_tests += test_ccs(data);
+								}
+							}
+						} else {
 							for (int j = 0; j < ARRAY_SIZE(formats); j++) {
 								data->format = formats[j];
 								valid_tests += test_ccs(data);
 							}
 						}
-					} else {
-						for (int j = 0; j < ARRAY_SIZE(formats); j++) {
-							data->format = formats[j];
-							valid_tests += test_ccs(data);
-						}
+						igt_require_f(valid_tests > 0,
+							      "no valid tests for %s on pipe %s\n",
+							      ccs_modifiers[i].str,
+							      igt_crtc_name(crtc));
 					}
-					igt_require_f(valid_tests > 0,
-						      "no valid tests for %s on pipe %s\n",
-						      ccs_modifiers[i].str,
-						      igt_crtc_name(crtc));
 				}
 			}
 		}
-- 
2.45.2

