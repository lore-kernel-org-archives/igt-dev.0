Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D1BC27C79
	for <igt-dev@archiver.kernel.org>; Thu, 20 Jun 2024 06:15:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A6910E2D7;
	Thu, 20 Jun 2024 06:15:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oSn/Xrmw";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2083.outbound.protection.outlook.com [40.107.92.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F1E10E2D7
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2024 06:15:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IuTNeuITW7ZIMo/Raa3HsFhYL6SWx205UxoM9ZbBL4Kwy2kX4HNxiBBAxfXUL5BaI+WMumzppfRPmjheLEZHUdp0FBQuL2Tn8R6FHwwYyyD75nlcmGCDjZvoNCkR4kIhSfW+5/nMqxYoLW0p/cOxevB/ry7XeyP/xqk35VNfASQxpv2jkNazXtd2Na8J4Iy+g4gunFVouJRSnJ2+HuVOP1BBqz05Y0LEH1TeLBQlLgQDJPvj+5iNd8j3uy65R+wVfX4QbaIEHQHF6iQ9ZDk9QXyhbj8p/PjMgsoxuVYifFLenZ4dwT0CUEGufWCAdLIiuz5Rw3Vv9goWVZHCiUB/bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P0yQXhwTXT1lXa+jySSFkmJrVaRgE2zN61vq7qs3CF4=;
 b=YtEoGWHyjleUe0TLFAYzenUEfnh5BkqBdNX5q2LBQNp8nRmEXgW1q5IBns/7mrNUwOXrjzxnyQKKCFMR3lsaV2Gz+sQC0REOzHiFHVGEebw2//AqOZLw+HKzwhOOGp8yV+6HjllLgz4U7xiz7PZ5GLBklXyncYuEfX6a6fvWP0dX23tpkm2C/PrdgsvRFENOTAYBwoL+iDyFkY/E2+rIIOusUySMA3lS4/j1JKIWZH0EIjRNuvpW2O4n6gQ9ceT/+0CCW6oS8x4G1stN0CVwm/EcF6gow3Oxa7WHjlWsdIKVEgQ+KUQUIIkMzR0Vw+5jHl5DNxBB6PFJkzzWNN3EYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P0yQXhwTXT1lXa+jySSFkmJrVaRgE2zN61vq7qs3CF4=;
 b=oSn/XrmwB2I+nUq1OaXdzHoOf44O3SsLVFGq8x6y7AiwE9BFqXE9nX/M5aTjnH3pPmso4oSaQohQ3Zu/60FqK0W3T7fQVLpT0ZEACTIsSzYcAdN+noZPnH8upVH5HFOmGvC9WM9unjxt5oSAwt+FU6rNw5GhcqYsG01eD1lAWQs=
