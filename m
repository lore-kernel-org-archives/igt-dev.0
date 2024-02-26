Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A857C54E51
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5B5A10E7F7;
	Mon, 26 Feb 2024 21:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vqN4MWQc";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2069.outbound.protection.outlook.com [40.107.93.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4F4A10E35B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kt20qelKyDfaBxFWoBWjvUk+41ZIKgDIYcXFgwGg+E1ZUTyQSQwPgHGvAfyYCgMR57zlARlA9pfBg40k5ObY+zhCmXlPAanndy55GhDiyxh75N7pULb6JqG7GxhFM9hVtmjecUg8LZcdTUu8WmmZbvwbSvIf6RLBRr3lj9QjxJ74CNVfBbE82n2RyCoSP/ZdA7EMkyPOTMOc/R2z1gIRutza1onrtHKXjKim90jjuDBtE+YnZlYEYCWxAzXAzfrCSXGwsvYizRFYXnXHpu/r8xAeMRTTxaMIOu64WrEWWsB8AvazaZzpsk701yGoaOVHnfuKcA2Zo+GfryjBTxA9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5yUvimP5s5hHXM2sV+zjvtoVdO8ZwGUh/awIuTTI4Vs=;
 b=nLNR0RVWRhoEzfNfPFtE/Im3Gb+nsp++2jKYj32cwEUrtnaB/AuLlgBnEKM5r7TvyuNTdHd1iSpIZZxfPQrDtDokYj0d/GM2gTPUR9xHw47Tx2gVI7gbET7wmwp3SXlZc8TL8eqCkHAYzG5y0L5Vr7jdbVoJlbmb4H9UOnB62bpB3gTey4LT5sDe7Vb5T6eD0Oqzeyldkx4o9ZKFYY5UO7gGfh7PoaQDg1PnIWHKJhBl4N45q0uNAJNlwk58/aEXtEwxT1xPjGt/8Cs7RsQx2FOsyP0dggGsVKQvuPR/yFydZ0MMWaTUJxc1rhuPlZ0h3d+e/zY4oulKGI/QFcXstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5yUvimP5s5hHXM2sV+zjvtoVdO8ZwGUh/awIuTTI4Vs=;
 b=vqN4MWQcg0W2X9kFOrf0kDmFyV0wSDSwjQ8vYQ21R27BTXVX89Kwi/rHnleQxz1mHW6eZnBkpZIlg+c5aRFlw7OcfBEfAc+E94BDAIzo2Wbd8Hp1IT/giY+d7cB2wU3RB5NJDmGSbEPUjV1/J/N+9exc/pMT0TjDlMvSnf+sQLo=
Received: from MN2PR20CA0039.namprd20.prod.outlook.com (2603:10b6:208:235::8)
 by CH2PR12MB4326.namprd12.prod.outlook.com (2603:10b6:610:af::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:14:33 +0000
Received: from BL02EPF0001A104.namprd05.prod.outlook.com
 (2603:10b6:208:235:cafe::33) by MN2PR20CA0039.outlook.office365.com
 (2603:10b6:208:235::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A104.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:32 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:32 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:14:32 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:32 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 06/32] drm-uapi: Add 3x4 CTM
Date: Mon, 26 Feb 2024 16:13:50 -0500
Message-ID: <20240226211416.100660-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A104:EE_|CH2PR12MB4326:EE_
X-MS-Office365-Filtering-Correlation-Id: f711bc42-e621-4075-8437-08dc370fed92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kEdLeN8w9xyNpTQGL1ovT9FfgqN545hi1q4/R4ENB5Gr174xaHPIq8LrXog9qrhb4BtUobilDKj0r30AzHEinb6HDsaW0Rufu6CKSVPfZNUjol2BicNMXimuapa0ORkP/7jNpDT25KDjryzgA/ty8EwPGVO02iRS4OiNuLOKWujIbghAeMinGjq1Hx52VhnXXkT1TG9lIDLqGACV1cgexneYMv2ZkBabFiiNEVF04wtC9L14UVP9KLBzmj7NxpwzvzBsF4D+94W9IQ/QjSzGQqMNLUUlej2yT/lYCTeEgFej4nMHnzZXR4lrlThv+C2VC3xV9NSbfpaWkQTpZqiLtDzwffBabs9kdD/RRiL3yx7J6WM9RATy69hGqGCM0uRsvq8mWp1299aocK7C8Z0c70Ynsh7ISntZ3cPU39GeuN+dPlV0mGON2S+j1m1zN61bIV+xGd/qoOEucjFRIYA/hLsLkGyjc0ahnAiqFj8xwmG4Rmi5YoxxUDrEjwFdLgceNXzwHzqCPo+BO0cvYy9apL3+JJd4xFyxXWbWIshSn/IH2ajgiXhsRrpxKxD/F9ENZTnmNHxEfv2+3fFlou5iGWj8ro5APCId3mmijM26DUxw6weeuA0/kmD5+5kLvNpa2lzxhR7p9wUPOPhnAGZbZFT8C9RFduk21l4cFe7axoVrzwauNDomhevRPb41a1wnQ6K8i8aelFTexV8++ZtLLjHVv69OGUa9/dWCb93er0RrWk5TZPhUdST1CQEvXWoU
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:32.9294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f711bc42-e621-4075-8437-08dc370fed92
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A104.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4326
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c49526bca034..358c5c313bd8 100644
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
2.44.0

