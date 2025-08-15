Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76E7CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530B310EA97;
	Fri, 15 Aug 2025 04:13:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="h2AWuIBY";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A0A10EA97
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:13:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SL8C5ZU73IMAz1rxXaywNDVcQKhqpqjKZh5rBWH9LDZCmBgyWgsGlCE3vpgG/8OZcnlgYCTTtDXg9/JWMlXSX/tTr+6/Mucva2b6E0LowgZkMSQKogOTg8jfkfPetY4lAA4/dK/zaC4n28xYATEpjTua58lWiJzcv3nP9s2Oqw3N5bF5gs72knn/V7eg1MLN5m2wqQZKRIClM2/8XUiCDw87i7+q2IlYf4j3JNDkVURPt+KTPakDrUP1i7tACpDm8JdBskQqxFG6feRhghTpQxsILGpi/s9PTsJ0I0dsrItqsOX21b/U/ZofzQmpAavAFFWSm53XKTf/uN9j85HPAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ZO2mQ088NnFiksoMOl0vzE2p1valw41JkK+CQaxyP4=;
 b=PwAY1Vhhk0xhNDoroF8JovgAGBesW7oIrEU7gQH+HAgPdTgezWPxKxJjjk4NMCoLMDMYgmvtgKABqeho9YU5PX2Mtj7ROs3vCxDTmZxJryu3PXmswG8RrT9lM0iUueTvpldQkTCBUgqqu7sjAzuxJ3iGuMGrpJiSvURotFQaMwjicaVlwDgJQH+ueiYTMvMZYqqY7DQWxK4TRkAsq9zB1inzJGS6cxOVxVtxhMtBRTfjroOv/qIvxFfD/Bn/wnkwRs12Lc3JQKCRYCJ4oQ5oOh0lWzJZZjvYzMR+fohjA28rgYHqsRY2dMpgMRIuhnxxW4wmVi4ENg6KLMzsmLIk7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZO2mQ088NnFiksoMOl0vzE2p1valw41JkK+CQaxyP4=;
 b=h2AWuIBYeh1kUTemaFtPLg8yXZe4feVhpa4uO8HgjeXB3jR/KWYwlbk9t3S2THdjVxPaGfWCMOo7krCdKgAiILe08jPWOhpWBWzPxjaL56/ZWBque7Bd9YINqnkkvJ8SyYupmv+HxY76SjjOI4b5ipoMzQ/323/ZQTZup3Ypb8Q=
