Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE4E606A31C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 04:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UAgGPaJX
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9D6710E06D;
	Mon, 16 Nov 2026 04:02:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243A210E06D
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 04:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794801662; x=1826337662;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xZPSwi0cpTN2B+aKhdIinx0TXUqcgmXCBenIYRL+4MU=;
 b=UAgGPaJXN5FmZYm07eGrfOhCPd59i4aB+E9TbUuR0L5r7bsWPM4jDAIP
 M5jiEbKhbQE0Io0KzmKwt1KgnP09a5Z1OhKxlU54P9UUlK79QN6S/l/FN
 RRA0Qo2XGp/VEduaMi/RIkIoDwXCEimBCFyCwMKmvBj8L+9xN8QLDMO0M
 r66bGLGk9/cIJFV506F2dvbE7MVvbypEaPcd3JKAlx3KLYRb82bknQlfy
 aAwH+rBEei6sWi5a57+i9s6KztwAXrzSOmkQ8B9ogyCINMBua33cFgM7g
 vJFiPS5OKdMakaOA6rxGbarDxpZ7loas24oqgs12XHQ6MgYA2mWwlWNK1 g==;
X-CSE-ConnectionGUID: Qn0qp6x0RI6Nlg0/cgHGZg==
X-CSE-MsgGUID: WgN0Cp9RQh2H5trcb6Gf1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3402216"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3402216"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 20:01:01 -0800
X-CSE-ConnectionGUID: 5h2y7xkHT8+98GhNFN9ZaA==
X-CSE-MsgGUID: /+BB+xwEQOKL6S9HjPWYEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9979339"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Nov 2026 20:01:00 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to first and
 last CRTC
Date: Mon, 16 Nov 2026 09:31:20 +0530
Message-ID: <20261116040120.3197381-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Running on every CRTC makes the test hit the timeout on simulation.
Restrict it to the first and last usable CRTC when running in
simulation, which keeps coverage while avoiding the timeout.

v2:
 - Test the first and last usable CRTC instead of the first 2 pipes, and
   drop SIM_MAX_PIPES.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_cursor.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 4b69f1a17..982505575 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -327,8 +327,37 @@ int igt_main()
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe_f("%s", tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
+			igt_crtc_t *first_crtc = NULL, *last_crtc = NULL;
+
+			/*
+			 * In simulation, only test the first and last usable
+			 * CRTC to avoid timeouts while keeping coverage.
+			 */
+			if (igt_run_in_simulation()) {
+				for_each_crtc_with_single_output(&data.display,
+								 crtc, output) {
+					if ((tests[i].flags & TEST_OVERLAY) &&
+					    !igt_crtc_get_plane_type(crtc,
+								     DRM_PLANE_TYPE_OVERLAY))
+						continue;
+
+					igt_display_reset(display);
+					igt_output_set_crtc(output, crtc);
+					if (!intel_pipe_output_combo_valid(display))
+						continue;
+
+					if (!first_crtc)
+						first_crtc = crtc;
+					last_crtc = crtc;
+				}
+			}
+
 			for_each_crtc_with_single_output(&data.display, crtc,
 							 output) {
+				if (igt_run_in_simulation() &&
+				    crtc != first_crtc && crtc != last_crtc)
+					continue;
+
 				if ((tests[i].flags & TEST_OVERLAY) &&
 				    !igt_crtc_get_plane_type(crtc,
 							     DRM_PLANE_TYPE_OVERLAY))
-- 
2.43.0

