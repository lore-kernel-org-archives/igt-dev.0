Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54814C54E58
	for <igt-dev@archiver.kernel.org>; Mon, 25 Mar 2024 06:55:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB39010E55E;
	Mon, 25 Mar 2024 06:55:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i2Ai0T/T";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166C010E55E
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Mar 2024 06:55:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aUVIQxLG7Ba1CQZp7mPARC46blblGnLzxB/YVWbA6qTpl3Xblm4ftu7VxnuvtlBGGiY/9Ke1pKTTzyUxgRA+eyOPtHAX3kSqxcsGbK5YAZs4JJ2aCG27MBPku7nIXVRFlLTTYOf4PMlWE9p49RIvV/B0Yi35tILSmoRjRHDap5v7PzBd/1S5iqILaZru28nqXDEqa0UbKLKjhwe1hChuLoQeCdHKCsdHfHwj+RmEw2k4oYmfQdPAo9oB6bdP9zI+IdKyWmt038Q8m54LAIjJRNwTcSo9ynEAf/plMMTwnw8Yb3l09qsw8PUSjO7+FM6y1t0SixkTJYBZDeGXnsoo2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=exRlRczZ7076jIhGP5AVZ/biEU6ZNtcUd3viAbp4xhA=;
 b=F/XNyYaY//7NXBvI6l6UaoqCBCrjTKs9ZH9uLkSptVONZSA7o7n3ebLDbu8K46NJbwVw95fe3D2XNnzSBwDhI1+Yr1QYcpTkazROrGmQW43gAiMpx/53vPitujyLuV5R4nQAEYM4tSOka3Gku7slCs4Pj5TonbOdV6lYP+1EAsou9veQFf0Sq7eLoJONEdQ/aCGvglScMoCtCDikg8FL3oIE+Y7IP7GzCfY2xgP2UTwqqQO9C2rXRE9HPf0GO8Q03OBAw727Vja34X9O+ruo1vSJ5GiZXPo4XUdETYTNSh5UkNy/01YbvFWQUdEIHoLErVB5/V2hj2WguiFkSiqQTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=exRlRczZ7076jIhGP5AVZ/biEU6ZNtcUd3viAbp4xhA=;
 b=i2Ai0T/TB/ww/0eZTyGfgZ20B60+diP/s0vedhotvfOjI0mKKoqOdqra2gyy0yR/iYe7egCKO0UUcKIyH0zzmeimacrMmc56orheReAKZog3TC8yKIwFU/fihPlfod6//HnaXKjSnaN3wAwuXOKlcwB0fW+79UF7TG9tVkVvIis=
