Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30CCCD98C7
	for <igt-dev@archiver.kernel.org>; Thu, 11 Jun 2026 08:20:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AF1D10ED7D;
	Thu, 11 Jun 2026 08:20:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LuI7y/un";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011014.outbound.protection.outlook.com [52.101.57.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D06510ED7D
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Jun 2026 08:20:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmW9RH4zaHfPYJH7SWCtzxtUGfskjrcyoteYqVnLTkPymIwBkLxrcJQNH6/2VnIP5Eb4pBUTdTFflA1Boc2Wzjro9i/7vo6/1Mni43QzSKS+hkJ73sSgDvETDVyiL6RhlFRU/SWHMhXryoJ853618aLsNr3oDBO/r84dvAcgRDk246pI6RhyDG+PSVfVh7xwQqHtpyLwzb71rdqMptSp8W9HNUZHRwKS7Sic2fzg+bpNZELAXm3vyuc7ga08ydRkwKzcNSIepub6zucd0x727MhVBqbhdgOQrCnrSaLD9s5AAkDZJ039+dImfhmXJLTLghB4qH35nYSimDMKa9MuXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wH2xCIfNqTC3680cveRN13cN+9gSv9zO/LaASpLL/I=;
 b=qo2n1AVfIl1KMHVpS4eJTqltc2+cR80PssUjVkfTjT1VJ8mUBeQiN5pA/SYAoCNn3HJ5M/fb5SNgM6JyCrukrcpISnBOSMppIaFOpcwwfYpLamT5bNw2/QB2tiYObVHslE6jBuz46JVcKftIhSnkwJljNXYwrTjLMAKky3Yahkoe0taaHT302RypmPSiQfQxV9EvShhgrDw4sHkCO3tj4smiFPelqFFupuXYjxuR6ZXfvFfNoBJToFqE4UgHpDE4bPOhId4FrrceuulM0+NHJD2qkOktuwfH6KcXKuR8VMjU92GisVtVOoRcQpzf4eKyJv9dSV9Yka2KGL/NUOuSjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wH2xCIfNqTC3680cveRN13cN+9gSv9zO/LaASpLL/I=;
 b=LuI7y/unCibExnEJxmm3ungGb8PfFav0MT6/Juw2ocBK7kVWDQ+JFrHgVyQpUgsCVHKNTO6YbCUgQ6E4+u8VLwUfwA7STRfcWpD8jRYIzdTYvqTj5WaPiy65+xcpZO/JNQv55lkW4Zu2w6GYgdw1ntr4nkJMAaJQZxeGBaBG9Rk=
Received: from DM6PR06CA0076.namprd06.prod.outlook.com (2603:10b6:5:336::9) by
 DM4PR12MB6038.namprd12.prod.outlook.com (2603:10b6:8:ab::12) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.13; Thu, 11 Jun 2026 08:20:25 +0000
