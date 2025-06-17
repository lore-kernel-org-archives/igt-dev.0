Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA7BC71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:38:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAD6C10E56D;
	Tue, 17 Jun 2025 04:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0cfMe4jv";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2059.outbound.protection.outlook.com [40.107.220.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E3210E572
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:38:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ymCuhHupEsvps9uJ0Wd7+vOAPAMJ1BxsL62eBX3u1s8FS/CQnCw3jx8+k2dITWth3n9giy+kCEpWqlYhIcK44vLhjFCSrshsa52t+e7WhGaRscFI/fmNEC1etNXS7DTWB84TxZHqYIVP1of0q6L9VmPbexgXrTZQAvjREXV3f+Az2r53Y/UE3HGhTUvHvhFjpIVicJ4iTLBZ7ZMp07YBNPbZJ4o+VfuTR7iig2j7xLIVoDzFgrRlIyCndxfJ5kjRIad3a5r2J4DJdoCbFafnhQmOZlnI3Z8mPmb1G2QeSoJbB6GbgMWn0iGvqlzQCsrxtr1Ifoj/SjOl1geKknXXqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VnHTFrDQ7pql/fBg6E100pf2MkQCTqFLJHE0HXaiBfI=;
 b=Pw4dJbidQNZp5Fuz8nKgeAXMdYGmhmKvyZKrFtbD5RuCa6qTxL7MIDSkTl0vtvdaL/+e+ET6EpHWB90a0NvCcfAL2zrgipwTiHEef1Hr8m3j7xbThPq3P4gfE2hRaW3ArotEy6hGErIiJQ1dwpvBcCvobKMlzm3jz8AQ0J76jy/lvLWrLfqgAt8ChEJgTaF/kuW2qi0eOZlfb6eWZIA7OTBRUjr7zMROHHVci0kyhGtpKp+8GACtYnHSvU1S6NcZ1gPlTo3cUGLmXUahrGoMMWu12yy7357bhShyWHJ5rEuXVGP5hsWBoQwPziI9gBpqRSYuARIXqX2MOay3/13rOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VnHTFrDQ7pql/fBg6E100pf2MkQCTqFLJHE0HXaiBfI=;
 b=0cfMe4jvzWV+kQEOnGAvUmXYHTe2SMP25C/ictOrJp1UxZW9nkjB9cM7EBIVTDzaLOoHjSdmWIFJzzlEtHN3EzRLX7GQ470NQfG06uLGlJYsDqY9NLbk6lm+MrYdsRRy0tikhgNuzrw/MBNVw1HkUC1mNDfHfVtKXkMcnufxVH4=
Received: from DM5PR07CA0093.namprd07.prod.outlook.com (2603:10b6:4:ae::22) by
 SA1PR12MB8143.namprd12.prod.outlook.com (2603:10b6:806:333::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:37:59 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:4:ae:cafe::69) by DM5PR07CA0093.outlook.office365.com
 (2603:10b6:4:ae::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.22 via Frontend Transport; Tue,
 17 Jun 2025 04:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:37:58 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:37:57 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 06/36] drm-uapi: Add 3x4 CTM
