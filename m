Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AAAC43458
	for <igt-dev@archiver.kernel.org>; Thu,  9 Jul 2026 23:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A1D10E104;
	Thu,  9 Jul 2026 23:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RsLPjUuQ";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011012.outbound.protection.outlook.com [52.101.57.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F412B10E0A4
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Jul 2026 23:39:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFKkbyJk8lv/C3vEBEMgkWBqtFCxkIyO8/ptRJ8gtLDMIRa4GTKxOfpU1rWI3Zyz85m7Cf5XV01s/3NMS1qlhlbYdzR3ikMt+PH2/8bhFxhG935khCNe1PwiRkYt37ljV1wZqnwEDHUXFBk+XorbNJg1XpLmSwshP3Io/ard20RemTCBXcVzMrVC37pUUH+Z8voIsad58sZqucRq9hmEQMdel3K7+X5FGgg/1B22jyWr0Gm5g0uJZ6kp7V5twjKeeXpQKmRU+Y1R2CBKNbLEiB/QJhemUX3pwaOkLPpu3N4z2O6BkRqEGcK/tpo7YvKOV1rGXDewSAA5LRgC94Ga3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9dBgXrkAFBFhfOuiL0Nikw7stHDQi6/hMGlhk78GjM=;
 b=X5HXOYjroy9Rt81UyYwp5Fe0VaMPzkCd4xelpcOAvSk065v62OjkkuaLAn/+WjEX7yncctLQNSFKbrFqcHzLlY0gux39DpRFtqOimJRD4gqi+vxpGtXNeBDiIi8eNc5jVktNl+VjKdak0iL32lje5+Qq8FbSdbOFNlNY7lGeZ0d6jdfmls1nLukPvNgWmPmtCvaQLrNkMhb3GQe4buGTY39CyXIJIcfgSISUFMvACopHz4Cw7/lRzr1kZxfKpJ2IDmBKVisIOodRCidYR84ijHtxO2K+KVav4gFD5R8xC0pAPP0XUpjtFQcSw/TIXIsgpJQyUnnxG4GR2mc5kgMHkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9dBgXrkAFBFhfOuiL0Nikw7stHDQi6/hMGlhk78GjM=;
 b=RsLPjUuQKi5FsvA7KSeQn3gddbDb78E0yb24fbYKO3JjeiIWjZ8HU95NctvhszlSZKsEEKoa8P2Dq7CmhibZvyghRn+4j6n/xZCQ6zDqGm+j9DAfVT8WOoetnlweS6FWLR3EQUDsMsq4NDE0lSkV6RfOM8buuif9ioMtjaA5VR0=
