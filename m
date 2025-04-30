Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83BAC3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:40:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F7B410E6A2;
	Wed, 30 Apr 2025 01:40:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4ceGvB3E";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2071.outbound.protection.outlook.com [40.107.243.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CD610E6A2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:40:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YSn/bVaMcHuIUmFXo/oomn3r3RiGdS4q7Lu8zVXZ7d5918fGEc5dQWVFLt3RxP++4BlfAvPQ/d/Untad1wgBoT9jkSN/CnK2sMlUY17p2Mj/Jy3wjX7aE/z+WHtjwFLHLf9JWlggv4PlxaGYGXFMJ8EXciMyEF1LCSg+UawfJs/PMjM86po3oGgTnE6Qq5ZvniETq7n+IdbObm5PQr/Dqf69xIyiUtDP4UxUM7xrGMDwMBjdI0m1HwIcNeIkDs4g84tGaFaS503g8kOE80tZg8EO7ungzl3uElp8cygNzLtju/hXCt1X0NYFJQeniWm6tVQa9zw0PnVXPH+lXPaOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wcu7lwYzMUZZbnaFEpliFy3d4nbZkSGcINHHPmqplus=;
 b=XRP9ZNgf5W/cuWHLdnRtINvrflAsHPsVYouM2f30xK+lFVkMtGbRd6R7Qy5DAX4LSA8lX8sdU3wy58q3sIIbwpQyEzqPbXfsyLFQ5oqhJxzcslkDgWxKuoKJNyH4JGSbo1VSViTAiI3BLk8j6Dd0UV3rSPuImpG3gfTqOsKw1kTrgQHWLd7SCWfxQs6v1oxCyK9AD2/FuhkyHuG3wGFmMkasRsYaag/ZKTTh44zfB9MklZOFmCWB7ozaPKKW/GlEt0RGnsOZYionIwE+8Xc3Ey/9jNj6IdHe7lBp3FzQj3ci8lsYDpZK8T6xh0abjgK0UrttbLG0aoYc4wke9KXtLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wcu7lwYzMUZZbnaFEpliFy3d4nbZkSGcINHHPmqplus=;
 b=4ceGvB3EV+f9SRD1wCTfhcOUKW6F3AE7uTanbe5OehwedH9MxDKInp0e7wsbdZJkQTnCbUee7DhAVpIDWcWxR383uKjOCCHJk+/3tRmpDzcVx5ODM4/7VwiaNFReSlzVY8V4gWm7xDBf/SnlUr3O69w8L7keCj8vC1EJO2XNOgM=
Received: from MW4PR03CA0208.namprd03.prod.outlook.com (2603:10b6:303:b8::33)
 by CH3PR12MB7545.namprd12.prod.outlook.com (2603:10b6:610:146::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 01:40:14 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:b8:cafe::98) by MW4PR03CA0208.outlook.office365.com
 (2603:10b6:303:b8::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:40:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:40:13 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:40:12 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 24/36] lib/igt_kms: increase MAX_NUM_COLOROPS to 128
