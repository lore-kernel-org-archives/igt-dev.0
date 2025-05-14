Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA83BC3ABCC
	for <igt-dev@archiver.kernel.org>; Wed, 14 May 2025 10:29:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F201B10E043;
	Wed, 14 May 2025 10:29:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dLNjuuIN";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7293A10E043
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 10:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747218555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fDyDoGa8iGTiztRwq270CFR/u5k9z2FsuvoZwAPZ0CY=;
 b=dLNjuuIN8v1KjhoFcyGnRg6vVUyYZ3rYTzXNnPT1jED+r2qFpUq/5p4hCw6BTzoD0FYTBM
 xqk5/Ad9RYv+V59MHrAUEfJHKfR1UvN+LRW4QKc11wDwHVqxv1a92A0LQcewqUk7DXYkt2
 d9JbyoMxpt0MeOH+FPf5ZDkkGW81684=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-kOjykmsONfWKGGI6QkADFg-1; Wed, 14 May 2025 06:29:13 -0400
X-MC-Unique: kOjykmsONfWKGGI6QkADFg-1
X-Mimecast-MFC-AGG-ID: kOjykmsONfWKGGI6QkADFg_1747218553
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a0b662be0cso4354144f8f.2
 for <igt-dev@lists.freedesktop.org>; Wed, 14 May 2025 03:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747218552; x=1747823352;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fDyDoGa8iGTiztRwq270CFR/u5k9z2FsuvoZwAPZ0CY=;
 b=ARExGyQfhBaIrxO8eTLz2cyj5A9zFTC6+BqdvEW6ysRVce+0DcsOSLvNf9dgfYtqSp
 w4x4ldm5sfsOXjds4H4ApJi3wVbTx54BluUkzP7tKGil3A27LBaZZogV5f4ktE9OablB
 NMt9KdQFp6K3Aa/c4LpKE5p9cnA0h8fN11mZLfdZ5E+fJkDhHfoWkfe6qDcb/qV9/0i2
 G49zD+dkahXpzd5qijTO2QBKx+qceCHnm/vy3l2RwbsByUK4+gmVr8QXrYMljrhZ3rtZ
 XFWpYa1Jr8oiZGvN5ZyPgLNY44II3T9lRNxVMhczZnDF3YPJJ7QMOi3wBS+PKVEhDQX/
 2ryg==
X-Gm-Message-State: AOJu0Yz/8G1zXSVGT2f45LdYfQz1E/b2LPBf1jiYqGjm7VMnvUf4dR4u
 dsRqbteQ9HaIruoeegg/+4atfOm0PsrRnEW2pAW49h8KJBbjNaI5jpxTmmyFqUOVwsbMLSJjaTo
 nx71pUjU6m4l0MDo/CygMXYNeBCXeNcoS97/lIk/1elp7B6rX5WsRvIeS02C+gNgsO2dtfZ32kD
 dOB51pvvtum+sFaHWjvAWSxCM7mocK1VXpCm8v2lhfhxLoUNsL
X-Gm-Gg: ASbGncsBwlfRCG9QpwMf6kYuwLzZFo7fE1q0dXVLdynbqa0wIFRLtqODavTmdBWHUIT
 3+0OnFN8Ak/ICQwit4Wg9SYfWk8MRci/b0DJYRaZMoZOedVsD8TJd307ijtYP811pz2lXyVDow8
 FM13/XLPRgJRCnn3ZVoVMGChgMi6YcPh3zw50g/EhueM8qLsfBgE3DFSPDS81VBBzIQYNl/qcvN
 ifesx5q/MdZx3e4DOoKREy0yK4Is+foxg824TVyaxJMF1FfthCn/bMzsDZxotkSWZGAdi4p+Cqo
 Ih3Hd4+WyGeeMohgUgJQbZ1ypR7bBurdBrTKZ9wl8vSiiFQyx/A=
X-Received: by 2002:a05:6000:22c2:b0:3a1:f561:6894 with SMTP id
 ffacd0b85a97d-3a34992266cmr2179967f8f.44.1747218551707; 
 Wed, 14 May 2025 03:29:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErNd/I3P1Qyl/FWfXKHhLo9zrU/PfUy+faFy3JiZHJW6LpD4Xp5ZmIgI1kv38nYmeuwVSpDw==
