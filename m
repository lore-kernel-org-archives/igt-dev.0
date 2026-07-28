Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72F3BC53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 172A510E7E6;
	Tue, 28 Jul 2026 07:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="OkUA/TuH";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3369C10E7BE
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:22 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S701D51832223; Tue, 28 Jul 2026 08:19:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=t
 njGoA1oFcJ6x1O+OISVWSX+Hcgf90JjofOoOVsheh4=; b=OkUA/TuHwsUuGQRJv
 ONVH6q2tdP+KT8ZNY/KK9OpZFYYTeaZIOLga3TD1Wn8qeHHQAaUlWGX8BqsxigYC
 0I2CFa9k2phnr09sM46bngyOzD/xGiypouyWJ5FYfhKD/wRtV8sslEa6eFqVxMof
 /AzMDJnn2amcalnydNVylX+nl/0o1xs4XV7QfRbiW9Ha9UQzwMViuaUtugctfNZM
 17RED8a8AGTnOOytXU1UdQi4hw4wK78oQhAk2e+Z/dB/XPXDbzzvPg5pdW772Vw+
 GKv4QrXDdURND7TS3pmShO62GvyybbhNbflFDkvR43NUeH5ViFPmPbqrc64iZStU
 qxcDg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f1s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 08:19:17 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:16 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 09:19:00 +0200
Subject: [PATCH i-g-t v5 05/10] tests/imagination: Add DEV_QUERY heap info
 tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-add-support-v5-5-33049f0d1937@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Sarah Walker
 <sarah.walker@imgtec.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=6522;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=2dTnki5auEKJqHCXIlPgkUUKW/YJ2NPpdt0TNUnzzUc=;
 b=jtsQueibAEFpkGiS9VcFai9hQN5C6lJvXfddXMMKkoMcC7AQp1zJ34XMqUz0ayMp7S+caFS8j
 nD2P5umUlitCU2mj62cqHlT6cte2Yovhex10J0JYL3Xo0jEQr6I5Ib0
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfXzarAXgowUVxM
 VKGj8RNZWGSuI0wq2rg70LKH3LVldl6aF0/8JPA5R+cc3vv+yZaY2ZzJ7mkX1eTBDe/IKFtVo8i
 O3gf9U517FIuLPzxQ9FzfMUHU7+Gy5E=
X-Proofpoint-GUID: jJ25TvJaGvBcl0mUyqnhKdgt9_lyztPn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX8ICD11lRK8U9
 AwaN+meBeXc3fPwTngd0qfS6YSBvGuMOb4tHmV9APdUFIl52+GupdirczMG5GM+RaZpXLzRCnvE
 JLcWb1E+AvxO37h1Z2sHitQvJHd1KJJJJK5yMF4S3d7Qu+WGVtgC4JLYU0JTdKh710fu3OkE6CV
 HgAVZFZv+VAd4ZbfMQ4QNscT99dARsrWmMxTcWj3BkXNVoxLoT/g0Ec7mxf0xGPjNHWtf5zFWR0
 9EZDSb5IeDQhlKqcEO3YO4yxeA6DGWcqzKo6IXhyYMbNSkm+J7c4AKbhKR6zB5mTis1nXnMK6a7
 yEWkn6Vc+W0YkzaJggf+8duD9wbrroWcOe9jNX1fkasZxptJeCJCangzaQLs3fvkE23urFXqZOA
 qyF9k7S7fHtcLk7BXtdoXpxRJWpjSN89jh2zNI9YBXV921kLfFW6aQPv4JbdXbJysKmKqDrCH7J
 iFtZxAN2lpv+I1JW+Hw==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f5 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=YwSeCxuqzESBs6HtTtoA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: jJ25TvJaGvBcl0mUyqnhKdgt9_lyztPn
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

From: Sarah Walker <sarah.walker@imgtec.com>

Add subtests for DRM_IOCTL_PVR_DEV_QUERY heap info queries.

Signed-off-by: Sarah Walker <sarah.walker@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 lib/igt_pvr.c                     |  31 +++++++++
 lib/igt_pvr.h                     |   2 +
 tests/imagination/meson.build     |   1 +
 tests/imagination/pvr_heap_info.c | 130 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 164 insertions(+)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 2e6c4ade3..40a68d4e6 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -104,3 +104,34 @@ igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
 	return args;
 }
 
+/**
+ * igt_pvr_get_heap_info:
+ * @fd: The file descriptor of the DRM device.
+ * @array_len_out: Pointer to store the number of heaps.
+ *
+ * Function to get information about the device heaps.
+ *
+ * Returns: An array of drm_pvr_heap structures. The caller is responsible
+ * for freeing the array.
+ */
+struct drm_pvr_heap *
+igt_pvr_get_heap_info(int fd, uint32_t *array_len_out)
+{
+	struct drm_pvr_heap *heaps =
+		calloc(DRM_PVR_HEAP_COUNT, sizeof(*heaps));
+	struct drm_pvr_dev_query_heap_info heap_info_get = {
+		.heaps = DRM_PVR_OBJ_ARRAY(DRM_PVR_HEAP_COUNT, heaps),
+	};
+
+	if (!heaps)
+		return NULL;
+
+	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+				sizeof(heap_info_get), &heap_info_get, 0);
+
+	if (array_len_out)
+		*array_len_out = heap_info_get.heaps.count;
+
+	return heaps;
+}
+
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
index b25fb1867..ca09f39e1 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -16,5 +16,7 @@ off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
 struct drm_pvr_ioctl_dev_query_args
 igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
 			void *pointer, int expect_err);
