Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966F0C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:43:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CC0610E793;
	Wed, 26 Mar 2025 23:43:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LvHfE9Gp";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380CE10E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dB/WegWjBUaceAaAI3fwRXyS/nOE9dn7W2nLvto1RVXlkM1t2AFjl4i8q0xcbR5n4DZxYV1yA6YVTHStION0PxavXj6tEAcU0zifc9USvlyHzPHa8VfQsA8N2fhpO0CbZ6N9uGp2025j5Rhjfim+uRQbdGVVrFvz85PAzK5J/bDBdhX1hewhZPNO6B3Jj/iM1kODSvQhWBp6rfOX324WbNqcshS57Q4GzNKlYAHvjL5mMQuaYvFeRp2LlPuI+umoskIHx450G8PccYa8NEjCB3SZOA+QNv2eLN2EMmKJEsESUWfFn0m/y/B4yeAZ2B+jJUcCuNYuG2znJpfBj21kYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bUJJa3dEDbQxrG6kurZQJ7qvJRK+loNTQHnfmdfWQJ0=;
 b=nA0VgV4WlXYPkEPo+1qVbHYBytIqXAkTC2B9U2La/+gHK6BSJsKeG+9Aknw+SlpsPffK3UW2OPrIxXoQnwExXOaLZ1GvK+bxHjnmKahZiFS3XbN6a/aI6mjq4owyAh6oInNP1AGC4s5Cf1FXF7vDRD6ZoYf6VeSmyPWN6tx/acmno4pqGTfUi/fgINcLYpjSywH2xgg0/jyZJyxdtlx7nQBEDWJQI3zTfKnRe060o5eAeK39IJsvx7TKk4TeTaj4Il6W4DPeECOKjBO1Az2ZpMtAYapZBV/xbw36wQBMkSuPE7ohSTzqE279+hXPiv0U/paAEp78sNrFAO4uDXDFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bUJJa3dEDbQxrG6kurZQJ7qvJRK+loNTQHnfmdfWQJ0=;
 b=LvHfE9Gplk9G+ViRClZx4pp60Coh+h1kmRDUDoONp2b1SCgmqXbAV9K/zb8C5ESN1VDRl8xDG+0bcPPD1rgijoffEWA2r9Okx7mNeuFCmwW8FzixNPuXWdD1diHNkIcjBcY61hepNsJbVhOFpzrTV3Q5jbU2Wfhk6F48UrHPbeo=
Received: from BL0PR1501CA0002.namprd15.prod.outlook.com
 (2603:10b6:207:17::15) by IA1PR12MB6650.namprd12.prod.outlook.com
 (2603:10b6:208:3a1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:43:33 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::7f) by BL0PR1501CA0002.outlook.office365.com
 (2603:10b6:207:17::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Wed,
 26 Mar 2025 23:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:43:32 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:43:32 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 20/37] lib/igt_fb: Allow any non-planar format for
 igt_copy_fb
