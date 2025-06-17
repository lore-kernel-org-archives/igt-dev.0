Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 723F1C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:37:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F18D10E550;
	Tue, 17 Jun 2025 04:37:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lVuKuXs8";
	dkim-atps=neutral
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2051.outbound.protection.outlook.com [40.107.95.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA1010E550
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:37:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UU+IBp5ck2SYIyUoHXh8ysN8QiVSEj+9mUA+I6Q30oPMVsQwMBPsLWrV6Hq1xQ/aCKdmuq+mvFKXYR5MAT0qxzKtJlVt5I8mAeY9aYA+319h6NIuwJ+LXECD38YwgQgoMllXpe1Hdm5sbv1rVpVxZKV1yk3xTuUfhd/2GQ3w7u/RD4uKso6CcSp3BueYTE7RQZ2ftlJW+nuKA77cAZZyOuJhiH57ErcldhePZJEJDIm3ISVPekj23Xz2l6Th5y7HYws464hpHzDDcS9awM3LPTRiXUY6DR8umpUKx6lJdBUNN5t3aJvl7s7kilxvkSOQMQk/h5Gl+JGZ/C/8JXtTCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k/v3l+bPF38OOUyx+AmxyX4vKYVqpZxuU7KW7zxiGqU=;
 b=ozIIuZeKnqPgMUhRcSHF/ze6vH7xB4HE3+xqpAF+lIm31Hu0vgMsncQE4jOD5Y3m49cO5M/iqlJ1/pDHCS5YmtTGeqQMlPqeb80ZVMRkMheJETAVVMpH9xrfCAZG4sO7cfYrLCvYT09j7PnuaE/pJ+uc6Mst9Y2jMejpazLf3bSp2z7rGF+u897OFLcmWGJsd1AHXIIr+m4BY/priGhJX2v2wNoi9Mel9bHzc5UqDJWoXgtLKQQe7ODPyq7a7z/k9eoOV/t8mxyGlMjrj1UW2xUn84jssvWiJOmbG3T4n0JFbUmYpJMlc4JaA1aRvUwHGOQbcpnmK2yTMDQBK25pOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k/v3l+bPF38OOUyx+AmxyX4vKYVqpZxuU7KW7zxiGqU=;
 b=lVuKuXs8bKPUm4j0jM1ZT0QcZopkwEFcfOuOSsw/FPPXEVuNh904d7m8ymFnaiSRKsNar7CXpEh60RUD5IquxYL9i2iUumEFT6VDDtrU5hMe+BswMLwQ+hU3GbFN2ySzi94XtuWRkjhS3LlNsLOPYvku3KS9wAy4Wl9s3pHiQRw=
Received: from DS7PR03CA0058.namprd03.prod.outlook.com (2603:10b6:5:3b5::33)
 by IA1PR12MB7639.namprd12.prod.outlook.com (2603:10b6:208:425::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:36:59 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:5:3b5:cafe::2e) by DS7PR03CA0058.outlook.office365.com
 (2603:10b6:5:3b5::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 04:36:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:36:58 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:36:57 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 01/36] lib/drmtest: Add is_vkms_device()
Date: Mon, 16 Jun 2025 22:35:56 -0600
Message-ID: <20250617043631.2920587-2-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|IA1PR12MB7639:EE_
X-MS-Office365-Filtering-Correlation-Id: e7f479f0-ca2f-4367-5c06-08ddad5898c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5i4MFEqyAH4E+546VFkH/+L7fmveTcNGx42s9h6ff28qQT/T3EZ4h/acZijC?=
 =?us-ascii?Q?RLdzghehNr5O0wzbTDON3gqwkR2dclrjsRtxw07lT/bZHU7JT651B1PMzUJB?=
 =?us-ascii?Q?yNQ9zQaAO72XHd5ybGG257gl7tDW9OEBIrjZcx+AyGLWgyqO32eLiRcoEiyB?=
 =?us-ascii?Q?PBmfysd5BhC7T+IggSt05NyPpN3zwOpEIQCgcE2Vqpnv+C9p5uCkoe0jgANX?=
 =?us-ascii?Q?LKOWfGQshP9VFf6NNNN6ZKtiIb8jGze/J5aaMzVmVdDWIy42aTviUkn4TrNN?=
 =?us-ascii?Q?r/Jk/WZ/KtQWPRXUOu6liK1MJtn1OfpumJYmZo3L/+7v+wTYJPms59eqnGpB?=
 =?us-ascii?Q?U8ml2qN6IZKWvIwAnGj+xWHOdwbqV8jO2CVv5oXNTs3DZnq9WonFIyzFwdT6?=
 =?us-ascii?Q?bqUqmrE+9kWVtM+KCDB1abEwoV9KdGUlP170ZM7pYc2YLTygfhroejn1J3tt?=
 =?us-ascii?Q?E3el3yOIlWtNQ/q5r27NVA6ZfqQpXMzuMwrQ1cEsZ9gLmNzEsZH3BfQoRRb9?=
 =?us-ascii?Q?7yAMAHKh3EYGZoUlf6E1w0ER5blnlqnvQcwI28d2wRehsi6Dzg9W6QUdONab?=
 =?us-ascii?Q?trxxt/ywIPuugikNc0m2XuVo5HWwNn6fpH5l8XMFlEvWAUgcEiDAyP/v1D1d?=
 =?us-ascii?Q?PjC6HNc1bZIAnOwweBMyYMXEfcvSd/hQjCW27KZv24QF3XyImpibibPWDjqq?=
 =?us-ascii?Q?mitSi5LrT1b5jyShPmmwWXPJadZrf4DVZDV2kxJ02sMBFxN9Gj6aAELvE1sh?=
 =?us-ascii?Q?3/ZMMpXP7akyYtysBPpbJeVXuTVJIuz47obGF5e/iKZZuvStGuhW14moWkeJ?=
 =?us-ascii?Q?lyWkkADTAEn2wcX922xi6AoorS/X4jdpIEr76q+Z6oET9QDOQK7jNbAjt58w?=
 =?us-ascii?Q?XKmzmlE0Nmzb9hL+TY2+v79CuhtBGbyI6SHzlqt8hCeOwreqbwl+KgYR64bn?=
 =?us-ascii?Q?bV1W8MbUWB3Ta3IzvJvBeRlyNWF+rUFcYP41It+FvFjeji9AG1yykVDLU1Pg?=
 =?us-ascii?Q?NsIQ1u/ernvRNr3wEGz5+P8fGemjr18GDUEuw2sv2XEpunl9rHAVlvcc4TVm?=
 =?us-ascii?Q?0EfxOvKB6rQ45M1OYAwMd4ovS5G3j3198kkdNgEfHAJ3vJZ99KZ0psHN0HbN?=
 =?us-ascii?Q?w+yVA+0WRX6yx02mBRXV3ZEBI6pEgmWlSU9ARTThxhrXrtxGMiDuDGOyyO+q?=
 =?us-ascii?Q?IwFb/M6GouiYAaP13kSv1wxa2mQK8Jd5s1f1bVw0mLwOuIEqusXsHGtGiH56?=
 =?us-ascii?Q?DpvHWI37DJ5V7D9DQ5LhpW9byuz+dHALm99nT4gSwKp+iNHJ0TPUePUXVbpB?=
 =?us-ascii?Q?anKbKfmsGbFVn5fmJ0D67vUDpjqFZp/Iz6oKtHBhdVg3ciHDld54ILf0cd7t?=
 =?us-ascii?Q?LVnHC31HD2GVZ6qcwvpzHaVSWKMeKgnrFavwUF+FaEvQMZcksw1CDdKmrGN0?=
 =?us-ascii?Q?7tbMVzh3jFhJ/vC6XcE5qUMFrWguCl8wFa8L/1lGxgMzcWjJ892h7ztLTJUD?=
 =?us-ascii?Q?/0cSMYVSCfADP27hS0gBxdApGnkkI9r3qjsv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:36:58.7137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f479f0-ca2f-4367-5c06-08ddad5898c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7639
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

