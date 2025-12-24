Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718E4E7544D
	for <igt-dev@archiver.kernel.org>; Wed, 24 Dec 2025 10:25:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2241210E612;
	Wed, 24 Dec 2025 10:25:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GyU+hl41";
	dkim-atps=neutral
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B0810E612
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Dec 2025 10:25:58 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BO9WGsv700570
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Dec 2025 10:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=2v3skIL5kDFGpqn5iaAzszM4TUfBQ30u3N0
 alLRQrF8=; b=GyU+hl41lWwXXV0foYqTxZKqzpkAgeit6e8rjg9igIID09Dc0vy
 CKeoEvyKfAKbFVelqXtm6xLDh4i31GF0ZvWx5GagX9JwoeShP1Hy7rleljCEyfjU
 bPRpN5wA4JxG8NkHGyRYX60icDKvwQ2RLS/38qUpQwPQXhmiRqLUCOKnZ6OYRbP3
 +7qiA5DiAtvLhh/O+kTCnobPV7XxlnfFuKs8CQGGXS7PnGVfvJVCtGZdHd6d5bov
 3P1yPvCYrJQYBf9lelfR9iMzr45D5SlyJRgnV7Yvd+b+8Mrnd8uQs6yUNBpX5nkm
 BZnO4I8HRbBMDR67vQXtfq7aJIZ8Z00nimw==
Received: from apblrppmta02.qualcomm.com
 (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jue3p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Dec 2025 10:25:56 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5BOAPr9Q002871
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Dec 2025 10:25:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4b5mvmgs5q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Dec 2025 10:25:53 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5BOAPqDD002862
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Dec 2025 10:25:52 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-jvignan-hyd.qualcomm.com
 [10.147.241.47])
 by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5BOAPq32002850
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Dec 2025 10:25:52 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4601609)
 id 775F256F; Wed, 24 Dec 2025 15:55:51 +0530 (+0530)
From: Jitta Vignan <jvignan@qti.qualcomm.com>
To: igt-dev@lists.freedesktop.org
Cc: Jitta Vignan <jvignan@qti.qualcomm.com>
Subject: [PATCH] tests/msm: add MSM buffer object allocation tests
Date: Wed, 24 Dec 2025 15:55:44 +0530
Message-Id: <20251224102544.347540-1-jvignan@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA5MCBTYWx0ZWRfXyQC0dMkcuL3n
 C6d1taPfbaStFsup0lZhzYFZRnF2sByI/kU1oIYMzvykizBmKG2VbTkUkQCKT5BdA5UicYjbhNl
 Nh/NFEnbobrsHTXRLjOlE++ycFfikxwvdQCmuRHTbKY58QoltPCvtbnQ/YFyK1OwgLwJ3Tl2XWL
 PZxEgN+cQCoL0o3zwh3LUWZNFykjDWdui6kCCX/VbjB+nZtWpLnMb1mP3peXhxja3/Zk4Y3t8SJ
 o4L+OzPdTP3Hx/835hd1wbXEtaqtXgQW1UNQOHAsKyCcdy3rxiH7DqzYWIfsKvCs1/fwdnky1tM
 osy0Sgf1+guTwmgKG+17CaIwjlKupCZdMpdxPUyIJznuekkhe3l1B4/ZRMXjunHVHpY3TRR1E+A
 QmAGyuKVHBSENP33kBWu0ZXT2AwWQ4jdWfEilkKEBFnw5MauD5EKeiZPGa3JX9T4cTSMf+ItS7I
 Ln54YybQNv5GzLkwjVg==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bbfb5 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=J6tgZPC6OvCdJj2DjxMA:9
X-Proofpoint-GUID: jSr32XnoXWJ2zfJs1u5Y-leMs8-1GUV1
X-Proofpoint-ORIG-GUID: jSr32XnoXWJ2zfJs1u5Y-leMs8-1GUV1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240090
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

This patch adds comprehensive test coverage for MSM buffer object
allocation using the DRM_IOCTL_MSM_GEM_NEW ioctl.

Test coverage includes:

