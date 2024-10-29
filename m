Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1AC8D3A670
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 17:05:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44ED510E6B0;
	Tue, 29 Oct 2024 17:05:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iDx5jhYj";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF2E10E6AB
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 17:05:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FxnVvwZTL4Ott6k0DRJ+xbRYqPfEfqf2EZANxOZBfhFPADmQmSTOFb9d2l4ySsSEWqfYtiaQfTBf8BtCu85rIprznt289BHrRc39y3LRqs0Km3AcK++AgSXT3jwjOESLErvxgiUn4DaRkyUBaSOKlw+4yhCqxPj6jPggineG+I2uQ+uEMOw3MtwvKS8jtgpnaA1kApcSLfcB66lnUwC9Zla+CVFqzUlhu2mKDyjfPfd+DSHzQUzXgeil77MsO4U9Q4fQ90Go7kvtdHGvRBY5EYbGeAJmgAR1tNYkEVvW1cQzlWwGLuAibP7YiwufArxBgq6PhMuULtFnMpPKloISDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RiPFXIdsQ31YnrBllFOEC4+3nt0KGFRTK7I9/MtZOGE=;
 b=dsZTjaTHG/JA/lkPboQUGaW2klQ1QkB33N4TIXYp8oJ9b4a8/sSvxVu+UpXKuhE59MieVaozeCwHdF91b/f/PCY60gUAAPOPy+cBPjE0hw+I/+8OlwrDYQHs5fKOwN1iZ59P2GcMZ5W5F5yxzWMGO6BnUHh6R1qg3VKpjVQcBiV5rMHmC2SjjbVjti11XOpZbv3Yrt6tw9Mc2vx2Td+X642oicwf6jXmodrt3fyblERqzMmMEoqABHC5jC8hLgEV9WfZ9Q6tH2eAveXmr56PGeOCSbkVKbjnmllZTRftfB7hJoGP3/gv8J/728Zhep5w5thfGWc45ummaketK/Bxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RiPFXIdsQ31YnrBllFOEC4+3nt0KGFRTK7I9/MtZOGE=;
 b=iDx5jhYjcWdIfnqesSSSHuWyEapnE7Lu9lJvmOa/+JzApVM2wQdP5Cp7SfM3Gs0BvpF8onh4yuwdpFJon1ic65BPcf8HyUd3wSvLAjs4SRWOjMPQr1nAWWEELQ95CC7aDj2QBbbCHojG1fiYhEz9hQ2hmcqm18XUFRqOsalvdzw=
