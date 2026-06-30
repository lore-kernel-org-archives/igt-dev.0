Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE84BC43458
	for <igt-dev@archiver.kernel.org>; Tue, 30 Jun 2026 03:26:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924B110E15B;
	Tue, 30 Jun 2026 03:26:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XOoVF9Jg";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011020.outbound.protection.outlook.com [52.101.62.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD96C10E15B
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Jun 2026 03:24:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lnaJwI574rL/IkDxl758PwL803sbr6tSV6otjnhyOtTXG//3F+U3cToDar8BRI70XxsZNZXcNXq/YLNXu+9N8SOFn0zXtpn2HiqVtQtmi8xWPH78oSwSlus/oBmCCoed/urimktoJVI45hERxNVZgunZVu6pAsETkX3fuDs/FgEW7cA/Hwi3znSG3HzPRw8LNXKamOzH3f625qnzllczyWkYLzLthh55xJx8g96iiKSJ63Zh6MMSi54qGDKqARwuC6HxoxyT4keSGcIwyLOaJuVbvpbbKr3OYY28RCXXabaM8+y0aXhkTOJPYeuQs4kT1ntdGmub7iLW6ZGTagryaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AHTd0scls2+TtKrFdsCPYx+v6r7mSmKpq1le8Clg9ok=;
 b=PSqh12eVt+5VZLLndCfCAJfjtzWDKzX0vsTmLTh3QC7hb5YfmPHSu0VZ4dkuQTQcdHo7+X93gTH1Fb1Ch7ln5t02FYsY61iBoxNHBxjp/5Zo3Lz6gygXhqf0l7e9AP1qiCZmUrAqG7YXydbsHoY6rw2MgXQphziFxkKDz0gxnsvuAnVCDpbZEwmPVgi+vzQBOj8jAvhg2So62X6ht20NBXClLUOZZvswXuoqUq+fG3+fyZgzZLUwzp770apgDFuJ3LxTD/kcT8RcW6EymYn0AkPhvlyhVGtqyFYYpwTrjunDZOvredr55BES72GFKSSYlbLFZipwAeb2anoWEG94Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AHTd0scls2+TtKrFdsCPYx+v6r7mSmKpq1le8Clg9ok=;
 b=XOoVF9JgkXiI9aoPmPWl0KVni7iX1mGXzzaefqcYbFpxAZ8bHNNLiRAw7X2hFBFR5A4eI3bomGmiQiSAUAIAz5Z/5Mt/w6VUJoGxZuUd737PmPw8n3P/ksjkqVCJvgmST+1wnXBBz7OgUyZzq0GsigLOxPzXibdlk+PTTaUP/I0=
Received: from BN9PR03CA0790.namprd03.prod.outlook.com (2603:10b6:408:13f::15)
 by LV3PR12MB9144.namprd12.prod.outlook.com (2603:10b6:408:19d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 03:24:48 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:408:13f:cafe::87) by BN9PR03CA0790.outlook.office365.com
 (2603:10b6:408:13f::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.19 via Frontend Transport; Tue,
 30 Jun 2026 03:24:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 03:24:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:47 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 29 Jun
 2026 22:24:47 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 29 Jun 2026 22:24:47 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 4/7] lib: Add platform filter initialization check for
 automatic filtering
