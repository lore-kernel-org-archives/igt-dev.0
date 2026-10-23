Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCE8606A31A
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=I1r0Om7J
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5050610E0AA;
	Fri, 23 Oct 2026 14:51:39 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D070D112BAD
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=B19DprKCBhSwixppYy/qpEK8ngghbe3GGbDOV8JGPWU=; b=
 I1r0Om7Jg69YbOJCeU3RwooAvPwl5IK0z7O+DnuEKvgEzpR4H9QGyqNLD9cXpFeymnFvfK4KfMbSy
 vEdTnWZfPz1TkHIgiQqZLhehjlsDeqkgkUsYA0kBdcJmgJvazpfEyqySqyH9DDcnXXP9d5LpMfT+K
 pU/1MM38BecXhjoxiXNWbIAoFBDJNnyPPjlWQDdiiwEappbNdd82xkm1lrARpNjiusLBOnNTxpOpB
 vXpZ+v1LHz+axZeUd5HXydWExq4KCRoBntZLWGaqDwCwJcKCd64fKkjpBhubAHntl2DXTxZXnSyat
 hjhsmj02XkTouQSbZkuXoi250KPTSocA4A==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbQ-007yoS-Tf; Fri, 23 Oct 2026 16:50:41 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 05/10] tests/amd/criu: Add some basic test cases
Date: Fri, 23 Oct 2026 15:50:27 +0100
Message-ID: <20261023145032.22650-6-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
References: <20261023145032.22650-1-tvrtko.ursulin@igalia.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a new test with some basic test cases to aid and verifiy the
development of amdgpu CRIU plugin and respecitve kernel interfaces.

Subtests are laid out in the increasing order of complexity.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 tests/amdgpu/amd_criu.c  | 123 +++++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build |   1 +
 2 files changed, 124 insertions(+)
 create mode 100644 tests/amdgpu/amd_criu.c

diff --git a/tests/amdgpu/amd_criu.c b/tests/amdgpu/amd_criu.c
new file mode 100644
index 000000000000..453c53d9a7df
--- /dev/null
+++ b/tests/amdgpu/amd_criu.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2026 Valve Corporation
+ */
+
+#include "igt.h"
+#include "drmtest.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+static void wait_checkpoint(void)
+{
+	igt_info("Waiting for checkpoint or key...\n");
+	getchar();
+}
+
+#define BUFFER_SIZE	4096
+
+#define CREATE_BO	(1 << 0)
+#define MAP_BO		(1 << 1)
+#define MMAP_BO		(1 << 2)
+#define DO_FORK		(1 << 3)
+
+static void basic(amdgpu_device_handle dev, unsigned int flags)
+{
+	amdgpu_bo_handle bo;
+	amdgpu_va_handle va;
+	uint64_t gva;
+	void *addr;
+	int ret;
+
+	if (flags & CREATE_BO) {
+		struct amdgpu_bo_alloc_request alloc = {
+			.alloc_size = BUFFER_SIZE,
+			.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
+		};
+		ret = amdgpu_bo_alloc(dev, &alloc, &bo);
+		igt_assert_eq(ret, 0);
+	}
+
+	if (flags & MAP_BO) {
+		ret = amdgpu_va_range_alloc(dev, amdgpu_gpu_va_range_general,
+					    BUFFER_SIZE, 0, 0, &gva, &va, 0);
+		igt_assert_eq(ret, 0);
+
+		ret = amdgpu_bo_va_op(bo, 0, BUFFER_SIZE, gva, 0,
+				      AMDGPU_VA_OP_MAP);
+		igt_assert_eq(ret, 0);
+	}
+
+	if (flags & MMAP_BO) {
+		ret = amdgpu_bo_cpu_map(bo, &addr);
+		igt_assert_eq(ret, 0);
+	}
+
+	if (flags & DO_FORK) {
+		struct igt_helper_process child = {};
+
+		igt_fork_helper(&child)
+			wait_checkpoint();
+
+		igt_wait_helper(&child);
+	} else {
+		wait_checkpoint();
+	}
+
+	if (flags & MMAP_BO)
+		amdgpu_bo_cpu_unmap(bo);
+
+	if (flags & MAP_BO) {
+		amdgpu_bo_va_op(bo, 0, BUFFER_SIZE, gva, 0, AMDGPU_VA_OP_UNMAP);
+		amdgpu_va_range_free(va);
+	}
+
+	if (flags & CREATE_BO)
+		amdgpu_bo_free(bo);
+}
+
+int igt_main()
+{
+	amdgpu_device_handle dev;
+	int fd = -1;
+
+	igt_fixture() {
+		uint32_t major, minor;
+		int err;
+
+		fd = drm_open_driver_render(DRIVER_AMDGPU);
+
+		err = amdgpu_device_initialize(fd, &major, &minor, &dev);
+		igt_require(err == 0);
+	}
+
+	igt_describe("Open render node and initialize libdrm only");
+	igt_subtest("open")
+		basic(dev, 0);
+
+	igt_describe("Create one buffer object");
+	igt_subtest("one-bo")
+		basic(dev, CREATE_BO);
+
+	igt_describe("Map one buffer object");
+	igt_subtest("map-one")
+		basic(dev, CREATE_BO | MAP_BO);
+
+	igt_describe("Mmap one buffer object");
+	igt_subtest("mmap-one")
+		basic(dev, CREATE_BO | MMAP_BO);
+
+	igt_describe("Map and mmap one buffer object");
+	igt_subtest("map-and-mmap-one")
+		basic(dev, CREATE_BO | MAP_BO | MMAP_BO);
+
+	igt_describe("Map and mmap one buffer object, then fork");
+	igt_subtest("map-mmap-fork")
+		basic(dev, CREATE_BO | MAP_BO | MMAP_BO | DO_FORK);
+
+	igt_fixture() {
+		amdgpu_device_deinitialize(dev);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index a915cf66a268..aa8a80354898 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -12,6 +12,7 @@ if libdrm_amdgpu.found()
 			  'amd_color',
 			  'amd_cross_gpu_sync',
 			  'amd_cp_dma_misc',
+			  'amd_criu',
 			  'amd_cs_nop',
 			  'amd_cursor_overlay',
 			  'amd_deadlock',
-- 
2.56.0

