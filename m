Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2729FCE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:20:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D485310EBEB;
	Sat, 15 Nov 2025 00:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SvxmtDJD";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010002.outbound.protection.outlook.com [52.101.56.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EF7710EBEB
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:20:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ph1H3+X6/Zq1XDxTqJQ732a3VhkxQ4PZoutkCh2WPNww+3ftDlQPs0P1p0PWWw9EN9eR4z60NTi2glrL8mcfnGlwXWK2uW0n1O4p/jC6qylJS+5RQMBOFaFao0PM1mPN0YWreDKwmCCQ8zO8uHz1u1f8fcPBig0HOlz/MfswhYpib0K80k7HFOQrmdQo9OT7gZe2DF16or7+jCt6hShBsGAWgK7uWJdWGLOBERTAVh418xIsdJc8dbemZkZ8hLCxIMozjyfVedTGiXagX3BMXwHweA35bYvxU3rCCeQ5rldRWRlWQeea5P3CtiMemAqqjoCkn2zavfbt34s1P+G9Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKUl2PllQSJONh6uzT9wJBdqNReCnIOYEqKKVJ7yqH0=;
 b=WJ3O07DcW3BC0VRcAQqYAYABta6VQcbIumsonfax+MfSmjODeYpbfIw+W7dXC9RVI5eOqEruNJE1x64Cd0bsCKDsunvqc09YW5Mz0vi2CcspecA0r3BCKcmuTICBxi+KGPZGGJy90r30GUTlfu/7XgRWrOsxCinWcXfeo/8FkxSKNmq9RBAWlhdHihRmcKuSZHiuEvYGv+Cp+9iPtJEU/LQ1fvt33pG6MlKnvSbFdb5niIh40KV7szLcduZC9c2AM3amwlzpOlRvj+vGZCEqfawi0iiG1M2y90KYbtmNGBaS+nl1GblM2euGG8P9CJaM51zsCGdzH4UNFtVwgUHKiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKUl2PllQSJONh6uzT9wJBdqNReCnIOYEqKKVJ7yqH0=;
 b=SvxmtDJDMiV4HMyPhoigwmaogeKmrj5Hx92IYLX0B1CpbkYEn25Ki5jtNbX7fhNiRg2WtCu6JuJIDAFf/nEeufNBc5MzNUi1Y6XqY7oNkI1d4bz+ePi7B3W7+U6xwpZlKRQGvoijrMruTMGzNwK53C12gw63LycvIkyPQwZd1VA=
Received: from MN0P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::14)
 by IA1PR12MB6236.namprd12.prod.outlook.com (2603:10b6:208:3e4::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:20:41 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::c) by MN0P221CA0026.outlook.office365.com
 (2603:10b6:208:52a::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:20:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:20:41 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:20:40 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 09/32] lib/igt_kms: Add writeback functions