Received: from DM6PR05CA0039.namprd05.prod.outlook.com (2603:10b6:5:335::8) by
 PH7PR12MB6633.namprd12.prod.outlook.com (2603:10b6:510:1ff::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Thu, 20 Jun
 2024 06:15:50 +0000
Received: from DS3PEPF0000C37B.namprd04.prod.outlook.com
 (2603:10b6:5:335:cafe::cc) by DM6PR05CA0039.outlook.office365.com
 (2603:10b6:5:335::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Thu, 20 Jun 2024 06:15:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37B.mail.protection.outlook.com (10.167.23.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 06:15:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 01:15:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 01:15:49 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Jun 2024 01:15:42 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>, Jiadong Zhu
 <Jiadong.Zhu@amd.com>
Subject: [PATCH 3/3] lib/amdgpu: fix gfx11 issue about amd_dispatch
Date: Thu, 20 Jun 2024 14:15:41 +0800
Message-ID: <20240620061541.2218620-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37B:EE_|PH7PR12MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: 575505c1-943c-467a-379a-08dc90f06e98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|36860700010|1800799021|82310400023|376011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oZYDoh7YzO9GKwm+fbqFhyrBlNJXwfL5dPxRXcVhI4PJEJm9Qv2dpJrsm2dz?=
 =?us-ascii?Q?yFCbC4N1Qpz3zsW5XkzHI+JkSmLnIMBHlp421YnhAkrixiy+C40lWAJiQj7h?=
 =?us-ascii?Q?byuFp+rpGlSqsWykLitPr/5Ew0k4r83TG+85xeAwpmBZR7HbnzAv0tPJgSfG?=
 =?us-ascii?Q?odwJR8YEKDp7BLq7XLI831gip0hnPnVFGTMxdz+jc6qBHt6EtgLg3ew+7WVS?=
 =?us-ascii?Q?IaZT0P+qFWZ6xFghAEWX+NqcihzaVGaaSebrQRK5iWjM7ZGADEcKf6KvxnOc?=
 =?us-ascii?Q?GCLqsvQLF9smMymUAtwJ1p23MGWJW/c45gQBmsQGNJdTHCMnnNut3PMlJ20f?=
 =?us-ascii?Q?9SXQbbHjdxvnt3qTMxoKUbco3edpbT3ONwYsNhAAD38Mum10oABsa6hlH8FW?=
 =?us-ascii?Q?iY2Siw+Ah2cMqM79s48dD6y0j2/5i2EB0p/9xeWe0i8D3+DipvgmVYJmSoRh?=
 =?us-ascii?Q?lE2fZRZfuF3KtWuOdoJFKB8HsBVlqpOLanREOvIt2xE3Pr1KEdOPFhjx2SGa?=
 =?us-ascii?Q?xxjjeQvChIwtHeJ6Iaa6XUuWsMF1T3BUTtGgPIVb+i5cBHC6kNpFvVz3HtL2?=
 =?us-ascii?Q?8lxXFHqrjIamRQ0IJ6j18bVb/ekIvdAGtMhsQi4EJXEEFzS3/FmHoABbduFd?=
 =?us-ascii?Q?YsijFSrxhiyhtG9DW5Vk+cY1TVIo32jqcEafL2y/QMNBp/T5qCRK9X2ie2vv?=
 =?us-ascii?Q?i/KRCxOntjudS7HNjtTHGBVrlIidvCQjViTC8pvRAvDrV1JYUTo7s8ERPXn0?=
 =?us-ascii?Q?j9w6qlKwc9jgegwQc1Rj54l5Fbq6egldJ2QBMDr9jytgE5rDJLoDH8p+S4sU?=
 =?us-ascii?Q?vO6NQaCoXQYH77qkY1B6Ttpj13T2s989HQz8NQ0JQAU/HA/gPkvggieAulUa?=
 =?us-ascii?Q?XT3/FWYvgt/QUlN/7Ymuy/EoKhG3beOt98SGRzER81Wo2m7Za0X344lnBzpS?=
 =?us-ascii?Q?UiIrMXE8TBRas8a9e4aFntnMapAOaxnJlW2GoVCPZsRo+WVDHTvgIn5e7sbW?=
 =?us-ascii?Q?xM067loKnbwK1hp1G17zD7Wg4EDOwYeFKKJwQx7t2GdzihuQZAIM8hsv6TVf?=
 =?us-ascii?Q?UO9dBnrTQtLRajO1e7e36kGfhy7L6rmStleMhKRznWcireo++oMBndffhDMr?=
 =?us-ascii?Q?B8FbV+3damjH3/q2UOg/G4A4zqNWrVjxjnxb0B0PRmVF8h6lSxDtEjMkV0G3?=
 =?us-ascii?Q?s4py95u+KJt3sQKhh7LZ2wPm4ZtP9L2ZVoxwnRkJnOwjXfCYFNFH50gsrxbf?=
 =?us-ascii?Q?yTm4xjSqBvN/4zTjcN6/b8ho2LkRq8x4fA0x0a9hm/d7C1YQiP2WmQLK5bmI?=
 =?us-ascii?Q?tzZTrJ7T2jKBSb6z8AyWKuyAZFZzEIXunyTfRdLQOolQlDSbqwVo0wux6LhL?=
 =?us-ascii?Q?9ig+dHJ1Wc1cMrWNi8T+gSebjm7MDCA8tCZIMR5V34yRnUyVAQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(36860700010)(1800799021)(82310400023)(376011); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 06:15:50.0694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 575505c1-943c-467a-379a-08dc90f06e98
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF0000C37B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6633
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

add some initialized register and fix some uncorrected register setting.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Jiadong Zhu <Jiadong.Zhu@amd.com>
---
 lib/amdgpu/amd_dispatch.c         |  2 +-
 lib/amdgpu/amd_dispatch_helpers.c | 34 ++++++++++++++++++++-----------
 lib/amdgpu/amd_shaders.c          |  3 +--
 3 files changed, 24 insertions(+), 15 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index b739ce64d..df7d56ea7 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -345,7 +345,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	int r, r2;
 
 	int bo_dst_size = 0x4000000;
-	int bo_shader_size = 0x400000;
+	int bo_shader_size = 0x4000000;
 	int bo_cmd_size = 4096;
 
 	struct amdgpu_cs_request ibs_request = {0};
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
index 1c7413922..b0a5f550e 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -70,8 +70,20 @@
 		base->emit(base, PACKET3(PACKET3_SET_UCONFIG_REG, 1));
 		base->emit(base, 0x7b);
 		base->emit(base, 0x20);
+	} else if (version == 11) {
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base->emit(base, 0x222);
+		base->emit(base, 0);
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
+		base->emit(base, 0x224);
+		base->emit(base, 0);
+		base->emit(base, 0);
+		base->emit(base, 0);
+		base->emit(base, 0);
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base->emit(base, 0x22a);
+		base->emit(base, 0);
 	}
-
 	return base->cdw - i;
 }
 
@@ -85,27 +97,20 @@ int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base * base, uint32_t version
  		base->emit(base, 0x216);
  		base->emit(base, 0xffffffff);
  		base->emit(base, 0xffffffff);
- 	} else if(version == 10) {
+	} else if((version == 10) || (version == 11)) {
 		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE1 - mmCOMPUTE_STATIC_THREAD_MGMT_SE0 */
  		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
  		base->emit(base, 0x30000216);
  		base->emit(base, 0xffffffff);
  		base->emit(base, 0xffffffff);
-		/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
- 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
- 		base->emit(base, 0x30000219);
- 		base->emit(base, 0xffffffff);
- 		base->emit(base, 0xffffffff);
 	}
