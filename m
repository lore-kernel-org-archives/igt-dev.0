Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93D04CA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483A610E981;
	Fri, 15 Aug 2025 04:08:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SyTWX+f4";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65D6B10E981
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:08:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b4Kn+oKG8jEQhuCQJCAF+1xlablKk8pQeb7q/tEfVTSguSaeDdvDgQ/t2VdL6OqhytwdOLWQW7i5GRnmbzH5kfN+dgqbqomikwf/NNMnkJ126RV7Dp3xTxnsbzrx7TfYfm6piE4vgSTNC64Rmba9YfVPcFeD6smMk11xSwWKnEvVP8P80F+5m9muIXTF6T/PJMdQA543YROeOzV5RD0rZD2+uxZBy40DiJ/4+Tt6Qw5pzj8uHVfBofEKOLj3YV1m40jfeukuqn3mVQ1PEd8CVSgF/6qvctzc5KHn+xZ3x1Brd3pHdqjpTY5Z1HudN9sCqkCdFiVtdduMXJVqwf+Wzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oMYBUAKIloGqHkvNIen9xtXlDIxyRkvmqIJisHNjzLs=;
 b=FAMEG47KQxWJfSM9CAgfpDPCXIcEEGSP8h4KeNRacLsMr/Npnw8gqczti91KrTtAYIiIIBCJBMeu/tgw9h9cDAZx/rz8dru2djosZ2L53fey0SG3lT4yBzsuyX9MKFG1BW9FVsTv6IDc5AnmE2RyvL16tOgk7qZMxuNvyw664e2m7nXOoQ3V0rssIC0cqOekukJwohV6poFmSTjYl7qo3lFLF0GUmr3F6GKGdPkf1EV0AuF1kRwvcjGwfOTlGdq9ViL1L67BG/f+fJS4GyxpUqguWKyDRNd9P+3poAYPTdMBRxR3Q9+bpUaqTivDyFfR8pSRulbccDtqUjVYSgmrHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oMYBUAKIloGqHkvNIen9xtXlDIxyRkvmqIJisHNjzLs=;
 b=SyTWX+f4NhsDeqJOQ0MxfCTvwJn6Tz48jUPgNnJ7S4dv8ksp9v0gQIFDawhtOKV5k38rXYlQcqZV5WyFfo0QHchtEFZP8c+eT3F+PyuhZSd1elZBoqdKAPDmCc/rBTOr87EUwr152oPyiVPWU1GZYz8RCp0OLRuhvHysXlhCn8Y=
