Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E9E606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 00:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=hVdoeg/6
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C3010E56E;
	Mon, 16 Nov 2026 00:45:17 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010060.outbound.protection.outlook.com
 [40.93.198.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867B410E56E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 00:40:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nYyWJaYE/t5PiaTuz1kYAmQxzeovOFUECJ0+dHWMTfYwhMfCDQnr/1E5P1ll3x73b2/kS3R1gA5XLSk8oOYzz4x/VjuuEb+YapIfEY506CqAaIjZ6eclE0ciZkUOHAh3pBOM1dvwIfcz87hRFOINhY1Y2qX4nitoHBpNxvyy5GkRLIIB+BJNCnIrAp1rNBLxCENcryo89gbfxEsJs+pej7ww/3Vz+hOoOrZ36SBMIxSARcmtnuh6azbcFg+OzvD6r9xiBENRM6Ga5BL94lXMUiN2ziVLkK4C3TK4jx1W6lLfvWOhPqkNEvN900ucNHQ1qGxCxYHdkplziitV3tSC7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVOZIB8rwKLop9VMRwuuIpCvmhgd24gAhht9FViIsoA=;
 b=VZIaUngRN/pQuNVLlVEREsuHWBDk5BNLtAtbDxU7qIyMknise/TH6WDvOF6GRNxchkESf5YeTAUuzFKosyLz2XJfl1RL+2eJkUwFZQAWTGHNBh+SDCnD0Xxz+Una2br6Ia4zXVa90ZGfP+OTHNpWVhNEJV59xJ1Ye2oSP1K6uc/dMWkkIF3IwXMyLZKFH5im3+yWJr2ZOcnzooqAWv5UzmJcI0ZIA48byyKEoDxM9r8lvCDr305lexE1rQ2SI40fe8c26crAu5rZ3evXjLOfE4bK1/TZdjjdZdpIIGckDjcBespNcCcIWP7WZf9xGiFZMZhD1V7b7ILPCWOoKzK1IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVOZIB8rwKLop9VMRwuuIpCvmhgd24gAhht9FViIsoA=;
 b=hVdoeg/6EAt9bQEm9srlVH0IStMqreoFZMLjipru+/gWpqhfuvNBzI5hmT114OMIcN/pcxCHCUfbB1lVBHWWyZjjSO1kmWIkLkohet8e9DpQopnCvWrmfQhJVm7pBS85WfkQoPEU6z8x5K8pMuMeqIit1Z0MSvpiKvGgGOFwofg=
Received: from BN9PR03CA0234.namprd03.prod.outlook.com (2603:10b6:408:f8::29)
 by DM6PR12MB4234.namprd12.prod.outlook.com (2603:10b6:5:213::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 00:40:26 +0000
Received: from BN1PEPF00018075.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::2b) by BN9PR03CA0234.outlook.office365.com
 (2603:10b6:408:f8::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Mon, 16
 Nov 2026 00:40:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00018075.mail.protection.outlook.com (10.167.245.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 00:40:25 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 18:40:23 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Sun, 15 Nov 2026 18:40:23 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Junhua Shen <Junhua.Shen@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 6/8] tests/amdgpu: query KFD aperture node count before
 filling array
Date: Sun, 15 Nov 2026 19:40:05 -0500
Message-ID: <20261116004016.121139-7-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116004016.121139-1-vitaly.prosyak@amd.com>
References: <20261116004016.121139-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00018075:EE_|DM6PR12MB4234:EE_
X-MS-Office365-Filtering-Correlation-Id: f77081be-5142-4312-6ab6-08df437a34b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|261026121527099003|261021121427099003|261021123027099003|261102123227099003|11063799006|56012099006|10067099003|22082099003|18002099003|261009223027099003|3023799007;
X-Microsoft-Antispam-Message-Info: Yu/DFcCJWsvD6+XVhACnya1DHvEk7pocg/3qcG5z2DlsARfoK4XGq0nmL6zl8PFEMrey4K8Yb0JHuv+TXVAJkxeSaJz0rNyYcZpXoUkR9V/5b03bt4qxiYWhD65bLtxH9W/OQu+Q74JqsYTonLSe0lHYNT5YjuoApxa9EzV4bibzwmA81F/PLQBOGDXezZ66hH2kQmonIACTm6NbRji/bZrrOXoSDBG3GT55SWZHtjo3qLie7tSJU3Bmuf3yLrUjy+mHHt9kwdoryDs67TqXUfctONGhRjJO/bJb26FKio0FBPqYI/AIv/r12FiJ3XowH6LguutcL7rlUAtfhTvqDDVKO+2NTBi+bdLY6Y+TDfqAg+bzM1FXgFqTn7kTqXJ75p2KE/jnXzRXGMoBnpK3BrZdS1qy36xXiIQKzM2kDEsmlLtxNATQIdErbbsmgLaPAm47ybHLFldLaTn8zyTJJhzx+GdMTpd4wOfOqC309wMvy2z3QYeQCS43fuIAAHllZ9gQxaEmvDfctpbFWDdtC4amV0NjpwdA6ZYUNafGZaVzGUaLb/Ca8b7pY4nmFywT0yiAoPiaJLh+JlU8i0HhlPbNph6AYfiz63tfoTWxt4/d0x/SMrwKjMpCRvsqSi5Of0TfGMW8zJjeBwbjearm9Vrb5XYb5TEZ1DdZxTrzjyocPnvvZLa7pkYcZ7O07KYx1AAGCQPMl0tr57C7nZn64w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(261026121527099003)(261021121427099003)(261021123027099003)(261102123227099003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(261009223027099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: CrP7trNq5nekXRazaUfuEPjhXOoJIQjyuBBC90PDzJQi+nSRokilb/nZoJE9DoX57o6JwDSzVw0gs4JKn3HMAGbtRRYKx12fEZg7msuu2Q5EogfBkNv80SaH0BIwV/366mhvs1nYHuKJyoeWWWPfODqq+B0VsREyrHb1EgiZu8bWyUYDMZSHJVLgEGx3tdaejqEa5gM9dnf0vmo5jkicD1PNAM3AoHr/ML7fJrK3kJ7UbsBB+wcPNn7qS167vdm19E4OfKvyZK+AroJjuJjouFSg805/Lfnnk/MlznubNPHa80MuLsTQ6oPHDy+8dddwD9/H4KEM0GmAuyCfwu19lmAdOMT5KfF0RYWet01ODQTOVXFuSORAKlL9iFd9AhNlC/qY9XAzK5Dhgb6/tyua7I1o9vNY5k1MZ5KKWZVSF9tEniD+BH5ERV5ood+K6zUm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 00:40:25.8750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f77081be-5142-4312-6ab6-08df437a34b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00018075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4234
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

From: Junhua Shen <Junhua.Shen@amd.com>

kfd_get_gpuvm_base() passed num_of_nodes = NUM_OF_SUPPORTED_GPUS
unconditionally, which the kernel rejects with -EINVAL via
kfd_ioctl_get_process_apertures_new()'s
'num_of_nodes > kfd_topology_get_num_devices()' check.

Follow the documented two-step protocol instead: an initial call with
num_of_nodes == 0 returns the actual node count without touching the
array, then fill up to that count (capped at the array capacity).

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Junhua Shen <Junhua.Shen@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
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
2.43.0

