Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA93C3ABC0
	for <igt-dev@archiver.kernel.org>; Thu,  8 May 2025 06:09:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84AF410E367;
	Thu,  8 May 2025 06:09:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RnQ5JcGY";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D4E10E367
 for <igt-dev@lists.freedesktop.org>; Thu,  8 May 2025 06:09:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S55dkscgt+yREVMUSz6SVrmAS2L/8Jwu+ou3vT14sEsLF/LbH3+lgULEFy0H/kM6sPfEM61RVLKSC7rQDtBl50cmbgDQA6O4A6rsdKXc678+d4U8L1BOAOdswaYr9QBG2jzcX8S3Uam9tCMAD6HR7eBqJoVgLXPtY1Q2n3RrocQh1tDo2Z+wtCOD3vFenLIc9aO+/Kjd1AC95Q1kBf82dqiMSxdU7WF7nyII2AEKUlnfCqg1j1bCfMk2DyM1PByYCf6/w8dfbAZoUPeXSPJJ+74xniGDI3UzI76o2AfwABE1zwkzWcJellZdheDi2xQpa8EH8RGTXUzsaoKFSl63ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mGK60yj1K6IPamfnfmsKaqDxyWzLcS2cn2oSNwT/eMA=;
 b=TJ49ofw2rzGE9vMpeCBIgfzwXUxUSOQe42+ZizEXJBJxdq6OtXOZMn0K0iTpZw5/+SyKJsSSkYGA/uYTvVudqAJFyLOBtN75DwXG6jZXiN+1zk598IxAaI3surqPktKbxV/cLEIJUS4igcbs/NZ01d7jiAeJdh7zomNOr4gBIfoLsJQdmT8LQTqfIP7gwUz0Ox4oQTECJODTxqT7018A7JKY27hfJ4n7QHsJCcQm68eAab816dpdByiyrVzo70BJrfh4HgQaWF5jFE9bxtQ9leC/lc66KB+LRWvFYNFUudJ2jRUsDJVVkCcdLALiF+b9/IofnbVqFVTLqwd+3GiHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mGK60yj1K6IPamfnfmsKaqDxyWzLcS2cn2oSNwT/eMA=;
 b=RnQ5JcGYw7grtOiEDT9XWrI5hdoiB6I90/yt02e9PnemlFy09neq/UCTAweG+ZKQg6fkNrQa0JyoShHsHYImc6KFxjcRmzon0FUvuXQPiA5X0LGj1KCLT+I4kONyhQxXXmDyoluj0VKylv5GvR8v/dnn96zpOFDMb/yzh5F2DDs=
