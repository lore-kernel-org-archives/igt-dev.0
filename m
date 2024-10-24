Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE7BD10380
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 21:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB3010E3B5;
	Thu, 24 Oct 2024 21:06:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gqg6gTtY";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2079.outbound.protection.outlook.com [40.107.236.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5CE910E3B5
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 21:06:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acyPFWN7ogDQN09smXl8dAsJnneK2ak9oZ2Gwob9Dw4rjOyhl/AykbFgFW9UADdwMsSGhIWxIPu2XgkEcAvERLun21WY401ZxpJNKAwUDfunRPZ1ZSprzdF2Xl3SB4XD29uqEWLGAbVVhwVDNsEMIoyDaJkJRDxhH5P7ZtL8KsdCc8o/DmUoZP06OQgqT+4jvPND/cIrih6lSGM4wftarPGNmutOizgEgfRykwr7Jr5g9lQiSGWK3mjpdXWg1LUHp9vV9j5LLX/Hi9mldbhkdkdRyjGJSgbm0+oyrY5rCpxKwkWs6KEbdokKbF52Elld4UriTW7AQ8w1Q/GLAXTqwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=quXYTi82E1Zn2K94BzARpNrjAnuSG8yLEVwTUmWtsgc=;
 b=lqZjWeXjCZX2ihTnh57dK14ahF+PYEuF9JTYG892JNut79I+s5uGepK1we46luqkVYc06cSJpa5AexuoY74RZh6lk/dzzUlhePxn+CvdkoucQAP0PZJ68l/IRD1xpMgQuNBMvxsJDVyM9N6EffSUbKUJIz6pqFNbyln5tV+YpyMuMjgOHEPbZxtXGBbUG+VxrzyOUQKBb1gUjUeF38egOz4/CJpY0OgdhOYj7TC7N19zWcIVEjCd2uQ/RZlQsRLX3wa0b78sHkhW5Xtn+fNf/IsA0gM8Hy8ru3xyTUa2Lh3HFPEF0x05Ko/83cS58mgQI6wRnGFNr80laJxFMG9Dkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=quXYTi82E1Zn2K94BzARpNrjAnuSG8yLEVwTUmWtsgc=;
 b=Gqg6gTtY+O1DLWcfntsRlI0rh4qVMUehf6FrRrJhsaJEgMXdcnu3dVer9ilhNUwaqtzNVN8c6W+uJ+Cz7IQ8XiY3IF1ouGpWzNZ4IFW5U/23O3u49XhbcsJWsToMiWWa8ALWfMJk0vGO5uJ0lwIyB7vlVE3hrOJu49cOJuyrlgI=
