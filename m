Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B0AEC3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 06:09:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B39010E32E;
	Thu,  8 May 2025 06:09:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="08vMOtFu";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A79F10E32E
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 06:09:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rTT7+1Motmj5D8pRZ7fIEuMr9Fr79MCMS7ZdttODT73SPbiGxCxJ91qLrmqsnQarw+37qq1gAycMapJAKweEFLACH+t5vnLMYFgoIt7iKtU3lUYlyHTyWme+3IrJPRsDyMzdgZFXdDF6/wSM9TFN6Kr1Siw4B/KsE6VDrIZytuLTYqzHGdVfuKnzeF2M/U2ukHjchWOLw+ExPJKDYH5VkX5QetN0ZdlBK0Sphb+uBEXrk+lGxLmMNi+RPIZPyJukUzm/RUoeIVcgi8e84u5GIaXKK2NW8sd6i2ohIHJf9Kg04fnZOcVewZJK6mBsKV4xGL06oixip+2GpmoaLtUwtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OSTCmEYHACVZkS1aLTyi4GxNgMaehp0c0n0NkwIhnHI=;
 b=D2EWBNm5rTXrh8GANZlGv4x/BPRVRCHAjtyG9SdRqx5Uj3t6syG9NVnDLO9ddUc3bJ09HpDWT9pkwnbx3/zyqFHDgwHLeYdSMvgtTx40/r3wHBRQ3/F6IUWvM4FhDq3x7Rw63iyKd2hKJA8coQ8lbOY8nfwudcZZfm9OHlrzsuRxjTnl5I6GA/CcwxDWERS2/Ts1POHoa/5WHU9QAx0XYj1lmwCghqMJ8V/ZAjN3azwSF+Dh4XJ2XFGPPrbCZ2/iicrsNWukIUIZRwX4U3+guQ31n5Al+PSbwoy/U+jSUEzLpQzoP2hq2m9QMl/YyQpYOJGu8NXkGupgWFyC/2Tyrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OSTCmEYHACVZkS1aLTyi4GxNgMaehp0c0n0NkwIhnHI=;
 b=08vMOtFumUcB5Vr6OknjJij3JUEKL0h7+fkw1BTcN0I5W9abCFWl98wxT7W8N6nQiKDIVk5jTe3DElf5a3TebmQFlvOg4USSRqiY60BoTo4uy/FC9aZ3F9Uu9Hx34CKyFJNSR0Ojm9/CnKYc1gTbNP8YAl2NnFOLPcE//bHvMug=
Received: from BN0PR08CA0014.namprd08.prod.outlook.com (2603:10b6:408:142::23)
 by CH1PPFD8936FA16.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::624) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 8 May
 2025 06:09:27 +0000
