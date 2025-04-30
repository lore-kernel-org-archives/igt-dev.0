Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C889C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:40:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 395A110E692;
	Wed, 30 Apr 2025 01:40:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GZo8KVQH";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256F710E692
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:40:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tK0h7sjpYkLkrH8BtuYDd4fFu/i29w5mO1KjDWQsKqyl1shjQNJE01AqLGyraqOqwzTfehI41vCsKURp264TeR34wOOLthyAlPaJC3VtnH1EfiP+7luLZoBwyBfVgLRtKwO+zUbCMe8237oHXo+uW20Pf7EMLg8xJ06rZgNLJJjB6XKcXYLlBi1Gt4pZuDHxHYzlD24ebkUFnnToBEllzPctbibf+MxiZqcDvAxd2N7cnMcgr5KJWErZPvjGBrqvXvvpXLbI4+k8wtKX8IXpDirH+kitNnJEIffOo7suEJSTYW51HozcHg/e/Rv+ENrRBMVucJb8lu5rWGiQjBzoyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDIO9NpD1ZKuztN3MLufiqq6ZPPaeW6da2ZTqTOFPB0=;
 b=FrqI+q2G4WvtHM86LKc2F20RRupNBQxTo+Ob9XxleYpaKuaUzl7RMfq3MVKC4x/0DsKhkgDOqq4IVK+axwrcYsEN5YIf4QftNZincpis5LkC/z1ZMF2XWNSaGSKifqJHubKmm8rRxJCWfd+8Y4ooh2WXIXpKqeQ2eDLKqwPE952zx5DiIlPz+yzlutZwvJUOl+RgYQ3ntCfcljxaoQQIaGQobfqvxnC3h2YeikTJULG+6luvI3wDTfNEso0rkymsa4iOYpLc/xZ73KqmRbPGO9phROw0LMfcwW+IgPOfYohnJfxLtdjIfhsuKSwtLKC4EiNrXU7IaFALPJh8cNnYag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDIO9NpD1ZKuztN3MLufiqq6ZPPaeW6da2ZTqTOFPB0=;
 b=GZo8KVQHyYB8m3g5PTAxYrgNdeeB90hXaaUUYAcjiH21aDpJFtQ80Vnd5hyGih0Md2N+JRybx7yzjSUsL2pC+B27LbJZLNyKMaViUIS3ZKuqPRDddXYo+wvDQH+jKegMrHgaRCGrLar8wrCSTjtKa4u3OT4pXMbSGIQidIYz2XA=
Received: from MW4PR04CA0296.namprd04.prod.outlook.com (2603:10b6:303:89::31)
 by PH7PR12MB9173.namprd12.prod.outlook.com (2603:10b6:510:2ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.30; Wed, 30 Apr
 2025 01:40:39 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:89:cafe::b2) by MW4PR04CA0296.outlook.office365.com
 (2603:10b6:303:89::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:40:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:40:38 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:40:37 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 26/36] lib/igt_color: add BT2020/BT709 transfer functions
