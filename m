Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A7CFED9EA
	for <igt-dev@archiver.kernel.org>; Tue, 17 Mar 2026 16:05:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 453A010E6DB;
	Tue, 17 Mar 2026 16:05:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yfUkwyP/";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010005.outbound.protection.outlook.com
 [52.101.193.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D90810E5A0
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Mar 2026 16:05:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iMjLNfkGaZQwcm6mixN/ti7YLBjJ9Lfq/6D6xMZMTn3p1P2vJIkCtuPdO1tmKWb++KXUn0B+QwhtwprNs5+7zpCcPepYweQwJQW+HJaxDUHezXh8bW4kB+IshpxyWicfpheJrLm3nhwx+nLrkJO5aIjMukzyCsCZAtiWz785IkBeHZks7Spu8Fd8GqNzF2ZN/BPMEJpeG7RJK3hH/eXlxswaUQjBeiGX9uOMF7wUerWneT1MeS5IuUqNmtFdD1fWAYgMl2hFtS37zTXima1vOWKJu+onWNIioKaViQgOKo/hqyt9xe7sK3+IkRF2ixSceQLtd9KkWDfiHiCSv3iKgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zjPFA6i2SaNZcbZm+d5MbtOQfL+6VYQR+mnfdujYh3Y=;
 b=lx8b/nJdbNd1psitQr8G3cA7cneva++B/Q88TNzX+73Xn2ZLO0Q75RkyVimnk9ERhtbuXkspLQ497HzqtVE7A2rEfYETGY2s6vhSjIm4Z7FJuwRaaqDoKbOIo36Hxtt+ZysVxX37jzQgxOQ0Zn0YLWHCgobWEmUfEP66sLzSAAIhhobqrgfxcze2GyU1LWxWL0Nt3gaAqTcgWwfurQzuskLQgO1VvB4W7gmzFKc25E16Ham5Ea5sb90zl13HX/Q7z626iPRo/vVjG/NyHwwBYmuj/TYUYr7jJkV+eDretMVZTYyyPGzwPl0EbuPE8maqbGbwAkIlLhAtO/3Zpu/IZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zjPFA6i2SaNZcbZm+d5MbtOQfL+6VYQR+mnfdujYh3Y=;
 b=yfUkwyP//mkvZTa+syVmEhOahGdBeAFhYyXSWGJxzU7vPilZlvopD2KcPSe7G1TXTmYn+rdlpl4H4LavnomkMCqn8j3bOXP24PlG35NnRFrUwE3ESAQENyZscgOW3d9AqPk1j4m+GlcHDLVkZF2lHBq9eEQysKCDEOZVf16RdCs=
Received: from SJ2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:a03:505::8)
 by BN3PR12MB9596.namprd12.prod.outlook.com (2603:10b6:408:2cb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Tue, 17 Mar
 2026 16:04:55 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:505:cafe::8c) by SJ2PR07CA0008.outlook.office365.com
 (2603:10b6:a03:505::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 16:04:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.17 via Frontend Transport; Tue, 17 Mar 2026 16:04:54 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 17 Mar
 2026 11:04:47 -0500
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 17 Mar 2026 11:04:46 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH 01/10] include/drm-uapi: Add DRM_COLOROP_CSC definition
Date: Tue, 17 Mar 2026 12:04:27 -0400
Message-ID: <20260317160443.229812-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260317160443.229812-1-harry.wentland@amd.com>
References: <20260317160443.229812-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|BN3PR12MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: 2379bbed-70b0-49ed-7f5c-08de843eee18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: RCMeprVQW0T98JxhiptOT2qFGaESIsfAO4EcytXwEfD78Pnwjgetw7M9PEV6cDN9w19HheCkphlrdP72eSieOmAdIIKO+/52b0kd7IxYPhZFjNrlfmqXLxXGA8KNnw7sDAKJhx5aBa0o+6Lzu81VtjNQ7Aus3IiA1YaJr5RLHERqOAxM8OtsVqZEeU/AbIisXmS+kmp/rkrjE4hkVGp1qx4N07egAzHQvuGMhAfdRAnA+RDERMtdByG7+3zKnGSwI0GxnaNaTJ4ifPN8Iy2yROkNVuZEsL0O2p3t7aEySdCNpRK1QZve11BVZgeM6WqoYbJk75GkaASjidm1yQvC/P2Z+GDwrTQWzkogBoAIpXJOURyK7e1S0u79FJrr774QTOkkWO2ssTChg/3mCligr8nqkx+RD5gWGxsYrB2CHBn/+JIbtmHTU7vFaqPFCpUO2aFZxvhdptkz6ld/bCzkJbNFMrK4yateWY8O3jolzOd4vCW1rGlvBvO/QglwIz59rcotqX9QzH7FDlVlz24LnOHLeJnCKrNyvIdit0+A5x3U79ZgB6XMphfkVCJTUosgvw5xqHE+zZzm9u3ZNYt2QzbzneBiiDpq9CQKr8pm5gNrZoPReB8Sf/L7cFdRlUM2fzerpeyvcZuFBKZ4hLM0m3I1KtythhgJghCC+lucpczY+4dxLwxZRKmzXaq5R63nvCRCcQ0v/csEKIa+KOI71gxY1UI8k2x5d+UeCogVxHtl9C1NC7LjanCoPASDRuNg48H00j8otBqRmRDdrk7MNw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ZuA+AeAyeWzeqNVl4G9oYeKOJ3m4gsk2vQl14+eY79WuNUf47PZK0KskueP0+nIjaDEtEHOKkq4h3Ml0YCLM1/UKepAGaj4Y8VY0/i+dKauNjCJSQO/EUTqagG3CI+2Bbe8KJQK26tKqFHWykup5jozyiyYPHWbC4bpGI2xGM/BnGxwc1FP4NtoxR+qs2WcR4DF17B3Yxj3Yjg4pc6IikaN6O+cZVvqi2ka4Oa/G9woHbMWui1qs/MQNO6fu2NUBxtKujiaS+Ka17yBASweB9hscMPDKcYYzvIxd0V5UxQWH5Out6IpQvcl+xjT20jzMZJFZNn34QcDeZvLoQaqWkWbykHSELefHo1guYZwJ61ISQGvd+rZtKJ+/8cXa5fISdUFBB+/R+w/2geu/7I6HIMBU9xKicCLPE2tU602Jdgu9BwYkWy46FJQB5/Vk4eMp
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 16:04:54.9481 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2379bbed-70b0-49ed-7f5c-08de843eee18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9596
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

Add DRM_COLOROP_CSC to the colorop type enumeration. This colorop type
represents Color Space Conversion operations in the DRM color pipeline,
enabling YUV to RGB conversions and other color space transformations.

Co-developed by Claude Sonnet-4.5.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 include/drm-uapi/drm_mode.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/drm-uapi/drm_mode.h b/include/drm-uapi/drm_mode.h
index de10ce859fdb..f7e06a2660cb 100644
--- a/include/drm-uapi/drm_mode.h
+++ b/include/drm-uapi/drm_mode.h
@@ -934,6 +934,7 @@ enum drm_colorop_type {
 	 * LUT size is advertised via the SIZE property.
 	 */
 	DRM_COLOROP_3D_LUT,
+	DRM_COLOROP_CSC,
 };
 
 /**
-- 
2.53.0

