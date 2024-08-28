Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2ABC5479A
	for <igt-dev@archiver.kernel.org>; Wed, 28 Aug 2024 09:46:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02C3910E24F;
	Wed, 28 Aug 2024 09:46:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RTD8I2iK";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2047.outbound.protection.outlook.com [40.107.92.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B508D10E24F
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2024 09:46:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1sdICphofL+mQzLEd4QeLoEbx3d9DKu7dRB0Ie4PtEVxcVYrxskmA7znKfZHw0QTH8BUHgd7SR/DpbIOLjD3aF5z2asWX5khxoNSIrZiSRALAPOmaRX5ZBlZ5g1aevoUAClbbw8FT4wli0cGF5tTMKlW0naqeOG3dWO4WO47JQtFiQZPicei960UssnEx3aslZHmaQDny+AyR3MDpsx3bcuYrS96GRTJ2RMeAHbmKroDTJQHdkPKRExMYEczw/R0ET+sbCD/suMcF7oKlYPGuUOmNgFkQNWOulmWAQmiFHr9DGdkKk6TaHARmbnlgp7zLYr7uqbk/yo6J4ZDu8swQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lwvmxt7PhxynDmH4buecMEDj9SHHmsDDw+QTcjQ5FAs=;
 b=REFUAb7zmNjcnMwn/wUGB4Nm93c9H6JQFadhJTJQcQXG5d825ikGiIfy6ei4L2dTh3d2S9c+RODGERGX2byHmQb4w2SbfaFvdWePv+FndOREw6tAY7SG9j0nUpiNTW5sAUynjDxAOVXLUyE8VpfXb0e1JlDktvkuUL7sptPP9nnWqj2hN+z6TTHg/+zb+5jtC4yZSo3MASNMynMUKXR5JTxSYCc2ERT3HhmY7oqSnHmw4o2QGmpLdMQSryVAiy84YNwCuZ22+PzVds3VJZExfMu2Zg0OrBpOxWBWU3T6lXUBcaBEJ9E487miXMygXbAXrYD0qQ6Ee+2TiI+HJVUQHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lwvmxt7PhxynDmH4buecMEDj9SHHmsDDw+QTcjQ5FAs=;
 b=RTD8I2iKpBF8p67VfK96KUeZ1pkk7TuaAMW+wDm3lCNOeqTFUvMqCf1hfIbR+p8AtkD02mFc5dx/kzIqolzRBsgUxggAgekjQ7bQDSeI34Igcsv0R0f350JuWGC0UzuDp9TFIJRVNU03bNTfw0tQkX1SO4/2xQjTn96akxYjNrg=
