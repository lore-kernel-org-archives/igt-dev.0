Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF3CCA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:11:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8663410EA21;
	Fri, 15 Aug 2025 04:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2c/g6fh/";
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2050.outbound.protection.outlook.com [40.107.96.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 288E510EA42
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:11:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfM3u4onvvpnJn22Kor8rrlM4ZRDkF/1dwjj3a4Wz9Fzr/twQMcug6M5C1bJbzn5aAl8AzqCIh2qbBIek9u86ZtPiAmikK5v0AOi8+EVniav831JFwxJHRq8iypbjjamWyCGu+J3p6VFzRnfBhZdwtSIn1NXNebXbhceTN80YOMf/rEWqGg7IXTew0cNPRUC3+08zXuJTg4o02MJj//elMq5dYy9bblePyWcwjfthkTbjaVStmkWRoaGhPaSkhHjKQOttQ0JnGp+Ve+rD5mfQGAN9hat6HO9VPukiH0ygyJ3EGWrilTEZdljDTctSuyOgZFrnIrUTAzNOKkmFz/5eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e7FDY5kybIrXHPQujXjInPazaGBh7r8FcXYOr7xpQsU=;
 b=DnQneDYTFwwJuiQN73FVGhbygsm8NM6BfBTaaYWkMSH2D6ArbYCKLUbmQrKDYyseBAv9KNE10g4CLmZpcz5I2YvS72ZsxlT6ES5YwJDy+GWhg/PzaU0ro5OIAux6mxe5lpCwb7rijpopkl12K3dTe8FD3mcgD7ojZTX7sq0SbRxOtKXcZggVh1cbTaHOKgGTklD0vgTJg1+lxbcRyGz04fz1S6MZDOq9PGxjqrwxPnTfBFHNaUmw0WCZvPqeCex4ZQR2nboiNHRTy2/duB7itsV1nugE09CR5HZafwxuwXz3x+GBRddyV1fTwT+QKRXGPEn+ealxVfbKJ2owoA52mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e7FDY5kybIrXHPQujXjInPazaGBh7r8FcXYOr7xpQsU=;
 b=2c/g6fh/L6CqouVSTe6+q7h0ZVUAYYbOinc3e0mvk3iHlRSpxDWp1mQHircLymLB1dher5/KTwAa76zBVj7v1l9ekzJNIotycvFxO7vSSap7iyrhLEVZvaklRMEnZoKuKfMlMUYiNo7pJJtTDttYcWilvOt0bUOLTlinmUSVHm0=
Received: from BY5PR13CA0016.namprd13.prod.outlook.com (2603:10b6:a03:180::29)
 by MN0PR12MB6247.namprd12.prod.outlook.com (2603:10b6:208:3c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:11:28 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::fb) by BY5PR13CA0016.outlook.office365.com
 (2603:10b6:a03:180::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 04:11:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:11:27 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:11:26 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 21/30] lib/igt_color: add BT2020/BT709 transfer functions
Date: Thu, 14 Aug 2025 22:06:50 -0600
Message-ID: <20250815040659.3321102-22-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|MN0PR12MB6247:EE_
X-MS-Office365-Filtering-Correlation-Id: bef3ba56-3928-4b17-07ad-08dddbb1ce7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CWMUXXDIXDyxKKrirapVNTtZG1VxWPJgCvOiraiOV//6piokSE1Oe2mw7TLp?=
 =?us-ascii?Q?+X6/mWirWZMFB4ZuIT1haOYX0EPQe0O2L/y7m/MGa+6ZrY1Myw9aRzRhQACG?=
 =?us-ascii?Q?kjorMOQ52xWmIaEJ/5vgMDnmwAtIwAgA4t1Y/iROGSkNpenWVuBzWX+/efri?=
 =?us-ascii?Q?tRrFtHfEdc5ayH5EVHcMqqLFXV74ECkNI6x2inGwj+llbRV8Egy8slPZV+j4?=
 =?us-ascii?Q?HCpdT6zEyA1n2bCLhxe+iAAFgTg0pBnSWO96LEMANfse9NqqJRwdJh+XrL6L?=
 =?us-ascii?Q?vSA7zYYcsMP0y2tbwXXhquBvUTrM1iMDeeffozdn3uLZtrS4yLSqUlNCj0xA?=
 =?us-ascii?Q?sqFWkAElUu2NCWV/4YJ4YQRQ0MwTgh92DnfItdr+7g7JM+0k20gL9Yn4D+fW?=
 =?us-ascii?Q?6MBNJv6okluFx5nAi66HzRoTFCuSzOZ2JU6k8ojC9FFSAuILMdlyjlhq2d6i?=
 =?us-ascii?Q?0JpmhHQ0eg0qf73Q4xZ8fUWugY6l1osFcxjdSra1hamKMgICVQFQqoR+acjK?=
 =?us-ascii?Q?Fjy26/pEaMEyT6hToj9FLveLbTKYCgakVeTgqsHN3l5wvRpP5Wvrk8KvEzJm?=
 =?us-ascii?Q?7VyXQLNJ2geseETrkTY5LMsRZH0ZmYHNDRHPGc4nVYZsioUZSJq/ZET94jLu?=
 =?us-ascii?Q?RXwtaN0c4Q/EEywMVTAc9p9VFRl0hL71BDWZdnu8N/wm6cgLKnlAl1RYACaa?=
 =?us-ascii?Q?bKdgb5ReikQG8DGJazZG6YlQeh2wqmFxay+niKu9Aq2A/EcKqUafpMus1+QC?=
 =?us-ascii?Q?/0ep2pbZjeOKbxDOfxVhmxWi1Pd3F9FnFXebq2Dz67knMGckw51PTtOfJJWX?=
 =?us-ascii?Q?9joqNZeuERKP+8rjvnYCsEEx4z0IVUVpBVY9h3GiCzJmHry13juP9yXKGARe?=
 =?us-ascii?Q?KmvR7KOXsj+L++EFGsrbRrDRK+Jfug7rEYsvTsv0M4eQdYtu9CLHTn47MAqd?=
 =?us-ascii?Q?aMpE1nVYy/hewY3vQ6Mq2NbGfWr3pnzeYtn2ZTfrEqIseMKBi6oWYHk/XYgt?=
 =?us-ascii?Q?GhNYatVfxv10O/+iaYx7KGzzxCXdxk9TGOh2sJPSXOy5W4J/ZeiGv3MQeu0A?=
 =?us-ascii?Q?jDTqP0jcoQGdZ7BVe4aokKUIkdCp8uELfU43U1g/jnDtEITvI6HDw89lQNuo?=
 =?us-ascii?Q?YXSaZ1xnSQduf8rXQDan4Q7EzRXLUGJIyw2YoNoO3/Jt7kiMRUDcmGNhtV+y?=
 =?us-ascii?Q?keD/wh5PON+R7oAxJupl7AKPdwNakZBWJRJynjL13naD5tH3DtH8koiwvGxH?=
 =?us-ascii?Q?VRMSnww69GbyVKzO74R6pwQe84UCornBvduitZsd5xpCcdAhO7drAj2242np?=
 =?us-ascii?Q?542xCBHJ+xZvWC9DFUe5U5mkgsP3G6SJNVlzB4m9AG5ninABOhGnp+3WS+7c?=
 =?us-ascii?Q?DG1SMR492DlbxAiPGW5cQB3il6gbqnVaRibRtSi2CQcqNEgIIkFN4q88AWNk?=
 =?us-ascii?Q?DfBFkMPUs3/Ot6hoRE2BpHXCRNhAdhpKqaaRIOrkgMoCi4Qvf0dQc+f/7YqR?=
 =?us-ascii?Q?lLUv1skcvHf74SHwyf0OelP2kTUeGx77nfuf?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:11:27.4913 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bef3ba56-3928-4b17-07ad-08dddbb1ce7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6247
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

BT.709 and BT.2020 transfer functions are identical, the
only difference beind that BT.2020 is defined with a higher
precision for 10 and 12 bpc encodings.

These transfer functions are defined as OETFs, not EOTFs,
so we create functions for them as OETF and its inverse.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 10 ++++++++++
 lib/igt_color.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 106b54e9d..6a639813f 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -113,6 +113,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
 	igt_color_inv_tf(pixel, &srgb_eotf);
 }
 
+void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel)
+{
+	igt_color_tf(pixel, &bt2020_inv_oetf);
+}
+
+void igt_color_bt2020_oetf(igt_pixel_t *pixel)
+{
+	igt_color_inv_tf(pixel, &bt2020_inv_oetf);
+}
+
 void igt_color_pq_eotf(igt_pixel_t *pixel)
 {
 	tf_pq(pixel, &pq_eotf);
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 7e429a98f..9f56536a3 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -27,6 +27,7 @@ struct igt_color_tf_pq {
 
 
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
 
 const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
 
@@ -104,6 +105,9 @@ void igt_color_pq_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_eotf(igt_pixel_t *pixel);
 
+void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel);
+void igt_color_bt2020_oetf(igt_pixel_t *pixel);
+
 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
-- 
2.43.0

