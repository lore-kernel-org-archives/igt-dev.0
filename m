Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96C96C021B8
	for <igt-dev@archiver.kernel.org>; Wed, 26 Feb 2025 10:09:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5291310E160;
	Wed, 26 Feb 2025 10:09:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="185udrb9";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4364C10E160
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2025 10:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ToYnxVcEkeKBKU0BttTkoPzU+4NBkJfWfcIBnQB7goJ9FuAvpVWmAG8ORAJG1oxAFUHIzZIMsZ8kH1mr9SyrpNc37chE7hiTzraqedXe6EU4giqRBWlNj2+AU4LiwwybWk+AjMffIx7F7ivMr243zPNxPjSzl31xk4a1gvLPBfiKjmhwXC/ghNWY2L4z1WfjfABdJIUESOqKLg+HRzFO5uLFuMUzQparGTe0HZ0f3qCMEAXrkl2Ry93riSJjZ79QcvijLPsf9qWX9211PCBpHuDxKOyroCwTeIgqqEJK2HPwVNQSKUKHGWznF3ABWe/AfNy8jY9cztjQOZ2BauCYMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D7q2MnKV4+UZUeglNkuftPASa8LseEcXUG4jAtrph5c=;
 b=K1iTCpst2TSlYyn0JVTorBrTVpshKehgG2WkURLfcVVHToWy5++Hu3PMtrZz70GAiuN8zuMQqe6Ntn0UoTmNwzhC91FKPJY+n+r2yZSM3IOEVEEEtcGeaVcLAcFy7Pni5cDx5RggGSH0WR2UFFbXyp6rw5OaY0ssEX+8CjWABRRGwY/7DneO4+EC39RdkiMfbu6w8i4O4UwlfzGQcTp823oxdz8csIhcheXGBovLXVKZBnSyy7YcAhX/D5DtQJjwJsZyuWjtwzIv+bI6EhbZtf6ZxyyWpvDHFPSEqUfw6aygVIgFuFFQK2A7YEGg3uXJ7lavwNawEtjqgNIgBRGDag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D7q2MnKV4+UZUeglNkuftPASa8LseEcXUG4jAtrph5c=;
 b=185udrb9gfVzIC6Y+hk5fzbQf4LhXkdhaekPudoA4fDks7YkXhxGhtg0DPQ1GZR2J/h4TFVLuqg0UOeDHN12K1pmXc7WajfrUpuER61dDN8sbj+YKY2+MO7LEqoxIKDL/+FnabcyiSV/zhSTKJ3EyiVUG4Go2uWMzRWYfHqnO70=
