Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF40CC83013
	for <igt-dev@archiver.kernel.org>; Wed,  2 Jul 2025 05:47:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 678A210E63C;
	Wed,  2 Jul 2025 05:47:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XenUF6bH";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D3F510E308
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Jul 2025 05:47:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b/SFJD3cFZlEW3DIHJTshAgGUy4e4URCNIygiYLedsF4xRhSCZWD77cJONZ9PjtEtSYXnxOspFTSnm0FGsY6OSPAdJ3T2Pn8xGwWVoL2W9qTb+7x3/+NNzyCJ6mcEYNEnUv3G8DNS8sFDfyJtHs1HTi2IDQKIhAHpvDdCDFjxR/vRiBgmHEtXGTKYUbDHVWc4wXn+wafkWcTGh+QY2liqE1klzXdGDtN72SUAhG3A1CQsBfMJVocDu33remkS3JqFnO7efdVcjEV/ofG+EWZ6Jej6sqPhfdyn4uK49lk2yY4sbMiyUtXZnLGBCKzwNJU/PzRlovLPju9nZUf0hF/4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ8qwCkpc2p+4yE1YHMewZzmi2sOpq4LVjdgU6N5vnw=;
 b=fmLLXwEqCyBWuO56NYqDIVxwz4dNSrdtWUeT/rbVBjH5atvxIx9XefrJ0rtFkWCskwCH8tndhVzFPB5CDVukO3aTP2mcEBKSkfKYqhnEFck7/qY8ex0sw9QpyzKB9338KN6/MKmWTa3aCG/TqaSpw/JKwm2l/Vm1i0rO4z/lPwuyvLE1qtZgkG+a/EvVEJFh7FVc3x1a4Vwsl6TK/VXPVnH8uBD8p3JfxqZRul1uu5HYMhu4P7s/POpiMzR0gC4xK+T5zxGEgJKfPGFU7LLOBNkyJQFwTwHsFYhbdOAq3yelMWIc+VRj7wDS09dM3K1YZZRUDv61tmJgH3z4Q35LUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ8qwCkpc2p+4yE1YHMewZzmi2sOpq4LVjdgU6N5vnw=;
 b=XenUF6bH9jfHajY994vBFwjgv+KyDh5l+jI/E7YY9S5bC6md+FzX1VFpmtWOOxxZ2wHW+MTxhoexU38IWuy0oPjW7+icE6K+R9ThdfnIrfdApHdqB3u7fEmvTS7ZXKdwUnhN7i7TYoji9ig02iWmZjXd98DYUiQAmpa+wjGJ+1I=
Received: from DM6PR17CA0024.namprd17.prod.outlook.com (2603:10b6:5:1b3::37)
 by CY8PR12MB7435.namprd12.prod.outlook.com (2603:10b6:930:51::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.31; Wed, 2 Jul
 2025 05:47:37 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:1b3:cafe::fb) by DM6PR17CA0024.outlook.office365.com
 (2603:10b6:5:1b3::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.29 via Frontend Transport; Wed,
 2 Jul 2025 05:47:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Wed, 2 Jul 2025 05:47:36 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 2 Jul
 2025 00:47:35 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 2 Jul 2025 00:47:33 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 2/5] lib/amdgpu: Fix SDMA user queue submission by
 using hw_ip_info from ring context
