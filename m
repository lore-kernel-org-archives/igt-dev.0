Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41FDCC44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 08:25:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFA5E10E428;
	Fri, 17 Jul 2026 08:25:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="dQnj/xF7";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 903D910E428
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:23:09 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7CaJ52902527
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:10 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=dk201812; bh=Y
 HYmxCyyL4jvlk81Ldu4SFDzpVhFnP6QLcpPA9J3Ydo=; b=dQnj/xF71WOJd6bHT
 /MVIUisG9kVDZt+wbfkjuWBsX4I9dn5hyfiUfNJWGjzC+/CMBSCJMN23kWc/u9p+
 80CEz3zKN/MwtDyT93k4rqZGw3yTPeVNNB+WqnLtRY7TmM9MrdXe1SKOcKsiTalA
 YvsZinE+4uJc05M4tmss1Op+HQdkKhCJO30RUjQkqLB9ADFsSg+MmWaW0ABOnlmq
 i1Wb15oPjvQVlOx7iKu0EPYLJ6IGo1GNVAFakgNYXZlKrJhe8fY2p9qzQ6BY2PZI
 GJE21BAyGaKzE6d5GzdhPN5m2ysZE+lQrFmYXPWiiab/cP8wZkAd4JsUKgLyBwL4
 75G6g==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnh02-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:10 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 08:49:09 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Date: Fri, 17 Jul 2026 09:48:11 +0200
Subject: [PATCH i-g-t 04/10] tests/imagination: Add GPU ID test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260717-test-imagination-add-support-v1-4-2f02f9cc3b53@imgtec.com>
References: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
In-Reply-To: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
To: <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <robert.mazur@imgtec.com>, Frank Binns
 <frank.binns@imgtec.com>, Donald Robson <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274547; l=2378;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=sY+SNV7P4n6gaNsk2/x2As9ip6pEAgkBLuWzQ0eLcsg=;
 b=h17+5djWH67XkDbIZ+izHEYimuUGx2/vgVCGDJCye1VkIypLJrqr84ZUkn4mUPy/O4dNYczwX
 BFdantC8//zBxZh2nOpoGHShsA9WwP0HCox8yQz363Hz+i6MdUopR2l
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX4pYXV++2RXJs
 gefHA80J7p1A8iam83t7LQ2h648wKD7DEUxm+9Uti+gdzMyY7Fz8/d/tc4im3jIaV11Q4PWe/vo
 A/Hkm5CvBaIFSUkAkJ7s0bU6sFBkn019aNUDxsOU+aovpo3S/3XfEENH6x7Z45XThhiI9mobAeN
 w8Mo85PVc0ZwkuAehTJoX2jq/vG4tw8L/S6q41dbJKpuW+g4hzzCczDSEsbPo8Z/HHEoTxmLQNw
 dLQNuxXvC7NK0grnUtnSPNESJ6BZiqYr6tnwTIaX5k77s/q97VgOkuaQO9EFze8XhyEZWusCyC7
 BSWVKPEjxaU8T7DMeYUku4FDF/kTgDqjFz1IiYGmq3ilzlY13F1FTwpo8pBnf0SIP8ijDlCz6oX
 2+/eZLrE2GrN8Dt06TzFlJEDnft9i3cSvrd1WLjUNH/VCVB0btChROWcPA7FOuRwDgw/8xWn0ZP
 cWJpaSUROlF1lt00KXQ==
X-Proofpoint-ORIG-GUID: sa36QEXNgv-ONBc3Ppv3X0gpNSBFLmS-
X-Proofpoint-GUID: sa36QEXNgv-ONBc3Ppv3X0gpNSBFLmS-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfXw7Gubiy+IzSW
 0Dq4iAouNeArX7Hzx5S5a15rb71TaFegaxGEnipnsSujViqbw1uBDho5WPHlHVB6VvtRpwbX3cb
 DkbbRq5gYQa/00Zwj0kHI2ODplZJOOQ=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59de76 cx=c_pps
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