Received: from MW4PR03CA0042.namprd03.prod.outlook.com (2603:10b6:303:8e::17)
 by IA1PR12MB6601.namprd12.prod.outlook.com (2603:10b6:208:3a3::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 15 Aug
 2025 04:13:05 +0000
Received: from SJ1PEPF000026C5.namprd04.prod.outlook.com
 (2603:10b6:303:8e:cafe::f9) by MW4PR03CA0042.outlook.office365.com
 (2603:10b6:303:8e::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.18 via Frontend Transport; Fri,
 15 Aug 2025 04:13:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026C5.mail.protection.outlook.com (10.167.244.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:13:04 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:13:03 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 29/30] drm-uapi: Sync up definition with kernel colorop
 implementation
Date: Thu, 14 Aug 2025 22:06:58 -0600
Message-ID: <20250815040659.3321102-30-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C5:EE_|IA1PR12MB6601:EE_
X-MS-Office365-Filtering-Correlation-Id: de76b772-e0c4-4be2-c9a6-08dddbb20879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8CaMiLHc0gEsVVNWivCXbLuH3por4xvEhyXWbPX2fpyPqz4q11RDQVKNFakh?=
 =?us-ascii?Q?X606t5lpImyAe+JIX3WuAK4LhaLz2OjHsjeAl0ivV9keJ6f7mwaSIu/HHJW7?=
 =?us-ascii?Q?wtvVZrReOJZ3XsA/166e0KPJR+NAEVpu1o2gCXRTuq04lROPqExTRWz9qABX?=
 =?us-ascii?Q?KF/o0dl4r3LaxKBFM0dTg3Fw1N1y9vviGag6dG9I5YJh8N6Qt9NW3HqnL05Z?=
 =?us-ascii?Q?igPmFOmcO8BZHdiTxElXhHjgcpSxFtEKhD+K++Hgqlw1UeXCwanLo0bMBPs6?=
 =?us-ascii?Q?HxAscz7fIyjaHqduvKhQITNoN9dJalr5tkmRF0KHX5xGMUQSTg1+NjQPr4sy?=
 =?us-ascii?Q?1hcd8/OlilCfjGiVdqh9kzZdIUk/Z3k6RroS9nkpleczwk1RZgFRcKHUpon2?=
 =?us-ascii?Q?8I2EALcmJtRaBAbTQbGlY6ZcrztphQ9Q3M6uSWnLmrE7b7WbWiJq69KSDQiz?=
 =?us-ascii?Q?I+DNdeNgOj75YnZmzNij3AliCvsyyatCvyiB+SXmlh+XWkkQYEo2vMnZsmqX?=
 =?us-ascii?Q?JoJ8qPjcq3g59/k/oGU3Ite91ISgMs0NN2EJCqpNfxwkZsPDv5zmv6yw5Fip?=
 =?us-ascii?Q?2W5ULd38y/zX37qSkz2Wxg1rHMkPKWPbbDT/cYCQqDGCCkuvyNBUlDl/+35Q?=
 =?us-ascii?Q?sCG6Lp/ElsuERnIzgGlOuaRFtfXkfa14gxCOEnREbcYX7mLuSHUuh61lXuPw?=
 =?us-ascii?Q?w1rNDaj0TdxE6aVRZSPyFZyKSXJN2caS6U4U4P8CTbyyy4olmrhxbbK/5j17?=
 =?us-ascii?Q?D/5lHp8dAA9Yoy8xtpciHc/3BbSBuquZco+HEz8u9p72KSPvApwpsq5c5yaO?=
 =?us-ascii?Q?mdvepbIEPw5jL8nekN4COZnJByX+stFVvr1roSIqlfpdwHSRLNH/pWP4X9Cc?=
 =?us-ascii?Q?bZeMrRWoW2Bogc98fdgCYffbWlUkHMRANfQZDpK1H/T2+793EyNZ34ZAEkf1?=
 =?us-ascii?Q?7FgvbmIFj7zvMtqbkUUqoAIg+21hVOo3jktjjBX8gR3mtT+wehCbXzugxqzd?=
 =?us-ascii?Q?g1PWfoiJJlt+zYylG+kIvfnK3b0ZfTlxgrLGCkdRcMA9ltC8YWuaHKx3iuvE?=
 =?us-ascii?Q?Jk1MDFgVJG86LpfL827tnWkEXhRpkcK/m1e1DSMMCupK+TyJWlaHYE/uY3O1?=
 =?us-ascii?Q?8yVYtGPMolNSJ/TiqesT0BhqevBUXAwMIvf4I+2IY/2DYufGmOyK9W9aztX3?=
 =?us-ascii?Q?YFfhq/TZxR02ESCKw9prFv+174FqR1IdZLdOZVfDGVsZPWDU6ajG/0eIn5fy?=
 =?us-ascii?Q?FOZbazA1xurnqsssR0QmarZHT8AyFh4TCh8kuuqX5ndJdpQ1lG8pvhKncQpP?=
 =?us-ascii?Q?ky6Qm9zSks3tK7+hMBjyhD+sicGicr09Fg/4RYP6zM0B+FoTzq+74bxNtXwo?=
 =?us-ascii?Q?6muZKlxT1L0FY9tOp0XAA+NYIA29SV95u89ENi8r9gaxw0AKfeRrH84C8jWz?=
 =?us-ascii?Q?5R6NMFWh2uO8S4zHYN7AMqPQg9NY6nTOsAZJpihPUpE1y71yRqGCfoEHEU+5?=
 =?us-ascii?Q?ZgKy4VGsHTG15Rbv+9pYtiM2UHow/0j64LMN?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:13:04.7991 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de76b772-e0c4-4be2-c9a6-08dddbb20879
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026C5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6601
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

Add drm_colorop_lut1d_interpolation_type to IGT.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm_mode.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index e00b21067..696b76d3f 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -968,6 +968,19 @@ struct drm_plane_size_hint {
 	__u16 height;
 };
 
+/**
+ * enum drm_colorop_lut1d_interpolation_type - type of interpolation for 1D LUTs
+ */
+enum drm_colorop_lut1d_interpolation_type {
+	/**
+	 * @DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR:
+	 *
+	 * Linear interpolation. Values between points of the LUT will be
+	 * linearly interpolated.
+	 */
+	DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
+};
+
 /**
  * struct hdr_metadata_infoframe - HDR Metadata Infoframe Data.
  *
-- 
2.43.0

