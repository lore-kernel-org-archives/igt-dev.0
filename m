Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01889C3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A576C10E692;
	Wed, 30 Apr 2025 01:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rtOEx67r";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2058.outbound.protection.outlook.com [40.107.236.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 525DC10E692
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ImggCHLD43WtpUmkuR5tIh218uZeIXzWvijpmdp5RlLDq9M9uJNT1mWHR8YO5Eoc6oTgkCureb1s3oJ1fMweLzHwWogII9W0RJihNUe15oDSoV7A13KKLLNQ2kYcmHCkr2KE04mgd3GpMHcbvHuo+jHYFT1WN2NBArhmel7JeS5wt7en+wiQh+Y6ZomFadMusnCieBHpPnjGduVjcxr/Kihz6b4O3VxINb8IqWai0FI5+ZNiOXT6UwmYgCS6deToTE9xnSE7bqBbEs6AJNUlKRSzgDT4WJUiqowBZaicbSM8IyWousZWZndLK/IcIUNZMJFUBbjy9d8Rqxugj1/GTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sFFkX9Uf+INJtfoaPrtp9GifgLVe5uXtwjVu2XyNlLg=;
 b=Y3R+YRW5oJpTjU6DuwLFkgDbOyh0tQqLtcFVi/QZKUVxeq+/9u+nmeN5N0C0OZPMOG4yTDrCBPBT8wrWxV2j9b+jKDSWZ+0/jOLllpdBAnSAydP+ezW4XYD++Fo2HIRfWOeYJuEDHB+OINE9telPh/6TzMgHp66ILaHbqux+Mwq1gxO/rTqUDi7nUqlZhHlZFbhssSlp6xBwn8OYC+WdHo99HVkfUu1cpnxcKujSs8CbcXYA04kKw7ZEDU/O9t5Fkg4OdQ5qVINAHsO0Li4kBRnKPik0r87QRjxbAVxa2Fptwb3+GSBu+JPP38UnYj21TgzHZIvXycaPavx/F+QuBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sFFkX9Uf+INJtfoaPrtp9GifgLVe5uXtwjVu2XyNlLg=;
 b=rtOEx67rZtDixMTF2nCIbiD4h2QRp724x8f5OkeGuA0c5NXwXHc5FmqhXiuypNHiV1XZl9t9C/xwiID2kfSTO4mkTW32hd2+uShsITgfbodD8CLACVGDG0zRrUrxeAuqCdcRVSC1gFltBMl1BzNjjPhijWNP5c7mtpmOh6aB3kc=
