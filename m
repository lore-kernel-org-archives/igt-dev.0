Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9BED3A675
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 17:05:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BFA10E6AB;
	Tue, 29 Oct 2024 17:05:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Tbwq1pQa";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BB2B10E6AB
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 17:05:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=prCWr/VqnDpS8Qqyl87RZDwotb4UJuEKmgx1pf1c6KE98KOir4a3kmve+4iOsYGIbHWNhyarfRS1/4wCijp1htarviuZ04giq0JANECxt9RX7gfX5jfP9igPgXhFTDgd0Q+7nRe+bvG/+TsBLoJQkWzeAXDGrUu7+DuEZAQLMsSOqqpU2xnTb8T37f6h+Or6VV8OeWBLBcHAJbzgklRTxfs+S0WG/e/Hnd68pAlqshMoPOPvNCBWCq9KReXf3OvEvzwFOq6mEDM2NJuhiVKGOxvRrYoYc6NIEf4ekCM0w1L7sRIw7CzeHztFb3+kutggB3bm0RURvMeY93FrmQe1Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WYO4X+NeQXC3hwBjAkRcmMpoUBoBgz7o94c7J+9NFiw=;
 b=Ro9yUsPQ8t03MibuBGKlewe7WJ/MBSXYY8yHxlud15k2fdHhVMIGmN7KMWwXuyeiyu2fJJwVI3wFr3E9M4ICkChpYVvE5NFSqwmQGwZ3GIshvkA/+IRS9wkSm7sWCfXHNWKv7Vbfuu2FFWaU+pwySkQ3xJ7TMSliThA/3RbaGfCQKA351SHylWH7EkwOMZQW8QkDkrA0LJia/dx3YdM1uez0YLG0mZmfqljHYVFz7Af+ZSia5oBFiGlky7JKOFGH2ZZEG4q1hXlSHh941+0//MI0YQqLRPHzlhytvI1mhLQ1+GW+gTbZEojUzraThXVQbn38kZCeDyc/tQc2B988XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WYO4X+NeQXC3hwBjAkRcmMpoUBoBgz7o94c7J+9NFiw=;
 b=Tbwq1pQaZPbR+f+zYNTOOQ6Byppmn6xHxVihhENHHOCyaRSdaQbT7FIJhiv92AADuNG5XdurntXr2F9UEmqAHwUvuRfp13Zv50XY35E4RmUtUBMEzMz8KkNYkdh0suikPWphwu8bhMRtqW8CzHCIkeK5ttrUCQu2CkYqH0WKDrY=
