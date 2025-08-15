Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F6C4CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E30E10E943;
	Fri, 15 Aug 2025 04:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mApA2gYP";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2054.outbound.protection.outlook.com [40.107.93.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591C110E943
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hfkfD0FdXgZ0j4WsWXhx5TIir+TzoMt2F4jxKKMz1KFbE9hQlZKudIZnElhkY3jLVns/+SmGqcfd74GMiQILOqKzm+N2zIWw46jT6R9CQHbGK+1fHGnZnbk3q70rGdvkRUBMCUmc2VZhxGvfwnR8oVWgdSTW9NtL7SxFlQ/ILxu8w9V8a+SgJ7c340MKDs9Cxs7Is8OOudwwHJTJn5VFCo5JQA8EkTfwmKnfHCjdz1OksUMhpHL7vt+6YC0ZubEKXSnNxQSbiT/1fDrx22YImXQxVJqJ+gi2v3drJnsbJ4dLPr/+182vXlmLOQOViNYHZkrrfMllN9JlEnoRxRT9bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tIxAk8pqbrWw9vucEd9o9mifEFfLSg/k7TwqdQbdt9A=;
 b=EJju4TarUS6cfroiC6wuimkgT6beV7mcrPwtl0ITMeIbUDANaRxnR1enLaEeNvk99F4QC4mccqxUW11s3g370i6hN++7Ge+z5caftdSLZ91anVV8lIYG7SXqtArVde6p5uA+h4t6HOoINRZjceHccd0O3PCAX3PCP8/OiBwyufIGJwAUv66f2DkJzT4/PFZNSMwqDpPFxRj3XeOvjHfeQjp40Gjip/ox+NMSjTuZYad0TmACE42XbwSU1BYGaPnal/h3Lempy8b1t1IvdcE0qi173jeqY/9nPJFTiQ6gpX1YkQ0gowB4aUQDEEyLwx+DgQr4s8UpWd0ZLe5KL6TBYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tIxAk8pqbrWw9vucEd9o9mifEFfLSg/k7TwqdQbdt9A=;
 b=mApA2gYPs0Rhv/e93ecg+57CSnDI3EDbQGokm0AsugyBYCDhSvjmn3hYN9/AKEjRpVfyFP3fRrdz/kX+YugyxTPQOK4h8zLsUQMhnJHT0xhrGu6bwd7peWa9yz3cWQ5uEZdWtx+qZn/dSDJvbfB2W2gc1Ma4QfmQqcFE/o9+jo0=
Received: from SJ0PR03CA0067.namprd03.prod.outlook.com (2603:10b6:a03:331::12)
 by LV8PR12MB9690.namprd12.prod.outlook.com (2603:10b6:408:296::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 04:09:16 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:a03:331:cafe::b2) by SJ0PR03CA0067.outlook.office365.com
 (2603:10b6:a03:331::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:09:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:09:15 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:09:14 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 10/30] lib/igt_kms: Add support for DATA colorop property
