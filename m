Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38FC5606A31C
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 11:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=YNyGkPTu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01E910F63C;
	Tue, 17 Nov 2026 11:17:42 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010036.outbound.protection.outlook.com [52.101.61.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F5210F600
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 11:14:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mRehxfHhD4EYyh6SkJzBhzmm3mT6zPA2wSAYMe03Xyb/26vqE0HxoHcbz+Em9MPfw6iopbebC6viQVbPyzyOkvsDUyety97XuMlIP7jd5KIPX10mmFD7bKlmkFUB8hhFZzM4Cl0sr4HSMkrwzba5GiQUahpQD4HYI7KzzLicBQcINXFXl0SWCBW4uPOY0tgIsYZTlHHUMR023G/47STSvABBCKCyBMSbU+JQvNylzPBehk3NIoQ96OhSLntgGDEWVfig+OT2q+fX+jtyQRIHHB69M+MwlJk0FxMLS75aoeupkC1z+mZMla+irZYD5ubyeeRok4AfiAqpjiRYRk9hmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvGgPjY+Y42QXldR+pZfCM2LPmwPXdcE3FC/XT5m7gA=;
 b=stti1dUaDxiHxsTHBeIJeFYG6TKESH8Xcux2h9Mo4gTclq4LANzbZQ/vCfxaYgEo21vI7BOTEkEE2kFHbrqpQ1hxtx5dK81kilRekfIL9YESnXofmXzXAo1r2vJdcxje7dsWRRKq+8lbH/pzycMqUABCbE61/1AGmOQFGIKM+JwlwT4UkdwmgSfMSa3I13L5755ENlu+IAmlWWxSZmm4AzbR3NttV1UggYa9Hsxd8noaKvIaHmrc/ea0x6eXjSnGBqVEroAeVeXuUTkxJk+LlZ7Lw7XjZjRD/j9xZJmaYWxC9UNsKpC9w29FDKJqt5rHcpXmPlaaNxwN2lqa0SUJIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dvGgPjY+Y42QXldR+pZfCM2LPmwPXdcE3FC/XT5m7gA=;
 b=YNyGkPTuA7mF2DDS3olNTZFpUNlOmQUBThxKv/CrsL8/kOMUfas7yY4GZ0pg+NJP2HPoGeBBDY2HvEakQK4JhqQpEL1bFHCOryjrVgTImcj3M3j+dwGacrn5ZV+6Wqqa50Cl/8L5XEWChrUyZdnftZXKD/JSxl+epX3TsXY7uVk=
Received: from PH7PR17CA0018.namprd17.prod.outlook.com (2603:10b6:510:324::9)
 by CH8PR12MB9839.namprd12.prod.outlook.com (2603:10b6:610:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:13:52 +0000
Received: from SJ1PEPF000023D2.namprd02.prod.outlook.com
 (2603:10b6:510:324:cafe::a7) by PH7PR17CA0018.outlook.office365.com
 (2603:10b6:510:324::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.10 via Frontend Transport; Tue,
 17 Nov 2026 11:13:51 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D2.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 17 Nov 2026 11:13:51 +0000
Received: from vpe-at2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 05:13:49 -0600
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Solomon.Chiu@amd.com>, Alex Hung
 <alex.hung@amd.com>
CC: Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t v2 1/3] tests/amdgpu: add VPE version identification to
 command objects
Date: Tue, 17 Nov 2026 19:13:34 +0800
Message-ID: <20261117111336.8130-2-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117111336.8130-1-chih-wei.chien@amd.com>
References: <20261117111336.8130-1-chih-wei.chien@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D2:EE_|CH8PR12MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 5589581b-e252-4ce6-8c3c-08df449bdc66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|23010399003|18002099003|22082099003|20052099010|261009223027099003|3023799007|56012099006|11063799006|261026135527099003|261102123227099003|261028144727099003|261026140227099003|261026121527099003|261021121427099003|261022113327099003|261022075727099003|261026130827099003|261022105027099003|261021123027099003|261021130227099003|261022115727099003|261021133027099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info: /lChJtdl/IpJbeUbUYvhOk2A1zXBJOu57GxkM+C3PMUt3Bkfzt+WWtwMfSt/tYXKJJ+ieatTibMufNAgMK1e9xswWofGi6RX2BvrLkDNSB5dZcfIeMMCYEoM14AAZOtpZGo/C0LsdwqJhijYmYj8ibcSf5mWg6PIPK4TEZM49IOt3VhWPpowf7ady1cGK+VT7Vgc2u9YXG+IpypKrkQmMs05PjDq+QDeryia2TFDSxSdqInMqeQU5S/wxCoDaoJC050dajK1MJbFoX0UQIJa12QWGPYd6UxU3vaB71moxDabIFgL2GeopRgbZ9aojdvScA7n1KC9aXhX0ddu1Yid30B5jlpH5nYEtebJDnEf9d558K0rArsPmoYL/pd2e3vBR57iAPyZiQmqIoa/NQMV38Tr6kjAF7L8iToGKjhDjHMwflYz1jVAaZVJ4EKYBryV/O/++d559uw+ygllNRiwV+rDv1Y5BTYGRwDFMNC5kKW8wUVmcXVq8Ps7U0CbOmyd4a0cdYIWXiPI1vDo3bfIk3YTsPlWLtERfZjPFGS3t5SUYYPkCE0FIvx1ZRHfSQwtCURY6dszVwPXPGdtvtLZVaZhTNI6fCEnaroD/UZ003YxU40wzcRJiTHLlQHJiGrxPIMp9UI/JZn/2a23bF6K+97dIqmhyRUMJTgu1waR9qHp7VIVmQ7qzohrD0qJgtJDVhkP9fsD/Z2gl6MN+R+ofA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(23010399003)(18002099003)(22082099003)(20052099010)(261009223027099003)(3023799007)(56012099006)(11063799006)(261026135527099003)(261102123227099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021121427099003)(261022113327099003)(261022075727099003)(261026130827099003)(261022105027099003)(261021123027099003)(261021130227099003)(261022115727099003)(261021133027099003)(261021135927099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 65Vrme8wqwKeMT/u81AVtjSH6Zud9gLDcF3Y7hZ3ZjpHF/uzDnrDZ+ZrLi6L3IifRSjXELSlf96nKr+5G6f93s68/pdGTSSzNLfCD/pKfX0zyqFrOhntBfZHxrhV7cty5viyGl3KLmsQouN4Ndqui/68h400zp2xwfTBZpV+4hlXuMsALCHcXp8CNdf0XyLFdgydRo2xjUOCJ/5nmEuJzwLbrX9zCIWss593DFE//SY5tTbCxDRX99FgtpF8lVIXvApDSCQXa1xyLAWTng43eg9ghWCFSvVbdgZ9UlYGG6nvKPd2qo+TOgqHv4Pj8AIaTu05FS4iV0FdVY9RAgDWilf8YeNjPe1WjpLT1BXIekU/rTEEUUoxdzBYAEbTfdiG7gI+JOCSnI0DOi0dXm/IT9xnNdHkTosEo/uQerOQav0DBhxka0iKAmS0iEMUHFko
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:13:51.7186 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5589581b-e252-4ce6-8c3c-08df449bdc66
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9839
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

As each command object is specifically for a VPE version, let's annotate
version number to its name, so it won't conflict with future command
objects.

Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
---
 tests/amdgpu/amd_vpe.c     | 28 ++++++++++++++--------------
 tests/amdgpu/amd_vpe.h     | 24 ++++++++++++------------
 tests/amdgpu/amd_vpe_cmd.c | 24 ++++++++++++------------
 3 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 658c3b8b0..ae76445af 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -152,13 +152,13 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 	const uint32_t pitch = 1024;
 	const uint32_t vpep_config_offsets[] = { 0x34, 0x128, 0x184, 0x1c0, };
 
-	uint32_t *vpec_csc_cmd = vpe_get_vpec_csc_cmd();
-	uint32_t *vpep_csc_cmd = vpe_get_vpep_csc_cmd();
+	uint32_t *vpec_csc_cmd = vpe1_get_vpec_csc_cmd();
+	uint32_t *vpep_csc_cmd = vpe1_get_vpep_csc_cmd();
 
 	frame_size = pitch * height * 4;
 	context->num_resources = 0;
 
-	alloc_resource(device_handle, &vpep_cmd_bo, VPEP_CSC_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &vpep_cmd_bo, VPE1_VPEP_CSC_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
 	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
 	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
 
@@ -195,15 +195,15 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 	/* gpu address of dst */
 	*(uint64_t *)(vpep_csc_cmd + 8) = dst_plane_bo.addr;
 
-	memset(vpep_cmd_bo.ptr, 0, VPEP_CSC_CMD_SIZE);
-	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, VPEP_CSC_CMD_SIZE);
+	memset(vpep_cmd_bo.ptr, 0, VPE1_VPEP_CSC_CMD_SIZE);
+	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, VPE1_VPEP_CSC_CMD_SIZE);
 
 	memset(context->ib_cpu, 0, IB_SIZE);
-	memcpy(context->ib_cpu, vpec_csc_cmd, VPEC_CSC_CMD_SIZE);
+	memcpy(context->ib_cpu, vpec_csc_cmd, VPE1_VPEC_CSC_CMD_SIZE);
 
 	context->resources[context->num_resources++] = context->ib_handle;
 
-	r = submit(device_handle, context, VPEC_CSC_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
+	r = submit(device_handle, context, VPE1_VPEC_CSC_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
 	igt_assert_eq(r, 0);
 
 	r = check_argb8888(dst_plane_bo.ptr, pitch, height);
@@ -243,8 +243,8 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	const uint32_t patch_src_luma[2] = { 2, 8, };
 	const uint32_t patch_dst_luma[2] = { 14, 20, };
 
-	uint32_t *vpec_hmirror_cmd = vpe_get_vpec_hmirror_cmd();
-	uint32_t *vpep_hmirror_cmd = vpe_get_vpep_hmirror_cmd();
+	uint32_t *vpec_hmirror_cmd = vpe2_get_vpec_hmirror_cmd();
+	uint32_t *vpep_hmirror_cmd = vpe2_get_vpep_hmirror_cmd();
 
 	frame_size = pitch * height * 4;
 	context->num_resources = 0;
@@ -266,7 +266,7 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	igt_assert_eq(r, 0);
 
 	/* prepare VPEP command buffer and setup command buffer data */
-	alloc_resource(device_handle, &vpep_cmd_bo, VPEP_HMIRROR_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &vpep_cmd_bo, VPE2_VPEP_HMIRROR_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
 	/* patch gpu addr of vpep cmd */
 	for (i = 0; i < sizeof(patch_vpec_index) / sizeof(uint32_t); i++) {
 		vpec_hmirror_cmd[patch_vpec_index[i] + 0] = (uint32_t)(vpep_cmd_bo.addr & 0xffffffff) + patch_vpec_offset[i];
@@ -282,8 +282,8 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	}
 	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
 	igt_assert_eq(r, 0);
-	memset(vpep_cmd_bo.ptr, 0, VPEP_HMIRROR_CMD_SIZE);
-	memcpy(vpep_cmd_bo.ptr, vpep_hmirror_cmd, VPEP_HMIRROR_CMD_SIZE);
+	memset(vpep_cmd_bo.ptr, 0, VPE2_VPEP_HMIRROR_CMD_SIZE);
+	memcpy(vpep_cmd_bo.ptr, vpep_hmirror_cmd, VPE2_VPEP_HMIRROR_CMD_SIZE);
 	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
 	igt_assert_eq(r, 0);
 
@@ -293,8 +293,8 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	context->resources[context->num_resources++] = dst_plane_bo.handle;
 
 	memset(context->ib_cpu, 0, IB_SIZE);
-	memcpy(context->ib_cpu, vpec_hmirror_cmd, VPEC_HMIRROR_CMD_SIZE);
-	r = submit(device_handle, context, VPEC_HMIRROR_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
+	memcpy(context->ib_cpu, vpec_hmirror_cmd, VPE2_VPEC_HMIRROR_CMD_SIZE);
+	r = submit(device_handle, context, VPE2_VPEC_HMIRROR_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
diff --git a/tests/amdgpu/amd_vpe.h b/tests/amdgpu/amd_vpe.h
index eb4a02650..9f7828b53 100644
--- a/tests/amdgpu/amd_vpe.h
+++ b/tests/amdgpu/amd_vpe.h
@@ -16,10 +16,10 @@
 #define SRC_PLANE_PATTERN	0x12345678
 #define DST_PLANE_PATTERN	0xff123456
 
-#define VPEC_CSC_CMD_LENGTH	12
-#define VPEP_CSC_CMD_LENGTH	154
-#define VPEC_CSC_CMD_SIZE	(VPEC_CSC_CMD_LENGTH * sizeof(uint32_t))
-#define VPEP_CSC_CMD_SIZE	(VPEP_CSC_CMD_LENGTH * sizeof(uint32_t))
+#define VPE1_VPEC_CSC_CMD_LENGTH	12
+#define VPE1_VPEP_CSC_CMD_LENGTH	154
+#define VPE1_VPEC_CSC_CMD_SIZE	(VPE1_VPEC_CSC_CMD_LENGTH * sizeof(uint32_t))
+#define VPE1_VPEP_CSC_CMD_SIZE	(VPE1_VPEP_CSC_CMD_LENGTH * sizeof(uint32_t))
 
 /* horizontal mirror commands
  * source:      1024(pitch 1024) x 256 RGBA
@@ -29,14 +29,14 @@
 #define LEFT_PLANE_PATTERN	0xff123456
 #define RIGHT_PLANE_PATTERN	0xff654321
 
-#define VPEC_HMIRROR_CMD_LENGTH	38
-#define VPEP_HMIRROR_CMD_LENGTH	1661
-#define VPEC_HMIRROR_CMD_SIZE	(VPEC_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
-#define VPEP_HMIRROR_CMD_SIZE	(VPEP_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
+#define VPE2_VPEC_HMIRROR_CMD_LENGTH	38
+#define VPE2_VPEP_HMIRROR_CMD_LENGTH	1661
+#define VPE2_VPEC_HMIRROR_CMD_SIZE	(VPE2_VPEC_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
+#define VPE2_VPEP_HMIRROR_CMD_SIZE	(VPE2_VPEP_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
 
-uint32_t *vpe_get_vpec_csc_cmd(void);
-uint32_t *vpe_get_vpep_csc_cmd(void);
-uint32_t *vpe_get_vpec_hmirror_cmd(void);
-uint32_t *vpe_get_vpep_hmirror_cmd(void);
+uint32_t *vpe1_get_vpec_csc_cmd(void);
+uint32_t *vpe1_get_vpep_csc_cmd(void);
+uint32_t *vpe2_get_vpec_hmirror_cmd(void);
+uint32_t *vpe2_get_vpep_hmirror_cmd(void);
 
 #endif /* AMD_VPE_H */
diff --git a/tests/amdgpu/amd_vpe_cmd.c b/tests/amdgpu/amd_vpe_cmd.c
index 5dbc2a83b..0ed7ead6d 100644
--- a/tests/amdgpu/amd_vpe_cmd.c
+++ b/tests/amdgpu/amd_vpe_cmd.c
@@ -5,12 +5,12 @@
 
 #include "amd_vpe.h"
 
-static uint32_t vpec_csc_cmd[12] = {
+static uint32_t vpe1_vpec_csc_cmd[12] = {
 0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
 0x33002384, 0xff000021, 0x330023c0, 0xff000021,
 };
 
-static uint32_t vpep_csc_cmd[154] = {
+static uint32_t vpe1_vpep_csc_cmd[154] = {
 0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
 0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
 0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
@@ -33,24 +33,24 @@ static uint32_t vpep_csc_cmd[154] = {
 0x0004aad4, 0x00000013,
 };
 
-uint32_t *vpe_get_vpec_csc_cmd(void)
+uint32_t *vpe1_get_vpec_csc_cmd(void)
 {
-	return vpec_csc_cmd;
+	return vpe1_vpec_csc_cmd;
 }
 
-uint32_t *vpe_get_vpep_csc_cmd(void)
+uint32_t *vpe1_get_vpep_csc_cmd(void)
 {
-	return vpep_csc_cmd;
+	return vpe1_vpep_csc_cmd;
 }
 
-static uint32_t vpec_hmirror_cmd[38] = {
+static uint32_t vpe2_vpec_hmirror_cmd[38] = {
 0x00000001, 0x00800000, 0xffff8001, 0x00000010, 0x00800080, 0xffff8001, 0x008000c0, 0xffff8001,
 0x00800100, 0xffff8001, 0x00800140, 0xffff8001, 0x008001c0, 0xffff8001, 0x00800740, 0xffff8001,
 0x00800b80, 0xffff8001, 0x00800c40, 0xffff8001, 0x00800cc0, 0xffff8001, 0x00800d40, 0xffff8001,
 0x00801280, 0xffff8001, 0x008016c0, 0xffff8001, 0x00801780, 0xffff8001, 0x00801800, 0xffff8001,
 0x008018c0, 0xffff8001, 0x00801900, 0xffff8001, 0x008019c0, 0xffff8001, };
 
-static uint32_t vpep_hmirror_cmd[1661] = {
+static uint32_t vpe2_vpep_hmirror_cmd[1661] = {
 0x00000202, 0x00000004, 0x00400000, 0xffff8001, 0x400003ff, 0x00000200, 0x00ff01ff, 0x00000004,
 0x00400000, 0xffff8001, 0x400003ff, 0x00000000, 0x00ff01ff, 0x00000000, 0x00500000, 0xffff8001,
 0x400003ff, 0x00000000, 0x00ff01ff, 0x00000000, 0x00500000, 0xffff8001, 0x400003ff, 0x00000200,
@@ -260,12 +260,12 @@ static uint32_t vpep_hmirror_cmd[1661] = {
 0x000b0003, 0x0004ac70, 0x00000000, 0x0004ac74, 0x00000000, 0x0004ac78, 0x00000000, 0x0004ac7c,
 0x00000000, 0x0004abdc, 0x00000000, 0x00047840, 0x00000827, };
 
-uint32_t *vpe_get_vpec_hmirror_cmd(void)
+uint32_t *vpe2_get_vpec_hmirror_cmd(void)
 {
-	return vpec_hmirror_cmd;
+	return vpe2_vpec_hmirror_cmd;
 }
 
-uint32_t *vpe_get_vpep_hmirror_cmd(void)
+uint32_t *vpe2_get_vpep_hmirror_cmd(void)
 {
-	return vpep_hmirror_cmd;
+	return vpe2_vpep_hmirror_cmd;
 }
-- 
2.56.0

