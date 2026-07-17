Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124F5C44507
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 09:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7CD810F4C6;
	Fri, 17 Jul 2026 09:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="u3ilXlLi";
	dkim-atps=neutral
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C9510F4C6
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 09:18:51 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 66H7I4pQ2913452
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=dk201812; bh=Ovv4/7QSbVn3o+wMJ1tGTR/
 teAG6qT8qy9TFiTrpfLw=; b=u3ilXlLiPik0fGy2t8yZ98pJeqqeJQS7yOLdp8V
 pQOMlkhy9BmiX4XhR3JSFuibY44pXnfYuXzwiLah8YaMvODvYqk0Q86ic1sHsXL5
 S6a5QqTkU/Iso7HWgTypt40bSlKMMO8rE/LbcCBTx8tfIJHLZ9waS0DKmlJ4kXLf
 rB8HwDYCKUfIHr2aR1Rqs0ivFl7fetCD7epZcWplWwEGVSAv5h9Kyf/6i4lGR5DB
 flRe5OnXeb3l7hPj8wttdHbxMTfcKljaFFGpWjIOhrPyjCRQPOH9Jii6gSFw+GDu
 9Z4mLIzGnM7cKQJXDgmZQ9WdsXrW18drVNLPhZYTmdywx8g==
Received: from hhmail01.hh.imgtec.org
 (83-244-153-141.cust-83.exponential-e.net [83.244.153.141])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 4fbdwsnk0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 10:18:49 +0100 (BST)
Received: from [127.0.1.1] (172.25.9.35) by HHMAIL01.hh.imgtec.org
 (10.100.10.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.43; Fri, 17 Jul
 2026 10:18:48 +0100
From: Robert Mazur <robert.mazur@imgtec.com>
Subject: [PATCH i-g-t v2 00/10] tests/imagination: Add initial test
 coverage for Imagination DRM driver
Date: Fri, 17 Jul 2026 11:18:13 +0200
Message-ID: <20260717-test-imagination-add-support-v2-0-e1bf415adcee@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFbzWWoC/42NQQ6CMBBFr0Jm7Zi2iIgr72FYlHYKsyglbSUaw
 t2tnMDle/l5f4NEkSnBvdog0sqJw1xAnSowk55HQraFQQl1Fa1sMVPKyF6PPOtcxqitxfRalhA
 zNkbpjm4Xp+0AJbFEcvw+8s++8MQph/g53lb5s3+GV4kClRPKdcbUQ1M/2I+ZzNkED/2+719Uf
 K2qyQAAAA==
X-Change-ID: 20260717-test-imagination-add-support-5c2a9e84fadb
To: <igt-dev@lists.freedesktop.org>
CC: Alessio Belle <alessio.belle@imgtec.com>, Luigi Santivetti
 <luigi.santivetti@imgtec.com>, Brajesh Gupta <brajesh.gupta@imgtec.com>,
 Robert Mazur <robert.mazur@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>, Frank Binns
 <frank.binns@imgtec.com>, Sarah Walker <sarah.walker@imgtec.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784279928; l=2833;
 i=robert.mazur@imgtec.com; s=20260324; h=from:subject:message-id;
 bh=OiFpsd0q6pbQdFV6WPBhYGCF6cqPhiAg5J6iuzePs+c=;
 b=PsrffkK+fWqZ6Ro3rFS3A5SZ2jDQQ302qasFLyz7XPGXkfkugzpDgJrZFADQdtaltNV0wYOQ/
 yHMkQrpIjMEDYAl7Iv1j5O6sfSrYYwk2JgQawyYtrZYnJC9n0y/0MDB
X-Developer-Key: i=robert.mazur@imgtec.com; a=ed25519;
 pk=X5uhazsNnVDpw/srawR3m7WOmgzFZXdecapAeML2ZgM=
X-Originating-IP: [172.25.9.35]
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfXzfycw8Y4qJdF
 4Tp5VMtd2O5iZvBpLar3fxdj8RSx0cRwFnq8vt4wlqefWhkvI5JIT733hPw1RaWQKYhk0OqoBlT
 x2LA2QjFgcDxSF7H7gLtzwsdYgY3rRlyp1EzqD61Fg8v8mwpO8Bv3HiJfsTEiqv3/2daZ24MVhM
 X+WlObdLy/tPBIwyZ/qvkDxiEVDsbZ/9TQndoNOSDDNHY03wS/pBwolnHZvT78s58S7LDAxmq6J
 vD2wzuAeG67F/x8no9SKdg+Udr1Bw+puCPHrxXF2Kgg2CAPUm462HYIrAKEUcNhuGehW9ijSPwG
 gmcsG+yQ1X9FnUFLps7NIeEhxweh/siw8C/ag7UCR+NNPRzvA0t/l1kEafKPkpKXj06YY9bht8Z
 keKIkLJGAziZEnIydTq5u9AdM/lMr/XwUalafrXhzDXA8OAaIJQKsp3hcEjJWm2VqDwp+9L7PP+
 biMmyf3lvl++AxrocXg==
X-Proofpoint-ORIG-GUID: 6aBO2rMgXdZnoXQcfsY3CJCQ6k-q2Rs9
X-Proofpoint-GUID: 6aBO2rMgXdZnoXQcfsY3CJCQ6k-q2Rs9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5MiBTYWx0ZWRfX+7KcraQrAzc0
 1keAeyUKpVan1lTol8Hk2Sqjwt9xXD8t7e55oiyJhgoo2Ei9/EXrYBGg92EtIsB8vDAULyP9T3R
 s92KEWvJqSHuaY3QKucGajpZ6ArLCyo=
X-Authority-Analysis: v=2.4 cv=QbVWeMbv c=1 sm=1 tr=0 ts=6a59f379 cx=c_pps
 a=AKOq//PuzOIrVTIF9yBwbA==:117 a=AKOq//PuzOIrVTIF9yBwbA==:17
 a=CNmLAE0vrksA:10 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=kQ-hrUj2-E3RCbRHssb7:22 a=7RYWX5rxfSByPNLylY2M:22
 a=VwQbUJbxAAAA:8 a=r_1tXGB3AAAA:8 a=99Psif0cIypFxmcDEtYA:9 a=QEXdDO2ut3YA:10
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

