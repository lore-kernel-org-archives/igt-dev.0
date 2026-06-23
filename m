Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554B8CDB471
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 17:58:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03D710EC32;
	Tue, 23 Jun 2026 17:58:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ac90Rp6i";
	dkim-atps=neutral
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012046.outbound.protection.outlook.com [52.101.48.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F45710EC32
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:57:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lF++TsS1OhS9COoYkE71Ez7cG3hwmRbbMQPBqWbIqLH/LRQ40JqMa8lObDv46iPmzMRICgDVj/dAEJ21RiqUtE3AikHmuLRloBWKGfOCheQSMX+P1HuvsYMv5Sen04PgdikCIxEOUuKIpSVAGpERk/HOH0dhcZmIQrJus7M1dk68lLQiVavg1N0oIwUJlX0m29xdBBHnA0foHnzNFFtVXD1S3W/mgLBfxdMCoHU8jXHZ7oONWwlZJ52Ebh0MGvfgCnm+KJehTLOQ0RfBPTuiy60EcptwepKceYxLq9Ox6/BM+HrTwG7ApIdonnZdpaoHmfPskNmrn9XwscBQSRkehA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4usUNFvvMYkSpn065Nh9p6+0wiBEi/baFzrSUl68EEo=;
 b=va9W1S3haOTNL9we/UJdVSyUdCQiO/uyQG9nmL493411+eB8qepLLtAoMYXDE0LvCSiP55vyFS3dd6MFmvTqPxaaXWKczVuUDzgk2+S4b2IY/VRdU32ol6LQFCAuib7+OqrckNH1FeBuF9TE0Do85x2GdWAJRMx3QFfgpgl336MSDrGIaRHzOyjeQQWx9dyI/qTuqWPuiyMiretf+6u2GFO0sic5mWXB8v35WQnJZT9DqlbY55wljy9qGrKq8BaRWbelxwqbHkQqS+MNgduXBeZ6XI5Bk8ipEXr1Y67zvLiOqLuzcyBaKUxPiFji4WZVe17mKw2CrCopmeqSLW2rlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4usUNFvvMYkSpn065Nh9p6+0wiBEi/baFzrSUl68EEo=;
 b=ac90Rp6iaSEFy8nqv21/1Y421IWUu2+QmGQhk6e9TuYOjgr5QMAoEjANx4oXnHTlixxufb9fQ2ShNC6QylZP/aMPneYvZRkmOYdUl/ipHPh1/w6k4Uh+qfrF9SPo1O3E2AwVNipL8HpNJq725DEHSCWypjJJAhODR7xt3lhGJyQ=
Received: from PH8P221CA0049.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:346::6)
 by SJ5PPF7B9E98CB6.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::99a) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.13; Tue, 23 Jun
 2026 17:57:47 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:346:cafe::5) by PH8P221CA0049.outlook.office365.com
 (2603:10b6:510:346::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.159.13 via Frontend Transport; Tue,
 23 Jun 2026 17:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:46 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:46 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:45 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:45 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 01/12] include/drm-uapi: Add DRM_COLOROP_FIXED_MATRIX
Date: Tue, 23 Jun 2026 13:57:26 -0400
Message-ID: <20260623175737.171142-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|SJ5PPF7B9E98CB6:EE_
X-MS-Office365-Filtering-Correlation-Id: b438b9fd-179d-4d4c-f60f-08ded150eec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|1800799024|82310400026|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ThkBah704tASpAzjCiCpDS/5zTNawD5hyF6/F2fyfTn049jH+IpRFoDdtYu/NjhJVCdO8EO+7qFS4qlQlaPuYG7ZHdzZn5XeRInFTzSZIAY8QiBosd9jd6xSNte2qqg21GdQA5yOswxCiuv2b8iUOoonINw1iyKKMsYSqo6BAAbU6waz/GiuN5jTlV3+POV8UdGrZeRl7mivL1n62kdywsEWhRY6n0WUPSrg0jarZws3BYpT21aWHQqgblZqmZ0wWG/oh3Ol+wwIBvy7gMvgNRiMn+732GcKrj/C5v5bwTE43nEjsPkLlaG3/G0IUH0esAD2jL3F7dBjbf7LPTorQSucvge4LhLAXl/J3KxIg2FzWr+6uo1Ybmjg4ZUUoarfpSHZMJXDV3k5jIq+fc2ny3khaL5P5GjhHjyJ+vemOrHDMMdlRrEm9r528GIVM5rIK7pY5myW9rJYPvAx3/AM5zwZgI4Ej7biz2GCFXx969zzMcxHTtDEWf5kTUdSA4RKffVgbk8q/s0J9NZcFrXJAI5q8zN/Uqe79rOLQnHv+nSg9nJpi2zPEaB9nJBP0j2qEyVGCHJxUDRAkfBCtxFpaK8HYN5HSM/4J8LbOm4MhYXUdM4NfNXHi5UKnOPXoLR2uxhPM0GLg2Gmmqqp5+4N7gj496uQWAMlwf/TFggft5poTaCsN7nloFoAkiWXaDGnUARt+H5soC5g4gqejquYUg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(1800799024)(82310400026)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: WuZxVOGA74DNbGAGZI68yffdOuRyFPq+WBA32eLVHW9UZ2/BtolYKCfDRPG0fjlXULRvqYzTyECCsktAIz5hMyawTxqo/Hfl5LNDtArVpNPE5PoHIcby6A5SftJdC0jTqTDxIsQjs20GEeT3hiFywmPWCgPDCLQkcpx+HdMtS9fQa5j0OrKvJq7rkYv1mvGXGMCoFhPWQOBCqmjd5JBuXp2gGe+zhcX6RpuurTGEav1ije4xOfbgqel9R9gKSSosehmbOoY+QE2UIuRB40w+XYfwWEs/sjM/7ZuQfYfSPanGn4tFmPSZ21HP/aYYNuKuHb9i4sSE1BcGNXYKNq/s1xVcFik61sxrVgz9AvLwB2+LzpaR9JKlFxQdtMywBC692TQGWr2vk6s3eydTuT03bIGxBAEDtAS8zcCnXvrP2VC8tLiwIY4tjUP1LX1P9Pt3
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:46.6009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b438b9fd-179d-4d4c-f60f-08ded150eec8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF7B9E98CB6
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

Add DRM_COLOROP_FIXED_MATRIX to the colorop type enumeration.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index de10ce859fdb..0924e38af09c 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -934,6 +934,17 @@ enum drm_colorop_type {
 	 * LUT size is advertised via the SIZE property.
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_FIXED_MATRIX:
+	 *
+	 * enum string "Fixed Matrix"
+	 *
+	 * A Colorop block that performs a pre-defined matrix operation selected
+	 * via the FIXED_MATRIX_TYPE enum property. The driver advertises the supported
+	 * operations through this property.
+	 */
+	DRM_COLOROP_FIXED_MATRIX,
 };
 
 /**
-- 
2.54.0

