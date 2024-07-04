Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E696C2BD09
	for <igt-dev@archiver.kernel.org>; Thu,  4 Jul 2024 03:35:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3C310E174;
	Thu,  4 Jul 2024 03:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FrclnBE2";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7EFA10E174
 for <igt-dev@lists.freedesktop.org>; Thu,  4 Jul 2024 03:35:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvTgCCXz3YqL4Z78HNyQnDlZIBwJ14KdAPSV82n7ALZ/Y7/xTzp9uTN5lDPgjXfQ+STLQOpIIGWy8/gM/TF/qS86pjkd6R3FqTlRG9XeL4EmXRC7Sn17VUdQYYv1Fi35gJHUP26uVjLzI7PeBP1AOxOP/GcbW7HMQUkwlN2YXWGTpVdSZ2r7grVJhbIQ1ILQo8De7Kln214HUAP6qiz582PKy3Vvr4Sm1S6Fn4IOW3YRuVL7L0FriFjGfqSpHqV1u4+w83IjLo8iMXEgXdKZI6+IEV9MFEBSYWhv46uFxPJVvsBxDrI2SYiDYm71HOly3u/sPcsArwZ0ou940v9+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oB/tVVdFy+H9pC5D1kRO2cPyQAQSc/hCw7t97n39Fpg=;
 b=IuvR0OhEjPivJOfPT7nTxh9K52uZgxgIgwyBrSkM+I7Z2Yr3UvMrtU6jnf5S4bZSi6czeG4oPxPkX9/00K2RsKAl904twl6JJzGG642Aovh8+g/3QnJfh+YW2EgQ/UoG8/qOXDs7MGaTlWP+kz97np/aczu3Q4Dh9INIu7UyoyUapOeHoUip4Pu5Hc/O7hzxldIJqIxn6LcWAfcnqcsGgxC5FML7hFFfsfclgWuxTz4pjj06Q5w4nqtj/gtuMXGc+B0SwXXci3NtYLMcpyu6szPC8K0+Ccc6USZDGiJdioRePSrYiynFzjwj2iVcpLs6ffjncxsX8XgQ4wB3iKKIyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oB/tVVdFy+H9pC5D1kRO2cPyQAQSc/hCw7t97n39Fpg=;
 b=FrclnBE2/F6HFZeRr1Nei+dUwnyWbOSrofWxLaX1c8SjXqdgWPn9rHJb8QzhulL6WqTm0qBO1L9xo53F4hKQhTaqcf2ryNmccg08S0/cPaOi8qf6ceViyLsh8aIYwfem0fmZzLBZhlwhbWOYkmX2H0jIoQ2lBeefPo8GKOXH+zk=
Received: from BN0PR04CA0181.namprd04.prod.outlook.com (2603:10b6:408:e9::6)
 by MW6PR12MB8760.namprd12.prod.outlook.com (2603:10b6:303:23a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Thu, 4 Jul
 2024 03:35:55 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:e9:cafe::14) by BN0PR04CA0181.outlook.office365.com
 (2603:10b6:408:e9::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.27 via Frontend
 Transport; Thu, 4 Jul 2024 03:35:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7741.18 via Frontend Transport; Thu, 4 Jul 2024 03:35:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Jul
 2024 22:35:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Jul
 2024 22:35:52 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 3 Jul 2024 22:35:46 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t] lib/amdgpu: fix query ip info issue
