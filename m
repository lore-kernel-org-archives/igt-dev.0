Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B6AACE8E91
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 16:10:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B7210E190;
	Thu, 24 Oct 2024 16:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ei72RREZ";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2059.outbound.protection.outlook.com [40.107.223.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EED3F10E190
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 16:10:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHQnYsndvJlOiaGNqIKkDiJ7FH5Aid1AIbQF6GGG0OGS9IXNBjuyCmwruScZl0GbgfbdKybysG9eumECmuALcFglLDE7mjIyqSjmG6M1hVsb7+VLJsRTnri19ZL8FgKAqg27Jacg7DCk54i5y1TlslbD6CkvMQbSoaNg58G9KHNtCT251oAHSUsIAWaIHdHbOXRO8owqv7FN4/WvwM6+oJT4Zdupd5cX5PYwKZEtDLIeNQVxj8JV4oSCsIgy3v2kvWRwdlfIwYaJuxjhOFiLSMQuSbeBeCSoKJYCYV7ElCPoiuAZzeJTRRdmhdFicPAjxUQsClUkxG+MJNvxkmgOpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N4W7/x3jC5axHwW/MbIsQFnjLkuGxs5UwXot+qTI0A8=;
 b=vdollJDpXvBg3KL1Z1dyu3GzyYbnI+n8piA9SShY/UivunOH4dtHWTwUBqcEQPI+J8zvbx4ZDXsUdoeZrEdH2TS2OU3n2HvykdRrlGMnXIrvkdwhojMhV8SCx2a3Ow9oJi8tfFvJXvcPD3/afyQimSdHXGpV/6jjMbHb+uBcA4HEu18cZWo6gxJm2+D4eMeaGKjdnt/58o3ziVFEgYDFfufMJEcrB1yaNBpJf5/sMBBqyZWqqyx2K80zrEBvNfqssNDLPzoVb2IXgvyqrElt+r2w/QR2ctcvQtBsOHjrCIlPlPFtAuFi+x3QAH84b98CP5MAuVUnkHzAPqdLm0/bJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N4W7/x3jC5axHwW/MbIsQFnjLkuGxs5UwXot+qTI0A8=;
 b=Ei72RREZ0zbhP7CEmJ+JM7wNiUYkL4HnznQTPooyuLROPof3KrYJEu/zZQ6r/1nRQ1suznIfw+yQ5EFvJhUHwiAbQ1+qbkjwfRIp4WJX3nVo/mfQMHAR2cMx5n/UwunGtsadYzOg86tI2sPptAeI50Ou7U2bG9QYQ01b+LIr2uA=
