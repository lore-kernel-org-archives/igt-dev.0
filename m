Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41779C5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 18:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D353B10F4C8;
	Thu, 13 Aug 2026 18:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WRrwLxL2";
	dkim-atps=neutral
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5C210E50A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 18:29:30 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-51a8b0a08d2so2117501cf.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786645769; x=1787250569;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TleDI5SND0foOf7NVNCx/7dZoNDJOJserhsVSHHntk8=;
 b=WRrwLxL24kAVwJ4G6e9+e7g6wXJZXj8mODTmeaqHj+YlKFOarUwGs6qppBDkbNYaU1
 K7tizqvW5PFLupWLdHtN9qypPS5rQhPVz7+7RONsrfgPJoZQGLmGenO5O2BRyUpGd3HN
 10kG+1BL/X8uH++drswNOmFeJ1Nw16vKyth5utoI8u+TvgSI0YO7GqEYTSoga7A4q4SH
 kkeBjOFT/ZAiumjVmVUufPEMBEPAtOwOJ/kmzMYypD4GJLGuhNQfa3vzqXdIrQT3o+vX
 SHBcza55yd3Say+fEKVxSdZcQbzoqmM/zWXQ17wKm3niX2acI8PSPQXNrZwEN5OLF3Cb
 Q04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786645769; x=1787250569;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=TleDI5SND0foOf7NVNCx/7dZoNDJOJserhsVSHHntk8=;
 b=UbxXKUCGDToWnHqlnh9KrOu4eEg0M+/fs+Ez7B9gh3crm9OF1YDhRS4ny6cLIxcDLU
 XcFcLPpRRZXHj1TuPA5r6M/sD7ZlVnj6tAnWD0s8kMWWqeVLI19Wj6ALZ2q1SPi8kT/D
 Z35aHXrIU7NEBrOkhLkvNOoOVe54R5VQqmVZXbWjqXwMQcLv2XGX2slDtKYLzUrKS3dF
 /8fg6CF1eWsNpzyInAtfP5w2piIgAD3882WVtOktuOMb+C6cE7W5IG0UU3BD+Cr9z/4J
 4FT5cd+rD0Bd0Qy0wd2obqHa9bNDWEW5vtQgjN7qlz78iLQ5XLtQO0VOZZVSxCBUNH76
 JW8w==
X-Gm-Message-State: AOJu0Yzj1bATG2VcNPAkxkZj38C6ahk2j3GgpOrzjFcG8DPrE+fUrMbE
 u8KX8UIrnT/wvRwMQbQlSEpijo/r0D3+t/lBEDfU2w1c7t2drGSyr5iwdSJlSkotwO8gn2SFHBK
 rhQc1bqbc0qQujmiQoU0kk7HFeIl1e7j195g7ChWPD6pS7Uy+AIXcrimQ+HlAjrbeMTeAIWRyW0
 hc1Rgk8j88NUl5sTKotrzRYi0pdLc+UiFhVkYf3/SBQvn4q8dfotJdrsxnIr/yjxVzTKc=
X-Received: from qtxt3.prod.google.com ([2002:a05:622a:1483:b0:51c:1643:b82e])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:ac8:5907:0:b0:517:8011:3a4b with SMTP id
 d75a77b69052e-52d73d8a4e7mr77567981cf.21.1786645768770; 
 Thu, 13 Aug 2026 11:29:28 -0700 (PDT)
Date: Thu, 13 Aug 2026 14:29:24 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813182924.2508072-1-markyacoub@google.com>
Subject: [PATCH] tests/unigraf: Hoist static DP link rate bounds and purge eDP
 rate
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

Currently, the link rate subtest dynamically iterates across
UNIGRAF_RATE_6_75_GHZ during its testing sweep. However, 6.75 Gbps is
structurally an exclusive eDP link rate parameter that physical external
DP sink testbeds do not natively map to. Iterating over it on external
chassis outputs reliably wastes execution cycles only to inevitably fail
a hardware constraint validation.

Additionally, the existing igt_require(max_supported_rate... validation
is currently executed at the very end of the loop, specifically after
the testbed has already triggered an expensive HPD pulse, retrained the
physical link, and rebuilt the IGT output wrapper.

This patch cleans out the test execution array, and physically hoists
the igt_dp_get_max_supported_rate() capability check completely outside
the active dynamic initialization context to serve strictly as a
zero-cost pre-flight evaluator. The subtest now cleanly skips
hardware-unsupported rate ceilings in 0.00s natively, significantly
shrinking the cumulative latency footprint of an automated CI pipeline.
---
 tests/unigraf/unigraf_lt.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
index 81e6ecd3f..c82607e14 100644
--- a/tests/unigraf/unigraf_lt.c
+++ b/tests/unigraf/unigraf_lt.c
@@ -127,13 +127,20 @@ int igt_main()
 		int rates[] = {UNIGRAF_RATE_1_62_GHZ,
 			       UNIGRAF_RATE_2_7_GHZ,
 			       UNIGRAF_RATE_5_4_GHZ,
-			       UNIGRAF_RATE_6_75_GHZ,
 			       UNIGRAF_RATE_8_10_GHZ};
 		int current_rate;
-		int max_supported_rate;
+		int max_supported_rate = 0;
+
+		output = igt_output_from_connector(&display, connector);
+		if (output)
+			max_supported_rate = igt_dp_get_max_supported_rate(drm_fd, output);
 
 		for (i = 0; i < ARRAY_SIZE(rates); i++) {
 			igt_dynamic_f("unigraf-dp-link-rate-%d", rates[i]) {
+				igt_require_f(max_supported_rate >= unigraf_rate_to_kbs(rates[i]),
+					      "Host port physically caps below test rate bounds (Host: %d, Test: %d)\n",
+					      max_supported_rate, unigraf_rate_to_kbs(rates[i]));
+
 				unigraf_reset();
 				unigraf_set_max_link_rate(rates[i]);
 				unigraf_hpd_pulse(1000000);
@@ -147,8 +154,6 @@ int igt_main()
 				init_output_and_display_pattern(&display, output);
 
 				current_rate = igt_dp_get_max_link_rate(drm_fd, output);
-				max_supported_rate = igt_dp_get_max_supported_rate(drm_fd, output);
-				igt_require(max_supported_rate >= unigraf_rate_to_kbs(rates[i]));
 				igt_assert_eq(current_rate, unigraf_rate_to_kbs(rates[i]));
 			}
 		}
-- 
2.55.0.691.gc56d675ccc-goog

