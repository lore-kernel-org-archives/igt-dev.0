Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33921C3DA4A
	for <igt-dev@archiver.kernel.org>; Mon,  5 Aug 2024 06:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AE510E128;
	Mon,  5 Aug 2024 06:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KdVuNA9l";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2083.outbound.protection.outlook.com [40.107.94.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE9C10E128
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Aug 2024 06:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnwiEVhz0bB5dGMrkb4KrPjTfrDBmr8bjHX1ZwLhA7RCxqwJPEJdEAbr3SxZ4lji5cQmVwAsujne9NOOib5G3QxOcvh1Abn/IlRRZyuv5VT1Hbpzcv4uLOZpNLjXyoKlhjFuOEyTw70Gy/FhKUaDD3dMuTfzqUiB6hssZlDYnTEqhDIlX/vt0sCzoL58fmmQFqUYwpuDmcY/rLRX7QMJOfGuzuNqIavh8sFCbtyoGlkr6iDWwadhkcYUCqtuDcFzDKQY0wZa6g+lbozKeWUFXQlKQCB9CfWO+nw7r6NJzmP/UX/UXhnD3r7PUNy/jBXdWEdO2HPtG2fjFN8gnQbkvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/mQCOTYwmEZDVgT9qJA/FVAf+LZDU1UK687vGC3LqU=;
 b=bq0m/uszqeJjSqIVreDwMSX9CJbG10lZSOa/NDxzY5NHpsYrUogFJdwakauojUKC8qUHEWI6bcQlkn/g+9W13Z71LMQsEY/YLNVwGTQZCtnsni1UuLPmYmOO7g2u/hV2B2Tbqmed2GlQkih7nFTrY1C8Tjk2+cswc3fLtbn1eGgth8LKw3KmU1xuxYgeeVXr7qEgEX26QaISwVkA+VG+Y+RuZf3MB5Uj5HQVY/Jtd8pab4qR0hkxCfQiU/smsR9Q16IJYFHMv1GJ9AnoSinp93B841PUWXcW2tUWbdhzrB+cGg6Yg517pDvTAH20peHEo9eQfaQZUFVwlY38YwhLWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/mQCOTYwmEZDVgT9qJA/FVAf+LZDU1UK687vGC3LqU=;
 b=KdVuNA9lT3ONVcPfu+ylOGJGs9gr3WTN6kM2zcFzwBF8bOKiOeFJlxFi730I9a4vv6/vA3c7wdhrqDUsrm0VKFFtdBS9wqS7fBfWp/PGDch8MPb+hwOMzznHgHHiGECmHe5eTLcTsVDbzUC9pmLpMik/kUcvnS6DTX5FlkyHr2k=
