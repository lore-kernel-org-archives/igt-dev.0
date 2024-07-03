Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760B5C30658
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jul 2024 03:09:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25C4B10E0DF;
	Wed,  3 Jul 2024 03:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lH9mGYaY";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D538610E0DF
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jul 2024 03:09:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NjIayFakS8+QIZcMTrK+wYI/eKmG5vZUjkshGH/2YTh8gbSeKRuFAQzwcriYfWrtTdmrmnaz1gSpj9R6rRyT/IlRyCqUX+HfKGvoZMBWYzYn3f9DhrFkdSYgxLC0+mEwrPzpbv00inkx9irp/4lanmJ4SyUFDF44voSON25zOyQEHY6TycVxgRQ3Yf8eZM9b1LTVSr5u9UkqmyrY8JoLiezFoIjYpd7ft7oWB6fl2Wczf1nXRWUaAunRVoubhZxZJhySAcVxBj+eG/BmJOpuLm9FPp2J8W0+LJCqrVgrtxAFWZLvMFrDJOXGRg1YuBbyanl9ToTAqixlfwNQ3feK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YtbaG9uEvJ+nhg0303S0OykrSE8ZnkcIPc0nu+t9Ano=;
 b=j2U6JtEaVtdw2paOiL3ejdC/Jku0kFADbx9AhVPwpNC43BXDxITtzj6RzYvSnQB9/OoZqD3K2VOFVu2Xzx7TBFGFXxM53aoUT7LRnhLgdvvd+D+l+woRhttBIsrz2r7QLJ9l5QjVyUTzjj3Sdwz6RecpEfXEVZmlawC1EHyJ1UKvU3W30c/D/hoR0q9BX82p80pzlxMDnA30OVXFIlAjq5V1lEPb2IgGylU0Z+cq6G2kY976VxOVjsxnID1fjd2es92htyY0wq+iri9dBaCFb2oVydfiIzR/CuOYoeKAeATNLwJwSmACQxF9ftef0JDuuHuDSPvCyLzD+6/ONSoRhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YtbaG9uEvJ+nhg0303S0OykrSE8ZnkcIPc0nu+t9Ano=;
 b=lH9mGYaY/I3pwQAmhRUpbKATAdl99bMvEXiZlky5b3K6sa7cFPJ2zmdP0O0BIMumeNclmmn/bSZles/2fv4ykX1b7FAmPGYNRg9mPjWTublgDGLjbeIXyIPrTGz3zrgvTHiIA8IGzfLuH3G42Ga9f2NnonIcDewJ+xwyQICh80I=
