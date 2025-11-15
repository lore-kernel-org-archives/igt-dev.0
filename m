Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ED18CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:22:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC1310EB7F;
	Sat, 15 Nov 2025 00:22:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qyPjizk6";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E2810EB7F
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:22:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=thlFbzLU5uSbrBGOojF5LbK0eRt/NBww66p2uKubuNTKdYzGPkW99M3TnaQGW6CKh9ISjta/lAbczRKeVxWtI5TwxdnlpxLECtGfbA7HsBQQdQ5aNH+WNJlPOWfGXMPIQyRq0j8KetfMNJKAvM7yWRhKy3UksdHr+YLGsKFfepQRow/3qod2nGcYJu1kjhtTOiPC606m5FQL3VHLQZhikzruu6hzjPExf0f/BGQdQ2rVDufts57Uzo8c63HCKAZ7xLKHR8PtPe+tDnBVvYzs9vqaVnl7kLszkJnJQLDezwx3CSzQGc8Uu5+HWAYA9ubCweBuvbqY+WKTIvfdNnthwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6CsJr5X/VRm7baP/zmQgx8bIdIQqaT46hHwFkx4MBTo=;
 b=UKnVtZ50vFU2AowEutNs3TnIQAmI/H+hzkATzbyibPbJLe52TX8VOtuqWvDj3zTp/P71xRonuIHrw5QfWhQZbESlBGo3CaNBA2ME6GVhKSFYJK0InCENjrCsu2eTr2ZK147L6d1/ggoJ1LzfAgYFgI1bh3/GAUBWLEBzoJu7AQMspJLjpuBhvg71uEcM7mMhVYhvqVY3Cjk9bf1VL9eNwCauL7IydtSCQ+psHbk5zmBnAIMy6q/TRUZ0ajeHJHbUx/SVKySk/n4yJj0qlNo4+SGBAn7tICKNxAkjRNIspKBw3mLaHB2RCIy1lHUXKy23ZGO0fW1vM2oBlYMLrX1WOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CsJr5X/VRm7baP/zmQgx8bIdIQqaT46hHwFkx4MBTo=;
 b=qyPjizk6sz+6ynisKcb75Ux6/ATvQtSPmMWGWRcwp18F0AYBWjR5SiGt4TfqLE7BhY04OZQ1iqnnmbidwRc8PQ5Bl2bWtUDgLsmzOT0+snIjTlbCZUFAkucfVUdUJsQaJ+rMVFxkD78ILMMyVu8/OXGm1BcKMs8GvayfNfh3msk=
Received: from MN0P221CA0008.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::30)
 by PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Sat, 15 Nov
 2025 00:22:24 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::82) by MN0P221CA0008.outlook.office365.com
 (2603:10b6:208:52a::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:22:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:22:24 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:22:16 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 17/32] tests/kms_colorop: Skip if writeback does not
 support fourcc