Received: from BN1PEPF00004682.namprd03.prod.outlook.com
 (2603:10b6:408:142:cafe::b6) by BN0PR08CA0014.outlook.office365.com
 (2603:10b6:408:142::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Thu,
 8 May 2025 06:09:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004682.mail.protection.outlook.com (10.167.243.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 06:09:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 01:09:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 01:09:25 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 8 May 2025 01:09:14 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 2/3] lib/amdgpu: enhance command submission and error
 handling with user queue support
Date: Thu, 8 May 2025 14:07:05 +0800
Message-ID: <20250508060900.2821847-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
References: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004682:EE_|CH1PPFD8936FA16:EE_
X-MS-Office365-Filtering-Correlation-Id: dbb8e74a-ac2a-4a80-ebeb-08dd8df6e30a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cyCHN2hj0RvXribx2Gu7brabG1t21bSXm3O0PS4iEZzF4pnzqlgPnyObVM2r?=
 =?us-ascii?Q?nUYIIWc/mHc/XDJ6c2KLomH1ZvsasIea6tp/hJG9+yDYUYW9JpMD3Hjb62lO?=
 =?us-ascii?Q?joBgDhZWpnSaM7v7bcjJ4lIcUO/zDQjU+Xe1KuT8/MOtitXTl3+epxDTCziS?=
 =?us-ascii?Q?ifBvlja6Gh3kyHt+l3eepkIVwCBqLZSxDcvaPFy6xmqGc8MMAkSaZrHs3XYn?=
 =?us-ascii?Q?v1W/WzBNq+MPBmU35TV9y0+y1F2cHLFZ8L2xSwdvRHTn984X1BBHqUDp3Si3?=
 =?us-ascii?Q?X922qCXBKK++qFDKLBZSx4wHEfxoeBuj81OkdpZsmF4/fLLEhAmN1TO353mL?=
 =?us-ascii?Q?ZOMuBRCwMI8toLTqukz4Y2xYbSIKcsvy3cBRqjbelL/zQMueJnyplJQs2cvc?=
 =?us-ascii?Q?L29TB3yc6M/+SM0vnC6i8w/nDEwyed0GPRMOmGRty2Gzia8oZhqv/Xt3MT/9?=
 =?us-ascii?Q?/eRe6pCDI6qXylBPcNmKtaVmCTjURlkbR0MTWUxQ34VF4tiDSuUkEcC5XmuX?=
 =?us-ascii?Q?qXGWhfa1R4tXmSUh0jGfbjXriIdSlOEWpO+qdy5Vk+kW2PxWar2vzeORmCV+?=
 =?us-ascii?Q?33ntdD5d0/Tpoj+dss+Pokob/P9F4+lzUsaEXM5if+vC0ZHT+efXNt+ysA61?=
 =?us-ascii?Q?7hgTwv4wCDuFsUmeKLJIOmv8Gheo03GIqfV3jjUmxHuL1cTcaqzeqx4agH3u?=
 =?us-ascii?Q?ICz4GdEkxn1WE16FDt4O41GeE8WRP9mGORND1+NUY9mLz4VsVqLA1HE8PMI3?=
 =?us-ascii?Q?tkUU48RvsucuxI5nwdIqfzEeqZWunecUkAvFi/+dKvkPVVEHDJ+5xseCtZTW?=
 =?us-ascii?Q?Nqk4SGTDAeC+jsqghUEI2Ec6YPh/Ia25lhUfB1y6bsqCh8PL2UXFyMHNDvl/?=
 =?us-ascii?Q?qSv35jz5sfm/PTziHhTbcQgRhd/n3rj7Gb6wVhK1t91ME7oOOBUvpZbn4VR7?=
 =?us-ascii?Q?TUOYeh3BwQ+dumZ7TvTTdd3x2K9u5UVClAsUzTwHPZHLujFlN3yy/+3btKgc?=
 =?us-ascii?Q?I7LP/paerTsrpcWqLdvsKZoHT9c6nZhFOGfZvEkIljgnriVbwRt104uXN1e4?=
 =?us-ascii?Q?9SFHVg2VcCzqzN78XWwJVcaW5Q5d0Io738xkZHxRb2wvg8AgBj7cGTfMaynp?=
 =?us-ascii?Q?DWTIf+yaxwRZkxap2OC/E1fr5pbVCCq9lXfHxd3rKa6cacgI+RwPR0Goq+nP?=
 =?us-ascii?Q?9Y0QfjWeP0kUBY/ZpZHI+SYpqroJhcbqwmVYgQ0prg4tmERxDAVrrJc3v5IC?=
 =?us-ascii?Q?XkUZYZiwGOjqAw4pqy0ncVoXJ9/s12OeFJjdc8gHR74Ta62ZCNc7yySz/Eld?=
 =?us-ascii?Q?jyvclDFcybnm2rzGN2vEVsXgeNOClBADohBQXuM+B7floU55Jv56QUFQDh10?=
 =?us-ascii?Q?e7DtyLCDz/NMnk/mE7SZxijahsjcmeTX/A37txhq3Fu5szQe+ZIyd1Vud/i+?=
 =?us-ascii?Q?9+OcYb2f0hcK9KexDZkMSj9mnqhLxdgMkosze6SPgdJfaNPpi2f9AWV5HZB8?=
 =?us-ascii?Q?7DLTQdYRR59Ae+CMoYM2OTgBUn8YV7R/S9/f?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:09:26.6651 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbb8e74a-ac2a-4a80-ebeb-08dd8df6e30a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004682.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFD8936FA16
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

This patch introduces several improvements to AMDGPU command submission
and error handling infrastructure:

1. Fixed typos in time_out field initialization (rint_context -> ring_context)
   across multiple helper functions.

2. Enhanced bad_access_helper() to support user queues:
   - Added user_queue parameter to control submission path
   - Implemented separate handling for user queue vs legacy path
   - Added proper timeout initialization
   - Used sync object based buffer allocation (amdgpu_bo_alloc_and_map_sync)
   - Added timeline syncobj wait after user queue operations

3. Updated bad_access_ring_helper() to:
   - Accept user_queue parameter
   - Skip ring iteration for user queues (hardware scheduled)
   - Add version check for user queue support
   - Pass user_queue flag to bad_access_helper()

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 54 ++++++++++++++++++++++++-------
 lib/amdgpu/amd_deadlock_helpers.h |  2 +-
 2 files changed, 43 insertions(+), 13 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index c8a48930e..f52bf70e5 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -12,6 +12,7 @@
 #include <signal.h>
 #include "amd_memory.h"
 #include "amd_deadlock_helpers.h"
+#include "lib/amdgpu/amd_userq.h"
 #include "lib/amdgpu/amd_command_submission.h"
 
 #define MAX_JOB_COUNT 200
@@ -274,7 +275,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 
 static void
 bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
-			unsigned int ip_type, uint32_t priority)
+			unsigned int ip_type, uint32_t priority, bool user_queue)
 {
 
 	const struct amdgpu_ip_block_version *ip_block = NULL;
@@ -287,10 +288,14 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
 
-	if (priority == AMDGPU_CTX_PRIORITY_HIGH)
-		r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
-	else
-		r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
+	if (user_queue) {
+		amdgpu_user_queue_create(device_handle, ring_context, ip_type);
+	} else {
+		if (priority == AMDGPU_CTX_PRIORITY_HIGH)
+			r = amdgpu_cs_ctx_create2(device_handle, AMDGPU_CTX_PRIORITY_HIGH, &ring_context->context_handle);
+		else
+			r = amdgpu_cs_ctx_create(device_handle, &ring_context->context_handle);
+	}
 	igt_assert_eq(r, 0);
 
 	/* setup parameters */
@@ -299,16 +304,28 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
 	ring_context->ring_id = 0;
+	ring_context->user_queue = user_queue;
+	ring_context->time_out = 0x7ffff;
 	igt_assert(ring_context->pm4);
 	ip_block = get_ip_block(device_handle, ip_type);
-	r = amdgpu_bo_alloc_and_map(device_handle,
+	r = amdgpu_bo_alloc_and_map_sync(device_handle,
 				    ring_context->write_length * sizeof(uint32_t),
 				    4096, AMDGPU_GEM_DOMAIN_GTT,
-					AMDGPU_GEM_CREATE_CPU_GTT_USWC, &ring_context->bo,
+				    AMDGPU_GEM_CREATE_CPU_GTT_USWC,
+				    AMDGPU_VM_MTYPE_UC,
+				    &ring_context->bo,
 				    (void **)&ring_context->bo_cpu,
 				    &ring_context->bo_mc,
-				    &ring_context->va_handle);
+				    &ring_context->va_handle,
+				    ring_context->timeline_syncobj_handle,
+				    ++ring_context->point, user_queue);
 	igt_assert_eq(r, 0);
+	if (user_queue) {
+		r = amdgpu_timeline_syncobj_wait(device_handle,
+			ring_context->timeline_syncobj_handle,
+			ring_context->point);
+		igt_assert_eq(r, 0);
+	}
 
 	memset((void *)ring_context->bo_cpu, 0, ring_context->write_length * sizeof(uint32_t));
 	ring_context->resources[0] = ring_context->bo;
@@ -320,8 +337,12 @@ bad_access_helper(amdgpu_device_handle device_handle, unsigned int cmd_error,
 
 	amdgpu_bo_unmap_and_free(ring_context->bo, ring_context->va_handle, ring_context->bo_mc,
 				 ring_context->write_length * sizeof(uint32_t));
-	free(ring_context->pm4);
-	free(ring_context);
+	if (user_queue) {
+		amdgpu_user_queue_destroy(device_handle, ring_context, ip_block->type);
+	} else {
+		free(ring_context->pm4);
+		free(ring_context);
+	}
 }
 
 #define MAX_DMABUF_COUNT 0x20000
@@ -419,7 +440,7 @@ amdgpu_hang_sdma_helper(amdgpu_device_handle device_handle, uint8_t hang_type)
 	free_cmd_base(base_cmd);
 }
 
