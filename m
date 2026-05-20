Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8066FCD4F5E
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 07:41:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD3C10E096;
	Wed, 20 May 2026 07:41:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dTBIj2tH";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012006.outbound.protection.outlook.com [52.101.43.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525D910EF44
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 07:41:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ne9f8X8zDcGJ5+Oeq4QthRFXPfiYTtDz0ZvB3qfTcYtQQ8uiJA4xZ91FlDEOC7CNSf+Z2xR1xOTTtstbAOnESMnGdljV/3pW3F27DvfVifJdziY+k4W0s3ue8uOymV7AH44/Kxr5GdtMONJfB7n9qlyOs/Jheepw3JILdYbNGytKphsTh5Ri9R+8NICWv/EOBvNV4jAxOX7eA/nPS8m91WwJfWqDbcl7dB029jk6/KCAL/QGFad/geNGDxaXLKpuNmBSFxI5K2rQIVl12e80TAmpz7u1WrHLvTpWjkdXpbsDzJF1chY0asJQ8Jkd9iYbPuMu26E2i81r0290vGaM/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fK5h8vINPPmqyr/9fQsw6KI489d474jLG0bzvb1Vqh4=;
 b=hB3HqD7thlwqRVfZ3suRqmTUis2HkFVqrvFSBSx6kW9OvF2XdecrCLzHFzTLuWZfi2S0kX3iH3HcCXNXI0rwcyr3fUxJkq9ejo+jhd24pxHPzIl2DKT4hFv/FctJ/u9Qt6plTRASH3HeydKDywysmZIoa+h/DzwyxocirPvfvhvpe8igGeIjHYLZRJqJCmCDVAkbxhCLHkbOBgeXx1CUG70bix37eZviH59NlytsdOg7WYPgqtWcYG0SgWvTh3Iup45upbmv/MTmPCuIJKNFHE/E1Jg6tEcmKqqwK1Bo9vvYYav2T3Rbe087SIQ5biribPZeERq7CA4ofJB2ZXPdBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fK5h8vINPPmqyr/9fQsw6KI489d474jLG0bzvb1Vqh4=;
 b=dTBIj2tHFCQYY1vpZi4Juwjv9R7oaNNHqhGTmEeLX4CPIWXEK88BGcPH+IL3mcOK5yHpWGajYm3X8rQLtLEgAhYx9Iaeheaagu9ZjC3hbDsBbd15PPdrkPq0NnFmkxn1QmBOvFdMkwWx9cT4Bqc+eNHRxO3rU+Tl4BZiV1jti4k=
Received: from DS7PR05CA0046.namprd05.prod.outlook.com (2603:10b6:8:2f::14) by
 SJ0PR12MB5661.namprd12.prod.outlook.com (2603:10b6:a03:422::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.24; Wed, 20 May
 2026 07:41:24 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:8:2f:cafe::7f) by DS7PR05CA0046.outlook.office365.com
 (2603:10b6:8:2f::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.15 via Frontend Transport; Wed, 20
 May 2026 07:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 07:41:23 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 02:41:21 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t 2/3] tests/amdgpu/vpe: set blit test based on IP version
Date: Wed, 20 May 2026 15:33:19 +0800
Message-ID: <20260520073320.14656-3-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260520073320.14656-1-chih-wei.chien@amd.com>
References: <20260520073320.14656-1-chih-wei.chien@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|SJ0PR12MB5661:EE_
X-MS-Office365-Filtering-Correlation-Id: ed97eb54-11f5-4f31-d774-08deb6433123
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700016|82310400026|376014|3023799007|18002099003|22082099003|56012099003|11063799006;
X-Microsoft-Antispam-Message-Info: aGZbv4mTmhS31QpdNLhYgu4JSy/FfKvh6BYWQ/rNGPhXO/btgxTWJP5+SXo5r3e7UZXBdcRUmC5CHgIbONDeqzPSEKkBc1NlmDSt8bPhcnlMw2eskuEGiLt2Aezo3n1GbT+AohXcnAm7X+2zZnvm8KB9ozOaN/oOOeDV6U5gHwdX9KdF3AeDEp25X5hUqNokZu5c8rdYuSEg4y5XrayayBhY84FkhdWRLWRHFU5FMOhh81Xd5YqX38rL2R2G0AR5/UNLy4OpYYdmui+RNdPJR3mZN724l6PhAo/YlItkIrU0eOoN77oxLCSv6u5WRIX4YKmFSEW7E/W5pzR+lC/C7fDB0tkKQRWzkI3v+xyYxMt8AdBt+0Ii07QxJPvZ7Xr1W5swsNXuLQqNSOKtUgA1t2pZs6U1+7L1F/QarO5xByS/kfaT2frzEnHwAbk6TPugP5G9ks6QI6kRAsLoa/n2c7CpECM1ZiGsSBFKKTHLRrenDzgJtVAmNtpaRJJ0KqhriPw2neWY6265YnDSy4P/m/0aA4lP5D97ZsZnS9RgGBj4MgOvziVbSuQmVmT2RUmgBMbQ5j3BMrAsICLmwKckNeQ2uNAcqWU0AKln0OzZa/knVrJCYdH4pZhKPMoes7VSX7NsMtetf/zaTp5SvJVoS8ULWa8ESPPJfx76PK9n93xl9xQZa50SeKuVWAkJZV6EKHuuscujPPl3GPhjJSFHwf384P+clU/SmHUPjVO+C0o=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(3023799007)(18002099003)(22082099003)(56012099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: uodi2dse/lXlms24EnIUtP5MBNH9BFVu+0T30cQlxt9oN9iW6CkN1GLUIglpJH/rPo3JTdlpYIR7CfEsZJmw/TGuoGCOTW56cO9n1Hpuyvqzk9hKBLFrn3el8r+46iQSc+SDebBbfzV5C+0KLE7vCeKKhBExqCVzFWeocHvQiRSU6lwtH3yrmeMzlmlsspwFrqNW84heeZlIFCcs4wYgXG+TnGb3l1UqLb0CO9qkAuDwA1XLO6ySFVK9qw0byuJ8N/m7OM3tiwIbzzuvJ4B8Q2u6FvHHtaFZx7/BaGV7NvCW2K9bIrd3z0T5O3HESWFMgMq2JYT9q7++OSzosInD+/mLN4bsAIkf9J07UF20yqjWm6Jek2WXbRhMwuurVVqIucgZs3EUPn4d/fdk3rpD2bAEynMXlKw4NI3TocIxZHPlYcQBM4y7WlrPP3kphx7u
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:41:23.6314 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed97eb54-11f5-4f31-d774-08deb6433123
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5661
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

Commands for new VPE version may not be compatible on older VPE HW
(e.g. VPE1 HW can not execute VPE2 commands).

For test runner to run all tests without manually specifying blit
test to run based on udertesting IP version, a new switch case is
added to execute the blit test corresponding to IP version, in the
single blit test entry.

Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
---
 tests/amdgpu/amd_vpe.c | 27 +++++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)

diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 638efce11..d5b9f403e 100644
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
@@ -367,11 +386,7 @@ int igt_main()
 
 	igt_describe("Test VPE blit");
 	igt_subtest("vpe-blit-test")
-	amdgpu_cs_vpe_blit(device, &context);
-
-	igt_describe("Test VPE2 blit");
-	igt_subtest("vpe2-blit-test")
-	amdgpu_cs_vpe2_hmirror(device, &context);
+	amdgpu_cs_vpe_blit(device, &context, &shared_context);
 
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
-- 
2.53.0

