Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F8ECA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BC4A10E9CD;
	Fri, 15 Aug 2025 04:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="35+A5okU";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5215B10E9CD
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:10:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4PUGan+uar7B9mcG414+pwYT8hewpeS6/t94a79SaJ4LAvQ0wBwaDMHIgaaQLXd8ognDar5165eOuu1h1nv70arkZGqeQSlI6VXw3tps/YW3ZrZzLZ+eWUL8Wz5k7OLc+XJ+tp4pGg4Mfj+Yh0efB1cv+3X++9ibzT0SjRpbPek/yuAAeJ62ku+tBLngy5vDZ6rlDl00QKKKmS8th8Qkx3g+B5rlN8+4IOQQSwWXh0xMEjPLu3At+YUuMGQHyDyHNw/HL3dC96UbL+lHuR765EBG/2XdcGwwB3MSthtBcWtdIdF8eohwboCj9z7JfYgx5YJsAWEQAT8jgwXwzDUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z9l3bbtlEQJiTxFG45H6UndlEELeULCMszFKzAcxBcA=;
 b=hvudGryD7j2ff0aaEC1ZvPV88T3h05vhR0YIfasStiwutPPC7Kb5Z/QSyCbjQQdmd27Vf0l5Ja33Bdcevuoc/TejXqK9Tz0whgc0+dAglCWMSjdU6UKt4kAXsk+sRhe7AB+q/VIOxYZzamUfMZcG3Wc+lLrHF8DOl4z0sh9KomvL+IYajzx23fHUk07iryCC83AqIORkcWsn/chWI5EAS9g+5qaCIQHkJw3PcqcE4oGBJ3j+TkabQLwix4dMFhF1AaDSJwwS57gn72CzhUnCjlgis5E1mv9tjiCHb4MGabJExxUz84YkjbTX0qZnsodZSHOQXFsdPsWzy3HFv1dNEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z9l3bbtlEQJiTxFG45H6UndlEELeULCMszFKzAcxBcA=;
 b=35+A5okU9W4C9OgvaHmhqnIcAx1SemjR4ybTvbDkzyzF5e8UL1im5WEqoVnfi0hynf3/v1KCpW1LSH7wDcHTpRya3xDKyiO9AGv7YJZkuUsRQqlqnXjwP2NY1yp+Zb0o6XSvuRuYJOYu1ff90M6U4xXV5uBCoKNeD1q5grKCgg4=
Received: from BY5PR13CA0018.namprd13.prod.outlook.com (2603:10b6:a03:180::31)
 by CY8PR12MB8337.namprd12.prod.outlook.com (2603:10b6:930:7d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.17; Fri, 15 Aug
 2025 04:10:15 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::f2) by BY5PR13CA0018.outlook.office365.com
 (2603:10b6:a03:180::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 04:10:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:10:15 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:10:14 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 15/30] tests/kms_colorop: Skip if writeback does not
 support fourcc
