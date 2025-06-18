Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B52BBC71157
	for <igt-dev@archiver.kernel.org>; Wed, 18 Jun 2025 23:03:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5083910E972;
	Wed, 18 Jun 2025 23:03:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kCEDxXLn";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A14910E972
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Jun 2025 23:03:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KfYWV9xgHm3rRJk3/Pb6BFd5OdTnTubhZKpxIY0M+PpUg8UNONaXqvRhQS61qD0GaEItMj3KzlTcpJMqfFPO8bUtt6/QKYIhfahgJqf4tIBXOcOdOWYHRP/gj7L1pMAXl5dOPwlSCd6BO9z9ov+A0VTD+lDCdx19J5qtKEFuuMgGkfe+xkXJkXlgQtCGFUUPlZHnuS/FRJgpmF62bQFjmiz4U+vhdxFQgy8nEvNht1p3+XEmXk4txCi3CsQ/lf3QIdwlR1YoWfE7VheFTyXevGoy0CyT+CLcRm93bz7MaJhPLlZ9+Ld7H86Xcf7La5pjTcJ/rTz1OULH4X5qb8pHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gvHOVOq+UXjil+NqfdRAj2t1dfbbHSyKGLDqrzHfKWA=;
 b=wZkkzOt/CDB3ni5j/OlaPdc+oY+xXp2XtpWEvOC96remXpeB0r6Ad/l3v/JpZJAffia8Sikk39GAyN6cyiiMt7wEX8uuameiACIaUm0dtMW6zj50GmjOBqikMYjGrDFmOC32dFoJM2m2+MJlufWHG/Z2a+uaLop128W8Hn6jH+SqDlz58n37gRLm3OypxwXWcJlNFGHwX052TbKprXZn0V8uxo06hhWWwf1cZjrIfJgc/CTg7xTwO1rJ7a6iMCjXhcWLInED+iju2q5Mlau+3t+UPeCAKLOsJbQeB1IfLhGDPOOG4cdgzhQDOX6SU07Ooopk1pAexnbTplkMMqvz6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvHOVOq+UXjil+NqfdRAj2t1dfbbHSyKGLDqrzHfKWA=;
 b=kCEDxXLnWVd0Ep/fIiTrWJ7oIzdIBl56zLOgmSs0RJwMfuh/rjwJ7Ag/E4bocXouMJOuWyHjF0+ZBpSE7mWzSaW51YPDpeXuRi89kJmuYv7IKcS1SWFQhd2J0qFnYWzTF9mebwy3FWrUybSINnzg3SVyN5MGN8sHLC/FM7x0wV4=
Received: from BN9PR03CA0868.namprd03.prod.outlook.com (2603:10b6:408:13d::33)
 by BY5PR12MB4067.namprd12.prod.outlook.com (2603:10b6:a03:212::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Wed, 18 Jun
 2025 23:03:06 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:13d:cafe::83) by BN9PR03CA0868.outlook.office365.com
 (2603:10b6:408:13d::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Wed,
 18 Jun 2025 23:03:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8857.21 via Frontend Transport; Wed, 18 Jun 2025 23:03:05 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Jun
 2025 18:03:04 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH] README.md: Update oneliner build command
