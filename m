Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4037AC3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0EE110E6AE;
	Wed, 30 Apr 2025 01:42:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SnnLsKzK";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9468810E6AE
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:42:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vwoccWO8iYFopb+sKo2wH9/dxzQ1YaZGvXhQLn+K6r5zzQyNS8uGEoV44yzKNjckniV8etJL6ZJ2iTvVRxUgz8Vhcr0ouY9v2bIqgSZenuKdozrLBS51kTyTOzNE4dZ25FPXl70owKFVPMzGRBS02dU8+eY1abKfnPypytAU9ijhCy9v2IbCFPsOcdH6qFSZes6PqsANz4wVG8Pa/W2mfHiNvtl8k+NBhUIwom8Ny1r6hJhE3g9kmZ608m3IdhkMIzhuvjLLYqBlSYRou6ojbBdP9CCmbXcXcJi7ejhXfH4Bn/5CF7JjJVeUq6xDtWwtrNvXicmvF6UjReo/tsSuYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GlGcyGlStiGHDC6BmVrVji0Gq7AUBUYNpj7Zo2TN5Y=;
 b=pr6sh62tV5FI+3iigDtin4swLVqo0qvEW9U+NrzD9RzP1BP4N1PzXnBkDSAN3QmjJ4+0pOABDkdlW+NHs4potgIbraQifXz+pPPZcJEBePCuSf4bsedf9dgb2jamuDImb+/N5vfHTQfMw+V+Z8QY8ZuA5AWVMCSeE96zTlVChtlGuSSIZ6K8Rq/UVbWahQLPqo14vtWN7VUiwc8RBuNuOWhOF3x9LbXDns1bHJGd2GlpLtNBkQjwkxoNL49kkMfkxLbR1Q6WuFMui7X/pl2AVuOhGSDxpp94Mp108nOq1QlGWHAxxmyTC7Z9Zb9pt+Iiesv7hTO4e/kuUi1PCwT4pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GlGcyGlStiGHDC6BmVrVji0Gq7AUBUYNpj7Zo2TN5Y=;
 b=SnnLsKzKDVys/5oCHDmKDC9JPgqAHd9Some+gQEc6HmFwhiibbfvGWWtbR5PZfww5SY60RImNtvqHoL7ZPcS0F+VLL3TWoqudXMpJ0HsjL4A7it90/rSWsAc8aUMPAZNxtyXerdfSs4dlMRacvjLN8CsnTbJhYDvupN9xgrQGLk=
Received: from SN4PR0501CA0038.namprd05.prod.outlook.com
 (2603:10b6:803:41::15) by MW4PR12MB7166.namprd12.prod.outlook.com
 (2603:10b6:303:224::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Wed, 30 Apr
 2025 01:42:27 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:803:41:cafe::29) by SN4PR0501CA0038.outlook.office365.com
 (2603:10b6:803:41::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Wed,
 30 Apr 2025 01:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:42:26 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:42:24 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 34/36] drm-uapi: Update kernel doc for drm_colorop_type
