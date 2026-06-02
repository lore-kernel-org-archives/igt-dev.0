Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771D4CD6E4A
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 11:49:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A66410EFD9;
	Tue,  2 Jun 2026 11:49:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ilv8WkSC";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011043.outbound.protection.outlook.com [52.101.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61C1F10EFD9
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 11:49:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mS3oiBGtuwVjO2VodJLygBk7Ly9uWxJJGd2pQtezQQc4HeIE5Ya+kGvFGZ9OZw6wD2LTNsVaeHcXObI8E7FnmBqgyfLks1RA0kLUnvQPNAlto3B3mVBjQ/z1OZVPh5UeR0uTs0H4sJ6Nrv0j1qj8ApQLbK0kAiduxQW6wE8cUNjDbC+mSxsOgztgdw0Uuj9cNQGXr/NXgirXu2up36xMzRJESRYmP+WBwlb6d5oU9ikk1jtUdnnheT406j8moq8W55lpiFoTgfiXEruLusVlO+3gRP7+cNd3i1Ouum++fUGBqu52KGliDZnhHSQVqYub5+tJReqOMPorjE4BikU38A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbs8zhpx7Ri8xikym0YBRPTSl7Oc+dnyWWZIRU0CkYs=;
 b=BMQQW1ccY5QpN27//PXU1eI2y3UlX8KGjxfpD263yTnb156ZIvDMXfASUpA5GOS8HWN5D9EXazX586LkVgWVGSsJNUyhRKIiUQe2TrfLomSi3WjK8UZCT69cYMldK1vFje00Oc5D+8mWzoWnm/ekhRryInNQ6vbwHmXH5BkLX/FU76wnrKp+HR7cpwnXM3+j4kbbLHCHV2pqP8R0PSSKN01f3mgM+PsoUkTPEMAKmUtd4n2CEnJ+8io3rWmbF6k/rIwJKT3LdkOL0a3IO2+fgmSDKlH7J4vbM7cXVmkWgq32mu6zsiqoqfObMfuaWL6yFxFQ1WcgGdQFDbrz1DWvtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbs8zhpx7Ri8xikym0YBRPTSl7Oc+dnyWWZIRU0CkYs=;
 b=ilv8WkSCtIE0K+MbVLgcfGLdzjnfvIgNY6Z8QJOye1wfdxf/AXIq+VXcZPu2aCkOJhxUnwF4pQemeqOlYodIhtDy6E+mNE7HkUFUb5T7DoQfE6KZ+K+jXPQ1SIVTdat1sTJArlU71mJRDeCYOiQ7l4YFh/wF+GhCv1LNHj1B3aU=
Received: from CY5PR19CA0012.namprd19.prod.outlook.com (2603:10b6:930:15::16)
 by LV8PR12MB9181.namprd12.prod.outlook.com (2603:10b6:408:18d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 11:49:11 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:930:15:cafe::14) by CY5PR19CA0012.outlook.office365.com
 (2603:10b6:930:15::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 11:49:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 11:49:11 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 06:49:08 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>, Jani Nikula <jani.nikula@intel.com>, Alex Hung
 <alex.hung@amd.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t 2/2] tests/amdgpu/vpe: refactor VPE1 blit test
