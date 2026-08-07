Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAADC5AC7C
	for <igt-dev@archiver.kernel.org>; Fri,  7 Aug 2026 10:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6113610E403;
	Fri,  7 Aug 2026 10:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hxt2kE4M";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010046.outbound.protection.outlook.com [52.101.46.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A08C210E3B7
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Aug 2026 04:56:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SDhzKRHcYS35V0+NkeOziRDJXjgdX2BhqMVoMjbyG6bFhd5XnpdPY1gxO81fnRM1103d3H5ojjRNM4T2bFtRiERRVEqAcGiE82vXnINEisjkWULTOLZ14gE3LdhxLDG0vhHzxXph49l5wP3AomY/kgWUeuMKHnCOn1BcKNemuj6d37x/mrvu39yrm9NivIbaPgysTLyo8rk77DdRA/41o1GWGn8gfbAbPqfEfcq9KcErNK0QIHFgvrFGu4GnltkZj6WxvkO5WxsqGep5zgL6mudUC21pPTHyfBl+9vLcA18DAc51rR8pVCDa+OQywgkmDbQQpjRbONV8kQ51xjkoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UggnNz3Rb/SQoSx9JLTL1OTuBQ8FBksRj4DDWFi4OxE=;
 b=zUOqBCnAVTTJA3yL0Peg5ueIBhJWqLG+ofwJ2GDNBmZ4JVYVFF1jdqOHk040cjdbQqLKxWomi7YE/7YK6j+H3coopOn+B9BwdJyRN6PUzPwUznHqlpEk6GT0hhbUevO1oUefgmYuF8PezSA3i9/U2pgBXJlUPw1B3oWSw885416aiQEGhg6ueWTaSdi0rZckpZ9P+re5Qxdkme0YdJWD3cSyX/34MbYZP9b83tm+dvHwwe1DYaRaFuqFt2yHbIpc7ViPA3pfy60eeEcZl8ttx8YlsxaR6CvNgIrJO0exxpvrjyG1Eu5Cy+ADavzto8sHIv4k6nUNW9P4Xrux3Elxjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UggnNz3Rb/SQoSx9JLTL1OTuBQ8FBksRj4DDWFi4OxE=;
 b=hxt2kE4MYrNoIWxc/K4bh5+pjm3iWkjTwebag2Ku9d3HFzhHZykJbtJWR0EqNCT8/k5LDzI9Huayqoi/sVsiBjjj88emcgrn2bKOBeBAAUF8ci2Uw8uYdo8Gs5kKvSCIYYTdbeymIMfbTy9OIUSx5E4inwJu5FcqmU2L5f815rU=
Received: from SJ0PR05CA0033.namprd05.prod.outlook.com (2603:10b6:a03:33f::8)
 by LV8PR12MB9333.namprd12.prod.outlook.com (2603:10b6:408:1fa::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Fri, 7 Aug
 2026 04:56:32 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::ac) by SJ0PR05CA0033.outlook.office365.com
 (2603:10b6:a03:33f::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.6 via Frontend Transport; Fri, 7
 Aug 2026 04:56:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Fri, 7 Aug 2026 04:56:31 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 6 Aug
 2026 23:56:30 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 6 Aug 2026 23:56:27 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Huang Rui
 <ray.huang@amd.com>, Oak Zeng <Oak.Zeng@amd.com>, Xiaogang Chen
 <Xiaogang.Chen@amd.com>, Jenny Liu <Jenny-Jing.Liu@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Zhu Lingshan <lingshan.zhu@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v1 0/2] tests/amdgpu: add SVM (shared virtual memory)
 test suite
