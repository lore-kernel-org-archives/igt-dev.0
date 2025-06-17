Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 192C8C71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:43:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7FD10E4F4;
	Tue, 17 Jun 2025 04:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VIKk2YlW";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2085.outbound.protection.outlook.com [40.107.93.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB9110E4F4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:43:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cftZbc2zHKuAKVhAiEqd7YX7zLFqgXgn0JpidGwZZ2qbAK99Sas7lCWLvQatJqr7sVn/AydNCYX2nVkG55oZTXM5YW8U0dLV0xOQLnc9v+RhnTD2UMGNwXkM57cVh6pNBvlCZAlbNBj5Tc+f6XdFqBDcSgCncgrnDrSZS5XfgVqwV+33EU2spg0cD6f4l5g/k8E4dMG0gcqw3cxXZBEM9uvaMjlgOGR4jvzS59bM61uq90vAru3w8YOkzR+AbtelA8pQnPwQt3SPo7gjJdWDRlQyJhlWi/m4dOMuE9/gXxVzqCUjgCoRv6LpmTVGVzM/GJO4+k/Q7MHCrEvYZ2ZcjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjqUeAPudFxaGtn8skNS5B3uPORUxCJWx2ffXlW9FwU=;
 b=X846MuPW96LsTtGgbOfILSOc8lpnByDIliPsRZhIOGVEKzqqOL/8XCpSMQRLKT+U57rD9UW744t5/gUQlMlH9HiEcFpK4sWMcStn/pm74auXoR4VqsTy9G5qZx6f+SPjAF0j8mD352hQW+fZ55DXZ5nvjKws/P5c1XtmNJdaCk4PhxgIiGep1Df+NOavSaok6aZtqn4vy3CIN9sj6jnmY9pu0tGuKOmYoYKzQ/1r1EmpG8XepXSGC8F4wIr9W9HsXVqTD9F2g7SoYsrrBZ1IQsfmT+SHCgXDggzhQO60AjCt+paftYwln17OE4u/XhaDelZjO+TmusLZqi9aFXfEIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjqUeAPudFxaGtn8skNS5B3uPORUxCJWx2ffXlW9FwU=;
 b=VIKk2YlWKDV4Y4S5NQ7dGxi/S6opz9BQiQ7PGd3tM0MZDW/fbdinJVBaZQpoQhjWrG1iprl6+2dKBpZ4veaOtW+OYntKjeQhhAE4rXbmQQfw7BW44r6pONWoXohbuMnM1Op32r8ONZAoI4odL28o82uGfgsRyMvP4hcsksvmGqw=
