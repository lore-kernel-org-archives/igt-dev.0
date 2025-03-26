Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22DDC3600E
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:46:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD1010E7A1;
	Wed, 26 Mar 2025 23:46:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tkegBCLq";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82A810E7A1
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:46:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VYXTpAYM2gRKY064+z4zim6DJo+2J97C63yiR2U+JmQi6TWE65FYbNKW0VxQ6IMD6E4Q17IJx6rjHui/u8QWT+91KPIwYL9bEmU//9eNefdQdKcPY0g+MvwsUnW+nUTk4MG6dm6D8/KjVi0dXcs/RpoX4co+VQLMMneT9O+QCq/9pKrssqm0tVwuS2GcXTOanaMejtlIz5GICq7MIYHaDwizHjSoG8/KdUMrdsGtPR0jFc8XncZX1Akoy51Uxws4gm3QWMQ/bQhK8dTcGEo9J7ZQxepcTpjklErld28FpPiOvbkcgd137GUr4LeUTnCN6LWVMMXFZSGw7Ejw7K0uoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GlGcyGlStiGHDC6BmVrVji0Gq7AUBUYNpj7Zo2TN5Y=;
 b=KUCPzYAkwehQma9XCEbcUvtYSEhLowOw8IljRC3ph9uvLA3t5Ijhmks0VO9yQYEJmZArRyBFgvE1Zqmuw0y43bthUqV4uNQmWNN/fX6k0XUbozYzSRHnQEE+8py8GMRWcdrEpvWZEjZ33r9LRGc6IDEoKpQhxWmyi1R05akSAfjdSFUbFzNi5nEXZEXNRr9+glbsbzbVm23RbpdB85xmiCd90koy1Vz1iIzcfKU2QPGLV1ON3w5YVsccZVtXXYeAY3LfbFXChoHDkjvISirRahzmhxnD3qCKK7n2/q+bWZy3tebOb6Zornk/hERvmg28c/D1QEFrQD27dY2MO79UcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GlGcyGlStiGHDC6BmVrVji0Gq7AUBUYNpj7Zo2TN5Y=;
 b=tkegBCLqf64LEcnO/NtiRNfeBkKzo9I+9EuVIxdNTPA0ivoZBFq46vviDEt4bjERJTsUr/AsHzbX3rgq2sJryMBAlqdDNiCjKOj+/9afWOVeSpHyDBBGh5NgEmCLzVU4qgcmfkr9lBoO6hu9Nq6J0g5cWo/sEHpezvv3H6dmVGk=
