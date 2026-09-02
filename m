Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573D1C624D4
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 19:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECDAA10E055;
	Wed,  2 Sep 2026 19:36:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vA1ApaZV";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012039.outbound.protection.outlook.com [52.101.48.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9268810F32A
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 19:35:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wO6Bnn3u35nwiFaQnkpLTx8H9Wh9A+TEfOoH1+D9d9NqW69ZKU8WQXJRtdj2g8Ih+lOshl3VTMgWiVtDYbwVl6IoFMDg1hg9SefOk9tiyaTn2oojcY1Q3rGFwHNgrU4+Bslt86TdOsYHHjcwnGlIZu+kmgesAE9ZrtFqY3GZUhhYdezn7LeoKQXJzQEyCe/lHYfJq/bpcAaYFn2ugvYHyF0vG4Z8JD9apBeWAslHKjyCWnV7oU8oI1v6AxcUZXj4KIMTJY7IcwQAKz6XArvg/Jawy0OPHTu7G0hinKGOaq4/mclGbWTHHAhQQ0hb4PuCAgzBZFBRPwmFQgHAC5x00Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T2tPxyH/duZrpDxvbhKxiTmmDS7DNRk+T6FlORbAW0M=;
 b=lXrt2OKEp+KouMc/4ldEqcbpI7yX0kb5A43j0CmJavpPjrKHCvyhnpEorG+uwdB/ooM3qm6Xyc83eHXTNm2K7GTVoFiWDIo4NMeMOGInFQV4hw9Kfiz4+zpRwfzTz2wWhKJaU1kaiBBoI9AvyrVeSgnzbLqP1tqwsUdJDBgKImVYpmFYSQ2P31rNsVdTZPWIy+/6fbw92XsMdGEbbuMfHCCLl47u2LVv3bEZP20JJl051sGpyh9ivf/ZqY4FNmLDUUieIlYUBEC9fYl8cQw2zgQUt2c0CiDAzbJD7DMH5NHaABv6P63xJEygy41CWwwyKnJNNBKPj7ZsyjTeS52EXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T2tPxyH/duZrpDxvbhKxiTmmDS7DNRk+T6FlORbAW0M=;
 b=vA1ApaZV57K5kepDF1a/ho40wVPZHJGumcfx5vKVazZPUdtf+0eH2gNth4JYk0s9vRU1BEFBJjKi95z4RWdSy85LVIGNX4TuCyx2m2hW/1yzZF3ckgF+CGBnC01Hrb+Sko3aXSoWOwW3+z4JCQFofn47jDKGoh4gHQpswAmwYi0=
