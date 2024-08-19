Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA653C52D7C
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:58:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3029310E43C;
	Mon, 19 Aug 2024 20:58:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nW/JODEl";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 889A610E43C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x4YuJpqDQHRe7Y97jwNfE/Sa0wACtLDGvSD+NGGbk39u7Ip84v1+GzUjb1XbvHtlz221EiC/Y93rxL+5pX56RBqlzeb1EowYJvpvaTC2tTkI5572tRHNeL9NQFLbunWqk1OkfhfgtHk1o474zfWzxv8tBbFGBHkBge/MqacyEXvL1Qq+gzhpzus0McQ6K4OdFp2DNgBZiK/kQZDy9IESi3uNj/CxrbuT+N93ZWDyDZkSvrwNyh5su7hSLmxeFruEzgDTF1Qu/AlRB7gDvYxcbm36PJ05mJmRNqPl2429YLMUvWvXEQYMHb0KVlvhT1dFXxMTiQ2sHmRjUhWFZOe3pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1N/yOrqdFiV5XKERMTertw26ms6ZgU/PgRwShWbcds4=;
 b=fWjj7pbmFyk9b+KiFE8PIWf903CsIrV2B/fVVEsLWM4+dhDDc1K2gLB48391kMCap6VHxAunqvIaScINEBC3MC1xtwmcDW00GKDWdFaU3FZxVVvXZoMPi619atV4YlHR+jCc5sYX/Pxw2EfaIFZ0Dr6r0fE+BHyQpTBANFHWXHrsYtS39I/r9sGVCt8JtdTRoMJ07gQ2dDa30uGSBMryUiBOlThGKu9kx9/QehVqow9qkn1/awDy2fcDmflj+VZnBSJ0W9/KYCR5yWGA+6HzWm9lTzKcXMVsZCCt2C6vYhCY/UXMIMcStjyNPi3L3uj8xB4Cb2oK847XyuR5zab3dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1N/yOrqdFiV5XKERMTertw26ms6ZgU/PgRwShWbcds4=;
 b=nW/JODElRXVO8cX16o+dxj12qZv09FSxP11l1DrqNZ8CNWTPO8YYCINMAmxKqYpGWzHFuBWiMyoK/TGUv36vxzzmmpcZaBShy/1rkD9jUYnw0mw23Vq+YP9bH7yucoPE8ImuTLpKzN/EiIUpkqIx7ZGeBA3qyz2yLCyqVZVC9iM=
Received: from CH0PR13CA0005.namprd13.prod.outlook.com (2603:10b6:610:b1::10)
 by SJ0PR12MB8113.namprd12.prod.outlook.com (2603:10b6:a03:4e0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:34 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::a0) by CH0PR13CA0005.outlook.office365.com
 (2603:10b6:610:b1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:33 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:31 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:31 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 11/37] lib/igt_fb: Add copy_fb function
