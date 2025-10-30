Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77189CCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:35:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2813510E8C4;
	Thu, 30 Oct 2025 04:35:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qMKxjK1Z";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012019.outbound.protection.outlook.com [52.101.43.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADE310E8C4
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:35:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJeRZlb+fYcDHvhVfVBzNFnjtgiH1gcabFRQnSkgLtohf9icBhQsLZoMzrnL37ctLOjGaz3AINxc3Jl+U4gIfRn+lB32lM7XkRI6JiRkTvs8CaYbazRTE1fLPFFvh6LJDv6chu95c9bdOmc2BKWxrSVYwPNNcqxOjpLqdkdZXfAahj5MpcZfCWvn9fVOMu4+kod1L7l4Qqfi1vdClSZ+CAuzMVRZWK8tg1Np9fc1j5yddKQJJpDXlfcWpwXls4w10esj+eIuNixM6rp5lE7SyT7H2iqK1VT4yiqYINs9q5y9JMr73ScN8wxxafracqG/KzefqYdOVixdUkop2BNgzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jw24gQr2DcmG5Dl6LVwa66qUlKwQvShLa7Xx2CZsjC4=;
 b=PHKx/+rM+XxPIVbxusP3c+OP0uF/BmW+M4FhpaNvR8xQVFVFxkTKw+BS3140dAIjJWJ/7zdDtGh7ldjh/Bf9LeHZewXIyon41ZYntz9EQOu70OI6y88ruhOWqBmAzMDlqceM93jDeXVq3Hlm1YAK/GCfsQ42fQjfg0vdEQPCARGnzP6DAPDnSraIpSqWgBXPfYvwPmbHhCosN2pwEWX56t5iBWSAURhuZ4rWmKGcwzjmAP9aAlYRtsjyiZ3Ik0/zKC0aMJ8cQ2YDSmdZQFpFuSYWJuJU9Rp9k+mJtcqnuaZ9M30bBHdl3QGmuuH35ZGkZ6cilwezF9OU07qEA/REXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jw24gQr2DcmG5Dl6LVwa66qUlKwQvShLa7Xx2CZsjC4=;
 b=qMKxjK1ZSs2tc6RNB8QPZOXsoLFOJxKwRKyoYK02c2+0ykcMOiXKPCRJeMvA1SCkZ4lOVHezO+acK728CBYrqC5CtgEh5PZCNaahpEcA/8us5XdvonkouzB8EwcFW/SFxtwpiTEJK/94zEQEVQP41uK0G2hukLNlpqXT0CKptqQ=
Received: from SA0PR11CA0143.namprd11.prod.outlook.com (2603:10b6:806:131::28)
 by BL1PR12MB5804.namprd12.prod.outlook.com (2603:10b6:208:394::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:35:07 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:131:cafe::c6) by SA0PR11CA0143.outlook.office365.com
 (2603:10b6:806:131::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9253.19 via Frontend Transport; Thu,
 30 Oct 2025 04:35:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:35:07 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:35:05 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 31/32] lib/igt_color: Add support for Gamma 2.2
