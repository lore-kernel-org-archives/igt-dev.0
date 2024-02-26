Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE47C48BF6
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BA0A10F29B;
	Mon, 26 Feb 2024 21:14:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yfEr/kTD";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0025910F2A7
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+DjoOXJhTssJovuIKZaG5NuZlU9xxPjsGKMEnow9gYFiUTIdhrQe9o4MxSycJXWLiZgNxM1mSTE5CMmWripTo5IwxqXvZdmUB05uFB5jctDYM0eld+fcSLJuouk+ELVEGwO6it65NGpi3A5jMFqXIIkx+SzdYBkSROgbiwYTCGSrJdVrm98vSrQ2WxZvMZPywR3mjgSXiYBVSxD+b+Nt7kB2sXMEjy+VuBV9j/8zMoyHhW53inNOoC9izEGY8/U/qZNq8xTYSXfBPzcwcIuGbEZlkAvZEpt18Xq7Dk9GuJ1ub9GMqIuWI8IoypSEZP+xc41QunbsJjzS9WEiEBDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+7BYChWkb5A1SNoGkjbfSdkPTmc2zDYPORL1m3y8MA4=;
 b=UyAwUEw8Zy9B3RQ0cZoDzP0TS2uGjlJNJalbd+HG63eHtwQfzEJubLf6R6IamBcTM7J+2U+2hPqbOkdiPRIsWsMABxzdztfO+MQcjVKc2fnNBLHcG8Xpr396Wipu1FQH1jJyYGtBm6xqEgBP70gw4NmnGWsO0j/S+IXdi38/TZyAdHzGj4rBWk2+dVmfrSfDFtV/ykqOjSH7BR4ZTqzYs8/xCoNQZwjygkDOgNlbKNSCcQ30ftvUfvmvj/JDfn6VU8NB7+Z1OOQ59VvoMn/9APbw/GkUBcTlqe8mS9/lBL/6Z9w1Dc7EhIpkMnIKfgDaNb/3ObxGUky7xXD3NMR/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+7BYChWkb5A1SNoGkjbfSdkPTmc2zDYPORL1m3y8MA4=;
 b=yfEr/kTDyr2CT3tWjM1HxSVfRyZMI7aoiUvmkaQjk2aiRTtyQ7J5vPiGGe0An2j1Cp0iySTGvnj6rrSHSQCdAMAr6UHoT9C6nmagecEszGVL6fbLAiE4XCsNaHVJEYk5bk7x2GvQHPbvVB47MoHylq03V4CE+F94Ye6EQcrWAU4=
Received: from SJ0PR03CA0260.namprd03.prod.outlook.com (2603:10b6:a03:3a0::25)
 by MN2PR12MB4551.namprd12.prod.outlook.com (2603:10b6:208:263::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.36; Mon, 26 Feb
 2024 21:14:46 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::b3) by SJ0PR03CA0260.outlook.office365.com
 (2603:10b6:a03:3a0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:45 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:42 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:14:42 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:41 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [RFC PATCH v5 26/32] lib/igt_kms: increase MAX_NUM_COLOROPS to 128
Date: Mon, 26 Feb 2024 16:14:10 -0500
Message-ID: <20240226211416.100660-27-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|MN2PR12MB4551:EE_
X-MS-Office365-Filtering-Correlation-Id: e99c36ad-95be-4c2b-e7f3-08dc370ff500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P808ov+mV8y/63pMkjdJhwQZQPQlWewost2FM9EpBFwNkPGmrTa/xslc0FJZdHBntk1Eg6lgcbgr0BwoYJAotrFdJwe2L7g6Ea3qMeNcJAnirSBFsivcUQr+QWs8LXbsiwoQwzhnjiRNCs1rG7V441WbNghVuO9Re/LQcuiTpplrLGUlTSLmvOJNLuIKRFPrnJZ8laxrAGqM5rmDotW+tN1wcpXkNrTLnhxTGlPMvkXk020fV+48OA3RUh+gHe3LS6u2x6IwwlQv8nc9JgJnrBhUz4Eu5VJjP/Bs3nDLonztS7krtnkF1l4x4o01doDY0zzn5wiPpzG3JhQ91HwDKrOBisGTDbk2o4E5WvZxzKeruCdvDFQkGf00pehA8hiqicZuBLklOX5hkSbygFvd1FHrCCVX7ermIa6yTFmDiOzQc5/iPjSl0iHfDPLZMJUlHOpOxbk/jeSXDBP5spnDhy6vw5YmvQFyaoshD3ESop1qeJYt2tps3Ml0G/1bjhPnastXVmNsoweNe/doTMZ6FBdblrbl4455JjgPliHvt3T4EKvGVUIj+GrIZgW1o9a8ohIYVXJzZkiDkzvNE0WW3JDegszrcNGfHGKa02Silmn8ajFiHP+oG8Y8LbSl48So1up9Q0ek7bJKGz6CovonMGfighYclxb3r0mcJNfpO7+XFTx8rObR5wIsaFW0QGFKPAgcGkCgO+IeAPbMiZHsrwihb6sjzDJxVhD5jQ7xFR7CVSbXw96WeDopbhl3X0/z
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:45.3344 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e99c36ad-95be-4c2b-e7f3-08dc370ff500
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4551
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

From: Alex Hung <alex.hung@amd.com>

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7af126f54c26..d9a27a442427 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -90,7 +90,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
-#define MAX_NUM_COLOROPS 32
+#define MAX_NUM_COLOROPS 128
 
 static struct {
 	uint32_t connector_type;
-- 
2.44.0

