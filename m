Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0A5C5DF94
	for <igt-dev@archiver.kernel.org>; Tue, 25 Aug 2026 07:23:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80AB10E14D;
	Tue, 25 Aug 2026 07:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WXWWzgMY";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012064.outbound.protection.outlook.com [40.107.209.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B3D310E14D
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Aug 2026 07:23:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwucaffEMawANHKIJ9fpiV7QTe9hvdm7/GuLMwjdYqOW3mEHwbmZJ2Wq3F40f06W34AH03yVKYNtH8ENIwkDjq4inBXI0Q7rGUR2qEMH8XvBZVCK5sR31gs3LLcuTgF+xlfzPb961SKKujVgI5zZJ6HFY9UCVFiAvyQwXFQ0778gWbU8axjj9xUjrrrnpWD0WwObgsVhe0skB6bvQT+pKMBpiPcU6IfGmWiRfvQ+BiRQwuPiZSJRT5eudyX+VgUnPC5gr7vdLEqYYPVsYxPLi5pAexr2hXNwncIdwvMdtvUoDSsKS7T7HdiZZDZQNDcsQjwHbe9hvx09y+QhYg1hFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XP5kzrK665mKrDhn0aseP4EYZdo0pUOeV+sl9Icn1CA=;
 b=O0Oi1rz7SgqOFs/UxmSX+g8uJQqi5o8E4+rt+V4aF/2dQG2qtv+kfINolHjFKvU9/S5vI3USIpO/soCT9gHMh97BzJj1IVjBKQ2VXEGHjy9hWYiCsG2RXD69yWwQbWADqk4noI3+fBTpLMpuONkS/bYKt5qfT5N990Gk7k7RsdLXNKya7wWgoluDmwXu1TyysSFCz1mUXNZzB5cl0SgUTHTx9tIfSI1RMI9Y6NxafL3POczH7JGQpf3rY2h3EkHWRfopri1igu2PPS66c61pIzgejNrYXTdn/r/sOwedjyzqmO7+4TFpvkGBrq3iFqx+STCHMjyp5PTeVbKGEbJtYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.90.133) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=amd.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XP5kzrK665mKrDhn0aseP4EYZdo0pUOeV+sl9Icn1CA=;
 b=WXWWzgMYxTLwYsgEc6Psa6pdyWun3Z4LM5nB3XDuJhQprsPGeu4lM35g/lfDjZV+ykEBuE4ROHs0b3+IsXUoUnBke07X0Qr9lr24G7Ck7iMRUvnCrGxYsaIs/y3J1yaQohKBst4uDTbGRkfXq8W0n/lxpn1Sn16H3gjH35KTVZE=
Received: from SJ2P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5da::9)
 by SA1PR12MB7197.namprd12.prod.outlook.com (2603:10b6:806:2bd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.12; Tue, 25 Aug
 2026 07:23:05 +0000
Received: from MW1PEPF0001615F.namprd21.prod.outlook.com
 (2603:10b6:a03:5da:cafe::8) by SJ2P220CA0012.outlook.office365.com
 (2603:10b6:a03:5da::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.6 via Frontend Transport; Tue, 25
 Aug 2026 07:23:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.90.133) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.90.133 as permitted sender)
Received: from satlexmb08.amd.com (149.199.90.133) by
 MW1PEPF0001615F.mail.protection.outlook.com (10.167.249.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.0 via Frontend Transport; Tue, 25 Aug 2026 07:23:05 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 25 Aug
 2026 02:23:04 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Tue, 25 Aug 2026 02:23:01 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Huang Rui
 <ray.huang@amd.com>, Oak Zeng <Oak.Zeng@amd.com>, Xiaogang Chen
 <Xiaogang.Chen@amd.com>, Jenny Liu <Jenny-Jing.Liu@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Zhu Lingshan <lingshan.zhu@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 0/3] tests/amdgpu: add SVM (shared virtual memory)
 test suite
