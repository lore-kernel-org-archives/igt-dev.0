Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480B8CCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:28:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB22D10E23E;
	Thu, 30 Oct 2025 04:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mcxqMubg";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010037.outbound.protection.outlook.com [52.101.85.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0887D10E23E
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:28:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vbKa/gI9agt3Y9os7SjWdNlGKY5qSvHLQWZpAjoODJ5I4JO8BJjjlJPadvh+Y5hVOYteVsI2HPshRqiLl7QFWQN9FcW7WDYUL594/yESXLMsxxTP+qISJQSLFQqoJCjMGgKSx3EU7OmGudDnYr3x9nwnPeMbOvWhj4wjyVagirPZ332MQI/ccfUgfhydQoXPqcs11Z8ejhpZ4X8Cab4Ue6nKWvxIm3a6LvAqsDLpRkCTWHF+2PSB1KRLdridcT0lERgzsEXBs4itG7fep1mJFfDAdr10pOMqvGjxR5u5Fm7TYcXesmG7aCTfPj9/nkyM5oOUiyZZ+pVIgg7M2ga+mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3jE+uxpfIBgo1FBeSArw5nB+/8ozg3hctaMQlZ8rHM=;
 b=r1KcIlVhh97TKC0ogO/nH5ISmZUqfuVsICnxxDgOXtJRfBkp+9Vfw+w0Z+iUbS/sVp/HD/g4/yDqgmgLXNorZIxrx3ZgkMcUdhOkcsSKicGcYkgZ8K+UisnK+mGzYJEtnKQo5zwto/gAnb7PU78fK/e2VDjaV5vCMDQm501qlAcI7QvcPYNolC2xkKnWi+O3eYqHMFVdVz4K5z52awA6x7jlEA2XqXXDbWmnzdpVrQV2oBitJp4MEnrDHOgklxRM0tAtEr3okBiVLc9LHaWsAKZeuVTdLxx2Mp9c0bqmwlblfmAGB1j/5inhVC2tLdU8zjWs11xuog9vIg2oJk4+zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3jE+uxpfIBgo1FBeSArw5nB+/8ozg3hctaMQlZ8rHM=;
 b=mcxqMubgcnHZdMR8iUQBkD46S3gnuwgNXj77gvr0RhzMJ9FHO8SfYGObuTW5lkNW4A7DC1u/I0V2rQf305JW2I7FhmO99DSH/q7LFNQU5LCRpU2N8rlX3yAcwBAgZGJiIg4F6j+zq1IL1UOpspkobZ0Gh3HBwCS047QENv2KHnA=
