Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591A5C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 09:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 071DE10F4C6;
	Fri, 17 Jul 2026 09:19:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="dkFkGznf";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453DB10F4C7
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:18:52 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7I4pR2913452
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=Z
 bYU9R17z3/AyF9oo3P5gf+3uP9lkCtU+VwbgEETmTo=; b=dkFkGznfTlCgLcGu6
 0ikX+vf+UEpgoLe0D20ntjjE+n/r2InI4iebxmSqnX8ZSGy20op6hMdc4q2hpPm6
 wLFE6vmkfHoMU5srGTNe8IFQwBHjx+IS632SPVzeQ1X7GWXsr0w+Ufm+CTz7opQA
 vanlQONKIMfw/WCozXMyzDBZGzqqxVSFGmLPbeBpM9Et1LIC4veFRQhjd0waCwVh
 YjbPizDcZIZacekrPOZnzA6HQHzJWKOa8LVs5nf5YJCUlsc6v/oFm6WMPc6TmmbI
 pKk8wXLVPSgStWShn6ffCOqQAvLd9/RBP32whxKsqEZatn0bfDgznqUJ1EMM9en7
 MSZvA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnk0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:50 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 10:18:49 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 11:18:14 +0200
Subject: [PATCH i-g-t v2 01/10] tests/imagination: Add framework for
 Imagination tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v2-1-e1bf415adcee@imgtec.com>
References: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784279928; l=8783;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=kvMFglLXexU1FHT5OxBA6S/luYycItTG6Id7+/ZYNdw=;
 b=CuP8TerRdmyWNFgtl+wDCWPyJHEj+6M8J4+9VLf+cig1LvxRnTYbnMzdrqKk3L10E8u10ygR1
 AyT3D6ofpbWD8H7pvu3hWHxo9Ff5JHU05VAITl05I9WrSXa18oOOeC1
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX3KkVm3bCY9dq
 OsEuMADbsqtE7chHSiib0x4GWq8SXmO6wsqZ0TaVgPoo8uDFglyJxjsEa0izTd/P5vRkir4drd5
 LL5YMTlnmu6SL0qSo5ZU45opj546gCfD6lcRQzLlYSYDjPgPvR3lPDWsLcPhrxFJlfn3Fqz0njT
 sIFxX9e5ylSw1KGSV7xxPtBZpZnQnW14G0i2xy0lFIfPr2fsyftbdPN6nitrlasHTq1lnqHAFUM
 dQrPf0h90ieAEsumwkriic9f0AxRjMV1CI8f2rnK4kwUo8V1yywoD3b/ofWmJqeu4AZ7V8QVikQ
 zwJS7lcstG5w8ie4M4HZFDprDNmrJP4/sn5qVzi4K+nOj0g1MAymOlOgtNHOxb5dVMqVWuo9agY
 cJyRdXyUd3JoiNpQubs/h77blODasPOaKg8fqAX3Vh0bvbt4HbEB5X5wWqUeSV9y4mbZECQcxtQ
 6VdSY4GP9oPghX6gUhA==
X-Proofpoint-ORIG-GUID: XQkFjq8sUtv10Ofe5KkDh0i-4QJ8p2mW
X-Proofpoint-GUID: XQkFjq8sUtv10Ofe5KkDh0i-4QJ8p2mW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfXzYJFvzcYWP+8
 kWm3o+Y2BapIBKycEDQNJEeG39hZurvThtWU+4bV0cqnTEzktYu3Hbvg5C8nuHwZ2hmE5EZsQWj
 7kDZSm8jeVLZcwpFrkt8Q8Dixr20HLM=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59f37a cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=VESB10uSWLxj4uFoBE4A:9 a=QEXdDO2ut3YA:10
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

From: Matt Coster <matt.coster@imgtec.com>

Also added initial GEM buffer object creation tests.

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
 docs/platforms.md             |  1 +
 lib/drmtest.c                 | 11 +++++++
 lib/drmtest.h                 |  3 ++
 lib/igt_pvr.c                 | 56 ++++++++++++++++++++++++++++++++++++
 lib/igt_pvr.h                 | 17 +++++++++++
 lib/meson.build               |  1 +
 meson.build                   |  9 ++++++
 tests/imagination/meson.build | 13 +++++++++
 tests/imagination/pvr_gem.c   | 67 +++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build             |  2 ++
 10 files changed, 180 insertions(+)

