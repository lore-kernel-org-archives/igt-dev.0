Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD46C021B3
	for <igt-dev@archiver.kernel.org>; Mon, 24 Feb 2025 07:23:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 149E010E07A;
	Mon, 24 Feb 2025 07:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2nBzQTvP";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D621210E07A
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Feb 2025 07:23:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BB7PYqYcyx8BWk0uPOSmzU9ypRnBjfxkrDgDpwT6Us1dP9NXFU3yXkmIb1tSJAaeYppumHPldHgETLoImpdN8CXkfo1NqzTLCCIWGavL5zhQYJzPEdWrQB9LPoIfPCTzYKdPCNvW9tdYrAPFZxPlwzL0q+gQ0QHgrTrsAVpCtvtiZiCX6r+hg3orBxXGxksNJXX0vo9hSClQT6f20/ysiMZ70D/2R76MFHoCGeoYiWb8u/10jchpHboCxSOLxAkA9VfbSO4oDvOO/0OrQ3BlyJMDuCncz4SBLfbamxikChPvPjnhJiGNeAOgDzPxOaR7Jo7Uqh4PV5bfTUN8VrL8mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/UWwLDKN/DzHfd10xt4m4af7Qvzmo6JMgocySS5W8I=;
 b=IWCa6p6jHIawY15fCfeXjnkqTauDwRH4gK1k8o1x8N+LN8uVZVIk2ZzG1+mGsV1SWqhKTF1pQdG5mQ1PkktQZNVGa0/wgA9FtL8BbzRItF73K7/ROLSNfQiNQhoDzhxk4URIg/jUZFYv9D9NbX8ABt3XKtKXHfGV+SVLW6RI5Ci4JCnyfYXW822pTkEaxHP/I07wJW1SWWK+WmOA8jC8Xum+RWHvevmkaHfideruPfv7o8eIcvJBAciCqd+FJcKeJVUpwBqHVfM0eGVeETi4vzzRcsYFOkvmAzz8+DRQaEfg6W6ijMU4scw/Si7vKNPBNl+6x10HEp4Cc38Xvj4XVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/UWwLDKN/DzHfd10xt4m4af7Qvzmo6JMgocySS5W8I=;
 b=2nBzQTvPaOR7UUMP/sR134lfztEyc/QR7G/K6P7h86nkI/fh9Pqd1Q1jwLGjYjSgBYoF0y3OzwvXzMMoyVSMZJIis7Z0j/epV/kDXKQ23tkPSSmSueG3BXVGR6qEhEwMF/tfb1eUmhS2R9tPCLfc6qk8tYE3V8Knckqxi8yTqpI=
