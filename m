Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D92EFC53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:23:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8092A10E7CF;
	Tue, 28 Jul 2026 07:23:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="OZ8od061";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCFB10E534
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:20 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S709KC1832408
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 08:19:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=d
 XTQWoUqwa/g8yDXxHPymnT/O5EypjaspiFKdS/mFKw=; b=OZ8od061GE4qrhG1E
 s4OM9E2uxu/hPJqUs5ENBcnT9HDsm8XHNHrFzPTq5+FWYmCrvd0y+ATL563Q7SAx
 DehWzsyvOzXdSi9IdnCVV4Z9b2b/s7JPxG3L7vt+ixXCA0O0UMwiUF7Ag9YSZjn9
 WonEmo/gpKORckiNJQnzc8IeONpGsKe/dauSHQGwnzVrX4aVu0rCYQggI/PCCm4B
 /XlDI9CNn8KcD/gtnGgN7KAyGsRqqMAe0Txw8ugPhdWGI67We46yJJS0MDC96PFn
 OwfrV7/W1TeFvR0lZZo8rL547q2Up5dYJmPidLimFt3dU2JKnMftBxaTuptMJQag
 p4IvQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 08:19:19 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:18 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 09:19:02 +0200
Subject: [PATCH i-g-t v5 07/10] tests/imagination: Add VM_CONTEXT tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-add-support-v5-7-33049f0d1937@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=5010;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=/54ZExFx/SMqt0QS07das52Dih7YHsgOWKvyYAigBr8=;
 b=l8rO/eYK5di8jGND/Y+wQc/oGuuPcdSdSFJ85FBDbAyKgQmhoGteO4PYJXaeVIS5Ew/8bOPGX
 oGXQQ1MBadZC+hgPHhZ9+DukdgLDTsG1KYvMsAhTmALAbD724HLossV
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfXxtkhkbPDY3SK
 DY3qeCZsX9bD6I+RKi4ZT3N4wMMI9Sqh9mtBIsjCKjUwtqx9mWageQ8hrDTyGYosV1RMlzUHB6X
 4mTnUU5/7Jfbw3I0PBq4oXei4EuretM=
X-Proofpoint-GUID: wLwxWj5j6abz2r0UhG2-qUq_gsdEx7QA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX0m5tBm3BAi7J
 7d+t+U6+Z5poVzBotmWJf9NqMkKJX2X/K5OPQXAsqmaVp+UWe6tBel8jG4gQNVdoql27AePsxSv
 QSGQ7Cir6Ai3tKkNwJYfPQZgTb10cFvOezFBgbcteKUBSJOlopxbXHOSUYp6+Lz7MRkVppKeG4k
 MM0EWGrIG3B/Mm0dq1k+jSbg7s8gFHGDQx8WRfa1NCo28LDJZ0rf0GegGb+hD/Rne8x0Q/M9srO
 Aal5qb8tGZslrqttQw+4me9C51BbCxIcUtVJ3bkbSvwrmpGDkyxlzQKLALtfzbMbXiiVJVm5pl8
 R2iJfCntgDAWKeiD8V9XFdYyJwULqiwDRp7N4R8bzWeFp27Rop5wjT/jVLwg15IqawysrmY0p+A
 ASrTWDwDijmHqYCzYxXzePWyD2hai6te6AY1cDsflAc1jwp9nbgRlvGAI5ES0I8gP2PKPUFz9bF
 J0njhv8zbAIXGYUCX4A==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f7 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=XjKxqXRqJ_dD72vPlP4A:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: wLwxWj5j6abz2r0UhG2-qUq_gsdEx7QA
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
index c1e68aef1..d9f620141 100644
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
index 000000000..a41c39aff
--- /dev/null
+++ b/tests/imagination/pvr_vm_context.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include <errno.h>
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