Received: from BN9PR03CA0443.namprd03.prod.outlook.com (2603:10b6:408:113::28)
 by DM4PR12MB6183.namprd12.prod.outlook.com (2603:10b6:8:a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 04:28:43 +0000
Received: from BN3PEPF0000B371.namprd21.prod.outlook.com
 (2603:10b6:408:113:cafe::53) by BN9PR03CA0443.outlook.office365.com
 (2603:10b6:408:113::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:28:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B371.mail.protection.outlook.com (10.167.243.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.0 via Frontend Transport; Thu, 30 Oct 2025 04:28:42 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:28:41 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 02/32] drm-uapi/drm: sync with color pipeline commit
Date: Wed, 29 Oct 2025 22:27:31 -0600
Message-ID: <20251030042801.2315866-3-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B371:EE_|DM4PR12MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 65ccb783-a4ca-4ff1-31ab-08de176cceb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XoAvgwwIAjT2iudrlC9HS3cvlCHF4pCGdC3zG+gmCSjgNt+ebs7lRRH6Mp3Y?=
 =?us-ascii?Q?TTnAuwVSWopX0OK4Xt+eBtQ9jMQw6Bj1/+qrEZIgP3eTlZVDFDbXCGHsSj7D?=
 =?us-ascii?Q?p7HnvyMcalAGL0MguFY7syUU3Yzn1s7P2RAEPy0fjJfo3YuNDftT69DMhKet?=
 =?us-ascii?Q?lrt0Ih32Yl+XecKbsbaaVGcsArIlJeiocKCd3pttMlwYe7BPdWmZ9Mow5ULz?=
 =?us-ascii?Q?Waxx+1OPYAbZ28QCwlafqvNu5NEpKRofWhytxH4Fy2jZAM9tms5iTmxNUGdS?=
 =?us-ascii?Q?iQyJCx3SnpZ/k9HksfzsgWPHL4mXAeC7GB/ReI26TOB3GhA2iTyP0i16NK0d?=
 =?us-ascii?Q?3GLw72BA6JYoi00LEqAnHasxEn1AHWlKWIgn/kjJamLvxhOTBDHcEOpy3zdX?=
 =?us-ascii?Q?zC9z3g0tLp51eiky8Xf8DRN06hRsa8Idm9tKBpOq0k6nsTrM6mYagnkLavEB?=
 =?us-ascii?Q?rE2rSXvoYTpv5jQLYH4wT9/4hcCE/I2Yl/L6BxogySMTbW8CDycmZTWF3mqZ?=
 =?us-ascii?Q?ZhJR0QmevPdD7R2gUPwkZZ7BpfoweSRbzjm/O2XfDWEJuXt8yM5M36eYzNm3?=
 =?us-ascii?Q?GF7FbkWwB3cqdZq8fC7aNUbC9TrkWnnOofC5E4ufYbl++gdHDbTWio0aqg8D?=
 =?us-ascii?Q?yfUYuTXrWy3KCRmBokAm4rR6y07077+1Lm/+MOoe/1h4Io4MBB6M7leJw5Fl?=
 =?us-ascii?Q?mHB49DUKQMKSxCMk/UojwI/f/cvOLEDXkLG8OhmZzRGxMLbFoioa2N4i+jQr?=
 =?us-ascii?Q?sfb+EtWRcdmQcf7c8IK+QC5S0wka5lSmsWlTLyIOYDz4T7FGkJmLcAinkSqd?=
 =?us-ascii?Q?ysb1uGvDenIHefwCSS3iBgqzMBtkUAskw3iLet2Zidz+/S4fRly/R55b2rIg?=
 =?us-ascii?Q?1D70R8iJ2ALRHrTWKOiefx/tFpMpe2Ti7q4455snqwltj4glhgxhd7XwNUqn?=
 =?us-ascii?Q?GKTxAVFF9eopLCaegBiGgN+1FKeH9myXfFgRPffhXVlrbVpMwBDXywqLPdS3?=
 =?us-ascii?Q?QWZ73PfN5kuVTtMww2MZmN38CvR2A15FI1ojalYmrvMGDDJp8l6ulMNxX7ZS?=
 =?us-ascii?Q?rUVtAbwZuyFU9Gi/bY2PY30OBVClA/U6pnQHO9X5e52zNC1+/8DQ14mmK3P2?=
 =?us-ascii?Q?tqHvOJaK4Tdk6Wl3Mt6sA2Q4tQe5SBlNuJY136K+iza4gbqB5QS1zr6cQXgC?=
 =?us-ascii?Q?pWzq5zW+S5Ly9m4dAOfbzhOI6uOHrhCSaar+6LPDQXRFI7W16IqVt2hVPEuL?=
 =?us-ascii?Q?oK4GT61nUZTmfsunYHsnHymKiEv0UkjOKmtCQ4kYRHdxHAm4+Iwhw244Q0n6?=
 =?us-ascii?Q?6ZEd9CMDYtWOZdRTsxqLfzusuth+YiIFoZPKms8LA0gc7bms4K5GCIkpex5h?=
 =?us-ascii?Q?VSel1W0GqMyLS94b/yPPHqE7FCXHo+FA19i81JZy1GmfmZeY/n8WJJj28cLv?=
 =?us-ascii?Q?ePsdBXUlrTaARYL4OnXhyJ9VASJuuUwTW2XDcZ4pOzWpAvX9tTGsGlOT323r?=
 =?us-ascii?Q?gH+nXfsNFB6Tb55JIfczIkQQV7jmqhK4J04cPcxy10iv74CNkrtOzyNltZSR?=
 =?us-ascii?Q?7KsTKrfJVFaIWxq5V7c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:28:42.4327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65ccb783-a4ca-4ff1-31ab-08de176cceb0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B371.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6183
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

Sync DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE in kernel.

TODO: Add sha# of kernel commit when it's merged.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 include/drm-uapi/drm.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/drm-uapi/drm.h b/include/drm-uapi/drm.h
index 4e4f7c2c3..baa620e3f 100644
--- a/include/drm-uapi/drm.h
+++ b/include/drm-uapi/drm.h
@@ -869,6 +869,20 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_CURSOR_PLANE_HOTSPOT	6
 
+/**
+ * DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
+ *
+ * If set to 1, the DRM core will
+ * - expose plane COLOR_PIPELINE properties for pre-blending color management.
+ * - reject setting of these plane properties:
+ *   - COLOR_ENCODING
+ *   - COLOR_RANGE
+ *
+ * The client must enable &DRM_CLIENT_CAP_ATOMIC first.
+ *
+ */
+#define DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE	7
+
 /* DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.43.0

