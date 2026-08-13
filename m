Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54BDAC5B572
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 17:12:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1E7C10E4CA;
	Thu, 13 Aug 2026 17:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="WBRb7BCz";
	dkim-atps=neutral
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04A410E4CA
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 17:11:59 +0000 (UTC)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-934963b2bc0so10554685a.3
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 10:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1786641119; x=1787245919;
 darn=lists.freedesktop.org; 
 h=content-type:cc:to:from:subject:message-id:mime-version:date:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=6UzNd9LqK4AgtOlXRIFBYJWgkAAXrfALK+GNjx8igWI=;
 b=WBRb7BCzfdQN95hYYHZE0gEAOyws9lu8/HXARS61AbpM68oOMWGcC4CpXPG5aeZ7yi
 VTIHjTiCoRkk4ALOzysdi4C7lfT8nOc/d3n37XDa3IUepZm36dZRZ7ByQ8tXMl5UMYi2
 lwOecBh6ZP+3cglTAAFcUzBbFimRV4zbJW76uSxPIx9/WSW7CLB2KNz5ppRjz8h0IFzR
 mmlR8puuvl/V5bDsqWws9yDyoCQU0VkVFVXDcIhQOIoOSUHjGwC7+Br17cnPICr+ufvv
 6yaVBCcB+dPk4mAB6NQNnm9ymuEE0BJPFF4xKUhRCUUGMcY/r7VtNVwrDvSK/zBotHJL
 Vgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786641119; x=1787245919;
 h=content-type:cc:to:from:subject:message-id:mime-version:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=6UzNd9LqK4AgtOlXRIFBYJWgkAAXrfALK+GNjx8igWI=;
 b=g2L77c5fMWKeQLFmW5EysVnxT0SLLYE8Pylr4C5MWQNQMJRTuApAJ21wXNkuHp17pj
 eY+uqmrZDVD0frCL49qIOnhgdNhB8wJ8gQvDxcZDB1f3lpJSOp7g9+2FYoUI9c/SwnnM
 FGKxPwHK5CJYvEQ6puuk7GHqp8D9PYk9fLPuqhE6V9oNK3kxQDIrNDmMBQTGxyUBqohf
 UGwaC6pXcyyd1kdN7Z82CfngxKYTdawyXWe9/32gK2cPt2F7C5Kxypwu1fQqRtx9/kTs
 i2Rek9Rx7Wa46/lDxyic2H2xEIT4JcbFY0jk7HOnPQcCmccPSetiLNPX9b405ONdvWJL
 dlfw==
X-Gm-Message-State: AOJu0YyqJ0HItqsqkMQMf3QHns+c/+69sf6SsoUB0QY+zVR4jKBMWkiP
 5UBzvgiNsA23eB1LWMc3cbmqALgtQr2KQMm5phXEfgp5UJWLn1CMOMDcoQkoxLZDc4LFSLGJzLD
 8r7w/Nd+75657fX4KLucLveR4QXrf8mCHQH1UDFsIiZ1LrRPj6lA4II/HYAPd5Fv8Xis+piz+kW
 vg67kfs4rDJ6ur3C13bIEVWiY5CUQTPtrMSDFCrj9r5qSndXtWUhpfBoLERmxTiQMH5mw=
X-Received: from qknpq7.prod.google.com ([2002:a05:620a:84c7:b0:92e:4f2e:2dd])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:a2db:20b0:930:9e52:2b05 with SMTP id
 af79cd13be357-936bf916eaamr619145485a.15.1786641118650; 
 Thu, 13 Aug 2026 10:11:58 -0700 (PDT)
Date: Thu, 13 Aug 2026 13:11:56 -0400
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260813171156.2353078-1-markyacoub@google.com>
Subject: [PATCH i-g-t] tests/unigraf_lt: Restrict to Intel drivers
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

Currently, `igt_dp_force_link_retrain` natively maps to Intel's
i915 debugfs architecture. Thus, enforce
`igt_require_f(is_intel_device(drm_fd))` in the test fixture so
that this suite explicitly skips rather than blindly failing on
generic drivers. Other drivers should implement equivalent generic
IGT hooks before they can execute this verification.

Signed-off-by: Mark Yacoub <markyacoub@google.com>
---
 tests/unigraf/unigraf_lt.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/unigraf/unigraf_lt.c b/tests/unigraf/unigraf_lt.c
index 81e6ecd3f..c0d1161f6 100644
--- a/tests/unigraf/unigraf_lt.c
+++ b/tests/unigraf/unigraf_lt.c
@@ -94,6 +94,8 @@ int igt_main()
 	igt_fixture() {
 		drm_fd = drm_open_driver(DRIVER_ANY);
 		igt_assert(drm_fd >= 0);
+		igt_require_f(is_intel_device(drm_fd),
+			      "This test relies on Intel-specific debugfs endpoints (e.g., i915_dp_force_link_rate, i915_dp_force_lane_count) for link training verification. Other drivers should implement equivalent generic IGT hooks.\n");
 
 		igt_display_require(&display, drm_fd);
 		unigraf_require_device(drm_fd);
-- 
2.55.0.691.gc56d675ccc-goog