Date: Mon, 29 Jun 2026 23:23:23 -0400
Message-ID: <20260630032442.200729-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630032442.200729-1-vitaly.prosyak@amd.com>
References: <20260630032442.200729-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|LV3PR12MB9144:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a9fde8-e81f-4d53-5209-08ded65723ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|82310400026|36860700016|18002099003|11063799006|22082099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: rRuuYm1t1kH5BSCuadGdid6MUey1lrbN0sc99BlE2RMr3jcXOue1HRwzfTr08a+Vfl/GASw/HN7B5PGhDnkTI87XAWcmsNEmAalAvYEaca58MjkfAO5L4o+6Li2HezqCpVzhkFs/DKF4pfUqR1AdNYQfKbjtrN5zkdVyDeBFC80kKVI9wavzYKfITPqAJU5+aDoA0si7/dwke5ukowYdTkKxrpgu8CESMCrJU/cDXxCKaD8YpD8HJw8S6AjUy47WFoicKd7rS6i4kb6Si+n0PVd5C3R4a4z/1xnzV9wxsKRlX3vI6+GY/DLhxNKeWTRmwFz8qAkdOOlTqXTOqclH8g26JJuOe8915FLSkH96K9TZStNBZrg1oodazT/cGh5k0N8h71yP2hwM1QwYgvO3PHpEwR3KvFdhaW2q3ai2cCYAglMYNE/VdvdzZ39I325pFJ9hNPdsEkjZt5D8iwWAgyQYYGJawhLoMsRHr9nZNOR5xN4s8NgJaNDnB8oPvSsxJ0j+aYOQgNErjtCna3I/BPTaFwlIl2llkpBBDXybG7xM5XA4US4Dj5FWQ8nnqxcwyjDDCHjfChfNKtCyePmEaVPPWgQXTaZT8RdnpGY2Noesj6x3tK6AO/fS0OWVNvebC2awyBmUCqrzxXYEVv/wJjOmb3gcebxfh2SP6fZhIa2uWzwyzPAMSvYvpPqe4CX+BeaTEz6M7QNQvOKSCPZMTw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(82310400026)(36860700016)(18002099003)(11063799006)(22082099003)(6133799003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: p/UHK8ZQg2KbzXS58rerqOIBzJvGk6WPFTF0549yzXyoBK+CwOG+ljusCqdpD8hSHhDTUFGNXrnosvYphS2FurvbYPF++QNWzlR0eipOROEkfwjYkzQ+0f/kFRZjNIw5meHzhCaK9o/GxUC74IoOOUQB7+VwGUY1D5XfMvaUe7UUP7SqSyluqE6Ka04uJBhVF4+WChRsbxHBEzH2IkIx16tXCp7ExvkZmGGH+AIQxojlT7DuwlxUSCPDGRPgjvP1bckmWK8PmBxLrDMTEfJG/+uCQXxtUaVBhb0LKclixub7ZiZ/OXRGOSY2L4MMRC6+yaebWeErXEZNq1WYeYG8CH4iUjavMRjHnH+XPpfIJ6kTTz+siFfrgF4+qLB39RtPEJq8brPyeh50zxvKRltqejEEu0yupQdzVSQ9utisSuc20faqh+f/aEIRRZMU7s2k
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 03:24:48.6152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a9fde8-e81f-4d53-5209-08ded65723ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9144
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

Add igt_platform_filter_is_initialized() to allow the IGT framework
to check if platform filtering has been initialized.

This enables automatic platform filtering in __igt_run_subtest()
without requiring manual igt_platform_require() calls in each subtest.

The function provides a clean interface to check initialization state
without exposing internal implementation details.

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_platform.c |  1 -
 lib/igt_platform_filter.c | 13 +++++++++++++
 lib/igt_platform_filter.h |  2 ++
 3 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
index e52da159f..2a1c92acb 100644
--- a/lib/amdgpu/amd_platform.c
+++ b/lib/amdgpu/amd_platform.c
@@ -6,7 +6,6 @@
  * Implements platform_filter_ops callbacks for AMD GPUs, providing
  * platform identification and matching logic based on ASIC family/chip.
  */
- */
 
 #include <stdlib.h>
 #include <string.h>
diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
index 4ae0d6df9..52bf6054e 100644
--- a/lib/igt_platform_filter.c
+++ b/lib/igt_platform_filter.c
@@ -497,3 +497,16 @@ int igt_platform_filter_dump_to_file(const char *filename)
 	igt_info("Platform filter configuration dumped to: %s\n", filename);
 	return 0;
 }
+
+/**
+ * igt_platform_filter_is_initialized:
+ *
+ * Check if platform filtering has been initialized.
+ *
+ * Returns: true if initialized, false otherwise
+ */
+bool igt_platform_filter_is_initialized(void)
+{
+	struct platform_filter_context *ctx = get_filter_context();
+	return ctx && ctx->initialized;
+}
diff --git a/lib/igt_platform_filter.h b/lib/igt_platform_filter.h
index e532c6de7..853da75ae 100644
--- a/lib/igt_platform_filter.h
+++ b/lib/igt_platform_filter.h
@@ -120,4 +120,6 @@ void igt_platform_filter_dump(void);
 
 int igt_platform_filter_dump_to_file(const char *filename);
 
+bool igt_platform_filter_is_initialized(void);
+
 #endif /* IGT_PLATFORM_FILTER_H */
-- 
2.54.0