Received: from DS7P220CA0062.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:224::34) by
 SJ1PR12MB6076.namprd12.prod.outlook.com (2603:10b6:a03:45d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 10:09:39 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:224:cafe::ec) by DS7P220CA0062.outlook.office365.com
 (2603:10b6:8:224::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8466.21 via Frontend Transport; Wed,
 26 Feb 2025 10:09:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 10:09:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 04:09:38 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 04:09:38 -0600
Received: from tom-BIRMANPLUS.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 04:09:37 -0600
From: Tom Chung <chiahsuan.chung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu/amd_abm: Skip the test if panel does not
 support ABM
Date: Wed, 26 Feb 2025 18:09:17 +0800
Message-ID: <20250226100929.3363-1-chiahsuan.chung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: chiahsuan.chung@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|SJ1PR12MB6076:EE_
X-MS-Office365-Filtering-Correlation-Id: 3bf13c3e-b25c-43b8-94fd-08dd564dae3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RWYNdff8vTA+AyJGv/UiBiFOfp1okCIUOyTV9vD8VxG3U3bY2CbeFRkw7L/I?=
 =?us-ascii?Q?y3FPRB296GhL4ReLpuy/wW5RU+V8ZS1XiUb6uLthg4hxSuDFzBmnaSH6WcUH?=
 =?us-ascii?Q?BHnKPzBLaw2ciNDA/Z87wdtiIVL58t4aht9EwRgjy6mzmwUVg27irBiKuQeu?=
 =?us-ascii?Q?usM6o9FXzVsOMT0xwQEczajTSAWqs8zk/F2I8KAyS3Z8P2EpIU2EKf05bBhp?=
 =?us-ascii?Q?LDYIQO0RWC0LvsNa3YY42FFFQqd7DvPFu5HYL32gScGNLwMux2A/h/hIowii?=
 =?us-ascii?Q?L1gbRoQBKDY3o5PL8Djpp9FXrSMPcgM2bgEzHQUy8LKHPzVIv11pgm8sHUEE?=
 =?us-ascii?Q?zcpY5c8IXMbndOccBbI+/UA7flc+Z4crAF8ztvuy/6ME9kZAjTr8pAWGXX/r?=
 =?us-ascii?Q?1R+3c6F52GcUPb7VJJ4mE/Ch9JihqqQjfqtOfn4eZNMQpZLofMnrG0cEdm8B?=
 =?us-ascii?Q?gIY2sn80M2w/4GRqrYA5ckVsckLnBk7bU4HWM/mcuXV/NvPRM7nxjNCDXzVQ?=
 =?us-ascii?Q?guXSpbqDumk1+9Ii2do/2v2R4cfcZYIDDLdkztMbkfLvnrb1DaZIhPkY8dKg?=
 =?us-ascii?Q?msjr6a3hd+S3pjSA5l6Qr+1R8tlBK0feppTlM/PLRWYCk5L9wUW3XiS058/G?=
 =?us-ascii?Q?TNKnVEoaT86EFPseiAUrNEk136S1tDI4dRWXkmF2l5HI/kM0dOcAQAGM3JuG?=
 =?us-ascii?Q?28v9G6FaOLyP7VHNqyEBrccE5JBox/j/v3udWLScvesotF7I9pXjqK4R+SgC?=
 =?us-ascii?Q?f4m/edBJWi+f52XcALvcvoS9Sj/GXR6XcO179QnVLMVa9DjM1cjPz728xY9J?=
 =?us-ascii?Q?Rj2QMQ2wBj22SL0oTFDndo5PctB4hdyd2i2Jc6Ki1NHVxfgaj4KcJAWFwccI?=
 =?us-ascii?Q?K+BgAVGS2RE8G5YXSBKxAFxAbfpnBPXqleHG8u6y2DTcLKePaHyUtPUvsOFa?=
 =?us-ascii?Q?NssTRixFHSTr+qyegV+Oikqkp7wF+iYZYUaIpnoyuWq+OHPqvtgFuy5phqCU?=
 =?us-ascii?Q?HdYFM0zUJ1+znAqlNtCiFxWaR08LIgrJJxDsQQIJWmaGLj366mJOuMzw+JkU?=
 =?us-ascii?Q?J7y/0SFPrCuESXt1ZaxQBzFUYnm0i09PRQIz1t9S4MjroKjGwzFeOfn8145O?=
 =?us-ascii?Q?/F+Vr2QXidUhRxtvX3DLZ2OAUGFe/lU3AD6q/wUizpyLavMVgZRSC3hO62eZ?=
 =?us-ascii?Q?BwfR51pEXfI2GFiZb8fupp1M3KNY7p4oXu/XS3plMnD1c++K2vHZQrdey/qu?=
 =?us-ascii?Q?mrdeyQsM8+rU295Gn8AnypuQHd6hemGheE1nFju2pKgj+lmnkv2ZL2Ex3rq6?=
 =?us-ascii?Q?SRvZ0xQSoSB0ssLpoZaKCbTPCTotTl5av4DoxWILdXE2xQpzeMu87HDTwIsy?=
 =?us-ascii?Q?UEIqG0oSbo83T4CKLQr1NtBtXvxYgLrlmlM6E8B8imxrfjW8Ds94dBMjiqU1?=
 =?us-ascii?Q?WIEEeE0Mvo4LMxwRREPTSNssC9IlwIO9c6RFRBOQDt/LO2XPFHvrm6aHSvK0?=
 =?us-ascii?Q?D0F5ExB+G6AF58o=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 10:09:39.1217 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bf13c3e-b25c-43b8-94fd-08dd564dae3c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6076
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

[Why & How]
Skip the ABM test if this panel does not support ABM.

Signed-off-by: Tom Chung <chiahsuan.chung@amd.com>
---
 tests/amdgpu/amd_abm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_abm.c b/tests/amdgpu/amd_abm.c
index 8f7f489ad..13274aa4c 100644
--- a/tests/amdgpu/amd_abm.c
+++ b/tests/amdgpu/amd_abm.c
@@ -191,7 +191,7 @@ static void set_abm_level(data_t *data, igt_output_t *output, int level)
 
 	fd = open(buf, O_WRONLY);
 
-	igt_assert(fd != -1);
+	igt_skip_on_f(fd == -1, "Cannot find %s. Is it an OLED?\n", buf);
 
 	igt_assert_eq(snprintf(buf, sizeof(buf), "%d", level),
 		      write(fd, buf, 1));
-- 
2.43.0

