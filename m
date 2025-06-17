Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4723C71155
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710CE10E4C4;
	Tue, 17 Jun 2025 04:40:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QjNVAaaK";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD1F10E4C4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:40:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LhxgFnXcRZ1E0KNAFs/ppqB08KLlbbAqsqLWqAmS9YusjP189OrxRTyDkztJULFhsYTLRji5sxfRUGeLRLlv5BCwHB1TIvco2G/pwCucL7hnBuG7ARXMp9IA3GmOGuNvVdNkj/TjVHICr0PNN9+arzVMrC59VBldNLcSHrjwKKCg63u9V52GlM5sh8KlQOls5oEyXM8opVBTEcpIV4XC7y8gseR0nDz1io/mN0qOxl5GE8kLxksISkfpm1lPqt4OwQF54HEn113H1/kcESFOU5Huq9llrTKe4j8eUfYiy90HM0LxqpR4byHTJigHtqQUw/r4OzhGyEsUb1Bb44CF1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IWPwWjHGv8rg9W5O389FIE3EYF5kbIf8SQ6JFAYKBY=;
 b=yZB7T8N+1Qnm9F8mDksQaksUZ0Zu1khnfGVmDgcRrQwwLIKCHWUFZyiqL5zgtM1z0TTXNeyER/2WE1cURZCqr7Am0WsqvmKcVcj1UoUpjLPjJXquLTC5gr8RocbB04cjBprh816uxCF4uXK5RoPfyPgDkKM0rODY9swl3ImGB21M2kr2dAb/myrwll5jff/Px72mSxdaAMwjtlyp23WHG+lfkN66TReKtsupMyG7yroW6bCpDi1/eIIRPaJc2erW2OOLIYOuoxu0U+r5E/5kmB1YQM2zD4yWrm+D5obsZdblwpTJH1WwjKFjYw03jUuOjIQGp6It1MegToWqt6ELTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IWPwWjHGv8rg9W5O389FIE3EYF5kbIf8SQ6JFAYKBY=;
 b=QjNVAaaKTT/LCL66OL+Jdcozy4S+ja8RkAHCcBx/MtossFad8VCLpNlZ5HiTevsJ42no37pGo/C/LT0/pW0qgavMiZ0hYKmM/vsbGFpSLWEXp+wdpeRt7r7IeHfV1j31wbHZczcnoBhb+6IO0sUDvAjI0jhb+tN8CYOEd5X5gVQ=
Received: from SJ0PR03CA0204.namprd03.prod.outlook.com (2603:10b6:a03:2ef::29)
 by IA1PR12MB8493.namprd12.prod.outlook.com (2603:10b6:208:447::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.28; Tue, 17 Jun
 2025 04:40:36 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::d3) by SJ0PR03CA0204.outlook.office365.com
 (2603:10b6:a03:2ef::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.19 via Frontend Transport; Tue,
 17 Jun 2025 04:40:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 04:40:35 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:40:33 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 19/36] tests/kms_colorop: Skip if writeback does not
 support fourcc