Received: from CH0PR04CA0024.namprd04.prod.outlook.com (2603:10b6:610:76::29)
 by CY8PR12MB8316.namprd12.prod.outlook.com (2603:10b6:930:7a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:42:57 +0000
Received: from CH3PEPF00000014.namprd21.prod.outlook.com
 (2603:10b6:610:76:cafe::b1) by CH0PR04CA0024.outlook.office365.com
 (2603:10b6:610:76::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 04:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000014.mail.protection.outlook.com (10.167.244.119) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:42:57 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:42:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 31/36] lib/igt_color: Point license header at skia license
Date: Mon, 16 Jun 2025 22:36:26 -0600
Message-ID: <20250617043631.2920587-32-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000014:EE_|CY8PR12MB8316:EE_
X-MS-Office365-Filtering-Correlation-Id: 7198c6d8-1698-42ac-6193-08ddad596e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5U5+uaIug1Oz8fgDIRMOgNShAlJFBwWBZujRsY/D9BIIM7y5t22kjpxGA7Bh?=
 =?us-ascii?Q?1v9Hp9QGY+UsVrAVjLIIrTjRyC88eSW0XqqYPptF90rePIxx+UXKe/Onkv0c?=
 =?us-ascii?Q?DlYSYkAAjc9v02vffk4dXUzNhPCmtbjXP1kuKGoFcL5IxZfx75UAqYh7gquv?=
 =?us-ascii?Q?M6MQne9SM1pslQ9cbMHmG3nsBhweYykSTdUHMcUMIUtY8eNIOVCIqPwJ15v9?=
 =?us-ascii?Q?+TTqYGJOGQfy7a8lL6ZgwQ85u+QtQB+kykmGJec+M6iLH9L0AXzXp1HxZpx0?=
 =?us-ascii?Q?uWToKxZDNuoVFsPOdq9AzX01K5aFcKep0N5APmW+YOjsAmKIdmD+xNScTK6A?=
 =?us-ascii?Q?4KRI26Dy+FPWaPS3qHc2eFoKCik0F8X9NH5zxO9p60wZyoxyBNtnvm2mmQVo?=
 =?us-ascii?Q?v7Lnw9FiSOXHxSB1wyPceisiBcfYlf+9Vez98eoFaCodfw2BW2nttG7v0m1/?=
 =?us-ascii?Q?rv2/ktMlY3+LxxZQW6DUeaLTRe0ZNRrPrpSqH7iw2jCcUc/vPiTBhlLEufHJ?=
 =?us-ascii?Q?kT4G+4ztgU/axTSV4EnstZhrgWwd2ghVM9EJgqd+kZfTc4F+T7Qsu7Q0GsBM?=
 =?us-ascii?Q?yzVFN8PayfcO+ewZSkaWli0FdN7AmWVHj9n1com04wFuEPIyuW0bdt6dxH97?=
 =?us-ascii?Q?mxEq4UUoRt3GGePvqbeLIDuwcNUic8A41jIrS/B6V26N2Le8nQgqZ9633aYh?=
 =?us-ascii?Q?ziXqxfpvbAfX9cKkK1ED24vu4g6K8XUM8FMTitQyiSGtJ+fFiQwpCKT1ixJ5?=
 =?us-ascii?Q?bterSeLgoXNyxle1j08k6kxrjNHa9C06ixjV9iKbzZ23/epKJjbWG2DgEOxh?=
 =?us-ascii?Q?5oEoG2JcPNscxlHJGeuGK4MWidRmSj8LU6NxdksCYezGZPzPpajIEL2+BN2L?=
 =?us-ascii?Q?tHVqQOT1f8CTGAEM/0glnjTA4BMHhjRILtvorGMIKCE4kwPLYjobMb0fg+EQ?=
 =?us-ascii?Q?/RYw8qwpUpWOymSzJGcnG/hebtZxVeu6mNixby/6pDJS1Hy3AaGtDzPy3BWZ?=
 =?us-ascii?Q?mUCvP7JdFCZOX9WVdCwo1PRIaGAW0zStOCz+r7y2XbKWMYZCryezj7XTlsC+?=
 =?us-ascii?Q?pDwqTD3WMMD7vtYa7Ct5Z2l6yB67YBGqr+lwzumYb21qpBNlUOdTv1g2+TLM?=
 =?us-ascii?Q?ZIwa23U5JRpyngyIVsm2YPOQgaHVkcvjOJkarEJ0Hnm3uvz837Dg1bzEYr+G?=
 =?us-ascii?Q?kwt+v3Jp+MBneEvgUwXdlr1yWoMjOx/unuKoBcE663127RrHE5ATHdH32SNh?=
 =?us-ascii?Q?8zN4yrh49Xg4xoj73sDZeUTVpCF3ABfTYoI2CBlGDM/WyxSvV3EsKgkaJ/Bi?=
 =?us-ascii?Q?jhVc/ChcriIClT/PuNs85edSEu/pW3mMkLw/3HRLg32cyiFFs/ove1OZYG8Q?=
 =?us-ascii?Q?TGrvU3olu6o2Iymd4IRYEMFIG/ssqD/gOUov/WX6KrH6rDIudxtctVtM45rF?=
 =?us-ascii?Q?F9bollsqWWPGEMyHqh3oDqOvxccjKBaPhoP6WBvXe445hmNY8ykmUQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:42:57.3274 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7198c6d8-1698-42ac-6193-08ddad596e7c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000014.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8316
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

