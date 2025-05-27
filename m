Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17388C54ED1
	for <igt-dev@archiver.kernel.org>; Tue, 27 May 2025 14:34:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E8D10E41F;
	Tue, 27 May 2025 14:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BFR2EPUk";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 654E310E511
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 14:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748356489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VvsrX0SktWjSH50A1mj0jTX2X5DQ7sKhCv3ZTI6HWF4=;
 b=BFR2EPUkmAMrBlAejd4k1tsIA4POvMfoqs20okvX6nbnqSBrTi2yvV0h3Cp39irJK28tGW
 WAqd11U6HuU3ZhCcJF4VJNb1oDEx9efYAarRRaLzp4aKAkRJxrJEsxjeXlAPYooDg1kKbz
 xmunBEHaJqhVoGMPWcnw8XPSo1DFsN4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-XEpZ-1DKN_qJwPEB7yAaOg-1; Tue, 27 May 2025 10:34:45 -0400
X-MC-Unique: XEpZ-1DKN_qJwPEB7yAaOg-1
X-Mimecast-MFC-AGG-ID: XEpZ-1DKN_qJwPEB7yAaOg_1748356484
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-3a4bafbb1abso2228502f8f.1
 for <igt-dev@lists.freedesktop.org>; Tue, 27 May 2025 07:34:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748356484; x=1748961284;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VvsrX0SktWjSH50A1mj0jTX2X5DQ7sKhCv3ZTI6HWF4=;
 b=JFxDpd3zXp82MIrd9z0L4aiJ4xSk/Amohuv0HRCRNtEyBGcbtQovQ/e9+Qw6f327+p
 gw8sQsCciQpvp9zQE4QoNBOQHilLFMNXjBrcoiVBciDEOYby/cgBTrHSh3mGqaK+fBe4
 Hd6s1vyaUOFBQDGl5Rm8U200n/zqCOmOUqKBoRrr6LFXDa4aIsQEvoetJo6j0oLuT8Ao
 zU0Y8gMrxzxaB6LTQ9g2MqDRYTcNtPHyxWkXMb4RPJ3tlT3S/yYgUIFlDV67vcO9hr4E
 WS68zCLfe6DV6Y+hGFsPAa9XydtTPRx8IrmGFsxp6Coa01bIaH8Gzkcch2P9YVf3Dxsb
 id4w==
X-Gm-Message-State: AOJu0YzNYssx4tuxI0Yf3XKFnUHNSO+rVmsr0flcjwKWL6DrO1Km296f
 9ho1CCHgznzob3NN+pZBHRRpJ6cwa/iTJdFEiHvUi+tcN8r/Wd5d1Qs9vL2zRu/WXDjZRVSlMMB
 3SoF3ytkTe+xyn5T/ZcNCiQsMkaxl/KWK7dyaXcoiqX82wS6QP8nlLv7i+6QQdHMYEcKfnc5YmP
 EKnwYa3WmMbSmzNAK41l9R9p39E+952Fq+YJwTCkKA1FXdj99Y4Xabi+Y=
X-Gm-Gg: ASbGncuILSbGVxvsVMAXWerHC3os1AJLzJRYT2f1b+9iaWZJJdDdjWoKjEiQVyYzxSC
 KRj2CLMck7IY+nlZT/YONwT1D/1OAC1JtVoHHttbn04ZkmhWzeaI/wUkE5EadZ4Pasu2dyoDPVx
 rf7H0ZELEUDGmTdG5UriT/t2UfGw3ra6QATIli5lXTgHRcoNSIQbYBMSyYldlen8VkiujHlL5hE
 iILkv5bzyfbXRNbeSdar3Nn5AReEhnxMWApPiiex0uHCywYfJjXtbMiWIMRf//r8BLZOPS7TcFt
 5zn3JpyPZD6931GHzeVrFfkLX4LyAf7WmPtE9EesTcWaG1Sgarg=
