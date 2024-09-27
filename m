Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41901CEBF69
	for <igt-dev@archiver.kernel.org>; Fri, 27 Sep 2024 03:13:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4F210EBFA;
	Fri, 27 Sep 2024 03:13:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FFuXu0pn";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2132B10EBFA
 for <igt-dev@lists.freedesktop.org>; Fri, 27 Sep 2024 03:13:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kkhhh1cNTLl18DCXzsUrVkRtbBxRz7Rlm9gzWseT4hChVSmHeYKkCwUZlSUgO+GRAvnWRfZ14GnszrQvo4aQgdg88wXjfyWENfayT0FKzNuQuC7Rezs1KLBUwESeeDpwhDRIAm0g99rTHqy/o4Xszq8uBRnsZ4U8ODaFbDQGcz00ejw+W0gfydTCXOIq29ft9FQvfZ7KQHFCb7CTWA2hdeZwNoSLBRaGTHubBq4u/R/A8c5yVs2GmQwQLJ2srlKiSZCA9TeLkokKLzcY8Cd2yQlkvDhIbeBHgZDqhSvavxNPHeX1pZgEBzepE+eJrXGM8epX1teAzEGVwHcm9XWt1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4PgzljUArgJgU55XWsu8ePzKLyCFs1iTl9ZLQz04O9Y=;
 b=oRbfl8/+Hj6/C+T5AZ+OneJGf/g7CFWGRVMjS36ztSEJ2QtNfLwQ96iES5mXCJDAzljcOoWDQI7+jB6rM0fHBpzoQZXgnylmGxmUUPqn8uDQ+CIDvwT2mkg7jIs1K/n4nGACF06k8bxVVmEvPm/ZNqAPd4TFYzb0vM2ufVuns03KLEyvrVeHl5fyJ77VM5H8vonoi2M+CQUSfd9K3OkJFvyhCTd6opg1IoN/z5d+4MfL6zSDLTFSFLl1Y2j7D70/Uo4ZnnkLIJtl1eueDBP74blmTj4Gw0QQWP889TBpJyYtYo+GPIQU6rw+vqRhDjKnPAbAqNOT8DZv1TYTY+3I4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4PgzljUArgJgU55XWsu8ePzKLyCFs1iTl9ZLQz04O9Y=;
 b=FFuXu0pnuUTAJxDLpOkHVQyqEy6y+cTdoEHgJr73dO+bpIMkuPD9IUDYvSh3dLtjCNc1nD/gfkftV4Bwli0/jY8xIuQ3d2aW2BsMcucNjgaAc8sUiKvDagi703KA66KvmhclmoJ5PyovaRIvGBqDNJ7Juvk2wvxH+hO/sDnnPCk=
Received: from SN1PR12CA0065.namprd12.prod.outlook.com (2603:10b6:802:20::36)
 by IA0PR12MB8255.namprd12.prod.outlook.com (2603:10b6:208:404::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 03:13:22 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:802:20:cafe::6b) by SN1PR12CA0065.outlook.office365.com
 (2603:10b6:802:20::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.26 via Frontend
 Transport; Fri, 27 Sep 2024 03:13:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Fri, 27 Sep 2024 03:13:21 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 22:12:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 26 Sep
 2024 22:12:06 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 26 Sep 2024 22:11:59 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v2] lib/amdgpu: fix sdma linear copy command
