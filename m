Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DECFC5B552
	for <igt-dev@archiver.kernel.org>; Fri, 30 May 2025 09:05:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295FD10E821;
	Fri, 30 May 2025 09:05:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WWgXbl/5";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA61110E821
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748595902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rsnSQc5Oa3FxsEnFxpFhP3rycaVhhxyUPFgnsKyy7cs=;
 b=WWgXbl/5twCZSparAAt0t7BMqOp/QghL7Tp0vkAD4DxnQXf5tB7BaVPOYGZX5El59nzpsq
 T+utwIteKtZt8BuFcsGlIQX0J1kujfhKBBQxySA43pgUfGAVLY5YrzH3scP9Hv7WlZSZv0
 CJhy0XN7SVD/ICUNEw/OTeS1brir9n0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-UuSNANlVNZi_SGNWRwpC7w-1; Fri, 30 May 2025 05:05:01 -0400
X-MC-Unique: UuSNANlVNZi_SGNWRwpC7w-1
X-Mimecast-MFC-AGG-ID: UuSNANlVNZi_SGNWRwpC7w_1748595900
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-604e82a5d37so1972244a12.0
 for <igt-dev@lists.freedesktop.org>; Fri, 30 May 2025 02:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748595900; x=1749200700;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rsnSQc5Oa3FxsEnFxpFhP3rycaVhhxyUPFgnsKyy7cs=;
 b=elz3kXlgI6W+1bJRo5LQ6CRNjDF0GbZZC9adXMjnFTF4Qy+32GfkVG2HRLnm0QrLcj
 W1tgQpP/cPPX+aOIJBXf0oy4aS8znSmlS5JlGl5DOELeTKg1IZ7e52vDAoe44GJnrzgU
 YkN1nD+ZF6DfzXQT+OtEdFxDLZXDGgyOQTuPolAxz/O6jky+aGs2rlL9nykxAE5sF/Tm
 ihjQwQZ3lt97OhGKWMBhvrhWoE+goqWijcCU0yAB+MbbaTlJx5omn/lZl4MlyELEochv
 HF+7rkc68gkL/h8RD6ZOI9VR97W8lwkQTr/nQQCG6hgFqfTTRZT3KJzYt/VzebxVrnL5
 h2kg==
X-Gm-Message-State: AOJu0YwUwB3qze4uGYYO5DanpXVQgPzPDmfZyh0yFpA0uHA2bv3fIsen
 FSTyBuvPT+2TWSmblVvmsjkVKIyLMTH0s6EQIul2xk+2VQhOmjshrgv5J7n/A2FrErQyhSgIfEk
 08DiNnpJWMOI2DJki2nC2sJty/8j/E169QZDFoVKsyCKQq/NJeMrJZBStz3ivJJCZvCDF2UPGm4
 rrSoIB56Ng6H/yFYcFYufFnORz6Cr8IB8ObY2Q6VL4rKEudYOSem5s3Aw=
X-Gm-Gg: ASbGncvtgeq63AI2JCXqhjZozSzAQ0Led58GKG3UjRVeQwSzwEA6Rgk3ve93e8FhAOL
 iYBzL7UYokSvZjBXYXoGgu2VhT4jbt019yln2GbKIDNhSYRbEzw3or7y9BscLgv+sTnkGGwJTGz
 8b3nECnyjeV24eqQnIKjGBy94/JMp9bAy7YKBYx/oLSbVf/0aptCpgDG5ZUM2r9qEzeds2B2eQJ
 113zLrkRPrsY9AN2eSMn8ETGq/vqh7ibm80q8uSm7FMcXMjVgWQ9qxOFkr06QcPJo1tf19TQ227
 2fPm8MKd0IYkhYO+JL/vq7LhPNd0/5yLuUtqUYM=
X-Received: by 2002:a05:6402:42cb:b0:601:f87b:b6a9 with SMTP id
 4fb4d7f45d1cf-6056ef00a77mr2111401a12.25.1748595899738; 
 Fri, 30 May 2025 02:04:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEo2C8Pp5MkP3EWbcviiEr10rMLN0cK/Z1pY3vSFU+JVEA3BLrMh9yz2xCliwvPX3EEqEV8aQ==
X-Received: by 2002:a05:6402:42cb:b0:601:f87b:b6a9 with SMTP id
 4fb4d7f45d1cf-6056ef00a77mr2111357a12.25.1748595899120; 
 Fri, 30 May 2025 02:04:59 -0700 (PDT)
Received: from fedora.. (185-219-167-200-static.vivo.cz. [185.219.167.200])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-60566c5d4e0sm1318924a12.30.2025.05.30.02.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 02:04:58 -0700 (PDT)
From: Dorinda Bassey <dbassey@redhat.com>
To: igt-dev@lists.freedesktop.org
Cc: kamil.konieczny@linux.intel.com, javierm@redhat.com, aesteve@redhat.com,
 ernunes@redhat.com, Dorinda Bassey <dbassey@redhat.com>
Subject: [PATCH v3] tests/drm_virtgpu: Add functional coverage for core
 VirtIO-GPU ioctls
Date: Fri, 30 May 2025 11:02:20 +0200
Message-ID: <20250530090451.1438981-1-dbassey@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ejV4k2eeZ2HhEsLI0NQOlKsKxQprq4mjiy6cuCxtugM_1748595900
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
v3:
Fix resource format and clarify capset IDs

 tests/drm_virtgpu.c | 420 ++++++++++++++++++++++++++++++++++++++++++++
 tests/meson.build   |   1 +
 2 files changed, 421 insertions(+)
 create mode 100644 tests/drm_virtgpu.c

diff --git a/tests/drm_virtgpu.c b/tests/drm_virtgpu.c
new file mode 100644
index 000000000..4d7c9e8f5
--- /dev/null
+++ b/tests/drm_virtgpu.c
@@ -0,0 +1,420 @@
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
+	args.format = 67;
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
+		test_capset(drm_fd, 2); /* VirGL2 */
+		test_capset(drm_fd, 3); /* GFXSTREAM_VULKAN */
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

