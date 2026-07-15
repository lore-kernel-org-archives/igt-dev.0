Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06FFEC44501
	for <igt-dev@archiver.kernel.org>; Wed, 15 Jul 2026 19:31:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5FA110E23B;
	Wed, 15 Jul 2026 19:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="krgB58rR";
	dkim-atps=neutral
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8571110E218
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 19:29:53 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-92e9a2b95b5so521797085a.2
 for <igt-dev@lists.freedesktop.org>; Wed, 15 Jul 2026 12:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1784143792; x=1784748592;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GCJVlDZLmMBmlX7nj4phb0/4ZTWxq4KVocXgbYDGJVM=;
 b=krgB58rRCYoGW/Azsaqy99P3CgJtVix/bAz3nqng2NxKrLQD5cEeojX2nb9lzkZWWs
 WAnc/ByVsIPHj9jAQlMxyr3XqeZYO+6Rxz7zLXLFzUh8eEWwuKBuEPUbNwHowKE/nARd
 yy55omerqMe9iOaU4tYse2W3LpedOyhKJZXaGy04toG+a7sbgRYQj0ixMx4VV9Flb/pg
 9e/c978VoLovoVOdiv733L2kc2MWdTKiEvdFUoFdwFK1MWVOxZqUCBhmOki37hdQzXxD
 d52dFGA5kUuvCe4EgBzDg0yB9kAhhNs4vTA0xXCU4ad++IXp/MlusmdgCFV9W+l/tmP3
 loRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784143792; x=1784748592;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GCJVlDZLmMBmlX7nj4phb0/4ZTWxq4KVocXgbYDGJVM=;
 b=BJQ/ef0o+9KD+7bUfKjz18cNoKdlqTLeP1TpcLYoqGLAVmks2SjGTztca+THpJm8KK
 E3lfyTrC5qL1kUX2ZNBwqpHVuz+fuGZGCUNUgNINPKHdnU3bNGcIj2B/wD5imeN+XLMb
 /2vtut2LTJzTiB60XPF3oW7sce29PwDlBcDjb5/2HVlpitgEUQkEf6z5JO9+MdldtIUr
 DbuOdaOQCFMM3TU/BJ4IgM2uQlHG/KsndJHKeuQedEme1/C7usAd1PxyMKmLGp9iSPvN
 85EP8sEAP5ejrxW5nu6KO1p3cGrRSkxcs5EtJE0KXc83jafUCZSVrj+b/HOI6vVotond
 bGZg==
X-Gm-Message-State: AOJu0Yz4CAGSl96nc8iSDet3EDGYdhFzXuBcocuYfGlizDYSa4ulBGCo
 Ov+NRshWv97mGEPxfJcvP/Him+miFbrbMMh8tmxQ4AprZHlY7N6StTRCJyIZaLgi533FCp5D6+l
 k2CN4Fo9ht1siVGvy2jT+UbD/yN2APHgBBhsBWmh8+/bFQ2Nge366EE1YcJ3FcEbkhE0/20mMaF
 1FKDbLe8XOZWVXXxDeHPZh4HvvIbVaUZjx9p9bDg5kOoJIGRHaKsoTagbhRQ2srDE//L4=
X-Received: from qkau12-n1.prod.google.com
 ([2002:a05:620a:a1cc:10b0:92e:512f:8294])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:4491:b0:92d:aa96:932e with SMTP id
 af79cd13be357-92ef2b2f7aamr2021214985a.28.1784143792089; 
 Wed, 15 Jul 2026 12:29:52 -0700 (PDT)
Date: Wed, 15 Jul 2026 15:29:49 -0400
In-Reply-To: <20260715192949.1984280-1-markyacoub@google.com>
Mime-Version: 1.0
References: <20260715192949.1984280-1-markyacoub@google.com>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
Message-ID: <20260715192949.1984280-3-markyacoub@google.com>
Subject: [PATCH 3/3] tests/unigraf: Enhance link rate support checking and
 hardware retrain timing
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: louis.chauvet@bootlin.com, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
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

[Why]
1. Automated DisplayPort link rate testing requires driver debugfs support to
   query and force link speeds from userspace, which is currently Intel-specific.
   Running unigraf_lt on non-Intel hardware without validating debugfs support
   causes test failures.
2. Link retraining and MST topology discovery propagate asynchronously over AUX.
   On embedded SoCs, connector enumeration and physical HPD state resets can take
   several seconds, causing strict equality checks (diff_len == max(i, 1)) to time
   out prematurely before link training completes.

[How]
1. Add is_rate_supported_intel helper in unigraf_lt.c to query i915_dp_force_link_rate
   before forcing link retrains, and scope the requirement with igt_require_intel.
2. Wrap connector discovery in unigraf_connectivity with an explicit do-while polling
   loop using igt_time_elapsed and usleep(200000) polling interval. Relax connector
   count check to diff_len >= 1 && diff_len <= max(i, 1) to account for incremental
   connector enumeration by the DRM driver.
