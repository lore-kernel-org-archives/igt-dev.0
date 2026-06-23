Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31F7CDB470
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jun 2026 18:00:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFFF89A77;
	Tue, 23 Jun 2026 18:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sqSpHdl3";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010047.outbound.protection.outlook.com
 [40.93.198.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4401B10EC3A
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jun 2026 17:57:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnwvqSIUTRGtryiqxEhLQ+v70RFwoofCs7XVz58m34YTvL+hRL5lNZHa7fom4Tx19NxmJQEeL+pE9ITZCPESGqdebTmqAEcqnDYElaeI90DdvqzF7IlqKOVgHgQYk/RbWTSpgzvh+RBiAa7Q4xi/O8l9c/rEzsAp5pJegIE4iQYFnsofiU9OAbQRc7BGpRKAEHSgizRzxOXaVJ3zpO+pqcZv/BNWajgJfbtIRE2+GZmPa6Xhk3I3klac2H3XTEYekdK4DyvHyS6b/8O8xxlc/haPCUzezabiDK8mqQFsZmpws1NJjZQSAAgZtA6hF73NdUCo6/oFXFiPZ5NjgT0Z0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jNXZHDsLFimzzniQ343Y6q6Evm7E6WXPecC/MsfTWWU=;
 b=tKgg+WtitUwt8Yj0TS+N3CZFGd7AQyGhim8ohtIv9NjCHGWYxS+RyEYT2Qd+3oFagBepRNaDeBCNMpvI0tjKweulc0hlmqAWjwitUF68c/2MFcyzmeZU9g9Zf64QY+LE1agI/wWfIfeY8XHPp+7nhVo1DUGNbSFfog3uPiuMZYwC5QOqfbeRF4yffqCH5pVtLP2dTE3YAkm1FMRToilBC5lrX1d+MjBr2Duju+hdvhg5IT4kQ8fVJ7LNdlSOhJKxzv1uXNnWvWYGv4WMGRD3CWKMSpkShwfzD/gSvPBMfseJ0vjW9//NpsckNBkC9gF32AruTvjP8YPK0P1yxHRJ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jNXZHDsLFimzzniQ343Y6q6Evm7E6WXPecC/MsfTWWU=;
 b=sqSpHdl3GTmmuKjqfZ63tm0/+WZkeu0GBAbyErYytZYmzlz2AGFh0dmyW3xsTuA5Sssypzovoh1WcD4npkuSdcehXMH+KUVZoY23ND11rXmoMQatEjEi4LRBIlgrjtyU7ro5uWYU39DyOAnAMfedS3QPIK/rRlJS6W29b0ziV8Q=
Received: from BN9PR03CA0621.namprd03.prod.outlook.com (2603:10b6:408:106::26)
 by CY3PR12MB9578.namprd12.prod.outlook.com (2603:10b6:930:109::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.18; Tue, 23 Jun
 2026 17:57:51 +0000
Received: from BN1PEPF00004680.namprd03.prod.outlook.com
 (2603:10b6:408:106:cafe::13) by BN9PR03CA0621.outlook.office365.com
 (2603:10b6:408:106::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.139.20 via Frontend Transport; Tue,
 23 Jun 2026 17:57:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN1PEPF00004680.mail.protection.outlook.com (10.167.243.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.159.10 via Frontend Transport; Tue, 23 Jun 2026 17:57:49 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:48 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 23 Jun
 2026 12:57:48 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 23 Jun 2026 12:57:48 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v3 06/12] lib/igt_color_encoding: Add XRGB2101010 format
 support
Date: Tue, 23 Jun 2026 13:57:31 -0400
Message-ID: <20260623175737.171142-7-harry.wentland@amd.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260623175737.171142-1-harry.wentland@amd.com>
References: <20260623175737.171142-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004680:EE_|CY3PR12MB9578:EE_
X-MS-Office365-Filtering-Correlation-Id: dc9db40b-c46a-4539-7fba-08ded150f051
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|82310400026|376014|36860700016|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 1c9ZlEl847JMUDvy3rvBUDLzUaj03wCudo+jp1BouFe1bf/6n1UReetzt+5v7ndPXMbrrzo7FAVE68aHkDZgwUcrEnylLVUN6S0o1iywExhuqJVh8DRoj2NyY3maMR+XuvkWpFlN4PkqZh8jjsdKEnG5rjxwJxHwAA+ydhRKGnuX7bLoCH0/yf8RrEOybc60xnbQ1W1apuHiIRto0g5YG8J/RyDPi8kv2MkV0ft0SNJb/3uJLfTgwEVbsDVHvRE2ge/hgvoI4f/X0H63NsE5NU1A8RM4xhw+yMyenUNzBeSjpKwkCaS3+cUzrF7tI9sThYPK1/eyjB/mC7r4a22q+uTrRmNDqN5AwMSYkzM2jk2JI7vdZtYbC5a/9upFUTz8YQ98Q69HtjDJDu1zGcuLtPOIbgADTqPZIe6w3XaN+fJbjM6BkKJy8nNkVnRv+uvVPRejBsQ6OCaLz8swXVVwEj8P27x3rTw3iiEZKOWdr+tCovp0INJ09JmJD5KHNCyLu9qhNBIWaPQQxCh/KBK1XyC1vi5RDUThW46hMCfzbVG1MfiKlZeSaVyggBV6N/e+RyCVQjYGR2QiaTzRMGHZPV2XV0bfjgCVJ0tPTKX4p29u5e8KaRVyn6Sj8+aPap8By00URbrOGZLw8cmvu7EW+Ikf9f7MnnRpuGnKDupQQZsTCpKRCI8pvFPltfTlTGlwCP+5CxERArbVMSHlQsH2PQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(82310400026)(376014)(36860700016)(22082099003)(18002099003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4syqeOmUtdUd7e5L6BqJjh5HlMlPOWrfE0yla5dkh3Yc5W0TiW+jdQQ6L/RznZInkp/X7ManAx9VgLMi1YAzz0RsNwvr7MSB/JU5vbuv2PtUh/qkvCR27r+BJKV0krP0ADHuudv+nYfuy5/3t0pzkvLlOJxUDZcQgy03f9Fpqgx9dvXIhClOAcxnBm7TJbyvBtL8Vla00irozHZTVPuTobdhnN72puSUjl5USxr5FJ0PuyZv+Z2Rc1k42UcYXVNNw/iKR+IfEumOxfwgI15PV0GnD4oqSmmnxn3+S5CBf1rUZ88K2Fs67jHJGvzu3D2Q5QTOPguWiYk8EYTGwG1W2sWFoAXMsZUo3N0pMYFJhNWoqfNLgxMKV6ppGINmyBePWkF2QAXoKtBk3DAzytvVmQ5MjYNXoAesMm4IZewdErG1zsNxO++paJP+Kv3Nt8Gk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2026 17:57:49.2222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc9db40b-c46a-4539-7fba-08ded150f051
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004680.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9578
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

Add XRGB2101010 (10-bit RGB) to the color encoding format list. This
enables proper color encoding handling for 10-bit RGB formats used in
CSC testing scenarios.

Assisted-by: Claude:claude-sonnet-4-5
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color_encoding.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
index da56b2b10593..1d01c7eb0583 100644
--- a/lib/igt_color_encoding.c
+++ b/lib/igt_color_encoding.c
@@ -135,6 +135,7 @@ static const struct color_encoding_format {
 	float ofs_y, max_y, ofs_cbcr, mid_cbcr, max_cbcr;
 } formats[] = {
 	{ DRM_FORMAT_XRGB8888, 255.f, },
+	{ DRM_FORMAT_XRGB2101010, 1023.f, },
 	{ IGT_FORMAT_FLOAT, 1.f, },
 	{ DRM_FORMAT_NV12, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
 	{ DRM_FORMAT_NV16, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
-- 
2.54.0

