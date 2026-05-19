Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71275CD4F3C
	for <igt-dev@archiver.kernel.org>; Tue, 19 May 2026 15:04:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2693F10ED5F;
	Tue, 19 May 2026 15:04:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="p8xfQUQa";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB9F10ED72
 for <igt-dev@lists.freedesktop.org>; Tue, 19 May 2026 15:03:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVN8ghuvkd6BWXoIsCuSaM0U5rcGLw2v7Qh9SKNc5wwfrRG0fGqUH2uuRhcNwEQi0FUjm3SGTIC4gmHfY/HiuaN3I4Ebq9cN1qkj72hhlDaU+XaKJeI8MqJkrnfMB7UaY87IxvQpo9lyka1Zv+0AhDj+EVoQRK3L7tBjFHUfW4dmj/j3Pj4g1WMd1HkSgD/UrnwKCQU6rOhWqJ5MmBgUdt1FHU0a4CKcgfIbMYQSOBDCdpyjntrF40Nz2BAnEm3EsWKkn7nbpJ/gEQxP5BOZjI80Z5cgi5esUWLXlyIAfceVb2Fvh9o5da8fR6jxeMePk4oixmU4uhz2fxzrm8WNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSpeiH40bFcG37kdltcu21iv7gsofgn1BuTV2+jnlpc=;
 b=ibKmXsX12ymPFfv2PEv5535r2Uv+c/TlhyncrtBZD79k2dhZsq7PU9UdfZa+nKUUHCd+EdWgQt+xgRj1kaB/y8wS1cmJiArI6etQ3GoiKGbHSyrlApPEj+Kz9PRIktbFKuS7RrTI2poutlsXKDQq9sNQHslhdO3ueJAyc3cPSLb+9XvZcGsP9JAczR8qo6FDI5UsRt42D4k0idMm847INi6IK+TixZi6Gxco7CL3fzhhRz9q6DKP3EJIvH5P+SWJ6q3rUH/uuYc/uwhARIrFWZDhMbq4pe06hudxa5W5CojV8zw9z6WhYxlXMkqNR1LAMsrTIQDVAEsP90O9CDAk0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSpeiH40bFcG37kdltcu21iv7gsofgn1BuTV2+jnlpc=;
 b=p8xfQUQal3PctI6C2yC9Oo2RvNy+wpUdBD+Ss+/8gFpjNz5/AlKdIJPRhpoahJ/d6U4zYhx943dBbM7AzwFzTXTSf8QcD2wDBrNYOp7DmfGB590dQRfHSyNS+Ai6J8nD/YD55pzwbZOzTEpWRN9cRrE4aCJpl/s8YvA13+XReU4=
Received: from BL1PR13CA0241.namprd13.prod.outlook.com (2603:10b6:208:2ba::6)
 by SJ5PPF2CD49510F.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::98f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.12; Tue, 19 May
 2026 15:03:39 +0000