X-Received: by 2002:a5d:64cd:0:b0:3a0:b940:d479 with SMTP id
 ffacd0b85a97d-3a4cb49e26fmr11369842f8f.53.1748356483644; 
 Tue, 27 May 2025 07:34:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdXjszuzeMl2RnpuW7yKuRjT5v40syWUFOepqW0SzOijtzS10E8JEh7P6NRWh/6Bkb4nqn7Q==
X-Received: by 2002:a5d:64cd:0:b0:3a0:b940:d479 with SMTP id
 ffacd0b85a97d-3a4cb49e26fmr11369811f8f.53.1748356483115; 
 Tue, 27 May 2025 07:34:43 -0700 (PDT)
Received: from fedora.redhat.com (185-219-167-200-static.vivo.cz.
 [185.219.167.200]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6ffaa6esm275441885e9.16.2025.05.27.07.34.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 07:34:42 -0700 (PDT)
From: Dorinda Bassey <dbassey@redhat.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, javierm@redhat.com, aesteve@redhat.com,
 ernunes@redhat.com, Dorinda Bassey <dbassey@redhat.com>
Subject: [PATCH v2] tests/drm_virtgpu: Add functional coverage for core
 VirtIO-GPU ioctls
Date: Tue, 27 May 2025 16:24:18 +0200
Message-ID: <20250527143438.1271611-1-dbassey@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9J94WXAWVbPLE4DKLMiwdAghant-VYIZLiJFK_zo0zE_1748356484
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
v2 changes
use 'tests/' as a prefix in subject
fix typo
find and open the DRM device node for virtio-gpu
Make drm-virtgpu-resource-create a proper standalone subtest

 tests/drm_virtgpu.c | 419 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build   |   1 +
 2 files changed, 420 insertions(+)
 create mode 100644 tests/drm_virtgpu.c

diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
new file mode 100644
index 000000000..d9f56edb6
--- /dev/null
+++ b/tests/drm_virtgpu.c
@@ -0,0 +1,419 @@
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
+#include <fcntl.h>
+#include <errno.h>
+#include <string.h>
+#include <sys/ioctl.h>
+
+#include "drm.h"
+#include "virtgpu_drm.h"
+#include "igt.h"
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
+ * SUBTEST: drm-virtgpu-resource-create
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
+IGT_TEST_DESCRIPTION("Testing of the virtIO-GPU driver DRM ioctls");
+
+#define VIRTGPU_DEVICE "/dev/dri/card0"
+
+#define CAPS_BUFFER_SIZE 4096
+#define MAX_CARDS 16
+
+int drm_fd;
+struct drm_virtgpu_resource_create args;
+bool resource_created;
+
+static int open_virtgpu_device(void)
+{
+	drmVersionPtr version;
+
+	for (int i = 0; i < MAX_CARDS; i++) {
+		char path[64];
+
+		snprintf(path, sizeof(path), "/dev/dri/card%d", i);
+		drm_fd = open(path, O_RDWR | O_CLOEXEC);
+		if (drm_fd < 0)
+			continue;
+
+		version = drmGetVersion(drm_fd);
+		if (version && strcmp(version->name, "virtio_gpu") == 0) {
+			drmFreeVersion(version);
+			return drm_fd;
+		}
+
+		drmFreeVersion(version);
+		close(drm_fd);
+	}
+	return -1;
+}
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
+static void test_capset(int fd, uint32_t capset_id)
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
+	ret = ioctl(fd, DRM_IOCTL_VIRTGPU_GET_CAPS, &caps);
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
+static void create_resource_if_needed(void)
+{
+	int ret;
+
+	if (resource_created)
+		return;
+
+	memset(&args, 0, sizeof(args));
+	args.target = 2;
+	args.format = 87;
+	args.bind = (1 << 0);
+	args.width = 64;
+	args.height = 64;
+	args.depth = 1;
+	args.array_size = 1;
+
+	ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_RESOURCE_CREATE, &args);
+	igt_assert_f(ret == 0, "RESOURCE_CREATE failed: %s\n", strerror(errno));
+	igt_assert_neq(args.res_handle, 0);
+
+	resource_created = true;
+	igt_info("Created resource: res_handle=%u, bo_handle=%u\n",
+			args.res_handle, args.bo_handle);
+}
+
+igt_main {
+	void *caps_buf = NULL;
+
+	igt_fixture {
+		drm_fd = open_virtgpu_device();
+		igt_require(drm_fd >= 0);
+
+		caps_buf = malloc(CAPS_BUFFER_SIZE);
+		igt_require(caps_buf);
+		memset(caps_buf, 0, CAPS_BUFFER_SIZE);
+	}
+
+	igt_describe
+	    ("Maps a buffer object and tests read/write access via mmap.");
+	igt_subtest("drm-virtgpu-map") {
+		struct drm_virtgpu_map map = { };
+		void *map_ptr;
+		int ret;
+
+		create_resource_if_needed();
+		memset(&map, 0, sizeof(map));
+		map.handle = args.bo_handle;
+
+		/* Request mmap offset */
+		ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_MAP, &map);
+		igt_assert_f(ret == 0, "MAP ioctl failed: %s\n",
+			     strerror(errno));
+		igt_assert(map.offset != 0);
+
+		/* Try mmap */
+		map_ptr =
+		    mmap(NULL, 4096, PROT_READ | PROT_WRITE, MAP_SHARED, drm_fd,
+			 map.offset);
+		igt_assert(map_ptr != MAP_FAILED);
+
+		igt_info("Successfully mmap'ed BO: offset=0x%lx\n",
+			 (unsigned long)map.offset);
+
+		/* Simple test: write and read */
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
+		create_resource_if_needed();
+		handles[0] = args.bo_handle;
+
+		/* Submit dummy execbuffer */
+		execbuf.flags = 0;
+		execbuf.size = 0;       /* No command */
+		execbuf.command = 0;    /* No command buffer */
+		execbuf.bo_handles = (uintptr_t) handles;
+		execbuf.num_bo_handles = 1;
+		execbuf.fence_fd = -1;  /* No fence */
+		execbuf.ring_idx = 0;   /* Default ring */
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
+		create_resource_if_needed();
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
+		struct drm_virtgpu_3d_transfer_to_host xfer;
+
+		create_resource_if_needed();
+
+		memset(&xfer, 0, sizeof(xfer));
+		xfer.bo_handle = args.bo_handle;
+		xfer.box.x = 0;
+		xfer.box.y = 0;
+		xfer.box.z = 0;
+		xfer.box.w = args.width;
+		xfer.box.h = args.height;
+		xfer.box.d = 1;
+		xfer.level = 0;
+		xfer.offset = 0;
+		xfer.stride = 0;
+		xfer.layer_stride = 0;
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
+		struct drm_virtgpu_3d_transfer_from_host xfer_in;
+
+		create_resource_if_needed();
+		memset(&xfer_in, 0, sizeof(xfer_in));
+		xfer_in.bo_handle = args.bo_handle;
+		xfer_in.box.x = 0;
+		xfer_in.box.y = 0;
+		xfer_in.box.z = 0;
+		xfer_in.box.w = args.width;
+		xfer_in.box.h = args.height;
+		xfer_in.box.d = 1;
+		xfer_in.level = 0;
+		xfer_in.offset = 0;
+		xfer_in.stride = 0;
+		xfer_in.layer_stride = 0;
+
+		ret = ioctl(drm_fd, DRM_IOCTL_VIRTGPU_TRANSFER_FROM_HOST, &xfer_in);
+		igt_assert_f(ret == 0, "TRANSFER_FROM_HOST failed: %s\n", strerror(errno));
+		igt_info("TRANSFER_FROM_HOST completed\n");
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
+		("Creates a standard 2D GPU resource using RESOURCE_CREATE ioctl.");
+	igt_subtest("drm-virtgpu-resource-create") {
+		create_resource_if_needed();
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
+		/* Test multiple capsets */
+		test_capset(drm_fd, 1); /* VirGL */
+		test_capset(drm_fd, 2); /* GFXSTREAM */
+		test_capset(drm_fd, 9999); /* Invalid (expect failure) */
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

