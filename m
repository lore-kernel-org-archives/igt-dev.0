Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFDFCA1012
	for <igt-dev@archiver.kernel.org>; Thu,  4 Sep 2025 07:40:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9F110E99A;
	Thu,  4 Sep 2025 07:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mGYmIbQJ";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7D410E99A
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Sep 2025 07:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h3mS7GoM1sxvzeLPP2WhXkFaejMztW6UWESxleBwKSYirchZ20tTRZKYeesH55BObSXZ/sr/ZARepMd5qH+BL2kLSVxqY0jGCQkqfPyEQ3A9fbm12oB/wMUexNuL0s9iCOb5p//xhSDVcLoyzqyOSwCboCqEKzA89RaLBXpvbIe6Aj1ppLXzmvU+omDTRiuqGgOo2kSyW05wVw1VRuctCyYS6OEagdrpTeoZkdWSoCDOPuvfICsy9vRAiJrDhTCH/CyhedubF0ijRwFsHv5pl4sFFYC7wEYet9rutElal+cYuT80ov5XXXM7ju+Rc82DaQAJlEn4tUyt07OgokVJdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/vqQDUbt0fg4xmVTiy9airsXJKCvNf/tL5QDMEgKNHo=;
 b=o0o4dLSh+WWUwsRGKQlqxefm9hq26x9Lsa32ZIeEBEKyU06ba9IXJjS6lTnoL5t5FNpgFz+ybxClecXsZzBaCSBYPLvkC96t1xTiotb1UUCTaSgO3gU5kjgbomWzVxbQgeYCS6cdMNrQa2U8v344qzj3dcC6HKLz8k9C4g6uD85u8FS6H6KceXNxsk0u6ChJ+M3N2Np1GaYp904HfxQLU7BlP/t8l2uFgTEXasxGfM0xt71yP3jMAyHWcwdsZyRiJluZ6PkaUGM2Zi7ktSH9ez2ZLdjBc5WUQFbtZTRf0t6WqahhiVA8Iv1G/secsqxAYWQX5+4Hqpfvq9BDgb8Lbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/vqQDUbt0fg4xmVTiy9airsXJKCvNf/tL5QDMEgKNHo=;
 b=mGYmIbQJE01WaYhPL0w1/wFn13AGQgAoe/9LB4idN/zM4dU7zJTTQz6clcGKGecwjhpS8v92aDGsdUHKpINUElnJgTadIMTVZ+9W/vSmz+7OuPRqg0JafzcWlAnnaj5ozvbeGL4EKXozat/xJHjZQiZESDasSXxCQzpf2TxwC/0=
