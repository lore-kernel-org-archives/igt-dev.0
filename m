Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDF1C43602
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jul 2026 14:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55EB610F820;
	Fri,  3 Jul 2026 14:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xHbMLlsd";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012023.outbound.protection.outlook.com [52.101.53.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D7910F820
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jul 2026 14:11:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gd04PVD5+ywsCyHGFCwypuWE/dapRkZIIQzHaR2fcW6/7xfwREEYSvbQkVgwRTMHp1pHPdSWQ+WoZ2YuJY1vMAt7GFAGFCkxvjNe2DrcTHvV2+O/370VRRCVyFNhLqD1ytUDjit+4i7kkC+yo9ybtFhnDRGnQUuWPHyxJz9z8HNS7MIYUA1+lhM78V17BOESLisVLTllGfnUo9bFDGpgeQXwx2cLHB57iV8ByI5wneFToq5ftmsvFRYIqUfX7pyRBrKQf1IX2YLRxTOD+4f8OpXRN6L6F1wxDDEeHeaWSt9ZfqbOUuBo0Ju6TB3WoT+UTCnj8vmY7MxM8qtjjD37cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G7RNp2Cizn/gFKe/qkJqAnoddJTHzglT7YQpTUmSB28=;
 b=m4hnMdCRNZqRCNTNCTtfdTKxFlfC50YlrnmQzL3SNzFjIC5bfgIBYC5WGuKicCG1t328Tr+Zan0hJhgUKkTkAaEb96SV862TbsFWdCY60p9kVElIiyh1boc05F2zkowW+tHCxncnbfNkkZ/5B0wuu3xCqg457jx2f19+hKsZHDRso1FzKUxkFOWDcSs1zzQMFlkt4TzeZzrwWLb+PxihNOyIDCTL19bSoLntI4oun4PGEmrS91mgV/WfrNKNllYZwK537S4670uACRtXRO4yFDnVvmyffRTZ4zvEWDhfWilBWQOmqnvLC1tu9TAb4DRjoM5bC3RhNP0ybeppxVf5hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G7RNp2Cizn/gFKe/qkJqAnoddJTHzglT7YQpTUmSB28=;
 b=xHbMLlsdzJ44NFqDJe6UlSsPMNAPlZLsgnCjcbCTKi/lvVwMoJQ5v5b2cdLcK3KWGKm9vvTfJtptaTMFj4I+PK6VtLYaqDoWuvt2FWLGsU+QVX8wpkK9+phRytYmJd/1LN57F/d65H1NiojDTPSkf1OlIitQ8tJnGXzv+G1IpOc=
Received: from BY3PR05CA0026.namprd05.prod.outlook.com (2603:10b6:a03:254::31)
 by SA1PR12MB7040.namprd12.prod.outlook.com (2603:10b6:806:24f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 3 Jul 2026
 14:11:48 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::63) by BY3PR05CA0026.outlook.office365.com
 (2603:10b6:a03:254::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.3 via Frontend Transport; Fri, 3
 Jul 2026 14:11:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 3 Jul 2026 14:11:48 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 09:11:22 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 3 Jul
 2026 09:11:21 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 3 Jul 2026 09:11:21 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: [PATCH 4/7] lib: Add platform filter initialization check for
 automatic filtering
Date: Fri, 3 Jul 2026 10:08:24 -0400
Message-ID: <20260703141115.69015-4-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703141115.69015-1-vitaly.prosyak@amd.com>
References: <20260703141115.69015-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|SA1PR12MB7040:EE_
X-MS-Office365-Filtering-Correlation-Id: a3213ee3-f2af-4de3-2886-08ded90d05a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: o4Ct8KvHY5JxQ4O0N/e4fiyYyJFdh4L7sRkGg7RzlxLwhhLU6NgS2hdU62ydKKO+KL4iRQmjHD6SD4nFlFu0O43IfA79IJRY94YF197SfUYF1UqILXOuVmpxRg6+wnOOA4i//Y08TOllgIfEX5oTb5neyvxfgsdjRAfX2Ns2msn/i3dpDa0OdpiRb7xKZpMCn53fjW8fgfmAcM306tLW2vEn4pXFXM7FVC2Y3RJv4StQOgRgOJehBjgrwQmXuqki4RTUcqytUV8LY42FacyGvp/ODu5XIKPHlLXJWn/LAay67F+jlnQ7dt0zkjZQTvzOfxWiMkQIdZtsrBrP4huTcuTBKY0PRVaAcf6I24umwNPGyqMK219z+OiyVeXhOnv3exfMOH3evtUsQ+zbMrwAvxCHh0LFTjqxWYpos8fSgo2Qr5MKFH6AC+5n3gyDm9NvHlO+SGT1SqwRgHpiFoo5krDIOF/+wR1JMCFXKgByHjIaOIzp9Q+C2l8PdwvlkpNp5ozEtqcW3+lmKkpdPfnC3IlEUp4DGxTKGkkSzr8+v3U1mcScUnk3tV62fj9hlNP7Jka/l/WpS3ltkmnj3983S8FAH6+hq6pJ8FQALMgRW4xg1gVlm5ZMuMDOhMA21tZ126k7JErcfCJQlVqUCejwQ30AN65dRY/jk9oKxfTm/GIobuAMhixHus+B+OF9pFhe
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ENzOfoErr8Hy21a50Vw+AEJK6F4/054x5tUXfJhOGG1gksnrl1qNwRIAiN7r6Gbjx/4v+REP8m6tfmplcFRZ4Q6nDMWe/l06mm45qACeJbiMeeTtBVleGhvgKEyiJt6HLBVVC8WUH5n45SFbxZqdNbSQ+M7lZfuQHHFW2y8KC7PpjDnw3hPEax90/3u3EpzziQkXa1Y95ygW+5+RVjg5Y0cbDtlqQOEpvzCQQhuXUHkhQSxXcbAZqJGtxJ7JVYQcElXW+W+pr+LMQEebIqnQtZsoUcYSRWkS5109xUC9/VdWEbUP8W4BLgNiFbJEo6w/UecPmXtu4JErwf4hCagbu4LQT1NloQ9QvODDxWPJzaoXIQSQe79hh/xB10cBon9ehfQWlqt6rsDpRJpnMJWkyZlhGX6Fi4J0tiYCkPeWew40AY+aGLrGoaNZQPKEO2eo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 14:11:48.4832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3213ee3-f2af-4de3-2886-08ded90d05a3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7040
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

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
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

