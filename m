Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AE56C8302F
	for <igt-dev@archiver.kernel.org>; Tue,  1 Jul 2025 07:17:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B117C10E510;
	Tue,  1 Jul 2025 07:17:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CnKknAaf";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0909310E510
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Jul 2025 07:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dTVmZP1Y4DTKYhQjnBA8GIoL7WW6yOcxW+32wVuNXKu7AU0+iFHGSjhZY83eo+i8k+ePJdDYYRhMCvz1fC4aHFKrwU7iFcVkh4q+EHtWd7iCGapn8rhqvBb7PBhxVAJirlhZAOh7Li34VJ/PR3vBjtekt32Iqeu+LD5bHtYH1QvUcydLosIw8083+tRAga09tZwneoamkI7dugTLk/DqurwyxrocK65V4WaacOzNMH/HuJoEh4xd4D/4e2YHKrDFYSUYosifUziSILcLZB8Go8Gjif8HFtpPg7J0Q+o1E7otEpL76IiIbPnePON+TfO2sso5KpgDIhbquNbMXhL1BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QQ8qwCkpc2p+4yE1YHMewZzmi2sOpq4LVjdgU6N5vnw=;
 b=F/HJQFaehnKDqCWqByoSIeSvHpYdMoJnCpYO3+dPx24JVXFWi7HInUQ6jao8/vn1xxvq5BggrIs399O1R8w0FuN29XvCp4rHWrEUrlHeDqonL1jarqcf5U6aCxryLHZzfMvKfsx5NnLaCGE2u9Ex+1AICfKAFpKXbULLiJEvxJ2zJfb0DDqjgaNYlG0obKxgUe2i2LBAJcoAvwmKdbpIa2hcT31zE0SEk3MMCV1W3YCHA0GH5M2lcRLa3kiFCUjLwRx+TqEEEclGm6LqglIJA0odJYZsUqchs4xAw2QwiNqFyQg750w2HQfTYTg96Sm2lTcOZtWVZOjKjkdrPB2lMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QQ8qwCkpc2p+4yE1YHMewZzmi2sOpq4LVjdgU6N5vnw=;
 b=CnKknAaf4dKtToiNi7y3Qg1CCB+SL3j5dPgaU+YComEdH+HsqwdTI487zfoWhK9jMY8BWqVt2BW2qfhn9aYIYf2eyRrfE2ED5T5ban107ZnXuxxPnnQOX2Hf2vq40AsvPOUBCfyS9ip9LpXwVDh69ODBihJo58PxUVDjci0G9PA=
