Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2710C43458
	for <igt-dev@archiver.kernel.org>; Tue, 14 Jul 2026 02:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 790DB10E1CC;
	Tue, 14 Jul 2026 02:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UQxzk3hY";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012009.outbound.protection.outlook.com [40.107.209.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F94810E1CC
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Jul 2026 02:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OeZdEG0jLlQJx5sI8KByNiO5+wtNH1ZBsItog6TYPqAhFBc69rmNGCU3k6Ve/iDFi0DB5NCnXbsppJsNlcNFSUzHa1HxxcqnnuH4HZAu2BKLK0XaHnQNthWsuKvk88mle78HMOjSy4EY975y3XDYdePpD60VKO8vCFVpbAJcKhqP9Bgf4cR5MYYXCme0hguXuVjs74nnQ9D0nMkbdwGh53GQUyYEB8FY579a+UM0QqFhawRfnJd53rkbNN/IHZNeVKDJVk/47KCkYyn/I5kiS6mMxHCt9migwZ9+1hzhJxWsFOkF8uS2N6EKOZQt2f+aiMHcHlwE02gyced9ZorhJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=47S3TowoIAMO0viAyvkjAHc8fF8JY6NgFeUN5LpqAcw=;
 b=U5f1R1AUxpuDK1IKdAPslpKKxTivo9nd9TQGGND0iAZZmvhhildh18PRxJCgXVaROHmqRzVL0hytcdebcF9yJDVxrka72P9kkRVMwEShX9dMxEeuAFTuq9dxVahDnQ+ZmXYHVGq/3Eh+haAmYQuJzVKBk0MNrgiZgHKjYsPVj1j0+ciW9gLZ77PhIzn3Lt/mYxEvNpR89kIf6X84WWV6gwx915axjWYOB/N5xKeYzoIhjztXxS4lVAtXwcKNtcRoPYIIHe9d0AFUwCAhZYwMIlLqu2zr7Y5+O/9MepvIT5ZBQd7tORN0yoOFSTuapdgQR7+0yfOgN5bI5vVZuLELiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=47S3TowoIAMO0viAyvkjAHc8fF8JY6NgFeUN5LpqAcw=;
 b=UQxzk3hYJ4+9ogKE2hy5p7z8CkiZU+OL1WLczD4uKAy7OzOVq1RpxbueArgVkbHWaQAE7rZmaPJ+iV+blfAoFD+HtEVBUvNy0xb886IxzmPgndKF+bs/2+30pAdjkFFkGrU62cjkgYV/4a1+g9+LI1h+COtL26sZjIs3UVAMf2g=
Received: from MW4PR04CA0073.namprd04.prod.outlook.com (2603:10b6:303:6b::18)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Tue, 14 Jul
 2026 02:25:05 +0000
