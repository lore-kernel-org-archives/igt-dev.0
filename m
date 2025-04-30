Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E146DC3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:36:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98F8510E6AC;
	Wed, 30 Apr 2025 01:36:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sj+4qonv";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2068.outbound.protection.outlook.com [40.107.100.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E6110E6AC
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:36:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hk2GGbZHb0E1XTWRvC2S3w+czp0Ew2szl4xJgLsUZ86zKkqzToqMUqM8DG2BZUNO7fKcxxK9oC5iQdavS13Wkg0YhcaZgXC+Ao0ePmlAdhJWCrpIEt2VK54VqjWfd3c4a+yq+eO3ZsUNHGZHShz5ycXwSLLo0fBHKVcxNT1Pglup2/vBXcNl1CDw8tDzTIp3YLLC19JMYzBTc3StMGVzzY7fhATKAOsmBwBfopGcF6b4/5FcWDb4dt4x0XKltuHqXxkP5vGlgk6ooAGTldbXhuwIdwByvnUqgXgi5ENA60q8l666TPPKw2IwyVoQsPTwez7LREhHeF2JX26Dd7q/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWaCUuEMld9XGYLFoORuNBK/pYbL6Z34JtiZpizCddQ=;
 b=DRGcH4V2w4SSxAHRlOEZY8shbF2pFDJ4pDjmGuqFeiF6QDugIPu5fdnqMi/oZXx3Y1Zw1kN9SpgifWmJB70c35Lb6OILp03NaPucJE4Qdny0JFK23LxnSFxi/dHHygXo15Hs84mRV1Yf01zvswlE0v5tND9FZ/K6F7qc5pp59IfsNWTs2Twn0ch2KvLPsChryiSiBuwimq83TQrSIPrs8/3wTOmBk5D9Q73Rz34HutPJgHJoSQZknQWNf6bWVX+IjlSWZBLphNvNTHjpt0rF84/M07rXvQufdHs3WdOHHYgVXX7zxnVFsWEOEfqKkTjxmJrgHa8wqFawCE+asdBm0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWaCUuEMld9XGYLFoORuNBK/pYbL6Z34JtiZpizCddQ=;
 b=sj+4qonvC/klZ25m8j+JHjUjUGgr68oQmJgd0isGjsPfAJfBvzU6ZPVuadG7mAVZXLiRNoOFHjlQK0VZS97PT1+iCtDyiz/R+YnGljBarqe/QZv1XE3JAntM+qic1WOhxp5qV1O9xuHtHuxtwMSinf1dCz8nLK6dDOK/j/r4VvI=
