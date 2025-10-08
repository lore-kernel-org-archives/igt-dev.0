Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ACAFCCA470
	for <igt-dev@archiver.kernel.org>; Wed,  8 Oct 2025 15:25:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C865A10E843;
	Wed,  8 Oct 2025 15:25:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A1Ed5LJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0395410E843
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Oct 2025 15:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759937152; x=1791473152;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nUVk8LIiYrFYgsIC09azZvezoW9nW/NIw8875igM9J8=;
 b=A1Ed5LJKCemTaRroMAW1ENZni90yUit3afqq2K1dmdPQNTQeNxrhc2vU
 tuZPEXLD8UtFk+jJADo4ThXRhS7F2Tfs2GoZj2Ac6ergUza/9Mvs5DImG
 sDmg8yqeNt3cNvhb5LdsFHApoYP7RH8s+BtQLCYzZiDQn06SFLqtavHaB
 ua6MSPi65WuKyI7XvE4raRt/HDsFCVOLv2tJD/XF/WIqt9G5vi3zjU+Sl
 jcBwGjAwmK/4DVHrZYbDLv8Bb/jEWHXQJk6LgTAsrGU8XWGLEvroE9wjR
 sFl4SzbirrfwLwlA3FQVai6ROM2XebDADDbutD16Jn5A9Em1XpcKzDkbM w==;
X-CSE-ConnectionGUID: 5ustjqfiT9KH1FeZa1fS7Q==
X-CSE-MsgGUID: K1fj0gcxTxGHpguM8Y48HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="61337932"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="61337932"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 08:25:51 -0700
X-CSE-ConnectionGUID: gw0osEWnSxaw3Qtb+UR0Rw==
X-CSE-MsgGUID: nGFah2tGSY2yquN4KvPaMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="211119000"
Received: from jeevan-x299-aorus-gaming-3-pro.iind.intel.com ([10.227.90.91])
 by orviesa002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2025 08:25:49 -0700
From: Jeevan B <jeevan.b@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: swati2.sharma@intel.com, pranay.samala@intel.com,
 Jeevan B <jeevan.b@intel.com>
Subject: [PATCH i-g-t] kms_flip_tiling: reduce exec time for sim env
Date: Wed,  8 Oct 2025 20:55:40 +0530
Message-ID: <20251008152540.1556189-1-jeevan.b@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

For simulation environment, we can reduce execution time
by running test only with basic tiling combinations.

v2: Add helper to check basic tiling support.

Signed-off-by: Jeevan B <jeevan.b@intel.com>
---
 tests/intel/kms_flip_tiling.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/kms_flip_tiling.c b/tests/intel/kms_flip_tiling.c
index ff9ad1229..024421b58 100644
--- a/tests/intel/kms_flip_tiling.c
+++ b/tests/intel/kms_flip_tiling.c
@@ -84,6 +84,13 @@ static int try_commit(igt_display_t *display)
 				       COMMIT_ATOMIC : COMMIT_LEGACY);
 }
 
+static bool is_allowed_modifier(uint64_t mod)
+{
+	return mod == DRM_FORMAT_MOD_LINEAR ||
+	       mod == I915_FORMAT_MOD_4_TILED ||
+	       mod == I915_FORMAT_MOD_X_TILED;
+}
+
 static uint64_t pageflip_timeout_us(drmModeModeInfo *mode)
 {
 	uint64_t timeout_ns;
@@ -216,6 +223,7 @@ igt_main
 	igt_describe("Check pageflip between modifiers");
 	igt_subtest_with_dynamic("flip-change-tiling") {
 		enum pipe pipe;
+		bool run_in_simulation = igt_run_in_simulation();
 
 		for_each_pipe_with_valid_output(&data.display, pipe, output) {
 			igt_plane_t *plane;
@@ -242,6 +250,11 @@ igt_main
 					if (plane->formats[j] != data.testformat)
 						continue;
 
+					if (run_in_simulation &&
+					    (!is_allowed_modifier(plane->modifiers[i]) ||
+					     !is_allowed_modifier(plane->modifiers[j])))
+						continue;
+
 					igt_dynamic_f("pipe-%s-%s-%s-to-%s",
 						      kmstest_pipe_name(pipe),
 						      igt_output_name(output),
-- 
2.43.0

