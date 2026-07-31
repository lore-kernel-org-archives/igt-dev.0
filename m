Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DD6C5516D
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 18:06:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77AAB10F380;
	Fri, 31 Jul 2026 18:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wfBbRhiC";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013028.outbound.protection.outlook.com
 [40.93.196.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8DF10F36A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 18:02:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQCeUeUsq0tx0OHfCAIBTKO95UklUiJzACoWnXQ6ei3zmh129E/eWWu0bwPDhdcbSsONaLFc++/ppwG9K7tH4lsSh23I2FFb78WUE9MdJmZ9O0ax0qkQVUAKDCQtJnirkt0a+DpisQMHkBF6ADxUfsY9t0an8jcw+PgJtcGycHoy3rGdAgud0oAvfoiJxtb5LrX6TNs6YFwJpol1RyCyht4Q5fN6Hn2wLc4Tgtwlr8tmRsOJxJNZVlTAiv+ToMjYd4spuhTo8AK2ad2Mf6SdVFN2syrGtEmnYBhMlx371mNhJFppFg1gsBDE7sbyKhtC+I8kgPgT9JSgYPPbEL7/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0G9JIqtIvXLpQmDRtrS4MLB3/+hA0nnkyP2kr1tcQA4=;
 b=FiAvT3BZgzQ9XGe/9Mo2x6sdAXh31NrdrsKxTBK1E3njrFIYHe5ypqwe7JxIWrbh2c//T7ItrmkOmRz4QaH+LSBgh794XwP4VvQmqsrlSL+zLkBwbhEUwVlYXVNkz3NH+CmaZni/ZvDkQBkmkiGERZx1GDVp+9b+kllbflFyY/F8N/dAeERTQacDbAX7EY3d0oV31eMfNWX9CdOLnJ5WbkwJbvIXYrVfnTmHKV9VrXbaSe166o6cgz7SSW+4btGRvaI7qWgdHRkwgXOjGDThFRS5t4kN5P/B7HcFXfDrmBy5m2/4LOGWzz0DiUep4DdZ2iBrhClBaCVHaM1DwIiQeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0G9JIqtIvXLpQmDRtrS4MLB3/+hA0nnkyP2kr1tcQA4=;
 b=wfBbRhiCJ5DMSzagfxOQRfLdIX8Ltzxk1PiSyivjl8oVi3WYmLz+6FV1cFaPwcH72TlIzhDvfGtV+jucTIiAxdH/b8m2rcPdGOi6eet38pG9jov1VMJ57+yRabrS+dh2OKPgs/a+oS13xhkqs2EMZ77QO7wDioXn0bjixOz3tcg=
Received: from CH2PR16CA0012.namprd16.prod.outlook.com (2603:10b6:610:50::22)
 by CH3PR12MB8329.namprd12.prod.outlook.com (2603:10b6:610:12e::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 18:02:19 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::26) by CH2PR16CA0012.outlook.office365.com
 (2603:10b6:610:50::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 18:02:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 18:02:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 13:02:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Fri, 31 Jul
 2026 11:02:15 -0700
Received: from hwentlanryzen (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Fri, 31 Jul 2026 13:02:14 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>, Alex Hung <alex.hung@amd.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v4 10/10] tests/kms_colorop: Increase VKMS bracket to 3 up
Date: Fri, 31 Jul 2026 14:02:00 -0400
Message-ID: <20260731180200.668795-11-harry.wentland@amd.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260731180200.668795-1-harry.wentland@amd.com>
References: <20260731180200.668795-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|CH3PR12MB8329:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d19854-1785-4aaf-d397-08deef2ddce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: wx0HBGel76YYS35+57E3urRMEHyJe/piRR93lP+S8dQYkKgRriY123u/RhbC8hxv1LmkvNHazYYuITEMMsJrlImWw8Bg/dzAZ1uN2Uza0aO9YjC/Zrk0fzYiJzmRwKlA0qAtbt5HFEj1UNCi3gM3kcUU9fAjORy6v0c+th9IgWUPz0mD/GD8dvUSN+RLb3UDx57Y3UuHciUJBxOLSnKwDTrDz+TioRs9azGXrxtefyJHDVgWKAYaTS/oIOserw8DTjyLXmadFZ8pB1sEt1oSfJ6v8CZQtXDM35fB/0fpRySLn78fjvD06ZDguAYrZ9y8Zsr6nG0GnMLgrE1pmcR1SX9xYRXDFICN0S0x4FCHVffz81gdHfhRBeSsXZIqmtIlGL4NWeev/ONzQS8UrBgFVYnx6vL62pCF4lIxNlH6sZv0D/uC34M/ViYn1xzkq3xJApqf8QWGF5egCnGF9xI4JphK58DC3L6H3VTjHO6BFqMvK0+I+BRikQAXNyAnjnPfrkktRi51yRAQ7qKwYKkKuvpMC76P9ftC6hKnNAGkmMNAJ9AgYdU/V+WvjAbCSyDS2qYrxIwl+r34F9WbVskEPGTupkK6nYbtCGtswOqWCjcy4fRR7cg21jCTJSO0ZEWCJ0m4zE5RG/H7+G3RIyTslCp4CAMj+ofdhGmAqsfzxpYH1PyEsh+MIn3ZYjTBry17BYti/9YQDh6+bYCsLmDPlg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: AAqwX3v/2PUi+SoL4B3pQc/jEkcj6Kr8vY0J6ncrdr1IexkvlAVWTv5X1CcfXXr4hxD0c2SWhsEx5CLis2FCN3qEi5maYfgxY+e8v6cpLvgfV3vX+wVuYTKp1gNhYYdar65V9U1nDMG56EuGIRSYQ3HUyVZp6aV7GfjIwIvEj+owwrrQ9sIGxB74YY9bRbtyBy9f1XTyqBCTZZ1rMF2gdah7diRAgA+SI1sDOMfQnNzsG3kwA9VFeQc1JkQhThXJ0Gha5oQ6/vhONgzjotCweWa80HtW3sbyYktAEFNv6SIrc13Y3ILgsl5Mx6UxnEluTNTwKW8losjUWuvCIvbI2gV2/HWzuc9cJCe6WCX+D2+I4u6Zg4OfjYW4wNnV2SX72tCDWzJsTmgIneEN3k80jHEgbsyR52taISuJ+KWkr/p1GqrB568wKx0i2eMb9Cch
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 18:02:19.1434 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d19854-1785-4aaf-d397-08deef2ddce4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8329
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

The delta is a bit wider for tests of the CSC with other colorops.

Increase it to 3, which is still pretty tight.

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Alex Hung <alex.hung@amd.com>
Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 tests/kms_colorop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index c6adbc4b9121..732b9d57f71b 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -234,7 +234,7 @@ static bool compare_with_bracket(igt_fb_t *in, igt_fb_t *out)
 {
 	/* Each driver is expected to have its own bracket, i.e., by trial and error */
 	if (is_vkms_device(in->fd))
-		return igt_cmp_fb_pixels(in, out, 1, 1);
+		return igt_cmp_fb_pixels(in, out, 3, 1);
 
 	if (is_amdgpu_device(in->fd))
 		return igt_cmp_fb_pixels(in, out, 13, 13);
-- 
2.55.0

