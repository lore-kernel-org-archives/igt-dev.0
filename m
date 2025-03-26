Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F85C3600B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4306F10E793;
	Wed, 26 Mar 2025 23:44:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TCHz1G4I";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2060.outbound.protection.outlook.com [40.107.100.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D173B10E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:44:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o/u9g9BHJN0Q9qk6ARLhcB4jwTSDvxsCk6LGCDH/8v1NrHciroD5ycFagqqm3ZxadoHXqdovovFsUmHezE56ZeH39jgT88X7rIEiXXtpaTvGHUxNzjRq5QHRHWdSTfBjkCyDwjF1iDXSDz+mgr3l/nOPIEPI9M3yaNJK5Jlz4jFeKKhqNgz15R19bYfXtl5zYhI6Spn6VdOWyBMJQTxkAcJP2RnUa8QtY7bb+f+fCcohetIg98TMzTiYp4WeeNcaTwK03F3J+CqojjvlzOzvXUXqnU9l5i8mZ5B3Tog2u9P+7aMmfIwJKJ2/HF7OsHm2CiKhDVepbjJhwgJCuD0lpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPc6XA7ybuBgjbs2Z3iziii4w4UGxzKg0Few9krb94k=;
 b=SJxcik4FdJWVWxEr8gHc0Jwh4ClIK89I8y8SJ1X5yHjOW2azrMiBj6PVner7UWNNxqBH8jt29sc1rr5Gn5PPTYcxOKK5m47s5rUdrO5wMvVWQakfvSMSX+3+Z8nSLGdLzSLKDY3gdEKXzil8F25ttBll4gtjErYkFaUBgU/s/oEWG0He/YEyge29Pc0+YNWGNAPcth05lSqtRNie/gdh0ERafoPUiNNDKyG7AzyLfjbAxfn6kIcrdCpQyrSEQDctlqcRbu8uvW/8dNhKzLeg2ZwF2SDnqhDPXlUeebJd/sOwkM4J/uCI2cm9hLcbuXsjYG6Au6cnFG4oKJyJfyH7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPc6XA7ybuBgjbs2Z3iziii4w4UGxzKg0Few9krb94k=;
 b=TCHz1G4Ih/35tczjs6RhP/zckVLsNa6S5t2Stn3KynQfUY7i/UVkA+aYYx4Pj6JqEvturSdS/tKYCJOGWnVLF55gxb77QLsxp2c10a2iFuFHDSgF/DWEmuUDWKyrX256eYrINtNqlD7gMsGRYQn+l0EEb4ibCQF6oKFIOfrBlhU=
Received: from BN9P222CA0023.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::28)
 by MW4PR12MB7288.namprd12.prod.outlook.com (2603:10b6:303:223::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Wed, 26 Mar
 2025 23:44:45 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:10c:cafe::27) by BN9P222CA0023.outlook.office365.com
 (2603:10b6:408:10c::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:44:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:44:44 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:44:44 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 26/37] lib/igt_kms: increase MAX_NUM_COLOROPS to 128
