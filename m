Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F3FC369D1
	for <igt-dev@archiver.kernel.org>; Fri, 25 Apr 2025 03:31:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E99F10E281;
	Fri, 25 Apr 2025 03:31:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Civ6XwAS";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2051.outbound.protection.outlook.com [40.107.94.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AC710E319
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Apr 2025 03:31:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qCgC3YrDzpz9D5lUbbuK62YuNEUgS5LqscP1cun29C3CrRnPo47VWsgX7EsRQMPgKp6oM1eh3W5vqS+FQJV7WsVZl+oUdhKXu6SZd8PneSUSd0c0RpYrgCTyXD9ucTxVi9hAyaWAQ3Iz8haohp8F4wC8TdLB7Js83jdEEaBPnAjCjbdCACgvATD9t/ss9rvwxICDwaeiyUVjb/v/TxOsGkQ8PqrrksOZV0ddiGtQZg1fxlrZG7hSLNMkOSCUcrdn8efcU1z0WsGswyhUdxlJwZg1lTmCdFNqEz8S6xjfRrc7Ll36bYCHOB/Kjtt9ApDS5DBKzG8NP0sjsvF/0OGBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hhzrbOtwjA3+sa69tQCEJnvA2xJnuk6Q9yQPV7Tw6to=;
 b=f1u6TMNdhhLpgrEy2MFJ0T9ZZFjrvke1xoJWzlF7LNrkjf3+zdAPLseZn63q5fVfbt1s4HmY4NfC0Ik3kTg3pSyBnd3cvUo80EKqP16ivtGugfaIQ7X1iEdAkOxv09tBE8FBwTRFWBVNJ+++yw5ri0GxtFhyAMZWYrM1Busv4uyBHtNWQImNKxX+8Cpw/NENp2yp8JQwn2rlpFTYHz/JY7OAOyUxmYOuKptl7PXpBfTVxCfmfkZvmhhR1OKGorCNWdvZxiRQUXOZ48KP99PrJDhrkX0CshqBT48lhy3yDKcuZoYsOsCkwWUaZgcUeBCcQP+VDMNeCa6s2cMlTFoi+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hhzrbOtwjA3+sa69tQCEJnvA2xJnuk6Q9yQPV7Tw6to=;
 b=Civ6XwASW7q6h6+RjvdXyt0kYPR9tCaeFZGCj9TUIMB53MuQwWMs/QILcrcPV1WsHqYkOJ+tW3OqmcrpYZu59pjbUdvgXLCa0G/63+F/7Mcg5sdEtf+DFeI/7ak1/ZohQiZHn8YLqsKA/F5raXfhsQqhpj7H3azGwEq5/ks7pYI=
Received: from SN7P220CA0018.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::23)
 by IA1PR12MB8408.namprd12.prod.outlook.com (2603:10b6:208:3db::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Fri, 25 Apr
 2025 03:31:33 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:123:cafe::bb) by SN7P220CA0018.outlook.office365.com
 (2603:10b6:806:123::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Fri,
 25 Apr 2025 03:31:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Fri, 25 Apr 2025 03:31:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 22:31:31 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 22:31:30 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 24 Apr 2025 22:31:29 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 3/3] tests/amdgpu: Add AQL packet copy test
