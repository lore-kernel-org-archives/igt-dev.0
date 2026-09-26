Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EEADC98324
	for <igt-dev@archiver.kernel.org>; Sun, 27 Sep 2026 08:03:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A22F10E308;
	Sun, 27 Sep 2026 08:03:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NaFB8eEy";
	dkim-atps=neutral
Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com
 [74.125.227.168])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FF510E1D7
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Sep 2026 15:24:25 +0000 (UTC)
Received: by mail-pj2-f40.google.com with SMTP id
 98e67ed59e1d1-3a0e7cbb608so151952a91.2
 for <igt-dev@lists.freedesktop.org>; Sat, 26 Sep 2026 08:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790436265; x=1791041065; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=WcSjejH4DMs3dmQjL6Ua0SbL4jSpcUb1DsuM1n3IT6g=;
 b=NaFB8eEyLEX4ZQShrZFxNZbosObK3FbDO/VcKW7/6lABtJ5kCM5uOU55ytjgu3tvNQ
 2GiF1z1X2hBhLFV2dphULH96CxLyOfG0NSkveS+U0YPzsBzC2EDEYwdTVfRK8zrfs+n/
 FWhWWSzpOZIGbN1IAxiEplfA2mXJ00UtHD+4ywTtbN8/UEwNy1A9gqvlzxuS7YGMut03
 LCvt01MyJuKaGWYCEnFHlGoCDK/b2cn5NiSZLF0UZ1a6PdRJwzjo52dQxiURjrqSzyPR
 bzKWsJ68ulehCfBV1noPVIHMSwIhCIN5GlHc7uJY63yroRxSFTnhLUf40lEgnECe/b+m
 KsvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790436265; x=1791041065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=WcSjejH4DMs3dmQjL6Ua0SbL4jSpcUb1DsuM1n3IT6g=;
 b=NUwhp6A/myeah4KiFIDQMuRVpVLOQxvvXOcVUh/khr7dGBLtCLbFcmSteiqSZNw4Qy
 A7pKa6SbmuViGQvJ6cuOuzijZIWRmxexTKJubT9rpzV/vU7BHmqEdOoajgszK+uJiXGy
 PbUluWsRbCZgbOdVS5nzTUOTpFq/v52G7O9XYJCbY7j7u4lU1ReNrU7Uunjq6TfNY57L
 Fjmdn108KVBwukdjcvyYuVdAISUupqIkrkJFH27pb8gppNwgB2MIGwSECoHlTA5AT19H
 CLZtM61l9CJ8iRp0PMbipXmR3ESi2nKhWmrcdkhLfU5XqkDVy+b2a00tCQwrVFpAGMCh
 o5WQ==
X-Gm-Message-State: AFq9FYLlnJY6VbmCkW7+TCutA35ejE/qBUC5i7FPop4uTrKPT3hp7U8n
 05coOQovEgPsjxtf+rtO4iH2VQ7oxqnKF7h9Th1qaFEYCnSUkmt6hef+vc/yMQ==
X-Gm-Gg: AYBFou0yqZPEo11UymMBtplWHEs4Q2XwcUrKLv1NxWsrKvHVUDRnuyz/bKl6U6+R6ml
 +8GF8xj42SOy1o2DsnK4dxga956oese6y1Bhw1uB5etJUCFrSpkdZKb2YECZyD7G99WZL9VNidM
 y6gi11+HltuLNmd05bRT7mWguOG9qCT9joXdLLWiEgX/wWKQGv2DnYC8XezApbEUC+jDuONBir+
 boPKqOVcirZauoIAIEAwQ9SluiQI4bXutSZJk47+AIoX9z1zH1Xgr3CzSl+WwiS4CVf7Tqgn/jN
 Z9kkRJZeWbtIJWFwVzNlEdTpoCu3iruOW1dHWwv41jviB/nXcI1QkhgOnw5x7XL8fYJxe3yC9Ee
 SabcTVA67DKPSxEhd8BqO4DgPh0PSOn2/tiQhdir4Bc4IbrLmq0yIbeQ5Ka/xw2VqAXWnGkrQr3
 FO9n9562Lt5aUhCiFmSxN8dttfcJ8GEgQLU3j27ofbST1wPZBpBk38Wwp1AZHjQw==
X-Received: by 2002:a17:90a:d603:b0:39e:6c68:1550 with SMTP id
 98e67ed59e1d1-3a098969ba9mr6382027a91.24.1790436264607; 
 Sat, 26 Sep 2026 08:24:24 -0700 (PDT)
Received: from gye-SER8.. ([1.243.227.27]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3a0b99e5711sm10005821a91.17.2026.09.26.08.24.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Sep 2026 08:24:23 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: imagination@lists.freedesktop.org, alessio.belle@imgtec.com,
 luigi.santivetti@imgtec.com, donald.robson@imgtec.com,
 robert.mazur@imgtec.com, matt.coster@imgtec.com, sarah.walker@imgtec.com,
 frank.binns@imgtec.com, Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH i-g-t] tests/imagination: Add VM map and remap tests