diff --git a/docs/platforms.md b/docs/platforms.md
index 214f53c1d..ea86a89c9 100644
--- a/docs/platforms.md
+++ b/docs/platforms.md
@@ -25,6 +25,7 @@ Support exists for the following platforms:
 - Panthor
 - Virtual GPUs (e.g., virtio_gpu in QEMU/KVM/AVD or vmwgfx)
 - Virtual display (vkms)
+- Imagination (powervr)
 
 #### Intel
 
diff --git a/lib/drmtest.c b/lib/drmtest.c
index b0be06a75..1e789d2af 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -143,6 +143,11 @@ bool is_msm_device(int fd)
 	return __is_device(fd, "msm");
 }
 
+bool is_pvr_device(int fd)
+{
+	return __is_device(fd, "powervr");
+}
+
 bool is_nouveau_device(int fd)
 {
 	/* Currently all nouveau-specific codepaths require libdrm */
@@ -227,6 +232,7 @@ static const struct module {
 	{ DRIVER_MSM, "msm" },
 	{ DRIVER_PANFROST, "panfrost" },
 	{ DRIVER_PANTHOR, "panthor" },
+	{ DRIVER_POWERVR, "powervr" },
 	{ DRIVER_V3D, "v3d" },
 	{ DRIVER_VC4, "vc4" },
 	{ DRIVER_VGEM, "vgem" },
@@ -988,6 +994,11 @@ void igt_require_amdgpu(int fd)
 	igt_require(is_amdgpu_device(fd));
 }
 
+void igt_require_imagination(int fd)
+{
+	igt_require(is_pvr_device(fd));
+}
+
 void igt_require_intel(int fd)
 {
 	igt_require(is_intel_device(fd));
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 9d488b274..012de9dee 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -59,6 +59,7 @@ int __get_drm_device_name(int fd, char *name, int name_size);
 #define DRIVER_VIRTIO	(1 << 10)
 #define DRIVER_PANTHOR	(1 << 11)
 #define DRIVER_ASAHI	(1 << 12)
+#define DRIVER_POWERVR	(1 << 13)
 
 /*
  * Exclude DRIVER_VGEM and DRIVER_VIRTIO from DRIVER_ANY since if you run
@@ -137,6 +138,7 @@ int drm_prepare_filtered_multigpu(int chipset);
 int drm_open_filtered_card(int idx);
 
 void igt_require_amdgpu(int fd);
+void igt_require_imagination(int fd);
 void igt_require_intel(int fd);
 void igt_require_i915(int fd);
 void igt_require_nouveau(int fd);
@@ -150,6 +152,7 @@ bool is_i915_device(int fd);
 bool is_mtk_device(int fd);
 bool is_msm_device(int fd);
 bool is_nouveau_device(int fd);
+bool is_pvr_device(int fd);
 bool is_vc4_device(int fd);
 bool is_xe_device(int fd);
 bool is_intel_device(int fd);
diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
new file mode 100644
index 000000000..957d459b1
--- /dev/null
+++ b/lib/igt_pvr.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include "igt_pvr.h"
+
+#include "drmtest.h"
+#include "ioctl_wrappers.h"
+
+#include "pvr_drm.h"
+
+#include <limits.h>
+#include <stddef.h>
+#include <stdint.h>
+
+#include <sys/types.h>
+
+/**
+ * SECTION:igt_pvr
+ * @short_description: PowerVR support library
+ * @title: pvr
+ * @include: igt.h
+ *
+ * This library provides various auxiliary helper functions for writing PowerVR
+ * tests.
+ */
+
+uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size)
+{
+	struct drm_pvr_ioctl_create_bo_args arg = {
+		.size = *size,
+	};
+
+	do_ioctl(fd, DRM_IOCTL_PVR_CREATE_BO, &arg);
+
+	igt_assert(arg.size >= *size && arg.size <= SIZE_MAX);
+	*size = (size_t)arg.size;
+
+	return arg.handle;
+}
+
+off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle)
+{
+	struct drm_pvr_ioctl_get_bo_mmap_offset_args arg = {
+		.handle = handle,
+	};
+
+	do_ioctl(fd, DRM_IOCTL_PVR_GET_BO_MMAP_OFFSET, &arg);
+
+	/*
+	 * There is no OFF_MAX equivalent to SIZE_MAX; use the identical (by
+	 * definition) PTRDIFF_MAX instead.
+	 */
+	igt_assert(arg.offset <= PTRDIFF_MAX);
+
+	return (off_t)arg.offset;
+}
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
new file mode 100644
index 000000000..33d826077
--- /dev/null
+++ b/lib/igt_pvr.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#ifndef IGT_PVR_H
+#define IGT_PVR_H
+
+#include "pvr_drm.h"
+
+#include <stddef.h>
+#include <stdint.h>
+
+#include <sys/types.h>
+
+uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size);
+off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
+
+#endif /* IGT_PVR_H */
diff --git a/lib/meson.build b/lib/meson.build
index c45a96530..c1bc81bab 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -135,6 +135,7 @@ lib_sources = [
 	'xe/xe_sriov_debugfs.c',
 	'xe/xe_sriov_provisioning.c',
 	'xe/xe_util.c',
+	'igt_pvr.c',
 
 	# Vendored libraries:
 	'vendor/uwildmat/uwildmat.c',
diff --git a/meson.build b/meson.build
index e09122a09..55c39c2ea 100644
--- a/meson.build
+++ b/meson.build
@@ -289,6 +289,7 @@ asahidir = join_paths(libexecdir, 'asahi')
 msmdir = join_paths(libexecdir, 'msm')
 panfrostdir = join_paths(libexecdir, 'panfrost')
 panthordir = join_paths(libexecdir, 'panthor')
+pvrdir = join_paths(libexecdir, 'imagination')
 unigrafdir = join_paths(libexecdir, 'unigraf')
 v3ddir = join_paths(libexecdir, 'v3d')
 vc4dir = join_paths(libexecdir, 'vc4')
@@ -384,6 +385,13 @@ if get_option('use_rpath')
 		vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, '..')
 	endforeach
 	vmwgfx_rpathdir = join_paths(vmwgfx_rpathdir, libdir)
