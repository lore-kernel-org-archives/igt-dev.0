Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07670C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:39:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9992E10E11A;
	Wed, 26 Mar 2025 23:39:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="EWfQmggD";
	dkim-atps=neutral
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2082.outbound.protection.outlook.com [40.107.101.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9778210E11A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:39:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=toYurUhswlx8TKSUa+hhwSbXzya4ck/VnPLcsJCy5tVhotEQ8eE2adqPXT/KC4E9UQ2rQTHrZgOZVIX+2shrM1tze38vH8M/vT/Ty6D/EDArneFzUE1gSFcr6vVAAqkw4Xp5eyno59QnZSesmYJ+Bj/gHCuK3384+WVcL9T8rUxI86614MpBCM2lw/WNEu/oLZVB+r11tLd0MTCVWvaTciCZRmNvjSe4y4JKnw7xPdkkVbr1WJ7QLR1e9170CUXqwvtOh2p8SU4PD8CDxehX0pY+fmQP7Z8H285yXam7IGZdGp+lTGtSbY3YSiqmoQ4Xv5bN5KhDSsflcgh/4YFuVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/v3l+bPF38OOUyx+AmxyX4vKYVqpZxuU7KW7zxiGqU=;
 b=tJKmyb6JheC/96199CsOCzGK/NsunuVFcQDJvccnH3CF+RopDxrG2pLzSdcG9mwz6rur+G2qPKpqMwxUA1xETtmE/LMZ6WI4rmC3YqOxLZlfswMqSjFJRClJQ7pXXcpxjJ+rW3b+dXr/ke6mjaK0eLpl14v7XV/BZnmX8DwbCTz1EIQp/C3+vkVQnUgGx1SThxb5r9OlPJ4G1DtadIFCjWT04Jgf4ABbqHNpFr8ohbm1Fl5mQeud9YjYm+7PQV4S87tNVKvRGkTdQOM1TU+kHlUWXt4zUSzx4fW5JkvtQhAzlyKS8i13FQIv/tQID+Q5t4PMRRaWad4kcG2e/2h3QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/v3l+bPF38OOUyx+AmxyX4vKYVqpZxuU7KW7zxiGqU=;
 b=EWfQmggDeDkChPGs8v5pwN1/aVK1Awa3ZOhcawplO4WELLR65/v5Ph9khRFBljMl4zu4ucvbgoVim7WMyd/HuGaIxZU+w+7VAE8g4bxOkHL7ehU9N3nPEI92Zh4R9V1NCoxfpTyeqmHhIp+/SbH5N9YjRsovG0WRpgEUJ/mf+pY=
Received: from PH7P220CA0032.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::31)
 by IA0PR12MB9012.namprd12.prod.outlook.com (2603:10b6:208:485::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.43; Wed, 26 Mar
 2025 23:39:46 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:510:32b:cafe::4f) by PH7P220CA0032.outlook.office365.com
 (2603:10b6:510:32b::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:39:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:39:45 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:39:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 01/37] lib/drmtest: Add is_vkms_device()
