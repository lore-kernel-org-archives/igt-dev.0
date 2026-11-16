Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C07606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 11:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=RO0op0lP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613C410EF7E;
	Mon, 16 Nov 2026 11:31:09 +0000 (UTC)
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7066C10E9DB
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 11:25:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xIh/8DkQMMW32T1P7c/dwvG6/ye3fuXLWVs4Y7GgEX0oGKhpOAzgny8lTZF2e837eQzDdAlRpUgucZw2Kib3zHyEynYjOzslNO6FlWBRivw2xj0lB7OhILp7DuULBVaXVEQxsNZneq17XLmauTHa9gWN4vuAiDP6IgQ/HhxvK8ESzoKy9EAWvh5Pqy6oAWeCr0BArdgwrtMJf4/0YseXsJSNjMh3mYEo9ivNAbaPPwIp5qwZXQrKcpg2Ai5ZQo/FdOevMmQmzSoIMKQDw0ZnX0Svg+tdqPiGhNCQFG1k/6YOt+/HLS6Bb0GEI/AvLADVrb6PBL7JHOQnUdOCc+TcuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05xX87CtAInv+3PDgXK3mb1ZYskG2Yslpge4SiLnYho=;
 b=KR5Youpt7sbo0rMWCPUcMpsjnVB3gm7+zwf/ULOteWF4H6O9QxOYYCGAka7U/KDek/t8nMbn8c1iwqCS4Ne42AwpgDkoYB+zlNZPnXvSP8/m5mTF9dN7HqvCBOIls4d+oZ6HsFmJE1oimF3k25XJs4rWP0ufuj448aV23dl1xmReJVRgYmaU+QV3UKwEhmwkqA/Xb29ri+D/AyZrhBOirC1PVGbBw/aHtDgZNQFxtgIN3PNVO+zsgby2SdIg6B9b2FJE2PvRCPxS8cCpkZRYz6sHuOrpZ5ycMR1W0u9bP9ZUESYfTmgveXlckplQ16hR7sUcZJ2P7dmCE6LHFV8vUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05xX87CtAInv+3PDgXK3mb1ZYskG2Yslpge4SiLnYho=;
 b=RO0op0lPgRcFYDBoJ2ER0ziEdFUKXLLBF0I0JRCrRtQdZgdYbfITRzz3NO2i9SBrdIW5df22jMsWSYjiwG3CRHBlcmVKhJCSr6lU306TX0neiNkMTmtZwuPFk7qqaZFqz5zYnL49CPqyi6E+w+/kTsD3yK05extNYiBbyfG4srY=
Received: from CH2PR08CA0003.namprd08.prod.outlook.com (2603:10b6:610:5a::13)
 by CY1PR12MB9581.namprd12.prod.outlook.com (2603:10b6:930:fe::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 11:25:37 +0000
Received: from CH2PEPF00000145.namprd02.prod.outlook.com
 (2603:10b6:610:5a:cafe::a4) by CH2PR08CA0003.outlook.office365.com
 (2603:10b6:610:5a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Mon, 16
 Nov 2026 11:25:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF00000145.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 11:25:36 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:19:22 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 02:19:21 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 02:19:20 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/6] include/drm-uapi/amdgpu: add the CWSR save area to
 the compute MQD
Date: Mon, 16 Nov 2026 16:18:55 +0800
Message-ID: <20261116081916.2142984-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261116081916.2142984-1-Jesse.Zhang@amd.com>
References: <20261116081916.2142984-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000145:EE_|CY1PR12MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5e3cd5-e5ad-43ee-baf5-08df43d4564d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|1800799024|376014|22082099003|18002099003|261009223027099003|11063799006|56012099006|261028144727099003|261102123227099003|261026121527099003|261026140227099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info: L0BJg4K3ZLORNbjAM/Bxy/nbRwTicQogrb8Z8MKjZQcXaesG8s8Ca2EjDWo8LwBbxLOgHKXUQNfXtVOcQ4RNM7Qp9KXPTUZrX8TYZsSTwHQ8qyyAO5mmtwVuZNv4YYoKY7xjwiaGsoski56WB9PGxE9duqTB79ky9Ih3RXqIUmEJu9z1oC4rvKYWfhbHnKLx1UDXLJrGyVZ9Qkj6o3ZEnDaXFT+sGHukyJE8O5puWDOY7JSKoZLZdOmI0FXCUXN9onsiHGBZYaE+FZmcTINEn5qQ6FbV4xJlkkvFIhiz2mgdcTuZKt1zWKOmKfZTOeu5XgXkpP1Fd7W9VKZIiEUBAggJqUhKG5d4m2bLbWSMldHCFxhcobSuFUEVf+MSFvl0TnYnLKVdeyOhwIW75zyLFNLWnCizA+H6JHBvS9VrzWHoh6gbmtACxvTdrSZISGT1x/psRPtWLQLGDqZSMT4mmY6tQjwZ1GZJeXdKzYmhECLCCfnImJIi9GU5/9MWCjgBOPu/ylYorMeCqgevSEZtpiJtARxMNxJ/z8Wi+hTVWY+YCFMuEOP4BohEswIY3bYj18rdNPUEDiwC07Tq+YyDWorukliij8+aQaU1PCTQ4tJCS9tvAC2dfmAH6Qnk/wF/gj3GGonx7ovMEAugqvPhDB2yEnA2zqTsmjGvoSeKWiqqV7DfK31aKzWmbEqBhMfWXLzw3W0FKfMT4mYmvFVdYQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(1800799024)(376014)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261028144727099003)(261102123227099003)(261026121527099003)(261026140227099003)(261022105027099003)(261021121427099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ir2wOJGyIllNkQfCDdXXLAcfpvfluseXNx9UHYZrbAZkH0Nb+3M3EeKSVUBzibts3pbNHhwQWR89WkdFAh8VMH6SBXE0WYwR3rFUyRcYEsn/zRWPsgQzTTvQ4tBzHCf69r+7qDgQCBdU1oN0FPgXW6Bnept/oQIWD1sqIW5f7vheZ2IR5+WdSkH4e4cYh8O9M63syWvSjRTYaOVVvonx31OKt7jdMMynOuMgQSS1Ub121ErxiFCQwVEisMT8NLnVukjibDV/ojehhQKtio6mzjnKZm39D2Vs5ttAVi+2UUkCud5Xpg+Gv1u29NJbr2bI0ewT0LhSu3vpsWLzISpyW9tJ2cfHPtCVHEGrBXJJSSJ3UOHjHnv7AWiDRRmLtMkCQChTY+fpMUgwevryA/vyRrDd6CXf2J42ql2KSeOcHjSqT/3aCqOCUk1620ualKKT
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 11:25:36.9402 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5e3cd5-e5ad-43ee-baf5-08df43d4564d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000145.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9581
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

