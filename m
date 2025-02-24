Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FFCC021BB
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 19:31:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060BC10E4F0;
	Mon, 24 Feb 2025 19:31:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FvkSQvev";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2064.outbound.protection.outlook.com [40.107.93.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D1110E4F0
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 19:31:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rngi4cxO5MHWenGIIcr5OxFkIkUWYIsQBQayhbRhpIbb48PMnNZvBy1WohzRRYNTHAa4563R603DVENmfPaG4VsfeaDOWqaSrRI0grM0yrJh4Vp/G9K+yL/lw26D2JoOdouO4aC8cswIksux3Uxmb7NRey6VxHUo1VtGASbHBdMVnjILxhxpMAlnEVwmmY0B1wPFa4bvhLqYXPK6S4iPeqOxdGYtkt1UUkg5lsV+VafO+KLWV7JRrwma7fQbLME04bPBKBYE//Ow95RzcfiluLb7Hmf4DEGDFE5rPSk3XvxbZWwQ47vypfGkInjezCQq64iYNm1S505vT6lUxNslzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6LXMjqkjlcFdNeT3AfzcU67pqbPuwRKywpeQdSWI6KE=;
 b=ScQhFHhVR2IIn4JDAyq/pAQ3gfhcPXZB9yEL9+FVaD928A6Iv6L2nSA57qRLJrheYC0InJiSxHj+facITKUmRyg8b+LFVNF9SK3NaQ26qcgdEw/y/aYBF3130jHRt9wv54A5kzv5VWW7zI6cQoMyMsjKg8lBO17Q8/4rXANK3AjcCycr341KRpIen0/Z8ClBi87G/LKcY8Cb5gqEE37CoR60M362aHhisADQyJcptlRnGBMcvxXl/Epcp6l0XCSX8PBToev08z6wI1B8Seb7uEJLRddcLxAz2jeK+ypceVToXUUlzaSBVsFCjRIrMIiYJJMZcJNPNl0uADS6jTEgTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6LXMjqkjlcFdNeT3AfzcU67pqbPuwRKywpeQdSWI6KE=;
 b=FvkSQvevksWD2wl3rMjssPBHF6nl5Uhg3AnyCnB+UzZBY38jxOrdVaX2jakHREqI9dt0nl0hTNqmZqZrT2vXYFHWB6XKVMBNs72cQ1CLugdMw61f8D5PJbLJhmDsPL/vTi6NPtg22TOf0Ihqfer5LyHCuezWT4QMjN3Kgzz+AFc=
