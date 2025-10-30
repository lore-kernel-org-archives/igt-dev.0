Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC8CCCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:30:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B8E10E8A8;
	Thu, 30 Oct 2025 04:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uZZM83nr";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010048.outbound.protection.outlook.com
 [52.101.193.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B75E10E8F9
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:30:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BvlSScBtI33cxMKMDYecq69HaZhAt0aDvNNFyfDDpmkvnIKOJodPxWJRPyFHoiseZFiii26Wv0BLhmfwYX1//SvYCV3918tdlEBRtPtmNiSTakUXO2hbf4rmZRq+qC9zJtjJGmpybK6rgejo5pe34mgIR8YcrhkGCE70Geh78fWcsnXjr84ZvbdaPDiEV6u+7DsdaGg0em9NMEYjwnTZ3h7WBE07gE7IMJ+TOP1sLAJhSI1DPLs69w/H/RQPNTcrjd0v0pIG9RmsNu3hSkVDlQpPfQHtxqM1gFxP5FL6bhHEYtG38BqtwiZtFkFDInPbQT+TeFJm7QTJpE32+Eci+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/xI91upP8ZnfLMsIOvJHr+1UPnYnCROHWuDI8KcYxM=;
 b=sJnU8xWGQzBDpbj2puO8ziAx/4/hhU6ntNxPnGhSPR++jkRACCZOdyo9ArSVVeeZI5oLnxhtknfB/F8EdG9cRUiXTsso8wX1mTzelSJA0Pts1e+H23YVDAbWNt8tCepz6/O+dVL3W9fnTWhfTRloCk6hjpX2kF2wtY9LyoMEsGbDkCqulDJxAY60g+erVugpG8QAIp2OMKiE16sA8u83w0teWZvzAQNBtKfQNNQBI9P0bzK4w1rlpigL7fE7AzMeM7PlRqn2ClloFH4oj8ZsddCkp+b8drUKyW3JHG4JtrFlP/t5dxRtJAqecC8vJ1Qy6gjdHr8BmHLecAOP5pR7vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/xI91upP8ZnfLMsIOvJHr+1UPnYnCROHWuDI8KcYxM=;
 b=uZZM83nrB8dgpqwXGprK+D6LQ3Wt3hmZvQHxOCLXQfmfAgspejbvzHchlZHm4RpCiHzjrrV/Bx4t3mUcODE1QhMWfXMr/UyjI7ckgN+xW2lhJhLDkTTCwgUPHbY68ahzHsQjXJe202CaPqaReMlibUwiOl9/hVHn4JTWInfbqgg=
Received: from PH7P220CA0151.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:33b::11)
 by SA1PR12MB9546.namprd12.prod.outlook.com (2603:10b6:806:459::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 04:30:46 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:33b:cafe::4) by PH7P220CA0151.outlook.office365.com
 (2603:10b6:510:33b::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:30:45 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:30:43 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 12/32] lib/igt_kms: Add support for DATA colorop property