-
-
- 	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
- 	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 2));
+	/* set mmCOMPUTE_STATIC_THREAD_MGMT_SE3 - mmCOMPUTE_STATIC_THREAD_MGMT_SE2 */
+	base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG_INDEX, 2));
  	base->emit(base, 0x219);
  	base->emit(base, 0xffffffff);
  	base->emit(base, 0xffffffff);
 
- 	return base->cdw - offset_prev;
+	return base->cdw - offset_prev;
  }
 
 
@@ -161,6 +166,11 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
 		base->emit(base,0x228);
 		base->emit(base, 0 );
+	} else if (version == 11) {
+		/* mmCOMPUTE_PGM_RSRC3 */
+		base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
+		base->emit(base,0x228);
+		base->emit(base, 0x3f0 );
 	}
 	return base->cdw - offset_prev;
 }
diff --git a/lib/amdgpu/amd_shaders.c b/lib/amdgpu/amd_shaders.c
index fad6dbced..e4931961c 100644
--- a/lib/amdgpu/amd_shaders.c
+++ b/lib/amdgpu/amd_shaders.c
@@ -132,7 +132,6 @@ int amdgpu_dispatch_load_cs_shader_hang_slow(uint32_t *ptr, uint32_t family_id)
 	    0xd7460000, 0x04010c08, 0xe00c2000, 0x80000100,
 	    0xbf8c0f70, 0xe01ca000, 0x80010100, 0xbf810000
 	};
-
 	struct amdgpu_test_shader memcpy_cs_hang_slow_nv = {
 	        memcpy_cs_hang_slow_nv_codes,
 	        4,
@@ -140,7 +139,7 @@ int amdgpu_dispatch_load_cs_shader_hang_slow(uint32_t *ptr, uint32_t family_id)
 	        1
 	};
 	struct amdgpu_test_shader *shader;
-	int i, loop = 0x10000;
+	int i, loop = 0x100000;
 
 	switch (family_id) {
 		case AMDGPU_FAMILY_AI:
-- 
2.25.1

