Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB416CCFA00
	for <igt-dev@archiver.kernel.org>; Tue,  4 Nov 2025 08:32:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791AE10E54D;
	Tue,  4 Nov 2025 08:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="e3VpZ5UT";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E9D10E54D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Nov 2025 08:32:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zj2mKmc08rHC47WdkxLLP/dGz2/FIlG5jy5YgcFZh8GDJOzloZPS70btakg7x7K0r8T63IzL0zusdioyeaGfPy2dBIyECnIr+LVQ/9QnwOrPFKrCmfm9gQrwAmw/yztKWPIJFJv83ifRcymMMjRddBHDZIWI/fhld4tslRjvJrgcgaKuXjV4n+Naiwa8MB/oUXggq5Ij5Sl9kCqHbcZvKy2D3KGPWA9Ux2TziRpsVPWcPP/7tgcMp5K3An9EzTRNu7jLoocbnJ3wzTEV6M52EM/jITWAqP1s7FCCVSQnTvpDpDwxeMab8T+6cmHfTVovpsIhxTPR5lM+PXUcIorEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=akHAve8WRKO3UbXQ/80IDBe+3qWwK5VqcBNRuuN6g5o=;
 b=ZAeC4cI+yTRj9075PLelDNAfalz8KDynvTCCgtz45z9WQbqPwG4YgR4B3Liyv8IA2uPvr4Y86ptFC+dgYJvTV3SDOku4WlF5vfV50768dXdwoMVVLKUN0GvB+Pdz+1nuBJhBMl0QPkCH4xBBUae/d6Gb77Ah0eJJgMEeSR3YW5TOvoiYPrspY/9uQerwMxzsoWArq5BjZ2yl07qNvGyMq8yf5kcSBTs1kIFtN+sUzDQZMLSQ3tA0hbY4gsQDVnxfU4UunecXox9nEnpGeaEcF8P9QwtvkFvkjmiww97WHeNqwqOOuSx9VMayktsoH28kvcSSNII93RyUdX3JJVJntw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=akHAve8WRKO3UbXQ/80IDBe+3qWwK5VqcBNRuuN6g5o=;
 b=e3VpZ5UTiEBq+gOIIm8Q6rdimUYObGNKf8+3HWdCDX8Wv9uxtGzj6eLEUyYlNSWfG5sx68iETqhMOmuZSmNsgixCLSzaJijrXLNh/+z13PQXFQ2VvMKIh0/FJvCpP+k9KnqB4WBLb1q0dPNMP2FmwTRPKJbEInGjTzPuhErO6Ms=
