Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244241061B0A
	for <igt-dev@archiver.kernel.org>; Mon, 30 Mar 2026 15:36:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C516510E721;
	Mon, 30 Mar 2026 15:36:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e3A8uM1/";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011005.outbound.protection.outlook.com [52.101.62.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E016710E6B7
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Mar 2026 15:35:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFXT76Hmy61v7vCwHamOviEY1fpeWMn1FN7BwEchiuM9HOGbjVva8SMjt9MojDIgRfJeD+CNuINzw8dy4yLavFoaDusxFwG+Z2rmkNPtGTysj3qKAvQyUEBf8Ba/loOkVOhinqqoHqFAXMWBzhjdOTWvjfrRRgPk07v6IisbmXaxMLZnXF/wcWTvRfaHoYSC5Bn7i0d8qojQpRExOXHOD7EjBA7f9m9JNvEuzdtG4yqgy83bytdWWOLm0lxRgYO6YMe+4/n3pxkygd1vpE7NmViaL2BI0ESeLSfjWyf4jsiA8os+wO2zYj7MF/F2NJv7JHx8WHCo7IlevPw3rKSqKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJSX65aputVyJDg+4nzu1aOmQSAAc9cX0GHtDAKO9yk=;
 b=ViM3+FFTpjuz2WSKJyY6Uzi+h8td1cxuJxIs7g9nWH0WEgjn6ENL5biFdnQrnM3K69hdJsIKR5vRS81/JYLzESXwqexpl6qezAFBWUV76qyVX2DSfzoRrXNSggkCxwffswpPHMZyW1yQJkJ3IPSZ07+lm3+DLiO4wLEnq0gi9F88MSIRtk8n8cpYCC2L1EXB39YqDq89lMRk568su7NjDZdoV7YJBqBDU27/TNwCIkbxNWxTyrumLJgFronarrYQyAt5bVXJ4HlCpviaV4PFItxAakQd4+myZfEUWzKqnED/OFmZ1MBBFxnOdYkTUZszPiqfGelaEfpmEpvuPIoR6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJSX65aputVyJDg+4nzu1aOmQSAAc9cX0GHtDAKO9yk=;
 b=e3A8uM1/M6VaLCkmObezloglDAKkKf97ElOyCnXPyt9sVDhvbGdl33FICPjE9EbgA7HkxEZ9CO7+yStPPFJDUZQYbB3T2BuFg69bqYKaA+x5/dB4tnobtzo0qqmgTutRJ6ijDx/tpgK3+iyKS+ksTx/ucorlA04om/mXKCWBURs=
Received: from SJ0PR13CA0066.namprd13.prod.outlook.com (2603:10b6:a03:2c4::11)
 by MW6PR12MB8914.namprd12.prod.outlook.com (2603:10b6:303:244::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.15; Mon, 30 Mar
 2026 15:35:24 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::5f) by SJ0PR13CA0066.outlook.office365.com
 (2603:10b6:a03:2c4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9745.28 via Frontend Transport; Mon,
 30 Mar 2026 15:35:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.21 via Frontend Transport; Mon, 30 Mar 2026 15:35:23 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 10:35:22 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 30 Mar
 2026 08:35:22 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 30 Mar 2026 10:35:22 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v2 03/11] tests/kms_colorop_helper: Add helpers to get
 encoding/range from CSC FF name
