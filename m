Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DEEE77188
	for <igt-dev@archiver.kernel.org>; Fri, 10 Jan 2025 20:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2822410F184;
	Fri, 10 Jan 2025 20:12:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="dfe8InvS";
	dkim-atps=neutral
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6246110F187
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 20:12:55 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2164b662090so38863305ad.1
 for <igt-dev@lists.freedesktop.org>; Fri, 10 Jan 2025 12:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1736539914; x=1737144714;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SSj3m6YytHR/Sy7uBfc7jhPWCrhAjvyyl60JFM7HM3k=;
 b=dfe8InvS9aTIdRSvThWcxhu4lragcjtfp+B2oeQmkRTSEtXS2f8ORZLrC7yxfQf503
 Z/djtRTc78/+LxlN4nJQkpCYKAEH6uMrtPISflZKkWVwqZIvTSMoIxJ33EiD3e/6wk9K
 R5lJLtnritqz3Efni6jPnkruTqojF1S1rnafg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736539914; x=1737144714;
 h=content-transfer-encoding:mime-version:reply-to:message-id:date
 :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SSj3m6YytHR/Sy7uBfc7jhPWCrhAjvyyl60JFM7HM3k=;
 b=o9C2mvxsqXCvmOFeXa0y561XpcHP8qo68XPOgWnnu3PjZR2EW295umIn/d8pPMLK3X
 GQ3Za06f+liV/yq+48r9wyLktxN8jWVwDGZdYNGyEaYCpIb9OnsLX4Ht5kmZGeFKHsw/
 s0MOofC034IR1sW6Srv9y/WLM+nPt6fm8tE07v6y/hIXOaK79isp8i0kEqM/u9J20OhI
 V1MX65zRt3GbR0ujtmHWFd8bfH/hSpMMFU4Tlt9tByA0igfzI6g2hslgNsHtYGilovVK
 TJ8jJyp5KXjDNhrHrJl5U/TXGwY3bXs9SF6+QCeb+DNsglh9Z/sQxMk5fCmU0550C9Cc
 8ZSQ==
X-Gm-Message-State: AOJu0YwcbD+0pgG7Ih1Kn26ABfXG5YlgCoz06sU71mR6l+j15b1ZY3S+
 Ifwia732qNwqFEaFwgnEYRLGxdDaYwdeyBXlgujkMTI3Mc4psl+ApUqh38PZMoyXA1+a245Ln2m
 vDH2fs/QDbl2ITqAq/pLhMnVJ5nAn+k3fmQHrfL+dAN45TtvFTO1YCAGmdp2idJRApLoUSIguv9
 3R4Ww5XwiEDMpXidFchLzTscNVwagfhZiEonb6cqNHuo4drcmMIg9Imsc=
X-Gm-Gg: ASbGncu8Mri1dDWXYlfdmYG+jlOIWCNKye6/oobB7gyVzl+EPY0g0B48WSPR7tfhij8
 l0FiWXRPxa9SjH2dkmIUhQZSzvvsllaVMGGcSQFf2T7a31+hfrKcObsM20/nMNVImRUvb1wFduV
 OD0w0UtP7q+k9wuiL5wwa8rtxxjcgj6Je7NEk6uYBtFg558Lf03FVXqd5y/mHS2LyFJvirC3I6V
 5P2cx3t24DcUylRux/wJfyTze8Vz+JI5mH8rFzNKkJeS6LXdnPuabh4b7c5AhTycKjrR4QC5aay
 9hGPL+ZtvcXahKWfc+xjyBuK+ktfB6gA29Xny8eOChuTyyHdPzkU280QBk8aP/xdtL0=
X-Google-Smtp-Source: AGHT+IHp/2w2YZXbphAiWIqCNw4BTOfD0SaJ+Ac8dzRzCjbCmuJlDwkeN9wFWsigw3ZDuXCrFXCTfg==
X-Received: by 2002:a05:6a00:2442:b0:729:cc5:fa42 with SMTP id
 d2e1a72fcca58-72d220491c3mr18456381b3a.20.1736539914270; 
 Fri, 10 Jan 2025 12:11:54 -0800 (PST)
