Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C38CC44536
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 00:20:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D2210E0B6;
	Thu, 22 Jan 2026 00:20:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p+NOGz1B";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012037.outbound.protection.outlook.com
 [40.107.200.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99D7210E0B6
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 00:20:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mcRmVro1jgpRZ6bW8dyLi/hvWUW7lxoE7C6cLhQiaZJblbFjhLP9Zkf37KzvqKtRlTrYJ9jxeZ5f+hmHOa9e4Wwj6CwA0xqOIKrYhgMmQCiX/SDzQ7B05oA6J4BelX4eIl1DgcK7VvrSHqQRuJp7NSR2fWmB1hu3Wfsm6ccs8Cx3wyN7xlbG+OIZpByLPLgA8vkJxhYFJU2YSXDlDTjuprUkXc8fpQKXsUpoPyb9Ez8mSa3aIOY8Lf5E7Kq8zpsc5LbUAmoqLaFXO2yJ++9B+narFZ72zPosu+ytfGi9QuD0ktUlsOlTV+ykOsIKj/nPDRRtePi6WYEuaoGcAmTBCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOifOJcbA+r7mFyVc+1Cishk8h4VvVcsA1CFC6E7F8M=;
 b=q2sAVHN4KI/48Sno1BqLU/J5dKVWSTlqMHkwbPn1qfL1VNvR1biJRX2BS5LNrxq0TZS99FdqXIzYFXNisjxSZ+a1ACTTebZWl8lFsX6flqh0wwGgNBsFPiRsL/kJhZivhiZoUCWQ6c6FQgrQdXq6dvYw4Gb4nSj55mnCFqEdtHMjhpISlTwlWG1RTjmkbERiHgREpibkTT9O7Jy9qorSK8CDROENXmsCrvyWFVBGqI5VzX4iGnv/Ans2zrsYAvVYEtYcb+sp8GXQCijXR8Onn+00t2MqZcqKYEbUQg+q7S5Vp8pHXMoiB91WNNO5YE3+CmjX+HA0zm8PVTI6J+YtcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOifOJcbA+r7mFyVc+1Cishk8h4VvVcsA1CFC6E7F8M=;
 b=p+NOGz1BQ4Bv2j8SYt3tV7w3mL6MrBgaAHrpVPlCalhQRMhCbwErKeuYsCO4od50Jxx1kAs5h9tMLUthFVklC6QccHEYbj9nBkIzBnqd0CAA0MdR1x652h/cbnB8kzZqkw9t/1DKGYY0PM+J9v/rs8s56hkeTm+2CgAcdUYmlI0=
Received: from BYAPR02CA0033.namprd02.prod.outlook.com (2603:10b6:a02:ee::46)
 by SJ2PR12MB9116.namprd12.prod.outlook.com (2603:10b6:a03:557::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 00:20:26 +0000
Received: from SJ1PEPF000026C6.namprd04.prod.outlook.com
 (2603:10b6:a02:ee:cafe::4f) by BYAPR02CA0033.outlook.office365.com
 (2603:10b6:a02:ee::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.10 via Frontend Transport; Thu,
 22 Jan 2026 00:20:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C6.mail.protection.outlook.com (10.167.244.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Thu, 22 Jan 2026 00:20:26 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 21 Jan
 2026 18:20:23 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <aurabindo.pillai@amd.com>,
 <Daniel.Wheeler@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH] tests/kms_atomic: Fix overflow in immutable-zpos
Date: Wed, 21 Jan 2026 17:20:06 -0700
Message-ID: <20260122002006.572719-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C6:EE_|SJ2PR12MB9116:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f0c4cc-fd41-4e04-cabe-08de594c0a79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j/7uLBIPcycAkvsyPRav2BHVwpSQqlXXPkU/j9F7UavliqoFxIqPt75ICihX?=
 =?us-ascii?Q?uBg4/TgyzUOHc/wUPUZkzKEpeaiaKbDJNWYCC1zUi96+LQZuvWnQIeqlymc9?=
 =?us-ascii?Q?P4syIcIuWxtlCMdbhPy9VPcNFZAmRP5IFIGL3QW0+AJu64K6dF8hVoenMmVq?=
 =?us-ascii?Q?XoPzgDutcDQMTvzKsBIyiQdfAYNNTcQWqgzafay0Tft1Sgrv0+yMbJdhBwlU?=
 =?us-ascii?Q?OANNpxuGRdQy4E2UMWy2A+IoMqllFJKk2RQ8koQAK1mkWVP7BB5AvP7of6AV?=
 =?us-ascii?Q?mU5LaFQDG3Hpy9JCOgH1M7tkwHO1yKmjXt+T8uu6SnuMK7wMz2SsZkGIBTHv?=
 =?us-ascii?Q?rvKvO0TpXrtfbKvhtl9FyocVTLnqElt99EcWNWxWW7c46leKFUctvKha6nMY?=
 =?us-ascii?Q?IoVnIh24PI5254fT6cIGGClQLD+lAXcR/GcDch9hAxmUvJqzOJ2DbZbSw+ec?=
 =?us-ascii?Q?ouARo6zLFDaFR4ieNK4amwpa69AZ0bUHbQaYALp5E4XTVLAfX6gH8ur3GbrE?=
 =?us-ascii?Q?/AV2Jp24NtsV3aG7nn9i1VTrdt2pn+8llAG5KnhzWULs/dVY0hfJsLXRE/jR?=
 =?us-ascii?Q?qVLKOZFCanP5J0nKqlRcIWve9QpI25/Lu5KNcQmCxHAElyzSopi7QO6KQJ4G?=
 =?us-ascii?Q?snpp3KiP66NezG9xNG2ySeyltpJfETEOrpfWkcAl1ck+Z9zfxHOJJ1FUxk8K?=
 =?us-ascii?Q?lNzRl3tQOTHLKWfBh6cCehLJBo8dOnDCYP9v3ZInUqYiTGV6YylQnb1MO1nO?=
 =?us-ascii?Q?xP9aR2BgBNB5EjwCssejL0cID0idMjO0zx7mj271b4M8w7T7iMbiDpTnaKJh?=
 =?us-ascii?Q?2KOG/Qi33A3o7z2QO18i20Euzb/uwWPT7s5HITvc3OC0smmH70mu/b4IMdC8?=
 =?us-ascii?Q?LN2/3F6Y/IyXNzf+2ss4tEcoyRpGWSbF0q3RYdl2153xUegjotxdH5KXrt+t?=
 =?us-ascii?Q?hxaFZzN9e7XWYr+TkKiE7FmNmuTxqjZAsyICeIyVYqJoszhEWPIm1YkWUGbK?=
 =?us-ascii?Q?yGQGZgRoFedRnv6clayPGqiAdYZJ43YqG/i6Pg9SIPtmbYohIfGCiYixntn4?=
 =?us-ascii?Q?h4/G/n5BbLI8j5JRl52g64mxyj/reK4IGhN8Ol7tvQBmW7z589uRyN0GMNIL?=
 =?us-ascii?Q?7ufH7Xc6n7Jr7E8XcqrM3WxMLlrX6gG3D3T+VWyN0OiA6+2tgaplJN9Bfjk3?=
 =?us-ascii?Q?hVQTfoIj7rAcMDENmU2AVeyuQlQO9O95nr1qGo9GYgBdHogu6+pLQX1sHS0t?=
 =?us-ascii?Q?2QIq260duaPND3YFO8xsgdHGGTWD+WNc/RwZ1/bAejhdImspK8lShWz2WQq9?=
 =?us-ascii?Q?3uGy3cIdDRg4wkNl3au8jwQU/Xycvu9IqluLnd9DRCI+1cX0/mUIqGziYv6X?=
 =?us-ascii?Q?hPV7txGJ5eDND+iA+mMK2iqrGnIWvpOLEgwRJCOHFqoNDRSovuHvJaPJjz9V?=
 =?us-ascii?Q?pRGxeVXdtjxfLEgLBG5kT9S06MyImJmVnnm/5t7ilFyHjIrNqftqImXPgoM4?=
 =?us-ascii?Q?dlUg68qxaP0zbqEZ1hcd/ePg9LWXSErDYFsfMCG2dPPylSu15SslcqnmGbLJ?=
 =?us-ascii?Q?OCXskxhXKcxC9B7eiZNn0FtLLoSo9JT5lxTjBGoIjESo/BJEC/8XwKL4k52q?=
 =?us-ascii?Q?7l9bRq/gLgoS18y30IierQcfcT8BZvwrJHIARe2Ry9eirjEgzXvvcZcd9iYy?=
 =?us-ascii?Q?sFBwmA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 00:20:26.0077 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f0c4cc-fd41-4e04-cabe-08de594c0a79
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9116
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

[WHAT]
zpos can be greater than n_planes so checking it before assigning to
plane_ptr[zpos] is necssary.

The overflow can cause w_lower and h_lower to be corrupted such as
w_lower=3840/h_lower=2160 -> w_lower=88491792/h_lower=88491288

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_atomic.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 58d57cafe..4614301c3 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -494,8 +494,8 @@ plane_immutable_zpos(data_t *data, igt_output_t *output, enum pipe pipe, int n_p
 			continue;
 
 		zpos = igt_plane_get_prop(temp, IGT_PLANE_ZPOS);
-
-		plane_ptr[zpos] = temp;
+		if (zpos >= 0 && zpos < n_planes)
+			plane_ptr[zpos] = temp;
 	}
 
 	fb_id_lower = igt_create_color_fb(data->drm_fd,
-- 
2.43.0

