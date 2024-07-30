Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F22C3DA70
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jul 2024 19:00:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A08E891BA;
	Tue, 30 Jul 2024 19:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="SSr4qM4l";
	dkim-atps=neutral
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com
 [209.85.219.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BCE9891BA
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 19:00:42 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-6b78c3670d0so26207156d6.1
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jul 2024 12:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1722366041; x=1722970841;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SYHJGKEkgdhaG7bRGLBkeEYYySospOJCtu4D4EJ7ygM=;
 b=SSr4qM4lSBcT9ELZao5R+9vduhVhZrQSBIMCwgsz6eLM4sA/F8y8Gn01gD9ju7hY5v
 10gkIAMlg9WIksVc3OpZK4Xp+7ngGYIgoSFpaSRHJb9LDTGMiwDEgoU/2EXJpSA9PPD1
 DPhbhurTpoGW/DHhVa/G7IolzRn54vKDuA9CM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722366041; x=1722970841;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SYHJGKEkgdhaG7bRGLBkeEYYySospOJCtu4D4EJ7ygM=;
 b=ZCEakHJEclP/RdjE5FBwk+l6RLgDEMYMlqOUA80eIMqaFDrPpU7ghN7DcYPCM49guV
 Xg105LiCCH7pdtLzxUSULA+USWwSq/Db71gv8nk2Cvuhxnx8y4/H25IqwaYPbHLlsKbV
 vUnBLLYO1ceF3wlIx69kzI0MpRER2+8V4cjsP6VZrlCaT9p3vqssSmzkhd0J0iTqHPry
 4m284CK7HPCJ485R8l4zLhCbyp5RdpuhFSAlLB3PLiUxYHrVb67OKARIgsf9RzjuSWsA
 gneqtv+x+jt6Fb8tLwYtsIYZAaA6v/2f9rH+CYg2l/SgtyDYbpaGPDwrr99E6NoojPcC
 yOOw==
X-Gm-Message-State: AOJu0Yx3zFPmH/1TM18Qc5VlOlRZ78YYH5dr0YXza5DvEDd26L039O0/
 o8eYpFqM6xdvYST6iGTAk2Lwo69HkBA1x+AADJMLFP+Uqx/cMZl9X5g5sd0uWbVFTBcqWeDTtkU
 tZrkMer4Su2ZJ9pDnXsZRMjWqlMA/frrzDyLwZb20F/LHkg1MD1SNU8Y3LwtEs4X1e5wkIuzdbe
 zKnL9dpfln/gXvZa18Lab6xiheZveHZZ2FnGONtZwwRi/QAyM=
X-Google-Smtp-Source: AGHT+IEAlyL3Rjo8Iqgj8q5ul2k0hfIDFDIhtNeAeu3raG5mnJB/5n5vLbFI0uvcnMZKKhzdWygdeQ==
X-Received: by 2002:a05:6214:415:b0:6b5:7e0b:eafb with SMTP id
 6a1803df08f44-6bb55a113f6mr162299516d6.24.1722366041287; 
 Tue, 30 Jul 2024 12:00:41 -0700 (PDT)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net.
 [173.49.113.140]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6bb3fa9be2fsm66644386d6.98.2024.07.30.12.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jul 2024 12:00:40 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, kamil.konieczny@linux.intel.com,
 Maaz Mombasawala <mombasawalam@vmware.com>,
 Martin Krastev <krastevm@vmware.com>, Ian Forbes <iforbes@vmware.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t v5 1/4] tests/vmwgfx: Removing incorrect assert in
 mob_repeated_unref
Date: Tue, 30 Jul 2024 14:59:27 -0400
Message-ID: <20240730190037.1134020-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240730190037.1134020-1-zack.rusin@broadcom.com>
References: <20240730190037.1134020-1-zack.rusin@broadcom.com>
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
2.43.0