Received: from mombasawalam-Precision-5820-Tower.cap.broadcom.net
 ([216.221.25.44]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d40548489sm1983371b3a.15.2025.01.10.12.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 12:11:53 -0800 (PST)
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
To: igt-dev@lists.freedesktop.org
Cc: ian.forbes@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com,
 Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Subject: [PATCH] tests/vmwgfx: Check for 3d support on context and surface
 creation.
Date: Fri, 10 Jan 2025 12:11:16 -0800
Message-ID: <20250110201116.1485633-1-maaz.mombasawala@broadcom.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reply-To: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

Creating a vmwgfx context or surface will fail on a vm without 3d support.
Check for 3d support when creating them so that the tests which use them
skip instead of crashing.

Signed-off-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
---
 lib/igt_vmwgfx.c                    | 12 +++++++++-
 tests/vmwgfx/vmw_execution_buffer.c | 35 +++++++----------------------
 2 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
index 74c13b52b..94d255655 100644
--- a/lib/igt_vmwgfx.c
+++ b/lib/igt_vmwgfx.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
 /*
- * Copyright (c) 2021-2024 Broadcom. All Rights Reserved. The term
+ * Copyright (c) 2021-2025 Broadcom. All Rights Reserved. The term
  * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
  */
 
@@ -175,6 +175,11 @@ uint64 vmw_ioctl_get_param(int fd, uint32 param)
 	return arg.value;
 }
 
+static inline uint64 vmw_supports_3d(int fd)
+{
+	return vmw_ioctl_get_param(fd, DRM_VMW_PARAM_3D);
+}
+
 void vmw_ioctl_get_3d_cap(int fd, uint64 buffer, uint32 max_size)
 {
 	struct drm_vmw_get_3d_cap_arg arg = { 0 };
@@ -445,6 +450,9 @@ struct vmw_surface *vmw_ioctl_create_surface_full(
 	int32 ret;
 	union drm_vmw_gb_surface_create_ext_arg arg = { 0 };
 
+	/* Surface creation will fail if 3d is not supported. */
+	igt_require(vmw_supports_3d(fd));
+
 	surface = calloc(1, sizeof(struct vmw_surface));
 	if (!surface)
 		goto out_err1;
@@ -721,6 +729,8 @@ int32 vmw_ioctl_context_create(int drm_fd)
 	int ret;
 	union drm_vmw_extended_context_arg arg = { 0 };
 
+	/* Context creation will fail if 3d is not supported. */
+	igt_require(vmw_supports_3d(drm_fd));
 	arg.req = drm_vmw_context_dx;
 
 	do {
diff --git a/tests/vmwgfx/vmw_execution_buffer.c b/tests/vmwgfx/vmw_execution_buffer.c
index b89770b30..23c5f900d 100644
--- a/tests/vmwgfx/vmw_execution_buffer.c
+++ b/tests/vmwgfx/vmw_execution_buffer.c
@@ -1,28 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0 OR MIT
-/**********************************************************
- * Copyright 2021-2022 VMware, Inc.
- *
- * Permission is hereby granted, free of charge, to any person
- * obtaining a copy of this software and associated documentation
- * files (the "Software"), to deal in the Software without
- * restriction, including without limitation the rights to use, copy,
- * modify, merge, publish, distribute, sublicense, and/or sell copies
- * of the Software, and to permit persons to whom the Software is
- * furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be
- * included in all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
- * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
- * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
- * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
- * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
- * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
- * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
- * SOFTWARE.
- *
- **********************************************************/
+/*
+ * Copyright (c) 2021-2025 Broadcom. All Rights Reserved. The term
+ * “Broadcom” refers to Broadcom Inc. and/or its subsidiaries.
+ */
 
 #include "igt_vmwgfx.h"
 
@@ -271,12 +251,10 @@ static void execbuf_stress_test(int fd)
 igt_main_args("st:", long_options, NULL, parse_options, NULL)
 {
 	int fd;
-	int32 cid;
 
 	igt_fixture
 	{
 		fd = drm_open_driver_render(DRIVER_VMWGFX);
-		cid = vmw_ioctl_context_create(fd);
 	}
 
 	igt_describe("Test creation/mapping of a basic mob.");
@@ -294,7 +272,11 @@ igt_main_args("st:", long_options, NULL, parse_options, NULL)
 	igt_describe("Test basic fencing on command buffers.");
 	igt_subtest("execution-buffer-submit-sync")
 	{
+		int32 cid;
+
+		cid = vmw_ioctl_context_create(fd);
 		check_execbuf_submit_fence(fd, cid);
+		vmw_ioctl_context_destroy(fd, cid);
 	}
 
 	if (options.stress_test) {
@@ -307,7 +289,6 @@ igt_main_args("st:", long_options, NULL, parse_options, NULL)
 
 	igt_fixture
 	{
-		vmw_ioctl_context_destroy(fd, cid);
 		drm_close_driver(fd);
 	}
 }
-- 
2.43.0

