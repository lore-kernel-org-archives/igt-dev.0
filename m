Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDF87CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 08:32:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E42A10E54F;
	Tue,  4 Nov 2025 08:32:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fZUNIBiu";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013050.outbound.protection.outlook.com
 [40.107.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96A1510E54F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 08:32:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2MQqOYCgbNUY0KkU4qkZz42aC9tqEsbvcKIVDMewX3jRoeQbYXkl9ekwOGSSJMDT6OE5c03ieL4f8ND+yUD8wN3bwatBbka2M5bIhmC2ci5WYDtBdAZokZ+dmbXAsdjPiZOf+LkVpJz79uIykYXXS1z0bMJSW+ROZ0t+X7macZaY1aFO4ME+MhywusEjVoP1f1vbmjPiJzkkuInZShnqf1FcWahGKLixlkO+kfMgY4QTT8qUvCwiL4ql2/5PMCH+yx1UZ7XxSqbiyn0mJsfeGQ2JTyW0bhcW5JVkz3h6F7oNJULd/caElVOpD+pcPdiyc2Sx90FhRWNPNKOpl6ckw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m4alxdNlUWvHoiGj4RufKUOvZJ/8Pkl8Zp7n5+IkJPY=;
 b=SCZW6UXQSnaYH5J2i8gKVEmlquBTsdS3V9jDolOGa0d9X4gDERjY/LtgyQSfwEuReFzIzdcWCVLPnpgClzxZHhBmTkCXqCrm5IQGzuwbb9d1FYVJ26Ogqu5nKDmbxVkwUEzQfiNfwSDoasNXI7Kx+Mg1Mjy3cJ3NkMrB/od0jOwnOBChQqxCpPfIRLlxy3yort/gqpLBF9esE9QPKg529eN2+UdNTv3CHY5P/TGYdKG3guvzfS03GvLY4KFa7JmFZe6yB/HkR6x4s6L/uthBHx0jdHVshHliQsTSbNoviB3rEX7C9lKxaNbaWM6Nt5hyAO4sBHjya3+ciCxrrw+FDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m4alxdNlUWvHoiGj4RufKUOvZJ/8Pkl8Zp7n5+IkJPY=;
 b=fZUNIBiuDJ5nhKzKDarjiBSijgh6cgMfDlfdG54N7b2v7cZi1NCCvxh6JqnVvlt1DB+OrWp11z7fiXGS+gQ8JhzaxJar1BkTKNfB3+5CCtKZF6gM3w0OHCym72rLAv0j+Yfa4kNNGl0dewCA0kYznHLwLBNKunte+2upvIKWHtg=
Received: from MN2PR16CA0039.namprd16.prod.outlook.com (2603:10b6:208:234::8)
 by BY5PR12MB4081.namprd12.prod.outlook.com (2603:10b6:a03:20e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:32:18 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::c) by MN2PR16CA0039.outlook.office365.com
 (2603:10b6:208:234::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:31:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:32:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 4 Nov
 2025 00:32:17 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Nov
 2025 02:32:17 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 4 Nov 2025 00:32:15 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/3] lib/amdgpu: handle num_userq_slots compatibility
 for older driver
Date: Tue, 4 Nov 2025 16:31:41 +0800
Message-ID: <20251104083208.3700055-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251104083208.3700055-1-Jesse.Zhang@amd.com>
References: <20251104083208.3700055-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|BY5PR12MB4081:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c2a4a7-2884-40bf-68ae-08de1b7caa51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ChjsuW1atiY+i3BUaFFncWSC1R4UlcsRjfwSc/xRgf+nnRUq/nJF7qHksyEd?=
 =?us-ascii?Q?1e3JUqg0BtLNNB5eMn22q+y1d2c+ZJ7xSTPVemGKaZxsvh2Ytw1XGvoPqfOI?=
 =?us-ascii?Q?JDoLGJczU20X1kM5Gt8hGJSy1YJbmn4oW9HHhoU+6KJI3oGuiHBbo34iioAN?=
 =?us-ascii?Q?+F9nz/KSLAuWCG63iE70el2N5HMHFduYkDQTnmaCEIt28c6sjoO8f80MSOgt?=
 =?us-ascii?Q?BmMdO41Ro48VDu05ecX/F5GDKF1DG0rhpLo52ABmOX5f6gFx2wzsfyY3xS3V?=
 =?us-ascii?Q?5H586p2fgrQEsSousy4j+sZk7tc8gr+A1DkqfVtajlpExCV0sMkNaTm/XwmS?=
 =?us-ascii?Q?GfcN2ucUzxFZ6zQsKxppW6s9Q8LTaK2/3mB+EImtjehRP3XMsaJC+T5oJCk7?=
 =?us-ascii?Q?3y5lSnF/YzSvrl/TQ3eCM9EB3oBdhtB3B2+toPgJ65XgOa0FWuw44bBJrGFU?=
 =?us-ascii?Q?0WD0+2UxLpjhBZp5Jseun3ic8nOLbfAyejCQaQ2LO2I54RL/VcdKbZ/5HRhW?=
 =?us-ascii?Q?mqg3DgrjDp4VIV0fLYVLLGlUZoTcB8NSxqp1diclWQmWt3gb7gVF981Xrrm6?=
 =?us-ascii?Q?iqVL3RqD/0TfspvsG8D6miQfNFdjFQHNfyhiaP7IRX+Gceqnp2EjnWfCxwSF?=
 =?us-ascii?Q?HxMgio793gxq0cXfEDFvkm6A8/du98k0qvkdsOTqk2PTxeUvbFSTnrGSuCZp?=
 =?us-ascii?Q?SjrU69Ag7I+qr9clirPHnD9+NvwoFGcpfB5l1cb1zeS7KrTejlGWvKoNEyf9?=
 =?us-ascii?Q?lsHXq33gN4p6j6t7PX3RfmmjtCXpZ05nZzj2iY83SL/815o/B2115CR2y/Uk?=
 =?us-ascii?Q?S4CT1tcYvAzTJ8lQ99JrvL4QlnR11zZqI3C0IQPEFUGIKUozwGs921twiCBq?=
 =?us-ascii?Q?upi79z3Ez+vZKKOpDdA5GufnfqKOruivg+hQEVq4lv6ApioSHvr15ucpDEVA?=
 =?us-ascii?Q?yPeHHxiR/49AB5htLpKYsSkxYJkIliao2idck8g1oSYwcFcvYWqRIcQaL/Zl?=
 =?us-ascii?Q?8ypl14HoySra3GYhs4C45sr7n/da4heagZekuWXJ4hgBRMj9yLxeMoE0J7Q3?=
 =?us-ascii?Q?ITMpqLkE6SOtmr0XW14aRYzYIR7PmSU6+l+qgqZefc0vn//C4T98YafgM8Kq?=
 =?us-ascii?Q?Ee+aGr46BvMTzeIVu4/ZWcBQpy7u85qAZM1aMAo1OOP8bTSnlqx0/Q0vuW8w?=
 =?us-ascii?Q?x609vbwmOSGoEZLtdkz4Idx4swOzjIdRmAHZJdKabDD6YZC/wiK+tiMZWQtx?=
 =?us-ascii?Q?oCvisSiqo1YsBYbCydtkJ7WSeAvxCtEuAT2S39EuRN1i8sJCWlyng8ZCCOM2?=
 =?us-ascii?Q?G6dQVaeQlog3eAN80NfMBUouslPqzM8X4fT4UepBl5o0/7KGxTDAiNjUnMkQ?=
 =?us-ascii?Q?jKVJPmUw/CmMOTcfvVJlQ0JivABqGTZMQVUIubTwaoRUMsS+z1dRhNFM+FSW?=
 =?us-ascii?Q?QkwOwCzQJCIeBssaz5aGOfZNWbN8gmNpw4XSfmUjbhBwKMr/Zr0khafARHlx?=
 =?us-ascii?Q?X9bpEPDn+xGBpTZZ+G+3BkS765zNUzKBLuHQBHJ76aB7YPRydw7oX35gNHCN?=
 =?us-ascii?Q?3ZEs2doU+JOc/tg6TSo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:32:18.0103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c2a4a7-2884-40bf-68ae-08de1b7caa51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4081
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

Ensure compatibility with older driver versions that may not
have the `num_userq_slots` field set in the `hw_ip_info` structure.
When this field is zero (indicating an older driver version),
set the default value of `available_rings` to 1 to ensure that at least one ring is available for testing.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_command_submission.c | 32 +++++++++++++++++++++--------
 lib/amdgpu/amd_compute.c            |  7 +++++--
 lib/amdgpu/amd_deadlock_helpers.c   |  7 ++++++-
 3 files changed, 35 insertions(+), 11 deletions(-)

diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index b5f20e929..64568ded1 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -153,8 +153,12 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &hw_ip_info);
 	igt_assert_eq(r, 0);
 