Received: from PH1PEPF000132E7.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::27)
 by PH0PR12MB8049.namprd12.prod.outlook.com (2603:10b6:510:28f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Wed, 28 Aug
 2024 09:46:21 +0000
Received: from SN1PEPF0002529F.namprd05.prod.outlook.com
 (2a01:111:f403:c801::1) by PH1PEPF000132E7.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24 via Frontend
 Transport; Wed, 28 Aug 2024 09:46:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002529F.mail.protection.outlook.com (10.167.242.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 28 Aug 2024 09:46:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 Aug
 2024 04:46:20 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 28 Aug 2024 04:46:18 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
Subject: [PATCH 2/2 V2 i-g-t] tests/amd_deadlock: add sdma negative test
Date: Wed, 28 Aug 2024 17:46:18 +0800
Message-ID: <20240828094618.150511-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529F:EE_|PH0PR12MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed86932-0af5-416f-de10-08dcc746459d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?R35/42EFVVtNvrHxijF5ZdQTppZBM0MY+zKShgL0w8E6PU3oGzmj1KMIpqH/?=
 =?us-ascii?Q?v6uUf/Q+Fr31+ViXy5yzfLRk02whGoMWs3/nWLPv/bMzi1IxsJK3rUEiik3x?=
 =?us-ascii?Q?T6CEHmcm6iZrO7s8miegd89HDNjvhQy2erI2Ty3tD5phR9xwTG7QC4EKjJ70?=
 =?us-ascii?Q?oeqz+63p2uepv/uqJReXlefsza5ooKwv/N3YM3wfw4wH3rQOObfD+YjSiaTZ?=
 =?us-ascii?Q?sxkwhfkfcuy8+5UAqXTxHTUtTaWjMmXdg0wi/dXu9ujhXSaUz9/0trU2LtZ/?=
 =?us-ascii?Q?nh1YRqk0+q2vfGsfKqP4vJ0IsooHbTWJ/Fuyxb+ABI0fxQ3kHB0E4Et17Rwx?=
 =?us-ascii?Q?g7inKtNMOMQj9bU3+aHr8hMWMUoV+3I434E4itizR7Y9+S+3/LoH13CiwsRk?=
 =?us-ascii?Q?ZCDeEzyn2UCD7fjaPjGCMZSVNShabdjOHtE+oYNeSknRqCH6OkaVLsOZhl+3?=
 =?us-ascii?Q?dCGhp+t5OGVoTRfe+CgOhVMaP7Ot47EXkKY21FP3QpoGph2b3OJ/O0+U5QXE?=
 =?us-ascii?Q?l+ijgKf+YkeqaGgUXQHTEdgVlU+DDEr+FL+ktZ3DOa1Esie3mgIP6DrwJS64?=
 =?us-ascii?Q?+FNcz5F2V3S7ws6SIKIMeMYWnmgboH8NB/xZsIJQBf+JmBNh1uiL90PCNHs2?=
 =?us-ascii?Q?G5NbP/u1DP9fPzSj3ADV5kzYrUhbTNHMM9M59mz+mgr2msqipMDsy+Xlfmyf?=
 =?us-ascii?Q?lcrrY6/o9qXJD5932wdVQM4k/ibUCbJ8D/vqINK8/1icjUilsSWXEowQrOdC?=
 =?us-ascii?Q?3x++wIKiFeVlllwjnjU18tmfw/Guv+xnZ82G/49sdO1SJSMOKxoVIivrnPlE?=
 =?us-ascii?Q?LQ8qa34ATC++B2qtV3jhDxgWkRrysanNN9qjqZKr+xCRd+V7J3ZEcNoCdNRm?=
 =?us-ascii?Q?kQWD4w80HokjQAyWhK6CCABkkSjKVr3baEkCjGF4aZuWTPaAL7OuEXIxwtKQ?=
 =?us-ascii?Q?KGmX8sXx8Gvm3cxnSgz2kKbI+CnnE25Te2CsVAfszyXeJu084M6AXzANRRAM?=
 =?us-ascii?Q?t2Gy89ZNs3AMfVEowuP4tWCVVj/mZznThhp11H0zdFTaJkkn1vZP0zX2OS8S?=
 =?us-ascii?Q?JKR8w6BJMFwbe/SQB4ngUKWQUEyiLmqo05EvJIWK5Cf6GHl4zs8OnemW3ZA/?=
 =?us-ascii?Q?eBwkyhLdpHy0sI1y5iXnBINibHquklVOBwTVMKKDgA9S8vb4pyjGavdmm5u/?=
 =?us-ascii?Q?/A9e799NVchUCXzqGmE8QgRxnMuqqSeCk6WGhwCHzWbJQc1HmirBX+WvvvVC?=
 =?us-ascii?Q?Z4jKoEe86mFf25McbAyilMsd5Fupat+4dtys66CZHo4FkYZY0xxg2naeW4Qk?=
 =?us-ascii?Q?HksxwMkXBKVq7KhEXezke69BshrcWm2Pf1MweLmQl3aykHv3UOl2BGd3kjdZ?=
 =?us-ascii?Q?MQ+6k2oBQIJ4g67rvO8CSHyZH/wDFYojt7h1BcCCNm0z3hJ5QxvdEn9GwOIZ?=
 =?us-ascii?Q?VSMD0LbU6aU6ht02/878B7rDRoliMcK6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2024 09:46:20.8598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed86932-0af5-416f-de10-08dcc746459d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002529F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8049
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
 tests/amdgpu/amd_deadlock.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 96da49002..5635d0982 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -127,6 +127,42 @@ igt_main
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
+	igt_describe("Test-GPU-reset-by-sdma-bad-mem-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-mem-test") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-bad-mem-test")
+			bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+					AMDGPU_HW_IP_DMA);
+		}
+	}
+
+	igt_describe("Test-GPU-reset-by-sdma-bad-reg-with-jobs");
+	igt_subtest_with_dynamic("amdgpu-deadlock-sdma-bad-reg-test") {
+		if (arr_cap[AMD_IP_DMA]) {
+			igt_dynamic_f("amdgpu-deadlock-sdma-bad-reg-test")
+			bad_access_helper(device, CMD_STREAM_TRANS_BAD_REG_ADDRESS,
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

