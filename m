Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD22CD4851
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 08:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5835510EB14;
	Tue, 19 May 2026 08:37:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CQpGOkOE";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013041.outbound.protection.outlook.com
 [40.93.196.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A755E10EB5E
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 08:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fco/5atQyhjAmpIjhQUfPS6IkcR7a386D+BhQ6txZABHyoxHcv4VbkeQJqpnengc3e93TCiFykGK2lYNmrVV/i6ClCtQlSlzn+aDSbEwqddFnK2eSsd2mbGvVBxJp5+TZLEXZC72ADIok+uaDsjniz+M/atanEg0Dj0/AH/5xWeFq2S6VeN6/NWKnC4wzgUagc2qMGxfaqijGv0xoRqXiZeDNiIivtK53wcVgZZCnvkVZqHTNAZ27ko1rReM8S5reO9BsIEboJymo4+urZ3kwCQlF/53zje6w7x+UdoH+mZTupn+w76v75v8aPUjAW8PT/nX6RLhsQeEWdqcrdq4MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HHR/GaYZOlq7Wg69xIotst6oTTLN1PMTU5UfSXI7dUg=;
 b=hDiaDzk8TQbafashRYZ3KBrtRg3gfQ/qilaBmbwvsKbS7f6GqXCIpryMEHybYjijaZidR0zKG9uy182+bKxRDqepsALB/jvrmvO/OY6cBlzM08RDPqyORr9239B9Lj/1iZH0ZxbvhOtfhsY9DUueNrmtXIGdFVfK+Fe1xZZ7mt/K8+YKXoQdvI8hn16u+EEWzmAwPUjByXjH8qBCCTHEAaZXFxu+eJKL2+HMnhhuPB9ASM9C5E1BX+bBmu7TXaEiuKlCP6G53glzIoRrlkaLHZVH3b624vXi8M6vwp+gPawE1nwb2tdE6OiLIIQZ/3QQ97m+dy/Yx/qHvDXm35SZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HHR/GaYZOlq7Wg69xIotst6oTTLN1PMTU5UfSXI7dUg=;
 b=CQpGOkOEm09cdt/1Jt+sfhJfKdVpkQkV6oH+USEW4udFoKcEgC6tA4ULnp0ksDz7m+VSTkHXRTeRJDsAy0LJQTtEEFHqW2yAd85XIVARCShKfSnI5RJTNz8rT6cD8oetDGvPNZMEnsUqcoqr0zF7VwTrSHWFR2nf45KVgZocATQ=
Received: from DS1PR06CA0006.namprd06.prod.outlook.com (2603:10b6:8:458::12)
 by DM6PR12MB4337.namprd12.prod.outlook.com (2603:10b6:5:2a9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Tue, 19 May
 2026 08:37:26 +0000
Received: from DS3PEPF000099DB.namprd04.prod.outlook.com
 (2603:10b6:8:458:cafe::2c) by DS1PR06CA0006.outlook.office365.com
 (2603:10b6:8:458::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 08:37:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS3PEPF000099DB.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 08:37:26 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 03:37:23 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t 2/3] tests/amdgpu/vpe: execute blit test corresponding
 to IP version
Date: Tue, 19 May 2026 16:29:04 +0800
Message-ID: <20260519082905.4077423-3-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519082905.4077423-1-chih-wei.chien@amd.com>
References: <20260519082905.4077423-1-chih-wei.chien@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DB:EE_|DM6PR12MB4337:EE_
X-MS-Office365-Filtering-Correlation-Id: a3410eb6-63cb-4890-e90a-08deb581dae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|11063799006|22082099003|56012099003|18002099003|3023799003;
X-Microsoft-Antispam-Message-Info: Z5VqrnZ/CB0VPKrgAOFFauOULuddLxDT6wuikcRr+DGUtqH6+oQnhGwujW8GHEZILMxW3XHaKpqRb3GGHSjWLrHvwSLsElE4ygbA5Ho1fKOiFLGqC6gpSkKSvQgeuC6rs6yZ/s3XfDHXyNF0YpmT5C7zxYUakIjmrDb2hWUn4mHhXMq8YXeCvtPujvnQng2MUOzDJfjWQGDa3scmG9puwR4v1/xn7vvp0CmR1QPZgS0I5ZwTP4CmN7HZ0EXgh2XnhxHoo5SaPTSaKQaHz46kUIIaJ4n8Ven3iFqbSBuLoJc+kyGcy0cHDWcmyzS+I/VPEe/Kt00bW2QzydipFK8aIJ2h0hNdjDHKzTFC7ahZ1WgGc0Sv7bOyCQDWr0uNEMwDl4R7GFPp9fNYTm+YFWNOPDzv+f5Wvw+lcZs+BWXXP46VKnc8vh2SaMCzbG6x8fAL1yzxELkxVEyS8Bm8hxXIPCEh3BH/wR6WtseF2srZkHb8qHqFHkB8orc91Ag8E0MhBI4GeNlqiHO+JHUV+LJYU5ddNzpWCVAn7xVQTFs49fV61aZb5JjCzBUHhHSUxEUISCRypkz1/NFxNp/WPH5bODeVcqQtXC4V0xO7HePS6syMWBHEV5pp67sviHhbIWzuHq2ESmUGh8fu4Q31YQjrhWvnsryBOnwoIuhpkI06poAw+aAPnFkmZkpls6B5Ilrd/3u353ah0Jx5FuWUFr9Ii4S6J4CxV5boRNXziJV1MrA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(22082099003)(56012099003)(18002099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Wha+VEPelx2I69Zfnrxdp36wkLHxH8iY8DLj1RinP7uGi1lkvrQX3aTCPFUB9TICh2GEB+g2FluFaUAZeeWTce59NSgUGAksRHlhbnZOYf0ma+ESaxWEIq7VykThYWeYG/AosqB2VHcFWK+fvM+sX0Ykp1KxJEgQHVjJrJYbuaA0r1DJ49G9YAX2oHO76CQQlPnukPxfc61DePfVM+vTwz1wcrHijtn29Q6M1gF0QDX6O7lia7roodktYsRYShQAvm9UpVJ9dGqk0FemxpMMt5mdWag7ouqYL/k09lkeA/KWn4MGIZvClW7Eryah2RXJHyV8ezFmjOJLID2EKqdCc0pqbaLhvQpo2tme9cpXR4q/xbUXEBusZ+LGiFVtntyF/w5Sw9jcsfshzJl1TANSG7ECAlh3luvhQBGcspwA/1RyC7ed9uiqOZIbB83Dl8Yr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 08:37:26.0172 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3410eb6-63cb-4890-e90a-08deb581dae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4337
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

Commands for new VPE version may not be compatible on older VPE HW.
(e.g. VPE1 HW can not execute VPE2 commands)

A new switch case is added to execute blit test corresponding to IP
version.

Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
---
 tests/amdgpu/amd_vpe.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 3c7501f47..d5b9f403e 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -176,7 +176,7 @@ static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
 	return 0;
 }
 
-static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
+static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 				struct mmd_context *context)
 {
 	const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
@@ -334,6 +334,25 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	free_resource(&dst_plane_bo);
 }
 
+static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
+				struct mmd_context *context, struct mmd_shared_context *shared_context)
+{
+	switch (shared_context->vpe_ip_version_major) {
+		case 6:
+			/* VPE1 has major version as 6 */
+			amdgpu_cs_vpe1_csc(device_handle, context);
+			break;
+		case 2:
+			amdgpu_cs_vpe2_hmirror(device_handle, context);
+			break;
+		default:
+			igt_info("Unsupported VPE major version %d in blitting test",
+				 shared_context->vpe_ip_version_major);
+			igt_assert(false);
+			break;
+	}
+}
+
 int igt_main()
 {
 	struct mmd_context context = {};
@@ -367,7 +386,7 @@ int igt_main()
 
 	igt_describe("Test VPE blit");
 	igt_subtest("vpe-blit-test")
-	amdgpu_cs_vpe_blit(device, &context);
+	amdgpu_cs_vpe_blit(device, &context, &shared_context);
 
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
-- 
2.53.0

