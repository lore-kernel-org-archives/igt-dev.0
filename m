Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E1BCC6B1A
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 18:02:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD9910E0CB;
	Tue, 13 Oct 2026 18:02:27 +0000 (UTC)
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012029.outbound.protection.outlook.com [40.107.209.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7681410E0CB
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 18:01:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nzpaE8hnT2LkBLpN7eIrGQJooGUlKYJTNMeehvAx6DfQREDhneE8ZUorBWvdOhgI0FWESIDvZJaUylqFQntHxqCRsM0DICfqOycqLNFNiBc0W4wzfzvF6HjfeAe3x7epW44Bc4qqY4sWqBslHWwqQ5A5JPRHSH9UE+8B+y4b/Ds2yOhyXY6it8FwLXG9F+dHBvx8O5fE5Wg9IFE1RVLhH9KungT08GOdM4yTvDcktoJ7/e2BsQP6KXlrhGIdY/YZC9DhoRmk7rRLzQxXeY4edeBCNgiPxWq+gbAmj/Dc/CvNfJoHDNZJ7NwY4VLp4Nq7kCP/5QSLFY3soU5KPiT/9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=edcE8c1hVApbCF4vt8IE3YMSWnA93KjT6QWUlwHnHFE=;
 b=MiEPQrrnjDcYIP0ldyH8EfZ+omCzIQhNLpwd6m0/GGgXUm0WxrTxaBhn24AFqMfeVYptaeJ1H9xR6ACEiC9Q80mc/Ibp5Dwa1VQWG8xRcPYGjs2QDddKMrGiwU6LIfCvkomgOYwsa6JjubrH5GxqDKTOhqjYR0p0XTxa7yIvoeq/dRO5C2BtRU5LsoMQszmNxfPqwmOeBD/2+qs/WImAmew5CR7pehlTtCLxvv1brA/7vd9BVpOzOBnXYiGD/xYO66C6QSL1uy6MYpBuhklf0Hx+XPYixKpXCVizAEL42/oer0srUSvgvH8AX4CLCCQeadieED7xLl3WyZvvQqc02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=edcE8c1hVApbCF4vt8IE3YMSWnA93KjT6QWUlwHnHFE=;
 b=f7FuUYt4yl0RLNoGlg0kFFMvjyHSiHUZWmc8BXFxTgmVimm2e5qhuGNex/Pe9iMaDIrdIuNCJWkc9ctLhRsYK/SnjpFI+zmN7FLIX61kUU0VHF6ObxPDpDzkbgoUVKP26cgkwnmzKMaQakX7BL28LRoaNgT4tB1OxNiEFSQoR3c=
Received: from PH8PR15CA0008.namprd15.prod.outlook.com (2603:10b6:510:2d2::27)
 by SA1PR12MB8117.namprd12.prod.outlook.com (2603:10b6:806:334::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Tue, 13 Oct
 2026 18:01:30 +0000
Received: from BY1PEPF00026957.namprd05.prod.outlook.com
 (2603:10b6:510:2d2:cafe::64) by PH8PR15CA0008.outlook.office365.com
 (2603:10b6:510:2d2::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue,
 13 Oct 2026 18:01:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BY1PEPF00026957.mail.protection.outlook.com (10.167.244.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Tue, 13 Oct 2026 18:01:29 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Tue, 13 Oct
 2026 13:01:23 -0500
Received: from aaurabin-tumbleweed.king-squeaker.ts.net (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53
 via Frontend Transport; Tue, 13 Oct 2026 13:01:23 -0500
From: Aurabindo Pillai <aurabindo.pillai@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <Alex.Hung@amd.com>, <aurabindo.pillai@amd.com>
Subject: [PATCH] tests/amdgpu/amd_hotplug: Check sleep statistics before
 suspend
Date: Tue, 13 Oct 2026 14:01:28 -0400
Message-ID: <20261013180128.3128748-1-aurabindo.pillai@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026957:EE_|SA1PR12MB8117:EE_
X-MS-Office365-Filtering-Correlation-Id: 70284f3b-5adf-4165-56aa-08df295401cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|23010399003|376014|82310400026|1800799024|56012099006|261009223027099003|11063799006|5023799004|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: AFUo4nJxns2Xun8w61XU+AmPJTWAYv046+m+5GyP2dX1kS3tYZQMP5/gAzd3B75H70vmOXMPUSVnL/CQ22ySM8WPS+Ax42khrG8memvvRfJmNOFPPPXK8nnuauGP0GwntpOrGkjFQe/5gh+x2UCi+gmOE71sTbLHK+IKLV+Urs1NHjXaK6/lKk+BWYUX60fhYwit/NylXAGpbUQDp2w9hupguszvdOhBhsOwkiqjYkehOO1jTkNIjg4WiLv1gZ0UCk9lnvRe+115ZLcFSIcFb6LDy0qbLEoURgesFfbP4dlANPOrdis9CpSHwhMFoTjZOhtsfhUwbK5NQwl9IN2PgkWx7NVZl6LHHrjwWyNE397zUJKg8lrH0MpRFCZhO8Z//dKG89fHGqDLVRLL+3y+0abv1dsduIt3YVnuuexXS92R05zpTcnFdcUJwbhpH0qLpJapXTNIUdNkbLIaPdrL7PavvbrFzzgblEHaW4Fww9YscGNcq4Fr7mKlle7zY1LN+JxNqmBCKhCk2CRHbye7b1Mumy3wkKzIQ16OzqcJahkSiWT1hSlieLfJBtQYd8Uq1BerkTo+DrXg1wjsZ8kNGtlcVD0uQyG9XEvkZWY5hpHOtes7mKPML2PFD2DtKrXRCioVgQMFpYSMjCmUp/4sljUiFmfJh7KC8GYTqlOqnY8Hd5q0s1UUuiS45Af2NbdbETwp5O0BXbT2iKHE6G4G+g==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(23010399003)(376014)(82310400026)(1800799024)(56012099006)(261009223027099003)(11063799006)(5023799004)(10067099003)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: s2oecWKxmTfbStExFB04frqPBKjO3pKJbzSscD9whZAoNQuxUg9izk+L/D3gZfTsGr/HzS5uy1w696153CcvkRBBDD/OKVe6iY8HCy8GHxVlrjVppnCyo0eKAp6cC0FqPOc8/LiNLwG2Scxws8CleGsKySc4FDrKUqrolMnK6fkPiaSr7jiD2/2anZq81j1sMnJEnkhiu3R69U0it/oxRyqkG9MuxvXWnj2DZGZxL7D2g6uQIMynMEzkpyYbSasKqaTkMxHL4Cl5lJ+9vMEjsEFmw5I/nJKjDY/qZ7lD5o5F7rPoaRN3sy2LBuHXlXfets0v+hT231rhV7JNqVB2ufzFth0aNZaWz+gEHioxJ1cUGkWwrvzgAS7+bigY6ICpQoKOVDvE0Akce0PMuVtmx8yPQMnt+O53cyeBea1fm9QKnZ3dNfVhGMvJZYXz2xF6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 18:01:29.2976 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70284f3b-5adf-4165-56aa-08df295401cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF00026957.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8117
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

basic-suspend currently checks hardware sleep statistics only after resume.
If the interface is unavailable, the test skips after programming the
display and performing a suspend/resume cycle.

Read the statistics before test_init() for the suspend variant so a
missing or unreadable interface causes an early skip. Accept an initial
zero and retain the positive-duration assertion after resume.

Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
---
 tests/amdgpu/amd_hotplug.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index 509d828e6..29d0df153 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -129,6 +129,10 @@ static void test_hotplug_basic(data_t *data, bool suspend)
 	igt_display_t *display = &data->display;
 	igt_crtc_t *crtc;
 
+	/* Check reporting before setup or suspend; an initial zero is valid. */
+	if (suspend)
+		get_last_hw_sleep_time();
+
 	test_init(data);
 
 	/* Setup all outputs */
-- 
2.55.0

