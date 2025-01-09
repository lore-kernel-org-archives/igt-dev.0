Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E99E1E77197
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 05:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7BD710E2C1;
	Thu,  9 Jan 2025 05:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TfG790gp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3778110E2C1
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 05:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736402229; x=1767938229;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JAJ4GhsOvSwDyAf3qa4S9vZpfieXDgUkXMT71MYwEqs=;
 b=TfG790gpFL1bqrA8D5phmj/CGe3vH6Df86PUMiNNof3Al+EXAh2p8Q+s
 A4s28ghknOpsSahcWP6S9+zptjGMuMuJJ/sJ3qNOuB1ssInrUVL+xOv+R
 TpL8Jj7KLfBjySxPDeTgfM1D+JNRMFH1i0yfR2n9rtgdn8HdNIDXuMIWs
 AsVqnoR9i49bxTwx+B26Aq4dWeCid8D4A2dfxUnObmAyFZ28AimVhb4iZ
 Le3lP6Z+R4cafJdtNV/CGpI+Q3geHpNTqhwfKvaXdwKp6whFt6V1jkxw3
 LQKZfrGLwzZRGcudw+zC9xYpFZAvPSFMDnJlbGTvUny8fMEd87UKvkIgL Q==;
X-CSE-ConnectionGUID: cIxxni6vTpiqyTKpXtQIMA==
X-CSE-MsgGUID: kBdAnGkRQVarvoHWuTQ9Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="35934555"
X-IronPort-AV: E=Sophos;i="6.12,300,1728975600"; d="scan'208";a="35934555"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2025 21:57:08 -0800
X-CSE-ConnectionGUID: K6mYeicXSKajgDRf4qQNzg==
X-CSE-MsgGUID: mT8W6jQMSJSh4j8g4HpknQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="104178328"
Received: from lnl-rocket-lake-client-platform.iind.intel.com (HELO
 lnl-Tiger-Lake-Client-Platform.iind.intel.com) ([10.145.169.162])
 by orviesa008.jf.intel.com with ESMTP; 08 Jan 2025 21:57:07 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v3 1/2] tests/intel/kms_frontbuffer_tracking: Add skip
 condition for bmg platform
Date: Thu,  9 Jan 2025 11:26:51 +0530
Message-ID: <20250109055652.405793-1-mohammed.thasleem@intel.com>
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

FBC test isn't supported on bmg, skip the test on this platform.

v2: Add workaround id: Wa_16023588340. (Swati)
v3: Add workaround id in code.

Signed-off-by: Mohammed Thasleem <mohammed.thasleem@intel.com>
---
 tests/intel/kms_frontbuffer_tracking.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/intel/kms_frontbuffer_tracking.c b/tests/intel/kms_frontbuffer_tracking.c
index e41ee0a80..2d47194dd 100644
--- a/tests/intel/kms_frontbuffer_tracking.c
+++ b/tests/intel/kms_frontbuffer_tracking.c
@@ -2756,6 +2756,10 @@ static void prepare_subtest_data(const struct test_mode *t,
 
 static void prepare_subtest_screens(const struct test_mode *t)
 {
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
+		      "FBC isn't supported on BMG\n");
+
 	if (t->pipes == PIPE_DUAL)
 		enable_both_screens_and_wait(t);
 	else
@@ -2800,6 +2804,10 @@ static void prepare_subtest(const struct test_mode *t,
  */
 static void rte_subtest(const struct test_mode *t)
 {
+	/* FBC disabled: Wa_16023588340 */
+	igt_skip_on_f((IS_BATTLEMAGE(drm.devid) && t->feature == FEATURE_FBC),
+		      "FBC isn't supported on BMG\n");
+
 	prepare_subtest_data(t, NULL);
 
 	unset_all_crtcs();
@@ -4285,6 +4293,10 @@ igt_main_args("", long_options, help_str, opt_handler, NULL)
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
2.43.0

