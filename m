Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23702606A329
	for <igt-dev@archiver.kernel.org>; Tue, 17 Nov 2026 11:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ndLJzaET
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F6C10E3C0;
	Tue, 17 Nov 2026 11:16:46 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7785D10F627
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Nov 2026 11:14:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J0S++RNt5MW+sqlNf0LHrdT9Lihf4MA3WHPz0YI0NADW775nh3OgKyTaWwFZ7rG/+MJeuOMTkXjauJeQquhvsszGakTftMgclCij37T5oGbZzYKG92qdruRFzW9jOhzBdEGw/iJocBchZ3tYBsUdgrgazGXQUyPchD5+cx7PgLR9QBLHAiAM2gDw2MdolIVzXb8Rnvf4B68nz5aGB+JC7lUrOAD2gi0JQVlLYSeppzrUvUa0m7IVvdod72natkV1ILeaoQxGUEjeeJctxehGw17fkNwojUGtkLbZT3u+7dEOnqat2cuQp3NO6PL3MS6lWCCdcUq2HXUEACMNwt+Jaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=snnHErqmJXARBVdrhcCfWQy1khQn8wydKcKL0f5MQD0=;
 b=Zkdu6zeFRHRknIWRI0pdPykEC/kiNyd0EqMAQ7vvALabubzv3l5G/jiz+TL7ffGTYhojPXFXlME2IZXZm+4AU5KP9QL6Eg/QXORbUaTSKc8W8IOoIVXs8OOy3lLlCpTibfZpt06f8JcmuzJr5xLDr8V7X49KZFb+ulqbmd9RJU6OPC+1Mf/hO7bIVqaduYGiUPonQKlEzlYbMUaFYYIIOonH3usSKG2Y16Eg+Wy4mdSZcV0EJDktGwYrJ/W1wDys98MJsl4xwQayjz3fs2Xcgqo/6H/DkS0oOAszC4QCraUVHHsL2kZQSaI2fJftWBni07D5gmmsJxxT/fRS9hwoTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=snnHErqmJXARBVdrhcCfWQy1khQn8wydKcKL0f5MQD0=;
 b=ndLJzaETsQn5uuxpSygRdrGhJpwvj9B3lEZeodi+c2N5+kPKBdDxf01rtPDQdk1X4AfpmTdnBW8bRsTQBQktqwF3/xnNOiMamn3iFgJeQHABmFJfUWq3b/+xqJTZhcfx7hplWIAmLkKJ4z5KzT6KpPalwzHOt2uV4VssUT1wEG8=
Received: from PH5P220CA0010.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::13)
 by PH7PR12MB7377.namprd12.prod.outlook.com (2603:10b6:510:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 11:14:00 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:510:34a:cafe::83) by PH5P220CA0010.outlook.office365.com
 (2603:10b6:510:34a::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Tue,
 17 Nov 2026 11:14:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Tue, 17 Nov 2026 11:13:59 +0000
Received: from vpe-at2.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Tue, 17 Nov
 2026 05:13:55 -0600
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <Solomon.Chiu@amd.com>, Alex Hung
 <alex.hung@amd.com>
CC: Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t v2 3/3] tests/amdgpu: refactor job setup of VPE blit
 tests
