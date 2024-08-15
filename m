Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C532C3DA4A
	for <igt-dev@archiver.kernel.org>; Thu, 15 Aug 2024 02:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C40F10E329;
	Thu, 15 Aug 2024 02:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="xi/WZE/5";
	dkim-atps=neutral
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDE1C10E329
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Aug 2024 02:03:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xuQKMxA4GxkLmcpu7eJPGMnfn10RBx4K6cvkE41pQEH+fEc/r0PUmHePZ8X6DdVvVprzCteymye3CznrD050sHcS2B9i1xJ24bi5pnM2lWEX2zOICSR4yrjAkuDypV+QkKKnSDWiDEzhYKtlndTC9wNUnCVysb3J4b0ZFC42t6WEnz3JbXJaGS1WYDS3l3O+YUjRNDB4ctUj0qrugANlIf0IsiSKtN3zmxaA1d2H+fusFmF4oIP2NK7pgQ1tp108mRwH9pLSmNDcl5PPmH+L7PpFPrHV7MPpVPMINASa5q1c3/gaMkfRb/gyqU/P1XRo6jLEpZagl3MesvV6jdEKDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O3AOClXCPRwv8nVtKooQr9dbIFa9/kAEM2x4bxELyKk=;
 b=HzxdQ/HoNsPmPSohIaAs672bkFsxvhlvdl2WNRjsUhZinMWKo5pX1+jSN6Tw5Iml2MTZaz6rD1a1o1olAf2XmxwS4zgRCPtCABMO1SbHwvdvzSQMTBcaDx+IGeRo4Y9KOcenQkw7EajBAruPnk39SUrkuZqaU41TQLoJxmsoH9B4q3WZCFqYj+I9/wYY7egWBUkjRUTbIVib0Vn0fDFKFJtSri9CE/CC+MzV75YxdT5siyFF3jkvDLwNGCZsPBLMp1trOWXSotEM7fSgY+U5k1c6lDWAduOfavjgQ9suzcnQZYA6WiDLTimHdFMrvt9YDjfxVZ9JcKCAvMFazytXQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O3AOClXCPRwv8nVtKooQr9dbIFa9/kAEM2x4bxELyKk=;
 b=xi/WZE/57l6QCUuNR80PmONIH5GHZEFCaDL2etRIQtQuwsBFU/mSv2bD8zEo9pe/00UTU5HS5mu5HM+OfKB1Z5HIu17/O5TJkHxjrg+DZTD6OfrgWqCV+OcOEyTgl1SmpGmgmH6U2W50eECxLBNLveoD8Dl1w4dG3VAo7whJzt0=
