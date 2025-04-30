Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80263C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3231410E6A2;
	Wed, 30 Apr 2025 01:42:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hFr9lUGF";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C04A10E6A2
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:42:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QqczF8RP7OuZJb94i1Lg8kYQN9oyeK/fNCVsaFZ4ASdxJQuM4G8RT8RZ0sqp9IYIer1y86iQocVCkhpBS7pl4F4MFIpCqZu1zuL+ssFi03FrZNZUE9f7RrIKQAs81S3PAHTjRwzhVzkBq6TqFP1BUx83inhYco1DIrSmycVirH8PDMWn1x7LsT/21QU34zT/5DPugAwW81GUFT2OunFkMuynpmfkIrgdl76SkDViBLRW9PrbaEjI+xXG+cMmuPI34BCMLivHMqre6AF+n/rlrgNNbUBJnMCro5uGPVdX1VKVhNkcAbwI/9Yw8FWv4KTJY5d/FGYQld+lVJGr+SOvFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBjfunds1d4Hpt9EbOxvfu6izvVAfqFWRLzw5JYox6g=;
 b=mrNfT4uBcIPdJA8/FxCVP8YE1GY+p4IM+9YlfmMjhwA4KyDnJjJujiCje1CwaCs/dX38J7+gIkEeS7Kn9fkoOfsJNplE36zm0BqJoxARfoGzoAyMXe2ZkrLEbyYTmCuBUX/Q+tCZmbtPY3du6W1KB8HJ3TxCirS+HZCo3OPYOW6zlrW7zkEx7GM1orM/AtHbMgDLBxqXe0O5hqlKvfPhVjW82xtzswR8aZhTAIIFTTBLVf3WwwELhPb41MfaugyV91/2KRKjnGFB/S3rOQuyVe6SYNWLxNoxVNpHEWTr7Kk59hIpxPdkhw8jACmZy7CLhjNcPsRJqgqpUd6kTF+K8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17)
 smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBjfunds1d4Hpt9EbOxvfu6izvVAfqFWRLzw5JYox6g=;
 b=hFr9lUGFPg1tpLT6RNdPRPMALDGqhpwCzndf52wik1GJ5fmgDsSV/rfFpEXtVr44B3ZoRZqDqeRoJVmQdVEc7ZmmQA5mrSHMpErEHSVS3X1FqyQOzvvDYG3ANUbLRvLORKMgF+Wv7+zc7bgZiaMdDc6mXOe7oDb/5eIibnmV1AU=
Received: from SA9PR13CA0115.namprd13.prod.outlook.com (2603:10b6:806:24::30)
 by SJ0PR12MB6927.namprd12.prod.outlook.com (2603:10b6:a03:483::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:42:38 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:24:cafe::98) by SA9PR13CA0115.outlook.office365.com
 (2603:10b6:806:24::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Wed,
 30 Apr 2025 01:42:38 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:42:37 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:42:36 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 35/36] drm-uapi: Sync up definition with kernel colorop
 implementation
