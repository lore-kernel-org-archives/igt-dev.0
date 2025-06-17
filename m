Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9D8C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:41:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 026A910E4C8;
	Tue, 17 Jun 2025 04:41:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2MKfyjWn";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2075.outbound.protection.outlook.com [40.107.220.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BC7510E4C8
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:41:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rul+oyDxcHDfgWSnZZ1sytuXryYGtIoLSlsiP+rN05OidYDslobkMEMkXlInDrhLgXMocabQqjH4ndGRprjEgSRpwJbnkn0zDPz7eugIIH9fjjiy0lT6pJbffuU0+06aAS7zGe4ctLGO0NPn+twJPxqD26PuAi61qvwm6a5iAYQDMFLPacQRRA/rVzQzQiMdM0h83CdJOOO/NwDiTKNVmpyAdTOcTW54LnDgQs4WUatrmjA54wgfpfuehvTdC90mBLe870yJ/TmG5+8aEcKKjj7rJnxOMohBdaUUD0D9sc6cTTLTdR2ycyzWwAFZfrHyQbCJuS2/+MEKyf734HtfLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xFXF6ioPc5Xc4kXmrqAlLk/H+4uaYaneRFOD1lsgNs4=;
 b=HZ4Aq4CmWqEO+IZ88F7CcCRITgVimXLxo4/jE76011f7uGEgEtj37IygENve/6rlfCDqoEdqBwuPCLhusyUJRosFEGO42RasKPOlrY4Fhl6SHUmaQ4NV2/KDQkv4zZm+wVm1iktry8Pqh4pM4yLnOZhk8TenoisnFJcIMTaTaHfWWfWFKmahP7hIe+2CAUq0hQGEX8/FQG83A/JUcR29gXz8TP7eE9dFcOlg7uEz5z0Tv94Lb9hfC803DOJb8BxXzdwa/boo1gqryXsKHmpWefuhn6fXRBLdSH41PebpAsjkiOUDv+B93FnCoI+hMEiGDUNhklyXuJLTxBuyF80Eug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xFXF6ioPc5Xc4kXmrqAlLk/H+4uaYaneRFOD1lsgNs4=;
 b=2MKfyjWn3isvsqylZ4FWzDB0I4/5tejEVePTaih8drF6TTKnwSiQLyZesJRHvaKkAJPR+tgrJ0qtlNn19cUgspiglsDU4iLOQChUhnAuXfycHnIMoWsVGQ18dHx2rfPBU2EtF0Nr91Rhxe08icAciHG/JStwyKY+u1WlAOCM46g=