Received: from MW4P221CA0022.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::27)
 by DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:138::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 03:09:40 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:303:8b:cafe::4e) by MW4P221CA0022.outlook.office365.com
 (2603:10b6:303:8b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25 via Frontend
 Transport; Wed, 3 Jul 2024 03:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.1 via Frontend Transport; Wed, 3 Jul 2024 03:09:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 2 Jul
 2024 22:09:39 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 2 Jul 2024 22:09:32 -0500
From: Jesse Zhang <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>,
 "Jiadong Zhu" <Jiadong.Zhu@amd.com>
Subject: [PATCH i-g-t v2] tests/amdgpu: add amd dispatch subtest
Date: Wed, 3 Jul 2024 11:09:31 +0800
Message-ID: <20240703030931.925386-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|DS0PR12MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c238116-a162-47d0-3a81-08dc9b0d9437
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p80Joojn6Xn35ax2HX0nOA04zLmodWiq5aRkIWMDBo/zdc7Bp3/VlvPt6LkW?=
 =?us-ascii?Q?YkincolBArHoBlkorTKVthSSN85w1Ulw9jx7NrlZYQG4nzLVIg9QPHg9Hi6n?=
 =?us-ascii?Q?NC1MdKcOrCJLLWJIGBGfj9dbTaCegexu8Sd8AAvxxy90DS9r7bbVTmQP2qQw?=
 =?us-ascii?Q?BpZCgzrdZ2+vEMJgFx/PibODdGclkjYgnghGU/qy7yPkFo9jtyJv1EMFVSRE?=
 =?us-ascii?Q?i6FMBWy6Z2OCehh3gCJvicXskS8+nFVoBiD7mo1R3fwM8lyAzvqSHZb87gu7?=
 =?us-ascii?Q?0/qcVOGRwwTBnEiulEXmxJVQvkjR4LrC73RKrOQIeJ8SedmvdKooZUeAj9EQ?=
 =?us-ascii?Q?gyClX5AYiddL5/QTT4u/EtOzM10/svtguUZjM1jdoiBzIgRxToFfCjNoax6Z?=
 =?us-ascii?Q?Kd6p0T3Qc/OTcIJyFjN1xTsncyA+zb15DnRvu4Wpb2R3eyLH9F8AadvUSXj3?=
 =?us-ascii?Q?e9mSDQ89Bchm8FEbeLKHJvgAaC3zOq0jF/gvnIiG1QscWayG8Nqh3K0YvVtf?=
 =?us-ascii?Q?uVh+pPoCcOfbHsD06PSds86bn6KLogqfqAymqVc6edlkTTmhR/dpRUymeGoy?=
 =?us-ascii?Q?oWJ9td2QEJ1KSEk38+SVXIU2NVBxDE2J8qDVsh5vg+BOQK5FoY/AuSL9Of2c?=
 =?us-ascii?Q?1y11XtxF0So2dmNCnCCcbCUVwEt3QByAic5hK4OCJq7RQ+k0B6LnqKR0hWDv?=
 =?us-ascii?Q?yqEbk2buIcCoQvWIAClOx0lkg0XhzevzCE6AE55JSOZRwvNfRc6InX2p9tDN?=
 =?us-ascii?Q?vcP0rdr+CEKO5ZpVrfyru4Bv7QD62JXwz5huJJDrwUDbhoEEbqG/iGhO+52O?=
 =?us-ascii?Q?jXeT2VhZZQ2aiok+I+b3zqbZoO4yX3OppkI907JnFyk92Xo1sMIy8CNsFlY8?=
 =?us-ascii?Q?izM2MT1DKN5fM1dIC9NfXD0wERsujPXmIcqeVqDpQf9/7DLUPFLabSylkae3?=
 =?us-ascii?Q?f0nWT+smRsWQNOSQg+LbJpVJJb/edv5n1XIXBcewmFCyhxE4c8JJoe12fQkr?=
 =?us-ascii?Q?6qan5rAjPETTomKi/l0vdFHcsnbyEWTiw5lUK+jlgJ54nDrm+TMT9yQzM3HH?=
 =?us-ascii?Q?3CcPQUTUa3KRYgNi9deGpb+Vq7VmhKn5wb4c01WdbBPiqmIMwPd5GFhe/dML?=
 =?us-ascii?Q?rNFCVEP8sZxf7u0PZx/KXQGrih0rkVWZ7FmJIv8tLMS4N8KgcTczpN7bMnNl?=
 =?us-ascii?Q?QGEUR5HeBbznp/Yi6S+ppIpC24+06qhxHbx0+dI4jeSMlHMLHvlcBxlx51Cj?=
 =?us-ascii?Q?hv+4/Wo/bN8KvaQpU0KbsSjk0u/Rb9fZ3PNWBCJlVVEvDeO3HKOUwS/uDbTs?=
 =?us-ascii?Q?I8WM3rJIGBD0wJZrbEEB+Sf5tc329gPflWOY/yp5sL2SHc1JZ+H0JEq3Xg3z?=
 =?us-ascii?Q?gOw4iYOmAmxW9G/td5lzEeIN7mnxrSzVCZNJguu/wL8DdRwdWeWSxLEeGhM5?=
 =?us-ascii?Q?e3tsmYvKxz1rnlS/B8aQr7awpXuVbTim?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 03:09:40.1576 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c238116-a162-47d0-3a81-08dc9b0d9437
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704
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

Add more cases to trigger gpu reset.
1. Using invalid user data to trigger a gpu reset.
2. Use invalid shadow program address to trigger gpu reset.
3. Use invalid shader settings to trigger a gpu reset.

V2: Rename cases and map them for easier maintenance.(Vitaly)

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Jiadong Zhu <Jiadong.Zhu@amd.com>
---
 lib/amdgpu/amd_dispatch.c         | 35 +++++++++++++++++----------
 lib/amdgpu/amd_dispatch.h         |  5 ++--
 lib/amdgpu/amd_dispatch_helpers.c | 39 ++++++++++++++++++++++++-------
 lib/amdgpu/amd_dispatch_helpers.h |  9 ++++++-
 tests/amdgpu/amd_dispatch.c       | 31 +++++++++++++++++++++---
 5 files changed, 93 insertions(+), 26 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index df7d56ea7..12ef7874c 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -70,7 +70,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 	amdgpu_dispatch_write_cumask(base_cmd, version);
 
 	/* Writes shader state to HW */
-	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
+	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version, 0);
 
 	/* Write constant data */
 	/* Writes the UAV constant data to the SGPRs. */
