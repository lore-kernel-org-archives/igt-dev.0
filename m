Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B90CD98CC
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 14:21:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F0410EF5E;
	Thu, 11 Jun 2026 14:21:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lWq6TTRj";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013000.outbound.protection.outlook.com
 [40.93.201.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CCFD10EF69
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 14:21:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iz96ncY6nxxmfE3qHCLYREUpBZsltAYfcPVgdLsoVJibboPnwehMcPx1Lq7IheaUda9ioayoBS4jsF4OmxNbpJ3se9X5SmWKMpoTsNQC/WGyMXl/IWC2rCAvGwaGLarkn8Z86CEytKMBCppkqmeuIm7qzT1/U340PbT8rOZ/jSACZkHAdp8jFAMJB56v3VI+ZP0Y2jh8irZT5Hn/uQp1cLXxyEJlWGPtJlbVQ/U+oqNkKrjqBYb3uUSLkq5WOEwUS6677rf2n/13+OdTPiPpOS9qoE3uaodMlczhhbM4lm0k8GFYF72BoFJBokMbkfyJvnSGGovSJnEECqtkYQHGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tK3XuhxNbzf3hZhpsrSPx3MChuGAokTHrOMFqOJct5A=;
 b=uPrg6d5y9i4KMWEkgOrB4mX9MySeNbIy96HjZ6PdKnHgUDBKtNygWvAyfEJ/Lxy5CKyI+ILEh12W0uhw+PU9Tb/v5yWB+vxmdakLXZ06j7jwLNaNn+MoaRsdkApmwADi7t6NRjia4gtYEyhwsC2ldfm5RBji+YCf0003Y1ROoP9C0WsZjqXlssKPN0qEEltDCqB1+6JIPEhDMF2G47hTvFSyrPEYiD4YUlc+wwkKO9bJpUI5liAejXJqMBKbuoOPRcV002Moxwl01PEIj1UIRzi5lE2OCEfb3bwgUzFy7DnaaTHjSwC2jgC2gxSHAobOlu4353luk82FsREdOm4wFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tK3XuhxNbzf3hZhpsrSPx3MChuGAokTHrOMFqOJct5A=;
 b=lWq6TTRjgs9jfABexGEnp9Sr8H6vyI2olY2jxTeoIe8K0SQTjXumnf3iiprPuFwJfmF0WBdBC9f2uNnM0iMbiJk0lbrHQ/r+CfQSLTeTjypurDapO1pyNNP+VhfpRJBGuRp+E2rYWh+WFMJHYIwbtGU/h6AXZ3u/2hQ6PgzEYnE=
Received: from SJ0PR13CA0187.namprd13.prod.outlook.com (2603:10b6:a03:2c3::12)
 by SA1PR12MB7197.namprd12.prod.outlook.com (2603:10b6:806:2bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:21:08 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::83) by SJ0PR13CA0187.outlook.office365.com
 (2603:10b6:a03:2c3::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 14:21:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 14:21:07 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 09:21:05 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 09:20:59 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2] lib/amdgpu: poll reset state in hang slow test
Date: Thu, 11 Jun 2026 22:20:38 +0800
Message-ID: <20260611142058.1010795-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|SA1PR12MB7197:EE_
X-MS-Office365-Filtering-Correlation-Id: f0692889-09c3-44c0-6938-08dec7c4ada9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 1HQV2+CHD9lI5RwsBPkGoS7n+jAaX9lKvc0XprLBjbpgl+DFyrt2+fQsqfqe4uflJ7+nTu+SoJE/XKfMyCCpyHZ2JQS/RJRVhxTjEj+WDS7XVLBWdPPGwfaoFb3FcQNegZIMRyCQHHy31/tuFgDk3vNpQY+9lRYoZ2W4vxR4K6zvvhfGT3zSjWpqwx8oEiAeKTXBbhUnkdfAE2AMcK0U2ZGhSybd6lcRywuypQolcTPvXIezB98uPQEgfcQymaSASw9fmXUBU2T9OVo87xt+G3LTVe9QvbJ84S/XmV03f2E/zgOOO/WQRYgtlyVWQvhwnGE5jIe21MKLYC6eUkXFE/0G0SOhf3R0ZIO6P5BX6nuAbLzl0IUuA1UKk4L+Jgn1ZsWN5c92V0wbE+WcLP0bTopZIHxP1FL+d3JVUXblm7KHh9G717F+/FnS7sVTZqCeCmno7Bu/bHwMr3WetcM5rCoiQMQvA8m/2lJYvQ6bFPWDzWGZkNFvOOSmoa3QM6Nx5d8KwLrQPB8YTMExCkcCdF3HCbcEVA1b0H4Y2HqabNKUKIc2xLtZu/Ha2m2HREvWbITzk3uOOPcnDvBXkOStm7WEyxeiMnKzv9k0VeHSdvsGVutgYxtrRrKWF9WRDiFKgEWP/gAAxJoJHcEmZMAqExG+mWEq37v3r8b4xz1lrF3PFZ26u2g6A4ZVU5XAGyRD6KDilH93sTJslCXfRZIwbmWnQcR4Wa9Vok833kvIEuo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Hjj1aZO2evRFa3KXcs4JxgOT1MQi+tmlPyoL1boKyvuu1NTX10c8TmDIjMRqaw3QhLYPImBDZxJH2a4ztLn4zsu7qv2EgdtuPckQIeSSq1+loElu8761A5jj8OowYlgkIcBL3vVGrpEar8E7YTT01Z9kpSDK1qBmDVEuDbXsshCkQhBii0z9kF8osskur7kw+0//Z5Ggj8J8lO67jR2IyzAarpK62mrEQBBY7LNR1RHe61SwZALPUcbLSyef9rX2EJNfCs1grz3y4/c3dFNLmpfSZkwfDWNsWN81a7Le4YuoB5k2E627BsF5nsvEp6Gj+kiJITspvZufi3wbLenSDDjhNnF1DDiVBqVHlTEfMEhK63EvbGUIMyYrctC0Yv/KUBgHASN5qjbByMfXl2g3guDxbFCnGv20fPX/GSdG5Q9GM1oXkX/CmOJDd2iQzpVY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:21:07.2899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0692889-09c3-44c0-6938-08dec7c4ada9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7197
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

amdgpu_memcpy_dispatch_hang_slow_test() asserts the hung context's
reset status from QUERY_STATE right after the fence wait returns. On a
per-queue reset the global reset counter that QUERY_STATE derives its
status from is only bumped after the guilty fence is signalled, so the
single query can still observe AMDGPU_CTX_NO_RESET and the assert
fails.

Poll QUERY_STATE until the status reflects the reset before asserting,
keeping the existing reset-in-progress guard.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 138222cde..152ea0099 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -679,10 +679,20 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 
 		if (!(reset_flags == 0 ||
 			  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
-			/* If we're in reset and reset hasn't occurred, then check
-			 * that the hang state is equal to the GPU reset status and
-			 * assert otherwise.
+			/*
+			 * Reset has completed; check the hang state. A per-queue
+			 * reset bumps the global reset counter only after the
+			 * guilty fence is signalled, so QUERY_STATE can briefly
+			 * still read NO_RESET here -- poll until the counter
+			 * catches up before asserting.
 			 */
+			for (int i = 0; i < 100 &&
+			     hang_state != gpu_reset_status_equel; i++) {
+				usleep(10000);
+				r = amdgpu_cs_query_reset_state(context_handle,
+								&hang_state, &hangs);
+				igt_assert_eq(r, 0);
+			}
 			igt_assert_eq(hang_state, gpu_reset_status_equel);
 		}
 
-- 
2.49.0

