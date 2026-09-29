Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667E7CA5FAC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 15:53:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE0410EF2C;
	Tue, 29 Sep 2026 15:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2yWKNoap";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010017.outbound.protection.outlook.com
 [52.101.193.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D5410E1AD
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 15:50:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NM4vILBDlLBOg5H4188pM6C1sssWo32OnTHH7wMcMzlPkWp7birKiu5ll6QswvlgLdNjfExHkYpcMLB16nEj5mRgDsBcdBrmAFE8CrrCntFXOQwB1SRTu7cMyx3DmymNL9kmdWGlpuv+Rmmw50gYbLS57TzvaZORjFE18/I6EPR45GQ04/9YZ5sMX/vy0UZ6OLcvNO+p0itFygFLW583RogeJWY22HjAgUDW+PVcoJbCVl+iZkIS/xym1rBh/VyuXAwvFR8CBe0TLiQYmk7gEfOoXasAh839E837bGlwTzmXjZvmtDGtCJ+DzkgPAN+wvtFNkZ8OtGyENKNjQGmYug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0i7nKquLyLOJr3wQ/8OA4+TgfTCuvkV7W/Z079eMeP0=;
 b=go4ZIv4McajjVZNRNhs9BHLaM/F/I3RcWAXBmCGCxufKxo8DKmHXkREWwWgMw82k1CL/WFhXhmbQ/gA2i5d4zNKulPcISWM6+lNi+ixsRZcvbbTlKwc+/lqCsPgS1tiOhwrGM/eZE5fveFp9QugMC6usUvAQ/m/msFtVYgJlyK712AvHgNnax3FRsrnGuweJExN0XfAmk7svT2YXVxld3eACI8xro509rHy5hBqwoRS7N2pb/YPVuQuv2sUSLG1STuyYVpYqxEothHe7evd056k3205bKeYHpzk0TXxAOlnRYT59LbFt+ABJLkxxJFP8qvto85vnwZBVoZ870cE1mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0i7nKquLyLOJr3wQ/8OA4+TgfTCuvkV7W/Z079eMeP0=;
 b=2yWKNoap1qDTxq3ZoKr1NqH58flQry0FiQFp/MhkGxRzq5kfFXQxYKbbQuWY0AsUJgjDABGWUwhlHOXe1GiwOhaz8yG8/6UnAbj6VKKaRv3noR3Tmd7fVAgVVU5OXmT82UjXoZR/E1bZAED7jpM0d+qFYBq+tmJcnthiH01DxBQ=
Received: from BN9PR03CA0711.namprd03.prod.outlook.com (2603:10b6:408:ef::26)
 by PH0PR12MB8799.namprd12.prod.outlook.com (2603:10b6:510:28e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 15:50:21 +0000
Received: from BN2PEPF0000A804.namprd02.prod.outlook.com
 (2603:10b6:408:ef:cafe::1a) by BN9PR03CA0711.outlook.office365.com
 (2603:10b6:408:ef::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 15:50:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A804.mail.protection.outlook.com (10.167.245.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 15:50:20 +0000
Received: from rocky (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 10:50:16 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t v2 1/5] benchmarks/gem_wsim: Preserve const qualifiers
Date: Tue, 29 Sep 2026 11:49:46 -0400
Message-ID: <20260929154950.838280-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929154950.838280-1-alex.hung@amd.com>
References: <20260929154950.838280-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A804:EE_|PH0PR12MB8799:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df3e89e-bb9a-4c92-33c4-08df1e415df2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|3023799007|6133799003|10067099003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: U5MUnJf8I7B6b4VjorEJtivAwAa0nnWmTSVgWfTiz+XW/akDqg6EkCDAbcJsjFHf7uPkb/AKK5Jtn7MzwT0VHgBzBD7TJ0GEQiSC2ebJLLwbsrfu+tWUcEBn2OaFHzSHgFWQEG6kxo6qfzKi74k/JmsP4ut4Fp+4zbbrMDXf/6ZvIdyy9Y/bxhBOnqZ09aNy4YwuME5MsJzhXBWzpFxb7R5ILdFkOCkORL7sVQJhfzSeYHzZMPFb/UWRYneBqpwCMsdYx7ijEkMy8LLqD4j5XQulPAEOeKiYu3KOL1H7NRbghDMs5hCgfz3CYQf5KGwXXcbBv52ImSw/98CcxE/ptrdg85eQ5ijwhWSppHopP78jyemrpuB6WPdydNwfrzgumzyqjbpw0w0G4PCTk71iWl+EOXNiRxIp8fQov9TbQZHZpawBNB/0MbElL/WIb/EXkTmPg1W3sS3G0YnXeYKLOHyvKzex3LGqXVSGcIceA1ngux1yaGEsViFCmK92hHhjMHUSXknieT9fNvnDoSxzBmZGmha+nrI/xRalgowFEjzKSCqaIOHnyEjwu19Cm5DhW2dqn8c/uNI4jFR9Mudih7zGcyKZ7MC+6yFPYBDtqtFbWtsGdAtqUL0Sw9YDwUfyaiTyWlFQmyYipXg+PseYK0hyqu/OSBPEsc5f2gxArYkRhAci3Gy6a3R17codGsXLq+RG8YmJ9ndzjcQbjQZlMQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(3023799007)(6133799003)(10067099003)(11063799006)(18002099003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4DhLNV9Cl7V88ObKGS3WZfPzRFUliLr3bPQpQ0sqNsU6W3/SKSH/rGqqk3PQp/qTrAVpnu4CgLP6VOMRNnhkOj6b0/pOLBh0nAFcHmqOWrzEATKkFDwuRnjsjs8jEi2kgozx65hPJPSeICiUXEM8cp7d7H8AeY/I0oDK8ffj30dOGHSfAYrDdiaNalRUzwzuRrjOogZnwUdFWmhY7MsooogSCedqqJLxuhz0VPGYPFR/YEHJ1Pgj+jfD2m8MMFZlJhcka81PhUuu/LCo9TbAjKOwPQJOW5gDq20M0UwtVWgzwRJMaGr06t2kpfyaTrVVdoU7mRwLMvZXQMYm+YIxfNM8poRaX6pbGI8CJ/53FDsuJlhWK8ruX/nK1vDTnrbFfetKVg3cKEna6XvJx7xp0b06WSu8bcht1zk0LNseZ0TDYC1xLs/+DStdiZLapzY8
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:50:20.7323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df3e89e-bb9a-4c92-33c4-08df1e415df2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A804.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8799
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

With glibc 2.43, strchr() on const input returns a const pointer.
Storing that result in char * causes a discarded-qualifier warning
in str_to_engine().

The following warning is observed on Ubuntu 26.04 (wrapped):

  ../benchmarks/gem_wsim.c: In function 'str_to_engine':
  ../benchmarks/gem_wsim.c:590:27: warning:
    initialization discards 'const' qualifier from pointer target type
    [-Wdiscarded-qualifiers]

Use const char * for the engine separator, which is only read.

Assisted-by: Copilot:GPT-6-Astra
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 benchmarks/gem_wsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
index 1a4139279..8cdf940f9 100644
--- a/benchmarks/gem_wsim.c
+++ b/benchmarks/gem_wsim.c
@@ -587,7 +587,7 @@ static intel_engine_t str_to_engine(const char *str)
 	}
 
 	if (str[pos]) {
-		char *s = strchr(&str[pos], '-');
+		const char *s = strchr(&str[pos], '-');
 		char *endptr = NULL;
 		long id;
 
-- 
2.53.0