-void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci)
+void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_queue)
 {
 	int r;
 	FILE *fp;
@@ -436,6 +457,15 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
+	if (user_queue) {
+		if (info.hw_ip_version_major < 11) {
+			igt_info("SKIP ... as user queueu doesn't support %d\n", ip_type);
+			return;
+		}
+		/* No need to iterate each ring, user queues are scheduled by hardware */
+		bad_access_helper(device_handle, cmd_error, ip_type, prio, user_queue);
+		return;
+	}
 	support_page = is_support_page_queue(ip_type, pci);
 	if (ip_type == AMD_IP_GFX)
 		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
@@ -505,7 +535,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 			igt_assert_eq(r, 0);
 		}
 
-		bad_access_helper(device_handle, cmd_error, ip_type, prio);
+		bad_access_helper(device_handle, cmd_error, ip_type, prio, user_queue);
 	}
 
 	/* recover the sched mask */
diff --git a/lib/amdgpu/amd_deadlock_helpers.h b/lib/amdgpu/amd_deadlock_helpers.h
index 1d654c490..fdbeb409c 100644
--- a/lib/amdgpu/amd_deadlock_helpers.h
+++ b/lib/amdgpu/amd_deadlock_helpers.h
@@ -29,7 +29,7 @@
 void
 amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int ip_type, struct pci_addr *pci);
 void
-bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci);
+bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd_error, unsigned int ip_type, struct pci_addr *pci, bool user_queue);
 
 void
 amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t hang_type, struct pci_addr *pci);
-- 
2.49.0

