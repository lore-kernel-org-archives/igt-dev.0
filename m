Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F0BFED9E4
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9582710E6EA;
	Tue, 17 Mar 2026 16:05:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DfklZUSC";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 555B710E6E7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2C9r40h548INb3mW11wD+mShu+ChHlHO5zKvVGW01A0kRq+QO3bc/TguxD24w5xd4lP5NuB0rsNvHzqJkjXrKoTPc2aX+Y+8DiH1oxEARROO7gd2SN4QZdw+x+D9K0Q/VDfM+5UaV7Mp/vrT/p63bPEfn/Sh2NkyJ2mA3TxdIBa6nOr4o1SLCZi2eg3TObmsd0XQWmnSZFHewL+539pKvYEJ/ZJwjDUemgpi0yWovFe8U9IJs113PkCsWAzl+PHUQ9G++9nkZFQXakA8eI83W3OJe5myR5Th3is14LG9m6Bwy0jnqQeGfIAa0L2qascuw0aifvtjTJXCmVBrGvQJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oKzCrx6kOBfO8j3lgMe2z68G7IQQx5hca36Ziqpplzw=;
 b=zSQA2g/I2LkkumUT19uFyuTYS9ebyL/sigJIuBbP5e20T/FpNyDUQBUh72KMlsmLSFvyD/x1/WfCXpwoNYZKjUlbOIjtfgN2vPymoYiGTt999fm6bdE7xoCnxWlZAjctsEJglCcoJDom/G8udfmTrg3QmAHP5IKi79Q/TRbEo3+HMYsVFxWH6j4/gGZL7l3JEdQ5WlVZYLc6USPyZztBX2MrXrO1cS/0mYLlr4AuvCx5xELGcfC3DpbT67xSytje/dQlCEids/Qcjhs/PudgkQL7TwTpn9GPPSVQWOBlIY34P1ZnU94Jk1ITvT/gR7DNoYuzHbbU4ts973SoUQVYhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oKzCrx6kOBfO8j3lgMe2z68G7IQQx5hca36Ziqpplzw=;
 b=DfklZUSCiVbhxnCFNYs4Zj0wsNqSeU8cefcIU07JbF2BPM3vox5l4Zts+l78UuBCuadi7fVE+cvg2Zf31tR6x12yBlnHJQvcyudek1hnP7lkTDBTLSmuK9tsIxWheRb7rjcWVswjHgH5VtPzWL/8GMI20FpyTN586WqSopO6Qr4=
Received: from SJ0PR05CA0104.namprd05.prod.outlook.com (2603:10b6:a03:334::19)
 by LV8PR12MB9134.namprd12.prod.outlook.com (2603:10b6:408:180::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:04:57 +0000
Received: from CO1PEPF000075EE.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::fa) by SJ0PR05CA0104.outlook.office365.com
 (2603:10b6:a03:334::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9723.19 via Frontend Transport; Tue,
 17 Mar 2026 16:04:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075EE.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:04:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:48 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:48 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 04/10] lib/igt_color_encoding: Add XRGB2101010 format
 support
Date: Tue, 17 Mar 2026 12:04:30 -0400
Message-ID: <20260317160443.229812-5-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EE:EE_|LV8PR12MB9134:EE_
X-MS-Office365-Filtering-Correlation-Id: 02296bfc-e369-4970-28e9-08de843eef7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700016|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: vtjSGQys9SkSchkEgaR8VJMgaUYOB7Xtj8EiHiDFkgNWuvPxxvYqgC4V/HzHIK3Rdl30Q6B3noMAJzJkvfFC2Ef3g1J7njObQ8yisfX4fSxufJ0n2W2LnLRCBasPZCLlayIPmaH2i79Q4f6WZVIBsFg1O+CI9xm4lde3TJSgffIsfnWAPoKXfjOJb7DPyTP9NPdlir7MoCZ5zSrBz9pEFEznoowVK54kJ0PFPb6EzsAH3BpbgvYSPNt7tcj9I7m9sx4uB5NqpPnVz4HL8DTbwfwABIkkaMygxjiwxMbX95bGao2hUcke2dOdJ+cVCqK3Od5W/t61rvXvqpdKNLW/6dov/7iuXC1PeiE8pTneV9KlXaYPXt5CxjuhmU9QNRR1LH01GAB/ZaRHtO3yTVYNvZevzklFZoBu8ylBgV/O7OjhVRDF1H5TjLey3ZzCKGjdXaz+38DxdYLLXBkwiqG4k18damAUms8DGu6lMLy2/kXEi6SsVaKhpeifIJNdypzeh+VgdiyneSNlWm4COaoEnDluL2yZo4joXjvoX60iGXosG+f/9wj+Kvi9urZIVbdyYbgVCwHWRLydhWM7IzcX4hYXPlc1XRYWP/4W+9U3bPG9HTqHSsKYTYSRqMTq85rxwEYc1fuFnL9r9AEAq7k08WZWPrQ7L6EWfHgb4hpJqLRvh+veMqcwO4n5vd44xOuVZ1huHz0AL4ID3+afcIUJVMP1lBw6zLKBH0/zv05fJCEtuCa+imPZRqiuW5+52rXzakZwxKuYVXFD7+pF7+csKA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nNfyqSzoFP0MS7w3jhwdGZYjR4KignEv+BL3hBRU+tjW9PblSQo/P3UKrLG1OzsKUOMAoHKjf+kmvUBGdDDWX5vqmx4UCrXC0LaEyq2w15abHNihzgjfB8gMCfpHEzoyJf9sPU0kIl8uqEmNeh5h4O2t0QOlpZygMd0jmcW6mq/uW/woN/DgAQoKFhzGXJf5BgLQRKYm9n7frojVk2hVdOdX7Uoz3umhQpew0P484n/0gnaSFHUi046zhZc6eYjAP97UBBCtPHrZa9mzNaXL6N4wdbpFJgxySfRwym65mIUopqmVWzAvW2vKQgcJOCSXK/IDJh++lIFwen43a1TAnIvRYe2sjm+eMsYySRCRhJOY1yFNGo4r1IVutBk5H7lvTTl2uVS006EqEmS6/mcvaYZmz7/PZ64fI1HxJMJv9Quy1j6Q1F9Rj89DRdkrmcW8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:04:57.2913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02296bfc-e369-4970-28e9-08de843eef7e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9134
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

Add XRGB2101010 (10-bit RGB) to the color encoding format list. This
enables proper color encoding handling for 10-bit RGB formats used in
CSC testing scenarios.

Co-developed by Claude Sonnet-4.5.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color_encoding.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index a7bd2b22f73b..7df6b55ccc4b 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -135,6 +135,7 @@ static const struct color_encoding_format {
 	float ofs_y, max_y, ofs_cbcr, mid_cbcr, max_cbcr;
 } formats[] = {
 	{ DRM_FORMAT_XRGB8888, 255.f, },
+	{ DRM_FORMAT_XRGB2101010, 1023.f, },
 	{ IGT_FORMAT_FLOAT, 1.f, },
 	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
-- 
2.53.0