Date: Fri, 14 Nov 2025 17:18:18 -0700
Message-ID: <20251115001841.3563993-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|IA1PR12MB6236:EE_
X-MS-Office365-Filtering-Correlation-Id: 95056e1c-3008-458a-9687-08de23dccf69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Wfn4QcQPrijHZfEalSBPkTVKZtK8scvCVV7q59hp9QxUUkG8NuWwPNYwuhrG?=
 =?us-ascii?Q?ua/4EvrNNrvGvBmCsF01jO/AZe7MV3I/uT1MCA4BnRsEnGHgAja7vyXNi5et?=
 =?us-ascii?Q?1HGU8UdlYycHGU7dcidSJlLebnYqMIpAQtDVX2shbipaasKI/OmY8Y7Kk4VH?=
 =?us-ascii?Q?jdRfqIQGE1XT1GFOaQqKOoIub9YVGtP4eRvup1xMMjj55D6y8MJYdJWi9Szh?=
 =?us-ascii?Q?Q+G8h3z+D+f2ebmYc/JWWNXpBjHWp+ocOgUoX/TVwAyEx6ft7/1bXEqfY7ml?=
 =?us-ascii?Q?0+39WJb9vtERxMBOGwsG/bk1TwE5aTCmFqcZ9uPGhgi4llCTs39ebFSM1dOV?=
 =?us-ascii?Q?tqelccCc3k9C2Tx92nE35LgNJfEC5GtBQ+9TNl5HxiE1v3Z0Zn7j/6KEPU2b?=
 =?us-ascii?Q?7VTfAHlpV9S0Z0TTOdaeIol8BGYa2OKatsYfACiknHThXStdjQNPvXeqFCkw?=
 =?us-ascii?Q?i0TdrG8qiyVqAK25eCFZKKrOIQtrhOle4KAhbbskXDParPKp8UF8F2TMNytg?=
 =?us-ascii?Q?Z8vHWFbFKUmqG7U4kHxLDfTBv/GdqaH1EFAYIsL8g7LyJjpVN4mGswdAyzc8?=
 =?us-ascii?Q?mUSp9oyLjTrUzGW9gVA+tzGWleOU7Y92uuJaLWSFyYEy2acfZ99qr4/4YsCc?=
 =?us-ascii?Q?tw0HcL6ddvv8F9b+5/Ls1h44+RvQKXFekad7jkPlyKoSABjGEARPrDsvHnEW?=
 =?us-ascii?Q?zsKKjnKsViVkFdxwPbg2yj8qD3bF38e5bOREFn6U7BseJawHkk8lkW5r2PWr?=
 =?us-ascii?Q?RPBCjx+p/ZD2zcLaLuaTdZ6e1EhKOgGgG4y74fMGw5fGtqBD99D3IDuWGbFA?=
 =?us-ascii?Q?tWguWHO0xradDlFXmAxgsSPlAeEl86TW9QPfaxfH4SmY5jYqRUp//ZLpHdXd?=
 =?us-ascii?Q?28K4uC0eB8CZEHqBkiqXSp4e0g1XXm8gzqLorMPT1WPViR9uN9SsUqeXfvvE?=
 =?us-ascii?Q?78yQrMsopUeDA2tEwwySyrt3CUlBP9rPeNLckxpTRHDWjzkaYfeBDHyGmy9M?=
 =?us-ascii?Q?MaDqyDJgZih5WZG88FI8ax0Guzjx6Wc/uVIBdWUSboyUXED2OoHIuu5Htv5Z?=
 =?us-ascii?Q?treRQvrpmcdNj/TjMTirkYMcHtsACYs0yFy8m6OHRAkofjA8yqTkJSTuF0cj?=
 =?us-ascii?Q?zu9j5D45DckNnzbGxpf8ZzNA31kCURAUcrAl/UY0VpNEi7aQ3sXzXg0XcvJT?=
 =?us-ascii?Q?nLn2viqhYNzR0nCpWcOIifi9ceJrMcEZRDacl16kSx1R083Sq0OtZHBx0aLa?=
 =?us-ascii?Q?KV75Zy9QUyBMvsOTOvXPZ7cprwvwjTllH8GVg4B55HQ1oomgmL0vrD4a2zer?=
 =?us-ascii?Q?7j7oa+GX2t1whVdB2KrGBc96agrinxIengNbNNxgB/d1XKhkXdhQnZXGseqM?=
 =?us-ascii?Q?SPfESleoBg/CoHBrWPyrp8utk+LM30YM4A+D32vNOo9ZZMorMcTPOC00QVBo?=
 =?us-ascii?Q?iCF5nUvMHaTFe1FlIod0MJyoovhd8MCNdtt00CKdBaM/lupuucPt0C5tKMdd?=
 =?us-ascii?Q?UqPRLAta1Qqg5ZqVgpQrfEeMvvyiMmuY27mrrFWhvYBvS+GDIdVNjoLt4P7b?=
 =?us-ascii?Q?yu7O+TwSHTSRj2DLZSM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:20:41.2326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 95056e1c-3008-458a-9687-08de23dccf69
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6236
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

Add three writeback functions that can be shared in writeback and
colorop tests:
- igt_get_writeback_fb_id
- igt_detach_crtc
- igt_get_and_wait_out_fence

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_kms.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 lib/igt_kms.h |  4 ++++
 2 files changed, 49 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index a2b704e68..7b7b8e310 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -7840,6 +7840,51 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)
 	return blob;
 }
 
+/**
+ * igt_get_writeback_fb_id - Get writeback framebuffer ID
+ * @display: display structure
+ *
+ * Returns the framebuffer ID for writeback capture, or 0 if none configured.
+ */
+uint64_t igt_get_writeback_fb_id(igt_output_t *output)
+{
+	return igt_output_get_prop(output, IGT_CONNECTOR_WRITEBACK_FB_ID);
+}
+
+/**
+ * igt_detach_crtc - Detach the crtc from the output
+ * @display: display structure
+ * @output: output structure
+ *
+ * Detach the crtc from the output.
+ */
+void igt_detach_crtc(igt_display_t *display, igt_output_t *output)
+{
+	if (igt_get_writeback_fb_id(output) == 0)
+		return;
+
+	igt_output_set_pipe(output, PIPE_NONE);
+	igt_display_commit2(display, COMMIT_ATOMIC);
+}
+
+/**
+ * igt_get_and_wait_out_fence - Get and wait for the out fence
+ * @output: output structure
+ *
+ * wait for fence from the writeback.
+ */
+void igt_get_and_wait_out_fence(igt_output_t *output)
+{
+	int ret;
+
+	igt_assert(output->writeback_out_fence_fd >= 0);
+
+	ret = sync_fence_wait(output->writeback_out_fence_fd, 1000);
+	igt_assert_f(ret == 0, "sync_fence_wait failed: %s\n", strerror(-ret));
+	close(output->writeback_out_fence_fd);
+	output->writeback_out_fence_fd = -1;
+}
+
 /**
  * igt_get_connected_output_count:
  * @display: pointer to igt_display_t
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 9bfa70bab..bdb5cf5e5 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -1387,6 +1387,10 @@ uint32_t igt_get_connected_output_count(igt_display_t *display);
 
 drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);
 
+uint64_t igt_get_writeback_fb_id(igt_output_t *output);
+void igt_detach_crtc(igt_display_t *display, igt_output_t *output);
+void igt_get_and_wait_out_fence(igt_output_t *output);
+
 igt_colorop_t *igt_find_colorop(igt_display_t *display, uint32_t id);
 
 #endif /* __IGT_KMS_H__ */
-- 
2.43.0