Date: Fri, 7 Aug 2026 12:56:18 +0800
Message-ID: <20260807045620.31954-1-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|LV8PR12MB9333:EE_
X-MS-Office365-Filtering-Correlation-Id: 1870ea8a-25d3-431b-fdc0-08def4403f60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|11063799006|56012099006|10067099003|6133799003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: Pys1apODUsXgwKw57xIuumbI5GltFleBsDImvihDcmoVCJvDWfaTtu/r3fKLH2+yZxUpH6JbI/2bIc9GcOcq2WStRJxcYkJnIXAJbzNq+ZZQm0isRWRT9IAH+7I1sreNX0UTQGOafBonLq0BD0j9x8paFSl5SrRtWuMzDgBNwb7yfyBUgn65vqQ69B1grKvKJZ+HRHxM2K8u05+xoWNlFArNByXdqAkwIxMIWkK7SZnrx0fma+9uA28JXTrFwT/BVa838ktIeeDOKg1gATd4r1u8/yvNPtoetNC4dTBLvo11/NkeDTpK+T6NSuU8RgLqElnER/ZoNtXgfPj6/Tw4F4lnNARPpa4v71kvp59DXuOV90Ejm8ZerKqDJAeu33xrbMrt9LU6n3TD0lrgGsBsIIIWgwImL8rh8CdSExAE/61S4jsOzcAA7TWYkKx/wrhOS+tPC92Br4QKSa/u7zIJWiWB69SforbP0FroKtrAEVufv+tOODPtDNNd0Gcha9U9IXg9UZpsaWPZeTs9upvX0/nNbrZCdvn62mUOpkSWu+CQSOGN+FRqz8xHjjO/rMzyE8S4DMEZfgCVsOJfPkrH/Wx1DqDhdrTn7C/NcaDZDdsJ97b4b2ME0qO7ZIfMmkm3PABlFnFZZcREVwqA4H3eUANAoFb+JPHvW48Dii5jTKCj6t699KAP2otczx0ss6LV64gevL4i5gEwYCko3SXX9A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(56012099006)(10067099003)(6133799003)(18002099003)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: zDCe7CBbjCNUDVEV+tX0WSxYY2Km9yPqSZ6jdYr0dInV19XSimzpFETdtyRModm9upHYAIUq4KJTxLM/RXAQ7v5E1KD/i4YV29UW152Dpvb4flHd3wqahdT3KII8U5eDPtkIExye6RGSpYaLrXedCBimruUJjT4wxoFPIgMajA/88JQrbc9aVwikBpnl2ssJ2ZONTkrPjcVUac+ucMVp36bpbk8DpdXu7/jX050Che376mQ4LZFdd7bUaKnWIaUVbmbD1gxh0pvui1r5f6ZHrLgF2VpMF7QBhloq4FzaXeXRQjH1AkUzD2DqBKb3p5OKPkH0+O2TVCPv6EB9OYWpUPN6v4kboakRbvtGRYGpy6sD8e+9jqDQy59RXmTNXwxBe2cnVfTVBc5HMiTZoFJoxhRsF4DWe5Kcb6nu2JmmcQxg8iS8Lkbh6VVGeCu1rRab
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 04:56:31.0245 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1870ea8a-25d3-431b-fdc0-08def4403f60
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9333
X-Mailman-Approved-At: Fri, 07 Aug 2026 10:35:08 +0000
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

The work is split into two patches so the reusable pieces land
independently of the test:

  1. lib/amdgpu: a small helper library (lib/amdgpu/amd_svm.{c,h})
     wrapping the SVM register/prefetch ioctls and the compute/SDMA
     submission needed to touch SVM ranges, plus the amdgpu_drm.h uAPI
     sync and meson wiring.

  2. tests/amdgpu: the amd_svm test itself, with subtests covering
     system- and VRAM-backed allocation, prefetch, CPU<->GPU migration
     and access-in-place, range split/merge, partial unmap, eviction of
     system ranges, and VRAM overcommit. Most subtests are adapted from
     the KFD SVM test suite (KFDSVMRangeTest) and ported to the amdgpu
     render-node CS path.

Testing:
  Run on a VEGA20 (GFX9) dGPU against an amdgpu kernel with the SVM
  uAPI applied, with XNACK enabled. The suite passes except for two
  expected cases:
    - set-get-attributes: fails due to a known kernel-side stale 
      attribute reporting issue (kept to track the fix).
    - read-only-range: skipped, as the kernel write-fault path is not
      yet safe to exercise.

Dependency:
  This series depends on the amdgpu SVM kernel support: the new uAPI
  (DRM_IOCTL_AMDGPU_GEM_SVM) together with its amdgpu driver
  implementation built on the DRM GPUSVM framework.

  Its userspace entry point is provided by libdrm (amdgpu_svm_*
  wrappers in libdrm_amdgpu); the amd_svm helper library in patch 1
  builds on top of that, and its bundled amdgpu_drm.h mirrors the
  kernel uAPI.

  Kernel series (uAPI + amdgpu DRM SVM implementation):
    https://lore.kernel.org/all/20260804094246.1719318-1-ray.huang@amd.com/
  libdrm support (userspace DRM_IOCTL_AMDGPU_GEM_SVM wrappers):
    https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/485

Junhua Shen (2):
  lib/amdgpu: add SVM helper library and uAPI
  tests/amdgpu: add SVM test suite

 include/drm-uapi/amdgpu_drm.h |  106 ++
 lib/amdgpu/amd_svm.c          |  215 ++++
 lib/amdgpu/amd_svm.h          |   42 +
 lib/meson.build               |    1 +
 tests/amdgpu/amd_svm.c        | 2184 +++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build      |    1 +
 6 files changed, 2549 insertions(+)
 create mode 100644 lib/amdgpu/amd_svm.c
 create mode 100644 lib/amdgpu/amd_svm.h
 create mode 100644 tests/amdgpu/amd_svm.c


base-commit: 0385a3845f2b29c202df21ebe7928462c98536f5
-- 
2.34.1