Date: Tue, 17 Nov 2026 19:13:36 +0800
Message-ID: <20261117111336.8130-4-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261117111336.8130-1-chih-wei.chien@amd.com>
References: <20261117111336.8130-1-chih-wei.chien@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|PH7PR12MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5a0e3c-6180-4581-b73b-08df449be12e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|1800799024|376014|23010399003|22082099003|18002099003|261009223027099003|20052099010|3023799007|11063799006|56012099006|10067099003|261102123227099003|261028144727099003|261026121527099003|261026130827099003|261026140227099003|261026135527099003|261021133027099003|261021121427099003|261021130227099003|261021123027099003|261021135927099003|261022113327099003|261022075727099003|261022105027099003|261022115727099003;
X-Microsoft-Antispam-Message-Info: vC5tvGz4HSdT8dacocdbu7QVCxfj2X4/gPxL318nFMWNVOk8dOrA+iCNyE84ZAwAAsiXNy8EwASvS40wGxuIbfsz3OD7wxl8FeDQOu7r5TYYNlsCwX9CHikUnBOM5qUkCd/33Fa9tMfn/QMsZROjnc7ugSo34Qqp/w5JZ+Znj4Ksnh4xEvYJ/nnRoycOjgdPX7AVPNyE7zh/p6nQHWHMYivTe9c8FjZogLjk3rYSthnMJBOxzR12GvwRyehccvA8v4V3qqG9RMXDhDHYWBAgaoK+eC5313gL+CY/EEjeVZC4HpUzMInWwiNoGHeqUW7zF3tmJ6xAP8VQL+kqy8T1fwdRGmWUWAn50VFzuQ4murReNu8Q7eDu58El8Is8Lkguy4SAjD+SqBamU1Vd9wFf2KiUHwamale1FJQbRNMfRS9RT9EBFu5Kt4vW02Kr1huN7kHzOcFkB9Xf3OFGMHxsjDMtaModlrSlDP9QXrAW6VAwIERdpwMpOJ1BK9UQ3DpbaYqlavHUo+Pn43SJnMXuGuwX+Dd99UUNoeCXNtWvZ1fpmtWHt4Tbx1/eK2n1HnoZv1ySUWUrGvZYbOfEoSR6up2z7D5eFGwffKN0Py2dAPRhMjVud/EVYGkRvU9GUnC8krUgeh6Q/It5BkohvgwhnkwG9kr8AEEexDyiVU34nv/9UxIvxrjapDeOzofdXIO5rVrJj9HAzLN0OEiFVgUYaw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(1800799024)(376014)(23010399003)(22082099003)(18002099003)(261009223027099003)(20052099010)(3023799007)(11063799006)(56012099006)(10067099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026130827099003)(261026140227099003)(261026135527099003)(261021133027099003)(261021121427099003)(261021130227099003)(261021123027099003)(261021135927099003)(261022113327099003)(261022075727099003)(261022105027099003)(261022115727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 0u4eEEzUXV705eV92gVfoljfVV0xTdJw78dLVPRLA8HcEhKy9cFKAaCNt7qX91zZ3edEZdhTvzPleWrSVHx8BrX9j5UwhoTtvkFQQuuGimczDqJ5N/6pGheuDnL4Wcm7/p6wEWJlhDPEZgj83m78LfZwwWPavj9p1xgjGlA0G+vLYs2rs8M1RHOa83m70YDdlTVoT52jBQIr4ZYWXQPkL+2lBadxweu+m5DsaxGPUsfpKKvuCUD9QKBL2qlle72kWIEvRad57vxshE0m85RNSqx4P2h0GEhGkTriw5mopnsnKKDToypj9v3jiXovqjv9cC+vw/JHQYbnMQNQ1zygQhOxndN4bPB5L1lZofVLo30aMdlqGQnGTP0ZmSknIAsGi38/OgtcpOudF+AEH1lMqM57zSzYP9MOE7BChC2D+F5zALmhebP5S7oXFwrzy3yA
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 11:13:59.7178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5a0e3c-6180-4581-b73b-08df449be12e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7377
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

As blit tests for VPE1~3 share the same job setup flow, and only index and
offest for patching are in difference, it is refactored for all blit test
to share the same blit test runner function.

So when new test cases added in the future, we only need to add new test
descriptor and commands. We don't need to worry about messing up job setup
flow in its the function. Reviewers also don't need to go through new job
setup function each time.

Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
---
 tests/amdgpu/amd_vpe.c | 319 +++++++++++++++++------------------------
 1 file changed, 128 insertions(+), 191 deletions(-)

diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
index 815cd7adf..45c1becac 100644
--- a/tests/amdgpu/amd_vpe.c
+++ b/tests/amdgpu/amd_vpe.c
@@ -141,110 +141,39 @@ static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
 	return 0;
 }
 
