Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67022C3600B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:40:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C49910E792;
	Wed, 26 Mar 2025 23:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hMvDV+Hi";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 626FF10E792
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8C8R5S/SQc0LvWz7zmwSvvikfM0EuHf6kW/9mVZl8wCJC5kJaD6pDgR8y6M5lpw5oVQKkowhmIiQKFascFnK6phwdumEokk+FRoKbVPBTvYPO0N6ldR4nPHN54QTm+MmcdkrHhyYQHgLmu5rVLPNFazKbvA1KGLhm0vjmr9Pv7XfWKGIutIcxN77SDnWqGNexTCr3gS4X7yIl+AO6SWDH5hyyhmK2wiUYZ1geoqKE5tIMciM7aK0CzhuTzrqZoZVRNAzb5aqiuL8TNFbeCJSsm//dnPD2ho+XJ3WTlBJ1pioKkK8C9TYYLnILOdu7Y9BX+ACXAnoI0hqVSFU2Rjng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWaCUuEMld9XGYLFoORuNBK/pYbL6Z34JtiZpizCddQ=;
 b=wJeIQ1BezzzC73uxFALKlLBUM0wh5xx1LmxvKfLYpyOYWLh3TTo/1lvQzrOJwIUff/rt6a5la4juDZTy6aUycUbjDUAG4HP/Diq5BM5nlfVh9XoZXm1zR5gDiTSmrOBYyJaFBF+yX+HHeQiGBQEEC3JjWtMIxudMihULmPa/M/JemYCCS1IFgA1u5XaoDH1p0YvWaiau0AMCuiAEdOiNtiaFaOcvC3LMHwAwWvMFhEGI5byl/WB3u9RzOQ0CCQ85WORykKatI90n/E9x72dOFTblslPcW+9neFiCWj1Id+7ErHiDLNNVgPiqjj+e4KPxOqbKy5GOuDgZt7Jj0Th79Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWaCUuEMld9XGYLFoORuNBK/pYbL6Z34JtiZpizCddQ=;
 b=hMvDV+Hi+5shdpYbsIqorICJGUHcyFJYVi11cJXAgsmZc9mrulp1htc6ALlHkttdRi1elDGh/FFx8G/Dmk8q3uNpA/+mMpeheDQ+4+zfRK0dmU4NPEhhbNR3LAFEw7I9L2GXOq/EJuDcoAtfsKPT62ozVJtm/BztCf/uL8TQX4w=
Received: from SJ0PR05CA0031.namprd05.prod.outlook.com (2603:10b6:a03:33f::6)
 by SA1PR12MB7443.namprd12.prod.outlook.com (2603:10b6:806:2b7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:40:33 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::f4) by SJ0PR05CA0031.outlook.office365.com
 (2603:10b6:a03:33f::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:40:33 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:40:31 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 05/37] include/drm-uapi: Add COLOROP object
