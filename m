Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B4DC44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998E110E428;
	Fri, 17 Jul 2026 08:25:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="EYttLqhe";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDCAD10F49F
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:23:08 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7I4nC2913452
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=T
 h4xC+cUTrqu+HYIA8zO0WwFp+m1A9+XAStV9kjcUog=; b=EYttLqheOm8Mu/RYe
 U7dKWc83l3xvySNTWA43X0Ys+ax/RckhH6AaNGIe8bosX10DnRxQk6d9QwCi5yEh
 lUiUYKyGWRTnXw/czSu8tc/Svu6IspDyqyEMInX40Sm502oPaAkmH+0CHpyJYvo6
 XimCEa3/xNVwDcU2sgZXXtYHX4sQsHAYzZ3Dp/EQG5DEPkX7dgQAFlJB1oVBRZsw
 OqaoZr0hpG9uuUbiTAxxjoyG+FGy3WXWTBbXVa5KPnA8UCEONqpE2oMPi/bRkTLg
 e1BMGirqg8mAcQu6J39mc3DgfEUOIDcWY1v/Ha3TdrrBbRp95opoPSTrwpoEkgo3
 kbbDw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnh03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:12 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 08:49:11 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 09:48:14 +0200
Subject: [PATCH i-g-t 07/10] tests/imagination: Add VM_CONTEXT tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v1-7-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274547; l=4464;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=NYgg64yAw0SSO27sldBYBKE+ylzJ/Gb3qmYdXaArjjE=;
 b=70/WqWWRoMNvettUCyEdOfFVKTy/tuWL/bfHz7H32N+OYeQa4JvAjYobsB3SNRid76ztIqJzP
 jsD8RLpKprLDto+DhwV7jOmqQfhql+URBV7cR6Yo40itnuM4YaSyltP
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfXxwn78TgDHfAn
 xl6QNn1S0UTumsFuXNIoncH8XAJk+4hkjYRaiRMSGONXzz8IA4L8uUPMpWAsaw4+fPma590zo53
 iS19tzy7pcL060HEm9QTHdHlHMtwT4vK6U2oVxtp7md0JNpozbHMQ7ANgkC7VsznY+VKEMQvIw+
 Zvd5rLQ7m4YByTjJIIXHRAExSRCdNqrt6DdckSCS5oBhEH7c/lKH76nZl1QfhGxfaKkMoXyedDD
 cUIzZCC3udX074ODwUWFnQ2utu3+ltxayIOYoXwC+5t12y7QQkb5YS6KFm880Bz5T2Pcgvp28gj
 nEoyDhGBvRUBp8+5a8Fxgt4NgV4ggqHdqlMetH8tBYf04rohHwV3PYny4P+pcqA3lY5LKs/U4cx
 94Uw6PpQ+6hWyMOD+P7TqSUOj4wiQVd6q8svSdiMWq2KYhs8Y8k2Ff0EDM+CxRsBTlgMBsZO2AX
 VZv7KgFpIyNuTm8ZkZw==
X-Proofpoint-ORIG-GUID: Bkw1tZ-oZg5HjXgtFrNSkrrI_sCR1pgM
X-Proofpoint-GUID: Bkw1tZ-oZg5HjXgtFrNSkrrI_sCR1pgM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfXzQKg7HAT9fsj
 DP4YGRwZlvG3gwfn1/qyN0Od8ztV6IC4dGes8mPv7iSYfd1l9lGLz42r0y0LY1zBoQcoedDlZ+K
 LL7PdpdNjXsOlyoetvb5Vo+ArYxS1Pg=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59de78 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=XjKxqXRqJ_dD72vPlP4A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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

From: Donald Robson <donald.robson@imgtec.com>

Add subtests for VM context create and destroy ioctls,
including invalid padding and bad handle error paths.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
 lib/igt_pvr.c                      | 26 +++++++++++++
 lib/igt_pvr.h                      |  3 ++
 tests/imagination/meson.build      |  1 +
 tests/imagination/pvr_vm_context.c | 79 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 109 insertions(+)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 437362dbc..a631c4ff2 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -113,3 +113,29 @@ igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out)
 
 	return sdas;
 }