Received: from MN2PR03CA0022.namprd03.prod.outlook.com (2603:10b6:208:23a::27)
 by CY5PR12MB6177.namprd12.prod.outlook.com (2603:10b6:930:26::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:35:23 +0000
Received: from LV8PEPF0000005F.namprd02.prod.outlook.com
 (2603:10b6:208:23a:cafe::3) by MN2PR03CA0022.outlook.office365.com
 (2603:10b6:208:23a::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Wed, 2
 Sep 2026 19:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 LV8PEPF0000005F.mail.protection.outlook.com (10.167.245.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 19:35:21 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 14:35:20 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 14:35:19 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>, "Michael
 Strawbridge" <michael.strawbridge@amd.com>
Subject: [PATCH v1 1/1] lib/amdgpu: prefer chip_external_rev for platform
 range match
Date: Wed, 2 Sep 2026 15:34:45 -0400
Message-ID: <4f7b395577beb808223f0a3e77538aca850bae7f.1788377261.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <cover.1788377261.git.vitaly.prosyak@amd.com>
References: <cover.1788377261.git.vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PEPF0000005F:EE_|CY5PR12MB6177:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ad70a7-a0a0-4a43-a0b7-08df09295404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|11063799006|10067099003|56012099006|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: W+FIJXbPN+FkhsWMPOMo55emDcXMe4QOZPD10nmivGNHp3myqFjKYcYt7mPKAP0hbPioVilaqDv60qmPiAVK4snC1S23O9nvtT43qe/tKxFLMGx6Rar8uJvXe9k15PWj+W6ZOgBx0fvttAi77Ka+k5STwlS1e/C5/bQPtXlfc5+MYIDqvJLrxblb823hDfRqX2qQjJ0+gHttLGYHKQLEZLD/wwqISmY1RLJSGT52ILUIwI80jyeSRvmKavQMZw3a8F2Sz26SGhBaLNTssTtulzXLfbufeNruvVwbyk52ctyVKF0IWQhQ5aj581DyVZhuD2Iu0lkIIQFP1tZu5g8wAyULlUTr/6BnTTBELbTLqVYcuIXWlfwFu4uhD+eQKb3z0uthqVEFdYwzBiOw/Xd8ulEhEUZDo3CNsaW2lD5hVBYZ3sUZ2pFXzx+cWGLMPP1y9AEH2ZWQ5qw9BkwAYGNblQZ0hAOC/9Y77h6jPOFOjpcnNBe7Ka12H2OT0aosM/WWDJ531J92c5oe9kA7WSAnLFX9iDGgFUvGKSn6bvcNS99WnY11C9WvO34yUtwnumyr0R0kvKqeft9phNFKkjKZY8ZEMyMUgkyrvU62FDdLeAOXHQmNQncTzaGtgvli6V5bXW5ImZcqQLFWGIYmtBNF+EYx/zp4UgscSmmXdLJpdsVe9DRO70IiV4O2mQEyg/INOG1iabpzKOVoMgCg38YP1g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(11063799006)(10067099003)(56012099006)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: SXul7EI2OJsZj8cZqRl00thZlFUO/Z/1E2fHGMXntUfk98GSMjn+828NPTp5DoZhz75mT75d10Jq1cBYsSbQpRLNoCSkhvzdbLQRJEeXIT40Ph1E/MRkomhlUOg6gqmgsk2FfB2WvXrZqGQZ/8JkMyDvXHXm8UJUFyk9cnH6veOVoeczGeiZAzsLFvUk5zIPPvokGPUWtWEhlVYgBcw7wIC38UNANXJ5wwUgzDF+DbmmzCAWZ5WzMpwlX6KRP9JPpsE/JbQFtoCfhR/jagV2aCMTzBxahXBn66wDHtFgdtB4kTKLRAalzy4fPM9WtwRuT6DFOiF47mvmnNMzYGuOpLd+fMuaBeUEzA0kUMm33fhNWYscIybizEOE+YmSTh1KoAQP4MM4BzeFk6gm2uGmQDdKjuAaDlxaVrTBsJsglTRoqVKCxga4rt22M58AELqt
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:35:21.7372 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ad70a7-a0a0-4a43-a0b7-08df09295404
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: LV8PEPF0000005F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6177
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

The AMD platform matcher used chip_rev for ASIC range checks.
On Navi32 systems this can be 0 while chip_external_rev carries the
generation mapping value (for example 0x20), causing platform rules
like navi32 (GFX1101 range) to fail unexpectedly and skip filters not
to trigger.

Prefer chip_external_rev when available, and fall back to chip_rev for
older kernels/devices.

This aligns userspace platform matching with amdgpu's exported device
identity fields and restores expected platform_skip.conf behavior.

Signed-on: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Michael Strawbridge <michael.strawbridge@amd.com>
---
 lib/amdgpu/amd_platform.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_platform.c b/lib/amdgpu/amd_platform.c
index c3461366f..bfda297e2 100644
--- a/lib/amdgpu/amd_platform.c
+++ b/lib/amdgpu/amd_platform.c
@@ -181,7 +181,12 @@ static bool amd_match_platform(const void *platform_info, const void *platform_d
 	/* Check if GPU matches any of the ASIC ranges */
 	for (i = 0; i < amd_data->num_ranges && i < MAX_ASIC_RANGES; i++) {
 		if (amd_data->ranges[i].family_id == gpu_info->family_id) {
-			int chip_rev = gpu_info->chip_rev;
+			/*
+			 * Use external revision for ASIC-range matching when available.
+			 * Fallback to chip_rev for older kernels/devices.
+			 */
+			int chip_rev = gpu_info->chip_external_rev ?
+					gpu_info->chip_external_rev : gpu_info->chip_rev;
 
 			if (chip_rev >= amd_data->ranges[i].chip_id_min &&
 			    chip_rev < amd_data->ranges[i].chip_id_max) {
-- 
2.54.0

