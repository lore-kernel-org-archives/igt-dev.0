Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F32E3C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:46:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9C210E7A1;
	Wed, 26 Mar 2025 23:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="esOhReo0";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2078.outbound.protection.outlook.com [40.107.237.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDEA410E7A1
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:46:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dX07PfVvxN+vlBmi8wu9hkTc31Gm6/jfHMxHil1hV0kn2xoPADm8IKFVxk+y9fKHi0Ryz/DfhpB9gPf3NHe00faLuNj/9p28+wL76PDUv/EJAMlDoh8T+2B69Xp1PsoF4yz1pw1yr01tr5Q/Gd9IcCoLaZEcNoWCX1qTrrVbBG61btGbtY98nvLYypetkhZJOBr8x9z55KJa+2yA5PnARpmgTRT1yzWYIKF152AANACg7VZR6mNtQ+Buic70xVbpLwqs2ToJHvXXURZwkVB+GyjPRjDDLBs3MW1QJD0jVRHM/ZMiHsNsqTK3yfON0Dqy+OwpWNg1BeaNJntBA0dadQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wjqUeAPudFxaGtn8skNS5B3uPORUxCJWx2ffXlW9FwU=;
 b=Hr1pMBe3f+INTNah45ImxwEx294tNoU21g8rXgjyEfSjhMG0SZNUbUl3V4B9ucxSM4QEzW0znV1DcpQ3mg0VNxHc5vnH8fhBtxS/73ENW+OZOFrl734n9YSfSchRx42E0cZCAMmoxUsCP8UjTPlYfPUPQTrTm4OgsgMLDzcHkfCHvSZEik6CWhIjqzZ0Mb0jIIEeGUx5+2MosOppR/D2175FB4YmNRVHFrsxzmoYIcb54lNBe1dBcpHQnPQYvq7PmyHxHsEXjxH2VFzUlbOSrHIBxNT56VeAYR2AAbfjRjnV6HM9br3ccIMFe2BnY6BLs46QMNIpej+VkGWFd9+I3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wjqUeAPudFxaGtn8skNS5B3uPORUxCJWx2ffXlW9FwU=;
 b=esOhReo05g0FbCEImsecBapWVjxmsRxqbq1dqX1rkz5Rna22S0NxpuZ8aGRyaQJAk8c3nTGvWMbvbF6B+vArEA3GwscfM0FsypxHjnp8OLQWnrw/HykL89F7Vq4rv7kJToU8B0xfcNtWYBCXvdP/x3HIf/13cV7neYZpCinJgBk=
Received: from CH0PR08CA0026.namprd08.prod.outlook.com (2603:10b6:610:33::31)
 by DM6PR12MB4171.namprd12.prod.outlook.com (2603:10b6:5:21f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:46:09 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:33:cafe::fa) by CH0PR08CA0026.outlook.office365.com
 (2603:10b6:610:33::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Wed,
 26 Mar 2025 23:46:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:46:08 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:46:07 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 33/37] lib/igt_color: Point license header at skia license
Date: Wed, 26 Mar 2025 17:36:05 -0600
Message-ID: <20250326233609.2980110-34-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|DM6PR12MB4171:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2677c8-9edf-4ad3-6ba1-08dd6cc061dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PfvYpCiTkpE+3TMU8amwbmniVh+WTVT4P50SX/sUA2LoItQ2rN5ZezRzBZ0+?=
 =?us-ascii?Q?ILken26DhKi0DAXZOUQWjmimdd0CID/uA5daxSogXuVt/msaCevYUZxGvjfm?=
 =?us-ascii?Q?+q/nDi1IFYeRi+a7EcYIVEjDlt0zbM13wVV16RqYtQsWn0RE7JJhNX64UpR+?=
 =?us-ascii?Q?ufAj2+FPMhGEO0jPuHshFmUD2rC+064QgPx9TKKthF/My0Oe/aU/mgdKy/qJ?=
 =?us-ascii?Q?pyAEjcdqcg8NSF2uUZYgcypglDnqRC4wSHsq9LIq4dRo+PcydtQ1i0hXMUwk?=
 =?us-ascii?Q?3urXbaFRixsIePmnYahKF4JP5xwNJiod1Svp87WNX+6q7laqouH17vifTL6w?=
 =?us-ascii?Q?+dxyIkS6e8iBrQo+HJCnDDqSMQkG6XrcSh9SnGQk63t4ovl3vMKf+atkLSsE?=
 =?us-ascii?Q?vovXUuvPl+CJUSKKzIIxlP5c1mmW5an8q0kNWHZOLwNAeWtbzUoeaz3AC2/Z?=
 =?us-ascii?Q?VcovyVDau4q5WKEf+TM3EaKoGo2Y8zWRR6H3z+8QvYGEgP9vFiMdrwpX0ibZ?=
 =?us-ascii?Q?8BgxeB5apkIvnFuCVvU7r2uCycmpL0MnfWNUgflFDt4LzrCvvrUB9vkwA20/?=
 =?us-ascii?Q?ssQy8cR4h+LyppTi25ZO0hWOrpyrT9yY378TwQ0xNFvyaTBFGnLgol8e8Ru/?=
 =?us-ascii?Q?0v0FpZshTkLO9XSe8Hh86KAg12cgWVF7kKZMQKcQ6eC/AX6Sf2zoNt8X0uV3?=
 =?us-ascii?Q?0pukx9itCjpxYAKCp/qpYkiRG2BaXHFWCnX7hGYMljOui/0p2RsQmkp7ZIYr?=
 =?us-ascii?Q?9n+I3TSMTlWDicEgOv8kvpueQg9e9halucuRYTBmZH0kY3ZEuzju9r02cR1/?=
 =?us-ascii?Q?xhu9y5oSu59/oVwPmGdMtHTT+7Zrgm8RY37KygR7CVjB3eHI9Oqe4qudItfR?=
 =?us-ascii?Q?sS8EeXcjKCr7Ru5YgjCPc06VSyt3WBJk/fU8tyx8K4gp9qJjemsTrihs9pKt?=
 =?us-ascii?Q?w2C16ciJTPzTm2fR7RVfFpv2PeUdNW8P47hpem4eWJvoVyZ1Z9SQivTfUdPY?=
 =?us-ascii?Q?NUguVcv5X52ApqSEk6PmDxIvmMNMSyWBPphKd7uY0HLHpIKndx7kt4GK7cfq?=
 =?us-ascii?Q?oJhEdK0wNDSOlnk3wys1/RfJvy532HnY6VArxxGg/vX3kHvH0yVz67YHiY1i?=
 =?us-ascii?Q?/+Qrn0Q9SFnUCiyjBnhvHIeiDZGhv+vIkpvbmug+pXstnYFLsyCJ8ANOxek2?=
 =?us-ascii?Q?UWP5xUo8lRFMIOebpGER5jym9mj9ou3z+FiAJDGgAdZrQ/QiBMU/TpzCxJ5O?=
 =?us-ascii?Q?byI9rFLUYVva+lV6fTpen+oKTgAPOC8nuYtJ/ocavWt2h7tELzuVsJipQ6Ju?=
 =?us-ascii?Q?Ol09zu+vp8+PuSBIZ2z5tvdhq3pszkMAqF94nCc4J2SBntrTCUJrGFO6Hr9R?=
 =?us-ascii?Q?GN6/9LhrFrTNoXV8+E9jRdfkFFuugDy38fDuJ7yeL0c5QxfSHC/dEWoAbROl?=
 =?us-ascii?Q?bUqNx4nM4Yk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:46:08.7171 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2677c8-9edf-4ad3-6ba1-08dd6cc061dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4171
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