Date: Sun, 27 Sep 2026 00:23:41 +0900
Message-ID: <20260926152341.783867-1-gye976@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 27 Sep 2026 08:02:45 +0000
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

Add pvr_vm_map, which tests DRM_IOCTL_PVR_VM_MAP and
DRM_IOCTL_PVR_VM_UNMAP directly.

For each of the following three cases, test five scenarios and check
that the memory of the buffer objects is returned in each of them:
1. Inside one 2MiB region
2. Across a 2MiB boundary
3. Across a 1GiB boundary

- map-*: map a range and unmap it.
- replace-*: map a range that completely covers a smaller existing
  mapping.
- remap-next-*: map over the left part of a mapping, which splits it.
- remap-prev-*: map over the right part of a mapping, which splits it.
- remap-both-*: map over the middle of a mapping, which splits it.

See the following document for the overlap cases:
https://docs.kernel.org/gpu/drm-mm.html#drm-gpuvm

Signed-off-by: Gyeyoung Baek <gye976@gmail.com>
---
 tests/imagination/meson.build  |   1 +
 tests/imagination/pvr_vm_map.c | 192 +++++++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+)
 create mode 100644 tests/imagination/pvr_vm_map.c

diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
index 7ae8ddd0a..80d807c28 100644
--- a/tests/imagination/meson.build
+++ b/tests/imagination/meson.build
@@ -8,6 +8,7 @@ pvr_progs = [ 'pvr_dev_query',
 	      'pvr_runtime_info',
 	      'pvr_submit_jobs',
 	      'pvr_vm_context',
+	      'pvr_vm_map',
 	    ]
 
 pvr_deps = test_deps
