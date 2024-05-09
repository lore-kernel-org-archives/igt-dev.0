Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E2CEC10F1A
	for <igt-dev@archiver.kernel.org>; Thu,  9 May 2024 19:15:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FB5B10F090;
	Thu,  9 May 2024 19:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="QFxInsQb";
	dkim-atps=neutral
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0A710F090
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2024 19:15:39 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1eb24e3a2d9so10688105ad.1
 for <igt-dev@lists.freedesktop.org>; Thu, 09 May 2024 12:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1715282138; x=1715886938;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0nntNSYHChyuc/ZtYSFpc5ynQY4/oU+dsCU/SVXUYrg=;
 b=QFxInsQbcLJExz42vJPtCR8NX1mYVr81Dw1V0M23/GEIiQ9hQKQiBrGH/u0PsyFrto
 apMpHbyrqpcf8h9fuFOoz6Kj9RN+AbtosTcsHwPVBmznrnnvyK6SqJ0gtGxYM/nq7cH2
 WA7/KEicG4me9QiplDsp0kIflN6Z1tCb+iRws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715282138; x=1715886938;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0nntNSYHChyuc/ZtYSFpc5ynQY4/oU+dsCU/SVXUYrg=;
 b=ZQYWcPbXTsvSmmADrDikGfZ6j3UqQxohd9JGKHfjl1dkQqXUZhnkDArkLonbjsNVCG
 08vIUy8HD/u5GTr0YXnQSr0cmhRfzqVmSkXmhl+9zl5r+Udrz0VEtRB0HLG1bkBWOEqr
 AZDwo6Ozfw+x/vQ/9VrzUDn7d+0gvhOwAGLEAGYriR71g93fBAKAjQEVUBvLi003Sq41
 8I12wOG30zt9uKGrCUXRcDl/VBFLQxmsfXKCsdb3K7Qc7webDopUN6dd/N3K49eSqSqB
 +yNRJ/NonUyHLR8vQLYa2+dL9VUF6gKTgNsj5UUX7Shkvy2mvrDc6vYGevFLF03SIVIA
 X0Hw==
X-Gm-Message-State: AOJu0YwiQust9ZG4ZsEf0vWeSQe/pg1+cFyWsTljF+F8zi2pLm+2TPoX
 4qKnvtBycyWpKYmgk+Gu859nMDNeZj0N/n+uBGKwg414euUi1mp6ddP3E6hNPPtGvg1DED009ZJ
 1BSOHwQ306mkxFEczgHfWh4mOkXEjIv88QZ7zt8N5MGlG5iH2sCZpLNFkstuEAMyErPLPm5Tjqz
 YlXQKFfUvTCYXbIXP8nA6YyyAzjT70hx9yApQE78x2lYjp8CQ=
X-Google-Smtp-Source: AGHT+IFzi4OFev/FavJLcGjXPtnlsHJDBdBv3irNvkXksuB05rbEQqttSGur1X3t5/UdaqUmMUtuhw==
X-Received: by 2002:a17:903:8c3:b0:1ec:4adc:4153 with SMTP id
 d9443c01a7336-1ef43d125e9mr7771455ad.24.1715282138246; 
 Thu, 09 May 2024 12:15:38 -0700 (PDT)
Received: from vertex.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf2f70csm17827395ad.168.2024.05.09.12.15.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 12:15:37 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, martin.krastev@broadcom.com,
 maaz.mombasawala@broadcom.com, Maaz Mombasawala <mombasawalam@vmware.com>,
 Martin Krastev <krastevm@vmware.com>, Ian Forbes <iforbes@vmware.com>,
 Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH i-g-t 1/3] tests/vmwgfx: Removing incorrect assert in
 mob_repeated_unref
Date: Thu,  9 May 2024 15:15:27 -0400
Message-Id: <20240509191529.3783796-2-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240509191529.3783796-1-zack.rusin@broadcom.com>
References: <20240509191529.3783796-1-zack.rusin@broadcom.com>
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

