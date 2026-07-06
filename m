Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01AC3C43458
	for <igt-dev@archiver.kernel.org>; Mon,  6 Jul 2026 23:53:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67D410E28C;
	Mon,  6 Jul 2026 23:53:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zMOPEZaU";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012019.outbound.protection.outlook.com [52.101.48.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FBBB10E28C
 for <igt-dev@lists.freedesktop.org>; Mon,  6 Jul 2026 23:51:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+ldTAfRjUFQt05Trk9CasFnC0A/YWoJGqDDi7UWC0s49BXBjKZBPgutT3yr4wH966mwVck6o1uEPAFPqbA0K4DoCC+fs4jFwjBIe+7FMD+iKeZNO1jPnjZj5bkGgfL+/WlR+H5DWI1q7PfP26IzndDGLfPdN/tq5aXoZZYhQM3INvmYT97iiVmHDlRO4MGxRyFdTHJMMUiOiQ2RJzqr3pSL17Y8pNdvbPIvjKRmSN/5WmXNJpgSmprvbXQbXYL/Iy5ZHA/qmqt9/F4y3nBhHbLbXEvyifitR5qWaETv23QR5FlCp8/Kp5lkjc0QT3/qvZfc3JeUtgIZSyQ/S2kBhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZWvScIw0yHiYADXkLX9T3OqBiVmEdD8PVDIItyqj40=;
 b=VSQTCK3Mx4zhoJBv6igR31p+3SX9kqkAGlH0rH47OMxM0c9RO8bdN3lzdA6xNKiDYoEQ5jQPcVzJHpz8OoJNp0Wgsj7URJdx4wQl8gdjGWhaxl+9RTC0UQ1NSUEsFXv/eJvbnP7SlzxB9M4rNFAAafizC7rwO8oXBtyqx7+4B9voyA/kJMS76obSTniHBSILOWMI62IyTu7shXbIbTN+aGtLno9iCl7lfPQCfKFw6MYNLdzWCuEexUeCDctOHhgxp63wVEeb+0t6ATamm6OhBzoW4n6XcENWJArMrm7MuJx+p0yi7LoQM2v3gHbPefX8ZY99xWo7E3bx+pTTg+t4Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NZWvScIw0yHiYADXkLX9T3OqBiVmEdD8PVDIItyqj40=;
 b=zMOPEZaUAxzd2I090rJX2QkqgDplHtFP7ZD0S5cUeK3Ukg5wzzMbsm9GRxCmS90unmgPBKwKj47KC0Bi0hmgq3ncuo34TPes9nTLvBT6rJmddybGdZD5QGFapQHlq0WVC9XCHoFVkezXdnhFq1n/4Mg5+vIRxBQCe5PECwGh3LM=
Received: from CY5PR19CA0050.namprd19.prod.outlook.com (2603:10b6:930:1a::34)
 by PH7PR12MB6785.namprd12.prod.outlook.com (2603:10b6:510:1ab::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Mon, 6 Jul 2026
 23:51:36 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:930:1a:cafe::24) by CY5PR19CA0050.outlook.office365.com
 (2603:10b6:930:1a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.13 via Frontend Transport; Mon, 6
 Jul 2026 23:51:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Mon, 6 Jul 2026 23:51:35 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 18:51:35 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 6 Jul
 2026 18:51:34 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Mon, 6 Jul 2026 18:51:34 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
 Jesse Zhang <jesse.zhang@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 3/6] lib: Add platform filter initialization check for
 automatic filtering
Date: Mon, 6 Jul 2026 19:50:15 -0400
Message-ID: <20260706235130.157557-3-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706235130.157557-1-vitaly.prosyak@amd.com>
References: <20260706235130.157557-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|PH7PR12MB6785:EE_
X-MS-Office365-Filtering-Correlation-Id: d9cf2533-b510-4e26-4b64-08dedbb983ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700016|23010399003|82310400026|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: o+YSoafNWdXxakc0ciSAGYmAJEGStXavJjLnk2ehVigKClDJM5cOY6nJbsap0VRlb3ZERh+Rfk0rcUYjSOW8uoezjmkj4AJZgIh9XiEemDF1STnB+F/jWes84K8dAIv0DylOQuIwSXiGyhED8O2B9UIAHsgEllldK/WLuxV4lQ75RFJ6WuiqX+Rq417PqIhPVRq8BNVKvAk8KGM+p1j/NTlmuEC71WDqF3TzvVtjN7WfFQl7IDPXesw5ewb4v3xFyl25rdeTmvKbjEll1kKsYu5GFDp0J21Ci2x0E67O6Y0elw9pbNrSl3/pLDr7PY7J+pjbFzwBaT8HJH+IZpj/nSbRVUas+jYxdJe1PCTPgAtVYNtJ1iVg3chIjiXbWUo6r8w2RkEDShtamJrpc4JWV2AxG/eZE/gdeE3TCTxsWA4a3x/sk+l14bZJ+1bVBF3SMm3/kzP2oI6Tai9d9ZbnrvbV4YRSJDueZYgg+YAj5NUk4xVkUGvidrXkLyX/iYKxTLorJ7IffphbHN+hTw5EB3FI2GKjqyZ5k8Y7VwzvmcUyrd5jD8ypA3nSTy/RFUw+uX8ZiKsxZerbaJ233bB8Fr3FfJXJLU60M/lft3Jr4N9O6X+IfTrUePbYBOjNrkR68cJllrGbhLTaVOo4gTwHa8n8vvUOF2cdw2F+S9Yj15oX7+SGp8iET+1XM/oaU/Os9aMB/OTsCE+PAMclRbAJzw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700016)(23010399003)(82310400026)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: xrEOp8PdT5A4FxJ0zGq5PvRLxxIGWpXV/hGo7ZVAsQFHgiWwPW5tunbq0dYmIbQJN3dkWETCvh3CFgSVnv7GO6fky5MoB3qP8pF0bbpPcYDX5tRjze6fZVG9SMH15mairh4ywbigZpRQ344LKy90oaVwiMqHiwzofqVEAfP5GmeGSMNJZnaLr++Oi2yqt4wanutx32EBRdTfOjDbsLOusQ81TNEE05VM2ykA0Y7ziiAwcVu5MlacjMAovw49WDif0s6Y3ROeE4fRbpPKpLeHh1roYsdDjyh+jCTq0RgrmSUPZ3WGfCtTokBGmESm9nPGqDf4i2bYNW6EqoCBpPinADvfH2lno02b03At7wMgybgFoBwY6ONzdMf1d0Wgt7wAeOC1zIWplgcNCfKeB+AgX+/RzMn2e3NnPuVQKyOVO11az0PtH0ZDOoO27W6npaEp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2026 23:51:35.7410 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9cf2533-b510-4e26-4b64-08dedbb983ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6785
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

