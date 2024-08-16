Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C97DC52D7C
	for <igt-dev@archiver.kernel.org>; Fri, 16 Aug 2024 01:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFC410E56F;
	Fri, 16 Aug 2024 01:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VUBfyJET";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82AD010E56F
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Aug 2024 01:15:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CriXw7SD2bEAfvtD+D2I2kuTSk8Z3nsORvazHBJQJdGbZLKoDWESdTAkUXbwOsGiu7OlHuPairDSCLwXFeCU5A61unrxEsxRwEmUXrKx5Y5c6/aCCbsK1JlyzQZzK/1fxNoDndLClvLU3om8UVvpHpt0i+LIcru8IMMpW9jZJo6LAsCpIXV7oqWaRNVoPoGGvhobEj6CNtyveCjc+J62WppgsOAdFLk0/BipLWpCnVhfOM7slEuPZTLJ4my2RRVg6JbfEWyw+cWjuQlkEwU8SB19Xty4aC776oCOmPPji4DZozSbF7QVSHzc1KeBODRj0KC41ZQgXtAEGN2cnn5rYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYFNf0hHo77o4cGC8k2yOfzJlgiQ6/obmWq1xcEA5uA=;
 b=amqtsewdR7Iz/xXccFWHs4jw2yRJTKpXi7HiyMIp/hyI9J5uzUzy00ean4dl+hV6x3Cqaw9GgkF/xES3N52kOoOjXja6VBSB+8bMvUuly+R4xnixFXAxe5a75mXKDH9jx7onOcKC03LtiRkDee/SW/fRzJjDVC3w47O33Lz+tN48UYIf0BCUZx3gLjO/bke+Epg7jX2Ksu5XyDZHD/3aIS0k0Awm9mrKU7Li/fP99mDIJj6W2Hl6Jx1mkzP/TVJrNLSamJuTG6e6pVLbiArixVRjr99Az92d7MtuLCCd4Xg1WRYGQgORi1cW81lhPezl/R8HUnOrJo2tg0Vzo0i3tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYFNf0hHo77o4cGC8k2yOfzJlgiQ6/obmWq1xcEA5uA=;
 b=VUBfyJETTIuUYBvOhAVOwB/pE+3R4fSZY1xrEm/2ZRJqbYZWfCxB+XTb+9xwn5e+ExvhvEPhcbUO/wuzEPIsTK/ir3dG73Yt9n6i4h5WGK/+k2WvrguiWRM75deyF+OHRHVCs6rZoiJCrom94oqI7qpQlH3nNdFUXBxyUjiOzok=
Received: from BN0PR04CA0108.namprd04.prod.outlook.com (2603:10b6:408:ec::23)
 by MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Fri, 16 Aug
 2024 01:15:47 +0000