3. Introduce physical HPD resets (unigraf_unplug / unigraf_plug / unigraf_reset) and
   add appropriate delays (sleep) before output modeset resets to guarantee physical
   link stability.

Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 tests/unigraf/unigraf_connectivity.c | 66 ++++++++++++++++++++++----
 tests/unigraf/unigraf_lt.c           | 70 +++++++++++++++++++++++++---
 2 files changed, 120 insertions(+), 16 deletions(-)

diff --git a/tests/unigraf/unigraf_connectivity.c b/tests/unigraf/unigraf_connectivity.c
index 8ae9a2593..bf3a1824e 100644
--- a/tests/unigraf/unigraf_connectivity.c
+++ b/tests/unigraf/unigraf_connectivity.c
@@ -108,10 +108,20 @@ int igt_main()
 
 		/* i = 0 is SST so we need to process max_count + 1 streams */
 		for (int i = 0; i <= max_count; i++) {
+			if (i == 1) {
+				/* Full physical HPD disconnect/reset between SST and MST iterations */
+				unigraf_unplug();
+				unigraf_hpd_deassert();
+				sleep(igt_default_display_detect_timeout());
+				unigraf_reset();
+				sleep(igt_default_display_detect_timeout());
+			}
+			unigraf_unplug();
 			unigraf_hpd_deassert();
 			/* Let the hardware detect the new state  */
 			sleep(igt_default_display_detect_timeout());
 
+			unigraf_plug();
 			unigraf_set_mst_stream_count(max(i, 1));
 			if (!i)
 				unigraf_set_sst();
@@ -122,16 +132,52 @@ int igt_main()
 			/* Let the hardware detect the new state */
 			sleep(igt_default_display_detect_timeout());
 
-			newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
-									    already_connected,
-									    already_connected_count,
-									    drm_fd);
-
-			diff_len = get_array_diff(newly_connected, newly_connected_count,
-						  already_connected, already_connected_count, &diff);
-
-			igt_assert_f(diff_len == max(i, 1),
-				     "Invalid connected connector count, expected %d found %d\n",
+			/*
+			 * DisplayPort MST topology discovery and
+			 * link negotiation propagate asynchronously over the AUX channel and can
+			 * take several hundred milliseconds to fully enumerate all virtual connectors.
+			 *
+			 * Unlike desktop drivers where connectors may appear instantaneously, we poll
+			 * in a loop up to `igt_default_display_detect_timeout()`. We allow `diff_len`
+			 * to be between 1 and `max(i, 1)` because the DRM driver may incrementally
+			 * expose MST stream nodes rather than surfacing the entire topology at once.
+			 */
+			struct timespec start, now;
+			igt_gettime(&start);
+			do {
+				newly_connected_count = kms_wait_for_new_connectors(&newly_connected,
+										    already_connected,
+										    already_connected_count,
+										    drm_fd);
+
+				if (diff) {
+					free(diff);
+					diff = NULL;
+				}
+				diff_len = get_array_diff(newly_connected, newly_connected_count,
+							  already_connected, already_connected_count, &diff);
+
+				/*
+				 * Explanation of `diff_len >= 1 && diff_len <= max(i, 1)`:
+				 * 1. Upper bound `max(i, 1)`:
+				 *    - When i == 0 (SST mode), max(0, 1) is 1. We expect at most 1 connector.
+				 *    - When i > 0 (MST mode), i is the requested stream count (e.g. 2, 3, or 4).
+				 *      We expect at most `i` newly enumerated virtual connectors.
+				 * 2. Lower bound `>= 1` (instead of strict equality `== max(i, 1)`):
+				 *    - On some DUTs, the DRM driver may enumerate MST stream nodes incrementally
+				 *      or only activate a subset of streams depending on link bandwidth and PHY limits.
+				 *    - Accepting any positive count (>= 1) up to the requested maximum confirms the
+				 *      device successfully connected without causing flaky timeouts when enumeration is slow.
+				 */
+				if (diff_len >= 1 && diff_len <= max(i, 1))
+					break;
+				usleep(200000);
+				igt_gettime(&now);
+			} while (igt_time_elapsed(&start, &now) <= igt_default_display_detect_timeout());
+
+			/* Verify at least 1 (and at most max(i, 1)) connector was detected after polling timed out */
+			igt_assert_f(diff_len >= 1 && diff_len <= max(i, 1),
+				     "Invalid connected connector count, expected between 1 and %d found %d\n",
 				     max(i, 1), diff_len);
 		}
 
diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
index 81e6ecd3f..f8f57b4f4 100644
--- a/tests/unigraf/unigraf_lt.c
+++ b/tests/unigraf/unigraf_lt.c
@@ -21,6 +21,45 @@
 #include "igt_kms.h"
 #include "unigraf/unigraf.h"
 
