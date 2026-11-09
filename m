Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73645606A321
	for <igt-dev@archiver.kernel.org>; Mon,  9 Nov 2026 23:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=rd7kGv+K
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BC410E0E8;
	Mon,  9 Nov 2026 23:52:29 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010010.outbound.protection.outlook.com [52.101.56.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEA710E27D
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Nov 2026 23:49:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GNems8sBhdqGgpB2kY2RVtERzBXcHHM6h35cHYqFcD4eTFB1/hiNHlDm38W7MwLcegrL8BH4EDHyPd/wwwZJuPkgBmJ0SPMFieC6YmlB67wzl2XCzGmZxmU0aWLN2J1ir8R+1BmmObbpDlIcBMAHiXlHfJGP55tnbu1z1C9rzvAUKt6bomIRqtIU7rIMpJL2nuvmtlmQx1KnNsrN9wxCCKyZisUN3n/nMmsHlPmQVVRVqNQLh4Fp3GP6C51SHRNZcQmSvKB/lXTJrMT+Zzvb9wL1bhRDsyJWCPAAt0bWgLEzsdRHukJDeHEVG1z4mPo2AM9cERGF9Pi7JisCuegt8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uocRasC5AfG6lzr4T5KOD/4c44o2Ozzt0XRy52TmoEQ=;
 b=UVd3KtxCJmWwMj+UleqcpVBrUvdpI696EVIGAB8OkJC/siTrSAMaxk+kg0KkAb5N1nWznQjfm64XXGo/d0zqIiCQjWjI1rVYG2rUPG3p7qAzv65QQHM+PPurJv3UeguknmkzAMTZTCVcB7DOap4EZtOMT4f8LuFLFeh3yNYAH95iUq6MS0GAdbPbWfIfTUnS+t+tBFFEYSZ7cDos6H1KPxHT5KVOFkh8UgqlQB4drPFghpE4NiLqeto3W3uGeNq7/mrWlZ6qm86rASvqzTu2z0vbyn2wUzSxLRJC6XVD2KIhxP3+t1blTaxZN3ulEfGcOpuvFD5AUaBBc+nximGeBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uocRasC5AfG6lzr4T5KOD/4c44o2Ozzt0XRy52TmoEQ=;
 b=rd7kGv+KN6995nW3zOrz+V0brEHYpaPVea8xQ78NYdyyKj1kV/hwEekNp6evJ6emnyfJb3Tm1vLrJEEok2Mb313MI9GuuyYXSh0AjJNkkPGrraw5dcXvwgfHKlQZqfOPOLTrP/+0m/oSdvwyjwGntw+xJBUEZyXj1lCEG9QHmtM=
Received: from BN9PR03CA0662.namprd03.prod.outlook.com (2603:10b6:408:10e::7)
 by SJ0PR12MB8137.namprd12.prod.outlook.com (2603:10b6:a03:4e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.12; Mon, 9 Nov
 2026 23:49:38 +0000
Received: from IA0PEPF00000043.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::34) by BN9PR03CA0662.outlook.office365.com
 (2603:10b6:408:10e::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Mon, 9
 Nov 2026 23:49:37 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 IA0PEPF00000043.mail.protection.outlook.com (10.167.249.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 9 Nov 2026 23:49:37 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 17:49:35 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Mon, 9 Nov
 2026 17:49:35 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Mon, 9 Nov 2026 17:49:34 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric.pelloux-prayer@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Sunil Khatri <sunil.khatri@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>, 
 Jesse.Zhang <Jesse.Zhang@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.comi>
Subject: [PATCH 1/3] include/drm-uapi: Update AMDGPU UAPI headers
Date: Mon, 9 Nov 2026 18:48:20 -0500
Message-ID: <20261109234926.146697-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PEPF00000043:EE_|SJ0PR12MB8137:EE_
X-MS-Office365-Filtering-Correlation-Id: 074edc67-94a9-4c7f-89a2-08df3ebc1d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|18002099003|3023799007|13003099007|11063799006|56012099006|10067099003|261026121527099003|261021121427099003|261022105027099003|261102123227099003|261021123027099003|261028144727099003|261026140227099003|261009223027099003|261102130727099003;
X-Microsoft-Antispam-Message-Info: bD8yNU5uwula52ebiU97+AeS3gg3cWj+Id0jUwJiSEJ7mCSejiUf3QKUVD2YpyY3kXZiZYaaBkO6y9X4HigssMoV64lf4k0/v3hzj1QS0L6rt0WDlMk5bReVl+LscQs/xHccZox0U3GVkLxB8q6NR+hs1ZHPBr2LaNwdJ4V3LZI72lUDJUsgSE7Qi04SOKhCoR0AUOA0m+xRZxmlFc7e/x7Hbm75kitQJpYvkiNcWUmmbprDdchG/lq756ApYfhAxeo4p7cxXnI1/hLd9DmlNbv78qfTddVuVwyxjFHKo8He9XExbG4KOvd5vkTT1AG/B7GvBgyThUBU82zByYFb4JgeU1Yx/RupoLvcAikmodUe/Xxi2JksYZe/0zbW3Zuv4DsIzmZVtQqLbbXi49XyU6oF0/v/vqIWCU3o8UFz7mMmO5gg9yhHdIo9KUbCNrcKyqGrRNw+zgbnQYT88ii2AEVXso86JPVbKAcDT/a6IP1YCXe8tILZlkXn18NT8QjYnob854vnXzOAr0lZRnUNhReAD6TpEyQ4t86KANmy86QGfbDrvfKP4kCVeVvS85ZgXl88B/dhtUbDuw39r/vXaqqtg3JHt0Cl8sTbqJBzRKkrl1SzD7x4rPRCd9zcDwH8FAVpoFjjwuBAm6xCTr8gjzd5OK8a3iCwVVMomqmizTg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(3023799007)(13003099007)(11063799006)(56012099006)(10067099003)(261026121527099003)(261021121427099003)(261022105027099003)(261102123227099003)(261021123027099003)(261028144727099003)(261026140227099003)(261009223027099003)(261102130727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U8cQ2ZVMjH9PtFeqTwgwo2e5i/J8ZZUO6c8iNZWFTxKpuWrnpEofGRCHodA/KAImzRCQtrrl1I9zIR0ycjQaT4L7+2fBnUGiwXb7KIomCd8XpKfAkArVXvy96b2YP0vmxzXY334yGhP7z3whWctNKsg+x7b7pglxWkVxm0Y6i+RO3Qbkff/vzYWREkX46bgtKoH1Oze0qMJ76hmzkDg4JM4R6XfInVpxhKMdG2Gh2mkZZpE9FtlVTgRIlZ2E3y1jTa/gdZlQxqzjzktPjnDJhVwKdWPywELtXiEgTb8MzyRXFKqAaMKxY+aLCnupDae99OO20nEnd8qqngUcWt4U8u0raoLPI/aAvDeby7nDUE+k5U1Z0RpTaPUHuR1cawl4foSX9SYEnSGB7aLXHShvDoUUgqTgMmoZCWrQPlKhRu1+apUyCCnw67RvQkpnkBxm
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2026 23:49:37.2509 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 074edc67-94a9-4c7f-89a2-08df3ebc1d1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: IA0PEPF00000043.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8137
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

Sync include/drm-uapi/amdgpu_drm.h with drm-next commit:
https://gitlab.freedesktop.org/drm/kernel/-/commit/36990c9af3e.
Full commit: 36990c9af3e280fb620181532a2fc2f6d111b224
(drm/amdgpu: support MP5 in firmware info queries).

This is the latest commit touching amdgpu_drm.h on the fetched drm-next
branch. The resulting snapshot includes the intervening AMDGPU UAPI
updates as well as the MP5 firmware query.

The upstream header renamed drm_amdgpu_info_hw_ip.num_userq_slots to
userq_num_slots. Update the field references in amd_command_submission.c,
amd_compute.c, and amd_deadlock_helpers.c to match the new definition.
These are identifier-only substitutions in the existing user-queue slot
count and ring-mask calculations. They preserve the same values and do not
change ring selection or submission behavior.

Keep the old drm_amdgpu_info_uq_fw_areas declaration temporarily in this
commit so the existing amd_ip_blocks.h continues to build against the
installed libdrm API. The following commit moves that compatibility type
to amd_ip_blocks.h and removes the temporary UAPI declaration, leaving the
final UAPI header identical to the drm-next snapshot.

Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Jesse.Zhang <Jesse.Zhang@amd.com>
Cc: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.comi>
Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 include/drm-uapi/amdgpu_drm.h       | 221 +++++++++++++++++++++++-----
 lib/amdgpu/amd_command_submission.c |  20 +--
 lib/amdgpu/amd_compute.c            |   4 +-
 lib/amdgpu/amd_deadlock_helpers.c   |   4 +-
 4 files changed, 202 insertions(+), 47 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index 321f374d4..708034253 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -57,6 +57,9 @@ extern "C" {
 #define DRM_AMDGPU_USERQ		0x16
 #define DRM_AMDGPU_USERQ_SIGNAL		0x17
 #define DRM_AMDGPU_USERQ_WAIT		0x18
+#define DRM_AMDGPU_GEM_LIST_HANDLES	0x19
+#define DRM_AMDGPU_PROC_OPTIONS		0x1A
+#define DRM_AMDGPU_UALINK_HANDLE	0x1B
 
 #define DRM_IOCTL_AMDGPU_GEM_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_CREATE, union drm_amdgpu_gem_create)
 #define DRM_IOCTL_AMDGPU_GEM_MMAP	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_MMAP, union drm_amdgpu_gem_mmap)
@@ -77,6 +80,9 @@ extern "C" {
 #define DRM_IOCTL_AMDGPU_USERQ		DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ, union drm_amdgpu_userq)
 #define DRM_IOCTL_AMDGPU_USERQ_SIGNAL	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_SIGNAL, struct drm_amdgpu_userq_signal)
 #define DRM_IOCTL_AMDGPU_USERQ_WAIT	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_USERQ_WAIT, struct drm_amdgpu_userq_wait)
+#define DRM_IOCTL_AMDGPU_GEM_LIST_HANDLES DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_GEM_LIST_HANDLES, struct drm_amdgpu_gem_list_handles)
+#define DRM_IOCTL_AMDGPU_PROC_OPTIONS	DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_PROC_OPTIONS, struct drm_amdgpu_proc_options)
+#define DRM_IOCTL_AMDGPU_UALINK_HANDLE DRM_IOWR(DRM_COMMAND_BASE + DRM_AMDGPU_UALINK_HANDLE, union drm_amdgpu_ualink_handle)
 
 /**
  * DOC: memory domains
@@ -111,12 +117,18 @@ extern "C" {
 #define AMDGPU_GEM_DOMAIN_GWS		0x10
 #define AMDGPU_GEM_DOMAIN_OA		0x20
 #define AMDGPU_GEM_DOMAIN_DOORBELL	0x40
+#define AMDGPU_GEM_DOMAIN_MMIO_REMAP	0x80
+#define AMDGPU_GEM_DOMAIN_NPA		0x100
+
+/* User-mode is not allowed to allocate NPA space. As a result,
+ * we don't add AMDGPU_GEM_DOMAIN_NPA in the DOMAIN_MASK below.
+ */
 #define AMDGPU_GEM_DOMAIN_MASK		(AMDGPU_GEM_DOMAIN_CPU | \
 					 AMDGPU_GEM_DOMAIN_GTT | \
 					 AMDGPU_GEM_DOMAIN_VRAM | \
 					 AMDGPU_GEM_DOMAIN_GDS | \
 					 AMDGPU_GEM_DOMAIN_GWS | \
-					 AMDGPU_GEM_DOMAIN_OA | \
+					 AMDGPU_GEM_DOMAIN_OA |	\
 					 AMDGPU_GEM_DOMAIN_DOORBELL)
 
 /* Flag that CPU access will be required for the case of VRAM domain */
@@ -330,6 +342,7 @@ union drm_amdgpu_ctx {
 #define AMDGPU_USERQ_OP_FREE	2
 
 /* queue priority levels */
+/* low < normal low < normal high < high */
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_MASK  0x3
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_SHIFT 0
 #define AMDGPU_USERQ_CREATE_FLAGS_QUEUE_PRIORITY_NORMAL_LOW 0
@@ -365,6 +378,9 @@ struct drm_amdgpu_userq_in {
 	 * and doorbell_offset in the doorbell bo.
 	 */
 	__u32   doorbell_offset;
+	/**
+	 * @flags: flags used for queue parameters
+	 */
 	__u32 flags;
 	/**
 	 * @queue_va: Virtual address of the GPU memory which holds the queue
@@ -473,7 +489,9 @@ struct drm_amdgpu_userq_signal {
 	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
 	 * @syncobj_handles.
 	 */
-	__u64	num_syncobj_handles;
+	__u16	num_syncobj_handles;
+	__u16	pad0;
+	__u32	pad1;
 	/**
 	 * @bo_read_handles: The list of BO handles that the submitted user queue job
 	 * is using for read only. This will update BO fences in the kernel.
@@ -494,6 +512,11 @@ struct drm_amdgpu_userq_signal {
 	 * @bo_write_handles.
 	 */
 	__u32	num_bo_write_handles;
+	/**
+	 * @syncobj_points: The list of syncobj points submitted by the user queue job
+	 * for the corresponding @syncobj_handles.
+	 */
+	__u64	syncobj_points;
 };
 
 struct drm_amdgpu_userq_fence_info {
@@ -557,7 +580,8 @@ struct drm_amdgpu_userq_wait {
 	 * @num_syncobj_handles: A count that represents the number of syncobj handles in
 	 * @syncobj_handles.
 	 */
-	__u32	num_syncobj_handles;
+	__u16	num_syncobj_handles;
+	__u16	pad0;
 	/**
 	 * @num_bo_read_handles: A count that represents the number of read BO handles in
 	 * @bo_read_handles.
@@ -667,13 +691,20 @@ struct drm_amdgpu_gem_userptr {
 /* GFX12 and later: */
 #define AMDGPU_TILING_GFX12_SWIZZLE_MODE_SHIFT			0
 #define AMDGPU_TILING_GFX12_SWIZZLE_MODE_MASK			0x7
-/* These are DCC recompression setting for memory management: */
+/* These are DCC recompression settings for memory management: */
 #define AMDGPU_TILING_GFX12_DCC_MAX_COMPRESSED_BLOCK_SHIFT	3
 #define AMDGPU_TILING_GFX12_DCC_MAX_COMPRESSED_BLOCK_MASK	0x3 /* 0:64B, 1:128B, 2:256B */
 #define AMDGPU_TILING_GFX12_DCC_NUMBER_TYPE_SHIFT		5
 #define AMDGPU_TILING_GFX12_DCC_NUMBER_TYPE_MASK		0x7 /* CB_COLOR0_INFO.NUMBER_TYPE */
 #define AMDGPU_TILING_GFX12_DCC_DATA_FORMAT_SHIFT		8
 #define AMDGPU_TILING_GFX12_DCC_DATA_FORMAT_MASK		0x3f /* [0:4]:CB_COLOR0_INFO.FORMAT, [5]:MM */
+/* When clearing the buffer or moving it from VRAM to GTT, don't compress and set DCC metadata
+ * to uncompressed. Set when parts of an allocation bypass DCC and read raw data. */
+#define AMDGPU_TILING_GFX12_DCC_WRITE_COMPRESS_DISABLE_SHIFT	14
+#define AMDGPU_TILING_GFX12_DCC_WRITE_COMPRESS_DISABLE_MASK	0x1
+/* bit gap */
+#define AMDGPU_TILING_GFX12_SCANOUT_SHIFT			63
+#define AMDGPU_TILING_GFX12_SCANOUT_MASK			0x1
 
 /* Set/Get helpers for tiling flags. */
 #define AMDGPU_TILING_SET(field, value) \
@@ -789,6 +820,21 @@ union drm_amdgpu_wait_fences {
 
 #define AMDGPU_GEM_OP_GET_GEM_CREATE_INFO	0
 #define AMDGPU_GEM_OP_SET_PLACEMENT		1
+#define AMDGPU_GEM_OP_GET_MAPPING_INFO		2
+
+struct drm_amdgpu_gem_vm_entry {
+	/* Start of mapping (in bytes) */
+	__u64 addr;
+
+	/* Size of mapping (in bytes) */
+	__u64 size;
+
+	/* Mapping offset */
+	__u64 offset;
+
+	/* flags needed to recreate mapping */
+	__u64 flags;
+};
 
 /* Sets or returns a value associated with a buffer. */
 struct drm_amdgpu_gem_op {
@@ -796,8 +842,44 @@ struct drm_amdgpu_gem_op {
 	__u32	handle;
 	/** AMDGPU_GEM_OP_* */
 	__u32	op;
-	/** Input or return value */
+	/** Input or return value. For MAPPING_INFO op: pointer to array of struct drm_amdgpu_gem_vm_entry */
 	__u64	value;
+	/** For MAPPING_INFO op: number of mappings (in/out) */
+	__u32	num_entries;
+
+	__u32	padding;
+};
+
+#define AMDGPU_GEM_LIST_HANDLES_FLAG_IS_IMPORT	(1 << 0)
+
+struct drm_amdgpu_gem_list_handles {
+	/* User pointer to array of drm_amdgpu_gem_bo_info_entry */
+	__u64   entries;
+
+	/* Size of entries buffer / Number of handles in process (if larger than size of buffer, must retry) */
+	__u32   num_entries;
+
+	__u32 padding;
+};
+
+struct drm_amdgpu_gem_list_handles_entry {
+	/* gem handle of buffer object */
+	__u32 gem_handle;
+
+	/* Currently just one flag: IS_IMPORT */
+	__u32 flags;
+
+	/* Size of bo */
+	__u64 size;
+
+	/* Preferred domains for GEM_CREATE */
+	__u64 preferred_domains;
+
+	/* GEM_CREATE flags for re-creation of buffer */
+	__u64 alloc_flags;
+
+	/* physical start_addr alignment in bytes for some HW requirements */
+	__u64 alignment;
 };
 
 #define AMDGPU_VA_OP_MAP			1
@@ -815,7 +897,7 @@ struct drm_amdgpu_gem_op {
 #define AMDGPU_VM_PAGE_WRITEABLE	(1 << 2)
 /* executable mapping, new for VI */
 #define AMDGPU_VM_PAGE_EXECUTABLE	(1 << 3)
-/* partially resident texture */
+/* unmapped page of partially resident textures */
 #define AMDGPU_VM_PAGE_PRT		(1 << 4)
 /* MTYPE flags use bit 5 to 8 */
 #define AMDGPU_VM_MTYPE_MASK		(0xf << 5)
@@ -1020,10 +1102,21 @@ struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
  *  Query h/w info: Flag that this is integrated (a.h.a. fusion) GPU
  *
  */
-#define AMDGPU_IDS_FLAGS_FUSION         0x1
-#define AMDGPU_IDS_FLAGS_PREEMPTION     0x2
-#define AMDGPU_IDS_FLAGS_TMZ            0x4
-#define AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD 0x8
+#define AMDGPU_IDS_FLAGS_FUSION			0x01
+#define AMDGPU_IDS_FLAGS_PREEMPTION		0x02
+#define AMDGPU_IDS_FLAGS_TMZ			0x04
+#define AMDGPU_IDS_FLAGS_CONFORMANT_TRUNC_COORD	0x08
+#define AMDGPU_IDS_FLAGS_GANG_SUBMIT		0x10
+
+/*
+ *  Query h/w info: Flag identifying VF/PF/PT mode
+ *
+ */
+#define AMDGPU_IDS_FLAGS_MODE_MASK      0x300
+#define AMDGPU_IDS_FLAGS_MODE_SHIFT     0x8
+#define AMDGPU_IDS_FLAGS_MODE_PF        0x0
+#define AMDGPU_IDS_FLAGS_MODE_VF        0x1
+#define AMDGPU_IDS_FLAGS_MODE_PT        0x2
 
 /* indicate if acceleration can be working */
 #define AMDGPU_INFO_ACCEL_WORKING		0x00
@@ -1090,6 +1183,8 @@ struct drm_amdgpu_cs_chunk_cp_gfx_shadow {
 	#define AMDGPU_INFO_FW_IMU		0x1b
 	/* Subquery id: Query VPE firmware version */
 	#define AMDGPU_INFO_FW_VPE		0x1c
+	/* Subquery id: Query MP5 firmware version */
+	#define AMDGPU_INFO_FW_MP5		0x1d
 
 /* number of bytes moved for TTM migration */
 #define AMDGPU_INFO_NUM_BYTES_MOVED		0x0f
@@ -1347,6 +1442,8 @@ struct drm_amdgpu_info_vbios {
 #define AMDGPU_VRAM_TYPE_DDR5  10
 #define AMDGPU_VRAM_TYPE_LPDDR4 11
 #define AMDGPU_VRAM_TYPE_LPDDR5 12
+#define AMDGPU_VRAM_TYPE_HBM3E 13
+#define AMDGPU_VRAM_TYPE_HBM4 14
 
 struct drm_amdgpu_info_device {
 	/** PCI Device ID */
@@ -1430,6 +1527,7 @@ struct drm_amdgpu_info_device {
 	__u64 high_va_max;
 	/* gfx10 pa_sc_tile_steering_override */
 	__u32 pa_sc_tile_steering_override;
+	__u32 pad;
 	/* disabled TCCs */
 	__u64 tcc_disabled_mask;
 	__u64 min_engine_clock;
@@ -1454,7 +1552,6 @@ struct drm_amdgpu_info_device {
 	__u32 csa_alignment;
 	/* Userq IP mask (1 << AMDGPU_HW_IP_*) */
 	__u32 userq_ip_mask;
-	__u32 pad;
 };
 
 struct drm_amdgpu_info_hw_ip {
@@ -1471,28 +1568,8 @@ struct drm_amdgpu_info_hw_ip {
 	__u32  available_rings;
 	/** version info: bits 23:16 major, 15:8 minor, 7:0 revision */
 	__u32  ip_discovery_version;
-	__u32  num_userq_slots;
-};
-
-/* GFX metadata BO sizes and alignment info (in bytes) */
-struct drm_amdgpu_info_uq_fw_areas_gfx {
-	/* shadow area size */
-	__u32 shadow_size;
-	/* shadow area base virtual mem alignment */
-	__u32 shadow_alignment;
-	/* context save area size */
-	__u32 csa_size;
-	/* context save area base virtual mem alignment */
-	__u32 csa_alignment;
-};
-
-/* IP specific fw related information used in the
- * subquery AMDGPU_INFO_UQ_FW_AREAS
- */
-struct drm_amdgpu_info_uq_fw_areas {
-	union {
-		struct drm_amdgpu_info_uq_fw_areas_gfx gfx;
-	};
+	/* Userq available slots */
+	__u32  userq_num_slots;
 };
 
 struct drm_amdgpu_info_num_handles {
@@ -1569,9 +1646,39 @@ struct drm_amdgpu_info_uq_metadata_gfx {
 	__u32 csa_alignment;
 };
 
+struct drm_amdgpu_info_uq_metadata_compute {
+	/* EOP size for gfx11 */
+	__u32 eop_size;
+	/* EOP base virtual alignment for gfx11 */
+	__u32 eop_alignment;
+};
+
+struct drm_amdgpu_info_uq_metadata_sdma {
+	/* context save area size for sdma6 */
+	__u32 csa_size;
+	/* context save area base virtual alignment for sdma6 */
+	__u32 csa_alignment;
+};
+
 struct drm_amdgpu_info_uq_metadata {
 	union {
 		struct drm_amdgpu_info_uq_metadata_gfx gfx;
+		struct drm_amdgpu_info_uq_metadata_compute compute;
+		struct drm_amdgpu_info_uq_metadata_sdma sdma;
+	};
+};
+
+/* Preserve the libdrm public type until the compatibility wrapper is moved into IGT. */
+struct drm_amdgpu_info_uq_fw_areas_gfx {
+	__u32 shadow_size;
+	__u32 shadow_alignment;
+	__u32 csa_size;
+	__u32 csa_alignment;
+};
+
+struct drm_amdgpu_info_uq_fw_areas {
+	union {
+		struct drm_amdgpu_info_uq_fw_areas_gfx gfx;
 	};
 };
 
@@ -1594,8 +1701,56 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_10_3_6			149 /* GC 10.3.6 */
 #define AMDGPU_FAMILY_GC_10_3_7			151 /* GC 10.3.7 */
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
+#define AMDGPU_FAMILY_GC_11_5_4			154 /* GC 11.5.4 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
+/*
+ * Definition of user options
+ *
+ * option: AMDGPU_PROC_OPTIONS_OP_KFD_SIGBUS_DELAY
+ *    0:          Disable sigbus delay - SIGBUS will be raised immediately
+ *    0xFFFFFFFF: SIGBUS will not be raised
+ *    other:      Set the sigbus delay in milliseconds
+ */
+#define AMDGPU_PROC_OPTIONS_OP_KFD_SIGBUS_DELAY		0
+
+#define AMDGPU_PROC_OPTIONS_KFD_SIGBUS_DELAY_DISABLED	0xFFFFFFFFu
+
+struct drm_amdgpu_proc_options {
+	__u32 op;
+	struct {
+		__u32 value;
+	} kfd_sigbus_delay;
+};
+
+#define DRM_AMDGPU_UALINK_HANDLE_OP_EXPORT		0
+#define DRM_AMDGPU_UALINK_HANDLE_OP_IMPORT		1
+
+struct drm_amdgpu_ualink_handle_in {
+	/* Export or import */
+	__u32 op;
+	/* For future use, no flags defined so far */
+	__u32 flags;
+	union {
+		/* GEM handle of the BO to export */
+		__u32 gem_handle;
+		/* UALink handle to import */
+		__u64 import_ualink_handle[2];
+	};
+};
+
+union drm_amdgpu_ualink_handle_out {
+	/* Exported UALink handle */
+	__u64 export_ualink_handle[2];
+	/** DMABuf representing the imported UALink handle */
+	__u32 import_dmabuf_handle;
+};
+
+union drm_amdgpu_ualink_handle {
+	struct drm_amdgpu_ualink_handle_in in;
+	union drm_amdgpu_ualink_handle_out out;
+};
+
 #if defined(__cplusplus)
 }
 #endif
diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index c7b36970e..f7101015e 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -182,8 +182,8 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 	amdgpu_dma_limits_query(device, &limits);
 
 	if (user_queue)
-		available_rings = hw_ip_info.num_userq_slots ?
-			((1 << hw_ip_info.num_userq_slots) - 1) : 1;
+		available_rings = hw_ip_info.userq_num_slots ?
+			((1 << hw_ip_info.userq_num_slots) - 1) : 1;
 	else
 		available_rings = hw_ip_info.available_rings;
 
@@ -409,8 +409,8 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = ring_context->hw_ip_info.num_userq_slots ?
-			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+		available_rings = ring_context->hw_ip_info.userq_num_slots ?
+			((1 << ring_context->hw_ip_info.userq_num_slots) -1) : 1;
 	else
 		available_rings = ring_context->hw_ip_info.available_rings;
 
@@ -545,8 +545,8 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = ring_context->hw_ip_info.num_userq_slots ?
-			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+		available_rings = ring_context->hw_ip_info.userq_num_slots ?
+			((1 << ring_context->hw_ip_info.userq_num_slots) -1) : 1;
 	else
 		available_rings = ring_context->hw_ip_info.available_rings;
 
@@ -656,8 +656,8 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = ring_context->hw_ip_info.num_userq_slots ?
-			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+		available_rings = ring_context->hw_ip_info.userq_num_slots ?
+			((1 << ring_context->hw_ip_info.userq_num_slots) -1) : 1;
 	else
 		available_rings = ring_context->hw_ip_info.available_rings;
 
@@ -1466,7 +1466,7 @@ bool cmd_ring_available(amdgpu_device_handle device,
 
 	if (user_queue) {
 		/* For user queues, check user queue slots */
-		uint32_t userq_slots = hw_ip_info.num_userq_slots;
+		uint32_t userq_slots = hw_ip_info.userq_num_slots;
 
 		return (ring_id < userq_slots);
 	} else {
@@ -1490,7 +1490,7 @@ uint32_t cmd_get_available_rings(amdgpu_device_handle device,
 		return 0;
 
 	if (user_queue) {
-		return hw_ip_info.num_userq_slots;
+		return hw_ip_info.userq_num_slots;
 	} else {
 		return __builtin_popcountll(hw_ip_info.available_rings);
 	}
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 1f618d5a9..ec230f587 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -58,8 +58,8 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = ring_context->hw_ip_info.num_userq_slots ?
-			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+		available_rings = ring_context->hw_ip_info.userq_num_slots ?
+			((1 << ring_context->hw_ip_info.userq_num_slots) -1) : 1;
 	else
 		available_rings = ring_context->hw_ip_info.available_rings;
 
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 4d3b34003..470f16567 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -920,8 +920,8 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 	igt_assert_eq(r, 0);
 
 	if (user_queue)
-		available_rings = info.num_userq_slots ?
-			((1 << info.num_userq_slots) -1) : 1;
+		available_rings = info.userq_num_slots ?
+			((1 << info.userq_num_slots) -1) : 1;
 	else
 		available_rings = info.available_rings;
 
-- 
2.55.0

