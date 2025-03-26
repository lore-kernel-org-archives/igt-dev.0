Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFBFC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:41:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51E9F10E79D;
	Wed, 26 Mar 2025 23:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KFE0yRUu";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF7C10E79E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:40:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dPHdFOXK6i+IjydDN+GP8mLRVY+wmQov1OyDsgBB6tUiHNR8YP4DCQSkivuHzH6COUvfP0s3nN3lkkWlNQkpv8T466ffLTBct2y2BMo1I17gJWyhbi5TKpQiiqLB/aevBRjGeYnNvGrdnmhKkpXWL+7/xJ1G0RIaX4Ecx0wJzhAGHkDGZH9tnZpYh315zFTP7ipEx4+abkDDJxyhLi6XyUuK1YHwKnBXlyHrhZQO56VOuHuAD9YRyIRJxIJXz/NZew86+d/2HV9YhEGCv+u1l8m020wOGAEWTEsjDRh0UWcQTzD473iTE73dT+AH5cTdfuQfYg+de8mTqkRO76JSZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KwBgFY3+3tnau3kFhhSdMJkgkh8FAInixuJSD2eq6KE=;
 b=dXfkpCKZdjRkPFMwbwDPAHVK0+P6AehNc/H31QQaXwZyN7IzozX21SPGNGWYxijntwYMShS/2UxCOQftMMsid+GgqJKDx17rK+ZVS0Q6ei1vEJqn7JnE9kzVwvNb4wa8ic0ZkqEIDjLGwbuyrFebWPnHQAz1++pTiGpAvUp+C/xz1VHgF9QiBTKbC0l/nnth49e2ZkzD43jmV1E+OMYymKkQN+dxvD5KU2K1rX55+UP9oyodF61pMyMRbaoUmcSkU/WuEgg/aOi0jkQ3Q9ctq6rgmkfe1H+cZFeTpJ/JbtUDdrdGiuH+vhG5FohD4ABhU+4Gw6rKgKJCT/NZfhlmeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KwBgFY3+3tnau3kFhhSdMJkgkh8FAInixuJSD2eq6KE=;
 b=KFE0yRUuUP/Mtm/5I/k131uEP75q98dlxO5qkcaaaK+f0OWLLBk53j4OxvRolGAoOB9t3BeEai53LknbVmMdj0yYnyXI50KaTin1BeSEa7G4uldkxuY1faMd3JJvG9aBQ8CP5tK63wVUtYJ0lMR2YxXD7STpp35fCwzhWkGrGPM=
Received: from LV3P220CA0026.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::27)
 by DS4PR12MB9683.namprd12.prod.outlook.com (2603:10b6:8:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:40:57 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::49) by LV3P220CA0026.outlook.office365.com
 (2603:10b6:408:234::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:40:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:40:57 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:40:56 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 07/37] drm-uapi: Add 1D LUT drm_colorop_type
