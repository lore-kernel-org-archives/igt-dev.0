Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B355C71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:42:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2371F10E4C7;
	Tue, 17 Jun 2025 04:42:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xvQDna2u";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B59910E4C7
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:42:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqi9TcBlwf10WqDvkRRB8caZcih5Urr7tiNlQqhVPg1j+53mY/+8u8n7IxKU+61SWqhkEeyU3DCpHarD6DwjEjGvOdUXonfUyO/PXNbqmiillghk+DVXuZrV8z18OpTXuqtsn4n3C7zJvZcZDCIjRi0sezf0tNz7FjPyuzn64hg6elBy0K++dV9n6om/jvh1fAAmc3cJLzN7a35jcRK2YwdExYc7H5ewTBlh0rKo71mXRi66cAs9mZtWoVmWKJUqYSdyELU+OKu1QmRd2da21ALEWEE4SJn6Vb9oRGI6fQe6ff6x4S3R4nl35N+zkNifOqpO44Re5aeIF0ukuY41yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDIO9NpD1ZKuztN3MLufiqq6ZPPaeW6da2ZTqTOFPB0=;
 b=vyn7MprXGe0VN9T7OwM0M40o24t17FF49Q1C+y/TH2gFzhqJqBk5fuGKPrD7tOmBndnlsagssX4NEc0IOVHcRSiJkj/HNiLMifikDw4T5VEQLmr4hwSi+jYf1bjK3uVczubu2/aySKaUueZIuu915d6ZgSuf7YCkht28qvWT8p+pnxm2ANSyPIvEvTcV+XmRT5uXTsZrEwkAJdlD8YwSPUhak1PQpZnNpQUNuTi+4md6IDOBfq4W8xGzU0yhO6djtuejo2MiOkIkse+lsNlFcdEHoQdrYHzDbZZs9XTY0WxPxluEWE1AQD47xXAD9J4SeFIjlJCvciF/vYuOu4CJIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDIO9NpD1ZKuztN3MLufiqq6ZPPaeW6da2ZTqTOFPB0=;
 b=xvQDna2u1XJyXcdyp5JmR6iu+hMxXO7XAAUy8d31i+ODxjjycbqB2jpFbD5svDvGg/go3T7u3juHrwJ023j+ocukdKl2toDRdYgZmOaVRCiRulKdKiTxVngPdP+br/dKlNSKL+Koalp3XbbIspmHPSxUU+gY+v/fhs0oRhir4XA=