Received: from MN1PEPF0000ECD7.namprd02.prod.outlook.com
 (2603:10b6:208:2ba:cafe::8) by BL1PR13CA0241.outlook.office365.com
 (2603:10b6:208:2ba::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Tue, 19
 May 2026 15:03:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000ECD7.mail.protection.outlook.com (10.167.242.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 15:03:39 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 10:03:37 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <Mark.Broadworth@amd.com>, <vitaly.prosyak@amd.com>, 
 <swati2.sharma@intel.com>, <kamil.konieczny@linux.intel.com>,
 <jani.nikula@intel.com>
Subject: [PATCH 1/2][V5] tests/kms_hdr: Fix HDR metadata probe in test_hdr
Date: Tue, 19 May 2026 09:00:21 -0600
Message-ID: <20260519150022.3964921-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD7:EE_|SJ5PPF2CD49510F:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b927acc-9a9a-46f7-7356-08deb5b7cf1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700016|11063799006|18002099003|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info: JAEG8vgytMUpaplcT92J7wiRFYlcoYz/91WFa9Nh1RI7LRix5+b3ZlC2BUb1rJSX3dUlhsffAciKCSQoqTgs08O6CvJodSE9R3ZJYOFS/ZqAPto+73ujK09giOFgcyuCMzW4BftrKWWbarEa0jO7XuKgpYcij//ixzJC3Gdh1lJ+WJswI+ZJJgbTMrQWZVW6OHZoCeNzA1/RUExpdqInp01Yu/ICoCtW5x7VRBqrqDDYGVkxBhCXJd5XILX3xu1FPOYemXOSzVTuBdyfRcbjZp90gGS/SRCJaceNCLsTkLo2Du50PE6dqkV/GcafQu/VaNRdoMlDuBwi5p7Eg/RJALCMcJfPhOwKGO/jswtGYO+w/mo/ThNhBnoLxeLo3yFEpMuzENP0nbhM9DExnb5szeHjpoDY0BMVQ7tNfJfAb0ao9SaL1ImvX3FB+/6/J3NyZ9Mduvh86bc5a+BFvFHsSGi5gTT1uqK29YQbwfXU0bZ+Q8LdLW8D4B/qo0E+fRGz06KllNuuB4u5fKRJ0oO4jPE6uqotsIifOeR12e+GT0CZP4r1h0bJqIJ7NW1NaH1qpujsFMwF0wjUPfugcYtuGEqRrLu2Xr/Pj0v6/6xDhbFpBDkUeQkEiElXrBlqns5SHpGYtd09se8m3eevj4+JkF0rn3Pm/8sfPft77oHdkFGjzH1YIGswctVW7A0dHqyOEoMhTSoxYxzEWmThvBqXK3o/JgtLcZVXqqlkw42A9rg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(11063799006)(18002099003)(56012099003)(3023799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 3Fz5DC1558LkqCiKezNxrMDsY7B1fAJyXbGLf7wJlkT0B4LMF1N/ZdRH476Wr0/QjU2Z5RJvQugpcl6DUOxgj4F4J5+z0ruyHLVgYlGSVAcNR9mjBvYiWustFveDRX4o38ynHwKYQ2Qar2+bHg+KZQbow/JJAfCaXSXy/ERpaColMogujPAqo0fkTGLz9UJbDV3lzrb2+KfXl+AJ8lNWELK7Mv/x2zCPVjhXPEKbji9EpDCTEvefNzRr2ytUIsa45kOZx7HNymq8AJxKov5zr3ouvnVXaZlEZuYOFpPQMwVj5zZIr3vdakDoc5w78rvetRV24NncPb5pSYdShIDFgtvqa3l/JaOu2FsXcirJH3AjBkknM+FPs9rIHDVLQgxu55z3kGISc6lotnR9xhf/hbLJnOKdpFAr6YLQDlrCmcYaZXpFGYrBwq9INKcoRr94
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 15:03:39.1138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b927acc-9a9a-46f7-7356-08deb5b7cf1c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF2CD49510F
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

Fix the HDR metadata probe that failed with EINVAL because it
attempted to commit metadata without a scanout buffer present.
Create a minimal framebuffer and use DRM_MODE_ATOMIC_TEST_ONLY to
validate the commit without modifying hardware state. The
framebuffer is freed immediately after and the display state is
reset, so the actual subtest starts from the same clean slate as
before.

Assisted-by: Copilot:Claude-Opus-4.6
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_hdr.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c
index d50f87787..d21f1b3f8 100644
--- a/tests/kms_hdr.c
+++ b/tests/kms_hdr.c
@@ -571,16 +571,33 @@ static void test_hdr(data_t *data, uint32_t flags)
 							      "non-internal panel.\n",
 							      igt_output_name(output));

-					/* Signal HDR requirement via metadata */
+					/* Signal HDR requirement via metadata.
+					 * A framebuffer must be present for the driver to accept
+					 * a metadata commit. Use TEST_ONLY so hardware state is
+					 * unchanged.
+					 */
+					igt_create_fb(data->fd,
+						      data->w, data->h,
+						      hdr_test_formats[i],
+						      DRM_FORMAT_MOD_LINEAR,
+						      &data->afb);
+					igt_plane_set_fb(data->primary, &data->afb);
+					igt_plane_set_size(data->primary, data->w, data->h);
+					igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 10);
 					igt_hdr_fill_st2084(&hdr);
 					igt_hdr_set_metadata(data->output, &hdr);
-					igt_require_f(!igt_display_try_commit2(display,
-									       display->is_atomic ?
-									       COMMIT_ATOMIC :
-									       COMMIT_LEGACY),
+					igt_require_f(!igt_display_try_commit_atomic(display,
+										     DRM_MODE_ATOMIC_TEST_ONLY |
+										     DRM_MODE_ATOMIC_ALLOW_MODESET,
+										     NULL),
 						      "%s: Couldn't set HDR metadata\n",
 						      igt_output_name(output));

+					/* Reset IGT display state; hardware was not changed. */
+					igt_hdr_set_metadata(data->output, NULL);
+					igt_plane_set_fb(data->primary, NULL);
+					igt_remove_fb(data->fd, &data->afb);
+
 					igt_require_f(!is_intel_device(data->fd) ||
 						      igt_max_bpc_constraint(display, crtc, output, 10),
 						      "%s: No suitable mode found to use 10 bpc.\n",
@@ -591,10 +608,6 @@ static void test_hdr(data_t *data, uint32_t flags)
 					else
 						flags &= ~TEST_NEEDS_DSC;

-					igt_hdr_set_metadata(data->output, NULL);
-					igt_display_commit2(display, display->is_atomic ?
-							    COMMIT_ATOMIC : COMMIT_LEGACY);
-
 					if (flags & (TEST_NONE | TEST_DPMS | TEST_SUSPEND |
 						     TEST_INVALID_HDR | TEST_BRIGHTNESS))
 						test_static_toggle(data,
--
2.43.0