Received: from BL1PR13CA0207.namprd13.prod.outlook.com (2603:10b6:208:2be::32)
 by PH7PR12MB5902.namprd12.prod.outlook.com (2603:10b6:510:1d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 19:31:06 +0000
Received: from BN3PEPF0000B06E.namprd21.prod.outlook.com
 (2603:10b6:208:2be:cafe::b5) by BL1PR13CA0207.outlook.office365.com
 (2603:10b6:208:2be::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16 via Frontend Transport; Mon,
 24 Feb 2025 19:31:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B06E.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.0 via Frontend Transport; Mon, 24 Feb 2025 19:31:06 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 13:31:03 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 13:31:02 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 24 Feb 2025 13:30:56 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: Add support for page queues in amd_deadlock
Date: Mon, 24 Feb 2025 14:30:52 -0500
Message-ID: <20250224193052.43323-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06E:EE_|PH7PR12MB5902:EE_
X-MS-Office365-Filtering-Correlation-Id: 0945eb10-5d1b-4092-41d5-08dd5509c857
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?61+eSAV2wT1iSsuRhtxVOgcOwFk7NEIPHL2EPLIq+qJy4PqVEJgt8zxnio9Z?=
 =?us-ascii?Q?3lzwJ0xaNqwQzVC8hl+4y69hCRbU3EwHuEvc8LpzKSbS7GNzM5GxSBWnwIWq?=
 =?us-ascii?Q?N7EzR+BeBQEJ6qDR9Tiq97ICTGrnehj3Jni7P3txUTkgJNpeJeWI9i5jnznT?=
 =?us-ascii?Q?ug6OAGUQOw24T1/mlGLuAO9GWRzBTbhTC4JqEChc2UDi79Ejhc0DCwCgZEoP?=
 =?us-ascii?Q?wnO9pwoiyLLPHtWQsOWhq6UVfl16y9hzTRlftBi4L6zNhOn0NbPxUAYDteFL?=
 =?us-ascii?Q?MjoPdj1xlAZObDhDNRncNqVpjFxB5amzCFf0pMIJLyXEhQu3IVXpYX+AK6sv?=
 =?us-ascii?Q?2P24fQYDRqJ9AisADnEaVYZ3M+4ZOavCzvIjY5cw1cCIetN9bI94NfArcUFG?=
 =?us-ascii?Q?yo8Lrvz1Mot8uIjO0HAAyQBt91uYLOSUM9fad4sq5mEEC9QHYtrEMBLmFV02?=
 =?us-ascii?Q?eO780MwG9boysl1fdbpfNweNbMnBfYSHQtImbiP5jh8ev45VPh4m0/2L5ekX?=
 =?us-ascii?Q?8NA/0eXz+1XMzRGzeA24mwnhB31gB+NOCWrMkqQ+LGXgf+JnMIgA56jPn15v?=
 =?us-ascii?Q?tH0tC2Wb+9WlB6qvXkAdU1lfzPnXDEhecollifXTjQ61K0SNhxHs5IeSF06r?=
 =?us-ascii?Q?k25KmjI5A2o+dH7C1YV6PfXP2VuuBJ2byI6kPpUm1ShNKFt21NakNjaV4Z8D?=
 =?us-ascii?Q?Jek4qQPrTSn3FzA8C3CbH1znSO52hdEv50uYSl5FJ9gH724hYgqK5xPoOwwu?=
 =?us-ascii?Q?Fo3DwukAxZfP+AXhTV4+D3nTm7Q0zFOBQYASv8nFI230R/X/be9DVODCSKEW?=
 =?us-ascii?Q?Yo5O492xjIDXu37stru8Ob0YRLrbj3O1kCJBOSUpjIm91qNBcPWWKCvHG2TZ?=
 =?us-ascii?Q?sGvSExt0USe0a4zRwbcs2jtHUAC9yUAQKCB1l9xDMFbh7QUAmjMyFfe8yqcE?=
 =?us-ascii?Q?BNo6Fe9XFLB/1PmN9qPvt6gjMFhoiXtffTXeIJf5PjAW+9AbzlAKIAWzh1Ya?=
 =?us-ascii?Q?VYj+HycvXCzJBILSiBe6TdkmduA23AZmkbpO+LovjFuPY20IW0x7zwa/TDPb?=
 =?us-ascii?Q?yqFDECunoTzc7ZhgBNXUNKlYYpm61QnnyXs7B5eF5S4nPdlX27VK/+Wzx23l?=
 =?us-ascii?Q?ViKNlVW7KZ+9IIgn+UbFYY11YipZJq7ekFpq7WxTAOD4mqVBDwgzNr4hdp+m?=
 =?us-ascii?Q?9TbxgHqZpZnc+6LhuPRmL684oKBEHdxo7OvUTuEYte0jmsJnU+OGXxU3aWUa?=
 =?us-ascii?Q?DDmePA/v3gH9hTaW9TsATIddaQUwwc0exoXv9cnxalyy2eYO4krbn5mv59SZ?=
 =?us-ascii?Q?eOXUvsxVmyOx1KKGtCR+eDECqg+0jTdohdQ+CjQDB5HdQnuqzUkjeceOpP6m?=
 =?us-ascii?Q?jP4/ipFyzkt2dm4Jfw8xAgYUSEROqxGzSy6TXNXtV0b67NZ49XS+hX8ImDiI?=
 =?us-ascii?Q?SXdcRtp5UsGO88O/8dBCSSyF1LG41akrGpRpoWV8UUMVTwgjXY+FdQSu3jFX?=
 =?us-ascii?Q?kG028sNTVthIPiY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 19:31:06.0238 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0945eb10-5d1b-4092-41d5-08dd5509c857
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06E.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5902
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

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

This commit enhances deadlock handling by adding support
for page queues and refining the logic for enabling and
disabling scheduling rings.

1. New Function is_support_page_queue:
   - Checks for the existence of page queue files for a given
     IP block type and PCI address.

2. Updated amdgpu_wait_memory_helper:
   - Adjusts scheduling ring logic based on page queue support.
   - Calls is_support_page_queue to determine page queue availability.
   - Enables two rings (SDMA GFX queue and page queue) if supported.

3. Similar Updates to Other Functions:
    - Applies consistent page queue handling in
      bad_access_ring_helper and amdgpu_hang_sdma_ring_helper.
    - Ensures uniform logic across all relevant helper functions.

V2: Move is_support_page_queue into the amd_ip_block file to
    allow other test cases to access this function,
    and rephrase the commit message (Vitaly)

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 70 ++++++++++++++++++++++++-------
 lib/amdgpu/amd_ip_blocks.c        | 27 ++++++++++++
 lib/amdgpu/amd_ip_blocks.h        |  3 ++
 3 files changed, 85 insertions(+), 15 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index d7bf0e111..c8a48930e 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -179,16 +179,19 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 	FILE *fp;
 	char cmd[1024];
 	char buffer[128];
-	long sched_mask = 0;
+	uint64_t sched_mask = 0, ring_id;
 	struct drm_amdgpu_info_hw_ip info;
-	uint32_t ring_id, prio;
+	uint32_t  prio;
 	char sysfs[125];
+	bool support_page;
 
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
+	support_page = is_support_page_queue(ip_type, pci);
+
 	if (ip_type == AMD_IP_GFX)
 		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
 			pci->domain, pci->bus, pci->device, pci->function);
@@ -215,7 +218,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
 	}
 
