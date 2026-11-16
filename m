Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B1A606A323
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 07:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=SRYm+rWg
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E2CE10E0C0;
	Mon, 16 Nov 2026 07:04:04 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013035.outbound.protection.outlook.com
 [40.93.201.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FAB10E2FD
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 07:03:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SgGHJh4NQkkIuEL2YZKqOD10X5Zyj73vUURMY3oFNgs/ixogS6VIOnVNX5Xj6j+rTiM3x7DF5R/8X3+bjK6H87FByL8nnC18fgBvD/XScssTpJ42CKtCKkKIeEOqDHbNO3C5iBfOCj31u4/9n8cMR5iUPjn7QFVygyl88OvjGa7uH/oikdD9SHrs70zjZlN3+4/meepyR5YErarTyg7kP6ACoy0pPTzv/+poPB9QDwA1+h9HIGLsXjGedhBrdk5b1Pf+7nn3JeWIT8SnUoW64kxJyI6UiJbDDGAwJEvksTyVyFo5bHLvlX4LBLOrBvOXGLV9Xblwir5YB7rmmOJDsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0CNbK7UquaTkt8g9y7aJEW85b+riwTdaJNSsk3Y4ro=;
 b=w7SiCa1lF8czjaUv9RTQKcM1LwBu0gwfTJfHcz6HsUM6sTNRG7sOo27lmoNnGv1CRA8AJA/RzTeyUI4rTum/lylROaQVioc+C3Wnif+/m150FDh0cn45sh1+I54+yUaJUJNXRYx9aGFc4N0iHmeQDQPPKogp+0a5e3Zf7U3WKKgcnbdr0c14nZQgAKnfiMrpyNe5R/i8V7Jpu4TMYesuXiKgfbhDkfCyvVK1jvUBFmKlAVtu8kDb1nxsRifNqpsR6KEnJsoQbBJ0hYeke7dk4+HwhCRVDetPtAV1v3/zjKSErNUX0e3UKB+zj3S9DN3UYE5ng2tMKdAFbu9GnXz1qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0CNbK7UquaTkt8g9y7aJEW85b+riwTdaJNSsk3Y4ro=;
 b=SRYm+rWgmxC7AgFfGegKUfgeBYlgvNYLvH/HhR9AGLVinDWKsyuVeWiVo7upPzvm8sWTJhXAnfmDGpE7aUB4Sp0u7JPHmtL1OLUB1lqnpowFOyTqxihPXyqxnwzn5rXhMGOAkqJ0a2LUOIU8J2m35J7v0SGJ3J8+IUZwK6B6muk=
Received: from MW4PR04CA0157.namprd04.prod.outlook.com (2603:10b6:303:85::12)
 by MW4PR12MB7165.namprd12.prod.outlook.com (2603:10b6:303:21b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Mon, 16 Nov
 2026 07:02:58 +0000
Received: from MW1PEPF00018894.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::2b) by MW4PR04CA0157.outlook.office365.com
 (2603:10b6:303:85::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 07:02:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MW1PEPF00018894.mail.protection.outlook.com (10.167.249.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 07:02:57 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Mon, 16 Nov
 2026 01:02:57 -0600
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Mon, 16 Nov 2026 01:02:55 -0600
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <jani.nikula@linux.intel.com>, <kamil.konieczny@linux.intel.com>,
 <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>, Ray Wu
 <ray.wu@amd.com>
Subject: [PATCH i-g-t v3 5/5] tests/amdgpu/amd_replay: Fail on page flip errors
Date: Mon, 16 Nov 2026 15:02:48 +0800
Message-ID: <20261116070248.4103604-6-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116070248.4103604-1-ray.wu@amd.com>
References: <20261116070248.4103604-1-ray.wu@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW1PEPF00018894:EE_|MW4PR12MB7165:EE_
X-MS-Office365-Filtering-Correlation-Id: 607675d0-7dc2-48f3-0429-08df43afa511
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|10067099003|11063799006|56012099006|261022105027099003|261028144727099003|261026140227099003|261021123027099003|261021121427099003|261102123227099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: LYy8ifs3Nrv2grJcTQn8Ih/AIOCm6GXhXc3sp4LvEaL3cPljQT5E2wqhnwVN+38vVpuj0hZ5bEh6sqDsg5si6hjZl8wQmyJybvmaoHwl0WZ1jps3hoqkLKG+teB/Ai41QAl65zgmIBVtavs0gqP+wkQQDsDBqPvaNritPyofHPMft3DH9+/Mo5wP0P8Vv7mg+tc80Q2Y3/9b49iC9ZqjIMeOH9qcSthYGY4E8WPEnyOylpoIBZDwFewNQVCDFR16rYvIilFrduj0ZNIYZtmSx23mwgQCa3zCN3P95P0ArMo7FisvTRIwbXFlsyd5yXrmCXWv/fWYdi9KyyLepxlAEbt7xjyPaO14LreWxdL99+lVj8ibR5TUAZVS9kslHIy9l8UQfb4fN3R+DNJej6VKiDNR39n99dycJVP7hE4CHEKeKl3jg9rpgOVE0F1F2KAJFIT57AWS9VjG0G3ryIAif3e9Vaq7z1MLt3qD5gNNb+3DfhYVSEROjPMjCKSGcL+86w/upXdk+7R8/QtqSitQuJMG3fOnhLo5fCtX8ZMvQDQlz4FrZlYqeLez6Hj1ZKg1DhvsTEN/YVOJOQF0CP9WfXAWTTxuF6rHPzcEnzA2Ziptldwg5PBKfBh5BMYai1iRWDrMkBtHMCH2gpAxcLbHsiMJ2fq8eVxv/ZjsF0qQCxzDdZNCPbVKx0kwm87/3k6lBO/TnT+aMw8Rx3t7DCQSHQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(10067099003)(11063799006)(56012099006)(261022105027099003)(261028144727099003)(261026140227099003)(261021123027099003)(261021121427099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: wFv136q2nyxy5twPhymSbO7AibfhYhZnCZ8syYU8gaf9qeblLXav4gC/E0UKqMnKWFLbkAM86+dMfJ9l6PD4MmBv5JKRTmjcILhVZqif+yU4J0N9mqJwoqld41gFlZSd6v1tnNtOWPN8I1wPtEK6ImeU6a3U/PTKKZbbnEWbEtgc7nGXOYfgX1DPY1MC7Pba0uc0DjnA0nAsARTMZb/VBlTEYPET3BkJz+9OROQGcbhOmpgXvjyqE221B+pTD7dgggYBj9OYdjXzYaXMidrVRw+tNSLJ5CW8RxpG9Yespt0XHtbkblQKfxjbL801KHXVodpbLNCfSTckZdANGJUtEmJgz9M0WTkzNalX0ex2IcNbdxUeIUWe+gPkVWaQSPAUrv9NKRrIgXUGZADU+Ahb6D5RRiFGA31pq2mWdpYjFvQZCzULQzf8dE9/jiYSOaaY
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 07:02:57.6894 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 607675d0-7dc2-48f3-0429-08df43afa511
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MW1PEPF00018894.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7165
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

igt_require() turns a page flip failure into a SKIP.

Signed-off-by: Ray Wu <ray.wu@amd.com>
---
 tests/amdgpu/amd_replay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_replay.c b/tests/amdgpu/amd_replay.c
index e73d2abf3..d97efbf1a 100644
--- a/tests/amdgpu/amd_replay.c
+++ b/tests/amdgpu/amd_replay.c
@@ -218,7 +218,7 @@ static void page_flip_test(struct test_data *data, igt_output_t *output,
 	for (frame_count = 0; frame_count <= frame_num; frame_count++) {
 		ret = drmModePageFlip(data->fd, output->config.crtc->crtc_id,
 				data->flip_fb->fb_id, DRM_MODE_PAGE_FLIP_EVENT, NULL);
-		igt_require(ret == 0);
+		igt_assert_eq(ret, 0);
 		kmstest_wait_for_pageflip(data->fd);
 
 		if ((test_mode == TEST_MODE_CONSTANT_LIVE || test_mode == TEST_MODE_INTERMITTENT_LIVE)
-- 
2.43.0

