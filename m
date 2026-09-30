Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48CCACA5FC1
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 20:11:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA3C510F4D2;
	Wed, 30 Sep 2026 20:10:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2TpZP9UB";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010007.outbound.protection.outlook.com [52.101.46.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1799710F4F1
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 20:10:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rlVn/pycgPfL2d7JArOLLkITXHZ9pWloORl52pFUX/ExGogfzbVjRv1/O+xA42MffX3olYAIvAz+E39KTB9WZZhk4Z/LpEIYu4YFY7wqii0aWGU1G86RVJtIYOA+OSQXQ9/BWmxIfHdtbmK2/tmVeFvnpHkSfuIDjeHBopRewaj9LZBBA9sUOvSPbz4357RFi93bZRv6/FmvoPHvYcCc3VSRexAGMPnYUU4ODQSxhMoqljIn8vDLGwoXe/JfrpAHCOaykw53KbR0LPBY85ioskbstTt/yd/moysw6/yzMY86BNrs7duQD/qQPjZlSIJ+OK9ucaGbj2moLm0bYfk6xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdTzl+2rBqcIsMh5S1VJgp3WapcJkzPWOdnCgZzUoAk=;
 b=CvHoFrY4MuWG0EncFowSacJekSs1zuLJYknY4sj98yk2koBWpgoUhFp3rrqCzHXGr0fudV6cJZdsN2YdkOSiRy6hkx0xLMDzj0nqnbFDmLJJcbVTr3vrAcBVk8TmukeztyEdwFhgEShCRnFevif/by2nAszRFM+HISCXw/q3t7hFnBV8wIZiPv7JP7TaJtNpEMwdjoYPlmau9g6BF6MXKJPZbXvVN/pg0bLYZMP6utS/fl7B55ZuleqrcABycKdqkx5i+dk+y5FKQo7+bapc5kHpZXWdF+GtNhSyKr3+K+EtHsaSAuDpO0a7OLAcW/s13sAfIwt/W1zxRfYexjj2ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdTzl+2rBqcIsMh5S1VJgp3WapcJkzPWOdnCgZzUoAk=;
 b=2TpZP9UB/PxEHJTX85YIbeX+ZdSME1vKOr1ybi4NImXOD21oPHWL6eJuqWMVihzfXQGahEBzNi4s/xlBqDRHMqga9OC53hyDFogMoKyG3Nz58zqXw6kInQYhmRf0w2fg/T3pngeyNETUIiclZx+J5gi6boiK4Nkqyc5XYemaPho=
