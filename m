Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68A3C4451B
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:27:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5376710E47A;
	Fri, 17 Jul 2026 14:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="gV+H+azq";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2BCC10E462
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:16 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE3uxI3706602
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=U
 apUowTP6E+QeV7LryAF6zyDz/36dccIv4NaU0yPg7g=; b=gV+H+azqvnP0fcIOk
 dRMg4mfd1lknVtD5mhwyzUyAjKSX1jVpx5F2ajwOj6V6RrwOM3AAKKnqE8Z5qHpK
 KGYvqKgWfb09dNWXOGdg7wFeJ8DupdFkka3MLprUciCYABBnorkWnUg6B9iQjZNN
 1Euane+henRkrim9IRDKjQgrKL6rg4oQUXvbfTeWIJqfYJaWABK3LvHpRv2oklXK
 qrRHFdt19idQs3MDcDwCJElGcRkk+vJIWUuc5QeNJy1dFXiqgWxSczsbcu5WFe4i
 3CeST1h/bqkjrPwGAQ7ZqSk7Dp5BPm9TQLYMCHAOgwrbdxD5Yw87HVYK+HD6q9nI
 yutSg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7d61k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:15 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:14 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 16:21:41 +0200
Subject: [PATCH i-g-t v3 09/10] tests/imagination: Add DEV_QUERY quirks and
 enhancements tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v3-9-ce69f9ad330c@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=4198;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=8qS7NBiXwRhU/UB9vzJ6YkGmLvSuqKo/lhzavFG1GgU=;
 b=S+qfUrnlAuvqmJzWEilM+Kawv5WkdR1DZG6Wc8h2ClJDJZocUjdjLE8MBrN94rGOSvBQGWMYa
 DDY8MfF3upRCold1a8jwzQgTRtCMBQIuQsO0XWhMJ+ZUGDInphZxetx
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX+chNeAkjAXG/
 nDzfvs6u45Xhjd057plzCLDBHPpyO1QOD/CucUe6LkVGGo7MqoqWt5WfKmeifeqBh11j0FiBTZD
 OcwHt8VGGdQutNafC32j9LNBcdUZhOw=
X-Proofpoint-GUID: ZuA0BIJsjEXsfPVes5KMMZC1F6nb8mLb
X-Proofpoint-ORIG-GUID: ZuA0BIJsjEXsfPVes5KMMZC1F6nb8mLb
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a5a3a97 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=EtmrXVZ7CjpRo9WCTJAA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX3lTMPNryH/Cw
 z8IXwgulLDQHxkQ9FqDhcU//VlWdWXeJruSLGxZ0XGexoSe33TTOVczP99uUWffzGpCmsU+XcrS
 PWfBhGB4fYq/AJSV8sChR64ytb1i4PRlwcLpX+lWtwm2Pk/bJhDL71I3kl4UXdDhMIMZgdHSFf0
 8c494rt0Xl8nVPbwf+O2qScnhfa+U9KdnMAWBIbpSo01zm7GdDWAVAKuGmbvUzczs/xZ1q4OBgp
 tP3l+hegwZn1oXcTe2sgY4zWWq1yjqdcTbUSywkaqqDKkR/VZTRLbdQde2Z2Zh7dUrevkrrIpaY
 YCLURo+uCWIP6wsQMRRQFpM82FkBaA7dPR2DlXCR4KwL1oJ2wkYa4kdH+3SfqHx18/+4C3I9kFB
 7p5FXNNGbogeegDokhrKr4excb3PT9MwYGKyBmpyemK7tNoKlpssYtwRiOLZYmr9q5srpoB3Tr0
 jBeFppXJ8/2oQno3mIA==
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

Add subtests for DEV_QUERY quirks and enhancements: array copy
and invalid padding error paths.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
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