Date: Thu, 14 Aug 2025 22:06:39 -0600
Message-ID: <20250815040659.3321102-11-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|LV8PR12MB9690:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edd36ff-21cc-424b-8749-08dddbb17fc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SDq/331ZoGNgz1XK2s3vUJox6N4mpoDh2nDMvNTPljT1mxLuJuhGIWbwmhBq?=
 =?us-ascii?Q?ukYtLdn5WuR6vfriPS4QM5AKTMOTRyZbjPiOE1SyIDlYyJzRP1ZQVRtUvKzi?=
 =?us-ascii?Q?FtEiaDYJgn13S8ckZ8rG8HeQXmpZfg3n9WDMRitznZVhs5YtwfTLuY5TkMLT?=
 =?us-ascii?Q?6lqou/MSeQ5KuUsDLAn6p54+NY5GaZemsbSJko+ePGwNCMniRPUVmj7eBKPW?=
 =?us-ascii?Q?5WcVOJYB0svy9zGIP7+yycvAZ+XaDmoyhB68nldXtJxXYpxndjKWhtbUoOu8?=
 =?us-ascii?Q?O0LWOfDXhqBJ5KN3XyHxVlOFFUMEXUayRazVWHU5vmhB3ild8GxFtMKfBZ9Z?=
 =?us-ascii?Q?8RaUWi54v6lhSWVX0xj5m+a98yZcmaRdIa4ESkSFeYxX4BxMKVE0UGGsMbAU?=
 =?us-ascii?Q?rp39Zh0u2fS8KnCU6BJvNzeA6Qk83fzBfL47YxY49AJTP0doaBP8glZcO0J3?=
 =?us-ascii?Q?kdhdSFyoBgA+igYtmZCDK+KKbJmnHZtfUVqqCxOLabDbXN+IRMg908Q1Axj3?=
 =?us-ascii?Q?0ecvnMCW/TZTGcmdzg4SVZy07On7FCsOxqFjIP8XrWy5oROHIPg9/RMl7QWG?=
 =?us-ascii?Q?4sf4IQj0QMX0jAtfcJ3FwILGxL+ch6J7lBz0IEX4+3w6j5LgOquCphL9XG3H?=
 =?us-ascii?Q?4P/BapVL3iG+jGXRRiMLRcNA420hZf0FyQjvz/Wucqb/3pEp799JvNDDPd1N?=
 =?us-ascii?Q?XhEtbfJBDW9/wvnchX3Rih4CijyYNwgfyJQhTRJbU8UH9PCwsRieA0aPThC4?=
 =?us-ascii?Q?CD+s28a2QukOaJaZIZkiWTS0/aQS1F6D8LhzgoGgJlhjnlsON/WRDKowNOdW?=
 =?us-ascii?Q?AfEBtRXFVmma9SZb9CTv2J2guNLzbkUrGRlg/lATdsqOcN50WcehPWOsz+yv?=
 =?us-ascii?Q?YwtVmbuXBCk8Zwqi7YWgYAfAE/bn3BwgtRV1ZhvM5jHPQuAuJy6irrIj/mh6?=
 =?us-ascii?Q?l1aJRFa/EiG0qWWQ157zyhk3p4PvY0Dyk+WA8mBFj1DoWtUA1Dxw54mbnp4D?=
 =?us-ascii?Q?Xuttj0D/vkXs3Ytvv6t0iOoSetp9F3wy3ckBtgDZ0/D9C7LU6ZBSUqf17HBT?=
 =?us-ascii?Q?76+8+LGPPTwU1gB7d2r6ZgJvraIo35h38VjPDVbg2l/rZ9UozLhnWNitlpio?=
 =?us-ascii?Q?QynP50fHSCxnglrP2ALNJXUIuMw0GQk1x50JqrC0QiKRZXGbrFMd5jehQItm?=
 =?us-ascii?Q?jLyClCdqttKKVO40sMdJ6sA28wQKRJnGtyVigEZEShcE6Yw5VWC41fTkkIdn?=
 =?us-ascii?Q?IKk4LbiyKM+8IpnLGY7PFP8iSxtW52aVOv2MpeBu3SEgJ+aeHF/v3SeTdnNO?=
 =?us-ascii?Q?5fXuELgXOZzfVA2jVHq8txeEzX/S2vLPi5r9NRIE1GkXSCB5Soy5K6NLsbvP?=
 =?us-ascii?Q?ILF9dCRXHNgqG1j/QfXPxI6tnalI5YE/JF/fGEB6gs/ZEd9HcF0z9/rkzndO?=
 =?us-ascii?Q?sbzoRU30HkJeEnjT7mYssH81RNYhSSuFYZ8mJM6s5GXsfSMemVh2q2x64hkA?=
 =?us-ascii?Q?VzlM2SZbyMdzIak+ae67NKxOBolNXIBhJkVW?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:09:15.4685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edd36ff-21cc-424b-8749-08dddbb17fc8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9690
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

Support DATA property in color pipeline API.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 12 ++++++++----
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 67be5240f..d1c23b4a4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -710,6 +710,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
@@ -4463,6 +4464,38 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
index dc2a2d9e0..2a401cd3b 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -374,6 +374,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
@@ -886,12 +887,15 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
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
@@ -933,9 +937,9 @@ extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
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
2.43.0