Date: Wed, 26 Mar 2025 17:35:52 -0600
Message-ID: <20250326233609.2980110-21-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|IA1PR12MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 14caa7ed-b13f-44c9-2110-08dd6cc004ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WgWQO/wwt1+Qmrnb8n9LoFwaxc6kQ/5bZLKGJR3qlS3xm2f5iloUihDu5wDo?=
 =?us-ascii?Q?MXNBL1YLPFLgEyXoiPg7yxgHnX7uRhZp/NvELjc9eMnYHG4hSqY1J/E39wzY?=
 =?us-ascii?Q?V5myZR6lEL+TLtY6RtwS3biXwvQSQKAIaNGZqFvUT3cmZUphZjkwQmt1yVpF?=
 =?us-ascii?Q?CoWyIQ5+ymlqXqBOyovHIJDWxYE2W9kAxto4lOHbnnFdy9bZHZo/cquQCdpl?=
 =?us-ascii?Q?W1zO1XVLMpUJ9hDogcsQJHwWWFXPuhktCZFpVZDgpV/x9ZQfiXPJbIQ8wMb5?=
 =?us-ascii?Q?sv+iZrSIXlhwPNAa7PD896L0Fxd4ye0AEFSRLT68z2kXIsSmU9XKVuNuML4R?=
 =?us-ascii?Q?tnAqojpzVN2jtY2UpEU8OOekcEfSA4XQ44758uXCDpWPK4sqU4Jq7JzYOn8e?=
 =?us-ascii?Q?2E8bpST5GSlP9Zrc1NuTHAh0ytQ1yCzksVmVuqnMOV9R6UnquUELWVoMMOCY?=
 =?us-ascii?Q?Miha3EKzFkmS27xZNXSVx1ASVRUjzMV60YmWVklZWAlDwfcrR7BIKfxLOaXM?=
 =?us-ascii?Q?p/j67yKtU1COGjv31GEYmBAGrvs/H/AOqgkcs14Nme84dnuwHRImBcvDNflC?=
 =?us-ascii?Q?cuw642Y+T3aFaHha3xJ86F8RJXs4+Isp3YiF/jhmMbcmz2wd3NLHmH/DrVXh?=
 =?us-ascii?Q?joXJ3oeX0/DbKBDtHRkbaFcjwPK4E4FZS+rJOwSbUSMCkE4rvvq8p6EOPXoj?=
 =?us-ascii?Q?vUwfluKg73n40HI++vpBgIf2q+jI7DMKXEyM25/RgLWCpo7NvgfP0lRgw/o6?=
 =?us-ascii?Q?iAP9aAIboLnNf+ChtLdUeFEv0GV5N14DftxuE7fo79xVCSGO0uVYJr3i8Sm9?=
 =?us-ascii?Q?Bwp+fxf1D0dQdbxpW5sucSvyzdlXgfOToDhQEBkT0JbKNB3FT1y3518aTnra?=
 =?us-ascii?Q?+HrjdWXKa5rrrCnBWD8UlJf2uq3tn6i1+woKSGzaJWRXNYHklMEZ1zUAIbqx?=
 =?us-ascii?Q?/ryQOb2N4Zv4uua09wpn1qbBhR2lnL+m2db0lyG/ITOsmFvHt9So6mMVDGCR?=
 =?us-ascii?Q?qJ5F786zTbd0byH0s2Zk3BaEqPS+/qVN/Z0rWfTM8Y9SF0gtRkdOUxDvcbfp?=
 =?us-ascii?Q?KRIpnaYI3oc9OQw2LV+jizcaar4RqfxVRrNuDqSDTZd34nO7SJSrpiX6OStF?=
 =?us-ascii?Q?xsaWwqMygxqHb+CE+6FsALEgzDwVE1IL3Gh8Q5oykGZOPfRiwlb/XubcgO+V?=
 =?us-ascii?Q?JfFXo+LjhTkgmKP5VR7DS7aAd2EWeri0JBEjAA0x8d5JRb1NGJ/APbhE8cLf?=
 =?us-ascii?Q?oniLvdJTi3gMt7oWVwJdE8s7nI5D2rlbup2ImYN+qezNYRI/vy1RGecL0QK5?=
 =?us-ascii?Q?Ms7WKXikly/0t1P8wXDxi2D+9AI6bZlrY3+DupDIspqoogqKid3jjSci/c6N?=
 =?us-ascii?Q?UByNZtynzZ/vSoFJSzKmeIw9MYbJfGI/8RmnG6A8KRz6IeeVJthE2XpUqu79?=
 =?us-ascii?Q?ukedAXkKjyEozUcLk+OCMiPBi52BFmn6rXzH+/oc6OWx3CMCgybV+WN5qEwJ?=
 =?us-ascii?Q?P5V77m7Qx5vlLlE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:43:32.9359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14caa7ed-b13f-44c9-2110-08dd6cc004ff
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6650
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

The function is able to handle any non-planar format. It's been
tested for XRGB8888 and XRGB2101010 so far but should work
for a wider range of formats.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 17d3fa0a9..479086376 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2182,10 +2182,6 @@ unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
 	if (src->num_planes != 1)
 		return -EINVAL;
 
-	/* TODO expand for other formats */
-	if (src->drm_format != DRM_FORMAT_XRGB8888)
-		return -EINVAL;
-
 	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
 			    src->modifier, fb);
 
-- 
2.43.0