Date: Mon, 16 Jun 2025 22:36:01 -0600
Message-ID: <20250617043631.2920587-7-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|SA1PR12MB8143:EE_
X-MS-Office365-Filtering-Correlation-Id: 302e2a3c-2220-46b2-b82c-08ddad58bc5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?dvvBoKa8S9k1nM5U91Ico3ndXYCee3h0KQy0B0sO/Nrb4UmGjjiqXtiTcmvc?=
 =?us-ascii?Q?Ynv9QriQ0WrB7MMgkOXUTMti0o+dzRg7vZbGjdJ2pJU4pDHep9LhoHBY/ZTG?=
 =?us-ascii?Q?8K/eEs5Hn83ztBUblN6BJBuHmV7lhWjZeaI2qZ2csFBzjhr7v1GVFUO5HBsp?=
 =?us-ascii?Q?bs3dDB/gvkr085lvkzmWd+B/7DRidk4zCP15sPbZuCrpqBAB2s2SIvB23KhQ?=
 =?us-ascii?Q?/YKqvhVVuP/UwD1uBiUS7U8E5gwVT8wxPsk3M7t1dADZXl7A428AyCntri4e?=
 =?us-ascii?Q?ZisRJE9dCFSlheO3mJBShd9X963XXey8eF2txbC7PN5QTu9DHO+cijIZT/bg?=
 =?us-ascii?Q?Lto7GiyvWUkIjcA1OvDABSoBkC/SKXbXm/+tp43SV9KWz2NC/X0SRsjXJuJh?=
 =?us-ascii?Q?AQZItmiIENg1ySNy21QbwbOGUyq+ZlWop0ov7lhk0ENlFi3wRMpaGwYk5KcR?=
 =?us-ascii?Q?QUAwR1OmBzUjQLLAz9s6CJBXqoGOpEyqNs28Iam0SednhZ1AD9bXBLPYhcvF?=
 =?us-ascii?Q?ogxlSsBYWnxJZ8Qg7lqWdWLApX+lm9vLPHodGe32dtNsomddjfR+hMyLHSud?=
 =?us-ascii?Q?M0ogbv+7i1Dm3SbO6A7rQJc9hh/E5N7rANuVV32G4PNzXUoDKDsbMVnn4Jhw?=
 =?us-ascii?Q?mgGb+XNY5rQZgsmUEfVz1aEzNY3Ox87lRyaB8X0GGomzVtSbO99U3DUaCoqH?=
 =?us-ascii?Q?IpPEbT3QryUZkcG10d2ifg2OYA2m9nwKKQhiJHNqcqlyc5209QO8zX7dqtdY?=
 =?us-ascii?Q?628nwtXN4q2ZLAq72indJZKl3QSzaYz0CdLudhEHWvkGVJoA/ccxGBCXkiZh?=
 =?us-ascii?Q?abGvCbRwbPqfwAP97LQ4W2rrycVkZmKtmNBYPJdUV57yeEfMIekuyN7BdlD0?=
 =?us-ascii?Q?9zKif1N8dNe6hAQOHLcNavdocYUnvvPFH5333uuNxPsVMQbr4B9rihvmuX8l?=
 =?us-ascii?Q?UZpVijzRnbnpSfu/YArrP0OuQiqxF2qUft4mPcDkxkGAC1UcaB6AykQESEWY?=
 =?us-ascii?Q?Ww+iXwsD7S0bSdLCYnpH8CUHvpxyMxi/paxeHUQLTd4VerZuooBTD58yrZ0h?=
 =?us-ascii?Q?O/Izig3V+y0PAp0G3j+PZR60Q5I6RL71saItbvkG71AfS55DpZ88zTVCPhnO?=
 =?us-ascii?Q?v/LTbY8tXP+Z9yqFOTlu3hB5PPMRMdyP5X7MPp0sTsykehrJi5Cr4DIwbOEl?=
 =?us-ascii?Q?mPasXn0CDn84yQXyTIUUy5ngifqLyWJwCwnX8kmuBTC8LooPG+oLuQc6kasT?=
 =?us-ascii?Q?2vePzlHy9hT7znDkPVan8QbTW6dWWvRZuUTCLCg/01IHEaKwP5IEJUOUGudN?=
 =?us-ascii?Q?ZmTptFz6lPJ7ABnVu5zs9gwCE8bQHFeNe5yxMKJo1U3Q9Wrb9bZO2JTyk9TC?=
 =?us-ascii?Q?SK+omsFTcsDccRddQKGsCLtwreOmIZqTw7yVBs6H7BYKxUnkkPr7PXuNgouG?=
 =?us-ascii?Q?NpCg/mNeVuPKNpCpp/EegJ8kt3mYbN+WmKGBIu1GgVE+h9tOLXi7l8CW2fue?=
 =?us-ascii?Q?JqWV5xnTTUCUfcA4AtTSzYwmuKXBqWEHmSE2?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:37:58.4516 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 302e2a3c-2220-46b2-b82c-08ddad58bc5a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8143
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/amdgpu_drm.h |  9 ---------
 include/drm-uapi/drm_mode.h   | 19 ++++++++++++++++++-
 2 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/include/drm-uapi/amdgpu_drm.h b/include/drm-uapi/amdgpu_drm.h
index ddcda5d3b..85ad93c73 100644
--- a/include/drm-uapi/amdgpu_drm.h
+++ b/include/drm-uapi/amdgpu_drm.h
@@ -1589,15 +1589,6 @@ struct drm_amdgpu_info_uq_metadata {
 #define AMDGPU_FAMILY_GC_11_5_0			150 /* GC 11.5.0 */
 #define AMDGPU_FAMILY_GC_12_0_0			152 /* GC 12.0.0 */
 
-/* FIXME wrong namespace! */
-struct drm_color_ctm_3x4 {
-	/*
-	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
-	 * (not two's complement!) format.
-	 */
-	__u64 matrix[12];
-};
-
 #if defined(__cplusplus)
 }
 #endif
diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index b31852a94..c5debc1e2 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -847,6 +847,22 @@ struct drm_color_ctm {
 	__u64 matrix[9];
 };
 
+struct drm_color_ctm_3x4 {
+	/*
+	 * Conversion matrix with 3x4 dimensions in S31.32 sign-magnitude
+	 * (not two's complement!) format.
+	 *
+	 * TODO what's the format?
+	 *
+	 * out   matrix          in
+	 * |R|   |0  1  2  3 |   | R |
+	 * |G| = |4  5  6  7 | x | G |
+	 * |B|   |8  9  10 12|   | B |
+	 *                       |1.0|
+	 */
+	__u64 matrix[12];
+};
+
 struct drm_color_lut {
 	/*
 	 * Values are mapped linearly to 0.0 - 1.0 range, with 0x0 == 0.0 and
@@ -859,7 +875,8 @@ struct drm_color_lut {
 };
 
 enum drm_colorop_type {
-	DRM_COLOROP_1D_CURVE
+	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_CTM_3X4,
 };
 
 /**
-- 
2.43.0

