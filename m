Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F438D3A675
	for <igt-dev@archiver.kernel.org>; Tue, 29 Oct 2024 17:05:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5518610E6B1;
	Tue, 29 Oct 2024 17:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="XqwWHvi/";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2077.outbound.protection.outlook.com [40.107.236.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8E0B10E6AC
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Oct 2024 17:05:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lP3lzn1wkkGLe/fKYpQj17p2z3Gl4RappeKiEqENmUTR2t9t3BhNxiDlx32hAxdkSkg9fK4U96kCtK/LwMckhBo7q0C6IqK0M3dYJADpEFBtUhyaZcOS2AHVty23VP3o8li7N76LId5LcQEfx+s0awuYKiCOPReVl7GxQm/Dc/MFUQvIITQFXzNSsGeE4MMmkDTa5hIDioIyYkl5r9NX9F200J6EwZJSO7DMCPUFt5UHwduAxZtM+4jCET0ZYH10oWSYAUIdifojeJQMqAusRB33Xy+TyrRy6Kp44lcZP+0FjeQMChX3hUz0iqTHV7owrQ3xKKoHSOTVk8scgTtrcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60llQqZ7NptYhM1XmUt7vVSyCy3DvhXjBLLfOELaTdQ=;
 b=leC8g36MZQatnzN6BfIyQqy6VfbKO3vbyskM0rmguGd9vVKXLKLaYDp9MPILvyT3RSOcrWrjSGYsJGxy1XE5OuRlF6FJCbZsE+6ZkZjZOB000yIEDSIgc8wt0CL9HLfeDZNhYMMf9cnedNU1YUUn7j9cqtwVEH9/eOqcLE+6+VCbGh+FJE6QXynY1pVae/w6zel6akNCKA6ig/j2NA/WPCa6V2fwGwZNDvE1ZWO31TcXxPeIxt+UW7sk/4ZKA4bg6By/LB2katPAg1HptrWwd0+DPN4+mZkSvNkqVrDQMweC9g7wUAr2uhpS8K8herUQaDItL4wAUHEZ0EKEkeuF3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60llQqZ7NptYhM1XmUt7vVSyCy3DvhXjBLLfOELaTdQ=;
 b=XqwWHvi/qYW42/GIPncqriPGiBz5+v5eolfZ/I7KEDXzrcHOco7v//VqBUkWiuqsyeTKTRWBJzN5mX60iF1daPbPIguoQqF0M2ES9Ig6dqcQF2RqC+DSIixLxqHMJAKalgulczvTH4fPj5/1BEfQnyA/a3b0mrfVOw5vxD0uFiA=
Received: from PH8PR22CA0011.namprd22.prod.outlook.com (2603:10b6:510:2d1::22)
 by LV8PR12MB9231.namprd12.prod.outlook.com (2603:10b6:408:192::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 17:05:14 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:510:2d1:cafe::7a) by PH8PR22CA0011.outlook.office365.com
 (2603:10b6:510:2d1::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29 via Frontend
 Transport; Tue, 29 Oct 2024 17:05:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Tue, 29 Oct 2024 17:05:13 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Oct
 2024 12:05:12 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <rodrigo.siqueira@amd.com>,
 <mark.broadworth@amd.com>, <sunpeng.li@amd.com>, <alex.hung@amd.com>
Subject: [PATCH 3/3][V2] tools/amd_hdmi_compliance: Add timeout option
Date: Tue, 29 Oct 2024 11:03:49 -0600
Message-ID: <20241029170349.1388428-3-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241029170349.1388428-1-alex.hung@amd.com>
References: <20241029170349.1388428-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|LV8PR12MB9231:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d14944b-a64b-4931-0d69-08dcf83bdacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IjLVKl3Qd1FWKnbcrbrtCYG0IGa8OzNJciMhVuL0mcGHtIBF+vJkdkg7KG0T?=
 =?us-ascii?Q?lNxVnRGPFYde1TVhquYRReezMUsAsEkKvS52Mmccm568AyELEdSPiTAnu5YU?=
 =?us-ascii?Q?nDpJ2zQ1tVHKSzvg6LCTc+vRJc4W4QUlXkTAIi963C3lrtr7pfFQ1enHm0at?=
 =?us-ascii?Q?xNjS54+soTA9TtmuozehWscBkLq9majV0RfymGb2kPM6TKD9BVtrLUxpbNyw?=
 =?us-ascii?Q?h+hyupZtMmL/xbfvgq656REgPUrUiXeyEXZYwwmEa0FT23WrpBq6SQcY3pCf?=
 =?us-ascii?Q?bxCGJ/iPvKSttYANTt/1edN1eGZ5LmzEx0Hr79TsArKKMOPF4nH/aX9j+HLy?=
 =?us-ascii?Q?yAPwX+M50hShobR9Gp6sISETlmSo7rz13v8iKmnys8GqNmGu/T1HgAlrKf+H?=
 =?us-ascii?Q?Jg+IsgynNKDSmlHS5VFQMDVzN4ZLNtc1TCIQ0YQaeVYGdR2IAtOEykisrzUh?=
 =?us-ascii?Q?EI2Pp4EUyXViyxpI6hZHuDvK0xuQOa/l9NAF9BcSA7/Kvu9K2X7ApuWbPl6/?=
 =?us-ascii?Q?Ah/cVBiSitoaXKG6ZDWhq04+WgCIsCJ6cl2q1sjLiRzRE/VTc4FLHXvV5Jvk?=
 =?us-ascii?Q?bjHjDUxgfgmwPUfqoPVyaw9ia4HdVFLQyXymKu1wGbmH3vgvDTqTSCNW8kd1?=
 =?us-ascii?Q?BIYogzBReZ0S8TEnOhB6YNFpcMaxD2T5ARiVXSGH5AtUeevAl6BzoToe0aLA?=
 =?us-ascii?Q?U2Ki3evMh2QKZHkbTbgU44qVCaLmTb7p9fLataW55vp/YNv1B0uS2CkjU513?=
 =?us-ascii?Q?7deXs1af0+BAhU1N26EJwL6XEYh1wbPYc3h6hSAXRkxvAWjkpvDPNgpF0AAJ?=
 =?us-ascii?Q?pVSJasWTCO0/iIWj7KwbdiNjjFKZrFBiRdI4ARXrp43K5LAARAdlD6T3ASBL?=
 =?us-ascii?Q?gkXOfx2Rz3I+r2HXUs0OTAouxotSNbuYCM3S8xIXSz/d+DR77u87JQ9MnE8N?=
 =?us-ascii?Q?7MibBNu45U/2buJ12nv1+aRUcNhMJeLnKnAepDlbTDY8eSncnlvSCuUB1pbm?=
 =?us-ascii?Q?n4oLCUkP3CuYQ1Oru4ykwXWD4Efsa8kJpK5vghei3HMnllPCfgzL05vtDT37?=
 =?us-ascii?Q?2iwP27K4aC7SdoX5hLJriJtKD1XO1AhOzGuPamrn1XPjMECFD9U+WHmEio8M?=
 =?us-ascii?Q?bWJxd2FYgy/7TlN3+nOb4HI6saV/SSbBT48yz7OsW/u/2rVx852N5kI6cFRd?=
 =?us-ascii?Q?JQAJmrGC52I8NIcqRmHOCnK+XGY63occ/FKkcSWT6iGPU7z12GXysEDfA9qU?=
 =?us-ascii?Q?lAr9zjf3Rev0X2xxY95OW4o/WhqLPA69EhuaCmvs9e8fmLkifsJSrFyWSeGm?=
 =?us-ascii?Q?1JfW3+1NLjfIs04xCaRUaN8GJE4ZK9Onn5OKcVs9/dbRn4L5mXCnAwo68Hyp?=
 =?us-ascii?Q?7/Z18b1YVA8+UPjh4S/UmBMLU4PoaRz6QVr0ZtJeeRVGY3Jz3Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 17:05:13.6551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d14944b-a64b-4931-0d69-08dcf83bdacc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9231
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

Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Stylon Wang <stylon.wang@amd.com>
---
 tools/amd_hdmi_compliance.c | 35 ++++++++++++++++++++++++++++++++---
 1 file changed, 32 insertions(+), 3 deletions(-)

diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
index 9d2a820af..d21301733 100644
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