+
+uint32_t igt_pvr_ioctl_create_vm_context(int fd, int expect_err)
+{
+	struct drm_pvr_ioctl_create_vm_context_args args = {0};
+
+	if (expect_err)
+		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_VM_CONTEXT, &args,
+			     expect_err);
+	else
+		do_ioctl(fd, DRM_IOCTL_PVR_CREATE_VM_CONTEXT, &args);
+
+	return args.handle;
+}
+
+void igt_pvr_ioctl_destroy_vm_context(int fd, uint32_t handle, int expect_err)
+{
+	struct drm_pvr_ioctl_destroy_vm_context_args args = {
+		.handle = handle,
+	};
+
+	if (expect_err)
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args,
+			     expect_err);
+	else
+		do_ioctl(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args);
+}
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
index e7fbdc82f..3486a52d4 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -22,4 +22,7 @@ igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);
 struct drm_pvr_static_data_area *
 igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out);
 
+uint32_t igt_pvr_ioctl_create_vm_context(int fd, int expect_err);
+void igt_pvr_ioctl_destroy_vm_context(int fd, uint32_t handle, int expect_err);
+
 #endif /* IGT_PVR_H */
diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
index fc24d0220..ffacce1fb 100644
--- a/tests/imagination/meson.build
+++ b/tests/imagination/meson.build
@@ -2,6 +2,7 @@ pvr_progs = [ 'pvr_dev_query',
 	      'pvr_gem',
 	      'pvr_gpu_info',
 	      'pvr_heap_info',
+	      'pvr_vm_context',
 	    ]
 
 pvr_deps = test_deps
diff --git a/tests/imagination/pvr_vm_context.c b/tests/imagination/pvr_vm_context.c
new file mode 100644
index 000000000..d1f75e873
--- /dev/null
+++ b/tests/imagination/pvr_vm_context.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include "igt.h"
+#include "igt_pvr.h"
+
+#include "pvr_drm.h"
+
+#include <linux/errno.h>
+
+#include <stddef.h>
+#include <stdint.h>
+#include <unistd.h>
+
+int igt_main()
+{
+	int fd;
+
+	igt_fixture()
+	{
+		fd = drm_open_driver(DRIVER_POWERVR);
+	}
+
+	igt_describe("Test valid VM context creation and destruction");
+	igt_subtest("create-and-destroy-vm-ctx")
+	{
+		const uint32_t handle = igt_pvr_ioctl_create_vm_context(fd, 0);
+
+		igt_pvr_ioctl_destroy_vm_context(fd, handle, 0);
+	}
+
+	igt_describe("Test VM context creation with bad padding");
+	igt_subtest("create-vm-ctx-bad-padding")
+	{
+		struct drm_pvr_ioctl_create_vm_context_args args = {
+			._padding_4 = 1,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_VM_CONTEXT, &args, EINVAL);
+	}
+
+	igt_describe("Test VM context destruction with bad padding");
+	igt_subtest("destroy-vm-ctx-bad-padding")
+	{
+		struct drm_pvr_ioctl_destroy_vm_context_args args = {
+			._padding_4 = 1,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args, EINVAL);
+	}
+
+	igt_describe("Test VM context destruction with bad handle");
+	igt_subtest("destroy-vm-ctx-bad-handle")
+	{
+		struct drm_pvr_ioctl_destroy_vm_context_args args = {
+			.handle = 0xbad6bad6,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args, EINVAL);
+	}
+
+	igt_describe("Test VM context destruction with handle that is not a VM context");
+	igt_subtest("destroy-vm-ctx-handle-is-not-vm-ctx")
+	{
+		size_t size = 4096;
+		const uint32_t bo_handle = igt_pvr_ioctl_create_bo(fd, &size);
+		struct drm_pvr_ioctl_destroy_vm_context_args args = {
+			.handle = bo_handle,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DESTROY_VM_CONTEXT, &args, EINVAL);
+		gem_close(fd, bo_handle);
+	}
+
+	igt_fixture()
+	{
+		close(fd);
+	}
+}

-- 
2.43.0

