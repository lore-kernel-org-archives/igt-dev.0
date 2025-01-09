Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F09E77199
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jan 2025 03:32:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C359610ECCC;
	Thu,  9 Jan 2025 03:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="U1dzmBW7";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB8510ECCC
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jan 2025 03:32:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kyM5rKOY/39SPzH2oks7fnduXmHbgRDI52S0b0EL2IWtmw86kw+a+c5eYPL9H8v9vv/Gybcu4bUp9wOdhEOeu24U9vQIpWQiFlsXM91v5SMAnpuY1xKRWz2OH3cDi95KW/J9p6KCgFt67eqRT8Tsd8z3zGWBfkOWLKj7YPt39MNVFBErc0rc9bV8dXvKTVBZ+sodTYpi1u+7+DVu4KaLY5SWVqJMBJVL7FQMt7xq9HsyhVyJrJuX7rYOTgwyyfwl4q27SaXrMXPNgfy9NILc8vzK9DeINhqUVSIdCjRjUkiDA45pMk3xIRlEPcInS3fOQkHPEfDGAanxE1549nlpoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VS+JRiuNpSqf+NlzUAj0GokLOT+0/LSRArVNAxjCBk8=;
 b=wJUCLJeJE9dGntiZUodGZ6/fhZPLITje+iD60tlKvpqVWof28PaJ7qHm5x5AgwCjES11YD/4XSA64oHnph8UOzE/BZ8GPS1UHbAlNXs1hiB+RyknuGrQ7g8qr9UW5Ne/y4o0dOumyI0P9+oNbGSm2RB7AKg/hp7LfiawIVLSG75l3MXYPebX4Vewlwy3pjYHwgjLNtF5fKwiKtIzVcz/5naNwnEsuxdMrE4KMc59iDhN2aWOd4Mpoyaiqayy1H/uT295BrQY5bK/2KGDYUWyiEwkhEMnvSP7D3cCMN74Qzg4lqvfTUNEByjLCC+XTioDO+q75L66juPRAnJeqJH26g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VS+JRiuNpSqf+NlzUAj0GokLOT+0/LSRArVNAxjCBk8=;
 b=U1dzmBW7Jalsx6BpTUxdm6YM+hy0M7x1CssLInJS6urEL6vIDr0Gnj/mTW9eWGz9odBylnPDJigtT7SvjYmP/2rzDhmkg97MZbcky/FNg5PMeaN16NsenqifAQjbH8mgBQOYYfwkHKzNlTv0QnlAAJuX3ElVttaFbOK6EWP+ECo=
