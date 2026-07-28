Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8E49C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 19:40:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF8610E5E2;
	Tue, 28 Jul 2026 19:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="cNFFeS36";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9C310E5FF
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 19:39:49 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66SInstj3113201; Tue, 28 Jul 2026 20:39:45 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=c
 ArGdVKuNDnPvHmIqinix+6tu5WuziDOj+kYCPUBrXo=; b=cNFFeS36yI2RofoYn
 QYKoXr9LGZNZy8pe9PCwU85Vc6hhRYNnH5kf3DQIJB63xlUIXiMp39cgPocXdRwh
 LQs1ZGfWr0yKbuboARGAP3VCpDBmIIbUI5XRZnItwSm7455ZOSDnFL7DxpOynebr
 EJbMt69ByFNSu1I3Rf3A97ZQ8n96ivTbMKcPC2M+/vCrCT11dHV2b2VtCniPrdCp
 NAVxiHygnDr2BQAGKmYjb418vgB2coM87rrTQzsVLQSMAcJQpgwUw4NaLPvhAAIn
 9oFWSWpjUGZV8VXNMRMVIReqZCJ3xBOOL73boX1f+Fq9T9NCdsDPXa8azUaugyYI
 1zqxg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s31s2-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 20:39:44 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 20:39:43 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 21:39:33 +0200
Subject: [PATCH i-g-t 1/2] tests/imagination: Add DEV_QUERY quirks and
 enhancements tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-additional-dev_query-tests-v1-1-f361c7c2b513@imgtec.com>
References: <20260728-test-imagination-additional-dev_query-tests-v1-0-f361c7c2b513@imgtec.com>
In-Reply-To: <20260728-test-imagination-additional-dev_query-tests-v1-0-f361c7c2b513@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785267582; l=4276;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=KlT56moJG59IuLEdDXNkhAscjhmlcQgPxp6fWxTrN/Q=;
 b=ye8dB1Lua3VDpN3D3yHn26TuG9V072jlllF3XofRNXqjhmQHYx1q2u5aI9YCOYKZ+1pUYb7b6
 ohi/C0eGHJGD3MUGK6cXBu9WxKLgPkDCSJL/HRYwqit56VpvZUkZABe
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDE2OSBTYWx0ZWRfX2Et8gA3ANm69
 MnRGL6xvf6dCcRDli7U9rcJSvF3Xz0ZgJCecBKFbOAXJ205fYxEqSVQFs0dgmz+laP0PCKqD0xB
 SzxIOxmvxYxENz26k4tNAbESKDIHmus=
X-Proofpoint-GUID: uueTeN26qbSpX6oxx3fpxpFFYYhqXY0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDE2OSBTYWx0ZWRfX0l8OyoiiECen
 iN7SzB8LikEBSFF0lS3jU9HXiXTUhpkt0lfO4zNdslq0FOtuga0YGDn6gbnKdI42xXptbfoRLq0
 bgzUEfyh0s/uymOV0OyDZx5dXn3NkiXb/JAL6nkfgWNmWzCDA/q8cN/IRUTZkV/KfAb+YtwCjQn
 h2svndxRffCULsAVo+cVjwyZsg5SsbVA4nPCUz9E2adZYYESmLVrUsWEkuwLutUG0QQL86C3MB2
 ee41EvRWAUfeMr4/qu5xJngaYiZrC9qQepPKrfXtkL0uF3GFa/DbKmk7LiO/xXYoo0PAJCPqd7i
 DheCDXOG/RIJh6yMCUFxOY83cyMm0TuXPr+MiEXj5o6XGVnprskAiaVRguNF3/DoZ+HzHr9Gorj
 I65oCsddFMbTTc4J7hhYtS6V0JtCW0kD0d/hvOT5HUH1hV+h7isUvIQ2wj1pku4O6o9M+palrgo
 InXJ2YoHAI9ZBGB1BHA==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a690580 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=EtmrXVZ7CjpRo9WCTJAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: uueTeN26qbSpX6oxx3fpxpFFYYhqXY0v
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
index 000000000..d91a5ab64
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
+		enhancements_get.enhancements = to_user_pointer(enhancements);
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
+		quirks_get.quirks = to_user_pointer(quirks);
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

