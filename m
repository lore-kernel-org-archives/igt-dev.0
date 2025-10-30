Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB6C3CCF9E5
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:33:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70B8F10E8BB;
	Thu, 30 Oct 2025 04:33:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZsG1MFqc";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22E410E8BB
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:33:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5OlfT5rpKuMB1xP2ohX/1R0BDXjJ1OFtfuVXKaazwOJFoi84wkekHF61J7MEPRUalAjvB5MgeruH4WPSTRozhwrX07B1sJCPh3C5WeDaLEo++EE3wgfoeN9eOsU+96j02vf9aHFda0/T+pjbZeSqzk83zjSaSQ6HtLRhmAb+f3fephT1GSQkNKji4wJ9zYFKsLZZfNp9z7s6bzQUoE6au8jgUnea19dKd3FUIlkKr9wohdsOCrK3vCkdyio+tIyIcr7vk9SL7fGOeWm+kAQnV+p/KsrZuWkiXGrl6wcar8at4V/OKEDt3Hq+xXtvuF7zMcKo5858ZGiCj/uhseDdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mdwkc0WWZMWv5tjIdRHOEFDUaw47GkRFT+GE4X3aTR0=;
 b=vDp1r79iq5aFeTc19IdZgchGzQ3x/fsHjfufx/r0Fj4aEOTkJMSEfAL++LRpwYOHHI2PC4FZhvURp3HNJUv0+bSUGZf7NWic5lSrnnFRxw2wDWACUeF+69A4wJ5cPwraUeqeN0pvH+EyFKztTRvZmTya5uEVShg2SE4cRIdMhuFmSL67HcbvC0+F6IdWa6LZm3rh80DWLeb9DBK5r2tNYCO1ylg37H50WNZe1Y/64DTmVdhVXW/kYRyLlTGflgys6ST1XFRsy+yikwoVqZ7sF8sdcuuMApKJeG3a6ba8OBYqmOQTNy9SQ7u1Pj8KOkKY2jVnkxGXuVPSCyDkcJyrNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mdwkc0WWZMWv5tjIdRHOEFDUaw47GkRFT+GE4X3aTR0=;
 b=ZsG1MFqcaPKnP7fqZ31iptiaP7AXQcoJ8UYl7GsIczdGoP8hGqI192z9LtVE4lo70pHARw5NJfQL6JI6E1TcXqhFAjthEqC+VFHzu8ZwHOvCVTJNXnEQX7ZkRKgzqzqkD8GXZW/brCiT0ZBJdhplHTUlU5qVX8J3sULskzeDCak=
Received: from PH2PEPF0000384C.namprd17.prod.outlook.com (2603:10b6:518:1::70)
 by CYYPR12MB8730.namprd12.prod.outlook.com (2603:10b6:930:c1::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 04:33:29 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2a01:111:f403:c801::5) by PH2PEPF0000384C.outlook.office365.com
 (2603:1036:903:48::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:33:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:33:29 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:33:28 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 23/32] lib/igt_color: add BT2020/BT709 transfer functions
