Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB70C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 09:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B66D10F4C6;
	Fri, 17 Jul 2026 09:23:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="aSV3Hyk7";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13E510F4C6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:18:59 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H6bwL12840233
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=3
 u7jDXCz9OlBhU1VoaUr1X+PV44NwdW6cfSFIv8WHaQ=; b=aSV3Hyk7J6D4rCRwG
 T+lPPZX/vuS/cludNhG4JDaRmX5/uEQ5kYz3qb7yhuj0Dj7nX2FJ6WqEgE+pXZw5
 c4eAsf29ZYNIsPVvWx0M+NXtcxh+ljZLKP4VQcnffbLq3zijuXoTxMYLEbTJGShu
 SrcAn72n4Qg2G0m0F4gh9ql2b/TAVpVvSoc4FFKe43+U5DyjJqmKkt3d0MciVzAJ
 yIywQ+oKtwh3moxazLirfzy/xwmpPw1D5hPwvP8qswa2QM5o11UWc3cEyd1qIs+T
 VsThYA2CtndNGQVoT3D30SwNNp6W60RE5uvNrqnH7P6DMZz2arAAEXqctL/y3Ol/
 nRPlg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnk16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:58 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 10:18:56 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 11:18:23 +0200
Subject: [PATCH i-g-t v2 10/10] tests/imagination: Add DEV_QUERY
 runtime_info tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v2-10-e1bf415adcee@imgtec.com>
References: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784279928; l=1928;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=NXzxAaYCP9cjaTMdSSKYBBcaAOUKOAihYQNZ+5l7d2k=;
 b=f5Mf4R66R8nSSzWhoZhzpWW9C07yqrtqxZtfmFEhPGU05d8tMEtd0EBCcxS8XGyd2YA4calPt
 bbpwILV72WSAJb38CjAw9p6RfwnaenmM+f5yJWTr+dNPBayO4BIzHqp
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX+p1ElkH1vvKP
 3OFt0eEkgrAMHxPo/SahyxDnJ/bwmmUVhDpC43XFYUNuryejxe24quf7AvM/mZZfUVIgVSho/nq
 HbKKzEyrBwn5PAP2QUz1qh1lgfI+FaJEfQss3Oilwq42GbX+dkCLqoUSHNKpUxtW9ROfU2IySaW
 d7vHTEqOjVatwe5b0busW8Q8tbGb59yNE88eCxZvrjrAkxcamIoTctWb0jxbbu7vCHJWU1Nyk80
 vLznkCjIVV1Dh9HbXgEqC2dg7Y2mY2DYPsCQ1q+1TcJIPa0y87JS9Yjf8dtyo5gpc7PRjWElsrw
 uhS7J9FfiN0SDkbEaQmJhhKEcxmfJ54v1TTruqZr8OoO8sbA5IM921uGspcZWWCym9vd0BJ0Bmw
 OpSp6oBqWUsSNexj3pdbXBFd+VS119oFnilLo7t1a7BFwj32waXrRENFhem5M6al/SUx/lW8uvu
 SeLytZxouI5pM7UgP7g==
X-Proofpoint-ORIG-GUID: WiVJqcfn-GAIUiLuCPFk9AEzkwsaRGwJ
X-Proofpoint-GUID: WiVJqcfn-GAIUiLuCPFk9AEzkwsaRGwJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX0NMfNqjwDXQo
 LyFEhP3pNjfIBg7TKUds6M/picoNfV19iw+PxNe+lg0p25V0gD7kC5kLcadX/RRFQBRWffh1Zm3
 OfnM6qyH35OO++EU3ixA7wFfn54n3RA=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59f382 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=L8LdILqEO6YnCbYE5soA:9 a=QEXdDO2ut3YA:10
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

Add test validating runtime info fields from DEV_QUERY.

Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
 tests/imagination/meson.build        |  1 +
 tests/imagination/pvr_runtime_info.c | 31 +++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
index dc08a5d8b..59749b51e 100644
--- a/tests/imagination/meson.build
+++ b/tests/imagination/meson.build
@@ -5,6 +5,7 @@ pvr_progs = [ 'pvr_dev_query',
 	      'pvr_heap_info',
 	      'pvr_hwrt',
 	      'pvr_quirks_enhancements',
+	      'pvr_runtime_info',
 	      'pvr_vm_context',
 	    ]
 
diff --git a/tests/imagination/pvr_runtime_info.c b/tests/imagination/pvr_runtime_info.c
new file mode 100644
index 000000000..eb5aefad6
--- /dev/null
+++ b/tests/imagination/pvr_runtime_info.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include "igt.h"
+#include "igt_pvr.h"
+
+#include "pvr_drm.h"
+
+#include <stdbool.h>
+
+IGT_TEST_DESCRIPTION("Test that the runtime info query returns valid data");
+
+int igt_simple_main()
+{
+	int fd = drm_open_driver(DRIVER_POWERVR);
+	struct drm_pvr_dev_query_runtime_info runtime_info = {0};
+
+	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_RUNTIME_INFO_GET,
+				sizeof(runtime_info), &runtime_info, 0);
+
+	igt_assert_neq_u64(runtime_info.free_list_min_pages, 0);
+	igt_assert_lt_u64(runtime_info.free_list_min_pages,
+			  runtime_info.free_list_max_pages);
+
+	igt_assert_neq(runtime_info.common_store_alloc_region_size, 0);
+	igt_assert_neq(runtime_info.common_store_partition_space_size, 0);
+
+	igt_assert_neq(runtime_info.max_coeffs, 0);
+
+	igt_assert_neq(runtime_info.cdm_max_local_mem_size_regs, 0);
+}

-- 
2.43.0

