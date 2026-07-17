Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81215C4451C
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 14:23:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 244C510E473;
	Fri, 17 Jul 2026 14:23:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="peHXWatj";
	dkim-atps=neutral
Received: from mx08-00376f01.pphosted.com (mx08-00376f01.pphosted.com
 [91.207.212.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25C9A10E462
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 14:22:10 +0000 (UTC)
Received: from pps.filterd (m0168888.ppops.net [127.0.0.1])
 by mx08-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66HE41R53706767
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=evhL+lpe/ZJeDiHMD6CZaND
 06qNu0aIpB5xVEl06iS0=; b=peHXWatjPHZNTctSnEIcYvaSBTjKvWE4GzX7D3Y
 2iG7kvFNbWX8PgKz0SNQMinfBELaruRHriKU8xtnMprypv8cgEcl6pbCdhaEiPYL
 BnbOLNm3xq5FYVBzl3adM/JNfqo4hDNni3Ewo0lQPPb+hzTU2lbpElSS4ol6nwCy
 ckLjkOjustn/HkV2oIj0s4oWFYQjbceonklgySUE4JfSRtc6+0YxmlxhVMr/OdHC
 +Fm33Aj/xV83L0DKtCtRDNjZOz5MUI3auMhmr8LCdbldUSHICv73L66ptqYDMhx6
 cm0KZkRf5apuHPAhcVh9MhMJRtRuym+GjAgqe3NUgv8e/YQ==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx08-00376f01.pphosted.com (PPS) with ESMTPS id 4fbcp7d61c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 15:22:07 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 15:22:05 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Subject: [PATCH i-g-t v3 00/10] tests/imagination: Add initial test
 coverage for Imagination DRM driver
Date: Fri, 17 Jul 2026 16:21:32 +0200
Message-ID: <20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGw6WmoC/5XNsQ6CMBDG8VchnT3TFhBh8j2MQ2mvcAOUtLXRE
 N7dwuam4//L5XcrC+gJA+uKlXlMFMjNOcpTwfSo5gGBTG4mubzwRjQQMUSgSQ00q5iPQRkD4bk
 szkeotVQtXiurTM8ysXi09Dr4+yP3SCE6/z6+JbGvP8JJAAdpubSt1mVflzeahoj6rN3EdjnJf
 zSZNRS9rUStjEb80rZt+wC+Om8uFwEAAA==
X-Change-ID: 20260717-test-imagination-add-support-5c2a9e84fadb
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>, Frank Binns
 <frank.binns@imgtec.com>, Sarah Walker <sarah.walker@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784298125; l=3079;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=y0ho3GgIaiKxoPMuWR8O+fdNL+8IzaJC3sw/EUm5zvo=;
 b=0OcYq7KNFpuKCMHlzkMqZXS9FZAhg9L1sxJpgyETBRpW7eXWnMdcWxgAKlUprcp9M2SKCJ+Jo
 i4TCz3hcYn5AnGB9FPoo/ystChmkXmjVJLrbQi4mOXScCXi5/ogK2MK
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfXzCFhRiZ4P9oO
 dr3BWoxMQaAmdNaTpeNfNLLV3zzJfJMyrprcEtmWaznwU+oCehbxW6Wq4xcMXsTXzrcECjhb5Iq
 pvNmkpCTNXSH8o4rR7UDYUSRHMh7nNM=
X-Proofpoint-GUID: iTsDL8jnsLaNn3dl0HOZMOLxrLW0HnMz
X-Proofpoint-ORIG-GUID: iTsDL8jnsLaNn3dl0HOZMOLxrLW0HnMz
X-Authority-Analysis: v=2.4 cv=AYOB2XXG c=1 sm=1 tr=0 ts=6a5a3a90 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=qZQ2PDNLMSdLoqI-hfl9:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=UoptyEuc_00rWK7YMMcA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NSBTYWx0ZWRfX51QVadIqJgxH
 Wceb91wzBqdaxJ25PwfeXH05OHc0MmFYdNlxryGAeBA5YlYBcdEkdkSoAyVf1i3HIsY0lbP2RLB
 rPnmWbAeuVdIIgoWeEfv+TaOLIGxGOOBQf1Q9GzTf8lV+9fTEkYKNmigcwW+cusGdPcRx2lHoDc
 CyLgF/MaVTedIWgZn/6toDJn9ajG9IOdLIq46hGNwU/gc1AKJPng6R4kUIyXF5EJS+df7kPRXeC
 H6k8M4SNeFiDxgoVLSCRBsW0QMUzqN6lL/zv0VbjRRNP4Q24AHFKnhU+i2/S+GXkt97BFE3Oa54
 vtTUZkP12g1jBy4lIeDgPC40mZBgxgoMQGLXXBwk7gOctCUq/B0rQ0WdZTDLsWK4JIssXt7Wl5v
 UK/Uq24laSQaZ+RNcu95o3lJ99raVlAg0xqLRFb/tvIp0Hv6lYUY+kBTu4BAy3ZsyA7jUbi1Qos
 6NU+ckOURHo0P0WrqMw==
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
Changes in v3:
- Added descriptions for the library functions.
- Moved system headers to the top of the include list.
- Switched to drm_driver_close().
- Fixed formatting issues.
- Link to v2: https://lore.kernel.org/r/20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com

Changes in v2:
- Fix threading issue
- Link to v1: https://lore.kernel.org/r/20260717-test-imagination-add-support-v1-0-2f02f9cc3b53@imgtec.com

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
 lib/drmtest.c                               |  11 +
 lib/drmtest.h                               |   3 +
 lib/igt_pvr.c                               | 335 ++++++++++++++++++++++++++++
 lib/igt_pvr.h                               |  40 ++++
 lib/meson.build                             |   1 +
 meson.build                                 |   8 +
 tests/imagination/meson.build               |  21 ++
 tests/imagination/pvr_dev_query.c           |  99 ++++++++
 tests/imagination/pvr_free_list.c           | 218 ++++++++++++++++++
 tests/imagination/pvr_gem.c                 | 110 +++++++++
 tests/imagination/pvr_gpu_info.c            |  54 +++++
 tests/imagination/pvr_heap_info.c           | 169 ++++++++++++++
 tests/imagination/pvr_hwrt.c                | 168 ++++++++++++++
 tests/imagination/pvr_quirks_enhancements.c | 112 ++++++++++
 tests/imagination/pvr_runtime_info.c        |  32 +++
 tests/imagination/pvr_vm_context.c          |  78 +++++++
 tests/meson.build                           |   2 +
 18 files changed, 1462 insertions(+)
---
base-commit: 1e912fa143a35c4238a1fbcf94443175d8ce1d60
change-id: 20260717-test-imagination-add-support-5c2a9e84fadb

Best regards,
-- 
Robert Mazur <robert.mazur@imgtec.com>