Received: from BY5PR13CA0035.namprd13.prod.outlook.com (2603:10b6:a03:180::48)
 by LV8PR12MB9153.namprd12.prod.outlook.com (2603:10b6:408:185::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 15 Aug
 2025 04:08:03 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::37) by BY5PR13CA0035.outlook.office365.com
 (2603:10b6:a03:180::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.6 via Frontend Transport; Fri,
 15 Aug 2025 04:08:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:08:03 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:08:01 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>,
 Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Subject: [PATCH V10 04/30] lib/igt_kms: Destroy colorops on exit
Date: Thu, 14 Aug 2025 22:06:33 -0600
Message-ID: <20250815040659.3321102-5-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|LV8PR12MB9153:EE_
X-MS-Office365-Filtering-Correlation-Id: ffc960ec-95ed-49a7-05d1-08dddbb154c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6cTnjVJo4/11Fz4ND8NRsZXxGnXJLS3SorjwmfnT3XiWh/NDccZdGGrLrM08?=
 =?us-ascii?Q?x/r3g2jIsxhaZRC5t/zhRlYA9A9K/OVJ9UNfu8HmsbSYiLw2Kua+Sl+oXFJO?=
 =?us-ascii?Q?6lpuO5oZqie7IQuxoJ4T7PEtOpstNC/c60SFbvqkDQIRMTeJUPVTl/x0x9Yw?=
 =?us-ascii?Q?F/L2Uc1IbEfJFOk70wD0OdI39suOPTFlsE6YyjRSzOPMJ4bmCJmTsU7r2/JU?=
 =?us-ascii?Q?Qn00jrcwbFD37++XbaQqmM7Qx/aLXPHUx7T4OE/t77ACHoB+qeprrWvf3fIz?=
 =?us-ascii?Q?EMY4k5KGO4nrluhtp0uUUdmVLCJYQQntImEOOnktOdjMcU6qHCt5qzvAcImu?=
 =?us-ascii?Q?6qkjrn+rAZuvLFep00NzxFMvWutnAVnVbDr0NpKBjGBeF4Uy/I+sMEeSUL7Y?=
 =?us-ascii?Q?DT+6Kw7ATN4DPoeKcx842Tkrz3yhz4AFqj9NhiY1ozCjSqlHF0szy0VsZHeM?=
 =?us-ascii?Q?Ga6ZGK4HKfQgY40Mn0Ao9e0+5CSiMaxhnbt+dmP7taeVwpU+bLTcaRrLw5rT?=
 =?us-ascii?Q?LpWeJ52NHuZQWYeYBktV6/QN5LYGmXzeuVjD2U9QV4HxvC3Lujhj9mxvrQI5?=
 =?us-ascii?Q?2ypBMm0a37SdOa5wxGVbx4fExPU0vevKq03DabQxfFN3J1IEUTM24QdYXAOl?=
 =?us-ascii?Q?xJttcFgPuPy+3D9k5utNqlCn7xZlPM4BhXvfgrDAL/nUL8oDjAlCbIEfpws2?=
 =?us-ascii?Q?nNNTPJl5Hu+s39vwIRtS3wusSe5IvyNJ9uOErrxF3HBqDBA57OLAVetVsg9u?=
 =?us-ascii?Q?flHit+e54Daeu6YEWo3UcaZDqZsvi+1PLaOHdCFZXZSNnUEbfugNBjlr9Bpl?=
 =?us-ascii?Q?Wp7Pn0oJxOOtihoJ57tQz5o+xThJhnHw3ujjcsft5qd3+TKIdjm0+RI/BeZi?=
 =?us-ascii?Q?BEDM4Kpxv0iLrCsnGKiL/IwGu4iRlr+rkglhxzAFyHo0vbhxzJbVFDBrTWzH?=
 =?us-ascii?Q?7OHtNEGcccv1amj5gAtBB4gUeJc9aAhjCTTXYv+N5ujJJZJyRHhO+gEajc2b?=
 =?us-ascii?Q?QtxFkBrFNyAhORzw8m9ktAA4KK6je6VUUhU62ZpP1/AAwsbfwPGFwoTHcBAm?=
 =?us-ascii?Q?17WGGJbNQsFXQ5tKa9gqb64VuQt9lafpAZ0EeuUuOVrW5qhnnijzluv3fdvf?=
 =?us-ascii?Q?+NaFRBhf7w5soAUnDiEZSUazlwsxWXOB8Vch01hheb8cBORkvEvFGlzU84qA?=
 =?us-ascii?Q?fX09S5ocpXspwO61pLKVmOAYUypkz2uAgfaZUyAUzpD5jt+HWJ7XPgQy/sSb?=
 =?us-ascii?Q?Aaig2YmHel5Ch+3SBtGY9KT0hJHsZtdGaCYEXd9E/REu1EW/Sx+Cv/+iR2os?=
 =?us-ascii?Q?Ne9MdwXJ+9FW8cK0iBMYm2rlM7ApNXRhlmwUDdofPkIKuDrcQ61kWW5otn1Y?=
 =?us-ascii?Q?Rm1LiInkzOTRZOnGQRVO3U4+ruZXs6VVm+ZdpGuR1oAYLuLhGbnAFUew6oGy?=
 =?us-ascii?Q?Vzv7jxbntJK+6JlLQKCh+TSEuDQouQrWWYjJpBcRoFb0JZqWXmbwuOHJHfws?=
 =?us-ascii?Q?XXIKop1Txyfk12BBowerJK3cbn8AoYGGHOq3?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:08:03.2721 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffc960ec-95ed-49a7-05d1-08dddbb154c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9153
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Free the memory allocated for colorops on igt_display_fini()
- Disable COLOR_PIPELINE on igt_display_reset()

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 69beb523f..67be5240f 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2708,6 +2708,9 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
 		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
 
+	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
 	plane->gem_handle = 0;
@@ -3436,12 +3439,15 @@ void igt_display_fini(igt_display_t *display)
 
 	for (i = 0; i < display->n_outputs; i++)
 		igt_output_fini(&display->outputs[i]);
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
 	display->pipes = NULL;
 	free(display->planes);
 	display->planes = NULL;
+	free(display->colorops);
+	display->colorops = NULL;
 }
 
 static void igt_display_refresh(igt_display_t *display)
-- 
2.43.0

