Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F000C369B5
	for <igt-dev@archiver.kernel.org>; Mon, 14 Apr 2025 09:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42DB10E4FD;
	Mon, 14 Apr 2025 09:22:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="q5UquWGz";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2069.outbound.protection.outlook.com [40.107.237.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5881D10E4FD
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Apr 2025 09:22:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aDW+UeOWjpn8O8kMeRhRZt6Auo6tDoKPOWS/e6KXty7jEpv7FY0+NUjr+/ASuHvEdUhyU+QSJYsDQlgfcqxaiHdo5dHcsBbGlcwyadiMWRo2Hkp+IkltBYRX9K14HHdRvdOpR0R/zSeLDmd8i6u0beMnFgMcLrg7UnPL5+NwMB0N+N0VSx4GtYwFPtS01hkHF+wSDUnCmmecpsswgBInl3shwWA4R6O477v1/53mPsTWmV+bSoCpgNADRvfvcgYv1YAMWfvly4nGNSb3hzyHiRGwqiuBa6ElAXipQB+neFfxn7J5IaHbHSqnskE3bx7ZydpLg+ZTrZITdHij3KIEtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9Kbuou9mE/E2++6Uh8cRFLsU+/MkGmNs5yVFksSN0s=;
 b=jQ4ct/dNXhoBumgRH3noYCDP+56FHSsjS8civKDe3Kej0FZPfH8UvvB0PHyitijTJS7lJYkC7xu2Pfbk2EkhbOwrXb3aY+SiSu3SrSA5fNZNciPxLEBVDIPVjAF6gL+b90SYjP2qDH7kBMMyom7b6in07XlyduRo3Te4JFq+GlzVEhHlrXu8Kijyhu65Z8+QN4vtMDlGhcxWYYTl+j2bqDjAq9xn9+8URez5Hshy5cw3T1D0hvQwlvOHUqgwAO96XQGOja6uAx9HPHrs7m57dJ/R2RJEYcN5X6ZoB4q0Rr6UHc527ayLXd2DZhfZq4iIaAM2Mdc2BBetZQqBmHpY9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9Kbuou9mE/E2++6Uh8cRFLsU+/MkGmNs5yVFksSN0s=;
 b=q5UquWGzINupjZY1db1wPuIJip/nwR3bj78uH0t24n2SG+/wE7VYnb0Bz/IPs6JuJNRzwKdkO4JxjaAHm9/oP3WtekKK7+wVLsHnyaINKM4XfxsaGG/IVHdR33sR7zzkzUr/k1EFy0CKxQPkuTkMG2yHT3Akss55V4WuXXiui0g=
Received: from BL0PR05CA0026.namprd05.prod.outlook.com (2603:10b6:208:91::36)
 by DM6PR12MB4123.namprd12.prod.outlook.com (2603:10b6:5:21f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Mon, 14 Apr
 2025 09:22:16 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:91:cafe::52) by BL0PR05CA0026.outlook.office365.com
 (2603:10b6:208:91::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Mon,
 14 Apr 2025 09:22:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 09:22:15 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 04:22:15 -0500
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Apr 2025 04:22:13 -0500
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_vrr_range: Fix test may fail on
 non-zero card index
Date: Mon, 14 Apr 2025 17:21:33 +0800
Message-ID: <20250414092207.7830-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|DM6PR12MB4123:EE_
X-MS-Office365-Filtering-Correlation-Id: b239f6d8-6d6b-4fb3-c517-08dd7b35d8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pkBz6N9+kIB9YpCVeAfKzuwU9uX3eMYJHR1Tbu2O20W4UdeErSoN38zqhJQB?=
 =?us-ascii?Q?MyNExEZS7ug2S6Pt+SNTu1uCGwwsbEcoLG8Z3VUKFYSEdk4olY1CWmS7xa5/?=
 =?us-ascii?Q?OeNrPBWqzfoFhXbo+7sDr6kYVt19wM+xUiN4yDlqGi1+RcpMAT9nh0cQ0bjZ?=
 =?us-ascii?Q?k5+y+QBPOIHK/316gzgVJ+0G8YfEk/kSdVto53WMk7SLA0F36QezVcIZGhhP?=
 =?us-ascii?Q?GHJgMkHCMirNS8ttEkKNlK1Hp0tUOBYHamEd5umYTFMKbU2cSOkmU6chdyqO?=
 =?us-ascii?Q?lAwXkGLxibHd0wQ474Y0l9U67FPrDxvzQfqi+Zy5rqn+nfAPw33h8YaY4nL7?=
 =?us-ascii?Q?5E6mlVY11kI/48wn24PKYTQeoynAueFsV2wpIkhzDPPUKMsdf08jehb6rx8M?=
 =?us-ascii?Q?Bngvb4QtGcNQUKakiRQPhy0HFGcEl6tz63DzFpNs4dwlo9iBhtfz70x6o/Lh?=
 =?us-ascii?Q?tVR5ViGW09FMbf2U7rLx8yN/IL6l227ZOMGVZ/WRz14ttC3AW1UaoewVfudp?=
 =?us-ascii?Q?EpQNVBNM3cP7T9610WKa/xw7Oks+lZsrbUf5NcD3/j9JOjmgTk0ZKmMal0ts?=
 =?us-ascii?Q?seEohiLSt7UbcAQC47H9CWFw/GC2LNqPTPIHAYCIRWE0T6Rm075fYM7zKtax?=
 =?us-ascii?Q?Pl2Jx3L/OXwqxpAlwKDtYe9hyrpD+4MxQwxM7s3lg6CUTL6hAtnPFrXkBUCF?=
 =?us-ascii?Q?CUxo4ZCyIRMTrFV63Q7X4PcVtmQ6JKsvwnx8+p78cWKQ2P+EYLuGfrZwsrXR?=
 =?us-ascii?Q?L0wQALkBZOgdunTnhHSnap2Uv+8SfbBzzQ3su2D45+xXDEpWEO0ZKnwok5bQ?=
 =?us-ascii?Q?2oOazMTjk0cGFOT+WQlzD9tTwS1F0zsl57HzZriEddo8qLzCaEQJ5TyL3NJD?=
 =?us-ascii?Q?ODrUkChPf5R2uKpEeoB5MbAIP+zBUpNIkCXUNBjbQStyc7sExSorNCdICfqU?=
 =?us-ascii?Q?8hOafgx+WxPmwEFd9V6VHX5Mfm4h0IwIQiy/ojOdwg/1Rr6ZaDu9PhEJc5ha?=
 =?us-ascii?Q?odz4Y2EFWP7uRu3MgQttDWbsTNvjON4yDw59QaIWYprJ23QUXmTfJZthPiRl?=
 =?us-ascii?Q?jZzBkusG2r0sj2Iyc+oVd/ZZaHgldkkJ0vSXz0EyhpnarI26ePvPZP5Rszyt?=
 =?us-ascii?Q?XeKfES+31s4PMk1SldA0vDRC1dyIqJgwO4OS73bntN3y6qCUiyj61UMUf+s9?=
 =?us-ascii?Q?GVJ7UBUF2BDQ2VEKAucC7kZZyvAGcPRuFYESju8sqvW7xy0scdOkcs7VNCfk?=
 =?us-ascii?Q?+zinzNA/JlbIDFwwWq2TsaNsRKi9DIMBc7QaQgMO59y8isvx6dpFwAzWTI+5?=
 =?us-ascii?Q?pUfxBXxclwQV6QyJRbOykPDG9Wpcuq5AQdZZiiTpBKotQsyd6sHxaPm9nWSz?=
 =?us-ascii?Q?DMpXE1A3lvv4TgfOlE9hd3UoXl9+R3dArdIudowKofU20ytCZc92czsDEhbb?=
 =?us-ascii?Q?7brFFnBSzRlmOHstiOu6TajFvMzyPSjf/muOVW28AAJSZAehrgpin28kQ1Gw?=
 =?us-ascii?Q?vCh5FXHCK/PC8qkVtodtrHzjwVcp7GpNzKYf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 09:22:15.7905 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b239f6d8-6d6b-4fb3-c517-08dd7b35d8dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4123
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

[Why]
Current test use hard code for card index.
If the card index is not 0, the test will be failed.

[How]
Get the card index dynamically during the test.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_vrr_range.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index 9d2462e5e..38ef1d27f 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -22,6 +22,7 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include "igt_device.h"
 #include "igt_amd.h"
 #include <fcntl.h>
 
@@ -30,7 +31,7 @@ IGT_TEST_DESCRIPTION("Test EDID parsing and debugfs reporting on Freesync displa
 /* Maximumm pipes on any AMD ASIC. */
 #define MAX_PIPES 6
 #define EDID_SIZE 256
-#define EDID_PATH "/sys/class/drm/card0-%s/edid"
+#define EDID_PATH "/sys/class/drm/card%d-%s/edid"
 
 /* Common test data. */
 struct vrr_range {
@@ -295,7 +296,7 @@ static bool find_vrr_range_from_edid(data_t *data, igt_output_t *output)
 
 	/* Get EDID */
 	igt_assert(snprintf(edid_path, PATH_MAX, EDID_PATH,
-			   output->name) < PATH_MAX);
+			   igt_device_get_card_index(data->fd), output->name) < PATH_MAX);
 
 	fd = open(edid_path, O_RDONLY);
 	if (fd == -1)
-- 
2.43.0

