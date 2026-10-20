Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 665B3606A31D
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 14:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iN92OfSZ
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C54D10EA1D;
	Tue, 20 Oct 2026 14:39:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58D5310EA1D
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 14:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792507121; x=1824043121;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ontWU2LV3H580jpLscrHABk3YXcy2SmkQenQtNuuV/A=;
 b=iN92OfSZ31W3MlBwysGLzot2O0wfehARwUQ+0E1ooRJ9hWy/1Yyfx+2c
 LLJoh77qb48IbdsBUFGvmbujWNYfNgAakTFflUR7wiShJfX3PFZa36DfX
 MiPBzeuFcs0rfT8skgEuOQrNk2KlfV8rU9N6C9riE41E613+Z1OpF2Edh
 zBUvZo3PeCOwvTC5Taaea8UNQj+6eL4Iiru95DxWo9mIHHsqM+u3EPnK0
 XHokjXSKpi+10mqvhR3JRGBb95E5+FkyJW7wrSoplsPyDU+q85Ho1H6c0
 fj6z7lhQMpeBDzIpNO8/ZZP40GZR7axwgXoZEv0oZt4c7S4jVsJ3nPdIz g==;
X-CSE-ConnectionGUID: LABPgjoMSEeRS4VARXOrKA==
X-CSE-MsgGUID: EGgqJfYlTg+O1uhLyZchkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1210385"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1210385"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:38:41 -0700
X-CSE-ConnectionGUID: 5MbgSuSQQGezbR6PjhDm5w==
X-CSE-MsgGUID: +9lt2dcwQJOEmKTImUyzZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="2892599"
Received: from pranay-x299-aorus-gaming-3-pro.iind.intel.com ([10.223.74.54])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 07:38:40 -0700
From: Pranay Samala <pranay.samala@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: karthik.b.s@intel.com, sameer.lattannavar@intel.com,
 pranay.samala@intel.com
Subject: [PATCH i-g-t] tests/intel/kms_frontbuffer_tracking: Use small modes
 on simulation
Date: Tue, 20 Oct 2026 20:08:30 +0530
Message-ID: <20261020143830.772865-1-pranay.samala@intel.com>
X-Mailer: git-send-email 2.53.0
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

Due to slowness of drawing on simulation, use the connector's
smallest mode and draw only one rect in draw subtests when
running on simulation.

Signed-off-by: Pranay Samala <pranay.samala@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 8d5afdac2..3f345f644 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2997,7 +2997,7 @@ static bool op_disables_psr(const struct test_mode *t,
  */
 static void draw_subtest(const struct test_mode *t)
 {
-	int r;
+	int r, n_rects;
 	int assertions = 0;
 	struct draw_pattern_info *pattern;
 	struct modeset_params *params = pick_params(t);
@@ -3043,7 +3043,9 @@ static void draw_subtest(const struct test_mode *t)
 	prepare_subtest(t, pattern);
 	target = pick_target(t, params);
 
-	for (r = 0; r < pattern->n_rects; r++) {
+	n_rects = in_simulation ? 1 : pattern->n_rects;
+
+	for (r = 0; r < n_rects; r++) {
 		igt_debug("Drawing rect %d\n", r);
 		draw_rect(pattern, target, t->method, r);
 		update_wanted_crc(t, &pattern->crcs[t->format][r]);
@@ -4373,8 +4375,12 @@ int igt_main_args("", long_options, help_str, opt_handler, NULL)
 		if (opt.tiling == TILING_AUTOSELECT)
 			opt.tiling = drm.display_ver >= 30 ? TILING_4 : TILING_X;
 
-		setup_environment();
+		/* Full-size modes are too slow on simulation, use the smallest mode. */
 		in_simulation = igt_run_in_simulation();
+		if (in_simulation)
+			opt.small_modes = true;
+
+		setup_environment();
 	}
 
 	for (t.feature = 0; t.feature < FEATURE_COUNT; t.feature++) {
-- 
2.53.0

