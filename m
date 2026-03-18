Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F18103E198
	for <igt-dev@archiver.kernel.org>; Wed, 18 Mar 2026 15:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D4BF10E859;
	Wed, 18 Mar 2026 15:06:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ePCzGhN7";
	dkim-atps=neutral
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13A6F10E85A
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 15:06:19 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-82a7539851fso25212b3a.1
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Mar 2026 08:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773846378; x=1774451178; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1XkIqliUqivZ7nBNmo9UjvIa9vLBxD2xxg/Gjq14/7k=;
 b=ePCzGhN7QcgxIcmmuQTVOgipl52dWqyI/6dG0blb6tUEvCly55MaBDs7PYytqozMoI
 S02frAlFOmEb/dCD6FL4kniuxH5EAsz8hfLPjqeRxP+1z9tJH70/0SYEW+TRVDXCz/4P
 jiuchwrWK4s2n6IcWst/U7U9f7odvjOBT0PgOZjkEJIIqXSudFwsI48O/mNs+G52pJhg
 7r+EYXdboqxhuVRkrNWewimfSYayMub+XF5pR2EdhMnsXPN8D2OqYGBJAeDQLMKeo94V
 v2oEEKRWvu4DcoxiOWYb/3MOxUYRWsNmHcA7bZ9PSYJVdhInl8CuogLBSoQxtgBmoMYY
 s0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773846378; x=1774451178;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1XkIqliUqivZ7nBNmo9UjvIa9vLBxD2xxg/Gjq14/7k=;
 b=EmJ2bUQkdVMvaDbJE9HMO9TSlSxw/a7xrCy7dnSgwT/84+iZ/mkCuxD82PNSvs3ZYy
 mYX5hqGUZ2y//JK3ewhgiGdCt00+HlBmF7MUwLP/7fIpep55QjEqwFIfRrQigzV1AcLy
 8XUPPAiM/M2gYBirPHD1fSrL6KLPFB7TqPbp/t/MIJTs6yAyDaT+14nEC5dBCqB9rUUx
 UB9psC0yjBgOQVlkKsQYyc5te+SttzXYLwv4oPNDleqtGFeDtwkgW8p1NsEdPwLJUB9Y
 o35+7uRYlx6E3ZkK/U5Slr6b4stCVp1sAm9N+7vw4p2crbfRLBqW4raqZdTLzs9+MkWF
 FuTg==
X-Gm-Message-State: AOJu0YzYvBncMBRwHVqrAMtYj9b+laLNSn87cCg47nj9GgvDR19rQdIS
 /V+omuvkJIALDu90NDBfVNkdU3604pNlpCTttWK2X88CtWAYwjumHOC/5NG88IJ6
X-Gm-Gg: ATEYQzyvfplGwezavw6QKV4F6wefpwor8Im7GSL76raW8v5BZjM1BW6BJw9DZV1f/9l
 v5FrqOO/GmI6relvJS9L+8jrnKzM3N4VHO6iz1qHCBVsxg7hB9plPGXbf3VczWrZhjpSefuwzxq
 UHz7a+hii4b/PXjkYF5H20sg0cSPmJJJE+qT5Lcpy4hVDDpp1mFfc25Wo7Za45nedbnDNtc8EnN
 fX5KkGGzaZhR0G98ZGuxBEHBkWAangKx992ktlk1KwGQq0XlSst3DIHMzX4ly/4YbON2zvvjEhR
 56jpZ3Ro66B7ISIbEq9k5XB94NhQFdjjmayUjh8t9mvE3W+EomdVL30vVbRMaHfSCKbCMPtaJZC
 KM66nuQhOrvMY2qeRolPatxWYKYIPoBohVUz169l1AN1hp/eUGOyFLEL4fB77imRKncZzDRttNL
 RVdoE1GQEfFENtYhdPy7ncaS0esnlcZB1Yq90AQUR6g7hPPWbBDonUxl8ttoQtrA==
X-Received: by 2002:a05:6a21:6f88:b0:398:7137:272a with SMTP id
 adf61e73a8af0-39b9a06724amr3549307637.32.1773846375043; 
 Wed, 18 Mar 2026 08:06:15 -0700 (PDT)
Received: from localhost ([134.134.139.73]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c741e543579sm2806135a12.16.2026.03.18.08.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 08:06:14 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/8] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Wed, 18 Mar 2026 17:05:15 +0200
Message-ID: <20260318150517.4049206-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
References: <20260318150517.4049206-1-juhapekka.heikkila@gmail.com>
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
index a3fa58b4f..5c0597869 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2522,7 +2522,17 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
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

