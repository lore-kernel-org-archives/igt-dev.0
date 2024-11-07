Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31135D29FBC
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 02:06:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9DF10E221;
	Thu,  7 Nov 2024 02:06:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JlmXO4z5";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9109010E221
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 02:06:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AT4egd57nWilo2i/rJQPQx063DwNACF2eTvD10JDafiFi5W5Src26vPV879UB+8dh3mXcoUPrt4C2jpeU6kzty+WGekwzDdjhw7Fo1VRLVtgAUn5rHhzi/QHBoOO8yx+3iecZABkBimWDNozsRvs6IJB/ZWTfuLti55DFnuNhivYYbsKtdYj/L9FM6UYzm7FhuOZPKynsjAL8xLNuiyIZLzRhGx1tAdVsHOAdtzpzYuCxuUbj7KlpwWYigN4cd6b5H5+/uACVD/ZgEjJ+C676S1G61R62HsAVp5mcaxo4k7v477ACrE9xQBmY8O/5U9gQikPtmSUud2gPIgLHhsMnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI9416mGvG9tS/Yfcf7vfyK4kG8A5g/dvrHu/y7N/H8=;
 b=cas6oMRbdyYBVixs3qwXu1yYjFU+ORqC/yRfB5JxVmndUP7WHyCfiZgWNOyMTlGe9+b/wC3Wk2/mqQKXNhgXSJIbVdf05Ctdi2lRWSS7JJRuG4idq4Au4/CmjbuKp51v5NBAN42HvGTX+vMQ7XNCzxwnNRg9BihNhUM797+ON400kORiwyHjiLpYLsVOhlVmAfBK1qupyfUquoJuB6Mm8CRvacUufXlXSKGe2VooRBszyzOayyPnIPtTSOqqjoEq6FrJ9kPXy6nT8WzE2mcK9sTLdUD1K2m3Mvd4mm8Jf/r/mliT+LQ3s1h9J9+jvnUo6BBsFx9HIjT2LjOqkkLU2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI9416mGvG9tS/Yfcf7vfyK4kG8A5g/dvrHu/y7N/H8=;
 b=JlmXO4z5sQXQKlWFFeHWkkKV+FalGowDVcgRpFv2/5lCaPXmlz8FYrVAL9PsxUGRJFvOsjKVBSbjDkmjrQmcRdjGidQpRUHYiMbdkZPfjZ3EEjJOuWbCbarJAGObGLvi53cYh8c8AsrbSwYIAR3NkuQInIZ211IPPoCcQjM2E/E=
