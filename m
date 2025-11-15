Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E35CCEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:22:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9CF010EB58;
	Sat, 15 Nov 2025 00:22:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kJMHr0qT";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013010.outbound.protection.outlook.com
 [40.93.201.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00C1510EB58
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:22:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lu4d2MznJMHBzc5tYJh+5SSsP6kEFppWdgsPX0ejXpHLXx45RoQNc5m3rU38SN6Z18+yC0NUC9wUuNDMKeXBVUtqjHYYoYsRTmtFH979hTbSuXd+QkPLG4E5XkjP+Uu24CWhLPBjIIGz5IBmUAAi8FbH8n/YKZ0ohsLwn1bILSLx5xjD70cSiiM4vj7no7/SPvqRlQDL9dQWLVF1ezSo+P9dYLh/CsrjjG8sFFonZUpSHFtE/fczoKBmqJC3NexEZdkmwEK2x+vpJNzlW3lt0P8X1uZqWl2DfamUZw8JpjDdrakDi0noXefFx09Sa16slqzzb5G1BLP+M4u73lAURw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bEQSXQ2FJ11BTj5YkB31q+y6NgsecBwNgeOBJ4R5Cpw=;
 b=qSXHtmJNRQyPhW7FZTlmytO4gld5GMXDEb/4isNbBs8KA81FKc+8Ox/6lkdfCFlHQvXMP7mSm07lESrtEJDI9gu+4mj6kDONcx0GQVy2+J8Rzemrkwa62f16b1s8H8A5a1yV6bKb12boBSnwu30fLVXDkXGpnJBCDIzgEX/+9UyKwyG10jZxaGu0EEMKhAudNZSiJC9k6ayDYIg2RFrMy/SAt1k9WX7UnMWK7o29Fl4M7p11t8XLo/rBoKMMocwQ2zy2EMFYP8E7H+fdvHQWI4IOJXXe2a1X4pWIXpLnWHQbslgALvrG60qbRuKIxH5rVRzgVs0CWQNY0h1pLBEzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bEQSXQ2FJ11BTj5YkB31q+y6NgsecBwNgeOBJ4R5Cpw=;
 b=kJMHr0qTaxXvRsRxUvsyn5tSgTEin/Yy+Wxzqnn2mUtRngS7Uw0axZ//wrt3VsU03cGCRgngjiHe/P2MvGEvU+PgcYsqc25Xi6e+N4QtiQfuNTfbaQ+EzVUMMMD9vxhRZvippIFPlXh5DQxBcpy1sn94FkGKc5btKvXZSAN8GHY=
Received: from BN9PR03CA0869.namprd03.prod.outlook.com (2603:10b6:408:13d::34)
 by IA1PR12MB9063.namprd12.prod.outlook.com (2603:10b6:208:3a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Sat, 15 Nov
 2025 00:22:13 +0000
Received: from BL6PEPF0001AB50.namprd04.prod.outlook.com
 (2603:10b6:408:13d:cafe::ba) by BN9PR03CA0869.outlook.office365.com
 (2603:10b6:408:13d::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Sat,
 15 Nov 2025 00:22:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB50.mail.protection.outlook.com (10.167.242.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:22:12 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:22:04 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 16/32] tests/kms_colorop: Add 10bpc test
Date: Fri, 14 Nov 2025 17:18:25 -0700
Message-ID: <20251115001841.3563993-17-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB50:EE_|IA1PR12MB9063:EE_
X-MS-Office365-Filtering-Correlation-Id: c479b60a-9c7f-4433-81e4-08de23dd059d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qze3cOWsNEsUVEvv5pcC87u23LgHpgJxs5nt0nyzib4odPu4dB3veufYKGkz?=
 =?us-ascii?Q?rd5k7Tt1a+I2EkK3FYZBMG0gZPkyysY5YHVqwCdtu4HJQTAiAo0lL39o0zsO?=
 =?us-ascii?Q?EZdaGIVBCxTjH+E4Pz9tHcyxZYdUQ8J2GYv6gG+rAMRD7jxNYPALK3R7TN1t?=
 =?us-ascii?Q?4E1ltTPXRZqlei75Y5z2pRwq73K7kPITotn26odU/ijrUOeBtZqxs2Z1Ff1h?=
 =?us-ascii?Q?TYrhLgd0Z3P0n5mXUIhU+E1tKrMvhDf+Ufz67jr9FMYqz6kuoYlTc1j1lUsY?=
 =?us-ascii?Q?9PHv9NQm9OBfIKsuvozS5vqZnvpJ54uA0LsXd8D0W1W8c6Ayf80akmyRcz/u?=
 =?us-ascii?Q?/llt+5Mf+5gBlBCg00/MoAyU9RDvp0/zZhRkJG37QmrjLwC9Mkf90qYm6Me7?=
 =?us-ascii?Q?Iy6KM8hRk2gCzvglA6r/Jq7Tb+OOCKpHCFoOVw4nL8H0tCCU0a/x1RCCWWUk?=
 =?us-ascii?Q?Z/u8gKhD5LXmy45FFIvKB+QsXJvQ22YH9sGdua0DubwIxb9gYI3RvvoQEEDD?=
 =?us-ascii?Q?wpfIa2v/BDK0zzsThXsFNQCKwygGP4Ay9akV9tmfiqd6DADImdYSX2Isw19a?=
 =?us-ascii?Q?9NfJImQYWfzUL4tuhZlvKkgdEOCLLhe1VHv+7v8sgG00ziGWIR6dPqkeEyEr?=
 =?us-ascii?Q?bcQjYjyvvaf9oK0H7OfU/1W56i6V5MbPidYV+24cuiT7tNikCmOtEqOrUdlp?=
 =?us-ascii?Q?QFC2d6R0UPeiJHoDxZID66n6yfP8gfqvMLcNGYorfmwV7E6TGo59lTj4jOZN?=
 =?us-ascii?Q?264uEDTpf7svObhLJIYuJk3IO+6xTV5IiIqymRDcyUP932UZ4EK73bOsPGAk?=
 =?us-ascii?Q?HLuGjKcgVKdpwpwywjpYPHEDpBbL310gusDhiIFJQv4IfArM+gaYIE0DGlXk?=
 =?us-ascii?Q?b4a7JQXtp4RhcENE2IlQ9sVi99c9S4Z4jc+LnruQeZiq5RUDKoaoRHdgggqJ?=
 =?us-ascii?Q?Lk4ygdB7C1A2ZK5nSNunIY9LiryIlBHSYOG7XjxCE2nHfH45KsYoTMPppISq?=
 =?us-ascii?Q?zhVYt8ab/G83j6xVLLyZAk7AyvmYZ5oZaB3coIOR7Sm8RiMsBh2Vcmt+MLuM?=
 =?us-ascii?Q?+pVn5LjEYHvlYCNHdRpu7xSrQeFwBS7wvD3fNc47WFr5ZGm0pSrQN6fdYB47?=
 =?us-ascii?Q?q7akzC5HTseo+YRycPy4kEGahTMvcYu3ER49lafiqjGHNvEQ08cRV5GUrZgl?=
 =?us-ascii?Q?9RyaWXPFJn7E3narA35BOGnZXcHvDFAS3Fc9Old8wqWSJxILvnB0aIbEel2b?=
 =?us-ascii?Q?iisgOFB4OLWtEj3daZzojDHXf76B7feHnJ26PdRlpV+VCk9qHSRuc30nInb3?=
 =?us-ascii?Q?76xwsXxW6zuN49E8blQqWBLfuxkGLladRj2GIwhTq1RKohETVWqO3hnlfWuz?=
 =?us-ascii?Q?tokEi/7uEykAzDPEu0UdFvscYSLtKCmRRzG8njj9EnTn0ER3Ef14elmB/dZS?=
 =?us-ascii?Q?j15NUfezaJiabx1dGnI63ISTrQS89FQg6eJt/g4c5oONN9GPQ3C69fM5kVVo?=
 =?us-ascii?Q?IJVYZOM3DNmAXoUFZd6e07ttm43O9AvstMq7ljVDqJW71eQutxyQVGtC5rpm?=
 =?us-ascii?Q?zTKLHmd7ckxrSrb3jG0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:22:12.1690 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c479b60a-9c7f-4433-81e4-08de23dd059d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB50.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9063
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

Support DRM_FORMAT_XRGB2101010 color format, and skip if it is not
supported.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 tests/kms_colorop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 8e677c1d1..8e8f7c63f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -23,6 +23,7 @@
  * arg[1]:
  *
  * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:			XRGB2101010 framebuffer and writeback buffer
  *
  * arg[2]:
  *
@@ -55,6 +56,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
+		      "plane doesn't support fourcc format %x\n", fourcc_in);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
@@ -63,7 +68,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(plane, &input_fb);
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -469,6 +473,7 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		const char *name;
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
 	};
 
 	igt_display_t display;
-- 
2.43.0

