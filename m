Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D399C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:23:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FBC10E428;
	Fri, 17 Jul 2026 08:23:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="wfWSHD3J";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB43410E46F
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:23:08 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7CaJ42902527
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=E
 OopdK8/CYjOeAEiLPUzcTvPAGKPheItb+4GvknxomY=; b=wfWSHD3JFUiMFPaRW
 xBIV+sL47o3cjlKDzqXN9YgkB9+aAGmIp/Cfm5H3adKgdSYxERB7pOdxI9cqLs6L
 3QmfYboWuKpwXzxm6kXht5qfh1ccfy1EIA4VXjOJ/UbAkbqmIHeaSX6gFMNKyaGQ
 SXG4zJnRkcNbKVaVKqEET2pSoaXydwwmjmc+AIgo22meNZ2r2SztM4sCxHGyNTYi
 qgmvfFdoH9wSb5cGSiWj2LR9safpFKa9cj0M8EVVRCH6BPfwvceWQFfBOj9lqkQh
 UY3cQkrsmTfl3zun0wk96ZZGZ2lzTS1OwujElaq2+zrz+3vDGkU3X/0F3cBvDnb0
 YaUdg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnh02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:10 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 08:49:09 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 09:48:10 +0200
Subject: [PATCH i-g-t 03/10] tests/imagination: Add DEV_QUERY tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v1-3-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274547; l=5322;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=l70ebfhevRBNgSEE4YNUowmsSzKDSyG+L9ThOb8t+UE=;
 b=DAHnyLxboc7RD8ElJFgTX8p+51VBblWayBHEDMuOHQkfHi5xs46ggOSRSA/z7SB7DTCneuXjn
 qalx8ki+0XTDVH4QvGeckLaqfZAaEupl3fo0GUjYf7iLy/2KKiEzu1r
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX3ysl7de6G6bm
 E1fA/poqjltAOUiKZB/KKbz0IobIJ1TRTjKW13mpuldbz/Mla2U6lCOuJokJe9OH6tl2WXA+sHy
 e4frWvqqSptqiZ6KwnovYMkecJdwLJa837ULHdGtkB0Y20+OA/2l6m9fMF+FFLApEbzTgug/foG
 pnNpnHOaF97zU7iezI3J8TDgWSz5dm2fY2M48fl1KHWoFbFrWdIinDD/knpyr43JEb58VoDdgUv
 /3JyN5LFM1InoDDZYNh4/XQfH3jz2ikPzB7Uua27wCWOe1vLOHeMRgoQ1GJSYNpb0mwyUvD6s3y
 WgF9D6cHVk8LndC4cJxndc8f0A8pcDzZUY4cL+wM41QRPao2pUxmc91HUboA3smj1JsG9t9ZMhD
 29SIKY4MjEwoDyHjfVFCvaTnh4vLrN2tySqQcrwXibsX66kmC9gHfE7DWlkPqqyRL8pgwWkF13T
 NKSr+vobCVEkHmyd8NA==
X-Proofpoint-ORIG-GUID: 4LFcHqVaPeXZNOaBmR3k_YMWrMyzHfWS
X-Proofpoint-GUID: 4LFcHqVaPeXZNOaBmR3k_YMWrMyzHfWS
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX7UNhgUyEqejI
 aFRxW6R6tb5GmLopI+cbESzcGo/Y0yUKVWjMCPwRtXrax84kt4Hc1XrJvZt2SLUcFSnM+1Lxkmq
 u0ZrVlG+fwAWx/mSSBl8BIBad3Ytfz4=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59de76 cx=c_pps
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

From: Donald Robson <donald.robson@imgtec.com>

Add subtests exercising DRM_IOCTL_PVR_DEV_QUERY: invalid type,
successful query of all types, and undersized buffer error paths.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
 lib/igt_pvr.c                     | 19 ++++++++
 lib/igt_pvr.h                     |  4 ++
 tests/imagination/meson.build     |  3 +-
 tests/imagination/pvr_dev_query.c | 99 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/lib/igt_pvr.c b/lib/igt_pvr.c
index 957d459b1..a729618d0 100644
--- a/lib/igt_pvr.c
+++ b/lib/igt_pvr.c
@@ -54,3 +54,22 @@ off_t igt_pvr_ioctl_get_bo_mmap_offset(int fd, uint32_t handle)
 
 	return (off_t)arg.offset;
 }
+
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
index 33d826077..e949772e4 100644
--- a/lib/igt_pvr.h
+++ b/lib/igt_pvr.h
@@ -14,4 +14,8 @@
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
index 000000000..cda2b73cc
--- /dev/null
+++ b/tests/imagination/pvr_dev_query.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include "igt.h"
+#include "igt_pvr.h"
+
+#include "pvr_drm.h"
+
+#include <errno.h>
+#include <stdint.h>
+#include <unistd.h>
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
+		close(fd);
+	}
+}

-- 
2.43.0