Date: Wed, 26 Mar 2025 17:35:39 -0600
Message-ID: <20250326233609.2980110-8-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|DS4PR12MB9683:EE_
X-MS-Office365-Filtering-Correlation-Id: 37b27f76-43f5-41ef-b55a-08dd6cbfa825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+nz6TbgWFf2Xjy1jZjSSasDYBCrfFtaYw777qErB+quES8op8izXikWirfG9?=
 =?us-ascii?Q?2/Zojv39/JAATBaayR/p+tUvlf+ibRELnmvE0JYZSwEY7buh+9Xfhn5BIMqw?=
 =?us-ascii?Q?PqGdh5JOYK3FV516q7McoSmWvEPeC5T2qw1Ioc//NtxsmL2SdCJnRdfAQKly?=
 =?us-ascii?Q?7WkQzMt6CZh1s+SckrPPAD1NcymuErwm9uS0tkB/O+BmRJKwpuTtWG7BwKyC?=
 =?us-ascii?Q?vSP7BQBR/pQH3ecAtOBkMeXWb+7RDUlacopDU9O6yPSKMT+qtImiSyUPtHR8?=
 =?us-ascii?Q?w+P0mpgpIlw2verhEOxh/h7sZKu76qb17g2r4Qd+nb62H9iVU3YyWtXdJbP8?=
 =?us-ascii?Q?F2vTc+X/4Q3/6fBNMvs2M1ftbCP5EyTjbAjTh9auKzzOgtYLWPHZRFuWIOZ0?=
 =?us-ascii?Q?8avx6vA4ONqqRcQpjCsCQ1cDsyCUYIi7DoWLMkUzK6VqTKUKh8Vpw+sCsX9Z?=
 =?us-ascii?Q?4isymKJregsgcCr4Clmj9+a3bru5gczUVf5UvVNFUvuM9kppOUVYqnR2YQo8?=
 =?us-ascii?Q?5eDleAoIwzJtIjmj/LKQDvstuTE8iHgWRiOxwAudTu5jTE7qNipXUmM6mok2?=
 =?us-ascii?Q?W8DaubAs+kEhR2ntNWjESeNAZiNIa6sNK+8fxIXqP43v9IVlATpX8hIYVIrj?=
 =?us-ascii?Q?b8A05+ywKEtHh8mNSwDxZg+4GTI9szE7zJCyDi33OAOwrpOxLZLAoHNTNJwc?=
 =?us-ascii?Q?Jyeqeir4JeyhAE7NkGTTqBBUpIwtPwUagRzW73GcQSSAHEte2NTB5Sto5usy?=
 =?us-ascii?Q?YCzpINXHj7QunYu8jbKFX9f/LpsNPOKwOWNICPAsj8D6gNuc/gGefZem4YZw?=
 =?us-ascii?Q?dUajdJ1NF82I2ijJuB/kyCofB9WjGYl/a3d4hTI2wjCD37gYByUmts3p3myb?=
 =?us-ascii?Q?f1Vr+i4PeM6cuBjVsw+QdnptdVj2qhZPmO72tAonWSfAvSpW8L3v8CSg6VoE?=
 =?us-ascii?Q?iIVcD3lYhE3sOm56p/zAhOI1hdzyrAuC77/jxhi96WWqIVoOfi81NOCnb4lt?=
 =?us-ascii?Q?5kO8X55k50nMOUtUv2hD4I2s636jGIOAOH5/yEQkhYLpt6PWobNaXwIf05Jf?=
 =?us-ascii?Q?RtXJX+CxMiWtP3MAIGGD/zjZaNnpWAF+xg0XS+OSlb6szFFztFafkv6ac3FY?=
 =?us-ascii?Q?mbAG6Pt1d0iU//uuCsKJ3Re88ry4XXtOjUIo4v7NTf7quKqSA773gejMT+uL?=
 =?us-ascii?Q?KFLKclM26LUq2zJ4GMkxew9+SvSFepBzSkO+DvgXQHssIf7ChomBwviuR1R5?=
 =?us-ascii?Q?Y/4+peyPbzYif4y3R+HnZf7JsGsQjCH6BCKb4mJMm+hMQTnPC6GcOGTNyfV4?=
 =?us-ascii?Q?c5RjDFOGB0K8gZ3Nait1X73C1X4GHsiNzfm0v7AdFg6wCc6u2ID5YVW8jBIR?=
 =?us-ascii?Q?xdeF7ceC8ErzinViwz9Iov9sz/lFwusO3VnLcCBspHRR2ABTRS7ECmDwBFw9?=
 =?us-ascii?Q?ilgBnRUabJAZNPabO/AY8NHwDE+dQjNxfZLkeHVrYs4NyHoV+sYIB7m8dF7I?=
 =?us-ascii?Q?/S9mBTS1yo3ezsniEVNRF9tsyyUFka2lyOsw?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:40:57.1606 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37b27f76-43f5-41ef-b55a-08dd6cbfa825
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9683
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c5debc1e2..fce45b5cf 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -876,6 +876,7 @@ struct drm_color_lut {
 
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
+	DRM_COLOROP_1D_LUT,
 	DRM_COLOROP_CTM_3X4,
 };
 
-- 
2.43.0

