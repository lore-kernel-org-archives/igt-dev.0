Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD9CC44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 09:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77D8A10F4C6;
	Fri, 17 Jul 2026 09:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="FGMI6ti0";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E485410F4C6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:18:58 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H74QVt2889361
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=g
 pXx72leA8TvvjuI1ZLBGH8GyhcL5+nLmP8A3MwWIGw=; b=FGMI6ti01lBlkQNAa
 /Te0wW8q8we1UYewN1+7z8i5lJOudjswwU+Yu+D+5iT0G/+mYtJp4RjiHxa3C9Ow
 +gYnOJDNYFHp5u03l2+QIggqvz70wq7DsHFLqoGqNHS1I88StAK0C3B2vqBeLN82
 ia2Xsg8xd6R/oIay8SwE3diFZxy0fVj9NBN+YRbT6CD7y4VVEYMivHrp1Wn0b1bR
 C8f6TyQTzFZDAdZvNatGHYm1n4PiggP9IQ45aD1SQv8ZiN78BBU7MFXMKu459Dl7
 6QkD3iobLOIHOWcEb4nX1+o3dRV58Iyv3yM14Li0bF4edRPrp5VlDwhgVG9RT7dd
 +9VyQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnk15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:57 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 10:18:56 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 11:18:22 +0200
Subject: [PATCH i-g-t v2 09/10] tests/imagination: Add DEV_QUERY quirks and
 enhancements tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v2-9-e1bf415adcee@imgtec.com>
References: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784279928; l=4187;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=qAvO4HXDIaCbu4FtE5cDrw7etTr5//hlCZr+BhWggxM=;
 b=xuzK/SkXYD/wxEQXojlNQCCTJ7ulDNSwS79deHxJi9t1tjt421PFc2kb+3kLt0VFmHCRHNIfj
 kYHaViF3nvrB6kdRBoLIATB3laO3NwZxxfv5xArR5A2W1Uss8rHPs/w
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX/62WYlMBAhlH
 RuaTSrSephzqQA6PmaKevV721ub23xABdv0W7b1WyKWs0oeP14KoVvLPNu8ssWiuyqn21L1tjgR
 PiOwlt8WiDZKFFu3P8pQN4oJhCkwZlnOy+0A/pz/2hGv57wF8gnlHtl0V8YITXpxz2CYt21ak7j
 FylYm1YaDSrkawemqw70+nc5w2UxtDRMA/Cem0F5sG6lDusJQQxP/cDtviAY+35MSBW8K1yNJaY
 Aes5vZ/A6wEvpy75KEiFuhtMCz3EjRr6qZQfOcZbn/IAMwb1wOikYlzkvV/K6vOJpVmmsaxYw+O
 R4Jf8gL8LJKThuXC+USvpfSJ+fDfpiWhTIstc2IBx7LuVFTpjkVUOHbk1vGnUoIS86NBsFX7v55
 1ef4tlcg0N6H4lJRtA1HWHo5huNZg3OShNHS6c5BSmC3GraEqlxZP0snbDzfkzo6ndyXR6NrMV4
 XCUNtaGhlWSNIf6oorw==
X-Proofpoint-ORIG-GUID: wmp-bluyBsd8oto_JhQewuKdNnYlCbKF
X-Proofpoint-GUID: wmp-bluyBsd8oto_JhQewuKdNnYlCbKF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfXz8rJ1wgenUT8
 hrS5LCAuuaO3L4EYnt3SIbNfOvdewCy37kIyB0VtIG6nujLZyJnx7oME4ZedXmZ9cgJc0c3uVSF
 KbFXhVmmTB5jypV65M7Qaka52EyDyUA=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59f381 cx=c_pps
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

