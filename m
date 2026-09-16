Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA085C88E5C
	for <igt-dev@archiver.kernel.org>; Wed, 16 Sep 2026 04:29:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A3AB10E0B0;
	Wed, 16 Sep 2026 04:29:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c5kzr8HQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB29110E03E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Sep 2026 04:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789532797; x=1821068797;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vfnO+aKHiA/CsF2BtyT4r2J9aMCKpxbJLbBhRnoSKcY=;
 b=c5kzr8HQfT71uZuwan8lu8MmnzGlJszC/uiK6NTIXXIiQdVppvJJgbXn
 Vv3XLWuuzMMdwgdsKzijALuMaGT7I5pXpAqfhH9gqrrL4yhphommfeOiP
 /aljamUwk71qP6DFP9qUr6rdJfOpPo67NhtacwERBSPAgkwNA56F58164
 wMaJsRF3YiGiefXi8mAsDNKJNnA+YBnXWRvLO9yaXwJta9pWHg5VEf7mc
 7ztKXOjMPl/cIOi0++1hFz75HD70fR+IXFgSuQ9TlD8bhP7W3veyuT5BU
 T3r8Di+r9O3IFPVRNfHRtZ7OBRaJvKpaHPkDekuh+UBaF0OA7eIUaIb8g Q==;
X-CSE-ConnectionGUID: +4Vfhs0wT1KSqx9cfH+hQQ==
X-CSE-MsgGUID: yPJ6Hcb3R7abikfoKzzevw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="100503242"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="100503242"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2026 21:26:37 -0700
X-CSE-ConnectionGUID: TDF2ukCeT6+lo8fFYzez9A==
X-CSE-MsgGUID: gq/WIgX4QDmd/L0RkVh7gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="271765037"
Received: from kunal-x299-aorus-gaming-3-pro.iind.intel.com ([10.190.239.13])
 by orviesa010-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2026 21:26:37 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Kunal Joshi <kunal1.joshi@intel.com>
Subject: [PATCH i-g-t 04/13] tests/intel/kms_dp_link_training: Check the
 config survived training
Date: Wed, 16 Sep 2026 10:17:52 +0530
Message-Id: <20260916044801.1279102-5-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260916044801.1279102-1-kunal1.joshi@intel.com>
References: <20260916044801.1279102-1-kunal1.joshi@intel.com>
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

The test asserts that the current link rate equals the rate it forced.
Both values come from the same debugfs file, which the kernel prints
from intel_dp->link_rate, the rate the driver asked the sink for, not
the rate the link ended up running at. A link that failed training and
fell back still reads back the forced value, so the assertion passes on
a link that never trained. The FIXME in the test says as much.

link-status does not close the gap either. With both the rate and the
lane count forced there is nothing to fall back to, so the driver never
reaches intel_dp_queue_modeset_retry_for_link() and link-status stays
GOOD on a link that failed for good. What it does instead is mark
retraining disabled, which i915_dp_link_retrain_disabled exposes. Assert
on that.

Wait for the verdict rather than reading it once. The driver clears the
forced retrain flag when the retrain modeset starts and only then queues
its automatic retrain, so when the test's poll for the flag completes
the first failure is still in flight. Recovery ends either with a
trained link or with retraining disabled, so poll for the whole recovery
timeout before calling the link trained.

Read the state before the next force: forcing a rate or a lane count
runs intel_dp_reset_link_params(), which resets the recovery state and
would mask the failure.

Drop the FIXME.

Note this can newly fail a link whose advertised maximum never trained.
That is the bug the FIXME was placed for.

Assisted-by: GitHub_Copilot:claude-opus-5
Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
---
 tests/intel/kms_dp_link_training.c | 57 ++++++++++++++++++++++++++++--
 1 file changed, 55 insertions(+), 2 deletions(-)

diff --git a/tests/intel/kms_dp_link_training.c b/tests/intel/kms_dp_link_training.c
index 595d78d98..b2d686f28 100644
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
@@ -99,9 +106,46 @@ static void assert_link_status_good(data_t *data, bool mst)
 	}
 }
 
+/*
+ * assert_link_recovery_idle - Let the driver's link recovery reach a verdict
+ * and check it had nothing to recover.
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
+ * full timeout to reach it before calling the link trained.
+ */
+static void assert_link_recovery_idle(data_t *data,
+				      const struct i915_dp_link_config *config)
+{
+	struct timespec start, now;
+	double elapsed;
+
+	clock_gettime(CLOCK_MONOTONIC, &start);
+
+	do {
+		igt_assert_f(!i915_dp_get_link_retrain_disabled(data->drm_fd,
+								data->output),
+			     "Link training at %d lanes, rate %d was given up on.\n",
+			     config->lane_count, config->link_rate);
+
+		usleep(200 * 1000);
+
+		clock_gettime(CLOCK_MONOTONIC, &now);
+		elapsed = (now.tv_sec - start.tv_sec) +
+			(now.tv_nsec - start.tv_nsec) / 1e9;
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
@@ -127,6 +171,16 @@ static void train_link_config(data_t *data, bool mst,
 	igt_info("Current link rate is %d\n", current_link_rate);
 	igt_assert_f(current_link_rate == config->link_rate,
 		     "Link training did not succeed at the forced link rate.\n");
+
+	/*
+	 * The link parameters read back above are the ones the driver asked
+	 * the sink for, not the ones the link ended up running at, so ask the
+	 * driver whether it had to recover the link after training it.
+	 *
+	 * This has to happen before the next force: forcing a rate or a lane
+	 * count resets the recovery state, which would mask the failure.
+	 */
+	assert_link_recovery_idle(data, config);
 }
 
 /*
@@ -222,7 +276,6 @@ static bool run_link_rate_test(data_t *data, bool mst, bool uhbr)
 						   1.0, 20.0), 0);
 	assert_link_status_good(data, mst);
 
-	/* FIXME : Driver may lie max link rate or max lane count */
 	/* Read max_link_rate and max_lane_count */
 	config.link_rate = i915_dp_get_max_link_rate(data->drm_fd, data->output);
 	config.lane_count = i915_dp_get_max_lane_count(data->drm_fd, data->output);
-- 
2.25.1