Received: from BL1PR13CA0449.namprd13.prod.outlook.com (2603:10b6:208:2c3::34)
 by SN7PR12MB7023.namprd12.prod.outlook.com (2603:10b6:806:260::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 16:10:13 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:2c3:cafe::ad) by BL1PR13CA0449.outlook.office365.com
 (2603:10b6:208:2c3::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.17 via Frontend
 Transport; Thu, 24 Oct 2024 16:10:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Thu, 24 Oct 2024 16:10:12 +0000
Received: from MKMMARLEUNG02 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Oct
 2024 11:10:11 -0500
From: <george.zhang@amd.com>
To: <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, George Zhang <george.zhang@amd.com>, "Leo
 Li" <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] scripts/run-test: Keep original prune behaviour
Date: Thu, 24 Oct 2024 12:09:59 -0400
Message-ID: <20241024160959.28947-1-george.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|SN7PR12MB7023:EE_
X-MS-Office365-Filtering-Correlation-Id: e57c801b-b00c-401c-1c71-08dcf4465731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MluhbrvDO5WCuEhhXgKecMvzUiZ45d5HB4qIUs66hiA2wtS6RYunCcqyzrhB?=
 =?us-ascii?Q?/nH7Odv/h3Y5/DCOSHDfGPaX7OgNsVtllbsNiFSVDJZMXKsFf2qI3LEnEsTF?=
 =?us-ascii?Q?D4TAaZ3BrGFn+QHYVaJF//dZtHTxaioGB9vJNFoAT2M+9sAsnTE0bsRzWTsw?=
 =?us-ascii?Q?ebw/ePPTlef0VWCwD50Z6YrmBM/Xd1Fhw+Bai2hcRYSY8aI8QIJSmLU7S8s7?=
 =?us-ascii?Q?r8Sm4FUF3vkw/INFxssiU+5hj1gtZMOTfW6Y80LCfwgtBG8MbRe3ERcQXJS/?=
 =?us-ascii?Q?OrElio6jnPiUbUtNg+M9XtDqTbaCuAW363id+ZDOTmxqvP+FIll7kFM6yYtK?=
 =?us-ascii?Q?YP4nrNumPsrDFkNV1Sd/ED4r9pwekEvqZIXgx5AmMxiisl3ZbqTkgOafhc8w?=
 =?us-ascii?Q?X+LAp79lzhY1Gcvx49PHh4jCEpJ1YEZtY+dn2Fu1ANPq6Ne3R9M2mJvkp1z8?=
 =?us-ascii?Q?t1ufhtjbbX8yMFuY8IDJWVYiZb0w54qHs0aUu+rGogh2mEKzTlCG8Uu39HSD?=
 =?us-ascii?Q?1SVtyTZ8eKb+OswVhLbXbnIMPSnkpowctDIWL4fxCheRkKOV20A5RU5oIpdE?=
 =?us-ascii?Q?yNyARyzNH+osAvs99yZP3x+kjVOXMbXhouLTIAJbiA9geR4vd2dF1LmqAMdO?=
 =?us-ascii?Q?k7VfhSj5Kth+7Y2GMno8yCwMLjSV7S3FcYw3y2egXvv2+YTZLmpeuTedARtl?=
 =?us-ascii?Q?fIlfA5tIBlzbrXajSoO7ct7XgGftabUEeRKfCbkfw/Q3TwtUGDRNtyGvycBq?=
 =?us-ascii?Q?9aBSI6GVh2kLJuNpbRZYW9yj2J9elOS6yYvK3hYY3YeeO+MlIQyr5+yQ6vhU?=
 =?us-ascii?Q?6hsRbZ9KwgQpypQxCgF274+wWKtFHZL8j1mkqHmNvOruVGCwkfBb2xjw1O2Y?=
 =?us-ascii?Q?M18elqlWYu0DYBafIQ1sQfUPGMztxSgHxsPc6lzO8cB7E1oCf891vVtTF3kz?=
 =?us-ascii?Q?bO4xsIIbs+OWgNuPsTESzy1T1wHAbLZPpUJIRC0/6ipHqpksWNVy347zOKlB?=
 =?us-ascii?Q?jrNKH1Ariai0toRXpqsmgFqGs1HJXkqKJJN4HO4+gFP0MJYY2HtAa/mKuIs1?=
 =?us-ascii?Q?otJK2gFk1HHcP/Wif+22RwojNTwScM6rCfKWrZ6RufXXPTBCf0ZAD0t94yvA?=
 =?us-ascii?Q?xLYAjdW5kETkiqI4fFPnWtozFD1LTp0uD0DrNA1dEdqL3IFRyzakPRr63mUz?=
 =?us-ascii?Q?lKyh4g9FuzzuQiOrSDlpCclWUKG9bcMzTtQT62RsqWVwcxrlm6eZ72iu2AOk?=
 =?us-ascii?Q?uoorJaX9gkt0IyS1Bj/5GFUFX/AQe3BTCbYcbMQ8NJ0awzurAn3m0dos1tTa?=
 =?us-ascii?Q?wyvRBmygYclTrkiohkYeduZa2lxYMXRpK9tGtEbSXVEQv4pJatIzdHf8HowH?=
 =?us-ascii?Q?swn8DEwVb4boQNKXmrWlqspMT7gEdRb9DAxx323xGw/3WXBCGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 16:10:12.6867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e57c801b-b00c-401c-1c71-08dcf4465731
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7023
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

From: George Zhang <george.zhang@amd.com>

The default prune behaviour of the runner settings was changed.
This change is to maintain the original behaviour of this script
while also enabling the prune mode to be overriden.

Fixes: 997bac8 ("runner/settings: set PRUNE_KEEP_ALL as default")
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
Change-Id: I98cafbbaae15788a06eae8b9905615e9231d8e8e
---
 scripts/run-tests.sh | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
index cd03682b4..f3ae48451 100755
--- a/scripts/run-tests.sh
+++ b/scripts/run-tests.sh
@@ -37,6 +37,7 @@ KERNEL_TREE=
 USE_PIGLIT=0
 RUNNER=
 RESUME=
+PRUNE_MODE="keep-dynamic"
 
 find_file() # basename <possible paths>
 {
@@ -154,6 +155,7 @@ print_help() {
 	echo "                  test run with -R"
 	echo "                  (only valid for Piglit)"
 	echo "  -p              use Piglit instead of igt_runner"
+	echo "  -m              run test runner with prune mode(default: $PRUNE_MODE)"
 	echo ""
 	echo "Useful patterns for test filtering are described in the API documentation."
 }
@@ -176,6 +178,7 @@ while getopts ":c:dhk:lPr:st:T:vx:Rnpb:" opt; do
 		n) NORETRY="--no-retry" ;;
 		p) USE_PIGLIT=1 ;;
 		b) FILTER="$FILTER -b $OPTARG" ;;
+		m) PRUNE_MODE="$OPTARG" ;;
 		:)
 			echo "Option -$OPTARG requires an argument."
 			exit 1
@@ -253,7 +256,7 @@ if [ "x$RESUME_RUN" != "x" ]; then
 	execute_runner 1 $RESUME $RESUME_ARGS $COV_ARGS "$RESULTS"
 else
 	mkdir -p "$RESULTS"
-	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER
+	execute_runner 1 $RUNNER $RUN_ARGS -o -s "$RESULTS" $COV_ARGS $VERBOSE $FILTER --prune-mode $PRUNE_MODE
 fi
 
 if [ "$SUMMARY" = "html" ]; then
-- 
2.34.1