Date: Tue, 29 Apr 2025 19:34:44 -0600
Message-ID: <20250430013454.226910-27-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|PH7PR12MB9173:EE_
X-MS-Office365-Filtering-Correlation-Id: fd0c810a-8ab0-4773-a670-08dd878802a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?73q4n6IpTmk39PtaGWS8vRaOOycINErmUfU5dHfchUNKRnReJXiQLF6a9NJm?=
 =?us-ascii?Q?nKnNv4xx1N20IQ1j3n0bHYXSeZx0JxBf6O8HkApplrEb2kkykxeRc4aMP2X5?=
 =?us-ascii?Q?mVAg6mhnwyF60XHu8xSVdOWL5dOO3kmBc5v5h3nMbkQXBdSgvFi9bAVXa6hE?=
 =?us-ascii?Q?nIoqmM0FcokWHwqhJPl3eGPN5MU6d101tlHORGyzpuPaOnd7zACPXTuf0tTw?=
 =?us-ascii?Q?o5pJ9vb1h0/EXRPsqaZf3IkFI4aWjK2XyIBqtp0JYEBuol2yGLmY7EjJ1Sos?=
 =?us-ascii?Q?H2pYFVlMOq8sAnyCwyFOMd8A04X2CtXc518DBE+UmPy0KZlcVUIi3R7XIXMW?=
 =?us-ascii?Q?LIFuOO1pnVm2O/W8UNXf3Tp6Dshkt7mTK7jxuofJ5J47AbljipQfu/eqo3wb?=
 =?us-ascii?Q?Bpat/zu0WGVtuw6iCWnCBQ83uXT3oLr30yUPTQG2WGUAbtaKzNN3Ti/hNoxK?=
 =?us-ascii?Q?KrJpFyGCpJdb9takxfRITfit1pBzbwqnzar75/b6jSCu949VjzpEUxNJRY+4?=
 =?us-ascii?Q?i/+WYmaBqISBc2qyXihdYerwk7/3Nrr7tNJ29c8YznY47SqU5tSqRfx7NdrA?=
 =?us-ascii?Q?MTJ1u52i12BTOTMYG+70KmjLGPEq2vpuj4NoFdN7jLFj/ccorIk8sZG6TyZI?=
 =?us-ascii?Q?oRBaaOlCQFyoHahRq9FWP24lOQwEVEMzbcSt5UwYwobqCyhuNjZk1cXvQ8qb?=
 =?us-ascii?Q?yl2EpNcckd/vJcP8OCEy+ydqUNXYYWdRv80+sBBox9SOvVa2vfTR22koF/qg?=
 =?us-ascii?Q?Uv3E8v94H/v1NIXrR3Q9qUwQH6bV4IK8TD8sT7qVxcde39Q067Ds6afEki9d?=
 =?us-ascii?Q?hFsh8KgkswZBSSk/M9JxRfaZq9lwPY/0cnE12DdR/ypdhJEO3w0Brsh+0lP5?=
 =?us-ascii?Q?4K3swHimgLVB6DKR1N2XN13PUMP3iMsK4ogdi0wDuc3X1JteSgDliRY7C8H+?=
 =?us-ascii?Q?bM1mJd58WxkkO+98fpokix9QrLCYeS1O2byY3bnL7pLMgqbKhfS3H6mOb/mk?=
 =?us-ascii?Q?foqjvghYubw1LhFBBYwppssvwZ9NGGh4j2nZ6hfZS+xKjVlVI87PDspCBgbI?=
 =?us-ascii?Q?/LLpp6Qqm6KbvYGCuN5BT6i9SL95ef8UJlswubZyfDshIA5q28tEEWptJ+9g?=
 =?us-ascii?Q?iT/QvBXE3sGfAQr9cLrnnFwT3VygTEINlS6CdkQ9BzjqbAuWd4vQY4k0P06o?=
 =?us-ascii?Q?+TDjClVDj+5t88cAtQ5MDO13o+HdfVoRRVT/nKesB7ooRre1ssSWOflOxhnk?=
 =?us-ascii?Q?auBNU149oj1BGBWeZDYAieQNrCAfDqTSH6S2sCNUVz8hyQ84huZgvkNlXTqX?=
 =?us-ascii?Q?IOmLJsYDVEjxIc9do24KJCooKt1i0dkthZ47dGwnUTDPMCB+pkjxJFtFw5J4?=
 =?us-ascii?Q?fo5bkrR+5lbZokUmy/eF3MK/VNxg1H3zpWzViL7sq+DD1XP3PzNM+JHFA01m?=
 =?us-ascii?Q?peNQHTYql1R4UB8Cp6Rnvk+XpkMw4eSwuDfgiZKsulrj4qInVyP9fTa5e17r?=
 =?us-ascii?Q?ThtW3YtMFb/huhObNqPTKDN6FKuJL3Dg1Oi6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:40:38.4588 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd0c810a-8ab0-4773-a670-08dd878802a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9173
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

From: Harry Wentland <harry.wentland@amd.com>

BT.709 and BT.2020 transfer functions are identical, the
only difference beind that BT.2020 is defined with a higher
precision for 10 and 12 bpc encodings.

These transfer functions are defined as OETFs, not EOTFs,
so we create functions for them as OETF and its inverse.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 10 ++++++++++
 lib/igt_color.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 0926385f4..ec8b27d1e 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -107,6 +107,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
 	igt_color_inv_tf(pixel, &srgb_eotf);
 }
 
+void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel)
+{
+	igt_color_tf(pixel, &bt2020_inv_oetf);
+}
+
+void igt_color_bt2020_oetf(igt_pixel_t *pixel)
+{
+	igt_color_inv_tf(pixel, &bt2020_inv_oetf);
+}
+
 void igt_color_pq_eotf(igt_pixel_t *pixel)
 {
 	tf_pq(pixel, &pq_eotf);
diff --git a/lib/igt_color.h b/lib/igt_color.h
index a97383fab..813bd19ba 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -25,6 +25,7 @@ struct igt_color_tf_pq {
 
 
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
 
 const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
 
@@ -117,6 +118,9 @@ void igt_color_pq_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_eotf(igt_pixel_t *pixel);
 
+void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel);
+void igt_color_bt2020_oetf(igt_pixel_t *pixel);
+
 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
-- 
2.43.0