Date: Tue, 2 Jun 2026 19:40:25 +0800
Message-ID: <20260602114025.649389-3-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602114025.649389-1-chih-wei.chien@amd.com>
References: <20260602114025.649389-1-chih-wei.chien@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|LV8PR12MB9181:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bea5168-84c2-42d7-795d-08dec09cf69d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|20052099010|56012099006|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: qj4FyZYap7H9u54vLOdt5FqXCE40HjLHjI0eK7uwW/MLSjmKMjW3q8ZXM5t0UHdxsZ3eYtxv5XTY9DGw0H2W3IV/l+OP/OOhVJcz5CAq3aLBaxkM+ItXwSVU0Y7Z4w2vg2JGQNVBXd5yS2x9UnLhHjlH2DDhratvYS/zqsZep933F8OAXH2/PN52iA7WYVrNO++2LG2qAZ+5ewyaNvVT9Au8mQvclZL0nNYz4sjXjccxcsAtb0jfGl5wNl5pxH3n9CRSyLH6lka7eb1OswIQ/uSfM4NqQ6MGh0u7DdPXRTGDG5MWSMYJYT6Zbknut5jdYoG57fkb9NMwj385ATQ50gS4ivjnwneMzxWMcVE6BXtAAHcXWGrexnYGHCOadLc9UelgA+dgvSSfP/ylrNsBPeQ/H/rDDCG0fN+ioxxQv9aCdsqXBOH9o3gsYpMThrWbMiWhnELiemRbsAy5D43JhE1TOwlof/LXeuCkmZLY/ZUsqFQcEyvTi8JoZgOnuwTW0dpWy5uay1jINUH2Tw+6J/+Yfwu1RIbS/k434IcsVyqDsiaZ8ShQk1/wiDD26QMkonq9GXZKakFLWcOIp7/C48qZe2m631YMOLdjaXvQ3SjtWKhSVZD14NfUL8fsPIlnhWk9cBcltqo2QJxjuyC2wnxP5NNTdzOu0rXN5Oav9Ou6Acq4mlm6Vjug6/xG09RXgonKybZmCY3DPyCM7kGAf2Ul1+ARYv8znxge+p6730U=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(20052099010)(56012099006)(3023799007)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: nycBkiMWU5kfdjj9l6DszIqUI22/PosWgcfVOP6gs5cV1ro3GrJ3RIiCiHOozq3Z6EWPdoh3svdDRaziQPhJm7Q7dMYxngm6VlQT/8NhQ45/EBUkLu0UprfGGljdSrtYo+vB1MJdtExUSfvO4/Rs94TR4yPSu91qSU8Ii6Emp1HPsRcDatTAHyYAyK7pTLLTovtMe+oav3Ki2tfQ1JGu/978hniBI93uXctpZltbpiPdXD/auy4SR0kNQEiK5ntOGo4NI5iAW4ITd7LEQApNSU4g3kv2iiTTOTuSxWEnYnyFr3pj3qSquOaXste26DukdKWrrRFePeJ3bEBBR8BM2UjWpCN6TPf9Z7eSrIDRn0OXhVrs0l4JjOzpVN35g0EPH1NepccBj7eKF49CjvDi7PWf6S9pBK2ylAeWeREwLuzMoT/hfvFa4GyO8GxFG41o
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:49:11.7249 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bea5168-84c2-42d7-795d-08dec09cf69d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9181
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

Commands are moved to new source file to declutter amd_vpe.c. New
commands added in the future will follow the same way, so amd_vpe.c won't
be flooded with commands.

Frame size setup is moved into test case to be per test case, instead of
global, as more tests will be added in the future. Variable naming are
revised to align with coding style guide and be consistent with VPE2 blit
test.

Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
---
 tests/amdgpu/amd_vpe.c     | 105 ++++++++++++++-----------------------
 tests/amdgpu/amd_vpe.h     |  15 ++++++
 tests/amdgpu/amd_vpe_cmd.c |  38 ++++++++++++++
 3 files changed, 92 insertions(+), 66 deletions(-)

diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 80b96bc10..658c3b8b0 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -14,41 +14,6 @@ IGT_TEST_DESCRIPTION("Test VPE functionality");
 
 #define MAX_RESOURCES		16
 
