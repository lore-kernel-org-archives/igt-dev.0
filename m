Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35B606A33C
	for <igt-dev@archiver.kernel.org>; Tue, 24 Nov 2026 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=q/W1stLB
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649FE10F334;
	Tue, 24 Nov 2026 08:36:33 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D9710F2EE
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Nov 2026 08:28:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AUeR/oSJrLpffQUDmb5HKs1dAryJ1sj5qsdIlYDzgAKEQlTNbpdr+MfHwNpc0tC1GMTVMAI2RRwh1zdvIobta1U2TrtfvaWuvAvn6wtBTgzSpvxjSev3EKEtfYZBgCx7RhfYDXXrFW+t2euL47EIY0DHZ2BdJg9G/XI8IVIp8q8Cm3PRxiACqQO5fJ7yzG5+Jk+HsE8TgPZrH+zKa+RgyWBt2P+KX2cV8tJMCUQ/RPmBiECxpk8hitibKG6ANfi04Ps7X7y3BL5yIzT8nDgiwU3Rp5YvOpnvZcoUSnjk1+amkfNVAvXnrCUS07HD8v4OCbgb3ZJtej13Pwggk1gnqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiHqFqAe7gdiZiB7yyIt1jYzgmQ1WDgNIuDap6M6s4c=;
 b=hGxhsHDyMMh3rz+8SUMvLl344ZC1BCbeeOcgnylRsT9QL4dJ0GF/D2YWBLClGetrdNxxgPqW+g2Rmn12+eVbAW5zc8wXJ8BlptgoCALv8K2YV5DBfe3SaDY75uJ7yyMo20yyy1CBikcGr35RyPl6frVfLX3mbR1Dawxzi8wS/+A5BoQ2xVuCPrx5+DhHY7ZK1YauWpwA++HS2iaXTg7ngK257PUtZLBoTdK1v3CFfK8aRa84RmijYJ9ICuWqvX4WqR7tut8atkqWn2e5OhJR+A7RAGQ0OBL9q7Kq9jw8UmcK8/yspxFpxp1d0hys458vxWkvHSBkHiH55eIVEwQFqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiHqFqAe7gdiZiB7yyIt1jYzgmQ1WDgNIuDap6M6s4c=;
 b=q/W1stLBSosvA2KXsho65mC3RTgbLGC8L418ahZtp0ZFxASuX8ZH/1tt5WpKhimGxi966QgqEU8mRVA9Gy0LAWa+BE2bpbozmGrVrmjmvjjwvD8KxaNFswS+zgfWWXnpRhWAZgplQe3JGDiRmDPZsvwyeveLLikFrRzr5Rd2JiY=
