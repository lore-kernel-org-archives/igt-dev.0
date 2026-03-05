Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98CAEEF309
	for <igt-dev@archiver.kernel.org>; Thu,  5 Mar 2026 06:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364E410E200;
	Thu,  5 Mar 2026 06:12:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xd0lLbCb";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012068.outbound.protection.outlook.com
 [40.93.195.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857A810EB1A
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Mar 2026 06:12:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcWSK1tF/5g30q2oSp9fSFYtjPRkf5mCN5SJN0tBAXRur78lFyhs9/stHYgHpMjuZuVEqMRXtlII5O2Gc4nFZdATy4dHF+vE4eB51N2N9c23iTZUFYgVxGkST0m8x8e9gvHY/6JMRflB+Hzsi7Iynqio3XaHN0fsuZNmLfhj4oAItsOlblnDFdzJX08i8+xlvNuG3h68Km5nJudB5AauzU5PikPHgIYljOXYJVSKYZ/NmZokDxyO3QovVmVtnWCfbXHln0uDJM2XlEuzMNhv1ZbzrROoEtRgNrK1ea0hNDj1GQdQBas5s0eOs89TKUZ+9+fFKshqgI0js3/CdI4jKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rk+buBFXV2dGbJa4WSyxCzdxVQIvMKmLcBJOPdJB+qo=;
 b=qjccmRYwc/e8TmJ6lxjtEYPdCuw9c1wF4NG23N9cFKExI8IY2MbMavqWqZfypwhwtY4Ly3YlAST0mSQ3vfCKu2UnimksqfKv/kkwgE1wBmQa2L7d/7C49Cp+3Lz1+VJasTqJ/8wkjEfPozozcC/bAMWiZ8aUIRVgc9dbnnRsKWD5pcoGZysBVi7qzb/0E4an+0mDcB/ZtihF7w04O+0P61mvS8uYl1v2dMG3e37m2MHSs+u8q1ClGc+T+8a0lg/WL+X+YLpb6zuNMk3NynkQvFKmsDcNvSCW7tWU4/WrTEugCwV3HT6AIQT1Cx77QtDGkQBvP3jQJs62Yo8c3spEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rk+buBFXV2dGbJa4WSyxCzdxVQIvMKmLcBJOPdJB+qo=;
 b=xd0lLbCbXnhT0aMkTQwGgXSbXNJPhYIH2WvOsQrZU8RQObZNmLn6paNHkeC8AQP/CJT4VQTUUQdWQB6VlQBZu3T5kdXja04ScHFlZytcUedrSuTdtjcCh8tAO4/P8ZbaZDsVag0ib0a0EpWNq0Yo8eiQDHoAhGQWX5e959KC6ZE=
Received: from BN9PR03CA0158.namprd03.prod.outlook.com (2603:10b6:408:f4::13)
 by IA1PR12MB8520.namprd12.prod.outlook.com (2603:10b6:208:44d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 06:12:24 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:f4:cafe::2) by BN9PR03CA0158.outlook.office365.com
 (2603:10b6:408:f4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.22 via Frontend Transport; Thu,
 5 Mar 2026 06:12:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Thu, 5 Mar 2026 06:12:24 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 00:12:23 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <harry.wentland@amd.com>
CC: <alex.hung@amd.com>
Subject: [PATCH] tests/kms_colorop: Update gamma 2.2 LUT names
Date: Wed, 4 Mar 2026 23:12:12 -0700
Message-ID: <20260305061212.4133135-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|IA1PR12MB8520:EE_
X-MS-Office365-Filtering-Correlation-Id: 455c2055-4399-4b5d-6179-08de7a7e2b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700016|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: +Rs7B/1S8rK35zADMSF2kRI7vDpQkAavk2hq9qMJuxlQmpj13HaphNI2O0I9/W/YhmbDKe6LQt9UuXjOigpQi2Tx7WnEmSVR6zNvXxXyup2J7l2BiTmLdmdiYpCb+5/K1NEQ5YUIVxO+M++T8mPoy4mTP7KkUPOT+KiG8Zf8cRHQaSp4stEMChPxVrZFLIsoj8LUSUIlMux4jtGihdcDIpoiKWrnLFXy+JSmzA39L3+t46/2UlXPynCRXv3tJFyc8kLcuqdywwXkB1XkAWG+mYphjQRSZU60Iw/zw2jbzibStfToTVe4AsJe+kkA9zk6oBBqmjhvkholvJjMguprqIBJrIHqDEoSOvHlcW1FByNGvWeKX/CCjHoE0lsJ6ZXVYo7bl33EmUxk3GfAr/FMc4DNQcytaNQhjrEIUWznNQgA7EMzOCVkse1Yq0KtT8hQWLE6Jeg+qH7HpmfURpD/yoJ/FmuK/sNlvZwiqwnoXwITQhi+Va1x6hFhhOezOPtxrIolLKSZokrtvLVqM/mZ3AWiOsRlG//FMpwdpKEDbh+n7/LrclwrgqHL/j1Q+pt+ioUF/V9e1PJJsUrJ0GkhhNLXvryUMxffHeM9fB7H/pQ7Sdx8o3Qrh3bL7zI1AUvP4A8yoJBZ/CkA6RrO8Nc5AWKlgu8PtRZATprqRW1fWhkPZUQ+4H4cuXS+dJF2QFTZCX4+shlfF/2s1TxYNmEe1KWYF4eXBvb060FQlCW/YTklsCRNhbz8gYILHd7COorObmJNEchIlFa3EbcXUJb1RA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: QHI4PqssQUt5dH44NFB3HG7MXD1ygIAzD5sThYaHtVmRsa2ZUgdV2v7wQ6IXLwFZuE8puIYvYQblBV3JjVKU0jK14ABPyVOiIBPujVInQSBUUQq/XP0dbqE15XuRtXr2yQMvJ2mdO04NVSSPVGEZl1OGpU2VJa6Gs5zpcQD7RoFMd0WZAxX/794SbKsvzZtsoY/cFev7XOJgPZXFr5h/296prExnQ9aWUXZpkgfqHUrcqCkm2uGujqWJD/AzMPHreiuMxwzx2pUn6I1PY9mHIUrM4zhANIPpBA7pDo13MFPWg1F8DJpoERzL+cX8BKWpqvNTYCdB7It8srKHw2it/9bQGPPrlQtmeAN3f7i234yy39bZF1uclO8+yY2qyETwKT3ZvBcsTa2IQeqXPpBDx3xacM6mogJ0S2Pp4UQ8lVl9sY6ryYB/5hbYQ568wd36
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 06:12:24.2934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 455c2055-4399-4b5d-6179-08de7a7e2b41
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8520
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

The names must be the same as colorop_curve_1d_type_names in
drm_colorop.c in Linux kernel.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_colorop_helper.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 152e90f26..c3a2b8f13 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -14,8 +14,8 @@ const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
 	[KMS_COLOROP_LUT1D_PQ_INV_EOTF] = "PQ Inverse EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_EOTF] = "PQ 125 EOTF",
 	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
-	[KMS_COLOROP_LUT1D_GAMMA_2_2_OETF] = "Gamma 2.2 OETF",
-	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF] = "Gamma 2.2 Inverse OETF",
+	[KMS_COLOROP_LUT1D_GAMMA_2_2_OETF] = "Gamma 2.2",
+	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF] = "Gamma 2.2 Inverse",
 };
 
 kms_colorop_t kms_colorop_srgb_eotf = {
-- 
2.43.0

