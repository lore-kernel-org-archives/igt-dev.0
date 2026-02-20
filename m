Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 879A9C5ACD1
	for <igt-dev@archiver.kernel.org>; Fri, 20 Feb 2026 16:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA1B10E811;
	Fri, 20 Feb 2026 16:18:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hh4UTx61";
	dkim-atps=neutral
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com
 [74.125.82.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 443E910E811
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 16:18:09 +0000 (UTC)
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2b740872a01so3774881eec.1
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Feb 2026 08:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771604288; x=1772209088; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+cORWbir5UZMwodLnt9nfV+X2CIZnXm6+UOWLQxj+8I=;
 b=Hh4UTx61t5BlIpZSt56C1f/xgULDw/MKaBuUWQvsvRL85sPZvtDfTyHBskJJO1V3ht
 5mEMvYb4cayJh2PwtE9ffCiCgBbIEhVqErMRGNREeCdoDxCIaMIPTd/DgmPieYE6Y4Ox
 PgrlGaNHDRblYKnB3UKwdc8IjzjunUhzS++gKJ5x20UGk36iD1M0Yqtrt6GNDBIGkE1p
 ZAl7mCP4QiBVXxrKsp0tcNFZs1juV7bTiqThxu2vL6/QTiU30ShdFZl9Y54XubT1rOvV
 L9LcquNySEBc6zOLSQ7Ua5ttOegRsvuP0rq28Fxu1sIEeF3T5Xc+XOxrogTtwZ0WpXg9
 EoUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771604288; x=1772209088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+cORWbir5UZMwodLnt9nfV+X2CIZnXm6+UOWLQxj+8I=;
 b=wN/ggUXz3bD9m9sW6353hJ8zEyhXcvojEBNEj8LnMnMu83K6J3wxrf39loxwtipZ9Y
 I2wK7ni2dB9xRhCGs5PVlx025ikCfobbIM8Cov9MS9VnyEwO6ojXG9xX372iwpCKhmiJ
 wXW1Gtl7nOidK4AF5bBTnqs1tqwf882w5olfuPfjwV8vUWnPbWIEwHeP2HG91lpaPRoC
 Mmhlg9eCEkoTNsAzRC0wV5VqaEMasHtPffZVElwMcvV+P5X4ZWAfIfymxfSKHvaGbBti
 vXEJ2QADa+hkK5a4DyzqSOm476czqr27cAuTJTRJ1TFm1kMOuLYMakTjxU4KCH2pMKQ3
 hv0g==
X-Gm-Message-State: AOJu0YxpJiaINwCMw30dCEjuFUsI2EVyVY4nvZOySNkOEFu13hEC1E7G
 IoEfzbACpGqnsYnwkAIT/ehVQphswYxC+za10sB3eL2fyAIWgGA0KEuPIF33Iql5
X-Gm-Gg: AZuq6aKx6eAL5oduHUz6nrVQlnjUHJhkY/N+a6AwQqRWQOT9eiJ2x3IrZpL/AvYHS0H
 aQFh9jEjs82xliCQOURRXcSyy1JsijPe42QuCfXiq8FKqiHkWN1BYr+iZF37BLscPjS0yPEXliR
 j4BQvcdb+vxXUZlHagbagzwknB8tNfA84d3uJxbnzEAJunsQM+IPmoqmxXJ1Ke4CsoAuo2cWUqN
 EgxQpH8B3q9Xm1Qs9fptaHWcvNtzQ66ZmSgZMb7Hm4sFuJ5dJ0jPVOuAsDxILFutJRDQBITOhV4
 lJlGIr+rWi5eYQsLm1KtZvyBGwmL3qmi7BXi6aUVxynUAqGGF+iKDcpUDsP29KP3i6QFDSejgQb
 wkvjms2emfrCfHQINasjTqCy5yc+kJJdwYRPHlDHiwShSm21pl+eWsRow/UoQqjn70hfVOfUPVd
 LEc6wNuLiDA1lmZvctCDJ8LayUsDM4hCANR5p7HOr54zf3Gm3Ia+yH8gAtFYOkx8w/mryCJQ==
X-Received: by 2002:a05:7300:bc1a:b0:2b7:9934:c427 with SMTP id
 5a478bee46e88-2bd7bd59f1amr65927eec.28.1771604288197; 
 Fri, 20 Feb 2026 08:18:08 -0800 (PST)
Received: from localhost ([192.55.54.43]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2bacb543d4dsm24331393eec.7.2026.02.20.08.18.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Feb 2026 08:18:07 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/8] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Fri, 20 Feb 2026 18:17:16 +0200
Message-ID: <20260220161718.652862-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
References: <20260220161718.652862-1-juhapekka.heikkila@gmail.com>
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
 lib/intel_batchbuffer.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 365976be5..f3b8aeaba 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2520,7 +2520,14 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	igt_assert_eq(ibb->num_relocs, 0);
 	igt_assert_eq(ibb->xe_bound, false);
 
-	if (ibb->ctx) {
+	if (ibb->gt_id) {
+		unsigned short class = get_engine_class(ibb->fd, flags);
+
+		engine_id = xe_exec_queue_create_class_gt(ibb->fd,
+							  ibb->vm_id,
+							  class,
+							  ibb->gt_id);
+	} else if (ibb->ctx) {
 		engine_id = ibb->ctx;
 	} else if (ibb->last_engine != engine) {
 		struct drm_xe_engine_class_instance inst = { };
-- 
2.43.0

