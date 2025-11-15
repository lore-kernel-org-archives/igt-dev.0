Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72792CE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C5410EBEC;
	Sat, 15 Nov 2025 00:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rFbbeGzj";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011045.outbound.protection.outlook.com
 [40.93.194.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984F610EBEC
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:20:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QB7qIPppVRMkRXi8rx13cP/vGKL5mOQvfqYKqIyvE89ygTzq8iJGdy4iMgPndQ5195n7S+iBJERYTjZrmkTnEjUe64zU8WfIVcDVm89g1T8DKxkWc7K+5WyCF0uCFwjdCxXs+DJ9b+HzwRl91+ZP+8jGMgO6tZMYBEOKZkIvvIxUv0Lk2SHof2QI043WWz/QK3AX6TX0H8sg7s1q/6nFLEh2blEkTDRh7YbU+Q80OzYIX3ieW7Lnb0sUPUP7FmNKPtg829XMi1dDIpeXGrIWiU3F5s8tCzXIMbKlLzlEril7FnpfwsoD7BbtEQFBEx14FwD9uYUBT4G04CeWxoWvog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wnNwjHCcPw+MC4UhSyxcZDMTVJ4JG8FPfLztMiIyhfo=;
 b=GdG1q8by5cl8BhH+UqRrdFcdewdUGQX3Sv2FnI9yAK2/F1HLqCYaZ35yrOGtu3dunYuSIAHd1V3UMzJz3yg7IAnYgWZvTwT0B4I+uXWX5/1WU3llG7N0KfAWnbP/rqgpr3AeKRcECejnM5OKuiDLD/Jof7/Y4DiwJwYPW/sSGW2TMVKwLyYHdpj0zfiImWPxurcZZgrK7mlCaKxL8KVqxrdbo/mJ5YK+/j/gOY16uLoQb14sMsH7GKzqSU+mkhhoikzR9hXwvSFf6kNlgQGIE8LBY5rcr2/0AoB7D3mhQEc2gHsGuHAqrP+gxPLZZxk0OOLTLLv+1Rfq+97Ft4DRqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wnNwjHCcPw+MC4UhSyxcZDMTVJ4JG8FPfLztMiIyhfo=;
 b=rFbbeGzj+C1fJqx89q1wuEnb5Vzn73L6ywL2aYS7eArE6NxnrtmQwaPcNPH5nob6SmWRLOsy7/GLdugVn4/ZIIlRq8glbwX42pAECK9O2USSB2/4fBJQyfalcZZW9YCwecOTyqTpZt3lc+ZXT8IJgkdf1EMGYA020Ymm/QXyTW8=
Received: from BN1PR13CA0010.namprd13.prod.outlook.com (2603:10b6:408:e2::15)
 by DM6PR12MB4233.namprd12.prod.outlook.com (2603:10b6:5:210::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:20:53 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:408:e2:cafe::e1) by BN1PR13CA0010.outlook.office365.com
 (2603:10b6:408:e2::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.7 via Frontend Transport; Sat,
 15 Nov 2025 00:20:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:20:53 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:20:52 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, "Louis
 Chauvet" <louis.chauvet@bootlin.com>, Leo Li <sunpeng.li@amd.com>
Subject: [PATCH V12 10/32] lib/drmtest: Add is_vkms_device()
Date: Fri, 14 Nov 2025 17:18:19 -0700
Message-ID: <20251115001841.3563993-11-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|DM6PR12MB4233:EE_
X-MS-Office365-Filtering-Correlation-Id: 75fbb030-03c0-4986-41a6-08de23dcd693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xIfP25eC1DzQXJzSm4C3WRL+slp0PZG/uWvaEuEapjiVuEbD4gnwgpU4unep?=
 =?us-ascii?Q?kqyi53peEw11/cTHk0lq/K9nhF/Hw4r560U9XRc9sL8pfbEe1uOfAz9ZQB9W?=
 =?us-ascii?Q?3DAmxYaAmfl2tcMtqB+CTUBc4cnqqEiW28kRVwD2YzKUkbcu5lLZSycBuaFv?=
 =?us-ascii?Q?lHSYvz5uiNFdzQVjKvr2QsgFdGusKKlv5EpXkatNqepr4OHvAYEeSdS+OjGK?=
 =?us-ascii?Q?KfHdxrRFlqq/r/UrnpSR4Q8Roa689vnR9Aplvhoqwjw2p6kKriQ5X7Ql5IzR?=
 =?us-ascii?Q?PFzPiJBJrWQaYTP3J/4veE4SBtEPeDv1O1WcKjfL+ekGoskLH5x5Lss/v51I?=
 =?us-ascii?Q?hxhH1Ktm0rs7dsIMHDdRXeFueHzftGIQ6iyDJmBODyGTdtOpzxHOi2Iw07Tg?=
 =?us-ascii?Q?UxYQ+Ih5OStUvgNBlxudT7GgLXD+ACH0NXIC7pe0KKeCsrtTjtq5VvGC1vZf?=
 =?us-ascii?Q?ptRJpHPcDnuCng8r4Q+QrRoAFDdCGGQ2sbZHMBpB2FXktdXIzHT7uvCl0/sU?=
 =?us-ascii?Q?ACBC8GhXe8/ySKBWJZpvcgdIyEPysmGsAwF9bYS2EcboXjaBmvkiCX1+hS+l?=
 =?us-ascii?Q?WsvNxSnRF9qCWAkTUWbdZot2ZFOx5EjvOaGmJrVs0RlL+pS6ayjvNvKEJcwz?=
 =?us-ascii?Q?+69SVT/nzKMUeWs2pVWRM7s8DgUddZVjC6bCXF7XF7usy571dEAYW5e4ZGf/?=
 =?us-ascii?Q?YUZhOMWQeuFasdNL+Vc/lFkn0oY4daRHn73yYgg8izOd75hmxhgEXTKQNmeN?=
 =?us-ascii?Q?asl+Rg96DDEhE96HcA+rsGjTvYDanlWz7rjdMnzOA5ghK/K3QlyfwMhfLB99?=
 =?us-ascii?Q?K1ImXAFblZIzQjCZcfRo/xkB3UIcRhSYWQxcZvZTTff4sCFaMPleId5uNbyx?=
 =?us-ascii?Q?vAWL5MZtvnY362yZrIAiJy/QPQYNuZF0TiRaZI5uyLSSF1aUbpIlxciLx9nK?=
 =?us-ascii?Q?ih7qltZaZmxCbIXPNu00/iTtkOJAZAu9vS7ELgdoFwAq+4/4bE3aK4OYfBSq?=
 =?us-ascii?Q?rLFNqkU+wmX5ysNsDdZRr8sAc4LEWAG8DnoondOhNbVSAxVW7EwYADJgxtAZ?=
 =?us-ascii?Q?iVF5Lkw0iaFxum0x7aRQ4UnI6v8GoaYMyU/EZwr4YWFlfEFylVpf0HlZnUhO?=
 =?us-ascii?Q?K1apcFAO2FHyLHumJdnU7vm54EWoZNVOHHN8+9ZyOmvJQ6Oemfhc1d8U8mf1?=
 =?us-ascii?Q?RGeMuA/K/LX7T2cYoeJ11v9CbnKyzOMlmVuN+ckLda5LWfJ93Jth68XOqodq?=
 =?us-ascii?Q?qXDiBS3+1wC0JYUfvvcxvIdy4/il+/CS+JY9IyH8BP7JVfvtkLxZ93nuZBVD?=
 =?us-ascii?Q?yrn1REKkDToq1cJH/ufuqCKUAhP3FwulE1Gl3eNXcRqtyrDUgoCfNnjsaD6A?=
 =?us-ascii?Q?dJKqCkN3j1SBDxOue7XFV92fyVf+gtazUemtf5Yu46vXB/oc4LkhVN1lJi3f?=
 =?us-ascii?Q?UcKvnX4KIY/WD90/EvzrfC5g4CdvT90P6Emrka7nRHn0gwEWhKqon98g29gr?=
 =?us-ascii?Q?Eoske1ZkFut3xAZ829mz7Y42FXVM3J2F8OcLC/vLJkgYPiDy1gGvsGNFg63F?=
 =?us-ascii?Q?1aqhRDCXUh1HK9hF+/E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:20:53.2491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75fbb030-03c0-4986-41a6-08de23dcd693
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4233
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

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/drmtest.c | 5 +++++
 lib/drmtest.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 3d8c8e79e..4a788ea7a 100644
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
index 4b0a71102..37874d729 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -142,6 +142,7 @@ void igt_require_vc4(int fd);
 void igt_require_xe(int fd);
 void igt_require_vkms(void);
 
+bool is_vkms_device(int fd);
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
 bool is_mtk_device(int fd);
-- 
2.43.0

