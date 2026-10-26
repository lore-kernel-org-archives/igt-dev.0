Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1533F606A31A
	for <igt-dev@archiver.kernel.org>; Mon, 26 Oct 2026 09:46:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IqrdHAsh
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF9D610ED36;
	Mon, 26 Oct 2026 09:46:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2917E10ED5D
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Oct 2026 09:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793007910; x=1824543910;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3pRRY0OBfyUZq8bDNs9qnNdGuwscP27fAMgwS0wDkVo=;
 b=IqrdHAshVAkQIPypxANQYpW7vgSauFOdR1GGcDy1exRbHIwvesbn5sTW
 Qd8edrH7l/hoQX2qZ+4PNNhh6CCZZIELvMCk3yQDqCwzouIgnOfK3VOYY
 M8GagrMNsfwuOZlSSXGDQiNzEClOh0j469nt/YCeLnH84tm6SEOSGZWoE
 ezhnrTsweRRhOajeO+gn1dlDoKvxqBoNaaLFYAIEw+CSh7Py+2vuYv0Rb
 lLIgdbLozLFIxfkftjFVJ69svqhysKvfpKzjokOZkBUc9PfN0xiYBAOBb
 Nr+7wkxdGpmhnwzVxB30Rcp4LYfdRyhazHg0euVQkuI4sNzWIs3ukz/V3 Q==;
X-CSE-ConnectionGUID: lo94iGy6RbinSjRwGWIinA==
X-CSE-MsgGUID: 2GMSYJ7sRQOAc+cXAppz4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1564479"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1564479"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:45:09 -0700
X-CSE-ConnectionGUID: QK9FwOazRdSgCSJeiAGmmw==
X-CSE-MsgGUID: MxMRtekgQmyt1dCvABQ/rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4169262"
Received: from linux-panther-lake-client-platform.iind.intel.com (HELO
 jeevan-X299-AORUS-Gaming-3-Pro.iind.intel.com) ([10.190.238.87])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 02:45:09 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Jeevan B <jeevan.b@intel.com>
Subject: [PATCH] tests/kms_cursor_legacy: reduce CI debug output
Date: Mon, 26 Oct 2026 15:15:21 +0530
Message-ID: <20261026094521.1410518-1-jeevan.b@intel.com>
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reduce CI output to avoid exceeding the runner's per-test limit.

Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16960
Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/16961
Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/kms_cursor_legacy.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
index 62339855e..9c6b63cbd 100644
--- a/tests/kms_cursor_legacy.c
+++ b/tests/kms_cursor_legacy.c
@@ -1888,7 +1888,8 @@ int igt_main()
 	};
 
 	igt_fixture() {
-		unsigned int debug_mask_if_ci = DRM_UT_KMS;
+		/* KMS debug logs can exceed the CI per-test output limit here. */
+		unsigned int debug_mask_if_ci = 0;
 		display.drm_fd = drm_open_driver_master(DRIVER_ANY);
 		kmstest_set_vt_graphics_mode();
 
-- 
2.43.0

