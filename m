Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AE29C982FA
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 13:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B43B10F00C;
	Wed, 23 Sep 2026 13:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="b1LcVK/U";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F3E210F002
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 13:02:14 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68N8L8S22980514
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 14:02:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=nutfh4idsMoDfqIWzrddwvV
 4hUhmVbUds+rwIVOmfWw=; b=b1LcVK/U/+mTUU/VtQU7FXLRJOO/lWtONM9nLf6
 DRRDsTZDi1ln+yqp6Orqxz2fc09+ZgLyRBa5zqlL97/NXJdQf0rXzjJRPlrAqk56
 610p9hEaiZ5RbkgHfoxv+0re4ZCT+zpvh1l3TQ8gnYBigZBkDA47fAufW+VUIJCt
 /6HVIDg3lfnLLOQ6fOXVqhc3J7KPqJ4nJ9JiDdtunjDRMkvqFQRrJBT3ZYLP/ZCz
 7veXwaRZ8EFbAgdF25ehn33zE9OSLo4SrV/PEiRIfTe3G3vAJz5ZvQ9CU9Jl3lXk
 +CLMUVoTt5YbFraC0hjXCN88vMt4MI6AstZpkq8w63AHZ3Q==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gsgnq383m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 14:02:12 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 23 Sep
 2026 14:02:11 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Subject: [PATCH i-g-t v3 0/3] test/imagination: Add infrastructure and
 SUBMIT_JOBS tests
Date: Wed, 23 Sep 2026 15:01:48 +0200
Message-ID: <20260923-b4-imagination-submit-test-v3-0-d70b50b54cdb@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3Ns2oC/43NsQ7CIBDG8VcxzGLgSql18j2MQ4GzvYHWABJN0
 3eXdtLFOP6/XH43s4iBMLLTbmYBM0WaxhLVfsfs0I09cnKlGQjQogXJjeLku57GLpVTHh/GU+I
 JY+LH2kIratAGkRXgHvBGzw2/XEsPFNMUXtuvLNf1LzZLLrjToJ0ErbSSZ/J9Qnuwk2erm+HTg
 p8WFKttFLaVwdph82Uty/IGx5sOIhEBAAA=
X-Change-ID: 20260921-b4-imagination-submit-test-85c290526bee
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790168531; l=2632;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=7Qlri58c5FnCcLZLgqN2p4XJXpyqfFQS80kpEc9CN30=;
 b=n22mRn/g3t6DidguZjVkMW0L+d27ZpB/MF7OhvxtFT+Aqtid31skWEWtfKgTcYZ7RqrI0pIqf
 05VbFp0lvn9D7wSLA3x36naIZPMN9aeQkSxALFlGu3AAPxY+naUvDl/
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX0TIPgy7MtufO
 YZ0hyyKueagb2FdWkZo1b45NyH5XDCixyM8eD8tEjfVWCxSRGd7PSIqyupTx2MkJZQc3aSvRpOI
 4U6UpRYLS7NJ8I1VabUGCq5WdfZPHOqP4idESlaa6epehqrTkivFEzbd4gu3qBv1m8IuYebj5KV
 a7VNtfA9RS/slto7z3B14CDjAns8oIJIvMxxrP+2FLCLfff42t3ALdfM3wzBwzPJQVBvaSGTxxL
 ghJCzIVEDQCzUXBKVMG/smQkx5Mkrnq9SgoGqi3L9ul1DDZyDCa4GVuN4CyRg7a3sxm8X6pkuwe
 CiOy2+OS2G/D8kP7V2nNU5fsjOvyct6iN5rm2gc8iN7CRmvK/o4AZ1ANg1gp4c+glVqZB2CXNGd
 tqQvDctpN5qwUKIqgokX/5bq9f6lClYgd8PQDksuX1iuo7VesNkHvyFxNLkw/u18iNqbQGoW2Cn
 sEruRXLNoXW0byJXHYg==
X-Proofpoint-ORIG-GUID: ux-rR-tgKKOXgWfpOodtdWhl5TGWtoC4
X-Authority-Analysis: v=2.4 cv=fYs4WEQF c=1 sm=1 tr=0 ts=6ab3cdd4 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=U5JxiEPqkSKOTFuMk9MA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: ux-rR-tgKKOXgWfpOodtdWhl5TGWtoC4
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MSBTYWx0ZWRfX5KLknAJrkMke
 x7IfaVK6gfS09x4W8ltCXQCJMffr0tV61e7H8+8IHK6YmbJuhwRup+Y08+1oagfpt57HTu/ERoB
 6tZcloJg+uiwucmCRe5z+J5iXYFaoy0=
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
Changes in v3:
- Build fixes for armhf.
- Link to v2: https://lore.kernel.org/r/20260922-b4-imagination-submit-test-v2-0-974e93be5de7@imgtec.com

Changes in v2:
- Fixed build issue in the second change, rename PAGE_SIZE into POWERVR_GPU_PAGE_SIZE.
- Fixed most of checkpatch warnings.
- Added IGT_IMAGINATION_ prefix to the header guards.
- Link to v1: https://lore.kernel.org/r/20260921-b4-imagination-submit-test-v1-0-d626d1264641@imgtec.com

---
Donald Robson (1):
      tests/imagination: Add SUBMIT_JOBS tests

Robert Mazur (2):
      lib/imagination: add device configuration support
      lib/imagination: add GPU memory allocation helpers

 lib/igt_pvr.c                           | 562 +++++++++++++++++++++++++++
 lib/igt_pvr.h                           |  42 ++
 lib/imagination/device_info/axe-1-16m.h | 106 ++++++
 lib/imagination/device_info/bxe-2-32.h  | 122 ++++++
 lib/imagination/device_info/bxe-4-32.h  | 122 ++++++
 lib/imagination/device_info/bxm-4-64.h  | 237 ++++++++++++
 lib/imagination/device_info/bxs-4-64.h  | 124 ++++++
 lib/imagination/device_info/g6110.h     | 103 +++++
 lib/imagination/device_info/ge7800.h    | 102 +++++
 lib/imagination/device_info/ge8300.h    | 230 +++++++++++
 lib/imagination/device_info/gx6250.h    | 231 +++++++++++
 lib/imagination/device_info/gx6650.h    | 120 ++++++
 lib/imagination/pvr_device_info.c       | 104 +++++
 lib/imagination/pvr_device_info.h       | 378 ++++++++++++++++++
 lib/meson.build                         |   1 +
 tests/imagination/meson.build           |   1 +
 tests/imagination/pvr_submit_jobs.c     | 655 ++++++++++++++++++++++++++++++++
 17 files changed, 3240 insertions(+)
---
base-commit: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86
change-id: 20260921-b4-imagination-submit-test-85c290526bee

Best regards,
-- 
Robert Mazur <robert.mazur@imgtec.com>

