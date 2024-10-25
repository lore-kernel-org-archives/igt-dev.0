Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095BAD149E7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 18:30:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DDA10EB74;
	Fri, 25 Oct 2024 18:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rp4OHqeI";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2057.outbound.protection.outlook.com [40.107.237.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC7F10EB74
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 18:30:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ECDG77p/UYx02cnjLnysejnpebuAhfB3PitG+vkAsSfMsE1w61tenH+FbmYW1NbXoAhG1VJDgJ0fEOMvT208mtZooutmTSOfSYT82kmRmTs5G/d5DG9E3iNPVWsbleOwWs7S/yRZSNqecY4zkQeD4YhuwOur4cSxqPkCCNt4NXcnslEiqN6Eid/IG0ZMfONRsF+89WjlGrYIK2uqAIxlVIaj/aLKYFT5GXcSEnLo9cYIYlb/cBlMNMsFmHGsCaCWrXdkgAf74DxdclU4AGLXxl4sT1st2v/nf4tOJN0WwPvNTufKDc+4QMAb9aXTW6Vu0MrvrNERbgpCAWvNUQjHMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MH35EnUdjl8xPlhQuFDvK2Fjj7kV9VXdX9E3ZFK4S0M=;
 b=okGlSCASj7kz7n8f2Bg1HZHhiMOjL1tCws5KGGaKIcegQeI+BpRhjnkxelDk3rbLHi1v6Xd081yRvx4fVI7x6UKTucaNFkp+Z8yDlTPNipfmpkbGt7BnpVHAnnGDptlNWOwmgV+p1i7FW0ktgp4vmh5wB+/zH/vJAN3d2MPpaD3QJcrwrnG3w2pt8X02AqW1GN/rUQm9fq4/XfjmpSfHt294vF4suY+iQrL4j4J3ZhkKH/+U9tqF5SXIRBLBpN8tvE9cSYtEOyP3oH1hPtq2rPmTqaTXUWU1Qk6jtA3uPO+7CzoaBQak2VCo6UbTwMbceE5fhvkcypmR/VXeoqVNTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MH35EnUdjl8xPlhQuFDvK2Fjj7kV9VXdX9E3ZFK4S0M=;
 b=rp4OHqeIjkpL20N63JaWU85pBXzwaQ7JuzZHne0imvHDiiu9KjflYWcuLgTRYnlC4Kl1CNBYzbCQAJGCELb1z6FHoulifnD7jE+vpygeFNGl9OOLn/2I5maBk/gbT9VvFxeqRmwuxIJx+DKck3TnLjlcecFVVsGDVxysGS0Bcpg=