X-Received: by 2002:a05:6000:22c2:b0:3a1:f561:6894 with SMTP id
 ffacd0b85a97d-3a34992266cmr2179932f8f.44.1747218551234; 
 Wed, 14 May 2025 03:29:11 -0700 (PDT)
Received: from fedora.redhat.com (185-219-167-200-static.vivo.cz.
 [185.219.167.200]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f5a4c7a5sm19464161f8f.98.2025.05.14.03.29.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 03:29:10 -0700 (PDT)
From: Dorinda Bassey <dbassey@redhat.com>
To: igt-dev@lists.freedesktop.org
Cc: javierm@redhat.com, aesteve@redhat.com, Dorinda Bassey <dbassey@redhat.com>
Subject: [PATCH] drm_virtgpu: Add functional coverage for core VirtIO-GPU
 ioctls
Date: Wed, 14 May 2025 12:28:00 +0200
Message-ID: <20250514102815.1413678-1-dbassey@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xtImmxjq7d4rbFcWo9cwXZgyKKHAYbd7FKeos6JEPCk_1747218553
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=y
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

This test suite adds coverage for multiple DRM ioctls specific
to the VirtIO-GPU driver, verifying functionality such as
resource creation, memory mapping, 3D transfers, context
initialization, and parameter querying.
Each test validates a key ioctl to ensure correct behavior from
user space and backend implementations. Each subtest is
self-contained and can be executed independently.

Included subtests:
  - drm-virtgpu-map
  - drm-virtgpu-execbuffer
  - drm-virtgpu-resource-info
  - drm-virtgpu-3d-transfer-to-host
  - drm-virtgpu-3d-transfer-from-host
  - drm-virtgpu-3d-wait
  - drm-virtgpu-resource-create-blob
  - drm-virtgpu-get-caps
  - drm-virtgpu-context-init
  - drm-virtgpu-getparam

How to Test with QEMU virtio-vga-gl or rustvmm vhost-device-gpu

1. Launch a QEMU guest with virtio-vga-gl
./build/qemu-system-x86_64 \
  -enable-kvm \
  -cpu host \
  -m 4096 \
  -machine q35 \
  -display gtk,gl=on \
  -vga none \
  -device virtio-vga-gl \
  -drive file=image.qcow2,format=qcow2 \
  -netdev user,id=n0,hostfwd=tcp::2222-:22 \
  -device virtio-net-pci,netdev=n0

ssh into the guest and run the tests.

2. Start the vhost-device-gpu backend and Launch a QEMU
guest with vhost-user-gpu-pci or vhost-user-vga, see guide on:
https://crates.io/crates/vhost-device-gpu

Signed-off-by: Dorinda Bassey <dbassey@redhat.com>
---
 tests/drm_virtgpu.c | 388 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build   |   1 +
 2 files changed, 389 insertions(+)
 create mode 100644 tests/drm_virtgpu.c

diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
new file mode 100644
index 000000000..8de7880db
--- /dev/null
+++ b/tests/drm_virtgpu.c
@@ -0,0 +1,388 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Red Hat Inc.
+ *
+ * Authors: Dorinda Bassey <dbassey@redhat.com>
+ */
+
+/**
+ * TEST: drm virtgpu ioctls
+ * Description: Testing of the virtIO-GPU driver DRM ioctls
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category:  virtIO-GPU DRM ioctls
+ * Functionality: drm_ioctls
+ * Feature: Virtualization graphics support
+ * Test category: functionality test
+ */
+
+#include "igt.h"
+
+#include "drm.h"
+#include "virtgpu_drm.h"
+
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/ioctl.h>
+
+/**
+ * SUBTEST: drm-virtgpu-map
+ *
+ * SUBTEST: drm-virtgpu-execbuffer
+ *
+ * SUBTEST: drm-virtgpu-resource-info
+ *
+ * SUBTEST: drm-virtgpu-3d-transfer-to-host
+ *
+ * SUBTEST: drm-virtgpu-3d-transfer-from-host
+ *
+ * SUBTEST: drm-virtgpu-3d-wait
+ *
+ * SUBTEST: drm-virtgpu-resource-create-blob
+ *
+ * SUBTEST: drm-virtgpu-get-caps
+
+ * SUBTEST: drm-virtgpu-context-init
+ *
+ * SUBTEST: drm-virtgpu-getparam
+ */
+
+IGT_TEST_DESCRIPTION(" Testing of the virtIO-GPU driver DRM ioctls");
+
+#define VIRTGPU_DEVICE "/dev/dri/card0"
+
+#define CAPS_BUFFER_SIZE 4096
+
+static const struct {
+	const char *name;
+	uint64_t id;
+} params[] = {
+	{"3D_FEATURES", VIRTGPU_PARAM_3D_FEATURES},
+	{"CAPSET_QUERY_FIX", VIRTGPU_PARAM_CAPSET_QUERY_FIX},
+	{"RESOURCE_BLOB", VIRTGPU_PARAM_RESOURCE_BLOB},
+	{"HOST_VISIBLE", VIRTGPU_PARAM_HOST_VISIBLE},
+	{"CROSS_DEVICE", VIRTGPU_PARAM_CROSS_DEVICE},
+	{"CONTEXT_INIT", VIRTGPU_PARAM_CONTEXT_INIT},
+	{"SUPPORTED_CAPSET_IDs", VIRTGPU_PARAM_SUPPORTED_CAPSET_IDs},
+	{"EXPLICIT_DEBUG_NAME", VIRTGPU_PARAM_EXPLICIT_DEBUG_NAME},
+};
+
+static void test_capset(int drm_fd, uint32_t capset_id)
+{
+	uint8_t *caps_buf;
+	struct drm_virtgpu_get_caps caps;
+	int ret;
+	int i;
+
+	caps_buf = malloc(CAPS_BUFFER_SIZE);
+	igt_require(caps_buf);
+	memset(caps_buf, 0, CAPS_BUFFER_SIZE);
+
+	memset(&caps, 0, sizeof(caps));
+	caps.cap_set_id = capset_id;
+	caps.size = CAPS_BUFFER_SIZE;
+	caps.addr = (uintptr_t) caps_buf;
+
+	ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_GET_CAPS, &caps);
+	if (ret == 0) {
+		igt_info("Capset ID %u: SUCCESS\n", capset_id);
+		igt_info("  Reported size: %u\n", caps.size);
+		igt_info("  First 16 bytes: ");
+		for (i = 0; i < 16; i++)
+			igt_info("%02x ", caps_buf[i]);
+		igt_info("\n");
+	} else {
+		igt_info("Capset ID %u: FAILED - %s\n", capset_id,
+			 strerror(errno));
+	}
+
+	free(caps_buf);
+}
+
+igt_main {
+	int drm_fd;
+	void *caps_buf = NULL;
+
+	struct drm_virtgpu_resource_create args;
+	bool resource_created = false;
+
+	igt_fixture {
+		int ret;
+
+		drm_fd = open(VIRTGPU_DEVICE, O_RDWR | O_CLOEXEC);
+		igt_require(drm_fd >= 0);
+
+		caps_buf = malloc(CAPS_BUFFER_SIZE);
+		igt_require(caps_buf);
+		memset(caps_buf, 0, CAPS_BUFFER_SIZE);
+
+		// Create resource
+		memset(&args, 0, sizeof(args));
+		args.target = 2;
+		args.format = 87;
+		args.bind = (1 << 0);
+		args.width = 64;
+		args.height = 64;
+		args.depth = 1;
+		args.array_size = 1;
+
+		ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_CREATE, &args);
+		igt_assert_f(ret == 0, "RESOURCE_CREATE failed: %s\n",
+			     strerror(errno));
+		igt_assert_neq(args.res_handle, 0);
+
+		resource_created = true;
+		igt_info("Created resource: res_handle=%u, bo_handle=%u\n",
+			 args.res_handle, args.bo_handle);
+	}
+
+	igt_describe
+	    ("Maps a buffer object and tests read/write access via mmap.");
+	igt_subtest("drm-virtgpu-map") {
+		struct drm_virtgpu_map map = { };
+		void *map_ptr;
+		int ret;
+
+		memset(&map, 0, sizeof(map));
+		map.handle = args.bo_handle;
+
+		// Request mmap offset
+		ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_MAP, &map);
+		igt_assert_f(ret == 0, "MAP ioctl failed: %s\n",
+			     strerror(errno));
+		igt_assert(map.offset != 0);
+
+		// Try mmap
+		map_ptr =
+		    mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, drm_fd,
+			 map.offset);
+		igt_assert(map_ptr != MAP_FAILED);
+
+		igt_info("Successfully mmap'ed BO: offset=0x%lx\n",
+			 (unsigned long)map.offset);
+
+		// Simple test: write and read
+		memset(map_ptr, 0xaa, 4096);
+		igt_assert(((uint8_t *) map_ptr)[0] == 0xaa);
+
+		munmap(map_ptr, 4096);
+	}
+
+	igt_describe("Submits a dummy execbuffer to the GPU.");
+	igt_subtest("drm-virtgpu-execbuffer") {
+		struct drm_virtgpu_execbuffer execbuf = { };
+		uint32_t handles[1];
+		int ret;
+
+		handles[0] = args.bo_handle;
+
+		// Submit dummy execbuffer
+		execbuf.flags = 0;
+		execbuf.size = 0;       // No command
+		execbuf.command = 0;    // No command buffer
+		execbuf.bo_handles = (uintptr_t) handles;
+		execbuf.num_bo_handles = 1;
+		execbuf.fence_fd = -1;  // No fence
+		execbuf.ring_idx = 0;   // Default ring
+
+		ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_EXECBUFFER, &execbuf);
+		igt_assert_f(ret == 0, "EXECBUFFER ioctl failed: %s\n",
+			     strerror(errno));
+
+		igt_info("EXECBUFFER submitted successfully.\n");
+	}
+
+	igt_describe
+	    ("Validates that the GPU resource info ioctl returns expected metadata.");
+	igt_subtest("drm-virtgpu-resource-info") {
+		struct drm_virtgpu_resource_info info;
+		int ret;
+
+		igt_require_f(resource_created,
+			      "Resource must be created before this test");
+
+		memset(&info, 0, sizeof(info));
+		info.bo_handle = args.bo_handle;
+
+		ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_INFO, &info);
+		igt_assert_f(ret == 0, "RESOURCE_INFO failed: %s\n",
+			     strerror(errno));
+		igt_assert_eq(info.res_handle, args.res_handle);
+		igt_assert(info.size > 0);
+
+		igt_info("Queried resource info:\n");
+		igt_info("  size:      %u bytes\n", info.size);
+		igt_info("  res_handle %u\n", info.res_handle);
+		igt_info("  blob_mem:  %u\n", info.blob_mem);
+	}
+
+	igt_describe
+	    ("Transfers buffer contents from guest memory to the host.");
+	igt_subtest("drm-virtgpu-3d-transfer-to-host") {
+		int ret;
+		struct drm_virtgpu_3d_transfer_to_host xfer = {
+			.bo_handle = args.bo_handle,
+			.box = {
+			.x = 0,
+			.y = 0,
+			.z = 0,
+			.w = args.width,
+			.h = args.height,
+			.d = 1,
+			},
+			.level = 0,
+			.offset = 0,
+			.stride = 0,
+			.layer_stride = 0,
+		};
+
+		igt_require_f(resource_created,
+	    "Resource must be created before this test");
+
+		ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_TRANSFER_TO_HOST, &xfer);
+		igt_assert_f(ret == 0, "TRANSFER_TO_HOST failed: %s\n",
+			     strerror(errno));
+		igt_info("TRANSFER_TO_HOST completed\n");
+	}
+
+	igt_describe("Transfers buffer contents from the host to guest memory.");
+	igt_subtest("drm-virtgpu-3d-transfer-from-host")
+	{
+		int ret;
+		struct drm_virtgpu_3d_transfer_from_host xfer_in = {
+			.bo_handle = args.bo_handle,
+			.box = {
+			.x = 0,
+			.y = 0,
+			.z = 0,
+			.w = args.width,
+			.h = args.height,
+			.d = 1,
+			},
+			.level = 0,
+			.offset = 0,
+			.stride = 0,
+			.layer_stride = 0,
+		};
+
+	igt_require_f(resource_created,
+	    "Resource must be created before this test");
+
+	ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_TRANSFER_FROM_HOST, &xfer_in);
+	igt_assert_f(ret == 0, "TRANSFER_FROM_HOST failed: %s\n", strerror(errno));
+	igt_info("TRANSFER_FROM_HOST completed\n");
+	}
+
+	igt_describe
+	    ("Waits for a GPU operation to complete on a specific resource.");
+	igt_subtest("drm-virtgpu-3d-wait") {
+		struct drm_virtgpu_3d_wait wait = {.handle = args.bo_handle };
+
+		int ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_WAIT, &wait);
+
+		if (ret == 0)
+			igt_info("WAIT succeeded.\n");
+		else
+			igt_info("WAIT failed as expected (%s).\n",
+				 strerror(errno));
+	}
+
+	igt_describe
+	    ("Creates a GPU resource using the blob interface with memory flags.");
+	igt_subtest("drm-virtgpu-resource-create-blob") {
+		struct drm_virtgpu_resource_create_blob blob = {
+			.blob_mem = VIRTGPU_BLOB_MEM_GUEST,
+			.blob_flags =
+			    VIRTGPU_BLOB_FLAG_USE_MAPPABLE |
+			    VIRTGPU_BLOB_FLAG_USE_SHAREABLE,
+			.size = 4096,
+			.blob_id = 0,
+			.cmd_size = 0,
+			.cmd = (uintptr_t) NULL,
+		};
+
+		int ret =
+		    ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_CREATE_BLOB,
+			  &blob);
+		igt_assert_f(ret == 0, "Blob creation ioctl failed: %s\n",
+			     strerror(errno));
+		igt_assert_eq(ret, 0);
+		igt_assert_neq(blob.res_handle, 0);
+	}
+
+	igt_describe
+	    ("Queries different GPU capsets and prints the response payload.");
+	igt_subtest("drm-virtgpu-get-caps") {
+		// Test multiple capsets
+		test_capset(drm_fd, 1); // VirGL
+		test_capset(drm_fd, 2); // GFXSTREAM
+		test_capset(drm_fd, 9999);      // Invalid (expect failure)
+	}
+
+	igt_describe
+	    ("Initializes a GPU context with parameters like capset ID and debug name.");
+	igt_subtest("drm-virtgpu-context-init") {
+		struct drm_virtgpu_context_set_param ctx_params[2];
+		struct drm_virtgpu_context_init ctx_init;
+		int ret;
+
+		memset(ctx_params, 0, sizeof(ctx_params));
+
+		ctx_params[0].param = VIRTGPU_CONTEXT_PARAM_CAPSET_ID;
+		ctx_params[0].value = 1;
+
+		ctx_params[1].param = VIRTGPU_CONTEXT_PARAM_DEBUG_NAME;
+		ctx_params[1].value = (uintptr_t) "IGT-Test-Context";
+
+		memset(&ctx_init, 0, sizeof(ctx_init));
+		ctx_init.num_params = 2;
+		ctx_init.ctx_set_params = (uintptr_t)&ctx_params[0];
+
+		ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_CONTEXT_INIT, &ctx_init);
+		if (ret == -1 && errno == EEXIST) {
+			igt_info
+			    ("CONTEXT_INIT with params failed as expected (already initialized)\n");
+		} else {
+			igt_assert_f(ret == 0,
+				     "CONTEXT_INIT with params ioctl failed: %s\n",
+				     strerror(errno));
+			igt_info("CONTEXT_INIT with parameters succeeded\n");
+		}
+	}
+
+	igt_describe
+	    ("Verifies which VirtIO-GPU features are supported by querying driver parameters.");
+	igt_subtest("drm-virtgpu-getparam") {
+		bool found_supported = false;
+		uint64_t actual_value = 0;
+
+		for (size_t i = 0; i < ARRAY_SIZE(params); i++) {
+			struct drm_virtgpu_getparam gp = {
+				.param = params[i].id,
+				.value = (uintptr_t)&actual_value,
+			};
+
+			int ret =
+			    ioctl(drm_fd, DRM_IOCTL_VIRTGPU_GETPARAM, &gp);
+			if (ret == 0) {
+				found_supported = true;
+				igt_info("GETPARAM %s (ID=%lu): value = %llu\n",
+					 params[i].name, params[i].id,
+					 gp.value);
+			} else {
+				igt_info("GETPARAM %s (ID=%lu): failed - %s\n",
+					 params[i].name, params[i].id,
+					 strerror(errno));
+			}
+		}
+
+		igt_assert_f(found_supported,
+			     "No GETPARAM query returned a value.");
+	}
+
+	igt_fixture {
+		free(caps_buf);
+		close(drm_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 20ddddb89..ac85cac30 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -13,6 +13,7 @@ test_progs = [
 	'drm_buddy',
 	'drm_mm',
 	'drm_read',
+	'drm_virtgpu',
 	'fbdev',
 	'kms_3d',
 	'kms_addfb_basic',
-- 
2.48.1

