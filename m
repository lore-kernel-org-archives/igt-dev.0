Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B662DC2BD09
	for <igt-dev@archiver.kernel.org>; Fri, 28 Jun 2024 19:02:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798C710ED31;
	Fri, 28 Jun 2024 19:02:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="FUBL5HT2";
	dkim-atps=neutral
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com
 [209.85.160.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E79610ED2E
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 19:02:51 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id
 d75a77b69052e-445033fbc24so8040191cf.3
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Jun 2024 12:02:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1719601370; x=1720206170;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nntNSYHChyuc/ZtYSFpc5ynQY4/oU+dsCU/SVXUYrg=;
 b=FUBL5HT2XIclaBJmWNcXlpHT64fb0EKt6Q7xMQBQxO+/EBz80IdW9iRt9XZt2ESG49
 b3Z/tHS+q2xI8VarOLvPXptg4IW1UiaKEuBuXg76lrYFZwJGtc3aMEUC1YMKDsI0KAYO
 utCzr6E0CrBjefoAitTaCr7eDEjBjY+xQLyKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719601370; x=1720206170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nntNSYHChyuc/ZtYSFpc5ynQY4/oU+dsCU/SVXUYrg=;
 b=TBLN0dVaFebeJfq6dpnyfSnP4moEjBO3npuxAD1pMQQIJ0GX09ct3uRIMtrJi0x3Z4
 mMZVf7oHlFLeD6BRJwZAqRfUrdTGgWGIps8vfK8r1dwyIZwic4l704/HJ4fhjkZ/MAuo
 ggDvmLEnUcVCQj50JvZqfV2GnawdoDAcVXDkeEZ3Fg3iYcx+ScVyCrET+Up4pO8jlZpI
 lAFDbFRnIFNC41ctCGxTcnI7dSKGdDf8SIrWjCevSU/hjQxE1/Uh/nPpOlIVO0SFMUj0
 gmDqeeXrm1IZ7oL3XCn0H9mx8Lkzw5iEY+HrtAeU34xOA+hMCLe0kvLaxqZ+PYdvQT/T
 2A1w==
X-Gm-Message-State: AOJu0YxDACGnBrKry3qSihj5kKO8Z6nBWL9SUTMPWLLr/qClngLkL2Jy
 JPJ2o5CQeRZFvuY7ga38RI/yneqpkusGR2Ub4Iq4k6eTq8LSktXkbqz+5I1L3GI64ZODAFiTiMS
 fsyApjaIEGCzrKTxciMvygtVYdRJJc/8yIhYqp7hx2uxlnS90bULh610Q0NgnQ5Yff8TCSyReSX
 jSlPdf+8z2+ODoabdf1W0TL7j6kfJ5nKo1ewvpAnUVAk0krYup9A==
X-Google-Smtp-Source: AGHT+IE/4Q7+TL2Zn9OQOuT5w3wif34hwBU4yfuYgNr7czeSxe9AvGBRO05jb9/nn8kHX0g/kWOvLQ==
X-Received: by 2002:ac8:5a81:0:b0:441:45bf:970a with SMTP id
 d75a77b69052e-444d90e253cmr207361951cf.0.1719601369946; 
 Fri, 28 Jun 2024 12:02:49 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-446514341a1sm9523781cf.42.2024.06.28.12.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jun 2024 12:02:49 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 Martin Krastev <krastevm@vmware.com>, Ian Forbes <iforbes@vmware.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t v3 1/4] tests/vmwgfx: Removing incorrect assert in
 mob_repeated_unref
Date: Fri, 28 Jun 2024 15:02:40 -0400
Message-Id: <20240628190243.695367-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628190243.695367-1-zack.rusin@broadcom.com>
References: <20240628190243.695367-1-zack.rusin@broadcom.com>
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

From: Maaz Mombasawala <mombasawalam@vmware.com>

Remove an incorrect assert in test mob_repeated_unref that checked if return
value from multiple unrefs of a mob was 0. This was a bug in the vmwgfx driver,
since after the first unref it should return -EINVAL.
This bug was fixed with buffer rework in the vmwgfx driver and now the unref
ioctl behaves the correct way.

Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
Reviewed-by: Martin Krastev <krastevm@vmware.com>
Reviewed-by: Ian Forbes <iforbes@vmware.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 tests/vmwgfx/vmw_ref_count.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/tests/vmwgfx/vmw_ref_count.c b/tests/vmwgfx/vmw_ref_count.c
index da4b41f89..92d49dbd0 100644
--- a/tests/vmwgfx/vmw_ref_count.c
+++ b/tests/vmwgfx/vmw_ref_count.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /**********************************************************
- * Copyright 2021-2022 VMware, Inc.
+ * Copyright 2021-2023 VMware, Inc.
  *
  * Permission is hereby granted, free of charge, to any person
  * obtaining a copy of this software and associated documentation
@@ -256,13 +256,11 @@ igt_main
 
 		/* Shouldn't crash on multiple invocations */
 		for (i = 0; i < 3; i++) {
-			int ret;
 			struct drm_vmw_handle_close_arg arg = {
 				.handle = mob->handle
 			};
-			ret = drmCommandWrite(fd1, DRM_VMW_HANDLE_CLOSE, &arg,
+			drmCommandWrite(fd1, DRM_VMW_HANDLE_CLOSE, &arg,
 					      sizeof(arg));
-			igt_assert_eq(ret, 0);
 		}
 		free(mob);
 	}
-- 
2.40.1