Date: Wed, 29 Oct 2025 22:27:41 -0600
Message-ID: <20251030042801.2315866-13-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|SA1PR12MB9546:EE_
X-MS-Office365-Filtering-Correlation-Id: 014d4c51-b466-4547-9170-08de176d183e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4wiYJQc71EzpLcbfx8AvW/fP2T+QNmWepGhlRMrtGT87/EfeRHiVECPZhHNv?=
 =?us-ascii?Q?9s2WRKOtcEIMjsufMyU1NpC2OHgvKHx84A54rqnASVhciICnMx7gsqlo4QCl?=
 =?us-ascii?Q?ud4+Szsw88QmkXrQDV/qpx79zP0lGiflpN3jmuQa83wkyn21YdqtiAqUvdUn?=
 =?us-ascii?Q?zeKiUDQJptcUqq8e1NCOEgISUaLoKz4kaFENH6bKthIXY40IQoWaTOIG4nQB?=
 =?us-ascii?Q?2IIkH+oJlwjGKB43lnUSKHmAv8I0ZwEO+Hbnk17oSc7o/F64AUbKyMkSNnyv?=
 =?us-ascii?Q?Mp9BC6M43yQF5Bw5PPtwr3acueo5guy6fNdQ9OdB+dFuYh9NiWPtC2ikG+sS?=
 =?us-ascii?Q?BTZGEHgwQB5pk06AsWH+uCU401nhYQesrrGIkOgLxt4QZi3r+9cIjbppdM/1?=
 =?us-ascii?Q?Gsb/Grrefpc8aajBWEFMWf8GEacIgI0/C5pKwpsM3/dUhgIPXTTrKPeSiA3h?=
 =?us-ascii?Q?8a4uqsMV+qjd0Xi/JR6IrD/SM84UqaKTpmVK5Erw36b20iq1jGu+apud8mHF?=
 =?us-ascii?Q?+msoG/NcC9CBIkrWQSc89aMCarMjBGF5jv6mQoxkhSG69ClOR+acYp5CmNLR?=
 =?us-ascii?Q?0d63NIJEjfFGSZAn+c6ClTF9TOutaaOH2cCtoncFKSmBSkg4U7OewZr7oTm0?=
 =?us-ascii?Q?uUF4Ukmf6uN9gs0N78gqlaC6ox/WIpddxnr4EoFSOcqxo3YPxYLCPDt0v8Hy?=
 =?us-ascii?Q?v+rppQIEVPET6j43dVekTeXsyAwYnqcB9COzZiin67p8yTg3hwxbyIt6+E36?=
 =?us-ascii?Q?c782LVtYX1tawnGxM7auKtEo85ISKLzw4ext/9/PiQvCCjW3QWCdbEwtyGgB?=
 =?us-ascii?Q?UtZjzEFMzXuv5EJY/ghZEpFirr2RaVdLQqOvvSvOOWQM6eKMpYeJUGcRh0gb?=
 =?us-ascii?Q?Daclt66AAOoKwDDDzwuz4jxlF6LKL6JVK3YmtXefV5ac001oy9SQTLlmKGI4?=
 =?us-ascii?Q?rr9j46kYfxEoprub0dCcZwo7GHmi01naz3HirHuuDPJ1OEgBPTXJauscfA9A?=
 =?us-ascii?Q?SOZ5GO+g98PkeFIPMDQCJdpA57SLE7/poV9V/PZpnIp2NB4t2W2Tet9m9fAi?=
 =?us-ascii?Q?vebPcYAA1Kxl4OU5ZqscCJNZyrP9lbZh6xT+2NhAyE72nLtoZDYeRYPRaT6S?=
 =?us-ascii?Q?t5oyEVTNGHtp6X4UmmP2m66HNmuG76Z0xrpsGxRN102Zwwj4g2KOsIMYR7+T?=
 =?us-ascii?Q?0+2SUnbWra6gHejzwyhdCK2ATQAD5/YYElKewCA3tW21ZpY152GeTWm8py8L?=
 =?us-ascii?Q?4592HO9DWgMbd0yLW+utDz9itzkYyJinM1kmKeJ4MKaCa/th7XVDuwij1mfk?=
 =?us-ascii?Q?A98d0nhQJ5/bwhKxcomHD20jaIDoz66IhFdHn36waeIUkdwz+F6VHu3Vusxt?=
 =?us-ascii?Q?yNTl8gsjf105xL/68MThziLO+eFSdq3qKo9XZqwOp7xgaw00WHuc10ko1e0W?=
 =?us-ascii?Q?OFce3ezcv99L6ETf9D9gkg/n6OmZmRPb0rug8+qVlpetqQ1Ar3oB8FM+yg8i?=
 =?us-ascii?Q?NOZXphqoFAWXTnP4cqY8f4bQUZkQCYCwt7z1d2Cl7YQVVfIzlOfd7lfJUDw/?=
 =?us-ascii?Q?8T2bYE4faNoDaOnDfq4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:30:45.8199 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 014d4c51-b466-4547-9170-08de176d183e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9546
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
index 94664348c..9ec15f30e 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -710,6 +710,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
@@ -4453,6 +4454,38 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
index 24895985f..e0bf9a663 100644
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