Date: Thu, 14 Aug 2025 22:06:44 -0600
Message-ID: <20250815040659.3321102-16-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|CY8PR12MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: ab179ff2-3856-4b24-cb0f-08dddbb1a35a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fHiswraedUtEhS3EBC7gSl4yo6K55EK6L2JTXhSRcscxb8B9wpHs/G0J6h1k?=
 =?us-ascii?Q?Epl+gPrzZEn9gJ+mSiQKAR1rTOGnN5oOMjqa+S+ZJWDrW9aYQ9Ogb/cxiJM+?=
 =?us-ascii?Q?nDzoTEcfGtVMFJKFJMUzHln967V8tVc/v2tb+LJtgx4sBbffw/H6SrF6F2X4?=
 =?us-ascii?Q?w79O4smd48aWL5h2ADWmhzqYquc+KC1Sdv/KyQqOmakTme5oFN9TvV7vpU5P?=
 =?us-ascii?Q?grtYFmKwB6EI20LRrWfv/KvP3LcBkNP+43GEqeRNYWpyZeZ4McjN2NWds0Ds?=
 =?us-ascii?Q?6M3Qk0bG8eeK4Vl4kpQOwTwUHbojqNvsua8iCD25kodaIwgs4gPAsJbsmye2?=
 =?us-ascii?Q?nhKNz2fTpTYaZmV5h8GTBAb9y/KWhSOVN2KmIbYthkbs4LJ6p6yXi+0BT9B/?=
 =?us-ascii?Q?v7EEMeUaeY0tySdxi2evK+QSSiBTkVT30HSPJE6cACAZFP6QGpdIsHZvb3ez?=
 =?us-ascii?Q?CokBG2M8F+rreUuo6VxaXPMlHXaqjcKkPKqBcuG9qclZ7Ii4MdjXlIXACdq+?=
 =?us-ascii?Q?0dm+pwrvpNmZQwXkCTIlNCL3vaTY6BljHg0eJp7ubsDCgn2WdoN60Mkpcq2j?=
 =?us-ascii?Q?LidXrlS7zpKsariSZZxNhZ74in3AQkZuoWdZI6q5KGxqS9wH27kQriRRAAsH?=
 =?us-ascii?Q?iXIOe7ANDwcPw4OUWFsRVv+RUy9OwLYRCu3hcCQ0JUKx8RL4PXrwRQxg0v16?=
 =?us-ascii?Q?lrDgtl1e0IJe3knCC2LapWy5HLpIkj4M2E/mg+p86DTI5z/9baN7MBGFNsOm?=
 =?us-ascii?Q?I/7FXquFa9qVeK4c5l+9Ow8E+GkZDNTMcg5u9fnZDaideZkZTddZ8GbkidM7?=
 =?us-ascii?Q?aOmOGXeHVBGGypZJIU0aNFxUTWd4XEaKIq9Noy1y1CSLc2bM2r08TuYXazm+?=
 =?us-ascii?Q?+sHrVdT/nQRr4mEXVDFXncTKYz524K6Pw1ddQjGDtRXHJHS/bTpVKeTGq1cW?=
 =?us-ascii?Q?VdEN4lT3KYeCk/1wvu2gPzLbvlwgvK8qPSbOM+3k1eJMl20+lOrumVGkdFMb?=
 =?us-ascii?Q?OtnUXnwAgKk2WzVgShjfwa33iYXpdrR+o52++SG1Rj1DoYKlmMOnSPxzRAaW?=
 =?us-ascii?Q?QR+6PflUlGupy2LRpDxsEgjZx/1wcob9o+YD+6mWekVRpd7t9VceTIHjKqJk?=
 =?us-ascii?Q?HepZqHYM3ZUyAYnWXTtYJ2NuHxeOWieGGXZK9BSZ23juBCFRC5EWDGvpa9R9?=
 =?us-ascii?Q?MCGxmdXSmLyz9cB65eN4tEmlZNSPp2wcbPu8HKatgi0KPOg05Zu7AVGAbGgg?=
 =?us-ascii?Q?+R9xNUg974DZYQeGiatC6ei2z5QW85SVT3eUTnms2vOBSaXilgWTuMSOqaxg?=
 =?us-ascii?Q?OywsK7qgeuWh9BWH6feVDqtlYiK+2s7x1mfTSnHlbNKqL0IieUvmBrOPon4e?=
 =?us-ascii?Q?TnFUFrFtQwizjsW7M5/Q5dGAyiz06PA0z4smT2P3j5/b1RDM7Jb092kAan6f?=
 =?us-ascii?Q?hgjRd02uPcIgkex6Dm4jjNLiOMY/hKXEoIR/Nd+8e4ITkhco1RsvIrLpr+k2?=
 =?us-ascii?Q?QO80xjMIY8pLYluJtBHhmUwnRn5yvmyHXzcb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:10:15.1475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab179ff2-3856-4b24-cb0f-08dddbb1a35a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8337
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

Writeback is used by kms_colorop so skip tests if it doesn't support
specific color formats.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e23f876fe..77d8c6bfa 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -69,6 +69,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	drmModePropertyBlobRes *wb_formats_blob;
+	int i;
+	__u32 *format;
+	bool found_format = false;
 
 	igt_output_override_mode(output, &override_mode);
 
@@ -83,6 +87,17 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
+	/* check writeback formats */
+	wb_formats_blob = igt_get_writeback_formats_blob(output);
+	format = wb_formats_blob->data;
+
+	for (i = 0; i < wb_formats_blob->length / 4; i++)
+		if (fourcc_out == format[i])
+			found_format = true;
+
+	igt_skip_on_f(!found_format,
+		      "writeback doesn't support fourcc format %x\n", fourcc_out);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
-- 
2.43.0

