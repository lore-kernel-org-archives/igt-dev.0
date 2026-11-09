Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C41606A31C
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 23:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=j/k+niwx
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B38710E0E8;
	Mon,  9 Nov 2026 23:50:42 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010059.outbound.protection.outlook.com
 [40.93.198.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E8E10E0E8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 23:49:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ArdutsD9wJI2LtQRsGelO0JwlK0AFYB7LAU8J+56yf+99DpBcuNQAcZy3I9A142sNMwqlYopUF8ojRqXzph+Ppzd6G+m5/8xmdxoHQY9t2lsq57uXULA7zxZljKAGEIvJHB2t11QJ5egYn7tV1wJMlmQES+A2vzWCQ4LxUK6FmecmhcHywRy14rnxbH0ZwsmqdcHHvE6qcpEIAFTS+p6eu3w7CHJvoRgfiGwxZEAhiBm8rH17R27BSyJWD9GTOn7YLzI9pkHkD0EDpm8ReTbuqTKPTZU6fr3U2XthgcKZaXXy/QH5TdF6PIY27pHkLK4P2uGeuhjFl6zs/DKVPTilQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUEVKX8HhCC1MNcR484IImioy2JtnUolypKJZz1TkMU=;
 b=nsRGGlm3y5FDWutQ6jtt4TOBJhkVv/sBiSLkH/080vLtARzgrQDwkbBEBYmcmKthPlvMbMD1shalFm7dF+Rj1r5e9qHjPcicCuud1/PWnUvpTL7pxjoodj+4FYrs00wrv8+QC07VWp7pe4PcgSPoxIbKhhZFbnZyD8fLRKrwpSKRPGO51zFZoDMj79EdJ3w0HV2L5/W4C5ugMKoRsP4U1bAC8FFxOBx7GfCbfgH8t/k8rQFVtVoBoxe5O5yuuQeJEJbjJTUf3c/FzuKkiIAcaCd6LgLdIrJ/MG6til2zkz6JC9q5yMeMNsk8o2e1Nz3oqdqj5LPfeoEJJHPjXuhOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUEVKX8HhCC1MNcR484IImioy2JtnUolypKJZz1TkMU=;
 b=j/k+niwxHbir0LKW/pFluucYgof5s1w4/Ow21ZJv+hUBe+iRM062A6X2zxVYQC18PohT2SuvXgXCtmSlbrDmVEBqjHUKl4wQi/FJvKNYlqgAfiEOe7ynmeZ7QWB2I9oFBdPCCQWHrdhkA/y21eJgixJcvIez4fTunEXccBm4lls=
Received: from CY8PR02CA0001.namprd02.prod.outlook.com (2603:10b6:930:4d::7)
 by LV0PR12MB243158.namprd12.prod.outlook.com (2603:10b6:408:3fc::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.13; Mon, 9 Nov
 2026 23:49:38 +0000
Received: from CY7PEPF000000F0.namprd05.prod.outlook.com
 (2603:10b6:930:4d:cafe::76) by CY8PR02CA0001.outlook.office365.com
 (2603:10b6:930:4d::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 23:49:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY7PEPF000000F0.mail.protection.outlook.com (10.167.247.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 23:49:36 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 17:49:36 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 17:49:36 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 17:49:35 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Jesse.Zhang <Jesse.Zhang@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.com>
Subject: [PATCH 2/3] lib/amdgpu: preserve libdrm userq metadata compatibility
Date: Mon, 9 Nov 2026 18:48:21 -0500
Message-ID: <20261109234926.146697-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261109234926.146697-1-vitaly.prosyak@amd.com>
References: <20261109234926.146697-1-vitaly.prosyak@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY7PEPF000000F0:EE_|LV0PR12MB243158:EE_
X-MS-Office365-Filtering-Correlation-Id: b9461988-af49-4051-b8e2-08df3ebc1cf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|18002099003|22082099003|6133799003|10067099003|3023799007|11063799006|261102123227099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|56012099006|261028144727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: QnPHlb+hT0nVhszp7TEAnrGuv5guZ5JqXACMt2pscLiU2jDdg6GVJIydAe/cBg3JOVloNbjvvoQseQZtJViR/MtdMvAoXxssgawte4wGp25EAXXZJ7cAv42zxdMazOk1lAMd7RAdzEu42eZCgAKTosG9EMKJLrp12z9iMUsJI6nsclCR3cws6PIFQzPG+frrfMe+QYSqzSRGOWpdMiDZPLVTHx9SjpWCWXBIjNS/M+dTvHL3TnbVecr5LEKJv5zMl/vaX8RyleGmksacrP6pUqiyq/o2umJT5LQ1vpPfO92l/pTl8ekAgoDz3gNkUY5PQDxfE+4Zjku/5WoWiT02JF6Mhp3RAxFFmr/uIA5cwGceTzqMGLhwqIzObq1YcqhL3RKB4zu165Bmq7QIDviR2ihUSj+19zAlSGnTNfsM/ps26a9xqOBg5D5IqEQVeVm7bgSDgmODg/epFPZkaOMAGrfP/tNU+XkEWdMKK697jkvl0rdqxOvVSrqBShFoXqyhLHgX4Rhl8rh0Hb2Yb1CgXZ1FrEHbRtMZXhKMlQUegTYjILXkfDosja9bHo5hSwAl+imNlR2QynfBv9PpMY1XtGzufH8Webobc4cIwfC8eMnDn+4xIEkH2w4qOy7EqT1tuXtQMJnbFpMD/2GmQEj7GwWXI6KPUaNZ6ZYyeRaZaAb9Neaxm3XSAsN5PdVuUYHPrHuTCxJcams6NCosCXJ2kQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(18002099003)(22082099003)(6133799003)(10067099003)(3023799007)(11063799006)(261102123227099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(56012099006)(261028144727099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XLcJnWhDjqR2NM3eq2USXaPqReQc0bAB3rRQsAuKS5rsQ7GFXqPIM2P4Cv94s8Zt0Y1CL8N4u7hwkskemuctxVdTkCwrM/7SavvG9S5OPKBSbFyPa4C8X+utJEmoVOq+nfqe8Y/VjkN4OWDemK9/rlaoM8r4s8UfINkf7b01LOlgUHey7gO49ROagsF4B/BfmlN/g3qrb0snSaivNqT/OMMACRAmZv4OTBKfHaW9Eed+c8HZKelOA85Kbr+MG59eV2KPHiXSAo1rNkHFdiTERSzvL7CIYXowCkYHR1aztrB9RAcEdB35Qp7t7Q8NT4r+S8nxyhluwcMBfN/za/EBbz9yQTm8jl0VxQJ5HAj+VJ/0k8//M/DBYbobyXQiQrmfLnQKMnWKdtv17s9mnqpnJkbFZMoamfINpVdrlHAZcRX0OdMB1HS7qTMIah2gGz10
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 23:49:36.9380 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9461988-af49-4051-b8e2-08df3ebc1cf1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY7PEPF000000F0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV0PR12MB243158
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Move drm_amdgpu_info_uq_fw_areas out of the synced UAPI header and into
amd_ip_blocks.h as an IGT compatibility wrapper. Installed libdrm still
declares and exposes this public type, while the newer kernel UAPI uses
drm_amdgpu_info_uq_metadata and provides gfx, compute and SDMA members.

Keep the legacy type used by libdrm's amdgpu_query_gpu_info_fw() API and
the existing IGT queue-setup code. Define its union from the corresponding
synced kernel metadata structures so existing GFX field access and layout
remain compatible while compute and SDMA metadata become available to IGT.
This is a declaration and source-compatibility change only; it does not
alter queue creation, resource sizing, ring selection or submission.

This commit follows the UAPI sync commit. It removes the temporary legacy
declaration from the UAPI header and places the wrapper in amd_ip_blocks.h,
keeping the preceding commit buildable while making this compatibility
workaround independently reviewable.

Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Jesse.Zhang <Jesse.Zhang@amd.com>
Cc: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 include/drm-uapi/amdgpu_drm.h | 14 --------------
 lib/amdgpu/amd_ip_blocks.h    | 12 ++++++++++++
 2 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 708034253..29009f6aa 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1668,20 +1668,6 @@ struct drm_amdgpu_info_uq_metadata {
 	};
 };
 
-/* Preserve the libdrm public type until the compatibility wrapper is moved into IGT. */
-struct drm_amdgpu_info_uq_fw_areas_gfx {
-	__u32 shadow_size;
-	__u32 shadow_alignment;
-	__u32 csa_size;
-	__u32 csa_alignment;
-};
-
-struct drm_amdgpu_info_uq_fw_areas {
-	union {
-		struct drm_amdgpu_info_uq_fw_areas_gfx gfx;
-	};
-};
-
 /*
  * Supported GPU families
  */
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 3c694ddc5..fc123fe1a 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -275,6 +275,18 @@ amdgpu_dma_default_bytes(const struct amdgpu_dma_limits *lim,
 	}
 }
 
+/*
+ * libdrm exposes this legacy name although the kernel UAPI now calls the
+ * corresponding container drm_amdgpu_info_uq_metadata.
+ */
+struct drm_amdgpu_info_uq_fw_areas {
+	union {
+		struct drm_amdgpu_info_uq_metadata_gfx gfx;
+		struct drm_amdgpu_info_uq_metadata_compute compute;
+		struct drm_amdgpu_info_uq_metadata_sdma sdma;
+	};
+};
+
 /* aux struct to hold misc parameters for convenience to maintain */
 struct amdgpu_ring_context {
 
-- 
2.55.0

