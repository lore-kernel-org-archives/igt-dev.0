Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87536C5474F
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 08:35:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1390410E053;
	Wed, 28 Aug 2024 08:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tQZEr/Ga";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5576010E053
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 08:35:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rS6CGP6zjsNY0al7Zo5amibXBgSrGPvV2Vnjv703O3CuFKHuP/E3w7k8xQQyaPxxFUNqx7PtL1GfOsJUtVc7zxydeBZeb/YLw0Iw4S5v0f7T+LdCuo0IttHiHIbOhKWvjv4wc6wi0YvwXzUrQq5wfvjhi08whPSE2EipZDH+3ii/v3S0iFmBmXWcF6ueTVIFRkwxQv+fuzSetCHkV9C2q+zMDzelHLM7zQm2PW+/lMOCy0gbAF+6Y17wYZuxbonhzARLoOuV0vuNiiQOKeZ3kJBozpumF0iZ76F+scOuYT76iL4pDS4bZAz4iRfT7/vJgepmioDcTRLGpxhIuQ2GNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+P7GCzpjEoOfAX6UWn3AKH1d4tTfLgr9VYR3dx2/7DI=;
 b=h92WcJaWT49UTrbmdLZo2taavB/9kkPggms6WPq2RJwQ7hL1CIlEcKCGUUbyRGO9Zs6oKOh1ZMekdpwSyZxkwi7b5iHyvkgiXQx1ckeXWNqsH9XcbDdKOGKUsQq8POZYZEhT9tbNTXzrZMWd28jDEfYEKYbKun6/ScU/d+h5yCuUJefbncRs/u+JCRx3ZQyDFvWHCxBuACFs1b6sxrOaK9ml69ZUV1D6c6A7i8zl6XOfARjQuWqA6O4X2nZEg7vjSRpIiIAikPpJePNK2s8fXPdFG1uRTxuGuFSqVVR9M3+BnrNvZBdrNJh+76l8IIo/hHVCme02t0R+wcrmSBF3wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+P7GCzpjEoOfAX6UWn3AKH1d4tTfLgr9VYR3dx2/7DI=;
 b=tQZEr/Gah0poWqhN9qUvSRBJGHmNHMiVFiZFRojyymS6+1bJnmmQ/mlS6DDCNdRS+K7kpyvLy4PJk2oHFAxhjIws/LKd7n7EldFMo4I21cLmM+lb0Ku9On7C85BoGbEQSHWUCgxo+Gc5wUTHuKVVsT+pi9QnSGiqA5VFZkpQ+h4=
Received: from CH0PR03CA0383.namprd03.prod.outlook.com (2603:10b6:610:119::18)
 by IA0PR12MB8862.namprd12.prod.outlook.com (2603:10b6:208:48e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 08:34:55 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:119:cafe::50) by CH0PR03CA0383.outlook.office365.com
 (2603:10b6:610:119::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.27 via Frontend
 Transport; Wed, 28 Aug 2024 08:34:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 28 Aug 2024 08:34:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 03:34:54 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 28 Aug 2024 03:34:52 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH 2/2 i-g-t] tests/amd_deadlock: add sdma negative test
