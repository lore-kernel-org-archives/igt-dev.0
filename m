Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C012FCD5BA2
	for <igt-dev@archiver.kernel.org>; Thu,  5 Sep 2024 10:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2716310E0E7;
	Thu,  5 Sep 2024 10:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q47kUohf";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC96F10E0E7
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Sep 2024 10:08:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZaHVU7I1Cip8XyYmWfoPcy03LN1hj3u20VQfI63kZbtoucflSip4D66QRXlxkFwzEw7OJP8goFLvmjV3dtDD8bne8fEBTWmWORqRM1qS7aCqTtMt+jX7UGEojXJlS2TeajBlK4sdtD0TQEkDh3os6KRkogJCA2C7u2MoKgc9RQCzTjqv1DEZg63++qhIMiyNHr0jEnmt16kI3SzmGFJYpCqpmfCBg8Us2yu/t9dqICWCnvdd04MVgDVaViwntMva2kBYS/qE4T67bQcOnvIQRaxfydOP1bHHjxgWDd34Q4lnD9NmYX6JCS557HeLxHlroeFGTWpms0xGi53yvPqRUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VB6srqTJhynElVi7heGxvVHg8I30jj3HJxE1bid8tW8=;
 b=WNzBRWVQGMkO9G5pD3gqEBY+3fgjsd8VHmSDg/vT9R/sw6hcEJ7vlPEbdYmtbXZlCerdqaz35raJ8mnJFciuuZV0tuKbb2QyiUW0ZG3PFTzVTWehLI4XFfySKZFkRAdbm2UHItReLqhy7mlkagoTZWUZCgWIrtt64c/m3IHTqfoJRPcc6Ayw5P8iRUMkm34wXpJ64VKdYIYbuargQ5nHnjdtUiHjpaLICnuU0zxJwgj4bI66IbnNnUzSIpaLo8wjItdRm6dDuuHAyPMwK1shkyIFZPa1yUv0Kff8hJJpKiJr5bn0hDtGmPn3ZH8ZElA5y3BScvMqvqxo6LWA9tykXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VB6srqTJhynElVi7heGxvVHg8I30jj3HJxE1bid8tW8=;
 b=Q47kUohfjSGhKHpyNCgLb/pR2V5VCQG6xY2T6KfffUO8YnaWAlopPLShdboDnRs33zTYEouYVCWC2P70JGBjpPBwl+Uf/TF9Eb31kQBL5/NozB45+enqma87AjRxgfyCbFtsi/dg2wCsUskvohhsNt7X6KNNAt7RjPDIObOd+7w=
