Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59033C4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF5710E47A;
	Fri, 17 Jul 2026 14:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="KXh1iKcZ";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5033010E472
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:13 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE3twP3706592
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=x
 XbNWWGcoQMC1Ei2GcfkTl6mIkneRRIXAFCEtXZkxjk=; b=KXh1iKcZR4giUP79e
 KGrWbdRQzVaw9XZ+K3xD8q+wcLR/gGibVyqAw8YFYiOLGwkmjug+fYqRrGiaeQ+j
 osO3jfkLUWf05KKMGaGaSwgYESSYXJJv0Sze3bzLxll6DhbcUvKAJF1LVXrktNUl
 G/f9OhrHch0DnWxp5UKbdKEUiltNRxflIJNSbGHWZ/xKO1tpTbGlO4ivTWml0SC9
 dcMrdY38cZzA7gqf8/jM/WygQYKrzQSd3KSZxFZ8y9CMKFhkTub1cbEV+hU2tAkE
 UttYzaDNB4GtU3wORanKofLEpKD7tnIJNRp2KiLE0f4G/C544jqY/MCudgpjhRfl
 VFz+A==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7d61e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:11 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:10 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 16:21:37 +0200
Subject: [PATCH i-g-t v3 05/10] tests/imagination: Add DEV_QUERY heap info
 tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v3-5-ce69f9ad330c@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Sarah Walker
 <sarah.walker@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=6461;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=Qh8O54VGeZ2seAOHnGIUTBoWDrpe7vfPsl8ygwLFGj8=;
 b=Ubvoq6OV+VP1jfmrIWBuhokAbHeWp2kkgll4g1sC7h4ezpipwfNR/6SA47bZPQXYGWEKzK2JC
 j0Pu8GTe/2DC88oceSQ+O65BKkOSvtINPnu9WEMRW/tqJ1+q6j6p+KO
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX+D2SaHrUn6Br
 oYpuwmU1eSWBlaDEvHkoUxZxJMOqXw7fyuYRcgamseLrjAz44rGb+zKg0AjeWFQnEeCUYku1Ue8
 GbxP7xBuQuw3JrvqlurNNzZgs61dr4Q=
X-Proofpoint-GUID: 5wZ6fJQsNQxpLwcz085-GZcuwXnRTFWA
X-Proofpoint-ORIG-GUID: 5wZ6fJQsNQxpLwcz085-GZcuwXnRTFWA
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a5a3a93 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=iu3d4qMtwXmxF4nLKTcA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfXz7i1fRj4AEhP
 hz5dg5IBNTzVcqccow85QM5iJ5SWg07QXW4LbWizeCrcUd9nZGIeRx/22ut9qgrmN1YCkbKiCcq
 xFZV0JRcib0GQDZAdnwo96n7i5STRU2rkR35C+iHZvphF6VumBwLNoJ+I2cOwDtjE46TTK0ccuy
 iiT0m8YVupWstHRYgf9zmUDZDLBXlryeCZp1FN11VFniyqFrGWzd3Yzrawjc6AEseMBKFzVbeTf
 /K+mWJObiONX2fo4q2835+AqrnZLxc56C0SzHo53ftsjjy6my+wvisXckcKIi86BY8eRvDFEqfT
 DnKZLzVErTLQPQySWo6lX//Y3Vbg9hkDgZpwvR7qkLGl6m+s1JBvmL1B/lPgRhsE7deHzCNaL0W
 vo4ioNlV0jK4YTerX3fLwXmjABwwxmx4bmZNL33aqldbDdzzb/q8f12Rq2IfJqNMF4wQ/nLeoY0
 xdDnv8wFFmI/ArIZTAg==
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
 lib/igt_pvr.c                     |  31 +++++++++
 lib/igt_pvr.h                     |   2 +
 tests/imagination/meson.build     |   1 +
 tests/imagination/pvr_heap_info.c | 130 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 164 insertions(+)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 421cbc24c..a26b4edad 100644
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

