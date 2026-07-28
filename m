Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B2CC54F4D
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E55710E7E8;
	Tue, 28 Jul 2026 07:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ad2cpLBn";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF9110E534
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:24 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6rrUs1821360; Tue, 28 Jul 2026 08:19:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=6
 riMn4K2PQtiWq9vOZvgG1dTtziATnt2QGHNz1lF5Uw=; b=ad2cpLBn5oOUHMK1T
 ii4g+P7CDpRbjvDeDbmg9TDOSvWtLbNHz36JOCV/bgS3CNgoEj57KWx/F7Fb09sN
 ZATEEgzrm48Oxomztl9vd+FJ6p2rNzE9J3lw27VA2O9P+u5zbg3NEe0mD48Oz1gm
 Y/Dpt8nIo1rRlBNiJ3wDRflQMhJ1YGaw81d87s9johlArkfJAVTbannRv+aG1oNw
 0nXL+J1UG9M1SKJm2D0inPKFe464xXNbJg6tjuwySDMuKGdCRY3kIuDx5UacdYG9
 Mor/ReLmDQCP/PsTJOJ9GX50n+3SsWJawhTcxdpA0sav9JL432fL4EtkSj0CAkpJ
 +/ZPw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 08:19:20 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:19 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 09:19:04 +0200
Subject: [PATCH i-g-t v5 09/10] tests/imagination: Add DEV_QUERY quirks and
 enhancements tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-add-support-v5-9-33049f0d1937@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=4262;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=4utY6o48Efe93RZmSd91GYIHTawByutidxsnRdJCQy0=;
 b=G1EbboBELDqOVs4I8w1sMkJXibo/Z1UNheVHv+Dd/SyBifE/wu3bVgzA1MBpZxIsvhJZI0fD1
 rxuQMf3ivtWDY07fd6k4+kg7zUhzJiv498ddyrUSZTX6LLcoBdr02+T
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX4ENB0IPjBZq+
 25xPNT+AQ9M8o6wTw1dUpgUuz7ZnsYo0VgPP0okkJd5iytFTPlAx2iy/bNqUzrxvRRtI8OLp49n
 QI6sYadzx4qYuE9P55BYxMnKx6eYKLY=
X-Proofpoint-GUID: LFsQy7hhq9y-nS9S0BOPCjzRvmUCdjRx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX2/d1iqij5hMP
 I/YevgdT3gx9MScW/rQfwmFGedHbeZSXQSi5Ea9TSrvk0NoNo02r01EAsGxzu9Y3AWfzImSqc3d
 l4uJYw5GvpFSWMgaq8guDiSTQ6Hadc4GOxTkv6SmOlJFLnAm+PABx5iW4/+CIoe0wnsH9ExIhSu
 8qwOMLUBnQlaUdm9CAdhtvJXMVff0TB7Tg24baddpj/gznFpbjKDrXfLsfOSZkzJjxBdBAq4xkU
 l/BWSTP4B5XtgSe2HwVpqjd+V0FtlXyLzYqnd58q/VW6H8MqwvYXE8hz7cMMmNiQ9H34sdyxL4J
 jNhhVoGsZZOa/8skLeVEVF1pbie/O6EpkvMuknSlkVHVnIrpQf3BzoIhIO8o+rS3oia5UWe4rCa
 Tqzy9emSai5jGLcvxVEYiv2VWlPThyzW5zcn2RoknTbndV7JCEwjazQoT9JW4i0i6y+hEVtWl+Y
 jg9vOG80dnMIOW/kgQQ==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f8 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=EtmrXVZ7CjpRo9WCTJAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: LFsQy7hhq9y-nS9S0BOPCjzRvmUCdjRx
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

Add subtests for DEV_QUERY quirks and enhancements for array copy
and invalid padding error paths.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/imagination/meson.build               |   1 +
 tests/imagination/pvr_quirks_enhancements.c | 112 ++++++++++++++++++++++++++++
 2 files changed, 113 insertions(+)

diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
index 69ef0a8c6..dc08a5d8b 100644
--- a/tests/imagination/meson.build
+++ b/tests/imagination/meson.build
@@ -4,6 +4,7 @@ pvr_progs = [ 'pvr_dev_query',
 	      'pvr_gpu_info',
 	      'pvr_heap_info',
 	      'pvr_hwrt',
+	      'pvr_quirks_enhancements',
 	      'pvr_vm_context',
 	    ]
 
diff --git a/tests/imagination/pvr_quirks_enhancements.c b/tests/imagination/pvr_quirks_enhancements.c
new file mode 100644
index 000000000..35e5ff190
--- /dev/null
+++ b/tests/imagination/pvr_quirks_enhancements.c
@@ -0,0 +1,112 @@
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
+int igt_main()
+{
+	int fd;
+
+	igt_fixture()
+	{
+		fd = drm_open_driver(DRIVER_POWERVR);
+	}
+
+	igt_describe("Test copying enhancements from the kernel");
+	igt_subtest("enhancements-array-copy")
+	{
+		struct drm_pvr_dev_query_enhancements enhancements_get = {0};
+		uint32_t *enhancements;
+
+		/* Enhancements. */
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
+					sizeof(enhancements_get),
+					&enhancements_get, 0);
+		/*
+		 * Supplementary check - alloc one extra space as a watermark
+		 * to check the copy does not overflow.  We only need to check
+		 * this once for the whole UAPI, as a macro is used to do this.
+		 */
+		enhancements = calloc(enhancements_get.count + 1,
+				      sizeof(*enhancements));
+		igt_assert(enhancements);
+
+		/* Set watermark. */
+		enhancements[enhancements_get.count] = 0xABCDEFAB;
+
+		enhancements_get.enhancements = (uint64_t)enhancements;
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
+					sizeof(enhancements_get),
+					&enhancements_get, 0);
+
+		for (int i = 0; i < enhancements_get.count; i++)
+			igt_assert_neq(enhancements[i], 0);
+
+		/* Check the watermark is intact. */
+		igt_assert_eq(enhancements[enhancements_get.count], 0xABCDEFAB);
+	}
+
+	igt_describe("Test copying quirks from the kernel");
+	igt_subtest("quirks-array-copy")
+	{
+		struct drm_pvr_dev_query_quirks quirks_get = {0};
+		uint32_t *quirks;
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_QUIRKS_GET,
+					sizeof(quirks_get), &quirks_get, 0);
+		quirks = calloc(quirks_get.count, sizeof(*quirks));
+		igt_assert(quirks);
+
+		quirks_get.quirks = (uint64_t)quirks;
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_QUIRKS_GET,
+					sizeof(quirks_get),
+					&quirks_get, 0);
+
+		for (int i = 0; i < quirks_get.count; i++)
+			igt_assert_neq(quirks[i], 0);
+
+		igt_assert_lte(quirks_get.musthave_count, quirks_get.count);
+	}
+
+	igt_describe("Test enhancements query with invalid padding");
+	igt_subtest("enhancements-bad-padding")
+	{
+		struct drm_pvr_dev_query_enhancements enhancements_get = {
+			._padding_a = 1,
+		};
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
+					sizeof(enhancements_get),
+					&enhancements_get, EINVAL);
+
+		enhancements_get._padding_a = 0;
+		enhancements_get._padding_c = 1;
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_ENHANCEMENTS_GET,
+					sizeof(enhancements_get),
+					&enhancements_get, EINVAL);
+	}
+
+	igt_describe("Test quirks query with invalid padding");
+	igt_subtest("quirks-bad-padding")
+	{
+		struct drm_pvr_dev_query_quirks quirks_get = {
+			._padding_c = 1,
+		};
+
+		igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_QUIRKS_GET,
+					sizeof(quirks_get), &quirks_get, EINVAL);
+	}
+
+	igt_fixture()
+	{
+		drm_close_driver(fd);
+	}
+}

-- 
2.43.0

