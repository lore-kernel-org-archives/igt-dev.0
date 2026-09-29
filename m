Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD37CA5FA1
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 03:02:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F90A10EC69;
	Tue, 29 Sep 2026 03:02:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4WnQqHSB";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A67410EC69
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 03:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g7WwTu1b94qUzkJ4dC6Wz+l/um8PSENlhHuO9Uz9fOvKiKTWlvmkINgZWB6pEjwz1mq1V3qahpIjZjNxkrzr/tNCCxTBIXrDU1+sXEhJGSoV91B8MLfpSvMRIkicUz3tAyQG8sXz9bLkiFP+zC5ukedGYe4/mm3XwPycBFyJ05N14tsENGDTkDIHOLOH5y7kYf6TMh8OT5/8clbPKubLmXTBph8UESjuC4iNIi9Wm7Yq0A78WH0ZRyjeFA/z5MnNWpt7zsMwMOJM50d0giLN+uEqaq42f9O7yuchLFlhG7OHw6b2Edd+rLzkzg/ZqbGNHL76RUdC5QXMkoEUzjOgWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URLtpTqVsi+8aUsinEjQMR7yu/ASta6mCE9nId5p1FI=;
 b=yqvz1/oG4FCYhjyy8PnHeGPIyyOubrW8gCbTEl8vObq/fcX0QlLnJaTOtq7OnADChhBpAVA1SxhuzG8uwtbN0B+bdg1uRvBkKAUNh/lxwkhj0W3v4pehnlaFXI0MJZ6hxJi6o9el9he8kFT9QLjp3lycnLOEHOt5B94HLOTjQ1qPNWGAsEH5FanjVutnp4eDJvua/G5e3As+LSvZPnVkQoSYL+A23NLo1VVPEFK5ojqvGSfBaHAuRvm8uYOfHJ+8CK9D3St3iu4V9OkReW+wYs+i5AwaIYFyJwl1UbJeAphc0T1iYtiGJ0VxHEY/6PPcQBxgRUfdKf9LpzHogtuxAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URLtpTqVsi+8aUsinEjQMR7yu/ASta6mCE9nId5p1FI=;
 b=4WnQqHSBk/L5f45eR1Bv1LvrU6p+tRNDutqPg739gKd+C5zorVwpqqhlinrACN56hc+27tkhVyuUddY8bztvW8CnySR7EcdnFEJIHFgqL0Af/DdYFYxkNz7G2fW8g8bjdsEDe3EoAzHL51+GbhhSiwoU8d1C2E/upRujJc8chIU=
Received: from SJ0PR03CA0010.namprd03.prod.outlook.com (2603:10b6:a03:33a::15)
 by CY8PR12MB7098.namprd12.prod.outlook.com (2603:10b6:930:62::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Tue, 29 Sep
 2026 03:01:35 +0000
Received: from MWH0EPF000A672F.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::25) by SJ0PR03CA0010.outlook.office365.com
 (2603:10b6:a03:33a::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 03:01:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A672F.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 03:01:35 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 22:01:34 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 28 Sep
 2026 22:01:33 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Mon, 28 Sep 2026 22:01:32 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/2] tests/amdgpu: fix checkpatch errors in amd_fuzzing