-	available_rings = user_queue ? ((1 << hw_ip_info.num_userq_slots) - 1) :
-				hw_ip_info.available_rings;
+	if (user_queue)
+		available_rings = ring_context->hw_ip_info.num_userq_slots ?
+			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+	else
+		available_rings = ring_context->hw_ip_info.available_rings;
+
 	if (available_rings <= 0) {
 		*ring_context_out = NULL;
 		*available_rings_out = 0;
@@ -369,8 +373,13 @@ void amdgpu_command_submission_write_linear_helper(amdgpu_device_handle device,
 
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
-	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
-					ring_context->hw_ip_info.available_rings;
+
+	if (user_queue)
+		available_rings = ring_context->hw_ip_info.num_userq_slots ?
+			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+	else
+		available_rings = ring_context->hw_ip_info.available_rings;
+
 	for (i = 0; secure && (i < 2); i++)
 		gtt_flags[i] |= AMDGPU_GEM_CREATE_ENCRYPTED;
 
@@ -496,8 +505,12 @@ void amdgpu_command_submission_const_fill_helper(amdgpu_device_handle device,
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
-	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
-					ring_context->hw_ip_info.available_rings;
+
+	if (user_queue)
+		available_rings = ring_context->hw_ip_info.num_userq_slots ?
+			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+	else
+		available_rings = ring_context->hw_ip_info.available_rings;
 
 	if (user_queue) {
 		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
@@ -593,9 +606,12 @@ void amdgpu_command_submission_copy_linear_helper(amdgpu_device_handle device,
 	igt_assert(ring_context->pm4);
 	r = amdgpu_query_hw_ip_info(device, ip_block->type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
-	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
-					ring_context->hw_ip_info.available_rings;
 
+	if (user_queue)
+		available_rings = ring_context->hw_ip_info.num_userq_slots ?
+			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+	else
+		available_rings = ring_context->hw_ip_info.available_rings;
 
 	if (user_queue) {
 		ip_block->funcs->userq_create(device, ring_context, ip_block->type);
diff --git a/lib/amdgpu/amd_compute.c b/lib/amdgpu/amd_compute.c
index bc9f77d34..1f618d5a9 100644
--- a/lib/amdgpu/amd_compute.c
+++ b/lib/amdgpu/amd_compute.c
@@ -57,8 +57,11 @@ void amdgpu_command_submission_nop(amdgpu_device_handle device, enum amd_ip_bloc
 	r = amdgpu_query_hw_ip_info(device, type, 0, &ring_context->hw_ip_info);
 	igt_assert_eq(r, 0);
 
-	available_rings = user_queue ? ((1 << ring_context->hw_ip_info.num_userq_slots) -1) :
-						ring_context->hw_ip_info.available_rings;
+	if (user_queue)
+		available_rings = ring_context->hw_ip_info.num_userq_slots ?
+			((1 << ring_context->hw_ip_info.num_userq_slots) -1) : 1;
+	else
+		available_rings = ring_context->hw_ip_info.available_rings;
 
 	if (user_queue) {
 		ip_block->funcs->userq_create(device, ring_context, type);
diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 83b033c40..5efb5e73d 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -496,7 +496,12 @@ void bad_access_ring_helper(amdgpu_device_handle device_handle, unsigned int cmd
 	r = amdgpu_query_hw_ip_info(device_handle, ip_type, 0, &info);
 	igt_assert_eq(r, 0);
 
-	available_rings = user_queue ? ((1 << info.num_userq_slots) -1) : info.available_rings;
+	if (user_queue)
+		available_rings = info.num_userq_slots ?
+			((1 << info.num_userq_slots) -1) : 1;
+	else
+		available_rings = info.available_rings;
+
 	if (!available_rings)
 		igt_info("SKIP ... as there's no ring for ip %d\n", ip_type);
 
-- 
2.49.0