Received: from BYAPR07CA0096.namprd07.prod.outlook.com (2603:10b6:a03:12b::37)
 by PH7PR12MB7985.namprd12.prod.outlook.com (2603:10b6:510:27b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 01:36:23 +0000
Received: from SJ5PEPF000001D6.namprd05.prod.outlook.com
 (2603:10b6:a03:12b:cafe::97) by BYAPR07CA0096.outlook.office365.com
 (2603:10b6:a03:12b::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Wed,
 30 Apr 2025 01:36:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D6.mail.protection.outlook.com (10.167.242.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:36:22 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:36:21 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 05/36] include/drm-uapi: Add COLOROP object
Date: Tue, 29 Apr 2025 19:34:23 -0600
Message-ID: <20250430013454.226910-6-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D6:EE_|PH7PR12MB7985:EE_
X-MS-Office365-Filtering-Correlation-Id: dc1475b8-af11-4ae4-3b13-08dd87876a47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WM7GWP0MaYU+QcSOmc/1J/tRlesTF3L6KqGRVBAxgbwDTWZHkrQfLhULtc9t?=
 =?us-ascii?Q?8Dy4bAGaC6zyvkNXH6FNdGg/byGGpgNqov0DxQE1LW2Ehg6fYvgwsV6CaLVO?=
 =?us-ascii?Q?3oonOaqnBgkxEM1pLO1VTnaVxp6xMO/8fmjUKv4X6k873vfEU95vdFB6O+Fz?=
 =?us-ascii?Q?vwbuJc7+BJGTFkHcHx9Pl9VQvHOsys97bnxhczBVb1f/YPQf0RkWXr/fijPP?=
 =?us-ascii?Q?sVKGAKg3TiGyj/38nGD1GPjoMFs8AgXoAQPVl3k/rPIwzuW+Bo04I+I/+zWK?=
 =?us-ascii?Q?apBRqMqLlthdDQdaaAmwhFDOsP6UUmkm3C6dY5X+F6dc3TpkovrsqovXOY4O?=
 =?us-ascii?Q?Gw4c1P0s827ZmI3lGOCqbW7xh5xjR4rXO7b/yl59Fp82x32yY6logDmWbR/B?=
 =?us-ascii?Q?CmLf2rthttsairqBeFf2H9bP3aC+OGxWQAdw9uisGPYFvTKngeE/oQ2gNcJM?=
 =?us-ascii?Q?nsOEjtGxUx/IP4i1U80gLAD/xm2C9RjMUMsuxoYlTh0NplTw+5K0g0ihFwWa?=
 =?us-ascii?Q?lKM/iLi0fBEi9Ri0DQZKhtDfFwSZYE8UruAj2q+yzRfYccWQWChw2YRWMwGo?=
 =?us-ascii?Q?j8LGbAzDDR2V/MzTBrY+vEbDpqvtU2YrlXEinb6NJrG8sft5Riu6iSnX0aTt?=
 =?us-ascii?Q?DsvMWABMQ6/xrOhAUcZiZ/Pjxbza1DfjUGBbYmQJwI1FjgJUlqq4emlhdVyg?=
 =?us-ascii?Q?GR4sP0N7iZQEmLSvaHZ/rcIH98g1N7Y7ASGd88OGVEAPLM8eZXOHu9ElJRLU?=
 =?us-ascii?Q?54PD+agsmeOcFKQJQsweQze5eIzzCdomasmkKke5RDua8sRvHoKLlMf46t4C?=
 =?us-ascii?Q?QXkdADLYwNGrAt3e7OHkbT1fZKqfeScj4xOR55LEB87ezxi5f2bMEENKPvSx?=
 =?us-ascii?Q?T9dWRRmC56sRGZdQG9EIQlx7do5RseZHMQOhmKbGGcqf6+B9UWXJKF97dLBv?=
 =?us-ascii?Q?hwRkEQrRAAIF5GFWpH9pIgSvg+jSs2oxJP+eBolImIg3Oy3vdwwQv41fcdJ/?=
 =?us-ascii?Q?OwSaoPmuSCzh0Sj19b3CSVxvnMkPv3KWBXBXrBTaNA22m6ozX6pwx/6ox6Pd?=
 =?us-ascii?Q?2mR0RocOVTPMtKgqMKnXDYtFgyw78j6IyL5/udhZw+MGCRfwyAizYTPKGO2Z?=
 =?us-ascii?Q?e85irz2vYFVkBxNfsGX3iND7cxk3fIbj+zjSTEezYWECnLyaDIWWtNY1mh0v?=
 =?us-ascii?Q?V9yOlJ71zm+nk/BSPPWOtWvpE1SBGI67z8+rL/FZsmEKC5URp8eVenhg+asH?=
 =?us-ascii?Q?N059otiy4hkA9jGWh6VSfCREx8GPBgIuTyGjl1WM90jL6rhtsqqiIlJPUGvQ?=
 =?us-ascii?Q?nTdHgqom+gEN3Eg7vgYYH6TQwlXS9Qr/5aBJ3U5gJuOpxt0bNx9J1lQO8xJH?=
 =?us-ascii?Q?p5LORxlwzpLy0QQkRqBebo+6UQ6+gAd9qYGy40j03b4N5wrv4V4YEAjeDF8g?=
 =?us-ascii?Q?Mcjl92ZQwMFYJp9CjwbP8OsKg/Js/G0lHiQ666jbZ/l5IqAleN7EOQO7i17I?=
 =?us-ascii?Q?4FQ0gvuQrLx+TCDVOeByqVIKV23k4Oy5jday?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:36:22.8410 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc1475b8-af11-4ae4-3b13-08dd87876a47
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7985
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

DRM is introducing a new DRM core obejct, a drm_colorop. This
object will represent one color operation in a color pipeline.

Introduce the object type in the drm-uapi.

v3:
- move enum drm_colorop_type to drm_mode.h

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index c082810c0..b31852a94 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -629,6 +629,7 @@ struct drm_mode_connector_set_property {
 #define DRM_MODE_OBJECT_FB 0xfbfbfbfb
 #define DRM_MODE_OBJECT_BLOB 0xbbbbbbbb
 #define DRM_MODE_OBJECT_PLANE 0xeeeeeeee
+#define DRM_MODE_OBJECT_COLOROP 0xfafafafa
 #define DRM_MODE_OBJECT_ANY 0
 
 struct drm_mode_obj_get_properties {
@@ -857,6 +858,10 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+enum drm_colorop_type {
+	DRM_COLOROP_1D_CURVE
+};
+
 /**
  * struct drm_plane_size_hint - Plane size hints
  * @width: The width of the plane in pixel
-- 
2.43.0

