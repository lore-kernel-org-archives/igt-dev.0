Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B08C1C77B7F
	for <igt-dev@archiver.kernel.org>; Thu, 26 Jun 2025 05:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F78910E835;
	Thu, 26 Jun 2025 05:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DMtaPKnA";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2080.outbound.protection.outlook.com [40.107.101.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A230910E835
 for <igt-dev@lists.freedesktop.org>; Thu, 26 Jun 2025 05:57:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nMlHMUUfOIqUyBNtW0vm3ndtvuEzA51ITA4+84Xwjtfj77IGnzYRF30x2OjCTKja1QmMOpxXotBAtgX0fCI2kJsj4BDduNB5V/hZc6uQznDY4WeCPVQqKZxzne370/HaCnBToEVpTbAyHcs6Xn03K4wYucS4bEAfU54vp2eMVMaccwH6dS3GbjWV39DPGLDJY+jvxWK2y5MO2p4yRT9vry7agKlUcZSWFg5KLeC+ZtFNqcmPurhu6V46mlMcQumBZ2jCBgBr1Jd8lZl4t28XUymUW9tWa+Zk+f2AxBp8v4h5vr+zsjwwTF9NCt/BjoS1/wcyYRUr03rojcPvhZASRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v6zKThrmVpJwh3yo4R7Es4B9+O+JZgHe3ywjLl+N8c=;
 b=NIp6zq/l05uVcDO+kRUnDugz3aSTjivfn74iPrS6PXxZy5xKIymx98zB0yk7s599l3hSYofTuFdl9Iy9iriWkoQ63phJUiiCJYGJnN6yLu44cexM8NMG+EHKCzR5TK/ebhTP0RRo3ZYsylRagiRGHIdzZA2XahCdUsuJ6MrtOuMlY6Oxu5PEw9O5evSFvQza/lxphCD7S1oi8/OZfU10Bg0/98+pSspg1mqhvRFwxdPvWf/i6tslFm1U9UvbR9HL7h6xge+539O9gtcA76aDChu9A6kCNGZTB5ZK8Mcn1brO038nmMYUwHCqrwiLIhA0Z8OQ5jQJVIdNMR22BPH+CA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v6zKThrmVpJwh3yo4R7Es4B9+O+JZgHe3ywjLl+N8c=;
 b=DMtaPKnAffKGXQkvC9QxxHR03a3BkznMW9Q3Ra9Y7ft5acMVp9DkaT0CNqOgdJAjxbX0iGa18PK73P3rxK7Z4vi2eJUrKtS8blSsFgW6ENQ4xkZnwo9fDm8m50Dhhqmme1UlE8bsm2q8C2fAW22G89NNI/QxofSZY/JAEpUe2Do=
