Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625D0606A32E
	for <igt-dev@archiver.kernel.org>; Fri,  6 Nov 2026 13:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=Jhtx+8PP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1416610EA0B;
	Fri,  6 Nov 2026 13:14:42 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010000.outbound.protection.outlook.com
 [52.101.193.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052FA10E107
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Nov 2026 13:13:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qc8ucVu54y02UoLgpJRi5SmySatpsXmQN/xYBt7uikrANtPOhsBoN6S0LTsZKDhxLQ0ITdOb3Gzn4pXdkC5ZnMSlySrmmkdIx5DwgaAyL/gCOHIAi90Xpn7etUppawVSsxIINFEE3UHXqe6XTP8Jb/GA9M1kZbl8HhtdFi6ogxbo760hLiDmN0fVbyXqBPdOvoPpnRUtHLHCvveqxNj7ZjwibT0rc4aff8eRFTJB0nAgrYLJzNp8uvR9cdqYM05ofxYuMmxfYnMZ8kiemu1jBmJphxhRFOoR0yFHj9Njdnvszo69T8bmjofpTPq6Q8KPngr7cKi+4Fg9FipSHsjbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BAV9Q6jXiacg1OFH9llcr1FboiHqCa8sLsEwmY4XS0U=;
 b=oShzKuM1XlOzHZnT+dGwN8AV2WPn62DARKSy6Ujb8EeKzzSpW/tiIuTkykub6mgxR4kHkJBQsGv/toGvW9Rcwa1hzQI+qE3NnYd7XMXeFJ4EhvQ4LbbOMRN55s1DEUg8qQywgzncK5p4eqzWVPTiL3csF0KNV1KTBbI728Ocs+iRkzbPSYUr02bVf3VFli2wRe1Ob9RW1VhmGM+uiXJ9jFS8HGYOnuPigRKe2Em5j134ULXnoCBD7En/uQ4WNnU1ZX1tOos2k8C09Xg05+lMpb2ff1Hv8X9hO5SJr6DRzZn7o7RPMA+ArMuyZQTej1ZUS2V4XIQBjOXy/SZNzHUoMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BAV9Q6jXiacg1OFH9llcr1FboiHqCa8sLsEwmY4XS0U=;
 b=Jhtx+8PPKauCoUiALBYGdmdo/LIXITFpbD3xzp1Lv/dYOjrZ94XMw5O/UHsHKeFd+f/XMX4IYh8z0O6swarbRYl9ajsEhQHyboPHNinSFspVKEhuthfKlizfyTJ7Id93i+nM3mCqn+7fU1ZOThfOZoibY4HWP/oMiJ0itWEkFO0=
Received: from DS7PR06CA0019.namprd06.prod.outlook.com (2603:10b6:8:2a::18) by
 DS0PR12MB7994.namprd12.prod.outlook.com (2603:10b6:8:149::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.11; Fri, 6 Nov 2026 13:13:38 +0000
Received: from DM3PEPF000265B3.namprd02.prod.outlook.com
 (2603:10b6:8:2a:cafe::99) by DS7PR06CA0019.outlook.office365.com
 (2603:10b6:8:2a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 13:13:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DM3PEPF000265B3.mail.protection.outlook.com (10.167.23.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 13:13:38 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Fri, 6 Nov
 2026 07:13:37 -0600
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Fri, 6 Nov 2026 07:13:34 -0600
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Christian Koenig" <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>, 
 Oak Zeng <Oak.Zeng@amd.com>, Xiaogang Chen <Xiaogang.Chen@amd.com>, Jenny Liu
 <Jenny-Jing.Liu@amd.com>, Honglei Huang <honglei1.huang@amd.com>, "Zhu
 Lingshan" <lingshan.zhu@amd.com>, Yiru Ma <yiru.ma@amd.com>, Junhua Shen
 <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v3 0/3] tests/amdgpu: add SVM (Shared Virtual Memory)
 test suite
Date: Fri, 6 Nov 2026 21:13:26 +0800
Message-ID: <20261106131329.73236-1-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260825072300.16348-1-Junhua.Shen@amd.com>
References: <20260825072300.16348-1-Junhua.Shen@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PEPF000265B3:EE_|DS0PR12MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 52cc81a4-6b79-4bf8-2006-08df3c07c579
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|6133799003|10067099003|13003099007|11063799006|261102123227099003|261026140227099003|261028144727099003|261026121527099003|261021123027099003|261022105027099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: Xp+g8SlyIIzVrjn5sWTB1V1sDUDixJcd2oEMeSUKqK2xa+MOlwfxLWP0/aUyWpvhssO1zTPSpu1unJLDIXEaxHRpneZfrMx1TJ90LNY7jIVjlnbDfmKFuuPuz8FCimKFnnItEfv7ojdD8q+Fq4XFRLOtfF+OQ+Vh1UQEFiPmK/RRHKvDW8MMZYjUbzklxfX4C8ZAKLcd4kxyGC5ok6DUxlMnlv5Xa16Il4gYK1e/QwiSuwdDnUzIzOotURpwbU0rVaPXrZqiZxqZnG3x34SSiCoQcXVnnah0cVFI/cQM+ZKckq+eZqYn2qrcWqbM2MQ0UyWxtMtS+vryL5SVrAOQKG1i6HZZGsbyZZIYcfnb38MSt3xfperMOROsijRFtaiq8y1ggkWepnBgMq5KEDWj4hVz3wvCj1OkNyNcFPr+CJukg28KygXWUlTq615+iKKZ/QVt1o8KaBTQDxV50SCaYlqPaTDEUmd0TI/HHUdYV6GdpHw/EPxkNJUyN0qeHLOLDSYfgFpXZbj9TsroFFH979mwsWKYk9wZlaVHP7Q6AmpnW8i8N9rtGcWXKuzyEIiirArAOjwYbjthQzYvAqfBjWldD+ynDKdpL/6fgsgeqpfOJ9Bg3lDEHt3VAZk/TzpyaDqNZ3SEsGGIp7+tAjLU4w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(6133799003)(10067099003)(13003099007)(11063799006)(261102123227099003)(261026140227099003)(261028144727099003)(261026121527099003)(261021123027099003)(261022105027099003)(261021121427099003)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: yusHfMLZ00Xhrqt9baNqYMox0mmK6otFDwEu9I+yr4mb7zKNWQtwjRXbYEZSaHcMfyuav4aLshmgF1U4hzPTmz0s5AlxQdQUvbDiWHU2MbyBGivq38pvZKh1usLWV4XMblD4U6lxvT17S1XvpPvxypdcGt9f9wKMOmMRb+biZbBkq5FNvq3YAbJHnLW9TXyxIR7sW3tUUvzo3dX3dwoOIcn2BuJnASyG4haKfwdMwhu1OesDaXRt1XhPXO6T7nz3a3emsVs3OkgS6MpXQT+7VDmhrKdCtX24ZORqLDxeKb4WCj0Ouai4aCFAE6ytuG/zYwNuHSjDmjMSdd7IvE0w6k2Vy1vAOawXSKEIz9YL63u3nv3Zxoa+0ACahR2x00w/daRwzjXBd9s3Bhwcs7Btg/IzXqM/w32yGfqTSCqCe7JiZsZExvzjJLqe/f8w6Ciy
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 13:13:38.4586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cc81a4-6b79-4bf8-2006-08df3c07c579
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3PEPF000265B3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7994
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds IGT coverage for the amdgpu SVM uAPI, which exposes
HMM-based unified virtual memory to user space through the amdgpu
render node (DRM_IOCTL_AMDGPU_GEM_SVM). Until now, SVM has only been
testable via the KFD/ROCm stack; this brings equivalent coverage to
the DRM render-node interface.

  1. include/drm-uapi: sync amdgpu_drm.h with the kernel GEM_SVM uAPI.

  2. lib/amdgpu: a small SVM helper library wrapping the SVM
     register/prefetch calls and the SDMA submission used to touch
     SVM ranges.

  3. tests/amdgpu: the amd_svm test, with subtests covering system- and
     VRAM-backed allocation, prefetch, CPU<->GPU migration and
     access-in-place, range split/merge, partial unmap, eviction of
     system ranges and VRAM overcommit. Most subtests are adapted from
     the KFD SVM test suite (KFDSVMRangeTest).

Changes since v2
----------------
Patch 1/3:
- Sync with the updated kernel uAPI: DRM_AMDGPU_GEM_SVM is now 0x1C,
  AMDGPU_SVM_ATTR_HIVE_LOCAL is gone, and locations are an enum
  (SYSMEM/UNDEFINED/LOCAL/HIVE) instead of DRM fds.

Patch 2/3 (Kamil):
- Drop "(amd_svm.{c,h})" from the subject and spell out SVM on first
  use in the commit message and in amd_svm.h.
- Keep only the SPDX line as the license header.
- Include system headers before IGT headers and drop unused includes.
- Document all public helpers with gtk-doc comments.
- Sort the amdgpu lib_sources list in lib/meson.build alphabetically.
- Only build amd_svm.c when libdrm_amdgpu provides the SVM API; v2 was
  built unconditionally and broke Fi.CI.BUILD.

Patch 3/3:
- Acquire the render node's VM through KFD (AMDKFD_IOC_ACQUIRE_VM) so
  the kernel turns it into a compute VM with SVM enabled.
- Use AMDGPU_SVM_LOCATION_* values for prefetch/preferred locations.
- Align the registered range attributes with kfdtest's HsaSVMRange
  (prefetch and prefer system memory by default).
- set-get-attributes: expect the kernel defaults (HOST_ACCESS and
  COHERENT set).
- prefetch: on a range with mixed prefetch locations, check that
  GET_ATTR returns the first part's value and clips the size to it.
- split-range case 4.2: register the superset range as kfdtest does.
- Only build the test when libdrm_amdgpu provides the SVM API.

Testing
-------
Run on a VEGA20 (GFX9) dGPU with XNACK enabled, against an amdgpu
kernel with the SVM series below applied. 17 subtests pass and
read-only-range is skipped (the kernel write-fault path is not yet safe
to exercise). The remaining subtests are kept to track kernel fixes:
  - migrate-file-backed-range: registering a file-backed range with a
    VRAM prefetch location returns -EFAULT.
  - multi-thread-migration: not run in this round; it was unstable on
    earlier kernels.

Dependencies
------------
Kernel:
  - amdgpu SVM support on the DRM GPUSVM framework:
      https://lore.kernel.org/all/20261021025915.2433837-1-ray.huang@amd.com
libdrm:
  - amdgpu_svm_* wrappers in libdrm_amdgpu:
      https://gitlab.freedesktop.org/mesa/libdrm/-/merge_requests/485
IGT (apply first):
  - "lib/amdgpu: refactor cmd_context ownership and packet operands"
      https://lore.kernel.org/all/20260909104602.13807-1-Junhua.Shen@amd.com
  - "lib/amdgpu: generic compute dispatch helper and copy_dword"
      https://lore.kernel.org/all/20260910081951.68221-1-Junhua.Shen@amd.com

Junhua Shen (3):
  include/drm-uapi: sync amdgpu_drm.h for GEM_SVM uAPI
  lib/amdgpu: add SVM helper library
  tests/amdgpu: add SVM test suite

 include/drm-uapi/amdgpu_drm.h |  125 +++
 lib/amdgpu/amd_svm.c          |  197 ++++
 lib/amdgpu/amd_svm.h          |   34 +
 lib/meson.build               |   32 +-
 tests/amdgpu/amd_svm.c        | 1828 +++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build      |    5 +
 6 files changed, 2209 insertions(+), 12 deletions(-)
 create mode 100644 lib/amdgpu/amd_svm.c
 create mode 100644 lib/amdgpu/amd_svm.h
 create mode 100644 tests/amdgpu/amd_svm.c

-- 
2.34.1

