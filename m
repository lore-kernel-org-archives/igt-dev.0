Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B635CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:30:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD65010E8A1;
	Thu, 30 Oct 2025 04:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VS6PHxf4";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2060D10E8A1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:29:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZwBCPNdKgBJycL3vsmZUIuVZOGJ2Bzmt/tCl/0xhHM2GLx3Ux78Cy+H0QWbXAN5ZnsgMYmkfp71w/y7h9xIYCK742d8QpioJv/CVE4qVwjUJ4VngQ6c1Y5K1TKjReWeLOJWgNZYPJepDlRRTZe3BH0Jgx0U7IJG/2Ukl77yP3LZDyCuiylRRyG0N1MVK0HeuIgTAHbOE1v8mWt1ShO34gb9cJNBuREDHcSUPeZNIuHlZfYMKoqwBX4Lz5c6Slk1dTyhoPGnvF0rbmLXmsQxLRf2lxszEQc7lRge8AWylJReH/kOxm4HnSn7kR6Y3JH5sxOm9s1t7r9fRiMpxOkQHPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSPHOYk6WT5bSRZ6g1uM8b5udE991ubmPzc5DZISv5Q=;
 b=dNp4H/jtV6HNtSqtGQpKAeyGxDhQt8pcx15i+7eceLE1CO6VzTG8cL7T3LjV9guwyIxjPjNv29MrYog8fK7e90rAbzGjWCbKKHXJEfUJkkmsdBW6R/ELJ2geKCzi8Pkc0/m8z+v9PvsR9VF9Gqio6LovMmIqZpys++THGtwanEGpqi+Qx6x1dLrfS699tQveXOlzxnZGsSH2GTu+qjNleQ1pzNM528kV5iYerkMYHee1tuPGJ2HBJowQ3KPbgCWgKgGOz7wWJMTgzL7E5Ug6E9V7nEHBjxNW/7mmPQLtHwGltgMOEvpNMyr7K2TtTVT64qlBnCWYYKMnaxZirxjlmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JSPHOYk6WT5bSRZ6g1uM8b5udE991ubmPzc5DZISv5Q=;
 b=VS6PHxf4ndloqh94M7oAJbN/uexT0WH9U1Ti+TMt3Np3cGw1XDY9+6rIiS/cYiz7/+zt1zAkaVGrQHB8GcUHrmefMxw91DhfJmARpM+E3aYje13PFPwToGFi3vOQUxrIBNoDW4MUoOnftvKdEyY0qh1KszoTN/oFxLgP6+gdscI=
Received: from BN9PR03CA0351.namprd03.prod.outlook.com (2603:10b6:408:f6::26)
 by PH7PR12MB8124.namprd12.prod.outlook.com (2603:10b6:510:2ba::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 04:29:56 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::a1) by BN9PR03CA0351.outlook.office365.com
 (2603:10b6:408:f6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.18 via Frontend Transport; Thu,
 30 Oct 2025 04:29:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:29:55 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:29:54 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 08/32] lib/igt_fb: Add igt_copy_fb function