Date: Wed, 28 Aug 2024 16:34:52 +0800
Message-ID: <20240828083452.131472-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|IA0PR12MB8862:EE_
X-MS-Office365-Filtering-Correlation-Id: a45a4d94-ac38-4395-6792-08dcc73c4b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QVoUOhrZZku3vNicq3skCmSW0IFsxtYXkT8ZmIZBSuVWAwrx8hFdziDpwXAv?=
 =?us-ascii?Q?zs9aNxBXm+RK1OtqHTynllxiD2i9PNlgu2OpnVx/REdZWt4iB0s1aoU4FYDf?=
 =?us-ascii?Q?65qDBbMInrz00lNvZHPghCElhtGTGJUjlljVfbBxrIQCYJYRDoZ2bgs5quvZ?=
 =?us-ascii?Q?eqzPAa4RnnRybyslG+NcByt61jlXVy4gVTXFRY8aCVlKMK6Ez32oxGSCiZlC?=
 =?us-ascii?Q?ZzDc0ACaOpzWOmeGC3KqVTD37AT5CAbEdZDN8rV1GUoAY2gRqEq+nokKXNjB?=
 =?us-ascii?Q?M8H7Vo9qOLg/qiVhG+IykmLs1QCWjqmmobGffGYS/MgkPS/dRvLsu+pJUwt7?=
 =?us-ascii?Q?RrsCK8kZZwm1KEXtkiR+CN32kTnyp2+sL38M1n74/Hrt+B76+LaBDjqCVPZs?=
 =?us-ascii?Q?uXFQg7SnvcBEIty+AmufCaFTdMo7hIpUU0E3QfgGRxGwtOKnQftA3cdAzMDE?=
 =?us-ascii?Q?XGpzQL+XijBUxln4xl3tu7YePyoeaCm5Z00T7Js/D/UjOJ9NyUwKFMZZ1SGV?=
 =?us-ascii?Q?h/ro182DqrJoyLFmRRPkMa/S5h2fUOcu7ESHBZikOhPoaHN3fge0vX5895vq?=
 =?us-ascii?Q?JYFka9eTGZ0JoUJYeHDaO1/1mitEpuUxN2Tyvdgbg9FTOQFv2o/Ec6GNGcII?=
 =?us-ascii?Q?5cgA/BGZOXWciEKmsjf028MiISH244Dw8R0M8j0iwwlFCimMkV+2GHfbpKU+?=
 =?us-ascii?Q?f4fsrdY5RdEhhgtvxDIZeVsw7saYWBv9BebmtVXZKA6qzdIWW76NnTlr5rfX?=
 =?us-ascii?Q?MiN7Y/4CAqmQDW2APBHcJp+SlpEQoHyyO8/2eqcPwNngdqXeeFqf3rEzaElU?=
 =?us-ascii?Q?OW7tFILkF6Vj7Z144cEVuOIzNCWiZmxhLzk7autoqBBxucvXWqi+kdqU103d?=
 =?us-ascii?Q?wRfHbyM45s7CkwxIWtnCNgcfJ8g8u11HsP7JF7izFMvP/PM9TsJQa2H79hhJ?=
 =?us-ascii?Q?BU7f7N84McNnPr+tlIQfiJeW98pw0wnp/Kgxa+ThZqjqWpzNUb5g6W55kGRI?=
 =?us-ascii?Q?mrp+mND39pUNG1PZsvjbpJRiaXviAh1hZkL0tEygqWgMD6CyOlcy3Wzw+5Fp?=
 =?us-ascii?Q?Hrv+wjkDWOkqip0xDiu81ZbUuowW4cyE3EO+/hlTLPrp+IjnqREEKKd1YAXB?=
 =?us-ascii?Q?FN3AXFzAjIeK0F8L+hif2Qqvgmv3sLoY81omk1+pRVue3aJdhXXkBlbbjrT1?=
 =?us-ascii?Q?tl9Oj62tYXjddaQzMfZrJVZTfc4PYWKt2WTyPlcHSPJxZCWr5Iq3iwaBUJGy?=
 =?us-ascii?Q?+Z9FMxTnDuLg0Lluf8KfyONAnhMILiCT1fA3OFDQDnPjsj5wdMmW4+Hvv/RJ?=
 =?us-ascii?Q?6RaPglQwLdZ3wFyzuW/g5S89kZnFWGSm/1z3m+21r1DCXzjoYMYBCyqetiaS?=
 =?us-ascii?Q?XM93Au7euYDXMUNkhMC3MERXwRH6Fzcjry331MdTEkSAR8olvHElniHfxPwC?=
 =?us-ascii?Q?T+mNPIklkbG/SdG87snbulnksTTcUC4z?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 08:34:55.1800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a45a4d94-ac38-4395-6792-08dcc73c4b29
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8862
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

To enhance the SDMA negative test,  add a few new tests.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 96da49002..5dd3bf9f1 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -127,6 +127,34 @@ igt_main
 		}
 	}
 
+	igt_describe("Test-GPU-reset-by-sdma-badop-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-badop-test") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-badop-test")
+			bad_access_helper(device, CMD_STREAM_EXEC_INVALID_OPCODE,
+					AMDGPU_HW_IP_DMA);
+		}
+	}
+
+
+	igt_describe("Test-GPU-reset-by-sdma-bad-addr-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-addr-test") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-bad-addr-test")
+			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+					AMDGPU_HW_IP_DMA);
+		}
+	}
+
+	igt_describe("Test-GPU-reset-by-sdma-bad-length-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-length-test") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-bad-length-test")
+			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+					AMDGPU_HW_IP_DMA);
+		}
+	}
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.25.1

