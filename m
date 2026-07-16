Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26618C4450A
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 21:34:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB0410F3E6;
	Thu, 16 Jul 2026 21:34:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KypEDUc2";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010028.outbound.protection.outlook.com [52.101.201.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF53210F3E6
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 21:33:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DA9O3KM+GEm8BOBL8u1fgpMnydfqTAFmjAjjlu2p0CXcOQXG1v8EIKgC564v5pJFBrDAT1EchTqNm50YpDAXGcDBgYXGGLXzRcbd1GvlSaq+zSiDSTF0bat2A6CruMOD+MjZQDuTFqryPeBPIByLACsBgWMSbUHVm0SjX5CgzPF7TV+9YNTDJ4i6JSvo5WhBo6yTWNdhTz8F3jqRUD3AG5/IvzrDnyK87+PjYHcKtPffLTlLVy01te6h53rqQjZoSPZaVoo0nzJdcWoblhy/aEJl1RKqMZFGeWOrAaBKQu3oDbEQVVpm/oB0csE1F2BjPqrOymxfGmLxIPSsWQ3C5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fujgBxnesVAK2Ib5rYQFXE9yNGfVNMSR+93vlu0Un30=;
 b=Vt328KZspIgafSbGp8267smjA3fOm1hcp3P2hL6Zvh/ALmV+XFWvyzA6909sEk4i2f09wlezUFphdqnzz2KNQ02ooEnzkdP2ZUkFJ8cYV5AebpnX49MwJfa0QLztlZkWrskPu340uZKvs/u4WeEwR5sk19PiJjzUcNsUlXdBbNKk98cRTfdj0LrNj4en2vStfpRJL6gJttJRg4d1tuRtAWFGXPZQTXRus80GeX5/gwPHbtjtQelFNf65V8OiPWUD7R04egL8ImaRAx7UZ75QoXUk16ZxoBaH+dVCXbB46BWTG0gPy9KvLz85u+fzqrovwcpf9sX/O8RA4GcyQYYBSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fujgBxnesVAK2Ib5rYQFXE9yNGfVNMSR+93vlu0Un30=;
 b=KypEDUc2aJLXid7p2Z6yuBvm0iLsfOvDpoIN6GZtcxtKNbAwZTSp0hwSPS6uIgs4XeIQnHSkhar8id1vHaBGoi/YHb6q0m41nQfrCHbZ+/wlRus/KKI1RwciWYjP0V6qJp3vtWxMLRmZO/CBGI+KdieJR5vI6uBRvVdLDEaa6PM=