Received: from SJ0P220CA0013.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:41b::20)
 by SN7PR12MB7130.namprd12.prod.outlook.com (2603:10b6:806:2a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 5 Sep
 2024 10:08:27 +0000
Received: from SJ1PEPF00001CDF.namprd05.prod.outlook.com
 (2603:10b6:a03:41b::4) by SJ0P220CA0013.outlook.office365.com
 (2603:10b6:a03:41b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.14 via Frontend
 Transport; Thu, 5 Sep 2024 10:08:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CDF.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 5 Sep 2024 10:08:27 +0000
Received: from ldev.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Sep
 2024 05:08:23 -0500
From: Tim Huang <tim.huang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, <alexander.deucher@amd.com>, <jie1zhan@amd.com>, 
 Tim Huang <tim.huang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: fix a random P-state test failure
Date: Thu, 5 Sep 2024 18:07:50 +0800
Message-ID: <20240905100750.521280-1-tim.huang@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CDF:EE_|SN7PR12MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbe6603-828a-4318-f70c-08dccd92af9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ptf1wyjLP10kD4kU5gcQJhIF495zAcWN1kDoIqWgzp4mQR41sGQQwE4mTa3e?=
 =?us-ascii?Q?635226VtKwGhKPsRGJZU2FYjxmpHbWaQQqrRoYey2Brnif7fuS/sF7ABew6R?=
 =?us-ascii?Q?oNbbKUf8o7Eq51sZJSE7+ErYfYeLuXk60PjMLt4QIoj3ARByodNsLoR8OjZ5?=
 =?us-ascii?Q?E8GM+UtHbPbY6g+zxi2N3binQWqZqiWhkZdZti5NVaaKKE1DXsm/rYPz7scG?=
 =?us-ascii?Q?LjXUuFGGU3JUISa+Vj2qU2g9OgpRYIS+wIMecPk6XN9U/ZkmnvO3wenlwdkd?=
 =?us-ascii?Q?s6kjXbwnMVxYDtlrE0lTWSKDZ6B9SFhklkzlaGBNkycGuAOGiOpOXe3wUVwD?=
 =?us-ascii?Q?m2sXmZJe3CvP6oI6J+GBWUA1gSN7ItBQWuCwaS3JHGQcNgO5H9DitzL1P9gf?=
 =?us-ascii?Q?yBRZIZCGBKzRA20q3ZU9uBclvWqLLUHzbAbU7kjywyg0r+1sG9X2Y0/gg2K6?=
 =?us-ascii?Q?1bZojFZ/UGFgK6+ZYn5F7XXjqKZSiAzbgbNEldZ/TnfQhuIwprXW51SJQhX7?=
 =?us-ascii?Q?aA8R7IbhsQVcgjq1F4t9i9nsEVNy0WzDOGutYqJbygoJE38JHP7g1F1pPwmb?=
 =?us-ascii?Q?1meJw2KvK0cXXQQAhTYr+4iLz1RNZBJmEhegCJOTjmVKAovF8tgOBvWd2FMH?=
 =?us-ascii?Q?PTTJtIXUZ+HFV1jkX3ad7WY/LU0zvMOedacps6qcG7v1+dHCfG1u470xMZTX?=
 =?us-ascii?Q?IZc5t3Tjwea2vphYLYAyoMofx8p7m0bHMh+kEr2/5qCudWdpPRZXbpSb94ZC?=
 =?us-ascii?Q?d862UUbE7aWzbxCSF6RRjd8R1b0eF9bd60vj2z+ncDsLxooOCVLCvQx012a2?=
 =?us-ascii?Q?cu8I+bhMCc1QlMnb6Chpfx2k9ONgO21A9DfdJEvzRpUck7yfmcM6bKhYsG6u?=
 =?us-ascii?Q?YZaDyF9ma14jZesGgYdahcVK75LQ6dJ3KQyr9TS4AaMRW6LfB+5F8EdefrbM?=
 =?us-ascii?Q?pQr675TZp75dy/xpI/qIljRklIMP0dbhoD/j0T19cLAhJX2v4cbaDReExl0n?=
 =?us-ascii?Q?jS0rlC/vcJwYIXm+btKV2WU9cNSNWCCKuU1PoGV8apmDoZe6kdc07gzPTEw5?=
 =?us-ascii?Q?mxwQMRG96XbImlvfchXE2alZ4IQKQdYkS6Ys9yKX00VvRADLPh7MlJmTuLYF?=
 =?us-ascii?Q?6C71KRIhJQMNqknZhaVzf7yIdcBPhIsX/Oig0RCR1EFM774hE7gy53DAuVv0?=
 =?us-ascii?Q?S4WuCv9/G46d1mZ6vh/sv/JJVfA4C3+XpAqUr4rnyZ/oXlvIPf+8YFPdfFmL?=
 =?us-ascii?Q?p4iyh7rPA7N85xjvMiUPBfQFQDdenahY5lLsw84knCMYYYOZ+9HsbzJ8HNGH?=
 =?us-ascii?Q?yoOjZItz5DrJ0QonP61fF8OTxfoLrjrtUMeWe0zWJCSjyYv99hFr1D0bo+gz?=
 =?us-ascii?Q?DohZMGNQOmJROsILny5KsBBfYX/XnaywHdKXbF1A/i4pQ1xg7H4QViSKTjKK?=
 =?us-ascii?Q?/XlNWDFyTQHCzQDelDSxcsC9FM7X5rwo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2024 10:08:27.3449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbe6603-828a-4318-f70c-08dccd92af9a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CDF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7130
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

We should use the current_pstate to compare
with the default UMD stable P-state.

Signed-off-by: Tim Huang <tim.huang@amd.com>
---
 tests/amdgpu/amd_pstate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_pstate.c b/tests/amdgpu/amd_pstate.c
index 9a7873538..2bc794252 100644
--- a/tests/amdgpu/amd_pstate.c
+++ b/tests/amdgpu/amd_pstate.c
@@ -23,7 +23,7 @@ amdgpu_stable_pstate_test(amdgpu_device_handle device_handle)
 					AMDGPU_CTX_OP_GET_STABLE_PSTATE,
 					0, &current_pstate);
 	igt_assert_eq(r, 0);
-	igt_assert_eq(new_pstate, AMDGPU_CTX_STABLE_PSTATE_NONE);
+	igt_assert_eq(current_pstate, AMDGPU_CTX_STABLE_PSTATE_NONE);
 	r = amdgpu_cs_ctx_stable_pstate(context_handle,
 					AMDGPU_CTX_OP_SET_STABLE_PSTATE,
 					AMDGPU_CTX_STABLE_PSTATE_PEAK, NULL);
-- 
2.43.0