Received: from DS7PR06CA0021.namprd06.prod.outlook.com (2603:10b6:8:2a::23) by
 SJ2PR12MB8738.namprd12.prod.outlook.com (2603:10b6:a03:548::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Thu, 15 Aug
 2024 02:03:00 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:8:2a:cafe::d7) by DS7PR06CA0021.outlook.office365.com
 (2603:10b6:8:2a::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Thu, 15 Aug 2024 02:03:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Thu, 15 Aug 2024 02:02:59 +0000
Received: from ldev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 21:02:51 -0500
From: Tim Huang <tim.huang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, <alexander.deucher@amd.com>, <jie1zhan@amd.com>, 
 Tim Huang <tim.huang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: fix secure bounce test failure on APUs
Date: Thu, 15 Aug 2024 10:01:46 +0800
Message-ID: <20240815020147.155078-1-tim.huang@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|SJ2PR12MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 755922bd-a54d-42e9-9cc7-08dcbcce639e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zycwszqa2Hp6w4RbhsXLzSOP9G4oKb6UhB6Vbf+qmsl8sWbaUTvL+vNPp9KK?=
 =?us-ascii?Q?gAmpfPmRh0qL5jF5tUK1INqeyubqzLWnYDU0q3VFumCLpDjukKUwZTmElx/o?=
 =?us-ascii?Q?NSeenhmcBldcQHuwjOzrgZ48sJpjBfrs+MQL3vPYVcKbLs0T7yJ09P1RuO6U?=
 =?us-ascii?Q?Ht8q6DjzPe180Hf1bMMXkOUJBHCwEGnwdD4GMI6e7kw7XnwKuznYSgA4andi?=
 =?us-ascii?Q?J5jKfa9phWyzxbvkencDourro+b9JQf1T9Lf9Uk3FN4WGaaHERpt9h+Bj0Qs?=
 =?us-ascii?Q?Sv81V5qolD4/FPOsZYymDiurXgMPzPDoDWHatyFjWr9/+E/VRKutYuwFIav9?=
 =?us-ascii?Q?Lbe7DCiiXySP9Jx+l0Ox7Zy87bH4ruthq6EIJTzHwIqfGl1VNr9rwXUF/378?=
 =?us-ascii?Q?JKXOOSUb8oOkpDmOoo9ocA1Yzv+GoBn5OkRd/I0nfHXhMA6hsc1HM/+RI0LE?=
 =?us-ascii?Q?GQFepfIQFSs6GgaieG/qmPOoRCtHM7hR5hQ8ELcKXDKqdzYkYSdRnqkd3yIX?=
 =?us-ascii?Q?dJXqtPFcFIzRYwsKYODM2/Xg1zcS0rX8aAqOLSi7b71EVlUT20Q7moLgRrko?=
 =?us-ascii?Q?+3v3hJQsXO0/rfXuyP2He6xGLJglQDYbDQj9sNl6TEcCo6XIC7WnBHME7ShU?=
 =?us-ascii?Q?+SEwjzJD8Nu+9Z2lSaREGDuOxHqoeSR2iBnzJh291GaZ5gK6ELoNt6ib32+n?=
 =?us-ascii?Q?29OgwLbPg8uArZixUeVOlyxF62EgzyInBsdswhGdF5vjz76/kDzlsBPzVNnh?=
 =?us-ascii?Q?OLb0J4ODqHh2Xp3ldGWOZd0uNi+drc8FEtILTyzjoXosEl1owREvBXRk/S0V?=
 =?us-ascii?Q?5JaLrlEiMoEjQkzbymfXuZslhLezxbj/l/c/xYaiisd6w3vriME1BTVvCMe3?=
 =?us-ascii?Q?1XMoX1YUddSmuVj5F6MJT7kyhljlqDCqTV5U3D8EerFkZBt9b0okPpkgG3gz?=
 =?us-ascii?Q?9kfdeRGFSGsWH9DGoXW22Wfu6SOZZhHaGEdoTWyyWzY0jxlwCkxhidMzTU1g?=
 =?us-ascii?Q?bRZFBgo6OV31kMpLMbXTZnavfM3t/Eh8dxILXaiQ+d7S5WccNpMG5c5uqwaS?=
 =?us-ascii?Q?BMl045rrFNXdKw4HGpUHPteqgukaIzvB+mR9//25J1xTe3nu/rbiZS5cMn1m?=
 =?us-ascii?Q?bLqbk7Z6h+GmXf4FRUBgegVhx0JSfeJJL1CEUzHtIC+LRv+2M4evUy1ThhLs?=
 =?us-ascii?Q?AXWkNE78UAGVslOsPc58rlLl7kNhH9TTRW5EBsN5WBFLTY8NwDk80qidJak5?=
 =?us-ascii?Q?sPTMcQlIVoTLhKlFiUlW+gETwfe3F7x+oXKKXfJikzk9LIyoCi4ZxevLrtNj?=
 =?us-ascii?Q?pna0i2vrE6wxl/8zWs8XbTBUbJuhMCoIsLqAWrqSgpJvHEhmS1qfatMJ0MRZ?=
 =?us-ascii?Q?rmPRnbH0knQ83STuoqKxtC8Pg77pU9j2x2FroJheAkKxWFCuD6T+RGm/1pDV?=
 =?us-ascii?Q?U/7q2mTNfBRtjMS15ASbqoeXA9txJuZx?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 02:02:59.9610 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 755922bd-a54d-42e9-9cc7-08dcbcce639e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8738
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

Some APUs have address tweak secure mechanisms that encrypt
destination data preventing it from matching the original data.

Rework the test case to ensure compatibility with these APUs.

Signed-off-by: Tim Huang <tim.huang@amd.com>
---
 tests/amdgpu/amd_security.c | 28 ++++++----------------------
 1 file changed, 6 insertions(+), 22 deletions(-)

diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index ec6883d3d..024cadc05 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -147,8 +147,6 @@ amdgpu_bo_move(amdgpu_device_handle device, int fd,
  */
 static const uint8_t secure_pattern[] = { 0x5A, 0xFE, 0x05, 0xEC };
 
-static const uint8_t secure_pattern2[] = { 0xDE, 0xAD, 0xBE, 0xEF };
-
 static void
 amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
 		struct drm_amdgpu_info_hw_ip  *sdma_info,
@@ -209,27 +207,13 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
 	amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFER_SIZE,
 			secure == true ? 1 : 0);
 
-	/* Verify the contents of Bob. */
-	for (pp = (__typeof__(pp))ring_context->bo2_cpu;
-	     pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER_SIZE;
-	     pp += sizeof(secure_pattern)) {
-		r = memcmp(pp, secure_pattern, sizeof(secure_pattern));
-		if (r) {
-			// test failure
-			igt_assert(false);
-			break;
-		}
-	}
-	/* Fill Bob with a pattern2 */
-	for (pp = (__typeof__(pp))ring_context->bo2_cpu;
-		pp < (__typeof__(pp)) ring_context->bo2_cpu + SECURE_BUFFER_SIZE;
-		pp += sizeof(secure_pattern2))
-		memcpy(pp, secure_pattern2, sizeof(secure_pattern2));
-
 	/* Move Bob to the GTT domain. */
 	amdgpu_bo_move(device_handle, fd, ring_context, ip_block,
 			AMDGPU_GEM_DOMAIN_GTT, 0);
 
+	/* Clean Alice first before do the copy from bob. */
+	memset((void *)ring_context->bo_cpu, 0, SECURE_BUFFER_SIZE);
+
 	/* sDMA TMZ copy from Bob to Alice.
 	 * bo is a source ,bo2 is destination
 	 */
@@ -250,11 +234,11 @@ amdgpu_secure_bounce(amdgpu_device_handle device_handle, int fd,
 	amdgpu_bo_lcopy(device_handle, ring_context, ip_block, SECURE_BUFFER_SIZE,
 			secure == true ? 1 : 0);
 
-	/* Verify the content of Alice if it matches to pattern2*/
+	/* Verify the content of Alice if it matches to pattern */
 	for (pp = (__typeof__(pp))ring_context->bo_cpu;
 	     pp < (__typeof__(pp)) ring_context->bo_cpu + SECURE_BUFFER_SIZE;
-	     pp += sizeof(secure_pattern2)) {
-		r = memcmp(pp, secure_pattern2, sizeof(secure_pattern2));
+	     pp += sizeof(secure_pattern)) {
+		r = memcmp(pp, secure_pattern, sizeof(secure_pattern));
 		if (r) {
 			// test failure
 			igt_assert(false);
-- 
2.43.0

