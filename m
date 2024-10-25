Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BAFAD0BB56
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 15:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C2A10EB05;
	Fri, 25 Oct 2024 15:11:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2rMkEJ+N";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6AD010EB05
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 15:11:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=edfrUS2+jAgM893DiTmdYDl2Wuxs46LJRR73V9p6YweEc0ppwbTHeskbMBLwIqy8wHuGRJsPCDwnI9AkZDIyMKRZKyOW8x1uNy1sbO2qCE0Ojcbup63QzhHX/B6xB+sswPsJPLrmwWWGQaZIELTvMBnsODsiW6Da5lGKOrVP7vI2kb5bErouOSBKuoGoB/GKUMQLlsBbuAh5IG880DaVBlywFJvbjjIBd/TvPu8joyS7dNFIxn9L30l1SEXDrxEyuFokL8XL8A4xiRjG+KjVyzzL9GL3QzUCuN37Ye6sUuneot9KntvYku4Z/9QSPWudX4qeuk/1UDF4dUkqMTZMtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UCGYVtUATl3Qxe1EF5ml6AGTmR0Wy+Mpd5eXYjVQyME=;
 b=wVlLZmNkanBZXGI4W4nkWrxHkLt4WVQqCKNIf+Da7ThDsYO8gQmnIJd4ylIT9+09gEIeqO5zA/AJT3i7839XL6TTvWZrxONJIN6Qa1UH8ERtcsqWiR9sHPHwK5D0/9Vb+uq0XX+pTEsGxc1vEA4JkMVLaHk6WSWI7IDj+VOxQUgHDf+9tAUcHRsa+Ja7KF/EQKEEuJN0ac9KaQ53BHiwTirYINPVcnrYA6JvtQ8A1spdiA4D3BX2kcBDCRBlJ44qcvDaZbriUgoVFiH8nJROgK0b+w2z3l1+PJEqONU+OO9E74aptPOjIOA7jrVjOfx6li9a3IcmYy2fReON2r3NTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UCGYVtUATl3Qxe1EF5ml6AGTmR0Wy+Mpd5eXYjVQyME=;
 b=2rMkEJ+Ne59h2RBlgPhkt/Ujx1Zd6OS6MUCgLl5cuVKGMhKj9L+YGXrLHe4OLoUCm2L5c3kPLMYAj4XaKJfOf7s2Sm+pMxKUSGCSpYend+joABHjJ2sz+VF5O4HipKvDxlY5QitNI7alqFCmktubtQstRdIdQ+xoJ/x01E896wQ=
