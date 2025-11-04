Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E32CCF9E3
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 08:32:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC1A10E54D;
	Tue,  4 Nov 2025 08:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1bjET0E5";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013042.outbound.protection.outlook.com
 [40.93.201.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22A610E54D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 08:32:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTchMPzVgn/MnPSKJejBaCwcH3uiKi0Fltr63h7dj4JJ41YQVfOjkaCvEL/wJAWUNTF9A9AfHNfaEcebdlmmmuxxjzWMhzZuHs4FgUuAvsO8BH3q0xHKNE6fr+BljjyPFhIhe4iUvurdYgBr021RLRBht/uKcGYHNGPtPWj4TFwkcVTZfGNN8sWMsJeo4pPpuHuTOqtolY0mmFvuDmj99GEVY9d9wfDG3KnFdo0BrswJFmb45lXOdz6KmIVdevs/c+j7k/tPNb9HMp6TA19hA/tIT2daYvRkWYOKBEPXsEeAwxU/uFT+NtnvlhV4HG6zbVrp8TU1z/SDtxQhSTWXEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4g6bM47JXXCjdqlnch1a4WmJuIf37HqQqshQ6fpCuC4=;
 b=m1k513CJLLHocn7MYwyB4qYXbJnziZ0t+rlBU0VB61NFHgTEeFPrq3zke12FgfxeNN34LZbVVyQYXCjnAX6gBDvhSKNDUWhl3+akL5m8A/2QEBbG26w+cYh6TTCNBtHrE5hY7E4BFOMzDMq2fPer+Kr4x/B6YzgZZaxtaRuZq73fZfzc62AFkey3NJrOIKzL/dMeGlG40xBpeCj69px+Kqef/BJikTwpdr4RdKGusiB3GcEuU35SJ0XJmfmxjDw9wmJGuZNpDFdyRfkh5vGiPS5yAxk2R0Od3/NYd2DC9NUP1KWWIDJiBLHwfhogHRLN2+i+bne3j3pqn3CTkdEO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4g6bM47JXXCjdqlnch1a4WmJuIf37HqQqshQ6fpCuC4=;
 b=1bjET0E5qw3opLJNrvR635b3u65x5VFz8QlIXo11kUMaP8ZUh8phhE4+AdozE5qGJVZMZMVwhhV/2CyLC/acVa/SDZ1B7TnQSL6hR9vpQMFUvj5mpeSIicRj8VlAqucMpQp9nH6VAW1jH9hV87bD+YC5pLkMBUxVLfQTH8dbees=
Received: from DM6PR08CA0049.namprd08.prod.outlook.com (2603:10b6:5:1e0::23)
 by PH0PR12MB7010.namprd12.prod.outlook.com (2603:10b6:510:21c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:32:20 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:5:1e0:cafe::86) by DM6PR08CA0049.outlook.office365.com
 (2603:10b6:5:1e0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:32:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:32:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 4 Nov
 2025 00:32:19 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Nov
 2025 02:32:18 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 4 Nov 2025 00:32:17 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 3/3] lib/amdgpu: support negative testing for user queue
 submission
Date: Tue, 4 Nov 2025 16:31:42 +0800
Message-ID: <20251104083208.3700055-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251104083208.3700055-1-Jesse.Zhang@amd.com>
References: <20251104083208.3700055-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|PH0PR12MB7010:EE_
X-MS-Office365-Filtering-Correlation-Id: 35988680-61f5-4eae-b2aa-08de1b7cab77
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y1QIP7NsyXGzAwqehfdLv84CgMjkk7uzlCqFAnOiqUBDsKT+dEjrmUd5a7M8?=
 =?us-ascii?Q?lnD+JSKEE48KpEPi1zfdX+saiY31SZQ1cwpFOIHTZOFWpxL34zPErsj1wk5a?=
 =?us-ascii?Q?3HFwEOpdbUN0GOaY9b1Sat3nPBrTmIp1j7wSxikcvhTVI1sfbPrrxcQlzaKX?=
 =?us-ascii?Q?21D6PPwIK7W8azSn/i1xfl5B9mCFeFj69vuo44yxNRFj48ZbErJ03KEIVEv8?=
 =?us-ascii?Q?SEOGAMJw8evvza6uuj+q02eI6s0AziWpGj9GF8qRocVRXdTEe1t40jTimA7X?=
 =?us-ascii?Q?j1vM8jyR70eTHiXbOV/x3evrZVOopDY40GLz1n7ocU7E9Iusto8ZXoNeQHSn?=
 =?us-ascii?Q?QO7jmc+HSU9c3t/IcfGA3lFcaTRcA6f1idKhqHFFisH7xCejSlufrnEKfZwv?=
 =?us-ascii?Q?2XvL4nZUCczNYtcn9aSfbM3o5AJHl4fiQr6tIM9eYUDhxj4v5FEJr5uJlpmq?=
 =?us-ascii?Q?fIx9v12kKnrsU65yKWMrXtGYnA3g2O1QXVlRo9xPL3ZF4QHcCJVNd7hBdZ5S?=
 =?us-ascii?Q?JcsB81RoTiVn1WdC8lbnH6oAtGHasOj6VnTzA3gbBWAlNdIXvc+HRcE7Kwq5?=
 =?us-ascii?Q?jaK4nxss3j2Dbs6tQwcd9divbJQYLvoxGt8AtoAHN6sDp+vGWI/ubcHm6NKV?=
 =?us-ascii?Q?41VELNkOTsbo+Sb8+IHWPffAGYBaCjl6yzGi6sQkh+sLetkQmjvV/yI8vkcF?=
 =?us-ascii?Q?MQgEXPy4JhKu8PB59Trj80vzKFpSbcejmf64qLxHwGV8z7/IMmlMPhDxyyMk?=
 =?us-ascii?Q?B1u5nPLpygqXTSKK8uPBS9hQRs6eA4XG8YWzOdH21NDqG8QQKCwItIdzVT+N?=
 =?us-ascii?Q?CNnpgt/1wGHEJvow2s4ljtm7wtwciniwEAN6WFOyB+8cbD30QDEM5SwfnUm2?=
 =?us-ascii?Q?mNdqSDSr2L40XpBYFx3cMesnSG1jTcku29q46zwCm+FE5xoBcdwyv4wSdbeH?=
 =?us-ascii?Q?5ZiV7X0c6WNbD6keNYagwor1gQkJwtyweY7hiape0sBnXb8hdtO1Z1SgOUOw?=
 =?us-ascii?Q?J1OPs/qV/0dF5eV4Fl9timUu+8jA3aVdq5/NCP5xpjqiwjjezBdaH1V4gy7q?=
 =?us-ascii?Q?UVKW3SGpLYrcw4ACwphf3fxlgm+OPltNkKBjFLAxfgvIAE7UgDk9e+K2gtc+?=
 =?us-ascii?Q?5Tb5vlqsa+5KNTSr5OXxJHTlMaac6cGERi24VDHbeDtHnsJaKzBvc3AA/tS2?=
 =?us-ascii?Q?EEI13DHBWMvL+yemL5QgU9UjfAF2qyt7m3x7hcBbIM1IQOq5M6IHRMVuYXAy?=
 =?us-ascii?Q?+n6pdR71r4Km9ITGZ9su29e4GLkbi8ZsLLk+Sajhq8+QpG7UtmQOPDRJiPr5?=
 =?us-ascii?Q?P/22c1/M2EDrlgY2CBdXojYVPZ2eeIu0R1k8BFZ3WFMEO7MYp0XwSKdt1XkV?=
 =?us-ascii?Q?nsUAZWWvCic9akoP4r70N8Z0j81cQLZPLeco2x2r/V05HlbLFVvT/ZgC0F79?=
 =?us-ascii?Q?y0K/LuaD+QS/0BOprYJ0hxrjTXcXCilJoCGbGdys0zPKVMlgnocaCY3r714h?=
 =?us-ascii?Q?g5A7KdGcK544JK7WxIVn/n1b9buv/TC6oQSF0kVUH8QZk/HLXU2eQLjvHQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:32:19.8853 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35988680-61f5-4eae-b2aa-08de1b7cab77
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7010
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

Modify user queue submission to return error codes instead of asserting,
enabling proper negative testing scenarios where submission failures are
expected.

Key changes:
- Change userq_submit function signature to return int instead of void
- Return syncobj wait result from userq_submit instead of asserting
- Check return value in test execution helper and only assert when
  failure is not expected
- Update function prototypes in header file accordingly

This allows tests to validate error handling paths by expecting specific
failure conditions during user queue submission, such as invalid
parameters or resource exhaustion scenarios.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 8 +++++---
 lib/amdgpu/amd_ip_blocks.c          | 8 ++++----
 lib/amdgpu/amd_ip_blocks.h          | 2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 64568ded1..4b59cdab0 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -69,9 +69,11 @@ int amdgpu_test_exec_cs_helper(amdgpu_device_handle device, unsigned int ip_type
 	ring_ptr = ib_result_cpu;
 	memcpy(ring_ptr, ring_context->pm4, ring_context->pm4_dw * sizeof(*ring_context->pm4));
 
-	if (user_queue)
-		ip_block->funcs->userq_submit(device, ring_context, ip_type, ib_result_mc_address);
-	else {
+	if (user_queue) {
+		r = ip_block->funcs->userq_submit(device, ring_context, ip_type, ib_result_mc_address);
+		if (!expect_failure)
+			igt_assert_eq(r, 0);
+	} else {
 		ring_context->ib_info.ib_mc_address = ib_result_mc_address;
 		ring_context->ib_info.size = ring_context->pm4_dw;
 		if (ring_context->secure)
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 71b1c5c2b..58a67a7b2 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -582,7 +582,7 @@ int amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
 	return r;
 }
 
-static void
+static int
 user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
 			      unsigned int ip_type, uint64_t mc_address)
 {
@@ -653,8 +653,8 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
-				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
-	igt_assert_eq(r, 0);
+				DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
+	return r;
 }
 
 static void
@@ -932,7 +932,7 @@ amdgpu_timeline_syncobj_wait(amdgpu_device_handle device_handle,
 	return 0;
 }
 
-static void
+static int
 user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
 	unsigned int ip_type, uint64_t mc_address)
 {
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 66c2789d5..67891ded6 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -230,7 +230,7 @@ struct amdgpu_ip_funcs {
 
 	/* userq functions */
 	void (*userq_create)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
-	void (*userq_submit)(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context, unsigned int ip_type, uint64_t mc_address);
+	int (*userq_submit)(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context, unsigned int ip_type, uint64_t mc_address);
 	void (*userq_destroy)(amdgpu_device_handle device_handle, struct amdgpu_ring_context *ctxt, unsigned int type);
 
 	/* program minimal compute pipeline for a raw PM4 launch */
-- 
2.49.0