Received: from BN9PR03CA0178.namprd03.prod.outlook.com (2603:10b6:408:f4::33)
 by DM6PR12MB4042.namprd12.prod.outlook.com (2603:10b6:5:215::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Thu, 26 Jun
 2025 05:57:05 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:f4:cafe::8) by BN9PR03CA0178.outlook.office365.com
 (2603:10b6:408:f4::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8880.17 via Frontend Transport; Thu,
 26 Jun 2025 05:57:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Thu, 26 Jun 2025 05:57:05 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 00:57:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Jun
 2025 00:57:03 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 26 Jun 2025 00:57:01 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: Generalize command submission to support
 SDMA
Date: Thu, 26 Jun 2025 13:56:38 +0800
Message-ID: <20250626055655.3641497-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|DM6PR12MB4042:EE_
X-MS-Office365-Filtering-Correlation-Id: 52036c17-abe4-4e2d-fc32-08ddb4764756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8goCIcwEdA+xIL1wJPvQV8qGhColUXfj1NO7ffCCaW3ZMzTe8IXSWxT02txQ?=
 =?us-ascii?Q?Q6AV5S5jGulo4Wo3FKLkE+ZeRfjUALRbiBgRn/WATrpTf2NiXlJS6Ma+o5T0?=
 =?us-ascii?Q?SgBntlySbLi71WNJLQRL5IQpCHKG642NZnNWQtMrjUwVzRtmF18eUCrzjjrK?=
 =?us-ascii?Q?20euRMmgkqiozAd2kPArizbK4KnC4GoMewCj+A7QhgFO83OBWHNPNI88Sh6c?=
 =?us-ascii?Q?xzwN19oqSidrt5GaE+evT4vtxt2bQpJtr6Wg1G8F4pkoHsl2KDeRJJN19/a1?=
 =?us-ascii?Q?/UzFR4NzIsfP6V6ExgjA/3s95FiQGO5gUVCi3pBI707wLFoqW+qNIZ+DLQZw?=
 =?us-ascii?Q?JAMaWmct1ATs0K/+exS4u765H3E8n1hs/C+G68+sCGH3RwFde5ElHeuswCb3?=
 =?us-ascii?Q?ANdeqVXsn6dG5Vv76C9pmOztkh6/JNZxi3//Oa25R4qHIdPVZSWG6LFTtNhe?=
 =?us-ascii?Q?7Q2xv/s93es2Ibc4yYSJvfqvcL0iT55AM2IObbhpo1vKq+0hgx7ejUdaa0Q7?=
 =?us-ascii?Q?GaFGrqzLHGPVE9p7FZqQ4DfDwYVu5I3CfjvHY7g0jO6VWSDnr5oo4pUuPJLs?=
 =?us-ascii?Q?ocwuadLqtP5gFiygBoH0il4RqAzgknsxlPDcRy6fVJWmPJrD2Z/rqHt7aEcR?=
 =?us-ascii?Q?hv06w2NW8ZbyejcamcNw42kz1ys6IiDVOYhCDAT/h5GRBp+U6V2owVSr4BPy?=
 =?us-ascii?Q?u2yRnror05dleOO73QnkoVaK8h9qOYJdJxtF6h85QYaighxzQOjhI8F/WBHy?=
 =?us-ascii?Q?AJpEiWZJKQIrJaUyJBULABginkzokjeFLv4urvFTKURH016sH92nN2OH+RFF?=
 =?us-ascii?Q?0wzjrDsNteHsYwODTmUDi7VaA7XwVHvQSf2z5gJVvZr6ON1T9BznBpv9zbRE?=
 =?us-ascii?Q?xm1KzPJSjJp4l0w9LYWBY7K++/v7Q6nDK2vXawoKUIbeia/diZ1UVNxdDjGG?=
 =?us-ascii?Q?pwNDyh9EXJI9gFS7+HhaE1q0UYbKLtcepvi07LrXk71j6HNI4ln+/EdE9FDE?=
 =?us-ascii?Q?vjKH1LDQuvR8F8+0Bh+ZJHipAUo+MTybzs5A/Bod0Zv74OtuxffNg3XtqZkF?=
 =?us-ascii?Q?hFuQ/4RUvIr5E0SNDpBVK0IqX345DTcHs2870NyZ1pln6JGrCDiSFnou+zDI?=
 =?us-ascii?Q?AenshneP/+hBjSG3pcQDwNMN+sEQIsN6yzfnrdmW7EjihSpjqphXncyr1yRY?=
 =?us-ascii?Q?iZDh7KEafnhC/epJJm5cOZck4i/Fen5+/JvtqAHOootTvVg0OYubEpWdBNSN?=
 =?us-ascii?Q?dCUcrDL/HnpkNusWyZQZUeqCwO7mr2ml+fo8n8d2mIj4Y1a+XmAMXn1NaZ7F?=
 =?us-ascii?Q?m/eLQVePw9KJmWgmL3H+1gyyOW4ei0weDv1ADU5TRJdyFwlZHchVuoYAd3n5?=
 =?us-ascii?Q?povcXB3Eij/OGnq3WnxMegXP7XH4YLkJxRfPJ+CGjBqGfvHdeYMBWelQIZTx?=
 =?us-ascii?Q?956Q0QyY4Q+I2Ioawra0hZRinfrazrinsLBKMgLn3yEcSPw/Uce1b5uN6WZT?=
 =?us-ascii?Q?9bhNZKfpbgtlPhgFpSaS4BPdzMS2XqGQ8HRF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 05:57:05.2075 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52036c17-abe4-4e2d-fc32-08ddb4764756
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4042
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

Modify amdgpu_command_submission_nop() to handle both compute and SDMA
command submissions by:
1. Adding SDMA header include
2. Using the passed IP type parameter instead of hardcoding COMPUTE
3. Adding SDMA-specific NOP packet handling
4. Propagating the IP type through fence status and IB requests

Fixes: 7e75d12 (lib/amdgpu: Generalize command submission NOP function)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_compute.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index 29159af4c..87faf8333 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -25,6 +25,7 @@
 #include "amd_PM4.h"
 #include "amd_memory.h"
 #include "amd_compute.h"
+#include "amd_sdma.h"
 #include "amd_userq.h"
 
 /**
@@ -53,7 +54,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	ring_context = calloc(1, sizeof(*ring_context));
 	igt_assert(ring_context);
 
-	r = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_COMPUTE, 0, &info);
+	r = amdgpu_query_hw_ip_info(device, type, 0, &info);
 	igt_assert_eq(r, 0);
 
 	if (user_queue) {
@@ -86,7 +87,10 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 
 		ptr = ib_result_cpu;
 		memset(ptr, 0, 16);
-		ptr[0] = PACKET3(PACKET3_NOP, 14);
+		if (type == AMDGPU_HW_IP_DMA)
+			ptr[0] = SDMA_NOP;
+		else
+			ptr[0] = PACKET3(PACKET3_NOP, 14);
 		ring_context->pm4_dw = 16;
 
 		if (user_queue) {
@@ -98,7 +102,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 			ib_info.size = 16;
 
 			memset(&ibs_request, 0, sizeof(struct amdgpu_cs_request));
-			ibs_request.ip_type = AMDGPU_HW_IP_COMPUTE;
+			ibs_request.ip_type = type;
 			ibs_request.ring = instance;
 			ibs_request.number_of_ibs = 1;
 			ibs_request.ibs = &ib_info;
@@ -110,7 +114,7 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 			igt_assert_eq(r, 0);
 
 			fence_status.context = context_handle;
-			fence_status.ip_type = AMDGPU_HW_IP_COMPUTE;
+			fence_status.ip_type = type;
 			fence_status.ip_instance = 0;
 			fence_status.ring = instance;
 			fence_status.fence = ibs_request.seq_no;
-- 
2.49.0

