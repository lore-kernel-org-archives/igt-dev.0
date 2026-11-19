Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C61606A32C
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 06:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=bqH1QfBO
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4003910EB84;
	Thu, 19 Nov 2026 06:22:12 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012004.outbound.protection.outlook.com [40.107.209.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CEB10EC52
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 06:19:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yp+4GLZn8owXkZ/yvvjfJDb0+D11v6hfee48Dqm+kKTgzlTeg1auOGlFME7E3PLuebTummengiF+ybHqKH4b5j+7yprfvFZXzuwW+bslcT5TuHkzK3Yyjq8UhUWxUlu9cvSIdng4MOqDHJiVsp9VRpRfqd9taJeYsVEW69IBtcraKrhGh4CFlKvnwCZc4gGOI/qIMugDstdPabwzed7RCSan5tSixtVHHAHacq3NudnNruWDkzGXFlPTk0oDDMYvCajFdujnK3AwTshOLbzzGCJUb+wsUeIa/b3davMegb8S3raVABFFu+63KrSbpDv2uNvoNL9mNZ85YUT2k4kQqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YiHqFqAe7gdiZiB7yyIt1jYzgmQ1WDgNIuDap6M6s4c=;
 b=OKIYWVjG8kd3AJkYaV1OxQgJKQBnEWSiVkMbWSJlbrg9BNmuHXzyA3HSZfTPvrMNEP2EGlJ/OWOn2EkXkwUl9mUTdBcIw/a4nfanAG/u5r1uIJamIGsEBa76sso651e0rajDkmwuGTLKR09DebxxFD21MS1jAJHmJyeYG3RTGpAYpHpXgaALAz/OpJGWCD8hhgwZyq1TpHwlznDbwoZ6IeR62T/pPivyZweZJ7GVT51TZslJpjEhAlK3xulExulOu05iljda+rhZSRBqNJA1czj+K+ZqMF8u0R0G1GX98pBuvEDwY42ULJzLbMBW2WOHwDQzOTtdxG4Fkn7XbQYWUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YiHqFqAe7gdiZiB7yyIt1jYzgmQ1WDgNIuDap6M6s4c=;
 b=bqH1QfBOuXI9+rcXk1ORcNl15CNRHwMP2EeJkrFb4Opk2g8KM2bgHKLAhfw8M5KQphpaK3RgmKb2pJck4UOoAhwHeuYj+lFBJHwUYwjLNsQ6vZ6T3vrgomfb/DiTsf6790VjXfvRsT+J/7QvQ0awxEWjXp7b3RG+UdTtb92SwdQ=
Received: from PH7P221CA0080.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:328::34)
 by CH1PPF4C9628624.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::60d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 06:19:01 +0000
Received: from CY4PEPF000392D7.namprd03.prod.outlook.com
 (2603:10b6:510:328:cafe::13) by PH7P221CA0080.outlook.office365.com
 (2603:10b6:510:328::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Thu,
 19 Nov 2026 06:19:01 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF000392D7.mail.protection.outlook.com (10.167.247.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 06:19:00 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:18:59 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:18:59 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 00:18:57 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 02/11] include/drm-uapi/amdgpu: add the CWSR save
 area to the compute MQD
Date: Thu, 19 Nov 2026 14:18:23 +0800
Message-ID: <20261119061847.3442210-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
References: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392D7:EE_|CH1PPF4C9628624:EE_
X-MS-Office365-Filtering-Correlation-Id: e4d970b9-e621-4c74-d658-08df460500ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|10067099003|11063799006|56012099006|261026121527099003|261026140227099003|261028144727099003|261022105027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ChBZqG2MU8oVAoXj+DSk7lkO+fYXd376Yjdp1FhuJqxN1Yu5dRqLMcc27wl6ylTVhezedGGYSoxiO8NTkxD0NlS52jfxM0CfGchU8xH/uhXR0HKKlofHNmpFUG5jk0xGTICTeALR4w4CxAWFcsEpZ9wPUzw3U1OBui1nKqMQMa0iYBSU9RHcWlj/qOLoa5gQ/UTNIAAwFhPYxi8zRtYE09lmiGl40SkNO9Kgcq1RCMgt16lJrQUKsvt6Owpx14FaMXDytZT7S1TLmAZ2Jdp7g4apLpPPvwYyf5rYb6XDGi/9fBJVlSfRJ1OwubcVuGgQqhGstwz8Gl4jmfem+8ZRxtGwPjiNvDOpbEUf8BEHPH24HxwsKIyZ8N40JNKjwj3/N0sog4oMfKjClg4X71XxjLU5r4zDNn6dE0uqtLqp6NyyBS44k3VdQNA0Fv8NMU/VyTAeFsstuDnmF5t5kOF4cupq4Hq5GhygpOuKQw5uAmHa0nMgTl3rLGbnEWNT+/BfG2dg+jMvvv9zpXUTz/UT+fgjvNdvFuVvI5DBPomVHm0E+rA2Scsae5wn0MUR8Jqa1HTkwkqz7df7LNd8rZP4aWgGVTNFJxuGOHtP5WS54W1G3E/V67JRA9mqR4uabE6NhJKZpocmb77AO+chItlkWpvCPqn5Mv+XDNbLZtZilapCtgWmsGHTFnF5hhVHqHmd81x9C6FRzqX8beV0FNPy0w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(10067099003)(11063799006)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Lf31opgLZgf+77JD6+a2LQkhZTQVGk/ftTugwBZdU7FTJyD6sHUccEou9DrM0gG9HPEbB7S1PPaH6oMt48xsNTjkpBmi27bgAHUnOWY0UebKVMA4pk6f1k4y4fnrIWl4DSE+JirWPpy4/rKQGcU+/8BpgoONuy5ZuvicIHccPmgzjLLCQX9SHLr7wHF4Kze8iFhEqrm2ClVJXcOIOlEVp6sC1mCVdMyEVQ1orLUiyp3Feo1mRjpA0EpIbNWbX+Ch9kYsG6iZxKRq2XRBjSG+IaPLnPW7jafWp9erNqUi3rzX7DM64gmHDlb7XvXDZv5DqagexsA2G03yIZuXHlLOJHlnWSizf4KYCpOVsFYwohmDGY6wJRQpL7jLggwXjlknndUsDZo0AYLv70jq7RMnHIC4oF5njov2KomOVF2OunpB+ayBgxF0bDHd0EKKNraQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:19:00.9225 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4d970b9-e621-4c74-d658-08df460500ae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392D7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF4C9628624
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