Received: from CY4PEPF0000E9D6.namprd05.prod.outlook.com
 (2603:10b6:5:336:cafe::4b) by DM6PR06CA0076.outlook.office365.com
 (2603:10b6:5:336::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.13 via Frontend Transport; Thu,
 11 Jun 2026 08:20:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CY4PEPF0000E9D6.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Thu, 11 Jun 2026 08:20:25 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 03:20:24 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 11 Jun
 2026 03:20:24 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 11 Jun 2026 03:20:17 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: accept GUILTY_RESET from compute/gfx hang slow
 test
Date: Thu, 11 Jun 2026 16:19:52 +0800
Message-ID: <20260611082017.937760-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D6:EE_|DM4PR12MB6038:EE_
X-MS-Office365-Filtering-Correlation-Id: 687ae17f-1e30-4352-bbfa-08dec79249d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|36860700016|82310400026|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: aPiLGmsGbVKGy4mUWsnb01FKqWqX86sA5Tm0tg3cH7XjIzX80x3MG8HCHrhPya66Rm0tfGC1yvH8L+3YeEZthlfSwxHpRSWHsUYV1/Ne2MueQfbH4ZkXa7kww0u3vwV2yo7GujFiYjul4og3b18ILdEQcSrj7sFIrYo/X5Jc+K3HtUJ/z1uf5Oq1fqeWk/GZy+8/FHdkFmUO4zDfSKhZ7G24KsUgBDT/K957crP04gQ7flTOafumVf37Fk+XqTnmP34z56bbCqd+EIL3If+HXjAa1OR7eoHfWAx3LGF6ahxwrgpsgMoxXx0lAemEJQxlUzkBW46hjTgNcXnyWyPB3b0Ddw/on6TsElpDKj/l40tq7S34NlzWe947TEPt67eUMFJUEvTOb3e7xa+F11QMS2uLiHpdcBRkZv3AGMOTKcyc4ryAoKksUyIt9UZTcrKNh8c3v4qJkPqaaNt+HaJSmNx16vE99vdD0Bq3FcQgpo210dKQXdMs4wKMjm1PJyXkfRq1WdCfygJOZAmuFT+Il/2UtdjMsMYvtMtpVqIUugvLB2+TRa5NLe8hy5F6IDbUslYPkrtrMx4daaeW/sdTo6ZNuZ/lcM2XerqGRHfCKO7XXT+jbsy6q+DIFNoSsXy41BX1fhjl9XGuE1QmFE7UL15CSru5SQ65sBUrAExePIQxWRkczqQ4qQtWP7fuQ9L3InTGjFG8KNw+we13l5+J8om6Jy7rnx+fEbxkMP2M4LM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(36860700016)(82310400026)(1800799024)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 21d9Pxli1CrrDO9W0pHpwoo7Y0pT6zvCj9HRDNOXne8Hc85jx64IvWOXTwMkxgiSKuEySwsNBE97ZSqI4dWaDx714KdiZnYuxLBND2izDhUnwile8wF5Zsj9AOJFKq74fvtBuBURLMSM6taDM4x4EL+LwczzJ/hCw6m2bra36B8APSEdv7hwN9uS464CZwZH5+iWgsXXxt+Bh1xBFq5tSWRU9VZTTPsN9+h1EPwm9OYsJmO+t/euHCcX5Nvf8okeGJ7zGdqu7Wr5IXI1duU7wOhPRsWzAlzGN2xOMuhMP0RhKqnxgaSgqgpakQpsNkfzHsU0ULU4TiSDGeykER1biRP+81alex8875QJGB4BCNxJSk3458aJoTMoqr9GEMkTd3UughyyzZpm9ImYVPQ+ZE9co4Emrz+hiC0kR2njslNQtsvaW0qq/r312fI+t7IM
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 08:20:25.0150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 687ae17f-1e30-4352-bbfa-08dec79249d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6038
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

amdgpu_memcpy_dispatch_hang_slow_test() submits a hanging dispatch from
its own context and checks the context reset status via QUERY_STATE.

Newer kernels identify the guilty context and return
AMDGPU_CTX_GUILTY_RESET; older kernels that don't distinguish
guilty/innocent return AMDGPU_CTX_UNKNOWN_RESET. Expect GUILTY_RESET
but also accept UNKNOWN_RESET so the test passes on both.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 lib/amdgpu/compute_utils/amd_dispatch.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/lib/amdgpu/compute_utils/amd_dispatch.c b/lib/amdgpu/compute_utils/amd_dispatch.c
index 138222cde..43ac24959 100644
--- a/lib/amdgpu/compute_utils/amd_dispatch.c
+++ b/lib/amdgpu/compute_utils/amd_dispatch.c
@@ -679,11 +679,16 @@ amdgpu_memcpy_dispatch_hang_slow_test(amdgpu_device_handle device_handle,
 
 		if (!(reset_flags == 0 ||
 			  reset_flags & AMDGPU_CTX_QUERY2_FLAGS_RESET_IN_PROGRESS)) {
-			/* If we're in reset and reset hasn't occurred, then check
-			 * that the hang state is equal to the GPU reset status and
-			 * assert otherwise.
+			/*
+			 * If we're in reset and reset hasn't occurred, check that
+			 * the hung context is reported as reset. Newer kernels
+			 * identify the guilty context and return the expected
+			 * status (AMDGPU_CTX_GUILTY_RESET); older kernels that
+			 * don't distinguish guilty/innocent return
+			 * AMDGPU_CTX_UNKNOWN_RESET. Accept either.
 			 */
-			igt_assert_eq(hang_state, gpu_reset_status_equel);
+			igt_assert(hang_state == gpu_reset_status_equel ||
+				   hang_state == AMDGPU_CTX_UNKNOWN_RESET);
 		}
 
 		r = amdgpu_bo_list_destroy(bo_list);
@@ -769,8 +774,13 @@ amdgpu_dispatch_hang_slow_helper(amdgpu_device_handle device_handle,
 		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type,
 					    ring_id, prio, version,
 						BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
+		/*
+		 * The context that submitted the hanging dispatch owns the
+		 * guilty job, so newer kernels report GUILTY_RESET. Older
+		 * kernels return UNKNOWN_RESET, which the test also accepts.
+		 */
 		amdgpu_memcpy_dispatch_hang_slow_test(device_handle, ip_type,
-						      prio, version, AMDGPU_CTX_UNKNOWN_RESET, userq);
+						      prio, version, AMDGPU_CTX_GUILTY_RESET, userq);
 
 		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
 					    version, BACKEND_SE_GC_SHADER_EXEC_SUCCESS, NULL, userq);
-- 
2.49.0