diff --git a/tests/imagination/pvr_vm_map.c b/tests/imagination/pvr_vm_map.c
new file mode 100644
index 000000000..8cf8cc7a4
--- /dev/null
+++ b/tests/imagination/pvr_vm_map.c
@@ -0,0 +1,192 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+#include <inttypes.h>
+#include <stddef.h>
+#include <stdint.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_os.h"
+#include "igt_pvr.h"
+#include "igt_sizes.h"
+
+#include "pvr_drm.h"
+
+/*
+ * vm_map/unmap/remap() are each run on a range of RANGE_PAGES pages (p0..p3),
+ * placed in one of three ways. The drawings are not to scale.
+ *
+ * in-2m       Inside one 2MiB region. No boundary is crossed.
+ *
+ *             |<------------ 2MiB region ----------->|
+ *             |           [p0|p1|p2|p3]              |
+ *
+ * cross-2m    Across a 2MiB boundary.
+ *
+ *             |<--- 2MiB region A --->|<--- 2MiB region B --->|
+ *                            [p0|p1]|[p2|p3]
+ *                                    ^ 2MiB boundary
+ *
+ * cross-1g    Across a 1GiB boundary, which is also a 2MiB boundary.
+ *
+ *             |<--- 1GiB region A --->|<--- 1GiB region B --->|
+ *                            [p0|p1]|[p2|p3]
+ *                                    ^ 1GiB boundary
+ */
+
+#define RANGE_PAGES 4
+#define LEAK_BO_SIZE SZ_32M
+#define LEAK_THRESHOLD SZ_8M
+
+static uint64_t align_up(uint64_t value, uint64_t align)
+{
+	return (value + align - 1) & ~(align - 1);
+}
+
+static void assert_shmem_released(uint64_t baseline)
+{
+	uint64_t now = 0;
+
+	for (int i = 0; i < 20; i++) {
+		now = igt_get_meminfo("Shmem");
+		if (now < baseline + LEAK_THRESHOLD)
+			return;
+		usleep(100 * 1000);
+	}
+
+	igt_assert_f(false, "%" PRIu64 " bytes of shmem still held after close\n", now - baseline);
+}
+
+static void map_range(int fd, uint64_t addr, uint64_t size)
+{
+	const uint64_t baseline = igt_get_meminfo("Shmem");
+	const uint32_t vm_ctx = igt_pvr_ioctl_create_vm_context(fd, 0);
+	size_t bo_size = LEAK_BO_SIZE;
+	const uint32_t handle = igt_pvr_ioctl_create_bo(fd, &bo_size);
+
+	igt_pvr_ioctl_vm_map(fd, vm_ctx, handle, addr, 0, size);
+	igt_pvr_ioctl_vm_unmap(fd, vm_ctx, addr, size);
+
+	gem_close(fd, handle);
+	igt_pvr_ioctl_destroy_vm_context(fd, vm_ctx, 0);
+
+	assert_shmem_released(baseline);
+}
+
+/*
+ * A new mapping is mapped over an old one. The overlaps follow "DOC: Split and Merge" in
+ * drivers/gpu/drm/drm_gpuvm.c: replace is case 14, remap-next 5, remap-prev 7, remap-both 11.
+ */
+static void remap_range(int fd, uint64_t old_addr, uint64_t old_size,
+			uint64_t new_addr, uint64_t new_size)
+{
+	const uint64_t baseline = igt_get_meminfo("Shmem");
+	const uint32_t vm_ctx = igt_pvr_ioctl_create_vm_context(fd, 0);
+	const uint64_t old_end = old_addr + old_size;
+	const uint64_t new_end = new_addr + new_size;
+	size_t size_a = LEAK_BO_SIZE;
+	size_t size_b = new_size;
+	const uint32_t handle_a = igt_pvr_ioctl_create_bo(fd, &size_a);
+	const uint32_t handle_b = igt_pvr_ioctl_create_bo(fd, &size_b);
+
+	igt_pvr_ioctl_vm_map(fd, vm_ctx, handle_a, old_addr, 0, old_size);
+	igt_pvr_ioctl_vm_map(fd, vm_ctx, handle_b, new_addr, 0, new_size);
+
+	if (new_addr > old_addr)
+		igt_pvr_ioctl_vm_unmap(fd, vm_ctx, old_addr, new_addr - old_addr);
+	igt_pvr_ioctl_vm_unmap(fd, vm_ctx, new_addr, new_size);
+	if (new_end < old_end)
+		igt_pvr_ioctl_vm_unmap(fd, vm_ctx, new_end, old_end - new_end);
+
+	gem_close(fd, handle_a);
+	gem_close(fd, handle_b);
+	igt_pvr_ioctl_destroy_vm_context(fd, vm_ctx, 0);
+
+	assert_shmem_released(baseline);
+}
+
+struct place {
+	const char *name;
+	uint64_t addr;
+};
+
+int igt_main()
+{
+	struct place places[] = { { "in-2m", 0 }, { "cross-2m", 0 }, { "cross-1g", 0 } };
+	struct drm_pvr_heap heap;
+	uint64_t size;
+	int fd;
+
+	igt_fixture()
+	{
+		fd = drm_open_driver(DRIVER_POWERVR);
+		heap = igt_pvr_find_general_heap(fd);
+
+		size = RANGE_PAGES * sysconf(_SC_PAGESIZE);
+		places[0].addr = align_up(heap.base, SZ_2M) + SZ_1M;
+		places[1].addr = align_up(heap.base + 1, SZ_2M) - size / 2;
+		places[2].addr = align_up(heap.base + 1, SZ_1G) - size / 2;
+
+		igt_require(places[2].addr + size <= heap.base + heap.size);
+	}
+
+	for (size_t i = 0; i < ARRAY_SIZE(places); i++) {
+		const char *name = places[i].name;
+		const uint64_t addr = places[i].addr;
+
+		igt_describe_f("A range can be mapped and unmapped, and the page tables it needs are available (%s)",
+			       name);
+		igt_subtest_f("map-%s", name)
+		{
+			/*
+			 * map         |nnnnnnnn|    a range is mapped, then unmapped
+			 */
+			map_range(fd, addr, size);
+		}
+
+		igt_describe_f("A mapping that covers an old one replaces it and leaves nothing of it behind (%s)",
+			       name);
+		igt_subtest_f("replace-%s", name)
+		{
+			/*
+			 * replace     |  oooo  |    o = old mapping, n = new mapping
+			 *             |nnnnnnnn|    nothing is left of the old one
+			 */
+			remap_range(fd, addr + size / 4, size / 2, addr, size);
+		}
+
+		igt_describe_f("Mapping over the left part of a mapping leaves its right part, and the original "
+			       "buffer object is released once everything is closed (%s)", name);
+		igt_subtest_f("remap-next-%s", name)
+		{
+			/*
+			 * remap-next  |oooooooo|    the right part of the old mapping is left
+			 *             |nnnn    |
+			 */
+			remap_range(fd, addr, size, addr, size / 2);
+		}
+
+		igt_describe_f("Mapping over the right part of a mapping leaves its left part, and the original "
+			       "buffer object is released once everything is closed (%s)", name);
+		igt_subtest_f("remap-prev-%s", name)
+		{
+			/*
+			 * remap-prev  |oooooooo|    the left part of the old mapping is left
+			 *             |    nnnn|
+			 */
+			remap_range(fd, addr, size, addr + size / 2, size / 2);
+		}
+
+		igt_describe_f("Mapping over the middle of a mapping leaves its left and right parts, and the "
+			       "original buffer object is released once everything is closed (%s)",
+			       name);
+		igt_subtest_f("remap-both-%s", name)
+		{
+			/*
+			 * remap-both  |oooooooo|    left and right parts of the old one are left
+			 *             |   nn   |
+			 */
+			remap_range(fd, addr, size, addr + size / 2, size / 4);
+		}
+	}
+}
-- 
2.43.0

