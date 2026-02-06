Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D621EB28FE
	for <igt-dev@archiver.kernel.org>; Fri,  6 Feb 2026 09:56:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD04710E674;
	Fri,  6 Feb 2026 09:56:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="RNKgAA8q";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010060.outbound.protection.outlook.com [52.101.56.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357EA10E6B9
 for <igt-dev@lists.freedesktop.org>; Fri,  6 Feb 2026 09:56:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oQtjM2bRi3c6HO+Bhj9MoPSln/MpBcfG4DfhDq4TpHner6JQ3gcHVHi/d5fgiG5eC/yylSr/bRvsV8RxYpUufNq/qeTqS55b97151PbPi+woRwGk07cv9PlUKPR9N8TZuspUEeZGY27hBudzixRtLhIFtQdiBMGQV8VVWkggOlI/xgF+0bwDQ+bvem5EcUMnPAHlYrr7tLRMKJJDFz8j/nzYDN6bws61puSArhY/fLrrFCP+0kLQrp89KwSjARAUWor/FrU5Idk7oqN6XAUF6MND8reKCONygCXg28124v1rQWD7cuQigXyJf7fOTCXLagiIa9dol+IiuhBs01YFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcH9Icx6d4nlyJvpMW8by2kX7BuNidCw10uFdS0d/nc=;
 b=KdgsAEQfjF6iZxL0+nHPf8bCLD7KI5D69ZyC5Vr+vfB1McabJrOctDqxGTsxNG1lO+P5V2VlaxWOatVmyL5NmLBdYLBIRFrl7Vo2tovpELC1uNyyyLP6UG+EYTHTjwiqHB9QrAPrOZ46uM/X+8DIv+p2X67BnCQbJxyh/fD6SyTsjd0Jqrfcs2gcc3TLG2ahKeMngLIUqgHppS5UUVn2eogr7O7A10Nd+TwYRwqZgcdtIWuOB2n23OuPGkICYg4+tZ/f3fWiF4qEiZXdyhLz8CpUx+l/LKK3ZEagwT8CCzHuS2otCjFOrTjhNMK2AhwZiOiV0Ftfzmmj5lQ/QlI2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcH9Icx6d4nlyJvpMW8by2kX7BuNidCw10uFdS0d/nc=;
 b=RNKgAA8qyH8sxTpP70HJjzMU/vkR4N+83a4U6JV59lDj/muSUh2o1nO/aItEO/AXGFTjZb6YkeBk9emhLNMRxumaHkx1m5YjP//7xxEorqv8DXuIzTr7E7cx8POq/9+wk6iITee68Zkqd4MTzb+7ISEo98LFPzC6ZnhJQG8M+AE=
Received: from DM5PR08CA0054.namprd08.prod.outlook.com (2603:10b6:4:60::43) by
 LV8PR12MB9272.namprd12.prod.outlook.com (2603:10b6:408:201::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 09:56:34 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:4:60:cafe::f5) by DM5PR08CA0054.outlook.office365.com
 (2603:10b6:4:60::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.16 via Frontend Transport; Fri,
 6 Feb 2026 09:56:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Fri, 6 Feb 2026 09:56:33 +0000
Received: from rtg-Plum-MDS1.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 6 Feb
 2026 03:56:31 -0600
From: Tessita Thomas <Tessita.Thomas@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, <Tessita.Thomas@amd.com>
Subject: [PATCH] lib/amdgpu/amd_jpeg_shared: Fix JPEG decode on VCN 5.x with
 correct register offsets
Date: Fri, 6 Feb 2026 15:26:17 +0530
Message-ID: <20260206095617.453868-1-Tessita.Thomas@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|LV8PR12MB9272:EE_
X-MS-Office365-Filtering-Correlation-Id: ef434f40-e308-4b8a-e658-08de65660261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bV+Xhyc+c5dDAfl+h7WtBguBBb+WPX/1kWwdU3ar5/L4uGDEc9MFVFZWJ60+?=
 =?us-ascii?Q?SbvLb6T9Am0OpPB5V085ClHFLGz/wZiAWjg3BIL3XtnSUjRK3utmZXJ+aWya?=
 =?us-ascii?Q?0OGecR3zP81Z065/Rs25MIeDFQib7s2EQvz8eksI1c+ekqhl1s7Q2V91QPQk?=
 =?us-ascii?Q?BFHyCBRBMzTWjdq60O598ZAHLm+c5p9tT1zUehshNJfcPp8lDrILPMF3gkCv?=
 =?us-ascii?Q?6MxD7YI/9uQAtfUsCZUHFQoRNtAp6Jk6/C3M0H00pfWNtsB9tb6G0BYwNeha?=
 =?us-ascii?Q?NhrtHEY0UzqKs6hvOQUTRqIQz+LHk5q0tvYuIu7Ckvk1JPXWyUiz1GWIZDrC?=
 =?us-ascii?Q?sV3CBCbiVsqXOCkOY/KQdUK0M40IPditYBXboBJ2AgOJiD+lAmPBpOTS4a55?=
 =?us-ascii?Q?iq+1NSoDY0vEBq4Rq/w40D9oS0tSI9y67rN7DwuffGuMeqoWlN994/hh59Q4?=
 =?us-ascii?Q?DPDCVSRV+LP/mwr8jknRWBR7WrkdlwCauOj09JgT5e3ZKwkS3bdz9w/4vIK0?=
 =?us-ascii?Q?yXC5ifEeMcSLQtgV/NtZkjBS/ZdYq5dR2vPS+nT+IL5eRObYdvzBZdzdjAZF?=
 =?us-ascii?Q?QNwcEajuMCXYT4hnt98KAopRZQr4sl6oS3OXFg1Fn+fjaDs164z34hhuGxbC?=
 =?us-ascii?Q?Im3s580qQqmeyzI6ol2qiDfC4qnQQ1/qFfS5FJBw0F9+TUcIepPafzBsBbyM?=
 =?us-ascii?Q?NIcZFKbMLTF3Mjr9vyFrMYD4J44i4IcNkDxQLQ8mRTjuAdbCgr+pcCveaFAg?=
 =?us-ascii?Q?JrAh7bDbPT1C/pGgKF4RU5GDyc5+VxAXCkFDdAtYTSLXNB7u25inj/nEPIvR?=
 =?us-ascii?Q?7XhyuZl57UG9a/0oiBcuUlijudN7HaNfs5CzQ5BFQ2EFznZcUJ12djBrYzax?=
 =?us-ascii?Q?F9PDuZKqgpn+/g3nHyJF+eM9zX8FCHiFTQTPrxuxQuqW2xV4ejxI+xdnAYYv?=
 =?us-ascii?Q?zs8oggAKBM4K3Rc7jhDk32JAFQ9nUX/wk58ML9sd1c0eU+XW4ttWcKTLL9EM?=
 =?us-ascii?Q?Jf6iNj19gkZB2D+oJ0w8gYPXwxRzOmQtxTtqg0q0CWz/S1gi3XnjWjyy/UN6?=
 =?us-ascii?Q?I9Us7OhRUkRDNbEgiWjruMslKGW9O4cPVSdH/J+GclOowOXwv3x3yVMR68tu?=
 =?us-ascii?Q?NHLb9N9oY/+CyERAXxeJ1onvxh+SF8z6H0GaxtazUHyKjtY3mkJl+nW3dnds?=
 =?us-ascii?Q?59f4yivJw9WhrUSiAQElrAn4AxYoZH9WEism/c/am3TRAPDYihNJ8GeNVmQ2?=
 =?us-ascii?Q?WqWA9O/1PbeB5SN68FCRnWWzh9ayK/F5zNXTHk0vxP7w5ck5gf7wR02sbijf?=
 =?us-ascii?Q?UasQLXxRUHMtJllNnV3KZN0Vjah8b/ITUtiR5YUptfSyFg8fcp1yA2gJY98c?=
 =?us-ascii?Q?IwvUZ+VKxAl9ZZbzfMFOeerH/o+3h7lAb0rIpAokF0sOixmEIspL+wgmTlkt?=
 =?us-ascii?Q?2SSVQ8LiBlRmaQkQOBBIDNvce1ZZ0NGnpjvPHH3o2Z4ISP5ulQNPy2oaJ/+M?=
 =?us-ascii?Q?BhFRu9mn11Sbg9Qrqf0+oXsSX/5++RIDt5pp894gSzDc8I9T+G+v8pqkJ8Rv?=
 =?us-ascii?Q?j1FpyblDaPXlhxdQx5kQTbewKApIv0Nm9jSIYmH6e3AZndAkrA4ApGxin8pe?=
 =?us-ascii?Q?uR+xA9DACpB0iVpp+vdv/C4dy3Z0H36H+oaPI5oFXO0tntV4pbb6paZSxvWD?=
 =?us-ascii?Q?He5C3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YlvTmPSg9rp/1q6qQR6V04P/B39QxOnu42YkKxjsB8z9F8vdqGFggC/YnPb39Oz4x+waNw1uHGvYsb+GhFKRh3zTlDITP6jmvyIToHaXCZ8xs57vszHA44ATr9TFCbZ9vuMoYl1NWycGmbwseDEIngfEzLukHxoodDftnq7fJuZjElu/T/mD2t0KcMnefsGEol1rI07WKoAmd4hVqw2rLE0vxqDp+W4YYoNjixGj2BX7fPIsCs1oIG6Q6FHqdXEUG6zQOUANJjFLDiXx+vZEn4oJSDa1nPOlUiS9n7BVyI4Um61SjS7GRQyqsBj0xEkK9DBK0XhuEpkhPjTP/qPXp3nVlhjGRAFy5Xlq5xLjsufmfEjIapcPAwwkleQiU/+3yDxeM3Ee07LfjPpQaB277H0mPE8PrywF6MXZ+ckdkJX3ULXds1UgfqU3zqObCaAg
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 09:56:33.3508 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef434f40-e308-4b8a-e658-08de65660261
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9272
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

The JPEG decode test failed on VCN 5.3.0 with GPU timeout
because it used wrong register offsets.

Added support for vcn_ip_version_major >= 5 to select
the correct JPEG register path(V3).

Signed-off-by: Tessita Thomas <Tessita.Thomas@amd.com>
---
 lib/amdgpu/amd_jpeg_shared.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_jpeg_shared.c b/lib/amdgpu/amd_jpeg_shared.c
index 4c17f89b7..0b56eea56 100644
--- a/lib/amdgpu/amd_jpeg_shared.c
+++ b/lib/amdgpu/amd_jpeg_shared.c
@@ -38,8 +38,9 @@ is_jpeg_tests_enable(amdgpu_device_handle device_handle,
 	jpeg_cntl = vcnipUVD_JPEG_CNTL;
 	jpeg_rb_rptr = vcnipUVD_JPEG_RB_RPTR;
 
-	if (context->family_id == AMDGPU_FAMILY_AI &&
-		(context->chip_id - context->chip_rev) > 0x3c) { /* gfx940 */
+	if ((context->vcn_ip_version_major >= 5) ||
+		((context->family_id == AMDGPU_FAMILY_AI) &&
+		((context->chip_id - context->chip_rev) > 0x3c))) { /* gfx940 */
 		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST_1;
 		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1;
 		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1;
-- 
2.43.0

