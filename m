Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 165E1C27C53
	for <igt-dev@archiver.kernel.org>; Sat, 22 Jun 2024 22:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9989D10E50F;
	Sat, 22 Jun 2024 22:52:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t1aTPRWr";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2045.outbound.protection.outlook.com [40.107.237.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3828F10E50F
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Jun 2024 22:52:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrZiZ21sa6CLrnvgHq2VW0AydE9FLfYRPkRKog3rVTen6oSg117pKyMkjLda4TeH3FsCrwElgZZh7UOlqLKQYaybeRA/+wP4iQcGLKwI3i6QNg7VGiXHNTkbsLGcjtAxBVHoAha9YvVgrNSWxXP6anuOTAaPH6i0GBS/tI9u6dWLbizoJD2ihPo9MxeBZ8as0XSIDJdvXSt4ZjWH6UT6wO12mJX2pENW23d5IB1Hw8urDfwwc+OfI9Z8tCqiVREOY7myIuhZcZ6ciZ4bghJF23mLzh0aSI1NFuDnyLuYlQoHUJJnvJoHIpcJSecjfK76dsRcW3ZFDZEdOS05Sj4dOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G58o0qJjVvtOf/yq7IE3m2G4gnvHTZk77evSMDiiMks=;
 b=cWs9BOP2W72a4pqh/R5e/DjkiYCJCMpdLJGjHS6uMLnqMp4rozYotuNNnk0j0dfr0uS4jWELa4GD8Hubb2BUPaKC+qKcE7m44g/oG8SVZIlUbmUolgjjIthZQs4qdJpKGo+pOvhIB40rUIoYz4LsgW8y+F0ocIRtLwFHX38eXqW+0PxwQ+m3JSo+bX+RE887a+6cq6BVNWgoNyORqRjHa8xxIm01A5HtzUL5X02vnSzPVP8MOTLR+H709FJ27FBXzL78NY8g3iotO4c2tnbltES0a9/J9FB4pMcGTL4pwDd4SDByksGx9yabhxb+Q+QV5ZxGxOifIhTGD7EWKJFCNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G58o0qJjVvtOf/yq7IE3m2G4gnvHTZk77evSMDiiMks=;
 b=t1aTPRWrrbPOd7vtFsefa73Lgt7WMbi4Vq+O50PSbrUijbmuxK4qvtG7e4uE5MMClaWN12qeFENeQST0bDmX5rg2hw5HQYtnii68yNcfST2ByZFx/mbiJWFIP623TxYIasWyV0XG4YL7QNEIY37nr/2pQqiH2MNABXH2zYvcFDY=
