Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6698CC44515
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:24:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1831910E428;
	Fri, 17 Jul 2026 08:24:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="PgtTMWd/";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E6C10F4A2
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:23:08 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H74QTT2889361
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=3
 u7jDXCz9OlBhU1VoaUr1X+PV44NwdW6cfSFIv8WHaQ=; b=PgtTMWd/dEtSDTLH6
 F5LTixnSpPvVoeU/KrV8BcN95LUeVvoVlgDJNfsaNGIqBPa/nrjGDzg6ieAhSZrF
 g9ER3lnccbtNuo9eZVq9cHQucJ9687MiKrJGqYvLh7MMJWKjuxSSu8pvP9GYth+8
 6cQX6DMpG83TF7z8aopxFwHG6thD0lLJayWK1e2rr/DmGdwICXnXrec2kprMIDQz
 okjN78GI/6s5gmJxuTrQ9zb+lEZJTaxwyOWB09GyK5TWRzQWy9UOcIi9HbtPp8SN
 0OM5eALgdK1UXtDQrle7jNIY6nc3KNPFzvDH46mFdPa4Ziwwwk8hJrfhF62ssPzI
 CkvEg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnh06-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:14 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 08:49:13 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 09:48:17 +0200
Subject: [PATCH i-g-t 10/10] tests/imagination: Add DEV_QUERY runtime_info
 tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v1-10-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274547; l=1928;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=NXzxAaYCP9cjaTMdSSKYBBcaAOUKOAihYQNZ+5l7d2k=;
 b=KBCLq9qecfUAawsnqwKRtSHt8OGmn3DOk+2ipdn3bWIY0RyeZ7UInlMaf+A7DehHoiYp7nBdD
 7M1n3qDnZvSC/w3kOejGT0jeshRi1vy9PiKPmItdJ2xI/+Kinx9a7ux
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX83R/649mb9tU
 GqEm6crCGsK3e0yUJ7eGASujZyiC6uzUwmgxwvHXKV9le8CWQII6dopM5ZOfY6GAN2sdx4XMAGF
 G1439ezHK1Rgrouimsk1Mj7DkRjuOtygI51dv9QBIE+GVlT4zpscYFp6Y7xtoFa9mUSrYJOHwtt
 9Lu+sYp3yh96UsTb9ZCxUkB1s2UgRdyNwsC6ynKhdXfemw9MwKBwI7y7HrO2Y5QCGkBGXSpSmgo
 UfNSvlXE0jZBE+JZ7buAt3TdPSG/skapieZd354n3eX3XeR+xPHC7f7UtLB92vmITDIAQ74laQn
 kO5+GCrQoSIYLaq9okAp7uIbLv5550PKrNA1Bp2h1mMoM3nRHsV7Cq8nWMU9PBJdT1M5pSgaZro
 DJMwHlrMjfgbALyU6ufppW1McAKuygl9MnLe3eiHAZx3HhXKZO3LwBPQavA+maCzAgp7d4HL3y2
 18vtsUfbuMBUYgUJ6TA==
X-Proofpoint-ORIG-GUID: f6D9RgXEdH-ncK4JBioafRSfNhdogsla
X-Proofpoint-GUID: f6D9RgXEdH-ncK4JBioafRSfNhdogsla
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX/0HrOl4hcLrQ
 P1CcsyMajohvCMZzo0YFxkV7WDR1GjsfynEIAZqtNKWJ4zvRQFLED7DOdis6Tw0cRY4I7NYcZkC
 4y/bU798a+B/3N9v17W9R+pS6er6njE=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59de7a cx=c_pps
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