Date: Thu, 4 Jul 2024 11:35:45 +0800
Message-ID: <20240704033545.1078807-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|MW6PR12MB8760:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bdbae2d-0883-4274-e60f-08dc9bda68de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OnAJSr8wNL51GLogYc9Xansb6Zvdrty4vsY6/6CF7Ps+MlyXmoMsPkzxAMPA?=
 =?us-ascii?Q?HAQF9i8J8AFMI1Kgs3RgpQPJZmKFCV/6qTtXEwCU+iZ042uw5X25yaN+nT9U?=
 =?us-ascii?Q?R3V6620tr3rWLa9TqxYgGzBhNYeBHm3kk1xgD5ga2qsc7iNczndO3+XLo1ft?=
 =?us-ascii?Q?KEqXZS3j6dj8nXwQ+RO9uOihnbPmHhpZHIT/a6SZrZuznV27VX1Pd0O07/bC?=
 =?us-ascii?Q?iy9Em9xBa/1sK6nfufM8Gaqev9Ez+NW5u9J/BG2fBK9GYKYVkR0sJC/eFpYn?=
 =?us-ascii?Q?dawkJxpPj1s920Q4CzHB4TDYlWHkdFAXLTtYDmxjEp5S4lqEcEqB8i2VCnp7?=
 =?us-ascii?Q?+Ni+oIWynJYNQxD77fHUHRj+6HXxQe8c/kEzZ66KT73gTeKUpOCx+zPmgHXU?=
 =?us-ascii?Q?u/d/Fa22sW3yzK0/SfkN9Y1vDdoEwEMQ4DmWWP0WdsRuwm7o0mqjeRR0xKjQ?=
 =?us-ascii?Q?BGD7jFeSxInivTE+GeKfv/nDcUdLhTQP/FU5fDDXcJveiECAmosbSd9FFDWF?=
 =?us-ascii?Q?jhYsIM6Ko+LgsCfOJugWgPTsv98h+wMu5KkaeWx2k6LZbKdHlnk0HVCTtHdf?=
 =?us-ascii?Q?agEqhzr2A+9mRXgXuPRjjG/tueqvF17occicJL1wgsDkw6o6gi36Gxq5y9nw?=
 =?us-ascii?Q?tuIIDh6d141xmqxbUDtNBokEGT14sYq1+p8UZMAmuPMvhIBQaR+GC/ja2B+M?=
 =?us-ascii?Q?NM6jw3LnIyFD2Xy+g/hi11tcazcHQXysJ56d6foM+hbtP/db3NHo8AqwX6rx?=
 =?us-ascii?Q?T7rLcmHgJ6+qX0gE7Lwy058uKdNuoBkMle1GFm4N8TxSrQaEQuHxCXMZ/fLD?=
 =?us-ascii?Q?8MWItysJAdWls1OBz0N97CSqVfp07aPjZR/pkdlWHCRY9qaMG6gO85qe73YA?=
 =?us-ascii?Q?JvWK3a15OVGxJ30QN9qmZIb42ukM3vOVuyNS7Rrxow85czunBWc7VjjvLmnK?=
 =?us-ascii?Q?5VSdqctT65MYrfy7366Tp+R0N2sq0NcmbbLIOTuAJTfiiTkvBZRmVS+M0cis?=
 =?us-ascii?Q?YwTAoL/TAhp3KAlFDW6iJZScTKIsUNW8FI3Rrt3xQB3pusAz9ATLjuY0xGhU?=
 =?us-ascii?Q?dSnR6ni7p4XJHo9Xx4vXHcXH3+rANgy68IRoJbYDwfhwRb2lkeTGZEKEATjH?=
 =?us-ascii?Q?6IdfWv7WW5V38xYUBx+PRNrEg17nRQjdS779KivJvyVb9whYO148uhOj4MO4?=
 =?us-ascii?Q?wGO98P/1PJCovFwXjM4zJXIpQm9vtyRCzS/NLiZZaicAe+GnQnZ7JA1UALby?=
 =?us-ascii?Q?UkuPUt3KQF0Q40aqyRujilSKiUcNvSvwfULQCbQCxShw9kjcEBE1/x8KXWxS?=
 =?us-ascii?Q?C8ZQTFPCMe28QRV7bZvlFHcXsksMbxGsjzSHoXEcKGfWuam4bO102GKnk4z3?=
 =?us-ascii?Q?QjGxiYkR/glt9n6Diz1JpMQnxOQJr9K3tWPvsAiehZQIHBjZ+wG/7AVjZZK4?=
 =?us-ascii?Q?nxHIq7WsovnrYze4G4E4Rro3y8SyDAFZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 03:35:54.3757 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bdbae2d-0883-4274-e60f-08dc9bda68de
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8760
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

Fixed failure of querying ip info on gfx 
when only compute ring is enabled.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_dispatch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index 12ef7874c..f0d6a4f62 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -553,7 +553,7 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 	struct drm_amdgpu_info_hw_ip info;
 	uint32_t ring_id, version;
 
-	r = amdgpu_query_hw_ip_info(device_handle, AMDGPU_HW_IP_GFX, 0, &info);
+	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
 	if (!info.available_rings)
 		igt_info("SKIP ... as there's no graphics ring\n");
-- 
2.25.1

