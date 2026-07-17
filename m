Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87DCBC44514
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 07:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A79D10F486;
	Fri, 17 Jul 2026 07:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="PhSD5HrX";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F4510F485
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 07:49:10 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7A2d32952494
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=AgAI7utqENie1gbLmOniW6X
 42QXfxQWE46j+8dMYHes=; b=PhSD5HrXsAGeOPa2mTrVOCMeO6ezXAwmGhhXSOh
 hDNNHUQnQ/+74+Jthy/A03IeSPmqHNEjUBByrmRnt06NJAfWPYYtIuV8X91M1A1D
 GEmCMTOiqnZ2Vi/mPPGTU5oGyWNd/jH75GnqTix47i89lsMYzrCSFpKkmgycLbdX
 DHEJuNVcNpQkyI+CUsKnfzDOXNiyLwbdvXzd4gWdOw/rwmbwBpgPQziITrSkZIv8
 593cc/bUTfpg4zPpmR5nZ6f4Qz77P18gJYvNPhfUrr+q/AjA47tFajDar+8KoR8R
 wVB/fmIgh/0UKLzmcFx258lW8Gx7CxCwGOEbVIkctJg2z0g==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7cwrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 08:49:08 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 08:49:07 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Subject: [PATCH i-g-t 00/10] tests/imagination: Add initial test coverage
 for Imagination DRM driver
Date: Fri, 17 Jul 2026 09:48:07 +0200
Message-ID: <20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADfeWWoC/x3MSwqFMAxA0a1Ixga0+Hm6FXEQbdQMXi1NFUHcu
 8Xhgcu9QTkIK/TZDYFPUdldQplnMG/kVkaxyWAK0xRt2WJkjSh/WsVRTDGStaiH93uIWM+GOv5
 VC9kJ0sIHXuT69sP4PC9D+mD0bgAAAA==
X-Change-ID: 20260717-test-imagination-add-support-5c2a9e84fadb
To: <igt-dev@lists.freedesktop.org>
CC: Robert Mazur <robert.mazur@imgtec.com>, Matt Coster
 <matt.coster@imgtec.com>, Donald Robson <donald.robson@imgtec.com>, "Frank
 Binns" <frank.binns@imgtec.com>, Sarah Walker <sarah.walker@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784274547; l=2679;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=R79GIvRzfJ8XOkK9Co0dbo+DWF9MpwypzzGYbzOqwSw=;
 b=YoQdYifkfMz+urKn7pWODLaugkMFm6MZHTD/gkEMAJf49VIMWWY1XY1MhHPDZUZY2mgceFZ2B
 /t5NlEtSD4mAfC99K3fnC6M7yRpVC+kQtXxPT78yUd1XwlHkOA80WHQ
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX8tNemyK4CDWP
 MniHtV+Pa/3wx3oonagZOKXFOKBXW4LBitZD1+jy7fLXe9t6VzJmMYYbrWqNqp1F8RNan5Rm4cs
 PRSXdeKrXBop/vo4wmmWKy8hDjZNuzI=
X-Proofpoint-GUID: PWHy9CDJJKfQMbJdXfDIirykpHsY038V
X-Proofpoint-ORIG-GUID: PWHy9CDJJKfQMbJdXfDIirykpHsY038V
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a59de74 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=r_1tXGB3AAAA:8 a=p5ZVZH2ql94CO4rtgggA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3NiBTYWx0ZWRfX0ZPcUp6TH1lN
 dquU/IuObqsMZLbK2iRMwwxhM1uJOwT8aDrQel1uzwTrFCmmLenBqRts802OL9yn7kEgIszU7tS
 uWIApybo5wVUMv1/sPhIqCwed5uRwnT/x6Nuc3vk2W/HLXlIIZiglW8l8aFy+HYH0z+Qzd6Fl+3
 xzLxl1jqvCbW4do48FwdQF0nLN+UtGqu3Z/loZUIRZ6GSJCVwRW37xIjkbu2nKsDnfTuSSrZHb+
 I+P4dVULSsYw05L8z86xkrIZoWy/FFbtNiKvLRs2ifmlUclF/ozQrzF7uypRgZYhPItGMJTXiZ4
 SvWmPrIwBWpFogxhXED8pucsF0JYByo5w0MsVxtlbFjrzqux8fpe677xqtcDLz2J+4AgdvOUZJj
 ZbmuV00LAUZX6GFJo6m7ERydhVyhxxnmfkG0WVxrseB4yRmhHHsOoSKVHUBka4W2+oe8zThfyIs
 9Y/e3s5eWsXO+w5pM4Q==
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

This series introduces a new Imagination-specific
set of tests covering core driver functionality exposed through GEM and
IOCTL interfaces. The tests focus on validating userspace-visible APIs.
 
The series includes:
 
  - Imagination test framework
  - GEM mmap coverage
  - DEV_QUERY API validation
  - GPU ID verification
  - Heap information tests
  - Static data area tests
  - VM context tests
  - Free list creation tests
  - HWRT creation tests
  - Runtime information tests
  - Quirks and enhancements query tests
 
This establishes the foundation for future Imagination driver testing.

Signed-off-by: Robert Mazur <robert.mazur@imgtec.com>
---
Donald Robson (5):
      tests/imagination: Add DEV_QUERY tests
      tests/imagination: Add DEV_QUERY static data area tests
      tests/imagination: Add VM_CONTEXT tests
      tests/imagination: Add DEV_QUERY quirks and enhancements tests
      tests/imagination: Add DEV_QUERY runtime_info tests

Frank Binns (1):
      tests/imagination: Add GPU ID test

Matt Coster (2):
      tests/imagination: Add framework for Imagination tests
      tests/imagination: Add GEM mmap tests

Sarah Walker (2):
      tests/imagination: Add DEV_QUERY heap info tests
      tests/imagination: Add tests for free list and hwrt creation ioctls

 docs/platforms.md                           |   1 +
 lib/drmtest.c                               |  11 ++
 lib/drmtest.h                               |   3 +
 lib/igt_pvr.c                               | 214 +++++++++++++++++++++++++++
 lib/igt_pvr.h                               |  41 ++++++
 lib/meson.build                             |   1 +
 meson.build                                 |   9 ++
 tests/imagination/meson.build               |  21 +++
 tests/imagination/pvr_dev_query.c           |  99 +++++++++++++
 tests/imagination/pvr_free_list.c           | 218 ++++++++++++++++++++++++++++
 tests/imagination/pvr_gem.c                 | 111 ++++++++++++++
 tests/imagination/pvr_gpu_info.c            |  54 +++++++
 tests/imagination/pvr_heap_info.c           | 169 +++++++++++++++++++++
 tests/imagination/pvr_hwrt.c                | 168 +++++++++++++++++++++
 tests/imagination/pvr_quirks_enhancements.c | 112 ++++++++++++++
 tests/imagination/pvr_runtime_info.c        |  31 ++++
 tests/imagination/pvr_vm_context.c          |  79 ++++++++++
 tests/meson.build                           |   2 +
 18 files changed, 1344 insertions(+)
---
base-commit: 1e912fa143a35c4238a1fbcf94443175d8ce1d60
change-id: 20260717-test-imagination-add-support-5c2a9e84fadb

Best regards,
-- 
Robert Mazur <robert.mazur@imgtec.com>

