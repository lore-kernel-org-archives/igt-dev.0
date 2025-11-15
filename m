Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49933CEACFB
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:25:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0282310EC0C;
	Sat, 15 Nov 2025 00:25:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Jo3/oomg";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011047.outbound.protection.outlook.com
 [40.93.194.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E2E10EC14
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:25:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hC8QV1UrFYaFfY2SgCdJCIjqKUHiHVdquPecV6JKIuMyFi367d66Y5JYogd+aIPu+qUVXgRe7pbcPZT0oG/o1fvRTt2USbmSh/Dd0jY6SbJwlbr+CLccYBaYy0V+MTvz7rcASX7DP0rM71BiqrqdGfF8wG8uGnQObEfEzN0fX3iPAlSQRQL2+Ce7kHeXZLkKnpRaXEuodhnrET5i0BUdpzt2avVbbVHe/SN1uUburbxDhqrLJffieqprqpiRJjQ5KGZYC+2HAposZ5bBDj6uWQbe/Z78ZySMIX1s7GYxboQ/6mQ30AE8msT0auCtlzDQT0PN4//deS8d92eYaFptsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QA2iAWYk7qhB+aBS15DCEe0ICl1tg9b4OUAh23+aJ/w=;
 b=uJ40pI1YrZncdtsYLQG5C+e9ikWVnsQjjO9ipadi3DeuHJd0UcZAq7vznzePkK0LmdgOlLfG1ihxPEfsPlAXjbfbDarQ7NkzF89IQ0C7RJm09ypR6Wu7SYQKcUFplPExEVTv0saKmc/Ee+e0vfzviYKPUfsHYopfK6hxnia+p5kw9acP8gaX7TM3nDcRPDrKOD617xwJC/OrfeLA9faLPdpS5/7axXtX3o9IjGKX50uYD63ocKeEs2jNMdPpaeiokNWHK1rFjF+JvWCGd62DghbBWCCYfa/t0MR+PgeP/iRfjx8kWq9l4HMyze/XRRtMAvcL1XCtQ7MRng+2HFMLnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QA2iAWYk7qhB+aBS15DCEe0ICl1tg9b4OUAh23+aJ/w=;
 b=Jo3/oomg7+mMqSmXfjZw+16mQcNtnIICaZDsYMUTwg11FXiL1IK98xQZKN7mrtba54f1m4zl+/bktKQcLOzrf3vsGc2czUTxf9KqJr3GYP0ZllFr1cyc1n0QuliRcXG5ycfthe8QoqZTEuhmDnaY7LGV2j46hRW//QNPlWRB+18=
Received: from DS7PR06CA0019.namprd06.prod.outlook.com (2603:10b6:8:2a::18) by
 IA1PR12MB7543.namprd12.prod.outlook.com (2603:10b6:208:42d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:25:11 +0000
Received: from DS1PEPF00017093.namprd03.prod.outlook.com
 (2603:10b6:8:2a:cafe::1e) by DS7PR06CA0019.outlook.office365.com
 (2603:10b6:8:2a::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:25:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00017093.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:25:10 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:25:04 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 31/32] lib/igt_color: Add support for Gamma 2.2
Date: Fri, 14 Nov 2025 17:18:40 -0700
Message-ID: <20251115001841.3563993-32-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017093:EE_|IA1PR12MB7543:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a9b3305-8261-478a-eb2d-08de23dd7009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?65PzxfbGWDcRf/bpUYiCaHQM684BK/RYDDNykS2DsmqZzIsDOX4g5U5QsFjC?=
 =?us-ascii?Q?AEbgPZvTCGvOUckrks62+uhJegB/UI9lxl4NIycn01asDJ6B1k8uA0tUYTef?=
 =?us-ascii?Q?j4WoMfTGclEiRqiXctB9vdilymVIq/WsiOYwbUbDRhL5aNx0qF+5Yk7egrPG?=
 =?us-ascii?Q?WI0jexqsH0uQxkgGk+AClFpaLxxZEDDu5oTQow0A9qORyfi0YdmVFBeF3aIz?=
 =?us-ascii?Q?2jJJw4pdcgoIRQNlap2s91Phz3cAYoR+/26ECmNJG0m+cW11YMqSng5hgEpu?=
 =?us-ascii?Q?i+zdyCJ7OCGkevrmZdZDqLfOlH7Nhn1mAwX46hO21N6E6qkwB5tHj3IzTIgn?=
 =?us-ascii?Q?rcOFyw5Vg1lqR5YkeigLKA4TI/GUXYj642e5C+3EuQ/Qd1zYUu/K0hruE9Rk?=
 =?us-ascii?Q?V/SS7rtGUUC78VP+oQrYcENDKwJ3B+1DnWwqpxYA9sulY3UWIx+svWLUgJ7P?=
 =?us-ascii?Q?Y6YF2b+GCqdyvFKQvpSJ9ItoC5KqRnomDr7DuX0SK1Qr1E8ADfkT22GLuB3d?=
 =?us-ascii?Q?X4N+ovffy3kuJj5zLJ0kd5vw3dFftviC/kvbi+1uhOuH8/NynD4cPpiJ7ZCJ?=
 =?us-ascii?Q?xB8rUGCnhrw0etRYKXdLFIVdupQB5c7W366U1r713XjvD0BT/Tg1z5Yc0Ysj?=
 =?us-ascii?Q?q6ttaclaWQtMtJ3WQGOY3ANUHQqcQPkkac4U41LDxuL7BYWXZtD+hRte/EU6?=
 =?us-ascii?Q?ZaNhLqmqCnCEHJCqS/iR0yhNGJyDSOxAp02pRSHRf8jaZ7qXltzW2da+N6oV?=
 =?us-ascii?Q?dW74bfvzdZtyaQWELsZcvum+XMbcS3yr35qZyqxv0gXHvlFK/29DZ7xhiuo8?=
 =?us-ascii?Q?66rvt0EL319YH53PleJwIBB0AnuL4TR9iL1LiGVf6FnV1/J6u7vaOi83yCDh?=
 =?us-ascii?Q?erwxBKPEYPBN8dyD/z/XEa2JjIuEs8WJeEn89IOf6BMLdWdYGTIZLO4zZHyg?=
 =?us-ascii?Q?D8olEVs6PgT9AG/zbtoOwNaLl7kKYuZw1BBIs8E/HddhuoufRAb2BIx5eLf6?=
 =?us-ascii?Q?w6/rZ02QqvRJTNsZO463UMXk7hXMon6KecTZrcAKTZOLGGz0M5hO/myBch1/?=
 =?us-ascii?Q?daP13qv4c7U7xL8wBUcQrsNip7DlwSN3u+5g6h/dK97RGFSjQc6d7MsD7tCf?=
 =?us-ascii?Q?/pvSQCDVsN8U1mh7KqI0Ko2e/6RsUr5lS5z6WE0galTzqF/xYgVrFiwWLjYX?=
 =?us-ascii?Q?B3c+cCzXyuHzbEN8oY87tpkOKVuwTMM9ZbPRyqhUnsOlgyzMeXxaU4/4ADxp?=
 =?us-ascii?Q?vs1AaHDzP1o9lPHvbrmskOXHqAYL4O9dWo9fc+3xAJja4RJb64j8NNbUCayL?=
 =?us-ascii?Q?lvTiftzCX4BcSe1veXnfbBZ1b80G3e67355oN0cYFYpIlrCpwd0vvriBfVuD?=
 =?us-ascii?Q?xrjV4K25QVKo54k2YFFQ1QtsVnSLeVhf+drZWujmUl+iyRNOK23qARQQSQH/?=
 =?us-ascii?Q?zPiCjL/nRhBHIVTXL/5AUI+Nz3ewFHbRcf6U8ikO6EwgagALbaCdFzrlRZJ1?=
 =?us-ascii?Q?lqxSTwWjZTDV9MmGwmqRd0pcDCvKBFITqpH/TUH1GkHisdQgF8JWqXjv01PN?=
 =?us-ascii?Q?nM1snaOWcLtXmjRlXw8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:25:10.6818 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a9b3305-8261-478a-eb2d-08de23dd7009
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017093.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7543
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

Support Gamma 2.2 in colorpipeline API.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_color.c | 17 +++++++++++++++++
 lib/igt_color.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 710cc3d61..018d44064 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -103,6 +103,13 @@ static void tf_pq(igt_pixel_t *pixel, const struct igt_color_tf_pq *pq)
 	pixel->b = pq_eval(pq, pixel->b);
 }
 
+static void igt_color_powf(igt_pixel_t *pixel, float power)
+{
+	pixel->r = powf(pixel->r, power);
+	pixel->g = powf(pixel->g, power);
+	pixel->b = powf(pixel->b, power);
+}
+
 void igt_color_srgb_eotf(igt_pixel_t *pixel)
 {
 	igt_color_tf(pixel, &srgb_eotf);
@@ -148,6 +155,16 @@ void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel)
 	igt_color_pq_inv_eotf(pixel);
 }
 
+void igt_color_gamma_2_2_oetf(igt_pixel_t *pixel)
+{
+	igt_color_powf(pixel, 1/2.2f);
+}
+
+void igt_color_gamma_2_2_inv_oetf(igt_pixel_t *pixel)
+{
+	igt_color_powf(pixel, 2.2f);
+}
+
 static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
 {
 	igt_pixel_t result;
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 0d8ce75b8..9fa8262af 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -132,6 +132,9 @@ void igt_color_pq_125_eotf(igt_pixel_t *pixel);
 void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel);
 void igt_color_bt2020_oetf(igt_pixel_t *pixel);
 
+void igt_color_gamma_2_2_oetf(igt_pixel_t *pixel);
+void igt_color_gamma_2_2_inv_oetf(igt_pixel_t *pixel);
+
 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
-- 
2.43.0

