Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78038C54748
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 08:31:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A86310E3EC;
	Wed, 28 Aug 2024 08:31:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sNLPLqEJ";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2042.outbound.protection.outlook.com [40.107.93.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C6410E3EC
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 08:31:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4CeET1kEm+IuXTLCQLdjs3wEd3KW//0xJq5WJvIzuEo6jhGy8H1uWn7Ij5y3kMBxkgnmy/O/vfllVZAuimHIFOe6nV+WbnBDNQzVGhFDx7JKA22hrODFqUmizpHnTdmdiCDmL90MckxSo/rRWl5/7jtVn4rax7u+irW6IovU8erJ3/JhhIdPbB7GY9WevPcpuz/MYxuh4wXILi3DdnDzeJ3o9PAo45ARO5ibAGjmITosnJ46J6Ycz+0GcmWCXjkSaHuIHF5ID2/i42bIFHgtSuwFLC9m1lP2fCPwAJYys0udtBrOjy7KuEtppfdglJ+poWLv7kI67uOuhYH2eIqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=63lbY/e4Ofjyu9xau6gnNT0CklVf6+Z6r9+Yg/N3qWM=;
 b=bRg4ExaB1wA2v6HXGmPRi+HmS1+r1ryN0lDIGcTwtTrkzYtJ94Iy0KygKwN4VtBat8Nrt2CnlWO/L4ZVbmtFxWXLL35i/8wBUz+KF8aQIW2jrobFUeOC0IAobYbRzQG+rWO40+ax4yXwmu8bmQJImLB3rYawCFt1c3ttwReJHiTDbGPGEMHgjR9DuVsC61KD461m3IfcoF4m5LfGnR0tidjadvpzpAMVlwpl1t0XO5fT1JyPZXXu7yzzRlKKg6vuWJvWvWW2XDqIyu750XCx0Iw46XOKUjRLoxCAH0qtKwnGHo9R26yX0Z+H7tXVrS3RBjQt5BBvt3CV3cL//niT7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=63lbY/e4Ofjyu9xau6gnNT0CklVf6+Z6r9+Yg/N3qWM=;
 b=sNLPLqEJBKIIT+zYKhF6kffjAHR9ycaJ8zECaC/aBPf+fJePEznlXujdLX4biE8t1SguUnxc4QtI7ebpRahReYZwG4ZonC2oNFIXYeCdjejZTQ3jcuXeoODAQpbyqNosQckMLPnpatLy9OURxgrw8gZhtcsgNQM1aE6jYSObSuQ=
Received: from BN9P221CA0027.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::21)
 by CH3PR12MB8511.namprd12.prod.outlook.com (2603:10b6:610:15c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.26; Wed, 28 Aug
 2024 08:31:47 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::e7) by BN9P221CA0027.outlook.office365.com
 (2603:10b6:408:10a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Wed, 28 Aug 2024 08:31:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 28 Aug 2024 08:31:47 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 03:31:47 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 03:31:46 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 28 Aug 2024 03:31:45 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH 1/2 i-g-t] lib/amdgpu: Enhanced SDMA negative test interface
