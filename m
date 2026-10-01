Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88175CA5FC5
	for <igt-dev@archiver.kernel.org>; Thu,  1 Oct 2026 07:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31BE410F59D;
	Thu,  1 Oct 2026 07:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EkQOm+he";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4314110F59E
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Oct 2026 07:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790838997; x=1822374997;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iX9Ltc163VUGBsouXuSr3nlIEcN11J0viubJLvmwUYI=;
 b=EkQOm+heq0QJ9517orIxO3aHmz+jj8R2daYYKAHe9v10l+j2Ti1MY+MK
 e8pO+zPFk2kRrcPbseqUW8IBnVwxd5GN5t1TpYp90Su4sRZioeDu/TiBJ
 EJGSomBKieeMLL26iEJfwPwIJpUTAWMtJGrNfVcl38dJeJPbiowx41e3D
 En8DZDu48lX5krLz4Ok+3HZCQIqySK7NmP46hZzA6XAMxHYDKjriaKj3R
 o4zkTCBXvOrkQd5F5HwK1hM4TqdDUEQPeYN73yshITUL6n5ooS6YEwkgp
 o40BQs53Ndo60ALMKWV4HN+7cwRiMiXVd2Lzyxl/3iExxE64Xg5j2PGIg A==;
X-CSE-ConnectionGUID: He8+aw6LQwiwSquIAU/apw==
X-CSE-MsgGUID: fZ9sjZG7QXS6aWErG5ILuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11921"; a="91605988"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="91605988"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2026 00:15:48 -0700
X-CSE-ConnectionGUID: 0yrI61eaRFWonGRj0brXyg==
X-CSE-MsgGUID: md2rmRB+T/6UmMZe+wVVFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; d="scan'208";a="279138314"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by ORVIESA003-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 00:15:48 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 04/13] tests/intel/kms_dp_link_training: detect links
 that failed training
Date: Thu,  1 Oct 2026 13:06:54 +0530
Message-Id: <20261001073703.5067-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261001073703.5067-1-kunal1.joshi@intel.com>
References: <20261001073703.5067-1-kunal1.joshi@intel.com>
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

The current link rate in debugfs is what the driver asked for, not what
the link ended up running at, so a failed link still passes. Nor does
link-status catch it. With both rate and lane count forced, there's
nothing to fall back to, so the driver just disables retraining, and
leaves link-status GOOD.

Check i915_dp_link_retrain_disabled after training. The driver's own
retrain may still be in flight, so keep checking for five seconds
before calling it a pass.

Drop the FIXME. Note that this may start failing links whose max config
never actually trained.

v2:
- Sleep before reading, not after (Sowmiya)
- Rename to assert_link_retrain_not_disabled() (Sowmiya)

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 59 +++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 595d78d98..8d079ffb0 100644
--- a/tests/intel/kms_dp_link_training.c
+++ b/tests/intel/kms_dp_link_training.c
@@ -29,6 +29,13 @@
 
 #define RETRAIN_COUNT	1
 
+/*
+ * How long the driver's link recovery is given to reach a verdict, in seconds.
+ * The automatic retrain is queued without a delay, so this only has to cover
+ * one retrain and the fallback selection that follows it.
+ */
+#define LINK_RECOVERY_TIMEOUT	5.0
+
 typedef struct {
 	int drm_fd;
 	uint32_t devid;
@@ -99,9 +106,48 @@ static void assert_link_status_good(data_t *data, bool mst)
 	}
 }
 
+/*
+ * assert_link_retrain_not_disabled - Let the driver's link recovery reach a
+ * verdict and check it did not give up on the link.
+ *
+ * A failed training is not visible the moment the forced retrain flag clears:
+ * the driver clears that flag when the retrain modeset starts and only then
+ * queues its automatic retrain, so the first failure is still in flight. Once
+ * the automatic retrain is used up the driver looks for a configuration to
+ * fall back to, and with both the rate and the lane count forced there is
+ * none. It then marks retraining disabled, which is the one place a link that
+ * failed for good becomes visible.
+ *
+ * Poll for that verdict rather than reading it once, and give recovery the
+ * full timeout to reach it before calling the link trained: sleep before each
+ * read rather than after it, so that the last read is taken once the whole
+ * timeout has elapsed rather than one poll interval short of it.
+ */
+static void assert_link_retrain_not_disabled(data_t *data,
+					     const struct i915_dp_link_config *config)
+{
+	struct timespec start, now;
+	double elapsed;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+
+	do {
+		usleep(200 * 1000);
+
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		elapsed = (now.tv_sec - start.tv_sec) +
+			(now.tv_nsec - start.tv_nsec) / 1e9;
+
+		igt_assert_f(!i915_dp_get_link_retrain_disabled(data->drm_fd,
+								data->output),
+			     "Link training at %d lanes, rate %d was given up on.\n",
+			     config->lane_count, config->link_rate);
+	} while (elapsed < LINK_RECOVERY_TIMEOUT);
+}
+
 /*
  * train_link_config - Force one link configuration, re-establish the link and
- * check that the configuration took effect.
+ * check that the configuration took effect and survived training.
  */
 static void train_link_config(data_t *data, bool mst,
 			      const struct i915_dp_link_config *config)
@@ -127,6 +173,16 @@ static void train_link_config(data_t *data, bool mst,
 	igt_info("Current link rate is %d\n", current_link_rate);
 	igt_assert_f(current_link_rate == config->link_rate,
 		     "Link training did not succeed at the forced link rate.\n");
+
+	/*
+	 * The link parameters read back above are the ones the driver asked
+	 * the sink for, not the ones the link ended up running at, so ask the
+	 * driver whether it gave up on the link after training it.
+	 *
+	 * This has to happen before the next force: forcing a rate or a lane
+	 * count resets the recovery state, which would mask the failure.
+	 */
+	assert_link_retrain_not_disabled(data, config);
 }
 
 /*
@@ -222,7 +278,6 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 						   1.0, 20.0), 0);
 	assert_link_status_good(data, mst);
 
-	/* FIXME : Driver may lie max link rate or max lane count */
 	/* Read max_link_rate and max_lane_count */
 	config.link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
 	config.lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
-- 
2.25.1