Date: Wed, 26 Mar 2025 17:35:58 -0600
Message-ID: <20250326233609.2980110-27-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|MW4PR12MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: e036e56d-fe6b-45f2-e4d1-08dd6cc02fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WpLZ3uPkv9dLrtYJXTirQPNvrp6W6j0Gd+BCF6V0cDzm11Pdn+DfQ3++yu1c?=
 =?us-ascii?Q?1mpeDH3zmI7RGQZoWNUoBrSgoFDa0MrcX56q7OKj4BC13GEURedaWQEnSccP?=
 =?us-ascii?Q?091d3lYF7dA3NG/TyU+eqXEX/wGau+Oe//N6eJeAilWNAa9E+7wX+eEbnxzs?=
 =?us-ascii?Q?miCYo2eoEzh0tUglT0pfYZVjImdKxV9CSGAeI+nvVPBx04a6CHt2VnITkirl?=
 =?us-ascii?Q?0fLS4aCaGdWAWqXTCKH1vjQzofYNR+MdRCECIu8wqrlWAJTFQiYi0j0i4MeA?=
 =?us-ascii?Q?7j3HZusMybMhsdR7ZcQNu22+NS8m/N5EscW6ohqYx/Zk7zrm+tD+ax2Kk3Vz?=
 =?us-ascii?Q?2rwhAtupKj/ifjOvxs8xOHiNUSwzEiPmXTeMghHDANm9kkwtZuiJHlvfvhLp?=
 =?us-ascii?Q?p6PCs+0pB6QWkVQfZOk/MohY73yyljWSPSwexosEwgHsmf0S6fm6hq1G/iyi?=
 =?us-ascii?Q?pwbeMlqcWJpUFDPVYH7VFsXOr1gDdl4nHsqfUlnw8U/i8x46+DN2xTFJbsv8?=
 =?us-ascii?Q?+RQdIRXQ9/P/p7e+vMheGmYxGR6dQLjCs69PgZpClsg0NpmmZtj99aWzqH2O?=
 =?us-ascii?Q?oJ+qc/+vkySOppHyPKLdFQ3arYzApCA6EaHfgy5OGZUnJt7THVkecqa46DTc?=
 =?us-ascii?Q?WLGwTK/WvTkX4eUNafTO44OO5m3SWdae5tTo8I9EhBge7bO2wItqKCWWQVYV?=
 =?us-ascii?Q?KHl8fpCFXZH3A2udwZTJJrNGT9r/65NeV6Jhl6c+PHTC0IKHJrwUE366Jl/N?=
 =?us-ascii?Q?sOS15QoyDyvBakcT9OWe8DKRu4ENWWBISdyxvJvU27qOEAGMRayh/0a1tzMF?=
 =?us-ascii?Q?Jlkb2KUUR0LdTCCJD0pEk1mwpgy/VO8RxJ5IBAvrJXBnslmtp5WIv+r/ra2H?=
 =?us-ascii?Q?96wbiM1SVe0LmPImiVylg4+6TGpmAE3AeLjTYi7BxQwipVDwXTHoTq7r0Gpm?=
 =?us-ascii?Q?yenZ/jS9Rt3XEjcDb86XQgFO5uovMyyDKh2UiGbD48KSpVWzFfm2B+FiqBlC?=
 =?us-ascii?Q?A2Y6N04rHaw/8CvrQeIdGUaVa0+mhz0AsNysPAV9PsB2Tb7/EcKsOvqrwdEB?=
 =?us-ascii?Q?gvJNc1B+uh3KTjV3b/j5cy34y0r8ztXfJ2I8FW5/ivVswOs4yHBwf9MvSc1k?=
 =?us-ascii?Q?zJi0wSL5ZExQC5eSF0hbG66bRQJOJ7rJgfWoeZ8GTQxxMKyBd5BFr7MsXHVZ?=
 =?us-ascii?Q?h9txiH7sZ+tqup4hZkTVK3BZZ1dxu/UAi0rSIKfBnRUYW2rGP6YeNMEcyWPw?=
 =?us-ascii?Q?9WQGnOImESyURhRPft88sZzuf/9A/SIZY50Kyd6itM1mK4eBTuiwW2W0sGCX?=
 =?us-ascii?Q?3CRzPHsjvxgIvsfaUAK0/1JAxVxCTjIfhVhyAA92MR7auqLf+LXtn3HOXyvC?=
 =?us-ascii?Q?XHRcj7ws5JITo9lv2edkXo3iwCWED2+IwiWDKfkchb3WzjQ9GlxXRp4X0Y2A?=
 =?us-ascii?Q?VNIJ+6Am6+Phf2XHxBjKByaMKB1/OqOPFs76OViK5VeQ3LF7j4Io3uPNKqxI?=
 =?us-ascii?Q?RR0I/YBBGhecqgE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:44:44.8208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e036e56d-fe6b-45f2-e4d1-08dd6cc02fd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7288
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

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 lib/igt_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 648f903c4..b20cb9cda 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -92,7 +92,7 @@
 #define MAX_CONNECTORS 32
 #define MAX_EDID 2
 #define DISPLAY_TILE_BLOCK 0x12
-#define MAX_NUM_COLOROPS 32
+#define MAX_NUM_COLOROPS 128
 
 typedef bool (*igt_connector_attr_set)(int dir, const char *attr, const char *value);
 
-- 
2.43.0