Date: Fri, 25 Apr 2025 11:31:14 +0800
Message-ID: <20250425033124.1185655-3-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250425033124.1185655-1-Jesse.Zhang@amd.com>
References: <20250425033124.1185655-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|IA1PR12MB8408:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a439f40-0ff1-413d-746a-08dd83a9acf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?W+i+TT709Az2l0S362xD8gO4pzJMa31RfNOxOZl30Zm53o+/6jiPDBFJfk1x?=
 =?us-ascii?Q?CIv1riJVOrbTzJhjWD+KUSQTrMCQY1mE43GuzbSYI5SxRx4Af4+nX+m0/iCj?=
 =?us-ascii?Q?k3w/rdc+rHT9MfB1GApbFNr8yJVpqu1q02EzzbxVkW7sxc/Sqajo1NQffCY+?=
 =?us-ascii?Q?fTDWnQE/Cu0uTIR0eZCbfQsT1kPWawD638dVxwewxl9gZzL3Aom0Ut4lkAna?=
 =?us-ascii?Q?nLuKyw9kQTvtZFGWWdDv7OXHejBW/2IhGUPzFdqLPlUJXovlK1RhEIS57OC9?=
 =?us-ascii?Q?51/Gs39g2IJUV5xRA7QGi5MtwPinpfcYXZSNS/QoIE69UR84UsYhhcEZbFt0?=
 =?us-ascii?Q?0DkmKVv4ftsTrvm3PMmP+aNRVZa+e/YC9dEsbvR1hK/PPjFYPtjSuFgLmzg3?=
 =?us-ascii?Q?xmsge30oi1dCDR3CbAg2zyoWjLdlamcLCMzpO8V0qPAmCcOWxmuwFX4Pmqzx?=
 =?us-ascii?Q?okGl1Bg1w/qwa2Q1TOQXJLBSnKLgCpbH+wTIMuJejJWE1lqI0HDN6rq9ugin?=
 =?us-ascii?Q?7m5pc6dKs90iUOwbx1GGEhjUn2gtougEoe8nVvdFMW5oJefLt5hsOjjiAAsT?=
 =?us-ascii?Q?Z8Qt/aQ+Mf1uJa90UoFaWsjivsDmRV2RVlupMpsx48bjWUCZwwl/0FmZDqJy?=
 =?us-ascii?Q?AXfLNkGIvtlfKmFSUHXf7xkVDtJvVkRYZu4ebWJAjD6HeCkz1GEO/6zGSGMe?=
 =?us-ascii?Q?lFlRn1WBP7sJYYtOKMOjE3fE31wMzSWEMTWzC+c5IJD/ShU/VKJT7eBj09mr?=
 =?us-ascii?Q?PetKxrQQWvi1EQDZtOIXj7RWGbNpax80ZsG1vRB0dQgiP4h1Eoxb7Fds/FcA?=
 =?us-ascii?Q?rNjMnHSsOe6BWjH3VlvbEM90+TJ7mB/GjZCjQUofzfaUXHDFiI7SvTMMW9Vs?=
 =?us-ascii?Q?cwoLinLXkM6UDNw2chwN43HjRKKZplLfWVvZMr+pUHyWztfbnmnsSd1Xvuns?=
 =?us-ascii?Q?fJkWM7QJy19+KRjcGEpBg1MyY0ero1n54CbbwqL0W1jxPM+98PN22/GWY2fV?=
 =?us-ascii?Q?1kfhtdxWrJCRgUvkmcLoJipqnEbxA7OU4AGXWmHXF4BnGaZ7dnkGUbSB3FVl?=
 =?us-ascii?Q?O/luxJOXYQwrbrZbYCMGDYn1KxI4Guc85y0/mRg5PZYgyUO3WsidcBAMrEQq?=
 =?us-ascii?Q?fSD4mkRihFlcxw5lGRTw8dWwnC8fC9ex2Hdy08w80OM700QD28Y5tZJrPmp2?=
 =?us-ascii?Q?MAMA8cBvhsPfpvI/5LNSDXl3HGA6CsOVT8WaoHA6pyZbV+HxF+wkpAQ4A/PT?=
 =?us-ascii?Q?tC4+KZgvZhODOaq9PWSAFdwqOczE7olU88G6flM1t/4ea1ZJKqKQBMYbtPAa?=
 =?us-ascii?Q?kYG+Em3HnU9d0hfls3AEE0e5EC7oJOJkG3zza8GM0w2qlZVA4PXds7J2e0vd?=
 =?us-ascii?Q?18ngn78UHy7r/0qoXAThAIFaCYfVliCpWzaYojdi+M/DB+oFxFoXn0IwRkE8?=
 =?us-ascii?Q?fYwMXDsFtfNRvsoq6mDpsu5SYnutGyro/8OJOkT+ayE3K0X9kcVuty98ca29?=
 =?us-ascii?Q?/xPNfLXSlBl9R+0/PlV0JmxM28KAm/cy3CvO?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2025 03:31:33.0201 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a439f40-0ff1-413d-746a-08dd83a9acf3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8408
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

Add a new test case `aql-vendor-specific-packet-with-IP-COMPUTE-UMQ`
that verifies:
1. AQL queue creation with the new flag
2. Basic AQL packet submission
3. Memory copy operation using AQL format
4. Proper synchronization between CPU and GPU

The test focuses on vendor-specific AQL packets as a foundation for
future HSA-compatible tests.

Signed-off-by: Jesse.Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 29 ++++++++++++++++++++++++++---
 1 file changed, 26 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index eb8447220..695b55349 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -86,7 +86,7 @@ static void amdgpu_command_submission_gfx(amdgpu_device_handle device,
 	/* copy data using the CP */
 	amdgpu_command_submission_copy_linear_helper(device,
 						     get_ip_block(device, AMDGPU_HW_IP_GFX),
-						     user_queue);
+						     user_queue, false);
 	if (ce_avails) {
 		/* separate IB buffers for multi-IB submission */
 		amdgpu_command_submission_gfx_separate_ibs(device);
@@ -114,11 +114,26 @@ static void amdgpu_command_submission_compute(amdgpu_device_handle device, bool
 	/* copy data using the CP */
 	amdgpu_command_submission_copy_linear_helper(device,
 						     get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
-						     user_queue);
+						     user_queue, false);
 	/* nop test */
 	amdgpu_command_submission_compute_nop(device, user_queue);
 }
 
+/**
+ * AMDGPU_HW_IP_COMPUTE
+ * @param device
+ * @param user_queue
+ */
+
+static void amdgpu_command_submission_aql(amdgpu_device_handle device, bool user_queue)
+{
+	/* copy data using the CP */
+	amdgpu_command_submission_copy_linear_helper(device,
+						     get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
+						     user_queue, true);
+
+}
+
 /**
  * AMDGPU_HW_IP_DMA
  * @param device
@@ -135,7 +150,7 @@ static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool use
 
 	amdgpu_command_submission_copy_linear_helper(device,
 						     get_ip_block(device, AMDGPU_HW_IP_DMA),
-						     user_queue);
+						     user_queue, false);
 }
 
 /**
@@ -815,6 +830,14 @@ igt_main
 			amdgpu_sync_dependency_test(device, true);
 		}
 	}
+
+	igt_describe("Check-aql-queue-work-by-filling-copy-operation");
+	igt_subtest_with_dynamic("aql-verdor-specific-packet-with-IP-COMPUTE-UMQ") {
+		if (arr_cap[AMD_IP_GFX]) {
+			igt_dynamic_f("aql-copy-test-with-umq")
+			amdgpu_command_submission_aql(device, true);
+		}
+	}
 #endif
 
 	igt_fixture {
-- 
2.49.0

