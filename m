Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF290C4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:26:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9248710E473;
	Fri, 17 Jul 2026 14:26:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="oKwWUxIP";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E49E10E472
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:14 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE41R73706767
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=0
 dDL6Y+0mprnzqxt1S5eAdGYSIXZiAI1kobNWY1KilY=; b=oKwWUxIPz8IvumB0S
 QPjpcxsm8xbDP4XtQiX4RHBGsheYAo6dh4LyldxeHU9wFLRiCCFcPdUwVYB9hhr3
 FxmyLdqBvOnKIdDhScuicg88iUKESDyL39P3ut92VpOYKwxynZcK9pC5awxbXNSG
 i/ZoE/rKbi0DEPqmqqMuVDv84ebApMH7srxmQ/SCoX4bVFXkr3D8y8beJ/DHQ5N/
 W6aWBA+IUWyJFJfTNy4SOmRB31jrwmckfdqHy/HHdTcyLQmXcGGD51HNOyAbwFia
 Bphb1ePIF7UppYG3wgiyWgoiO6kMqyopqUnYpslw6wZQg5plnkjQ8U3i+s8X8WHa
 8BSFw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7d61h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:13 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:12 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 16:21:39 +0200
Subject: [PATCH i-g-t v3 07/10] tests/imagination: Add VM_CONTEXT tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v3-7-ce69f9ad330c@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=5016;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=s8FYMEGfqIzC54ZxIB2jNMFroroLzRFeBkMOj9RDqk4=;
 b=c19LoGTysmT+XKgVs08GJNrapAEPwZYYs+Yx+x8Hy0oCUF8VLe+9MMc51qtEZu9aF24LLM791
 Pk28FskfndzCKOFTKjRigr5q9ZLDVJKhmtjPUqlPeG1zfhdc+jlA7b1
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfXxW86+AJHB2Tl
 mJd5HJot4W1GOvUis6QcqXbG2/wtcSbBiItIBjIcHgMNTiAHuTCJFlJvJYRWYQ07VgaLCCn71PG
 yVCIsoz715cuDRn+0PAYt8xFyjd0U6A=
X-Proofpoint-GUID: _3chsSUHUghiPTk5UMaW05mARoZiG9Ml
X-Proofpoint-ORIG-GUID: _3chsSUHUghiPTk5UMaW05mARoZiG9Ml
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a5a3a95 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=XjKxqXRqJ_dD72vPlP4A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX3KnZxHc+gkKd
 0H35P9h3ZD4Br6Gofdp0sjlP2gn5szJtYmwY9avbKMnIBtVZspLE+LMNmnacgq8fFdTdev2temn
 wUwYzEDQvOKUDapcubFURZEUzeuZQT/xgRf2x3afxCDBOdLVV08o7gbJyuYBi7GFpMxpngqlWfn
 RIOa7mYP+PdZKnaG0biXUpN0Kbv/fVlbQmzFoZ2MLSG1f2NKXkSLd3oPryrmovzhrf8dYN1USgz
 kI0R2Fed+WyjH8cEnaknblXBDje9CR1meTEVhHiDP0poIwkohP959I/8xOYtIiWUhzrLnp8jLLX
 tcqISrDwCZKdobdbtxlUSiZs3MNjEpuOpQRENNDWMenRjkUCgi6m3IusEKdXsW9a8PZKWro/flP
 CQ9wa2NwURxruxSJ+auEZTFAPfugR7/o90IAjoXeXKz8UcI2j8QcEwGCJrAZmRR7MaFgNzXlRDb
 5FGQms6bl02s+aJV1qw==
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
 lib/igt_pvr.c                      | 43 +++++++++++++++++++++
 lib/igt_pvr.h                      |  3 ++
 tests/imagination/meson.build      |  1 +
 tests/imagination/pvr_vm_context.c | 78 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 125 insertions(+)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 70fc71388..b97349044 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -164,3 +164,46 @@ igt_pvr_get_static_data_areas(int fd, uint32_t *array_len_out)
 
 	return sdas;
 }
+
+/**
+ * igt_pvr_ioctl_create_vm_context:
+ * @fd: The file descriptor of the DRM device.
+ * @expect_err: Expected error code, or 0 if no error is expected.
+ *
+ * Function to create a VM context.
+ *
+ * Returns: The handle of the created VM context.
+ */
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
+/**
+ * igt_pvr_ioctl_destroy_vm_context:
+ * @fd: The file descriptor of the DRM device.
+ * @handle: The handle of the VM context to destroy.
+ * @expect_err: Expected error code, or 0 if no error is expected.
+ *
+ * Function to destroy a VM context.
+ */
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
index 19909480b..871c8a48e 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -21,4 +21,7 @@ igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);
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
index 000000000..84e9d39a3
--- /dev/null
+++ b/tests/imagination/pvr_vm_context.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include <linux/errno.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_pvr.h"
+
+#include "pvr_drm.h"
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
+		drm_close_driver(fd);
+	}
+}

-- 
2.43.0

