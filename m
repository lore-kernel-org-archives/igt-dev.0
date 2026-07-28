Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 428EFC54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:21:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E685210E533;
	Tue, 28 Jul 2026 07:21:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="UguCtNSB";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C16510E534
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:18 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6r4f91820224
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 08:19:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=J
 QTXCOZVbn+kPSUgZy2pOAaxFJOjmjGySVhsIHmnWgY=; b=UguCtNSBQuRk1NSqM
 JJMbhJ3BKvlU/xAsjkgweLuSjjA0DbljNkteM/k0P8Dv96a0jEGV7Jlk1/vXnt2a
 fyzvswbzYezjnvI9i4Se3yYiEEXFgeaBKKSGmlM819NzpLMtGrHESy0qyCCtl2E7
 Dr4m7QPDRHn9NwLNO+rVV3Y3pt5b7xQ3KOo7a0vYdU226ZQ8QnsugJy768I7fv+o
 wRgVKWqATAhcsqxbpSbnKc58tYs0qk7Ry6M3J+hQQlS2rpML1fuh47LXAKjdQW2b
 4irlOctQYV/wktPCQbRNIOn+2YOE/lBzTMrF4pzJmDuIGbR9LQY3haGkNJMjBLuM
 fUH/g==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f1q-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 08:19:16 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:15 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 09:18:58 +0200
Subject: [PATCH i-g-t v5 03/10] tests/imagination: Add DEV_QUERY tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-add-support-v5-3-33049f0d1937@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=5748;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=vt0+jjfrOXhMM/u6b3p6C1pQ91cIB3xDBzGuKAJJfYM=;
 b=EHQbeuHToFZ4MY/pBDppUZiK/SgIoXNMYUlopAQ8syWinDU6C+Kr4ttr5wwM9Phq6freKYn5D
 TOWHg5hyaDbDnn7kMYve/jMHwSyBTxMJh21Dg40Qgsk11Ox1jxkkFma
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX8JYLl//3f8RI
 qpkF8JZBVsCuEd9kGdDhVWsGYQ7HBUpllhpTDzbma5ypw+m1dfR1DldNdgo5zJKJpNLo4IU3BSu
 HMjEovkJh3n48Lhpe9HygrglaFeO1fc=
X-Proofpoint-GUID: F6w-1bN75FJZ0agw5SXhvkJsAgGOcdoF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX3xzS2Y6fB1ym
 oIUP+jPGTJa+XU8D0zCvvCtZEVe4hsCSquNzB6FObY8lF1+1Jp//j9lgyBT6U0+s0Ey/8LKuy8f
 l1z6p333Ce1Y4BOMltYY2chSyd98h3MrOyEtHak3Dt4tuEgaJ6uKJlnzCUKyEzA00Yvyy0gDirj
 6BKEY8NMZ5RLd/9szQLPmJFjRjaTJFAJMvdiFr9JNT6QbzLmpSKZZD8anOleeefLfboUq19mqui
 D8cp1w4/sdKRMgglN5wH8YHdKs9Y9YFHRUuJtEReRj9NX+g7ENRtLBVeHQ7SCztZ1nHr1WoeNQW
 FwL/ArnvHbCPPW41A6phwZKM2W60qL/Hck1RqQXE/pEeQqQJInxBCpJS7Xd5i+bDr2gfdUxBIze
 R3FMXSBbWvBuDeNAInjJwzeR9NvHPcQJ52Gs3AB66e1oSh/Lv3Kti7sktD3j0UyF3f2yuowPhK4
 /u8asN9XuCKI06lFSEA==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f4 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=5dTYAPD5xSfmRx3JF_cA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: F6w-1bN75FJZ0agw5SXhvkJsAgGOcdoF
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

From: Donald Robson <donald.robson@imgtec.com>

Add subtests exercising DRM_IOCTL_PVR_DEV_QUERY with invalid type,
successful query of all types, and undersized buffer error paths.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
 lib/igt_pvr.c                     | 31 ++++++++++++
 lib/igt_pvr.h                     |  4 ++
 tests/imagination/meson.build     |  3 +-
 tests/imagination/pvr_dev_query.c | 99 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 136 insertions(+), 1 deletion(-)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 048ccab31..2e6c4ade3 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -73,3 +73,34 @@ off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle)
 
 	return (off_t)arg.offset;
 }
+
+/**
+ * igt_pvr_ioctl_dev_query:
+ * @fd: The file descriptor of the DRM device.
+ * @type: The type of the device query.
+ * @size: The size of the query structure.
+ * @pointer: Pointer to the query structure.
+ * @expect_err: Expected error code, or 0 if no error is expected.
+ *
+ * Function to perform a device query.
+ *
+ * Returns: The filled-in query arguments structure.
+ */
+struct drm_pvr_ioctl_dev_query_args
+igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
+			void *pointer, int expect_err)
+{
+	struct drm_pvr_ioctl_dev_query_args args = {
+		.type = type,
+		.size = size,
+		.pointer = to_user_pointer(pointer),
+	};
+
+	if (expect_err)
+		do_ioctl_err(fd, DRM_IOCTL_PVR_DEV_QUERY, &args, expect_err);
+	else
+		do_ioctl(fd, DRM_IOCTL_PVR_DEV_QUERY, &args);
+
+	return args;
+}
+
diff --git a/lib/igt_pvr.h b/lib/igt_pvr.h
index e8b2d9026..b25fb1867 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -13,4 +13,8 @@
 uint32_t igt_pvr_ioctl_create_bo(int fd, size_t *size);
 off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle);
 
