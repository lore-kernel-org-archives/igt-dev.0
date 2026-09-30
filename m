Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B77CA5FB1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 12:52:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90F1710E85E;
	Wed, 30 Sep 2026 12:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WGwxFzLB";
	dkim-atps=neutral
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9EAB10EA02
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 12:51:16 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2caced6038eso11046175ad.0
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1790772676; x=1791377476; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Z3ZgGsv2c6bb/b4Yjri0QbtZE2N4t+O+7/LCfC0TDEk=;
 b=WGwxFzLBzKqQyq94RaQ6S3VpiscWJ45XEdY50+NOXqqqx/1VFi+gzmzlbMXQAMnOBW
 hof6gPYpo4nQn1wWQjBUVAAaugnvuLpPGiBYgXLRhW/sts97j9mAS4knodiDUXONU33T
 TM7rIu98z5aE5R7lKnTVliV4gSNfLVDVHh4npZnKYH4xCqzkHQxbSoZsjMT95WVq6k0i
 6lYNR6iHMuhB8fdnpCJlnyhq3kTXyoJgCGdlHPEw6tF/McPf6qTvGFHbox5YY/5AGa0M
 4zLOmIKnK173iVjO2mihRI38lJSs1YeYMSLecQkrZZZ0Ef/lClJnG2IXYHzNKBhRBnnd
 B2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790772676; x=1791377476;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Z3ZgGsv2c6bb/b4Yjri0QbtZE2N4t+O+7/LCfC0TDEk=;
 b=1p1UdTFbznEFoJb5PnWZKTJmgGSIAeiHIMPYS+UxPknOYJqLtj98VEzmZe590i1IHs
 jK9QrLLLul7K4XFuRJIEx9NLzCcaNm3u8eCSW18EB8qln6NdrmLGWczwap+exGJ24Xyd
 ENqUVlKwo6rvGZix9VvZYlinvxUJTcRHBaTuoDlbY/EEShdIPArcWlKUFTP9jaAfKG+4
 li7kCiDDyLeDTEM5GS40LGEtNGP02eiZ4POAkayV1haYQMpiFC2G6n1apuvcJZu3jImh
 ZMaXlQO0QlOb5iILUzPj7+mJRvTSj0jgP62SLqj0GMWcBmrtzt3ZfST9EFvdjKeAFh6w
 Qmgg==
X-Gm-Message-State: AFq9FYLsUJ4CLK1QS86VHOq7aboIxxqAOF+dSmXwjyEOQA3dpwNqRB/Q
 U+gt7g/Pn5X4ComHg0DcbsdBC6Rb+4yl5ZqDIngWRqgq/7zS7WE9NjX3T70o4w==
X-Gm-Gg: AYBFou2QCIg8GfHOVlqwjDxvuCbgCGLx+0no6VuSzNH7/XSG3ZtpKKtvKBoxUq1VSIM
 5yxv7fgZdGd5koOrO6+7DzvjiEyaBc2L0ug9UFni1JH4882xqkzJHQK7bkgDQgjRK6O9ujks1Av
 mhsg3O43O8O1vLrLbnRrl4P36uUqZk4D3PnaIz5FgKqv1TZx86Uj5sFO1HLEAD1O1E3B22l6gxW
 Rnu0sU9pLrRMqaykaOJdRKPDKA3aZ/kHPtVcT2qDUp2icJmaat+/cRbBV+39rzvsAm4qMMI3mvF
 T7ABwETT0DK0CAJ7b4qrzVYsNpsHzTAnIhpv1RA3+pChdZOWSLifMDwGQyXRRj7lUCUH/i2pYZZ
 WNX2HRtUOA3iZTIxHhC43eDS0WEtN+QOWX7wAzVc3bERV9LenpnGTXDBxLSfL0JEo05AAYQL+SG
 qNChJY28yEHFXz2it1HtjUhmE8Tp9DUQ6Ffn0S6s6eDKUaMdTgn4553SvvExs2kw==
X-Received: by 2002:a17:902:db05:b0:2d8:d4d2:d135 with SMTP id
 d9443c01a7336-2e2e4b6f06cmr8036555ad.17.1790772676049; 
 Wed, 30 Sep 2026 05:51:16 -0700 (PDT)
Received: from gye-SER8.. ([1.243.227.27]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2e2e5b89fd6sm6741815ad.26.2026.09.30.05.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Sep 2026 05:51:15 -0700 (PDT)
From: Gyeyoung Baek <gye976@gmail.com>
To: igt-dev@lists.freedesktop.org
Cc: imagination@lists.freedesktop.org, alessio.belle@imgtec.com,
 luigi.santivetti@imgtec.com, robert.mazur@imgtec.com,
 matt.coster@imgtec.com, sarah.walker@imgtec.com, frank.binns@imgtec.com,
 kamil.konieczny@linux.intel.com, Gyeyoung Baek <gye976@gmail.com>
Subject: [PATCH i-g-t v2] tests/imagination: Add VM map and remap tests
Date: Wed, 30 Sep 2026 21:50:57 +0900
Message-ID: <20260930125057.1837788-1-gye976@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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
v2:
- Add (c) line
- Clean up includes
- Add IGT_TEST_DESCRIPTION()
- Link to v1: https://lore.kernel.org/all/20260926152341.783867-1-gye976@gmail.com/

 tests/imagination/meson.build  |   1 +
 tests/imagination/pvr_vm_map.c | 193 +++++++++++++++++++++++++++++++++
 2 files changed, 194 insertions(+)
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
index 000000000..c74cc4f62
--- /dev/null
+++ b/tests/imagination/pvr_vm_map.c
@@ -0,0 +1,193 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Gyeyoung Baek */
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
+IGT_TEST_DESCRIPTION("Test that VM map, unmap and remap operations work");
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

