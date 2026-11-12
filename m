Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFEF606A31C
	for <igt-dev@archiver.kernel.org>; Thu, 12 Nov 2026 04:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jiag/rCs
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68F810E0F2;
	Thu, 12 Nov 2026 04:19:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AFD10E0F2
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Nov 2026 04:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794457128; x=1825993128;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OQn3fqsAiA1CMCq22Iz9lP3ibBdpCBxP0YMRRgh5RLY=;
 b=jiag/rCstVRi5FcS0TOek6q9oqDcgpusOcmzpY/4ZO7IDBwSxR/rWE2I
 Qo/D+4/eh+pPyBYI5QFXDfqNAvjDpnG6is5afu/SnJbl0dSckimQPhnSw
 PZ6PGEfQzdNfb928CulYtiLM9rP0nTQemF4Gadzeil4BtgwfVQ0TB8T76
 SaiNAzh2wb1EmPFSIVG1Q4GDpbGKeSsXcxisqYSzU6hahTaLubZKcxgep
 fhK6sWB06OC+1X36rIBz+pVEyBCIDCsnY9G9Tkk7R6TcU3EAG+4JADm4n
 EJL3nSY4URTg6bcIb6aHoO5XrlknJFWcYaWnJ1tR51cQsHaGN9wukpDcJ A==;
X-CSE-ConnectionGUID: zaedg3pGT5e1151sGkC0eg==
X-CSE-MsgGUID: TyCiZDmfQQGbl2GBhYTPiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3095920"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3095920"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 20:18:47 -0800
X-CSE-ConnectionGUID: oLFXIf8lS7qC4On8AseAdQ==
X-CSE-MsgGUID: hqzF0oEbQkKUBKoh5KnUuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8604634"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2026 20:18:46 -0800
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com,
	Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] tests/kms_plane_cursor: limit simulation to 2 pipes
Date: Thu, 12 Nov 2026 09:49:07 +0530
Message-ID: <20261112041907.2876691-1-jeevan.b@intel.com>
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

Running on every pipe makes the test hit the timeout on simulation.
Restrict it to 2 pipes when running in simulation.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_plane_cursor.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
index 4b69f1a17..5938b50c1 100644
--- a/tests/kms_plane_cursor.c
+++ b/tests/kms_plane_cursor.c
@@ -68,6 +68,9 @@ typedef struct {
 	int h;
 } rect_t;
 
+/* Max pipes to test on simulation, to avoid timeouts */
+#define SIM_MAX_PIPES 2
+
 /* Common test data. */
 typedef struct data {
 	igt_display_t display;
@@ -327,8 +330,14 @@ int igt_main()
 	for (i = 0; i < ARRAY_SIZE(tests); i++) {
 		igt_describe_f("%s", tests[i].desc);
 		igt_subtest_with_dynamic_f("%s", tests[i].name) {
+			int pipes_tested = 0;
+
 			for_each_crtc_with_single_output(&data.display, crtc,
 							 output) {
+				if (igt_run_in_simulation() &&
+				    pipes_tested >= SIM_MAX_PIPES)
+					break;
+
 				if ((tests[i].flags & TEST_OVERLAY) &&
 				    !igt_crtc_get_plane_type(crtc,
 							     DRM_PLANE_TYPE_OVERLAY))
@@ -361,6 +370,7 @@ int igt_main()
 				}
 
 				test_fini(&data);
+				pipes_tested++;
 			}
 		}
 	}
-- 
2.43.0