Received: from MWH0EPF000C618A.namprd02.prod.outlook.com
 (2603:10b6:303:6b:cafe::9c) by MW4PR04CA0073.outlook.office365.com
 (2603:10b6:303:6b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.19 via Frontend Transport; Tue,
 14 Jul 2026 02:25:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C618A.mail.protection.outlook.com (10.167.249.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 14 Jul 2026 02:25:03 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 21:25:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 13 Jul
 2026 19:25:01 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 13 Jul 2026 21:25:00 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: enable compute scratch two-hop test on gfx12
Date: Tue, 14 Jul 2026 10:24:28 +0800
Message-ID: <20260714022459.948948-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C618A:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: c7e27951-0e56-40d5-46f3-08dee14f1d18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: /bL2Mbgj6ETAvTiBxCke08YnbbxTeNu5pFYMKaNLLSVRt53VLfpWFIWwwLsdJoWmaDvn8wePq6KP1aQrsWcFPPJX0z9CjF3m9PN3XwjDJL+/X5xBHbC4pMegWi+2AB3Jl76LlWZ8AkOfNFiqAapTzxLwBz/4nELurWVdSfALKgbuRaoQlgQOVUlkmokK+BCAB4x56IRENmE2mrCeRz1f9ZHQ5AV/DE9oOCiaOM7S7dYef1TOfbbGEA5cUHMa3xI92X4Cb53206HrUOgjzZw7rVaE697tszMpG0KtnlH841ANk1TPhsYsqqP1Y8IX/d6rCmjU5AoKXBff+IxYB5PL2+Bu0KXNz7BSWGs1EkftVZPB1Zd4CzSibRqeni4gWbXYue84Wb8Tx6LkOIxdI/EPvGo1XYZ3VRaq9pOlRm5pdAERMzTD5tkRI6Jlm1TcN+dyEQdE95lYtz4cxbmHw/vdaPbWwGkgx/uPoycAmTweOOnhRBx+JBCz3mz7AhYoqOsBzA2mdWjznCFu90j23pRNuVAxKRunKEj0kMIr9jOLN0M9V9F2dYygzaVKoYoMk9rDQY2TctKjU8sLgevvWxWC+ndux6N0d4kqQo0zFeLRYbnGPSonMjdTJHLZuZ0ABIO4EaQvXDCWMNq2YQxw4sVPKnpCpCPbh+SuJMsaYRgnLUkgXyLhkJvljG3Fg/xBThD1YXpGEvwNeUSVvBLrJKpL2A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 9RWphyJmRF2ejTpWWi9nC+62U40sWc/F81Afln8bsjSE/tENnMc1QXKPtvXJ18swvDktUm0vY5xyqo7Wrg7vF76iE3orGANZ8mZrEf1q5E+vnntdic+tW3BLCTMmX5wTGwJG99/2JKDpbPSfwAmFh9Aww1cZkwiEY6v6RHcGZMhGgGNk9cp3AQaHcZL0cCKfmdYco7LxtfY6TEanM5KRJDkIaTNwe+/RnzLcy5MzG4FqrYa7TXcYM4ced6qcLl7f1sYXI/MGUm73jGCa1C7GcH8x7fxAHNVQkGCYDlpvgCSp0dXkR7hfOO+TlRw7H8aMNsj7J62pLted8MnKOK9/iMfVw7KFnjWWY0WLiKq8KPmoIMKMAAWbCV6WVkhCozS/DQe8rIqR2Xvh9A6vMXr0ikRkw2A9VpS3uIFHQO8NH/dR+VEkns4puosBDDkS/Zin
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 02:25:03.9182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7e27951-0e56-40d5-46f3-08dee14f1d18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C618A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
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

The kfdtest-style FlatScratchAccess two-hop scratch dispatch was gated to
gfx11 only, so amdgpu-scratch-test-compute-with-IP-COMPUTE-UQM ran empty
(vacuous SUCCESS) on gfx12. The shader (ScratchCopyDwordIsa) and the PM4
emitter already program the gfx12 scratch path (COMPUTE_DISPATCH_SCRATCH_BASE
HW-loads the read-only SCRATCH_BASE; shader uses s_setreg HW_REG_SCRATCH_BASE
and FLAT_*_NSS scope:SCOPE_SYS), and the kernel now exports dev_info.scratch_base
for gfx12. Un-gate version 12 and reuse the same emitter.

Verified on GFX12: two-hop round-trip returns dst==0x01010101,
using the kernel-reported aperture 0x0002000000000000, no faults/resets.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 926690f13..6f0d031a1 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -458,7 +458,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
  */
 #ifdef AMDGPU_LLVM_ENABLED
 static void
-amdgpu_emit_scratch_dispatch_gfx11(struct amdgpu_cmd_base *base_cmd,
+amdgpu_emit_scratch_dispatch(struct amdgpu_cmd_base *base_cmd,
 			 uint64_t mc_shader, uint64_t mc_scratch,
 			 uint64_t arg_src, uint64_t arg_dst, uint32_t num_waves)
 {
@@ -592,8 +592,8 @@ amdgpu_scratch_dispatch_test(amdgpu_device_handle device_handle,
 	uint8_t isa[4096];
 	size_t isa_size = 0;
 
-	if (version != 11) {
-		igt_info("SKIP scratch two-hop: gfx11 only, got %u\n", version);
+	if (version != 11 && version != 12) {
+		igt_info("SKIP scratch two-hop: gfx11/gfx12 only, got %u\n", version);
 		return 0;
 	}
 
@@ -676,7 +676,8 @@ amdgpu_scratch_dispatch_test(amdgpu_device_handle device_handle,
 		/* Generation-specific scratch dispatch packets */
 		switch (version) {
 		case 11:
-			amdgpu_emit_scratch_dispatch_gfx11(cmd, mc_shader,
+		case 12:
+			amdgpu_emit_scratch_dispatch(cmd, mc_shader,
 							   mc_scratch, arg_src, arg_dst, num_waves);
 			break;
 		default:
-- 
2.49.0

