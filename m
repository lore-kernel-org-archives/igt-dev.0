Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3949FE77188
	for <igt-dev@archiver.kernel.org>; Wed,  8 Jan 2025 20:38:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF6F910E442;
	Wed,  8 Jan 2025 20:38:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QgOpOh+1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA2C210E442
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Jan 2025 20:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736368734; x=1767904734;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cMTru1mgUq9MKTQjiJVEilYwck4Rh0L21K26ThR3DYM=;
 b=QgOpOh+14F1cBkwtQGyR/EhCGSzSrF8Qz6xyO9v8VSJ3j7hyH/73BC02
 NT5J8qiRhiIOdXsVc3S8vU6aRqE+lKW0Ha5MvvX/ZCbi+ztLhhHP6OKEx
 A+7bIOe4rpO85OiUJlxbvtEc423Kjga2tinaO75XcE1JVZgtQn9u3FuXN
 rwNi7y1++to+gz4ZJRPv3R1RTdQk4v2DAlmHCGjkpBc2PYgRlcqDQnvyy
 rXa4ro9onl5X/TulA9K4hy3hui+w1PtgCwdU8PzVTtTux5M0bMmj+mHJj
 nvWasPkURzqtewP2xY9anJGk6nMfPEIDKZeQzhnuHtXKC+3g6z0z5DY92 g==;
X-CSE-ConnectionGUID: hwVpj1aOSd+/xIHpNcWENQ==
X-CSE-MsgGUID: swIDril4QBCWHkjvuZif9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35838602"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="35838602"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 12:38:54 -0800
X-CSE-ConnectionGUID: VRhbkBUWT4SEHrSGlgrSpw==
X-CSE-MsgGUID: wPbR4sP/RJ+WY6zbNZa5YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; d="scan'208";a="103007951"
Received: from unknown (HELO linux-System-Product-Name.iind.intel.com)
 ([10.190.239.15])
 by fmviesa006.fm.intel.com with ESMTP; 08 Jan 2025 12:38:53 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH i-g-t 1/2] tests/intel/kms_frontbuffer_tracking: Add skip
 condition for bmg platform
Date: Thu,  9 Jan 2025 02:09:18 +0530
Message-Id: <20250108203919.120910-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
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

FBC test isn't supported on bmg, skip the test on this platform.

v2: Add workaround id: Wa_16023588340. (Swati)
v3: Add workaround id in code.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index 3d833864a..21bbaf61e 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2755,6 +2755,10 @@ static void prepare_subtest_data(const struct test_mode *t,
 
 static void prepare_subtest_screens(const struct test_mode *t)
 {
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
+		      "FBC isn't supported on BMG\n");
+
 	if (t->pipes == PIPE_DUAL)
 		enable_both_screens_and_wait(t);
 	else
@@ -2799,6 +2803,10 @@ static void prepare_subtest(const struct test_mode *t,
  */
 static void rte_subtest(const struct test_mode *t)
 {
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
+		      "FBC isn't supported on BMG\n");
+
 	prepare_subtest_data(t, NULL);
 
 	unset_all_crtcs();
@@ -4294,6 +4302,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
 			t.flip = -1;
 			t.tiling = opt.tiling;
 
+			/* FBC disabled: Wa_16023588340 */
+			igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t.feature == FEATURE_FBC),
+				      "FBC isn't supported on BMG\n");
+
 			for_each_pipe(&drm.display, pipe) {
 				if (pipe == default_pipe) {
 					igt_info("pipe-%s: FBC validated in other subtest\n", kmstest_pipe_name(pipe));
-- 
2.34.1

