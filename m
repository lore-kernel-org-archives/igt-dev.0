Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD3BC4451B
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:22:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D18810E462;
	Fri, 17 Jul 2026 14:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="U4DE8CE8";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338E210E472
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:10 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE41R63706767
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=h
 Y133o8fkKdQYE0qoyepMzuX1McpyR8p8KVj9yujcho=; b=U4DE8CE85LnsPGM39
 r9JQc4SMpAwvMhYJPqDYyd48ATjRtVhaHamJlA1C7J6bJM5EsdvSXTZS7z2AJML0
 aXV2KCFVSczhKfaALWUtjk0MGjSoudnjHR07MACijplejN69PV6y1HzTRHdRDDLd
 6qOYkpQYn5ebEoCCZPQtI7yl6h8hQwlwJFkVm1f1ueal1ZdsFS8Ph8XJY7MhJ+T2
 tLAG4H/6nou4OuDrm9Ox0Syj970Uzs8c+Kdq4rGON/yTQ+KKWbEthNMmGd69PdOJ
 3zHm9MqLRcAaeqYgekFmMfj53CtOp6djsqSYZTQaU6B8EMfapkuJWk4tv4D5Zg94
 Fae3g==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7d61c-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:08 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:07 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 16:21:33 +0200
Subject: [PATCH i-g-t v3 01/10] tests/imagination: Add framework for
 Imagination tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v3-1-ce69f9ad330c@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=9711;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=rsv6RGgbiw8UTDjLj+jsgEd+9ABpUUld617pVb797Vo=;
 b=/NOgluKzpSaa+1ghcHzIkannY2IdCpfD+n/hetN1GoYEqiBQs2vhSAZEERxA5ddw9g//92uvW
 ScztF4SJeGpCV4L3B9e2Z64xecjkljw+R6B3INpIh1cMQL4URuGMDRz
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfXw69kbBW6xEg5
 i7qWydQ8NzluN/060zx0PR3TvLEh+edlVsLPXCQJ6fyYW9HGUnekhBYlBWXJKhnqYM9xJ/6w65O
 /XLTfjXSKKKTkFvHJxj5cmpd2TQMibE=
X-Proofpoint-GUID: PEo27F3U46RCA8JIJWaJGmZnR1ksw-RL
X-Proofpoint-ORIG-GUID: PEo27F3U46RCA8JIJWaJGmZnR1ksw-RL
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a5a3a90 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=Q9A-fVuCs_m9Zx0QVbAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfXzLFXNLM+IpZy
 lzfkEdsubGEJH89JXzmqfS2o2nTGdlB8yXIDB4KkzZlImO8/DGziP+FI5+719caEW1dU5VnZkPu
 vB6d3pGMuxzG1bMK8b4n6O7Ahb+4eRgBNNio9YUQaS4HS09rxj8CxOp5vvkdYUmoa1oraFzobYl
 v59/4aGbYwnHZ6ZnAWgJ8lUKTCeXo8Xz1YIwVkZyqB/S3tpM/T5x7wmlFEbTwVAuwEZy21QwIyR
 K8ODtfRADhEpn/4vdIpIw2crY1ROg78h2vki+FoEoyAFcHx8g1ig3y5E1vpR2PUM7ljZii9bk4y
 dOexEsIdS5l47xaMBASZjXukbtjmcnbdgSOXUFkhkTQy4fIwLGfdBM2klbh0TmRinBGy7x7HuY5
 iV9kJRZYpfl+kkgWRS8rEn/Oz1iR79v5r6EEPof7avKGvYPhLhA4AbflGV2TRz6L7q+1M50wnlr
 yC2IY2NgPQHPEBZ3YEQ==
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

