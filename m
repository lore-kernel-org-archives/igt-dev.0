Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA198C02185
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 06:09:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68DEB10E2DB;
	Mon, 20 Jan 2025 06:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hwHyMLEU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49B8810E2DB
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 06:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737353379; x=1768889379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=g9D5DSvjKXukdpFsFP5eMy1mO3NoP91X6/24LzSmJcc=;
 b=hwHyMLEUSZUwMxHiGDGFmqhFZbWvZkVB2F2IMrHC08stG7jp6ylau5UJ
 HI2fvyxyMYKG5sNCKQQ2kwhzrKqg+lh3x13426S9hm00XIZH5e8w+Clll
 l4zwCDGpU4U4yos1/BiAg6nOAgePOsFa061kR/gk6QbLQw1FJHQNrjyhx
 +4kEgNjfdmXhMymE8Lz0Rr8w/khjmt8QGROtkWIz4OP2g3Kid+irWQ6iM
 3F94nyPtu/xu2G8Ob4Gd/ZY9IQDwoLbLb1/E/JTCCqHggsB09byS5IN4Q
 VcpdUBXk+YB/GNKQqy/4rfYbptHTRe1pUChYXHz16riTuHnwy0HYceE4c g==;
X-CSE-ConnectionGUID: jwsXDaqOTPCeH+wDqaK92Q==
X-CSE-MsgGUID: GsBsAX8iS86254jDHTLwaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="48304673"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; d="scan'208";a="48304673"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2025 22:09:38 -0800
X-CSE-ConnectionGUID: 9F8je/9LQIm/fY5Ozmnqsg==
X-CSE-MsgGUID: k/dIdXeQRfmacaIM7M9pPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107284068"
Received: from unknown (HELO linux-System-Product-Name.iind.intel.com)
 ([10.190.239.15])
 by orviesa008.jf.intel.com with ESMTP; 19 Jan 2025 22:09:38 -0800
From: Mohammed Thasleem <mohammed.thasleem@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Mohammed Thasleem <mohammed.thasleem@intel.com>
Subject: [PATCH v4 1/2] tests/intel/kms_frontbuffer_tracking: Skip fbc-* tests
 on BMG
Date: Mon, 20 Jan 2025 11:40:17 +0530
Message-Id: <20250120061017.34236-1-mohammed.thasleem@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250109055652.405793-1-mohammed.thasleem@intel.com>
References: <20250109055652.405793-1-mohammed.thasleem@intel.com>
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
v4: Updated subject. (Kamil).

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