Received: from CH0PR04CA0028.namprd04.prod.outlook.com (2603:10b6:610:76::33)
 by IA1PR12MB6066.namprd12.prod.outlook.com (2603:10b6:208:3ee::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.29; Thu, 4 Sep
 2025 07:40:42 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:76:cafe::49) by CH0PR04CA0028.outlook.office365.com
 (2603:10b6:610:76::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 07:40:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9094.14 via Frontend Transport; Thu, 4 Sep 2025 07:40:42 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 02:40:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Thu, 4 Sep
 2025 00:40:41 -0700
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 4 Sep 2025 02:40:39 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: fix double free in deadlock helper
Date: Thu, 4 Sep 2025 15:40:13 +0800
Message-ID: <20250904074034.3210105-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|IA1PR12MB6066:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cfd2f34-41e7-4cde-45f0-08ddeb8659f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pdb4QdbmAUq7e4jxVF20u1jEQO/MqF92emrl4dA26/lliiyIQMFgcJ7IUZci?=
 =?us-ascii?Q?gF9yGODtq8XULuAwXT7dTT6oDLKhhZb6fY8AhA7UkFsrScR9DsuuG7iuhaN7?=
 =?us-ascii?Q?ktFZWZE+uzWdHN5TTVBdindePp2ZiNFKZK8uUldP3jK8agKnR4Lqd+3hI8I0?=
 =?us-ascii?Q?9p/T5Snfrf6RUu1x8M80g77U7lVfNqsmBFvrwrbZdjPgCMl0LryviHcl1qJs?=
 =?us-ascii?Q?aTNoCMGq8Qe7kTnHuleXk8Nz932Rf1gFzshCgpYnvT8iPqCuHIMsRjYznh5m?=
 =?us-ascii?Q?6AatN9BivOgPAjiZzZaIOx54oARV7thyQc857Na/U/VpF6y10SxyE6wKIAk9?=
 =?us-ascii?Q?wawB/tE1YWDocQ5lvDYktQ2a60OfLWoOa3FoVo9rGjbtzotChACYcyv9WSv5?=
 =?us-ascii?Q?w9ij+1XzjqSKffoS9UABqmAEfc7cK8kF86WOSJrSHEGGeU+Zc3N6ardgvVXv?=
 =?us-ascii?Q?wNMR/4JCDvvYJKvR/aMKp+2vUy4fb9DNrewbeOaNvfcAmvyrnSim+1k8a+8j?=
 =?us-ascii?Q?wZeylx+B5LPlbwi55lfkdVkTkpGtskDZ8M1v7a+x24PzbGVf3j91fDWJACO3?=
 =?us-ascii?Q?wMjg7wfOTnc1zCaLhF/biCi2PAuu03lCbtABLL4ti5TlD+qnTSGfmesVtgIC?=
 =?us-ascii?Q?cfPtS06ePJNVq0fN3r1uIHlecVXdXUUnog1g/qevtZ0gtB2nv8+3bkodPK6Z?=
 =?us-ascii?Q?4Db2auTPwy4Nlv2BPBj+vM5p2ntWZoSMLLEvXFoygqXMOgmFYsNf/ThAopNI?=
 =?us-ascii?Q?aL0WPxb8/WO3DZee2cJS2gRMcl5/J03a4uA970TccEKLLv+Qfp9u52OS3uYE?=
 =?us-ascii?Q?bAIS4QHYUet9Dgsl2wf/KW00o0Pcmx+OxYXLff9TEqcvXVOxvwNoBv482HQk?=
 =?us-ascii?Q?0XXDtH58OjG8hT/TSsHg01Ao3GAoUaCHTsbQbxOlWfcO/c5PzLmsQ+7IKmUh?=
 =?us-ascii?Q?ykh1xFRUnZ/vux5dlkB3BcBRGY3Zf+o6Er2A6OFYiZ+IOhcQpiM2GgLVOZAm?=
 =?us-ascii?Q?mcoL2CfkMkN305IAFD7CYKdyBVesJfgmw+xozAw1O/mE93hxnuoHyBQIRPo/?=
 =?us-ascii?Q?BTFJNZhJsZfAMOVI/W4KzUcBzI3RKXND8pVWcT0emXYUKEoXD6lMVBhMYSmQ?=
 =?us-ascii?Q?B92f9Vc0Oz7e6XCUkRIva8Tfn5Ey4HkGiNRZ2jxUFK2Vito7oGE5fEqfzMyW?=
 =?us-ascii?Q?gMa1ZRgwI/fSEEENe2NPS6qYH/gWQNY6Z8g/jUkOuXvL9N6nTYvzFYF1bEZ9?=
 =?us-ascii?Q?jzxxrR3swM1nL6sUAiRBXuQwDT2HoIeQFP+D6s2UiaFwgbF6G5H26uWr82s8?=
 =?us-ascii?Q?JP0VJPXRJOZ74M6nBOZYX9ygnBUaUVYa61EUjrSCGouf1TgqC/vbDgdNUxz7?=
 =?us-ascii?Q?RRH6VhzoFiuClQ8uJFYfz5HLX/kpCLli9z5hDq1TJhr0KpA0gIzFKkfIGDPH?=
 =?us-ascii?Q?EPK4IayNv9UL+8WkzpGQETQfPPDAMnfzXQooR4WQ5aQLSgrF5bX9IRyAR9sR?=
 =?us-ascii?Q?XI0unAg6xS1bwBkQon5evff2lLXK0L3ks3OR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 07:40:42.2940 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cfd2f34-41e7-4cde-45f0-08ddeb8659f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6066
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

This commit removes the redundant call to amdgpu_cs_ctx_free(context_handle) to
prevent the double free issue.

Fix: commit e84f7c9e8d5bde (lib/amdgpu: Add user queue support to amdgpu_wait_memory_helper)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index c7799b00a..83b033c40 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -200,7 +200,6 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 
 	amdgpu_bo_unmap_and_free(ib_result_handle, va_handle,
 							 ib_result_mc_address, 4096);
-	amdgpu_cs_ctx_free(context_handle);
 	free_cmd_base(base_cmd);
 }
 
-- 
2.49.0