Received: from PH7P223CA0021.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::16)
 by PH8PR12MB6865.namprd12.prod.outlook.com (2603:10b6:510:1c8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 17:05:02 +0000
Received: from SA2PEPF000015C6.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::5a) by PH7P223CA0021.outlook.office365.com
 (2603:10b6:510:338::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29 via Frontend
 Transport; Tue, 29 Oct 2024 17:05:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C6.mail.protection.outlook.com (10.167.241.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 17:05:02 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 12:04:59 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <mark.broadworth@amd.com>, <sunpeng.li@amd.com>, <alex.hung@amd.com>
Subject: [PATCH 2/3][V2] tools/amd_hdmi_compliance: Fix atomic commit failure
Date: Tue, 29 Oct 2024 11:03:48 -0600
Message-ID: <20241029170349.1388428-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029170349.1388428-1-alex.hung@amd.com>
References: <20241029170349.1388428-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C6:EE_|PH8PR12MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c42a91-f89a-499b-767b-08dcf83bd3f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L5nCIqtTBuu4C4epBxb41hIBx1RKYEkOpVJ6pb+36ImOHhR5Q6JdiANYTNKU?=
 =?us-ascii?Q?/0jAU65m4rQPx5FHKmC1mal8pmuqsPKgUz9W5gURGI5B95HNSTb6ULWzO4Zx?=
 =?us-ascii?Q?922P8CvntJhTC7FzFA/aTvbDdnQZHRwFyfQxp0BuV6VfFZZ1ylbV7A9+hgr4?=
 =?us-ascii?Q?+KoTJSjEi8XcaWkBnYZwT4dGy54F49WbehltbdON8EJHrFQqwc8BVe0L5BOi?=
 =?us-ascii?Q?p3wkG+gl972Va9/aSCd/HUyubcFHpQnzcohwQOBjv58ZOVb+uMxBbjVLRu6j?=
 =?us-ascii?Q?5Nd1MGkQo9p7OY2NExDNgDVHjbyNXlrpU/i+HGeQ1oS5et7QOZVvdf7Id9a3?=
 =?us-ascii?Q?GPYRjb5ngCRsYVWeIVMEL3Z0TXxyPITEWpJRDBciWe5jyxl6dQ+Y0TZm82fN?=
 =?us-ascii?Q?f8S0YfSqaQxR1eKjdnOjiXuLSgLy+PeEyQj8O90ucrSrK7mPvFdsfR3jWi3E?=
 =?us-ascii?Q?Bs/eCzsQ3mAMGbbM7OzOvoYopFlj6JhxmGNTz0HSvoQ4i+7DCWHHOY3Mxc1h?=
 =?us-ascii?Q?0FuQdCZk+2kVSPJaPI5hfdbco8vunVdDG2YySc94TFX9KNUdJKkGMs89wqmh?=
 =?us-ascii?Q?f+h19hdkBjYpnon1sMyayBycnkTRQnOaEmerxd7fLn2GWOaybAA9oEMYU6Oc?=
 =?us-ascii?Q?IuyFSUaVY+MPB+C4BBqFQjkfLgBKVc4EoA5B2pb+SXO1g2D5VGOF0QZwP9dJ?=
 =?us-ascii?Q?2QBt//nwED5Zbz57dybzTpAHRt6MDYAnz+T161b01qyrCcaoLwyPxhPMfwXV?=
 =?us-ascii?Q?NuuvF/QfvNI7o7o9I9lBZfQW3KTsBIG1A82jpgXwYAaaHPlh8blPtTLjDAEB?=
 =?us-ascii?Q?0gabuZ9xptLs/1t9XIOWpJA3vPmFG45kz9g/vG1bJlmlGNRsHEZHzeBU5gvH?=
 =?us-ascii?Q?UWcK/fHm9IyeUanXoz4hEOiySRJtBfSX9I/gUjGDckqYKCH9gGg4qnbuk42h?=
 =?us-ascii?Q?JZICjm+HIBVF5V7PiqKcqn/RMYZJVzC4DmKZ7JCku8ZygahZKZuhOExqMTnW?=
 =?us-ascii?Q?3vfJEh3qtvH10cQ4EZHfZYxYkQz+8RZySSCWwXGaxWsHkRdK9x0f5gJdubYC?=
 =?us-ascii?Q?Xba8YGTqo0tqPOTzoaGlvkOIM+quvYmBsWjbg4BEPWdqquaotY5SWHFHmWBo?=
 =?us-ascii?Q?z1/eRIjpVGC0WJP8mWwxzTrHcYcvX/5HbD/RYkgOROlqx59BkEGf8HEJMOmi?=
 =?us-ascii?Q?/7GH8EwroJG52JdxSvVsF0uJNAoyPTbARyRj257cE5RvQZzjFg1YpdMsAahi?=
 =?us-ascii?Q?YpqKsS0K1khIz9EfBFgvjfcDQm5HhSarkVG73cENyCI6QwQaWui1GdKeWtor?=
 =?us-ascii?Q?umdp6nGFJcTugnOtqQuT1pO0LcR4UDskopbtzjL8hquJOwsDXkCBSSPvCX8c?=
 =?us-ascii?Q?5koT+0PaYcHy2+tyYlYJcLy2q/9ork81P8FksqjfQ8w1WmhuXw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 17:05:02.1602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c42a91-f89a-499b-767b-08dcf83bd3f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6865
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

From: Stylon Wang <stylon.wang@amd.com>

[WHY]
Atomic commits without active planes are now invalid commits.

[HOW]
Activate primary plane while setting 'max bpc' property.

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tools/amd_hdmi_compliance.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index d80ebeba7..9d2a820af 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -440,11 +440,14 @@ static void set_force_yuv420(data_t *data, int force, int conn_id)
 static void set_max_bpc(data_t *data, int max_bpc, int conn_id)
 {
 	igt_display_t *display = &data->display;
+	igt_fb_t afb;
 
 	test_init(data, conn_id);
 
 	igt_info("Setting max bpc to %d on connector id %d\n",
 		 max_bpc, data->output->config.connector->connector_id);
+	igt_create_fb(data->fd, 128, 128, DRM_FORMAT_XRGB8888, 0, &afb);
+	igt_plane_set_fb(data->primary, &afb);
 	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, max_bpc);
 	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
 
-- 
2.43.0