Received: from BYAPR07CA0074.namprd07.prod.outlook.com (2603:10b6:a03:12b::15)
 by SJ0PR12MB6989.namprd12.prod.outlook.com (2603:10b6:a03:448::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Thu, 7 Nov
 2024 02:06:54 +0000
Received: from SJ1PEPF000023D9.namprd21.prod.outlook.com
 (2603:10b6:a03:12b:cafe::62) by BYAPR07CA0074.outlook.office365.com
 (2603:10b6:a03:12b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19 via Frontend
 Transport; Thu, 7 Nov 2024 02:06:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D9.mail.protection.outlook.com (10.167.244.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.0 via Frontend Transport; Thu, 7 Nov 2024 02:06:53 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 20:06:42 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 20:05:39 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 6 Nov 2024 20:05:32 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <Jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 4/4] tests/amd_dispatch: add the filter for amd dispatch
Date: Thu, 7 Nov 2024 10:05:10 +0800
Message-ID: <20241107020510.350132-4-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241107020510.350132-1-jesse.zhang@amd.com>
References: <20241107020510.350132-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D9:EE_|SJ0PR12MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 407fc908-9c87-480b-f8d0-08dcfed0d9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QD+43Fsna7MaDMeV4mn+hV2OG2YLf8LaTZc43LvJm8OPrazFmTXY+yyQhmNK?=
 =?us-ascii?Q?LMSUHnS46+CSvrOgvtKITaAHAIc9j/SnqjnwCzCG3Hvk6vSXtF7BkiUMul7X?=
 =?us-ascii?Q?rBa7ZsVXI23hrZSZiMNLHVVm0wiCj/DIghNSX0eK5cZlVNxGiW8qgG9kmJ61?=
 =?us-ascii?Q?WhjDuYK8Tx4pQA22nf91mDB1VTFoJLFHMoEEFPSmhBfkjkC1VYZOzxXozJuv?=
 =?us-ascii?Q?0pfmE2ST14yeSz5thp+ag/DmRDTmFGoVbmaWcT88ETz1s6pzxVreBnRrjHOQ?=
 =?us-ascii?Q?lcmrGGk83k6A4pDHX3pEYP63PgGZ4AG3eCCTPKNSOQYkNBtp+VQbQ1KMEmA3?=
 =?us-ascii?Q?OSTyzI63WVIPCcr6GRWZ4vcppa5isrU1WBvbciUgYQU17l8j00RFynbOJXGS?=
 =?us-ascii?Q?MzKQl1tRFx6uJ1+yRi5Ju1ZA7njru5vEiIS0fHDrshxSdf0YcMum7u1sC4UP?=
 =?us-ascii?Q?W4ey5O3Qu2nfy06NxgDr7uEJojN69wG35yBf+WHyJ12xEDO4NbmDWntD4mDn?=
 =?us-ascii?Q?wGXnZOreBmA291XELEYkqaDpzwt2kriyZJMATemZYAV3nS1n1Zvcu4dC/ufu?=
 =?us-ascii?Q?pdhgPt9dZy+CQQDLYYz0CivfCgDPfk2Pw+WVCOH0J+VvzIXE4/41DFr2C2xq?=
 =?us-ascii?Q?L2t4d+boy2kM1xh2jI5psSIme2S780U4/f4K6Zd5knBfbiqNhSF4ComqUKOP?=
 =?us-ascii?Q?4NCCo6OVsZDY9Nzqkb1lCMXdliKGrCvADmyivklZc4A7Rt/I08Bggz12/P3r?=
 =?us-ascii?Q?sYMboTs8zcpOcM75uN1oPRlZ8qDCO+MXZGcXWwj3iAZoZo0gm63GNb6tj+07?=
 =?us-ascii?Q?XSUWqLazYlLXs2ben49+uwVerOultbb/uRvf90wRC1uRZ/xnCWgdNKekCfNo?=
 =?us-ascii?Q?z9VLcjMcN5A5N2tEx7NlZNXhRvpU0aWI+z9ojkZmmaVyQqS+VqIGM+ENM+GU?=
 =?us-ascii?Q?nUEM9FQDKOPkmOEoiQ2jCGQe5/phjm0sW4CyPpdB7AF5ufM9jrHc3i8n+e3Y?=
 =?us-ascii?Q?mKyqPoyEiRMI/2hFfx50AQNrV38/B61KX97jLp/0IGzjxghX7Ws/tqCW7hwY?=
 =?us-ascii?Q?dmbC4vWN2Kk56g5C6tyd2tZ9oxSUtx+KT4d5nKveaHxxzNtBKAarsUd125sW?=
 =?us-ascii?Q?jncvS9wFYe3ImMkunGRxZpy2gQRF/CkZdKX8zTSJR+6yybIYK86v1n0nwN1z?=
 =?us-ascii?Q?PNZBdqcPw5RWk5//8Jm8j6wXxHejvz/wqfS1zAs8nIF4ZlTiy5XWBX1Ym8vz?=
 =?us-ascii?Q?wSm3i2wy8/gHm7hSPztKMKTJsOF1dr4sktdMdkPjEOBPmZLQVGZH0yTsnSN+?=
 =?us-ascii?Q?GGOSGG4MzlxaJycF0CBbGOqUjzGp01drs6fzQsm6K317j/0VoqOy/5Lfugpk?=
 =?us-ascii?Q?nduTbgieYonTo90tV7WiWwILWF6mCJmupZEeMosdB751zys56g=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 02:06:53.7444 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 407fc908-9c87-480b-f8d0-08dcfed0d9c1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6989
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

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

Check sysfs reset mask before enabling certain subtests.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_dispatch.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 76b62128d..23d07561c 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -116,7 +116,8 @@ igt_main
 
 	igt_describe("Test GPU reset using a binary shader to hang the job on gfx ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-gfx-with-IP-GFX") {
-		if (arr_cap[AMD_IP_GFX]) {
+		if (arr_cap[AMD_IP_GFX] &&
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-gfx")
 			amdgpu_dispatch_hang_gfx(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
 		}
@@ -124,7 +125,8 @@ igt_main
 
 	igt_describe("Test GPU reset using a binary shader to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
-		if (arr_cap[AMD_IP_COMPUTE]) {
+		if (arr_cap[AMD_IP_COMPUTE] &&
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
 		}
@@ -132,7 +134,8 @@ igt_main
 
 	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE") {
-		if (arr_cap[AMD_IP_COMPUTE]) {
+		if (arr_cap[AMD_IP_COMPUTE] &&
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR);
 		}
@@ -140,7 +143,8 @@ igt_main
 
 	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE") {
-		if (arr_cap[AMD_IP_COMPUTE]) {
+		if (arr_cap[AMD_IP_COMPUTE] &&
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING);
 		}
@@ -148,7 +152,8 @@ igt_main
 
 	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
 	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE") {
-		if (arr_cap[AMD_IP_COMPUTE]) {
+		if (arr_cap[AMD_IP_COMPUTE] &&
+			is_reset_enable(AMD_IP_COMPUTE, AMDGPU_RESET_TYPE_PER_QUEUE)) {
 			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
 			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA);
 		}
-- 
2.25.1