+struct drm_pvr_ioctl_dev_query_args
+igt_pvr_ioctl_dev_query(int fd, enum drm_pvr_dev_query type, uint64_t size,
+			void *pointer, int expect_err);
+
 #endif /* IGT_PVR_H */
diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
index 65b90c39f..62930da2b 100644
--- a/tests/imagination/meson.build
+++ b/tests/imagination/meson.build
@@ -1,4 +1,5 @@
-pvr_progs = [ 'pvr_gem',
+pvr_progs = [ 'pvr_dev_query',
+	      'pvr_gem',
 	    ]
 
 pvr_deps = test_deps
diff --git a/tests/imagination/pvr_dev_query.c b/tests/imagination/pvr_dev_query.c
new file mode 100644
index 000000000..29c7eb550
--- /dev/null
+++ b/tests/imagination/pvr_dev_query.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include <errno.h>
+#include <stdint.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_pvr.h"
+
+#include "pvr_drm.h"
+
+int igt_main()
+{
+	const enum drm_pvr_dev_query types[] = {
+		DRM_PVR_DEV_QUERY_GPU_INFO_GET,
+		DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,
+		DRM_PVR_DEV_QUERY_QUIRKS_GET,
+		DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
+		DRM_PVR_DEV_QUERY_HEAP_INFO_GET,
+		DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET,
+	};
+
+	const uint64_t sizes[] = {
+		[DRM_PVR_DEV_QUERY_GPU_INFO_GET] =
+			sizeof(struct drm_pvr_dev_query_gpu_info),
+		[DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET] =
+			sizeof(struct drm_pvr_dev_query_runtime_info),
+		[DRM_PVR_DEV_QUERY_QUIRKS_GET] =
+			sizeof(struct drm_pvr_dev_query_quirks),
+		[DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET] =
+			sizeof(struct drm_pvr_dev_query_enhancements),
+		[DRM_PVR_DEV_QUERY_HEAP_INFO_GET] =
+			sizeof(struct drm_pvr_dev_query_heap_info),
+		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] =
+			sizeof(struct drm_pvr_dev_query_static_data_areas),
+	};
+
+	struct drm_pvr_dev_query_gpu_info gpu_info = {0};
+	struct drm_pvr_dev_query_runtime_info runtime_info = {0};
+	struct drm_pvr_dev_query_quirks quirks = {0};
+	struct drm_pvr_dev_query_enhancements enhancements = {0};
+	struct drm_pvr_dev_query_heap_info heap_info = {0};
+	struct drm_pvr_dev_query_static_data_areas static_data_areas = {0};
+
+	void *const containers[] = {
+		[DRM_PVR_DEV_QUERY_GPU_INFO_GET] = &gpu_info,
+		[DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET] = &runtime_info,
+		[DRM_PVR_DEV_QUERY_QUIRKS_GET] = &quirks,
+		[DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET] = &enhancements,
+		[DRM_PVR_DEV_QUERY_HEAP_INFO_GET] = &heap_info,
+		[DRM_PVR_DEV_QUERY_STATIC_DATA_AREAS_GET] = &static_data_areas,
+	};
+
+	int fd;
+
+	static_assert(ARRAY_SIZE(types) == ARRAY_SIZE(sizes));
+	static_assert(ARRAY_SIZE(types) == ARRAY_SIZE(containers));
+
+	igt_fixture()
+	{
+		fd = drm_open_driver(DRIVER_POWERVR);
+
+		for (int i = 0; i < ARRAY_SIZE(types); i++)
+			memset(containers[i], 0, sizes[i]);
+	}
+
+	igt_describe("Test invalid dev query");
+	igt_subtest("dev-query-invalid") {
+		igt_pvr_ioctl_dev_query(fd, (enum drm_pvr_dev_query)-1, 0, NULL,
+					EINVAL);
+	}
+
+	igt_describe("Test valid dev query");
+	igt_subtest("dev-query-success-all") {
+		for (int i = 0; i < ARRAY_SIZE(types); i++) {
+			struct drm_pvr_ioctl_dev_query_args args =
+				igt_pvr_ioctl_dev_query(fd, types[i], 0, NULL, 0);
+
+			igt_assert(args.size);
+			igt_assert(args.size <= sizes[i]);
+
+			igt_pvr_ioctl_dev_query(fd, types[i], args.size, containers[i], 0);
+		}
+	}
+
+	igt_describe("Test dev query with too small size");
+	igt_subtest("dev-query-fail-too-small") {
+		for (int i = 0; i < ARRAY_SIZE(types); i++) {
+			igt_pvr_ioctl_dev_query(fd, types[i], 0, containers[i], EINVAL);
+			igt_pvr_ioctl_dev_query(fd, types[i], 1, containers[i],	EINVAL);
+		}
+	}
+
+	igt_fixture()
+	{
+		drm_close_driver(fd);
+	}
+}

-- 
2.43.0