Date: Wed, 28 Aug 2024 16:31:44 +0800
Message-ID: <20240828083144.131260-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|CH3PR12MB8511:EE_
X-MS-Office365-Filtering-Correlation-Id: e03d7e99-37a3-47b1-4bf1-08dcc73bdb53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XjzlG3qkvN5guDlXf6KKWzpB7Vy2jpyeEAKGtP5dCSNND+H9CMH+nUr7/ZAp?=
 =?us-ascii?Q?IaCVOhTyTwShKIuiCuw5jhUe77t2lsNUCXDjRimPTgI+VaspSx8sEiRXvTpn?=
 =?us-ascii?Q?UVMQsHiX8dL9tCJkQCZKlVHXIq/qZy9KqvdvOHX1kjT80s2z0q2XzzmZN+l9?=
 =?us-ascii?Q?Sax6NwDJXD9l8GDODas9wwbPKhB8WTdETGRUDeIQG3HdNqMjviBiQFluBcxQ?=
 =?us-ascii?Q?VN2wxL9/XnqI4jH4g2DQgU8ExSZH8sIcp//P4XZvVqYMhysdnKSCnYVHEn4h?=
 =?us-ascii?Q?Vzm6XhMwHc9AEJd1WZcLZ4jdgrypWNMM/dVLyU4A0zOCTeYtaq/FRrcsA5X2?=
 =?us-ascii?Q?NErHN55z6GKsyU8Yh73vKoJ6qwsN8eMEKmrbpcxPC5JucOKRqfS2qoZKwhfd?=
 =?us-ascii?Q?YfSOTEGeGmkb78oQNLUCXpHTUPOUYelVigQKEjO9RA3jJreH0kBoLrNuG5ts?=
 =?us-ascii?Q?R05Xp/MKeYpwV1zAj8z02HG2AfgEMlUqGsRPM6jkNzZlaYJnpDOg6wJ7F1UX?=
 =?us-ascii?Q?a8ldr3FxXR6Pzlh5IXQy0/U6/cLzutQ/iA4Rqpu+18D7Syb/MIVSP1lP29Js?=
 =?us-ascii?Q?JtbBdyDAOe4khWPIPwbcvDv9KWsQOKZV2FglCcDj+VXk46q0qQyMLPm4Kio1?=
 =?us-ascii?Q?xekUzlqIdZR+eeKc3u6W7M6gGZ0ZJAWL5Yj4z+CAu8sgWfrp5Ifb7fH2noOy?=
 =?us-ascii?Q?AElaqTsED3h7AcA5ryZMTmnHxps+Hy+qcMly1kD+V7yBJQBlVvNW2Zu7dP6y?=
 =?us-ascii?Q?K2AMYoDzOPpCeKKGxmZXdi8e2eLq/j9P4eo76pJOfwjDODgftq3JaHHCiVzi?=
 =?us-ascii?Q?ScROGmx5Gh1NYCBT1zpY4TU6JH5e7NIAkecnM1ZRu2R/95+gOuduSgPS6J+6?=
 =?us-ascii?Q?As+JE+OPZlci87ZibY9mV+JMhpw+mNk5+LTLUN4aCvw9Oih8V0/OZVcBWlhi?=
 =?us-ascii?Q?2oH+olKECIj7iQJKtSTLCUa3GFyfH1wCSxIv4fNwY9O2n8P3iU8hoVW1UXqj?=
 =?us-ascii?Q?yQsYCc8B0pfel7xafz2sZj6eD6PwxjaZvu85iC86JYcMiPrFMeNnNz+KKNO8?=
 =?us-ascii?Q?UOAYXLqeDdj+baz5PID/sraUL4UQktzu8y/Z6ai375s3047ub+Xv9w8E3L19?=
 =?us-ascii?Q?y5CFDi/mnm/L0jMUcraNtn7A6fK14fSIW1ptEFObsM3PWyu+kY1bPEiobgF9?=
 =?us-ascii?Q?NLG7gXdJnD5BbUDojVeO3KYJSp3JX0gl9/4Cg8GayuhglLCOvqcBmOz22Dnl?=
 =?us-ascii?Q?zvke5iSv98ucAOSNWOkkhjWbCk20Gzy3bIpqhjEaM3aL7N9opJjWXIKwuCNp?=
 =?us-ascii?Q?XB6Q0IznTqAJg0Vso0iWs1eB6LsQr0E6hsmIVMZpjLVh75/HzbDsTXynF2/A?=
 =?us-ascii?Q?nMd/HHtFFJvL980EGn3yCNV1x3TnSSPrl8bjPRwWRrs2aS7Wy2otvqCEfBq5?=
 =?us-ascii?Q?bD6Njle5l1iPvbIWo+VQAozZ7/nv1Hl4?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 08:31:47.5809 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e03d7e99-37a3-47b1-4bf1-08dcc73bdb53
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8511
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