Date: Mon, 19 Aug 2024 16:57:57 -0400
Message-ID: <20240819205823.316656-12-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|SJ0PR12MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: b428fb91-3571-4537-1760-08dcc091b039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?futNMLGtZUmTbeOtQzxuvHFqR+1XE2Q6XxZK8z40nHAGPCJX7bBWfN6hMmqs?=
 =?us-ascii?Q?ACRDuuXIAwNzKFouAifWyv6fXddJlysXkdHaOCzD3vxgU29d2uCmewJZG7C6?=
 =?us-ascii?Q?HiW1J7MPL889O1yGLu2rwMnWltJ2EpbbEGQNFzy6jBegsz1p4TauK9SGZmpq?=
 =?us-ascii?Q?yyG4Szc/C51ndEqyYttX3BHH3wjHxS12u3niaMZN0txCJMjUKOhUd3rerokC?=
 =?us-ascii?Q?1TO+Bpd10hBImJ5cO9WgCPmrjHtRjyf6mYbgl65bbyUFsTncoyJAJak859N0?=
 =?us-ascii?Q?S5MQx5rdgVBK5J1nQThgaMCTaX3sLvS3IcXnGhiiWKV9KEY+mUzObTVTFO0F?=
 =?us-ascii?Q?Ff7u+A5Ta8WchHea08pBbosZ6Upf/XcGIMwLpmXLT46jlQA/azoJLGTfrd7r?=
 =?us-ascii?Q?2NAlk8fTkWZ9FGCiwCSsNvUo5e2wWR7BTB+sF+DO23WWNzMXeANGh0by72oH?=
 =?us-ascii?Q?mPthLYvqAbdhJ2LMGxz4bHAVhiKZT9IUU5VJwhqZUe7SFPHaGClnkvOdrM8e?=
 =?us-ascii?Q?KNdg0l/BmuRpsYr3Jc8DBy5wx0pdk8J5GL6UggjBxi3lO85DMZ1cTjkK0UlE?=
 =?us-ascii?Q?TWMhQaVlCD1v9D6pv5ClWTOj6lX6VdDQe/Td6TUtN8t9ib+JRhalD90Rg+vG?=
 =?us-ascii?Q?ZijV9AOn0qSvsOoU0k8DwirErw/sJRCj4PbU/fGVXJUL/G/MbtkUivzuIKq5?=
 =?us-ascii?Q?rG+R3qGA9TZ9FJCuocoGJs0dKtB63XxwlK3tMNIQ47g8r0mYPeiDF1TDXeCs?=
 =?us-ascii?Q?YfvF716GuZJaCzxxl/Wwz4RfuHcYXFaOWBMpaDa3mEz3Zqk2cyVWM71MEo1c?=
 =?us-ascii?Q?MaDyrQIkNKECTFZ6cxcQ9cvA3b4ynTe8MvGRGTvGTM1uzxlTyhcGWiJyqYjO?=
 =?us-ascii?Q?pMNKnBOD7oRjAibDwz7WgMmt/oWLY7V0wa2xlLm7gMCVBo2JYJ/jGqYa9/xB?=
 =?us-ascii?Q?MZcFCHYYLNTe5zo4C2sYgQTuM9oPzKjEXO7HtfMTw8gSvF5bSghfRhwG9j7N?=
 =?us-ascii?Q?OnA9B/iS9Hr+j+YGonJW0w4ra36Mh6hbducLNS0ktE4jSOzvV+WdnAFGUg72?=
 =?us-ascii?Q?q+PWMmB88rksACtVui5AInW7Tli0ZzG0DecslusQrSl+mV63x52mKCNUk4iP?=
 =?us-ascii?Q?v0OaJaYqiLyInmk5K7YqRl9US1fDPdFGPO2AbI5U/2En/HA05UCGQ7u5e0XT?=
 =?us-ascii?Q?iwDT1d0b0lKdhgCbF9s/kORs6vaN4SfvISmAoKrI/78GQEsN9m6aM9eSyijM?=
 =?us-ascii?Q?KBuhrKZGnOJL0CpOoRxUlokbfgSLblEliEIdDiOgJSXW0AKuOPZeMgfcHG08?=
 =?us-ascii?Q?hG9axDAuxfqYb5IFtAqpbSfI9S1JlJL4zGO7o4kWnZpF1ZYnXnjc+SAMOQrA?=
 =?us-ascii?Q?EAfe7FaZGmtuvz2kOibi0P765WMsfaNUPlPsPGZSNNC8h1rsA1CupCwQZtzq?=
 =?us-ascii?Q?6ZWeL3XP+csQ605pidh28yjMp5QcR3XE?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:33.8309 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b428fb91-3571-4537-1760-08dcc091b039
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8113
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 34 ++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 35 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index abee42918def..1e0bad1b82a8 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2154,6 +2154,40 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 					  fb, 0, 0);
 }
 
+unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
+{
+	char *in_ptr, *out_ptr;
+	int cpp = igt_drm_format_to_bpp(src->drm_format) / 8;
+
+	int fb_id = 0;
+	igt_assert(src);
+
+	/* TODO allow multiple planes */
+	if (src->num_planes != 1)
+		return -EINVAL;
+
+	/* TODO expand for other formats */
+	if (src->drm_format != DRM_FORMAT_XRGB8888)
+		return -EINVAL;
+
+	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
+			    src->modifier, fb);
+
+	/* copy buffer contents */
+	/* TODO simplify :D */
+	in_ptr = igt_fb_map_buffer(fb->fd, src);
+	igt_assert(in_ptr);
+	out_ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(out_ptr);
+
+	igt_memcpy_from_wc(out_ptr, in_ptr, fb->width * fb->height * cpp);
+
+	igt_fb_unmap_buffer(fb, out_ptr);
+	igt_fb_unmap_buffer(src, in_ptr);
+
+	return fb_id;
+}
+
 /**
  * igt_create_color_fb:
  * @fd: open drm file descriptor
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index d2751c0bb772..258a7669e434 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -142,6 +142,7 @@ struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 					  const struct igt_fb *fb, const char *name);
 unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 			   uint64_t modifier, struct igt_fb *fb);
+unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb);
 unsigned int igt_create_color_fb(int fd, int width, int height,
 				 uint32_t format, uint64_t modifier,
 				 double r, double g, double b,
-- 
2.46.0

