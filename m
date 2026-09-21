Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C90AC982DE
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 07:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18FA810E35C;
	Mon, 21 Sep 2026 07:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="UMaFEULx";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8F810E4CF
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 07:32:37 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68L7AT591892387
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 08:32:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=81hEza2hql1+4r8XTqLKMD+
 Iq163g+NNiar5uFufRK8=; b=UMaFEULxxZijAWAoQEdb62xg6FtSSapE/+AMAjk
 J+VYK8Tq1pid3GkOHr+SBtZId8PSwO5SuUr7121DPi+vNfO8TMu2iO3QHYr1b3J7
 /QyCV/elnirgZQovPm0KSEKsHoYsICqDE89AlsRiMbwA0x179EpFqPG+O8dtstxh
 u5lYSTrTupQD6RNwb0K4v8j+jnC6DMNqFmcELZeS5fdthfPo/sppBJZSptenxhxd
 TEQNcUCUhVXB5UT7SWekVpGY2HrfTDGHhN5RYB3GVxIM5XJAStq5prbIY8wWC7mr
 D3o2A/Zma8KQCChU0LaVaBp30xmQwY1VH0XXclsWzYbc1kg==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gsgnq1a14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 08:32:35 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Mon, 21 Sep
 2026 08:32:34 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Subject: [PATCH i-g-t 0/3] test/imagination: Add infrastructure and
 SUBMIT_JOBS tests
Date: Mon, 21 Sep 2026 09:32:04 +0200
Message-ID: <20260921-b4-imagination-submit-test-v1-0-d626d1264641@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHTdsGoC/x3MwQpAQBCA4VfRnE2tCeFV5LDLYA6WdpaUvLvN8
 au//wHlIKzQZQ8EvkRl9wlFnsG4Wr8wypQMZKg2LRXoSpTNLuJtTCnq6TaJGFkjNtVIramodsy
 QBkfgWe5/3g/v+wHaW760bAAAAA==
X-Change-ID: 20260921-b4-imagination-submit-test-85c290526bee
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789975954; l=2175;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=Mu6WaGxfb4jEyUHh1q6Q36DjJi1xt/75zRlWlnIf3G4=;
 b=2E3XNsziPJgWNdSFtNsEYBTnycDi6I7RocT2/fPbfhTSBrnIRxPH1S8IrmdOkV7oQet+51qmU
 2g+gX537+ncCokwJT4KB9c06mDEwf6aIn9MyjqOD96v8bwy2VKgFoaX
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEwNiBTYWx0ZWRfXzHqoJIn10n5G
 2+aSKDFcyxQelzfPBUsLjtmn9ft8KJihT8pTi9zgSo1ICPkgsHRCSnwRv20GXeVZazRBZqxoqQB
 kt+L2QJ2ncAWhAqRN+RTdmZk7yY68ZXBXgiTKFgbTVIgmma9nBqcok1PF0kEyczzDlSHzuePVKh
 yk+EwbOG+hXBq2pfvtuiJYlEah4GsS5VDMvc7vnRI2YyfwFpMMrdJjWg6tWU+3mxlACWaQvbHFC
 D5kbD8APR5lti20XdT4mIffl75OgDGpCiDKyvTvM2cydOyqj6rAFGC2NXqwQ7m72JlZ1anyM3+T
 AG4xpSU3dd/US2TW0VmmV7T4Vb3w9FKc086Tx9/+38MK/nFOIL33Obxcbe2K4m1BlBaMAn0G6QD
 YpxcJMJgMoz7je6lqrHmXStOmc2g0NMaTV7s+h38xjG4jgC434zxStZDwXerCZj1PmAouCDwvei
 FNtNF2rAhr6eoyO7e0g==
X-Proofpoint-ORIG-GUID: ssKt3f_d_I_b1PC8lwAgJSZhmNVhuZX-
X-Authority-Analysis: v=2.4 cv=fYs4WEQF c=1 sm=1 tr=0 ts=6ab0dd93 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=4auMfB65fE6Ri0ZlzdgA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: ssKt3f_d_I_b1PC8lwAgJSZhmNVhuZX-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEwNiBTYWx0ZWRfX954gP1LSiWdf
 Bk7CqxwX/1lC0QdhSpbnjQgx4ICNTnMMp/4vcm4VALpgy/VPffbj2lFp8UaIEmQ1Lf82n7kR8lh
 ng6HdHEvh/g7HNZFByuvVtHixCRFyPo=
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

This series adds the basic infrastructure needed for more advanced
PowerVR driver testing and introduces initial coverage for the
SUBMIT_JOBS UAPI.

The first patch adds device configuration support for supported
PowerVR cores. Configuration data is largely derived from the Mesa
implementation.

The second patch introduces GPU memory allocation helpers. These
helpers simplify test development by providing common functionality
for GPU memory allocation, virtual address management, object mapping,
and automatic resource cleanup.

The third patch adds a set of tests covering the SUBMIT_JOBS UAPI. 
It tests common submission paths and verify ioctl parameter validation.

Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
Donald Robson (1):
      tests/imagination: Add SUBMIT_JOBS tests

Robert Mazur (2):
      lib/imagination: add device configuration support
      lib/imagination: add GPU memory allocation helpers

 lib/igt_pvr.c                           | 559 +++++++++++++++++++++++++++
 lib/igt_pvr.h                           |  42 +++
 lib/imagination/device_info/axe-1-16m.h | 106 ++++++
 lib/imagination/device_info/bxe-2-32.h  | 122 ++++++
 lib/imagination/device_info/bxe-4-32.h  | 122 ++++++
 lib/imagination/device_info/bxm-4-64.h  | 237 ++++++++++++
 lib/imagination/device_info/bxs-4-64.h  | 124 ++++++
 lib/imagination/device_info/g6110.h     | 103 +++++
 lib/imagination/device_info/ge7800.h    | 102 +++++
 lib/imagination/device_info/ge8300.h    | 230 +++++++++++
 lib/imagination/device_info/gx6250.h    | 231 ++++++++++++
 lib/imagination/device_info/gx6650.h    | 120 ++++++
 lib/imagination/pvr_device_info.c       | 104 +++++
 lib/imagination/pvr_device_info.h       | 378 +++++++++++++++++++
 lib/meson.build                         |   1 +
 tests/imagination/meson.build           |   1 +
 tests/imagination/pvr_submit_jobs.c     | 651 ++++++++++++++++++++++++++++++++
 17 files changed, 3233 insertions(+)
---
base-commit: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86
change-id: 20260921-b4-imagination-submit-test-85c290526bee

Best regards,
-- 
Robert Mazur <robert.mazur@imgtec.com>