Date: Wed, 2 Jul 2025 13:47:10 +0800
Message-ID: <20250702054730.366888-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702054730.366888-1-Jesse.Zhang@amd.com>
References: <20250702054730.366888-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|CY8PR12MB7435:EE_
X-MS-Office365-Filtering-Correlation-Id: f390290a-cd32-491a-f01d-08ddb92bf2a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oI7K73O5HNi60Vy7N4W6WTbJXekrqyIls/23RqSxemqHqMK25NW1f8s9EBD3?=
 =?us-ascii?Q?wxerI+2JMWSVwDkPHX7/ydNPeiVavvJHuLwTpvZdE8Fo7RIJ5dgYo6U7FtQE?=
 =?us-ascii?Q?pBFiMoVkoYYyIFfWpasbDBnFVWgKTpeU+CbzFgulUM8MZxK05l+s0KEr/9ZF?=
 =?us-ascii?Q?vXLk1lpO4xVkvKK6PBxfRVz+4VXx4nFHrjD4MJh4TRR+s8OhmuMjmEADCdTn?=
 =?us-ascii?Q?E8Ba7Rggjv/EeNU/wf6qPMeIURQcirzRAx1b8JfR2rfZHCmEGOgPmMzjaUD/?=
 =?us-ascii?Q?tGTg6liFo8AHal8stn4mq1tqqHwICOzMX/c11bid63WhfkqmYS6bjPe2zWO/?=
 =?us-ascii?Q?ZZ8/jmUHo9ls2MI59vFOzsRgl9HEazcHfK1QMbp7hbwHl8iXlwH4KryqfjeB?=
 =?us-ascii?Q?1qaIHYqWmXVQVXjaF5JJiqnirnjvEFR+qBXom4BLo6CpVZalHsXrHB+LcOwF?=
 =?us-ascii?Q?wl+Dqydvw0SbdsUhXNnhkGpivf0VMnA86Q7GNAkuu/JBI+uVn0+PRGTFepPR?=
 =?us-ascii?Q?ENHdS3Zi/hKV2pCRIGU/SRHi9ut0ERZO1fTJje8lBJyc5P+ATEdtAWbn7G1+?=
 =?us-ascii?Q?L5M+ilVKTB4rVi6uyZX54ghB5m8wnXcZPiKtBwZ8QX8jw/NdpdG6onrKIrX4?=
 =?us-ascii?Q?D+YDX3Dz+LOg/b3SbpYMUmj5xd3NrFoJIerQylySumqZ21bQ+vSufQUG8k3u?=
 =?us-ascii?Q?llSF9YTe2PykM9qXZfyNJkqKCr1aM1/h6ISu73xF3+xHJsPMFMif1dbCfSm4?=
 =?us-ascii?Q?a8vG1GJ5QF+6JJYvRNu6oVnVtYqb3mmUL/5z6EeljeNo/O4T3X5EbKN5i+iV?=
 =?us-ascii?Q?JHUKFRvMGnIioiRGmhuJDfPB2W3qu1nQDPNlAv1LWBonnBTWvVQehsEEEOUW?=
 =?us-ascii?Q?P++hGickzER1Va9iMFx9cpqo/QY3/kuNwSqh8cjSi4FfF9dPnR/oNlw7jsK5?=
 =?us-ascii?Q?EvBz8WJigFJPAUbsGsPVfA5OyiN2CyT0/da6z6SEPYdKC3EOxATK9TemIrtT?=
 =?us-ascii?Q?7oe0+R6UtyLjClhORB+ZwUCgRP0+nqh8FbefaNMXa+NW5jMB02ukpwlLWSIR?=
 =?us-ascii?Q?Uz4sxxR88wgCEol6lDLifjuTP9T53iZ+XUf0eOTH1ZO7sWSHWal1f/KSehD/?=
 =?us-ascii?Q?l+hyXhJ+HvhC24HEyAOMc/FE6vJt36su0sUstfeapHtxUNcKkl+MEbcfoerw?=
 =?us-ascii?Q?ZFtQRLYj8haxPIx/01nchltUz6Bn8wa5u+LhG6GaxoQNiY6vHEnjb0d1DtWF?=
 =?us-ascii?Q?h1vQy5eTJ6sc1mJcfqotd48CDlTxs2ssCKLKkuzXOKbU2yF0Dpvh50A/bVfu?=
 =?us-ascii?Q?2O9Q6G+ft4cD/aJyhcEHBSNTSxiKhKVgwjvPoep9tN+gTr0mlgD8pMLHJgdl?=
 =?us-ascii?Q?edqF26X1aAFwRdcrftIP/rYrMHcKO1NJ+LaMqtIUmSWkEPJVA7eqpLwMR+Zm?=
 =?us-ascii?Q?3DjLxE3JPiAK8tXnr5iOoGV83kaxmVmDkpYKgy0tF/GZY+JdxZH2gcyb9S9a?=
 =?us-ascii?Q?2nFgMSszSFPI/q3ApzCMP5oQepy56woHPm0t?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 05:47:36.1149 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f390290a-cd32-491a-f01d-08ddb92bf2a1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7435
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

This commit fixes SDMA user queue submission by properly utilizing the
hw_ip_info stored in the ring context structure rather than a local
variable. The changes:

1. Remove the local hw_ip_info variable and use ring_context->hw_ip_info
   consistently throughout the command submission flow
2. Ensure the hardware IP info is queried once and stored in the context
   for later use in user queue submission
3. Maintain the same ring detection logic but now using the context-stored
   hardware info

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_compute.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 87faf8333..d53df241c 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -42,7 +42,6 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	struct amdgpu_cs_request ibs_request;
 	struct amdgpu_cs_ib_info ib_info;
 	struct amdgpu_cs_fence fence_status;
-	struct drm_amdgpu_info_hw_ip info;
 	uint32_t *ptr;
 	uint32_t expired;
 	int r, instance;
@@ -54,7 +53,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
 
-	r = amdgpu_query_hw_ip_info(device, type, 0, &info);
+	r = amdgpu_query_hw_ip_info(device, type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
 
 	if (user_queue) {
@@ -64,7 +63,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 		igt_assert_eq(r, 0);
 	}
 
-	for (instance = 0; info.available_rings & (1 << instance); instance++) {
+	for (instance = 0; ring_context->hw_ip_info.available_rings & (1 << instance); instance++) {
 		r = amdgpu_bo_alloc_and_map_sync(device, 4096, 4096,
 						 AMDGPU_GEM_DOMAIN_GTT, 0,
 						 AMDGPU_VM_MTYPE_UC,
-- 
2.49.0

