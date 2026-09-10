Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA547C79FBF
	for <igt-dev@archiver.kernel.org>; Thu, 10 Sep 2026 17:12:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D7E410E28E;
	Thu, 10 Sep 2026 17:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Hreowzcf";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012033.outbound.protection.outlook.com [52.101.53.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB79A10E28E
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Sep 2026 17:12:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BQr5Iv0V4uF9pYU1WOXQz+ljOkCcvBQdw9xuefoSaXf0JIp4aN4FtaubLtv2tCHhYS4c30VPGt9R9Fb2LgSHOI0xfKRz20UxxDRxHGbDF/T5d3RUH40l4N6xGG1cX+5i4Gm8oM+vzRm+e3q8+tYRmjaKKYGCOKHzT2evkIwrxytzbLIrZiTHyzwEvmRKJxmwScNFcDRtkwOlkIwBXjlT6n6k0fEL0ESvEF40swZBnygm/NqhrYMqC8znHMx791VElJT/EluDqiZgPRzPtYy3JzkKCnN+EIvGqImwYkiX1SC9uVlLZxquKW+wOBX4wHJkAy5PE52onv9OxFnBTlN0TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X2kbh6QerfjFsQwgFRp4Wpm3kUE4CVIyxM/EFLy23D4=;
 b=AX+c/dsim5tdRTIkkq7A046irux1kl05pF2GXc8040W+XcMUeG5WDYQD/G9pPzMvJp1tQm7ef/V8cXiSUD/KlDra7+qXt4EvZd2U1blIcGtzDgckW8v8HWbqS04bYi9XHzELGQGV2BW28dOTVUDs8EYrr/7loHhrcVRLYF2HNvaT48r14yLNzHik0O/ZjDDRXRkNjMdsbFfFnbCe15huSeWAvy5reuodYlzHsV8QS01+EcPESBJUiCFb7+dW6o+77X4oUoJPX8MCEqupZShA3p5I108BIg+mG6i8ka/mq9MMi22P/JO4RCjJR69zPOztwL4Szc7yT22yCCC24xjh9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X2kbh6QerfjFsQwgFRp4Wpm3kUE4CVIyxM/EFLy23D4=;
 b=HreowzcfsZjuujk44b9K+psLYkLzqcTXQglExGmPFmwA64ycTr3l4Lb011jo2cpeZ6sjcsIs0QRWE1Ct1/zZfahdrPbwht1H1am5EONUKdL7nPsq6vW1tpniXgHfxXhUSILOJHLMeTaaTQZww2UxgfAa7kQGNi4mu4yF/Uqg44U=
Received: from SJ0PR03CA0080.namprd03.prod.outlook.com (2603:10b6:a03:331::25)
 by IA1PR12MB8309.namprd12.prod.outlook.com (2603:10b6:208:3fe::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Thu, 10 Sep
 2026 17:11:59 +0000
Received: from BY1PEPF000264B4.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::25) by SJ0PR03CA0080.outlook.office365.com
 (2603:10b6:a03:331::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.8 via Frontend Transport; Thu, 10
 Sep 2026 17:11:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BY1PEPF000264B4.mail.protection.outlook.com (10.167.242.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Thu, 10 Sep 2026 17:11:58 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 10 Sep
 2026 12:11:57 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Thu, 10 Sep 2026 12:11:57 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Michael Strawbridge
 <michael.strawbridge@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: add asic id for gfx1102
Date: Thu, 10 Sep 2026 13:11:43 -0400
Message-ID: <20260910171148.29997-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF000264B4:EE_|IA1PR12MB8309:EE_
X-MS-Office365-Filtering-Correlation-Id: 2be2293b-debe-41bb-3534-08df0f5e9f9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|56012099006|18002099003|11063799006;
X-Microsoft-Antispam-Message-Info: ucs7G+sh1CLnzqm8B/coWdd9LSiIXgu6qwBn3Ne4kBqrp/BeOwIx9k7FEC+4d+aFae8tPXI1dNpVY6fYoNv/wFXVqpIE9S3AJNwPgXBLncfMoUnYVw4o+6SeNxFWleTRJ5xS3vo5PetDbA7DUeRsXAUoAY6knmYrddSvQb74xDLktprjeiKX99Hiupo2TOV3Ar5VPKqSL+MMwRXsi2AEzA8/L9/oe62F/v74LN0I5+lzwWJyQT4cHj7pswZjW256YRPT45uZh+Lt3oIPzPQDdQv2gRWvwl6fS0ZKWcbiBm8CoGwBGx9Z+ngFwJbIW6B/iMbl9BdJJTPQR9IsvAox5/yvDph23sWbvSeikVK1ahCikio5lqs2vCU/JibYjBqnCwdnsfWHnob4J5ZR+x1ZFKAuJtM3pNcdZK9Z/4GOUSSgeNwbVvNJpV9hkS5Pf6lCsulCSY2IeQvWxMcEIAUa7YlGOxUot+46IFW8x5WLHsqWtUtyUb5O8EWJbYoZBmSR3qMTCGB7QZzyYCYbAbUgevJUGn2qXrSxUzlLHShMu993HN3imFCsu1bUXMb+q9BRJOQr0rX5uetEPRcv/mJNR6eqm4/QUZVxpKyjzYHhNq0b1IhRc+40dDPuIi/YB1P7FF5TJVoDdybKlgF7wSxQgmh84Vhi8c21ibxf4L8ZCy8nsbQpGy0T3HpDoyKgpRxi96cJR7kVTqF7ryqKKo247A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(56012099006)(18002099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YeqLlq1Tt7TqXnLitdZK9SQlOpdwy9Tesva7DD1PHrEDbRaNmlw9E6c/RdO6BJ5CuCl7i3uBuUt90tJ4Md2zFCT9DOfHsmkVl0ZacMCSd+2QnnU+ZanyPvgj+BJkvdiNICzBeHyAjOuCNjm5xUS/CdeFDw6ZoB5FjXzJ1N2hHmRlLNHnBKwupplCQt4L/tKntF61kOtWcpz4YsMq8/Y7qcPdk7qwPv69OVcub5j8Lqfm4KGvqe8s9JL3yyMwJ4sYbiXTnlb16ZYHNzZr86+HLlyJUFfoQmgEVFOHIMz6hBv6d0kaCXoeO12yABhzbNxuCjtstGUnHzsCtBkAPHgQLr1UdHXtcAsil7ELefLQFjPgndbZFgOqXCcF2DvfX3YIjM52p4ou5/5y58ny7Vh05ygWCxFBzJMiKUihW/Arjey7n4QQZJkVvpV6n1bnHQIo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2026 17:11:58.7641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be2293b-debe-41bb-3534-08df0f5e9f9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF000264B4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8309
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Missing asic id causes error behaviour for filtering.

Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
index ea4a37b37..42805b462 100644
--- a/lib/amdgpu/amd_platform.c
+++ b/lib/amdgpu/amd_platform.c
@@ -185,6 +185,7 @@ static const char *map_device_id_to_gfx11_name(int asic_id)
 	case 0x748e:
 	case 0x748f:
 	case 0x7490:
+	case 0x745e:
 		return "gfx1102";
 	default:
 		return NULL;
-- 
2.54.0