To enhance the reset function, several invalid sdma writes are added.
1. Assembling invalid operation code,
2. Writing invalid memory address,
3. Sending invalid packet length.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.h |  5 ----
 lib/amdgpu/amd_ip_blocks.c        | 48 +++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h        |  5 +++-
 3 files changed, 52 insertions(+), 6 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index e36227950..165ffb98d 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -24,11 +24,6 @@
 #ifndef __AMD_DEADLOCK_HELPERS_H__
 #define __AMD_DEADLOCK_HELPERS_H__
 
-enum  hang_type {
-	DMA_CORRUPTED_HEADER_HANG,
-	DMA_SLOW_LINEARCOPY_HANG
-};
-
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type);
 
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 175c84cf9..2a2654c38 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -57,6 +57,53 @@ sdma_ring_write_linear(const struct amdgpu_ip_funcs *func,
 	return 0;
 }
 
+static int
+sdma_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
+		       const struct amdgpu_ring_context *ring_context,
+		       uint32_t *pm4_dw, unsigned int cmd_error)
+{
+	uint32_t i, j, stream_length;
+	uint32_t opcode;
+
+	i = 0;
+	j = 0;
+
+	if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
+		stream_length = ring_context->write_length / 16;
+	else
+		stream_length = ring_context->write_length;
+
+	if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
+		opcode = 0xf2;
+	else
+		opcode = SDMA_OPCODE_WRITE;
+
+	if (func->family_id == AMDGPU_FAMILY_SI)
+		ring_context->pm4[i++] = SDMA_PACKET_SI(opcode, 0, 0, 0,
+					 ring_context->write_length);
+	else
+		ring_context->pm4[i++] = SDMA_PACKET(opcode,
+					 SDMA_WRITE_SUB_OPCODE_LINEAR,
+					 ring_context->secure ? SDMA_ATOMIC_TMZ(1) : 0);
+	if (cmd_error == CMD_STREAM_TRANS_BAD_MEM_ADDRESS) {
+		ring_context->pm4[i++] = lower_32_bits(0xdeadbee0);
+		ring_context->pm4[i++] = upper_32_bits(0xdeadbee0);
+	} else {
+		ring_context->pm4[i++] = lower_32_bits(ring_context->bo_mc);
+		ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
+	}
+	if (func->family_id >= AMDGPU_FAMILY_AI)
+		ring_context->pm4[i++] = ring_context->write_length - 1;
+	else
+		ring_context->pm4[i++] = ring_context->write_length;
+
+	while (j++ < stream_length)
+		ring_context->pm4[i++] = func->deadbeaf;
+	*pm4_dw = i;
+
+	return 0;
+}
+
 static int
 sdma_ring_atomic(const struct amdgpu_ip_funcs *func,
 		       const struct amdgpu_ring_context *ring_context,
@@ -429,6 +476,7 @@ static struct amdgpu_ip_funcs sdma_v3_x_ip_funcs = {
 	.deadbeaf = 0xdeadbeaf,
 	.pattern = 0xaaaaaaaa,
 	.write_linear = sdma_ring_write_linear,
+	.bad_write_linear = sdma_ring_bad_write_linear,
 	.write_linear_atomic = sdma_ring_atomic,
 	.const_fill = sdma_ring_const_fill,
 	.copy_linear = sdma_ring_copy_linear,
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 86b82c40c..3e729f4c0 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -42,7 +42,10 @@ enum  cmd_error_type {
 	BACKEND_SE_GC_SHADER_INVALID_SHADER,
 	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,    /* COMPUTE_PGM */
 	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, /* COMPUTE_PGM_RSRC */
-	BACKEND_SE_GC_SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
+	BACKEND_SE_GC_SHADER_INVALID_USER_DATA, /* COMPUTE_USER_DATA */
+
+	DMA_CORRUPTED_HEADER_HANG,
+	DMA_SLOW_LINEARCOPY_HANG
 };
 
 #define _MAX_NUM_ASIC_ID_EXCLUDE_FILTER 3
-- 
2.25.1

