Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74646C54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:19:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19C9410E540;
	Tue, 28 Jul 2026 07:19:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="t8A0JaRG";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D41610E534
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:17 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6r4f71820224
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 08:19:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=h
 Y133o8fkKdQYE0qoyepMzuX1McpyR8p8KVj9yujcho=; b=t8A0JaRGLaUEcgDUx
 1tXVpeRYirpcX1D3LLkmePAXz59/G470M0GRvTqGtMwQ7iVv6PEbPF2aUaozPaa8
 HPQymjzdyZlLrG4yPsbmq3eP+zHfQPG1jBrLK19UUuFP03ZgVg0uFicGV2IEOn4W
 +mMMefduL9Gn5sG27yt41lLKbVvs/v1KjoQaf2/6mtvBf782Bwmzm4D7pOl2497L
 0L6pRaUkLD89bEXd8k/WJbIPSEofyFoO38Mc59wZdL/khUq3YAkRqH0vqTdE0Zhs
 XiUhTyHFEgRoUdo7WmZx9+YPTz9jzyox1j5N12Mr+38kp76GFmNIaDAPzvLaCIR4
 CG5Cg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 08:19:15 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:14 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 09:18:56 +0200
Subject: [PATCH i-g-t v5 01/10] tests/imagination: Add framework for
 Imagination tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-add-support-v5-1-33049f0d1937@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=9711;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=rsv6RGgbiw8UTDjLj+jsgEd+9ABpUUld617pVb797Vo=;
 b=djJjyc2L1V5MQbkrY1SThJT53iOZGVvD+OWIplj6jhsEHfSXToPRJYk2EzASq7lwD4v/7kCTX
 +TbL2DxjY+pAPeH3eKiadngbqGqyYHuPRu9oUrO3e8h8PvH/QXOr32n
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX7FbNXA7aiolw
 jlJl61FkIt2dGIdB99MmcurwEn9g+6AFy/c0VTthgXlPOJ91jXRuFnaEhioc2BhKsXQ40Cie7Y+
 jCxL+AoWDvasA/S8VVZl+5S0E1ALoM4=
X-Proofpoint-GUID: 09_V-HUboZsom4iCrcSvA0iqOZWtqq5f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX5jiXhh3X2JC3
 iu77bErfLsOWclvoDGhxOl9HJMkMwOhwp14+6bos8EsVGRPa+DYuU76In3ec/uU5m0KHYehj/H3
 NkPEvHNHU51t49wfDSuPJnbnt1NvU5NN/nic/FYhFEC2XhUPJEoO/M6BV9rmKThbDvfiJiRYH1E
 eS+o3zg9PKql1Bvt08RwUvI/H8I9crVJ5OmidU/Ok+qC3Zt4YZMHL8eq7WTWz2agcwJnJFeRxmD
 Ldoop9DK5K3p5kQduWVzngwMb7zdnzCL9U0BN4k91mpv+a/n4Ocipv2FAQ4BXBs0WgVoqhNTsnN
 rt297u5bGCvjeqXWfGDn9g/c31ddKMiVmqf3a3dRdCzylqPdmahuzh+5VHU/+9fzH/pC6HloAUV
 0sBFlVCaEjP+Csd80UHpTSzxLRXK4uCsZDsZYsgd+xP8sRQ9Yb3Yec+1tLd8EL4Rm8OUbEjn+Fp
 JcXGU7Edtc1EydadCBg==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f3 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=Q9A-fVuCs_m9Zx0QVbAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 09_V-HUboZsom4iCrcSvA0iqOZWtqq5f
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

Add the initial IGT infrastructure for PowerVR (Imagination) GPUs and
introduce the first GEM buffer object creation tests.

The tests verify valid BO creation and validate error handling for
invalid ioctl parameters.

PowerVR DRM driver background:
https://lore.kernel.org/dri-devel/cover.1700668843.git.donald.robson@imgtec.com/
Driver documentation:
https://docs.kernel.org/gpu/imagination/index.html

Signed-off-by: Matt Coster <matt.coster@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
 docs/platforms.md             |  1 +
 lib/drmtest.c                 | 11 +++++++
 lib/drmtest.h                 |  3 ++
 lib/igt_pvr.c                 | 75 +++++++++++++++++++++++++++++++++++++++++++
 lib/igt_pvr.h                 | 16 +++++++++
 lib/meson.build               |  1 +
 meson.build                   |  8 +++++
 tests/imagination/meson.build | 13 ++++++++
 tests/imagination/pvr_gem.c   | 66 +++++++++++++++++++++++++++++++++++++
 tests/meson.build             |  2 ++
 10 files changed, 196 insertions(+)

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
index 000000000..048ccab31
--- /dev/null
+++ b/lib/igt_pvr.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include <limits.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <sys/types.h>
+
+#include "igt_pvr.h"
+
+#include "drmtest.h"
+#include "ioctl_wrappers.h"
+
+#include "pvr_drm.h"
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
+/**
+ * igt_pvr_ioctl_create_bo:
+ * @fd: The file descriptor of the DRM device.
+ * @size: On entry, the requested size of the buffer object. On return, the
+ *        actual size of the buffer object.
+ *
+ * Function to create a buffer object.
+ *
+ * Returns: The handle of the created buffer object.
+ */
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
+
+/**
+ * igt_pvr_ioctl_get_bo_mmap_offset:
+ * @fd: The file descriptor of the DRM device.
+ * @handle: The handle of the buffer object.
+ *
+ * Function to get the mmap offset of a buffer object.
+ *
+ * Returns: The mmap offset of the buffer object.
+ */
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
index 000000000..e8b2d9026
--- /dev/null
+++ b/lib/igt_pvr.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 or MIT */
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#ifndef IGT_PVR_H
+#define IGT_PVR_H
+
+#include <stddef.h>
+#include <stdint.h>
+#include <sys/types.h>
+
+#include "pvr_drm.h"
+
+uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size);
+off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
+
+#endif /* IGT_PVR_H */
diff --git a/lib/meson.build b/lib/meson.build
index c45a96530..05632eede 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -110,6 +110,7 @@ lib_sources = [
 	'igt_asahi.c',
 	'igt_panfrost.c',
 	'igt_panthor.c',
+	'igt_pvr.c',
 	'igt_v3d.c',
 	'igt_vc4.c',
 	'igt_vmwgfx.c',
diff --git a/meson.build b/meson.build
index e09122a09..b30438e31 100644
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
@@ -355,6 +356,12 @@ if get_option('use_rpath')
 	endforeach
 	panthor_rpathdir = join_paths(panthor_rpathdir, libdir)
 
+	pvrdir_rpathdir = '$ORIGIN'
+	foreach p : pvrdir.split('/')
+		pvrdir_rpathdir = join_paths(pvrdir_rpathdir, '..')
+	endforeach
+	pvrdir_rpathdir = join_paths(pvrdir_rpathdir, libdir)
+
 	v3d_rpathdir = '$ORIGIN'
 	foreach p : v3ddir.split('/')
 		v3d_rpathdir = join_paths(v3d_rpathdir, '..')
@@ -392,6 +399,7 @@ else
 	msm_rpathdir = ''
 	panfrost_rpathdir = ''
 	panthor_rpathdir = ''
+	pvrdir_rpathdir = ''
 	v3d_rpathdir = ''
 	vc4_rpathdir = ''
 	vkms_rpathdir = ''
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
index 000000000..273f4d56f
--- /dev/null
+++ b/tests/imagination/pvr_gem.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include <linux/errno.h>
+#include <stddef.h>
+#include <stdint.h>
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
+		drm_close_driver(fd);
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

