Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24776105F7A6
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 13:52:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC7610E041;
	Fri, 13 Mar 2026 13:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lITGxAku";
	dkim-atps=neutral
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com
 [74.125.82.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B4010E120
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 13:52:47 +0000 (UTC)
Received: by mail-dy1-f175.google.com with SMTP id
 5a478bee46e88-2ba895adfeaso2285420eec.0
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773409967; x=1774014767; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=difJab3NxxCSjRUbvft+Jwd0niRQNfWGdLcVcpv4PG0=;
 b=lITGxAku11zyrDunsk1PPmtuVjF954tqVwxb+brGYUPzqY2i/a9Lcl/lC2AT6+y4/w
 8dmAW9k8cn5Bks3ZH+Z58dQxgas6D5uNBLjhjRo+tSqcMsZFzOWbTkNPmUjVwTFvu701
 csGdmx7SPm5b+sdgtgp87VshQs4vwBhvOxbbkbV5U1eATWvA8iKx7uGm8mQUhrypHVRb
 XFvEEf1Ehn+W/kNESnvSqcoJfglLy2oLy7+nnIxz1WFKJeIusFPRTubeAVBogYVqVq9p
 I6vX8GFwKPpZk9zMRdTTLy7XV43vnPmgKf5+aIvhpBqlPKxhRlWThPPZ1bwxvwKfkmQY
 5KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773409967; x=1774014767;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=difJab3NxxCSjRUbvft+Jwd0niRQNfWGdLcVcpv4PG0=;
 b=AhorJQoIL5Sx9K2FqQzKNZVmus8wpCPOed8MGHl+Tac+jPGaAnlRL92Ll/N6vWJ7QN
 O0KhltbQBzGr+1V9/0hn17jhspv5Ahg5enUSBXzEvXvIa9OlC+Yc1Kp4ixpbp6HyVopn
 joo6uwiLHz0MuFO6uTItqniina1bbgGlM8PHbH5vFzH5v/46AFJdvmF0pBgJBYqvrWj0
 8SgH5pNCDzNNA6YtOUaUIj/xM2qhXGOevSSVFMjT2rXiKWsgP+hJwZplvVMqK8qSPws1
 4IEWYnGWgfsFzlonSh95FDjLXM+RrSL1F3lbqogstoRUpEPj0dNOAUY7rOxb0zJxGzdL
 R/Og==
X-Gm-Message-State: AOJu0YxNIgNlt7Se+6728Q8mZ1eqU2l6k7bJ1OqP6WPmo+Qv/7cpzyja
 QoYCjiPEbNsd42i6yceWdxLTvM6B5BSDPHzSpqbZyDesOjYzpUVFMmSisPhtOMGO
X-Gm-Gg: ATEYQzyX+x573thfkNXeAbouYCBYoULX7jXdSySeC+abW633N/J+zwL1bUc2moJvqG1
 ALdI8ZcPkq5Y4mqJ7D7GiRhWoN+d0nNKxrwqvuSlY5yEKbVS+SPuOsWFifD0bvYw/MIp1Ym5Yfn
 rsb3QR2rROssocbqoFJ/bsFCudDZkHQ4paExwVpB+DAwwN/WLCQSetyHOtPrClDticECi9QHRiN
 1OUeNspqCHsTq5BgzQhU+DWvCmjGnK9e9utw2k4alFaUdgtDFgBtcjFYD9kDoXziDeoZPHP8jwf
 5vR7Qyo4LPrwieYjKCEx306/Fp9ZBkYXcSPzgQeYxNl066YQ/8YiIKRkHGNIuXZWRM9OQsuR9pq
 fmuKzyFqMHB912752BXYc5OYeGHCZaKBnIQ0XPVDBErhBiOsMLW2+DjiehlgtcO1Z1uzeXDJB0u
 itJH7jLr0RiXLVG91oMauRTV6QsVGYG6hvaRC+YpzilrMv4EMsLiNIzy8Y3uI=
X-Received: by 2002:a05:7300:e208:b0:2be:833c:14a7 with SMTP id
 5a478bee46e88-2bea5434633mr1565476eec.1.1773409966605; 
 Fri, 13 Mar 2026 06:52:46 -0700 (PDT)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2beab526db0sm3099913eec.20.2026.03.13.06.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 06:52:46 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/8] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Fri, 13 Mar 2026 15:52:01 +0200
Message-ID: <20260313135203.1782240-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
References: <20260313135203.1782240-1-juhapekka.heikkila@gmail.com>
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

Add __xe_bb_exec path to use specific engine/class/gt

Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
---
 lib/intel_batchbuffer.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 365976be5..3fea35786 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2520,7 +2520,17 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	igt_assert_eq(ibb->num_relocs, 0);
 	igt_assert_eq(ibb->xe_bound, false);
 
-	if (ibb->ctx) {
+	if (ibb->gt_id) {
+		unsigned short class = get_engine_class(ibb->fd, flags);
+
+		if (ibb->engine_id)
+			xe_exec_queue_destroy(ibb->fd, ibb->engine_id);
+
+		ibb->engine_id = engine_id = xe_exec_queue_create_class_gt(ibb->fd,
+									   ibb->vm_id,
+									   class,
+									   ibb->gt_id);
+	} else if (ibb->ctx) {
 		engine_id = ibb->ctx;
 	} else if (ibb->last_engine != engine) {
 		struct drm_xe_engine_class_instance inst = { };
-- 
2.43.0