Date: Wed, 29 Oct 2025 22:27:52 -0600
Message-ID: <20251030042801.2315866-24-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|CYYPR12MB8730:EE_
X-MS-Office365-Filtering-Correlation-Id: f0b8f1f4-13cd-45a0-aa6f-08de176d79b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QB9WLbgX5zeGM1al3e2hzMT+2MYOhUPRT+fNNW7oS6VHjsXVkP9VAd85L6KH?=
 =?us-ascii?Q?LO9NSjTzZLXJO/QD+7eKEPE8aOtnd9+ro+QRPfQ+OG85HfurmZg91ZCnlh2F?=
 =?us-ascii?Q?qlx07r3T5Bqi8JYMn77HjHAnjkWOkOj06T8b1q6vPojxVTx8bzyIYI6ju12E?=
 =?us-ascii?Q?JVE4GM8E0M+AASZTg5+7PaRNjoVryIin2ohBmL0xe3klOjfqr/pmH/uGJ/0q?=
 =?us-ascii?Q?5tTPDHbLuijQU0ZIoPXyKtA4vJLrOh0AwQkaWG+NnRg0cxvHfH+V3KEDkFF7?=
 =?us-ascii?Q?w0vXFpv3TAPqpY+lEQWcWp1rfs0w3AXCay1V7XQPYIx8YSTn6K9DyM7r5hJi?=
 =?us-ascii?Q?Y84zq04OQJIXRZ3YN3jteRshT08pOilOAvg0T1T7AGAw5wzMRs9pgAX0ZAK2?=
 =?us-ascii?Q?y9/j6rZytdiMeIuvHfq7gjMT9itird16B0VIgRrvrkfqkM6YOdxesA7etYda?=
 =?us-ascii?Q?ZmTbONeMTDRzp3ZvvjJEew878MFuTeV2k00Lr7VHWjHX3PWdo20ZVZ8xTxLC?=
 =?us-ascii?Q?WVbBA8WcGm2I5O1V+ZdSNNNVTM4X7zyeOpisSUw1HtHhu7wsq7PvNm1NCUVE?=
 =?us-ascii?Q?rn8uSoA5hCIxMUNUjPMyIqXK7ToayQKRlHzrW6gHC2jjBH95Az7Jv93ERHIn?=
 =?us-ascii?Q?PKY2darjUxtfnSwrK+atK1XvN6InsLN8A1Dx8WGbcvfMQgyfTPJ50uLncqlN?=
 =?us-ascii?Q?ujDF8ulDEi1diuO3ByEnc3CIy+dMJO58yvD6oACIOYbG0IxQTkEikO4KS2kC?=
 =?us-ascii?Q?2g5oR10GMmqSUIEINMDpNjDTPdpdbwVr+VlCxfT2ZD+6eXL9iKWJKQsLHu8H?=
 =?us-ascii?Q?5JVnPU4o05qZd+BQ8rSG2Z1uw9hKo0qa8ET4I4wsGZj19hVgEFGUbi2zA/eO?=
 =?us-ascii?Q?sbtTHcqzKKJAPG46N/Jt7P3X82nsDzVrqQOUvAU5XCTm5QgI4havss1COzWA?=
 =?us-ascii?Q?aNB+TAZ7xkCqsbb3C6wt0aOqBkIivQ2+cP5YJkl86L+PpG9MXygfOEGnQEQA?=
 =?us-ascii?Q?sOeWcpyc8cN/BYTTIyiTWqffdITFb7HWLDaMnJ5jPUJZWSUcfYcpj1fKYQn4?=
 =?us-ascii?Q?681Pq+i33Qpdj0O/LiQUXZL6UQZ4rHFtkk5nZK0D6VgFVGgHWYsEX6xRODgT?=
 =?us-ascii?Q?FUlgLHTvYeN3Fwss7qumNwegySlf9bdJKUd8xw0fzGvxP6y/Je3BZ1UCYEz8?=
 =?us-ascii?Q?Ag6ko0ivjVoSHYcCWP8E6vyr8F8sgQe8jvyGi11HxgILsXNoCq00xmZzZc4N?=
 =?us-ascii?Q?+uJGUuT5wLixQTty5UViZlIwKE4cFAwxQWonVK6lw6HhPYn3NIRIpMsuDijV?=
 =?us-ascii?Q?cFT/ev/hftFzJ/+ctgU+T/kEzOXcvvCa54LhNFWWjrNxQyRsIDFgOLqwnbGg?=
 =?us-ascii?Q?IJbDNeBYyoV4vMLzQjrQn4UcwFe1dsrYduU59PEML/mc4jHYLrzIxgIi1TGY?=
 =?us-ascii?Q?eq/kJG5qGEYRaU+jqvKHLmJ/xWcL59r4+PHCNHG5LSkCgY/8Aw+uz1TWJwzH?=
 =?us-ascii?Q?eZcVpUnobDxdnX5lLcZ23NWPvO2EKHzGJATgHKA2TpGRkvd3yySfRnGtNosk?=
 =?us-ascii?Q?dThLF2HSEpupVGTKJCI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:33:29.3342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0b8f1f4-13cd-45a0-aa6f-08de176d79b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8730
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
index e0b285162..d3c030199 100644
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
index 96bc9db5a..0fd9ba691 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -27,6 +27,7 @@ struct igt_color_tf_pq {
 
 
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
 
 const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
 
@@ -103,6 +104,9 @@ void igt_color_pq_eotf(igt_pixel_t *pixel);
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

