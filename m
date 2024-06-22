Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403A4C27C53
	for <igt-dev@archiver.kernel.org>; Sat, 22 Jun 2024 22:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D38E10E508;
	Sat, 22 Jun 2024 22:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oJ6cZrVY";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2064.outbound.protection.outlook.com [40.107.95.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C33110E508
 for <igt-dev@lists.freedesktop.org>; Sat, 22 Jun 2024 22:52:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EApwCUHaGew7dpBJclMnQ8D+s0ue4qehamRja1JDKAV90r469VTC2Hf0EO8TauxbQfKbiiYPncCO+nOFcR7XmPweD4Mx+dHye/7nQdxCeogODWjDR4kJqS7iGcdPnqYc+kgLkOEGFv+zxFnLaZwqlfc6BgArxLCjP9ZgmWcZx50evZaRYcmwezsNtwBLjLQQoIykD9XkcWnZg4sLlUMTgr3kHWsNS01FPIM3sdZM6DdztMqSBtOZUwRqHhNOg3vEZ5sKJtZy+Me1cd/BORNu7CrHCSlxVnq6VGsuMr91LAoICtqPNPCh9B70JWBXz6NIy4IJDQwiTnoPpihcUdgCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZxtEvO73R5OQW1/z2qAy5Tynj4YxJYJ8kwvxxeiFQo=;
 b=gh9u+M0HHJZZQJUML8DTp9E5egqT+SYMUQlm7iKEypE4wWNDJgyrZ4GbAEOIfOUu+JG/xdO+4ds9f8+TFGFV+FmCS5cAmvD8Y1BvHNzXedwAYkDCS4zN5sY6m8qDrYucnYa3e8pB8ut/SXrEks1JuLmQPxxGOH4tZLfkda4G3lv+wN/dS0xKejlvGlJBAEo6ld//0amjBHuOcNGT4tLZ57T7l1C4YgL/c3b8Ol0Jfj/oYbT+CuPP34WEoNXFTePtrYOUQFBq8Y0I75SJtKgmoIA9Cl6z+EEte7PbN11gf0xwjFMxhnq+Uwwm74uOfrkyQvLkHGJztHLUrGkUMORofQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZxtEvO73R5OQW1/z2qAy5Tynj4YxJYJ8kwvxxeiFQo=;
 b=oJ6cZrVY5Lheszg4qopRsZ13CnYhP0DbGOEDm7v0hGBgpThGFPdr/x8xsZ5lAwTU+PSnvnBShCIGUt2X0WkZzmHR46ZxrUPWxmMh3kEkr/UCSZqYUJNMjupu/p5bQ9u/yZnceIV1pQI0y7DGTmcC4kNbWxVasH63v3DQh9PREnY=
