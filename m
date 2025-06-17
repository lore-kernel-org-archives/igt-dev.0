Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F129C7115D
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:43:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5753410E567;
	Tue, 17 Jun 2025 04:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LxC11VS0";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DFC710E4F4
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:43:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+A9FkwYlaP0toqZqbtNMxIbaczU/udJugDlGQMIlw84hnYfB6SOgRIg2p6kaQ3Tp60xkv9lH1PmiKtAg+a1C19ca4lJIsj+1JsqAC4saqFZ1+dBkV8egL7yN3bnHIVIz5kosZDLqjfe5lAsJVIe0eLlNNWL/IN+TdgYNJPjZx9eVd1OAGfFkR7Gi3f7zDOrZ9+ISmiVI7iNkIjsuJwZOzCXadQz640RnxoCtJ2SLbkQ+1u2N3pYggm0Mf3RmIUvgqVVhpETn9b0NJjmwJ1UeaYM358ck2oCLx0+GKerSWDejMzNKW5Tha96dzPvb8NhLtAg26WOQv4eN3eikhBkIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yVu3Sl6T8K7MeKyIs/qmpwCdvIHXM4iuaJI6g8kLnYw=;
 b=iWBH+rMGrSVV3ZNtgdNi+DgvUQAqwlkwzgk66XNwoyyQECibfVSkfcRkVacLL0fUKFqDd+9lcbEQ1v3rsXiXogh9m2nxDduFKtus1H8d5+aO2Lh8U8FG9xK0G/GEt85+5ix+VCLhYmhATqutSBJ0Inek0392QEd8E/r55urCOhRdnujEiMZ6X9tnJQXoz2ODhMnI0oU+TmVJI7cKwfelllhNeP5uKqWVE5+KUMmD5MmHLYpEI04CsrR4KtqG1/pv1EE+H2k6B1KcvTzYSUvE44RXBVgVYBUyIlWA5T1RyJkwP1VfDDE0HJswSougoDF28rd2xdJ3WSmnqCFUWD8/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yVu3Sl6T8K7MeKyIs/qmpwCdvIHXM4iuaJI6g8kLnYw=;
 b=LxC11VS0xLTXygdMvfy/51u8Zq5G+hAVFS6SbDGHfyl0mHjCf4BEnp560i2YwVuHGEEpcYcCQgJ5U59tMiGuoDkLUFUrutZm4IBTPAv6koFoBcRlmf43LB+gDZFsb3Z5/HOodWEbaSdZIquJb4QElwypZ8yoTFCfG6/Aze5isUc=
