Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324C5F36B95
	for <igt-dev@archiver.kernel.org>; Thu,  9 Apr 2026 23:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D50F510E0CB;
	Thu,  9 Apr 2026 23:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LNbSvOUv";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010000.outbound.protection.outlook.com [52.101.56.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80EF10E873
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Apr 2026 23:28:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PiDlfpAkML7GRe0Rj+0mBbnBPonK0MilJdBw/ZztFNCr9NwIbsTcB37fOJH/CvjVdVFBoqafgBI883ZTLr9ZmVrVF+r6u8qE6Zgj8HRcKXaB/pbcmwdEuzY0GZOBcos1XueOZViNNJ9a+5Kpa7wzHp18NKkra6f+w1ILebI46yMAgAJgnGo2C1rzpu9ztV/0YN6tKbSbSbkm4WF3ExWSMrw04g10uqs9VlHLk2Z3O04HebHtc3C8WRt5nohT7LSc0/ggPZrWptHnX6fwOdG54xStY6mplll8+wsp+LIfUfoQbXHRpZxFUsJgNVTuUBvS8tl3zRCpD1MSJ9FBWlWhvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vM7Lg0vCnbJLcdfA3PQk5QubMWpYsslvXiyv7adIUU0=;
 b=yqLzZdiKwNV4PmJ95m72BKztfGLZg2DmmPor+GjMsEXaOOi62XlqFkwmaoxukxFiwdBcZPNC0dzKA36JvccEp075/+oocpKN+sYbhOJaZzGl5rnWRjtOB6Djy7hlaX483MLHRY+fW0gqIf1wPfZpeFOAkp9sdb18oeKIQPYZ3K2AoGpFuVK6FeD1B6BSEn6hhEuQ5uE8c4ECzi2B7wVBe3DM4F97EfIS7oD33CB+S6qjEsOiUTsWbP2HK4S9oS3w3Uy0VxqJP+BVtjGIa3d4wN2ooLt4F4fogDg/n7mumbrL5UjOLrFYIubYDx7sce/TJ2OJfb/YRXVYy59ppQeW1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vM7Lg0vCnbJLcdfA3PQk5QubMWpYsslvXiyv7adIUU0=;
 b=LNbSvOUvApUMgglpPVy+GqYC3f5rFoeyjnqKrEfvrkXMt0kdfPBBUrDPiDi9VcHHQawgR/WvnwhqoPVlKjzA9q5DNYuHWeBraezl8T8qexq0ztAR6uNpoeOrZTd0WQSNNJ/MrJFxZOx9FRp6hxso56u9FVmcR38QjJYXbEM+sLY=