Received: from DM6PR11CA0032.namprd11.prod.outlook.com (2603:10b6:5:190::45)
 by SN7PR12MB8818.namprd12.prod.outlook.com (2603:10b6:806:34b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.16; Mon, 24 Feb
 2025 07:23:19 +0000
Received: from DS1PEPF00017095.namprd03.prod.outlook.com
 (2603:10b6:5:190:cafe::2d) by DM6PR11CA0032.outlook.office365.com
 (2603:10b6:5:190::45) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.20 via Frontend Transport; Mon,
 24 Feb 2025 07:23:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017095.mail.protection.outlook.com (10.167.17.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8466.11 via Frontend Transport; Mon, 24 Feb 2025 07:23:19 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 01:23:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 24 Feb
 2025 01:23:18 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 24 Feb 2025 01:23:17 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: ad support for page queues in amd_deadlock
Date: Mon, 24 Feb 2025 15:23:16 +0800
Message-ID: <20250224072316.4117581-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017095:EE_|SN7PR12MB8818:EE_
X-MS-Office365-Filtering-Correlation-Id: 95c1742e-fe03-47f8-bd5e-08dd54a41d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p6rrxVJQ9i/zbl0+7lJxTTcL8gBTeMcd5MjMLe5ynptRjSmQwJaNWG6qRb/q?=
 =?us-ascii?Q?3N/JhNESK+lr/GRacvkZS3XEvWWHsY2/cojCRZCr0Z/NfV9aJPFKoypDUYPt?=
 =?us-ascii?Q?2nR1t7HM/3L7g29HX4IaMtDHSHEtr+oykZMzsqEZ+U212rhR7Q25Pjf5H/Bb?=
 =?us-ascii?Q?vn+PRWDhi6FN7zpORjXbaqhlrBB10nGh5RjvvHSChb0COO9vCx6mAQYXMFKx?=
 =?us-ascii?Q?gQRvOdWEsjD6Ig5olqDG/c7Z5PtHOfH2zYDw7ykkL5XnFKKMM3YAra5wKqVC?=
 =?us-ascii?Q?DRuZqktA9kqexjJ62BZRdX31OHs4d9FEH9HJSZDsshRV4ZrmASw0R1sZ6mPv?=
 =?us-ascii?Q?DL5Z4IsucQqTbgTThxlMjk9pmdpZNQ99DlCpTZGhNxL9QGzWAWZ0lopo8h6y?=
 =?us-ascii?Q?N7QVC++ssNuZOFJDlItjit92qCOaB/R3kWg06GDMDukPf6cxXaoUkZrkethR?=
 =?us-ascii?Q?Ueb1+aYhLZAU5fE1DWKSpw6WqrNXDxly7Iw+BSsG+pfVuk8rKZpvjN5Dftfh?=
 =?us-ascii?Q?AQPESwdZ96s0m5yc8Zi8QepnwAatkdykca4/M1McEwSQFEBJlI/f1YflDNHj?=
 =?us-ascii?Q?kFzBCUfUYR6KjYSz8ZDrfwBKR+SvSGYqw11YIMlDY9G2H5EZ1/Yx/4iyKrT/?=
 =?us-ascii?Q?FNA073yV6AjDnuTrRObMKBImN7cHAUQZfbYLEMCJFyGsh8lBHTtLFfFvxNYk?=
 =?us-ascii?Q?Th+DOP+UnbkBSIpvgGCR02iEELMKBtYU0/JuJ14btg+K1uOn2tICrH4S8QED?=
 =?us-ascii?Q?WCyrh8nGubhgIfLMaaVeZMfkUc7M9c+z1GzwU3kOJikIAw26Oe7Vff9ILRnM?=
 =?us-ascii?Q?EsfxLm6bRe5gdf2MFeA8kgAZGIKUVTN6dFuAzIeZtJrKCXLdbhuVikalnO63?=
 =?us-ascii?Q?RaGbZMTo8lF5g6UvJcM0PUxAec7C9VDpx+XXvV+z+APBoW2S15tbi8XVy3PE?=
 =?us-ascii?Q?n+mMbehffLpb5djwKov1Ns+Qgzpy4I77lzUWInyQrQT8r39kGF+lm/TVb1BY?=
 =?us-ascii?Q?/nUCKrNYrcj9V5Tncnw+nQ3NOnTucKFTxft0Pic4pPmWZ14+vcvi3MYXGR+q?=
 =?us-ascii?Q?LNt9zuj+xhwztxZEBALV/kvaMGt6mmnB7X30RNCILL/QignPbqwOvBVGGSZK?=
 =?us-ascii?Q?TIsBMo8hqHy8YfOt+6urkY5Pvrae8lOQHMocme0GcqSwY9kIeBFG8rXjZHBu?=
 =?us-ascii?Q?znfmXWowwmPSyfNKtvpYxnvHq23I/5UIyh2kOagX3RemaMHH1Zb9ZXFlFymY?=
 =?us-ascii?Q?f9GP1Km9yDsjXFrcy+KLVp6fKPlGPkPkRpCIUHIsTyMAhSpVxw7sFVUaZMe+?=
 =?us-ascii?Q?sdOTkXwuACInGXUdH8jxafejFzYJiutpVopyDGlEJtimdYACiTNBZ8V0DD50?=
 =?us-ascii?Q?Doj99lse1INq8FohkZuOpUcqqFnvT/RE0PN3dOgfmghlF4H8tDNyIqrEBLi5?=
 =?us-ascii?Q?dcQ8pthJjZc+r+MLrAl2T6GlVzWT805Lcw2tCFKBF2Zr0wLLVEG3ZA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2025 07:23:19.4219 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95c1742e-fe03-47f8-bd5e-08dd54a41d0b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017095.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8818
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

This commit introduces enhancements to the deadlock to handle
page queues and modify the logic for enabling/disabling scheduling rings.

- New Function `is_support_page_queue`:
  - Checks if page queue files exist for a given IP block type and PCI address.

- Modify `amdgpu_wait_memory_helper`:
  - Updates the logic for enabling/disabling scheduling rings based on whether page queues are supported.
  - Calls `is_support_page_queue` to check if page queues are supported.
  - If page queues are supported, enables two rings (sdma gfx queue and page queue).

- Similar Modifications in Other Functions:
  - Applies similar logic to handle page queues in `bad_access_ring_helper` and `amdgpu_hang_sdma_ring_helper`.
  - Ensures consistency across different helper functions, maintaining the same logic for handling page queues.

 Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
 Cc: Christian Koenig <christian.koenig@amd.com>
 Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 96 ++++++++++++++++++++++++++-----
 1 file changed, 81 insertions(+), 15 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index d7bf0e111..3463653a7 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -10,6 +10,7 @@
 #include <unistd.h>
 #include <pthread.h>
 #include <signal.h>
+#include <glob.h>
 #include "amd_memory.h"
 #include "amd_deadlock_helpers.h"
 #include "lib/amdgpu/amd_command_submission.h"
@@ -26,6 +27,31 @@ struct thread_param {
 static int
 use_uc_mtype = 1;
 
+/* Function to check if page queue files exist for a given IP block type and PCI address */
+static bool
+is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci)
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
+
 static void*
 write_mem_address(void *data)
 {
@@ -179,16 +205,19 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
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
@@ -215,7 +244,7 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
 		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
 	}
 
-	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id += 1) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
 			continue;
@@ -239,9 +268,20 @@ void amdgpu_wait_memory_helper(amdgpu_device_handle device_handle, unsigned int
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
@@ -411,16 +451,18 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
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
@@ -447,7 +489,7 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 		igt_info("The scheduling ring only enables one for ip %d\n", ip_type);
 	}
 
-	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
+	for (ring_id = 0; ((uint64_t)0x1 << ring_id) <= sched_mask; ring_id++) {
 		/* check sched is ready is on the ring. */
 		if (!((1 << ring_id) & sched_mask))
 			continue;
@@ -471,9 +513,20 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
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
@@ -496,16 +549,17 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
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
@@ -522,14 +576,26 @@ void amdgpu_hang_sdma_ring_helper(amdgpu_device_handle device_handle, uint8_t ha
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
-- 
2.25.1