Received: from BY3PR05CA0010.namprd05.prod.outlook.com (2603:10b6:a03:254::15)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Sat, 22 Jun
 2024 22:52:21 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::f0) by BY3PR05CA0010.outlook.office365.com
 (2603:10b6:a03:254::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.37 via Frontend
 Transport; Sat, 22 Jun 2024 22:52:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Sat, 22 Jun 2024 22:52:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 22 Jun
 2024 17:52:19 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 22 Jun 2024 17:52:19 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: allow usage convenient chip info
Date: Sat, 22 Jun 2024 18:52:15 -0400
Message-ID: <20240622225216.108985-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: d8df3ce3-d2b7-46c9-e50d-08dc930df971
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|376011|1800799021|82310400023; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tIaWFJBbnA1ytkbNLJujhY+geNLF6z7mp5TNrwyg1yrbTD4eFNg7bDqd44Gt?=
 =?us-ascii?Q?r/K+ZoSOhpT7/XI1ze7s71FLzwbymUabh3JJ/7nhPjlh2CRoesC3RPud5A3A?=
 =?us-ascii?Q?2mTNsW0HBx6IkCAGD5dpLLokk49/qIfyMFR6lifKHKhB7dvqRuWB0CYzfzB3?=
 =?us-ascii?Q?IL4MoVqAWXCN2PsTbr4z0wDATsL4BLww7NyLeDeYUq4iFj8LLG/OXGzij057?=
 =?us-ascii?Q?5Wx3FPOhmKvyEnzPMfUWa0WKD4l1xo1QOCJeJWefIEWXN03OIqJPJpKBO+Q3?=
 =?us-ascii?Q?/MirEoy81G6WxmfOzTYM836Chab64n3YLjITn3tgz3AfmmGfb4OYSHuSozmB?=
 =?us-ascii?Q?VcLp4fxANVjTXxd7RqyI4vjFxfIvDZ5UE1GLZBRTEDi0ZQK7Obu6LSBLnf7k?=
 =?us-ascii?Q?xLvRTd26mmXuPFehunZ1YOuALUTRZmapnvT6kqAtuD1asFF2wYSjDB1TeYTM?=
 =?us-ascii?Q?Ag2WpuuE9UV1Yrjpzmk9x9r5QQaujzQCHECOz+kkp2uTnVAVbn4qBaofi7qu?=
 =?us-ascii?Q?ROvDIa8ENYc69utPZWjAOoHZNlO95RFQ3FdGm0PunEftwWhkn66lEclIpnZB?=
 =?us-ascii?Q?1MJqHKG06ijMWZRG7dGG5maR1r4A7Ojutbe3f0d+xW8baNaFBcL+YGozIcpB?=
 =?us-ascii?Q?04HiNwATpAOa5J7w8FbLlf62Dt6DpOqpBDdiSMYKm4ihyi6FX00I42w9xoHQ?=
 =?us-ascii?Q?aLUYO3OtMcKkLyMdKkYf5vhOxqOOaVRejgyKunukmvA01ph2l5jRakDn5JRj?=
 =?us-ascii?Q?BUZ6J4EvN5tT+oRrSzJ+siFZDCHDsx51ZORS5jOBWvLf5c9HVqoL4xZSl7MO?=
 =?us-ascii?Q?rD1nrNu31vRgsmUtSQeqGxvLshQBBin5YRn4JVId4Z5QDFsIn3X3mDEzR4GS?=
 =?us-ascii?Q?MgNmDwYVoU4mbk6BL8IT43D0+J1u8IEqjNn3F1UymUHN0tdKsbhsCTY9a3Wp?=
 =?us-ascii?Q?Lc7B9uGLViheb0cyUZMZyQOELQIItuedNZGr53RCo8J9eRmSTx6CvhTosXBM?=
 =?us-ascii?Q?yPFxcxRQfiK63Dgvp5bltMHc6lqEKm2LX2lm+PXHTxKWHJ5SIqZLW3HEtLpD?=
 =?us-ascii?Q?uisFBV7Kn9XtJDwM7Nr8x8pGAbRnHisV5s4PdI9JYsISt5qS/b9/YMKorARt?=
 =?us-ascii?Q?b6CtuHV3ggBpaIkJzix95hBe0WGlst1A11cUzuDm+xSLh/Kj5RV3AwQKIiOe?=
 =?us-ascii?Q?CFXG171ryGQhf9JnHGuvbxZ4Cq90fOOPZM8ezXJzsPJgvsPuNrWh9w7ZWDzO?=
 =?us-ascii?Q?lYaUumfxihkRuqlk7SAgoWZeO0zT6Zk5lB4b85j2Zv8NghGeWMmmdBX6w7kJ?=
 =?us-ascii?Q?gC9ZcokKdajNXLA3n1Mp9FOvDCB6hA//Hq60cfogCf02LJoUBqrCrgX409zw?=
 =?us-ascii?Q?9OCXcdpIU5+AFTMGR2nyv85YXNgvfpkeGNCxHAaSZcYuoXEBDg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(376011)(1800799021)(82310400023); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2024 22:52:20.7210 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8df3ce3-d2b7-46c9-e50d-08dc930df971
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Make the struct chip_info accessible for use within the test.
The structure will be accessed through a constant pointer,
ensuring that no modifications to its fields are allowed.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 10 ++--------
 lib/amdgpu/amd_ip_blocks.h | 10 +++++++++-
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 2ee94105c..19e2838f5 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -16,7 +16,6 @@
 
 #include <amdgpu_drm.h>
 #include "amdgpu_asic_addr.h"
-#include "amd_family.h"
 #include "amd_gfx_v8_0.h"
 #include "ioctl_wrappers.h"
 
@@ -412,15 +411,9 @@ struct amdgpu_ip_block_version sdma_v3_x_ip_block = {
 	.funcs = &sdma_v3_x_ip_funcs
 };
 
-struct chip_info {
-	const char *name;
-	enum radeon_family family;
-	enum chip_class chip_class;
-	  amdgpu_device_handle dev;
-};
-
 /* we may improve later */
 struct amdgpu_ip_blocks_device amdgpu_ips;
+const struct chip_info  *g_pChip = NULL;
 struct chip_info g_chip;
 
 static int
@@ -617,6 +610,7 @@ int setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_inf
 		{},
 	};
 	struct chip_info *info = &g_chip;
+	g_pChip = &g_chip;
 
 	switch (amdinfo->family_id) {
 	case AMDGPU_FAMILY_SI:
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 97a9ad489..d4364d604 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -8,6 +8,7 @@
 #define AMD_IP_BLOCKS_H
 
 #include "amd_registers.h"
+#include "amd_family.h"
 
 #define MAX_CARDS_SUPPORTED 4
 
@@ -110,8 +111,15 @@ struct amdgpu_ip_blocks_device {
 	int			num_ip_blocks;
 };
 
-extern  struct amdgpu_ip_blocks_device amdgpu_ips;
+struct chip_info {
+	const char *name;
+	enum radeon_family family;
+	enum chip_class chip_class;
+	amdgpu_device_handle dev;
+};
 
+extern  struct amdgpu_ip_blocks_device amdgpu_ips;
+extern const struct chip_info  *g_pChip;
 int
 setup_amdgpu_ip_blocks(uint32_t major, uint32_t minor, struct amdgpu_gpu_info *amdinfo,
 		       amdgpu_device_handle device);
-- 
2.25.1