Received: from CH0PR04CA0039.namprd04.prod.outlook.com (2603:10b6:610:77::14)
 by DS0PR12MB7510.namprd12.prod.outlook.com (2603:10b6:8:132::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 04:43:34 +0000
Received: from CH3PEPF00000018.namprd21.prod.outlook.com
 (2603:10b6:610:77:cafe::3e) by CH0PR04CA0039.outlook.office365.com
 (2603:10b6:610:77::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8792.42 via Frontend Transport; Tue,
 17 Jun 2025 04:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000018.mail.protection.outlook.com (10.167.244.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:43:33 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:43:32 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 34/36] drm-uapi: Update kernel doc for drm_colorop_type
Date: Mon, 16 Jun 2025 22:36:29 -0600
Message-ID: <20250617043631.2920587-35-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000018:EE_|DS0PR12MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: c8219f72-bc60-4502-341b-08ddad598441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MnlZ6Q1CLpcPHtZBSxSXK19kB402AoH5gS1m6V4C+1eOqlKb/MWVx4mE0Laq?=
 =?us-ascii?Q?jkI7ZCYT39j2xe2ASSRVrIlmbCGpgHFGHPmMoC+StVhDvp3uTTUTusvQMUSm?=
 =?us-ascii?Q?ww12XhkJIkH7Tnj5PGiqVT1fazmXLMV9NKLpuz44+YuTMzRDz2mDA8sE3LVE?=
 =?us-ascii?Q?urT1KlJFyfTQWqdFyQsPfXhHEqcBXP2Reg8Q6MGbqUHgDWJxW/Vrj2DvcNhI?=
 =?us-ascii?Q?ryT9BJgMvFa7qs+ltSi25FBQoQMxReL1SEG3j6xu5zweoIg7GHSvgFqOnI9+?=
 =?us-ascii?Q?n2E8OlqbpiTN16cP0/Ql/0aU/IocNwLh8khrNBp//KaeYHu+9WJW+a6ziLUR?=
 =?us-ascii?Q?eDtfT0dqwNsYnTpUCzjF4GgTrf/gjhWdk1hbePKb1LMnqRC/gd4xU4P3ShUi?=
 =?us-ascii?Q?fgRxmH8BYwZw3Zpeb9XwYqKvlHimMtO+Yvfi8Y1RjUilBJKTeySx6J4z7G3d?=
 =?us-ascii?Q?pbLQucKZinZGHYUNna6e5kVMsL3iSUSvCN5WLp384YNKoWOjo6aNTu76rnyQ?=
 =?us-ascii?Q?Q22SDV47cd1iPn/XLpe1V5cQmgYsgcMhLdRWkba0l8PFvU0chQRBUn4xkleQ?=
 =?us-ascii?Q?j5x/a8Uf9rZDyTGJ22BX+aGgah7TK/gOBLMNvpjBCpFRUfoQ/4EiXS0JgrG7?=
 =?us-ascii?Q?mm29eZ79QJs8VhR7Ifiot1z5BVfgQcBfHvxFHAFtJClSnClcBKNPlYVgBTab?=
 =?us-ascii?Q?jEX0aYZMq1NW2Y0XBl/KhloGz34M939X67IN4jolMnMxTW6nYgoIEudBdGIu?=
 =?us-ascii?Q?y2IMdII25mjtyf1aMdOdl5MzgUjw6TrTJMi1i6FBedEgdePw3g5yNFR0wToj?=
 =?us-ascii?Q?ALvpTRwU8Yr/jollVYCRKer6KqvfDSFLn06mdVQ5p1bONgS+l9ZyfXadERrJ?=
 =?us-ascii?Q?7jq0O5/1HYKdbkS2ciLRliDzRiEDGYkqlPvYdv9aRi/xsqgVhWPJwy13Q7eh?=
 =?us-ascii?Q?c3JQByLjD0Qa9Jw+Xw+f37eKgh2ATcBuIEHu1PhnNtft0zhlZxRf22/E6Sbu?=
 =?us-ascii?Q?Em0086gw5kehv9BRfkHQUgILTbk+AygieQghLGyPpXxyImHT2k90MC/QtS9I?=
 =?us-ascii?Q?UA+sU65/oTUlz3DHvOTNGQYjHQw7kgbfPvstKlzFJn6uQfgXKVWbZ0sILxyi?=
 =?us-ascii?Q?sPgHp74Mll1kpNgu1ePq1mAxG98uJrDWKkEbqWoyWyXN4WlHOzNXbpGUhNhn?=
 =?us-ascii?Q?a0LP//3w81QkyuU3Nra8hpNVmNXW6YbvZMYMHWEpzezCta5KHrpwAnG5eqZJ?=
 =?us-ascii?Q?r0DnJbOZlFD2R0qVbIsIbGYyZ7UOdjU2g9iSkcQ8RPDKRiKvDkw3JtLH9h+w?=
 =?us-ascii?Q?Dh+Hd4TDN6RrOBFJRR7R8w1a2JFIvtOjjPnM/+mvMbsk7LLstBuTYF5Q+9+/?=
 =?us-ascii?Q?xKtoaULv3hNMdTjitJ+E+1I7z/SZzouhg/IOdBHNe0PrSA7b4lprBzBUBxu8?=
 =?us-ascii?Q?uo6Z4Ven6+3ZZQ6AXSgO5TUduDgWFdGbPgV7aF+B/dN+ssApLUOPwCx29DjO?=
 =?us-ascii?Q?/D/b3sTPvJQ8kRCFNnon4usmdLeSidbwraYZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:43:33.8502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8219f72-bc60-4502-341b-08ddad598441
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000018.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7510
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

Sync up with kernel documents.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm_mode.h | 44 +++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index 6d07ed593..b305b3d41 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -884,11 +884,55 @@ struct drm_color_lut_32 {
 	__u32 reserved;
 };
 
+/**
+ * enum drm_colorop_type - Type of color operation
+ *
+ *
+ * drm_colorops can be of many different types. Each type behaves differently
+ * and defines a different set of properties. This enum defines all types and
+ * gives a high-level description.
+ */
 enum drm_colorop_type {
+	/**
+	 * @DRM_COLOROP_1D_CURVE:
+	 *
+	 * A 1D curve that is being applied to all color channels. The
+	 * curve is specified via tha CURVE_1D_TYPE colorop property.
+	 */
 	DRM_COLOROP_1D_CURVE,
+
+	/**
+	 * @DRM_COLOROP_1D_LUT:
+	 *
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut_32 entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
 	DRM_COLOROP_1D_LUT,
+
+	/**
+	 * @DRM_COLOROP_CTM_3X4:
+	 *
+	 * A 3x4 matrix. Its values are specified via the
+	 * &drm_color_ctm_3x4 struct provided via the DATA property.
+	 */
 	DRM_COLOROP_CTM_3X4,
+
+	/**
+	 * @DRM_COLOROP_MULTIPLIER:
+	 *
+	 * A simple multiplier, applied to all color values. The
+	 * multiplier is specified as a S31.32 via the MULTIPLIER
+	 * property.
+	 */
 	DRM_COLOROP_MULTIPLIER,
+	/**
+	 * @DRM_COLOROP_3D_LUT:
+	 *
+	 * A 3D LUT of &drm_color_lut entries,
+	 * packed into a blob via the DATA property. The driver's expected
+	 * LUT size is advertised via the SIZE property.
+	 */
 	DRM_COLOROP_3D_LUT,
 };
 
-- 
2.43.0

