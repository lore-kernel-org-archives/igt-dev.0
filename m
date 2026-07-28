Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC04C53219
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jul 2026 07:21:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A414810E533;
	Tue, 28 Jul 2026 07:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="T79RuhIb";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E36910E534
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jul 2026 07:19:20 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66S6rrUq1821360; Tue, 28 Jul 2026 08:19:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=jnowrDkTKXE/KZnIb6V4uof
 80N4IBNI5AUuZSxplV3U=; b=T79RuhIbG8eajIsuRsG1hSJymO3zmGVR3E2Frgi
 kBtatTxdsJ8zN0thIvYHVY0gItpcjX8Xcz+MBsYgYAqwXjlxeBuEjPKqCizKiyay
 QzUEMgyF9wYSnf+76cWhKkpkY4+1xFebGY5uXPSDRT50eYX62tUH+7o9by0CjoP3
 YdffYve4tP4HqxWg7rj44q/86RUIV5NebxBLjgNgiC2DNHkjKwjGTGvdYq1SpG1j
 JkOXFFtCwEQr5vhsgn3z6qWXWhXMJ/z6i6vRKYxr7Iujj4YreodvNCayXQI3ElTR
 MDFdTuOqe5OBVESF+sBsEaFhbsb5HdUq9+qjz/S8ujpOUaw==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fmn7s2f1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Jul 2026 08:19:14 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Tue, 28 Jul
 2026 08:19:13 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Subject: [PATCH i-g-t v5 00/10] tests/imagination: Add initial test
 coverage for Imagination DRM driver
Date: Tue, 28 Jul 2026 09:18:55 +0200
Message-ID: <20260728-test-imagination-add-support-v5-0-33049f0d1937@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9XaGoC/5XNPW7DMAyG4asEmqtCIuU47tR7BB1oiXI4+AeSY
 rQIfPcqmRJkaDO+H4iHF5U5CWf1sbuoxKtkmacazdtO+RNNA2sJtRUY2JvWtrpwLlpGGmSiUo8
 1haDzeVnmVHTjgTo+uEihV5VYEkf5vvHHr9onyWVOP7dvq72u/4RXq42GaCB23mPf4KeMQ2H/7
 udRXeUVXtGgamz76GxDwTM/afiKhlXzvO9iRwHR+CfN3Wnwl+aqRhh6NngAh+2Dtm3bL5XCjoS
 zAQAA
X-Change-ID: 20260717-test-imagination-add-support-5c2a9e84fadb
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Donald Robson
 <donald.robson@imgtec.com>, Frank Binns <frank.binns@imgtec.com>, "Sarah
 Walker" <sarah.walker@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785223153; l=3865;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=qTS3FBtCKlV3yxx7lLXHdNIdhlnvfOmwVPsICLvEN9o=;
 b=O8NS8A6w4FTJCdbsLYhj1zv3v6IVbNj5/KJARjCMHTJkKnR5v0ek0tZuCixXQkASUWFZr5jB7
 lZwtXFxUffwDO0IOSYHrtrbmeQO8nevTWkX+nbnFUT3jmitKCIhHWAc
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX12Qk27TTqM7U
 4xJCXglMjY3x5oFugMtqaS1vnrMfCUXek0bTbDRQ0sT0VJ4S3R1Q4d4UcM841eGJGd2DrNCS1CR
 y/diiGyLTLUIgn6NZnHkY3v7A4+n5+I=
X-Proofpoint-GUID: u2PCy6jvbNkxf2fK9DX_AnbpE8_jvdWf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA2MiBTYWx0ZWRfX1qm/+QThMkh8
 0jhCHnZihBru4YDAKI96YbIOJ0ZnmVqABtP8xZaUDLwbKc3wDMGMpidnLuQrkfqq/yZitYCnDKi
 S1xayL/3X2PNXXvJ4nkE08BOuPlXthDUu7vpP68iKt97At2P9ue0GR8+dMlo+IL52B3cpJiAGrN
 wGFsLaJjOgrY4t+JSrHRa7gWNeKYTwPpXJRclgfMSJ/DsO28Wl9zvDcpj67DyzMqjnJ3fxD1Mkd
 4O7wrQ5rw5hcnorT05Q1y6otui3x15hUR0DCE8HPT1IIanrqb1ymYrAm7Bs3SHmGSaqyOZRsdyb
 gZHVJfMrEndxfR7IguoeLjReAySgvCp4Ckj6mwPxKHf6u5bVsGrBzvzRIH6+qb2q/kkl926fX7e
 BBwP5vBhnlcJcy+07MHqYi1hDumvxaVpQjubIrrBYpfpb9KaZckmQvIZTAuV3usjBw3WAPOPE88
 xv10CYnUpl931bBBvGA==
X-Authority-Analysis: v=2.4 cv=Fv41OWrq c=1 sm=1 tr=0 ts=6a6857f2 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=KAG_QGEsWnI9JYloi7MA:9 a=QEXdDO2ut3YA:10
 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: u2PCy6jvbNkxf2fK9DX_AnbpE8_jvdWf
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
Changes in v5:
- Resent due to mail server issues.
- Link to v4: https://lore.kernel.org/r/20260727-test-imagination-add-support-v4-0-a3dbe0382437@imgtec.com

Changes in v4:
- Added Acked-by tags from Kamil Konieczny.
- Switched DEV_QUERY helper to use to_user_pointer() instead of a direct uint64_t pointer cast.
- Fixed userspace errno include in VM_CONTEXT tests.
- Simplified helper function naming and moved first parameter to the same line in free list and HWRT tests.
- Fixed formatting and kernel-doc style issues (whitespace and comments).
- Improved commit message wording in DEV_QUERY-related tests.
- Removed an extra blank line in runtime_info tests.
- Link to v3: https://lore.kernel.org/r/20260717-test-imagination-add-support-v3-0-ce69f9ad330c@imgtec.com

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
 tests/imagination/pvr_free_list.c           | 216 ++++++++++++++++++
 tests/imagination/pvr_gem.c                 | 110 +++++++++
 tests/imagination/pvr_gpu_info.c            |  54 +++++
 tests/imagination/pvr_heap_info.c           | 169 ++++++++++++++
 tests/imagination/pvr_hwrt.c                | 166 ++++++++++++++
 tests/imagination/pvr_quirks_enhancements.c | 112 ++++++++++
 tests/imagination/pvr_runtime_info.c        |  31 +++
 tests/imagination/pvr_vm_context.c          |  78 +++++++
 tests/meson.build                           |   2 +
 18 files changed, 1457 insertions(+)
---
base-commit: 1e912fa143a35c4238a1fbcf94443175d8ce1d60
change-id: 20260717-test-imagination-add-support-5c2a9e84fadb

Best regards,
-- 
Robert Mazur <robert.mazur@imgtec.com>