@@ -162,7 +162,7 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 void
 amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 			    uint32_t ip_type, uint32_t ring, uint32_t version,
-			    int hang)
+			    enum shader_error_type hang)
 {
 	amdgpu_context_handle context_handle;
 	amdgpu_bo_handle bo_src, bo_dst, bo_shader, bo_cmd, resources[4];
@@ -202,7 +202,7 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	igt_assert_eq(r, 0);
 	memset(ptr_shader, 0, bo_shader_size);
 
-	cs_type = hang ? CS_HANG : CS_BUFFERCOPY;
+	cs_type = hang == BACKEND_SE_GC_SHADER_INVALID_SHADER ? CS_HANG : CS_BUFFERCOPY;
 	r = amdgpu_dispatch_load_cs_shader(ptr_shader, cs_type, version);
 	igt_assert_eq(r, 0);
 
@@ -217,22 +217,28 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					&bo_dst, (void **)&ptr_dst,
 					&mc_address_dst, &va_dst);
 	igt_assert_eq(r, 0);
-
 	///TODO helper function for this bloc
 	amdgpu_dispatch_init(ip_type, base_cmd,  version);
 	/*  Issue commands to set cu mask used in current dispatch */
 	amdgpu_dispatch_write_cumask(base_cmd, version);
+
+	if (hang == BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR)
+		mc_address_shader = 0;
 	/* Writes shader state to HW */
-	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
+	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version, hang);
 	memset(ptr_src, 0x55, bo_dst_size);
 
 	/* Write constant data */
 	/* Writes the texture resource constants data to the SGPRs */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
 	base_cmd->emit(base_cmd, 0x240);
-	base_cmd->emit(base_cmd, mc_address_src);
-
-	base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
+	if (hang == BACKEND_SE_GC_SHADER_INVALID_USER_DATA) {
+		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, 0);
+	} else {
+		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
+	}
 
 	base_cmd->emit(base_cmd, 0x400);
 	if (version == 9)
@@ -247,8 +253,13 @@ amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 	/* Writes the UAV constant data to the SGPRs. */
 	base_cmd->emit(base_cmd, PACKET3_COMPUTE(PKT3_SET_SH_REG, 4));
 	base_cmd->emit(base_cmd, 0x244);
-	base_cmd->emit(base_cmd, mc_address_dst);
-	base_cmd->emit(base_cmd, (mc_address_dst >> 32) | 0x100000);
+	if (hang == BACKEND_SE_GC_SHADER_INVALID_USER_DATA) {
+		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, 0);
+	} else {
+		base_cmd->emit(base_cmd, mc_address_src);
+		base_cmd->emit(base_cmd, (mc_address_src >> 32) | 0x100000);
+	}
 	base_cmd->emit(base_cmd, 0x400);
 	if (version == 9)
 		base_cmd->emit(base_cmd, 0x74fac);
@@ -401,7 +412,7 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 	amdgpu_dispatch_write_cumask(base_cmd, version);
 
 	/* Writes shader state to HW */
-	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version);
+	amdgpu_dispatch_write2hw(base_cmd, mc_address_shader, version, 0);
 
 	/* Write constant data */
 	/* Writes the texture resource constants data to the SGPRs */
@@ -536,7 +547,7 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 	}
 }
 
-void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, int hang)
+void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_type, enum shader_error_type hang)
 {
 	int r;
 	struct drm_amdgpu_info_hw_ip info;
diff --git a/lib/amdgpu/amd_dispatch.h b/lib/amdgpu/amd_dispatch.h
index 4df8b1355..5f05ee693 100644
--- a/lib/amdgpu/amd_dispatch.h
+++ b/lib/amdgpu/amd_dispatch.h
@@ -25,15 +25,16 @@
 #define AMD_DISPATCH_H
 
 #include <amdgpu.h>
+#include "amd_dispatch_helpers.h"
 
 void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle,
-			      uint32_t ip_type, int hang);
+			      uint32_t ip_type, enum shader_error_type hang);
 
 void amdgpu_memcpy_dispatch_test(amdgpu_device_handle device_handle,
 					uint32_t ip_type,
 					uint32_t ring,
 					uint32_t version,
-					int hang);
+					enum shader_error_type hang);
 
 void amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 				      uint32_t ip_type);