+
+	pvrdir_rpathdir = '$ORIGIN'
+	foreach p : pvrdir.split('/')
+		pvrdir_rpathdir = join_paths(pvrdir_rpathdir, '..')
+	endforeach
+	pvrdir_rpathdir = join_paths(pvrdir_rpathdir, libdir)
+
 else
 	bindir_rpathdir = ''
 	libexecdir_rpathdir = ''
@@ -397,6 +405,7 @@ else
 	vkms_rpathdir = ''
 	unigraf_rpathdir = ''
 	vmwgfx_rpathdir = ''
+	pvrdir_rpathdir = ''
 endif
 
 build_testplan = get_option('testplan')
diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
new file mode 100644
index 000000000..65b90c39f
--- /dev/null
+++ b/tests/imagination/meson.build
@@ -0,0 +1,13 @@
+pvr_progs = [ 'pvr_gem',
+	    ]
+
+pvr_deps = test_deps
+
+foreach prog : pvr_progs
+	test_executables += executable(prog, prog + '.c',
+				       dependencies : pvr_deps,
+				       install_dir : pvrdir,
+				       install_rpath : pvrdir_rpathdir,
+				       install : true)
+	test_list += join_paths('pvr', prog)
+endforeach
diff --git a/tests/imagination/pvr_gem.c b/tests/imagination/pvr_gem.c
new file mode 100644
index 000000000..b80d202a2
--- /dev/null
+++ b/tests/imagination/pvr_gem.c
@@ -0,0 +1,67 @@
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
+	igt_describe("Test valid buffer object creation");
+	igt_subtest("create-bo-4096")
+	{
+		size_t size = 4096;
+		uint32_t handle = igt_pvr_ioctl_create_bo(fd, &size);
+
+		gem_close(fd, handle);
+	}
+
+	igt_describe("Test buffer object creation with 0 size");
+	igt_subtest("create-bo-0")
+	{
+		struct drm_pvr_ioctl_create_bo_args arg = {
+			.size = 0,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_BO, &arg, EINVAL);
+	}
+
+	igt_describe("Test buffer object creation with bad padding");
+	igt_subtest("create-bo-bad-padding")
+	{
+		struct drm_pvr_ioctl_create_bo_args arg = {
+			.size = 4096,
+			._padding_c = 0xbad6bad6,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_BO, &arg, EINVAL);
+	}
+
+	igt_describe("Test buffer object creation with unaligned size");
+	igt_subtest("create-bo-unaligned-fail")
+	{
+		struct drm_pvr_ioctl_create_bo_args arg = {
+			.size = 4000,
+		};
+
+		do_ioctl_err(fd, DRM_IOCTL_PVR_CREATE_BO, &arg, EINVAL);
+	}
+
+	igt_fixture()
+	{
+		close(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 6d90627b9..63adc61b9 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -561,3 +561,5 @@ if not meson.is_cross_build()
 endif
 
 subdir('intel-ci')
+
+subdir('imagination')

-- 
2.43.0