Date: Tue, 29 Apr 2025 19:34:53 -0600
Message-ID: <20250430013454.226910-36-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|SJ0PR12MB6927:EE_
X-MS-Office365-Filtering-Correlation-Id: fb167389-a856-4f5f-ad42-08dd878849cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gJVHtlBz5IKweLRZwYu979MMq77qf/dC1hW7TsAcqSJ6yQ0Ssw+l7r/dQL20?=
 =?us-ascii?Q?oeBbVYlQzlWSINj9hewUwnwCOcCwebwJLEPVPjBKXCH54e37W385L21wJ/Sj?=
 =?us-ascii?Q?bits5BEuqQFqYPnEapiH2qVQztJAly+6x/eO53dirRM2RJg2GlY7/SWkGtLj?=
 =?us-ascii?Q?zgRwG8PWUv2mHDhPVyjrX75c3GHX00tfVKjQLAPosQjOJLfVxEU2vjyKp3xb?=
 =?us-ascii?Q?LA8Kea3ocWxPJAe2goDHdTbwxxTUoUOD0FibdjlgynIbN+vhWWS+sO9dWO6T?=
 =?us-ascii?Q?m91tBzc9Oe0xjTcCbXpEqzOOQTPaa2OzyLN3K5ifQJ9mXn045fVTKdasHRwl?=
 =?us-ascii?Q?De4fN+xlnCI9Hoz5oAWQik893GufBC+WyKl2Ag2zMnoeYUIuB3/YAgD6eCXS?=
 =?us-ascii?Q?4yMsMpX+C5Cjq9mUoIfnMJGknoV2sS5azfOUV740lA6obE2aw0uex1x5A7yp?=
 =?us-ascii?Q?kJScJnWN5iRdZ1U/OSO/6i7Z0hTJ6xHaoweOcLYZQzlXEM5PYbtTRtIlsf9s?=
 =?us-ascii?Q?tHO2Rlcl3OL5KvB6AI/HZGo4ws9ElmifYg6Vld07A3EKBDR0NNy0Uye493yB?=
 =?us-ascii?Q?8Tph08pL/qXajzPDwO8D/pV+NOHl0hWr/5PEPwwmcW5ka/KTG+sDDv1Lb4A5?=
 =?us-ascii?Q?72M7Fazjwes1bxAa+t5iiSJ7+8XBHh+4JfgXGZU8WQjYAXhAX/1LmCxrsni6?=
 =?us-ascii?Q?pAcKINRQi0ERHn8bJxMy4o+C/QhpjS3rcrDPa4+FadrI+G87hDSOlnXPsYz9?=
 =?us-ascii?Q?enogsOrQnFDnK1/uH7w9yk7zI5dqEw77GyDEJwnLrxfkJV8ZMkq4KfI2C2yP?=
 =?us-ascii?Q?rPTKxaz2Wae2KYaWXYRA9FftOt7UGtVlUvIxUBdNsjIr8xa6Fkqcdw1lI76E?=
 =?us-ascii?Q?qL2ZRL5ig4L5SPBKGMOTZOVdkCgpsGGiHA0oipfOJ+TulcjFxKODdiy015i3?=
 =?us-ascii?Q?sz/gbeYiTCcmFZUXtVZTeq2sXLM8E3YxlINET6evb0t8KdU/Z/oOPzbhtL6y?=
 =?us-ascii?Q?l+wEx1QCX9DH5kNixl/fGkBsWFfeWIrYpKrPjn1QdiohZ+d1fEbk0pBG0Eq3?=
 =?us-ascii?Q?bC6d8s7EovqmvbGTBHqE9ah9JT3LzLU/6ZIIWVix69RN9w0rM0VtW20SbvTj?=
 =?us-ascii?Q?TwyF4M6nmXLjaR1W6sZE2v5bzIDRH64iUwZ6htCHdX3dvsbwZcTpj+mD8/p/?=
 =?us-ascii?Q?iwwNd3B2wzWPLoVgp8VRpgWXe82VmGQfCdVxmOb4F/edJjS0EYxOV1sNOFS3?=
 =?us-ascii?Q?IwzAwsgVQT5gJkA2iWcgHqM/fa5YpGF+phwr1fJFc/C5NlmEFA7t+rMeqZeK?=
 =?us-ascii?Q?uxslvKqfsuzuC1jiQy85c3jKYqvogj+OxYdACGRtpUuCj18prENRIv8b4L8m?=
 =?us-ascii?Q?qdpijDvsfZ0KpJAzdZWXFQvJKEQU3J/GhAqfgzLDucBrkVZoLMgl/gGmdMI+?=
 =?us-ascii?Q?fBiPlC1NjfGCn6ojc6mPKf/seoXY7vadxUJZxSzXPWIR59TFRiLdA/m5ts5E?=
 =?us-ascii?Q?N3lnt6V1OClr25ifsvBVPDKS8XdDFp9Zs6Ic?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:42:37.9299 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb167389-a856-4f5f-ad42-08dd878849cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6927
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
index 9e34d43db..f749eebf8 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -956,6 +956,19 @@ struct drm_plane_size_hint {
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