Date: Mon, 16 Jun 2025 22:36:14 -0600
Message-ID: <20250617043631.2920587-20-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|IA1PR12MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: e653be96-6657-4471-2f65-08ddad591a04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zYWQsMx2lsBosYRnsMROQc12zZNhV3ELAv+yV16yw+LxgtJjAlvWHD+OY/vC?=
 =?us-ascii?Q?Zg1Dxx62f2R5YNpipXjSG5/Q4P2T3Lr+EM/XyFwAjYDY0aL+SDyDWTsIvTB4?=
 =?us-ascii?Q?BpfW6ZeIMX6ik7KePzvU/3++1mUYeB/z1IsIRo1471XRba0Ik3LYuIQpPmya?=
 =?us-ascii?Q?uaXM4R+fbKlLF4n4oxJzewoUxkCwMsdCH4mFRIdMzMUuz8XnESWiJeEz7YwX?=
 =?us-ascii?Q?Zkxlcm+WMxiYCOdUSkxuEFUfw3CFrAz4axJmj2HJdF2HIWXCZY4zERte7m7C?=
 =?us-ascii?Q?FBKfxiBTllU6fbG0PIX1VI/LAbLzMqVB7Odz86KpBRSLA8G7zDx1A/1Y4Mq1?=
 =?us-ascii?Q?I50usHgduFeqLLo2wro9WZtE826SLmQ/JV/LN5cYPEMY0q9KSywAWTEciahO?=
 =?us-ascii?Q?20shNcHxGogPlWv7j9Uhhw/ADHJoQ6Zt3mp8jQc8HWMpWBxBWGq+Geby0C0a?=
 =?us-ascii?Q?5IPIWxaf+eQU8xjU9TXSuAaI/6I4py06R/EsdgqPqd4jrTi9qiotekj5K2EH?=
 =?us-ascii?Q?tiilUXMn1663Q8LMeSXdvkkaktGBSk/uCoTNDLMR+3Xnf11Vb04nzu0QH2tQ?=
 =?us-ascii?Q?s4AmW/eJEMqOGJTCBElFY/HpM7oGwcm6EC4rzcTXYl9aGBEkOs0ABJ4G0izl?=
 =?us-ascii?Q?5L+oX0fH5ls8XTA5cDDRgJfFFQdaAIRg9Ft4o4PZhB0qqJ/b6AFuXeFBaRsY?=
 =?us-ascii?Q?J0PADMhjwhJ+YGtfNh5H5YPWCQXx9vO9vWQfZWtotx9MpPRxJQ/kxJRVkk2n?=
 =?us-ascii?Q?aeqbA29eCTP+kTif0j7Ngr42q61+jVO6tWWFIB4SoYKlI+LyEtgoqMfyt8ZL?=
 =?us-ascii?Q?hbRnInVNyp/aPqXEEzzjF51E/mtQ7eSVVq7wh9tWV9s+Kxr1NxlJQnHqPVTk?=
 =?us-ascii?Q?aIz3pNObjJOBYbibHzchYpZHeYEpBvMZp8KVUG1UA2TThZoozPqgjzPERki9?=
 =?us-ascii?Q?gJDb7kcxXWkiS1hgA9vqq19nclOpop2mJqo09RAmv4ocozzXrQWx9YrbobRs?=
 =?us-ascii?Q?7jhNPfNr9Yi8OVkagN3pP7z7oBM2mTJdaSVASag93v+s+mwE7XbEDQt420NK?=
 =?us-ascii?Q?4iqQeQ6QMijZ7Bhg1Tp+MODHP1PZTVpvSbS2aZdbHBS6awDQTZ+rN20uT4I4?=
 =?us-ascii?Q?GD8GDkNOiPztzg3Z1OF2eDySkAU41Jq2updsR53ptqnoQ7a2bkN34Fg510US?=
 =?us-ascii?Q?24LJ2xBlx5FHreDWVCH4FFtaMhNuphBs7syl/gADEAG52+ncnAu/yLaTymm5?=
 =?us-ascii?Q?HrMa0DQ2W0fU9/lORkuZDjdaXmhp8PJusUye7C7hm72GLYjAP0XOtyhWj58y?=
 =?us-ascii?Q?sbsDCXL7JuHL66l4g/57/wTgK6uTcuik/i+p6Qw+mUQvpWxZ48bEggex//Ps?=
 =?us-ascii?Q?k7xqAFwta6cM9mDnfzd8QwrxgJmDUkKRrIXo/6UFSzmRu7LePJw3B2GGuw3H?=
 =?us-ascii?Q?EzHOcOmtyUw3KBP/UCxl9CItdXUz3dkO5nQ9DUsvImyjTUEyC2wb9C7cO/qk?=
 =?us-ascii?Q?7wjN4oBJdw+MdqBLOmu1FJ7B9iGYmBuea8FK?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:40:35.5845 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e653be96-6657-4471-2f65-08ddad591a04
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8493
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
 tests/kms_colorop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index f99d0da7b..cc260618e 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -68,6 +68,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	drmModePropertyBlobRes *wb_formats_blob;
+	int i;
+	__u32 *format;
+	bool found_format = false;
 
 	igt_output_override_mode(output, &override_mode);
 
@@ -82,6 +86,17 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
+	/* check writeback formats */
+	wb_formats_blob = get_writeback_formats_blob(output);
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

