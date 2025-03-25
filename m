Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93233C3600B
	for <igt-dev@archiver.kernel.org>; Tue, 25 Mar 2025 19:09:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48AD610E5DD;
	Tue, 25 Mar 2025 19:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U1ZSInps";
	dkim-atps=neutral
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9255C10E5DD
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 19:09:09 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-223fd89d036so124294175ad.1
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Mar 2025 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742929749; x=1743534549; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QNNQItU9S6AV5OVuqN1bd7OkU+iqu3Nd/zGUIQokFQ4=;
 b=U1ZSInpsj7Gp1y9DvKzZ2SZOvhXKF68J3wMWA76QzYL3gFGmsHj1p8rL8wyc//U9+M
 uXCntLmyA0/PXz4GV3yv8fSQ4oUdEk2U+K2a+8ooz3z/FAp/F/MsCxB8sIJZ5qefX3Pc
 ZaAr5bsvNIwlYayB7+EJrrPioa2uA0bWGHqH7ZfSHH0M3gu8SXq/svgBJdbWUnsx1WtY
 MySlmBITo8AlW6QljJGc3gGl/hgKG46dxWXEPH88Yvv5/8Kf6YJwUsA00J9Bm+gKE94q
 sBOraWx9PZ90grkkLA3enacvijLARywXLWFzIwTAMsv26osNumHpKAW5uRP7zzzezvHc
 Ex8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742929749; x=1743534549;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QNNQItU9S6AV5OVuqN1bd7OkU+iqu3Nd/zGUIQokFQ4=;
 b=bXVqnbjdvvjku9PLg7i0C9GlQtI4gGFapAFrt34Kt3R10RoeqWFNfWzrVBPSkDydRG
 FdmnILGZ7iwFFfwBfuAA0bKuKl768KKYXf7k3dxd+z+QPm+JSb15cL0kkwpinbwD4HrH
 6uhRmc7L2HoKbk5yokpf6NZQ1P23p6VgMs4HcxAk8v043+FF5zUSWezcpjyYz3TRmAco
 PRimAW0WoyRiSLen7qvl+wyQLkvYnqLq0uKmoNWgn6SPneTH27XtuqtPszZBhucl+HbT
 fM+tYQZXryEZXgKAnFkuXroycAEFWvtFfZNCPnT8BTkddH7Gg0y5rHtMAkvH6JOSrT91
 L7GA==
X-Gm-Message-State: AOJu0Yx6TH/6zc5n3IcGJJKcR0BpT+7a0XF0ZlFxgLwzABxhTPVFREKH
 7V/XSuWMdL5LznhwIpprrYi+m3HUhDsF65mxq+kr9JDEqq01prJbKlmYYc3z49M=
X-Gm-Gg: ASbGncsUF650Ynm9ODC5L+kdev2tCB07Fs7NmnZKwCOQ3sccwaNb5kbPWcfcMdT+sR5
 lIT9k8SsoKG3gOWFLFZGqYZA5A0KNLVJ6UcS75CjLZ88E4NAKtz/b7ukAIAhAdr/Th11OdMKjWA
 AFUS08ON6B/JluoVCd31Uu0flzKJ6ALPgsB7kHxBAI6EXNr/DOs1Tf1zMoHzxEUwQqaroAju10t
 TQDehHkEkFwKp3j4+3gXyKWjFYVv5ez25fBRLloX71qRfrUoiwKS3qqOM/n21u3qCVl2wHz3YJv
 8PgwRlSp7pIB/2ueivlW+LjHM58KMHwUePObzvPTeOTh7BiuXF0UTA==
X-Google-Smtp-Source: AGHT+IGlm03zJnVUeBrGPGTMK7Iy3TT0lKz8ONXDLYqU/EWCknyfb8ooxHwT/7p7eFTNvP+5pH1udw==
X-Received: by 2002:a17:902:f550:b0:224:26f2:97d6 with SMTP id
 d9443c01a7336-22780db4699mr326815275ad.28.1742929748761; 
 Tue, 25 Mar 2025 12:09:08 -0700 (PDT)
Received: from localhost ([134.134.137.72]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22780f395f4sm94536525ad.9.2025.03.25.12.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Mar 2025 12:09:08 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/7] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Tue, 25 Mar 2025 21:08:37 +0200
Message-ID: <20250325190839.1984723-5-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
References: <20250325190839.1984723-1-juhapekka.heikkila@gmail.com>
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
 lib/intel_batchbuffer.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 0c21ff77a..d337c56cf 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2469,7 +2469,12 @@ __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	igt_assert_eq(ibb->xe_bound, false);
 
 	if (ibb->ctx) {
-		engine_id = ibb->ctx;
+		unsigned short class = get_engine_class(ibb->fd, flags);
+		engine_id = xe_exec_queue_create_class_gt(ibb->fd,
+							  ibb->vm_id,
+							  class,
+							  ibb->ctx);
+		ibb->engine_id = engine_id;
 	} else if (ibb->last_engine != engine) {
 		struct drm_xe_engine_class_instance inst = { };
 
-- 
2.45.2

