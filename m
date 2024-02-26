Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02FDC54E49
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1F1810F28E;
	Mon, 26 Feb 2024 21:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l9BxbbdJ";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2086.outbound.protection.outlook.com [40.107.100.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D034410F290
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j7kS3rPfwoEp6ME9qgzuVVIQrXQJi1yIteyOfuz/Yc4symVXEjz/lgNQmnmuuVZ5OQ05na3HFz7qaKFeLFLQcBA8tOyo9IEDi3K3KI8tvcimqXvZzVE4asuCN4LTXTeuxUbBM8ZlKcNKUM9GzltCiizGn6JSgafKX6GnMHi+ls77fAmqiVkY8zbUXxmUKa1pqgi7Zaa54wbbNTZd4lPujQJajMh8PT0HnI35+nQe1WsR9LlNTU2XWn4kS/nXg60rSWo9WWn1X9SrI0ieV/D96SiAOPCr+8DsArTqWhMDWyeZ4z3WLLCjQ3z/vLrzp5H+H92lqG3+hgE6nQC1IWqtHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IvpwQXsHVaR5TBoSuT6KMMowyWIqv/tUksP/g9o3wk=;
 b=XfdA5AkeggQDpIBe/bYyWiw4oX4Q30FbU0llXYvQD5cnc+ecGYdgClFNRXx/BC3Pnj2cLoU7mo84E5oQen/OCk36ARDQA+Ywmy3h3EE0ZwM6RzTktEA3OllLxqcTyJVO+BXrsVcnWWABt6/mVELANP0ZGKSqFxA2skcFVWuLXtjGqIbsNXJUpU8Lz1hg6sqeWsvBvceyV1qGrbpaXDNzjPOMhJEZ0F6sgStmViwLCruI3c6YZiE+7i2iHHDjq+rLzcLLFlwsc6m2Z4TvMX6OF48b5cSwYM78XdD6xmzACNOoYBaKwkx4LJjmBMdR79IBt4Hzl8+EnnZJXZM8zzzqNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9IvpwQXsHVaR5TBoSuT6KMMowyWIqv/tUksP/g9o3wk=;
 b=l9BxbbdJ0/pWWLe90yQlHIZ2EDXnN67EtFju3D1qYG/NQLxcJ1E8s2qVeOZDSC/9YMtzz3n8WQ0BUC7ew2fsqCM0zhSOTtiV0mOMB1HYkG8HdDX5X0VfmSlLenpdiIY9ED9y4aFXBD+7JqQLZGQxl6DW4I1eTENfeAOdxSWSLOM=
Received: from MN2PR15CA0031.namprd15.prod.outlook.com (2603:10b6:208:1b4::44)
 by SJ2PR12MB9244.namprd12.prod.outlook.com (2603:10b6:a03:574::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:14:39 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::2a) by MN2PR15CA0031.outlook.office365.com
 (2603:10b6:208:1b4::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:39 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:37 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:37 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:36 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 16/32] tests/kms_colorop: Add bypass test
Date: Mon, 26 Feb 2024 16:14:00 -0500
Message-ID: <20240226211416.100660-17-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|SJ2PR12MB9244:EE_
X-MS-Office365-Filtering-Correlation-Id: af7a0843-2180-4770-2f32-08dc370ff138
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MB/89ltXdKiiseg+ctp6Fdf2L1sRT7+F8L6SsIPl3hc9THEtm5tPpAO7Z509xPHfwwbyHyK6lfC4q5uIUO/qPYaLw6X/RhNwXnDoiXPTj9jAloWHEqOilpuwuwci3wmwfU49oEVeofUrtDTS8GH+qgcTl3Bbf0+xKP72QgtJNHCbrq4gAsqMooKjs4Bvj9/jsuATLMOkOb9VfocxJSCz7qwNo2z2t0r/OdPaiZ/lMlPQgndTtVsSD8Pdx2i34BeTEvlj6EbNiZnPZw0y+eBHVZM3Ieq2PY+5xJNxox9qmb2AnTq1vPyUTaiz1mySWKVxspXv7nGAQ6cDlGtoKQV3Sdptq7twd7DvBB/JL/Yhpb6F9WlUrQrdIUlvoKblWAjUkKE5ecQHbpL/5LMG0utaOmy+DaM2/QZxbTF93LN/NO9E36yMqsfIOxDt9zFStY2Vm7BX7Oh4pOjx/Ms/acNCeTmRj99SpIeNusXJP5C8V3BMURTHVT4wQg9icRhrK4zzAn+aCXvfQydqhkVn6JEShaSoVHBCNEG+1mWvh7tB8mMGXWgPcLUQ67e+dnP3MvQf+RlwlWZVfdm07Txsw+04lnH113q6SF5i+R8NY+x5QZ+PX/osCzlCURzgkA7Ac8edHG5yGPjlrfm+4CicYALMLcdYzAYpU2kKX0glQ1doBU5q6wH+Hibjk/druJHZI7eRoiZc/NN91yDn/iKKB46yTMgDDTeYQ6cuvuflNhAixuKTVXEUomlCnZyUr7Bph23/
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:39.0327 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af7a0843-2180-4770-2f32-08dc370ff138
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9244
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

We want to test that setting the color pipeline to bypass
yields the expected results.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index e5c7377de850..5b7f81c83af5 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -40,6 +40,7 @@
  *
  * arg[1]:
  *
+ * @bypass:			Bypass Color Pipeline
  * @srgb_eotf:                  sRGB EOTF
  * @srgb_inv_eotf:              sRGB Inverse EOTF
  * @srgb_eotf-srgb_inv_eotf:    sRGB EOTF -> sRGB Inverse EOTF
@@ -440,13 +441,18 @@ static void colorop_plane_test(igt_display_t *display,
 #endif
 	/* discover and set COLOR PIPELINE */
 
-	/* get COLOR_PIPELINE enum */
-	color_pipeline = get_color_pipeline(display, plane, colorops);
+	if (!colorops[0]) {
+		/* bypass test */
+		set_color_pipeline_bypass(plane);
+	} else {
+		/* get COLOR_PIPELINE enum */
+		color_pipeline = get_color_pipeline(display, plane, colorops);
 
-	/* skip test if we can't find applicable pipeline */
-	igt_skip_on(!color_pipeline);
+		/* skip test if we can't find applicable pipeline */
+		igt_skip_on(!color_pipeline);
 
-	set_color_pipeline(display, plane, colorops, color_pipeline);
+		set_color_pipeline(display, plane, colorops, color_pipeline);
+	}
 
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -487,6 +493,7 @@ igt_main
 		kms_colorop_t *colorops[MAX_COLOROPS];
 		const char *name;
 	} tests[] = {
+		{ { NULL }, "bypass" },
 		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
 		{ { &kms_colorop_srgb_inv_eotf, NULL }, "srgb_inv_eotf" },
 		{ { &kms_colorop_srgb_eotf, &kms_colorop_srgb_inv_eotf, NULL }, "srgb_eotf-srgb_inv_eotf" },
-- 
2.44.0