diff --git a/lib/amdgpu/amd_dispatch_helpers.c b/lib/amdgpu/amd_dispatch_helpers.c
index b0a5f550e..6b2e8f39f 100644
--- a/lib/amdgpu/amd_dispatch_helpers.c
+++ b/lib/amdgpu/amd_dispatch_helpers.c
@@ -114,7 +114,7 @@ int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base * base, uint32_t version
  }
 
 
-int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr, uint32_t version)
+int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr, uint32_t version, enum shader_error_type hang)
 {
 	static const uint32_t bufferclear_cs_shader_registers_gfx9[][2] = {
 		{0x2e12, 0x000C0041},	//{ mmCOMPUTE_PGM_RSRC1,	0x000C0041 },
@@ -123,6 +123,7 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 		{0x2e08, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Y,	0x00000001 },
 		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z,	0x00000001 }
 	};
+
 	static uint32_t bufferclear_cs_shader_registers_gfx11[][2] = {
 		{0x2e12, 0x600C0041},	//{ mmCOMPUTE_PGM_RSRC1,	  0x600C0041 },
 		{0x2e13, 0x00000090},	//{ mmCOMPUTE_PGM_RSRC2,	  0x00000090 },
@@ -131,6 +132,14 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z, 0x00000001 }
 	};
 
+	static uint32_t bufferclear_cs_shader_invalid_registers[][2] = {
+		{0x2e12, 0xffffffff},	//{ mmCOMPUTE_PGM_RSRC1,	  0x600C0041 },
+		{0x2e13, 0xffffffff},	//{ mmCOMPUTE_PGM_RSRC2,	  0x00000090 },
+		{0x2e07, 0x00000040},	//{ mmCOMPUTE_NUM_THREAD_X, 0x00000040 },
+		{0x2e08, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Y, 0x00000001 },
+		{0x2e09, 0x00000001},	//{ mmCOMPUTE_NUM_THREAD_Z, 0x00000001 }
+	};
+
 	static const uint32_t bufferclear_cs_shader_registers_num_gfx9 = ARRAY_SIZE(bufferclear_cs_shader_registers_gfx9);
 	static const uint32_t bufferclear_cs_shader_registers_num_gfx11 = ARRAY_SIZE(bufferclear_cs_shader_registers_gfx11);
 	int offset_prev = base->cdw;
