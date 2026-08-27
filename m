Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E6FC61DB9
	for <igt-dev@archiver.kernel.org>; Thu, 27 Aug 2026 17:59:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E01410E09F;
	Thu, 27 Aug 2026 17:59:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="gkhMUGLD";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010007.outbound.protection.outlook.com
 [40.93.198.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2743A10E09F
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Aug 2026 17:58:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uLuZnI2UGfOyzSL5cZ6yhUs8yY5hZ+6XU4lXLWsBKqvvJJ2C3jwTSVhLE4tJCkw8jKbQZu7EfNaqN2/OMW/6tviiExK+pP612p5aKf8JxxDIn6mgt1l3ByqXoJ8y+vnwF3D1oaB0cW8TmXtwVYRrYqNyETpfNzndGj2qPhKpb5uV5DuG/pNojfL21v3FvqMfBMMNH6MRPCHM9rDnU0LOYJhjpXkhVu4974ncnL/Y/Cjk1P8NxxtFNRXIgbVqB21nBpB5OZUl0VPZSzt5oOI1uXPAF6DHyc7mlUGbpL8oiVeNCY53NY6zlUckXHUUdckdRN6qaiUy4psvWeYetaWceQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8WbQaS9r/qFZZM4tVFJrbzLWKfUvu47eKEw3pcQMoo=;
 b=OxukFVDjk3yq7BbF7sO4018hux5XbaPvk+Brn+pRZsHxlfoaJwK5xZaBZlk6XU9eaOuywtnDUtqJJoo0b8IzLp+CpNje+i7jQjU7VTiCuo8VWPuE21XhLhS2meGfr5L2CY4e+bdwrvURI5XpJ6qorSDr3tghUyazm95Z7LI/HIE88uh5kSByEWgJ5eI8n/zXLeSLLGfUqRP2ZlHu2DFBM0T6CaJD/j5C+LnlKG5GnFJaEabBOYeuHqPgx1Oc9DUMxHK2uRk/biVdqvQrHjSUr75jtRWMi9zcRzagzFfTX3hpikF3Ku/CptXTiyp5AbvcgzcSyeEE3m1xDLUze2mdMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8WbQaS9r/qFZZM4tVFJrbzLWKfUvu47eKEw3pcQMoo=;
 b=gkhMUGLDB9YsCZcjPJtxhylcV0L+YBhtzPOlRzMkLz3k0S0fiMJjMRDi7SjmH24Q4yKDDVYVtuFBKvyg8LHmhZO9owtgXOxA41iAgqzghK6iEqycXWrGrlawUIAsMxkf2PRU4xhdyFpl6V7G6bWF1Mvtjjm11qQlIZk/MDIT6iA=
Received: from SJ0PR13CA0205.namprd13.prod.outlook.com (2603:10b6:a03:2c3::30)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.6; Thu, 27 Aug
 2026 17:58:05 +0000
Received: from MWH0EPF000C6195.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::17) by SJ0PR13CA0205.outlook.office365.com
 (2603:10b6:a03:2c3::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8 via Frontend Transport; Thu, 27
 Aug 2026 17:58:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6195.mail.protection.outlook.com (10.167.249.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.360.3 via Frontend Transport; Thu, 27 Aug 2026 17:58:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 12:58:01 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 27 Aug
 2026 12:58:01 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Thu, 27 Aug 2026 12:58:00 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Michael Strawbridge
 <michael.strawbridge@amd.com>
Subject: [PATCH v1 2/2] lib/amdgpu/amd_gfx: skip CE IB tests when kernel
 blocks CE CS
Date: Thu, 27 Aug 2026 13:57:22 -0400
Message-ID: <59b4e3587bf500cc88a2bfede253238ca04d87c7.1787853061.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1787853061.git.vitaly.prosyak@amd.com>
References: <cover.1787853061.git.vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6195:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: b6bb1617-154e-44ee-0002-08df0464bd12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|1800799024|82310400026|10067099003|3023799007|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: Gv/9nOOo0KNXGW0/35Hj0wktj5BADoiBFfRfx0qXShJiliQuvZVUFigQSsNjI6oesW7fnvkU0mIHKu+SqrjeW+8n65AcZODk+umIHJSi8QjeLBdwb5UhZN0zWJCJzrcpbBiMGuGK75Ag78AYeshfWZKiJ/Lfw9AR8Gn2vzbGaQudzlyzGO4+c4i8eRmjR+R4Dka9wU1Lesqiu7ghkGZUrqXhbdFrjW8TDZJeKgYd2sfnAHff/UeVa5cT4URh5dT5o6hSvefV8i+L6wpLfCIAukJdyqI9saZjsVRkWQuvxg6MSbD1E8O8/OGK04D4gFI7z7C4JSPJw1ZB4T6opKbfTME+ViuY8EYBa4DdT9kGaGxYF4cSJsOJmr++bYUfGJ1R036SEw0uqxUmpJAsAFEVq44SbbhcmhdPZ3W4gZxvzWvbz60w9qKqFUKvZ9N8PkDkxT6WOJhC7xClggY3AINSaijNTFhEg0Ci99oH73RDhwLXljOjHhEMxA2mMcgveXhtuJhfezng3mhnEgWxnJw3rDldiBuo1XT1sxmnHhqgC0RNM0IhgsT1obdP64Ld2ab7V5ZIpL0U+iU4kzkAgfkI81x6OtPsGH00HxSmKchdwM9iCUJ5XLeaLM4uLOWzRrSOiL3RX6U7NeUiCHG3mltqVsFwO7WFMcyiT8WhTnGhRE+vglBsbSj+lzKor6jV9Vyh6zdS8LrayX7S8sC6Wk5nRw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(1800799024)(82310400026)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 18p4epIfgenLCq+OUgrghXm0wruJZmyWkdM69RZjkOKLMBwhW45QsuQtzi4Pd9Jte/d1NNiiPd1ObUsOVL+P2wqUOhzTfFTvKGHUBXZGUu6arUE/HZwFgMeq2nO/57EdzjGBn/Tyn5/anD0G79AHYyWlKNzN/LvcXwc0CSmS5TV0vw64BRvju5TPPFzcyLLba9l/yFWpxdEV86Qwp0tc1Uqf8/w9UBlXSIUbpmQjWsyqdzwQPFDL9TepsLqtb+inf1UA78Dc/ZpI5zdaHBj3TV64FC5ZrfsRAUl32rM8/7XO0GX5vn2m9/xyIG7AVAbW+dMpxvV5SGHtxmHB23jbEDU/pHihN6tCg1HnJZXCjhHrtLMUej1XDnoG+zYwy6bUIPethLO9BobzKReBd9EYZAJqB4DU/8u7mOnmnHHh1HES/pTAozM47Rsqe8fbE+15
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 17:58:02.3856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6bb1617-154e-44ee-0002-08df0464bd12
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6195.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410
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

The kernel guards CE CS behind debug_enable_ce_cs, set via the amdgpu
debug_mask module parameter (bit 0x400). Without it, any submission with
AMDGPU_IB_FLAG_CE returns -EINVAL:

  amdgpu 0000:03:00.0: CE CS is blocked, use debug=0x400 to override

The sysfs parameter file /sys/module/amdgpu/parameters/debug_mask is
read-only (0444); it cannot be changed at runtime and must be set at
module load time:

  modprobe amdgpu debug_mask=0x400

Add amdgpu_ce_cs_enabled() which reads the sysfs parameter at test
entry to check whether bit 0x400 is set. Both
amdgpu_command_submission_gfx_separate_ibs() and
amdgpu_command_submission_gfx_shared_ib() call igt_require_f() with
this check so the subtests are skipped early with a clear message rather
than failing as CRITICAL after allocating resources.

Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Change-Id: Idbc7a5388602fceac7ba0b67274bff076cbb7d08
---
 lib/amdgpu/amd_gfx.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/lib/amdgpu/amd_gfx.c b/lib/amdgpu/amd_gfx.c
index f133e2459..10bc74b5c 100644
--- a/lib/amdgpu/amd_gfx.c
+++ b/lib/amdgpu/amd_gfx.c
@@ -26,6 +26,22 @@
 #include "amd_memory.h"
 #include "amd_gfx.h"
 
+#define AMDGPU_DEBUG_ENABLE_CE_CS 0x400
+
+/* Returns true if kernel allows CE CS (amdgpu debug_mask has bit 0x400 set). */
+static bool amdgpu_ce_cs_enabled(void)
+{
+	FILE *f;
+	unsigned int mask = 0;
+
+	f = fopen("/sys/module/amdgpu/parameters/debug_mask", "r");
+	if (!f)
+		return false;
+	fscanf(f, "%u", &mask);
+	fclose(f);
+	return (mask & AMDGPU_DEBUG_ENABLE_CE_CS) != 0;
+}
+
 /**
  *
  * @param device
@@ -45,6 +61,9 @@ void amdgpu_command_submission_gfx_separate_ibs(amdgpu_device_handle device)
 	amdgpu_va_handle va_handle, va_handle_ce;
 	int r;
 
+	igt_require_f(amdgpu_ce_cs_enabled(),
+		      "CE CS blocked; reload amdgpu with debug_mask=0x400 to enable\n");
+
 	r = amdgpu_cs_ctx_create(device, &context_handle);
 	igt_assert_eq(r, 0);
 
@@ -134,6 +153,9 @@ void amdgpu_command_submission_gfx_shared_ib(amdgpu_device_handle device)
 	amdgpu_va_handle va_handle;
 	int r;
 
+	igt_require_f(amdgpu_ce_cs_enabled(),
+		      "CE CS blocked; reload amdgpu with debug_mask=0x400 to enable\n");
+
 	r = amdgpu_cs_ctx_create(device, &context_handle);
 	igt_assert_eq(r, 0);
 
-- 
2.54.0