Received: from MW4PR04CA0089.namprd04.prod.outlook.com (2603:10b6:303:6b::34)
 by DS0PR12MB8480.namprd12.prod.outlook.com (2603:10b6:8:159::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 15:11:35 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:303:6b:cafe::f0) by MW4PR04CA0089.outlook.office365.com
 (2603:10b6:303:6b::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Fri, 25 Oct 2024 15:11:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 15:11:34 +0000
Received: from MKMMARLEUNG02 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 10:11:33 -0500
From: <george.zhang@amd.com>
To: <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, George Zhang <george.zhang@amd.com>, "Leo
 Li" <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Nicholas Choi <nicholas.choi@amd.com>
Subject: [Patch v2] scripts/run-test: Keep original prune behaviour
Date: Fri, 25 Oct 2024 11:11:21 -0400
Message-ID: <20241025151121.9160-1-george.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|DS0PR12MB8480:EE_
X-MS-Office365-Filtering-Correlation-Id: 8654fb94-8a99-4780-2717-08dcf50750e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X4eJ/AtEcopv1MwD8N4IO+58WVRtHZnmSDz+ocOJOQg/bIhySaQHXemHD0jo?=
 =?us-ascii?Q?dP8qtFgIqtVj1z3ZKWlADEusln4+5XvvEenIE0awCqKWMkq0CkaBxQvOqdDP?=
 =?us-ascii?Q?vMJsBXTvnLZS+g3oTZgwWTkwfEyzRNkQQ0rXIUlGFTl+/gUtvOka5kTwmU+Z?=
 =?us-ascii?Q?/9AEAGAaq7z48R/Pj1l9UCgs2qbGBjUSny/P2FJasGis2BNva+F/SoOpth9N?=
 =?us-ascii?Q?4UKO2HhBJRzP1KcKpPJLtxkB/hcWo+ohoUBMPvyBKMmA8OLmoj4W79qOYCZE?=
 =?us-ascii?Q?YamuHO08mvhYLF/651CN9265ckcRG5BKLKuKVqF+JvpKy12qqYB9KUY6LV/5?=
 =?us-ascii?Q?Y6pmPkpMftoqliWsAPQWsFq9OGzDVQIFpJUegCAUXRTBbn5wMmftgqCGu+OM?=
 =?us-ascii?Q?+ZRquWlySTqhdYPEg5S+XLCLgplKEgvwKeMrYCwoz8xD5uAe4GYaHj8kSUIf?=
 =?us-ascii?Q?Bf3IRecoqVB/UWCyruYDTHnYpmG3izxv9zCmxGklKhxuEFpR1OuvqHHjoGxA?=
 =?us-ascii?Q?2SaidXkavTb1UC+YjXKKKVkiHJi/mwQmkposrLbNAuakNeF/gMeQwoDK/hRp?=
 =?us-ascii?Q?TbPkjHxo0+6iRzzsga/+RxG56HqkTrzG8B/zFHgzPoxT02/tlOpuLTey2eJT?=
 =?us-ascii?Q?53bCGtSJVOMo6bm7f6DGw5dDRKdvABTpeHFSSr41B7hq96alP+IUnw7wqjVP?=
 =?us-ascii?Q?hrJjg0SBTB6uLmdbuopqrvB/aspGqkVm/nRKtdSzDFl2pXxrHftBFcqBYynM?=
 =?us-ascii?Q?5aX3bqGd9nsSZ+3ghHN7a8TVtDdA8A7LsG4+nkquhBT00WiaQE8mADLmsxiy?=
 =?us-ascii?Q?vRxliSfH85OrPq8PGXb3wiUIwyX3/7IhO8WsW+bIAIxMDkHyoAo4YZ8PK43S?=
 =?us-ascii?Q?47OcqGg1vtmC21SbKsvoZaiVkXQzL7e2oUP5ggKHFZR/1ID2L6PPUNAYW5i0?=
 =?us-ascii?Q?BhM7PpaD+QUK3R5z598ABrL25MmS0RVWpoilV9kUbQbQxgxlcG3365mXFlrx?=
 =?us-ascii?Q?ldbzDecF6iMG1xqZ3i0SuVpHRylX8EtrWztfNuC0K3Dpk1wt1BnAkI7I1xJZ?=
 =?us-ascii?Q?2023zl2EVe2JYT+aCLFOBbVSG4N8fVEFGNdFvj4BtAQQ4pQX4UaWPP44dTHm?=
 =?us-ascii?Q?PzCwkFet/GrgadZxUK6F1vSrA2TZw1bpQyfKkAp/KAope/N6eYzvMqmfWTge?=
 =?us-ascii?Q?z1Fk1t95nEwfn8tBkVsMAoYXqdKwXzSdQ68qiJysDaaED1/J85of1ngT2smd?=
 =?us-ascii?Q?sloj+2C3FGAijMClEZKpS2iCEId4FnA7LRGJWNfd3jamGTT0Yxf70meG5SM5?=
 =?us-ascii?Q?JmIaxrIyRvx3eROzxJz1/CgasWlTzlM8vJkO109P8beKSwtOybMes7Uceiwb?=
 =?us-ascii?Q?YBoyKzpYQG1G5KgJFkh8Al/gY60EmFT7ueh0BapXuyqsCC713g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 15:11:34.8467 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8654fb94-8a99-4780-2717-08dcf50750e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8480
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
Cc: Nicholas Choi <nicholas.choi@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
Change-Id: If379ec2fb7616af79c55cde44c49b760225a4896
---
 scripts/run-tests.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
index cd03682b4..4ded76df5 100755
--- a/scripts/run-tests.sh
+++ b/scripts/run-tests.sh
@@ -37,6 +37,7 @@ KERNEL_TREE=
 USE_PIGLIT=0
 RUNNER=
 RESUME=
+PRUNE_MODE="keep-dynamic"
 
 find_file() # basename <possible paths>
 {
@@ -154,11 +155,12 @@ print_help() {
 	echo "                  test run with -R"
 	echo "                  (only valid for Piglit)"
 	echo "  -p              use Piglit instead of igt_runner"
+	echo "  -m              run test runner with prune mode(default: $PRUNE_MODE)"
 	echo ""
 	echo "Useful patterns for test filtering are described in the API documentation."
 }
 
-while getopts ":c:dhk:lPr:st:T:vx:Rnpb:" opt; do
+while getopts ":c:dhk:lPr:st:T:vx:Rnpbm:" opt; do
 	case $opt in
 		c) COV_ARGS="$COV_ARGS --collect-code-cov --collect-script $OPTARG " ;;
 		d) download_piglit; exit ;;
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