@@ -146,19 +155,33 @@ int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base * base, uint64_t shader_addr
 	if ((version == 11) || (version == 12)) {
 		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx11; j++) {
 			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
-			/* - Gfx11ShRegBase */
-			base->emit(base,bufferclear_cs_shader_registers_gfx11[j][0] - 0x2c00);
-			if (bufferclear_cs_shader_registers_gfx11[j][0] ==0x2E12)
-				bufferclear_cs_shader_registers_gfx11[j][1] &= ~(1<<29);
+			if (hang == BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING) {
+				/* - Gfx11ShRegBase */
+				base->emit(base,bufferclear_cs_shader_invalid_registers[j][0] - 0x2c00);
+				if (bufferclear_cs_shader_invalid_registers[j][0] ==0x2E12)
+					bufferclear_cs_shader_invalid_registers[j][1] &= ~(1<<29);
+
+				base->emit(base,bufferclear_cs_shader_invalid_registers[j][1]);
+			} else {
+				/* - Gfx11ShRegBase */
+				base->emit(base,bufferclear_cs_shader_registers_gfx11[j][0] - 0x2c00);
+				if (bufferclear_cs_shader_registers_gfx11[j][0] ==0x2E12)
+					bufferclear_cs_shader_registers_gfx11[j][1] &= ~(1<<29);
 
-			base->emit(base,bufferclear_cs_shader_registers_gfx11[j][1]);
+				base->emit(base,bufferclear_cs_shader_registers_gfx11[j][1]);
+			}
 		}
 	} else {
 		for (j = 0; j < bufferclear_cs_shader_registers_num_gfx9; j++) {
 			base->emit(base, PACKET3_COMPUTE(PKT3_SET_SH_REG, 1));
 			/* - Gfx9ShRegBase */
-			base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
-			base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
+			if (hang == BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING) {
+				base->emit(base, bufferclear_cs_shader_invalid_registers[j][0] - 0x2c00);
+				base->emit(base, bufferclear_cs_shader_invalid_registers[j][1]);
+			} else {
+				base->emit(base,bufferclear_cs_shader_registers_gfx9[j][0] - 0x2c00);
+				base->emit(base,bufferclear_cs_shader_registers_gfx9[j][1]);
+			}
 		}
 	}
 	if (version == 10) {
diff --git a/lib/amdgpu/amd_dispatch_helpers.h b/lib/amdgpu/amd_dispatch_helpers.h
index a129e8e07..7ae88cd78 100644
--- a/lib/amdgpu/amd_dispatch_helpers.h
+++ b/lib/amdgpu/amd_dispatch_helpers.h
@@ -25,6 +25,13 @@
 #define AMD_DISPATCH_HELPERS_H
 
 #include <amdgpu.h>
+enum  shader_error_type {
+	BACKEND_SE_GC_SHADER_EXECSUCESS,
+	BACKEND_SE_GC_SHADER_INVALID_SHADER,
+	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR,    /* COMPUTE_PGM */
+	BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING, /* COMPUTE_PGM_RSRC */
+	BACKEND_SE_GC_SHADER_INVALID_USER_DATA /* COMPUTE_USER_DATA */
+};
 
 struct amdgpu_cmd_base;
 
@@ -32,6 +39,6 @@ int amdgpu_dispatch_init( uint32_t ip_type,struct amdgpu_cmd_base *base_cmd, uin
 
 int amdgpu_dispatch_write_cumask(struct amdgpu_cmd_base *base_cmd, uint32_t version);
 
-int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version);
+int amdgpu_dispatch_write2hw(struct amdgpu_cmd_base *base_cmd, uint64_t shader_addr, uint32_t version, enum shader_error_type);
 
 #endif
diff --git a/tests/amdgpu/amd_dispatch.c b/tests/amdgpu/amd_dispatch.c
index 323284306..00564903f 100644
--- a/tests/amdgpu/amd_dispatch.c
+++ b/tests/amdgpu/amd_dispatch.c
@@ -10,6 +10,7 @@
 #include <sys/sysmacros.h>
 #include "lib/amdgpu/amd_memory.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amd_dispatch_helpers.h"
 #include "lib/amdgpu/amd_dispatch.h"
 
 static void
@@ -31,9 +32,9 @@ amdgpu_dispatch_hang_gfx(amdgpu_device_handle device_handle)
 }
 
 static void
-amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle)
+amdgpu_dispatch_hang_compute(amdgpu_device_handle device_handle, enum shader_error_type error)
 {
-	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, 1);
+	amdgpu_gfx_dispatch_test(device_handle, AMDGPU_HW_IP_COMPUTE, error);
 }
 
 static void
@@ -125,7 +126,31 @@ igt_main
 	igt_subtest_with_dynamic("amdgpu-dispatch-hang-test-compute-with-IP-COMPUTE") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
 			igt_dynamic_f("amdgpu-dispatch-hang-test-compute")
-			amdgpu_dispatch_hang_compute(device);
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_SHADER);
+		}
+	}
+
+	igt_describe("Test GPU reset using a invalid shader program address to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-program-addr-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-invalid-program-addr-test-compute")
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_ADDR);
+		}
+	}
+
+	igt_describe("Test GPU reset using a invalid shader program setting to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-setting-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-invalid-setting-test-compute")
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_PROGRAM_SETTING);
+		}
+	}
+
+	igt_describe("Test GPU reset using a invalid shader user data to hang the job on compute ring");
+	igt_subtest_with_dynamic("amdgpu-dispatch-invalid-user-data-test-compute-with-IP-COMPUTE") {
+		if (arr_cap[AMD_IP_COMPUTE]) {
+			igt_dynamic_f("amdgpu-dispatch-invalid-user-data-test-compute")
+			amdgpu_dispatch_hang_compute(device, BACKEND_SE_GC_SHADER_INVALID_USER_DATA);
 		}
 	}
 
-- 
2.25.1

