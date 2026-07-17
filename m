Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22047C44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 09:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C210210F4C6;
	Fri, 17 Jul 2026 09:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="n7ihemR/";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85B9B10F4C6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:18:55 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H6bwL02840233
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=b
 oXDZV8fbMYG4T9fPfdqwJYD1pZPsT+GvQq58OZoyGA=; b=n7ihemR/ZYjef/SIN
 qkkladF6pbp5H8+/2FIYciNiz+VGwZ8lpihQRsDW/MnQuZq6RepdMORsq3SlrUiW
 tZoXWt3+wpSIVbryOfxWZX7xToKUU7Soeb1wjYOAy3MS7EJKIGgEVhqGeR2qjTUK
 QXI9gC77HCkm+NTQ5fLXm2zq4pFRaRtEvF7Ke/ELqwHXbAz/e8pTlF6+Ms2qBrNP
 qyrLP8m4jZw5ThFutx2YQ02bxTU3PkjizarknIELqdBa3WvT0LtqWk0hGVhO/l/B
 1Ij/o4y6Yk3QbgFJQN0DVPxt36LfM6hqYqj9IGxQQOT232Pj6Jnw/NaX0W1SVFKn
 5VaAA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnk0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:53 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 10:18:52 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 11:18:18 +0200
Subject: [PATCH i-g-t v2 05/10] tests/imagination: Add DEV_QUERY heap info
 tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v2-5-e1bf415adcee@imgtec.com>
References: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Sarah Walker
 <sarah.walker@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784279928; l=6125;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=EJP0yB1PXDBohYYBtsF4osEJiu+fGYll7iiRmRL2h9o=;
 b=6EKFNNjYNxnzo6Z49MKkpBDk0eKKYxcrQIS5JWOxr7RoeJXEFjZWOS9PNJuygtksIdF5RR9PK
 c7lmJNhjdaZCFLlyh3W1aJrYom9BXATjanVnZADpW/Ha/NtlqRrqrEH
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX/hY7RkDEJyjY
 zK6L+fAQ7YljDt/tHjKyLZN7mbu/yAvGLKJS3YmvZFEo0Og+ayaocaeA1z4Y7gTSVQTQfBtaI69
 LOQCQZiFRVHov1JLD+8Ysi6HcqHLv1aN6tGU9w1+DDcZbU4g4ka7PBF0bAxTa6Km7sVwcebjv26
 KM9y5wWOCjJS8quoH8Wm4RmPltHHLzceTsThcV4NiHhfdgHy7cmULnubvNl9MtN6NHjQ42QUM1K
 Kw5z+0GeNAONEk1Uj58HFIE5aVvZQG7/+uospdHj+cV9YHTB2Kk8r6c5iCHU2+bhp+4X3rZUzLu
 sFsEX8qwmOPN5oFjW6amWdbTHMYN0OhUIHNPcEzG6Pf2w1HqdQ8cnO5UBIfMF8PaslCxxTt91de
 VgD3CUU3aBrAKPXWe7vpRkGTLzbzYNKqBwlzenP0uul/zmGyHnQ/Fx4qZcSTBqkQTaWmTNJJaV5
 aIof/ijlldGEn7bM8HQ==
X-Proofpoint-ORIG-GUID: lYOZAUDrwHlu5TLzJsmkBjh6iJ8thepD
X-Proofpoint-GUID: lYOZAUDrwHlu5TLzJsmkBjh6iJ8thepD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX3FT97B6NAu+y
 jDS8mAL3whaiuUyKG0HhNGAQcZho5rHwQHMOuhdX+8kE2yuRoOdVY9ypN7hGnayEIfqqS5AEN5Q
 yxYhxLxsacOJoY5q3fd/zrLkPUjCzl8=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59f37d cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=5dTYAPD5xSfmRx3JF_cA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
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
---
 lib/igt_pvr.c                     |  21 ++++++
 lib/igt_pvr.h                     |   2 +
 tests/imagination/meson.build     |   1 +
 tests/imagination/pvr_heap_info.c | 130 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 154 insertions(+)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index a729618d0..a190cd67b 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -73,3 +73,24 @@ igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
 	return args;
 }
 
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
index e949772e4..181a0e843 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -17,5 +17,7 @@ off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
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
index 000000000..b498214d9
--- /dev/null
+++ b/tests/imagination/pvr_heap_info.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include "igt.h"
+#include "igt_pvr.h"
+
+#include "pvr_drm.h"
+
+#include <errno.h>
+#include <stdbool.h>
+#include <stdint.h>
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
+		close(fd);
+	}
+}

-- 
2.43.0

