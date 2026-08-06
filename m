Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C945C55ABA
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 02:39:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B14DC10E264;
	Thu,  6 Aug 2026 02:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dLBl2iuH";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A2BB10F093
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 02:38:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9J7QyO+MblHWKy8LRSSHE7oypss3JaSn4urhb/3LKn78VTo63CpESc9JiKU91BdNphW2y4M0aq2FTa3SuG+VuhF5kEsGcC2AyC1Msm2GbLR9iM7E2Br87kxhFN+6m6aHvJGP6xgTRJhJZ9b+ZFKwvMTx40KW+wSyTX8cIeZloVKwI2xJaJ5L/8cJygFrHYjL+R7wWmahZDem8umamEK38ZNq448eJPM/ve6a6ogDi7+gsNjmL7swJkeb9GRbztz4NLHa8ifn/ZWttJmq69bQ4d6W3sMWR6KSM+KZgscu1Vhv65P6xX120RdSD3HZFKdTCr0qKgSW+dH4HOj44Y6MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SML9qmyY+E1b7J0Qoq8ldZk5+0we2jGlNfbozzmhtF4=;
 b=Abokmk6lYYlv1lGsxiThWG2K/ZXZzMJD8vFUQzxxyZ41E3SN+kw9oyEzhLNsI6nct+F49aJit793sCpRcmHXSYIpmY3zqmJQLigYTt9soWZ3EmB0Lu2+jGvgOJXBW47/lBjlqBCDlNCXmUitdBbaQFg3ubbBcPBE6ueSo2PoKfRewSCxuLEkgfgv8NzvZvF5lLZ5zClDBOMbaV4YE0hi6LI6UriJdMW9li/03wFMjRSrE5jfp4X4IlENONDIHZEk4nDk0EgXjuSWmXMJlbNmch4ryr56ZSeh2GAxxYm3i+AJk8xRhuDV9Bdx6D0aQ4mqWhyh62a/R2LaOu6jlTlROA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SML9qmyY+E1b7J0Qoq8ldZk5+0we2jGlNfbozzmhtF4=;
 b=dLBl2iuH4lFADPNaTq+TJx8/h+3B6zpIqSGBwO6arkneMivkhZ9XP5XTv8ZQN4q6TxtfK6YvShxZwfkwYwSPlLjt6/iG+xtShaMkIubT2QUvKvksaGEXrg1yetv2Ro0+6vOl1GAhhOxDY1usFL5jcYrP9dmwXKl/03TZAQOCcmc=
