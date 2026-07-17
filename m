Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8F1C44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 09:21:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2242210F4C6;
	Fri, 17 Jul 2026 09:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="aA7QlzQr";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A976010F4C6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:18:54 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H6bwKx2840233
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=Y
 HYmxCyyL4jvlk81Ldu4SFDzpVhFnP6QLcpPA9J3Ydo=; b=aA7QlzQrsKmr6d0a1
 Q8A8TzRmBkWwjaaTG1QB7p2OGNgjYmQb5XVCZSPkXno9V1QGOb+ohgklePzL2/y5
 G2GQLKX4SanovPCu6QppqrarkwHzE773t+qx8+tU87EP5Bl5JOqkhpEBkgzTax/U
 ptXK4aym/RsfmtfjKj78cGmsIzH8YCgJ5vFhnqX861oRROePOeN0nAYHufevnDHC
 K0jjgg5zkGtGelMvXOsNdXYrcD+AMY+u/1WtNNj94xR/uRu00ZNYApySMJnYeL5J
 b69HBsDgE+pmIo1HJNekbJPpkZpqiK5kzqVZSmkUHyGGW4ZwBGp8ahxRQRIrq5GK
 71TWg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnk0x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:52 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 10:18:51 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 11:18:17 +0200
Subject: [PATCH i-g-t v2 04/10] tests/imagination: Add GPU ID test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v2-4-e1bf415adcee@imgtec.com>
References: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784279928; l=2378;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=sY+SNV7P4n6gaNsk2/x2As9ip6pEAgkBLuWzQ0eLcsg=;
 b=8eXtDEZ9tWKOwx//REOeDiVzJHzeK4ZmoMAksu5GjsucAl4pIxATRAPVNzZ8wtMP71jo4f4HQ
 JdBlOco06wTBVpqB2Z8BzxAVmAk3iIwHtE5m9apuoNQRrt7XnswgpzY
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX8j9qSA4VE83+
 3P/TmyBnxTbZSj2b+28y4XKXqO2XXWQ9eu8O9PYrGnAzBmn13onuLSX2WlsEhTR7jwtYUKYML8l
 L01elgQ1YVMLOBqenhauVToQ8t2EYkYYoaidysNoZL9V5+S4npMFsnNNxcZ/3r+mo0JW/8Vo8XX
 yVsjGAqBPsFS1unqPu8MulwMvFN0uVVTy9z7tN2AqYPdrnpKpzg5duOTEpAZfy/cXbt6QlfvJ7M
 X+m5MGcowjyad9L709Wx48ri+ssuIcTzttzp9c21Cd7zjNtjSap9KgIzUqvOXaAJD2zb9t0GS73
 /dyA4jLWKaDFxOzcMlqyZskOqwOtdkOFWtWJsZTuN+gtxHIhYD3B+DluHzRydVU69d7dyIZhtav
 zPZyxz07wMqO0kdHCLdQCukGZX5pLwc6uY5EiHNCTH1G0511Fed9AO3OaHFXRrCNgpv8W4z/qng
 zs2HDtJLF2d5OyiC7iA==
X-Proofpoint-ORIG-GUID: 11V5s5aQFFqmTs0nFeNnl-CD4EKNRiF3
X-Proofpoint-GUID: 11V5s5aQFFqmTs0nFeNnl-CD4EKNRiF3
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX6IvHD0s/Xbu8
 Grapd1OcBHBsuUSCPw9va0QvdV69E9f/NuHAjBZKXbZRphdJbb4/FEAd9RRSL0/qgmTt5sHw/RR
 0l/l2u4X97sJP0qjMljBcvTc4ZKbs8c=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59f37c cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=r_1tXGB3AAAA:8 a=qRFYnTrbIjVml5XwTdYA:9 a=QEXdDO2ut3YA:10
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

From: Frank Binns <frank.binns@imgtec.com>

Add a basic GPU ID validation subtest.

Signed-off-by: Frank Binns <frank.binns@imgtec.com>
Signed-off-by: Donald Robson <donald.robson@imgtec.com>
Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
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
index 000000000..634eb563b
--- /dev/null
+++ b/tests/imagination/pvr_gpu_info.c
@@ -0,0 +1,54 @@
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

