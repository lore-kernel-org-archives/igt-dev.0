Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C3BEC5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 18:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B614710F483;
	Thu, 13 Aug 2026 18:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="lGfa/w54";
	dkim-atps=neutral
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7E7010F483
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 18:00:00 +0000 (UTC)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-92ec3146553so28671885a.1
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 11:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786644000; x=1787248800;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SihYyhX8ic9Bgf923Y0B4DZ6fQYykp0Kj1AL8HjJvV8=;
 b=lGfa/w549zCvTozUiyJ5PT3fhEVcDDMmiv2DOtHBqtVzqhx+MieVdyUEHQ5cITtJ+N
 vd0k5JjR2AGpNKSzGPsJvRMT/xK0ew5Dsl4hTM9pd6fZ6jwWAUEemXC2fjch7TGHDpE2
 bK2CIYWkkj7b+ZzYLo7VdYDpvhwQZmqDX80qQC5Yp+6bsbnkw9eiOjYOvjR5C4OO0r+X
 asgIDb5KWiZJlmcjY4oNnveX7HrUJiK4/+FTqGupPI06q4E61hn+8W729wIebgCG5dwV
 7RK8WJQw1vuuQRp4kfLkBJlF1TrtvTLun6lq2q2FevaznNNGfxtzuIqyxA9sfbAMXX3K
 3lLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786644000; x=1787248800;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=SihYyhX8ic9Bgf923Y0B4DZ6fQYykp0Kj1AL8HjJvV8=;
 b=ibeJU+P6IxdhXwNiWlCMflxDZ/PKPcV8H5NYY26YIf7547wZi2hi6yIkWr6N2UuW4x
 IE21hy8cnqXffguTeBFFHsSFa99A7v8ieZaosGuDPRYcC0H/9jCfqvzbpFdGSG5iIWmN
 s82AGjRYL568lOCVIzW7RMTJIOEvQWUZgO8zS9JFaJJ6ryUHjHyWSKH3Zrdx1EQX2OO/
 oRP0fdMIgKIxUszzP5GxVjljnEKVcEaOwEdkD6d6z/bv5ZRBu/3feFRYMhnAoSk0N27t
 rpRso9HiSoUfFRwwpyBtWLHEkIphL+m4C1hLY7H0+3+pYVkkFN4ZWXZiPjsYzh2bmLh5
 MqEQ==
X-Gm-Message-State: AOJu0YwZhllQEfqMt7eYS1SBiiBblW1wIGQzb4iyKo2uxuDdQcP/iyc8
 gFpu5sAgWj8K5jT4XMAIzm6hLpCmSSXpH4Hae2lnIap/3g1WGW8b/JTHMPkRtmGPyRCUF1mkOZK
 jDOoghXz46KSgXoun2W27LSMHW2hnb6VDbClnfL+ZdB+j9cKEwXWZnOUpWwu7a70UsKclCsQ+TP
 VxmZEZt94LbDNIZBXCBJYgw6BjT9/Cd4/tsx/qmHGv4PiGJ+6NDL2Va8D4qb7xQAyDq4w=
X-Received: from qknxz16.prod.google.com
 ([2002:a05:620a:5e10:b0:930:9e7d:78b3])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:4513:b0:934:946d:599d with SMTP id
 af79cd13be357-936bfb026acmr767586285a.33.1786643997280; 
 Thu, 13 Aug 2026 10:59:57 -0700 (PDT)
Date: Thu, 13 Aug 2026 13:59:55 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813175955.2450321-1-markyacoub@google.com>
Subject: [PATCH i-g-t] tests/unigraf_lt: Optimize DP lane count validations
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Mark Yacoub <markyacoub@google.com>
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

Some drivers dynamically optimize power by downshifting lane utilization
if the current video mode (e.g., 1080p) has low bandwidth requirements,
regardless of the physical ceiling.

To avoid pointlessly testing artificially high lane mock ceilings
that would result in false-negative failures, we introduce a pre-check
in the lane count subtest. We safely pre-calculate the kernel's natural
max lane utilization for the current mode through an unconstrained HPD
sequence, allowing us to skip unachievable configurations.

Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 tests/unigraf/unigraf_lt.c | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
index 81e6ecd3f..7b9a2fc27 100644
--- a/tests/unigraf/unigraf_lt.c
+++ b/tests/unigraf/unigraf_lt.c
@@ -103,12 +103,43 @@ int igt_main()
 
 	igt_subtest_with_dynamic("unigraf-dp-lane-count") {
 		int lane_counts[3] = {1, 2, 4};
+		int max_natural_lanes = 0;
 		int current_lanes;
 
+		/*
+		 * Some drivers dynamically optimize power by downshifting lane
+		 * utilization if the current video mode (e.g., 1080p) has low
+		 * bandwidth requirements, regardless of the physical ceiling.
+		 *
+		 * To avoid pointlessly testing artificially high lane mock
+		 * ceilings (e.g. testing 4 lanes when we know the driver adamantly
+		 * refuses to use more than 1 or 2 for this mode), we first
+		 * perform an unconstrained HPD sequence. We initialize the output
+		 * and observe precisely how many lanes the kernel naturally demands.
+		 */
+		unigraf_reset();
+		unigraf_set_max_lane_count(4);
+		unigraf_hpd_pulse(500000);
+
+		igt_display_require_output(&display);
+		output = igt_output_from_connector(&display, connector);
+		igt_assert(output);
+		igt_dp_force_link_retrain(drm_fd, output, 2);
+		init_output_and_display_pattern(&display, output);
+
+		max_natural_lanes = igt_dp_get_current_lane_count(drm_fd, output);
+		igt_info("Pre-check: Kernel naturally trains a maximum of %d lanes for the current mode.\n",
+			 max_natural_lanes);
+
 		for (i = 0; i < ARRAY_SIZE(lane_counts); i++) {
-			igt_dynamic_f("unigraf-dp-lane-count-%d", lane_counts[i]) {
+			int lane_count = lane_counts[i];
+
+			if (lane_count > max_natural_lanes)
+				continue;
+
+			igt_dynamic_f("unigraf-dp-lane-count-%d", lane_count) {
 				unigraf_reset();
-				unigraf_set_max_lane_count(lane_counts[i]);
+				unigraf_set_max_lane_count(lane_count);
 				unigraf_hpd_pulse(500000);
 
 				igt_display_require_output(&display);
@@ -118,7 +149,7 @@ int igt_main()
 				init_output_and_display_pattern(&display, output);
 
 				current_lanes = igt_dp_get_current_lane_count(drm_fd, output);
-				igt_assert_eq(current_lanes, lane_counts[i]);
+				igt_assert_eq(current_lanes, lane_count);
 			}
 		}
 	}
-- 
2.55.0.691.gc56d675ccc-goog

