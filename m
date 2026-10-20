Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EEA560A2609
	for <igt-dev@archiver.kernel.org>; Tue, 20 Oct 2026 13:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=vve+bU+F
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B8F10E603;
	Tue, 20 Oct 2026 13:24:03 +0000 (UTC)
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D51910E603
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 13:23:12 +0000 (UTC)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-53639e47be2so65124921cf.3
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Oct 2026 06:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1792502591; x=1793107391;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=B0er9KljRN/AEU5p6j4NuE8us6M7obrrkPLAutuWyr8=;
 b=vve+bU+FVAM1LJwiucna+96S5xJdmD46dJcJOP17ovcpyFbiSK+BboGkOhBLhoJal4
 Vo4X2apdGg1zVUBHR0aICzMwuo3q9LI06IurHK8GzwwdH6X6BigQIR5/+JpOP/oqCo9F
 RGQiJTXBW6OoeXJ72NId4IquIZ1GPd600/fAB8IyvHDEa0Ppe3dv7XCEFZ9/+C5tpK8e
 2B3ZAtvFQ3RMFn5FoHc5EODX7dSlWk0QgZbDolfEL1Ze7AsN8BK9Pfo66eFAa9aeV+nz
 iToS0T89q8IJRT87ideThAMzZwJXXl0i/JwoWTgQ20ObIdKZzkEWg0pcR/OF8+hzkmuw
 F2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792502591; x=1793107391;
 h=content-type:cc:to:from:subject:message-id:references:mime-version
 :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=B0er9KljRN/AEU5p6j4NuE8us6M7obrrkPLAutuWyr8=;
 b=GEj1JVcF1kuUQJFTlSk2RGMo//xe6gHYIub0ooXf1iXFh/4QfcptJEi62rjU8mCHC4
 sfz0U9YLhwoSUUwCmz2zc2GHeBqOTvZfknQOPI7LOkBU64cSfOammUKvPsPBc8kk+oO4
 AEIuq4Z1cdk12YmZFxiYum3VLcgYb6h1XA9+M5u+NxodpXiYu93sNaTxWUZuIp3Z0Uo4
 VT6xEHodRQYw5BeTclRDaffZEo1AFtFO7damplf2iegxKWEYvZAfw9k6rxJmS5hnJ63r
 81Zi3z2lUP/fqod+e29Xy+BLNepmcHy7ULIR97CrBEB4v7W2gawVISpMPCKzJJzeoCvq
 Hg2A==
X-Gm-Message-State: AFq9FYIxHCSopZJk/bytzNG/5SF4z85awCmmc8r33aGs+UqvGwJ8I/pk
 NdV/suiLJMEJQv2RsIl5ekCbndHe1dgthwOPPjfqcsPN/xvVBPI00vJjsXSZ9GFrqnymcDqyaWS
 XPr/Trn5z3JjFoDwU/9Z+3Qx8/sNFcIKEokoG5m9VMF5yCAlh1+mDBAssfCHQoryCUq1D1SQenp
 5h21poDpxnXMjiVxY7fUrYgB1l2gwPTYodOOG/4sqdypVbNBMJNsm8K2H0oAzJSTTgdPc=
X-Received: from qtboe1-n2.prod.google.com
 ([2002:a05:622a:6f01:20b0:536:3c24:ee9e])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:622a:1f05:b0:536:5c86:cfd8 with SMTP id
 d75a77b69052e-5365c87419cmr117262081cf.12.1792502590719; 
 Tue, 20 Oct 2026 06:23:10 -0700 (PDT)
Date: Tue, 20 Oct 2026 09:23:10 -0400
In-Reply-To: <20260813182924.2508072-1-markyacoub@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20260813182924.2508072-1-markyacoub@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020132310.3003364-1-markyacoub@google.com>
Subject: [PATCH v2] tests/unigraf: Hoist static DP link rate bounds and purge
 eDP rate
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, imre.deak@intel.com, 
 louis.chauvet@bootlin.com, Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="UTF-8"
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
X-Spam-Status: No, score=-26.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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

Signed-off-by: Mark Yacoub <markyacoub@google.com>
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
2.56.0.212.g129ede20d9-goog