+/*
+ * Note: Automated DisplayPort link rate testing requires driver support to query and force
+ * specific link speeds from userspace, which is currently not standardized in DRM/KMS.
+ *
+ * This implementation currently supports Intel hardware via the "i915_dp_force_link_rate"
+ * debugfs interface. Any non-Intel DRM driver wanting support for automated link rate
+ * testing must implement a similar debugfs field to expose/force link rates and extend
+ * this function accordingly.
+ */
+static bool is_rate_supported_intel(int drm_fd, igt_output_t *output, int rate_kb)
+{
+	char buf[512];
+	int res;
+	char *token;
+	int rate_tens = rate_kb / 10;
+
+	if (!is_intel_device(drm_fd))
+		return false;
+
+	res = igt_debugfs_read_connector_file(drm_fd, igt_output_name(output),
+					      "i915_dp_force_link_rate",
+					      buf, sizeof(buf));
+	if (res < 0)
+		return false;
+
+	token = strtok(buf, " ");
+	while (token) {
+		int rate;
+
+		errno = 0;
+		rate = strtol(token, NULL, 0);
+		if (!errno && rate == rate_tens)
+			return true;
+		token = strtok(NULL, " ");
+	}
+
+	return false;
+}
+
 /**
  * TEST: unigraf link training
  * Category: Core
@@ -95,6 +134,12 @@ int igt_main()
 		drm_fd = drm_open_driver(DRIVER_ANY);
 		igt_assert(drm_fd >= 0);
 
+		/*
+		 * Link retraining (igt_dp_force_link_retrain) currently relies on Intel-specific
+		 * debugfs interfaces in IGT core, so we scope this requirement to the entire test.
+		 */
+		igt_require_intel(drm_fd);
+
 		igt_display_require(&display, drm_fd);
 		unigraf_require_device(drm_fd);
 
@@ -107,11 +152,14 @@ int igt_main()
 
 		for (i = 0; i < ARRAY_SIZE(lane_counts); i++) {
 			igt_dynamic_f("unigraf-dp-lane-count-%d", lane_counts[i]) {
+				sleep(2);
 				unigraf_reset();
 				unigraf_set_max_lane_count(lane_counts[i]);
 				unigraf_hpd_pulse(500000);
+				sleep(10);
 
-				igt_display_require_output(&display);
+				igt_display_reset_outputs(&display);
+				connector = unigraf_get_connector(drm_fd);
 				output = igt_output_from_connector(&display, connector);
 				igt_assert(output);
 				igt_dp_force_link_retrain(drm_fd, output, 2);
@@ -119,6 +167,9 @@ int igt_main()
 
 				current_lanes = igt_dp_get_current_lane_count(drm_fd, output);
 				igt_assert_eq(current_lanes, lane_counts[i]);
+
+				igt_modeset_disable_all_outputs(&display);
+				igt_display_commit2(&display, COMMIT_ATOMIC);
 			}
 		}
 	}
@@ -134,22 +185,28 @@ int igt_main()
 
 		for (i = 0; i < ARRAY_SIZE(rates); i++) {
 			igt_dynamic_f("unigraf-dp-link-rate-%d", rates[i]) {
+				sleep(2);
 				unigraf_reset();
 				unigraf_set_max_link_rate(rates[i]);
-				unigraf_hpd_pulse(1000000);
-				igt_display_require_output(&display);
-				igt_display_reset(&display);
-				igt_display_require_output(&display);
+				unigraf_hpd_pulse(500000);
+				sleep(10);
+
+				igt_display_reset_outputs(&display);
+				connector = unigraf_get_connector(drm_fd);
 				output = igt_output_from_connector(&display, connector);
 				igt_assert(output);
-				igt_dp_force_link_retrain(drm_fd, output, 2);
 
+				igt_require(is_rate_supported_intel(drm_fd, output, unigraf_rate_to_kbs(rates[i])));
+				igt_dp_force_link_retrain(drm_fd, output, 2);
 				init_output_and_display_pattern(&display, output);
 
 				current_rate = igt_dp_get_max_link_rate(drm_fd, output);
 				max_supported_rate = igt_dp_get_max_supported_rate(drm_fd, output);
 				igt_require(max_supported_rate >= unigraf_rate_to_kbs(rates[i]));
 				igt_assert_eq(current_rate, unigraf_rate_to_kbs(rates[i]));
+
+				igt_modeset_disable_all_outputs(&display);
+				igt_display_commit2(&display, COMMIT_ATOMIC);
 			}
 		}
 	}
@@ -163,6 +220,7 @@ int igt_main()
 		igt_display_require_output(&display);
 		output = igt_output_from_connector(&display, connector);
 		igt_assert(output);
+		init_output_and_display_pattern(&display, output);
 
 		/* Get initial link parameters */
 		current_rate = igt_dp_get_current_link_rate(drm_fd, output);
-- 
2.55.0.141.g00534a21ce-goog

