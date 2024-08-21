Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757FBC52D7C
	for <igt-dev@archiver.kernel.org>; Wed, 21 Aug 2024 11:02:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B58810E566;
	Wed, 21 Aug 2024 11:02:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zSjUbBfE";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F286610E566
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Aug 2024 11:02:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dSM6qXm5D/jIBS7p183y6N5o203kEslcA2ED5Hluu4iDanMUHVBqGj0Op0FlTAkfWss/vvySQ8MXofd93dzyzPzPYsT3tj9qc1o6aRzvTsDpFnd5Wlh0gZgn6ruTtnB8oeqwMAgeaE32yOjB27WmbWUNMeeYilqJcTv0jkZF4qQKfu+KwpgVCj2lGML+Wl2QziAQjwOw461s7BnDaJXVaPNfDhJo8QaJKIoCjt4/EVnebOnXOxk+i9NYhDQ6lrYXL3FhAwikx9YiklIcAc9Hka2VL0KiVufuELRhGTgKKwgZIUiwfyt0H6qsnqZAhuuw8SapVcnQZjw5SH4FzRu16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMYKAEEF1yfFdzU3ZMZAYTi+Jhl+OwS6FWyLM0b3e8w=;
 b=hLCJHX5XHiio2K3ZbtbMHgDogATFiViVAnig65vmyRsvhUSTjbzWGK8m3KhjiR0gStqm1tex0IRs1n/gygZG+BAslY/wf/A/0zTMqPnxhpI9gPqbMjVYJ/SIZiN7vXc9qdCLJmd5wiTKWmWlbfW08iFJkZnJkXbWvv9ALRXm/qcU8gBbThGtCQc8/4/BWiOTM9Bked8czP4kWs7uFhQciE7D77TrtU26/GDwGbicD/qlumijeFsZ2ZDXQfl/ZAxP2qi79jxYKupmOqadfoqp5zypwrcHJqHVvQPmECfyGbAyKrYOZrVbCnW9A7k7+gwpqvjcBXm4PHBqtXKS8PitLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMYKAEEF1yfFdzU3ZMZAYTi+Jhl+OwS6FWyLM0b3e8w=;
 b=zSjUbBfE6Fu3XiMf1M/8Do1cX5urkfLYgMg1+xviWpp4dNcJVrsCaE4IFqgyPkiqEPAWabBjadVKOuc+pW/PF8pL9XhnA1po5XqVCzb5ZdpvT+p29GXCiJcZ/vms9lWLXwnFmTrl1DgM44KEKyT4fsy4iS7RR1KKvI4ZlIOdTRI=