Received: from BL1P223CA0023.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::28)
 by CY3PR12MB9605.namprd12.prod.outlook.com (2603:10b6:930:103::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.21; Thu, 8 May
 2025 06:09:15 +0000
Received: from BN1PEPF00005FFD.namprd05.prod.outlook.com
 (2603:10b6:208:2c4:cafe::a1) by BL1P223CA0023.outlook.office365.com
 (2603:10b6:208:2c4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Thu,
 8 May 2025 06:09:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFD.mail.protection.outlook.com (10.167.243.229) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 06:09:14 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 01:09:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 01:09:13 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 8 May 2025 01:09:01 -0500
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>, "Prosyak, Vitaly"
 <Vitaly.Prosyak@amd.com>, Sunil Khatri <sunil.khatri@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t 1/3] lib/amdgpu: add timeout support for user queue
 submissions
Date: Thu, 8 May 2025 14:07:04 +0800
Message-ID: <20250508060900.2821847-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFD:EE_|CY3PR12MB9605:EE_
X-MS-Office365-Filtering-Correlation-Id: e9cfacc7-fbab-4a3d-092d-08dd8df6dc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?oil6Ru+R4UoSCezZrvoXtXElpGDCK38wAlUCaAEhVfuo8cQRMr7tQnY8m8iG?=
 =?us-ascii?Q?E0RIg/DIuvGXiI+z8LjeuX+Hpn+1IorleUXUPSzVGCTQsJu69Nv3kn+Swcji?=
 =?us-ascii?Q?NwmXVT0xz6RZInDccC2uMY1eadzUmww7qaUiwkDCU1XkR6FG9wGfBFmkH5ii?=
 =?us-ascii?Q?pOaU9rtWWHyvJ1OgvMuRorQ0NetZgmh/X62vsciU0I7iv8zFfAJeI7Hq2J4v?=
 =?us-ascii?Q?bVaOACxFAIwFXbpG7RC4T9z1Lf2q4V8GjhE/SoQZPnl7ZTdXJ5vkggd5dsYI?=
 =?us-ascii?Q?o4wFX3qoU54A7Yblhe2rvlnIocYgdatWxCrOCcr6yy8cegXuCmEvfNE3OxCX?=
 =?us-ascii?Q?verPZd5mvswDibQR3jBJAuJj/muURAI8X1JQoSDU+PU50APibsiX4GY6WBh6?=
 =?us-ascii?Q?5S9pNHhnu/avlkeC20kGvSluSiahmSoF5gBl/nJysOEsBWdHsKJE9zjCsrd3?=
 =?us-ascii?Q?1h8jmU6fYl9M5MTm48npAJOvKY9B27XfNWM7OcddqDdYRGoBcAOJXLr6uZY2?=
 =?us-ascii?Q?R+BFYZRjdMNLuMazr88vygHsCOHIILRI5ghnztcKoHp7LrT0ptRAM9Ce/XwL?=
 =?us-ascii?Q?KmE5MNpLfLBkA9E1F1/6M6HB7m90jWt6xOGqiWx0GwnZyu2IBGbozcjqdh3R?=
 =?us-ascii?Q?C7wJOnW/gi+DxrMLcVsMJ9cYs52z5wkC/lIg9QaqRTcrgplX054xLk+qnBdb?=
 =?us-ascii?Q?P3hlWJtnHR59qk/GlnqCLl0dAdwB6Du55/OTEM6rF/IQ+4tPCKt3QuxYhGRf?=
 =?us-ascii?Q?8bxK5sLfiWj5Jzua3R3TK6CaZQ9sDrfmryVYlBGmdPV31Ja2cjWntijlFzyp?=
 =?us-ascii?Q?IAkZOPBVIZ8fOTuAXJbmUtA2k7Xy+OvYoeecwc8qLfE6clGaBRcojWSYBdf6?=
 =?us-ascii?Q?xTjEmSD8gSkjCTNcCEILzJHDzVMIlw5DEme3qETnKOdTqJ8RAmsPqVijoFfO?=
 =?us-ascii?Q?Fhsu202c2SPEUxoSvIQ3lP4U/Ht7HgsiPzI5yDgMbSzEOgVfMob0Kank2Pap?=
 =?us-ascii?Q?1jM7q5xpMDvchTaeHEV+h/KKdohAQvIvmoC91pn9Msg8NAnTnDkibmD6r27F?=
 =?us-ascii?Q?ICDxgw83jh71ofFQhIZGZ71Qr3dIT9zT3KezcnkHqIYlC7tXeFtHLRUCHhGL?=
 =?us-ascii?Q?IEv0KCCa0aZCjjQ87abY9oEvbmfmx6NCgZLs+0NTXz5JpcWEbINbpus7EWJB?=
 =?us-ascii?Q?MMskjNbqMITI7Fyh9W2bqPLej4D8nuHo+HBW6zXFm/BWydfD2C0SeFdeowTz?=
 =?us-ascii?Q?L6bW2aiyUNzlEfrhaJOV+IFWb6LGIxl9sTyYMfs/o/wZ/iLvh0lJNwnsR1yr?=
 =?us-ascii?Q?6/06eX2UYvTCzhtyFp73JMoQ2TJYiNpBeAaxe3VlHJrxpW3MQ0MeR7exY/Q9?=
 =?us-ascii?Q?Z4e6lTkQvyVLJ2vFJz8JNkQ9yjZFXxhFLydt5ahuNSHAHKb29hkuFxBZPJ21?=
 =?us-ascii?Q?pDNgqq2iIFkmmXNotSqZ5wVmm/0bZXHp7aF883SFzT5s/eqjVmSqZeiVBAz7?=
 =?us-ascii?Q?lcLfRCoJB8/VbEY6LYlLHOscAF6ldQ32d7LH?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 06:09:14.9086 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e9cfacc7-fbab-4a3d-092d-08dd8df6dc09
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9605
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

This patch adds timeout control for user queue operations in IGT's AMDGPU
tests by:

1. Adding a time_out field to struct amdgpu_ring_context to store per-ring
   timeout values
2. Modifying amdgpu_user_queue_submit() to use the specified timeout or
   default to INT64_MAX (infinite wait) if not set
3. Passing the timeout value to amdgpu_cs_syncobj_wait()

The changes allow tests to specify timeout values for user queue operations
rather than always using an infinite wait. This provides better control
over test execution and helps prevent hangs during test development and
debugging.

Cc: Prosyak, Vitaly <Vitaly.Prosyak@amd.com>
Cc: Sunil Khatri <sunil.khatri@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 3 +++
 lib/amdgpu/amd_ip_blocks.h          | 1 +
 lib/amdgpu/amd_userq.c              | 4 ++--
 3 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 80d03a498..fcc356f8f 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -153,6 +153,7 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
 	ring_context->user_queue = user_queue;
+	ring_context->time_out = 0;
 	igt_assert(ring_context->pm4);
 
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
@@ -280,6 +281,7 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 1;
 	ring_context->user_queue = user_queue;
+	ring_context->time_out = 0;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
@@ -374,6 +376,7 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	ring_context->pm4_size = pm4_dw;
 	ring_context->res_cnt = 2;
 	ring_context->user_queue = user_queue;
+	ring_context->time_out = 0;
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 3c2ecd1ba..a6c35c171 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -175,6 +175,7 @@ struct amdgpu_ring_context {
 	uint32_t timeline_syncobj_handle;
 	uint64_t point;
 	bool user_queue;
+	uint64_t time_out;
 
 	struct drm_amdgpu_info_uq_fw_areas info;
 };
diff --git a/lib/amdgpu/amd_userq.c b/lib/amdgpu/amd_userq.c
index 50d058609..f8e1a4b45 100644
--- a/lib/amdgpu/amd_userq.c
+++ b/lib/amdgpu/amd_userq.c
@@ -133,7 +133,7 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
 	uint32_t control = ring_context->pm4_dw;
 	uint32_t syncarray[1];
 	struct drm_amdgpu_userq_signal signal_data;
-
+	uint64_t timeout = ring_context->time_out ? ring_context->time_out : INT64_MAX;
 
 	amdgpu_pkt_begin();
 	/* Prepare the Indirect IB to submit the IB to user queue */
@@ -179,7 +179,7 @@ void amdgpu_user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_co
 	r = amdgpu_userq_signal(device, &signal_data);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, INT64_MAX,
+	r = amdgpu_cs_syncobj_wait(device, &ring_context->timeline_syncobj_handle, 1, timeout,
 				   DRM_SYNCOBJ_WAIT_FLAGS_WAIT_ALL, NULL);
 	igt_assert_eq(r, 0);
 }
-- 
2.49.0