Date: Fri, 27 Sep 2024 11:11:53 +0800
Message-ID: <20240927031153.3725899-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|IA0PR12MB8255:EE_
X-MS-Office365-Filtering-Correlation-Id: abeca527-0972-448c-e7a3-08dcdea257db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PEGxHnymc9rAklT5WNmfCxQXLrt/aAlN4agsrz8KQrFkmxTeF/6toi6m4Gku?=
 =?us-ascii?Q?S9jVzgGgYzLqmxb00BDFxHqZ9tjO7IVIdoIRbFnhFx9gEcnlcI4DN8Vlf9mx?=
 =?us-ascii?Q?ZWfWsheR5GymexwAIiqK78kMMkgmNGjOrDpGTcES+kdky0s8f7bhWkgBKXsS?=
 =?us-ascii?Q?pffX9ztwPEryKeblet2qIL8yj3g3+JfeV5F7/0+s2se2zJ5otZm5RtmC2qnw?=
 =?us-ascii?Q?+Zt0RsI9zzRnK5De/j0FP2WLfGtptD3VDLLhQNBb06IBzoBQRXeyPlqQll7t?=
 =?us-ascii?Q?jAw1xFXtnkae2V4cH8WdPwIqjEJ++UqURH2eI6/GRBDXGjx5CMVeDmSmOFAD?=
 =?us-ascii?Q?EfASqeM3pTaVNLb7jdoRwLH8TtH+JmLcioUB+ZaieH3kzw//DOK5JLMvs6dg?=
 =?us-ascii?Q?7pIiUz5vJjwCSslTkaqQditVl53sCJuVh5BcTRpQ6tVpqLN4R8aWnCpVq/az?=
 =?us-ascii?Q?kR/SFxu1woo0mUaKbHqa782mk6RYYmKCWsA3HikYfLEZUO3lIQULNV+YIzfo?=
 =?us-ascii?Q?1P+qGa5tFIoSfkCvg/VOfWYZ/uUth8GAlaM0Ez98oky/SnlfYazIb8Pflu/4?=
 =?us-ascii?Q?yKMv7krb3qPhorJtofjTGSP6DhbryJ4A+GCr6LdSRer2Aiq1xM2hrxUCcQle?=
 =?us-ascii?Q?yhjKWbys/w2CFuOgghDPhFau3OsxntUvhjmg2BWJlbw7rKdc9HXJXsAFgAx+?=
 =?us-ascii?Q?2sUTvDl7aD7SwUsTMjKPdXpBgSDlIOM9D3UvlnkuCLL2H3OsjYmM/CL78UZp?=
 =?us-ascii?Q?Z2za1FW/dcliIumuzgkKS4ewQTl+PvdFe+JdWBVuRH9A1cHJuna642EESe6X?=
 =?us-ascii?Q?RVfLSwlfAXgHz+kpa/UYiO1iJS2Z2sftZJWI2TiI9dngYltH/n75vkRwtQmV?=
 =?us-ascii?Q?0S0hHZhJnRWASH4R9447M/WSdsLpUAQpQXxpWCHdmcbDpp5ILdmQPXC3W0Vl?=
 =?us-ascii?Q?E70FG1aAW6MjqEF2JO7vHLVQyhp54iO8I4lggy9g5+9bBbRZZx28bZaTH5w9?=
 =?us-ascii?Q?urKRUXA5WctXMclAvRk3qOiK+vZ00pAlUdwJOa2nXIbbrKX0ARzs0ZSakRMC?=
 =?us-ascii?Q?m1TgzUu98ZdvY7xSy/YmUohHPXG77lKp44DZpam7yfpBFT7hj+KtIfeeICoo?=
 =?us-ascii?Q?zxnUXclkpDlYeWs8v5MZ9nzBqOqMobv3ffr9XkjqzVrxbcEHZkwjlZpzT0Jb?=
 =?us-ascii?Q?FEQhUWvUppoclOyRmBvBSSJ/OtDda7yvmm+z9UNmOVI+tqRQV3hKXYdJmFor?=
 =?us-ascii?Q?/edDJTX9JRbAaAkZED3TfAP1JmTLTrQFBQz/blhsT+JO2iddP4uzMEXTFbhY?=
 =?us-ascii?Q?g5dV/zX23ktei1gWoISJ73+HOvl/xJmLxI0a6H3yb+PXepihhyT3fXJgRO8B?=
 =?us-ascii?Q?jw2Xjtz0PH2tykzQNmWEZkfr2D92GyjexL38tKCmYA2C1mtVyySsaqbqgXsk?=
 =?us-ascii?Q?wv+Oqh3FBwguyElaGcudw52zy3Rlyg5y?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 03:13:21.8928 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: abeca527-0972-448c-e7a3-08dcdea257db
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8255
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

Fix page fault when using sdma linear copy:
[ 4606.313448] amdgpu 0000:1a:00.0: amdgpu: [mmhub0] no-retry page fault (src_id:0 ring:24 vmid:1 pasid:32772)
[ 4606.313463] amdgpu 0000:1a:00.0: amdgpu:  for process amd_deadlock pid 4440 thread amd_deadlock pid 4440)
[ 4606.313475] amdgpu 0000:1a:00.0: amdgpu:   in page starting at address 0x0000000000001000 from IH client 0x12 (VMC)
[ 4606.313490] amdgpu 0000:1a:00.0: amdgpu: VM_L2_PROTECTION_FAULT_STATUS:0x00120231
[ 4606.313501] amdgpu 0000:1a:00.0: amdgpu:      Faulty UTCL2 client ID: SDMA1 (0x101)
[ 4606.313511] amdgpu 0000:1a:00.0: amdgpu:      MORE_FAULTS: 0x1
[ 4606.313519] amdgpu 0000:1a:00.0: amdgpu:      WALKER_ERROR: 0x0
[ 4606.313527] amdgpu 0000:1a:00.0: amdgpu:      PERMISSION_FAULTS: 0x3
[ 4606.313535] amdgpu 0000:1a:00.0: amdgpu:      MAPPING_ERROR: 0x0
[ 4606.313543] amdgpu 0000:1a:00.0: amdgpu:      RW: 0x0

For old AI asics, the sdma copy count is shorter than newer ones.
So add count check in case the max range is exceeded.

V2: Minor bug fixes.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 3f8f28483..f360b5bd4 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -189,10 +189,17 @@ sdma_ring_copy_linear(const struct amdgpu_ip_funcs *func,
 		context->pm4[i++] = SDMA_PACKET(SDMA_OPCODE_COPY,
 				       SDMA_COPY_SUB_OPCODE_LINEAR,
 					context->secure ? 0x4 : 0);
-		if (func->family_id >= AMDGPU_FAMILY_AI)
-			context->pm4[i++] = context->write_length - 1;
-		else
+		if (func->family_id >= AMDGPU_FAMILY_AI) {
+			/* For FAMILY AI, the maximum copy range supported by sdma is 4MB */
+			if (func->family_id == AMDGPU_FAMILY_AI && context->write_length > 0x3fffff) {
+				context->pm4[i++] = 0x3fffff;
+				igt_warn("sdma copy count exceeds the maximum limit of 4MB\n");
+			} else {
+				context->pm4[i++] = context->write_length - 1;
+			}
+		} else {
 			context->pm4[i++] = context->write_length;
+		}
 		context->pm4[i++] = 0;
 		context->pm4[i++] = lower_32_bits(context->bo_mc);
 		context->pm4[i++] = upper_32_bits(context->bo_mc);
-- 
2.25.1