Date: Tue, 29 Apr 2025 19:34:52 -0600
Message-ID: <20250430013454.226910-35-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|MW4PR12MB7166:EE_
X-MS-Office365-Filtering-Correlation-Id: 268fafeb-27cd-4346-9e83-08dd878842b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LTYivzr9k/xImFQD3AZLUv9jh53RE823QqFa4dSpVvlO3blaK+JF70bxTbpo?=
 =?us-ascii?Q?UzIz1JTL7Vi7vqWIDbeWj62Q2dboYL/PPzTRRlzTLrhOC4PvrD2ZER/ruWrC?=
 =?us-ascii?Q?4DQkL+yeXNtuHJ+xzCifg/molzIpimJsn/2/ZP7hSW1Na5uVkd6YTPI2XffN?=
 =?us-ascii?Q?x60HB/f1JYSJpiDYTMAfp+2xrZKxjRIoavkUD6RxDzacXhCytQk4jNd32eLY?=
 =?us-ascii?Q?qGYVGpqL5l+T//t/KtRgAggsX0Xlas/R6MVDcB2NEnz9hyKKFs9az4aRvVpa?=
 =?us-ascii?Q?x2THEGMsJpZEUTEbJPD3/irO7DOr/1m3O/18ihVwMyI8SIZ4+xNtN8BC8/Uy?=
 =?us-ascii?Q?B7cgKN/x2IeAHlpQW3jB6w7XqwYVtrh5DDIbi90JkwYDPYnhW8xdkYCnFeyB?=
 =?us-ascii?Q?ohcaGpov9sevm5taf/mULF42hECDaxAr0fqa3RnxeE5F1U51R6o0prO9Msqz?=
 =?us-ascii?Q?i5iX2sEG35NWu6rhjau6GNbFZb62piJ59EEuYFsKch9O/C/j1QEWe4/h1djM?=
 =?us-ascii?Q?6+H5P8A89dUmwr+M7VmOtFakyqJhXfGvmfWy/YiL38JqWs89iCOvWzn+ZwCP?=
 =?us-ascii?Q?dLtwmJO0o+A5se8/0sTMmTwNld3ihifGb60J047d3ChmKm4trxiFcRv2EfaR?=
 =?us-ascii?Q?vVCiYH3uzbLOaDZE9FkgAbMfP+ct/md5K40RaVZo3VRR0kTN4185hvw15h0Z?=
 =?us-ascii?Q?atlTnkufbj+3y2IJlg4uTNHmsRNlHkSmP32yiU5SEePBV26yJEALyBb9pWVh?=
 =?us-ascii?Q?vhzYx9L6bFTzgnH6yQsCmsu1aIb0bJZLaqSO4pq9qu8p0UBwJjQMDah786c/?=
 =?us-ascii?Q?HEhkgukfGv0YnlC1WxhHUeuwOEiuMR9tREoNx2mvbvILTafWFLA1H+vgyb2w?=
 =?us-ascii?Q?tdqhxGMVhf5Bh1EcvS0m9EfRW4cV+BPOOjY0ozZsDOsiculWEo1M17ODQZqi?=
 =?us-ascii?Q?R1umtIu4RTD/auXOLf3uaFHTRT1M/5ugR3dSpcWlhIftgxIGVrTjKY7VKl7/?=
 =?us-ascii?Q?UBr8IT7rMBIGWlmONlEh1tny12U/qIIM2/HOn/KMaNb87FajgqalvaF4aCD6?=
 =?us-ascii?Q?cuWpbTzn+v8yY2ndus4h+AAbFIz3z5rk4FzjumfSYSt7pQWvk09GGEOufmWR?=
 =?us-ascii?Q?blSQ6rF2RzLQ2+POzXOiPUMtAUp90zMOWw9BsvVa8IsuJrVZaJIvXQdqyGhs?=
 =?us-ascii?Q?yk40ZviyxEhFe+uGkIAmOLfEZQrJ1BrLhAJ1RncbdwgWZcCTYdInDscUHQfz?=
 =?us-ascii?Q?e+Dkku9yzmvstzyYSgbfSXjvc2vEtymmKbR4a/zQkjOCqZreBmFcxmPnfuYr?=
 =?us-ascii?Q?AnOgVSf40jZ0a3SZcLYf6FMLB9TL9pI99bTzLKITTR1S9TiMTAyFPM0Tnv2G?=
 =?us-ascii?Q?iO0a5QqEvnKdljtgSYGgz0EYIrEVDTuxwtz216k2e7ynpG5Oni9MqjJiDCWv?=
 =?us-ascii?Q?00CW1k3rSP7Zd5/YqQU0Sz2WrK5vc/BlmEhGbJyI3anWyfDbt2WcOCX/dUo1?=
 =?us-ascii?Q?rdREqDmGGvx3ckYn1Jdm3Hn7m9tHO1gparNb?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:42:26.0405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 268fafeb-27cd-4346-9e83-08dd878842b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7166
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
index 7206b213b..9e34d43db 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -874,11 +874,55 @@ struct drm_color_lut {
 	__u16 reserved;
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
+	 * A simple 1D LUT of uniformly spaced &drm_color_lut entries,
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

