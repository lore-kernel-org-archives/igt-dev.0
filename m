Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B54606A31B
	for <igt-dev@archiver.kernel.org>; Fri, 23 Oct 2026 14:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=C/PpTYj5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9415A10E0AA;
	Fri, 23 Oct 2026 14:56:42 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B198510E63C
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2026 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=m5Ba1EDmHV1Fm/NRaXakA9VjpPiJCCl6Bz0VDfPxMw4=; b=
 C/PpTYj5WZiLfY7iQwKA3NBq7qlofbVH5z6/L0GTVS0/T042Lk8xZ+JvRkatedEimAx6CqZlfhskJ
 UBr4emobeWTy1hFOO9z2WV9uhEMWD/25Qd5HNQ4BC6O2WOw8/MyRrGlWy0GW7P0/Ksiz9amkPRHZE
 aaHbsdWwFb8AuVmL2UJBvy9w+WDItYqwjQ1398DD91LJM+2HVhP9tb6mEvTjXQTVozES3zCV84T27
 h82LnfhSDrKvvVI+idsUs12wnsgy9lpKoU/1Ik90pwLxoiXV8MEpACyJGRKYHoKLPwqKi2n8WM5m3
 iHb+d+iMMoB+UaYGhR8skSZZI/VchyGiXA==;
Received: from [81.79.79.1] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xKGbO-007yoB-PJ; Fri, 23 Oct 2026 16:50:38 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: igt-dev@lists.freedesktop.org
Cc: David Francis <David.Francis@amd.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH i-g-t 02/10] tests/amd/gem_list_handles: Add basic test for
 DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES
Date: Fri, 23 Oct 2026 15:50:24 +0100
Message-ID: <20261023145032.22650-3-tvrtko.ursulin@igalia.com>
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

Looks like we had no test for this so far se lets add one.

Just some basic test cases to verify input checking and normal
operation.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: David Francis <David.Francis@amd.com>
---
 tests/amdgpu/amd_list_handles.c | 149 ++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build        |   1 +
 2 files changed, 150 insertions(+)
 create mode 100644 tests/amdgpu/amd_list_handles.c

diff --git a/tests/amdgpu/amd_list_handles.c b/tests/amdgpu/amd_list_handles.c
new file mode 100644
index 000000000000..2c05e8fcdfed
--- /dev/null
+++ b/tests/amdgpu/amd_list_handles.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) 2026 Valve Corporation
+ */
+#include <sys/ioctl.h>
+
+#include "igt.h"
+#include "drmtest.h"
+
+#include <amdgpu.h>
+#include <amdgpu_drm.h>
+
+#include "lib/amdgpu/amd_memory.h"
+
+#define TEST_PADDING (1 << 0)
+#define TEST_FAULT   (1 << 1)
+#define TEST_TWOPASS (1 << 2)
+#define TEST_PROBE   (1 << 3)
+
+#define BUFFER_SIZE	4096
+
+static void
+basic(amdgpu_device_handle dev, unsigned int num_bos, unsigned int flags)
+{
+	struct drm_amdgpu_gem_list_handles_entry entry[num_bos];
+	struct drm_amdgpu_gem_list_handles list = {
+		.entries = (uintptr_t)entry,
+		.num_entries = num_bos,
+	};
+	int fd = amdgpu_device_get_fd(dev);
+	amdgpu_bo_handle bo[num_bos];
+	int i, ret;
+
+	igt_assert_fd(fd);
+
+	for (i = 0; i < num_bos; i++) {
+		struct amdgpu_bo_alloc_request alloc = {
+			.alloc_size = BUFFER_SIZE,
+			.preferred_heap = AMDGPU_GEM_DOMAIN_GTT,
+		};
+
+		ret = amdgpu_bo_alloc(dev, &alloc, &bo[i]);
+		igt_assert_eq(ret, 0);
+	}
+
+	if (flags & TEST_PADDING) {
+		/*
+		 * Apparently kernel never checked for mbz so now we have to
+		 * keep accepting garbage.
+		 */
+		list.padding = 0x13ac5;
+	} else if (flags & TEST_FAULT) {
+		list.entries = 0;
+	}
+
+	if (flags & TEST_TWOPASS) {
+		if (flags & TEST_PROBE) {
+			list.num_entries = 0;
+		} else {
+			igt_assert(num_bos > 1);
+			list.num_entries = num_bos - 1;
+		}
+		ret = ioctl(fd, DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES, &list);
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(list.num_entries, num_bos);
+	}
+
+	ret = ioctl(fd, DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES, &list);
+	if (flags & TEST_FAULT) {
+		i = errno;
+		igt_assert_eq(ret, -1);
+		igt_assert_eq(i, EFAULT);
+		goto out;
+	}
+	igt_assert_eq(ret, 0);
+	igt_assert_eq(list.num_entries, num_bos);
+
+	for (i = 0; i < num_bos; i++) {
+		struct drm_amdgpu_gem_list_handles_entry *e = &entry[i];
+		uint32_t handle;
+
+		ret = amdgpu_bo_export(bo[i],
+				       amdgpu_bo_handle_type_kms_noimport,
+				       &handle);
+		igt_assert_eq(ret, 0);
+		igt_assert_eq(e->gem_handle, handle);
+
+		igt_assert_eq(e->flags, 0);
+		igt_assert_eq(e->size, BUFFER_SIZE);
+		igt_assert_eq(e->preferred_domains, AMDGPU_GEM_DOMAIN_GTT);
+		igt_assert_eq(e->alloc_flags,
+			      AMDGPU_GEM_CREATE_VRAM_CLEARED |
+			      AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE);
+		igt_assert_eq(e->alignment, 0);
+	}
+
+out:
+	for (i = 0; i < num_bos; i++)
+		amdgpu_bo_free(bo[i]);
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
+	igt_describe("Check padding backward compatibility");
+	igt_subtest("padding")
+		basic(dev, 1, TEST_PADDING);
+
+	igt_describe("Check fault detection");
+	igt_subtest("fault")
+		basic(dev, 1, TEST_FAULT);
+
+	igt_describe("List no buffer objects");
+	igt_subtest("no-bos")
+		basic(dev, 0, 0);
+
+	igt_describe("Create and list one buffer object");
+	igt_subtest("one-bo")
+		basic(dev, 1, 0);
+
+	igt_describe("Create and list many buffer objects");
+	igt_subtest("many-bo")
+		basic(dev, 1024, 0);
+
+	igt_describe("Create and list many buffer objects in two-pass mode");
+	igt_subtest("many-bo-two-pass")
+		basic(dev, 16, TEST_TWOPASS);
+
+	igt_describe("Create and list many buffer objects in two-pass probe mode");
+	igt_subtest("many-bo-two-pass-probe")
+		basic(dev, 16, TEST_TWOPASS | TEST_PROBE);
+
+	igt_fixture() {
+		amdgpu_device_deinitialize(dev);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
index 61b81c81407d..2dcc3228b583 100644
--- a/tests/amdgpu/meson.build
+++ b/tests/amdgpu/meson.build
@@ -28,6 +28,7 @@ if libdrm_amdgpu.found()
 			  'amd_jpeg_dec',
 			  'amd_jpeg_queue',
 			  'amd_link_settings',
+			  'amd_list_handles',
 			  'amd_lockdep',
 			  'amd_max_bpc',
 			  'amd_mem_leak',
-- 
2.56.0

