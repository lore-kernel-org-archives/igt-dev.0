Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370B9C4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:23:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D568410E462;
	Fri, 17 Jul 2026 14:23:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="Nyr3Lojh";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1EC410E462
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:17 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE3ABe3644545
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=l
 OD7NC3zpkzdKIntx+5y1+CxQt3top0a3ISzaRSzhbY=; b=Nyr3LojhLoLdhyRTt
 UkcGhePRZC0kLsjzPR7Cr4w0oy1537Q2J+SqVXwlUolG1+4+bnzjKcytVQ5vUrto
 vw84YZLX//miow/ShogaBI8D0On8piVp8+IlXFPNwie829Ly/1AXEnVTjyO6Sujk
 6psL4rr2vagBcN6apeCZv+2IPkG91rDPOosBUIByhhipI5t+g3TiTlYSz/RkNIoK
 p5oO8ZjiX12fBctc/j1I8b94Vx1cEiUYcf5qMJCrGb5qCAXVhxE51Rrqq1pHlauB
 wIdGhOB5Pdnl3XL7SUA7N77dEpPDDBKhaEtV+txNyVPRZ9GIo84VhtLzhZ7acosC
 ggYAw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnsyp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:15 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:14 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 16:21:42 +0200
Subject: [PATCH i-g-t v3 10/10] tests/imagination: Add DEV_QUERY
 runtime_info tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v3-10-ce69f9ad330c@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=1932;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=AdNQyP+ooF7GUPNBpRc1gQoKzbhRKmAzmR8PmvgB5to=;
 b=h4oTJ4sHOabZyAx4AXnOpks2rqikjG3fqT3HLHA7QmH74LVEH5crIIk5sOjlX9gwSJKAv1fzh
 NpCzgXDKrTzD7xuV+xYCdSDdBGyaqiFMp7IumalNTEWizfS4M30svEb
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX9Uf2jGxy0ZjH
 3xKlqwUXZl34n5aFwGsQ3PZ1hOP0iBcpqpMZPIyvsbfPl2UhuD+iwusGDuZ3NSOpLuBbgoj9kYn
 rFOAGcem/guB7FmQvIHkBH4Hclbdb71Ja4qB7SPAWLyU4tmj0d9wedeAUZwCtrW8zHe5DxORCt/
 sSK7lqXjfog36ROj57zS8hFlmBY9gLqfWNWImsjb/c3+AY19jrsEGzkAZV7sCvPuBNGwtmio0IU
 PjlcQK99kjs0tI0TVU75Ua0npfl3BQUuy85AzPPEXJIswesIQsYIi7XXKIf1wjjStX99IwioO3e
 hi8lg5UE7SO0Pitz4es541GtNKtVGUndmzS42EcRTyteYdIUf9YUYf2pKya1Y7oIiv6re+VpvCM
 ZT6TtLDLkHTCefqTbT+9K0YiYeU0fsxd9v43wrfW/YYs9DeRHp4+Eto+4MILf55rPkICePXpZgJ
 pB0VMoI0xVUDvaHo4xg==
X-Proofpoint-ORIG-GUID: 9uX4sXKwZZyKIWjOOFEfqwLNrbYvHEP8
X-Proofpoint-GUID: 9uX4sXKwZZyKIWjOOFEfqwLNrbYvHEP8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfXxgYAT6nzZswV
 YdzSLFORqO8Rc7pGiuD1VCp6EE9aYwi0qFtH25Cz24Ihqwsvfgpq0dqe3xU05UaIL7azq36BUTQ
 uRwNyvCbJsNF8jP4Kdzv8j+7RZlNRu8=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a5a3a98 cx=c_pps
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
 tests/imagination/pvr_runtime_info.c | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

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
index 000000000..93eca5b3f
--- /dev/null
+++ b/tests/imagination/pvr_runtime_info.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include <stdbool.h>
+
+
+#include "igt.h"
+#include "igt_pvr.h"
+
+#include "pvr_drm.h"
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