Received: from SJ0PR03CA0137.namprd03.prod.outlook.com (2603:10b6:a03:33c::22)
 by PH0PR12MB7012.namprd12.prod.outlook.com (2603:10b6:510:21c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.18; Thu, 24 Oct
 2024 21:06:47 +0000
Received: from SJ1PEPF00001CE9.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::26) by SJ0PR03CA0137.outlook.office365.com
 (2603:10b6:a03:33c::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Thu, 24 Oct 2024 21:06:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE9.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 21:06:46 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 16:06:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <mark.broadworth@amd.com>, <sunpeng.li@amd.com>
Subject: [PATCH 1/5] tools/amd_hdmi_compliance: Additional functionalities
Date: Thu, 24 Oct 2024 15:03:41 -0600
Message-ID: <20241024210345.511501-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE9:EE_|PH0PR12MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 320da3f4-eaf7-4aaf-6674-08dcf46fc55e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?B/sY4XW37MWDJWma4BCoeM7y9DmDOjZZD2cOXqH4kkoQwNQVk9Wyd7bGCY4n?=
 =?us-ascii?Q?rZl8AVtgSPoLk8tOr0PPuCGoNUZ5o9iklLXXZpTXxr/RoZ9oIAOuoc3z+sTG?=
 =?us-ascii?Q?T+CpinuhltYr8lksUpuJPIDGyRrx1/Cv/ZKGddC5wBwMbIQhwH8u3CdGsAY1?=
 =?us-ascii?Q?7DSETfBP7b+8eEs/nwj6V7Z+9QF9ARyMMj7Jd7j3hDLzzekt1U4eIArqgqiY?=
 =?us-ascii?Q?QFKUStqFl72PEBfrEiLwIZ4M4JYZwTpCzrzLnKzWiyXWRtdSvOGZWt84ZEs+?=
 =?us-ascii?Q?AbhasHfvZwPywCrt3nmE3+aR/hOtAOXZTXjmv+YEQRQO0yqauZar5jRfqAVd?=
 =?us-ascii?Q?KIdsO1kOi+0g+txh7TosQrTa0FyDCa6o3LsHC+UNAoRqLmAgAIbecxbPp8f3?=
 =?us-ascii?Q?w/LBwuBZSheliPcAYJPaM5LK7glxdP1Ho3ghGgiRE51e5/+0iSeD3vJodwCy?=
 =?us-ascii?Q?F6mzLbLW2/JNNFLhgFFduzkALEqr9McGZyAeAcyhete1kwkVjPc+e72MPVE5?=
 =?us-ascii?Q?5kho1jDtqQfes7sqH6AUP4VXgPwi9djxl8V54G4nSd+mLX1n5Tmd3wyvfcy5?=
 =?us-ascii?Q?Zf67ixps7N7Wawy0vjvXQHlCDK03owZk07x7Z6ntKmxr+TeForeVGAkKsVnk?=
 =?us-ascii?Q?gHSTeUs1qo5EgqmkUi7tHRw34VEVUrgPSFYnFf6rBtdRN3NMkYc8I/hdvVRk?=
 =?us-ascii?Q?WAXTr9gscNtUUpxpqoWEGeRgN8kI1OtWTA/ZoJ7vFOuPWkrVCR1heOxyqncD?=
 =?us-ascii?Q?AJO6KYoNeJgEKheZ43sgyLxnMyPaqc0/bps17FS/vciDyX3AYxH8ObQXabLi?=
 =?us-ascii?Q?izOwR3m8tw5LtUUkkojutH2QKhhEYTTWBFn8fvYUS+rM3U8v4U5UvaS8nAnw?=
 =?us-ascii?Q?4Z7GG3z6qyBV4GE7h0NSpwsKsOXWMJ/T27BKd41qbPN0r0WyvHIgaGKFigzt?=
 =?us-ascii?Q?5Nfhrvycoagup6qQ7BR3gCsNTdjUbCaNiSh739vO8NHSB9oHLdtlFn8TlUbI?=
 =?us-ascii?Q?Zg8URt07PADxccL1i2f0ng6bog7EKzz+U7qC2CPiNnIh9xeCEsNaearSupw+?=
 =?us-ascii?Q?GAnFrLJJz0ZnE9x6lNEpqSSCHvLIFN7beIkYfDfuzESgbfP2QzPDhFkzYADf?=
 =?us-ascii?Q?5L+MpHxlEBiXjAfDXCv9UsSZMdDKPpob3iu7nShKaI0Gn4ek7VbtG9nf7OX4?=
 =?us-ascii?Q?7PZVwh/1JgaWzPappHVPCx18yVGwyZp6PIODQtaBFQtf09ARydkS+6FppWhY?=
 =?us-ascii?Q?RFIU/ujUIl37vZ4KEu33ep8Z6G8EicnUbNvVS5GYjsDVwDCiyZ1B82BzH8Bg?=
 =?us-ascii?Q?2iGL8wu0Gr1CeohXkD988tYh+o2bC+1rf/2/fgCPZq54mtrzKxmEp3vYVWkm?=
 =?us-ascii?Q?HvflzPm7nkwRRW9GxtrZkx+mB14PMFgrTF3Z+wtv5bMjCJFgUw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:06:46.8050 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 320da3f4-eaf7-4aaf-6674-08dcf46fc55e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7012
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
 tools/amd_hdmi_compliance.c | 422 ++++++++++++++++++++++++++++++++----
 1 file changed, 380 insertions(+), 42 deletions(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 1a7592995..633d980bc 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -21,6 +21,8 @@
  */
 
 #include "igt.h"
+#include "igt_sysfs.h"
+#include <fcntl.h>
 
 /* Common test data */
 typedef struct data {
@@ -36,52 +38,328 @@ typedef struct data {
 
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
 
@@ -90,19 +368,22 @@ static void test_init(data_t *data)
 
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
@@ -123,22 +404,57 @@ static void wait_for_keypress(void)
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
@@ -147,20 +463,27 @@ static void test_vic_mode(data_t *data, int vic)
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
 
@@ -169,9 +492,18 @@ int main(int argc, char **argv)
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
@@ -179,13 +511,6 @@ int main(int argc, char **argv)
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
 
@@ -193,7 +518,20 @@ int main(int argc, char **argv)
 	igt_require(data.display.is_atomic);
 	igt_display_require_output(&data.display);
 
-	test_vic_mode(&data, vic);
+	if (force_yuv_420 >= 0)
+		set_force_yuv420(&data, force_yuv_420, conn_id);
+
+	if (max_bpc)
+		set_max_bpc(&data, max_bpc, conn_id);
+
+	if (vic) {
+		if (vic > ARRAY_SIZE(test_modes) ||
+		!test_modes[vic].name[0]) {
+			igt_warn("VIC %d is not supported\n", vic);
+		} else {
+			test_vic_mode(&data, vic, conn_id);
+		}
+	}
 
 	igt_display_fini(&data.display);
 }
-- 
2.43.0

