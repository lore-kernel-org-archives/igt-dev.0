Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC6CC4450A
	for <igt-dev@archiver.kernel.org>; Fri, 17 Jul 2026 01:33:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA82210E3DD;
	Fri, 17 Jul 2026 01:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s86mbFzS";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011070.outbound.protection.outlook.com
 [40.93.194.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6515610E3DD
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jul 2026 01:32:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wspZcjx9S0lBWssnUI0Oiw7cYMEtey4BfSqkLdoOpbKuuMf+z3SJF01t1yIGU2DHK5oB/HajUN72QaPsQG7Wf0xE3AQcj+H2jQbbfIizRmu46wgTtuFqfSR3opREQhELZXMIG6C2KfO3dalcFLF4AiPCIEP7FucsVd/jvdFtbCXO//5AZpF+GZmEsRParFTVm298tEEunlxS2lNDR6xUNxQHOTWshcP8XAoXOiTKvwc3AnMLtHkAyhX0uPwV4uwUZHmM2KCcwkEpVaeqPYpu+DcGAdkYd9TNQHt/zgNGcLDdFszRDxMB2G3z1t+HQxYfxOyEJ6nfzWx9xufHNuWQvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9claKGPmv2tMmjI1Vux9YcGomrlnuhQJGgPCsPZlEE4=;
 b=wPAtnNT5mnbRjjFbxEdXF6VQuuO6i7aaYjqykASBDLwvXykTlJWqOqedEk1+lxTVyKRa86GBrQaVqncul4jcLk3N2mUQ7uU4xA8yqlYIJaZGUWnpr01B+GKPJeW2ysYCxw81Foxd50jDdfczkiZqysL652ZzQ3xRddOUCHSNuhzfB8xFUVpZcR5h/LwzVzQmYYfRqNdouYFzs7G28v0FjMm/WcL1572oVSxzpN7pblCaDxNFAe801b4NXfWeXcu3SFGLaKDhG0pTlI8wvor9Ok/nR86ozlvOEquUuOVJZCzjj1q4aAvlr9QEv/iScbnGtim/9c+0iwI2iNh10I9TTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9claKGPmv2tMmjI1Vux9YcGomrlnuhQJGgPCsPZlEE4=;
 b=s86mbFzSUfo92LaX0KN5oCi1vICvvwkcgrnyq6OLgwk60jZt00DayLq1niVGimuEaf8LgNKPCNyYNXoGtLLDnpQ2eRbrSt8TxkShPMPvhvHt3kJsQMbdt2uUCWyW0e6aPRNfP+IrIv/Ov0mhsXd/gyPDkXqEU8YS8veGqY7OD6c=
Received: from DS7PR03CA0085.namprd03.prod.outlook.com (2603:10b6:5:3bb::30)
 by CY8PR12MB8213.namprd12.prod.outlook.com (2603:10b6:930:71::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 01:32:51 +0000
Received: from DS2PEPF000061C5.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::8c) by DS7PR03CA0085.outlook.office365.com
 (2603:10b6:5:3bb::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12 via Frontend
 Transport; Fri, 17 Jul 2026 01:32:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C5.mail.protection.outlook.com (10.167.23.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Fri, 17 Jul 2026 01:32:50 +0000
Received: from jzuo.laptop (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 16 Jul
 2026 20:32:49 -0500
From: Fangzhi <jerry.zuo@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>,
 <aurabindo.pillai@amd.com>
CC: Mark Broadworth <Mark.Broadworth@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>
Subject: [PATCH 2/3] tests/amdgpu: Fix for HDMI Compliance Automation
Date: Thu, 16 Jul 2026 21:32:37 -0400
Message-ID: <20260717013237.2566221-1-jerry.zuo@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C5:EE_|CY8PR12MB8213:EE_
X-MS-Office365-Filtering-Correlation-Id: 309d41fa-e129-4aab-13bc-08dee3a350bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|6133799003|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: eCxgmhz2+Ny1pGgMWEEx/IFRZ8rLS/lrqNTXpCitrGF2yMOM1kkM8HnwS/QDLbrkPtT9hIDo6iuUek45zNAafvEGIxPDjVR0VSQpOLO6vrg3Gy2VkOUAQzGFP+AjOljC/ZAQStPTko+gkdwuiGokIa8MC4jcOtNeEAczIEd1/1b64rdj6UCEujTttHpPDgbFnORKfi27mZext288cCjrIExzMfVuvAkL4sB1f4sSAZsBkOWzeEeb3dla1qSte9zOvB3Nr2/TwfFcCq116ODKoca8dJ0OMHKdvgd1se/dQlXs+LIOs2m14ZF0V8DgUWQdkptKOqEqQII/IdGvmRE0sNcsFxjRgj9mNb4nufvFg3Po/UMszC5sMk5pz1H5NsLRABxgN8MDKecaXCSAmkSpW7teGBt7EX1FHekLlgxRRTlZEcKRzJA326vBZNDauYi77xn65ZWsAF+EVgtZRlocRYnFe8VAYakTf2NynDX5iaWe+iFt/oce76vc63vCypjbYdp5nzHYh9X/io0inxiq44lZraC9mYXdcJ9DEADxE9qK0QOjOa6aE3iUy/Th8WO+n78jVcItshp3flUUHy4O4+ko1wbU6x9j3VwdH/NOPrBNx5vQuvPfhtBmONWn2HCwjQ1469fOCy7mMEddHjRdtCvJ4rMV5z0bHAh6+K+KQungaHBvd68WT4kQbPPcMZCn35TWRkaKDyHcfV8qBGHntQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(10067099003)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: BEsg0POLuD8i9SfHH/JvY6jPnxpYOIWGKrbLYZp1fYfogYba5Xnfbnwv2QcsFbZo7fXV7nl/AQssWH32LOOVW7bPI7+LftLnlIUKZAlO3q96tczNe6YnBAW8e7QQnzZSuoq5zqp0dyBO0z623Eiy2NzyclhBqOFEEP/6kawS8G19xMsaxs4TqyzFjcllbmTRAg0SMZ2Jt8i/rBBAMMWuth7lUPGcHh9zhTLBniTipOsDBTNuEh7mMVAxDE/K7mna8ix8vZb2fjvqJulIgCpf34IVois0BESjET+/VaPP9JAPSLk2HSa/H4kUPForCG8mIHSfC/3jXmsQYA50a3zYzQmDS/6ClzkS5qrpzL67+SvScfE0i3ECZTpROG/iIAxLwZxdoC9eoYShpXPgKyS8SEDHtjAqrsGRS9F2aIm8Y7Cp364hxNY33rWVKx7SBK+B
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 01:32:50.6436 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 309d41fa-e129-4aab-13bc-08dee3a350bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8213
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

Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
Tested-by: Mark Broadworth <Mark.Broadworth@amd.com>
---
 tools/amd_hdmi_compliance.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index dc24430dd..14f455320 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -915,8 +915,12 @@ static void test_vic_mode(data_t *data, int vic, int conn_id)
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
2.43.0