Received: from MW4PR03CA0183.namprd03.prod.outlook.com (2603:10b6:303:b8::8)
 by BL4PR12MB9479.namprd12.prod.outlook.com (2603:10b6:208:58e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 01:39:01 +0000
Received: from BY1PEPF0001AE18.namprd04.prod.outlook.com
 (2603:10b6:303:b8:cafe::43) by MW4PR03CA0183.outlook.office365.com
 (2603:10b6:303:b8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 01:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE18.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:39:00 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:38:59 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 18/36] tests/kms_colorop: Add 10bpc test and skip if format
 not supported
Date: Tue, 29 Apr 2025 19:34:36 -0600
Message-ID: <20250430013454.226910-19-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE18:EE_|BL4PR12MB9479:EE_
X-MS-Office365-Filtering-Correlation-Id: c939ce28-333e-4974-218b-08dd8787c871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ntkQz8XMyrIROyu9lt1ifzOHExNB/a4Whp5XqMbCymj4daOsz4pShpUejqdg?=
 =?us-ascii?Q?A8+Z5j4iDfFhX9LMRqF+D0YtoYfYK8HA0ILbq7sXNLIIqEEl3BAfkB16dYyp?=
 =?us-ascii?Q?0r21ij87j3Q0MnDnq55Eqd/7CFw5qooaIzDUlIt0FHON1BZpLhRgz4K3hpwE?=
 =?us-ascii?Q?WCvWF76J2NQyM6rECWRdjRO9pt5Ijt+ANu+hsa99YWEDDLbbebI6CT2BmXkV?=
 =?us-ascii?Q?yBauySD8t+1HwAVKxYzadyS4ElCCuoGfFJCGb2+dqmhRmLWj+gNwqytAJHgL?=
 =?us-ascii?Q?dc8jmJyB6m3fAuMjAHAun0D6dscGLEu1VFzPr7V9eGIHxKoFvbtZ0uW+fsBx?=
 =?us-ascii?Q?nyy8VENdFVJeDxzdyllzPNE1Nj+BjwdI82LUfd/EFVe7GfH/DgLYnHq68402?=
 =?us-ascii?Q?xfvNj2kI7UuwzPdnDwjhergUPPCk8hzJY+/zoEzt+8/Rq3fMU1qmH6ld70rf?=
 =?us-ascii?Q?PzesHoJb2zhVPaCOhb819Z5NXPvR1QS3xVbfVdaBK3lu5T8a59tMkNgJa7li?=
 =?us-ascii?Q?29pBjv/1XkLPDP4ehgNbc/XnKkOpLSB6GkxWBoBnj/4fvwgyWR189dWUS5a4?=
 =?us-ascii?Q?sK0cuqxBSeHr8iHbj/BchhRnVvUNli3xlznLsa6V2C383irvbfcIG1AflXub?=
 =?us-ascii?Q?pRjYZWcrN+MlE3Fua26yXK6/T6N4rDheu7DTXEPtm2eB8rbHSjZ1GtwNfRLh?=
 =?us-ascii?Q?zJ8aUoAjLz7wysUxOhArPjaTf1hk2vAATpV/V6CD5tKn9KHKDb89uSAs7y8o?=
 =?us-ascii?Q?u/rPUz3rWpTfwyGEqmYDNlocNWMlDsFPD7LeWv5atfNweNiVj/quGgq7bipT?=
 =?us-ascii?Q?PmT9GkXmN5sC3MAe6PwdICig2OA+JRrPpbF8RF58StZO4AzA3ucxxHaxIkdM?=
 =?us-ascii?Q?tadtL4Pgv7NzzLd+vajyA+Vw16dSsFhScHIHVNRndw8oje8rSxn1q+rOFbjq?=
 =?us-ascii?Q?Q0+wF6/Ovn/t1QTty2bmyc7EuxDN/an3C+9UpPpcHBDGyUUbHZT61gTo4HNg?=
 =?us-ascii?Q?TVcj+QUAQ9qeqH4zT+uSSWWvat5iP3qz4fBRQAscAirRge9di9ZLFX2g1Oxh?=
 =?us-ascii?Q?IL7yQag0AEHqBm+lnbqty2p6g2tRoHCfayyUo3PcKH65op8AoGCpFtQpO9U/?=
 =?us-ascii?Q?BgxKiCYWJpPr3px8ZswB4fO2jn1axntLeTZWritbslZ2nJuKm7cbUM7tBAGR?=
 =?us-ascii?Q?dKMd8BQvzmUUK84t6m7I+IEQSEoajNv8/YVigTy8wm7b4QaVxgAIeazL7oa7?=
 =?us-ascii?Q?wXfj28fDAAvcXV3m6fX9V3mZPEd/6DZzvZHf4yfU/TeuCrubsiWazm+8cZAB?=
 =?us-ascii?Q?Zqt5V9Qvd1HRhP9fxuwmq39lJH42vvPt9OeXZUNHFP+Phq+DUxbS61WQ8Wdp?=
 =?us-ascii?Q?ezZtD4mnnKUlLLGxlfYrWSEHOBs+xtWRibSA4mh1AdQba5kJDhtvsGQro5FR?=
 =?us-ascii?Q?vZ8PdVooHpWwAQDbLN/PH5cG+Rc0TM+MELkBYm6Z3GXtvggr/Q5y6G+T/oDx?=
 =?us-ascii?Q?ngn3+NKzZBGgDT3HNsl8IDiBtGZ4DpTFRsNz?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:39:00.8259 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c939ce28-333e-4974-218b-08dd8787c871
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE18.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9479
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
 tests/kms_colorop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 83f121073..f99d0da7b 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,6 +40,7 @@
  * arg[1]:
  *
  * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:			XRGB8888 framebuffer and writeback buffer
  *
  * arg[2]:
  *
@@ -73,6 +74,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
+		      "plane doesn't support fourcc format %x\n", fourcc_in);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
@@ -81,7 +86,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(plane, &input_fb);
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -518,6 +522,7 @@ igt_main
 		const char *name;
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
 	};
 
 	igt_display_t display;
-- 
2.43.0

