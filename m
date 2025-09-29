Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D69CAC5B5
	for <igt-dev@archiver.kernel.org>; Mon, 29 Sep 2025 08:35:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B1910E3C3;
	Mon, 29 Sep 2025 08:35:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Mqj5mLhn";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013000.outbound.protection.outlook.com
 [40.93.196.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F4310E3C3
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Sep 2025 08:35:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VetrDaCRVSh8sSff0DQ28515lVYQtyG34Vb1xNL1Ih5XVH6Yut71V0TmtyzaUcWp4uptkYuzVsnJPFXBH1SNAzQQzzItOa4ilZvWobf3S3Ontuw99sP0YNjjXryZ7brG6x8ndhM6GAiEjiUOxqOAcuO8Nlz7qHBJnHgnbRx59x3lg8bcfM/+q3KFAHEk0KX/QS6fwqiFbilS8bO8IOkWG2p3hywxKSUzXqXVMOOkPX1W/MazSsLIhvbZdmv0uS+LXLG9x4OpbculrrcteJZbsrqrI+W/oEAxPmiuhvO2nmchvQxTe8upY/sDAw1kmLe+CIynQpSk5B6FQYEv9NBr2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmSImGYNfIFQJYvaDhoE9bZqNcfUSNe3d7T0UsEnR5E=;
 b=jKmzQGKBmAufC8PFZszYKOyQScmRWMDwLgkrxYhkfAlq03KTEAtVYQCS7Hf7jTOXNm52yCSP9or8F3OguGgqtwPGwT+YVaVpCdJtlzQWmAmhkOW+4movfSguGJcmaObQ8pW7IC6efTeLRhwMjen0IN7hceNYEqW1kxFAcJUi9vof/d3QbEEIasS9MOv4eiRNACYP/jM/YUmLLZIClnFRQ72jGiFCIoslCB9TjVeGMutN/cW9glMHbe2z7Ij9spMw+IBAYKV6Dog8Ysy9TLlUH0sPxWI+PTue44Ca1jnvjIh1Uhz2Zbm/tDUladgKI/uWF0U9tt/bk7mA4yaJWHAJSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmSImGYNfIFQJYvaDhoE9bZqNcfUSNe3d7T0UsEnR5E=;
 b=Mqj5mLhn9ty4PAJzp6sSq8rEheU8m8cTUY8wcGjslGkIV2d1Cex6VyhM4l072Sxu7QAvWXPwxBYaySXCYvoIZ/4PAVwtfkNAGD1y52uYxueunKWEDlzNfE3c8emGFOg98LhIrKzAxjlNSlyZIsMRXS33OUHwY91xLLSrekbGK38=
Received: from BL6PEPF0001641C.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:11) by IA1PR12MB6041.namprd12.prod.outlook.com
 (2603:10b6:208:3d7::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.15; Mon, 29 Sep
 2025 08:35:35 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2a01:111:f403:f903::4) by BL6PEPF0001641C.outlook.office365.com
 (2603:1036:903:4::a) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.16 via Frontend Transport; Mon,
 29 Sep 2025 08:35:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9 via Frontend Transport; Mon, 29 Sep 2025 08:35:35 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 29 Sep
 2025 01:35:25 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 29 Sep
 2025 03:35:25 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Mon, 29 Sep 2025 01:35:24 -0700
From: Jesse.Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse.Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH V2 i-g-t 1/2] lib/amdgpu: Add dynamic DRI path detection for
 debugfs access
