Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81A606A33D
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 00:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=2Hr9aCni
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141910E03E;
	Mon, 16 Nov 2026 00:41:28 +0000 (UTC)
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011058.outbound.protection.outlook.com [40.107.208.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C77110E029
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 00:40:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pd97dwp2NZKUTL4EW5iP94m8feiQU8Ch4eF63SACrP14R9TNpS+f/dJtkbJWAAqb/3c1DHaUbZd0MzvgnWk0fE1licymqFY4K2gXXInx7537eYJR4ZEGhQeJ01uNXhgjZziN/Y0OYeSBdMKVgr+X5pdTezYEUsROGBebact2r9ylmW2vS2TGPBzjAVCQP+E8ksAMgu3YY1DrqQO8uTzHuQRNknA/BxMmDvc6BlNWQWgdnr9TaQlBclxyesERpkFVmr0tNZ7y2vyR5vBrJWjMcxBRrbwJlr3VGcNCJ1QrLhG9MSaf6T+rpU5pWjq9vx4WVHAEYsT+AsqgvdyzhtOHVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2w/ENypMbiFN8tYpNxsX254PXPGUSqEmglo3lG105FE=;
 b=Nqtz33o6IhAkE17Eqix4ZCLUYX/JkD8rwXHCCxVBPSHWPVeWqWvkr8xZbIEKrcXOTp8gWyWG/xBFdXSSGF8prw2MiFIOIYhdF7pbwMJK/Jx5yP8baVf2lNKGbZd5EmX+hRLGYL857Fdbsvrlriwrg3erdNyByD0PJlXrb09DDC4x4wrZxGY3RfNL06VuT7BHs/mfscCr++5c+CtemBfdUn42dUjBxepueNhvukrXL/sTZwRdO113yh1TExlx6q3rGdutrsMFL4ykBowWMIF6ZwON1dr0xdJrCPYmAEgBc8xWT7xNP7WevSnFkNExnXkPyxAc+y+yjl1APaD8MckFJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2w/ENypMbiFN8tYpNxsX254PXPGUSqEmglo3lG105FE=;
 b=2Hr9aCnisWzIP+YQ8N6EHOq8GxxWA0Sts+aNHcHOGqqmdzFdd1pcwQ1KXW+CtMLzouqV++Z++d8kRfwkG3mvaLsULuz2B1WCEWWeLZJQCu59fGqmX3EI1EcNrijtPZs4ElexMmIImaksgFvUszQYZS3+RY3p2OOcrTj3koCPYc4=
Received: from BN0PR02CA0021.namprd02.prod.outlook.com (2603:10b6:408:e4::26)
 by SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 00:40:21 +0000
Received: from BN1PEPF00018070.namprd04.prod.outlook.com
 (2603:10b6:408:e4:cafe::25) by BN0PR02CA0021.outlook.office365.com
 (2603:10b6:408:e4::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 00:40:21 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018070.mail.protection.outlook.com (10.167.245.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 00:40:20 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:19 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:18 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 18:40:18 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Junhua Shen <Junhua.Shen@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 0/8] lib/amdgpu: refactor command submission and compute
 helpers
Date: Sun, 15 Nov 2026 19:39:59 -0500
Message-ID: <20261116004016.121139-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018070:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 8303785b-18f3-478a-2c6f-08df437a3176
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|10067099003|56012099006|11063799006|261026121527099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|7136999003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: mSuw4Ky24sJT4aKcPrZnY7Z/CsWZ9meXLib1r+zNLaVEr7EPZLMCmVDnockP9JQXrTdm7FvvaJL0AL7YD3nA2YKVBwUxtgzeC1Zu5w5RRcfrLzTAj18lSUFU6/tKgdQX9n2SD6ot2RjS9ddaqCwpifKvbyQq+sCEz4EDuDiUvV6URsH5h/sTvT7n0s0LP77R6R8wJg7yyvQ7uFctwurMOYyS/lKtQuGDMXKLSaCl1UfWiYQ2eBvM037K4WFDuXFDe28rBIBZpkQeMiyYEyNmuU9cW0CjqCljKcxQSKfIMRvyUM7kC1BV/LMjM0kBOet+Ha2WBqI4FcEl7/NPDxr5MT/PHQFbEH59t4y4hDDGWLB4WUAJxM4UZ6zGIuTGsLKxt5G/eT1XX8juVRltcOcivj8UErx/l5kiKa0XPJ6cfp4fL1UPV+7f8axXZI0KYYRvmqetVpGeYtsuYLUnFH6CKTIgglrDTlnbMiTdwHCjbLmd8DjCMF9ZxILPCZ+sGYTEkfG7J4G77QOHOWYoTLE3DqH0sXRRCJbLbBDZD+bcMIDCjkFUeBMN1j6u5nVVVqIspEjjgyUNJ0dNRaj+16Qchb7N+0wFB6q54MXycnQ3iE54BH6z97GnKDhfZp6xrbDGQ7UacvsSf33Y30M7BYhXq978OOcPezC98WIis6lnLkrjNXNqsP2EpEgTM4SD3JmNz2VydAaqYy3MDXP6YWmmaw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(10067099003)(56012099006)(11063799006)(261026121527099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(7136999003)(18002099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: kzk93tDBw/VwpezS4CYlM65fBUNBJwK5qaU5rdlekVoaAwl0xTgT8TptZhhOnRPyh81XlEIwTLj9VBBzeR5AHLRqpaSzpBaD45QNnc90ji4tFrrSskQdjBrNLFbKfPhEbYcbX5SvLAnQx+/ydfa4WLQLkyylUlgvCMI5TxO4RsYhcV8Ory2pQlrn5hp+OtkiPwKSKGsoagbHuundrzVoJfrfNH/GOOMgEtP5QucPQKBKkx45GHToWaaspBP2jlY7WaahZzedzqoGUUYocvRLaf8lDsHptQGSdkDasExy7oZl7jBefDsxBtveGmG9IReLBsj2Z/K1+OsZYX31bMHkZDKGYinW1TUrY7ocLwAkuwOtUqlMlhoW75UdIVqrdzPxebg6fZaZkB40fyojF7BgyuZSAhK8kuhAOk9Lu/7RR/+o8c5NyZRQi0JgxR6wgqsh
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 00:40:20.4413 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8303785b-18f3-478a-2c6f-08df437a3176
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018070.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Junhua Shen <Junhua.Shen@amd.com>=0D

This series refactors the AMDGPU test command-submission path and adds reus=
able=0D
compute-dispatch support for memory and submission tests.=0D
=0D
The first changes define a clearer ring-context contract, remove the comman=
d=0D
context's ownership of caller data BOs, and make operand residency explicit=
.=0D
Packet addresses and legacy IB sizing are then derived from packet paramete=
rs=0D
and PM4 capacity. A constant-fill packet carries the caller's fill value an=
d=0D
guards packet sizes.=0D
=0D
The test updates use the queried compute IP version rather than inferring a=
=0D
generation from family ID, query the KFD aperture node count before filling=
 the=0D
array, and replace the old compute-dispatch verification path with a reusab=
le=0D
single-DWORD copy helper. The new generic dispatch helper is driven by call=
er-=0D
provided shader and resource state.=0D
=0D
Patch-by-patch:=0D
=0D
1. Document the input/output/ownership contract of amdgpu_ring_context.=0D
2. Remove external data-BO plumbing from cmd_context; register resident BOs=
=0D
   explicitly and size the reusable command buffer from PM4 capacity.=0D
3. Source packet operand VAs from packet parameters and size the legacy IB=
=0D
   from pm4_size, not transfer length.=0D
4. Add CONST_FILL, pass caller-provided fill values to packet builders, and=
=0D
   reject packet sizes that exceed the supported limits.=0D
5. Derive compute-dispatch generation from queried HW IP information and li=
mit=0D
   cache-invalidation tests to the supported Arcturus ASIC.=0D
6. Query the actual KFD aperture-node count before reading the aperture arr=
ay.=0D
7. Add generic compute-shader dispatch and a lightweight copy_dword helper.=
=0D
8. Use copy_dword for amd_mem ptrace verification and remove the obsolete=0D
   execute_compute_dispatch implementation.=0D
=0D
Cc: Christian K=C3=B6nig <christian.koenig@amd.com>=0D
Cc: Alex Deucher <alexander.deucher@amd.com>=0D
Cc: Jesse Zhang <jesse.zhang@amd.com>=0D
Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>=0D
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>=0D
=0D
---=0D
 lib/amdgpu/amd_command_submission.c             | 444 +++++++++++++-------=
----=0D
 lib/amdgpu/amd_command_submission.h             | 102 +++++-=0D
 lib/amdgpu/amd_ip_blocks.c                      |  20 +-=0D
 lib/amdgpu/amd_ip_blocks.h                      |  59 +++-=0D
 lib/amdgpu/compute_utils/amd_dispatch_helpers.c | 348 +++++++++++++++++++=
=0D
 lib/amdgpu/compute_utils/amd_dispatch_helpers.h |  83 +++++=0D
 tests/amdgpu/amd_dmabuf_unload.c                |  15 +-=0D
 tests/amdgpu/amd_kfd_dmabuf_unload.c            |  23 +-=0D
 tests/amdgpu/amd_mem.c                          | 292 +++++++---------=0D
 tests/amdgpu/amd_remote_mem.c                   |  20 +-=0D
 10 files changed, 985 insertions(+), 421 deletions(-)=0D
