Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E85CFC88E50
	for <igt-dev@archiver.kernel.org>; Fri, 11 Sep 2026 09:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C10310E05D;
	Fri, 11 Sep 2026 09:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aWxAiep8";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012010.outbound.protection.outlook.com [52.101.43.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B8710E2C9
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Sep 2026 03:11:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OcNfz3JmMsSLl1yK062yIMlKMjOMZ5sTFjlW3w5mDpYb+AJY0oOFwVakccdZJ0Pp5v2laFrW9Q+rNwZZCqgwHhuFjPZhom8LxpPggY7uCdApj182yxTXqHHme64pD7Thnpu+qHceCbpHAKC9Sv3QRH1ef8EYQrGB53Vqruk3mn/+0ZAjEFANLaerTv+2NYBYP13wdnelpsLnOjeX+1qcVgg/vVPxn6Q5EvAT2seN58yBR8vYfrLS0fFuHl1mp4e77Sa6OXehfV7ReggF8IksK3fv5GKbGcHP83GSvZKMyKFYyZ61wjP4Nd0k01n9qfPT0sae3dEogWHODV3z/amFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WMutrGXzKu3nxDsRsfBqN5dkfU1iphKU6U4TALCAk8s=;
 b=qKLX2xKXacaXNbIbHrMTEfmBVOZNnd0HD9dBQcZ1Vqz9ZTS+GzbTNqAH/ZNj4QGbgG8hhPy/BwYHu94M2KWFgf1NaNCOeHpK56SuQS/1l/VBHJSzLKQQtYS78Jl406/4D0oNsGYmQlX4/he3TMn2tIGwRdwC2R0i0Y57svL7V7/96NyBLZQesx54YXbhkRT1UpWWBhU1SpKXsZYnvTe+4SRs7d9AY3YBtnzjktqJQhIoTTLkFUIwGDGtF2WffzGhvqhwlsmxfemUWjOgwtHKRaSxR5nj4Jd1KJc+6QMjGWJ3ERjaE0NmBSifGrogCRv7YAJWD4p7IrxlE0VUzGBNvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WMutrGXzKu3nxDsRsfBqN5dkfU1iphKU6U4TALCAk8s=;
 b=aWxAiep8Oe43XwUUHEuSe2RKfgpZTwbIAPJDZzygYsiGNAqbzhzXJCoczPLixJgFmXuFTIFr8DC/wel9X73jtcEbFXl3Tv/06TjZLu516UY03pWNJ6ddSTaWgHzE0hEwPKbfUkr/pd217pr1az0jPwDSY0os1E7fF28AC1sqjt8=