Received: from CY5PR17CA0055.namprd17.prod.outlook.com (2603:10b6:930:12::26)
 by LV9PR12MB9807.namprd12.prod.outlook.com (2603:10b6:408:2eb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.21; Thu, 9 Apr
 2026 23:28:27 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::92) by CY5PR17CA0055.outlook.office365.com
 (2603:10b6:930:12::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.41 via Frontend Transport; Thu,
 9 Apr 2026 23:28:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Thu, 9 Apr 2026 23:28:27 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 9 Apr
 2026 18:28:25 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <Ethan.Cheung@amd.com>
Subject: [PATCH] tests/kms_flip: Fix regression on non-Intel devices in
 event_loop
Date: Thu, 9 Apr 2026 17:28:07 -0600
Message-ID: <20260409232807.631457-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|LV9PR12MB9807:EE_
X-MS-Office365-Filtering-Correlation-Id: 71cdf771-d5e3-440f-a5a8-08de968fb3a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: cvckTp4GoUtpTI95oW2dKsQpQMcnZHSPIJu+Ow2HU80Rd4ygf3xbKgGV0LS0k5D0aVDHMTDciTRNzxNhjSJVu+FVOZqCETdtjs+quXT9RMY0HVOjxqdTJM4dvgw+uxn0c9UhOGADVaLz9QB2x1raERtiHagnNhIU2gFcSVyzuhBCEdu+mIcMAIlkwOF+RSVpLE0q/BmJZGKiQ+0MAjcgdMWu8qFxSfsgPhwN0Iklyntbp+iF4U+B3q/uODE+QQ9BrNzeSepkULN2tcdPurVWo5lT3rTNnbzkarDYsQe2PlUcxFX4EH4jWnGAUgYmm+hD1eLam7ddw6/Jkm37bdVR3aZCrTYdGybvrf9MBwBpTMgxH6M95DtIyUHNGE0oIhrtCkgCL/79MSAi5Z11I0PaQvb4LrqYziOro8zX6M859OvwYTlJmZWRSmoFth1pUpjXoHccEFZm4hHFRc1JcXeUmYnwGOxZJC28HSJ5ydgrlSBgO10Lfj7pN0Ccr+i+QSdx9OqDX4l6H0M3nNh1TPvgojQfYtTuonmvUBXNzEMvXDYndVRRpQLYKTCEcqiifGUfRpA/j4cxsR5UmvrKfUtELulvZE2aBxYjnHuQB1NiFaUVEf6ZLz9Ydmo84rYSEc8CnQInIxkRpMxs02c1jF1qW4TbiDmwYcHOkMBlqlBN6wP2WAywwoxzqgJMp1cIm0OvsKrdRxnlJoYT4vz7Qt1dDPT/fvniBVtW7ae/V7RDtqxUjihOikDNPPp+bNp/EixVFcqDAhQcNgGyVClab1Lybw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: f9pMjwFWu/SPZhWzwbiW7KydDZxeHPoYxbTNEm+0P1DIMYyUBs3TX/UmjrvEDR15yQf9kB7CtEjDtpdwJjHMMBp5RajJ7aKmtgySF5XVKc95GVrRq5wXfKRxsgEDe5DfKScujqHDokjwm+RiP5i5DUNPLUtoKtfVaGjdqy5rsXGmXrsT7yP3c2oKOniHZ73MF/dF002AYdLO5Fw0qZhmOWKc6HePJ49XTy7D1+/qHzvj49mPszf5U4UyO88bZnKmGvHro0DK7ZykuNW7q3X3Tk/T8qq1b/EuRoEXszgPpcfuHy1Ijx6Ik89u2RTeh4qm4APoYryqI2m9QHtMcg2BM+SUlqlYNr9zGY+/4eCStJxMrssqUtm5haAr4z/vGvd1OO60XGkrGcA51UOrgeVCMq4bRWV0R0aCl0DgLdb7lf5f15bDI+ZX2w53CbjNm9Vw
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 23:28:27.0594 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 71cdf771-d5e3-440f-a5a8-08de968fb3a2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9807
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

Guard the device-id query with is_intel_device() so the "wa" flag is
only computed on Intel hardware, restoring the pre-regression behavior
for all other drivers.

This fixes the following regression:

(kms_flip:15463) intel_chipset-CRITICAL: Test assertion failure function intel_get_drm_devid, file ../lib/intel_chipset.c:145:
(kms_flip:15463) intel_chipset-CRITICAL: Failed assertion: is_intel_device(fd)

Fixes: 2a9f1c1ae ("tests/kms_flip: test suspend at most twice on SNB && BMG")
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/kms_flip.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 81fa8dd5c..1ef9492ba 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1327,11 +1327,12 @@ static bool event_loop(struct test_output *o, unsigned duration_ms,
 	unsigned long start, end;
 	uint32_t devid;
 	int count = 0;
-	bool wa;
+	bool wa = false;
 
-	devid = intel_get_drm_devid(drm_fd);
-
-	wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
+	if (is_intel_device(drm_fd)) {
+		devid = intel_get_drm_devid(drm_fd);
+		wa = IS_SANDYBRIDGE(devid) || IS_BATTLEMAGE(devid);
+	}
 
 	start = gettime_us();
 
-- 
2.43.0