Received: from BN2PEPF000044A1.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::78) by BN0PR04CA0108.outlook.office365.com
 (2603:10b6:408:ec::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.23 via Frontend
 Transport; Fri, 16 Aug 2024 01:15:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A1.mail.protection.outlook.com (10.167.243.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Fri, 16 Aug 2024 01:15:47 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 15 Aug
 2024 20:15:46 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 15 Aug 2024 20:15:46 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Christian
 Koenig" <christian.koenig@amd.com>
Subject: [PATCH] tests/amd_queue_reset: Refactor ring sequence for job
 submissions
Date: Thu, 15 Aug 2024 21:15:34 -0400
Message-ID: <20240816011534.532384-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A1:EE_|MN2PR12MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: fe938aa6-1f4d-490f-6a9a-08dcbd90f581
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MtwWwqFalB545e8Z4+kzHavPmBa6Djmw9AmeH6Ijp9Qqtdl+7cPh2uyJG6c/?=
 =?us-ascii?Q?cFAjDC5q7XDunvUmQwk5daEYdUl0DvuU4Qh+HPYIZnGohLTPFBsowHsRcU31?=
 =?us-ascii?Q?VzNTY98uZ7Bkh6mN+vV/d9xximSq4hv8h04kmwsgAHlU4kZZtaKRUqZgGOIk?=
 =?us-ascii?Q?QIUATbP6uV6/zY8Q4iTacnD+V37/hejtNs4KKqocpaEwBPoMVK2crEe5SsCT?=
 =?us-ascii?Q?9mdzRD8CPnMVN+nj0qc53RQPFITWx04ME92mXR+5+zsrjQbMj0c0ZvYyLtgn?=
 =?us-ascii?Q?IR0g0clECw4695wrt92nkXxQ73o/NORwnaCH34kO3gYMtwb4RQ8xMmYTMeQN?=
 =?us-ascii?Q?7l5j0xwvW1sCsajsKTyzK0l4YMEP6c4Sbfv2ddpdViZLkpzuHm0p3Gm0tiJw?=
 =?us-ascii?Q?wNUmU8ZiOX0CLWR9Czhnoogw3yblZiL/JwJRwYPfHxhF1H6JO4liIgX6gtfz?=
 =?us-ascii?Q?g/JK8RFYmzS42GJho+Fpc93D6QNicNr1n1Y3M33+zfb9obPEMsjtpoaUOHRm?=
 =?us-ascii?Q?mDfnDKgQKKRf11HzhclPcDq/voN+S9bq1ffaaWnYdnXgTNHnGaHE1zvDjVQ/?=
 =?us-ascii?Q?l9/p1gDrMzfi3YMp19DnvSJ53/OVj2er21f0MXr24BPgyPFd0NynJX2O8CO1?=
 =?us-ascii?Q?gDKTdlO1+/YOl3WCO2cevhwtShOVJalTalikwDg3Kvf8BdnB8FnN3cwC2HXK?=
 =?us-ascii?Q?9EdbYBPLT3Kacdhf+aDrLAVMLRDcAOiV9R/FcnJu/jKLD5uRpnFOb0ZYMj3P?=
 =?us-ascii?Q?o3/elRIe+KTmHmVYaeg8qhRq7btTSjPpU7LF1Whd108QnJtfOHA4RYlG9uuw?=
 =?us-ascii?Q?ZKjO97jL0WhrWFhp6xZF9Yn8XzKVMujMce6SDNt9ehvKWljQm26vOsyk2cIw?=
 =?us-ascii?Q?j7DJrEwOVikylVCXUGpN0vePqtWGYOBNLuvFw751GCQ0Y0V4CPJ+OZKMNgV3?=
 =?us-ascii?Q?6Pth5nPaP/0+hp9muBy7S/6gvJ/N+wX8uKcOEj8JsOeOZIctTdiqRO32/N7M?=
 =?us-ascii?Q?z2HjupFievDiQP3z6wz0Fsj3wNXUOxfH2ZHvzi6lRhp7sewNKkgBHwdyA0id?=
 =?us-ascii?Q?lq4ExATM30qbpPSWOQwgxyOCjj4Rs0TNBnQB1z81FUobXvgI5gzaOnbDJ8ac?=
 =?us-ascii?Q?OHG5QK47+4QpUtmBMaZgsr5hpKWn+vjw9uywy6JEZoPEufsHUQI6Q3x0H4uM?=
 =?us-ascii?Q?DWq1z7S0xbodeKR/GzdaabRN3HDKWyTJ8ABUX1Qkrjc1rX2Qb62i61UsZnaR?=
 =?us-ascii?Q?I6nu3QXfHocZHngRkSrNi+8sZ87EYQh27pukf8hC9gK47AlPBmSsiqzjjrfa?=
 =?us-ascii?Q?FI5/EhF2gTjl/HeVw8oa6eTpFSW/xiO1cRm0UywaPuvha1+s8ZrevN1iLww6?=
 =?us-ascii?Q?PlBLTk5y/5qeyzkCrzOsCu1IeEpQtI3oY2Hl0ZSIKXVOqvsceyz+mDk3WmHc?=
 =?us-ascii?Q?c7d98HnCW4W726h4M0p5XOIbdpBqDLxm?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2024 01:15:47.0982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe938aa6-1f4d-490f-6a9a-08dcbd90f581
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4488
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This refactoring includes the following changes:
- For each declared error, submit the appropriate good job to ring 0
  and the bad job to ring 1 for COMPUTE IP.
- After a successful queue_reset on ring 1, submit a good job to ring 1
  to validate successful queue/pipe recovery, then submit a bad job to
  ring 2, and repeat the process.
- For cases with a single ring, such as GFX, submit a bad packet or
  shader to GFX. Simultaneously, submit good jobs to a different IP,
  like COMPUTE, from another background process.

These changes ensure a more structured and reliable approach to testing
queue resets and validating the recovery process using next step.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 95 +++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 25 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 6819892e0..d8dccda65 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -290,6 +290,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
 	bool is_dispatch;
 
 	is_dispatch_shader_test(error, error_str, &is_dispatch);
+
 	get_ip_type(ip_good, ip_good_str);
 	get_ip_type(ip_bad, ip_bad_str);
 
@@ -852,35 +853,74 @@ free_contexts(amdgpu_device_handle device, amdgpu_context_handle *p_contexts,
 }
 
 static bool
-get_next_rings(unsigned int ring_begin, struct drm_amdgpu_info_hw_ip info[],
-		unsigned int *good_job_ring, unsigned int *bad_job_ring,  unsigned int order)
+adjust_begin_index(unsigned int *ring_begin, unsigned int available_good_rings)
 {
-	unsigned int ring_id;
+	unsigned int ring_id = *ring_begin;
+
+	if (!((1 << ring_id) & available_good_rings)) {
+		*ring_begin = 0;
+		return true;
+	}
+	return false;
+}
+
+static bool
+allow_same_ring_id(bool are_rings_of_differant_ip, unsigned int ring_id_bad, unsigned int ring_id_good)
+{
+	if (are_rings_of_differant_ip == true)
+		return true;
+
+	return ring_id_bad != ring_id_good;
+}
+
+static bool
+get_next_rings(unsigned int *ring_begin_good, unsigned int *ring_begin_bad,
+			unsigned int available_good_rings, unsigned int available_bad_rings,
+			bool are_rings_of_differant_ip, unsigned int *good_job_ring,
+			unsigned int *bad_job_ring)
+{
+	unsigned int ring_id_good, ring_id_bad;
+
+	for (ring_id_good = *ring_begin_good; ring_id_good < 32; ring_id_good++) {
+		if ((1 << ring_id_good) & available_good_rings) {
+			*good_job_ring = ring_id_good;
+
+			for (ring_id_bad = *ring_begin_bad; ring_id_bad < 32; ring_id_bad++) {
+				if ((1 << ring_id_bad) & available_bad_rings &&
+					allow_same_ring_id(are_rings_of_differant_ip, ring_id_bad, ring_id_good)) {
+					*bad_job_ring = ring_id_bad;
+
+					// Update the starting points for the next call
+					*ring_begin_good = ring_id_good + 1;
+					*ring_begin_bad = ring_id_bad + 1;
+
+					if (adjust_begin_index(ring_begin_bad, available_bad_rings))
+						*ring_begin_good += 1;
+
+					adjust_begin_index(ring_begin_good, available_good_rings);
 
-	/* Check good job ring is available. By default good job run on compute ring */
-	for (ring_id = ring_begin; (1 << ring_id) & info[0].available_rings; ring_id++) {
-		if ((1 << *good_job_ring) & info[0].available_rings) {
-			*good_job_ring = ring_id;
-			/* check bad job ring is available */
-			for (ring_id = ring_begin; (1 << ring_id) & info[order].available_rings; ring_id++) {
-				/* if order is 0, bad job run on compute ring,
-				 * It should skip good ring and find next ring to run bad job.
-				 */
-				if (!order)
-					*bad_job_ring = *good_job_ring + 1;
-				else
-					*bad_job_ring = ring_id;
-				if ((1 << *bad_job_ring) & info[order].available_rings) {
 					return true;
 				}
 			}
 
+			// Reset ring_begin_bad for the next good ring
+			*ring_begin_bad = 0;
 		}
 	}
 
 	return false;
 }
 
+static void
+reset_rings_numbers(unsigned int *ring_id_good, unsigned int *ring_id_bad,
+						unsigned int *ring_id_job_good, unsigned int *ring_id_job_bad)
+{
+	*ring_id_good = 0;
+	*ring_id_bad = 0;
+	*ring_id_job_good = 0;
+	*ring_id_job_bad = 0;
+}
+
 igt_main
 {
 	char cmdline[2048];
@@ -901,8 +941,10 @@ igt_main
 
 	int r;
 	bool arr_cap[AMD_IP_MAX] = {0};
-	unsigned int ring_id_good = 0;
-	unsigned int ring_id_bad = 1;
+	unsigned int ring_id_good;
+	unsigned int ring_id_bad;
+	unsigned int ring_id_job_good;
+	unsigned int ring_id_job_bad;
 
 	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
@@ -926,7 +968,7 @@ igt_main
 			//	"Stressful-and-multiple-cs-of-bad and good reg-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR, "BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR",
 				"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
-			//TODO  KGQ cannot revocer by queue reset, it maybe need a fw bugfix on naiv31
+			//TODO  KGQ cannot recover by queue reset, it maybe need a fw bugfix on naiv31
 			//{BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING,"BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING",
 			//	"Stressful-and-multiple-cs-of-bad and good shader-operations-using-multiple-processes"},
 			{BACKEND_SE_GC_SHADER_INVALID_USER_DATA, "BACKEND_SE_GC_SHADER_INVALID_USER_DATA",
@@ -996,12 +1038,15 @@ igt_main
 	}
 
 	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
+		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
 		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
-			igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
-			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAFIX", it->name) {
-				if (arr_cap[ip_tests[i]] && get_next_rings(ring_id_good, info, &ring_id_good, &ring_id_bad, i)) {
-					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name,ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAFIX")
-					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_good, ring_id_bad);
+			igt_describe("Stressful-and-multiple-cs-of-bad-and-good-length-operations-using-multiple-processes");
+			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name) {
+				if (arr_cap[ip_tests[i]] && get_next_rings(&ring_id_good, &ring_id_bad, info[0].available_rings,
+						info[i].available_rings, ip_background != ip_tests[i], &ring_id_job_good, &ring_id_job_bad)) {
+					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name, ring_id_job_good, ring_id_job_bad,
+							ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX")
+					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_job_good, ring_id_job_bad);
 				}
 			}
 		}
-- 
2.25.1

