Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85859CEACF9
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:21:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 396E810EBF2;
	Sat, 15 Nov 2025 00:21:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0Z+qYp7v";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012020.outbound.protection.outlook.com [52.101.43.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDF810EBF2
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:21:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ivC5UJxyd9FlquJ6QKhXVPGjYaM4RyGOH5V0Mj1QhhiwzYtT8cbID/uL9dx7pF5HGtv+sAy17wRmzkV8KQdSq/agOtPVUkaHiArfP+ox0bE5K+yXlKHfWjmv9h0S5bE2Zb2r3sgeYDQ9RUDSSCdbjx+1kn+TjvoWbvVcOqmL2aF80G/8p5thMoP0SYJPjswJCPvXyE+POzP3p4wR1Vv5/N9KPJQgmPBUSUTXQtP5An3bNaCC05nPvx+3io5Gsi1yWS453z4gDAJrAO1WboTyOTc6tGjfgViv4bof5gvZOhPFBFNl2vn6wF++6n9lKqXJGceLKgU1T+u+pLv6cGmCxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1Zp9lyB3BBKveQgDfEL1/5XxM5pYon+swKwLsxtKCM=;
 b=w3iFk/tXm202uUwAdzM6twS0eL8RgD4M1BIHLtldgqDKbfRzV96gml8ezn73HUzYbN2emClYvL/+BAYEpq5zUfC0Ya65NmPqL2S7ctthApFoqECGuKThxY0WN+XV8a9VU78rZRTabzWGLrC8TArqw4oBW+E6vBKLiQAoLre3qA2PaHUdHoIrrK0Mn3TFdUyx5H6BDRm3W1nFPVFuyboPERIoiBuymUERVe+e8TasGtX8c+rX9P/dwNhYV2wCBBU4VgkiJ+GVhP2ngubSW5izqZO+StHenY66353ZNSD0ur5YakH+eJO0Cl/YTKD4P4W9LnqPgGEo/fklhYLPfcFjmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1Zp9lyB3BBKveQgDfEL1/5XxM5pYon+swKwLsxtKCM=;
 b=0Z+qYp7vQe340rpHn4tazQaIJ9tUCs9/f1/X7PelWdtckpTEh5Dimrm1nLKz5QJSBBuYRwDor+GxSp+bVsX7EHP1ay/8LI1shhYFwd7NmB2uwLh7DXq59UarNUFGcGk+UgUn6L38phWmADbBuG7JZ6cgoU+UrbZcmUHaQjALR3Q=
