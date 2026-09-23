Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74652C9830B
	for <igt-dev@archiver.kernel.org>; Wed, 23 Sep 2026 15:22:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A7410E15A;
	Wed, 23 Sep 2026 15:22:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FalCQhA0";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011056.outbound.protection.outlook.com [40.107.208.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FD3110E105
 for <igt-dev@lists.freedesktop.org>; Wed, 23 Sep 2026 15:21:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yAWKkvaBvSWv5rxgka/aaNBPFl6Nkry2goFg677HmOcNQS+b+ErWNLSjOzTOxT8nN3DIVDbvT4E2HaGzWD433oXH+ag65oH4xXXYpftJIeSlJMpJfUQecHjP2MpDNW/CQ0DdMsKIZlqGdQWH7LrTKHawo3oxPDCoScl+T00hXOYQu8T/l7hNJ4wIwVowt2ag5pZhcKiOj4c8jNnQvEPgC7COZtzHwldKOOv7u/dOKqGeO51ZmvDEd3c5HRGhm7/hWt6F/vaoWU8TwfmTPnIGH41/NK96bYas8MicaWG9mt5Mvi3qHNxvHzTeEZ33pD7qY7W0lcHhdI+W9CWntoe8eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbZo6LYzqfHuV1MOQGpIROcSPWAIpXVeJnR9HmKV/i8=;
 b=fusPWkfX6YEtgLFHoET5hHtEVjObSOtfmOeK5l8wPvf4pMVX/itfY9wKjuN3nhC2mI5pPQLc9NShnPToTQF6JYaWjOtN2kEs+xmjH8Hezmzr1tmMqHQXWgukLxKDr90QwGLJ1iri2I/XonixyBH5XpBIs8KgISeNlgvjAunTd8NGJxxz8qW/t2O5G1te9buHKBLy8rRoxoCCxjnc+IBRdpvGhHsWJTqYt9Dd2kE1/kTesjb182JJY35WOkk6NdEAGza/bsZ45W2Up3Yv7mdLgMCv7lDOo7AsqvKjZ4hm84O6wOJoW9YVWfUEnwP864neUwpQVcnZgeB/7PnxGbre9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbZo6LYzqfHuV1MOQGpIROcSPWAIpXVeJnR9HmKV/i8=;
 b=FalCQhA08kQwLYL/VhmU5ic5U4xOB1giGS4Xzg7DxIfsNfL/YipLlvaWA++dHm7OgsFrbsNU/U11W3aeZo9hGVPN4Xqlk1b0gXxJboy7UHlSVk2w5ED46rlGZ4wEinCo9Hyhcs7LLjMVhmK24nSlPHBVOt47A8E0Mwzv8qe7PTE=
