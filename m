Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60638E81BD3
	for <igt-dev@archiver.kernel.org>; Mon,  9 Feb 2026 16:32:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 102E010E434;
	Mon,  9 Feb 2026 16:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GQf/XR/C";
	dkim-atps=neutral
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com
 [74.125.82.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3A7F10E438
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Feb 2026 16:32:47 +0000 (UTC)
Received: by mail-dy1-f181.google.com with SMTP id
 5a478bee46e88-2b869d6c096so827706eec.1
 for <igt-dev@lists.freedesktop.org>; Mon, 09 Feb 2026 08:32:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770654767; x=1771259567; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aC2ViNkItthNENPgNJ1j6PkVxGR3OZad9NTWjGpu9K0=;
 b=GQf/XR/CuIX6KwLB982O8+DlrFlZyX6PVOEV7ff4g6kihF4gR9h+iNTgUpjIglxYPP
 DkDi5pSW12Ex6uV+a9cJ7v29U4DU8YKow5AebyMzl29k/qsg06dQJFCIqQWF8Nl7azfW
 MF+w6KoKhvOyvHrC8d2DtQMDPS19s018cBMqKL07SNGAWWWXvbwigFDF0q9KPmBqMaOT
 C3JNZ54eYT7db9t8ACAsTA1YnsgJ/RTM3Sx4lPNiQwfea1cOQ/4TuhL6AHZ+RiNPpden
 UWeTpTcfNa0A+IYtA4vZWXV/gWc5U9Gn+krJoCtfQuforCYPO5r7dg3aYWVQfU9IzpEx
 FtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770654767; x=1771259567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=aC2ViNkItthNENPgNJ1j6PkVxGR3OZad9NTWjGpu9K0=;
 b=IoLOS+K/hAoQoXeQ+e8lQ6OO2yJQ4CPdiaHDlhqmrrR1+hdY5v+/uL1INMT12igh7x
 MRlxFKF9rvbKzdbz2v67HKsJKUTvdNkwiY4Cvp3IJsMGyagSdDGuwIK6gLkswwrwXA51
 uv9tx2oixAPPNz8YAb68J3W34Jo3FwAVkyI+/n8BWMnGNaikGQuBD/kCAxWDS98LyvNy
 n2fra+OkMtq1mbSBOj8sp31YQXRZ1GNXfck7StUQAlgJEHp+1WijhbCodBJxBTdIi/Nv
 PTYBMrfXGznR+0eGs1AVykNhdn2jArp51VIXp6XATKP89f0WOvRmXQNbMYY5p8MYiaEl
 kUiw==
X-Gm-Message-State: AOJu0YzwWx0C02yVEMvJ/bc+AMiAGrxpDqUrBW2KRMBlzwFa5glD/b8u
 eXTff0S7Z50TCLvoTamOQxRxTzPHw2yPQL61GXE68rST61SIQ1N74wTeVRelxhbE
X-Gm-Gg: AZuq6aKRA3Ulb4VLrqDvg4KAC699ogDWVxQnZtFyYQNwYoHr+ibXVp1CfvAoaY0ibsy
 xLVscVbTDUTnpZoSEf+OuQi1kz3UOIdEgskuNxVRcrKX9FEPc+r7PTn8dWNt+vHfy6Eo2UEBNgN
 tEQWV2ZkCuOJ0YcufAnxfqi8sr4DEHXs7iKy/5p/5YSJQzetmunl7Uwvu/8tGjHoz10ifZdVkgl
 CYZ2Ntu0p5hZaWDgNA4ih/q9ZrZ94KAiYd+cwX5bzq9Y228zafJtLf0XxvXqbu8/PcgRstzNQHU
 nPvqsfyzAXiH3IyELAtdSrW6sZirdFy5jVgh/pRNFwJ3FsZzVeP7WobIkRg6wsWXaCWDNbKRDNy
 MFRCVxnXxfHg25xvt7CB5+cgChK0E2Dx67HDOvrkeURCqj7MgKPRubd34LfwHHR3fDcseJIo0ff
 GTvwSDORjob3rp48pg6T01+LS/yZvWc6x8XG4y+I/k+Vg5H/d2lanCtacFkyU=
X-Received: by 2002:a05:693c:3006:b0:2a6:a306:efdb with SMTP id
 5a478bee46e88-2ba884a9a45mr12313eec.3.1770654766634; 
 Mon, 09 Feb 2026 08:32:46 -0800 (PST)
Received: from localhost ([192.55.54.41]) by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2ba6baef3aasm3439603eec.25.2026.02.09.08.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Feb 2026 08:32:46 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Subject: [PATCH i-g-t 5/7] lib/intel_batchbuffer/xe: add bb exec path to use
 specific engine and gt
Date: Mon,  9 Feb 2026 18:32:11 +0200
Message-ID: <20260209163213.1483598-6-juhapekka.heikkila@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
References: <20260209163213.1483598-1-juhapekka.heikkila@gmail.com>
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
 lib/intel_batchbuffer.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/intel_batchbuffer.c b/lib/intel_batchbuffer.c
index 198adf85b..c80881301 100644
--- a/lib/intel_batchbuffer.c
+++ b/lib/intel_batchbuffer.c
@@ -2518,7 +2518,13 @@ int __xe_bb_exec(struct intel_bb *ibb, uint64_t flags, bool sync)
 	igt_assert_eq(ibb->xe_bound, false);
 
 	if (ibb->ctx) {
-		engine_id = ibb->ctx;
+		unsigned short class = get_engine_class(ibb->fd, flags);
+
+		engine_id = xe_exec_queue_create_class_gt(ibb->fd,
+							  ibb->vm_id,
+							  class,
+							  ibb->ctx);
+		ibb->engine_id = engine_id;
 	} else if (ibb->last_engine != engine) {
 		struct drm_xe_engine_class_instance inst = { };
 
-- 
2.43.0

