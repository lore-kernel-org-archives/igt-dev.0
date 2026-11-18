Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 909C4606A31C
	for <igt-dev@archiver.kernel.org>; Wed, 18 Nov 2026 06:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=U8LDoliK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AA6E10E342;
	Wed, 18 Nov 2026 06:16:47 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012008.outbound.protection.outlook.com
 [40.107.200.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F353510E652
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Nov 2026 06:11:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIuTrwyb2mEC1B55l+Pbc8hivjH06fzqO12jdG6tFUGtj5LyCdbNY8VcOWUXPbEkLUo3F8XUiEdRS9lUxlVc78P/ANKTQPpeyZHjMry5ZZEMyRsFeDpvQCCC2pbFg/I1JL9tB/U1PvILlIUvjWEdeTUI3300NSajdOwXu1EqLaEN0QhXywNq603cKl+pmp3HM4UBDD3kHIQECc2fSm/cmCDcEb9Xl4xOl+MwUY2JuWCu7XLorJLVshBOhoies4Rb4YNr0J1rU4PE36dNMqKKkhi479+2Bg87qh924pOo7+hMRsNr7fn7JP+MrG91QlUThEqtj+tDJQNSuR9n2iA80Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=05xX87CtAInv+3PDgXK3mb1ZYskG2Yslpge4SiLnYho=;
 b=S/7qG4WH9NFe+rCUbeJXQ4eSRGyFOK1+zT7I7Gau0sTL0r0sK+XINrDnzeO4rLfzxcLSVyvmEK0VWHUKF1iQU6BwOkG/FYuDdFrSGLSs/tfewCMRGy1SszM9MfJU7R6o0QEmhTEbzt5Oev7rJsZ/IlaKqxsSBqOkQ6/xOsfpVvAi2YzTduRO74S77hcsEHZfbWXchkOS/rYZnegt923ujm0deiprX0AtDtvX2l3leez0OV0nLh44gZPr9w92voRvHh0G+xxngjId4fwgRedL/8/okbf2Ch7CDCrBdBaZy7d/cDLw5k4YLKMm3n50hOjGSVQK2p5H+KaPFPTmDDS6aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=05xX87CtAInv+3PDgXK3mb1ZYskG2Yslpge4SiLnYho=;
 b=U8LDoliKxWZVpFYguq8QDqrl6Xuh825rtMyiv6agR42C7h1N+oX/8bN2vtXA53FB/xDcPjLeWOJ4oIMRKke1qu2AEd+icpFze8W3YGMgIJYeSSShuRnZyvFd/ZCCc5WCB5MIiGIAcrS1dlyTvtvAjGBXYtc2oNT9xmovHOCTRAI=
Received: from PH8PR20CA0005.namprd20.prod.outlook.com (2603:10b6:510:23c::13)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 06:11:05 +0000
Received: from PH4PEPF0000B60D.namprd21.prod.outlook.com
 (2603:10b6:510:23c:cafe::4f) by PH8PR20CA0005.outlook.office365.com
 (2603:10b6:510:23c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.9 via Frontend Transport; Wed, 18
 Nov 2026 06:11:05 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 PH4PEPF0000B60D.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.0 via Frontend Transport; Wed, 18 Nov 2026 06:11:05 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:05 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 00:11:05 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Wed, 18 Nov 2026 00:11:03 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t V2 2/8] include/drm-uapi/amdgpu: add the CWSR save area
 to the compute MQD
Date: Wed, 18 Nov 2026 14:10:43 +0800
Message-ID: <20261118061059.3012530-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
References: <20261118061059.3012530-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH4PEPF0000B60D:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c22779-d120-4cee-ac66-08df453abaf8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261022105027099003|56012099006|11063799006|10067099003|261102123227099003|22082099003|18002099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: sdSUhu2NLqbFGbtD6BTCBdONfoaNc6UvU5bWr2uo4hZGK5n4r+VoIsULGMr2oHxhgo/Tov2cxb6frevZQzuJ0ItWt0PIRAuxtBpTBGu+vmU2D5n+CspTk07ZR5PccFHW+ynGElEOwx66wW3geVow/U2ipoZ+V2Bt5sNniGMFP5jhjYdTDBNT2vlyrRTeIKbDtH7S7Nun0K3gMovi9Dd8dTSUIzsYHpmx8ui12bBbCFvb2/dOleRP+Csc3e8PkCYZ3sCzhmTg9jNT1n4kx3iywSZFgqeZD4CwzqQHLmlPuSl/C7XIehyx9JscEhxlVHDtVOUD00+DLl7OmK4goe2HMdFnE5kMjzOWctjN31t4E0fqSk7F0CnuU4HurLWfbJ4+roOT15+a30jLSiM6X93rPqguF/DcPJmXY6MlEuXpDkzYiOa8SzAL62IKGi1yXcGgYrDGrTbC5i9y34RnApAhpF7B9njzRHFbit5K0E04UH8k5SDW27XimsMMtnP8+AAubywxgYwaJKDdBisYPOL3Fl0+qYxN+0qo0uKe78tfG73pjz2AtDivhgVF1xrfN70RUoC6Eu1kdnLd8wAHHah0i0/nzM9R/Ln/+UDmBzJf+Z2FdzN8nWF+bnXigxgf5tq9kCIq4lnJAPcTos9Rr3ykGyxWPMgCkIFd7YQbPPoGsUeeqtMJrqnmJl9h6kpqXlsdIAbJwBtlqaNlRjF48PZhzQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261022105027099003)(56012099006)(11063799006)(10067099003)(261102123227099003)(22082099003)(18002099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: tLY41olfc87hdv257Xt3zlfN+F2u/yxYlvlsGijs4Xm1cQLlJK5yt2GgBjyI+GzBbHFBRmnGqcx5dSQBPb8algHn2ImKfPg5xcHMOYCw03d+otcgroUn42fCzyTrwRcKzk7XIe6t9OoSfcOeAuai65Sc4koC00cb5Kivt3ujZIriEKGMLeQiUeE57ouKgrt0rqEgnyAFUbkOXTN5QTBIO68d3SfR1jOrxpmZEJYhOuSEBchgagsZ0K9vHPM/2K6FRuntxZ91VB/TuGtrHG+8YvVl7nifJLxQUk5dyzp1ky1C7mBHvyjPU3nxliUCD618ggN2CXDpe+idArqmPRqes7CytuZt+cj8sA/FdgfMZr8qVtS/U22Iv53+eIOtGT2m/Qla+TBejarUL1BAjRnJO4bePouJaIAunR1xHYMa9gRx4aXBPEqG38Lt2JaFWa+T
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 06:11:05.6538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c22779-d120-4cee-ac66-08df453abaf8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: PH4PEPF0000B60D.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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