Date: Wed, 26 Mar 2025 17:35:37 -0600
Message-ID: <20250326233609.2980110-6-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|SA1PR12MB7443:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a40a20-9a50-4261-28bb-08dd6cbf99e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eCWHvI9rRgGBdWPyDCjldOf7MreOQ7w9G4mG/8LQ3ny3caNRXPthm/o+Dbyl?=
 =?us-ascii?Q?Me1dajLy9BD0RfY1Zrcltyzzu8NFMiUfPbNBgchYRcSbtyPJj0ipmnXpajrS?=
 =?us-ascii?Q?+DLjhk7U7OYWfGoxk1QIvLbi7qtsPfGBENMPNm1DMc4fLmv4QXbeNAdZpYpu?=
 =?us-ascii?Q?f5PBoUdU7vjrNPQPl0Pji3CA7SMLpEl8TB7p/nLp4BwxiiAUI9lwTLIorz/h?=
 =?us-ascii?Q?LJkxTktDE5ItZGWxIdfq/a5fkaB+xIJW6C4p5cTcUd+YHUR5UD2lwj/QbC7I?=
 =?us-ascii?Q?Xw4gIIwF9ZWjcZ/WcdkSW0R53nlwha3ZlbRaN1elHhk9YqjuBbLDcDzlfhQ8?=
 =?us-ascii?Q?wH8FSc+syLTJchh92e9rA2u6HRiIuMdSQjFT5o9dfaY5qaxMWrGBNyq7+uU8?=
 =?us-ascii?Q?+2bOTR0ewO0BVOtP0JcUVOoLwBhF77XMNW+r0mQNJZfBjJ28pnLIR4N7Zzou?=
 =?us-ascii?Q?SyB5YsnplMfPqLT8OS7k95w8cpPltRGuURKwBViIL/IUOCpGQ19hY5lHZRhv?=
 =?us-ascii?Q?QnCIY4RWjHlF43VMEa/g17hUMQQ9hq+oFxE+UmozWtzlnnGbazjj4q/Fdt4U?=
 =?us-ascii?Q?w9pb/w7Izc50fhvzJIIkCdWN1gwNqWbRN8wbWqXz6lmY8eBAYRhvsI9/u4zp?=
 =?us-ascii?Q?mCPocRaa2dvqUtVufJfOX5OSwqRaDKX3KW4y2DuhbSs5aY8lMKu9af2DuX4g?=
 =?us-ascii?Q?d2+xWmJsJA8sZkj6OyBAdfvtrbsG3RHV7oULxxr2mCJXFUOjuCyqQsdnnuBj?=
 =?us-ascii?Q?4fJsaCH/s5LZIUwNbKjapa8u5Y9qmLNst2eNqMWPys0NJm/YGI0BbLmu1prZ?=
 =?us-ascii?Q?Ccqw6NkPqD/8xi9iJ9cYNNUZCDKUc0iXKJPgopp6hA3AStp2bJlR7//GKLaA?=
 =?us-ascii?Q?rL8fdkxO1kxPewXrTNIUhyqaMDbDjeO818mc4O4Vrpz+zTat+6dy89uHAQMY?=
 =?us-ascii?Q?lzBrUWT/EoODrV0GvBnds+6/VlY0RKJX1hm0rfiawsXJ1b2PlRyNcvrZmcYZ?=
 =?us-ascii?Q?Z6GLdiOCxOS6qOLkT4pHqNEHwkjtyLqniNTccQNTriHu7ZqCpqjxH47C7VN5?=
 =?us-ascii?Q?8K2Q2cNRjtLgc043vk0eobyJ3lMPqH3fm6lMmwR0Y6GJf2NF54RNmGKJAT4A?=
 =?us-ascii?Q?pWT25/6fEcKo8FMMEA+7+XHYj07jQRj5YxachSaLtKdkVTH99lMmzZDryY4N?=
 =?us-ascii?Q?WNKszwMM/WnJh5Xr0SHA7YpUKv39/xFl2/34pAylC40HvIT0xm2WNCQPDpII?=
 =?us-ascii?Q?4A2WORMmz+T4NaA915dIJQT0S9LhdyxptJLpweBcGXP/0hOhCGyXI9JPd90W?=
 =?us-ascii?Q?vhHXzksS2ly7mAze3DaxNkNnPdOXtqoA4z/tS6Wlt0vFc9d8V2mwvBeAgfzU?=
 =?us-ascii?Q?Up5cFvQszlRILMcBJFfYEQSWdH/NN9TPTn4/W0yfFXkus5bneSMUxMLobBr3?=
 =?us-ascii?Q?0qHgME0Y9trfgTNRj0lmkfQWf1hPzA2bnhiIEjl/oKTdefiLsDANC+TafjwA?=
 =?us-ascii?Q?EmmePOdywFly9rU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:40:33.1229 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a40a20-9a50-4261-28bb-08dd6cbf99e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7443
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