Received: from MN2PR16CA0038.namprd16.prod.outlook.com (2603:10b6:208:234::7)
 by CH3PR12MB8459.namprd12.prod.outlook.com (2603:10b6:610:139::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 08:32:16 +0000
Received: from BL02EPF00021F6F.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::4a) by MN2PR16CA0038.outlook.office365.com
 (2603:10b6:208:234::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.16 via Frontend Transport; Tue,
 4 Nov 2025 08:32:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL02EPF00021F6F.mail.protection.outlook.com (10.167.249.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Tue, 4 Nov 2025 08:32:16 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 4 Nov
 2025 00:32:15 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Nov
 2025 02:32:15 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Tue, 4 Nov 2025 00:32:13 -0800
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/3] lib/amdgpu: skip scheduler mask and memcpy tests
 for user queues
Date: Tue, 4 Nov 2025 16:31:40 +0800
Message-ID: <20251104083208.3700055-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F6F:EE_|CH3PR12MB8459:EE_
X-MS-Office365-Filtering-Correlation-Id: f96d8451-5287-4232-9d86-08de1b7ca945
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nbS5AIhx2ZNHwRPEJa8+LSo/S13NWGQ8ejDh/cVSYUVeSyWEaKpLu1NiiXmb?=
 =?us-ascii?Q?TloqL8RDOmDm0mVOUx+/ICrd0ZTrg+yw3vOeOAYYm9+TW1axSbflqCKngT7I?=
 =?us-ascii?Q?IsvJ25xtCDo9Z/5uDGFXV7dVgPZPMG16oQhz1oXMxsjjJmbON1pg39LN4O3C?=
 =?us-ascii?Q?97dipe4BqVUmOa3p0raeQVaWD9GwKjiXj6rc+4O8eMm8LV5hhD3iti4M3gPI?=
 =?us-ascii?Q?AIfx2UQOWhF3R7pq7+5Ll/l9QujHtQXnhV5ycKSx5kqQ0fUmYknZiQLdJKr2?=
 =?us-ascii?Q?BTbfg31FlS+CkzYlrb0fwamnGzm5r18Dg87YrcMhi99sx7JYXJKmdHbOBFOi?=
 =?us-ascii?Q?R07T9ett2bHFMmhkFHURLN5efZmZ0EdEgBvEgPCoQ5ppOyFaIMbfGuMdJVqI?=
 =?us-ascii?Q?q+rcfNSm9Zd1kFpb9c7B5xTn1I9t7NM2ZwioigtpDvOeDUgwjEQ6rqv34WKG?=
 =?us-ascii?Q?Px9Sc9afh5LkTdMhcMMXOKSQhE7XWyKOBxRMRRi3PWbXmnsnM7cbwmykBCjE?=
 =?us-ascii?Q?DEpAMJbgPntSWG1Pwd0n77zlvV2xsAFF3lAMRRB285P8wyx/FoRmIeVEDUYw?=
 =?us-ascii?Q?DBeQmymvQqVgRFdJ0p/YY7MTrsLngo4+XuL52J4pp1F3XbLCKkr2oI4dnog+?=
 =?us-ascii?Q?Q4suRc3rj670fiQmn9wVIxmbR1BOMot3s9zTSlB+B2cST0Azn7CuRuoAN0ur?=
 =?us-ascii?Q?y6AReYz4oYJs44f0sv5IYlNQ1AQunwXEU99udKbaFV9kGX6nydu4pkSJ1ei9?=
 =?us-ascii?Q?38v23QqKXJI0q0a/foHYncLahLmyFm5PfKUq4DF3rqxejer/zqyNhH8N89hY?=
 =?us-ascii?Q?qgJg4CncQhumV+EhuTk/rfNTzF23/6aZmzIWMQsLzpYFDk3aGkfDR9EM1gaa?=
 =?us-ascii?Q?7EBOnO6eMZ2Yyyuc/jPBzk+j+rYkGRaHVUBvkGTrIcV9al08oQRcrxe24Ibt?=
 =?us-ascii?Q?hAEsReTqOKg9BjwEt39BYtt6fLNcF40mc+N7hxbmqL88ckORLJ0hD//fy/Th?=
 =?us-ascii?Q?sjcLiWBV9hZW6vzPhGOvndkJgCqhNscJxP8/ndQ4YJuOn56LeeyWcZ7fLrRx?=
 =?us-ascii?Q?l5kLJFhdRrRKhbg9qf9VfH9CXRU5ado9KRrFdH/fW2FatQOUNAXxOWKVuJk0?=
 =?us-ascii?Q?3ntOkmXxzc/d3d0xqC9KYVkwNqWML2lMBa7uPB4pY4TXPU7hJ0wY/Vz5FIxn?=
 =?us-ascii?Q?LaZm8HtPNPYjoR5ODzTfB0wYVDugbLOfG3FbPZkF9Ewo2cK0ki1hnzzSEDd0?=
 =?us-ascii?Q?dLVW2ZBNN+ZtHjRNkwo81Yo+o4NWtmLoqYobjbsFvBTrb20QzXqCDcfxvC6I?=
 =?us-ascii?Q?tUs+RjpI4brq8rv5q26ua4PeiEFI2TYRQWFnXNCOmAAuwRFvXCdUn1qSSO1Z?=
 =?us-ascii?Q?RL2zROoo6jefu/F+Zsbx6n3SxQxJKDqrStE45YwCLs+KybQlf0ekft93vR7/?=
 =?us-ascii?Q?fmDrh5TaQ4D3MX7Q9kcBNxk/guR7vIKaaryKLl+js6zeIQxZRPxRwKs7LER3?=
 =?us-ascii?Q?RaamxBhHe8Dk7knxK0G85Lzayx+PNCkNo/zA0jD5UV3nO7YrOGLO8JVvVTnI?=
 =?us-ascii?Q?7CMKfOu2XKQuTssj64M=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2025 08:32:16.2563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f96d8451-5287-4232-9d86-08de1b7ca945
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00021F6F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8459
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

For user queue testing, skip the scheduler mask configuration since
user queues are scheduled by the MES firmware rather than through
the traditional scheduler mask mechanism.

Also skip the memcpy dispatch tests and only run memset tests, as
the memset test is sufficient to trigger user queue reset functionality.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_dispatch.c | 64 +++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

diff --git a/lib/amdgpu/amd_dispatch.c b/lib/amdgpu/amd_dispatch.c
index c71f03026..b1710a9ca 100644
--- a/lib/amdgpu/amd_dispatch.c
+++ b/lib/amdgpu/amd_dispatch.c
@@ -180,11 +180,12 @@ amdgpu_memset_dispatch_test(amdgpu_device_handle device_handle,
 		igt_assert_eq(expired, true);
 	}
 
-	/* verify if memset test result meets with expected */
-	i = 0;
-	while (i < bo_dst_size)
-		igt_assert_eq(ptr_dst[i++], 0x22);
-
+	if (!user_queue) {
+		/* verify if memset test result meets with expected */
+		i = 0;
+		while (i < bo_dst_size)
+			igt_assert_eq(ptr_dst[i++], 0x22);
+	}
 	amdgpu_bo_unmap_and_free(bo_dst, va_dst, mc_address_dst, bo_dst_size);
 	amdgpu_bo_unmap_and_free(bo_shader, va_shader, mc_address_shader,
 				 bo_shader_size);
@@ -780,29 +781,33 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 	if (version < 9)
 		version = 9;
 
-	if (ip_type == AMD_IP_GFX)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
-				pci->domain, pci->bus, pci->device, pci->function);
-	else if (ip_type == AMD_IP_COMPUTE)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
-				pci->domain, pci->bus, pci->device, pci->function);
-	else if (ip_type == AMD_IP_DMA)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
-				pci->domain, pci->bus, pci->device, pci->function);
-
-	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
-	r = access(sysfs, R_OK);
-	if (!r) {
-		fp = popen(cmd, "r");
-		if (fp == NULL)
-			igt_skip("read the sysfs failed: %s \n",sysfs);
-
-		if (fgets(buffer, 128, fp) != NULL)
-			sched_mask = strtol(buffer, NULL, 16);
-
-		pclose(fp);
-	} else
+	if (userq) {
 		sched_mask = 1;
+	} else {
+		if (ip_type == AMD_IP_GFX)
+			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_gfx_sched_mask",
+					pci->domain, pci->bus, pci->device, pci->function);
+		else if (ip_type == AMD_IP_COMPUTE)
+			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_compute_sched_mask",
+					pci->domain, pci->bus, pci->device, pci->function);
+		else if (ip_type == AMD_IP_DMA)
+			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_sdma_sched_mask",
+					pci->domain, pci->bus, pci->device, pci->function);
+
+		snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
+		r = access(sysfs, R_OK);
+		if (!r) {
+			fp = popen(cmd, "r");
+			if (fp == NULL)
+				igt_skip("read the sysfs failed: %s \n",sysfs);
+
+			if (fgets(buffer, 128, fp) != NULL)
+				sched_mask = strtol(buffer, NULL, 16);
+
+			pclose(fp);
+		} else
+			sched_mask = 1;
+	}
 
 	for (ring_id = 0; (0x1 << ring_id) <= sched_mask; ring_id++) {
 		/* check sched is ready is on the ring. */
@@ -836,8 +841,9 @@ void amdgpu_gfx_dispatch_test(amdgpu_device_handle device_handle, uint32_t ip_ty
 		}
 		amdgpu_memset_dispatch_test(device_handle, ip_type, prio,
 					    version, userq);
-		amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
-					    version, hang, NULL, userq);
+		if (!userq)
+			amdgpu_memcpy_dispatch_test(device_handle, NULL, ip_type, ring_id, prio,
+							version, hang, NULL, userq);
 	}
 
 	/* recover the sched mask */
-- 
2.49.0