Received: from BLAP220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::7)
 by IA1PR12MB9061.namprd12.prod.outlook.com (2603:10b6:208:3ab::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.25; Tue, 1 Jul
 2025 07:17:26 +0000
Received: from BL02EPF0001A0FE.namprd03.prod.outlook.com
 (2603:10b6:208:32c:cafe::d4) by BLAP220CA0002.outlook.office365.com
 (2603:10b6:208:32c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.27 via Frontend Transport; Tue,
 1 Jul 2025 07:17:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0001A0FE.mail.protection.outlook.com (10.167.242.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 1 Jul 2025 07:17:25 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Jul
 2025 02:17:25 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 1 Jul 2025 02:17:24 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2 2/3] lib/amdgpu: Fix SDMA user queue submission by
 using hw_ip_info from ring context
Date: Tue, 1 Jul 2025 15:17:21 +0800
Message-ID: <20250701071722.226903-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701071722.226903-1-Jesse.Zhang@amd.com>
References: <20250701071722.226903-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A0FE:EE_|IA1PR12MB9061:EE_
X-MS-Office365-Filtering-Correlation-Id: ff575dbd-50e8-447d-20b5-08ddb86f54a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aDT5wuHc5rTi62+63+z4sXg0a+LIny/VEmGaqUNMHrs+yYc3D7GLCEhEyDjL?=
 =?us-ascii?Q?9wVU6nDipI0lR6G3gZlFFOj2XQKi7gi3VziuWzLtsvg+Jbzwu3kkZSrkLa3E?=
 =?us-ascii?Q?MKe5fmA0FeBjF5nwpDFMdmNOYsO6MLpqxRT/3cDBVGfWJcWxW77nDSvPC/JX?=
 =?us-ascii?Q?p6Rt/NEoO2ILr4cARFv/rYY3PI2Vd6Z6/F3ZTbtWpjnn3KiB1kZWLPeTPmWh?=
 =?us-ascii?Q?SRxjPgi5JErL+dpJ88t1KkD3g55q1L10EM6vFZMINCC0wzLcM4wlM2F1aaa6?=
 =?us-ascii?Q?k9wqIUhaiyS25JFpfifY5MzD2jybarrdSGS8GCCC+jnwZ/LvLafAIdmNtaWu?=
 =?us-ascii?Q?Tb1AX2EseavGNwkRxoIdZ+YWtuuIQaY7vpDu0jIRJwnLtLznFZLQEGq1gNKO?=
 =?us-ascii?Q?XEPU5SFgEAX85f7kNqor7mmFvF+/rpoTIkGkXHRZpC3bO2BQXjxToG8+1gq7?=
 =?us-ascii?Q?zwxAoUURnq//ieeLzFJn0tzXXfd/ffZQtlc0pq9tW0Dt/Tl2g4viUVcrtjj6?=
 =?us-ascii?Q?dTZfOmF8oz0yhCGjnrh8iCjWNuEVAKNvsUdUpZ6OP/PbCN71RolBbXdWbBE7?=
 =?us-ascii?Q?osqkVLlTA9Nze5vfSK6yfMxy/1puqSnHSTQLREgKHfLtZk1xuEc3iqBWgItu?=
 =?us-ascii?Q?1C3UFckAJxjERzGNHs5qGavCZUBSmsqz8oF5lKI07hyGzZ+HXoXW/4Sax9Fe?=
 =?us-ascii?Q?IxikwEs40RFBV9Q3kMi5IRoYCHgqCHYaoAAVs+SgwWTPxqanvuNvfEX8+O3m?=
 =?us-ascii?Q?7hHBXsp/8mos3t79Gd+EhXwm1MXFoB/DBagqGxB6MaPOnC9ujr/NdPmlz8OF?=
 =?us-ascii?Q?se+XMZqSlEJmTtraCVvWB3SWXE+aLyNbR4oemVr3DGGgsRPLTNMC3maXsF1F?=
 =?us-ascii?Q?NdAiLdQbj2MJm21QLdZiqpT1NL67/TPqiExyuUIzbGVTidyjFb6+3Rw9GaM6?=
 =?us-ascii?Q?oKhQe21BspWtf6xulMm7xBKnYxbTIfGmumzvZs/8F+WDaETNbcmU+fsEbnrd?=
 =?us-ascii?Q?mhUCV2RXKG/1LCIYvjH4FFzcP8Wt6AIFOYlCVjNLf5b72oA9958PvucmeKHY?=
 =?us-ascii?Q?y+q/wpVEkiVeAFTcsqeuCEKnEKTaLQw6zGayEwmA+DvM98j4n2kuY3yJAKvN?=
 =?us-ascii?Q?yYdU/nbDxGOsC2oC3Nn+JRa1/RmmYLQgGSolZ4TlPmbvTRO+qlTEquMc6+IP?=
 =?us-ascii?Q?3DkKlozPnk369psJ1cGNgB0DxqngcTxIkNz7GTv79NXUBHMNl8PGxAm3TRfP?=
 =?us-ascii?Q?C0woE401L+IT1wbIjyac9sJiECL5n4yfNGQZae5jbvkIIqd+hxZ3yxGNHahv?=
 =?us-ascii?Q?gQvkOvSF24S9xW1to20DPpE+ZRsz33Hjf6nGYjsolUPwirDyxiYAOZdlB+98?=
 =?us-ascii?Q?oTSjSGXLowytTMz0FAIQkDrGwQXlGRuwOuc6cekujGkThoLimXnPBOd2DQaH?=
 =?us-ascii?Q?Ztwiqt7Tv8NFzllVRJ+h6VrK32OsflHJDFdlhCuJPpsQeCluGBdB8x8xPURz?=
 =?us-ascii?Q?7EipAfNjQTArMm4KcccMy1Vnk3wp2vRszLBX?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 07:17:25.6899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff575dbd-50e8-447d-20b5-08ddb86f54a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A0FE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9061
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