Received: from CY5PR15CA0095.namprd15.prod.outlook.com (2603:10b6:930:7::17)
 by EAYPR12MB999131.namprd12.prod.outlook.com (2603:10b6:303:2be::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 21:33:24 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:930:7:cafe::6c) by CY5PR15CA0095.outlook.office365.com
 (2603:10b6:930:7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend Transport; Thu,
 16 Jul 2026 21:33:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Thu, 16 Jul 2026 21:33:24 +0000
Received: from jzuo.laptop (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 16 Jul
 2026 16:32:07 -0500
From: Fangzhi <jerry.zuo@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>,
 <aurabindo.pillai@amd.com>
CC: Fangzhi Zuo <jzuo@amd.com>, Mark Broadworth <Mark.Broadworth@amd.com>
Subject: [PATCH 1/3] tests/amdgpu: Add FRL Test Support
Date: Thu, 16 Jul 2026 17:31:53 -0400
Message-ID: <20260716213154.2565087-1-jerry.zuo@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|EAYPR12MB999131:EE_
X-MS-Office365-Filtering-Correlation-Id: bc18ac32-57ce-48be-31d5-08dee381dd93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|11063799006|56012099006|6133799003|3023799007|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 67s/iiO/CstljcgUFoQnhLyzI6fiWU1ajGmsqCSs8Tf8zdW+rDjQ7zrGxVreNsS/iepu0iykWRy/YXxwOo/5Nz3gxaD5Z7hxu3OIE0RCzqcJK32uk7Q63wIAarFQQQL+Preth1DfA5l034r6T8vM8Mpslv6hPs3NtEGkal5lp+aF7VJD45Pu9KfOJ/QCPYRxHadKLIiCN2q92AokvY1ImpQ4fHgvSg/Qv1UEbebrXuddtWNJbS0zqWQHBV0WS3xD/cdUUjBE+pC9a7XmUT9NHmr94FoBEY1cRX65CbpVYcD+IhtOO//G5GM+WJTdV8TUBVjQ8btjnitwDwlq0xttv+KMU+L7eJ6qwgs5bQLF2GoQa8o3VTyyb9roKuH/qEGCYHNc4kBTswHex1LWHPecRA8UA2jI81HfjYyEfJTYl05XFpxUZdB5taGQQ2RA9tO7qxBkWj8+GoovFpCmijN99cqPM7ZGeNKIzvRzgh0QWPU8AjYaKRDbugxZS5K4+siqtRZtNnIzNBVwmXeQeyovIIOyE96uFMXP7GQsNYoA8Cf48nhBNj/QInw9Eq49WrlBhioCR+7jNeGbl5+50d/nDZpdMyhTQid4GSxMV/Pfxeq7LNRc3vKqawjORhHzlZic0DaNt0AGfmHXbQ22YGdUW1/2JboYaParBEDN+p74qz5xNvC27R+gZhBBIfIo9OKtqFFVBQEnOHhTnE/KD2MSvA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(11063799006)(56012099006)(6133799003)(3023799007)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 7OTC3SpjpYrrZe/Bn2AVtA6nFVH/z42K2+CoJDcHdiF0/yWjNRya/5xexFMrK28aTCXC+EWD0+3UkfUFRVSRc6MXwHGCK3F2m597Ph7JizaeWI7CwJrBFd/abAavU6/AXf4qHwCVp1FKSIn8VtHWVO4C/zkD+e3kVpb6DS/pJNa4UhkGdPNkhouniiqVWcIwBKDvjGfs9KanfzBDtGF6QhbSp1vNo+ZZdJCBdPzkmQp3I3jKQzJRc9hm2CeoAWRc2GRyo1WQbUljd8z/6zbZ/y7WZQMa2rllo5HP3cl3d4P/K7v9HXb1W+i2H2c+Nd2mH6/wPDDIyoAkWcdxbiQdsoOt5/gC1+TOwZ7Inwfl9QJ5wj1TJQ+vMG6TuQQd4twAgCcJdV1aI/aXqipNTBZ4Mk76VqdjEAgSBP7zQ2SztS9jgRpPm5eylYyzaYLFq2n9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 21:33:24.0034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc18ac32-57ce-48be-31d5-08dee381dd93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EAYPR12MB999131
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

From: Fangzhi Zuo <jzuo@amd.com>

1. Add 2.1 mode list.
2. Extend support of pixel format to RGB/444/422/420 and
   color depth to 8/10/12 bpc.

Signed-off-by: Fangzhi Zuo <jzuo@amd.com>
Tested-by: Mark Broadworth <Mark.Broadworth@amd.com>
---
 tools/amd_hdmi_compliance.c | 437 +++++++++++++++++++++++++++++++++++-
 1 file changed, 428 insertions(+), 9 deletions(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index e0ef78d81..dc24430dd 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -100,6 +100,102 @@ static drmModeModeInfo test_modes[] = {
 		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
 		0x40, "1920x1080",	/* VIC 31 */
 	},
+	[32] = { 74250,
+		1920, 2558, 2602, 2750, 0,
+		1080, 1084, 1089, 1125, 0,
+		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1920x1080",	/* VIC 32 */
+	},
+	[33] = { 74250,
+		1920, 2448, 2492, 2640, 0,
+		1080, 1084, 1089, 1125, 0,
+		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1920x1080",	/* VIC 33 */
+	},
+	[34] = { 74250,
+		1920, 2008, 2052, 2200, 0,
+		1080, 1084, 1089, 1125, 0,
+		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1920x1080",	/* VIC 34 */
+	},
+	[41] = { 148500,
+		1280, 1720, 1760, 1980, 0,
+		720, 725, 730, 750, 0,
+		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1280x720",	/* VIC 41 */
+	},
+	[42] = { 54000,
+		720, 732, 796, 864, 0,
+		576, 581, 586, 625, 0,
+		100, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
+		0x40, "720x576",	/* VIC 42 */
+	},
+	[43] = { 54000,
+		720, 732, 796, 864, 0,
+		576, 581, 586, 625, 0,
+		100, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "720x576",	/* VIC 43 */
+	},
+	[47] = { 148500,
+		1280, 1390, 1430, 1650, 0,
+		720, 725, 730, 750, 0,
+		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1280x720",	/* VIC 47 */
+	},
+	[48] = { 54000,
+		720, 736, 798, 858, 0,
+		480, 489, 495, 525, 0,
+		120, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
+		0x40, "720x480",	/* VIC 48 */
+	},
+	[49] = { 54000,
+		720, 736, 798, 858, 0,
+		480, 489, 495, 525, 0,
+		120, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "720x480",	/* VIC 49 */
+	},
+	[52] = { 108000,
+		720, 732, 796, 864, 0,
+		576, 581, 586, 625, 0,
+		200, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
+		0x40, "720x576",	/* VIC 52 */
+	},
+	[53] = { 108000,
+		720, 732, 796, 864, 0,
+		576, 581, 586, 625, 0,
+		200, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "720x576",	/* VIC 53 */
+	},
+	[56] = { 108000,
+		720, 736, 798, 858, 0,
+		480, 489, 495, 525, 0,
+		240, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
+		0x40, "720x480",	/* VIC 56 */
+	},
+	[57] = { 108000,
+		720, 736, 798, 858, 0,
+		480, 489, 495, 525, 0,
+		240, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "720x480",	/* VIC 57 */
+	},
+	[60] = { 59400,
+		1280, 3040, 3080, 3300, 0,
+		720, 725, 730, 750, 0,
+		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1280x720",	/* VIC 60 */
+	},
+	[61] = { 74250,
+		1280, 3700, 3740, 3960, 0,
+		720, 725, 730, 750, 0,
+		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1280x720",	/* VIC 61 */
+	},
+	[62] = { 74250,
+		1280, 3040, 3080, 3300, 0,
+		720, 725, 730, 750, 0,
+		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		0x40, "1280x720",	/* VIC 62 */
+	},
 	[63] = { 297000,
 		1920, 2008, 2052, 2200, 0,
 		1080, 1084, 1089, 1125, 0,
@@ -284,7 +380,7 @@ static drmModeModeInfo test_modes[] = {
 		3840, 5116, 5204, 5500, 0,
 		2160, 2168, 2178, 2250, 0,
 		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
-		0x40, "4096x2160",	/* VIC 93 */
+		0x40, "3840x2160",	/* VIC 93 */
 	},
 	[94] = { 297000,
 		3840, 4896, 4984, 5280, 0,
@@ -344,7 +440,7 @@ static drmModeModeInfo test_modes[] = {
 		  3840, 5116, 5204, 5500, 0,
 		  2160, 2168, 2178, 2250, 0,
 		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
-		  0x40, "4096x2160",	/* VIC 103 */
+		  0x40, "3840x2160",	/* VIC 103 */
 	},
 	[104] = { 297000,
 		  3840, 4896, 4984, 5280, 0,
@@ -370,6 +466,288 @@ static drmModeModeInfo test_modes[] = {
 		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
 		  0x40, "3840x2160",	/* VIC 107 */
 	},
+	[108] = { 90000,
+		  1280, 2240, 2280, 2500, 0,
+		  720, 725, 730, 750, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "1280x720",	/* VIC 108 */
+	},
+	[109] = { 90000,
+		  1280, 2240, 2280, 2500, 0,
+		  720, 725, 730, 750, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "1280x720",	/* VIC 109 */
+	},
+	[110] = { 99000,
+		  1680, 2490, 2530, 2750, 0,
+		  720, 725, 730, 750, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "1680x720",	/* VIC 110 */
+	},
+	[111] = { 148500,
+		  1920, 2558, 2602, 2750, 0,
+		  1080, 1084, 1089, 1125, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "1920x1080",	/* VIC 111 */
+	},
+	[112] = { 148500,
+		  1920, 2558, 2602, 2750, 0,
+		  1080, 1084, 1089, 1125, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "1920x1080",	/* VIC 112 */
+	},
+	[113] = { 198000,
+		  2560, 3558, 3602, 3750, 0,
+		  1080, 1084, 1089, 1100, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "2560x1080",	/* VIC 113 */
+	},
+	 [114] = { 594000,
+		  3840, 5116, 5204, 5500, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "3840x2160",	/* VIC 114 */
+	},
+	[115] = { 594000,
+		  4096, 5116, 5204, 5500, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
+		  0x40, "4096x2160",	/* VIC 115 */
+	},
+	[116] = { 594000,
+		  3840, 5116, 5204, 5500, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "3840x2160",	/* VIC 116 */
+	},
+	[117] = { 1188000,
+		  3840, 4896, 4984, 5280, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "3840x2160",	/* VIC 117 */
+	},
+	[118] = { 1188000,
+		  3840, 4016, 4104, 4400, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "3840x2160",	/* VIC 118 */
+	},
+	[119] = { 1188000,
+		  3840, 4896, 4984, 5280, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "3840x2160",	/* VIC 119 */
+	},
+	[120] = { 1188000,
+		  3840, 4016, 4104, 4400, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "3840x2160",	/* VIC 120 */
+	},
+	[121] = { 396000,
+		  5120, 7116, 7204, 7500, 0,
+		  2160, 2168, 2178, 2200, 0,
+		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "5120x2160",	/* VIC 121 */
+	},
+	[122] = { 396000,
+		  5120, 6816, 6904, 7200, 0,
+		  2160, 2168, 2178, 2200, 0,
+		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "5120x2160",	/* VIC 122 */
+	},
+	[123] = { 396000,
+		  5120, 5784, 5872, 6000, 0,
+		  2160, 2168, 2178, 2200, 0,
+		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "5120x2160",	/* VIC 123 */
+	},
+	[124] = { 742500,
+		  5120, 5866, 5954, 6250, 0,
+		  2160, 2168, 2178, 2475, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "5120x2160",	/* VIC 124 */
+	},
+	[125] = { 742500,
+		  5120, 6216, 6304, 6600, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "5120x2160",	/* VIC 125 */
+	},
+	[126] = { 742500,
+		  5120, 5284, 5372, 5500, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "5120x2160",	/* VIC 126 */
+	},
+	[127] = { 1485000,
+		  5120, 6216, 6304, 6600, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "5120x2160",	/* VIC 127 */
+	},
+	[193] = { 1485000,
+		  5120, 5284, 5372, 5500, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "5120x2160",	/* VIC 193 */
+	},
+	[194] = { 1188000,
+		  7680, 10232, 10408, 11000, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "7680x4320",	/* VIC 194 */
+	},
+	[195] = { 1188000,
+		  7680, 10032, 10208, 10800, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "7680x4320",	/* VIC 195 */
+	},
+	[196] = { 1188000,
+		  7680, 8232, 8408, 9000, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "7680x4320",	/* VIC 196 */
+	},
+	[197] = { 2376000,
+		  7680, 10232, 10408, 11000, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "7680x4320",	/* VIC 197 */
+	},
+	[198] = { 2376000,
+		  7680, 10032, 10208, 10800, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "7680x4320",	/* VIC 198 */
+	},
+	[199] = { 2376000,
+		  7680, 8232, 8408, 9000, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "7680x4320",	/* VIC 199 */
+	},
+	[200] = { 4752000,
+		  7680, 9792, 9968, 10560, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "7680x4320",	/* VIC 200 */
+	},
+	[201] = { 4752000,
+		  7680, 8032, 8208, 8800, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
+		  0x40, "7680x4320",	/* VIC 201 */
+	},
+	[202] = { 1188000,
+		  7680, 10232, 10408, 11000, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "7680x4320",	/* VIC 202 */
+	},
+	[203] = { 1188000,
+		  7680, 10032, 10208, 10800, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "7680x4320",	/* VIC 203 */
+	},
+	[204] = { 1188000,
+		  7680, 8232, 8408, 9000, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "7680x4320",	/* VIC 204 */
+	},
+	[205] = { 2376000,
+		  7680, 10232, 10408, 11000, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "7680x4320",	/* VIC 205 */
+	},
+	[206] = { 2376000,
+		  7680, 10032, 10208, 10800, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "7680x4320",	/* VIC 206 */
+	},
+	[207] = { 2376000,
+		  7680, 8232, 8408, 9000, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "7680x4320",	/* VIC 207 */
+	},
+	[208] = { 4752000,
+		  7680, 9792, 9968, 10560, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "7680x4320",	/* VIC 208 */
+	},
+	[209] = { 4752000,
+		  7680, 8032, 8208, 8800, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "7680x4320",	/* VIC 209 */
+	},
+	[210] = { 1485000,
+		  10240, 11732, 11908, 12500, 0,
+		  4320, 4336, 4356, 4950, 0,
+		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "10240x4320",	/* VIC 210 */
+	},
+	[211] = { 1485000,
+		  10240, 12732, 12908, 13500, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "10240x4320",	/* VIC 211 */
+	},
+	[212] = { 1485000,
+		  10240, 10528, 10704, 11000, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "10240x4320",	/* VIC 212 */
+	},
+	[213] = { 2970000,
+		  10240, 11732, 11908, 12500, 0,
+		  4320, 4336, 4356, 4950, 0,
+		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "10240x4320",	/* VIC 213 */
+	},
+	[214] = { 2970000,
+		  10240, 12732, 12908, 13500, 0,
+		  4320, 4336, 4356, 4400, 0,
+		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "10240x4320",	/* VIC 214 */
+	},
+	[215] = { 2970000,
+		  10240, 10528, 10704, 11000, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "10240x4320",	/* VIC 215 */
+	},
+	[216] = { 5940000,
+		  10240, 12432, 12608, 13200, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "10240x4320",	/* VIC 216 */
+	},
+	[217] = { 5940000,
+		  10240, 10528, 10704, 11000, 0,
+		  4320, 4336, 4356, 4500, 0,
+		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
+		  0x40, "10240x4320",	/* VIC 217 */
+	},
+	[218] = { 1188000,
+		  4096, 4896, 4984, 5280, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
+		  0x40, "4096x2160",	/* VIC 218 */
+	},
+	[219] = { 1188000,
+		  4096, 4184, 4272, 4400, 0,
+		  2160, 2168, 2178, 2250, 0,
+		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
+		  0x40, "5120x2160",	/* VIC 219 */
+	},
 };
 
 static void signal_handler(int signo)
@@ -460,21 +838,62 @@ static void set_force_yuv420(data_t *data, int force, int conn_id)
 	test_fini(data);
 }
 
+static void set_force_yuv_pixel_format(data_t *data, int yuv_pixel_format, int conn_id)
+{
+	int fd, res;
+	const char *entry_name;
+
+	test_init(data, conn_id);
+
+	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
+	igt_assert(fd >= 0);
+
+	igt_info("Setting %d on connector id %d\n",
+			yuv_pixel_format, data->output->config.connector->connector_id);
+
+	switch (yuv_pixel_format) {
+			case 2:
+					entry_name = "force_yuv422_output";
+					break;
+			case 3:
+					entry_name = "force_yuv444_output";
+					break;
+			case 4:
+					entry_name = "force_yuv420_output";
+					break;
+			default:
+					goto out;
+	}
+
+	igt_info("%s\n", entry_name);
+	res = igt_sysfs_write(fd, entry_name, "1", 2);
+	igt_info("res = %d\n", res);
+	igt_require(res > 0);
+
+out:
+	close(fd);
+	test_fini(data);
+}
+
 /* Set "max bpc" property of connector */
 static void set_max_bpc(data_t *data, int max_bpc, int conn_id)
 {
 	igt_display_t *display = &data->display;
 	igt_fb_t afb;
+	drmModeModeInfo *mode;
 
 	test_init(data, conn_id);
 
+	mode = igt_output_get_mode(data->output);
+
 	igt_info("Setting max bpc to %d on connector id %d\n",
 		 max_bpc, data->output->config.connector->connector_id);
-	igt_create_fb(data->fd, 128, 128, DRM_FORMAT_XRGB8888, 0, &afb);
+	igt_create_pattern_fb(data->fd, 1024, 1024, DRM_FORMAT_XRGB8888, 0, &afb);
 	igt_plane_set_fb(data->primary, &afb);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, max_bpc);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
+	igt_remove_fb(data->fd, &afb);
 	test_fini(data);
 }
 
@@ -510,8 +929,8 @@ static void usage(const char *name)
 	igt_info("-t vic	Select video mode based on VIC\n");
 	igt_info("-v		Test on 'Virtual' connector as well, for debugging.\n");
 	igt_info("-i conn_id	Use connector by ID\n");
-	igt_info("-b max_bpc	Set \"max bpc\" connector property\n");
-	igt_info("-y 0|1	Write 0 or 1 to connector's debugfs force_yuv420_output\n");
+	igt_info("-b 8|10|12	8|10|12 bpc\n");
+	igt_info("-y 1|2|3|4	RGB|YUV422|YUV444|YUV420\n");
 	igt_info("-e seconds    number of seconds to display test pattern and exit\n");
 	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
 }
@@ -523,7 +942,7 @@ int main(int argc, char **argv)
 	int vic = 0;
 	int conn_id = 0;
 	int max_bpc = 0;
-	int force_yuv_420 = -1;
+	int force_yuv_pixel_format = -1;
 
 	memset(&data, 0, sizeof(data));
 
@@ -542,7 +961,7 @@ int main(int argc, char **argv)
 			max_bpc = atoi(optarg);
 			break;
 		case 'y':
-			force_yuv_420 = atoi(optarg);
+			force_yuv_pixel_format = atoi(optarg);
 			break;
 		case 'e':
 			data.timeout_seconds = atoi(optarg);
@@ -561,8 +980,8 @@ int main(int argc, char **argv)
 	igt_require(data.display.is_atomic);
 	igt_display_require_output(&data.display);
 
-	if (force_yuv_420 >= 0)
-		set_force_yuv420(&data, force_yuv_420, conn_id);
+	if (force_yuv_pixel_format >= 2 && force_yuv_pixel_format <= 4)
+		set_force_yuv_pixel_format(&data, force_yuv_pixel_format, conn_id);
 
 	if (max_bpc)
 		set_max_bpc(&data, max_bpc, conn_id);
-- 
2.43.0

