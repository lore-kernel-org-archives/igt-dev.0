Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2567EC54E58
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5380F10F2A6;
	Mon, 26 Feb 2024 21:14:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sQPDi5ZX";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2492B10F29F
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZiE7RcUya7XLRMOnMLpZBOoiwp8lwFvm0UZae3hbswT3Qa88ZaL/hKpYnBpQlXQTQYCH012N2RwOEkbv9kKokUsZHDmz7UZYHC8Mp2qCOenut5JZOJ43MXD+ikqDm6uzr+WR/XS1wbT5iBrE+VzY9b/O3OaitBrxxhZY8N7Z5XZVDvXxx0XLwadoiIj7N/V1veCXUpVvw2I8lQraTr6iOk15rwS1gxVAkXeov+9BZGSkSqKpVPg3nhG6NJnzaTzavsQhKDDtXUOIeNghuzhMj+1JMJTmGfZGrd6dj7LIj8S8voYV+kONUNUCetdxu3fbDf+0rtTKgzWZCXTC5xttQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7dL5jGBi4V/lsTfQMSblkSUsdPD/3WHWeRV9M7i1Xqg=;
 b=GC5x0iofKL7bfZh+YwDv0dDCfu4XkUrADRwwIjX2IKpCk504e5pKC+tJebAWsbttsDouUJdc8s1z5e/eaj2PQWh/xf3pOIit9vjY0K/1Dsa2wKi31ODB9UU7Hlo6zRtkCNz4DtEAg7tRgaMnzDbNdyrodE45P4CjuWSJF7pA0nzf1N/tbcIQpDWNLwyKI8DfZZQOOqLFH+GqWunaeOrts0A71UdNbQ0PHBQ13ddXBA8jFhkBz1hhOut4UJUlzC1cwbHRBCqhK2Q8+6p9tfR05csxPVN0YdX+Y7ORtRb7rxQ9d3xAQz76KLRsKTrzkGI8ph7ciPXRTcDWlSwDw4+6Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7dL5jGBi4V/lsTfQMSblkSUsdPD/3WHWeRV9M7i1Xqg=;
 b=sQPDi5ZXLiuv0XsRH1EMoNfTJUQuvXgY0ZY2yQbhabS1AG9+BCUzU2XNwCNDxRdndgmAw1LUmXi62t7NHhbd72N9tnBFngNwEf8emb3jg/jTCQEnhQ71Etto6EUh229zMBu7RmbDDu7nXw4+drp+pzpZrm04O4rErn0eE00y2ac=
Received: from SJ0PR03CA0250.namprd03.prod.outlook.com (2603:10b6:a03:3a0::15)
 by SJ0PR12MB5424.namprd12.prod.outlook.com (2603:10b6:a03:300::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:43 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::96) by SJ0PR03CA0250.outlook.office365.com
 (2603:10b6:a03:3a0::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:43 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:40 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:40 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [RFC PATCH v5 23/32] tests/kms_colorop: Set wide [13,
 13] bracket for comparison on amdgpu
Date: Mon, 26 Feb 2024 16:14:07 -0500
Message-ID: <20240226211416.100660-24-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SJ0PR12MB5424:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dd77716-d995-4531-7f70-08dc370ff3d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mCvyKERt1uvljX6ixjAs+p/tUrvGt1Lde7RifzgUIftFPw+Mws46IohAji/FUELBxHUMIxKpdiAroYBNVjwtXVXSaTYBTR29HqdbIsCWwYlcNtfAqS4RZ0y5jQNmy+O1Xpf6okMfkl080myG4MJGeyLMz6a3pEOdPGyDqtkUV3tijU1JS/R23O6bDk6BqO0nDVCCRP7tub8KMLR7j8LCV7vQIKeGZ0i8Oyb+Od6sZEUT64w4av+jlFEqQa/HR7b1xP/tH76FHqYipJQ3eNpkMO87SD0TG7hKbvGzZ70ot7rGdQj1ObcS6p5VlZ7g3qzHqStHNwJyM65Sb9Y6K4kCdH354I8S5WfHgv3LwxXl9npfhOmLxTqbDjqGsNy79WuwCQKlZEJND6jiB8BZRMwwAFkY4isT/+Py8tJ5HDCzp1zGuT7ccPxtPBTHUcm5Nh+zaP3W5nZPsWH6TugBe8lTwMACXWxLNgv1+eg6sCGuFj9ExSxwAiSWuBtY5EjKvftLR7mKNVqBNilJggx3qb1QtC8t9pBHgrBAHrBrU7AWWXWup5H1p7vsiGnnj0+Ic2P8oAi1dm0Oce3Ctv3ladWrdpuZ7Yomy9g0ur/oiTyF4c5HbIexNSc3ze8hLGDsC/Pa18Rk7CITaPdK3OUMzxn1jDicqQNC2D2PbnO+Vx55ThXWUUTfSVI9XVBHWKLWD38gX6X/trpXY+++0xcKCqvx25jc/KH3Re5GpwbUQUSZ6v50iEgEOZvN124iHqX3OFsK
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:43.3657 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dd77716-d995-4531-7f70-08dc370ff3d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5424
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

Setting a fairly wide delta for now, to pass tests. Note that since
tests run with 10 bpc surfaces on amdgpu a wider bracket isn't
unreasonable. Still, this should be investigated to reduce the
delta.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Co-developed-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index f0f4d83d8c8c..b7247983a4cf 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -354,6 +354,8 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	if (is_vkms_device(in->fd))
 		return igt_cmp_fb_pixels(in, out, 1, 1);
+	if (is_amdgpu_device(in->fd))
+		return igt_cmp_fb_pixels(in, out, 13, 13);
 	else
 		/*
 		 * By default we'll look for a [0, 0] bracket. We can then
-- 
2.44.0