Received: from CYXP220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:930:ee::13)
 by SN7PR12MB7129.namprd12.prod.outlook.com (2603:10b6:806:2a1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 23:39:45 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com
 (2603:10b6:930:ee:cafe::58) by CYXP220CA0010.outlook.office365.com
 (2603:10b6:930:ee::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 23:39:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 23:39:44 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 18:39:44 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 18:39:43 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 3/6] lib: Add platform filter initialization check for
 automatic filtering
Date: Thu, 9 Jul 2026 19:39:11 -0400
Message-ID: <20260709233940.160424-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709233940.160424-1-vitaly.prosyak@amd.com>
References: <20260709233940.160424-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|SN7PR12MB7129:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a883213-319a-4abe-5d70-08dede135b32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9mxYWdqPZY5LdHwXh5dCDEp4PrsvMkci9Pce0y2bGkkSzbmJVmvk2Q8UuDTr2dPrQXiMCwcIXw3MLGJgve/bgyhWL/IFA3vUeo0FmZg0sk1C6N2EW4mEg6nUcTw/A8QKLT3G5uP10UfNewsddAyM4iB1HNvWhi9Krn0LSqnPXVP9K9UaQ5mFa6wOT59tdsR4egXm4BBxDqq0QJnQcC0iIXsDNuc5Il/zfFL8yiUANlsFJaFRrougpqPHAODWk2pYi+TWkZIZnpLjL02xM6FPn6UTUDoMZ3FH6ErN3VTuc/QadujJcWqNriLCa6AEwp0CC0kcesxIpiHvmPAAyszXMOzFnMuxwkdvxQDxW6Rkjp8J+4a8eVmdReXn/bl4h1uHY8+aRhmYGcpwkBMTiT+CWq8AfPwSpYilBnOVsDYKwLmVF8a95yZyJox6aUQu9pmw2Umft6HFtL/z3kzdKVlhHCAvisVbrfY9lxCV6b12ka//DgyanWi0EVP+bT4nFP+hMW2qDVZ9+idmmdN+JY+3YZCZYiy5MJLD/e9ClLq0cmIiaMW6HQZ0fljeamU46Sjs0vQUTdkH1ew1m8Y8Zvnx3wHv8h0XN6CheYs2ZzU566eRLeqagJ5rffNawNngVG3ADqEYn+X25F/iDRi4xCQTj2B4yG/LqNHBe/kDks/MVJiTvGxY1A1QHGkwL2VcBqBWasmcTZI1/W8fX7V1kJUXew==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nwDeqExn5roMeG+qKWlloWqF4YH8/IXk5Fp1hXFCBx7+htggeq3WaIF4g0cC98Q1D/JFcu9IiKrqPITGkXaowUVIuEJ8u8zhpHXPhn3t08FbEcGjzQ3JkI1UqfEdp2YuWFQsUzJPDT4WRZ3A0jou2+25hzYrgRIt46f6l6F+YZyIsfyxamuAlQGAbSRseFTTfqjjIyrDKUBzRfvQM07LB3d6PvU/OL2YaCBfQho8QUk5pa23QY5mvG+4j41JNq5+r7fm5j0SO7jxjsn4RF82HxojS2/RT0CcZkeAaLNNJ4PlIOBOM3SPEASWXYIjcgCFvdq34Lrvd4qN5DrGBbZ4GIrCxO2m3FheSkQ8um57cz68iMkptIJeCfkz9Nzu8rt2+VGwVbe6ERIsUFYz/dAd+cCLiW4ooIDiztannQRi3SIK4UEJ82CwjNV2xESPqaV4
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 23:39:44.8072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a883213-319a-4abe-5d70-08dede135b32
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7129
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

Provide igt_platform_filter_is_initialized() helper function to allow
the IGT core to check if platform filtering has been enabled for the
current test before attempting automatic filtering.

This enables the __igt_run_subtest() hook (in next commit) to
conditionally apply platform filtering only when tests have opted in
via platform_filter_init().

Without this check, tests that haven't called platform_filter_init()
would fail when the framework tries to call igt_platform_should_skip().

v3 changes:
 - This is now patch 3/6 (was 4/7 in v2) due to squashing of patches 1+2
   per Kamil Konieczny's review feedback
 - No code changes from v2

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
Change-Id: I1f8d7c1b76d8a2e3d5f6c4b9e0a7d8e9f0a1b2c3
---
 lib/igt_platform_filter.c | 13 +++++++++++++
 lib/igt_platform_filter.h |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/lib/igt_platform_filter.c b/lib/igt_platform_filter.c
index 5e2e7c744..7ebdeb419 100644
--- a/lib/igt_platform_filter.c
+++ b/lib/igt_platform_filter.c
@@ -577,3 +577,16 @@ int igt_platform_filter_dump_to_file(const char *filename)
 
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
index d64450489..b4639e610 100644
--- a/lib/igt_platform_filter.h
+++ b/lib/igt_platform_filter.h
@@ -119,4 +119,6 @@ void igt_platform_filter_dump(void);
 
 int igt_platform_filter_dump_to_file(const char *filename);
 
+bool igt_platform_filter_is_initialized(void);
+
 #endif /* IGT_PLATFORM_FILTER_H */
-- 
2.54.0