-static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
-				struct mmd_context *context)
-{
-	int r;
-	uint32_t frame_size;
-	struct amdgpu_mmd_bo vpep_cmd_bo, src_plane_bo, dst_plane_bo;
-	/* same height and pitch for input and output */
-	const uint32_t height = 256;
-	const uint32_t pitch = 1024;
-	const uint32_t vpep_config_offsets[] = { 0x34, 0x128, 0x184, 0x1c0, };
-
-	uint32_t *vpec_csc_cmd = vpe1_get_vpec_csc_cmd();
-	uint32_t *vpep_csc_cmd = vpe1_get_vpep_csc_cmd();
-
-	frame_size = pitch * height * 4;
-	context->num_resources = 0;
-
-	alloc_resource(device_handle, &vpep_cmd_bo, VPE1_VPEP_CSC_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
-	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
-	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
-
-	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_cpu_map(src_plane_bo.handle, (void **)&src_plane_bo.ptr);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
-	igt_assert_eq(r, 0);
-
-	context->resources[context->num_resources++] = vpep_cmd_bo.handle;
-	context->resources[context->num_resources++] = src_plane_bo.handle;
-	context->resources[context->num_resources++] = dst_plane_bo.handle;
-
-	/* plane config gpu addr */
-	*(uint64_t *)(vpec_csc_cmd + 1) = vpep_cmd_bo.addr;
-	/* vpep config0 gpu addr */
-	*(uint64_t *)(vpec_csc_cmd + 4) = vpep_cmd_bo.addr + vpep_config_offsets[0];
-	/* vpep config1 gpu addr */
-	*(uint64_t *)(vpec_csc_cmd + 6) = vpep_cmd_bo.addr + vpep_config_offsets[1];
-	/* vpep config2 gpu addr */
-	*(uint64_t *)(vpec_csc_cmd + 8) = vpep_cmd_bo.addr + vpep_config_offsets[2];
-	/* vpep config3 gpu addr */
-	*(uint64_t *)(vpec_csc_cmd + 10) = vpep_cmd_bo.addr + vpep_config_offsets[3];
-
-	memset(src_plane_bo.ptr, 0, frame_size);
-	memset(dst_plane_bo.ptr, 0, frame_size);
-	create_rgba8888(src_plane_bo.ptr, pitch, height);
-
-	/* gpu address of src */
-	*(uint64_t *)(vpep_csc_cmd + 2) = src_plane_bo.addr;
-	/* gpu address of dst */
-	*(uint64_t *)(vpep_csc_cmd + 8) = dst_plane_bo.addr;
-
-	memset(vpep_cmd_bo.ptr, 0, VPE1_VPEP_CSC_CMD_SIZE);
-	memcpy(vpep_cmd_bo.ptr, vpep_csc_cmd, VPE1_VPEP_CSC_CMD_SIZE);
-
-	memset(context->ib_cpu, 0, IB_SIZE);
-	memcpy(context->ib_cpu, vpec_csc_cmd, VPE1_VPEC_CSC_CMD_SIZE);
-
-	context->resources[context->num_resources++] = context->ib_handle;
-
-	r = submit(device_handle, context, VPE1_VPEC_CSC_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
-	igt_assert_eq(r, 0);
-
-	r = check_argb8888(dst_plane_bo.ptr, pitch, height);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_cpu_unmap(src_plane_bo.handle);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
-	igt_assert_eq(r, 0);
-
-	free_resource(&vpep_cmd_bo);
-	free_resource(&src_plane_bo);
-	free_resource(&dst_plane_bo);
-}
-
-static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mmd_context *context)
+/* The descriptor of a VPE blit test. All the blit tests use this descriptor to
+ * tell the runner function amdgpu_cs_vpe_blit_run how to setup VPE commands and
+ * testing pattern in memory.
+ */
+struct vpe_blit_test {
+	uint32_t *vpec_cmd;
+	uint32_t vpec_cmd_size;
+	uint32_t *vpep_cmd;
+	uint32_t vpep_cmd_size;
+
+	const uint32_t *patch_vpec_index;
+	const uint32_t *patch_vpec_offset;
+	uint32_t num_patch_vpec;
+	const uint32_t *patch_src_plane;
+	const uint32_t *patch_dst_plane;
+	uint32_t num_patch_plane;
+
+	uint32_t height;
+	uint32_t pitch;
+
+	void (*fill_src)(void *addr, uint32_t width, uint32_t height);
+	int (*check_dst)(void *addr, uint32_t width, uint32_t height);
+};
+
+static void amdgpu_cs_vpe_blit_run(amdgpu_device_handle device_handle,
+				   struct mmd_context *context,
+				   const struct vpe_blit_test *test)
 {
 	int i, r;
 	uint32_t frame_size;
 	struct amdgpu_mmd_bo vpep_cmd_bo, src_plane_bo, dst_plane_bo;
-	/* same height and pitch for input and output */
-	const uint32_t height = 256;
-	const uint32_t pitch = 1024;
-
-	const uint32_t patch_vpec_index[18] = {
-	 1,  4,  6,  8, 10, 12, 14, 16,
-	18, 20, 22, 24, 26, 28, 30, 32,
-	34, 36, };
-	const uint32_t patch_vpec_offset[18] = {
-	0x0000, 0x0080, 0x00c0, 0x0100, 0x0140, 0x01c0, 0x0740, 0x0b80,
-	0x0c40, 0x0cc0, 0x0d40, 0x1280, 0x16c0, 0x1780, 0x1800, 0x18c0,
-	0x1900, 0x19c0, };
-	const uint32_t patch_src_luma[2] = { 2, 8, };
-	const uint32_t patch_dst_luma[2] = { 14, 20, };
-
-	uint32_t *vpec_hmirror_cmd = vpe2_get_vpec_hmirror_cmd();
-	uint32_t *vpep_hmirror_cmd = vpe2_get_vpep_hmirror_cmd();
+	const uint32_t height = test->height;
+	const uint32_t pitch = test->pitch;
 
 	frame_size = pitch * height * 4;
 	context->num_resources = 0;
@@ -253,7 +182,7 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
 	r = amdgpu_bo_cpu_map(src_plane_bo.handle, (void **)&src_plane_bo.ptr);
 	igt_assert_eq(r, 0);
-	create_rgba8888_hmirror(src_plane_bo.ptr, pitch, height);
+	test->fill_src(src_plane_bo.ptr, pitch, height);
 	r = amdgpu_bo_cpu_unmap(src_plane_bo.handle);
 	igt_assert_eq(r, 0);
 
@@ -266,24 +195,24 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	igt_assert_eq(r, 0);
 
 	/* prepare VPEP command buffer and setup command buffer data */
-	alloc_resource(device_handle, &vpep_cmd_bo, VPE2_VPEP_HMIRROR_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
+	alloc_resource(device_handle, &vpep_cmd_bo, test->vpep_cmd_size, AMDGPU_GEM_DOMAIN_GTT);
 	/* patch gpu addr of vpep cmd */
-	for (i = 0; i < sizeof(patch_vpec_index) / sizeof(uint32_t); i++) {
-		vpec_hmirror_cmd[patch_vpec_index[i] + 0] = (uint32_t)(vpep_cmd_bo.addr & 0xffffffff) + patch_vpec_offset[i];
-		vpec_hmirror_cmd[patch_vpec_index[i] + 1] = (uint32_t)((vpep_cmd_bo.addr & 0xffffffff00000000) >> 32);
+	for (i = 0; i < test->num_patch_vpec; i++) {
+		test->vpec_cmd[test->patch_vpec_index[i] + 0] = lower_32_bits(vpep_cmd_bo.addr) + test->patch_vpec_offset[i];
+		test->vpec_cmd[test->patch_vpec_index[i] + 1] = upper_32_bits(vpep_cmd_bo.addr);
 	}
 	/* patch gpu addr of src/dst plane */
-	for (i = 0; i < sizeof(patch_dst_luma) / sizeof(uint32_t); i++) {
-		vpep_hmirror_cmd[patch_src_luma[i] + 0] =  (uint32_t)(src_plane_bo.addr & 0xffffffff);
-		vpep_hmirror_cmd[patch_src_luma[i] + 1] = (uint32_t)((src_plane_bo.addr & 0xffffffff00000000) >> 32);
+	for (i = 0; i < test->num_patch_plane; i++) {
+		test->vpep_cmd[test->patch_src_plane[i] + 0] = lower_32_bits(src_plane_bo.addr);
+		test->vpep_cmd[test->patch_src_plane[i] + 1] = upper_32_bits(src_plane_bo.addr);
 
-		vpep_hmirror_cmd[patch_dst_luma[i] + 0] =  (uint32_t)(dst_plane_bo.addr & 0xffffffff);
-		vpep_hmirror_cmd[patch_dst_luma[i] + 1] = (uint32_t)((dst_plane_bo.addr & 0xffffffff00000000) >> 32);
+		test->vpep_cmd[test->patch_dst_plane[i] + 0] = lower_32_bits(dst_plane_bo.addr);
+		test->vpep_cmd[test->patch_dst_plane[i] + 1] = upper_32_bits(dst_plane_bo.addr);
 	}
 	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
 	igt_assert_eq(r, 0);
-	memset(vpep_cmd_bo.ptr, 0, VPE2_VPEP_HMIRROR_CMD_SIZE);
-	memcpy(vpep_cmd_bo.ptr, vpep_hmirror_cmd, VPE2_VPEP_HMIRROR_CMD_SIZE);
+	memset(vpep_cmd_bo.ptr, 0, test->vpep_cmd_size);
+	memcpy(vpep_cmd_bo.ptr, test->vpep_cmd, test->vpep_cmd_size);
 	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
 	igt_assert_eq(r, 0);
 
@@ -293,13 +222,13 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	context->resources[context->num_resources++] = dst_plane_bo.handle;
 
 	memset(context->ib_cpu, 0, IB_SIZE);
-	memcpy(context->ib_cpu, vpec_hmirror_cmd, VPE2_VPEC_HMIRROR_CMD_SIZE);
-	r = submit(device_handle, context, VPE2_VPEC_HMIRROR_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
+	memcpy(context->ib_cpu, test->vpec_cmd, test->vpec_cmd_size);
+	r = submit(device_handle, context, test->vpec_cmd_size / 4, AMDGPU_HW_IP_VPE);
 	igt_assert_eq(r, 0);
 
 	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
 	igt_assert_eq(r, 0);
-	r = check_rgba8888_hmirror(dst_plane_bo.ptr, pitch, height);
+	r = test->check_dst(dst_plane_bo.ptr, pitch, height);
 	igt_assert_eq(r, 0);
 	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
 	igt_assert_eq(r, 0);
@@ -309,91 +238,99 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
 	free_resource(&dst_plane_bo);
 }
 
-static void amdgpu_cs_vpe3_hmirror(amdgpu_device_handle device_handle, struct mmd_context *context)
+static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
+				struct mmd_context *context)
 {
-	int i, r;
-	uint32_t frame_size;
-	struct amdgpu_mmd_bo vpep_cmd_bo, src_plane_bo, dst_plane_bo;
-	/* same height and pitch for input and output */
-	const uint32_t height = 256;
-	const uint32_t pitch = 1024;
+	static const uint32_t patch_vpec_index[] = { 1, 4, 6, 8, 10, };
+	static const uint32_t patch_vpec_offset[] = { 0x0, 0x34, 0x128, 0x184, 0x1c0, };
+	static const uint32_t patch_src_plane[] = { 2, };
+	static const uint32_t patch_dst_plane[] = { 8, };
+
+	const struct vpe_blit_test test = {
+		.vpec_cmd = vpe1_get_vpec_csc_cmd(),
+		.vpec_cmd_size = VPE1_VPEC_CSC_CMD_SIZE,
+		.vpep_cmd = vpe1_get_vpep_csc_cmd(),
+		.vpep_cmd_size = VPE1_VPEP_CSC_CMD_SIZE,
+		.patch_vpec_index = patch_vpec_index,
+		.patch_vpec_offset = patch_vpec_offset,
+		.num_patch_vpec = ARRAY_SIZE(patch_vpec_index),
+		.patch_src_plane = patch_src_plane,
+		.patch_dst_plane = patch_dst_plane,
+		.num_patch_plane = ARRAY_SIZE(patch_src_plane),
+		.height = 256,
+		.pitch = 1024,
+		.fill_src = create_rgba8888,
+		.check_dst = check_argb8888,
+	};
+
+	amdgpu_cs_vpe_blit_run(device_handle, context, &test);
+}
 
-	const uint32_t patch_vpec_index[26] = {
+static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mmd_context *context)
+{
+	static const uint32_t patch_vpec_index[] = {
+	 1,  4,  6,  8, 10, 12, 14, 16,
+	18, 20, 22, 24, 26, 28, 30, 32,
+	34, 36, };
+	static const uint32_t patch_vpec_offset[] = {
+	0x0000, 0x0080, 0x00c0, 0x0100, 0x0140, 0x01c0, 0x0740, 0x0b80,
+	0x0c40, 0x0cc0, 0x0d40, 0x1280, 0x16c0, 0x1780, 0x1800, 0x18c0,
+	0x1900, 0x19c0, };
+	static const uint32_t patch_src_plane[] = { 2, 8, };
+	static const uint32_t patch_dst_plane[] = { 14, 20, };
+
+	const struct vpe_blit_test test = {
+		.vpec_cmd = vpe2_get_vpec_hmirror_cmd(),
+		.vpec_cmd_size = VPE2_VPEC_HMIRROR_CMD_SIZE,
+		.vpep_cmd = vpe2_get_vpep_hmirror_cmd(),
+		.vpep_cmd_size = VPE2_VPEP_HMIRROR_CMD_SIZE,
+		.patch_vpec_index = patch_vpec_index,
+		.patch_vpec_offset = patch_vpec_offset,
+		.num_patch_vpec = ARRAY_SIZE(patch_vpec_index),
+		.patch_src_plane = patch_src_plane,
+		.patch_dst_plane = patch_dst_plane,
+		.num_patch_plane = ARRAY_SIZE(patch_src_plane),
+		.height = 256,
+		.pitch = 1024,
+		.fill_src = create_rgba8888_hmirror,
+		.check_dst = check_rgba8888_hmirror,
+	};
+
+	amdgpu_cs_vpe_blit_run(device_handle, context, &test);
+}
+
+static void amdgpu_cs_vpe3_hmirror(amdgpu_device_handle device_handle, struct mmd_context *context)
+{
+	static const uint32_t patch_vpec_index[] = {
 	3,  6,  8,  10, 12, 14, 16, 18,
 	20, 22, 24, 26, 28, 30, 32, 34,
 	36, 38, 40, 42, 44, 46, 48, 50,
 	52, 54, };
-	const uint32_t patch_vpec_offset[26] = {
+	static const uint32_t patch_vpec_offset[] = {
 	0x0000, 0x00c0, 0x0180, 0x01c0, 0x0200, 0x0240, 0x0300, 0x0840, 0x0c80,
 	0x0d00, 0x0e00, 0x0ec0, 0x1400, 0x1840, 0x18c0, 0x19c0, 0x1a80, 0x1fc0,
 	0x2400, 0x2480, 0x2580, 0x2640, 0x26c0, 0x2780, 0x27c0, 0x2880, };
-	const uint32_t patch_src_luma[3] = { 2, 9, 16, };
-	const uint32_t patch_dst_luma[3] = { 23, 30, 37, };
-
-	uint32_t *vpec_hmirror_cmd = vpe3_get_vpec_hmirror_cmd();
-	uint32_t *vpep_hmirror_cmd = vpe3_get_vpep_hmirror_cmd();
-
-	frame_size = pitch * height * 4;
-	context->num_resources = 0;
-
-	/* prepare source image buffer and data */
-	alloc_resource(device_handle, &src_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
-	r = amdgpu_bo_cpu_map(src_plane_bo.handle, (void **)&src_plane_bo.ptr);
-	igt_assert_eq(r, 0);
-	create_rgba8888_hmirror(src_plane_bo.ptr, pitch, height);
-	r = amdgpu_bo_cpu_unmap(src_plane_bo.handle);
-	igt_assert_eq(r, 0);
-
-	/* prepare destination image buffer */
-	alloc_resource(device_handle, &dst_plane_bo, frame_size, AMDGPU_GEM_DOMAIN_GTT);
-	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
-	igt_assert_eq(r, 0);
-	memset(dst_plane_bo.ptr, 0, frame_size);
-	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
-	igt_assert_eq(r, 0);
-
-	/* prepare VPEP command buffer and setup command buffer data */
-	alloc_resource(device_handle, &vpep_cmd_bo, VPE3_VPEP_HMIRROR_CMD_SIZE, AMDGPU_GEM_DOMAIN_GTT);
-	/* patch gpu addr of vpep cmd */
-	for (i = 0; i < sizeof(patch_vpec_index) / sizeof(uint32_t); i++) {
-		vpec_hmirror_cmd[patch_vpec_index[i] + 0] = (uint32_t)(vpep_cmd_bo.addr & 0xffffffff) + patch_vpec_offset[i];
-		vpec_hmirror_cmd[patch_vpec_index[i] + 1] = (uint32_t)((vpep_cmd_bo.addr & 0xffffffff00000000) >> 32);
-	}
-	/* patch gpu addr of src/dst plane */
-	for (i = 0; i < sizeof(patch_dst_luma) / sizeof(uint32_t); i++) {
-		vpep_hmirror_cmd[patch_src_luma[i] + 0] = (uint32_t)(src_plane_bo.addr & 0xffffffff);
-		vpep_hmirror_cmd[patch_src_luma[i] + 1] = (uint32_t)((src_plane_bo.addr & 0xffffffff00000000) >> 32);
-
-		vpep_hmirror_cmd[patch_dst_luma[i] + 0] = (uint32_t)(dst_plane_bo.addr & 0xffffffff);
-		vpep_hmirror_cmd[patch_dst_luma[i] + 1] = (uint32_t)((dst_plane_bo.addr & 0xffffffff00000000) >> 32);
-	}
-	r = amdgpu_bo_cpu_map(vpep_cmd_bo.handle, (void **)&vpep_cmd_bo.ptr);
-	igt_assert_eq(r, 0);
-	memset(vpep_cmd_bo.ptr, 0, VPE3_VPEP_HMIRROR_CMD_SIZE);
-	memcpy(vpep_cmd_bo.ptr, vpep_hmirror_cmd, VPE3_VPEP_HMIRROR_CMD_SIZE);
-	r = amdgpu_bo_cpu_unmap(vpep_cmd_bo.handle);
-	igt_assert_eq(r, 0);
-
-	context->resources[context->num_resources++] = context->ib_handle;
-	context->resources[context->num_resources++] = vpep_cmd_bo.handle;
-	context->resources[context->num_resources++] = src_plane_bo.handle;
-	context->resources[context->num_resources++] = dst_plane_bo.handle;
-
-	memset(context->ib_cpu, 0, IB_SIZE);
-	memcpy(context->ib_cpu, vpec_hmirror_cmd, VPE3_VPEC_HMIRROR_CMD_SIZE);
-	r = submit(device_handle, context, VPE3_VPEC_HMIRROR_CMD_SIZE / 4, AMDGPU_HW_IP_VPE);
-	igt_assert_eq(r, 0);
-
-	r = amdgpu_bo_cpu_map(dst_plane_bo.handle, (void **)&dst_plane_bo.ptr);
-	igt_assert_eq(r, 0);
-	r = check_rgba8888_hmirror(dst_plane_bo.ptr, pitch, height);
-	igt_assert_eq(r, 0);
-	r = amdgpu_bo_cpu_unmap(dst_plane_bo.handle);
-	igt_assert_eq(r, 0);
-
-	free_resource(&vpep_cmd_bo);
-	free_resource(&src_plane_bo);
-	free_resource(&dst_plane_bo);
+	static const uint32_t patch_src_plane[] = { 2, 9, 16, };
+	static const uint32_t patch_dst_plane[] = { 23, 30, 37, };
+
+	const struct vpe_blit_test test = {
+		.vpec_cmd = vpe3_get_vpec_hmirror_cmd(),
+		.vpec_cmd_size = VPE3_VPEC_HMIRROR_CMD_SIZE,
+		.vpep_cmd = vpe3_get_vpep_hmirror_cmd(),
+		.vpep_cmd_size = VPE3_VPEP_HMIRROR_CMD_SIZE,
+		.patch_vpec_index = patch_vpec_index,
+		.patch_vpec_offset = patch_vpec_offset,
+		.num_patch_vpec = ARRAY_SIZE(patch_vpec_index),
+		.patch_src_plane = patch_src_plane,
+		.patch_dst_plane = patch_dst_plane,
+		.num_patch_plane = ARRAY_SIZE(patch_src_plane),
+		.height = 256,
+		.pitch = 1024,
+		.fill_src = create_rgba8888_hmirror,
+		.check_dst = check_rgba8888_hmirror,
+	};
+
+	amdgpu_cs_vpe_blit_run(device_handle, context, &test);
 }
 
 static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
-- 
2.56.0

