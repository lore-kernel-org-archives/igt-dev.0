Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FCBC369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:41:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4911D10E6B4;
	Wed, 30 Apr 2025 01:41:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dLqiXQ8c";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9247310E6B4
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJMgWTHVEP1Nra4Xwf3XMCLWF8kuRHNm4IWu1s/RiAsbOImqWtUlK9+ik6+rB5IiJCmfPinSRbQse4l7MHP9PnM3zfH2JSt2DyHRyyrEmDC2eHaHo/ClTkY6+bj37Mei4pXvZyQ+2/zpufl+zDn3aWCn0JXiEH+6VXNSe3N6IFpvWras1mgBHvuuFcb6nZm4woa+lO24xPKPeSs6aszqIzsB9LHcLyWNsw1ZYfbX2L7L+H68bWu6xMJZGyqX0hTrOmXv/dSJzcHL5SxV4NyxcpJoEukTVNZhSnV/chLjVKHlv+CfzCea76ktIQwSYXk9L78K/RzrN7e/AHcKeLQtpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjqUeAPudFxaGtn8skNS5B3uPORUxCJWx2ffXlW9FwU=;
 b=BxEZfgwbEmEG43EieXiaYyhcAIDpO6CO26kd4WIqkDT/PyTV5A+bnCKQLrdsklnQ1h7rfSGps2r9NwQTuZSs7uu9uFcOzD5Hpk2tH1X3iW4dycaPDmhKobKjgYCV5WwoD/MEa3mh8hhmcqTFry/2o7/+ZZVBX0svklJbu4RxFobvhGhU2DO6WgQC3RYvf3R7AXC0X+6KSTvf8csUBPx25VoQpfzmLliv4BR9nDIe2MIIfs5K/0l2D/YaddkDu33O/NFG3aSf8MzPsXTKEKYNPTxfbujcSI90U+g9neknKRE+PbfoSGvnHETM9KGl/d5OdgkMSHFjiglV8MlH40Ky7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjqUeAPudFxaGtn8skNS5B3uPORUxCJWx2ffXlW9FwU=;
 b=dLqiXQ8cZg0uncBJF01uiypnupFCbe+mvwMsEl5STB+e4uXay6VChVqxhwl9W/JZXMaofIGGlsH+MMS6XabKBhAkbGLnDvqA44AdGHxS77E+ixWBKHKkRQ3qa0TjYO9hIyR7SnKRjUbGhIUWIb+xYQEt0QALp1XAJGgf/EUhdc0=
Received: from SJ0PR05CA0098.namprd05.prod.outlook.com (2603:10b6:a03:334::13)
 by SA1PR12MB8094.namprd12.prod.outlook.com (2603:10b6:806:336::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:41:40 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:334:cafe::d1) by SJ0PR05CA0098.outlook.office365.com
 (2603:10b6:a03:334::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Wed,
 30 Apr 2025 01:41:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:41:40 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:41:37 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 31/36] lib/igt_color: Point license header at skia license