-	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id += 1) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
 			continue;
@@ -239,9 +242,20 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 		}
 
 		if (sched_mask > 1) {
-			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
-						0x1 << ring_id, sysfs);
-			igt_info("Disable other rings, keep only ring: %d enabled, cmd: %s\n", ring_id, cmd);
+			/* If page queues are supported, run with
+			 * multiple queues(sdma gfx queue + page queue)
+			 */
+			if (support_page) {
+				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+							0x3 << ring_id, sysfs);
+				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
+				ring_id++;
+
+			} else {
+				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+							0x1 << ring_id, sysfs);
+				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
+			}
 			r = system(cmd);
 			igt_assert_eq(r, 0);
 		}
@@ -411,16 +425,18 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 	FILE *fp;
 	char cmd[1024];
 	char buffer[128];
-	long sched_mask = 0;
+	uint64_t sched_mask = 0, ring_id;
 	struct drm_amdgpu_info_hw_ip info;
-	uint32_t ring_id, prio;
+	uint32_t prio;
 	char sysfs[125];
+	bool support_page;
 
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
+	support_page = is_support_page_queue(ip_type, pci);
 	if (ip_type == AMD_IP_GFX)
 		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
 			pci->domain, pci->bus, pci->device, pci->function);
@@ -447,7 +463,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
 	}
 
-	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id++) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
 			continue;
@@ -471,9 +487,20 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 		}
 
 		if (sched_mask > 1) {
-			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+			/* If page queues are supported, run with
+			 * multiple queues(sdma gfx queue + page queue)
+			 */
+			if (support_page) {
+				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+						0x3 << ring_id, sysfs);
+				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
+				ring_id++;
+			} else {
+				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x1 << ring_id, sysfs);
-			igt_info("Disable other rings, keep only ring: %d enabled, cmd: %s\n", ring_id, cmd);
+				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
+			}
+
 			r = system(cmd);
 			igt_assert_eq(r, 0);
 		}
@@ -496,16 +523,17 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 	FILE *fp;
 	char cmd[1024];
 	char buffer[128];
-	long sched_mask = 0;
+	uint64_t sched_mask = 0, ring_id;
 	struct drm_amdgpu_info_hw_ip info;
-	uint32_t ring_id;
 	char sysfs[125];
+	bool support_page;
 
 	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_DMA, 0, &info);
 	igt_assert_eq(r, 0);
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no ring for the sdma\n");
 
+	support_page = is_support_page_queue(AMDGPU_HW_IP_DMA, pci);
 	snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
 			pci->domain, pci->bus, pci->device, pci->function);
 	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
@@ -522,14 +550,26 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
 	} else
 		sched_mask = 1;
 
-	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id++) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
 			continue;
 
 		if (sched_mask > 1) {
-			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+			/* If page queues are supported, run with
+			 * multiple queues(sdma gfx queue + page queue)
+			 */
+			if (support_page) {
+				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
+						0x3 << ring_id, sysfs);
+				igt_info("Disable other rings, keep ring: %ld and %ld enabled, cmd: %s\n", ring_id, ring_id + 1, cmd);
+				ring_id++;
+			} else {
+				snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s",
 						0x1 << ring_id, sysfs);
+				igt_info("Disable other rings, keep only ring: %ld enabled, cmd: %s\n", ring_id, cmd);
+			}
+
 			r = system(cmd);
 			igt_assert_eq(r, 0);
 		}
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 7c71a8952..4eaf639b3 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -6,6 +6,7 @@
  */
 
 #include <fcntl.h>
+#include <glob.h>
 
 #include "amd_memory.h"
 #include "amd_ip_blocks.h"
@@ -1132,3 +1133,29 @@ int get_pci_addr_from_fd(int fd, struct pci_addr *pci)
 
 	return 0;
 }
+
+/*
+ * Function to check if page queue files exist for a given IP block type and PCI address
+ */
+bool is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci)
+{
+	glob_t glob_result;
+	int ret;
+	char search_pattern[1024];
+
+	/* If the IP type is not SDMA, return false */
+	if (ip_type != AMD_IP_DMA)
+		return false;
+
+	/* Construct the search pattern for the page queue files */
+	snprintf(search_pattern, sizeof(search_pattern) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_ring_page*",
+		pci->domain, pci->bus, pci->device, pci->function);
+
+	/* Use glob to find files matching the pattern */
+	ret = glob(search_pattern, GLOB_NOSORT, NULL, &glob_result);
+	/* Free the memory allocated by glob */
+	globfree(&glob_result);
+
+	/* Return true if files matching the pattern were found, otherwise return false */
+	return (ret == 0 && glob_result.gl_pathc > 0);
+}
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 595b2b16b..fc9df6c78 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -237,4 +237,7 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
 
 int
 get_pci_addr_from_fd(int fd, struct pci_addr *pci);
+
+bool
+is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci);
 #endif
-- 
2.34.1