Received: from CH0PR03CA0365.namprd03.prod.outlook.com (2603:10b6:610:119::13)
 by MW4PR12MB5604.namprd12.prod.outlook.com (2603:10b6:303:18d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Tue, 24 Nov
 2026 08:28:28 +0000
Received: from CH2PEPF000166BC.namprd04.prod.outlook.com
 (2603:10b6:610:119:cafe::72) by CH0PR03CA0365.outlook.office365.com
 (2603:10b6:610:119::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.639.14 via Frontend Transport; Tue,
 24 Nov 2026 08:28:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF000166BC.mail.protection.outlook.com (10.167.252.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 08:28:28 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 24 Nov
 2026 02:28:26 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Tue, 24 Nov 2026 02:28:24 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Lijo Lazar <lijo.lazar@amd.com>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, <pierre-eric.pelloux-prayer@amd.com>,
 <timur.kristof@gmail.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v4 02/12] include/drm-uapi/amdgpu: add the CWSR save
 area to the compute MQD
Date: Tue, 24 Nov 2026 16:27:32 +0800
Message-ID: <20261124082819.2089694-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
References: <20261124082819.2089694-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF000166BC:EE_|MW4PR12MB5604:EE_
X-MS-Office365-Filtering-Correlation-Id: cb529820-17d1-43d3-838d-08df4a04ea6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|23010399003|36860700016|1800799024|22082099003|18002099003|261026140227099003|11063799006|261028144727099003|261026121527099003|261102123227099003|261022105027099003|10067099003|261021121427099003|56012099006|261009223027099003;
X-Microsoft-Antispam-Message-Info: ru85lMDXzfnfnm5LxXi/WRqKvXGLJA9zHxBiMaotlQ5n89pyuPzYtNF+6khRFcTYNYB0vcT8zMa9wB/kmvr+RGydZjoKvnTx1scWv3NWWAI2RJpaWGMLJKM0zj4V2Y5H/i+libVF4qVUucmG7IWLiYkns40ALOzzpC5xneGnB7aScijVhdqcZX6eekKyn21ktqflCQc+F5UJ/VNJ3+rjwFvbstIpBYsne8IrULfdruT8Hw9ZPux9OLNFAIaVnQ8hDWMJIBtYB3l4RhzaD3pyZXGwXaH6C58djQ5JPL8/shGsdLmKefyshwCzVU8BSqlBu6f+np7vY477wo8uVgm2M13dXDTX46dp2FXpO0PxpgpMi5GufjSSxIgCzUqhkBf/744ljYVdmeg5+WG/3T4SaU8FdIIUKACtVrtE347NPFHRCnjBisY8o5ZHVIvVaBUEyVUag4jFygKn9eWCYTFvVPPmgBOJ+jI+cpGheiFLPULjoYNHcZBriU6rdP0bwvve7Y42q5k4vH8YKpAEI4np1YgLM+tomdG+lhHsYSn1aj1Doin+b6Bt1DmWY237ux6xucHnjZOeePr24vFYiVbUrl3P3euCq9MWV6mSWEo+D29cx7V9pojOr+P/fmpijOqvvK4loWCyMM1iCNotlkOJiUXOSSoalOW8+Xl4dmlwpjZZOUvUkkka8PH+Um7i+ukCEQFIhsSgiRB4RkZtElKL5A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(23010399003)(36860700016)(1800799024)(22082099003)(18002099003)(261026140227099003)(11063799006)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(10067099003)(261021121427099003)(56012099006)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ns/vh0H/72hEEHROHBQdwre4Todpl1yex3yOwMEVA91qj0NXoSKsmkZnfDBh6KszmHBMQm+bE2fgmTSf/1FLRIy15Sbh85x3t4oKCDEgX+Z12Y4JThi7iP6YNdPIF65sN7a8ErvwlFG2XAPfNsHO76Ix1WxQwTtRXRWY6ZuXGlZ3yJ4cH6MIEEEP02KBaYSIwrU77mOJ3WWhhloW0njIbGEWqCRPe0xc6Zs0nnLWjnVgaCtM3wCqCse+5rvsB54xhER/0MmrG+NDZ1oAoI6WlnPaOIUePCOQ7dRrGN225NKu8qNHgoCx2BeWlBkMulDfLJlS37tw4djhC1fkRh7Wx/oI48GSK2HCGiLSP/CNkX6+iougxt9QX4AzMsoiZhbgHF1/n/2LaKqmK4n6z4YgS1Bu2g5h9UzFUAesakhuyGdON/60uvZWGqs79ldfhVjj
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 08:28:28.2583 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb529820-17d1-43d3-838d-08df4a04ea6b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF000166BC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5604
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

Sync amdgpu_drm.h with the kernel CWSR/SLTH series ("drm/amdgpu: Add
CWSR userspace interfaces"): the compute user queue MQD gets
ctx_save_area_va and ctx_save_area_size, and AMDGPU_INFO_CWSR returns
the save area size userspace needs to allocate.

Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 832903e2e..5327a6451 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -470,6 +470,17 @@ struct drm_amdgpu_userq_mqd_compute_gfx11 {
 	 * to get the size.
 	 */
 	__u64   eop_va;
+	/**
+	 * @ctx_save_area_va: Virtual address of the GPU memory for save/restore buffer.
+	 * This must be from a separate GPU object, and use AMDGPU_INFO IOCTL
+	 * to get the size. This includes control stack, wave context and debugger memory.
+	 */
+	__u64 ctx_save_area_va;
+	/**
+	 * @ctx_save_area_size: Total size (in bytes) allocated for save/restore buffer.
+	 * Use AMDGPU_INFO IOCTL to get the size.
+	 */
+	__u32 ctx_save_area_size;
 };
 
 /* userq signal/wait ioctl */
@@ -1303,6 +1314,8 @@ struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
 #define AMDGPU_INFO_GPUVM_FAULT			0x23
 /* query FW object size and alignment */
 #define AMDGPU_INFO_UQ_FW_AREAS			0x24
+/* query CWSR size and alignment */
+#define AMDGPU_INFO_CWSR			0x25
 
 #define AMDGPU_INFO_MMR_SE_INDEX_SHIFT	0
 #define AMDGPU_INFO_MMR_SE_INDEX_MASK	0xff
@@ -1682,6 +1695,20 @@ struct drm_amdgpu_info_uq_metadata {
 	};
 };
 
+/**
+ * struct drm_amdgpu_info_cwsr - cwsr information
+ *
+ * Gives cwsr related size details. User needs to allocate buffer based on this.
+ */
+struct drm_amdgpu_info_cwsr {
+	/* Control stack size */
+	__u32 ctl_stack_size;
+	/* Debug memory area size */
+	__u32 dbg_mem_size;
+	/* Minimum save area size required */
+	__u32 min_save_area_size;
+};
+
 /*
  * Supported GPU families
  */
-- 
2.50.1

