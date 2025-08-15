Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E580CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:08:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D779D10E9B6;
	Fri, 15 Aug 2025 04:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="o9zSCTB2";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2086.outbound.protection.outlook.com [40.107.93.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168D210E9B6
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:08:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JXCItxWdHdaJ05NAs+G8QCcgdCOoMWUiBeYvGF/cwSMPI7todkHJVQCL40d+zUia0dJegoVD4IYF+ybjJ73rIhpsUW60SRefDXp1cuB4bUJs0xk8DHp48C+dZ8OW3C70in6r8Bl3gTeG9Wf+lfVYAEXZUEZKC8UAsAeZ1PT2fAqiivh8hqx1GVBgZfEMoyQen6e2caCVx+Af9vu9X5BiRW5ps4fvH+DPty4QR8ITDDaWuhecXp/0Tk38tNkjBcNeMgX1SCChpdi3AnA0IauL10htLu+249UiSXHzcCRDo5OJS3s48KKClcOpFJ/F0DmNxT0YfwNBlNWEtf+8KP8dhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxYuXemo3Jf1eY8UTvMT/CZ3JculNW1lnW7N/GSGZ3c=;
 b=odaMZUh4K/tRuIhvh2F2pGfyFjzFOwj++e/yGWgSEjAoAvdi6cHpBRgDv1Sa1gakye7Q8cvZgnW6epgxm92lZGAfdHaATIe5PbR6s4Ew9ifTAEXVxCLQE2/NxN7kuI1toXsldlOW+DPrBXvuMlnj3sepD4wor4uIaxaxhnLVHa7vFPZ5cBeT+mpZqEVC8SVf+U8oCnWfzkby7Lk/65GCPYoBVzKjr7RYBriiuFucdJr+Vy84i/y2s7sNc//lY4RpbuR6YuEad3IgL2Tuf/bbsxLSB3gPF4oDuzHO4LVjYdEMetmYl9bQ9Pb+wG3tq6piRMgSdvJCbezctAe1FMNnfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxYuXemo3Jf1eY8UTvMT/CZ3JculNW1lnW7N/GSGZ3c=;
 b=o9zSCTB2eyPZAKcEtA4QM8TZDoXdeuTrjPjWBP5ARb//2yfTl8BzUUs3zh392JFipHLJGaJk16F9kObb4Uq2gJtn/angFEe6r3adCTvcqPDxX0jtWNTw0HIQzrzU9emN1ZyGC+OTHmpQMzdfD+7lVKBY7Bzq4fz0fygaA3IBOio=
Received: from SJ0PR03CA0073.namprd03.prod.outlook.com (2603:10b6:a03:331::18)
 by IA0PR12MB7556.namprd12.prod.outlook.com (2603:10b6:208:43c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:08:52 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::9b) by SJ0PR03CA0073.outlook.office365.com
 (2603:10b6:a03:331::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:08:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:08:51 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:08:50 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 08/30] lib/drmtest: Add is_vkms_device()
Date: Thu, 14 Aug 2025 22:06:37 -0600
Message-ID: <20250815040659.3321102-9-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|IA0PR12MB7556:EE_
X-MS-Office365-Filtering-Correlation-Id: 80f44b8c-0a7a-403b-09f7-08dddbb17168
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JmI7Gu2KRPy2PVPLiIb8lMEF7TDBCCPcEUfvk5Da5ie/ohP0FeHD6xx1FK7S?=
 =?us-ascii?Q?BL3hjaFsuG2ulbuvdl/T31pPSGrlVNGs5TpWRXfdRqi6TSF4wiURpEIfoGj1?=
 =?us-ascii?Q?qlTh7EG2Ga5q2+zSvitkimTH9iF9NK8uT5Qb4Vq2RCcEqrmmCUT2ZRIgpcNa?=
 =?us-ascii?Q?H4JC3/CNuLiuCQdvbRtOwfhtTMwh43qe7+JKsNyPHLYduItxVKo7eb0f7asf?=
 =?us-ascii?Q?/4gCVI9O7GrIplzwCC8WwNujjEaZbnMaDiFUD6txO/jcFeXvEKPdFd1t5hEi?=
 =?us-ascii?Q?a1zjjCyqF4ALHZ0A6PQuXr0eZsCPrRfBW+QQZlrW+tx3CKbeRVOXzwvJUSIX?=
 =?us-ascii?Q?FEilC6YrNhO4QHL61AEbRZa2mU8aCDBd5J2t+IV6CrVn4ztlbMjzghO4Nh+A?=
 =?us-ascii?Q?IhuYo7DmcU6pGdIms6TLr30BguUw7E/4+iCvou7WNvYf1enL6XsK2WYWQtPf?=
 =?us-ascii?Q?S/s3gvRc8WG6AkNpppTY4AxCd1eoYMVms7IY/Fd494pUab1oqUwg9AzWCwnW?=
 =?us-ascii?Q?6GDWi0P/iuxJYSzPfiFZ5YlGYJ9XvHaoZx9+Dz8wWLrdsOKppwkYz0tPYqeV?=
 =?us-ascii?Q?rx+oo3GaD2dlP5o/b9r1x+BZM8B3x1BR8vd1gYSfKq5M2hTsbvU4TeMGM8vT?=
 =?us-ascii?Q?oUofx8pMP/Y9lsYYMqtZthZYSXVFMxBnsDyq5yt6AR1V3nm2WSnD4Wk2krHx?=
 =?us-ascii?Q?p7O1v/HX9uv2YSAIHIWuq4AvQZqbCFrkBeUJ73t1w0uFHd4SGgTjufSJFpYl?=
 =?us-ascii?Q?R8yJAsrcUWjknM5akfXfZlKa5q880xNouR+HbNRrJovbUAR+TObgYmb71O0o?=
 =?us-ascii?Q?FF8GediebPPf65bPcX9NsdUVWq8WRIhWA0R/RWjU0i/vNg76uDPKK4+M6OWZ?=
 =?us-ascii?Q?FStzER3q67fXPLvC9wXG+Ofe1dayAUETBrMC1BiHXAxlQYvyTErfIvx/1Ebv?=
 =?us-ascii?Q?j6RKbpPd6fdGs9Qja7hDS/t8mTghuaMaB0P5e/F5lJlpwnaIfX97JObD74Y2?=
 =?us-ascii?Q?cTOHgUYR/07K9Fh4+YwsTdvRTntewS6xkjq6liKnDSmhOIrRI11dulNwxaIk?=
 =?us-ascii?Q?mUbfBJNhd4k9odep+2z2iY/1PtXypLge9p1fNk+v0dOa5JXD1crDQYBMpWyR?=
 =?us-ascii?Q?aeXgsfxAnemmQ2ZKGMaR02YRob64yG7nZRU9iv8qmeitCV9YKsbAexrQaTp5?=
 =?us-ascii?Q?kk79OWdu4+1hKytGDgBgUjYZWBeDs8NqlrriQ1lF9UYoPdiyBJlqRQ0jR+/d?=
 =?us-ascii?Q?t9Y7jdgPF556eN9XxgW+1e8sf385g3wzRW0MIXmAZUC5RcLvLTiGZ4FT5w6t?=
 =?us-ascii?Q?9abarWpo5/M9n4w978VmN3wxbFbKFZoZvVOsiFFMeaNXFT7UwL1WOefms7Pj?=
 =?us-ascii?Q?V4F3R6V1C7bvfsShmMdFJ503XeKEzb1YpTqxI326DtIEkRjST7cbb3tyCFy+?=
 =?us-ascii?Q?KKgW6V6Cb2q7fELg0a63GbQB1BSA3qAqTjNId0KO+bNux7EP3OfTWHRp4tXc?=
 =?us-ascii?Q?Jdn3DNURTQXVD9WYQvLxMB/FkR6Sz9hi2JmK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:08:51.3431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 80f44b8c-0a7a-403b-09f7-08dddbb17168
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7556
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

Add a function to check vkms device.

Signed-off-by: Alex Hung <alex.hung@amd.com>
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