Received: from SJ0PR13CA0054.namprd13.prod.outlook.com (2603:10b6:a03:2c2::29)
 by CY5PR12MB6108.namprd12.prod.outlook.com (2603:10b6:930:27::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.32; Mon, 25 Mar
 2024 06:55:43 +0000
Received: from CO1PEPF000042A8.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::f6) by SJ0PR13CA0054.outlook.office365.com
 (2603:10b6:a03:2c2::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Mon, 25 Mar 2024 06:55:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000042A8.mail.protection.outlook.com (10.167.243.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Mon, 25 Mar 2024 06:55:42 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 25 Mar
 2024 01:55:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 24 Mar
 2024 23:55:41 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 25 Mar 2024 01:55:39 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amd_basic: fix eviction test failure
Date: Mon, 25 Mar 2024 14:55:34 +0800
Message-ID: <20240325065534.2421803-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A8:EE_|CY5PR12MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: 49394e12-000b-42b6-6601-08dc4c989691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: To/qTwHVVYmRl9sek28kNySdD26CsmCpcIEY9adR1kVod0DkS3hYJ1HX6UynofF7JKN0bow+YBpJApWOyM5DCmsVkeVB3ojCfjapvNCA8GBDOi3eE17+CAmrC7qThzBjryux/gpHNG5VLy4VevupnyFkCcoH3ZY4dX1DXRCso/O3IAWeOSl+YsC/q7OvCmCl8xIiVnr+dcvVnSPIqiyGQ2pjCTzakCdnSdcTg7S5FInS0ZaFal7qH5HZZdHH3RoyV+hAKQ2c+x/gwupuBHHI7bWHftq2XvmeZ5KtUi9sbrOVGetvEvjyr0bEh5Sre8ntgFae4uJedg4ccUyrgLimuWkWVGHfHTZUUiGeEXbDTY7lqWAvXIg5AtWnUTB0lwRZh+zXLAuoXvPA1LDkO4PCmlhf02lX6AnMqlH6287gsRVJe5HTpLTYw9LlAmtDs/elprU0bjHx1eXu10bMuSb52K9JW+MGrwFVg4l1C0PGNnIBb4ynmiXGiawTvYQzCedW4R74qwKXnQSG17P/SySApmmvGGpG/uYxVzdHInZ88JSyZ484H4OU/pK3WMG4KWtCaOYh5MVkYz3dgmUEWOp91jKazWQSEygyOzN72qzHONgBiHfx3B6oABJ3Qast5vsI1YNZ76AzMo0eAQYM6mC8RXkxSoiDR8SWiHsqhj/OeXLLbqgv2Jar4dpVy2l3VnOT0dTM5SSbJ/RKKDJZEs+1zJ9/OcouwDbejWaqC6a4gI1J3xepxGHQD1wBXv0BlayC
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 06:55:42.3212 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49394e12-000b-42b6-6601-08dc4c989691
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000042A8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6108
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

 Test case name:igt@amdgpu/amd_basic@eviction-test-with-ip-dma@eviction_test
 Fail error: "Starting subtest: eviction-test-with-IP-DMA
 Starting dynamic subtest: eviction_test
 (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Test assertion failure function amdgpu_test_exec_cs_helper, file ../lib/amdgpu/amd_command_submission.c:77:
 (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Failed assertion: r == 0
 (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: Last errno: 12, Cannot allocate memory
 (amd_basic:9425) amdgpu/amd_command_submission-CRITICAL: error: -12 != 0
 Dynamic subtest eviction_test failed.

There is a case where the system size and gtt memory are smaller.
When evicting vram to gtt or system memory, there is not enough gtt or memory system memory available for allocation.
Therefore, try to reduce the use of gtt during initialization to meet the requirements for evicting vram.

 Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
 Cc: Alex Deucher <alexander.deucher@amd.com>
 Cc: Christian Koenig <christian.koenig@amd.com>
 Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>

 Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 70e45649d..8adb8d696 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -340,6 +340,7 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 	uint64_t gtt_flags[2] = {0, AMDGPU_GEM_CREATE_CPU_GTT_USWC};
 
 	const struct amdgpu_ip_block_version *ip_block = get_ip_block(device_handle, AMDGPU_HW_IP_DMA);
+	uint64_t gtt_allocation;
 
 	igt_assert(ip_block);
 
@@ -358,6 +359,17 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 				   0, &vram_info);
 	igt_assert_eq(r, 0);
 
+	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
+				   0, &gtt_info);
+	igt_assert_eq(r, 0);
+
+	/* For smaller gtt memory sizes, reduce gtt usage on initialization
+	 * to satisfy eviction vram requirements */
+	if (gtt_info.heap_size - gtt_info.max_allocation < vram_info.max_allocation)
+		gtt_allocation = gtt_info.max_allocation/3;
+	else
+		gtt_allocation = gtt_info.max_allocation;
+
 	r = amdgpu_bo_alloc_wrap(device_handle, vram_info.max_allocation, 4096,
 				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[0]);
 	igt_assert_eq(r, 0);
@@ -365,10 +377,6 @@ amdgpu_bo_eviction_test(amdgpu_device_handle device_handle)
 				 AMDGPU_GEM_DOMAIN_VRAM, 0, &ring_context->boa_vram[1]);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_query_heap_info(device_handle, AMDGPU_GEM_DOMAIN_GTT,
-				   0, &gtt_info);
-	igt_assert_eq(r, 0);
-
 	r = amdgpu_bo_alloc_wrap(device_handle, gtt_info.max_allocation, 4096,
 				 AMDGPU_GEM_DOMAIN_GTT, 0, &ring_context->boa_gtt[0]);
 	igt_assert_eq(r, 0);
-- 
2.25.1

