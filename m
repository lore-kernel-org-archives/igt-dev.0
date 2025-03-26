Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6061BC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:42:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1187410E793;
	Wed, 26 Mar 2025 23:42:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OkidHit6";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9989310E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:42:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qgtTrvCndyHzfnPsTevbSp3/BWRen7PzkWR6k0DsfpY1lfttv/Iom4Z3JauDU2V9mOXuwKMs1Gg4OYl+nlNkOhH9k0G3SQWNqD3QAD+3M8D5xHFnVpVEql7wv6m/iX3q+QIomXLjRJjB6A2PfM7aYmbeVKshgpbT4jFqrrMEUBtvrlY24xU4PlqFujDFCr08dEbKOXFfjs6Kx0ZlFGul9tOx0RySHORBPEcR99ii6PshEH4RUwbyViWkSgNt+0OnwadSUwhXgQUWul+lmR8hwZfGs0NzdiHq5a4dJezwo60grSO0n9OyvRB3nNISF71Qjum2cvEOVifGUTiPUNrwVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gn9chFbfJHNbkjbwOArXqSLTQtDf4BJ8fmh0GXT1YA0=;
 b=wbK3tzZta5akl04A8jp9j1b/8sXFsM32s1+Eb5MGppxPX5pHOQv6TKM6gUWvYyjjKijpRNrDXp2nYsPn79cgk9UT1Ryp1BWmt97XO+Wa3pknKMywe3AyYYDujW6tEmUWIptNAbzZUvxB0LXWN6jn7UyOC/LoijMI54dac55ck8LjkWxxspUXQ3JmlqLnn0u/wGGhuM29MgNmsuntGQK+cY0s+gDHTPN7y35e9mKuhKXIkRaHFaYUHRZ3N3tvaA5S4me+D08HO07tNd6RjgURSBzMyoRzHNlM1eq2k8CGnNefxqmzkmzX9nINA/yMGC4+0RCvU6IJMt+iuS03YAO7/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gn9chFbfJHNbkjbwOArXqSLTQtDf4BJ8fmh0GXT1YA0=;
 b=OkidHit6bKUFAIX7yjqdjRYSGAw+md9So1WWPvE3li8GJy8GJzXN0+TbcjfKhjLINrs3AxlKURCzLS6ymuSOpdXZwvi9BXJAFGNWNJ0ZAd+APr1kDBNTqQJfLtpAWFHbsYJYxiTveWYwqxgPmPgDh4iTuFnYibVsonhaYv6Jxp4=
Received: from BL0PR1501CA0030.namprd15.prod.outlook.com
 (2603:10b6:207:17::43) by SJ1PR12MB6025.namprd12.prod.outlook.com
 (2603:10b6:a03:48c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:42:09 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::9f) by BL0PR1501CA0030.outlook.office365.com
 (2603:10b6:207:17::43) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Wed,
 26 Mar 2025 23:42:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:42:08 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:42:08 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 13/37] lib/igt_kms: Add support for DATA colorop property
