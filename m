Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E05FC5DF81
	for <igt-dev@archiver.kernel.org>; Mon, 24 Aug 2026 08:18:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E9B10E53F;
	Mon, 24 Aug 2026 08:18:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="skheEtWE";
	dkim-atps=neutral
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010059.outbound.protection.outlook.com [52.101.61.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7407510E2D4
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Aug 2026 14:22:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzzIt5qBEaqQKtrkcjU8reJhCernFSwDw/vT3bH5bBL3bbZJ11D5OKg+ixko6CUHvXXH7ApwimYbzcpOgrqIlEyF9U+EAZOsFiuYxR0t4Egd4qIoztBQLVT53E8UshuLy02b9klSAzDqS4zP65ShkvY+AMp2saP+EHfBOls7R4I0+vIMW1iDbIuhjaLZWVa0GA8yHPqPcLGAY/JE4ljKGIJJIpDPjnTKmrxw3S7qccwcSIqc2QHqpvcPjfRXOMkR0w48jcfwuE/YcFv5zpoK4kotVMgHOnN5icJF0FDV55q46URR8vqRYqAVH5rHQSHHicPI6xWX/BDVyFDKu6C9HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U2BVOOWhYx3LA1lNF7z3qA4oWYBXEX/0OPlWPiOXFIE=;
 b=Ls5psiHvcBGcLNDbw46halnDNIGqJOHIFvC0TG2GxeAbl3Scr14w1MKMR0eAw6y3tO0DqlEp1T88/IpFhQ3zJnuCV1uu3lKKGoCcvSFzq7jn2ZauSks8xZbxP1Hq2LJeFR/dcn6aHdYa/N/VQz1kIv4EdTJ1odgF7f9mBhjst9OEedSoeJ9yi663bHX8T3FSlDfkpE09CztcY3mIbkmGuXxpq9jUFzV7iE3G6FiOepdeLYO99rZhTzCq4A8NVyGXNeoMBhtdwyesHetZFh/hvt44J9ZmhA5Y+VQ3ohZTWkV2v0koqcM/6woN9t24WsaJkp7YdEoCnzB7DcW15u/mpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U2BVOOWhYx3LA1lNF7z3qA4oWYBXEX/0OPlWPiOXFIE=;
 b=skheEtWE4Ka6gh1IJRNlKbiv2ehA6dq92rQrkxv0P1uDBdY5zbJKTRzBf7uAhjooMZ5HzvggwIdPFqm1waV2Akvh8yuSieKQWKygVZDzjY72oWqeNYN0W7PMp2WWvZZxXW6pLIpWysP0TQocDJzg0/FyK2idKnbyCA0mYkMiqhA=
Received: from SJ0PR03CA0240.namprd03.prod.outlook.com (2603:10b6:a03:39f::35)
 by BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Fri, 21 Aug
 2026 14:22:48 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:39f:cafe::49) by SJ0PR03CA0240.outlook.office365.com
 (2603:10b6:a03:39f::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.11 via Frontend Transport; Fri,
 21 Aug 2026 14:22:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Fri, 21 Aug 2026 14:22:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 09:22:45 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 21 Aug
 2026 09:22:45 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Fri, 21 Aug 2026 09:22:43 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v1 0/2] lib/amdgpu: generic compute dispatch helper and
 copy_dword