Date: Wed, 29 Oct 2025 22:27:37 -0600
Message-ID: <20251030042801.2315866-9-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|PH7PR12MB8124:EE_
X-MS-Office365-Filtering-Correlation-Id: 60ab5ad5-bbf1-46f7-a906-08de176cfa49
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ewpkk1cTsuKK+Xy6g1eFw2wtilC+n0vLpNdBGQX0PNb4gjfhV6szePdsa53M?=
 =?us-ascii?Q?ugswPVV+8ur0AohoovUJa6oZDKssLX+oPsuINC6G7pN0/Op4x8qzjWvaNXxs?=
 =?us-ascii?Q?HR9VqBe786v9LBvOewQfyjLf6D7pZ18BKnUaeLXDXVLL6sATFBuAPjmJdlJ6?=
 =?us-ascii?Q?Sf6GhpHZcZAVHI9K8RuFqX93ulOHrkVjBE3o1cjTIwDhbEUaPKrvS8OssHdA?=
 =?us-ascii?Q?84fTG9MCgg0f5e0UhvcYLt/ydqpqEhai+GtjlikoMfcfOKs4LfGG9mEG+8ZX?=
 =?us-ascii?Q?Kdg7uSAB5CGvT5bqWRm+qVLAZzruqisVj+e1yMVjye/6V0yPVSJN2D8GQK54?=
 =?us-ascii?Q?WhMY0GZ56cI6vwjni+EgsP+acY84Srh8xIWSwAbf0nTL7attxfaBJYIJbZNZ?=
 =?us-ascii?Q?U12VPKUP3jZ4iw0C3lvzYxc76XVtose+ZoT3M0cY502QHyUOKcsSNo486kVi?=
 =?us-ascii?Q?TXQ1OaRLwFv9PAxx83DgFj70kbYuFvKz0YjnccOE63bK6cQ01JOivPwH9wxW?=
 =?us-ascii?Q?dGdJB6asLDUsUMxYkoAxWWqRcH2CsBwrmQzIktA7Cja+LlokZn3uVKLmy/JV?=
 =?us-ascii?Q?Yja+yQJbbCJiYzI2SBIKEBbAMgg56RxqkBk4tb6ou0rloXUMs/M6gnz8t0T6?=
 =?us-ascii?Q?fJPGGRzjEHZrwuJ/11iybDGZhWE0ni3NNumB5y2GvHk25PmhcWTIoPe860Vm?=
 =?us-ascii?Q?eomwQWAFtN1hEVsqofeylURxDzm+ZEGfH0tuYTxOSKLzPxN0+ArubvfhPG1t?=
 =?us-ascii?Q?AN/JKlPvy7ozMW08F1g7W+b6DO5ZPC3X94QwqV+dKpSAHHydME74WFKnesm3?=
 =?us-ascii?Q?7/UfAXdUmQE9uqKxjdvdW8IjN6C8LQUsJgXqfKHhH+v2kKRoeMq7l1dNXUvd?=
 =?us-ascii?Q?pdy/aQlRGNE5FMJB016WkYTO++hhGTrQ4Pm8Gu9RYpjBJEoHTt+2PIOvTpNp?=
 =?us-ascii?Q?v0Dl4B16BvSHDOLCh1JHt5YcvjLy2fIkfNCYkcaCGkzl1PN5L1YW1y0PCx5Y?=
 =?us-ascii?Q?wxeW+AFV9nkLph1VBDXfxPxffW+ukPgdcXcsN26wKmk7InpkjhC1NGAeoKtb?=
 =?us-ascii?Q?bkS6WF9HloTeZ+cLaNNDidziqOmsBmwMq5MrV61l4iiUoqhcJV97q2rK7I9T?=
 =?us-ascii?Q?OjjO8XmsMZk5vWeEZHW/ue/8Uar+kWCmqbklYh3gT6Gktnif97SZmM9Tl87D?=
 =?us-ascii?Q?P7vhWfcvMUY5yusLkrDyaCUzilV5gbDOb2cVDb1mKSCL42CH62f0jHjtCr8F?=
 =?us-ascii?Q?cATb4hlNq0cl0BAdfLDKEP0kViClHIwwtb2gARKCc8asRT8sgzVWSaMz83E6?=
 =?us-ascii?Q?hL3gLdqLNv6keXWfY36Ml8Y7BA95w7bJJDkmf1tpCOFLzHqijO6npQ5oABds?=
 =?us-ascii?Q?9krKCe2ITYJHg/FKSlK9BPkOPXWYNtPPPBS8Tw9aoYu6y/crNdaVaesWDaLT?=
 =?us-ascii?Q?i9xXutGG7LOBC8Fr0mCRa6NbpflmhizZJzuVeUhxTSlk04swkRwripWG5Ada?=
 =?us-ascii?Q?DMijJyTxGAwJ0wgewNPppWt/Bnu1tvl7l8ShY93/d9LB1xX8ZauXH5MvNUI+?=
 =?us-ascii?Q?/lQ/JeVH11pcOLd/y28=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:29:55.5801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60ab5ad5-bbf1-46f7-a906-08de176cfa49
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8124
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

Add a function to copy fb of DRM_FORMAT_XRGB8888.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 41 +++++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 42 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index a1df3d070..4ec7ee5a9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2172,6 +2172,47 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 					  fb, 0, 0);
 }
 
+/**
+ * igt_copy_fb:
+ * @fd: open drm file descriptor
+ * @src: pointer to source #igt_fb structure
+ * @fb: pointer to destination #igt_fb structure
+ *
+ * This function creates a new framebuffer with the same properties as @src
+ * and copies the pixel data.
+ *
+ * Returns:
+ * The kms id of the created framebuffer on success or a negative error code.
+ */
+int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
+{
+	char *in_ptr, *out_ptr;
+	int fb_id = 0;
+	int cpp;
+
+	igt_assert(src);
+
+	if (src->num_planes != 1)
+		return -EINVAL;
+
+	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
+			      src->modifier, fb);
+
+	/* copy buffer contents */
+	in_ptr = igt_fb_map_buffer(fb->fd, src);
+	igt_assert(in_ptr);
+	out_ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(out_ptr);
+
+	cpp = igt_drm_format_to_bpp(src->drm_format) / 8;
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
index fe0bb580c..ac0e0909e 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -141,6 +141,7 @@ struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 					  const struct igt_fb *fb, const char *name);
 unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 			   uint64_t modifier, struct igt_fb *fb);
+int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb);
 unsigned int igt_create_color_fb(int fd, int width, int height,
 				 uint32_t format, uint64_t modifier,
 				 double r, double g, double b,
-- 
2.43.0

