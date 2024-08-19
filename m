Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7C5C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F273610E415;
	Mon, 19 Aug 2024 20:58:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sD9N+WEr";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595C210E413
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=swXhC36Zp4NtZqP4nvZ4eTQkyqe8e39VnzIadWHZ5QVKIiYsV8SIu2VMk88vbcxkIUSE7nY4cs/alQc8aHi327rj/HdwopzwfNJO2l8juGRyfCKz/morBEJa2dUgdqKpMQuYhMZquZp9Rglsz0r7DEstDYjc2bidOF0Z4Ba9L6liXCmBgP46bTsVk5OudJ4nlgvb/zOA0Gx8t8uojBhkFZ4ERgDCcOjD/pkpD72Z2X62OIQCiHTRVwJT2gOK5nhKN0VDMCJp4MtK7ZuvB7LcvoNWSoWqUhM7XJL9bzQMmSK8PtJPnfQJkUctBxJhC/vr8FCo3JSwypVpW7Z8nrESPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F+ZYbpQZaqujHcMQeMOgSXy40THEUwdK8iLLZAXltvM=;
 b=B2+yyHml+DWFESrmrUWlOIq6v1bYEjFTLjcpN8xTZKtBENuqWP9Th4z4ne5d1oa/JQpwnGxKKfUdyoZTcyYfWMV8K6sTOYibYphnOTB1baPWzaQM0XtgSHl07t93i5BcGH6Y9LYP42FzDzs5fuTMiKl+/9gpoN6ON3klz+QUjqAvX/YQiE5n5q6d6nI4Tkyyh9u4z70L3AfEE/STm1voEunhNwzAg3wh32F9fLYOe6xy59/+NeV2BkOa1vjqy0pEc0gmh6c0CwOeFvIiXcxbHCXUC7jMi99YldXJLZv8WmVGyn+LIwPFyyydRgd8yQBwOgccOREMTbsoE3VYlHV/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F+ZYbpQZaqujHcMQeMOgSXy40THEUwdK8iLLZAXltvM=;
 b=sD9N+WErsitMWMcI9XlzhiOfUeohzgpoFKpALTVPXnyBh9u4HT+j94+B2sTKkEwFI2mADh8mBNcjzgY1vhqj4fMtLQS83FTxC3Q8sNBvGYO7Dnzan5y9tpNsGbBIQF5Qll9LE7GUnNfd3uon8dovIUgoK4FDTTpft/SpmOVF63U=
Received: from BN9P222CA0012.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::17)
 by MW3PR12MB4347.namprd12.prod.outlook.com (2603:10b6:303:2e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:27 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:408:10c:cafe::ee) by BN9P222CA0012.outlook.office365.com
 (2603:10b6:408:10c::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:26 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:26 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:26 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:26 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 01/37] lib/drmtest: Add is_vkms_device()
