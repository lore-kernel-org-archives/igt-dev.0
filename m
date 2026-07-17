Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93472C44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:24:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42C1710E428;
	Fri, 17 Jul 2026 08:24:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="BE0Pk2nF";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1D510E428
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:23:08 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H74QTS2889361
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=g
 pXx72leA8TvvjuI1ZLBGH8GyhcL5+nLmP8A3MwWIGw=; b=BE0Pk2nFt5iR0GpLy
 KGDPdq8e7jv7QFWZ38pbXQEpCUYciNmC6fztpJjuJGf8HPyt077al2OsTrv/U4C2
 /tKU2wdvCBzxvVBV7vImrP8JgjaOMUuDUFtslJ10tXjCeYpKWHPsORavfFfD/Dgg
 t8dtaXo0LB8zyrVQw3Lv+N4y/goduDpiNQjBT3e8/VpTlgsJg2AuAjzI8KE7zgY2
 CB0alvtP2LV3yBKCOo26XxBOet46BZDjxNQ3cfm/fpZLoVDguNoKEhfzFnZKlROz
 75Igu2pfZYRNtJuVTLhtko+uSFiQ29r2T+9P4vlVVWLBvNmbkhGL2LYHHbOqqXrT
 emO1A==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnh06-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:13 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 08:49:13 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 09:48:16 +0200
Subject: [PATCH i-g-t 09/10] tests/imagination: Add DEV_QUERY quirks and
 enhancements tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v1-9-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274547; l=4187;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=qAvO4HXDIaCbu4FtE5cDrw7etTr5//hlCZr+BhWggxM=;
 b=kReT8DxfW5RdDc5cCjeOormK+Kuxq4ZCZu13pUu9kBTUzh+AMMTWy9xJzkVwsEiBNbOpWbNnJ
 5kmFdEt56T+A2guTb+j5o0FiWc2eLhXYk5F1eUYiQQ3MN4JSjlZb19m
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfXzFvGPpAIpm4F
 Dbrf00Vpp3Ijhchw9Cz4gHZ5Odl8TKexQtU5OLST3ECLjLcNbxMpRYJ6mnRxi0WRry2DscIpQCY
 jxUuW+nBOM8J84hl71uPBX6OWh2exfWdZfeeqqB1A/0wTWpENFDZkHPL0AeVt8VaWipgl0KoP3I
 X3ivJFkxyk3S1YVOjjnv122j6j64xf6z7WCLYpC+c0PXibAT84Xma59XpO8RvUxUraiGfwbObGx
 m+xgt5EakphMdECuVFys2I68vvLsb/gG8ut16umoJltMgg2Zqrq39kfj6ge2ruf6wN7txDl/Tvk
 BFh8VRVJg5oavAgdAy4uz85ovNH7i5pLpqbz/YAQav7lWIkoyuG1dHDSoBFghAJURFMnpM63ehx
 b3L1Rbm9o1hpOTjAp1mYo6KzvS111IDFBf8w7RSMJjcVMOm/aEDRrceVJqH9R0QA25B+ILUrMAi
 TobFFiSf64t7HGloltQ==
X-Proofpoint-ORIG-GUID: JfcbD16Z653gdgyMkxYIM0nssyof1wf9
X-Proofpoint-GUID: JfcbD16Z653gdgyMkxYIM0nssyof1wf9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX0GBvzYP5jglx
 Amy5hAWhBBOBw3KnGgWFA9jh02J1iuWBo9oPPjVGjfBH5DpQNYmNqFA56gxGIKA8702A1Na+bxa
 kkHCFo6y6w0xHkRdbhHRbcVRa+GSBJI=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59de79 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=EtmrXVZ7CjpRo9WCTJAA:9 a=QEXdDO2ut3YA:10
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
index 000000000..876fed407
--- /dev/null
+++ b/tests/imagination/pvr_quirks_enhancements.c
@@ -0,0 +1,112 @@
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
+		close(fd);
+	}
+}

-- 
2.43.0