Date: Wed, 18 Jun 2025 17:02:57 -0600
Message-ID: <20250618230257.1721932-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|BY5PR12MB4067:EE_
X-MS-Office365-Filtering-Correlation-Id: edf83c4e-327c-4144-3b7a-08ddaebc48bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r3Hw9VQbQeB4+cS8QXbHF6WiI++F1Kq6YnLdPkBZaWAOrvWtQUe2howE6uY3?=
 =?us-ascii?Q?UwnBna6DFsL70OsajNzqAWmUBWT4zykKX4tInhbkHpy6ueC2/haEBEcjzmhe?=
 =?us-ascii?Q?dd0zYq4MWinqIPHGhCRQLxm9pRQhM7gV/OiWUEpn/GyLbn/UT4HAu/biS6pZ?=
 =?us-ascii?Q?t14zrIRs4L1pzt4N/zZE3bZzQM1ZhLeN0yHIG9O4IIH1rkXt3+avtItfP6z4?=
 =?us-ascii?Q?I0YUk6I7toF+vcb6CC2PuncoBrlDiQickdwd9tavU0l7qZT5F38177dgnbzb?=
 =?us-ascii?Q?W50fE/HIdyP//elroJjG9KpaXGRACxAAkzd2jMRSvh6yns4oB2+BlSNr9f4R?=
 =?us-ascii?Q?E1aKvI9wB21QyKKvrluqc1TFku0PrjUMfr/cb0pELheMbg9FrcEPmczWT6lv?=
 =?us-ascii?Q?aZUDErb1nZ/cm1PBlfKUEUKwBpWkxHOHle653IbnGi5ja2XjsDLeOhw+jk/7?=
 =?us-ascii?Q?YNVhxix4RmwGb023ANwEs17goepvoP0GDXM/8Ssi/+K2TKD/v6C1R51ZG7Gp?=
 =?us-ascii?Q?MOgLodGmK0jAPHs2Z/hpvmoG5DiPdG7mmKBE2QnRS8RomWoFcmFt9V0WQObu?=
 =?us-ascii?Q?uBydudaWIIM6Ojl7qbaGpUmBXtPnkOGqWoSLjwp5spzDgU4nWCna9ea75qw5?=
 =?us-ascii?Q?bAYYhiyVTph6h+K2DMdQySjvRwPGhjXct+sOnzFCC5cFqQQ+l4aU/+Zk3uFl?=
 =?us-ascii?Q?Ter483nF+CJJOc9YeYAGnVVvApOuvOjSX39Vs7vW4iIPNcp+hmv9wmZs9CJJ?=
 =?us-ascii?Q?PaOwQV5voowA1T8X2IEJpSnoaamR2f4Gh8vA84Zc27BFzxWH7vSw92vgjP/e?=
 =?us-ascii?Q?ozqPfwiyf2R4UGRnAP5UqPideXAsjQwk9wcsTpUCLwrz1q6OjyiTCiksESEc?=
 =?us-ascii?Q?201tKyRWU6+8YhRraKeeKqw31CZ+I/b/6O5vg5dxD6J/uRrKH+O4Je2HJBcO?=
 =?us-ascii?Q?w6ffEs42V1Q30Xv/mFjIzyGds5Fwc/VJxXh4tpaesr4ZZJE2ps9BqqGCcVR/?=
 =?us-ascii?Q?woPPyGCC+zItiJ5x3YxEJq4W5ix4pzKqKKCXlYhk+K4ZdL/Gri45wjof5JdU?=
 =?us-ascii?Q?5v9ehj84Jkm3MmZ/PoJBapDRPKfVVO+7sr0PBJcn26kI6McIRBbqava+iHJu?=
 =?us-ascii?Q?2Ejs1tLNs+e7fXUP3nyHx29kXGbQYIO8YRUL5GJ+5b+1kPPiqw909azUUvj3?=
 =?us-ascii?Q?FxZZ6CyaW4CgZurMLzBMuV9mK3mvp1lviAZbIIOUOyvgF0//PjlRZhr6KqIs?=
 =?us-ascii?Q?QniCdC8uS/39xjTTqgSY99pFkSr/OoUQderjV22IcOxQBHTGW7adRdxnaa6c?=
 =?us-ascii?Q?F4c0m29kryfsQSs47Vdqul57UGN9a2i+ya5rM6zcobchKnL+6ggqgOZFPdmy?=
 =?us-ascii?Q?ThDHdHYcQLPEmJbiE/Mhr0VYPvYxXeSBucnwErgu8mosBiDbqU9b1SJVTWBi?=
 =?us-ascii?Q?e68XZdbg/j5lmromTJm4ZQev1ssTmlhrID7l2s8T9pmt8OKzPTaOXgvo3twn?=
 =?us-ascii?Q?wK08CGIh8rcEldU+423rJMBwljW1w1wgxloF?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 23:03:05.2696 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edf83c4e-327c-4144-3b7a-08ddaebc48bb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4067
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

This fixes the following warning:

WARNING: Running the setup command as `meson [options]` instead of
`meson setup [options]` is ambiguous and deprecated.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index 9cef60d88..ed6647726 100644
--- a/README.md
+++ b/README.md
@@ -37,7 +37,7 @@ Building
 
 Oneliner to get started:
 
-    $ meson build && ninja -C build
+    $ meson setup build && ninja -C build
 
 Note that meson insist on separate build directories from the source tree.
 
-- 
2.43.0