Date: Tue, 29 Sep 2026 11:00:46 +0800
Message-ID: <20260929030131.3415475-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672F:EE_|CY8PR12MB7098:EE_
X-MS-Office365-Filtering-Correlation-Id: b18fcde6-901c-4548-e251-08df1dd5f8f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|82310400026|36860700016|11063799006|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: PF4zGfyojzKfN4xEAIQMf6iKLKPZAUZRdGeeYpd4CwEKiQF0bA+ul0ll5x9r2MlKmQAJjgD89HNV8kWGvu8S2Tlp68fxacmQ9BfW4CDFAP/vW0R7bRJsdQnQ5zgfn2GLbC1bAoPgte1Xl6SJRZlm48Gm53k6HNpXAOd+7Cl/QPoYABB+OsmhPlxGyY32FTd5+BRejCSChyBNuayGRDzx6rmfupse7LCprOkx2o7KxVyB3huHYWyckGSkSzezWqEGKjzfU7QyPh+UTcuK2XG3z2cCiAp5izEHnuXsTeUvuu+bqWrSwRrPVT8FeRjDZB5eoNfJtvyJlWjfIl7xtqX09MWugxekkSccLFs9S6oCExERCxWOcP0li9LjUIVN9cuthcWXm9H4gySWBYxUvg2LkTPAsK0fbH4O0LMP+gDzKT7Ui1hTLa9GIem/yqPg1Uxda4z3RY4x1zHDQ2Iq63cNwQln1fwZa4nD6gS9pmMzPzbGM5tUmTl7BQh4Gp9k6Gj8Kolq4jNrg5Hn3Eh7IH6VW9z5bvZCkEApAOJ9WJZz5YhH0qUzkDRgJ2aT04Jn/BhpNcf6JG3jGOTVccZxudFXRZczN0wwG3k8QDoua8A4kF5e3nOnHwWHYKrLKsKsy8BlWZtZ2NUJrhw8yB9as3bx8+ukR+prB00uT2HMAsO3MPZyM2ucu2RTfiCFxy66GcU6p8PaMieC9d5/ZJtYNP57ZQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(82310400026)(36860700016)(11063799006)(10067099003)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fvkKVBYRf3KCCz/P7vBGp0v7uK+L5lRs9Ortyafb/r8JnN0/I8oKoBbpoSXnLk3M9CQejJXENeQE8tfUzJCx+oCi6191ADNny3fHP80Yt5vwYrTlgPNJiOq+z0vP5dL6Dnb7TzQiFPaXY/wBU4c35ZtJCAuwvcPWJJysuMvBOJsm7KUpIJ9dFJDVFxY6HhiWq3vKKR9DprbCSot0jyNkHNZ+Em6Q3rOz4xc62zmqSgVjrcxzNhqA2UsuMHzb2PX5oH755hf5FTe9/LGqbtQF3oogbj00uKnmsNsb3P7g2Rs5GWV7pUxHxeTTa2uXqG2PFzrpMHMahJdUZ/rD1+x7GGDOnlr6U4qPwyPWIf2y5Jyr6W0eaKkcGEIp5y5tmm7C3PD+mu7wO8XSiSHPsPhAyo5Mgcs79oSR3dOht0QFd6CzkM00976pm1YvDH9Z1kkq
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 03:01:35.0849 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b18fcde6-901c-4548-e251-08df1dd5f8f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7098
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

Fix all checkpatch ERROR-level issues in amd_fuzzing.c:
- CODE_INDENT: use tabs for igt_assert_f() continuation-line indentation
- OPEN_BRACE: put the if-statement opening brace on the same line

No functional change.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 103 ++++++++++++++++++-------------------
 1 file changed, 51 insertions(+), 52 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index 36dd5d388..bcd3d66e0 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -291,8 +291,8 @@ run_drm_ioctl_field_cases(int fd, const char *ioctl_name, unsigned long request,
 		errno = 0;
 		ret = drmIoctl(fd, request, buf);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     ioctl_name, cases[i].case_name, buf);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     ioctl_name, cases[i].case_name, buf);
 	}
 
 	free(buf);
@@ -452,8 +452,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		{
 			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
 			igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_number.huge", &base);
+				     "%s unexpectedly succeeded for %s (arg=%p)\n",
+				     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_number.huge", &base);
 		}
 
 		/* bo_info_size cannot be zero. */
@@ -466,8 +466,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		{
 			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_BO_LIST, &base);
 			igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_info_size.zero", &base);
+				     "%s unexpectedly succeeded for %s (arg=%p)\n",
+				     "DRM_IOCTL_AMDGPU_BO_LIST", "bo_list.bo_info_size.zero", &base);
 		}
 
 		/* DESTROY should not require bo_info payload fields for a valid handle. */
@@ -747,8 +747,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		{
 			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
 			igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero", &base);
+				     "%s unexpectedly succeeded for %s (arg=%p)\n",
+				     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero", &base);
 		}
 
 		/* fence_count=0 must be rejected regardless of wait_all selector. */
@@ -758,8 +758,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		{
 			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
 			igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero_wait_all", &base);
+				     "%s unexpectedly succeeded for %s (arg=%p)\n",
+				     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fence_count.zero_wait_all", &base);
 		}
 
 		/* Non-zero fence_count with NULL fences pointer must fault copy-from-user. */
@@ -770,8 +770,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		{
 			int ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_WAIT_FENCES, &base);
 			igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fences.nonzero_count_null", &base);
+				     "%s unexpectedly succeeded for %s (arg=%p)\n",
+				     "DRM_IOCTL_AMDGPU_WAIT_FENCES", "wait_fences.fences.nonzero_count_null", &base);
 		}
 	}
 
@@ -924,24 +924,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.zero_count_nonnull", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.zero_count_nonnull", &arg);
 
 		memset(&arg, 0, sizeof(arg));
 		arg.bo_read_handles = 0x1;
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.zero_count_nonnull", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.zero_count_nonnull", &arg);
 
 		memset(&arg, 0, sizeof(arg));
 		arg.bo_write_handles = 0x1;
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.zero_count_nonnull", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.zero_count_nonnull", &arg);
 
 		/* non-zero count + NULL user pointer must fail in copy-from-user path */
 		memset(&arg, 0, sizeof(arg));
