Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23519C79F8C
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 10:49:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B55510E147;
	Wed,  9 Sep 2026 10:49:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="eU9B8Hqf";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010054.outbound.protection.outlook.com [52.101.201.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBFC810E147
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 10:46:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nFeeW2BuVN5dd7cL+RBTO6Z19bEkM9NRgfZcQaKwnPcUCTEvMSom3uBTvOhVpAMD9JeekEAdVotTIyam5l/DyYhHGQr3+NnKjVqX2e+j1Tt3p646OrUGawiEAoGK2RMBYSaxwhqSfUA3UYnIpXODtJIYPZl0/eVCWg6/p/Kwmh1h4h71wlVzBVcbOn9bVIXSYvDYb2bDOIuuG7VSAgwJQBZnqXsSlO2yP6PG2TADCn8pCVM6ugd8LCCCh+pepQY+k8wEwqFCeLiWFxqqBx0h463vWfczu9iWm7qlTBBHuwzxVpT0f5sXOT+a2Q/G5liOl06gGF8GD5WQBNIuAz5Pqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gi9sLZ+uWJN9+D54ym6DjAJLVM8sLRSRD6t7PxVw33I=;
 b=L+3LwxtDvAt0n8BdY5dMvZUt8D8ZcLOTtGgGiNQIftuy5nfZ1+HW9h6I5P59ArlNryNqDrKecE9RjZmDxRr8FJJyMiVEwH7T180xh5+1XlOkigrrH5VMbM9ibcUnMEScK27jJgR/GdfnKFcvfJjiLyTch/Un/2d3jVwavdG6NNvk2PHP96vJ/EwPYMFRfCB2evQbpkBqnl1GToMEbL5IHa5Gi07ipBvMH9ingQPsTk+wCahRCPGQ/IrKQGldvaM54J5QKmjkI2uZwlI7L93M5XwKEIGiw4tB3uFNj1vFGRz58ZNLL/bHDSZ3GD11PbAH+wBGczxVwPz+DOGh5eA/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gi9sLZ+uWJN9+D54ym6DjAJLVM8sLRSRD6t7PxVw33I=;
 b=eU9B8HqfJZBrtMiePhAm13pX5lyZR7/d2WQC+MuibTEiRnUgCLTa52dLC18eRW4fFB6YjVFI7figntdf7qOt1OIXPA659wcQ1UgW/94/68QbtlrtYa9kEpVrM1fMBlDmkSyDx0tgzfQiJhPTyuF53rhYZiYGbQqD/x5g+x48IPk=
Received: from SN7PR04CA0080.namprd04.prod.outlook.com (2603:10b6:806:121::25)
 by PH8PR12MB7375.namprd12.prod.outlook.com (2603:10b6:510:215::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Wed, 9 Sep 2026
 10:46:25 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:121:cafe::15) by SN7PR04CA0080.outlook.office365.com
 (2603:10b6:806:121::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.6 via Frontend Transport; Wed, 9
 Sep 2026 10:46:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 10:46:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 05:46:23 -0500
Received: from junhua-PC.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 05:46:22 -0500
From: Junhua Shen <Junhua.Shen@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Honglei Huang
 <honglei1.huang@amd.com>, Huang Rui <ray.huang@amd.com>, Yiru Ma
 <yiru.ma@amd.com>, Junhua Shen <Junhua.Shen@amd.com>
Subject: [PATCH i-g-t v2 6/6] tests/amdgpu: query KFD aperture node count
 before filling array
Date: Wed, 9 Sep 2026 18:46:02 +0800
Message-ID: <20260909104602.13807-7-Junhua.Shen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260909104602.13807-1-Junhua.Shen@amd.com>
References: <20260909104602.13807-1-Junhua.Shen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|PH8PR12MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: e14d10a7-37b1-4216-4705-08df0e5f981d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|22082099003|18002099003|11063799006|3023799007|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: WcxHnN84i2ehrcFGItRki3YDdV4QD86xP/saU930xbfDQMTJzXVMi7s9F9QxrcVR5b0FjzqjUXPUl3jtmSIjHzV9ULFfV0e3SGi4PGqCqhksNk/EM/A9hyvylPhsXmPvgSHhlR98klREm5YIJInyuASrhCuzXc+mlVVG2A3CC2ZQy6kmh7HUqAHXWs7WbqEyIh3muKkXVQ/oTCFfYnuBasaujunzNqoEdxBJRIDgEKnA8Gaog89WApHBhmm0G+pPAqDdltvzdZfC1zyzk1D7B1Vg/im0esezxJ553SO/GseEyVaMxj3ZHCPhlwTOro7luUDf3SX2FOBqHpq5sTkLnKVltlavwDd2bE+AURQkNj8i0Np/wZ3o2pGGhqt+flIfTlWnzPDPV6bVafiB+UQwh8lY50VcNEuEMwgS90w27iqHIYjfC88A0zdbXgeJb4vK96IvV9LKzXiLzY/C3WiRU7QvwJSv/nG8aTZmzjkgG5jE8vEnutcvBgujo++sfyLfZJ5TQiCEGGnEkIDs0zgf4TbxxeWXKODO9MAgX50PdFPDWIjqrKF0VxH/N1OoOq/L6QkfgWuohPnB/5JdegEtZ/htHnOYc3I81mRp7+PCkF6YFePwBJomfMLUgLoHgTMqcZGl5ZSlGoD1LodhXJnNzqABxiqF7HiqLIOEXMxfHDjwQ7QjsUqNSFpCy8SfQjiTBofVMKa0NC3hIQjmWXSnSQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(11063799006)(3023799007)(56012099006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3ZuwQy6d8OPkwKwzxjdhjrVwRjYRBUMvcbC+r81oQwR+J7LnnIDsX74CNQKDIGEUYQ88uqB23gypMLl2oXWj5JXbloVCaMXu+NAjvGoJRi46HWzjNRFbRILmzvyeG2Q+ulq2eyRy52gD/zuC45ob8NeuAQiefMrMAeZMDW3W5WVKFJFw3B7vjsY54Lfe14j9BYU3YyhcNFPrO9VN9QzIjVpa7Rnm3UycdlpgiEPEbqla214gcGyg6xYen9vbP13E8D6ku5/OWxd/Ar+unCJ05Txc9Gc8G0T5bys0mlkwaHNE395BAUbOseV+1P/ar96Ixkxjy+0KCBdrFrw5g2yK3mWsDrcInCBmrekH25vqx3hzGgXULa3yFZPs0Em5/MnSK577PshXl1uoIUqdkt4fHztNoXLWoP6nEzOq/WHLSxZ5mvNv3aToRhVOToOBVdH7
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 10:46:24.6008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e14d10a7-37b1-4216-4705-08df0e5f981d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7375
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

kfd_get_gpuvm_base() passed num_of_nodes = NUM_OF_SUPPORTED_GPUS
unconditionally, which the kernel rejects with -EINVAL via
kfd_ioctl_get_process_apertures_new()'s
'num_of_nodes > kfd_topology_get_num_devices()' check.

Follow the documented two-step protocol instead: an initial call with
num_of_nodes == 0 returns the actual node count without touching the
array, then fill up to that count (capped at the array capacity).

Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
---
 tests/amdgpu/amd_kfd_dmabuf_unload.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_kfd_dmabuf_unload.c b/tests/amdgpu/amd_kfd_dmabuf_unload.c
index 28caf8982..f0d076910 100644
--- a/tests/amdgpu/amd_kfd_dmabuf_unload.c
+++ b/tests/amdgpu/amd_kfd_dmabuf_unload.c
@@ -132,9 +132,15 @@ static int kfd_get_gpuvm_base(int fd, uint32_t gpu_id,
 	struct kfd_ioctl_get_process_apertures_new_args args = {};
 	uint32_t i;
 
+	if (ioctl(fd, AMDKFD_IOC_GET_PROCESS_APERTURES_NEW, &args))
+		return -errno;
+	if (args.num_of_nodes == 0)
+		return -ENODEV;
+	if (args.num_of_nodes > NUM_OF_SUPPORTED_GPUS)
+		args.num_of_nodes = NUM_OF_SUPPORTED_GPUS;
+
 	args.kfd_process_device_apertures_ptr =
 		(uint64_t)(uintptr_t)aps;
-	args.num_of_nodes = NUM_OF_SUPPORTED_GPUS;
 	if (ioctl(fd, AMDKFD_IOC_GET_PROCESS_APERTURES_NEW, &args))
 		return -errno;
 
-- 
2.34.1