Received: from CH2PR12CA0011.namprd12.prod.outlook.com (2603:10b6:610:57::21)
 by CH2PR12MB4296.namprd12.prod.outlook.com (2603:10b6:610:af::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.17; Wed, 23 Sep
 2026 15:21:16 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::3b) by CH2PR12CA0011.outlook.office365.com
 (2603:10b6:610:57::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 15:21:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Wed, 23 Sep 2026 15:21:15 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 10:21:14 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Wed, 23 Sep
 2026 10:21:14 -0500
Received: from aaurabin-tumbleweed.king-squeaker.ts.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49
 via Frontend Transport; Wed, 23 Sep 2026 10:21:13 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Alex.Hung@amd.com>, <aurabindo.pillai@amd.com>
Subject: [PATCH] tests/kms_atomic: skip missing CRTC props in state snapshot
Date: Wed, 23 Sep 2026 11:21:13 -0400
Message-ID: <20260923152113.1513938-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|CH2PR12MB4296:EE_
X-MS-Office365-Filtering-Correlation-Id: 235fa4db-41d4-4527-371f-08df19864f62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: D5iKH1VGEq+ZZopAaIhNPDIPVY5G+90FWFtAQv2h2w9WvzaCyGO43EAarrFBTGvhSr+m2pRwuIPh6zhqZGuQor9OhWnIkxJCc81raGw6eH6y2D+7mNk66m9PbXUK5OcYgE9LEMtSqXlv7H0H2NTxgZFlQcmFMIduNmnp8JHS6zDUiiai6l6c8bdU68Ll7CjgTjEw52iN9nX5Z7zhNS12jXHQkvZL8fVMogaMw1fP41DdPz6CIjbcqN8bd/SsFY/JUkQ1PH/4SFXbuR0rfUasd3buInCj3rOYTVd70+Xayt3lSwZhWnV3vVmWlkL3ZVzVEfOmZL+ZFE44rqPEP1Ppu1sEAbURc4pmUfCz+wcfiCMSnmV6HbTpJYpf5y4wTr8pHl2b5HI6njftjTtrX4cdV4J4h/ECmcld8FOYfVYN7OV0lZKiBNA+uqHmot84WYlw1qGFavFEZJRedIO34sCWI7FZIOPGaWfWYUT7Wr2zcANL5yVW+uTA9Boic8X7HL9glHkhO7cHjF/nYKGZSSdB9pZotW1ZEikpS9exBt77TBw5P7ISjLyjheGuEK4xFx+KGdOdyOG/pWEYIn0bjV0YzLu+IFjvuBjZ7TlIpCwp/SVzviNvrsLTc8XmdQFKcyNSDlXMoxRsNhSUYR30qMzGXDTry0M8GP+3GOzkFjUi4U3li+gdyXORX28h+xjhKPUapw8mciB6SHIK/Uh6vTq+Bg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +AFp49SN6B1qjy/opy9mTpbQDWf87yLNDTvQAFzTcZgEE6u2fuc6P9tOeuOkZGiPJe802YMkbTU54IqK4S0I0tGZnHDZgtL91ui8G4NCjeqO2l8wrc0NRywQ6/Cft7pYKly6KEvNE75gkkC1k/m3/kHqfpEs3xXsGShNKWMH1CTxuJ3hW74IZ/5TO3nB1yX6ZqsGtD/sE1yLwCR7P18iqvnDwsjuNwwuRilEKGVRIS6PmI36QAjFCri3D6x6/jD88Cgb+ZjfUaSHnxhqwTO4p8XtSvCoZ41t+YuC3sL8HuglMyNuLwRxj+yuhxwgMxc7+5au0HW+f1uHe69lCyHLZA8H7RZqNM5iXnmoHKcNCesPj1Dbk0LvHKhlCiCnPg496+8XQzsZ3ANaOklF3XNqsQ0wjXKJv+7xk7Hi/wsm8j62cyBhapLfVPJCqcJlb58h
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 15:21:15.7502 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 235fa4db-41d4-4527-371f-08df19864f62
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4296
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

crtc_get_current_state() always calls igt_crtc_get_prop() for
BACKGROUND_COLOR after 10fc80949. Drivers that do not advertise that
property (amdgpu) fail igt_crtc_has_prop during atomic_setup, so the
entire kms_atomic suite dies on the first connected CRTC.

Only snapshot properties the CRTC actually has; igt_crtc_reset() already
guards the BACKGROUND_COLOR default the same way.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/kms_atomic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_atomic.c b/tests/kms_atomic.c
index 09b7915af..20bb80182 100644
--- a/tests/kms_atomic.c
+++ b/tests/kms_atomic.c
@@ -230,7 +230,7 @@ static void crtc_get_current_state(igt_crtc_t *crtc, uint64_t *values)
 	int i;
 
 	for (i = 0; i < IGT_NUM_CRTC_PROPS; i++) {
-		if (crtc_filter(i)) {
+		if (crtc_filter(i) || !igt_crtc_has_prop(crtc, i)) {
 			values[i] = 0;
 			continue;
 		}
-- 
2.55.0

