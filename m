Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8C3D10376
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 21:07:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C108810E3B6;
	Thu, 24 Oct 2024 21:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ll9Y6/mJ";
	dkim-atps=neutral
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2051.outbound.protection.outlook.com [40.107.100.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0216D10E3B6
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 21:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mfMyJDkmmdzhIcJs3Cl/KUq2h2RXWMMnI9IpPbFVzkiVs9GalLo+II6gV/TsNjxEZbInj43LxJlgqS4PaRIosqc4rC6HMi1UDGqVaTR4P9zBPRJKfbL6KoOBUQNJpcRzV1SZrcyJ8ndEdO5C7stvdWVcK/5PRQ2WRAU2i78dpbgg0fTj8GaOOUAyGscWkiDLMZI/bQdmga52nvBak/SC4s5Caod5XXuueXdnwg9CAY4IWhuivkvI+t6XGt+XhYykT5JzX4nQ5hDrBVXJqJ3Mbc/CECxyJMROJYqFFPI/z7zYqbei/xuiTMMhpU7TLB1+3r29Rso8tQcYfLlnNakXjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eq7DxURJAXgFmcKxhgUkJ7xqYcmcFxrCOxbIsj4zpyE=;
 b=ObZSMDDa+8Wp4jluOw7wSg7GAptz2lZ9MKW5JahN0E9PvKRoRjcf0r8B2AvqFImKiSDRvHlUeE3M906wRm/EtnYeSCYhb0RxmYfhnvUuOosYFLJIXNb+8u6QBG3MYbVI218z0/kJnJVIgCJVINdfSZZjbWykVQUk38g5JwYMx3J46tQQsh0KlkZcNBp8kf54eP5bR+GWiP/eDZe8vZfiltrL9PkBYuxcKQI3Mk+CqfPpAgl/wNj92tvIaPcPqQ8kh11cKHK4Tg2e1WQB4W1KoeEwPA51kZUccl+GtQAuXys3fwlgmJAy2/9nofh25ueZqTupOf3o7YGNSEwQpNQW3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eq7DxURJAXgFmcKxhgUkJ7xqYcmcFxrCOxbIsj4zpyE=;
 b=ll9Y6/mJcmAZv0LEy/jv5Cg/ScueHVz2EBaGI6ub16t+5vfsDZu/lGhyn9q8JJHu/RjHdzMSpGwH6Mne2POl7EmtG9BwR752zUTW89qWv9IGrim/PUMsb3W/k6qszjur1yx+uMmVyqXK/Yuw56d4v1WRm9LNys//ju20UCdMgpY=
Received: from MW4PR03CA0249.namprd03.prod.outlook.com (2603:10b6:303:b4::14)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21; Thu, 24 Oct
 2024 21:07:38 +0000
Received: from SJ1PEPF00001CE8.namprd03.prod.outlook.com
 (2603:10b6:303:b4:cafe::f0) by MW4PR03CA0249.outlook.office365.com
 (2603:10b6:303:b4::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Thu, 24 Oct 2024 21:07:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE8.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 21:07:37 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 16:07:36 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <mark.broadworth@amd.com>, <sunpeng.li@amd.com>
Subject: [PATCH 5/5] tools/amd_hdmi_compliance: Add timeout option
Date: Thu, 24 Oct 2024 15:03:45 -0600
Message-ID: <20241024210345.511501-5-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241024210345.511501-1-alex.hung@amd.com>
References: <20241024210345.511501-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE8:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e5b9841-1d54-4b37-0c7d-08dcf46fe386
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/yjikxxJKm395xwxJTWstJ1SX2+MGMhuZiZZ+GJVhpTTSvDrQ7uozA19w3L3?=
 =?us-ascii?Q?tjEQsirCqlI1awGNCgGQYKjjYZv5XYE8WourVMHsfb/27PuEYb+Xffd4M9Ew?=
 =?us-ascii?Q?DXJ0qzUmnqZD2J3ASIgdqcuLbP63ZESwdBubnVA8BF0kmdSXu0sVPX4VgmLZ?=
 =?us-ascii?Q?yM0PMs/xQ4C85NXxjjnhQtghCPc+iXmAi3JBSEOGXfyuV96hzpoQolmIlQP8?=
 =?us-ascii?Q?8vBnT0HydMBjefIn1S+dGkqUm3rQzCyJPj5w6dQ2tiOrYCmb3d7zu/VT0pbB?=
 =?us-ascii?Q?eIRQCLyxJkCK2evut5uhjxmRTo0k0u/Vnd7wbQ1foSoQMXVtTPnDOauJwHuJ?=
 =?us-ascii?Q?2NL5dMDnouE0LNrH3CuOMh2191YbgWAOXQ3peDQYXoppJrdlwPZyYkIwHCzy?=
 =?us-ascii?Q?mE+0cf9I+MZxym+Y1PZ8hAbI4QOc4yhHbU83A/kxoRIAhQrLUaH6UZfAx77y?=
 =?us-ascii?Q?EsmmUFu+PB8mgQ6UgNh5wk5pPPL6ZlFmhcQnlv72rqE8l3itfM5nt9h7GARi?=
 =?us-ascii?Q?WEoRm13eQKUWeg4ruy94N9Jaaza0TZH6bLpJqWgjZL/wBng7Y5YaJFNGWdLu?=
 =?us-ascii?Q?XV0BTadmIYWd+YAdKHTGo4GC+flyN/Cuh/HaQokCKUgBk0r40D2JFibGAFys?=
 =?us-ascii?Q?7pO9o6Q5YMKZH/v1mb4J3LMXaDOuHYB+Vq2TSenj+WTlLwb0z5bGKShLatKG?=
 =?us-ascii?Q?fvRDhtez5qy1eJGHUbmADF8mNemNYiBhKrMzTi3wsw20S4A0Imiouo/FZ2U6?=
 =?us-ascii?Q?ul2wuzx9y2EF0eGR2TCp2Hb/f6ntpdFEc267d47MW6eX1345ZDGMztcK+x0D?=
 =?us-ascii?Q?MpDXBE0Gvp9eZWliIavz4qT09pWQwk0dS/sPY1T/US/mIv7KFZUF0bho9X9b?=
 =?us-ascii?Q?uox6E+iK9aIr8TrK93H0eIBqh6zjhVJrISTksGCRjgZTAnjJmlrpK36HscVT?=
 =?us-ascii?Q?toUZv2eyssWsmhZL87GiVPOhwt6bCkpSzxicNAldiafv5ncE17pw7K4SEmQ/?=
 =?us-ascii?Q?2bHSwxd8oxdiiMzdyJnfsG1dRsjdhzeTJZJJ6dqi4Mp+pBcflpiQQXjnRNbZ?=
 =?us-ascii?Q?2z/DrwkwmNnCGfn7Apl6S2+Cxs/Q0Z+91ERibQ2TS15tlShOPHWzWFYLc1aZ?=
 =?us-ascii?Q?qkoZpdMUdrY6jC75j4XlVcyhMQAYqh/Ondnnx3In88KIr2mnpwHr2/tUfCME?=
 =?us-ascii?Q?1R8KDDRLzmP7DlLEMYzEBU4MrMhnIyi/Wo9ylpWZwKEmF+mBj6jle5MVdAhN?=
 =?us-ascii?Q?dh3G7FpEvQrSmnG4OWweHFSrVIRyhe/C7POfyMX6uVBmJZCzpI3zRLgb+ifX?=
 =?us-ascii?Q?aIPhOiG27Cz9N+Rs10cb1jePaFcTCFXedFvxb4y9Y+5YlNCz1B6edgRHovvH?=
 =?us-ascii?Q?+gLIBRNrOJlF5QxQa1nd3uUivGIER/ht9sUJM95uqd5E16rwsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 21:07:37.4121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e5b9841-1d54-4b37-0c7d-08dcf46fe386
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245
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

From: Stylon Wang <stylon.wang@amd.com>

[WHY]
Displaying test pattern only exits by user manually pressing enter.

[HOW]
Add option -e to exit with timeout and still allows pressing enter.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tools/amd_hdmi_compliance.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 49fc21d5a..e810b61ba 100644
--- a/tools/amd_hdmi_compliance.c
+++ b/tools/amd_hdmi_compliance.c
@@ -23,6 +23,8 @@
 #include "igt.h"
 #include "igt_sysfs.h"
 #include <fcntl.h>
+#include <signal.h>
+#include <string.h>
 
 /* Common test data */
 typedef struct data {
@@ -34,6 +36,7 @@ typedef struct data {
 	igt_pipe_t *pipe;
 	enum pipe pipe_id;
 	bool use_virtual_connector;
+	int timeout_seconds;
 } data_t;
 
 /* Video modes indexed by VIC */
@@ -370,6 +373,12 @@ static drmModeModeInfo test_modes[] = {
 	},
 };
 
+static void signal_handler(int signo)
+{
+	if (signo == SIGALRM)
+		igt_info("Timeout and exit\n");
+}
+
 /* Common test setup. */
 static void test_init(data_t *data, int conn_id)
 {
@@ -402,6 +411,19 @@ static void test_init(data_t *data, int conn_id)
 
 	igt_output_set_pipe(data->output, data->pipe_id);
 
+	if (data->timeout_seconds > 0) {
+		struct sigaction sa;
+
+		memset(&sa, 0, sizeof(struct sigaction));
+		sa.sa_handler = signal_handler;
+		/* without SA_RESTART so getchar() is not restarted on signal */
+		sa.sa_flags = 0;
+
+		if (sigaction(SIGALRM, &sa, NULL))
+			igt_info("cannot set up timeout: %s\n", strerror(errno));
+		else
+			alarm(data->timeout_seconds);
+	}
 }
 
 /* Common test cleanup. */
@@ -412,8 +434,11 @@ static void test_fini(data_t *data)
 
 static void wait_for_keypress(void)
 {
-	while (getchar() != '\n')
-		;
+	int c;
+
+	do {
+		c = getchar();
+	} while (c != '\n' && c != EOF);
 }
 
 /* Write 0 or 1 to debugfs entry "force_yuv420_output" of connector */
@@ -478,7 +503,7 @@ static void test_vic_mode(data_t *data, int vic, int conn_id)
 	test_fini(data);
 }
 
-const char *optstr = "hvt:i:b:y:";
+const char *optstr = "hvt:i:b:y:e:";
 static void usage(const char *name)
 {
 	igt_info("Usage: %s options\n", name);
@@ -488,6 +513,7 @@ static void usage(const char *name)
 	igt_info("-i conn_id	Use connector by ID\n");
 	igt_info("-b max_bpc	Set \"max bpc\" connector property\n");
 	igt_info("-y 0|1	Write 0 or 1 to connector's debugfs force_yuv420_output\n");
+	igt_info("-e seconds    number of seconds to display test pattern and exit\n");
 	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
 }
 
@@ -519,6 +545,9 @@ int main(int argc, char **argv)
 		case 'y':
 			force_yuv_420 = atoi(optarg);
 			break;
+		case 'e':
+			data.timeout_seconds = atoi(optarg);
+			break;
 		default:
 		case 'h':
 			usage(argv[0]);
-- 
2.43.0