-#define PLANE_WIDTH		1024
-#define PLANE_HEIGHT		256
-#define PLANE_SIZE		(PLANE_WIDTH*PLANE_HEIGHT*4)
-
-#define SRC_PLANE_PATTERN	0x12345678
-#define DST_PLANE_PATTERN	0xff123456
-
-static uint32_t vpe_descriptor[] = {
-0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
-0x33002384, 0xff000021, 0x330023c0, 0xff000021,
-};
-
-static uint32_t vpe_config[] = {
-0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
-0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
-0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
-0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
-0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
-0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
-0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
-0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
-0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
-0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
-0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
-0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
-0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
-0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
-0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
-0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
-0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
-0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
-0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
-0x0004aad4, 0x00000013,
-};
-
 static bool is_vpe_tests_enabled(amdgpu_device_handle device_handle,
 		struct mmd_shared_context *shared_context)
 {
@@ -179,17 +144,25 @@ static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
 static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 				struct mmd_context *context)
 {
-	const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
-	struct amdgpu_mmd_bo vpe_config_bo, src_plane_bo, dst_plane_bo;
 	int r;
+	uint32_t frame_size;
+	struct amdgpu_mmd_bo vpep_cmd_bo, src_plane_bo, dst_plane_bo;
+	/* same height and pitch for input and output */
+	const uint32_t height = 256;
+	const uint32_t pitch = 1024;
+	const uint32_t vpep_config_offsets[] = { 0x34, 0x128, 0x184, 0x1c0, };
 
+	uint32_t *vpec_csc_cmd = vpe_get_vpec_csc_cmd();
+	uint32_t *vpep_csc_cmd = vpe_get_vpep_csc_cmd();
+
+	frame_size = pitch * height * 4;
 	context->num_resources = 0;
 
-	alloc_resource(device_handle, &vpe_config_bo, sizeof(vpe_config), AMDGPU_GEM_DOMAIN_GTT);
-	alloc_resource(device_handle, &src_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
-	alloc_resource(device_handle, &dst_plane_bo, PLANE_SIZE, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &vpep_cmd_bo, VPEP_CSC_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
 
-	r = amdgpu_bo_cpu_map(vpe_config_bo.handle, (void **)&vpe_config_bo.ptr);
+	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_cpu_map(src_plane_bo.handle, (void **)&src_plane_bo.ptr);
@@ -198,45 +171,45 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
 	igt_assert_eq(r, 0);
 
-	context->resources[context->num_resources++] = vpe_config_bo.handle;
+	context->resources[context->num_resources++] = vpep_cmd_bo.handle;
 	context->resources[context->num_resources++] = src_plane_bo.handle;
 	context->resources[context->num_resources++] = dst_plane_bo.handle;
 
-	// plane config gpu addr
-	*(uint64_t *)(vpe_descriptor + 1) = vpe_config_bo.addr;
-	// vpep config0 gpu addr
-	*(uint64_t *)(vpe_descriptor + 4) = vpe_config_bo.addr + vpep_config_offsets[0];
-	// vpep config1 gpu addr
-	*(uint64_t *)(vpe_descriptor + 6) = vpe_config_bo.addr + vpep_config_offsets[1];
-	// vpep config2 gpu addr
-	*(uint64_t *)(vpe_descriptor + 8) = vpe_config_bo.addr + vpep_config_offsets[2];
-	// vpep config3 gpu addr
-	*(uint64_t *)(vpe_descriptor + 10) = vpe_config_bo.addr + vpep_config_offsets[3];
-
-	memset(src_plane_bo.ptr, 0, PLANE_SIZE);
-	memset(dst_plane_bo.ptr, 0, PLANE_SIZE);
-	create_rgba8888(src_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
+	/* plane config gpu addr */
+	*(uint64_t *)(vpec_csc_cmd + 1) = vpep_cmd_bo.addr;
+	/* vpep config0 gpu addr */
+	*(uint64_t *)(vpec_csc_cmd + 4) = vpep_cmd_bo.addr + vpep_config_offsets[0];
+	/* vpep config1 gpu addr */
+	*(uint64_t *)(vpec_csc_cmd + 6) = vpep_cmd_bo.addr + vpep_config_offsets[1];
+	/* vpep config2 gpu addr */
+	*(uint64_t *)(vpec_csc_cmd + 8) = vpep_cmd_bo.addr + vpep_config_offsets[2];
+	/* vpep config3 gpu addr */
+	*(uint64_t *)(vpec_csc_cmd + 10) = vpep_cmd_bo.addr + vpep_config_offsets[3];
+
+	memset(src_plane_bo.ptr, 0, frame_size);
+	memset(dst_plane_bo.ptr, 0, frame_size);
+	create_rgba8888(src_plane_bo.ptr, pitch, height);
 
 	/* gpu address of src */
-	*(uint64_t *)(vpe_config + 2) = src_plane_bo.addr;
+	*(uint64_t *)(vpep_csc_cmd + 2) = src_plane_bo.addr;
 	/* gpu address of dst */
-	*(uint64_t *)(vpe_config + 8) = dst_plane_bo.addr;
+	*(uint64_t *)(vpep_csc_cmd + 8) = dst_plane_bo.addr;
 
-	memset(vpe_config_bo.ptr, 0, sizeof(vpe_config));
-	memcpy(vpe_config_bo.ptr, vpe_config, sizeof(vpe_config));
+	memset(vpep_cmd_bo.ptr, 0, VPEP_CSC_CMD_SIZE);
+	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, VPEP_CSC_CMD_SIZE);
 
 	memset(context->ib_cpu, 0, IB_SIZE);
-	memcpy(context->ib_cpu, vpe_descriptor, sizeof(vpe_descriptor));
+	memcpy(context->ib_cpu, vpec_csc_cmd, VPEC_CSC_CMD_SIZE);
 
 	context->resources[context->num_resources++] = context->ib_handle;
 
-	r = submit(device_handle, context, sizeof(vpe_descriptor)/4, AMDGPU_HW_IP_VPE);
+	r = submit(device_handle, context, VPEC_CSC_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
 	igt_assert_eq(r, 0);
 
-	r = check_argb8888(dst_plane_bo.ptr, PLANE_WIDTH, PLANE_HEIGHT);
+	r = check_argb8888(dst_plane_bo.ptr, pitch, height);
 	igt_assert_eq(r, 0);
 
-	r = amdgpu_bo_cpu_unmap(vpe_config_bo.handle);
+	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_cpu_unmap(src_plane_bo.handle);
@@ -245,7 +218,7 @@ static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
 	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
 	igt_assert_eq(r, 0);
 
-	free_resource(&vpe_config_bo);
+	free_resource(&vpep_cmd_bo);
 	free_resource(&src_plane_bo);
 	free_resource(&dst_plane_bo);
 }
@@ -384,7 +357,7 @@ int igt_main()
 
 	igt_describe("Test VPE fence");
 	igt_subtest("vpe-fence-test")
-	amdgpu_cs_vpe_fence(device, &context);
+		amdgpu_cs_vpe_fence(device, &context);
 
 	igt_describe("Test VPE blit");
 	igt_subtest("vpe-blit-test")
diff --git a/tests/amdgpu/amd_vpe.h b/tests/amdgpu/amd_vpe.h
index 31015ccfb..804fab45f 100644
--- a/tests/amdgpu/amd_vpe.h
+++ b/tests/amdgpu/amd_vpe.h
@@ -8,6 +8,19 @@
 
 #include <amdgpu.h>
 
+/* color space conversion commands
+ * source:      1024(pitch 1024) x 256 RGBA
+ * destination: 1024(pitch 1024) x 256 ARGB
+ */
+
+#define SRC_PLANE_PATTERN	0x12345678
+#define DST_PLANE_PATTERN	0xff123456
+
+#define VPEC_CSC_CMD_LENGTH	12
+#define VPEP_CSC_CMD_LENGTH	154
+#define VPEC_CSC_CMD_SIZE	(VPEC_CSC_CMD_LENGTH * sizeof(uint32_t))
+#define VPEP_CSC_CMD_SIZE	(VPEP_CSC_CMD_LENGTH * sizeof(uint32_t))
+
 /* horizontal mirror commands
  * source:      1024(pitch 1024) x 256 RGBA
  * destination: 1024(pitch 1024) x 256 RGBA
@@ -21,6 +34,8 @@
 #define VPEC_HMIRROR_CMD_SIZE	(VPEC_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
 #define VPEP_HMIRROR_CMD_SIZE	(VPEP_HMIRROR_CMD_LENGTH * sizeof(uint32_t))
 
+uint32_t *vpe_get_vpec_csc_cmd(void);
+uint32_t *vpe_get_vpep_csc_cmd(void);
 uint32_t *vpe_get_vpec_hmirror_cmd(void);
 uint32_t *vpe_get_vpep_hmirror_cmd(void);
 
diff --git a/tests/amdgpu/amd_vpe_cmd.c b/tests/amdgpu/amd_vpe_cmd.c
index b7849a5f8..5dbc2a83b 100644
--- a/tests/amdgpu/amd_vpe_cmd.c
+++ b/tests/amdgpu/amd_vpe_cmd.c
@@ -5,6 +5,44 @@
 
 #include "amd_vpe.h"
 
+static uint32_t vpec_csc_cmd[12] = {
+0x00000001, 0x33002200, 0xff000021, 0x00000003, 0x33002234, 0xff000021, 0x33002328, 0xff000021,
+0x33002384, 0xff000021, 0x330023c0, 0xff000021,
+};
+
+static uint32_t vpep_csc_cmd[154] = {
+0x00000002, 0x00000000, 0xbeefbe00, 0xff005678, 0x000003ff, 0x00000000, 0x00ff43ff, 0x00000000,
+0xbeefbe00, 0xff005679, 0x000003ff, 0x00000000, 0x00ff43ff, 0x003b0003, 0x00047808, 0x00000809,
+0x0004780c, 0x000000e4, 0x00047d10, 0x00000009, 0x00047d14, 0x00000101, 0x00047d18, 0x00000000,
+0x00047d1c, 0x00000000, 0x00047d20, 0x00000000, 0x00047d24, 0x0001f010, 0x00047d28, 0x0001f010,
+0x00047d2c, 0x0001f010, 0x00547ee9, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000,
+0x00002000, 0x00047ee4, 0x00000001, 0x00047ee0, 0x00000000, 0x00047f24, 0x00000000, 0x00047fc4,
+0x00000000, 0x00547f05, 0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000,
+0x00047f00, 0x00000001, 0x00049700, 0x00000000, 0x00049704, 0x0000000f, 0x00049f30, 0x00000000,
+0x00049708, 0x00000000, 0x0004970c, 0xffff0462, 0x0004a208, 0x00000000, 0x0004971c, 0x00000000,
+0x00047fc0, 0x0001f000, 0x00150003, 0x00047df8, 0x00000001, 0x00047dfc, 0x00000001, 0x00047da8,
+0x00000006, 0x00047e18, 0x00000000, 0x0004970c, 0xffff0422, 0x00049710, 0x0001f000, 0x00049714,
+0x0001f000, 0x00049718, 0x0001f000, 0x00049720, 0x00000000, 0x00049724, 0x00000000, 0x00049728,
+0x00000000, 0x000d0003, 0x00047810, 0x00000000, 0x00047814, 0x01000400, 0x00047818, 0x00000000,
+0x0004781c, 0x01000400, 0x00047e00, 0x00000000, 0x00047e04, 0x01000400, 0x00047e08, 0x01000400,
+0x00280003, 0x00047820, 0x00000036, 0x00047824, 0x0960f015, 0x0004972c, 0x00000014, 0x0004972c,
+0x00000014, 0x0004972c, 0x00000014, 0x00049f90, 0x00000000, 0x00049f94, 0x00000001, 0x00549f99,
+0x00002000, 0x00000000, 0x20000000, 0x00000000, 0x00000000, 0x00002000, 0x00049850, 0x00000000,
+0x00049f34, 0x00000000, 0x00049f38, 0x02fff000, 0x00049f3c, 0x00fff000, 0x00049f40, 0x00fff000,
+0x0004aba0, 0xffff0000, 0x0004aba0, 0xffff0000, 0x0004aacc, 0x00000000, 0x0004aad4, 0x00000013,
+0x0004aad4, 0x00000013,
+};
+
+uint32_t *vpe_get_vpec_csc_cmd(void)
+{
+	return vpec_csc_cmd;
+}
+
+uint32_t *vpe_get_vpep_csc_cmd(void)
+{
+	return vpep_csc_cmd;
+}
+
 static uint32_t vpec_hmirror_cmd[38] = {
 0x00000001, 0x00800000, 0xffff8001, 0x00000010, 0x00800080, 0xffff8001, 0x008000c0, 0xffff8001,
 0x00800100, 0xffff8001, 0x00800140, 0xffff8001, 0x008001c0, 0xffff8001, 0x00800740, 0xffff8001,
-- 
2.54.0