@@ -949,24 +949,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.nonzero_count_null", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.syncobj_handles.nonzero_count_null", &arg);
 
 		memset(&arg, 0, sizeof(arg));
 		arg.num_bo_read_handles = 1;
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.nonzero_count_null", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_read_handles.nonzero_count_null", &arg);
 
 		memset(&arg, 0, sizeof(arg));
 		arg.num_bo_write_handles = 1;
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.nonzero_count_null", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.bo_write_handles.nonzero_count_null", &arg);
 
 		/* queue lookup path: invalid queue_id with no dependency arrays */
 		memset(&arg, 0, sizeof(arg));
@@ -974,8 +974,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_SIGNAL, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.queue_id.invalid_empty", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_SIGNAL", "userq_signal.queue_id.invalid_empty", &arg);
 	}
 
 	/*
@@ -997,8 +997,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.zero_count_nonnull", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.zero_count_nonnull", &arg);
 
 		/* syncobj_timeline_handles: non-NULL + zero timeline count */
 		memset(&arg, 0, sizeof(arg));
@@ -1006,8 +1006,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.zero_count_nonnull", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.zero_count_nonnull", &arg);
 
 		/* syncobj_timeline_points: non-NULL + zero timeline count */
 		memset(&arg, 0, sizeof(arg));
@@ -1015,8 +1015,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.zero_count_nonnull", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.zero_count_nonnull", &arg);
 
 		/* bo_read_handles: non-NULL + zero count */
 		memset(&arg, 0, sizeof(arg));
@@ -1024,8 +1024,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.zero_count_nonnull", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.zero_count_nonnull", &arg);
 
 		/* bo_write_handles: non-NULL + zero count */
 		memset(&arg, 0, sizeof(arg));
@@ -1033,8 +1033,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.zero_count_nonnull", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.zero_count_nonnull", &arg);
 
 		/* out_fences: non-NULL + zero fence count */
 		memset(&arg, 0, sizeof(arg));
@@ -1042,8 +1042,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.out_fences.zero_count_nonnull", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.out_fences.zero_count_nonnull", &arg);
 
 		/* non-zero count + NULL user pointer must fail in copy-from-user path */
 		memset(&arg, 0, sizeof(arg));
@@ -1051,16 +1051,16 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.nonzero_count_null", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.syncobj_handles.nonzero_count_null", &arg);
 
 		memset(&arg, 0, sizeof(arg));
 		arg.num_syncobj_timeline_handles = 1;
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.nonzero_count_null", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_handles.nonzero_count_null", &arg);
 
 		memset(&arg, 0, sizeof(arg));
 		arg.num_syncobj_timeline_handles = 1;
@@ -1068,24 +1068,24 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.nonzero_count_null", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.timeline_points.nonzero_count_null", &arg);
 
 		memset(&arg, 0, sizeof(arg));
 		arg.num_bo_read_handles = 1;
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.nonzero_count_null", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_read_handles.nonzero_count_null", &arg);
 
 		memset(&arg, 0, sizeof(arg));
 		arg.num_bo_write_handles = 1;
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.nonzero_count_null", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.bo_write_handles.nonzero_count_null", &arg);
 
 		/* wait queue lookup path: invalid waitq_id when out_fences requested */
 		memset(&arg, 0, sizeof(arg));
@@ -1095,8 +1095,8 @@ amd_kgd_multi_ioctl_field_fuzzing(int fd, amdgpu_device_handle amdgpu_dev)
 		errno = 0;
 		ret = drmIoctl(fd, DRM_IOCTL_AMDGPU_USERQ_WAIT, &arg);
 		igt_assert_f(ret != 0,
-                     "%s unexpectedly succeeded for %s (arg=%p)\n",
-                     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.waitq_id.invalid_out_fences", &arg);
+			     "%s unexpectedly succeeded for %s (arg=%p)\n",
+			     "DRM_IOCTL_AMDGPU_USERQ_WAIT", "userq_wait.waitq_id.invalid_out_fences", &arg);
 	}
 	/*
 	 * USERQ_WAIT timeline points are 64-bit in UAPI.  Verify that the
@@ -2209,8 +2209,7 @@ amd_test_try_create_userq(int fd, amdgpu_device_handle amdgpu_dev, uint32_t ip_t
 
 	(void)fd;
 
-	if (!amdgpu_dev || !userq)
-	{
+	if (!amdgpu_dev || !userq) {
 		igt_info("userq create failed: invalid args dev=%p userq=%p ip=%u\n",
 			 amdgpu_dev, userq, ip_type);
 		return false;
-- 
2.50.1