Received: from CH2PR16CA0016.namprd16.prod.outlook.com (2603:10b6:610:50::26)
 by SJ2PR12MB9240.namprd12.prod.outlook.com (2603:10b6:a03:563::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:41:58 +0000
Received: from CH3PEPF00000011.namprd21.prod.outlook.com
 (2603:10b6:610:50:cafe::81) by CH2PR16CA0016.outlook.office365.com
 (2603:10b6:610:50::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.35 via Frontend Transport; Tue,
 17 Jun 2025 04:41:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000011.mail.protection.outlook.com (10.167.244.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:41:57 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:41:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 26/36] lib/igt_color: add BT2020/BT709 transfer functions
Date: Mon, 16 Jun 2025 22:36:21 -0600
Message-ID: <20250617043631.2920587-27-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000011:EE_|SJ2PR12MB9240:EE_
X-MS-Office365-Filtering-Correlation-Id: 1169ee33-f77f-4e94-9799-08ddad594af0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yDxy842ubJMHq8und9DXFhGB7kFMDHknBZ0afOcVEX8verq277dnINWwpWL4?=
 =?us-ascii?Q?dQgtLdjEvNMsrVJOKFhmamBXD2n/TRK3dADXpWF20F3CcNxte1A1lyjywA8t?=
 =?us-ascii?Q?+kAuBIF1mZXc6czYxr2BjMISzsygCdgUQ+2Ii+LCnJ47B2kdzk6kFLggVMOh?=
 =?us-ascii?Q?MDT1P5fM8Rritmlf5J0eDbPflCqoL8/R1P9fLf451N3YdQNOUetLu7id7dkl?=
 =?us-ascii?Q?KO1jsVa7gR9SKCwZcbcSZvisDOndt0gA7Aptl1QqB0md1YXp9pmxYwJJ26aJ?=
 =?us-ascii?Q?HFNfsVfmjkrGD4CpphKWZC+hyw9OpGdMCWlf2ZipVSw4iiPHhGoHMcm1Dfhx?=
 =?us-ascii?Q?nsfWcJwmdKM9P07k+M/oigAuf/2G/b4xRsjBcBvbX1suesmr9wcqaLyHcj3K?=
 =?us-ascii?Q?rV0yDErwfjn1a9QuxbvffEOED5THXehn+ywAGXqzIu3Fl2KKyAw/R3s4koQx?=
 =?us-ascii?Q?AXenvu4V6QgqveOoSrofKF9y76cC7J9EEeRQhq0OiBhcL3xihVSb6qIYtt/k?=
 =?us-ascii?Q?Q/FFtwhuMvvtRMs+W/mbjElhfIT9u+/CcwIF10O6vejPExpIyfpXeTcTYfmz?=
 =?us-ascii?Q?oK5ebIAuu57JG/vMxvMLRd5gPWfznoFnhduFnvSdihD8Ikojnvp6L9AOkFTC?=
 =?us-ascii?Q?eCGV20tyq127x2daVUo3Pwzk20IjuVdHdyhtqLoPp7XtlYXib7cmGciWoBFS?=
 =?us-ascii?Q?dh7m2kvLhtSe8MPKwT7Avxp5UH1VIjrg44Ef9iq+JROICvmFUOKxsYXhR92f?=
 =?us-ascii?Q?6VG84Cz0/iQz2FrUUAC0WWKLXUNpMu2QVFlMMDAVpdsvXicPOgoDi5mo5fim?=
 =?us-ascii?Q?0Skwv5cTc7k9nMdjdDJMAnbFOIha8YOliDYR8A95n+a5htYx4/uLCpkOEsHr?=
 =?us-ascii?Q?MK+3kWAAFcQ8Efcl+VSDIetIIGCoS5n6OFGjEZ7Xj1z95p07fT0eS/1V8yKn?=
 =?us-ascii?Q?vZMGsbfpBsdSPh5FwilOsNCTWOKtfL81tREgXiTHYQU+7Z/4dhq3zIoguGGA?=
 =?us-ascii?Q?ew0fIxGR6LgLkowpAAyZePn74iRnV6KylxzjCP8qWtg/QWtN9uxm54Oj2l+9?=
 =?us-ascii?Q?N0hwVBqNQVHs4uqJss2OFRYjGYI57alwKFGMHq2Y8l/3scME1Qmy5uBIsvd9?=
 =?us-ascii?Q?uqhTo6XczvkZ6AW/xcYR0QXfxhMSQ5p2fnPtPQiORWkKprK2qjgnMkVOf+UT?=
 =?us-ascii?Q?lS/voOIHcQx7436OuW9vmfbNVOtvEZq8AAN/9tBhMnmeF+BBV2NpNuEt6R1x?=
 =?us-ascii?Q?ncp0A9n/12xw5ZwmGyLCC5SDmhV/wO7h04xq44tCvreNBd2EblJ80kM+W7Q6?=
 =?us-ascii?Q?eqod9Lqh9r6yNCTGBaxqmf+bOTKcHy98hk+XNdzIl+VUINlIlBN2uSytkAVD?=
 =?us-ascii?Q?mn6aD3Jh3lIm2m3zW1egBJCFgg5MB2CguXCTmVhzHnkAkvmZX3VgAtBpIE53?=
 =?us-ascii?Q?peVN2x14xa10E1RoFALtSHWQxutX7r+dajU08/6ycyo15rDvUrpSQRUB+1Ht?=
 =?us-ascii?Q?ibqufOoudSADn8w4nwaFyLpPFd8eZeHmnCg7?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:41:57.6899 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1169ee33-f77f-4e94-9799-08ddad594af0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000011.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9240
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