+struct drm_pvr_heap *
+igt_pvr_get_heap_info(int fd, uint32_t *array_len_out);
 
 #endif /* IGT_PVR_H */
diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
index c5899972b..fc24d0220 100644
--- a/tests/imagination/meson.build
+++ b/tests/imagination/meson.build
@@ -1,6 +1,7 @@
 pvr_progs = [ 'pvr_dev_query',
 	      'pvr_gem',
 	      'pvr_gpu_info',
+	      'pvr_heap_info',
 	    ]
 
 pvr_deps = test_deps
diff --git a/tests/imagination/pvr_heap_info.c b/tests/imagination/pvr_heap_info.c
new file mode 100644
index 000000000..7d953044e
--- /dev/null
+++ b/tests/imagination/pvr_heap_info.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include <errno.h>
+#include <stdbool.h>
+#include <stdint.h>
+
+#include "igt.h"
+#include "igt_pvr.h"
+
+#include "pvr_drm.h"
+
+enum pvr_page_size {
+	PVR_PAGE_SIZE_4K = 12,
+	PVR_PAGE_SIZE_16K = 14,
+	PVR_PAGE_SIZE_64K = 16,
+	PVR_PAGE_SIZE_256K = 18,
+	PVR_PAGE_SIZE_1M = 20,
+	PVR_PAGE_SIZE_2M = 21
+};
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
+	igt_describe("Test getting the size of an array from the kernel");
+	igt_subtest("heap-info-get-size")
+	{
+		/* Check we can get the size of the array kernel side. */
+		struct drm_pvr_dev_query_heap_info heap_info_get = {0};
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(heap_info_get), &heap_info_get, 0);
+		igt_assert_neq(heap_info_get.heaps.count, 0);
+		igt_assert_neq(heap_info_get.heaps.stride, 0);
+	}
+
+	igt_describe("Test copying a single heap info from the kernel");
+	igt_subtest("heap-info-copy-single")
+	{
+		struct drm_pvr_heap *heaps =
+			calloc(DRM_PVR_HEAP_COUNT, sizeof(*heaps));
+
+		/* Try copying a single heap. */
+		struct drm_pvr_dev_query_heap_info heap_info_get = {
+			.heaps = DRM_PVR_OBJ_ARRAY(1, heaps),
+		};
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(heap_info_get), &heap_info_get, 0);
+
+		/* Kernel should stop copying after a single heap. */
+		igt_assert_eq(heap_info_get.heaps.count, 1);
+		igt_assert_eq(heaps[1].size, 0);
+
+		/* Kernel should respect the user side array stride. */
+		igt_assert_eq(heap_info_get.heaps.stride, sizeof(*heaps));
+	}
+
+	igt_describe("Test copying all heaps info from the kernel");
+	igt_subtest("heap-info-copy-all")
+	{
+		struct drm_pvr_dev_query_heap_info heap_info_get = {0};
+		struct drm_pvr_heap *heaps =
+			calloc(DRM_PVR_HEAP_COUNT, sizeof(*heaps));
+		uint32_t kernel_array_size = 0;
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(heap_info_get), &heap_info_get, 0);
+
+		kernel_array_size = heap_info_get.heaps.count;
+
+		heap_info_get.heaps =
+			(struct drm_pvr_obj_array)DRM_PVR_OBJ_ARRAY(DRM_PVR_HEAP_COUNT,
+								    heaps);
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+					sizeof(heap_info_get), &heap_info_get, 0);
+
+		igt_assert(heap_info_get.heaps.count == DRM_PVR_HEAP_COUNT ||
+			   heap_info_get.heaps.count == kernel_array_size);
+
+		/* Kernel should respect the user side array stride. */
+		igt_assert_eq(heap_info_get.heaps.stride, sizeof(*heaps));
+	}
+
+	igt_describe("Test validity of all heaps");
+	igt_subtest("heap-info-heaps-valid")
+	{
+		uint32_t heaps_count = 0;
+		struct drm_pvr_heap *heaps =
+			igt_pvr_get_heap_info(fd, &heaps_count);
+
+		igt_assert(heaps);
+
+		for (int heap_id = 0; heap_id < heaps_count; heap_id++) {
+			const uint64_t page_mask =
+				(1ull << heaps[heap_id].page_size_log2) - 1;
+
+			/* This heap isn't present for all devices. */
+			if (heap_id == (int)DRM_PVR_HEAP_RGNHDR)
+				continue;
+
+			igt_assert(heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_4K ||
+				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_16K ||
+				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_64K ||
+				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_256K ||
+				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_1M ||
+				   heaps[heap_id].page_size_log2 == PVR_PAGE_SIZE_2M);
+
+			igt_assert_neq_u64(heaps[heap_id].size, 0);
+			igt_assert(!(heaps[heap_id].size & page_mask));
+			igt_assert(!(heaps[heap_id].base & page_mask));
+
+			igt_assert(heaps[heap_id].flags == 0);
+		}
+
+		free(heaps);
+	}
+
+	igt_fixture()
+	{
+		drm_close_driver(fd);
+	}
+}

-- 
2.43.0