Received: from SJ0PR05CA0047.namprd05.prod.outlook.com (2603:10b6:a03:33f::22)
 by BY5PR12MB4084.namprd12.prod.outlook.com (2603:10b6:a03:205::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 17:04:52 +0000
Received: from SA2PEPF000015CA.namprd03.prod.outlook.com
 (2603:10b6:a03:33f:cafe::ba) by SJ0PR05CA0047.outlook.office365.com
 (2603:10b6:a03:33f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.14 via Frontend
 Transport; Tue, 29 Oct 2024 17:04:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015CA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 17:04:48 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 12:04:46 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <mark.broadworth@amd.com>, <sunpeng.li@amd.com>, <alex.hung@amd.com>
Subject: [PATCH 1/3][V2] tools/amd_hdmi_compliance: Additional functionalities
Date: Tue, 29 Oct 2024 11:03:47 -0600
Message-ID: <20241029170349.1388428-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CA:EE_|BY5PR12MB4084:EE_
X-MS-Office365-Filtering-Correlation-Id: dc7bab2f-9aee-40f9-3f84-08dcf83bcb8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0wcMl0nJDeHbsdJ+M2JEJ9gYPFi3JWpOSaPTuV0FjmdS1wmGwXPV+WEeHSMk?=
 =?us-ascii?Q?WbyujstLQcLWe0TPXuLOvCIH+DN1LTJdol8MVKfuip6SwuDtM/wJTA4qnIUl?=
 =?us-ascii?Q?GN/bPjAMtywDfJuMwZwQIW++4CoP2m9DcLAVNNGMxvhb2KxVkDz30RMeM8FA?=
 =?us-ascii?Q?2ma1r715twMY1zPUaQW3YH22Osdd6hAZlLmCh4jCr1alzjD8EodOcaeN0YL6?=
 =?us-ascii?Q?8RNDzqFFqHUnpwbUA0QMjDQcwWHuLMLnX6j6S7e9vFq/qwgVZuLu+etx0ExB?=
 =?us-ascii?Q?GPwJ699gh32Pun6dtVVizXKS7B5YKv48ujsc5P73kGI+D8DrunscRh1tObwa?=
 =?us-ascii?Q?85FW6tqWv4SlR+coJucjK/T8/kKo7xJSaUmFHgzHl2b3pDQk0h0jQa2iCl+s?=
 =?us-ascii?Q?8SZFFuPqzg/I7CkHZkfG8Ym3lXsnxv3kW3eZaZ4RsG4uL+Wd6LZFexKnYPJP?=
 =?us-ascii?Q?9KrOk0SKbHpu5ul5Zz4/rfGsLq8HgvBtCWVG2ZwczeL339Bm/HgtXLxf739B?=
 =?us-ascii?Q?Tt+rgR/3yzUniVnEHian1Rc5J9nZS1QDM9Sp8CTcpJCzYomRQFD3YvTSEboe?=
 =?us-ascii?Q?W6eYBKBbnn5lK0X0Ve8IIGZ2D2nIjcjXyL9OIzV2myldXFaWmiz4jXSBdeu5?=
 =?us-ascii?Q?ru/996Zx0v00pnvXcYnvRNkfMAdv1HgA9ZxBYcCbe6+HJGD7yPcOnw5jCLVY?=
 =?us-ascii?Q?YxigQsSIx2RYohF2yXVt5EPkzSk9UL9xsK5j5vIRm3GKn9vBLD+xJsrr3Hfm?=
 =?us-ascii?Q?WbGEV1yMo76vkX28v5BRl5+HeXfA9J3tRh6P4QMFbG3rupNtHMCSTNpJdV7U?=
 =?us-ascii?Q?nTKIGgS7ooADL5bGgoJNRdmaBwRZArCQOkoun2gQaXymcaOXBa8euBD75QFF?=
 =?us-ascii?Q?aBdl1tQXS8tIm9rh5mQnX/ZQnL6XcKRebBXPjGoECdMuTw8RrtPF4IwUcF0Y?=
 =?us-ascii?Q?FUuciHf/jDxbi2c0jprDcc7fQr96qJmrkI9wzuZ0222gaUMF2D/PsjADHwgu?=
 =?us-ascii?Q?uUNxuKwzXPv9S4oVGNqSwLFT4BDvmRJGPWniyn7KFV66HrrndUm6po7PqqLG?=
 =?us-ascii?Q?iIYOBw4jpuo76W6o/3ciWkANtlPoTIPo/tgH8tWQus+GgxfwKtOLwf3O3bu7?=
 =?us-ascii?Q?2BEX9GRcXI0Rx+FonPImaMIcg1qnwVI/m+TFkHBsn/c/L4gyec5OlFmqeCql?=
 =?us-ascii?Q?5K+9TPxB0dEZOnWJQ+8cdKpawVf50z+Vm2+w/JrmUEukrEK9/xgGJ6iD+pCJ?=
 =?us-ascii?Q?f9gu1/1sZcDtOJ+WmdTmeLXI+SMy44eJXaU6+m9QOSaQzGn8RCWefSo+Hwa6?=
 =?us-ascii?Q?WQJJCzSCSCphEz7AeWkKeyz3Mx9fEetB1SIplZXmfmw53A3zjfbwefpp2V8W?=
 =?us-ascii?Q?Tof3DJsDbSx27OnmTjd5wnMJSquWQaW3sdtim38NqJ8/lPVOwg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 17:04:48.0530 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc7bab2f-9aee-40f9-3f84-08dcf83bcb8e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4084
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

From: Wayne Lin <Wayne.Lin@amd.com>

It needs different timings, pixel format and color depth combination
to pass CTS under different HDMI versions. As the result, we extend
this to:

- Add additional timings and info. Especially aspect ratio which
  will impact the VIC code.
- Can specify the connector to display the test pattern.
- Set connector property "max bpc" to force bpc.
- Set connector debugfs entry "force_yuv420_output" to enable
  using yuv420 pixel format.

Signed-off-by: Wayne Lin <wayne.lin@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tools/amd_hdmi_compliance.c | 432 ++++++++++++++++++++++++++++++++----
 1 file changed, 390 insertions(+), 42 deletions(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 1a7592995..d80ebeba7 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -21,6 +21,8 @@
  */
 
 #include "igt.h"
+#include "igt_sysfs.h"
+#include <fcntl.h>
 
 /* Common test data */
 typedef struct data {
@@ -36,52 +38,340 @@ typedef struct data {
 
 /* Video modes indexed by VIC */
 static drmModeModeInfo test_modes[] = {
-	[1] = { 25175,
+	[0] = { 25175,
 		640, 656, 752, 800, 0,
 		480, 489, 492, 525, 0,
-		60, 0xa, 0x40,
-		"640x480",	/* VIC 1 */
+		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
+		0x40, "640x480",	/* VIC 0 */
+	},
+	[1] = { 25175,
+		640, 656, 752, 800, 0,
+		480, 490, 492, 525, 0,
+		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
+		0x40, "640x480",	/* VIC 1 */
+	},
+	[2] = { 27000,
+		720, 736, 798, 858, 0,
+		480, 489, 495, 525, 0,
+		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
+		0x40, "720x480",	/* VIC 2 */
+	},
+	[3] = { 27000,
+		720, 736, 798, 858, 0,
+		480, 489, 495, 525, 0,
+		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "720x480",	/* VIC 3 */
+	},
+	[4] = { 74250,
+		1280, 1390, 1430, 1650, 0,
+		720, 725, 730, 750, 0,
+		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1280x720",	/* VIC 4 */
+	},
+	[16] = { 148500,
+		1920, 2008, 2052, 2200, 0,
+		1080, 1084, 1089, 1125, 0,
+		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1920x1080",	/* VIC 16 */
+	},
+	[17] = { 27000,
+		720, 732, 796, 864, 0,
+		576, 581, 586, 625, 0,
+		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
+		0x40, "720x576",	/* VIC 17 */
+	},
+	[18] = { 27000,
+		720, 732, 796, 864, 0,
+		576, 581, 586, 625, 0,
+		60, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "720x576",	/* VIC 18 */
+	},
+	[19] = { 74250,
+		1280, 1720, 1760, 1980, 0,
+		720, 725, 730, 750, 0,
+		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1280x720",	/* VIC 19 */
+	},
+	[31] = { 148500,
+		1920, 2448, 2492, 2640, 0,
+		1080, 1084, 1089, 1125, 0,
+		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1920x1080",	/* VIC 31 */
+	},
+	[63] = { 297000,
+		1920, 2008, 2052, 2200, 0,
+		1080, 1084, 1089, 1125, 0,
+		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1920x1080",	/* VIC 63 */
+	},
+	[64] = { 297000,
+		1920, 2448, 2492, 2640, 0,
+		1080, 1084, 1089, 1125, 0,
+		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1920x1080",	/* VIC 64 */
+	},
+	[65] = { 59400,
+		1280, 3040, 3080, 3300, 0,
+		720, 725, 730, 750, 0,
+		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1280x720",	/* VIC 65 */
+	},
+	[66] = { 74250,
+		1280, 3700, 3740, 3960, 0,
+		720, 725, 730, 750, 0,
+		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1280x720",	/* VIC 66 */
+	},
+	[67] = { 74250,
+		1280, 3040, 3080, 3300, 0,
+		720, 725, 730, 750, 0,
+		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1280x720",	/* VIC 67 */
+	},
+	[68] = { 74250,
+		1280, 1720, 1760, 1980, 0,
+		720, 725, 730, 750, 0,
+		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1280x720",	/* VIC 68 */
+	},
+	[69] = { 74250,
+		1280, 1390, 1430, 1650, 0,
+		720, 725, 730, 750, 0,
+		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1280x720",	/* VIC 69 */
+	},
+	[70] = { 148500,
+		1280, 1720, 1760, 1980, 0,
+		720, 725, 730, 750, 0,
+		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1280x720",	/* VIC 70 */
+	},
+	[71] = { 148500,
+		1280, 1390, 1430, 1650, 0,
+		720, 725, 730, 750, 0,
+		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1280x720",	/* VIC 71 */
+	},
+	[72] = { 74250,
+		1920, 2558, 2602, 2750, 0,
+		1080, 1084, 1089, 1125, 0,
+		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1920x1080",	/* VIC 72 */
+	},
+	[73] = { 74250,
+		1920, 2448, 2492, 2640, 0,
+		1080, 1084, 1089, 1125, 0,
+		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1920x1080",	/* VIC 74 */
+	},
+	[74] = { 74250,
+		1920, 2008, 2052, 2200, 0,
+		1080, 1084, 1089, 1125, 0,
+		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1920x1080",	/* VIC 74 */
+	},
+	[75] = { 148500,
+		1920, 2448, 2492, 2640, 0,
+		1080, 1084, 1089, 1125, 0,
+		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1920x1080",	/* VIC 75 */
+	},
+	[76] = { 148500,
+		1920, 2008, 2052, 2200, 0,
+		1080, 1084, 1089, 1125, 0,
+		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1920x1080",	/* VIC 76 */
+	},
+	[77] = { 297000,
+		1920, 2448, 2492, 2640, 0,
+		1080, 1084, 1089, 1125, 0,
+		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1920x1080",	/* VIC 77 */
+	},
+	[78] = { 297000,
+		1920, 2008, 2052, 2200, 0,
+		1080, 1084, 1089, 1125, 0,
+		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1920x1080",	/* VIC 78 */
+	},
+	[79] = { 59400,
+		1680, 3040, 3080, 3300, 0,
+		720, 725, 730, 750, 0,
+		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1680x720",	/* VIC 79 */
+	},
+	[80] = { 59400,
+		1680, 2908, 2948, 3168, 0,
+		720, 725, 730, 750, 0,
+		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1680x720",	/* VIC 80 */
+	},
+	[81] = { 59400,
+		1680, 2380, 2420, 2640, 0,
+		720, 725, 730, 750, 0,
+		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1680x720",	/* VIC 81 */
+	},
+	[82] = { 82500,
+		1680, 1940, 1980, 2200, 0,
+		720, 725, 730, 750, 0,
+		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1680x720",	/* VIC 82 */
+	},
+	[83] = { 99000,
+		1680, 1940, 1980, 2200, 0,
+		720, 725, 730, 750, 0,
+		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1680x720",	/* VIC 83 */
+	},
+	[84] = { 165000,
+		1680, 1740, 1780, 2000, 0,
+		720, 725, 730, 825, 0,
+		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1680x720",	/* VIC 84 */
+	},
+	[85] = { 198000,
+		1680, 1740, 1780, 2000, 0,
+		720, 725, 730, 825, 0,
+		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "1680x720",	/* VIC 85 */
+	},
+	[86] = { 99000,
+		2560, 3558, 3602, 3750, 0,
+		1080, 1084, 1089, 1100, 0,
+		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "2560x1080",	/* VIC 86 */
+	},
+	[87] = { 90000,
+		2560, 3008, 3052, 3200, 0,
+		1080, 1084, 1089, 1125, 0,
+		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "2560x1080",	/* VIC 87 */
+	},
+	[88] = { 118800,
+		2560, 3328, 3372, 3520, 0,
+		1080, 1084, 1089, 1125, 0,
+		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "2560x1080",	/* VIC 88 */
+	},
+	[89] = { 185625,
+		2560, 3108, 3152, 3300, 0,
+		1080, 1084, 1089, 1125, 0,
+		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "2560x1080",	/* VIC 89 */
+	},
+	[90] = { 198000,
+		2560, 2808, 2852, 3000, 0,
+		1080, 1084, 1089, 1100, 0,
+		60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "2560x1080",	/* VIC 90 */
+	},
+	[91] = { 371250,
+		2560, 2778, 2822, 2970, 0,
+		1080, 1084, 1089, 1250, 0,
+		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "2560x1080",	/* VIC 91 */
+	},
+	[92] = { 495000,
+		2560, 3108, 3152, 3300, 0,
+		1080, 1084, 1089, 1250, 0,
+		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		0x40, "2560x1080",	/* VIC 92 */
+	},
+	[93] = { 297000,
+		3840, 5116, 5204, 5500, 0,
+		2160, 2168, 2178, 2250, 0,
+		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "4096x2160",	/* VIC 93 */
+	},
+	[94] = { 297000,
+		3840, 4896, 4984, 5280, 0,
+		2160, 2168, 2178, 2250, 0,
+		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "3840x2160",	/* VIC 94 */
+	},
+	[95] = { 297000,
+		3840, 4016, 4104, 4400, 0,
+		2160, 2168, 2178, 2250, 0,
+		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "3840x2160",	/* VIC 95 */
 	},
 	[96] = { 594000,
 		 3840, 4896, 4984, 5280, 0,
 		 2160, 2168, 2178, 2250, 0,
-		 50, 0x5|DRM_MODE_FLAG_PIC_AR_16_9, 0x40,
-		 "3840x2160",	/* VIC 96 */
+		 50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		 0x40, "3840x2160",	/* VIC 96 */
 	},
 	[97] = { 594000,
 		 3840, 4016, 4104, 4400, 0,
 		 2160, 2168, 2178, 2250, 0,
-		 60, 0x5|DRM_MODE_FLAG_PIC_AR_16_9, 0x40,
-		 "3840x2160",	/* VIC 97 */
+		 60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		 0x40, "3840x2160",	/* VIC 97 */
+	},
+	[98] = { 297000,
+		 4096, 5116, 5204, 5500, 0,
+		 2160, 2168, 2178, 2250, 0,
+		 24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
+		 0x40, "4096x2160",	/* VIC 98 */
+	},
+	[99] = { 297000,
+		 4096, 5064, 5152, 5280, 0,
+		 2160, 2168, 2178, 2250, 0,
+		 25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
+		 0x40, "4096x2160",	/* VIC 99 */
+	},
+	[100] = { 297000,
+		 4096, 4184, 4272, 4400, 0,
+		 2160, 2168, 2178, 2250, 0,
+		 30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
+		 0x40, "4096x2160",	/* VIC 100 */
 	},
 	[101] = { 594000,
 		  4096, 5064, 5152, 5280, 0,
 		  2160, 2168, 2178, 2250, 0,
-		  50, 0x5|DRM_MODE_FLAG_PIC_AR_256_135, 0x40,
-		  "4096x2160",	/* VIC 101 */
+		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
+		  0x40, "4096x2160",	/* VIC 101 */
 	},
 	[102] = { 594000,
 		  4096, 4184, 4272, 4400, 0,
 		  2160, 2168, 2178, 2250, 0,
-		  60, 0x5|DRM_MODE_FLAG_PIC_AR_256_135, 0x40,
-		  "4096x2160",	/* VIC 102 */
+		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
+		  0x40, "4096x2160",	/* VIC 102 */
+	},
+	[103] = { 297000,
+		  3840, 5116, 5204, 5500, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "4096x2160",	/* VIC 103 */
+	},
+	[104] = { 297000,
+		  3840, 4896, 4984, 5280, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "3840x2160",	/* VIC 104 */
+	},
+	[105] = { 297000,
+		  3840, 4016, 4104, 4400, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "3840x2160",	/* VIC 105 */
 	},
 	[106] = { 594000,
 		  3840, 4896, 4984, 5280, 0,
 		  2160, 2168, 2178, 2250, 0,
-		  50, 0x5|DRM_MODE_FLAG_PIC_AR_64_27, 0x40,
-		  "3840x2160",	/* VIC 106 */
+		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "3840x2160",	/* VIC 106 */
 	},
 	[107] = { 594000,
 		  3840, 4016, 4104, 4400, 0,
 		  2160, 2168, 2178, 2250, 0,
-		  60, 0x5|DRM_MODE_FLAG_PIC_AR_64_27, 0x40,
-		  "3840x2160",	/* VIC 107 */
+		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "3840x2160",	/* VIC 107 */
 	},
 };
 
 /* Common test setup. */
-static void test_init(data_t *data)
+static void test_init(data_t *data, int conn_id)
 {
 	igt_display_t *display = &data->display;
 
@@ -90,19 +380,22 @@ static void test_init(data_t *data)
 
 	igt_display_reset(display);
 
-	/* find a connected HDMI output */
+	/* find a connected output */
 	data->output = NULL;
 	for (int i=0; i < data->display.n_outputs; ++i) {
-		drmModeConnector *connector = data->display.outputs[i].config.connector;
-		if (connector->connection == DRM_MODE_CONNECTED &&
-				(connector->connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-				 (data->use_virtual_connector &&
-				  connector->connector_type == DRM_MODE_CONNECTOR_VIRTUAL))) {
+		drmModeConnector *conn = data->display.outputs[i].config.connector;
+
+		if ((data->use_virtual_connector &&
+		     conn->connector_type == DRM_MODE_CONNECTOR_VIRTUAL) ||
+		    (conn->connector_type == DRM_MODE_CONNECTOR_HDMIA &&
+		     conn->connection == DRM_MODE_CONNECTED &&
+		     (conn_id == 0 || conn->connector_id == conn_id))) {
 			data->output = &data->display.outputs[i];
+			break;
 		}
 	}
 
-	igt_require(data->output);
+	igt_require_f(data->output, "No valid connectors found\n");
 
 	data->primary =
 		igt_pipe_get_plane_type(data->pipe, DRM_PLANE_TYPE_PRIMARY);
@@ -123,22 +416,57 @@ static void wait_for_keypress(void)
 		;
 }
 
-static void test_vic_mode(data_t *data, int vic)
+/* Write 0 or 1 to debugfs entry "force_yuv420_output" of connector */
+static void set_force_yuv420(data_t *data, int force, int conn_id)
+{
+	int fd, res;
+
+	test_init(data, conn_id);
+
+	igt_info("Setting force_yuv420_output to %d on connector id %d\n",
+		 force ? 1 : 0, data->output->config.connector->connector_id);
+
+	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
+	igt_assert(fd >= 0);
+
+	res = igt_sysfs_write(fd, "force_yuv420_output", force ? "1" : "0", 2);
+	igt_require(res > 0);
+
+	close(fd);
+	test_fini(data);
+}
+
+/* Set "max bpc" property of connector */
+static void set_max_bpc(data_t *data, int max_bpc, int conn_id)
+{
+	igt_display_t *display = &data->display;
+
+	test_init(data, conn_id);
+
+	igt_info("Setting max bpc to %d on connector id %d\n",
+		 max_bpc, data->output->config.connector->connector_id);
+	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, max_bpc);
+	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
+
+	test_fini(data);
+}
+
+/* Override video mode with specified VIC. */
+static void test_vic_mode(data_t *data, int vic, int conn_id)
 {
 	igt_display_t *display = &data->display;
 	drmModeModeInfo *mode;
 	igt_fb_t afb;
 
-	test_init(data);
+	test_init(data, conn_id);
 
 	mode = &test_modes[vic];
 
+	igt_info("Setting mode %s on connector id %d\n",
+		 mode->name, data->output->config.connector->connector_id);
 	igt_output_override_mode(data->output, mode);
-
 	igt_create_pattern_fb(data->fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888, 0, &afb);
-
 	igt_plane_set_fb(data->primary, &afb);
-
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
 	igt_info("Press [Enter] to finish\n");
@@ -147,20 +475,27 @@ static void test_vic_mode(data_t *data, int vic)
 	test_fini(data);
 }
 
-const char *optstr = "hvt:";
+const char *optstr = "hvt:i:b:y:";
 static void usage(const char *name)
 {
-	igt_info("Usage: %s [options]\n", name);
-	igt_info("-h      Show help\n");
-	igt_info("-t vic  Select video mode based on VIC\n");
-	igt_info("-v      Test on 'Virtual' connector as well, for debugging.\n");
+	igt_info("Usage: %s options\n", name);
+	igt_info("-h		Show help\n");
+	igt_info("-t vic	Select video mode based on VIC\n");
+	igt_info("-v		Test on 'Virtual' connector as well, for debugging.\n");
+	igt_info("-i conn_id	Use connector by ID\n");
+	igt_info("-b max_bpc	Set \"max bpc\" connector property\n");
+	igt_info("-y 0|1	Write 0 or 1 to connector's debugfs force_yuv420_output\n");
+	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
 }
 
 int main(int argc, char **argv)
 {
 	data_t data;
 	int c;
-	int vic = 1; /* default to VIC 1 (640x480) */
+	int vic = 0;
+	int conn_id = 0;
+	int max_bpc = 0;
+	int force_yuv_420 = -1;
 
 	memset(&data, 0, sizeof(data));
 
@@ -169,9 +504,18 @@ int main(int argc, char **argv)
 		case 't':
 			vic = atoi(optarg);
 			break;
+		case 'i':
+			conn_id = atoi(optarg);
+			break;
 		case 'v':
 			data.use_virtual_connector = true;
 			break;
+		case 'b':
+			max_bpc = atoi(optarg);
+			break;
+		case 'y':
+			force_yuv_420 = atoi(optarg);
+			break;
 		default:
 		case 'h':
 			usage(argv[0]);
@@ -179,13 +523,6 @@ int main(int argc, char **argv)
 		}
 	}
 
-	if (vic < 1 ||
-		vic > ARRAY_SIZE(test_modes) ||
-		!test_modes[vic].name[0]) {
-		igt_warn("VIC %d is not supported\n", vic);
-		exit(EXIT_FAILURE);
-	}
-
 	data.fd = drm_open_driver_master(DRIVER_ANY);
 	kmstest_set_vt_graphics_mode();
 
@@ -193,7 +530,18 @@ int main(int argc, char **argv)
 	igt_require(data.display.is_atomic);
 	igt_display_require_output(&data.display);
 
-	test_vic_mode(&data, vic);
+	if (force_yuv_420 >= 0)
+		set_force_yuv420(&data, force_yuv_420, conn_id);
+
+	if (max_bpc)
+		set_max_bpc(&data, max_bpc, conn_id);
+
+	if (vic >= 0) {
+		if (vic > ARRAY_SIZE(test_modes) || !test_modes[vic].name[0])
+			igt_warn("VIC %d is not supported\n", vic);
+		else
+			test_vic_mode(&data, vic, conn_id);
+	}
 
 	igt_display_fini(&data.display);
 }
-- 
2.43.0