Date: Mon, 29 Sep 2025 16:35:13 +0800
Message-ID: <20250929083523.3181081-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|IA1PR12MB6041:EE_
X-MS-Office365-Filtering-Correlation-Id: 85003bed-b08d-4816-feb2-08ddff33291d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vjCaUl9kDuhX2snxd5Pk555CJmiCFemzrRqsVACm4hDy5+VcIJmca75E37aw?=
 =?us-ascii?Q?Jp7Sy7J+StiWcH0GT1V7L940IMYo2hXfA4Q4oZzZzpNsGVhmEEyDUXpLKTaP?=
 =?us-ascii?Q?RRueBgKsunhDcGhCIblL+ZswbGspNEl8z0Nl6g/gu+ZxTluvZbUgMGELNoD1?=
 =?us-ascii?Q?Etj7DpQ7lySt20U6EMBmeoAcWgTWFi8MIDRDPZlpDjP6UePBjjwwB0h7jk7L?=
 =?us-ascii?Q?eyHiqGFE2zy4F94TOcQepEtRyaZogVhzwZ4fK70iq2Pskb/t9zamRzInGASr?=
 =?us-ascii?Q?RFKQ0ukEB0njc95F6HpYUBm3TD6Hd3/5png3YSr9fHem46ROaIeYuOcLHYSu?=
 =?us-ascii?Q?HhyxYmCkXfVNGpgXLnKKpEyL2mYIH20rCP73/RM20dYOTSo3gBg1BXyTZB/c?=
 =?us-ascii?Q?KiaYcZa3HwlFTYAUH4xPnw/CF2TVzMVGOfZao/FdJJBcxU4sd9eLV9vwExhO?=
 =?us-ascii?Q?CMklWcr0DgPJc/zwBC3OldEhGjKFr8FUDWyMgK1uMEiGwnJmK2nKbMsfYORG?=
 =?us-ascii?Q?z2G4KLtWjB1pa1Nf4vLMQGUOGqtelP7VWBPlh0cGipofTNV4VmUf4XuDIsf0?=
 =?us-ascii?Q?ob/JN1ae02N/5NndmzRleWOfzRpagD4DtcarRcrafWuYJOio15NB4UYCcpM2?=
 =?us-ascii?Q?piPuxGQBPGevfjXaSloeFbn/vtf/XWQhkPuwZefyO/knua+czP1NHS/l46kd?=
 =?us-ascii?Q?5CIHI4UDI+ttfzTBzCG3T84LbPYtE7sdi5u15nuCnTHyHfv+I8KuiQyFBbph?=
 =?us-ascii?Q?IAUJUBPlam9FaBZJRa2vK4DOFahxQCmLaulEZWBbyP16WV2fMQp7hrZfaG+O?=
 =?us-ascii?Q?rMQZOrhI12BqHAvtEnpOO0RSroTQcQnA/vAvKHo6aF927CQkT4hWr9jw27RY?=
 =?us-ascii?Q?KuiI1mo4oLfOxCzPl0sBllzxHVD6gam9Pu2/l4EuyMyWoU1ehOXBLXyPn9vK?=
 =?us-ascii?Q?Kjk5NZIpJ6sc0C63vbqnFTSm8hoFxyFirmspfX1+JIPek9GQJBUp2XGqZUIH?=
 =?us-ascii?Q?WvCs+Va628I2GZhWg237ofDuDDef7k7W2oQJxJwSGvvO/MyC2+GQ0Pj3qb+H?=
 =?us-ascii?Q?lUJo975Az/lTMOo5WzwgenA7M68AzFron82tk2Sife8v4UbIqzBxc62gvoB1?=
 =?us-ascii?Q?SB7X1qqzcnCEszpl9xA2tCwMr3Xd64e9F2xfzjRstqtxovcmQRbPKAVoRHBc?=
 =?us-ascii?Q?cGNkwmbWdlBqsS/rhDBNbFc5dHDSbczJm/ACFy/LwFI1b4GsZwTyhXs8OGWT?=
 =?us-ascii?Q?Pq+7nK/Dv319qH/Igu2d4kHccjj0nIYtSMNKfKmJJH8BADqOwFyFQr9nHoaT?=
 =?us-ascii?Q?k1ND3QlAgWl0RaBja/0BhFFbNhUWnq/BjOZy5f+pcGkmd9Aa0GBC1KE8jktb?=
 =?us-ascii?Q?gTBk0t8k4jDRuSb6VjvvdrkXrLH0x7H+bryUYDsHofXwrcSI4VLFoXPGN9FR?=
 =?us-ascii?Q?D7JEJ2qUeJkV9/pW1urwf6KSTcrUjXp/zARcBG+anA6ERfe7ggnQehiKs5jQ?=
 =?us-ascii?Q?ojn4zMzLEsxR/CJ+HqT9/SXE0vNWrSrw56Kb7gUvnz8anu9VIGHZS4yBdibk?=
 =?us-ascii?Q?ojE/bCdJ7gpz1HDeK20=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2025 08:35:35.4280 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85003bed-b08d-4816-feb2-08ddff33291d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6041
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

v2: When sched_mask is 1, skip setting sched_mask

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c  | 39 +++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h  |  3 +++
 lib/amdgpu/amd_mmd_shared.c | 39 ++++++++++++++++++++++++++-----------
 3 files changed, 70 insertions(+), 11 deletions(-)

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
index 95a89d40e..f504db596 100644
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
@@ -233,14 +248,16 @@ mm_queue_test_helper(amdgpu_device_handle device_handle, struct mmd_shared_conte
 	mask = sched_mask;
 	for (ring_id = 0;  mask > 0; ring_id++) {
 		/* check sched is ready is on the ring. */
-		if (mask & 1) {
+		if (sched_mask > 1) {
 			igt_info(" Testing on queue %d\n", ring_id);
 			snprintf(cmd, sizeof(cmd) - 1, "sudo echo  0x%x > %s", 0x1 << ring_id, sysfs);
 			r = system(cmd);
 			igt_assert_eq(r, 0);
-			if (callback(device_handle, context, err_type))
-				break;
 		}
+
+		if (callback(device_handle, context, err_type))
+			break;
+
 		mask = mask >> 1;
 	}
 
-- 
2.49.0