Date: Tue, 25 Aug 2026 15:22:57 +0800
Message-ID: <20260825072300.16348-1-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF0001615F:EE_|SA1PR12MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: 1683f6ef-9780-4598-0486-08df0279b4a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|23010399003|1800799024|82310400026|13003099007|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: zhbxAY6+aarJdHdo8mYt6Z6kurub0A0n3gzbcLDmEUUdsrqSQmgDRgvROXm6mHEUyfjVsXifH5RcFUqw0w/djDZVTcMtmAUNuCaPjtL7yqof98oeryzePoFs1vei2zvi6yC6/jKSiUguZdJ0H3o7qScnREC5DQYI0C8rATgTSIz8JZyy6kAXldpMci3Q2IbjxG8tS2ouWObCxaQKCwyCILdMRP12OQlDvp1ZuQ50UDVwAerihd08I9eENggkuUe3nblQ2CtcpJN1nWPS0CCb2GN1MPQjcAZBB8y709wImc8kLUkbzHW2lS4OL8MlnTdM3rySlR0NlqpIlKVms8OSHXEDUWnDHnb10/OWng9aAvtW1wYFzo6cuPuHdpDKK7ejX1wYYdLlkX/34632HTNR1FjhEUbVf5iYFNNmnl0D0re06JigbLh1/v8+sRh+cadG5dulBWigrg2nkk2LIaSt2y5yJU61Q735aEDloUtKeI0yLt95ohmTT6PYng1gyMzd6A4EDaou6BiEYLxNqPpnBE2VY3Wts4U8NZM/QFNLuBnOu8CbrMG5oNreLo2rItsJXv1u6KjtYBAQBtwDWVGw+9InSqxxEcQK2aS7nQJ8LkrLh7mJaOKIwNMX4/kuaCg1dMEcFUUdu4O7vQyAbeSRPw==
X-Forefront-Antispam-Report: CIP:149.199.90.133; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:unknown-90-133.xilinx.com;
 CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(23010399003)(1800799024)(82310400026)(13003099007)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 5CAX922kCEuCF5XW2HdoNGYy/6IXXhLtgIlyda8C8STPCxApke67LpxfVLq9obEO3oUERBAAHz03/AeuwtZijbyzXpjUjCyEg/NvIyh7lsF1T7BkgKv6CEez9Pc3pjZ/No9izVEvxL81bB0nsCJRFbSebz3SeihfqeSWUBfbA00M935H7QUac8ZIt+lVw/ilSatY4ZR+3l29mAwUE91TB8y1h7tIoVk+NzuUHRLz8YGTSWWYxcdu/y93ntM1IrzYm3PiTvtFi1ihDWkGIVpporS82B1ez0KkHLAG925hguYhKDAxlKCF9w+vkphTBcM3sMc4Xhiug/86K/bOZL52AIqIBVaK3efr23XQEKl9jsgzQf/g0Ad+1wzTzwSQQcyWqX6tk8lyCjaz0/8Gnu4UIUV6HuIyUUkQsSSJuweJVRqslvWAr3XHo8XRfHqRr7M6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2026 07:23:05.3446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1683f6ef-9780-4598-0486-08df0279b4a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[149.199.90.133];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF0001615F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7197
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

This series adds IGT coverage for the amdgpu SVM (shared virtual memory)
uAPI, which exposes HMM-based unified virtual memory to user space
through the amdgpu render node CS path (DRM_IOCTL_AMDGPU_GEM_SVM).
Until now, SVM has only been testable via the KFD/ROCm stack; this
brings equivalent coverage to the DRM render-node interface.

The work is split into three patches so the reusable pieces land
independently of the test:

  1. include/drm-uapi: sync amdgpu_drm.h with the kernel GEM_SVM uAPI
     (DRM_IOCTL_AMDGPU_GEM_SVM and the SVM attribute definitions).

  2. lib/amdgpu: a small helper library (lib/amdgpu/amd_svm.{c,h})
     wrapping the SVM register/prefetch ioctls and the compute/SDMA
     submission needed to touch SVM ranges, plus the meson wiring.

  3. tests/amdgpu: the amd_svm test itself, with subtests covering
     system- and VRAM-backed allocation, prefetch, CPU<->GPU migration
     and access-in-place, range split/merge, partial unmap, eviction of
     system ranges, and VRAM overcommit. Most subtests are adapted from
     the KFD SVM test suite (KFDSVMRangeTest) and ported to the amdgpu
     render-node CS path.

Changes since v1
----------------
- Split the amdgpu_drm.h uAPI sync into its own patch (1/3); v1 folded
  it into the helper patch. The helper and test are otherwise the same
  two logical pieces.
- Reworked the helper to build on the shared amdgpu command-submission
  helpers (cmd_context) and the generic compute dispatch helper
  (amdgpu_compute_copy_dword) instead of carrying its own compute/SDMA
  submission code.

Testing
-------
Run on a VEGA20 (GFX9) dGPU against an amdgpu kernel with the SVM uAPI
applied, with XNACK enabled. The suite passes except for two expected
cases:
  - set-get-attributes: fails due to a known kernel-side stale attribute
    reporting issue (kept to track the fix).
  - read-only-range: skipped, as the kernel write-fault path is not yet
    safe to exercise.

Dependencies
------------
Kernel/libdrm (as in v1):
  - amdgpu SVM kernel support: the new uAPI (DRM_IOCTL_AMDGPU_GEM_SVM)
    and its amdgpu driver implementation on the DRM GPUSVM framework.
      https://lore.kernel.org/all/20260804094246.1719318-1-ray.huang@amd.com/
  - libdrm userspace wrappers (amdgpu_svm_* in libdrm_amdgpu):
      https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/485

IGT (new in v2): the reworked helper builds on two lib/amdgpu series that
should be applied first:
  - "lib/amdgpu: refactor cmd_context ownership and packet operands"
      https://lists.freedesktop.org/archives/igt-dev/2026-August/114898.html
  - "lib/amdgpu: generic compute dispatch helper and copy_dword"
      https://lists.freedesktop.org/archives/igt-dev/2026-August/114899.html

Junhua Shen (3):
  include/drm-uapi: sync amdgpu_drm.h for GEM_SVM uAPI
  lib/amdgpu: add SVM helper library (amd_svm.{c,h})
  tests/amdgpu: add SVM test suite

 include/drm-uapi/amdgpu_drm.h |  106 ++
 lib/amdgpu/amd_svm.c          |  151 +++
 lib/amdgpu/amd_svm.h          |   41 +
 lib/meson.build               |    1 +
 tests/amdgpu/amd_svm.c        | 1865 +++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build      |    1 +
 6 files changed, 2165 insertions(+)
 create mode 100644 lib/amdgpu/amd_svm.c
 create mode 100644 lib/amdgpu/amd_svm.h
 create mode 100644 tests/amdgpu/amd_svm.c

-- 
2.34.1