- Basic buffer allocation
- Different cache modes (cached, write-combine, uncached)
- Negative tests (zero size, invalid flags)
- Unaligned size allocation

Signed-off-by: Jitta Vignan <jvignan@qti.qualcomm.com>
---
 tests/msm/meson.build |  1 +
 tests/msm/msm_bo.c    | 99 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 100 insertions(+)
 create mode 100644 tests/msm/msm_bo.c

diff --git a/tests/msm/meson.build b/tests/msm/meson.build
index 74169b5b2..2ba5b4db2 100644
--- a/tests/msm/meson.build
+++ b/tests/msm/meson.build
@@ -1,4 +1,5 @@
 msm_progs = [
+	'msm_bo',
 	'msm_mapping',
 	'msm_recovery',
 	'msm_shrink',
diff --git a/tests/msm/msm_bo.c b/tests/msm/msm_bo.c
new file mode 100644
index 000000000..131b43bfa
--- /dev/null
+++ b/tests/msm/msm_bo.c
@@ -0,0 +1,99 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <errno.h>
+
+#include "igt.h"
+#include "igt_msm.h"
+
+/*
+ * Tests for MSM buffer object allocation
+ * Tests DRM_IOCTL_MSM_GEM_NEW functionality
+ */
+
+#define DEFAULT_BUFFER_SIZE 4096
+
+int igt_main()
+{
+	struct msm_device *dev = NULL;
+
+	igt_fixture() {
+		dev = igt_msm_dev_open();
+	}
+
+	/* Buffer Allocation Tests */
+	igt_describe("Test basic buffer object allocation");
+	igt_subtest("bo-alloc-basic") {
+		struct msm_bo *bo;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, 0);
+		igt_assert_f(bo, "Failed to allocate buffer object\n");
+		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
+		igt_assert_f(bo->size == DEFAULT_BUFFER_SIZE,
+			     "Buffer size mismatch: expected %d, got %u\n",
+			     (unsigned int)DEFAULT_BUFFER_SIZE, (unsigned int)bo->size);
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Test write-combine buffer object allocation");
+	igt_subtest("bo-alloc-writecombine") {
+		struct msm_bo *bo;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_WC);
+		igt_assert_f(bo, "Failed to allocate WC buffer object\n");
+		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Test uncached buffer object allocation");
+	igt_subtest("bo-alloc-uncached") {
+		struct msm_bo *bo;
+
+		bo = igt_msm_bo_new(dev, DEFAULT_BUFFER_SIZE, MSM_BO_UNCACHED);
+		igt_assert_f(bo, "Failed to allocate uncached buffer object\n");
+		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_describe("Test allocation with zero size (should fail)");
+	igt_subtest("bo-alloc-zero-size") {
+		struct drm_msm_gem_new req = { 0 };
+
+		req.size = 0;
+
+		igt_assert_eq(igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req), -1);
+		igt_assert_eq(errno, EINVAL);
+	}
+
+	igt_describe("Test allocation with invalid flags (should fail)");
+	igt_subtest("bo-alloc-invalid-flags") {
+		struct drm_msm_gem_new req = { 0 };
+
+		req.size = DEFAULT_BUFFER_SIZE;
+		req.flags = ~0; /* Invalid flags */
+
+		igt_assert_eq(igt_ioctl(dev->fd, DRM_IOCTL_MSM_GEM_NEW, &req), -1);
+		igt_assert_eq(errno, EINVAL);
+	}
+
+	igt_describe("Test allocation with unaligned size");
+	igt_subtest("bo-alloc-unaligned-size") {
+		struct msm_bo *bo;
+		size_t size = DEFAULT_BUFFER_SIZE - 3; /* Unaligned size */
+
+		bo = igt_msm_bo_new(dev, size, 0);
+		igt_assert_f(bo, "Failed to allocate buffer with unaligned size\n");
+		igt_assert_f(bo->handle != 0, "Buffer object handle is 0\n");
+
+		igt_msm_bo_free(bo);
+	}
+
+	igt_fixture() {
+		igt_msm_dev_close(dev);
+	}
+}
-- 
2.34.1

