Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF7EC54722
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65D1A10E483;
	Mon, 19 Aug 2024 20:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lHYZtWcw";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2060.outbound.protection.outlook.com [40.107.94.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB8C10E429
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tQWgpqvJCrTjQ8CcvC3Kb9gto1ToHwVWRpZQLsPzanuJ9M3ls+kRxD8EgzPy2QUdnl52F8h2T6wUS9ak1bNWee2tnkVJTyQ6vpHCWilnaOJQKAa0DzGxZmfqn/tmafrdRpCmD3X6DKBH2ZNNT5oZhz0dycy9vQHy9Io8VM/DADtOyD11uU5thj2uu41ffiM1zVRBxTC7gc2fuaAGZPKXhVtJaP2brLGtaFP4Q65f9/YgZvcW0XyDFuqxRyZisll3rqfbXu0CHFQPtezrP4q/e7qa61bJce/6DZfmTJkJdDqrf6LgBkyDWSSy7FkPQi2hjyqbx/1uAPkuA4JVpV/L7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H/3YU0aFrLY2t1QvDM1tUePoKapMd04YXXo0smRQD9E=;
 b=JsLzYcpO784ATMPdX1xkPxQcNmDf4PtjkuVCeDlXBPebh17w58QFqwgV76t1zn3y/L4+wDtA/DgBi92ZqfJgPKIhXiSb4IuI0lSBlZFinmNPKvELnvH4UhDyYd/Q/AcIpFocsfB7CrEMIp27iFLqVKe0Ziy5RkmpTuOK6fi96VeXK1U1xfAQ3nGts1g1U3RSF1fU9y1tjtXOpLQAGPY3mHTq5w/7Q/gDgZW8OfNvtJSnZjEW3Tqj9IHX/yF8xxOJpLglIykJLtex0W5NrrpUzRVXTvdnm55+D8Gp1femi4CWzA5Aji+MO3/9gk7Ua1XRLpF1oa6npGt04bxFAQiWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H/3YU0aFrLY2t1QvDM1tUePoKapMd04YXXo0smRQD9E=;
 b=lHYZtWcwnk1RDz1YNbaC7xWa3JSNcFKl8ldRQxlE3umFwN3CPyF2ZEne6K4Dvh1iaYcEXd6YlnXwAAoG6M+88u1AapwBlZOSc3spILmCaOUxv+mLSqXz86CAAyDDVzxQK1Bye4WSqL5f6UC4rrpgykJdWRzqKkTdw6PztUaemQM=
Received: from CH0PR13CA0027.namprd13.prod.outlook.com (2603:10b6:610:b1::32)
 by DS7PR12MB6094.namprd12.prod.outlook.com (2603:10b6:8:9d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23; Mon, 19 Aug
 2024 20:58:34 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:b1:cafe::8f) by CH0PR13CA0027.outlook.office365.com
 (2603:10b6:610:b1::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:32 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:32 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 13/37] lib/igt_kms: Add support for DATA colorop property