Date: Fri, 14 Nov 2025 17:18:26 -0700
Message-ID: <20251115001841.3563993-18-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|PH7PR12MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 94676584-b044-4e0c-0685-08de23dd0cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/RD//9Ee4A+7Tdvvcwmex8eo6UcQram1ojR9346M1XVr9KXlOoicBG8ZnQ7S?=
 =?us-ascii?Q?M9EWH/r+kXdugNhEh8Y5q8fmMsWRHhuNZCrNEOFpri2XuF04VrBTEgPnaKhc?=
 =?us-ascii?Q?kiDyJUncHUz34XW/S/Npg2RBQ8Je/Z3I3x17GA6bI3a95k7KXw0e1AoxUK9L?=
 =?us-ascii?Q?ne2fAMoHSc4RHg+s6xZwyE1c3/nOxxiiOkrTVhiXr2nvgvrgh2IozZcXukfo?=
 =?us-ascii?Q?4M/xH/izfEvG4wACG+5GomVe93USvB9zDlMGOY0enddgMt1MHr4O/WJT6iCw?=
 =?us-ascii?Q?nwEeC786dMJ0qsHbMNjQwW3u/50oN6nlQXevjGAikWCeX8U9HbouvnnB/ivK?=
 =?us-ascii?Q?yzFHssxDLBKa5ysxN2b5LemQ0UgOfb83y+Odse0gZo0tcf47Qc3X59UQkHV6?=
 =?us-ascii?Q?64VJiicxCsh88gqRquiWmT0F7S48Ju6iw0+XtmWYlp+LnkzZ+iaS1MEKXnZm?=
 =?us-ascii?Q?jMkYbHao0QVH/F0ezhh49+nDOJrMjJt8A4gmQe8MkiG8AzALsDnql7F2IEwK?=
 =?us-ascii?Q?5q6n1l/Mggrz32Ubt1Gj5h3yA/MKDSuEPqFViJaErnz9EoP+FM4aL43SULQl?=
 =?us-ascii?Q?HvVCpZ8Nv6oLG1klrKggSRFxDklUPyx3bp9v8XLAEOFQNJ7UTywxUvFHUF4z?=
 =?us-ascii?Q?XOLoWjP3N01xStJCU28vSCK8PpHz8PHxjleKhnpfpWOIMp6rrIRQMCI7efjp?=
 =?us-ascii?Q?arjxiVzxuPAPnEsq4Be7Jt3a6oTna8NfqQ8EmFavZV9phBfxUFWaOBCrDwAS?=
 =?us-ascii?Q?q5ZeiScSpIqNZ/oWQb221RtlAvt+cCc+ygWh2fK7viWJGAlR4rasupCSP8D7?=
 =?us-ascii?Q?5t/IZuBFEB2+BEkL8o5uRXqFc138+ofSn6RNfyC0k7dvTVMm9J/JCNg1q+oc?=
 =?us-ascii?Q?lkK4U+V1YuqC2TeiFtbElCH/wJyjb13bJ0tByhUlVBd/zJ29NPBWACLhsgSK?=
 =?us-ascii?Q?/s7Di862yZeSnPYoasYwqKDw0h9STckT4Oue4lbegkbqkhYZCIgB3p7Im615?=
 =?us-ascii?Q?CdK9tZmfc/sNJ0Vw0u0GJLxdZ3I0WKyZB33IDu2W52NYKl9o4+SZ8YO4Rgya?=
 =?us-ascii?Q?uTHaHCyyRiVGDe527izD9Z+NVgo+nnesmEr+wEWP4ymT4Tqaw1IvuWom18Pd?=
 =?us-ascii?Q?DKVmY5y+usdOktI06ooL4GJvKRQ1ZR6b+ZvuuLNsSnetTggGUTfQ+7pzz6Mv?=
 =?us-ascii?Q?+oqG+kVNoOfnI4z27cs8SzDxv8ldfGKNx3SMCHbovQlzaOERTXZo+mtQeCNM?=
 =?us-ascii?Q?PFkVq8gQoFsWCoERXj1Wmh3WB2bI5QNWOFViJgvQD56dQuT6+vKXEjFImNpv?=
 =?us-ascii?Q?cvWAy7RppisX641crAVqaQQozdlHQ0FJwycGESOOaJkNS2ijGqkKGQSqmfOd?=
 =?us-ascii?Q?GCYF8Vx9iPmASN+4gzkU6u6NPCOjppySPR41Df/KkUVfWKMAwuZUcpQexoE+?=
 =?us-ascii?Q?BzY9o4UsPD/OCFMeqEyiHB0Q8mWmCqTFXOqz+JrdJt93RKMedsM/J2gfu7Cp?=
 =?us-ascii?Q?Z1MdN9z96UFnXC4B6NhRp5ulik4PrLlQnbvRgGonGtMi9q4dDugku8cqiKcY?=
 =?us-ascii?Q?zTJuGdymCOELcy1pFBY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:22:24.1930 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94676584-b044-4e0c-0685-08de23dd0cc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6668
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 tests/kms_colorop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 8e8f7c63f..31a97c48f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -50,6 +50,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	drmModePropertyBlobRes *wb_formats_blob;
+	int i;
+	__u32 *format;
+	bool found_format = false;
 
 	igt_output_override_mode(output, &override_mode);
 
@@ -64,6 +68,17 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
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

