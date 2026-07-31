Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9916C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C12A10F380;
	Fri, 31 Jul 2026 18:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4Jy8SFJb";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010021.outbound.protection.outlook.com [52.101.201.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73F0610F36A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OCLfYDt10JIejMPIVfbrdaTdomcMaxwp3QgSzXhTA1eCR0c1hYJUj6NJN1Ju419LpJMqswLujRdVVo+T5g1N8JnhNg6MV3eIS97aPpANUSbkySJaKfLkah782RXS3UljsmlcC82AEWdiYH52CUspsKu4BtaNvn1mM+HKWw4zfCJexZ+vTgyA/Q00ZX5Hw14vBShrOz7tiTOpSQ/kz5RxbYiG59H4mS9S0z191567Wrx9crA6UhsxrKJvYSKzjCAro/mo0mUg/ouaLQmOMVmS+wXnklRAxGIonkCmZMj7753ukNUe757lsefaIIYJ3ezc4L9TQP19P7ySBSa4tVX6Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CoMt9NE04Qj3JBy0119okOvkmRfpP6JCt29syt/lZbA=;
 b=iDsALrZj2NvXVCJGN5q9KsGTr0gVsXAGftPKwTsZF/mXiZs5uk1mmkWvc2bWzWnbuP5jbLJhUhL1aOL5dFFZ4ZJuTIs1Ru/yauyfec7uVzqVPw+tQJtr8CnCPZUAfcCOgk87FOV4D1bPVGTPEKiNNsN9REf1pQjM4vzXIdoyMkuNQvCwaWCkNXZNGdhhe6JIeye3OmOHu+SVr5bitGLj9XXNpzv5siqI7oGhaTcd6xz3RDm8Wx9/rGJwCStav/pEugi2haIdoUX+SwP02vlszJQAfgYH+I0mpzsMvcRaXwByV5pNs2bhNIalMf4aEDcDnduYJsmfABGyKR9yk6ll3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CoMt9NE04Qj3JBy0119okOvkmRfpP6JCt29syt/lZbA=;
 b=4Jy8SFJbBhfsBSgD25xtZBW+wSyaPeWTy4u0TWDAzZBHzUkf2cqb/xhv1mjgexOGcXtYz+DcKuH/K8CMA4jKrYTbLFi+2y0k8N6tlgTfDNiWYYPVLl1immtPgb3lNPWx4XQBL0nhce04Y77CdoU8Zm9H9TSr7K3xjyOKcIC32RY=
Received: from CH0P221CA0041.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:11d::25)
 by DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 18:02:12 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:610:11d:cafe::71) by CH0P221CA0041.outlook.office365.com
 (2603:10b6:610:11d::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Fri,
 31 Jul 2026 18:02:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:12 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:11 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:02:11 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:11 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH v4 05/10] lib/igt_color_encoding: Add XRGB2101010 format
 support
Date: Fri, 31 Jul 2026 14:01:55 -0400
Message-ID: <20260731180200.668795-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|DM4PR12MB7742:EE_
X-MS-Office365-Filtering-Correlation-Id: 04a7125f-06ac-45e9-60c7-08deef2dd8ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|23010399003|376014|11063799006|56012099006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: Xn3/BRb3T32sjcCrhioDOM+kja0T2bxDlV8Rx9uK2x/BsVoLeAgEfo0C3UEjnjNknYBzpJU8+6hInMkDlCuDItnAcsjcZwmvDlY3oKedDWKoZsybPkTnbpgw+r8zIuLk8cKMutgHBO7MV7RoI+bbPw1Vt1jyWGcPwmJP8C/0paG7joLYFkRiMrHgIA+OS9rrLVQx7HVNnYXFvp97lpE/nLSZRYMTKsknnpLfs3VVjbc1z2Iun9994ckT1vFpbPDOgt2zE9kfu1SEaQk1q9NSzlTdrEwXkFYRGwraT3KyZ4146kBP1B4H/vNpqniCME6KBki2e2W8PzNEYax93iV+npv/WOyUKhUqe0tClVdnVEGTgpelbvQAL+xglo60/Pv0gMkdENsNnKnfJmq96TlbEnI9QmYb2rTQgMJD0gzXfiilnSlF6RHSSgFAVGgqz7URFf0G4Aq6MeY4Xy7WF3i0kg+++wAg6uPNwMcmGs3llCZTTng2rzYOwV8olIt3pN/36g/5OiLL8z0PLZWE7/Dpwx7x3Av5taxhwcqt9hCFu7M50y14qGNbShuImJIbuRXbyNOfc8968NF8j1RJ1CMIopVRWUYeJBrIgqoEKmnnNOIIFZTpeUF49qFjsCtJeWKgSJisPB8NMB2JAgAg8B14DYHFw9OikmAMl5f7/jifg/eXk3fKGhO8a0X6qdIWuO6sNe6tizL2UqNlwe7OBo9X0A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(23010399003)(376014)(11063799006)(56012099006)(18002099003)(22082099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: TuefIfjVbQNfERp1V7hz0ZcHS4SiDrH2ICq/ujoNOW7Q5H3Ha14sGNb2WNQBih5B65UtxKZiOr2zNx9t06+U3c1yWvZi4u0LIfBSr63YfWoIl9vavSl795KMarmaaNVCg+36FtMYLLycMqEQoDCB26F45ikR+mPiOwbgW5iDN627E6ldHyy613Et59U61olkQ3FRqpxoCaemdHDIO3rMbDNndxEmlJ2L4NtLStlOkwrSH7J44sd5ScsPLnWC39j8ZuRHPo/W6eUfUZXAs43C/vuOBF37bFfPytyi+K5tB5Hjmu4lwsfAbEt3FEaVqfJsbjcBXaqYB5tq5OlaL7GK/WhmuICW+Op/TBzwcxXCWNYeMsqA56A1tDCifkcraQ4dmmhbQylTALCI2ElUZ24gh6gNhFjg20V3DcffAEhQSIA92bxHlU/66OPEZ4LwhZnQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:12.0449 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 04a7125f-06ac-45e9-60c7-08deef2dd8ad
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742
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
Reviewed-by: Alex Hung <alex.hung@amd.com>
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
2.55.0