Received: from BL6PEPF00013E0A.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:12) by BL3PR12MB6642.namprd12.prod.outlook.com
 (2603:10b6:208:38e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.10; Thu, 9 Jan
 2025 03:32:54 +0000
Received: from BN2PEPF00004FBC.namprd04.prod.outlook.com
 (2a01:111:f403:c803::7) by BL6PEPF00013E0A.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.17 via Frontend Transport; Thu,
 9 Jan 2025 03:32:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBC.mail.protection.outlook.com (10.167.243.182) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8335.7 via Frontend Transport; Thu, 9 Jan 2025 03:32:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 8 Jan
 2025 21:32:51 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 8 Jan 2025 21:32:25 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Alexander Deucher" <alexander.deucher@amd.com>
Subject: [PATCH] lib/amdgpu: improve pci_unplug test
Date: Wed, 8 Jan 2025 22:32:22 -0500
Message-ID: <20250109033222.21861-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBC:EE_|BL3PR12MB6642:EE_
X-MS-Office365-Filtering-Correlation-Id: 413247ab-1e28-4c82-1b22-08dd305e4d5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XxmKLSiqmjENJjFwNFwVL1Ku8zLFqwLXaAogpO1rXH9nO4NLmTyyU7GecURx?=
 =?us-ascii?Q?ipc9xe/4RrYHRwIvYJM4jOEhJ228AaSX3EeSh9vYxJ5crnm66Wod1O1ZSnVs?=
 =?us-ascii?Q?regWPPa6laMG0LXMHZwMpUXPyg/QRwZI1oe06AZhMaWR14FILSXF9DRXZT5D?=
 =?us-ascii?Q?TUMcsfjl7KPdhYsHqeQ3eNUxl0kENmVY3SaMSgtAFIYq/PLwVsK0lvJo55OX?=
 =?us-ascii?Q?tJVdEoq90Ox2S2dYKrF+si1rcVYQXer2TB03NEfy/U8MiYEc/1gUTzEaF/1t?=
 =?us-ascii?Q?h4L1wUUqIz+zaLLzQTSHQhPu4zjyo8pvyNXHPmOLddqnacF3fvO8kclz0G/A?=
 =?us-ascii?Q?1X1hdOP0cMdrmY6Dma/yJePimcMQSsCpBTE/Z1RCa+9nXebJgK/+e5s7Kr3n?=
 =?us-ascii?Q?AmBhlmJNNKpvZKea9QLoET78Ov0I6PaHNjcXIBVdTCREhC/ljCtoFELQfipa?=
 =?us-ascii?Q?vpZ0ql5Pe++r0gw/yfuGV5Dxc8iPxxJ8vFx1HhgHNw3J3Q4m5PCDjONo9FZb?=
 =?us-ascii?Q?uwGEkCHmf9cbxpRmbA+D43g/GNc+1GmMDyTZSnnpHGIkizOqfEDnIx1cC3zZ?=
 =?us-ascii?Q?v1Ob1nP4Z4r14Br26cQ986wmQS7wFPy6hlYxTCMDIq9Xp82pMpbjttLISDqc?=
 =?us-ascii?Q?+Erx9z82ylQ7Hr0BguLUrka7HpQjUEEkIXaSRXoSYq9O4WLiBex/z18SB55y?=
 =?us-ascii?Q?hgvl9in8da1q5f3vkCm0oR0GVTU0qrDmjeqcWFJJB87pe7igG84vU54KcTjL?=
 =?us-ascii?Q?zHvx2SGEP7w/53r8AFkcUdRcz9eTWPqDaqzYr6Gv1H6f166v555QDr1t/Ndp?=
 =?us-ascii?Q?yFiKsrQJinO9H7Gt8j2mxeWun6Y5ETv4/+rs5WkpoMpp1qOXqPAFkFD4LmWa?=
 =?us-ascii?Q?G7TQzvNdMi8NzXtKmJ+KYD7MwoVdryzISDW+SYXLsa1Hot74QW8DPs8EIO48?=
 =?us-ascii?Q?G0yImcFuMR7YZUuWu9hhDGOft5QXRWt+MCI0iYHtRirLMoQorrzO4EsbWTPn?=
 =?us-ascii?Q?IcODcQQj+uWt9GGDn410YZi1Fdpr4Ba6WRtwi7e2wisILsJao3YB60Mr/vcj?=
 =?us-ascii?Q?sUIlyNADN+/YP79YlinCh0/8V2PG0ZAUiWH/h4wqANNqOC9EmX+24MjIEpqr?=
 =?us-ascii?Q?00cc5p4/il5Lwa9+WdisbIHwhp5jQgOcZfD8MeYqUf9vbY9cZFOejbcxe92K?=
 =?us-ascii?Q?v1ZG4QyBBhNXzO6cMNArIh4TxMUGy7TsvPpAXKLuWI+mS6zkqOezohY/9SFC?=
 =?us-ascii?Q?l2NaP3xjz1zO86UAjqJbKKTTjRGBrfm9oe0iXxNR+C4TRjvYL8jOIuFTIAKf?=
 =?us-ascii?Q?Ve9JZ6Nou8XZHj/BOIW+Azh/Vlf/7fQ+Z/G4pP0gAd6+8x4lweHHSqUgI6NN?=
 =?us-ascii?Q?R5MTcWf2Ct9wsmRwf1AZRgAVehsxWFHp4g4U5wWv0KL/YFXSnNK9B7pu9fx4?=
 =?us-ascii?Q?0nR5NMAe8jbPRoHAaFMyl7DA/lTbj7STJbc2/uWJn0wx3fRWgCR/Ow=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 03:32:53.8925 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 413247ab-1e28-4c82-1b22-08dd305e4d5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6642
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

Replace the 1-second sleep with a semaphore for synchronization, using wait
and post operations from the worker and main threads. This change results in
cleaner code and ensures precise timing, so PCI unplug event is triggered as
expected during job submissions.

Cc: Jesse Zhang  <jesse.zhang@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_pci_unplug.c | 10 +++++++---
 lib/amdgpu/amd_pci_unplug.h |  3 +++
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_pci_unplug.c b/lib/amdgpu/amd_pci_unplug.c
index 107e1cbbd..5155c9474 100644
--- a/lib/amdgpu/amd_pci_unplug.c
+++ b/lib/amdgpu/amd_pci_unplug.c
@@ -238,6 +238,8 @@ amdgpu_nop_cs(void *handle)
 	ibs_request.ibs = &ib_info;
 	ibs_request.resources = bo_list;
 
+	sem_post(&unplug->semaphore);
+
 	while (unplug->do_cs)
 		amdgpu_cs_submit(context, 0, &ibs_request, 1);
 
@@ -263,11 +265,12 @@ amdgpu_create_cs_thread(struct amd_pci_unplug *unplug)
 
 	unplug->do_cs = true;
 
-	r = pthread_create(thread, NULL, &amdgpu_nop_cs, unplug);
+	r = sem_init(&unplug->semaphore, 0, 0);
 	igt_assert_eq(r, 0);
 
-	/* Give thread enough time to start*/
-	usleep(1000000);
+	r = pthread_create(thread, NULL, &amdgpu_nop_cs, unplug);
+	igt_assert_eq(r, 0);
+	sem_wait(&unplug->semaphore);
 	return thread;
 }
 
@@ -277,6 +280,7 @@ amdgpu_wait_cs_thread(struct amd_pci_unplug *unplug, pthread_t *thread)
 	unplug->do_cs = false;
 
 	pthread_join(*thread, NULL);
+	sem_destroy(&unplug->semaphore);
 	free(thread);
 }
 
diff --git a/lib/amdgpu/amd_pci_unplug.h b/lib/amdgpu/amd_pci_unplug.h
index 35d4dce3a..3799a6ec9 100644
--- a/lib/amdgpu/amd_pci_unplug.h
+++ b/lib/amdgpu/amd_pci_unplug.h
@@ -24,6 +24,8 @@
 #ifndef AMD_PCI_UNPLUG_H
 #define AMD_PCI_UNPLUG_H
 
+#include <semaphore.h>
+
 #include <amdgpu.h>
 #include <amdgpu_drm.h>
 #include "amd_ip_blocks.h"
@@ -42,6 +44,7 @@ struct amd_pci_unplug {
 	amdgpu_device_handle device_handle;
 	amdgpu_device_handle device_handle2;
 	volatile bool do_cs;
+	sem_t		semaphore;
 };
 
 void
-- 
2.34.1