Date: Mon, 19 Aug 2024 16:57:59 -0400
Message-ID: <20240819205823.316656-14-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DS7PR12MB6094:EE_
X-MS-Office365-Filtering-Correlation-Id: cebed4a8-d345-415a-5ff4-08dcc091b0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?x6OBzD9WBcvJEe9eYP4UVHWPszJHzbi7PQAEr3WOxCuZ7ah3W7m6SGs6omJ1?=
 =?us-ascii?Q?5rW6a1euBdM+QWw0xGQQ9dNv9bsRn8/06sirPxw9WRC/YJp7iTVLV1ZrZa9k?=
 =?us-ascii?Q?Nh+OnL555N+LbYWWtO2gT5DoKZGj9RKwQ9+X/KbdwcqxREh+6QinX0YrXe4m?=
 =?us-ascii?Q?GO8eg9ZlX+Zo8LNdMgLuObQM8kXSESXvSjGgTiUZ0IHUmi32z5M1rnQiQJUu?=
 =?us-ascii?Q?S5WJ0YaZ8PtntaCypQx9fPbgLCMglghRGod3FFPseWDBR1dG4Wv50s5nHGci?=
 =?us-ascii?Q?9gbVW11mgICwHfy+VhMSMtzA8XS2d8EwtcRokUr67LA5kMuwlGRrpJrp0UPF?=
 =?us-ascii?Q?xMbAl5nvnS6/IExzD1IgqDPZpY/zg7OGHDnkYxtU9k/5bhd/bgWy5125J7Jh?=
 =?us-ascii?Q?JzZw5Zlm9wZJKPiXEm7e/Z3YK8MQW0H55Db0WYxwnYmGb8ceFHp76v5RRses?=
 =?us-ascii?Q?pzZoCdRgocx02ge4d6Y42wVKawZD8+X+D7mQ1voSH4GBb5xtKNSi7Be9DP1m?=
 =?us-ascii?Q?+3JkaILdN3q6V+tXLeFFyAr06ObQhJmfCN5/O8S3Ulz8dniu2UnBUSsoxZGx?=
 =?us-ascii?Q?4djVUgQZ5ZIOXllq7eLfC+GtAI++YDfB3ZdP6BZAZs7GLRrCiDT3zQsaJ3AK?=
 =?us-ascii?Q?XXPBLjiTFAPfnNcEUiLAhciHfSrMMPzd11B5aecskQL1UIOWVmEmexnNiQh+?=
 =?us-ascii?Q?93B2r0Zy5qesvbxehMKB9hTp1Mw6RAwBGaeFgWjgCUiG9uwMdeXwkHbZ8ZXT?=
 =?us-ascii?Q?P8mouTxVY41ynDQQCEpsfA279HVD5OMWljC24hOt8yBK70808ZzoA3YuK6Z0?=
 =?us-ascii?Q?Ti4VZfhRbF9ZQ7tyaULyr7Ng98fYvVGu3FE612gU1DI+RJn3VUSjT6HBE4R3?=
 =?us-ascii?Q?Lb1Kr+Y+NFdm3SnpDnJt8UjpDrBf9Ee/H1Wfc8PPXKjhT7jqD2l1lRnIZr8k?=
 =?us-ascii?Q?ppX4eHz8eMArKbKWY/XMz7Vvkf1zuOjnIaUlC8JiSD4OD38LTEtVobQEDhkR?=
 =?us-ascii?Q?FoqmM85AJ3Ir4cvA52/5MEH6Scm8qspTy1wYAIMqfqAloQuQ9z1d0Agsk/KB?=
 =?us-ascii?Q?RKc5YPjwHyl+IByfplkKrd8/9bGNEPXP4BwQMmVt5FqKpQ78HhedPamCDI6t?=
 =?us-ascii?Q?5t0Zv/zASIcGA0heof63w1ArSwQwmlVvZraFWqWhaxAB7bzUvcq8DySYrYDI?=
 =?us-ascii?Q?ZqBp5V9WT+nZYHGLqubwx/sUHjdR25DvQWNjgiDWVMf+PqDc4K+rF8y9HdoX?=
 =?us-ascii?Q?lP5R/sJFbI5zq99ooKw+SBb9NftN/KuxbgTSuQiv4fl+fWPscZWYmwGaXkIr?=
 =?us-ascii?Q?A4PAxzf/kq+mIwfEqQYi9DC3KjNeKnT9newOqEOGi25FwT47Yux22Emi4y23?=
 =?us-ascii?Q?ZP6yrW82gE217qBk+aouH1D2tOe3WmSKN4zBYppgC9l0IMF9JlzPstYJXrmT?=
 =?us-ascii?Q?LOY1E9+gTBq1t8akiO2Z/nExoUZRv2Uw?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:34.7215 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cebed4a8-d345-415a-5ff4-08dcc091b0c3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6094
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 12 ++++++++----
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index f02c268461c7..4e45841ac393 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -695,6 +695,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
@@ -4369,6 +4370,38 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
 	igt_plane_set_prop_changed(plane, prop);
 }
 
+/**
+ * igt_colorop_replace_prop_blob:
+ * @plane: colorop to set property on.
+ * @prop: property for which the blob will be replaced.
+ * @ptr: Pointer to contents for the property.
+ * @length: Length of contents.
+ *
+ * This function will destroy the old property blob for the given property,
+ * and will create a new property blob with the values passed to this function.
+ *
+ * The new property blob will be committed when you call igt_display_commit(),
+ * igt_display_commit2() or igt_display_commit_atomic().
+ */
+void
+igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_colorop_properties prop, const void *ptr, size_t length)
+{
+	igt_display_t *display = colorop->plane->pipe->display;
+	uint64_t *blob = &colorop->values[prop];
+	uint32_t blob_id = 0;
+
+	if (*blob != 0)
+		igt_assert(drmModeDestroyPropertyBlob(display->drm_fd,
+						      *blob) == 0);
+
+	if (length > 0)
+		igt_assert(drmModeCreatePropertyBlob(display->drm_fd,
+						     ptr, length, &blob_id) == 0);
+
+	*blob = blob_id;
+	igt_colorop_set_prop_changed(colorop, prop);
+}
+
 /**
  * igt_colorop_try_prop_enum:
  * @colorop: Target colorop.
diff --git a/lib/igt_kms.h b/lib/igt_kms.h
index 3b4f8dbaee20..72880609ddaf 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -353,6 +353,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
@@ -850,12 +851,15 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
 				    enum igt_atomic_plane_properties prop,
 				    const char *val);
 
-
+extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
+					enum igt_atomic_plane_properties prop,
+					const void *ptr, size_t length);
 
 extern bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop);
 
 extern void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop);
 
+
 /**
  * igt_colorop_has_prop:
  * @colorop: colorop to check.
@@ -897,9 +901,9 @@ extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
 				      enum igt_atomic_colorop_properties prop,
 				      const char *val);
 
-extern void igt_plane_replace_prop_blob(igt_plane_t *plane,
-					enum igt_atomic_plane_properties prop,
-					const void *ptr, size_t length);
+extern void igt_colorop_replace_prop_blob(igt_colorop_t *colorop,
+					  enum igt_atomic_colorop_properties prop,
+					  const void *ptr, size_t length);
 
 extern bool igt_plane_check_prop_is_mutable(igt_plane_t *plane,
 					    enum igt_atomic_plane_properties igt_prop);
-- 
2.46.0

