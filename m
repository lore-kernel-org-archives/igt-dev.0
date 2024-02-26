Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D17C54E55
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD9310F290;
	Mon, 26 Feb 2024 21:14:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t7rqVhAH";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2058.outbound.protection.outlook.com [40.107.102.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C2E310F290
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IA5u5o6IHdeLkwMohVHsEkU01wYdlQNAydi14qZB6ZPnBYTzscY5WxkOPzqyxbnwW2s78DeAzBox4Wckdzw6dXYsNc24hPlF1sb6fi1NPSU1lbLCERhX7XFcetbRifpus8GRL7B1biBRZD94NlsfPKNL6ZIoqA+7u+8wmuopX5E2uCPg9HhMz/8fWKrr0c5lf2c0XQ49RaWn8+dbVH4B6COzhJ0BeBrDoTi3PkeUn+v9sENluxvXd1g8yHENNaHrLobjzTV//ux55Ut93DkkM/a5PnXl4n2k1CjnCbRJbAJqlGAZEw7/dKXVqvy83nf25Wsc+Up1t7U2pIqYvl/kGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E1FKEaaK0dVUequiVJ7ee+q8B+9Of1/YtT039jKJNsY=;
 b=CbUfwM+9b9unCZ4FDySo9aZYZbO09H7kDECunKaI1HTJr6WtEfoEJk6U5oxIzM9NtysuY5VSeS2iZQHmDTO1s7all1sekCGXU6qVGsfKQ8PUjoGa8UIm6zH1SmT+iS9nr9D8FpPda4wWgDURMN6QsLP7uxv5NlQOVp99OMJzy2AylzM0A6lKOD9KGLsw9WJ8PkeJjznazAWZ/0U1CqWTIZusixQ5a2YnXISbdc3ukIhELfi7WBJaNluM4jV+RIsDtFFmAnoEbKe0GnytsVNJcCUMJ6674fTYnf0Gxj22nA1AvJY+rzZ66ckYWaaG0D6p11q+QZYsJ5Eq8A74g1jb8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E1FKEaaK0dVUequiVJ7ee+q8B+9Of1/YtT039jKJNsY=;
 b=t7rqVhAHT19uGSayhPeRgTJIxLO4zBX6ebfhtFyorRa5DXP9of/UDXPnjAFVo6BeIskmH3M4mtb++5E5c+Lg++d/HICzVADNtdF7Z0YpUeeqJdr2o85sTA2rYrnYsnZVJZO8q9LaEicPxHgQzVeHlcNkXOgO77GZG8GqmvZf200=
Received: from SJ0PR03CA0270.namprd03.prod.outlook.com (2603:10b6:a03:3a0::35)
 by SJ2PR12MB8740.namprd12.prod.outlook.com (2603:10b6:a03:53f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Mon, 26 Feb
 2024 21:14:41 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::c6) by SJ0PR03CA0270.outlook.office365.com
 (2603:10b6:a03:3a0::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:39 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:39 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:38 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 20/32] lib/igt_fb: Allow any non-planar format for
 igt_copy_fb
Date: Mon, 26 Feb 2024 16:14:04 -0500
Message-ID: <20240226211416.100660-21-harry.wentland@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|SJ2PR12MB8740:EE_
X-MS-Office365-Filtering-Correlation-Id: 539bf41e-c379-468b-a2f7-08dc370ff273
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zZBc4fkvOH/iVrUBF2MsTL2QbMAim5aml2jBQj0IX8Aw5sAM43nym+ofiqOl9mTLyw1GQkXDXCuIlmgE7tVlP31HxL7nO4mpdzQqwbc4/8IhveOkoOC/uCkykC9LlyLM6AqFxGkhKAGIuzFSg+deKFdgzWBczVsvGDqzyuF6thrGlT5QR1kDZ58D4MsQvQiMqzK4It4pmAgHykAc+b4DDoZrX9qFXm94OaBHxhKpjvh412PMukEjn6diB0Ce4vjTKxh1kTT6vq+Acr/YaaHuXNuBPq9UyCUf2Ym/2oi081YlFXjf/iWl1Jd+TOc8vMExGfALPrQFGJ9BEZdkV+hJCNSMQcoxzNyqNpI1gMwSiNsLc/D3FGgthk/dTTrd0fyo+jjtkEdu/cw9ERNB5QCBP8DF0QBuOXuJ3FECFnIJwAu6o9xtoipbXtjNy1gtHsb6CXE7M3LH9MmDYj413Eb7xWuVBId0mZ9ogFT2bgmfLGObEmVGQEMv1a1+aPEtARI3g2iHmC7tZRXjUQHBiJ6oZJuQvYr1N5d5hfxFb0sb57C1xyRYJFn9+Mio051h1E/GvNj01LE9MKYdPY6bTWjrQ3uFRbHBIWUoU+MfvzuDbEyVthz8DpG3IkqH58GwKWS6DaSd22VIDmep1Kh1VSkykfcouiHXU0/Gk5rszbDFjuh2YdzBx/jH6CHBUyyD/5qZ6aXAInnqeiws5Mu441Vz7+vD3HMeJirgHsZ6zJYy8Jl+28U0AbPXL4eiMZ62/owB
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:41.0688 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539bf41e-c379-468b-a2f7-08dc370ff273
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8740
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

The function is able to handle any non-planar format. It's been
tested for XRGB8888 and XRGB2101010 so far but should work
for a wider range of formats.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/igt_fb.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index 13e9c29b1f3f..3c1a166ca2e9 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2166,10 +2166,6 @@ unsigned int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
 	if (src->num_planes != 1)
 		return -EINVAL;
 
-	/* TODO expand for other formats */
-	if (src->drm_format != DRM_FORMAT_XRGB8888)
-		return -EINVAL;
-
 	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
 			    src->modifier, fb);
 
-- 
2.44.0