Date: Wed, 26 Mar 2025 17:35:33 -0600
Message-ID: <20250326233609.2980110-2-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|IA0PR12MB9012:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9b9990-4951-4028-e09c-08dd6cbf7d4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xFwP0JU73++C7G7W3z79TA6+M6/RMFk7DKvf1JFDUbNyB5QOEEIDjMJTpS40?=
 =?us-ascii?Q?JpOd8ZBz3AwdYgwJJvGFg9kbbwd9AOi/D60uSWlwlrR5rku16UIaN16z6K7N?=
 =?us-ascii?Q?hTHda5vhZIx5vAOgmAQk+ONxR2nLQJKk2RJkAc1whYmZ3tSnbwVQ/upjkDJM?=
 =?us-ascii?Q?Eaamq4aDB0VlcSB8+1tOQzpF8JjCnPmvfY/CtmPJLL1qDXKH6I5UL0Hv6Pol?=
 =?us-ascii?Q?mnCjpN7yPqP8KVt1Ws0Yqp0jsXA9umgEm1JCPURVR8XCLk+kMUGG4lG4dfRj?=
 =?us-ascii?Q?QhpBAE+xSqNDOx0Epjyj8Ay/+m21HihXhEG86Ya9UzRWG5qrgktxQl6CEUt9?=
 =?us-ascii?Q?njOa+litOqMfJ9Y6XdoMNMxF/7gHQ6EcgUKkuByhAIKWU8HHEUiLO55wAV3L?=
 =?us-ascii?Q?WiDOYk8ITjdLPRo35H2G0J67+DcI88+VkIvWE8n1S1cCaXFaEzQRyw+l1XM1?=
 =?us-ascii?Q?1BjhLI1C7XF7e8V/NFpgWLw0KvaSiNmNlNn0PKNyZiqwMC8yYyJKZel9jhpp?=
 =?us-ascii?Q?clUFJBfYsbA7etXjYn2jPwCB3v2de6R5rBfqUSVpCZh1KAuw53ZEtPlEQtJP?=
 =?us-ascii?Q?uIZXfNgaQGvsZOS1Q+qTkQ58lbtdMCh6rktAV9S/vhWxvEOTD55GAROkM6k9?=
 =?us-ascii?Q?gp/hEVK24tpUBchJ5iJbvWD0Ixbdo3Era8nJLzs7s+jgYM1/81+V27l4/pug?=
 =?us-ascii?Q?bLyD6nAfFe1UJl3j5rl4UdPEE2gs1bu3ErpShkENrh5LudZd507sJ0tj9MkO?=
 =?us-ascii?Q?nVSihGdmOx7lIG62ZLUpRPPkPSsJPkN72v+dBtmy9tvb8TPie+L5nyzamxq7?=
 =?us-ascii?Q?hxXU45TNHdvbo/GmjfifPYAWhtzQHx7nQJ5HgstPlK4IUrfWZJrwgQvlRM9v?=
 =?us-ascii?Q?ndTPPdUFb2ruwgnogrQ+HNbWdu6870vrm2yMDm4CSpvhcMMUv16MdQDdzSxi?=
 =?us-ascii?Q?dv+BGCTrTvy0BYnqXFYflROdG+sasjlM4CSpa3mgdLEPvjx7ifpN4HTfv1oa?=
 =?us-ascii?Q?QzL9d6zHoJrqmMbuYVRt9jjxmw8GZHCi6gW4t9Fu56pDwZK4r5hWFdlbavhy?=
 =?us-ascii?Q?YVRw1KNKkZbG0ZPIViDe+LQO7ZEIvBf8o2Pv9/UPnIUvBxcp4XN4rqYth9yQ?=
 =?us-ascii?Q?ht345+Hk9DDHD63JoM2wbxq0xtFxKQoUEYaVO7pk1gQlI2mUQBelNZZnQljn?=
 =?us-ascii?Q?k6u9OhOdgQSd6ptrrtbStenDG1qFCAsdNnUjqfqqqEVkitOnYPJwMzgD6lyZ?=
 =?us-ascii?Q?NI1rrEI3RF63NFoQI5WYe5hgTiBZeUuKeN4VaNc2ddN/O3yth57ZtlfTuhqZ?=
 =?us-ascii?Q?AvaKU5J4lORxV0YIXDmERqiO/QZsCe3dz5wOZemmJzjHSUBgxSKWoxjSSJBX?=
 =?us-ascii?Q?YnOxlbDrC0ybGdwC8oe6aSONVdi4KXQvnJINRugmaQLaddvDZEMVU9yJyYAI?=
 =?us-ascii?Q?tqC/+r5quiJ3YMsounB2XWGlmNE/rRdRILXX2mfwRmIBJm7CND5cnB8+JBci?=
 =?us-ascii?Q?HXaENM7NjPaC4KU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:39:45.1840 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9b9990-4951-4028-e09c-08dd6cbf7d4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9012
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
 lib/drmtest.c | 5 +++++
 lib/drmtest.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 436b6de78..a3904083f 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -118,6 +118,11 @@ static bool __is_device(int fd, const char *expect)
 	return strcmp(expect, name) == 0;
 }
 
+bool is_vkms_device(int fd)
+{
+	return __is_device(fd, "vkms");
+}
+
 bool is_amdgpu_device(int fd)
 {
 	return __is_device(fd, "amdgpu");
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 27e5a18e2..b3d53f252 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -136,6 +136,7 @@ void igt_require_nouveau(int fd);
 void igt_require_vc4(int fd);
 void igt_require_xe(int fd);
 
+bool is_vkms_device(int fd);
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
 bool is_mtk_device(int fd);
-- 
2.43.0