Date: Mon, 30 Mar 2026 11:35:10 -0400
Message-ID: <20260330153518.99898-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260330153518.99898-1-harry.wentland@amd.com>
References: <20260330153518.99898-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|MW6PR12MB8914:EE_
X-MS-Office365-Filtering-Correlation-Id: b952d0dd-b0da-4436-bec4-08de8e71f574
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BcUOCyS9ljKVF4tBhUwu88a4Mc/2JuQ7Jl20Qe8RyvN3EQ4kjeDSuH9yb84GWSi9F4b9OokNusOlMkcMxmz2Y1BtYyzJFuHuyS4QyXgynXv++K8sSjXYjfGFnTZwnmBupfjWYxYYJ44eDQIgoXX3CUIRkiZxH8vyAYNRtp5SQRDg9uBkKRymhl5RESXebj7TNfevt2uSIdh3wrZJlgOCzkGzNKjB8g8P5rGYVYIWCDDf69kGGTjt5H7LePPNzDdFSq1xyiXgDIgdiTam7p0b0UfzTfAGzwVkxKQYaKxvVSJdJ0sNxttOjvqvAxofj3D6x+/DszfLaPpTZwN0zfvw2aKTX3OL3kXm1GQeiXSHDCuGXvrI+3oqFDDqDO9mLCMBwVQFnZeS0n1iiPtq4gifOP+er9aYQqzMqyaS7eogZol2h5SfXLYUCZukRl10w3Gb0DB9n2yto4NqfPn/ll/pab+0N5RVk/L8V+VuzG+BFlqYcjDx6IdxYDU8D/VJc4BDy15gz7+tv7iQ5oTprgC8XJaMRhXVj5PadTPNe61dGJRkqF+tprTYphYzAB/pBeaUtSUF13gZQGuMh/N6aJ7URx/ObiMZaQBrxqfYto1nxE4gM7P3uxM7L9Vw7TErZMlTNyFDT9Y5T0qfxZYZnT709W1zrBKAoO1e40DBAALtWrmb2RwW1C+YZcNyHz1oLorthy3/myW5XxhvWJbR44eUbUKjZD217Ts+s3JAkrVmHkYM5t/bWY9Nc6kOLiIIFwMCiDjXFU344GTzwyORsKsE4Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: mBxr2+d47Mj5p9jSb0+Bp234u47xRCO0b8dILMG6pVzVDDWZKWT+xjb6OZRddzBHLt7By167D28BYO+a+22kMQhIkkd6l3BpTDTKX6+gY2kK+lNZB+nvdnRyXGWa5VI0L6dbO8E+jSJhUmLQZqZIfDdfS62Q8kxY9I0AiirfbouRhI9829Wzdzqu7eR1WoTiAjFAIC/OiPN8eeQrfxAA9h2eGRWVXeVMHxPL/9TWfOwDMp1EQyYCvtygA0PEnAjqqarmV9LRwE1PJt2wU1lahVC7X2+o+/JddEbHt5cZo/0sx6NoaXU4Hf4a1+e9l9BC+olCSljyMy9cIDFJQjNXCM0ogLmwu2tzCom/fac/1aZazM2vnGf0ieJOxl+Ei3zjIJI0w9By/ifU3eBqumm1jxRB4+bw/JXbGBmxU0Pd6A3dEkyphMa09pU80q8IdejN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2026 15:35:23.2906 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b952d0dd-b0da-4436-bec4-08de8e71f574
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8914
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

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop_helper.c | 30 ++++++++++++++++++++++++++++++
 tests/kms_colorop_helper.h |  4 ++++
 2 files changed, 34 insertions(+)

diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
index 4832c0f4eb23..4e9205a291a7 100644
--- a/tests/kms_colorop_helper.c
+++ b/tests/kms_colorop_helper.c
@@ -473,3 +473,33 @@ void reset_colorops(kms_colorop_t *colorops[])
 	for(i = 0; colorops[i]; i++)
 		reset_colorop(colorops[i]);
 }
+
+static const struct {
+	const char *name;
+	enum igt_color_encoding encoding;
+	enum igt_color_range range;
+} csc_ff_type_map[] = {
+	{ "YUV601 to RGB601",		IGT_COLOR_YCBCR_BT601,  IGT_COLOR_YCBCR_FULL_RANGE },
+	{ "YUV709 to RGB709",		IGT_COLOR_YCBCR_BT709,  IGT_COLOR_YCBCR_FULL_RANGE },
+	{ "YUV2020 to RGB2020",	IGT_COLOR_YCBCR_BT2020, IGT_COLOR_YCBCR_FULL_RANGE },
+	{ "YUV601 Limited to RGB601",	IGT_COLOR_YCBCR_BT601,  IGT_COLOR_YCBCR_LIMITED_RANGE },
+	{ "YUV709 Limited to RGB709",	IGT_COLOR_YCBCR_BT709,  IGT_COLOR_YCBCR_LIMITED_RANGE },
+	{ "YUV2020 Limited to RGB2020",	IGT_COLOR_YCBCR_BT2020, IGT_COLOR_YCBCR_LIMITED_RANGE },
+};
+
+void csc_ff_type_to_encoding_range(const char *csc_ff_type_name,
+				   enum igt_color_encoding *encoding,
+				   enum igt_color_range *range)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(csc_ff_type_map); i++) {
+		if (!strcmp(csc_ff_type_name, csc_ff_type_map[i].name)) {
+			*encoding = csc_ff_type_map[i].encoding;
+			*range = csc_ff_type_map[i].range;
+			return;
+		}
+	}
+
+	igt_assert_f(false, "Unknown CSC FF type: %s\n", csc_ff_type_name);
+}
diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
index 6e8843b7b651..23b9b7eecca8 100644
--- a/tests/kms_colorop_helper.h
+++ b/tests/kms_colorop_helper.h
@@ -115,4 +115,8 @@ void set_color_pipeline(igt_display_t *display,
 void set_color_pipeline_bypass(igt_plane_t *plane);
 void reset_colorops(kms_colorop_t *colorops[]);
 
+void csc_ff_type_to_encoding_range(const char *csc_ff_type_name,
+				  enum igt_color_encoding *encoding,
+				  enum igt_color_range *range);
+
 #endif /* __KMS_COLOROP_HELPER_H__ */
-- 
2.53.0

