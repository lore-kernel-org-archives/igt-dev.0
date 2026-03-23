Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55BD3F483C8
	for <igt-dev@archiver.kernel.org>; Mon, 23 Mar 2026 16:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BFAA10E57A;
	Mon, 23 Mar 2026 16:30:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fKPr71fW";
	dkim-atps=neutral
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61AC110E49D
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 16:29:58 +0000 (UTC)
Received: by mail-dl1-f51.google.com with SMTP id
 a92af1059eb24-1271257ae53so386315c88.1
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Mar 2026 09:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1774283397; x=1774888197; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1XkIqliUqivZ7nBNmo9UjvIa9vLBxD2xxg/Gjq14/7k=;
 b=fKPr71fWKCYGnNdxFacCR6zQjN+gRlurUfP00QCHhY0ZXnQ1555QvM9VQ96w00y8wR
 jMnDWuol/Mpmrd43yJb78f5uhvN061YHdQp8ctKvKEoZ0Km97kB+HIBnH2o5kNuvHuV8
 1ig6sLS59e1fAffY78nOjqzAAfHDhu6DL0gSf+Ufhf3fbRl+8UzR7FVMEkdF8PL4MVel
 FJvZrz2e06vodmF0DFTbDc4dGRO21CYrH9sTFFesUhUDf6qRuTe0tRVNOdzmwCwawwlp
 q9EaSo5b05WE2a6ReEFXpxsudYjAZhdJmJQaLFQZ5yQnC4HcwVZx3NIIgfHYBlHQ6Cf4
 tARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774283397; x=1774888197;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1XkIqliUqivZ7nBNmo9UjvIa9vLBxD2xxg/Gjq14/7k=;
 b=U9lp4W5vNwU4MwGbnB5tz3UbmnUrAfJhnbCihHKPWiee0ycaWvAcnk0uEY2rx38ZWl
 zkLLpdeo0nxYQnC1F6GDCLKk38zouqE8C5t4mvoDzPuKBsVl4IqdJ2PHPeVC8HomWWJV
 AisfRG3Qb6z330q1HohEE8FX6lTSJRuMTzFCanUCpzzGXn0VfXIgqxUBr70vvNSg919I
 wsco0//7k225wkJVMRV5nNE/ERl832934TkJkjy9o8oBsu8gkB2qXDIggu8IKTbn2Tv5
 QP0+nubrF/XoX5sRwVIkqAsRdjYefPHHULXbN56YnbAk8QrhvhUS9RSeJXbGARBNZVcj
 bTHA==
X-Gm-Message-State: AOJu0YzYHPhA6JjifrJFvWremUbUzQIu0Bu/zZzZ9vndX06PXM6mZl6I
 2r1U3FUgZh+gMG0ySho8cfVxzsh0yNdqyB1FJTaJJooDwDkpI2WmVAmqAF8q0b4q
X-Gm-Gg: ATEYQzyRmfzxLJkFamNoItfwKm076Kqv9D+2ivGIjcBcgFPHU8YkQVIVI8/6qpzqjGv
 YXePCOIpDxoUIWztoIX4fLBtixBfbRpdPG096fgDfEAFmBmcCbHgeqMq7V2Vr/mIykzAl2FpoRY
 pIPU/jx81nLPtEvej2fAUSD9yt3eSmvihFJt0Hc4gRWfVGPXigx72a4W2mVsOteivZXiNv/4wRj
 kQ9J9PfNm8ZWAyw7wTWzTvypLmpcHobMc4P1enUtO+abSmvY8irkEXzsVejXa+1ahtHnh3kRXOM
 5E7X+1zhV/2MIT2mdi1HvUQbj33ZwHg0f3ACB225EE9lL3WLubygCMFoAaXCZuy3i1MY+D/DShr
 0zBARepYGaUupaEDRHpN1BxmeDYE/hLXDh0WwhiWXtkiNXxqacjxj8ApHRCzE54TCHNyrcBtH18
 8fDxBjYQUVDjQdLxNVBzSwfm4PnShRnN54uCXeab2crxIEAoepOxzgBASPNaw=
X-Received: by 2002:a05:7022:628e:b0:128:d6c3:9b27 with SMTP id
 a92af1059eb24-12a726fac38mr5037253c88.37.1774283397376; 
 Mon, 23 Mar 2026 09:29:57 -0700 (PDT)
Received: from localhost ([192.55.54.47]) by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-12a733b49afsm9900095c88.2.2026.03.23.09.29.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Mar 2026 09:29:56 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 6/8] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Mon, 23 Mar 2026 18:29:09 +0200
Message-ID: <20260323162911.1912755-7-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
References: <20260323162911.1912755-1-juhapekka.heikkila@gmail.com>
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