Received: from CH2PR18CA0055.namprd18.prod.outlook.com (2603:10b6:610:55::35)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 06:52:21 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::9c) by CH2PR18CA0055.outlook.office365.com
 (2603:10b6:610:55::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26 via Frontend
 Transport; Mon, 5 Aug 2024 06:52:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 06:52:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 01:52:20 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 01:52:19 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: move bad mem compute test to amd deadlock
Date: Mon, 5 Aug 2024 14:52:18 +0800
Message-ID: <20240805065218.2399530-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 81dd869f-f07b-4262-10a3-08dcb51b27ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PVKeWJYMYx/dVua5AjFvAi5YHKcezXpl7/kOWZSqwVidgu5UM1n1Zyh9DQce?=
 =?us-ascii?Q?ErA9ljJlOz+cQhiYRVWuG8Dyst3hXOfM7/IlYp6zjkWjrAZOKnF2E6avmAAF?=
 =?us-ascii?Q?NoMtSwHMXjGn4taxEF2Vv0xjFGLwBu2Mpt1gWWAFuFJjGGYN1UzPpVSrgI77?=
 =?us-ascii?Q?4crZ2aE5cDmADu86S8hSoAX3TWyVe/R698Dx36LwnF3Q1VpzoFgSv2WdSQJP?=
 =?us-ascii?Q?JWESLK5K8HqjTv/txduyNdMo8YjeHkQWb6zThoxFJJ6Eye9gxPG6ctOCBu5j?=
 =?us-ascii?Q?mNODkzBjFrehokQpKvBur8SUToTOGy+GuW6XZjk1DHhrlBz/6MkOQyGLDKeQ?=
 =?us-ascii?Q?QdHhAIsDvrX1mHHLeDnF3iUKeAnAUOzSxUIcBMQy6Huf0oYmwyvrYDXvs3zv?=
 =?us-ascii?Q?btqhwiRH6T3vCo4P6yGHY6nKenFCc+WEyDh1/uMM8TS68NNyr7VlmXQ0cMOY?=
 =?us-ascii?Q?ewBlRdnq0eYHVMAE9o8q/i4QFOiphp5cpiRvf6ywufdpcNqz79vG8dRYO+hb?=
 =?us-ascii?Q?tFJV/OVy6MYb/yit73wbuf1PenrE1LLUos4DVu5A4C0+wenhsy3UAYlA5yaR?=
 =?us-ascii?Q?QjPaD88NSH1gHDgktlv7l94PLBRGLY4zzZVY5RDNfCiY/tG76ruVqSuwuUTj?=
 =?us-ascii?Q?dIUpbB+XSYsT2YPXzcb6eq0H1RT9JczuM4yKiFLQzj5bw/k5OMkaRgcSlIFG?=
 =?us-ascii?Q?GkEnTrBKBztT5aSZTMYE8afhv8oVGY8Iny3ZsO8sFTd4PF4i/Jy3l781tsSr?=
 =?us-ascii?Q?Dpru7VrY3Sm3aggejPXA7X7MuOcyV0t0huueNK237pgF8vSKt+2mih4ZXM9t?=
 =?us-ascii?Q?SHll68WZL3eI7xie1d0n14t+4bKAqyv9kRlwaiHeLIh6w5M4GAqFIh5q5IRa?=
 =?us-ascii?Q?RfGVkaJ0k02Ab08XJZKyikwnizHOvoE7X8LW5alWjewLa/ueh1mAr/l7ehf9?=
 =?us-ascii?Q?yA4xiGNKzswauJRVbomJeEC18HKXQJdbcShqAciEv3LlyS36TsMB9xKX9BsZ?=
 =?us-ascii?Q?xzGV6d4OZUqe2NGq4E09cMbyRPzhaHeZqvVCth8ByGrNMgG0+FN8N/xOLRXX?=
 =?us-ascii?Q?vOQmnFWDnSTH8JnK65395YVqd7rrAlKj6AYEL05kAAo4z5pybNgYpkla4MgV?=
 =?us-ascii?Q?bDWOIfCI0PPRqQVQbvuc0PJxo/RmRLnkn6pMuFnvRpALOg8SZaK7xd+MfPUw?=
 =?us-ascii?Q?GPLPjfT9vHJK602l0Jnl8zdoJhvcl5BKs30YnuCaK5RPfti5WP2GVUH/X70b?=
 =?us-ascii?Q?3HMzTU7ezX8Z2DjpHayOQkEgjWxrRAB4GwxY1jD+IfxR0BYCMJHRbMW4YRH9?=
 =?us-ascii?Q?mpgoDdyUL5O0PLQLd0PkTAIyHgDMbmyO70dp3z1+zqgMnOcN7jPmLyHTuGkI?=
 =?us-ascii?Q?TXd7P+HvGs5mPzIACxUF1S1poS7A3iFH0hz5GQTzEK0mlFjYAIG289nxWHU3?=
 =?us-ascii?Q?vhCMhogJ2Fv3gDgwNeyaB6v6J1Qm4YQ2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 06:52:21.3228 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81dd869f-f07b-4262-10a3-08dcb51b27ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597
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

1. remove duplicate test case.
2. Since the bad memory test only has page faults
and does not trigger job timeouts on mi300.
So temporarily moved this test to amd deadlock.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_deadlock.c    |  9 +++++++++
 tests/amdgpu/amd_queue_reset.c | 11 +----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 01185bfd3..6996855cb 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -94,6 +94,15 @@ igt_main
 		}
 	}
 
+	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
+	igt_subtest_with_dynamic("amdgpu-compute-illegal-mem-access") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-illegal-mem-access")
+			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+					AMDGPU_HW_IP_COMPUTE);
+		}
+	}
+
 	igt_describe("Test-GPU-reset-by-flooding-compute-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index fb05aee35..df96c9f76 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -893,7 +893,6 @@ igt_main
 	unsigned int arr_err[] = {
 			CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
 			CMD_STREAM_EXEC_INVALID_OPCODE,
-			CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
 			//CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC,TODO  not job timeout, debug why for n31
 			//CMD_STREAM_TRANS_BAD_REG_ADDRESS, TODO  amdgpu: device lost from bus! for n31
 			BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,
@@ -975,14 +974,6 @@ igt_main
 		}
 	}
 
-	igt_describe("Stressful-and-multiple-cs-of-bad and good mem-operations-using-multiple-processes");
-	igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS") {
-		if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-			igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS")
-				set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
-						ip_background, ip_test, ring_id_good, ring_id_bad);
-		}
-	}
 	/* TODO  not job timeout, debug why for nv32
 	 *igt_describe("Stressful-and-multiple-cs-of-bad and good mem-sync-operations-using-multiple-processes");
 	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC") {
@@ -997,7 +988,7 @@ igt_main
 	 *igt_describe("Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes");
 	 *igt_subtest_with_dynamic("amdgpu-compute-CMD_STREAM_TRANS_BAD_REG_ADDRESS") {
 	 *	if (arr_cap[ip_test] && get_next_rings(ring_id_good, info.available_rings, &ring_id_good, &ring_id_bad)) {
-	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS_BY_SYNC")
+	 *		igt_dynamic_f("amdgpu-compute-CMD_STREAM_TRANS_BAD_MEM_ADDRESS")
 	 *			set_next_test_to_run(sh_mem, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 	 *					ip_background, ip_test, ring_id_good, ring_id_bad);
 	 *	}
-- 
2.25.1