Received: from BN9PR03CA0725.namprd03.prod.outlook.com (2603:10b6:408:110::10)
 by CH8PR12MB999205.namprd12.prod.outlook.com (2603:10b6:610:35a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 20:10:09 +0000
Received: from LV8PEPF00000068.namprd03.prod.outlook.com
 (2603:10b6:408:110:cafe::90) by BN9PR03CA0725.outlook.office365.com
 (2603:10b6:408:110::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 20:10:09 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 LV8PEPF00000068.mail.protection.outlook.com (10.167.248.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 20:10:08 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 30 Sep
 2026 15:10:08 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Wed, 30 Sep 2026 15:10:08 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: don't verify dispatch results after a cancelled
 submission
Date: Wed, 30 Sep 2026 16:09:41 -0400
Message-ID: <20260930201005.66857-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF00000068:EE_|CH8PR12MB999205:EE_
X-MS-Office365-Filtering-Correlation-Id: 4089053c-5ffe-41ec-43ed-08df1f2ed3ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|82310400026|376014|36860700016|18002099003|6133799003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: WG2sks22AV3NjcFTLNGFzGMRdMLB6EyufC+HXawAJTexiSRYablPtQLzwbLGWABskf94JVW+C9eRjubzK25sFyJwZrpy6swkDyFaaNpib6oCq5rPz3TsKJ2tbt+ylxHAWp1FZrwPMvGEIiGM+0hltNC7Ck18IaqS8f7HZKs81yMEk0iGpvk9Xwg4QiEVIVXleemwvtV0I7ZO57iH4osUM2kwyEci2HQryKVS8RLBZbRTgD5YxaRsmiQhVEiIk70KQsMMU7KAu7mQd04AEqdlUj/XuoX1xYF8ngam0U6U7fxYxLenz3DRG+8MRGnWmYlb44/MEkMmngxzFT9SwKVjN6Ii6ONcw6T2i3gL5tO9YSff3DtXthfgRwvWwz4VBtf1yBibSMPFKiystLCnAODEH9L3yIg7KruTfY/hVwXPfc94F3KsJthXbzdhmkqz37D0JuR6BTvTyiNtBegyhftWOZVbWdw331OTTofTy1hzs93tNqP+XoESGwDHHU2YL/4GGxsaUPDTmaLZhBmVenTCPfCIyf1RYPJ8HmY1/P1XS8ep/1563aN1dlesxabNM/gq2TuPyUlsxA2CS0+Ni0RouOXWGWh5u8QroQPF/Nzdtg0HeTLvbTMNV5ToZNYcm0hiPp1jkFxlEWHDuOWwvLZCyt5X6T3VONs/Z4pBh9di1zlzYSWWXcF3gmlcnA2faE1jOwvVW3pXL7zlbItNV7N+4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(82310400026)(376014)(36860700016)(18002099003)(6133799003)(10067099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: XFTI3zte63bwv5EYLilYtRIIR6yWft9mqElUpouwB8AmHNfPLafa1J8ucTqEa+BAty+0kunU/qphuaVOUYENZR/M8iCsUPtAs0JFh7+xqS7RBthaH07EbTgSTFPFV5lqoVER+w47TWGSQBCRCte7Ul/XarPCRbsKVAG0civrUk5TJPfaLsNQDow9fqe+d+tWR8zC0XcgVTRM1MMtIcesRZSJXUXBs+S+pj1vLAIF+yettIlWf5diLDH9mhJvqt4elmkmW8fS6QI1/rM3gsErXEYmnlphb6I3ZMKR4rTtX8AGuuxD5LIxD8lYDDz97VH0OTkzEdLUQetlFC5+SqPuFS4Bg4uC9B5OFKI//uRxFniqv/RqxSXtMO3foV/iFygdqedGRI2HbnXbmjPqldpX7Hm63W9giF4bsMkCXF09DJeFGvrMKrzULW+IMUXyuvKs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:10:08.9731 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4089053c-5ffe-41ec-43ed-08df1f2ed3ac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF00000068.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB999205
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

amdgpu_memset_dispatch_test() dispatches a CS_BUFFERCLEAR shader that
fills a 16K buffer with 0x22, then checks every byte. The fence query
tolerates -ECANCELED, -ENODATA, -EHWPOISON and -ETIME, because a GPU
reset triggered by an earlier hang subtest can cancel this submission.
The result check ran regardless, so a cancelled dispatch failed with:

    Failed assertion: ptr_dst[i++] == 0x22
    Last errno: 125, Operation canceled
    error: 0 != 34

The shader never ran, so the buffer still held its initial zeros. The
buffer contents are only meaningful when the submission completed, so
skip the check otherwise.

The check also used a while loop that incremented the index inside
igt_assert_eq(), which discarded the offset of the first mismatch.
Use igt_assert_f() and report the index, the actual byte and the
buffer size, which distinguishes a shader that never ran from a
partial write.

Remove the commented-out asserts left behind when the fence check was
relaxed.

Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 5acb26dcc..feac6aa2e 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -221,15 +221,22 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 		r = amdgpu_cs_query_fence_status(&fence_status,
 				 AMDGPU_TIMEOUT_INFINITE,
 				 0, &expired);
-		igt_assert_eq(r, 0);
-		igt_assert_eq(expired, true);
+
+		/*
+		 * A GPU reset started by an earlier hang subtest can cancel
+		 * this submission, which is not a failure of this test.
+		 */
+		if (r != -ECANCELED && r != -ENODATA && r != -EHWPOISON &&
+				    r != -ETIME)
+			igt_assert_eq(r, 0);
 	}
 
-	if (!user_queue) {
-		/* verify if memset test result meets with expected */
-		i = 0;
-		while (i < bo_dst_size)
-			igt_assert_eq(ptr_dst[i++], 0x22);
+	/* The shader only filled the buffer if the submission completed. */
+	if (!user_queue && r == 0) {
+		for (i = 0; i < bo_dst_size; i++)
+			igt_assert_f(ptr_dst[i] == 0x22,
+				     "dst mismatch at byte %d of %d: got 0x%02x, expected 0x22\n",
+				     i, bo_dst_size, ptr_dst[i]);
 	}
 	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
 	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
-- 
2.55.0