Date: Fri, 21 Aug 2026 22:22:40 +0800
Message-ID: <20260821142242.34700-1-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|BL4PR12MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: a667f182-8432-4ef4-240a-08deff8fabed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|56012099006|6133799003|10067099003|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: WxCHy8C8S1hLOd5hvfPwgu+LZf30SE6T8os5aXq5GOwARfhsNdJXHNuVgzvWoqOU1/Lvfmwa4JgF+gBZyEIKMElVQ/e5wtu1A96WR18ZbAXUfBdQcB7FJ7rFBezRXSbIqdsqntxextAMvBkEu+QN/aQq+5Qi7SUILJJzJivC1dtLqk2g2Fa1gzEuVOG52UJ8JSi8jZjkpupEWcoz2y10ELVD/QO0h8E5PuArQRZEIhUHGcVoK4wwKChzjWzkVvtZpcfTI0SH1ET4Em03iqcs3qrZxPrCB9ifYtXY1lcNMxEe6heSvW/asrPeo6hQSpTKv/LWU4BN0255+ry9v9OKhKR38L7q/stgf2mtji2DK2HgVcpdVSKAdigzmFut4iqjZo9KaJVz3eCkzM3XhsUr4SjP1UVqsE4puuT65F7Ddhr81aSYHGKuKW9i9q1KzhlSR6y/vFEI9myAakGjYeq13exNsXefFgB7+FGzGphQA/Zj8VHIysEtuepbUudcEZHXwOEyusx8F5imxy/yJaJXynQ56n9HcOnDRXulGbcKt3NsvJx4adv768L3+wumTe53JBPVYYtMm2FF2ODB35P4bum4P2lk/09AqMqr+mpyW6tFn49m3ylwsxhIA61DoeKU/XeJNNYqmRXGLyr03uel2v99RaeEVNwyiqycxYk/eCYgKrwwF99mDqSLOWkXYRjrATa5+MQa83g7VberEU4LRA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(56012099006)(6133799003)(10067099003)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 48E4JniGJDvgqI7eiLSVjkxy/exJfqZUhnbbmXihwI525HIPlJLlWJSdC6ZMu8fwBBWEh9eod+KtwIMt40nNa+zIyOBUp/MONhnfgnnpA6Sv6jDss0BsvUe9CCoPOWn8I1bP7T1Gr6NX1VftxFcyfT+l7R9ntmgbw/VzZCISuzv5hkrbxi5UFBUxpcz3+o6MAW3gVgBpX01DxMEl7GgXR5pyMvOaqAWuptzeBetqzf7+MP297reS8ob8aEHamlAdeaTZ0BuXTlK92an3ML2TJg2j9SjZObbb9U/iPQH1793psMA9hTk8rrOJVZKHOCrATF+au1tZPQ0oKm9fn3VKh52BJUlYjPA1hdhTbS6LyMQIeN5m/Koeb30aETGf6FBIbypSnyiM/jFOidAUJMFSuhyBXopHQ8nR3dqCAxkpkNGhiLteUzzqvME3CJTLg77G
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2026 14:22:46.1752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a667f182-8432-4ef4-240a-08deff8fabed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9478
X-Mailman-Approved-At: Mon, 24 Aug 2026 08:18:13 +0000
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
Tested on AMD GFX1036 (GFX10_3). amd_mem ptrace-access-invisible-vram
passes: both word_before and word_after readbacks match and no VM fault
occurs. No regression is observed from this series.

Known limitations / follow-up work
----------------------------------
The following items are intentionally excluded from this series to limit
its scope; they are candidates for follow-up patches:

- The SET_SH_REG offsets in the emitter are hardcoded. A comment
  explains why get_reg_offset() is not used yet: enum general_reg lacks
  RSRC2/RSRC3/NUM_THREAD_Y/Z and there is a single gfx8 IP block wired
  for all generations. Adopting it requires extending the enum and
  adding real per-generation offset tables first.

- amdgpu_compute_copy_dword() is the only workload built on the generic
  emitter so far. Other open-coded compute dispatches in the amdgpu
  tests could be migrated onto amdgpu_dispatch_shader() where they are
  not specifically exercising the submission UAPI.

Junhua Shen (2):
  lib/amdgpu: add generic compute dispatch and copy_dword helpers
  tests/amdgpu: replace execute_compute_dispatch with
    amdgpu_compute_copy_dword

 .../compute_utils/amd_dispatch_helpers.c      | 356 +++++++++++++-----
 .../compute_utils/amd_dispatch_helpers.h      |  82 +++-
 tests/amdgpu/amd_mem.c                        | 109 ++----
 3 files changed, 366 insertions(+), 181 deletions(-)

-- 
2.34.1