Date: Tue, 29 Apr 2025 19:34:49 -0600
Message-ID: <20250430013454.226910-32-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|SA1PR12MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: 81460c6c-ca78-4842-f886-08dd87882787
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6lK3SRnrKUSJJJfYpAEY0RzT7zAJBLX1cpXNL2c0QO+HmFXWEoqsUCYxsYIt?=
 =?us-ascii?Q?F5/m3vZA6530/GTISZW/umK4I9TBQUIMbBEqkNtZqT06HakncUqxGJ243BfX?=
 =?us-ascii?Q?Mf5HPH5qh5PKkjol860MEgMFvU2mZPcpE6wUmkLdKwBkM/i5X6bZEkcF9cH/?=
 =?us-ascii?Q?A9Y0ub1ntEqPBC3d0gBZTjMfhlSo0VOVQ3OrofGgduGimK0F6CZaXr3ylJCx?=
 =?us-ascii?Q?97CtKe010G/5v706XwMahsQ9LFzqh0HmC79uDHowcHy56LZkOC9Lk5CQ2cm/?=
 =?us-ascii?Q?PB/zliKmY3DdBjM2eIkA3re8zQj8IblzlJUnrasUv5aFBxgkjz5OKxrxq7VV?=
 =?us-ascii?Q?WGHxuIQtACcmzNicsAPq1MDwOR7cyR7qfniGVcWiJBCYYlG2OWV2FAe2DOVh?=
 =?us-ascii?Q?XOv6PUGOC4abaGKtLTSg5afdcpbd/XEQ0rjFH3bueGPtB4Y/6ukXVuKpMk06?=
 =?us-ascii?Q?BfTrisA/uBe577JqJi+dYmul8R7NFsflNGealySjs0f4DfBYshGF0h/HrVpz?=
 =?us-ascii?Q?N5tIrVyONfXWWFXVRmYWtvfy4fCmLdfzL2vUcWlO7KAs5SwH5S0Myc/cLkjp?=
 =?us-ascii?Q?HZ86uJJxnwoHpe4BbDq+9TfRbf6rEhKacGLo1m038aHghq4fRKTN5bclcXGM?=
 =?us-ascii?Q?vkXVPR5ST4sCFvCttnqfZGU+5obJgRMa2SnYrfsVvNYMYk8ZqbcI0K85jipy?=
 =?us-ascii?Q?IGzSnLqxdGnS55X6VOW7tHtvBWhqhM6tBUjeI2VEAxoH5n1oPP7Jma//0ph1?=
 =?us-ascii?Q?ItcPwCXt8vExX5Kn8p85YYR94btZZ57CtH3I1iI0BlVLGzjxgymVJauG9qZR?=
 =?us-ascii?Q?VsdPXqGGjoOJz0OlngjJYFe2xk9bYObWJ7h7Htw0Hw1x4uI7u8Wmb4NreN5q?=
 =?us-ascii?Q?zVFfGaFgYFwuXn05Qw2kgzz5lNyuY5JRSQy2EzOJ+3ITrj5WR0iDis8krwqy?=
 =?us-ascii?Q?xmrMxNbp2IKkXgYual9Az8kJOKyMOSzUON9UcxY6KPAdJfyPPswSITeqZioZ?=
 =?us-ascii?Q?mKAMCJPNKtSpjC6xdgE3mtWV5RdgOyvk/+Qgnq8uJc4RSGOHYA5HmGIhWO6g?=
 =?us-ascii?Q?LPLkaJQfXkUSa/nEPunObcq4FB3D7F/4eDvAIE2qqthkcTIJtiT++hm/VWqC?=
 =?us-ascii?Q?49lRHs6uOJ77FsFhmSJa/6NJELLmhl2s6QLBU+Bbi3FIo1dfthJzcLSK7W8U?=
 =?us-ascii?Q?Et1VtVHKgSG81vkU6jihA4edr81a6OHoLDEU//IzgOF/nHHjlNr34DTGQBTk?=
 =?us-ascii?Q?r4BsKwdSbtrcvFO7oabdvvVqTTnGfJUg0MECnWDBev6CcM67OJg+s5Za2XD7?=
 =?us-ascii?Q?YCsoePxy4yHFFV+X6gPH3aFJkk07cO3HD7a49no34Pt+uK5X34+8LtNYydo9?=
 =?us-ascii?Q?ZCGtYCcCSX6CYP8AOw7f70skMsX4UpUP+vICUdL0nUHwPvIAU3Q/LpAWJ8iy?=
 =?us-ascii?Q?CJh+Btq3qO1b39wXz2ba2uT2Q7N9MtUByDN3V47ueWpkf4qaPRZ/3g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:41:40.3554 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81460c6c-ca78-4842-f886-08dd87882787
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8094
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

From: Harry Wentland <harry.wentland@amd.com>

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index e6f435bf4..d3f2ccf00 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -3,7 +3,9 @@
  * Copyright 2023 Advanced Micro Devices, Inc.
  *
  * This file contains code adapted from Skia, which is
- * Copyright (c) 2011 Google Inc. All rights reserved.
+ * distributed under a BSD-style license which can be
+ * found at
+ * https://skia.googlesource.com/skia.git/+/refs/heads/main/LICENSE
  */
 
 #include <errno.h>
-- 
2.43.0