Date: Wed, 29 Oct 2025 22:28:00 -0600
Message-ID: <20251030042801.2315866-32-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|BL1PR12MB5804:EE_
X-MS-Office365-Filtering-Correlation-Id: 42fa8f79-a5d5-4950-f018-08de176db436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qz4kV7lOMw9UmpTL4Pce09zHewQG7BPEonKto4M9JkOvjope2CpXsOWvY6mU?=
 =?us-ascii?Q?Cw+envHaX4mh2sqq+nO+ZsWq/V+dEat+TlQkJeD83pfmknZojNW+PnY/sMnS?=
 =?us-ascii?Q?cX+Kfsb8o4m13ghVbSqO8irKIZD+qPVPi8S9/5MhrrmEk/ZRMz+NGzwv37AX?=
 =?us-ascii?Q?VvlqEh3qeNwWVaBeW2LAEBnt2kA/AdUmaIYx/L1RFsjxevogt4qH641Hfw5c?=
 =?us-ascii?Q?pLZSKog1Asl6xSPVzg5rgXiwTuYRFvQY/PienxgiVfN3YFJoRhv+2INQiZSo?=
 =?us-ascii?Q?nu4YUy/1Ji060xgM6reLvBhZhIMrKqbfFlF83BiIl72SZ74o36QetU19xX0h?=
 =?us-ascii?Q?uovwJrdzu/ZlIO3zZTPfwcQWayOTzMd+Nu/hAJQZ7RzvIb3CfmpBbthKvLy8?=
 =?us-ascii?Q?KJT4wVVVcy5JfEVHCOkHsVXST+CzoniU/ShqDQ3J6Jhmq235DX792oCF5cvw?=
 =?us-ascii?Q?7ltj34PRtPLBtYpWfdl9qiK2TMasTT4ivtBQaQA9oG8ZA6Q4fYhmh8y6m2KR?=
 =?us-ascii?Q?Gn3LRZeizj97rR2gCCURCcDCjAYsPhtfSAKWoPInQ5HpOk+B890B0/Jz7Die?=
 =?us-ascii?Q?yL1sE1fy7pua8dznhCNj3cbYbzvGImzvP80o375pT+5nk29tOVbcuGzyYx1E?=
 =?us-ascii?Q?Y+YRsi5u4FGeQEbCyE+A3jjsG6AO+Pl2JdGDVA9Bp2Bh+5P+fbNFj9XKY0H/?=
 =?us-ascii?Q?m+63MQRo0BBdZuMEl9ONYILjPbp4PpCif07lWEdi28FXIxYGPh9jBVPqwHyh?=
 =?us-ascii?Q?EFGOFXc0qMzK1biimPSuq/KRA+ELR8t7TnwAHxRg5cP67Lzntv5fiZXlBVSn?=
 =?us-ascii?Q?DRuQIWJ1dVPoBa3HAP/BKkGzkSbNepzAybjbZf1P+foI/LnOJ8SMxmHYZMNS?=
 =?us-ascii?Q?NXryK9W3u0qGAQLb5fwxEBDMF27hN3PBwqCxtApH7ruKbC6bN/T7JOVoWZgj?=
 =?us-ascii?Q?PrDdSofmnDhzHub+Gpb7YGI0hsxMyozB7GIwM9hZrWCq0VnP50YN2LgFoFWO?=
 =?us-ascii?Q?YHPyG4D343tqVZLITYUY8vs4/hEMc9SehpwCQbYPnvAGD+nze7so1sPNIq5y?=
 =?us-ascii?Q?Jjv1bgK+VK93iaFzrGIz+jbDnWfAGioeB6fF+yZN+/y6xSfox+SnP7LrW7dN?=
 =?us-ascii?Q?pAXfv/sGThOerkoNbwEohchjcntEkFR9i4UbfIC9wuUoSz6GAcyhKraWuuzc?=
 =?us-ascii?Q?4oPrWDPOwukQTUApXwgoZ0D1oAR5wyFJzxr8HD1Ysu32nA0YLRLHjSEv4UAO?=
 =?us-ascii?Q?JdDaznT5+lFJdD+5OoDUgtt58ejejtCl2i9MWgg421vGNZGGxvNd31ijHCxo?=
 =?us-ascii?Q?iqe84scYi2k+quM+H0zkKzCPbUC4+Voq/RYmjR354fdm739r7IdiLAaV/uOQ?=
 =?us-ascii?Q?ZfLsZVf4P+iW5HViDyZptB13lYbKS2mfjVR+5V9XbRJz4F9gCQXUC+m52y+S?=
 =?us-ascii?Q?VKV7brcn4D/46v0wZZer9CpeOy5OprPp1q8q6ezie3ywSSLFkU0BPV4id1P1?=
 =?us-ascii?Q?Ur1SYvhapIFA4hLYJhJsjgEfVIZRRWnPDvHmkaI+xx+cgmdqNyAYOF4oVYf4?=
 =?us-ascii?Q?6LaeXhiH0EPciRXhWjA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:35:07.4836 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42fa8f79-a5d5-4950-f018-08de176db436
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5804
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

Support Gamma 2.2 in colorpipeline API.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_color.c | 17 +++++++++++++++++
 lib/igt_color.h |  3 +++
 2 files changed, 20 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 710cc3d61..018d44064 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -103,6 +103,13 @@ static void tf_pq(igt_pixel_t *pixel, const struct igt_color_tf_pq *pq)
 	pixel->b = pq_eval(pq, pixel->b);
 }
 
+static void igt_color_powf(igt_pixel_t *pixel, float power)
+{
+	pixel->r = powf(pixel->r, power);
+	pixel->g = powf(pixel->g, power);
+	pixel->b = powf(pixel->b, power);
+}
+
 void igt_color_srgb_eotf(igt_pixel_t *pixel)
 {
 	igt_color_tf(pixel, &srgb_eotf);
@@ -148,6 +155,16 @@ void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel)
 	igt_color_pq_inv_eotf(pixel);
 }
 
+void igt_color_gamma_2_2_oetf(igt_pixel_t *pixel)
+{
+	igt_color_powf(pixel, 1/2.2f);
+}
+
+void igt_color_gamma_2_2_inv_oetf(igt_pixel_t *pixel)
+{
+	igt_color_powf(pixel, 2.2f);
+}
+
 static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
 {
 	igt_pixel_t result;
diff --git a/lib/igt_color.h b/lib/igt_color.h
index 0d8ce75b8..9fa8262af 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -132,6 +132,9 @@ void igt_color_pq_125_eotf(igt_pixel_t *pixel);
 void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel);
 void igt_color_bt2020_oetf(igt_pixel_t *pixel);
 
+void igt_color_gamma_2_2_oetf(igt_pixel_t *pixel);
+void igt_color_gamma_2_2_inv_oetf(igt_pixel_t *pixel);
+
 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
-- 
2.43.0