Received: from CH0PR04CA0033.namprd04.prod.outlook.com (2603:10b6:610:77::8)
 by PH8PR12MB6674.namprd12.prod.outlook.com (2603:10b6:510:1c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Fri, 25 Oct
 2024 18:30:01 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::9d) by CH0PR04CA0033.outlook.office365.com
 (2603:10b6:610:77::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20 via Frontend
 Transport; Fri, 25 Oct 2024 18:30:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Fri, 25 Oct 2024 18:29:59 +0000
Received: from MKMMARLEUNG02 (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Oct
 2024 13:29:58 -0500
From: <george.zhang@amd.com>
To: <kamil.konieczny@linux.intel.com>
CC: <igt-dev@lists.freedesktop.org>, George Zhang <george.zhang@amd.com>, "Leo
 Li" <sunpeng.li@amd.com>, Alex Hung <alex.hung@amd.com>, Rodrigo Siqueira
 <Rodrigo.Siqueira@amd.com>, Nicholas Choi <nicholas.choi@amd.com>
Subject: [Patch v3] scripts/run-test: Keep original prune behaviour
Date: Fri, 25 Oct 2024 14:29:44 -0400
Message-ID: <20241025182944.866-1-george.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|PH8PR12MB6674:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f2f8cd7-09d7-4db0-dde8-08dcf52308ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iWyVS7BPdgBum7B75m97OCUySpYBNfvhauSDwwPnaz1LF0wL95UFEZIqP7QP?=
 =?us-ascii?Q?XmRELLhXEwb1Evt63o9YeiNmPW4uv2D7P8S3MdT5lvn44lTQwpJL66+yWJ3u?=
 =?us-ascii?Q?swpm/h6YmRBOeKV075H88AV/hBV0l0aDCvPP1WRqJ9mzrmf4c196qnlOVWfD?=
 =?us-ascii?Q?Mh+Vh3ayY6VGGWC+kvJ7MFVO9estmW3ld9WbP+z21WC/P8XRm9zeFTaAW7ci?=
 =?us-ascii?Q?ejWbALdLlfh6ePvljWazneJuvI7/UbJX6VDi5tzR9M97fvgFDzO24RvaKttv?=
 =?us-ascii?Q?TSitmbgyLiqErGdwcH2abvYzc96VqbFnFKx6UEw3IMhxBFEqvyG0HU+kRD4g?=
 =?us-ascii?Q?/xhXUPdVkAqcRaBLhqN7m+dHzsZQNFM8ISpt6nXjfuV5jJ1J/HYbbWlJocq5?=
 =?us-ascii?Q?SJ0mXNpKVUK0MV8bdPqYoFp5HPULeUtVNOykGlmc3FMOR8/j8zSwnzqon0i1?=
 =?us-ascii?Q?2Fnp36LqZTsAq8FdbD4s2wMqOiYfA4vrdmnosP0jF16mMPQ2yfVWaQfs8Ijz?=
 =?us-ascii?Q?QOUBWeOYDIYzQSx1Y1hcSDevW4hBQ+P72Lye3O+/ahdHlAwySwy+RpB2fhYO?=
 =?us-ascii?Q?EoIiJSsC31tf8uUtQOl66H8stLqUVMHMuAJdPKhsnYojJnkIeUopaGParqNR?=
 =?us-ascii?Q?uDLKQ0VxpUrUfYT5kY0kp2GOmLvKDVZT2o4SpCV3zgExG0wKMl7tDXtkePpQ?=
 =?us-ascii?Q?OQKWCjogBCVVZEznXi1bFShZrwGZ+MG6lO6jPGeM19K7a8PSAtqvbNfs7EK8?=
 =?us-ascii?Q?3FSjsW+dW4x2sitY1a3ANWkytfThlJ7ekjkvebz9xn4/YILzGj5rFEbyZLQD?=
 =?us-ascii?Q?Ni5K5xUvLTHkkwkjWDfXuM2tgMVSyUR7PcwZ3dDkeR/uZWfSU+FkaOlZ6Qpz?=
 =?us-ascii?Q?9FL8nLevwXk9sqkQ5rJ/+CtyBEGVvsAhOk0SviZ40HYLrN8OoNEWjebZd+1w?=
 =?us-ascii?Q?jotyPYjc2vRyKkffn7usvmaSqIIXdRlOIuBBFwAczLToOzKEMezv1zMLbJBm?=
 =?us-ascii?Q?DzUjUnj70vlVNOsytuPyE3ETrJrJU0E9JCf5zKqCJOKewkgKHrheSc1HfL6N?=
 =?us-ascii?Q?kgZ9vtWlKxv2jrt9ibi78ng7nqhpMpsV4BUbD9Dz4FMbDzEuuEN9K9RahZxT?=
 =?us-ascii?Q?9j33TUT6yzxaI0GtYXzswn6L3o61JoBMZPsSZ7atxIC1ORKGOMcukCbJBeRa?=
 =?us-ascii?Q?czn6LkhOj6Ha5H42O0+QK/4SEjyJTr0ql253IwsoXswJTawWU+1QWv9B/uHC?=
 =?us-ascii?Q?SFFYmrR3jM8cprQvDuo8ogua4XyGX7ltDHZpTez7ba0IRJ4xOnXDPa9xfuKE?=
 =?us-ascii?Q?3r+7gLMXFCmCYPyEpCvezXHRNMEnX3J+9wNjTRHV46v5OgSE4jzOJfeGsSN+?=
 =?us-ascii?Q?EanNaTSyXbteXsBqy1CTjGXfEKjwtTSnNqtnOKzP/0lTKGlwsg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 18:29:59.9003 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f2f8cd7-09d7-4db0-dde8-08dcf52308ca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6674
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

v2: added m to getopts

v3: fixed bm: -> b:m: in getopts

Fixes: 997bac8 ("runner/settings: set PRUNE_KEEP_ALL as default")
Cc: Leo Li <sunpeng.li@amd.com>
Cc: Alex Hung <alex.hung@amd.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: Nicholas Choi <nicholas.choi@amd.com>
Signed-off-by: George Zhang <george.zhang@amd.com>
---
 scripts/run-tests.sh | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
index cd03682b4..082ebaa5a 100755
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
+while getopts ":c:dhk:lPr:st:T:vx:Rnpb:m:" opt; do
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

