Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4373C54F4C
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:25:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47FB710E7E6;
	Tue, 28 Jul 2026 07:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="fOsxaKRg";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8429810E7BE
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:21 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6rrUr1821360; Tue, 28 Jul 2026 08:19:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=N
 y7zf3kpX0tCqyMuwZRuzkWLDnxv7CgO5008q42cyIg=; b=fOsxaKRgLcADzl+U2
 fKb5GBaI48s2b7s5vyPH2aFp0irpuak92X8DQvV4AJmlnxxV7x2BT/MUwct49JLu
 4aW/3ZpGZlKY+5p7yWX19uAcbMsmuZIOAnvEaDhB28McFCXpdlt2Zm2pICc/qUWV
 mhkZLzOSq5IxHlCIefj6K8P1x95j5bTm2rnIghJKgulGCGEPjsD5zyWY0bZVazDm
 F+m/CviFlrUq4qEnnAWtjngqd/mBd+0RzDJVotv+4IIW2t19qqek597k45a8KTgc
 +RB5e5+CmdVymiL+GtJKrCFKwO6XCORTQfz5iTukxHxr1cFlxIvYNLFcLw84Ba7T
 TRCaA==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 08:19:17 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:16 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Tue, 28 Jul 2026 09:18:59 +0200
Subject: [PATCH i-g-t v5 04/10] tests/imagination: Add GPU ID test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260728-test-imagination-add-support-v5-4-33049f0d1937@imgtec.com>
References: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
In-Reply-To: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=2439;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=CzAdblc/Nb2mDw0p6g+dH9D4OWFbxi0ynoQexXYaTKA=;
 b=kzUki3NrHA7rIUv0XG+4KFdUkgUR+tK9EOC+r69CIeGPRmirzndvWHdV0/AD+YmhmvE5Z0u2b
 7ipuCqCxjC1BFeN40K8Fy+hBsvsks0EitH7FDZjlYFzRb8XoQVqIeR4
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX90aEggT9QFUi
 M7u68Qh++7vmEomIpb/pVT1FFgk9kW2E/yV4zikqZB75yWBkas1hghlKanMn1k9ZsAXeFjXJznQ
 sIdGNBbqhV5mkDDxE/56Hf3ooq1b3pw=
X-Proofpoint-GUID: id7f9CC3RSfsXlfa5RPlZ1q7Dlkx8uYk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX1PbI5OO5tVxD
 HF5lEgMdLowka/se5UrJZNhV7y+3ROdJSxfXgs0M5dsZNhfYfHAKBhYDqRqIlLodyZCABT/IrgU
 cGeZa43JFWdDAayvZ9xMh1m732O8PDNDVB7256NXSV7PRJWmarYnGa26pXwML3PRQ7LwU5FShY+
 se+G26XEHmQxjvZrbXcWYuEzUuIHv9hFYCOEjlXMehSfObWCzNCVBvDJ6tEybap2G6rF0rR8ShP
 9mKlsIUrWe5qRPa2TTgwCYiEPDOk7YzNFNSCEg1sO0HHJ0ujBoCYaXrNG8z1sRlLhzxwOV3ZdPo
 3XYbE5bvy0L9qrie0PsHK0wL14yjM0s1wvHLVnoDPjpyElRjKadpGS0aDe9hNCf6ulZ+gD/xsQ8
 tt4dJBiMQuRV8RBtUy//ce0cFCWfHalawnLb5AvUWpO4ADHhNU0RY5W9kUmmA/4Xsbfd2yVFiwH
 Kkro/C4QGc5jNljMMtw==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f5 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=QyXUC8HyAAAA:8 a=Fg14KW3S8sg_mqRq77YA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: id7f9CC3RSfsXlfa5RPlZ1q7Dlkx8uYk
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

From: Frank Binns <frank.binns@imgtec.com>

Add a basic GPU ID validation subtest.

Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
---
 tests/imagination/meson.build    |  1 +
 tests/imagination/pvr_gpu_info.c | 54 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+)

diff --git a/tests/imagination/meson.build b/tests/imagination/meson.build
index 62930da2b..c5899972b 100644
--- a/tests/imagination/meson.build
+++ b/tests/imagination/meson.build
@@ -1,5 +1,6 @@
 pvr_progs = [ 'pvr_dev_query',
 	      'pvr_gem',
+	      'pvr_gpu_info',
 	    ]
 
 pvr_deps = test_deps
diff --git a/tests/imagination/pvr_gpu_info.c b/tests/imagination/pvr_gpu_info.c
new file mode 100644
index 000000000..24ab18491
--- /dev/null
+++ b/tests/imagination/pvr_gpu_info.c
@@ -0,0 +1,54 @@
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
+IGT_TEST_DESCRIPTION("Check that igt/imagination knows about this GPU ID");
+
+static bool
+has_known_gpu_id(int fd, const struct drm_pvr_dev_query_gpu_info *gpu_info)
+{
+#define PVR_BVNC_ID(b, v, n, c) \
+	(((uint64_t)(b) << 48) | \
+	((uint64_t)(v) << 32) | \
+	((uint64_t)(n) << 16) | \
+	((uint64_t)(c)))
+
+	switch (gpu_info->gpu_id) {
+	case PVR_BVNC_ID(4, 40, 2, 51):
+	case PVR_BVNC_ID(33, 15, 11, 3):
+	case PVR_BVNC_ID(36, 53, 104, 796):
+		break;
+	default:
+		igt_warn("Unknown GPU ID: 0x%016llx\n", gpu_info->gpu_id);
+		return false;
+	}
+#undef PVR_BVNC_ID
+
+	igt_info("GPU BVNC: %u.%u.%u.%u\n",
+		 (unsigned int)(gpu_info->gpu_id >> 48 & 0xffff),
+		 (unsigned int)(gpu_info->gpu_id >> 32 & 0xffff),
+		 (unsigned int)(gpu_info->gpu_id >> 16 & 0xffff),
+		 (unsigned int)(gpu_info->gpu_id & 0xffff));
+
+	return true;
+}
+
+int igt_simple_main()
+{
+	int fd = drm_open_driver(DRIVER_POWERVR);
+	struct drm_pvr_dev_query_gpu_info gpu_info = {0};
+
+	igt_pvr_ioctl_dev_query(fd, DRM_PVR_DEV_QUERY_GPU_INFO_GET,
+				sizeof(gpu_info), &gpu_info, 0);
+
+	igt_assert(has_known_gpu_id(fd, &gpu_info));
+	igt_assert_neq(gpu_info.num_phantoms, 0);
+}

-- 
2.43.0

