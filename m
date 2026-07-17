Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6FC4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:24:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D554910F581;
	Fri, 17 Jul 2026 14:24:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Abp1KvDG";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BB110E472
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:11 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE3uxH3706602
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=m
 kuLCFO1byv6gADLZ7g4MIV2MEvsMqzwiOgcOBTCRcA=; b=Abp1KvDGXMNBfW6z7
 TUeO7HtZIGrC1UeMorOw/2pDJA41C/D17fmmugvvcgOkb57fT83H2LWta8yjFfBQ
 hqvkIgbt5r6TKsVgepC7W/UzPUcH4SwOPKVBYbatLVh+CbwCrd2d+VUadX7wT+q/
 QsIl2ZJPZzhyUiRuPqUjMttj4MoUrQfgLpJ1dkE/FYFsETOIuXx+YqzlVfsMXWfe
 KKD9XXbCLu7QOBGut1mpn0D8N3iinj7qiX6ujlytkZu5msr7VfabfRLWmcJ2O8p7
 4MTsdDDxOy6WpO1ZuIEg5NQFuGy+juWON16CJvEDpbwAM70k3eb/UNJQRGjOLcEd
 z3s7g==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7d61d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:09 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:08 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 16:21:35 +0200
Subject: [PATCH i-g-t v3 03/10] tests/imagination: Add DEV_QUERY tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v3-3-ce69f9ad330c@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=5737;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=IkgMNNRRsvwO0/ioNSMSzetEyNhHE5qEuqC4+dQgRnA=;
 b=Er47KeUrpMstyN2QFVHkO1ziaLCFE51YJAME/kuyrt7tRX7++imEZnO7lstYLBDSGhAVwdfN5
 4YUU4u9HoipBlQLo1Qtxd9YVsal6mMkFJSviJIJzPXuaAumnPel0tOM
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX2TZaxfJH/C0F
 aedvxcH3TiBqMtQjf9jCR4YY0tpqJ53PLblu4o1W2ezylrAWSTkN5zNDJ1agz4ZjXcMyj4/43/b
 cuhgKxeUB2uNowo1wKzdwN/TfgmxgZY=
X-Proofpoint-GUID: cJJV86aTRMlsYHIh94MdVKvqHxgRE4UJ
X-Proofpoint-ORIG-GUID: cJJV86aTRMlsYHIh94MdVKvqHxgRE4UJ
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a5a3a91 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=5dTYAPD5xSfmRx3JF_cA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX7PG2xK7SCqYP
 z7PxNW0gznmF3ppKYwykyR9ZPmJy1Ka1qwg2QGl/qBIHF6Eviw4HnbKFJ/YsPP7z5NUSZznlF5Q
 pjw7thwIbbPKBNcIkFgM0HWlquBMUKdDNrxLJOC+3Y6JurJqL6+sfwXKmdn4kHqmYas0U8JUPdH
 kYzqm2hBi0jR/0tIQg1fQtpcHEiFy3s+xGYDKF1Qvtptp+2MYGlZaKmznZP5XdToFPwV2ftnd4s
 A8ozMOn3cG6Kls4litC1xPZk3wFaUM/5qGQxe14ll4apOlPxxxxWhdPfDOAP4SvwPMPinTCSJ6q
 AdTdbn0Cch+Em0KY3+BpQo7nZ2s7kfJRi5bnt0pQFq4VxUzRXU4U7lOf6Nn+Kc2DP4gkYsdMqpo
 p8fpkwmfPiFUIygQHe4XtHwOb5tCCNB+rUV+ABwAMosCmG+XkWo83OZ3SVk4yI5r7QCPGF3b5BJ
 wAiNWHM70vpdrK8kpiw==
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

Add subtests exercising DRM_IOCTL_PVR_DEV_QUERY: invalid type,
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
index 048ccab31..421cbc24c 100644
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
+		.pointer = (uint64_t)pointer,
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

