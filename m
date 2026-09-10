Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D5DCC79F9F
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 08:20:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E0310F374;
	Thu, 10 Sep 2026 08:20:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="euNSV2dV";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013043.outbound.protection.outlook.com
 [40.93.196.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F35310F374
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 08:20:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WNDmsybTS6tKt6z43no64QsS2ByExuuWH2DnrAwcINhNr16xGkWnUrwSPRr/H25iZRkyJvJkSUEdhpGo0ch0Q5JJ7/xIFo4FcCZ/l/1sx3Fy9AeyUL0SVLacA7JaIxewNOgcOhsizqMeqzHmN6B4FQ01rt6cBnYpZ0JqCV/IA6VMDt+adMZgGiHoX58PA+ka15Vc+FeJjLKxdFbLBJ1n0HwLFz880/rs5JZhwnnSneM2cEgv58IoTXpf9pzUnOOdEKRzAYJqPTHWOvOLlYQrPUBLOZUBzSCVJMTo3gaEUz4oSx66/3rbG1JEZ7/Iok7wfFZu9UsCfUTFCCnlSAz2NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4EVW+IQMlV/504oP1cxpA6EvYcCyMabPiU4svO0PVI=;
 b=DOB1hXxnnSMH6WU0iBj4SqEV4YjBFzE5IcJS3JcyrSvUbMsbHIS1ZXts8RODBG6YIOzRtlyklhdGvUoSMnJ9Up3CM9iSw306XEQ1yLlUSp7KRpm9pqhB4ScddnpjZjaXYuFuwVzlSnGvhvMXAXh8CQGa2TdwhBJUJIc2/bC9Bau1UrQIwkwcuxTfBZ19Cl+AlWCqMxkWdqLnHpsCKw8sQn9pHIHx7X7sHtIeiUNC8xHi4g75V/0f/qEY4fW97aHHpJwj5IItaw4Fc2SoEzOFqZGrDXmC9pxVPI5Zz6a7+3P4wZCUq6py00pOxiM16XscMVAc8+qXF/ql/EZomukAHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P4EVW+IQMlV/504oP1cxpA6EvYcCyMabPiU4svO0PVI=;
 b=euNSV2dVbXpm3SNSW8oyollVAzVodXbWxYNm8imRFtrUnPH+q/vhZDMLQ0xI0bgV/O+3EeMS0q9t2fRV7JIyrfItFhkdh/jlNwj8dlwUIrAshRZ4jdhJ202qFG1i1QOou3qJQfpG/sRNdn2nq1oPSqTT9VdvSfrTaIf1rLp0BgQ=
Received: from BN9PR03CA0930.namprd03.prod.outlook.com (2603:10b6:408:107::35)
 by CY0PR12MB177289.namprd12.prod.outlook.com (2603:10b6:930:138::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 08:20:00 +0000
Received: from BN6PEPF00000073.namprd03.prod.outlook.com
 (2603:10b6:408:107:cafe::91) by BN9PR03CA0930.outlook.office365.com
 (2603:10b6:408:107::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Thu, 10
 Sep 2026 08:20:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN6PEPF00000073.mail.protection.outlook.com (10.167.248.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 08:19:59 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 03:19:58 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 03:19:56 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 0/2] lib/amdgpu: generic compute dispatch helper and
 copy_dword
Date: Thu, 10 Sep 2026 16:19:49 +0800
Message-ID: <20260910081951.68221-1-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN6PEPF00000073:EE_|CY0PR12MB177289:EE_
X-MS-Office365-Filtering-Correlation-Id: 2621e143-86d9-4605-bbc0-08df0f144dff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|10067099003|6133799003|3023799007|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: ISaEVwiXI5H1ENJyBYxMur7W4E3Hu4WdME01zImlLVvT38q7kV9syDPcqm4+soyVn4R8kr1ATKEx9EZTXGKCHac68X58EAb73k65iWV6SbbOMcNX7ECtruuGhuwdwJFNbQMeY2cA5xQpdquAjrjjANjRJxFbyR9OhkJkNSVDZ/WAQsvqLfHQvT3ePwQKyAR00L+ABe/Osj87UnA2lxFCD0df1/I85rgJEsNS4AGvd4FM0+RAeVl9uumi3RfYWdmKgEX80mInqMX+QmN27kCwKN6mSMU/hlhQQ/4jFx++3GbYc/DuagGmb+RDgM9DAgBF1wD8FdirsiNtq58XcX+Lhc/gTHqECPu8coSYyVFuVa57keMEVPBP6SDrI3Gn0c0WFLPmNrVw9eWksBIAJeUfwR9D0f5oqwoi847i4IQcre5TEVmPxWW1ZYcfOJppr7Uh3VSZTXMMaa6eppj7jmoJwiDNBj9pMANYcHoy/n37hrwE7EkDj24+OHdL6RAe0tXJooBwCC2vcsMoxEn3kk0IX+kuGlDWSVKBz+TKSIoTtyrr46YqDSRjfBCnHy3qWKRhrhJWa8bvfrpscOb/YiQeO79VJ0j9Ehzit2mR/c6hGlTx7Tw+Ds/t0OueOsARw35hlk9na2TL6fEbh4avAM/3sUvQIm8/8UPomGWpN/bBcJu+uzBrx+Kizc/C66eZzDJARVPpUa4f7HYE2DfaG71M8w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(10067099003)(6133799003)(3023799007)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 48R7Wj+DTm/jXfnYRUhSIfZpNpLJliXUVUXnkGJxXVkVH3CI3YO2KZ9zrIlK86uzUMuSoLoflmTJXxD87+0NlZJM6uEMYjPxit6BFA+CkgGpWNJviycLHK1vtGEgUIWjb1Rsd+CgS8vStowRrt1XWxbloA35uhrkxpnjvOdb6fFQpOhNQw3xeUfiC1hu3uU9sagYcMqrfvUYOS86V5vIA1bj7xPu3dbX6DfBdisGKTEPnH671VBDmzmuhBkVR/oC8pizU5KMXnZ+r880QM17ctN9in0+XQ8dJ3oIsL5mZuYEcam+Tt1oePsHWCE0lF0HQHmbnx57dTRlxeuLbr3ZBbH6kaffUlQn1SnJ1wazzcnZwUbdOjo4V2u11EJGb0qWjuPjEx3Pw/X9EXLIIYffCRJdBfrixttVO1a5WaLYAf9gpgw5S6dczZv0v2C38VjQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 08:19:59.1849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2621e143-86d9-4605-bbc0-08df0f144dff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN6PEPF00000073.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY0PR12MB177289
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

This series introduces a family-agnostic compute dispatch helper in
lib/amdgpu (lib/amdgpu/compute_utils/amd_dispatch_helpers.*). The emitter
owns only the PM4/compute state stream; all shader-binding state and the
BOs the shader accesses are provided by the caller.

The ptrace VRAM verification in amd_mem currently open-codes its own
dispatch through execute_compute_dispatch(), a single-purpose helper that
ignores its destination argument. This series replaces that helper with a
generic emitter and a copy_dword wrapper, and migrates the test onto them.

Scope: amd_mem is the only user of the compute path being changed. The
remaining amdgpu tests drive libdrm_amdgpu directly to validate the
compute-submission UAPI and are left untouched.


Changes since v1
----------------
All v2 changes address review feedback from Jesse Zhang on v1; no
functional behaviour of the passing test path is changed.

- amdgpu_compute_copy_dword(): now takes the source and destination BOs
  (src_bo/dst_bo) and registers them in the dispatch BO list alongside
  the shader BO, so the driver keeps every buffer the shader accesses
  resident. v1 only registered the shader BO, contradicting the header
  which documented @bos as covering the shader's input/output BOs. Both
  handles are optional (NULL) for addresses with no backing GEM BO, e.g.
  SVM/HMM ranges. The amd_mem caller now threads the VRAM source BO and
  the GTT destination BO through execute_shader_verification().

- copy_dword_shader_assemble(): use AMD_IP_COMPUTE (enum
  amd_ip_block_type) for get_ip_block() instead of the libdrm
  AMDGPU_HW_IP_COMPUTE constant, which is the wrong enum family for that
  call.

- amd_mem: drop the amdgpu_llvm_asm_init()/amdgpu_llvm_asm_shutdown()
  wrapper around the verification call. The LLVM assembler and
  compute-IP lifecycle are now owned entirely inside the helper
  (copy_dword_shader_get()), which reports failure when either is
  unavailable. This removes the duplicate init/shutdown and keeps the
  LLVM lifecycle in one place.

- amd_mem: rewrite the execute_shader_verification() doc comment. It no
  longer assembles shader code itself; the comment now describes what it
  actually does (dispatch a CopyDword shader twice and verify the
  readback values).


Overview of the changes
-----------------------
1. add generic compute dispatch and copy_dword helpers
   Add amdgpu_dispatch_shader(), an emitter driven by a caller-filled
   amdgpu_dispatch_shader_req, allowing an arbitrary shader to be
   dispatched without changing the emitter. Built on top of it,
   amdgpu_compute_copy_dword() caches a single-DWORD copy shader for the
   running GPU family and dispatches it as a reusable compute workload.

2. replace execute_compute_dispatch with amdgpu_compute_copy_dword
   Convert the amd_mem ptrace-access-invisible-vram verification to
   amdgpu_compute_copy_dword() and remove the now-unused
   execute_compute_dispatch().


Testing
-------
Tested on AMD VEGA20 (GFX9). amd_mem ptrace-access-invisible-vram passes:
both word_before and word_after readbacks match the ptrace-swapped values
and no VM fault occurs. v1 was additionally tested on GFX1036 (GFX10_3).
No regression is observed from this series.


Junhua Shen (2):
  lib/amdgpu: add generic compute dispatch and copy_dword helpers
  tests/amdgpu: replace execute_compute_dispatch with
    amdgpu_compute_copy_dword

 .../compute_utils/amd_dispatch_helpers.c      | 371 +++++++++++++-----
 .../compute_utils/amd_dispatch_helpers.h      |  88 ++++-
 tests/amdgpu/amd_mem.c                        | 141 ++-----
 3 files changed, 401 insertions(+), 199 deletions(-)

-- 
2.34.1