Date: Mon, 19 Aug 2024 16:57:47 -0400
Message-ID: <20240819205823.316656-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|MW3PR12MB4347:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc67664-f226-4287-4d1a-08dcc091ac15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u5ieC82vdLnyYXzr9ELN9pyKb2dQV/4tffwu5bVh2HHev4Rfotlm85FrnA8L?=
 =?us-ascii?Q?eIEy6+7hme4uilxznnpxumuXlIh8MRjoQDGqbXh8dJG+O61dTJUEZCwgq5xW?=
 =?us-ascii?Q?2ZiKhfNxi3W0GvnKhz3utT9TlQjSmlYv5tL/IInHNxJhaP3lF+t7/4L6Bmcn?=
 =?us-ascii?Q?0TqmuPf3gFj8sZzAJZy1GXi/K8/X0Tux+p9klHiN8BTadXvwI7i3FdFQoXaO?=
 =?us-ascii?Q?Z2YeojMgoxeIAEPoMfc/SGdYpk59m1blO6n7vSe5UDlup7qWXbAT8KKwZ8yX?=
 =?us-ascii?Q?EaHGH67qbtNMMI3ezwYBgAzTZC8HQSMK3dbJkpfQAI03N2/Zq2JB+8m4RKjt?=
 =?us-ascii?Q?k+dXlLzwfKbrsCKPF9FSQWsUOEjr8fuKlYbfZrQgPUx3o2LflfBSJBWW1ig8?=
 =?us-ascii?Q?qz4bpGZ5tzTFIJwg8g6fdhjAdIVzrXo0cWZ8CDelIIDFLu603ILrDQ1Zrofl?=
 =?us-ascii?Q?TFRJrzt0smJoW6O3Ou2tc7myOi383u5ksDEPvXaSCR2ly+SJ0P5aAAPtloC8?=
 =?us-ascii?Q?EaB6Nk9jgSKdT03teldRvRK1qxtAaH7s7Yy9Vrq4oQt99vdoFZWXb5eiuv+7?=
 =?us-ascii?Q?VeX0kH7ZtAhe2RFt7egJ9ZWERn7Z2/WTDDaX+CZvfGdR7zSalsS74aFvta5M?=
 =?us-ascii?Q?CwAfnzZH4NVaxHm99Zk9aPe2tAeJt04fqW2Ff1aDzUCfSgV/6zV+2Q/52/b0?=
 =?us-ascii?Q?GcLakV2ab8152wVqOTpyMuYURPabwHyf27sy6OupSh58YP5Eq06uuIEwQcAC?=
 =?us-ascii?Q?9CfbMEk1TDu3xBzSrGFqUmpz8V7rlajmDxuamupMXnfowu6XSaSigIEm0q8R?=
 =?us-ascii?Q?bTVjI7kDKQX4UedSRqlfEeZ3BuQFU27JcHYjteuwl910FFUpiSBfS9j3lNwu?=
 =?us-ascii?Q?Zz2nXlsKpFfSNAzSBb+ssgj4DvgC9M4JnFJvaSdDaMDo70E8+MnX9OmnYtyC?=
 =?us-ascii?Q?9vk99r3sFm/4EiTm/uRZcdl/+S+UJKJg2G345SA2niKGb/rpcKgFT5nrPURS?=
 =?us-ascii?Q?zaDmkLBS75gdaMq2j01H0gcG+U6p8/2VGO9Mjgg5Qiih484cHqrP/epqDk0p?=
 =?us-ascii?Q?nQ6S7I5lYETp43ytORHdjJEhMPxW2/et2oKRYprBDS76wuDV+2YW+oN9wwMo?=
 =?us-ascii?Q?8p34eE2mFRTkMRgvBZqQgIvpgmTHUvyv/av0aBQD/SKwqPI7JMUkafFYQnuP?=
 =?us-ascii?Q?4lYBwsJZtXv+dkcXqw65Mur7OLBATOG7xxJyeQ74jkmyb94HYNGG9F01vPMr?=
 =?us-ascii?Q?vwodsJVp7bhc/YflhmMrJois75D2wQwEZ6fE/qLrvMsVlyHB6723IxzR331v?=
 =?us-ascii?Q?Jy4slVXPV+udXpYvdzRfFIOvw96R2ieSXVJVefEUIqEww12es8y8clEuZZrF?=
 =?us-ascii?Q?w2fB9bO5TikbWRFP5MawjR+sXu8x+GdA+a8mCrcAhUyCcxEEAOb9yEi1OS24?=
 =?us-ascii?Q?etQlO05Q4axxXYSBbskzyEpcTlRq9gq6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:26.9010 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc67664-f226-4287-4d1a-08dcc091ac15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4347
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/drmtest.c | 5 +++++
 lib/drmtest.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 2dd4540b85d6..cc6a227d75b5 100644
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
index 27e5a18e265f..b3d53f2523d0 100644
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
2.46.0

