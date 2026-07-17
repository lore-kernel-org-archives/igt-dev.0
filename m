Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C24EDC4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:24:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D7010E479;
	Fri, 17 Jul 2026 14:24:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="HIHgISBn";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB39C10E462
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:12 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE3dBP3645753
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=g
 3axlp1KxRWva4f7EJR1DghqTwMT31KLpiY+xbS3Yzo=; b=HIHgISBnEsLs/xvWX
 CrHp0cQnYI+zf1CscrHpg7Fo2LHlXxYNj2RZYBOOSRt0ecG1e0QJAB94CvXtzaBa
 VsMFfKqn4wq+9+qHiySehMtAklpajCIWqHO2L3WGPrhLoMLoQRuNl1ZARH6tsmXv
 NiCxf62VoAU/N8dQO4WhKm9xlCogoS34VCxpwtpPjZcem5/SktJQp6t1SnA/r6Wi
 i1u0+6wshdo4dpTEfKnwP3dnQZna+jBtOC9I3nqdYXEU8Ul5fnEI2XfGiLlmQGm8
 86Zl3gVpZhLFnzQIPAcS/x8dA2udeoeqRW8ldRF13kKVCof00hn+Cautw/GcGZnU
 Okmkw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnsyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:11 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:09 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 16:21:36 +0200
Subject: [PATCH i-g-t v3 04/10] tests/imagination: Add GPU ID test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v3-4-ce69f9ad330c@imgtec.com>
References: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Frank Binns <frank.binns@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=2378;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=Z5nkgA1WhCQXfTPBSZk90NSKvYuehd5rwVC8tiemK4g=;
 b=kzx8H/2SQSeKa6pQjyWehuP2ac4l4FD62I3Q5CXI45OjOp5ArbN8cZxvPwoMAd5NmSrDJUE/v
 GyCTldjtmTTAW/SCMUZD1VN3sCCTQ9YQ8KvIiN5R6I58nTyY2nhhIv3
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX5EhZkV3FhU9u
 DTBIVrHxt2hGNQeiQ18zh6i/SPFngdKFR/dClhFostNsseFENEG5scY0OMPcj6LTcMEEQYEZbRh
 iFophwYx7dVJqaSJA6Qi/AWPsuwYTg+0ng5hXFMNLopR0z4jJLOYHjs0nLAbc6xd/f0BifelvEV
 FN2m9EuH9QxZ5Y6VkJ+yoBqRPgSq+5PixNw3YwCKOdnGo5SsYOIIW4RvLNsk/dnJUvACbg5Ob/9
 aA/9w4pCPszD30zK/TRMdUeOD7995ZCyn/szkhIFkxgyShAM9mY1EP9zc6L1RcR4fXyVDcLBang
 GS4csjvyEX7WqyvSB7Ewp9NWzWHcp+RtUpsvgIXSwBwjzy+/cZhdYeNl/y11uJSRIgnpbEbl/yz
 2mMBNEVi8qhAUpBw0C3iH80Mx05VAeijBJeLNan3ajynA01D7FcUBXvJJp6AeoXCSlVoFp0OMsf
 N/ZnsdR3mg2aoAWhVDQ==
X-Proofpoint-ORIG-GUID: V-JvmJ_hgJOrHi33l9SRHcFwq9d0sYSi
X-Proofpoint-GUID: V-JvmJ_hgJOrHi33l9SRHcFwq9d0sYSi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX0l5YvfGeFKK4
 yOYgvud6rZ9KZwumolDHze7OOr+hdbyEtYmqw9zg3MmmmnfO9cTxeUSccQA6ANYQjWD0UAQ4MND
 XOWZliYkdM56/xdvoYjq3sRhI40I3cQ=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a5a3a93 cx=c_pps
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

