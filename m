Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B5C4C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:20:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97E5510E533;
	Tue, 28 Jul 2026 07:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="yJk3dLWK";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6250D10E534
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:25 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S709KE1832408; Tue, 28 Jul 2026 08:19:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=q
 9ppr+o5HqA+FFXvInTDTocCVSZ9RU5NMBNxLxqA9D0=; b=yJk3dLWKzO3M0YXo0
 MyVvZ5tARwLE/BU4Qhe5X9DyAzZai8GLU1qNfD2UmmXGdqyRhiXPMRVEfLIxhNOu
 WnpDyKUWkwxaZuuiiqNQBKtl1x7MOozN+2C/tSrTqdFSN73JXfsJsMmLuSL/KPwJ
 f7LPAsm19/8t1lb8U6uQ4fCCGm5YjPC1Yhqz/NKMxid6kG9HB6NtkCblCMHetyCl
 c882RXvUAf3jU10dxxNLgwFaOmsisGrpBfm430HNKMBoj3X37iw70kUaVgItQoxc
 D+W7IHepmYwNVP4TQbcYbWmStW1LE3NVma41xTxOhEGJfFaB+dSkE4TNAAW/taXA
 eSvag==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f21-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 08:19:21 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:20 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 09:19:05 +0200
Subject: [PATCH i-g-t v5 10/10] tests/imagination: Add DEV_QUERY
 runtime_info tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-add-support-v5-10-33049f0d1937@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=1989;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=PRcEDajejMQb5KBzO/uLAtClktRqdgkCAofAm3rHUNk=;
 b=+QKEYCXy/CB/drewM23CWF4EqMi0OIGV3qMyRsasblbgaB/zH1kT24rLw4Yv1rgS+n07JSvHI
 Jhnv1BE0J4tDelUbpcxTjj6Vp4p0xytiwvs6GxafqucMhoLdfGYT/ut
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX6QYgwuOexMdl
 3FnabXab/Do+JdwpgIsiLKmPAUH17WBdyz2ALuFiSxH+glU3cw3EML0RkbVipN7e7k2eG8kHHiH
 X5USKfmp4z0Z3kGp3DhFJHUNNxj4EfU=
X-Proofpoint-GUID: p6ONhL4elxnNWEN5a4dP0pZ4ciHfPEWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX9aCv386YmXJn
 +AK6xwLnOkrxtU/BG2MWqbIQiFn7wo+cgHHdAe1RQ5HqbtC9UvoQImZCS97guWu1jP2PxDnoKeq
 Gb/TK3sei0h+3kFvN3os9HUnux1vUNNW6xKlQQ/06lBxuIn6uAn1A+bLa8pmmPndlW2PcEzYomT
 4TzH6B9ox/W/19Ct3kwBmwkZipUF1QUPpjfCRl6bygmLsBLkYAGbtOL8AdD3sLl6JaUomU/PWlY
 uCQTTaXaU/N4TN3Z8I85RxAvstu1jVPMyDHK6XYu/+LjC6O78BduGkGkhQ5wA1jd+x4MEc/21lx
 wc1/OPqzHQOseauDJLcWlx5H/ihPeLoUVOv+Z2tmSAdO0A1xMt+Pxt0Rv94BAPiEwUFuVuKQqkx
 CWSPldIYb+ebgTEah1qk8d4PoBslgvutksHWadr6XHTDZujW1bfegQ+3WtiRw5iQrd/s4MWaUoj
 5yyyKq5H+FH4GR7wF9A==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f9 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=TGuEv08zWsqiZ48y0AwA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: p6ONhL4elxnNWEN5a4dP0pZ4ciHfPEWy
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
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
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
index 000000000..02496e043
--- /dev/null
+++ b/tests/imagination/pvr_runtime_info.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+/* Copyright (c) 2026 Imagination Technologies Ltd. All Rights Reserved */
+
+#include <stdbool.h>
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