Received: from DM6PR06CA0052.namprd06.prod.outlook.com (2603:10b6:5:54::29) by
 SN7PR12MB7156.namprd12.prod.outlook.com (2603:10b6:806:2a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:46:45 +0000
Received: from CH3PEPF00000013.namprd21.prod.outlook.com
 (2603:10b6:5:54:cafe::21) by DM6PR06CA0052.outlook.office365.com
 (2603:10b6:5:54::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.33 via Frontend Transport; Wed,
 26 Mar 2025 23:46:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000013.mail.protection.outlook.com (10.167.244.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:46:45 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:46:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 36/37] drm-uapi: Update kernel doc for drm_colorop_type
Date: Wed, 26 Mar 2025 17:36:08 -0600
Message-ID: <20250326233609.2980110-37-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000013:EE_|SN7PR12MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: 109f8006-7c4b-4c2f-8b39-08dd6cc077b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kqrrjCIsOkWwyVRacWWIlCLOOp063myxhi3alzT/yo56f3+J/HRdr7nhBY6C?=
 =?us-ascii?Q?iTgoQmznyZUL6lnRKbbfqXA/7Aq72GCsn0Wp18Q4DsBEHZJMxgLOJP898Ljp?=
 =?us-ascii?Q?aMUDyf8OUwmkoIuNHKCFf0qTcQJhfrci0t62tzDQiFGUyVygchNnUMy1Jrlc?=
 =?us-ascii?Q?6oR3zhm12ZThRCgz4r4vqd51L4BeHghcyMSwh5+0da0H9LvMmnzUtn78EuEy?=
 =?us-ascii?Q?kPRSKG7QXMd/FwVAMPzMRUoRqHTQ178EvuBLi4taL14exnNjhHguyckLC+Qf?=
 =?us-ascii?Q?3qx/WPgcdep1+ZS92vbw5xaVukZKN/tekBcrxZbXtYIOc22YldB/vPhBcZZd?=
 =?us-ascii?Q?wcQpTTzhzztdHt5bxmVwTjQ46ePlOXZYgRlAOixme9aYDmHVriYMkaRBOWwN?=
 =?us-ascii?Q?mGk0rrRx81jlwsHjdfn0hp7905vVlF+VUs3LSAPCIzCq0A3f9JVcjJFoeqZ2?=
 =?us-ascii?Q?lm9hmllrYZIJLFOXQ12KV6op500LCGG4PMheRUNSxKE62UJMn169A5jqvMZo?=
 =?us-ascii?Q?rGoXfI9ak2Srx694eFWtNH/gfwD/nk+kB54xxp6PYX1csZLpVWGwrE3wxU6C?=
 =?us-ascii?Q?MwcDjBJ/eOqNQDM2V4KyImtDkrnRBgDwkdZxw7URSiiPtY2pg5ZvbbYoxnQL?=
 =?us-ascii?Q?lJEtZjPjqCPNvVniWQO0OyagJcMnGcyYM4g7zX6uPvOwA43LTF2iyamZwMPq?=
 =?us-ascii?Q?eh2wN8xNIRNMOAMRxVmcbLBGvSrTGgcBhW9suBHBctIY6sg4gLyppPttEbGC?=
 =?us-ascii?Q?iF+EqkJxyC+BqLv6HLhtvEoQc0CKYv1tsXIlCJrbOBCEoTlyFsMbftG8e+5G?=
 =?us-ascii?Q?XUUf3F8x/0FQZX/iC057G6jmTT+fFzf965drcJpnCRKDOYAzgQcjtyIMw32n?=
 =?us-ascii?Q?IUsqJevaUgNPP/ua7xjPSLJaNVuB/5lUTZPl6Drma0WPwdDQDqYoImjrEXxA?=
 =?us-ascii?Q?7YglzxF4UY4YGml/3ZnJ7R3zeSmGvafy9U2+TVd3Ssh99DA0q9UOZXvhjcKC?=
 =?us-ascii?Q?BvD4LwhDgjom7U9/iSG70iz+sqoqHXoBfxWsvNvCCVe0rbAHmUutSRY0cUlS?=
 =?us-ascii?Q?4pUJKvsHekOIQViak+HevQAGnuRm0+TBDCePxHy7qQtsJYPQCbuRk9vblxZv?=
 =?us-ascii?Q?STJyPqJu/7VQL7rLcoAMiIAM3aX3ZsvKzGhwxvsU83FBg0pJgUYBgKDtzvnF?=
 =?us-ascii?Q?EnX74QoooXnGXfxEAxFK0Ru20rLSqqciu7XY8Wvq/Eb/SCqWqC7cgKL04CMw?=
 =?us-ascii?Q?z0HAPfKDTmVNPog+cSQLS9ACm80pVKLnQukmuWzxtnvtL9weqIjsF68P7hsM?=
 =?us-ascii?Q?I1GaPllmY50EQyUTf3C+hTwqz7JzNvPmZfQYHjbGwtopWRfnmAkdW/YPitOl?=
 =?us-ascii?Q?cwDVM29UuFUHmZmB8ai6g1cPRQ3aRsLH9Fz2uOIplkS29ERtS9xKbavxPvuV?=
 =?us-ascii?Q?r3rZY3Y2JcHT8aeA5EtWwADl35JYxSFng3MtbzC+7KVguFuF4JMQK2nUWabJ?=
 =?us-ascii?Q?fxxrhr8vGQFMWC0=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:46:45.3785 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 109f8006-7c4b-4c2f-8b39-08dd6cc077b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000013.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7156
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

