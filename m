Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17B0C982FA
	for <igt-dev@archiver.kernel.org>; Tue, 22 Sep 2026 09:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62CA610E6B7;
	Tue, 22 Sep 2026 09:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="VghzAB1x";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9C8E10E683
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 09:43:50 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 68M6RbS1201672
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 10:43:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=ysDSedo5zfuGUYnvJokHC6j
 hnJ6YO+wqmP68EhOm6fA=; b=VghzAB1xaKqzafaR4iu0Sjn5302z7uGwk7CJZ3i
 kyIrnYK3GYtSdtVmcuuB5/htdxZEJhU6JeiBh65AGXd32gMycF84oeYTYvmFa/qS
 5UI73hwYrmdZGBZLdRd+9btWUjS1/hPSPY9trMrP6yiqfdOlwAaUPLxMbDb6ARRW
 Gk/f68WLpV+g6XVXCz+78pxJc8WbF7OJrlHHszPfEXSAQwfH/5QvsdG2tDg4VFh4
 ywGngC/Dzf4khndY2KDnLRrBS8HNCwi871Aiz77I4cX+nrT5WBzBFBpwuF7TGsKp
 MapWATGUb99oQQgNiI6ovz90Bw58bS236yZuJ3dtcRs4gCQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4gsgnq28fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Tue, 22 Sep 2026 10:43:48 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 22 Sep
 2026 10:43:48 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Subject: [PATCH i-g-t v2 0/3] test/imagination: Add infrastructure and
 SUBMIT_JOBS tests
Date: Tue, 22 Sep 2026 11:43:24 +0200
Message-ID: <20260922-b4-imagination-submit-test-v2-0-974e93be5de7@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALxNsmoC/42NQQ6CMBBFr0Jm7Zh2Ao248h6GBW1HmEXBtLXRE
 O5u5QQu38vP+xskjsIJrs0GkYskWZcKdGrAzeMyMYqvDKTIqJ402hYljJMsY65TTC8bJGPmlPH
 SOepVR8YyQw08Iz/kfcTvQ+VZUl7j5/gq+mf/yhaNCr0h4zWZ1rT6JmHK7M5uDTDs+/4FvCPeU
 sUAAAA=
X-Change-ID: 20260921-b4-imagination-submit-test-85c290526bee
To: Development mailing list for IGT GPU Tools <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Brajesh Gupta
 <brajesh.gupta@imgtec.com>, Luigi Santivetti <luigi.santivetti@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>, Donald Robson
 <donald.robson@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790070228; l=2482;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=ArNNxTBzWbaD7GC0imMYEN+y8J9r1JR7WvNbgnvjCLU=;
 b=JuQmZ1LzFRw2kM5fODg8a30mUdz0mPKNxjuIKW6Ty9Y9wIOnC0TB30PeTj7FEu/b0FBF6lKJb
 OIe+3z9DuVFAWemqDUXTr52Q2bZAJzWtRS+dGaXlqQRCjJ3TjkYyLAi
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfX1qZAPx7/IJK1
 596L8ttwApRrW9PGkCRkusPdBv4Q4yb9VRf+tEm9ovCQc+CLSUgrrGKLugS3gc3Xk5qIqzPcpnH
 50p/7KYyJFVyST5+bkZjBZh+L0TNsqIldzsWQSwNvsJO7mxpNcqrbFGDCzT0tA12LfMCluLCGlY
 gRt0Uhy7rrfvkn6iPu4LoYuIwW4Vpw/FGASXXZQcZ35o2ExYRbv9KzT0neg5mlnQlOx5VAP2F30
 LySikwmwcdQtW8pBzWAgYjacHf16vuwAp1SqNh9ixccyiwfxTlx8Ve9cT0RLVfokuvLnc/GELSj
 qmsht1BT2aKieLxdtRDSXdZgi9A1rV7xDNTX97GRSwwB39ePjd8xDkwHQywv4zdX/HtVkCHTIKV
 S/WCZRoz4BFNNVCstHuXbgkIvm3t/w6+KgQRDq/07Ld8BjYvXxW1i38rCa7UFtqYlDJRDH316Xw
 OJ81EIpk7TmeyUhNBog==
X-Proofpoint-ORIG-GUID: 1MZt6KsDO087JJo0rXMbVds914EoIL5Z
X-Authority-Analysis: v=2.4 cv=fYs4WEQF c=1 sm=1 tr=0 ts=6ab24dd4 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=QAm9cwyjg-CYOksqOTsA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-GUID: 1MZt6KsDO087JJo0rXMbVds914EoIL5Z
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDEzOSBTYWx0ZWRfXxLQ/a6aGFcCG
 ID7E/KFvKmI/Rrh7uUbgCBJ10uyXTmpjnPZM30sezByH5wkLHuweZ8mElptvWOSZO1FhwTg9brR
 Jue5cQJZ+Bpf7TESMijdqxIHryumkk0=
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

 lib/igt_pvr.c                           | 561 +++++++++++++++++++++++++++
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
 17 files changed, 3239 insertions(+)
---
base-commit: f307fd753abbe6c03d0a6e1c769fc6020ebd5d86
change-id: 20260921-b4-imagination-submit-test-85c290526bee

Best regards,
-- 
Robert Mazur <robert.mazur@imgtec.com>

