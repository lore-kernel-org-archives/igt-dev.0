Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30481E77180
	for <igt-dev@archiver.kernel.org>; Tue, 10 Dec 2024 20:12:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEE5310E96F;
	Tue, 10 Dec 2024 20:12:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="azCUbJzk";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2064.outbound.protection.outlook.com [40.107.100.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947B510E96F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Dec 2024 20:12:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N3FoYXzrXSox+EJG+qRUuAithtuFUnhfPcRy4wMEkT5XItpZrKgLMLm0VJCb2C8L2DCudE/pZkZZbyNPCCMEcoP0W1kQRebF9NP50SSQR2pLehI3+8I90eXUCVTODEt5Xgc3VvyfpbM5urNBibK+yy74IKDmFK/faQvuBGn47iiYTbQfTl3YoLMSEu4/jzTAq//k32w0PpF/HbH/XgUntcl+miqO4olNKBlaF4Ftna1sR18TQy60ZV2Ia5YxhJhhLENzRa6Qo9vY5ZT60T/boHiQCxkzxcw3ypRnxQad4IOs794CZh2CEAWiEyr2yX8McQ/Xh9MuhG69+BXxd0raFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46btiteFgAa2FnPXJYJCAdmF7iphLQKQJZA4zgydFVs=;
 b=eks3ykHhvgaMut6oCgtBHeXIFy4j4iefkOANodEPDCPwT7Z2R+xFFlOELPwj2+gTeVv5s513wP4J4Owww5ml5qgjUP/NwxLmzzAQDX91X6oyD8ihbaAiKFgryZWdKaKTiBVZR+osGogsJmU3i0xNDDrLX0VB9ghWmRlmuBjEaxzRd8XuaR54hJcvxGjq+WFUFibGWbuRx0mFd33FtQNf8QiAuSZ6Q0zw/Tb8yjfESJiMW3lyWSYc1gSQDfbjrh0rSQLNIJvbqjOSZCwbMszG9BVYJPbMwv8fGpHfHdOxGeS62FAN3EKhZfkyppy9OKGtJLvCl9RthgdA2Bmjnp1mvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46btiteFgAa2FnPXJYJCAdmF7iphLQKQJZA4zgydFVs=;
 b=azCUbJzkqACZUQm/vCr7sjegdcrRZMBgj8tYF52BSAX3ycKFpcWXHgrspluDg2LiNb6WSE4yXpDegF0k0Lt81RQmrXMsE1OqCGm5KXigWnrUUdc5dtoze730fmoHECezdqASsxbpUIzSjTKm8GktQrBV8ypxgJo2T44Poyi+j84=
Received: from SA1P222CA0183.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c4::7)
 by SA1PR12MB8698.namprd12.prod.outlook.com (2603:10b6:806:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 20:12:22 +0000
Received: from SN1PEPF00036F42.namprd05.prod.outlook.com
 (2603:10b6:806:3c4:cafe::18) by SA1P222CA0183.outlook.office365.com
 (2603:10b6:806:3c4::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.14 via Frontend Transport; Tue,
 10 Dec 2024 20:12:22 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF00036F42.mail.protection.outlook.com (10.167.248.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 10 Dec 2024 20:12:21 +0000
Received: from MKMMARLEUNG02 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Dec
 2024 14:12:20 -0600
From: <george.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>, <sunpeng.li@amd.com>,
 <chiahsuan.chung@amd.com>, <alex.hung@amd.com>, George Zhang
 <george.zhang@amd.com>
Subject: [PATCH] tests/kms_async_flips: Only check joiner mode on intel device
Date: Tue, 10 Dec 2024 15:12:07 -0500
Message-ID: <20241210201207.917722-1-george.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F42:EE_|SA1PR12MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 983900b9-74e5-4ef4-2a3b-08dd1956f47f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gGvA74bP3+RoW/zfy7B6FqNpgAK+4wIeLNBmPdMh43sUHadF7NlsBBJJWw0g?=
 =?us-ascii?Q?H01SrHVJj9f9rg8KfPf3+Gn6QLIs+5PuG9bDj5c6raefnYejK34vFsjdvyX2?=
 =?us-ascii?Q?kcbyAFsGhUwYKqrhwFWeT61sK0T1dc4Wy/8lMEaS9GaFQyF5NAIEKfsq1hbU?=
 =?us-ascii?Q?vtRPITwWspeQ8SdZ5LsA/mr4xya+rE3Q+2OYhgNlnhhMN7OqM4cxS2sXVzjh?=
 =?us-ascii?Q?TBdxmXX7OZ9fozESUzHRRgRl4e6YdFr6xilqdopg9Xbo+2OlMc2/NIwFnqJu?=
 =?us-ascii?Q?p4p1yPDhlSmqt1FZ87O87gNxR/tSBe2tTBlEG4lqOWmVEsBlUNLXqf8oqrGV?=
 =?us-ascii?Q?Cvp2+fWgqm1lgPmJU1CQ3UHkbjApuQfF373nhrl2puIIA/QCNlTaTYhNL4jG?=
 =?us-ascii?Q?oNSx7lkarDJwbAAy1z70zP8qHiiSUob72Ro1C4TejMixErD1BtaqHFI8Ttc5?=
 =?us-ascii?Q?VTfbMPMf8Q7szaFA19ngQMzc8a1U80DSoOyIcY5YcyoNY7az3TmazTlXBgbQ?=
 =?us-ascii?Q?pUNF1V3bFtwU8L7Au6FtqQQzk1py8BnG2tiRbMSsw4o7y524VMFgzh5DZKV0?=
 =?us-ascii?Q?XLaKqg+S3+dSUm3OuFhMkxaQuswBxEHPsN5QEcmAb5sx8DIVoaqZW9tdx1hb?=
 =?us-ascii?Q?qVlTvDY/laU8Ae21fRioSpXGSnqaIq7uDINmp/V7euCvB9KJmcpzhXmj+Iuy?=
 =?us-ascii?Q?807ybLhwPMxVNS0GxU0vFn0zzK+M8XTMTXaWiCSEsBFirBQyXPRjlNvTXdgL?=
 =?us-ascii?Q?IlTBpVUudnovDdN7ypK+TbrZwDqyPLUDTe7POwSEkasGMciCaGxYRTZaerUD?=
 =?us-ascii?Q?nvpDONBxZIOfoEb555r5O14hHQRrR+EperRnMZy6msnBLL9rqKUV0wchlxQY?=
 =?us-ascii?Q?GTUsatBE6ySiCwXfL66fP8iHtzZufZyNgbNOfnpjP+PeXzUQOTKAO5LSC4JO?=
 =?us-ascii?Q?YAfVhkAqDtHrClIbOSammD2PvYfSK9TAJMnTjPgMNBARDW/Elt3PwWTpgYML?=
 =?us-ascii?Q?OSLg77zdU2NjnxVq7wZkK0F/1jSEOrxfSrtp73BMu7c1TKK1z4VkmOGUYsrS?=
 =?us-ascii?Q?HYnXHs/+t8Q/DR8k9EyOjrC2mE70VznR+M8z3Tj5yN81XMV7uibN7cqij0+M?=
 =?us-ascii?Q?aMA26b6IKPoJn3+WwvTbgHs7aYE5FL5iFsPR0614ezcDYVLtGXfxrdsyLwLL?=
 =?us-ascii?Q?zG3/FoqKYHQeksVFFnyjJm3/vsE7eGAVZV9jpbhdRF2fKPvYnO7O4r3PSZ6W?=
 =?us-ascii?Q?jgi/jzwxRh9oBQ+u2e7vwktUZZ33p27t0V3TcEQh7SC65oXPoYUaHfTH/9Ab?=
 =?us-ascii?Q?XDxNtxUGevTu4EQCju6VTC570zfLGcsOtpcb4ox3uC2IU/L42UEp8es5amtW?=
 =?us-ascii?Q?lFgaw+fLsTktQ9+c+NqsQ1VlWe+/XB1CjxIXNvS+U5i5utMd6Dx0Yd9XZ6hQ?=
 =?us-ascii?Q?4a5gMZcsjCOS7I11O3GS4x2BnlC1cRxx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 20:12:21.5553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 983900b9-74e5-4ef4-2a3b-08dd1956f47f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F42.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8698
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

From: George Zhang <george.zhang@amd.com>

The joiner mode check causes the kms_async_flip tests to fail on
non-intel devices. Added a guard to only check the joiner mode if
running on intel device.

Signed-off-by: George Zhang <george.zhang@amd.com>
---
 tests/kms_async_flips.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
index 4a72be7b5..5e7c64d73 100644
--- a/tests/kms_async_flips.c
+++ b/tests/kms_async_flips.c
@@ -706,8 +706,9 @@ static void run_test(data_t *data, void (*test)(data_t *))
 			 * FIXME: joiner+async flip is busted currently in KMD.
 			 * Remove this check once the issues are fixed in KMD.
 			 */
-			igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
-				      "Skipping, async flip not supported on joiner mode\n");
+                        if (is_intel_device(data->drm_fd))
+			    igt_skip_on_f(is_joiner_mode(data->drm_fd, data->output),
+				          "Skipping, async flip not supported on joiner mode\n");
 			test_init_fbs(data);
 			test(data);
 		}
@@ -733,10 +734,11 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
 				       * FIXME: joiner+async flip is busted currently in KMD.
 				       * Remove this check once the issues are fixed in KMD.
 				       */
-				      igt_skip_on_f(is_joiner_mode(data->drm_fd,
+                                        if (is_intel_device(data->drm_fd))
+				            igt_skip_on_f(is_joiner_mode(data->drm_fd,
 								   data->output),
-						    "Skipping, async flip not supported "
-						    "on joiner mode\n");
+						          "Skipping, async flip not supported "
+						          "on joiner mode\n");
 				      test_init_fbs(data);
 				      test(data);
 			}
-- 
2.34.1