Received: from MN0P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:52a::7)
 by DS5PPF5A66AFD1C.namprd12.prod.outlook.com (2603:10b6:f:fc00::64d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:21:18 +0000
Received: from BL6PEPF0001AB51.namprd04.prod.outlook.com
 (2603:10b6:208:52a:cafe::de) by MN0P221CA0001.outlook.office365.com
 (2603:10b6:208:52a::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Sat,
 15 Nov 2025 00:21:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB51.mail.protection.outlook.com (10.167.242.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:21:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:21:16 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 12/32] lib/igt_kms: Add support for DATA colorop property
Date: Fri, 14 Nov 2025 17:18:21 -0700
Message-ID: <20251115001841.3563993-13-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB51:EE_|DS5PPF5A66AFD1C:EE_
X-MS-Office365-Filtering-Correlation-Id: 55519ec2-3d18-49b9-4e37-08de23dce4e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wTrhuu7FNhwwTQnp4spcJU6hbMa3jVE0Pms6jI8DRcpWTaiTDnaWiKktHOzX?=
 =?us-ascii?Q?bIpT3KVj34+HUlLtsRMOH8aQaNhRyG+cmsbJi/t6/Yjf9XZVoVwnxS2KZrH6?=
 =?us-ascii?Q?irKc47rF4LantSoIfJoPOimQMet9UUYH6dcAtVKAwXtNX+1aW8Xyo8MDRkUY?=
 =?us-ascii?Q?VRyd1K5mVWPX2TDEX7bWw8nTz53f3K8kex7XLWaYEccDcfA9eYX1JxlOzC5g?=
 =?us-ascii?Q?sYSAm6Tf26IvWn3P8Y8QnRpeEUQ1Ci/4NsgNSfvU5HyW0o4F+A/0NsS4vtvU?=
 =?us-ascii?Q?IZo7KGL+Jr48ANDMtthDZqjr7sgzU7VhT7SmB2LV74U538A17iZ6nfWcHFTH?=
 =?us-ascii?Q?CJ47EfGZKtZwuRa5oxI7Q/6lTae3DSYTFnn3qt6khl956JKE1z81HpBcvDu3?=
 =?us-ascii?Q?FdhK0lGey2X1Z1IL2y51RK5mWyDOsAW655X5Su8sPj1vmYVJqEQm/dkJ8Iyf?=
 =?us-ascii?Q?MCZ5NyckgdIx/zqD6ygh+G25ZizrdeaX15wc592pe17v+WwaKuQirdd3t4vW?=
 =?us-ascii?Q?9i739jwJWE+gC7fITuJRYPhh3ZfINb/mpFuMEnTCUvtVJkQCEgldmwllXain?=
 =?us-ascii?Q?0DGHOrte5M6O1CDogTEHhWfDvFT2NX52crH5NVbY08YtCpqekM8qZ4sbC1lR?=
 =?us-ascii?Q?SAP8K4CINr+LIReeXCNRUrkRxE5f8if/Mk8X1vEW0CV8MYYi+J3Dn6zB9FSk?=
 =?us-ascii?Q?awNi51+6tDI1EiBtuT13fQElo6MV1OQrJiadEl2Nu5lGfDTpEdi5hSn5zdjk?=
 =?us-ascii?Q?5mPjmbT75bVDzcJX/zXVAdDZdz6p/e5KgCdj52DmEZoGLnIYySwpG9r1N7+o?=
 =?us-ascii?Q?E970AdC/crCi5T1jB3YH8HnED5H7msWelhGUT55hqktY6KrpUYeY+CoQ0d0Y?=
 =?us-ascii?Q?MLkUcb/kLO3SZ5cuKQKnAaYnyZYx+/nrc4oLVhGPf34pOvtG+DASJY8p78aX?=
 =?us-ascii?Q?FbnsCA3QFAP4+GfRgy4csYpbX8ABAfxS9DeS7IJoDG8IZODBaIBV9kxoy0Z7?=
 =?us-ascii?Q?St87mt9uAj/zM9RzzUSuZWIsCvAgW99V2OEOKLoBpo0xnjFQg7fA+qc2e3EK?=
 =?us-ascii?Q?ihLoEYJ9qsm1ZGZL9t4Q5Mma7Secl+bMMcOj2bYGr6bm4XSZPdzdTE7nrrRt?=
 =?us-ascii?Q?9RoA1Nr6FqAQsKOjPbElXhJRfPHGwGMw2C3LKIirU8e/U1hlcJYntqhMxbxv?=
 =?us-ascii?Q?UQ3n8MixJ1LZyJIeHSYL/bo5c6Mi9I9qqIyQ0u2n6kGZtEJN6TahrT2zqKvv?=
 =?us-ascii?Q?x+llEW2zLLyJgi/a1DcNe/hL1lGfzzqrz8VHelAOW7eCQZedgDrU3N3MpCGr?=
 =?us-ascii?Q?d72qm+ytFFniHP80jzYMRXA1cyYML0voOYr8pps4WubS9fBfPOhaBZ1PDvKu?=
 =?us-ascii?Q?HgPQimUBNr85HGSuKUmUspXo0F/D9/TRUUmGbE8LYuKiXQmc8TGxb1HMow7V?=
 =?us-ascii?Q?0xWZ4aPdAntHwc+1G9vkJ1th+vuq+ZO10N+WojFnbl7Sqi7m6YMykf2WrUha?=
 =?us-ascii?Q?0m28GNZkX+pfDppfRq5DzsHQaWdtZ9BzuyMGCaqofOwhPU2O+WYw5QcTzCBY?=
 =?us-ascii?Q?ktWli4xB2+XzqmbRcDU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:21:17.2895 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55519ec2-3d18-49b9-4e37-08de23dce4e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB51.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPF5A66AFD1C
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 12 ++++++++----
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7b7b8e310..8f23c6e32 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -710,6 +710,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
@@ -4475,6 +4476,38 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
index bdb5cf5e5..7475c1e13 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -376,6 +376,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
@@ -895,12 +896,15 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
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
@@ -942,9 +946,9 @@ extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
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