Date: Tue, 29 Apr 2025 19:34:42 -0600
Message-ID: <20250430013454.226910-25-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|CH3PR12MB7545:EE_
X-MS-Office365-Filtering-Correlation-Id: 29e51f3a-5f91-4b9a-84ff-08dd8787f3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z5ouJcKjug8HiBgcOWyYywtmTIN4Z6ma1hhIHLskjSxvnyrPPCKJXfQwn6Vu?=
 =?us-ascii?Q?/XvgiZ5RvinQc+tRk/t2CRkAy1gmHDd3Cc7pYv6jlwjQXvCSegfbO69XMlnO?=
 =?us-ascii?Q?CC9TcAwBg5Fj/FmI5HTBSTOVSi3BdmjESqKa43116OxYIdk6GTwqGxQPtWAx?=
 =?us-ascii?Q?rDxypH29PTdjonCRHGkZoeA6knno1kpFim+6NjngKysv75I6xpBmmKu/KDua?=
 =?us-ascii?Q?N0BT0WP26vWVclRX7Xl9hUI3/QiJiDi0isvd5Sxn1ZrXOORTzjS76Aak5Qpi?=
 =?us-ascii?Q?iH0wFo9UAtwjf71FRyb26N0IOWgZx7ii7bBtWxHUm9FwJTpCNMlLiDzVzQ1J?=
 =?us-ascii?Q?B/MzOPc9dLp2lKv4H9VCeAT0Ft7gMuf5KFFAZ8lPa3OA350mCb+eNLSu7+5T?=
 =?us-ascii?Q?bo3ourniR+QWAuBonSsvLNXWNRg1AQkzsJCW9elgENwmf9RgAKQ054nYn37q?=
 =?us-ascii?Q?3Q4VwTX1gvCZNHkLTAiwz8cHl1mr6C1hcRbive+HvS4xEm92wuk+2xK5zA5B?=
 =?us-ascii?Q?f9JzV5jK1vMyuKWZj1EKowtd/blS4PvHOv29Hz9NaGYps3IyHKu2H5x8PkLR?=
 =?us-ascii?Q?nK8xGpIbKTYRw5zKa7OqBbsQQBF3kFS4jRQRqL+rgN0z6buIxPvBsE4nb/Z3?=
 =?us-ascii?Q?cJORrDiNeoZfGKg7H9a6sigqV8TsnqXNp6wYSKU1T0upSuAFBestfeP32wG0?=
 =?us-ascii?Q?5+QnzW1o8yrHe8r3hCMwaGiRokWvFSx5AvvIgQinX4y4y5a4PJ2eJQu/TQVV?=
 =?us-ascii?Q?D688FpbqQ3Cu7K9oX3Na1oOhPjkqt7fBm0fJ0oEwd1n8DmW3XgwGGBRPdlEF?=
 =?us-ascii?Q?Ty4S6b4dUFx4MVQcj/b9bkrPABEOrcuEYSrBCun4m7GBQ9qxL3gHfMDMeHQz?=
 =?us-ascii?Q?FlA6tvocmTl9ND7f2KidONm9bXwcjmp+dr2fqsgHazGopoY2hy6cok8lrax4?=
 =?us-ascii?Q?OGgusavh79LPfZ6K99rN8JveHA+W7aU6jyq3BKlNgczAj7/hW7nJun2vMLTA?=
 =?us-ascii?Q?gRfp+065JOw9azH1oIcRY1/+g6Fezn9xq/GPdONJ5GS0DJkAUpxtwfxrFufS?=
 =?us-ascii?Q?JiF9AiA9kVcRu6P6+YzqLKKUuqlpFd3mvBDMfCU4nbKc7Z5lvDCWEGcE1pWG?=
 =?us-ascii?Q?7rt5YwqN8CIgTPsYZQQALtFA0S1yTQSitFZNfDONldME7Q6HJ47G29qYpITH?=
 =?us-ascii?Q?T3gLOfOlDbC7cDPaCdL+PAuosHing7e8olphVOOUiCOJWIO3HUH5jWRe0CoZ?=
 =?us-ascii?Q?EeaeZTNttPcu3sgZsYo/hkAAG9GU+NGKVHKtbAzd7dLw+4wDM9wQtm1yttwg?=
 =?us-ascii?Q?OcOgQbd1ubqk+adRaC+MORn5hDd6KfBusAJjcx/iJ4f2zSPdxiPUgEczCIKL?=
 =?us-ascii?Q?tgCF+t5GV45lfGqEBjMZqzRR5WGPDjjdCB3Pr5EZ89H/RvHMsjfFo+GuGT5C?=
 =?us-ascii?Q?8zYUN4KS9yyMqJc8UncQH6nE111VZSuj3fz9hzW4WrdeYBshltzSPIAf7StZ?=
 =?us-ascii?Q?SQELcbmpqt19uGFnYxeO3FAjinrfsdLhqFO1?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:40:13.9010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e51f3a-5f91-4b9a-84ff-08dd8787f3ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7545
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
index 55069c6b5..4b8105c94 100644
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