Received: from DM5PR07CA0079.namprd07.prod.outlook.com (2603:10b6:4:ad::44) by
 LV8PR12MB9418.namprd12.prod.outlook.com (2603:10b6:408:202::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:41:34 +0000
Received: from DS1PEPF0001709A.namprd05.prod.outlook.com
 (2603:10b6:4:ad:cafe::14) by DM5PR07CA0079.outlook.office365.com
 (2603:10b6:4:ad::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Tue,
 17 Jun 2025 04:41:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709A.mail.protection.outlook.com (10.167.18.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:41:33 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:41:32 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 24/36] lib/igt_kms: increase MAX_NUM_COLOROPS to 128
Date: Mon, 16 Jun 2025 22:36:19 -0600
Message-ID: <20250617043631.2920587-25-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709A:EE_|LV8PR12MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: c2c5edeb-8bba-4f1b-f16a-08ddad593cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XVa0rZ97nkR2jH0Eeq5Vcyrnidx7lxA/XXMYVQj5ROsdPD8Oltb0W/aM/RpW?=
 =?us-ascii?Q?zTg96OTxRHeh2TVXuiIUWOSX7Gle0bQE3ekvI1phzMd9+N9jMm/acVFqVXox?=
 =?us-ascii?Q?PuOdqaZMAYKgIYWiYaIBI3TschIkVVKronfA1H5X3Nl6Bfj6rqMjCO1/ZTrS?=
 =?us-ascii?Q?7C3YtUi1xrULjwkhc90TrRCcAJe89Wug4lmzMdNPFyTn2ZP6q7HhgpiHItfI?=
 =?us-ascii?Q?6dkARUVo4NU5qIssDmJWz7BEDlu88/PW0nUmZQMSe0ak0khZKyQ3X+TgLHhq?=
 =?us-ascii?Q?LTDmV6jFMBzNieTSFnzAieqyUPeCspkyaUItgbZbVq2yOMr1HXBYv6EpYonj?=
 =?us-ascii?Q?Rzdsdg0o+gxDIpnRRnR1kDzJkshYpFnPRObfOGuF0qkxN9R9at8jIpOZWdy+?=
 =?us-ascii?Q?Hm6XXNpVZZVjPFdH78WquZWCzpG0CfHk9ck7Pws1iBdE0XPe8esOXWWorZJH?=
 =?us-ascii?Q?6HmnQT9uJBafALbKMUpgrgR7BQG685NgfUrySLu5M6rqPxvHzCi+bXdudVNN?=
 =?us-ascii?Q?pq/Hl2gNdZ6J/RAtIUmGVEalXGVReKbqLCuKzqikRWS2OgPfyhGu7OrlAuWX?=
 =?us-ascii?Q?ptyhscBrtFkfKajdeVYKQLJGzVZbDrEWbo/q0F5uMf5hdWP+m3DHdLPb9BXu?=
 =?us-ascii?Q?GZ73yhRpoSIBDcQwlT1/5ejilspcEC4FeD0qeTL8Z//QAlqrMuXaBaGDq9Jb?=
 =?us-ascii?Q?rRDhcKzXPOKGgIJh8ssSoV6oIhZ8NzBxv6aq6pgvtZbayFf57mkWgzAQkrwd?=
 =?us-ascii?Q?icTSqrIBYc97AodcW2mjI3V6TvJwH0ipUJAhBoFTkH9rZ/5oligP99ft8J8R?=
 =?us-ascii?Q?OFPCRV2bAkD12WT8WGOObYONRrt9sX8fl9bRokZNAdM3YNu2zW7LbIMtY4Xz?=
 =?us-ascii?Q?1pmRH61GvcDkdai3H8MqKR4B0wuSe9Bj86rGrFJHol0HUihi5brHINPBnNxd?=
 =?us-ascii?Q?2rc0BJuJuWXQ+kH5YsSov4Sjp70R/9sZmNL+1P5MmKQadkj+GAIn2DMO3DB5?=
 =?us-ascii?Q?kp8QEhMzx91E9X6o3f6dIyLd7d0/Ak0qQocKQuUq+jf6nJX/oZ5Hup7abwGH?=
 =?us-ascii?Q?u2W9gJ/LShpIoFRwCmFD3EzQzQy0sqLMs92EpWAKA7QX1iGIxTQNA57V66xc?=
 =?us-ascii?Q?iVxfnOvfov6oMi0aQElVwd4jKUcFQ8qdOjA9Z3bzm3BS9b0LnryZYv0nLGey?=
 =?us-ascii?Q?Xp+4CU1Z8c9TJRTtxBRy3o0K6LrpYcHFaCokN99rfE3oobWt2AvC8iOQhZyx?=
 =?us-ascii?Q?RNnnTECe6Z9UaFVCSMhVObBOglml23p2qzgDByqYbYUqaQbLei9HGF+lbqkZ?=
 =?us-ascii?Q?mMbOA0t1rj4/D5/caL2Xpikn5tAYmDUN60xYrR5HxVFH3JEmsOssx1/fOlZ3?=
 =?us-ascii?Q?nrgKUzhH5vRJ0oNEDPNAfILtzIVNvJFRkLGO3eu3wWfiw9tfNAMlv1xSoMJn?=
 =?us-ascii?Q?vC23Oa94oG0ZEHzYMqQqEtkQYJwdmhXN9r3HonTmgdWFRroxo3KCST4kdYkG?=
 =?us-ascii?Q?uYeO4Yl97ORjLHtAscYgGdkqWjgMS8gtNpPS?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:41:33.8912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2c5edeb-8bba-4f1b-f16a-08ddad593cc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9418
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3cacccbaa..46b5ad8f7 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -92,7 +92,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
-#define MAX_NUM_COLOROPS 32
+#define MAX_NUM_COLOROPS 128
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
-- 
2.43.0