Received: from BY3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:254::12)
 by SA3PR12MB7860.namprd12.prod.outlook.com (2603:10b6:806:307::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.23; Sat, 22 Jun
 2024 22:52:22 +0000
Received: from SJ1PEPF00002319.namprd03.prod.outlook.com
 (2603:10b6:a03:254:cafe::8d) by BY3PR05CA0007.outlook.office365.com
 (2603:10b6:a03:254::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Sat, 22 Jun 2024 22:52:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002319.mail.protection.outlook.com (10.167.242.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Sat, 22 Jun 2024 22:52:22 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 22 Jun
 2024 17:52:20 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Sat, 22 Jun 2024 17:52:20 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH 2/2] tests/amdgpu/gang_cs: skip test for some chips
Date: Sat, 22 Jun 2024 18:52:16 -0400
Message-ID: <20240622225216.108985-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240622225216.108985-1-vitaly.prosyak@amd.com>
References: <20240622225216.108985-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002319:EE_|SA3PR12MB7860:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc4147d-78a6-4597-14ea-08dc930dfa65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|82310400023|1800799021|36860700010|376011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JxWuJ9T9C4hjCFmRuvXJPTyegxR7+tvmjn6hTf4b2zwBnzxqgoR4JfeJc9yU?=
 =?us-ascii?Q?kk/sJstSQQmF85VsORiKDcJ6wAmJRrR9RU6sNsRIqFvTMBN2bxvZboZJ9eCY?=
 =?us-ascii?Q?ib8AEImxxY/Nd6tWQbG+1O96OyOMUAxDsGUBiDQXRQTbDK1YzlJRICBd+jMJ?=
 =?us-ascii?Q?5gwjhx5r14jyyC+SCEK4oDOC/qFBWazuJ6U/t96aI/INskYEYg1kNSbL+wz0?=
 =?us-ascii?Q?xeZT5Ww8ndpYPfs5bKrO1m+1GDUTEbuJtHCFFWYVLYLMNm3dg/AtUh/O+IAK?=
 =?us-ascii?Q?wbdkzJ8fvc72v5pHgMlDFDKAZzMlsZeBqEV5KzJhM3qlIxmjCsDYhVZB70FS?=
 =?us-ascii?Q?3U0XuT7uw6ngG7piUL8ZF6g053LltJXgEARCod7cbAshqDadmROMGLBX1VdV?=
 =?us-ascii?Q?LAwn+HOU134Bp8yHowkWDmOZ8d/8H6S+FbNpvqLp9Sx0NikejLnrSIULMQu3?=
 =?us-ascii?Q?ObODe14ax3HhijwOZ4sa9sRDZR9tVxYUGHyAD6GH7TZqJt6VJQRYYQln/Btn?=
 =?us-ascii?Q?yqk0cZXsCr3lPM87IW6BXktAPa6cWrWzP+3CperH/6WHiF53o2qRoI8iTE84?=
 =?us-ascii?Q?O2+DWZGdqEs/pGsgAqzTF7aaSoABEjXsEIvnyiGaxysp0fapoSEojKW9ZOKo?=
 =?us-ascii?Q?U6+VfTD06qyEkge0DbrExBtFzclY3ZBSaDXmuLvJV6jyiy0vIYSEtWY3KHGu?=
 =?us-ascii?Q?lMgnBkOH7advhF7gisP+96v9GNNybH80lUnaqlwfSgVFMozu5WcW1tnytnzY?=
 =?us-ascii?Q?+8yn7ugbuXzUEKenArqnSpw0IrPMnIlJxr8ZLAcdk9tJFdPz67xGC8FB9slP?=
 =?us-ascii?Q?OgwLcufqUv/bS+qvLF5GNyYYNieD2j9E70F7cASYTDFnL+DcJRmc0pNN9Dm8?=
 =?us-ascii?Q?fOKkyU7yUHxTFm3CZH/5vT7jsZ2H2DXU2V0E2I0hqmOlPxK1TV9jgifbtXTK?=
 =?us-ascii?Q?gbbJWFTXSzohpIIxeobw1s9HGEe1Oj4x82s/HHV7xxwZS7bGDEJUMDDwi3J+?=
 =?us-ascii?Q?SJaClHf6+oyG3/KI6C9T3hpLaufrbFyoQPBEj4FSJb49Afwi2yR0s20ZjNxC?=
 =?us-ascii?Q?IeZzNTfiFuVvCUWA7B76vQ7haRlM+j0q5ATOcbBo7LUE44OzJ4Qy4Hn/Tl6D?=
 =?us-ascii?Q?lekAny4MXFefWBKkFTE8pyMrUWeC3QTQQ3tT81R6KK8qOImRl/4Fcie/tVET?=
 =?us-ascii?Q?6nmGIdZ/OVtlrPeheVsAOqgl3meC4Db2KFc35PVAxKvacNmMVAS1WlEBO7Ln?=
 =?us-ascii?Q?hm30Ua6wJO9UwrTxKQbwW8f5jp+90+M0CEMlU1m18vMYkzu/6IZ4vVaNn3vx?=
 =?us-ascii?Q?Zt9RFtwn3dtCSjuJlfekUFR5gEC1N4FZsRfT/VDVM06moh4VjBoB7Nz/MDBV?=
 =?us-ascii?Q?QAzRdOKvnvu9mLUjpajBEDFdv5fpka5E63joQXGmqUt8LiLjwg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230037)(82310400023)(1800799021)(36860700010)(376011); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2024 22:52:22.3147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc4147d-78a6-4597-14ea-08dc930dfa65
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002319.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7860
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

Check if gang tests are enabled based on GPU information.
Gang tests are supported starting with Vega10, but are broken
on Navi10 and Navi14. This function mirrors the logic in amdgpu.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Suggested-by: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_gang_cs.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/amdgpu/amd_gang_cs.c b/tests/amdgpu/amd_gang_cs.c
index 722c376ee..699862670 100644
--- a/tests/amdgpu/amd_gang_cs.c
+++ b/tests/amdgpu/amd_gang_cs.c
@@ -9,10 +9,38 @@
 #include "lib/amdgpu/amd_ip_blocks.h"
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_cs_radv.h"
+#include "lib/amdgpu/amd_family.h"
 
 #define IB_SIZE	4096
 
+/**
+ * Check if gang tests are enabled based on GPU information.
+ *
+ * Gang tests are supported starting with Vega10 but are broken on Navi10 and Navi14.
+ * This function mirrors the logic in the following amdgpu code:
+ *
+ * void amdgpu_vm_manager_init(struct amdgpu_device *adev) {
+ *     adev->vm_manager.concurrent_flush = !(adev->asic_type < CHIP_VEGA10 ||
+ *                                           adev->asic_type == CHIP_NAVI10 ||
+ *                                           adev->asic_type == CHIP_NAVI14);
+ * }
+ *
+ * @param gpu_info: Pointer to the structure containing GPU information.
+ * @return: True if gang tests are enabled, false otherwise.
+ */
+static bool is_gang_tests_enable(const struct chip_info *pChip)
+{
+	/* Concurrent flushes are supported only on Vega10 and newer,
+	 * excluding Navi10 and Navi14 due to known issues.
+	 */
+	if (pChip->family < CHIP_VEGA10 ||
+		pChip->family == CHIP_NAVI10 ||
+		pChip->family == CHIP_NAVI14) {
+		return false;
+	}
 
+	return true;
+}
 
 static void
 prepare_compute_cp_packet(amdgpu_device_handle device,
@@ -233,6 +261,7 @@ igt_main
 		igt_assert_eq(r, 0);
 		r = setup_amdgpu_ip_blocks(major, minor, &gpu_info, device);
 		igt_assert_eq(r, 0);
+		igt_skip_on(!is_gang_tests_enable(g_pChip));
 		asic_rings_readness(device, 1, arr_cap);
 
 	}
-- 
2.25.1

