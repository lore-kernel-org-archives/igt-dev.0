Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C37CAC5B5
	for <igt-dev@archiver.kernel.org>; Sun, 28 Sep 2025 03:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D070610E0A7;
	Sun, 28 Sep 2025 03:18:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DgP+TpcZ";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012047.outbound.protection.outlook.com
 [40.107.200.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F1E510E0A7
 for <igt-dev@lists.freedesktop.org>; Sun, 28 Sep 2025 03:18:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDSu7nghNB/Cwje8ndJuCGDYachehjs/1rGfYQae0OHiVO/46jKnv8IKJL1a+0q0qEf3S3y0WlEgjjX1Qqdtm4GhWjoo3k6CpzAmyfu/AhlaZ8KnWKGW078VA8FchZC/e3gcV6ZkWcolSIcZMo5riGdbaILWk0uS6dSu4LnAUQdwmjAehqj/ANulbb4uox6QoEVd6wSyAkc1UyCpRmjtoOQ3kVcGmk3VE/bjXCXlr/cTJ48T1rk5qU2+ZGrOV6slHGVk0VKUdA5zaLKbpcK/cePwfhh/QoBLoGzH4RYwgW6G3AMi1k4FZy81yc0H+v72r9kZhgfJq9AKLhhTyLHouw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=usWUlFadqaFEYWRmq7CviN4sMsUkEHeZTXM4PLUr/5w=;
 b=qxslhYcbu0i1ZVKpiOMLpqAvnCGQ9tsgx75hJPULkhXN9Bgp/XdflubQ9CB24YcdnbMbZtY8IYvbtjRKnYdOKGRS3ZohnZ8ACAniSLcdrJcTSni9MoEeymISdtnJuB/aeJjT2KfHidNK7mtEOAqP0qcgjLuFZQi/8KQODvxyq+6qQ6Hq6SGRzFfXqzpn9SMKaRKK7S5I7FbHU0dHazpo3H5V6zRhO8m8sPlg1FNV72P8xH3tGRZCg8u4I7mVBVYAxar71ZHs6ecpVV4w4CzjosW8zGsF0q22bWXsFgEA6SVcOIzJFDuIH+W8Dse0e/MUCfn4K0scqASf7PSHEbf4Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=usWUlFadqaFEYWRmq7CviN4sMsUkEHeZTXM4PLUr/5w=;
 b=DgP+TpcZgNeSnDfkxCb+ijiX/LYUPFLeIYRFWYTRWhfCOW9SEzWrTgIML0h+K6HHS8qjETqUDuIMtpmCxIwYYpHcPUWqqaF/rzDmDBFYi2C/K6UammgWzOaYiJN8UpBopHqWe3stwg/k/+D+2lvDZOa9gvsHyKNmoy8TZpuTN0M=
Received: from BL1PR13CA0315.namprd13.prod.outlook.com (2603:10b6:208:2c1::20)
 by PH7PR12MB6465.namprd12.prod.outlook.com (2603:10b6:510:1f7::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Sun, 28 Sep
 2025 03:18:16 +0000
Received: from BN2PEPF000044A8.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::d3) by BL1PR13CA0315.outlook.office365.com
 (2603:10b6:208:2c1::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.6 via Frontend Transport; Sun,
 28 Sep 2025 03:18:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN2PEPF000044A8.mail.protection.outlook.com (10.167.243.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Sun, 28 Sep 2025 03:18:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Sat, 27 Sep
 2025 20:18:14 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sat, 27 Sep
 2025 22:18:14 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Sat, 27 Sep 2025 20:18:12 -0700
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/2] lib/amdgpu: Add dynamic DRI path detection for
 debugfs access
Date: Sun, 28 Sep 2025 11:17:20 +0800
Message-ID: <20250928031812.3006673-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A8:EE_|PH7PR12MB6465:EE_
X-MS-Office365-Filtering-Correlation-Id: 1612cfed-fcdc-44d4-d761-08ddfe3da9d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qka2Fx79LHdyWfTCLeOcdDtQSF9jVdtemj/gJB7OWqrawacSzn91ZCdAzjXn?=
 =?us-ascii?Q?+8rSJl0AJurErFRXjP9CS+/OWnRi/ONXzA3vVCiaj37HOqEqhhCifIa/6HWj?=
 =?us-ascii?Q?L6Pm+PPz/TYn4Z7wdnbdSwkEdndZk7YZ0Frg8f4rIsWCQIl0hB2nz0O5Mlj9?=
 =?us-ascii?Q?kqNhU9xqzxE/sd49VfDUuK1edDfkHC7t8g6XuJCgX+P2YV/q2jfSxSKTGSMV?=
 =?us-ascii?Q?jOKpSkncqY2pCEAgqAW5kAlaajjT9y3birKopdTUEKx+qZ0zxXdlVzVYwUyN?=
 =?us-ascii?Q?WY5d8/2S5tGD3TnO88P2cnYcfItnRBVCLXh8Osw/NQSwa2jN8BVWQrYPDzZs?=
 =?us-ascii?Q?Rh+sDyr8Ov/TFTF4SsVCCJwd519iO86NxaYSzr8Z73nNv+3Xf03/Etrf3i4H?=
 =?us-ascii?Q?IAaShwuzPklS0Je1aggHADncIuOaWJoe+vlppEQiUXW4h/rcbhjyrTCZD69D?=
 =?us-ascii?Q?WTXJ8RySTihKzilAaHm3T1FHIj8i0Fj66/JZ9AEXxMY1GCaHNRKSHnc+XVVm?=
 =?us-ascii?Q?DIKfHLjHGkmOAqoB/kJE0b9c9BvDiw+9zQu3PlUWpHzwwZur6hmwwEafcWi5?=
 =?us-ascii?Q?EWyiIkXmMC0TA9TMV65LzZynysrpgy+2+ltIqpy3RS2QA33zXrRFywjVKJCm?=
 =?us-ascii?Q?ahWGMzauGykPLVJGhqatzdlHoxedm3DBilsYyuFhjYmjnD5ifl3R7RzxPFSp?=
 =?us-ascii?Q?TNz4FrGo1rbsvMqXuhyOP7sq8TYxBGETO1OEZAWEdmlOnyDdQUwGhHS7RETS?=
 =?us-ascii?Q?EHCYcLYqqXoI1koaDmhwfhgCmMIMBmAw7T0znYyE5+pIBFCkjHHnWTe8UutZ?=
 =?us-ascii?Q?ijZFpPy28JxADJ1QEQf1UCfV51ChXRB7Yu0dzAdcQ/MFWQW3J6ih2yUvMVov?=
 =?us-ascii?Q?/q1K2FV/OCqVTtRrtNS7I/ZioI/DBlV9YIRSAU2HOgbZF/8oS3ajIcVWdbSy?=
 =?us-ascii?Q?ZdDc4H/TedhX2G9HVCDyXUEQL6KC9hf/mDXx98b78pSih3Im80sLupgOFK6A?=
 =?us-ascii?Q?YCjw50Kgm/ZlPw2ju/zjRSGcrorZUNbYbdupnT3vYO53t31oIQUmGpNpnWJt?=
 =?us-ascii?Q?dBLKBJUIPgKK5i3J4snR5pNgxDxsZbLF35nrejoPTEc6PEJmQMkyxph6rfGX?=
 =?us-ascii?Q?qUpWQnBnk2nX9oQpcG1LAUFuUOc7fR1BsdlJpv0AHUWH5pK98Vzawfknbpf8?=
 =?us-ascii?Q?Y3EH1jHxpv7GcnCVfqKkzbJxx4hfNkg6OZrxk+7imux5LU6XS66pvr6lr8xA?=
 =?us-ascii?Q?PvTah+BnvQ+mzTDRYRIM3wHA8uJcVFbicjMna9aewq2Dg94ulVqY0EJQj1aO?=
 =?us-ascii?Q?LHKArpeieRzXhbH+O4GtswNGyN0njsRcsS0bLEziG5ZjHYjt5MSQhY1zmxa8?=
 =?us-ascii?Q?SrGh5SW46LygTAz46FrzClcfv2ArGzKgVk6Zg5Wd9A/LV58EB3SM9DFFDq5E?=
 =?us-ascii?Q?UPoObuaDO2XBscWiAc/bWdfzgiCr2CKbk9ld6U4ETPjvqgvkX/aZ9zBGemrf?=
 =?us-ascii?Q?YHKr4DoWgtrK4fcHtWv9qxmbGAH4BGp+JN8hGOtN82F3uHRvegYXXrHKxfSo?=
 =?us-ascii?Q?iJPf6SEzDute7ni7aJU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2025 03:18:15.2143 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1612cfed-fcdc-44d4-d761-08ddfe3da9d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6465
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

This commit enhances the debugfs path handling to support both
PCI-based and numeric DRI ID paths, improving compatibility across
different kernel versions and configurations.

Key changes:
1. Implement find_dri_id_by_pci() function to locate DRI ID by scanning
   /sys/class/drm/card*/device/uevent files for PCI address matching
2. Modify mm_queue_test_helper() to first check if PCI-based debugfs path
   exists, falling back to numeric DRI ID path when unavailable
3. Support both AMD_IP_VCN_UNIFIED and AMD_IP_VCN_JPEG IP types

The new approach:
- Tries PCI path first: /sys/kernel/debug/dri/XXXX:XX:XX.X/
- Falls back to DRI ID path: /sys/kernel/debug/dri/N/
- Maintains backward compatibility with older kernels
- Handles systems where debugfs uses numeric IDs instead of PCI paths

This resolves issues on systems where the PCI-based debugfs directory
structure is not available, ensuring reliable access to amdgpu scheduler
mask files for VCN and JPEG IP blocks.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c  | 39 +++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h  |  3 +++
 lib/amdgpu/amd_mmd_shared.c | 31 +++++++++++++++++++++--------
 3 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 296c45de8..71b1c5c2b 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1702,6 +1702,45 @@ int get_pci_addr_from_fd(int fd, struct pci_addr *pci)
 	return 0;
 }
 
+/**
+ * Find corresponding dri_id from PCI address
+ * @param pci Pointer to PCI address structure
+ * @return Found dri_id, -1 if failed
+ */
+int find_dri_id_by_pci(const struct pci_addr *pci)
+{
+	char pci_str[32];
+	char path[256];
+	char buffer[128];
+	FILE *dri_fp;
+	int dri_id;
+
+	if (!pci)
+		return -1;
+
+	snprintf(pci_str, sizeof(pci_str), "%04x:%02x:%02x.%01x",
+	pci->domain, pci->bus, pci->device, pci->function);
+
+	/* Search for corresponding dri_id (typically not very large, limit to 1024 here) */
+	for (dri_id = 0; dri_id < 1024; dri_id++) {
+		snprintf(path, sizeof(path), "/sys/class/drm/card%d/device/uevent", dri_id);
+		dri_fp = fopen(path, "r");
+		if (!dri_fp)
+		continue;
+
+		/* Read uevent file to find matching PCI address */
+		while (fgets(buffer, sizeof(buffer), dri_fp)) {
+			if (strstr(buffer, "PCI_SLOT_NAME=") && strstr(buffer, pci_str)) {
+			fclose(dri_fp);
+			return dri_id;
+			}
+		}
+		fclose(dri_fp);
+	}
+
+	return -1;
+}
+
 /*
  * Function to check if page queue files exist for a given IP block type and PCI address
  */
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index d9775fda0..66c2789d5 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -362,6 +362,9 @@ get_pci_addr_from_fd(int fd, struct pci_addr *pci);
 bool
 is_support_page_queue(enum amd_ip_block_type ip_type, const struct pci_addr *pci);
 
+int
+find_dri_id_by_pci(const struct pci_addr *pci);
+
 int
 amdgpu_bo_alloc_and_map_uq(amdgpu_device_handle device_handle, unsigned int size,
 			       unsigned int alignment, unsigned int heap, uint64_t alloc_flags,
diff --git a/lib/amdgpu/amd_mmd_shared.c b/lib/amdgpu/amd_mmd_shared.c
index 95a89d40e..c1f5232dc 100644
--- a/lib/amdgpu/amd_mmd_shared.c
+++ b/lib/amdgpu/amd_mmd_shared.c
@@ -203,18 +203,33 @@ mm_queue_test_helper(amdgpu_device_handle device_handle, struct mmd_shared_conte
 	long mask = 0;
 	uint32_t ring_id;
 	char sysfs[125];
+	char dri_dir[128];
+	int dri_id = 0;
 
 	if (!callback)
 		return -1;
 
-	// test is only supported on VCN version >= 4
-	if (context->ip_type == AMD_IP_VCN_UNIFIED)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_vcn_sched_mask",
-				pci->domain, pci->bus, pci->device, pci->function);
-	else if (context->ip_type == AMD_IP_VCN_JPEG)
-		snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_jpeg_sched_mask",
-				pci->domain, pci->bus, pci->device, pci->function);
-
+	snprintf(dri_dir, sizeof(dri_dir) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x",
+		pci->domain, pci->bus, pci->device, pci->function);
+
+	if (access(dri_dir, F_OK) == 0) {
+		// test is only supported on VCN version >= 4
+		if (context->ip_type == AMD_IP_VCN_UNIFIED)
+			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_vcn_sched_mask",
+					pci->domain, pci->bus, pci->device, pci->function);
+		else if (context->ip_type == AMD_IP_VCN_JPEG)
+			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%04x:%02x:%02x.%01x/amdgpu_jpeg_sched_mask",
+					pci->domain, pci->bus, pci->device, pci->function);
+	} else {
+		dri_id = find_dri_id_by_pci(pci);
+		if (dri_id < 0)
+			dri_id = 0;
+
+		if (context->ip_type == AMD_IP_VCN_UNIFIED)
+			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%d/amdgpu_vcn_sched_mask", dri_id);
+		else if (context->ip_type == AMD_IP_VCN_JPEG)
+			snprintf(sysfs, sizeof(sysfs) - 1, "/sys/kernel/debug/dri/%d/amdgpu_jpeg_sched_mask", dri_id);
+	}
 	snprintf(cmd, sizeof(cmd) - 1, "sudo cat %s", sysfs);
 	r = access(sysfs, R_OK);
 	if (!r) {
-- 
2.49.0