Date: Wed, 26 Mar 2025 17:35:45 -0600
Message-ID: <20250326233609.2980110-14-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|SJ1PR12MB6025:EE_
X-MS-Office365-Filtering-Correlation-Id: ab63a6e7-b485-4068-0746-08dd6cbfd2e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?n9QzkScCeiCuN5evJ5ep1CRdrA2Nox3CjPqeG6Ks+S6hJVplcsSkJqFCBi+m?=
 =?us-ascii?Q?m9/ve5rDduE2KRm4BPciJVmWNk7nUHJO5S8jaMwVh1bpJmtCtxSG+13tsfu3?=
 =?us-ascii?Q?YdDb0CV/7yiwLTfRYwqaQWKvgbbhihO/Qq9W83Lt9Jng1BV43um+7qryrSPZ?=
 =?us-ascii?Q?PXQef9VJpe4Y2dz7uDClKyfdnmRSjL9XZHC4oDVLjuI843TTPUjbOp7Rm9xr?=
 =?us-ascii?Q?jFwX3/x9LjX49e+nCog3P+zY51hZmLkms1SIQPaxGFJS2J6mEuDSJX8p+Mm4?=
 =?us-ascii?Q?Ro6uJ1FwuQHFE10IK2IUgbhMgZDbc5Jbmd+3mBCwpFPfQgkrh09mM+WMDJCa?=
 =?us-ascii?Q?T0zeLiPo/j9s1mJRwiSIhmcij7C1yQ6P61uJHmGZj5QVs7ZE5epURdYyuH8l?=
 =?us-ascii?Q?hlHXdVh97Vb2zECwm/doZ640OmezY4q2POAyOKzcpLoBZa4/uJ2F2nOsbDzv?=
 =?us-ascii?Q?PpO5TtVQqcFgGBDu79ThYTOhTHQp1TQhwCoLCmBOHPWZ1xj0ixSvWrRGYi1+?=
 =?us-ascii?Q?5Z6PnIsEE6HlGDRIF/T2H11Dr7E9VjUlzrkEsH/Jn38ij/fPfJfXH61NhlYw?=
 =?us-ascii?Q?dny7NfEKtFbYFU59edBc5QQIT/63evriqvWva/QK4LdNZhfwitopeXXUdJbd?=
 =?us-ascii?Q?aaGPCy2hEX+/Hj/gIiCcRBBCdZKJ8M8YBJZD6E43fRGqMuoLARKlX6lFv/dj?=
 =?us-ascii?Q?Zc5641nyK5z9f18LWHMniKh3I0ZdNzyxkKQePd9eFZpqwHrimPhnAfDtZYDx?=
 =?us-ascii?Q?iTvfQKMMTGOCWgAKzEkkILlb61aOhHItq48ebrN8NM+pKbKXg+hormVcpq/8?=
 =?us-ascii?Q?3ra+Q1viypKeE+MLyX1grsFVFu3adINcTfLl+a/F3ERYFYcL6z9Ve8IWimMl?=
 =?us-ascii?Q?t4YgKszIRgEQtc4pSzHuCyDF9CD8HxJlzQ+e2YStSV1L8k2kqBa+t85mHd27?=
 =?us-ascii?Q?W+Sm/7WGMB+eWD7+n6INP9t84v1Iw8uI90EZ1XQefJAcrG0bxH4PVqwdkuw0?=
 =?us-ascii?Q?okRQUESxJmlTM00C75WCTXAQtuE02Nyd81KvWUiaK1azpDGJxnOU6WfgP7Pq?=
 =?us-ascii?Q?lIpfc09/EvM87k3c0IAuX/DyXZnwmMzHUSYwY1d+MGi2AmWflNhG366MKaUQ?=
 =?us-ascii?Q?9Y/Qzwvm0P/BFJoEAreh2Kp+9frEPQdI+cXu6qSvbnd4ZnVQF0CiBR3LC3RB?=
 =?us-ascii?Q?aHi5c6W4vS13t+NfaOyc8W+pxFykJZoaouVN5Ke9gPi9vKsSgxC+TMt6G8Qt?=
 =?us-ascii?Q?KujUFYp0j/q3pDK26iT244w35mKViJ1C4npFOWDk9U19ePg1JFnksXBcNaCG?=
 =?us-ascii?Q?rY+ARlalG7EAH8XPk439bf3T0COmNWV2Nc1yPfscLtDe4TTmi8tM1dO7E6In?=
 =?us-ascii?Q?3wocnFiwuyCNCsnIww/Z9GFfyGYY1gJSoyfaXRBZjycFFueHlb/FbnwgqpIQ?=
 =?us-ascii?Q?FTX0DHl+Yz+XcmDcNXAp2QpcmpXxT0UNk3tFKw3+nO9gUdjj0abvEw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:42:08.8722 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab63a6e7-b485-4068-0746-08dd6cbfd2e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6025
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
 lib/igt_kms.c | 33 +++++++++++++++++++++++++++++++++
 lib/igt_kms.h | 12 ++++++++----
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 3f0ad25ce..648f903c4 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -709,6 +709,7 @@ const char * const igt_colorop_prop_names[IGT_NUM_COLOROP_PROPS] = {
 	[IGT_COLOROP_TYPE] = "TYPE",
 	[IGT_COLOROP_BYPASS] = "BYPASS",
 	[IGT_COLOROP_CURVE_1D_TYPE] = "CURVE_1D_TYPE",
+	[IGT_COLOROP_DATA] = "DATA",
 	[IGT_COLOROP_NEXT] = "NEXT",
 };
 
@@ -4452,6 +4453,38 @@ igt_plane_replace_prop_blob(igt_plane_t *plane, enum igt_atomic_plane_properties
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
index 04a96f47a..580f21141 100644
--- a/lib/igt_kms.h
+++ b/lib/igt_kms.h
@@ -373,6 +373,7 @@ enum igt_atomic_colorop_properties {
 	IGT_COLOROP_TYPE,
 	IGT_COLOROP_BYPASS,
 	IGT_COLOROP_CURVE_1D_TYPE,
+	IGT_COLOROP_DATA,
 	IGT_COLOROP_NEXT,
 	IGT_NUM_COLOROP_PROPS
 };
@@ -881,12 +882,15 @@ extern void igt_plane_set_prop_enum(igt_plane_t *plane,
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
@@ -928,9 +932,9 @@ extern void igt_colorop_set_prop_enum(igt_colorop_t *colorop,
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

