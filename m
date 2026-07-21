Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93EE4C4452B
	for <igt-dev@archiver.kernel.org>; Tue, 21 Jul 2026 19:56:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3951710E3BB;
	Tue, 21 Jul 2026 19:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2m9VjulR";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013002.outbound.protection.outlook.com
 [40.93.201.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A018C10E09D
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Jul 2026 19:55:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DeMEagSLXxbXZ3roCABs/XCCAF42INNgmY5KLVZiBVmLuZJSiMXSBwrhEzq6+0K53LDbQkBSXXv7tQbtSV/K8WAze63kDM8E7jBQnY4SjV2AOp31BFfQ83E++luiXRqwZeee/6nG5Ze7191eh+rRp8gd9aJdG73cRatq4e6t6SpGjHksBGs2k7jDI6U3J1smYxhlDE1j1CownfaAcM+l/hM9I3J1azkrZBGemX/+CgeHe4juHR6IepM5m54BPcuP+yVfA0iuEMholJlwWKDk7kAsr1XB+8P39McxlRjCC2hXQkm33ZM/6GyEuTkrDGJptxiH3KpK5nWVu/30k75zpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l5LkjoTngJfnXpesW0y9xHEF7mgtV2iG5FlDC9OccCI=;
 b=D3PmwlZGJeUCN/0+HRMC5iU+/bbmKG3FkMEjBvIJy/g79r8N0Sui+zsF79c9z+vshrVEfw1fDQfT7YBfkrmkxfexoHx2W30fL9Mx+P4+jhVdyh3pa8MFkofCL0jqQC8AgAPdaAI8m2NO9d6QTSnYIzdM3GN9zq4kaMzJGROaDP8p6Msp0p0zGsCVRrL2u33rZWhz7ADmn9hRlb7iFEtD2ZUTTCD87eVx7v7iUK8ZeOb4cfjVLfcjTASYeDFTwJ58V+lT9d6JKrA9XPaiiNrFneNPg5i1JumCWRngan7cF5EwP9ptHeGazhrTJA+Nu1cZGhoqSdPM0aLAM3YBOx/Mbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l5LkjoTngJfnXpesW0y9xHEF7mgtV2iG5FlDC9OccCI=;
 b=2m9VjulR6MjLOaLZUKph/rUJ7Ccatisr3WC6OqX6ZBMK3hD4BSq8Ue3EAQ3wMNgF5bIgIrLE/HF/qdg6AM4YklmuTGRyk1Uuybhfd0KNnmGwb3+I91jD7JLln7ja/hFChT1aNRJ4sk69sMkU0byJqsE5MKwrDy6b0Xqo3aWldv4=
Received: from CY5PR19CA0042.namprd19.prod.outlook.com (2603:10b6:930:1a::26)
 by DS7PR12MB8232.namprd12.prod.outlook.com (2603:10b6:8:e3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 19:55:38 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:930:1a:cafe::7) by CY5PR19CA0042.outlook.office365.com
 (2603:10b6:930:1a::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.245.10 via Frontend Transport; Tue,
 21 Jul 2026 19:55:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Tue, 21 Jul 2026 19:55:38 +0000
Received: from jzuo.laptop (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 21 Jul
 2026 14:55:36 -0500
From: Fangzhi Zuo <jerry.zuo@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: Mark Broadworth <Mark.Broadworth@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [PATCH 2/2] tools/amd_hdmi_compliance: Fix for HDMI Compliance
 Automation
Date: Tue, 21 Jul 2026 15:56:08 -0400
Message-ID: <20260721195612.25545-2-jerry.zuo@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721195612.25545-1-jerry.zuo@amd.com>
References: <20260721195612.25545-1-jerry.zuo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DS7PR12MB8232:EE_
X-MS-Office365-Filtering-Correlation-Id: de873785-79be-40dd-eacb-08dee7620951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|11063799006|56012099006|10067099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: rveJ1XIXx5+5oXi8R4yMkTsPuyzQ8scoUkya60TW1EFeCunu8xrkB797a3U/x7apmNf0IkkBu1a44ILyxpbPIEITCEHlYWhj5th2dMeOXCB85ev0EGNi7HNvIDkCMbUqnwQ9ZaT1V32DyxyC32h31997HpIt10osh0RTjEzAIdm6k+Tf311IJvKYyQ8nlMmqTWWJKYTgsHUcF99//DgK4M97qctlB3Yz8LjYPoiUBlGYcw53i07UmDcxviee/9kPCOWMxdfLBTZfXiSLNbxRK+kaUBuX1nmb592/WRBqkLUAWlArkoYFCR0vugKxxTPt1KSRakEmSbl6XvBqA6+aj69BaQPulx17kJ5S/HCKbxmRxMok2BNHyU6ArThKqHVEBv/XZN4E1a/cq/+90XQkmDO841lDJVeeAq7fUW80nhil7hq1epv1nMcIHkl2U9x75zT+ubeLByqs+9+PCGPh86JUBqBRJQju57N+dnLCNTrlhfI3wL/QiwjcUZkYNzW9/z36hrbyexzjg8kro0juKVaPPZQswSfnzqzJYU5gQGDsjzVRn5wVbHZOEOZZa2Hb8ufcBXHdI8FD7wvo9gkmB2KBae2cyNUIPUhDN8pJA66THLh+OW7LdYlUV3XbuMJwIkExOTbNbVPZKL5TPaKJFj0JR6cQY4Xhfc3SG2/qO9q8I0M9kuAVw3VXkmYDNNREBcPPTnxOJJaqj/Upd0FUqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: IO0z4KDNbgwQl3SUdwaXnZFk3/6J/9bUUa27jNw/27mx3Ppw1Wndwla3KsArOPhnudZll6UKg2P1/t6J3aAz6bTHUEMv6LEkZVuHo37fsNuTm9UwNCUYG8viaKkQ4fWqQL0FzMhr1cIwcD7RvK2lGWHTDZEw7X+Jzw/P1v7FFp5y/hug0jmwRpJIGVwMr9l6Vo9vaoCsOt0qRvVbJNLHXtIjXDj4CpV5+alw1kP736fsenfIo4bbELjd4vwXeS6N0932Y2kkthxN/itNbEpWGI7AGw6vYV0daDIoMyG06lhBbfp0JYyDUa+GLm8ZwBXB+SE9JSM0XLJ3HdLz84qSB67szil2aH5efh+53hDxxRheLWNYTgEa6WOGqpiRlw4OH6MiMzZ4ahXyBOBmMcPdSGHu9WCKd965vLTFXkADLzO+kmiLqwZAb5M8b3zSrzIp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 19:55:38.1496 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de873785-79be-40dd-eacb-08dee7620951
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8232
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

From: Mark Broadworth <Mark.Broadworth@amd.com>

It is to fix hand shaking issue between DUT and the box.
Need to block until SIGNALRM triggered.

Signed-off-by: Mark Broadworth <Mark.Broadworth@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Tested-by: Mark Broadworth <Mark.Broadworth@amd.com>
---
 tools/amd_hdmi_compliance.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index a60176c0e..2861b440e 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -903,8 +903,12 @@ static void test_vic_mode(data_t *data, int vic, int conn_id)
 	igt_plane_set_fb(data->primary, &afb);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-	igt_info("Press [Enter] to finish\n");
-	wait_for_keypress();
+	if (data->timeout_seconds > 0)
+		pause(); /* block until SIGALRM fires (works when detached) */
+	else {
+		igt_info("Press [Enter] to finish\n");
+		wait_for_keypress();
+	}
 
 	test_fini(data);
 }
-- 
2.53.0