Received: from PH0PR07CA0007.namprd07.prod.outlook.com (2603:10b6:510:5::12)
 by LVXPR12MB999196.namprd12.prod.outlook.com (2603:10b6:408:3dc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Fri, 11 Sep
 2026 03:11:01 +0000
Received: from SA2PEPF00003AE8.namprd02.prod.outlook.com
 (2603:10b6:510:5:cafe::9d) by PH0PR07CA0007.outlook.office365.com
 (2603:10b6:510:5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 03:11:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF00003AE8.mail.protection.outlook.com (10.167.248.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Fri, 11 Sep 2026 03:11:00 +0000
Received: from granthali.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 22:10:58 -0500
From: Granthali Vinodkumar Dhandar <Granthali.VinodkumarDhandar@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>,
 "Vitaly Prosyak" <vitaly.prosyak@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>, Michael Strawbridge
 <michael.strawbridge@amd.com>
Subject: [PATCH i-g-t v2] lib/amdgpu: use shared amdgpu_ce_cs_enabled() for
 all CE CS tests
Date: Fri, 11 Sep 2026 08:40:38 +0530
Message-ID: <20260911031038.1243176-1-Granthali.VinodkumarDhandar@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE8:EE_|LVXPR12MB999196:EE_
X-MS-Office365-Filtering-Correlation-Id: 39be56af-5a28-45b4-c912-08df0fb24e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|11063799006|10067099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: dzqNUgNKxqwbsQdAXvQNd6X+e5CdRSGUDTo139VgWCKhUI2SEySFEQFehYu784efutF22kUYuwzYV9QjZM/TqIPTaAkE8jKug+Sdp317lfDoEKSP+7KkiuTOW1sIPt1lTvkBd2XBAtBuEWYLl604YPlXOdTjepqOBWG3QSAbgy9TNqo333s7nZgsV3yW0zplYYpAjOEJoFPNWzDmd+EvA9Ly/ZCMnbIJjrflQl9ad0wr9fP5vT3uwZvVEkMH29Y3op/ghfJwLQ8oglz8jMmsKRrgKKdJJ/ksNQSppefJ17AnjCE+BCwLuzSqn4E60ZGkd27DlHvEi2yqqYeLbys1YEPvUFrtrO9ddkoNqLPAjc9QW4lFYbnpiiP2JhIxdkFARxxCQIQTnH32ow05VtISNVJz+TC6Ht0XTq3AEIgVClkjw0wMjlgygfGa3vw4fX06UzG/hdiphR3zxw/7k9fFaq+YxQJaNME2j5mHYc23Sh20EaT3fGv735G/cHbio0jarIryBvLSwk61/9srZ9wo0swwmWTimYJrX+6KmELziNJEidqv8yYtvNHU70YKelRBsm4DfalcTV3R2U/TXVgwKiJjw2CGC2nFGv9X3/qlZ402y31oL3QL8Xxd4CZOpvxOQnYLiuzmPgHjl4my1nmlZYV3JC8cypU1OjcJwC0Mdt+nUFWs7ZT7Ue+s5sMU1TYPUFOnGdZUJfs3J6sGZHMjqg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(11063799006)(10067099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: EJQAI/kO+3BLmPzYOabcrm4Ipsg+ox3++LNDoFscGSizE2MGaIfAIVHIDv7/VG/bBCABWSXRiFT2BWdikocvxs1dqFMhcJYnGPRBlATo8Va8+vrZCWIMz5zagZNRoQnZZDq2sHp2+5iYkWnJsa2fE18cg3OJyGAf53s8JryoSk/z5liDWYNGYn51ZREpFRsddwDU4C679q7MDALAdeec2W8kfUIpzKf4iwlrrakSBjJkELNMvKThsxxaU86DSQEhsole2gleiF/iszRNbhQjByJ7f0RpfnsY8y2Oe6jf29Rr3FffFZbhEkKe192QrIFhJF9X1VHOSjELfkfFlpT3hORwTejvO15eDIcj4cyhQ+lP2zHNuzg6+tzwhCMVr3M+FisDmgSrbNAM+2iGuNEBoTGPDxDmE1dStxAwR2I8g0TiqgSvikzh/uFh52HFPsMR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 03:11:00.6343 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39be56af-5a28-45b4-c912-08df0fb24e96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR12MB999196
X-Mailman-Approved-At: Fri, 11 Sep 2026 09:34:30 +0000
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

From: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>

Commit b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel
blocks CE CS") introduced amdgpu_ce_cs_enabled() to gate the constant
engine submission paths in lib/amdgpu/amd_gfx.c.

Extend the same gate to amdgpu_command_ce_write_fence() in
lib/amdgpu/amd_command_submission.c. Make amdgpu_ce_cs_enabled()
non-static and declare it in lib/amdgpu/amd_gfx.h so it can be reused
instead of duplicating the check, leaving all three CE CS paths sharing
a single definition.

Fixes: b99a1e610f24 ("lib/amdgpu/amd_gfx: skip CE IB tests when kernel blocks CE CS")
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Granthali Vinodkumar Dhandar <granthali.vinodkumardhandar@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 4 ++++
 lib/amdgpu/amd_gfx.c                | 2 +-
 lib/amdgpu/amd_gfx.h                | 3 +++
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 7210cffb9..c7b36970e 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -10,6 +10,7 @@
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_gfx.h"
 #include "lib/amdgpu/amdgpu_asic_addr.h"
 
 #include "ioctl_wrappers.h"
@@ -805,6 +806,9 @@ amdgpu_command_ce_write_fence(amdgpu_device_handle dev,
 	const struct amdgpu_ip_block_version *ip_block =
 		get_ip_block(dev, AMD_IP_GFX);
 
+	igt_require_f(amdgpu_ce_cs_enabled(),
+		      "CE CS blocked; reload amdgpu with debug_mask=0x400 to enable\n");
+
 	/* destination buffer */
 	r = amdgpu_bo_alloc_and_map(dev, 4096, 4096,
 				    AMDGPU_GEM_DOMAIN_GTT, 0,
diff --git a/lib/amdgpu/amd_gfx.c b/lib/amdgpu/amd_gfx.c
index 10bc74b5c..ff9f869a8 100644
--- a/lib/amdgpu/amd_gfx.c
+++ b/lib/amdgpu/amd_gfx.c
@@ -29,7 +29,7 @@
 #define AMDGPU_DEBUG_ENABLE_CE_CS 0x400
 
 /* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
-static bool amdgpu_ce_cs_enabled(void)
+bool amdgpu_ce_cs_enabled(void)
 {
 	FILE *f;
 	unsigned int mask = 0;
diff --git a/lib/amdgpu/amd_gfx.h b/lib/amdgpu/amd_gfx.h
index 90addf5bc..8bf108365 100644
--- a/lib/amdgpu/amd_gfx.h
+++ b/lib/amdgpu/amd_gfx.h
@@ -32,4 +32,7 @@ void amdgpu_command_submission_gfx_separate_ibs(amdgpu_device_handle device);
 
 void amdgpu_command_submission_gfx_shared_ib(amdgpu_device_handle device);
 
+/* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
+bool amdgpu_ce_cs_enabled(void);
+
 #endif
-- 
2.43.0

