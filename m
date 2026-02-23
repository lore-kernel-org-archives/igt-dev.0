Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B12EC110A
	for <igt-dev@archiver.kernel.org>; Mon, 23 Feb 2026 16:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0237F10E3F2;
	Mon, 23 Feb 2026 16:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="qbBFWcDM";
	dkim-atps=neutral
Received: from mail-qk1-f201.google.com (mail-qk1-f201.google.com
 [209.85.222.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B38410E3F2
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 16:41:56 +0000 (UTC)
Received: by mail-qk1-f201.google.com with SMTP id
 af79cd13be357-8cb706313beso642295885a.3
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Feb 2026 08:41:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1771864915; x=1772469715;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=crxOUKQAiswub6Vv3t1WmObgcDhKi922LLp6Z94s6zI=;
 b=qbBFWcDMVFsn8VbcSPtvQR4Xkyp/AE92i7M8QttkpLKKaBbPYFGlZTWyofEavBQXdB
 PeD4sJh72Z+R+Ys+5MU4XrZQyv0yQltK+DfVbxVe5mPgi8+36c/jM9lXtA+iFZx9+MlP
 mTabdNuDITAEBzUov803A0wWT0WfM27mgs2tJBpplR4r1STPK+5xwNjJKg/7aEPHE15y
 WbPrSkJuj53nTQQIkIsUVmcGFsALsJwR4VaR9UBSCCqL7sPIvnzeKB9VWrMaMmk/PgVR
 lpMs7yhE/AeD9zdbGUoNGeaXY86ECu0WQqTRS3i8cv0+TuRevcZCu8djjKOQGs87qDOb
 +4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771864915; x=1772469715;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=crxOUKQAiswub6Vv3t1WmObgcDhKi922LLp6Z94s6zI=;
 b=J7Cjrg2o/Vf76H7kuSuILlt+cdnTFfutT0OnvD6XkDLnc9lHGp0LRzUC4wvTu9Mv1J
 Fo7uweapvQQEC3HpYyg1o7t4dk67GRbxVZP7Jp55eT/HPDkFEpy+VmALqX16+gvRIYtt
 YDGJOlqKJYQCuLSIam4fPPeM9+RsngjlEl2ciOy8VoE/Un+SVkRGspfsz6xcCAtTkIid
 34glOmxadNscn6F59TqUvxZs5WgPRJuDrhc4/F7sQSkVBfY6td/u2dToQ/r8IHJd6YPR
 v6i358W/uKMTm4qGz0v3gnaUnAea56TMYuQi0l+jg4fHMuIeywUBhF5BO1c55OrTbzYl
 3mBw==
X-Gm-Message-State: AOJu0YzNeR7xQfUj6/yfXwBbFsadPjFjaiHqX64SP7ye19tPYETTZu1q
 Wy4sn71XZUiVoemQIa1+JY73bweimSqRTSfPKHEjNov86K+SXzsUjuTbnEJAa02kGJtxzs1cIz4
 w1oUpWUaBJrBbb61Wyx+OPcgPfuxmAQw5QzbaN7VCG1ZY0je49BRcUJbRVVI8yB37SoUwEh50Am
 bhDYtiCkZcx3F+GUkw5ez07An4QXM4Ea9d+i5oYbaiUo1uGF7aK9+T0bWv1hPqAHO2cvQ=
X-Received: from qkbd18.prod.google.com ([2002:a05:620a:31f2:b0:8c5:335b:fbe3])
 (user=markyacoub job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:620a:25ca:b0:8c3:650d:577e with SMTP id
 af79cd13be357-8cb8c9d0414mr1105249185a.4.1771864914515; 
 Mon, 23 Feb 2026 08:41:54 -0800 (PST)
Date: Mon, 23 Feb 2026 11:41:51 -0500
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.345.g96ddfc5eaa-goog
Message-ID: <20260223164151.3307217-1-markyacoub@google.com>
Subject: [PATCH i-g-t] tests/kms_colorop: Include local glib header for Android
From: Mark Yacoub <markyacoub@google.com>
To: igt-dev@lists.freedesktop.org
Cc: sashamcintosh@google.com
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

From: Sasha McIntosh <sashamcintosh@google.com>

igt-gpu-tools requires glib.h, which on Android is provided via a local
header in the android/ directory.

Signed-off-by: Sasha McIntosh <sashamcintosh@google.com>
---
 tests/kms_colorop.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 876f089fd..bb15350ef 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -6,7 +6,11 @@
 #include "sw_sync.h"
 #include "kms_colorop_helper.h"
 
+#ifdef ANDROID
+#include "android/glib.h"
+#else
 #include <glib.h>
+#endif
 
 /**
  * TEST: kms colorop
-- 
2.53.0.345.g96ddfc5eaa-goog