Received: from CH0PR03CA0398.namprd03.prod.outlook.com (2603:10b6:610:11b::29)
 by MN0PR12MB6128.namprd12.prod.outlook.com (2603:10b6:208:3c4::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Wed, 21 Aug
 2024 11:02:50 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:11b:cafe::3) by CH0PR03CA0398.outlook.office365.com
 (2603:10b6:610:11b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Wed, 21 Aug 2024 11:02:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Wed, 21 Aug 2024 11:02:50 +0000
Received: from sdma-Celadon-RN.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 21 Aug
 2024 06:02:48 -0500
From: <Trigger.Huang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Trigger Huang <Trigger.Huang@amd.com>
Subject: [PATCH] tests/amdgpu: enable amd_deadlock test on Renior
Date: Wed, 21 Aug 2024 19:02:32 +0800
Message-ID: <20240821110232.2559-1-Trigger.Huang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|MN0PR12MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: c19af5b6-82c2-48dd-5ecf-08dcc1d0cc5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wXj1Qqp+W+iTxKh/uZU+9RvusWzi6iX/MHZCfZIzutyRSosR/6y0qHM8s1MP?=
 =?us-ascii?Q?KFWa2ONGhBOhAgLfu/a+36yAyk7AnUUcnG6iiFPSdyttFraq1DeJtf57Xr4s?=
 =?us-ascii?Q?2k4z6hKMZOAshPKr2yn6zONu/M4iLxv/GINdQR9UFqh+5GWDTbvO9gWXRDMT?=
 =?us-ascii?Q?Q/DWxs3c3kCwazfxJ7h5wruYqdbw0svYEITTi6Wvnjr3Z9ZTKOCKtR84oZh1?=
 =?us-ascii?Q?QhgBKBkwpWcypqUauUhvfPVUJBkU/nD1pEa1BaSqPQQ24e3CNYQZzUi8UiSa?=
 =?us-ascii?Q?9+dyETLOPSTPR6ZSZUyT97NEHb64ApfsB/OM9vOxJNTTGyRM/6dtsPKJhZUR?=
 =?us-ascii?Q?E2aLaBu7Kxv68mNe72rumzaqZETPXRSpDKLHlQsuum0FAc/Melq/8FljbbPS?=
 =?us-ascii?Q?I5soIWSjFWHylJwIwbBJc6DkS1I+WK2frRq0EXD09bEM8Y4S6Fh3nhqqERmW?=
 =?us-ascii?Q?qNwfWK8bocAALffj4pJVf7IxSdx1zghl1r3RfjbH/cxqrIla6ORURpIzf7Ci?=
 =?us-ascii?Q?la5cfuLALpR9U/dUWMoLJhx+m37lxpIPHUP4ldRjFqZ7KddkpYEnGJAwPxQE?=
 =?us-ascii?Q?aWDmUL4u4chf8t0ljkNSFQqdeqmZ7QG2n6rTWQTZnSTbfy7D7wa0o5wSx+tw?=
 =?us-ascii?Q?r93OlNOErBPTt/kuUDU0dFzZEZGmuN4v5UlEHtRaTvSKB2B3jhCNY0OKrRhM?=
 =?us-ascii?Q?aB6QgFpFSkr0sHUDB5LkMnRuStiRo8XfhIQ1gwqLkEIcDTJnbvZxNwRD/7kU?=
 =?us-ascii?Q?PVLep3Blfv5xw86vYfaVFbzPHrnevXS7Gk0bWJ+uKLk6eJhuN8XwxxmOOi+T?=
 =?us-ascii?Q?YsENiNtaSKvQ7gn2NQPokJNM4nIPlYtNXRdQy9j40MVjA2zlYGgJlgefO6oC?=
 =?us-ascii?Q?U+3baUGFB6BxiVMY9M1ZlU8VHBumR+b5pDPxqMNNcjzyQNu8Bo93TjQsAjNp?=
 =?us-ascii?Q?lNABApP49ZZ+UPpYnuc/2iTbJ5Oc3vg5AOpf7T5CLiE0xPBld+kt4zi5EfoY?=
 =?us-ascii?Q?bD3dtYsGG1HLv5VKxj0O8fuB8cFn0U8Cyqz68d1eRzWZWSqiQ7MHZQyZ7wkR?=
 =?us-ascii?Q?nvHoiVA+/rdKTXTjnKGhFl/kSVin4bzmwk9XtAR0RWxhM7KSAgZxxAu3FJYn?=
 =?us-ascii?Q?UZtGXY/yVrnFM5qTpHrvcPm4he5TD9ZS6rKncau00LYp5wPA3KYYD4TI7ZsD?=
 =?us-ascii?Q?xe0RfcB4trJ9bZzyvGk3+2O69quxNL7t7BiP3V3y87uLlEz+FgNFa5RT24Ce?=
 =?us-ascii?Q?yHuKmvXNQM5YGAocVKBrBgP1P6Xsp23isyLlRmFTKlXOXtBeNO1Y6if4nnDQ?=
 =?us-ascii?Q?v6JkUHjK48q0181+x1AQ9huwrCONI4AaLN+e2iEsMOan/JC1xgyY1CnOwQeZ?=
 =?us-ascii?Q?ly57Vn7RGowZO/nM9g1qGCPxCASUIEx8oN3vJvN35h9b330Id52RYJ9IJ2ki?=
 =?us-ascii?Q?ImYqBl0LkaXtDkLhfEI0uoiZwWLaF/hm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 11:02:50.4506 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c19af5b6-82c2-48dd-5ecf-08dcc1d0cc5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6128
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

From: Trigger Huang <Trigger.Huang@amd.com>

When family_id is AMDGPU_FAMILY_RV, we further check if it is Renoir
by chip_external_rev.

When checking if a command ring is available on a specific AMD GPU in
is_rings_available(), delete the igt_assert_eq(). Because it is normal
that not all the rings are available on all ASIC families.
For example, there is no AMD_IP_VPE on Renior

Signed-off-by: Trigger Huang <Trigger.Huang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c  | 4 +---
 tests/amdgpu/amd_deadlock.c | 4 +++-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 3cd9ce7d2..c880a2926 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -902,10 +902,8 @@ is_rings_available(amdgpu_device_handle device_handle, uint32_t mask,
 		enum amd_ip_block_type type)
 {
 	struct drm_amdgpu_info_hw_ip hw_ip_info = {0};
-	int r;
 
-	r = amdgpu_query_hw_ip_info(device_handle, type, 0, &hw_ip_info);
-	igt_assert_eq(r, 0);
+	amdgpu_query_hw_ip_info(device_handle, type, 0, &hw_ip_info);
 
 	return  hw_ip_info.available_rings & mask;
 }
diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 52ba08494..96da49002 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -8,6 +8,7 @@
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_command_submission.h"
 #include "lib/amdgpu/amd_deadlock_helpers.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h"
 
 #define AMDGPU_FAMILY_SI                        110 /* Hainan, Oland, Verde, Pitcairn, Tahiti */
 #define AMDGPU_FAMILY_CI                        120 /* Bonaire, Hawaii */
@@ -24,7 +25,8 @@ is_deadlock_tests_enable(const struct amdgpu_gpu_info *gpu_info)
 	if (gpu_info->family_id == AMDGPU_FAMILY_SI ||
 	    gpu_info->family_id == AMDGPU_FAMILY_KV ||
 	    gpu_info->family_id == AMDGPU_FAMILY_CZ ||
-	    gpu_info->family_id == AMDGPU_FAMILY_RV) {
+	    ((gpu_info->family_id == AMDGPU_FAMILY_RV) &&
+	     (!ASICREV_IS_RENOIR(gpu_info->chip_external_rev)))) {
 		igt_info("\n\nGPU reset is not enabled for the ASIC, deadlock test skip\n");
 		enable = false;
 	}
-- 
2.34.1

