Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC37C54E51
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51B910F2A0;
	Mon, 26 Feb 2024 21:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MaYdCdQh";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F3210F297
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVufGdWWQrVtqQ3IDyGFbmWnJlVMfxQfX7RMedrM+6ewT/VdOU3u4GFkPavqgQvgLzU4PLC/h9ETkSm8VtGPjoL/XKrfZ59L0qZghYlWmNOGg/V+fvFiUjW0IhVvwT1ZoKCKu6Uz3sd/kkrU7xCIfFtys06hiWDmAF0v/07rOLCKPgAwkC84eIKrClEDj/3Z3WlLybnJqKFktruexK/cjqVom8gyAtNysv1VJuJ2wtwx3FD474NDeo4K+YRZTTjRhl/+A8sNP8FqAPu8fqy7Ia9nL0CJ3qqrqvO6//pTBnbVZRb+ixUwCwRF6N4qwMjckSEZ+7tux8ek8n1CMlWgig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0UM2dJMy61rTcL9aE49UG8vjqfsdyvrHS8ctyTAjjM4=;
 b=Bf4ckVAq6f2mmyVWFyS31Mo4sOLu5wIym0HE55EypFpWLaTi/Xc7ZGuKDFdG7z9XtAAo3kLwPYIrFBnQqs9dSuDguoWvuZ9iEdF4/Phj2s+7jKOH+Y55drNUOB5ePAtMgMODbJ4TvDqCj1YKbQvqtib6vDBTwIP8doJ2WOhyAAch9KBewnJiIgfafm2khXmLYM+hnPa+DpNzBXxBmbZrkxKppIfmX+G0/RNpriixaBYKb9gNkFoGvneyv+dbWWJ91WTIdOKH4yz8EI3LDK5T38V1HgEn2iZAdGm0LJgH/h7WfcTEDNhmwR9zLUdOhPL5VAVh2n7VZ5zo3Ta1FgLzmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0UM2dJMy61rTcL9aE49UG8vjqfsdyvrHS8ctyTAjjM4=;
 b=MaYdCdQhFTljZtTBN4zGWicuPBZ2PmIv7oza8wGpXxnmU94YmUNVJ2rquu7lYPQ/PvgSrHO8nb2xUGzDu5srdfoI8qBSDqlgcqER9tgm3HSu/+9y401pUpZAbYvDYKYFzxB+A4IaMaiCnPLedAzDHu7E9NrWh5rklvbfHN8yfHA=
Received: from MN2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:208:134::37)
 by BL0PR12MB4868.namprd12.prod.outlook.com (2603:10b6:208:1c4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:14:44 +0000
Received: from BL02EPF0001A105.namprd05.prod.outlook.com
 (2603:10b6:208:134:cafe::73) by MN2PR16CA0024.outlook.office365.com
 (2603:10b6:208:134::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A105.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:43 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:42 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 28/32] lib/igt_color: add BT2020/BT709 transfer
 functions
Date: Mon, 26 Feb 2024 16:14:12 -0500
Message-ID: <20240226211416.100660-29-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A105:EE_|BL0PR12MB4868:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a34983-afdc-4e41-2048-08dc370ff484
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pfFRE93oksWKLXCi1AfxOEcIX22wEPR4ykhNZuVC3vQdVCU8/jadwGpcp9ljFHLP5qETCdbt0SZV6Xrad/oBkF5vP2sOWhGsBmyOrO6bgK6Y/lPVeb6uDH5OTPrevO+XKuxUkLy67yZHADxbUrip7Vx6n9bdVgnLBRGq0x/jGnQh9zT0gPgNdsxkf6m+mYKnA1Xx+q79PVdnm8eCdResReVfSrl7mGb6YTLpL2czVySbjC0wl2KDkViSObRwbeHtdW+NB1JjqUO47/9hb/Rt0OYg57NsuimejvZKCsNyTBvM7BxG/BkIvElilDdk5OYPiNnB9q/1HvWwS9mHR8QPUuOxV4Ks6E+rBgXWLD98k1UrgKfQgl9fwX1gBDry8pwLtlM7GxXsfcXIi4sNuwelx3phN/y6Z7kUvY6t0gTXFFdTibF4PkRg0O8+ZjiNZptOI0fqwrdUDRJr3Xhv36MQPpjFqjPZ9rOf1yGpHsiSHpmkK8UNoN9rNRUXmJgKHsel8KmDh6/DxlCwNbW1KL6QluZ2WG255aJn05bNyYtkNwzugYNxpEm+6dUeH7UIqVmeOeoMj4G6BMiXJt0POk6vZqikjRQr8d0/prL4sTgmXxns5F0TGICEzckdc93k+pXnhRwdslc2gX8dJEAm7UC+cAZhMEdi99LhgLSysJml39FInDiHl6EOuEfufRL8dYW0Wb/0XgpwLuKQYXbknCnMyJCNJRy+RAzpqnfGEJBAGxKfJq9mPmERi8tAbQFosLnr
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:44.5792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a34983-afdc-4e41-2048-08dc370ff484
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A105.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4868
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

BT.709 and BT.2020 transfer functions are identical, the
only difference beind that BT.2020 is defined with a higher
precision for 10 and 12 bpc encodings.

These transfer functions are defined as OETFs, not EOTFs,
so we create functions for them as OETF and its inverse.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_color.c | 10 ++++++++++
 lib/igt_color.h |  4 ++++
 2 files changed, 14 insertions(+)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index 0926385f4d82..ec8b27d1ef6f 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -107,6 +107,16 @@ void igt_color_srgb_inv_eotf(igt_pixel_t *pixel)
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
index a97383fabaf3..813bd19ba439 100644
--- a/lib/igt_color.h
+++ b/lib/igt_color.h
@@ -25,6 +25,7 @@ struct igt_color_tf_pq {
 
 
 const struct igt_color_tf srgb_eotf = {2.4f, (float)(1/1.055), (float)(0.055/1.055), (float)(1/12.92), 0.04045f, 0, 0};
+const struct igt_color_tf bt2020_inv_oetf = {(float)(1/0.45f), (float)(1/1.0993f), (float)(0.0993f/1.0993f), (float)(1/4.5f), (float)(0.081), 0, 0};
 
 const struct igt_color_tf_pq pq_eotf = {-107/128.0f, 1.0f, 32/2523.0f, 2413/128.0f, -2392/128.0f, 8192/1305.0f };
 
@@ -117,6 +118,9 @@ void igt_color_pq_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel);
 void igt_color_pq_125_eotf(igt_pixel_t *pixel);
 
+void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel);
+void igt_color_bt2020_oetf(igt_pixel_t *pixel);
+
 void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
 void igt_color_ctm_3x4_oversaturate(igt_pixel_t *pixel);
-- 
2.44.0