Received: from BL1PR13CA0103.namprd13.prod.outlook.com (2603:10b6:208:2b9::18)
 by MN0PR12MB5980.namprd12.prod.outlook.com (2603:10b6:208:37f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.16; Thu, 6 Aug
 2026 02:37:56 +0000
Received: from BL02EPF0002992C.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::29) by BL1PR13CA0103.outlook.office365.com
 (2603:10b6:208:2b9::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.7 via Frontend Transport; Thu, 6
 Aug 2026 02:37:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF0002992C.mail.protection.outlook.com (10.167.249.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 02:37:56 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:37:52 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:37:25 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 21:37:25 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <jani.nikula@linux.intel.com>,
 <krzysztof.karas@intel.com>, <krzysztof.kozlowski@canonical.com>,
 <jesse.zhang@amd.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v5 0/4] lib: Add generic platform filtering framework for IGT
Date: Wed, 5 Aug 2026 22:36:09 -0400
Message-ID: <20260806023718.204279-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992C:EE_|MN0PR12MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: aa9ac1d5-cbf1-4f02-60ba-08def363b912
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|56012099006|11063799006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info: EJzLy1Q0ldt95lGZSYcE7luhRkSCiIK+V05vkM0Dl4T1DAvv93zc+M9jG6NpAtHTfZDTMXY+3QTh6KwCt12xPRXfnqFBcGjGP7PaD+il1WIXlm0hg88ur/2GeRtF/oa//XlSnmnGgLUGtKupuRZDSEPTwT6f/xccJqPw+HBB84ltbbG5KNarS/0GjQZwWVuyCet/6MHVRKuFMYY7QBk8RSgFHLARnYlA5ClX+IGbD82+ByZTYhPt3FIKznbrgD2SbVXlnMoXKL3TiNWSvDlvhu3T2vO8TAPEqLF9K0JS9aSjdtuBb43dfQPVcPgegavDoKcx2S9LDQK+JK1LnO/FMpRChIHP0BW396KrV5CmbqQU806uuCMyTxCSyuwBUfbRbGN3BiVhEXWLcLE8VyayofaTafPWLdFqOsni55lUqo+/wCpF4oQhmDRcUzjW/mSS4342y8zDsnAb1xw7cKvCcwg0842eb2JyzCy+1Q8l6UN2UjuNak+bf8cSF6lZGjGZ/Q+QWyggu3V8/k5pabqh04PjrzRMcqHQtvyPnRnHHI9PfVEYmywgUu2CKyq6IbJnvYXU1gI0F76MYOdEqNrzOxSHQFHhd6QNr29PKtEYutftGqoGim7+hZy5PzAjMlEDIq4caIhM9CDGbLq3CyuWqWqPQxavMdaQBCyv/MEGBFOEQ6fiSf73bRqtRVFAF1uKgJa+IYtGUFO/f8qKhHlBOA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(56012099006)(11063799006)(10067099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VUlon0Xc9B+V7J92pEu+he+izXky8iqBZhWX8lIvGk81XSeBnmk7H9aQWAa0ccjtQXQ352p9TYAJnCjJ9oebiQ8YQwB9x8gHzeIgCaLlBydmwbK/djavlWRwiDf5kWfRrhM6B8eYa6BuTOit8YFxxZPBorBHqlMxQKd6/g2M2D9+Veu7nqrh2KBVHYfFP/5eL41nlwMgcFL+KKBIeLQ9b745YalCaMme/UF5/zr8qFX4rJ1hDX/i+SS1tdpnWi2j2adEVM4j/+D+d7v+WgKENTdShlngzUyD29O9W0CnpGw4mG0V81v1iHK8j0LK6OOBwYli1RX8HhTzt1YLODkWRwOLR4qNQyEUnN3rVTIXC7lX6nc4GGOTXLX/aBlrZ1fRCUxR5wpLgtm0+FpQf6FtOaQb+XgPGD8cWGyJ/zW6xJoluybzzT2/ZAJNi0SRh5ZR
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:37:56.5063 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aa9ac1d5-cbf1-4f02-60ba-08def363b912
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5980
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

This series introduces a vendor-agnostic platform filtering framework
for IGT that allows tests to automatically skip based on hardware
platform rules, without requiring manual igt_skip() calls in each
subtest.

The framework uses a callback-based design (platform_filter_ops) so
any vendor can plug in their own backend without modifying the core.
AMD support is included as the first backend.

Patch overview:
  1/4 - lib: Generic framework (platform_filter_ops interface,
        built-in/config/env priority tiers, automatic subtest hook)
  2/4 - lib/amdgpu: AMD backend (ASIC identification, name table,
        built-in skip rules, amd_platform_filter_init())
  3/4 - lib/igt_core: Hook into __igt_run_subtest() for automatic
        filtering without manual igt_platform_require() calls
  4/4 - docs: Platform filtering usage guide

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Vitaly Prosyak (4):
  lib: Add generic platform filtering framework
  lib/amdgpu: Add AMD platform filtering backend
  lib/igt_core: Enable automatic platform filtering in subtest execution
  docs: Update platform filtering documentation per review feedback

 docs/platform_filtering.md | 351 +++++++++++++++++++++++
 lib/amdgpu/amd_platform.c  | 328 +++++++++++++++++++++
 lib/amdgpu/amd_platform.h  |  53 ++++
 lib/igt_core.c             |  18 +-
 lib/igt_platform_filter.c  | 574 +++++++++++++++++++++++++++++++++++++
 lib/igt_platform_filter.h  | 124 ++++++++
 lib/meson.build            |   2 +
 mkdocs.yml                 |   1 +
 8 files changed, 1450 insertions(+), 1 deletion(-)
 create mode 100644 docs/platform_filtering.md
 create mode 100644 lib/amdgpu/amd_platform.c
 create mode 100644 lib/amdgpu/amd_platform.h
 create mode 100644 lib/igt_platform_filter.c
 create mode 100644 lib/igt_platform_filter.h

-- 
2.54.0

