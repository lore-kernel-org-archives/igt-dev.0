Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CAD3E77188
	for <igt-dev@archiver.kernel.org>; Fri,  3 Jan 2025 08:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9E6210E258;
	Fri,  3 Jan 2025 08:17:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YaOwW/Ia";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2087.outbound.protection.outlook.com [40.107.94.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DD710E258
 for <igt-dev@lists.freedesktop.org>; Fri,  3 Jan 2025 08:17:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KW9fDqdb+lNcIEn0j1zf7n3xvz8lJZh7XXY2fhjr/fDc9omve00qLTuTOVwDetXD/8JPvt8DPhqfDOaKA39M3nIZBIQQEPdDDEPL9AINTmzu9i8gGrwBFYwNTq1grhkjHY/s/EYtSAuj2R8jfBGLqleP1wL1xIKYKdwTs2/GhZhX09YTfiq+1PCuCNTQWDRj9sMJ281FBWrmm5MGKcFW2PgbHPqDHLP2Qcva4/icZk63WzcTxvbvdQ26K/zWZDAsI0En+rbSfLecWM2QsDL1r5P/W0LsrUA4KjdtXqGs4TmD5FLxQtCVgGkUsVH0ysvKHfy4beC5Vzf1K2pQdu+YqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4FkZsAXpB8AMq+WeIDqzDU6nUcc2vQPGq0p3znL6pQ=;
 b=l15DzRi0bRE6BYi2HXvLPOGD6GKqY1+wGEAEpGuI+7f8OWejjsS314NLuSDn4krZMtCWYaf/Nx5MGcr3fpD2+Gxj4z+vc+DAZNU2n0UStjLAGFNlnUEQ1zhEDdwLV9poZRbofZtNwsXklCjvlNknyM5VaJTLOn/4qQq3NSMZ4NAQeGncOFLxcd4uEanVUncLSaoiZTOsYpcoOXlP6QoUR+QRlB2E4Qlmu82onp7nXtWjhd9rBlBS+ukL9MchrtbpJzpZulQh/xTeMdfk3aLxHLDmceTQt1G7uWSZrst0YeC2y1fTpFIMPgF+hyLrP3Yisiq+7nJA1RSjnZVsK6x+6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4FkZsAXpB8AMq+WeIDqzDU6nUcc2vQPGq0p3znL6pQ=;
 b=YaOwW/IaQJsZ0Da5riZnR08fisG4UbRgFYmDU04Y/6Chf/wvu4MWvV/5EAR9rN96PK16I1hygMCH9v4s+nO8i55aBlrG+dpCVU/kvjDQ7buzex59TtB3u76uTKDvPM8e8zaqKdxjWk0WoxVdROl2C36eNPSLhzfKqvmZN9u59d8=
Received: from PH7P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::28)
 by SJ1PR12MB6100.namprd12.prod.outlook.com (2603:10b6:a03:45d::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.20; Fri, 3 Jan
 2025 08:17:44 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::f0) by PH7P223CA0002.outlook.office365.com
 (2603:10b6:510:338::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8314.14 via Frontend Transport; Fri,
 3 Jan 2025 08:17:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Fri, 3 Jan 2025 08:17:44 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 3 Jan
 2025 02:17:43 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 3 Jan 2025 02:17:36 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>, Jesse Zhang
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t v2 2/3] lib/amdgpu: Extract PCI device address from file
 descriptor
Date: Fri, 3 Jan 2025 16:17:33 +0800
Message-ID: <20250103081734.2338675-2-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250103081734.2338675-1-jesse.zhang@amd.com>
References: <20250103081734.2338675-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|SJ1PR12MB6100:EE_
X-MS-Office365-Filtering-Correlation-Id: 52cab08d-e792-4ee5-8c2a-08dd2bcf1990
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Zj5V15h7879bYhY1hlEhc1sBN4mr4wZU+/BdQ6tP2KLpfK9F1Q60WllgMw2J?=
 =?us-ascii?Q?N770bUj2U2UXr0THPAFuZKC15aOZM90zcMlQ3VtmFXamyaB+YlmOKuvsqqC6?=
 =?us-ascii?Q?/wGFjqPXFmWxz3xAJVYFswbrKx7AkfvU+CRVYRYvRVx2lI/S/jfaDnt1hdn+?=
 =?us-ascii?Q?WhMPd3LF/D6k8djFuamZSHsIWkyroq44xE4qW/66usP6IN7oZP0cnj/fLCRa?=
 =?us-ascii?Q?+JlrZB5je+u7PUJYdlqRLDdrLbx5M9IV8ag8aBU/0/6NymYWKfpK0SIxAKlo?=
 =?us-ascii?Q?KV2tkHsabxNIAyPsxHiCO51W/2yP5yU5s+UczJSpHyu5fyRF8cRuYBCRY1eU?=
 =?us-ascii?Q?UAQ9m8PvljESkZ3GLdw0Mq4vebl1NnTY20zdjfXwi8lRBIURGcb/Dhi37Fmf?=
 =?us-ascii?Q?4p1dpNGRgF9DigEQ/RKfrNGLqsWbwHLr3Lhtw9KRaR1nDGgwgb+dVHLItk4E?=
 =?us-ascii?Q?YjCR3Qpb9WTbuuSsYff6LPmlIkBVVDfyKHJ6IwNKQl73dvKtx4vKpSaqZ2mJ?=
 =?us-ascii?Q?56IebJ3j0rk87dnTjSJdH7CSaOFWgTm+hMKiv6QS9hGmBD5uMb8CVjooMttj?=
 =?us-ascii?Q?WnVDkptxcG3XtIzPdJU85MZcx/TGQ5wKHDZtUQAMp8AjoOBEer4PwPN8bb0u?=
 =?us-ascii?Q?bakIwU6Mocs6znBuYNGD4r6E/76YHNNB0JnXGCBe+1LCWi9ozrmHirYlmQh6?=
 =?us-ascii?Q?Vzmq5CgqWQkTEi2JgqIWPmqjn+MtM/Qtb/aidfPV7t3iFfF/TvyI3acj1Xsi?=
 =?us-ascii?Q?6jci/aDPtyahApoU5UlLqdBna7dzvX4RZato7TrdeAYibaefqdkdWlEGHDLS?=
 =?us-ascii?Q?uWqFEBb1ER22ckBWvA6UmLWks4XTfarA0rtmEZtSRl6aEQl36BLx/ge4efk9?=
 =?us-ascii?Q?qNZy+m3qahJuLC6WAUoXHQWvA/2mPYT/MXDdKTrKVN8YD7kYhMsfpxoy7w6Q?=
 =?us-ascii?Q?6KPCvX0SIlX3IhARZRJBqbGsVSCZpgmXC2FdBmWUZ3oSInbfo4+tfJAsfc45?=
 =?us-ascii?Q?pd1JrVHswJ0y1OtEM3YdZxs/HjFoYb4nq+HC3HhXN9aXWVW6JyJyybVyxPfC?=
 =?us-ascii?Q?i5sDeh++q8igYNV6GCAE6f7h9BUDQdpngrzAyvehW//5COEeED/aIRqluccz?=
 =?us-ascii?Q?8xYOXhAIGtw3ZMAspLGS8gi4NKyR0UPBpK1vbypO9EF6j7Yd5mQvPkmdUsyx?=
 =?us-ascii?Q?IeXsBrb1ClLf2wffelOk2uaWnczsEDCin4C7k1lvdDHgf6Wx/emRohW8CN/m?=
 =?us-ascii?Q?KWsM7fGZIspuOsvOEdCdhTGtkfcOElnBbAaylCY9X1vYPcK979LawFS3GXNQ?=
 =?us-ascii?Q?hZXMhCIQifRHOimyn3lnBd3zT8JSYsmnl4QrbYDN3fUe+uGdNyE8eouW/PQ4?=
 =?us-ascii?Q?V7aPsOZHFlV8NGpgsBzd7Cs5PUggsFsayzwnhCFJFXv7tTHV6NB77taLs6Z+?=
 =?us-ascii?Q?MVC+4gRrTTv0yleT3xY1BpK47Db6xM2mRrimDppeIFeKHxXFd9eOtHyhSCTr?=
 =?us-ascii?Q?wfmmNPU69TLaPHs=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2025 08:17:44.1887 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 52cab08d-e792-4ee5-8c2a-08dd2bcf1990
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6100
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

From: "Jesse.zhang@amd.com" <Jesse.zhang@amd.com>

Get the pci domain, device and function number from the amdgpu device's fd.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>

Suggest-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Jesse Zhang  <jesse.zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 64 ++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h | 17 ++++++++++
 2 files changed, 81 insertions(+)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index cc4163bfc..05e6e2622 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1047,3 +1047,67 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type)
 
         return enable;
 }
+
+/**
+ * get_pci_addr_from_fd - Extracts the PCI device address from a file descriptor.
+ * @fd: The file descriptor to extract the address from.
+ * @pci: Pointer to a pci_addr struct to store the extracted address.
+ *
+ * Returns 0 on success, or a negative error code on failure.
+ */
+int get_pci_addr_from_fd(int fd, struct pci_addr *pci)
+{
+    char path[80];
+    struct stat st;
+    char link[20], pci_path[256];
+    char *buf;
+    int len, sysfs;
+    int ret;
+
+    // Check if the file descriptor is a character device and can be accessed
+    if (fstat(fd, &st) < 0 || !S_ISCHR(st.st_mode))
+        return -1;
+
+    snprintf(path, sizeof(path), "/sys/dev/char/%d:%d",
+             major(st.st_rdev), minor(st.st_rdev));
+
+    // Check if the sysfs path exists
+    if (access(path, F_OK) < 0)
+        return -1;
+
+    // Open the sysfs directory
+    sysfs = open(path, O_RDONLY);
+    if (sysfs < 0) {
+        perror("open");
+        return -1;
+    }
+
+    // Read the "device" link from the sysfs directory
+    snprintf(link, sizeof(link), "device");
+    len = readlinkat(sysfs, link, pci_path, sizeof(pci_path) - 1);
+    if (len == -1) {
+        close(sysfs);
+        return -ENOENT;
+    }
+    close(sysfs);
+ // Null-terminate the extracted path
+    pci_path[len] = '\0';
+
+    // Find the last occurrence of '/' in the extracted path
+    buf = strrchr(pci_path, '/');
+    if (!buf)
+        return -ENOENT;
+
+    // Extract the PCI device address from the path using sscanf
+    ret = sscanf(buf, "/%4x:%2x:%2x.%2x",
+                     &pci->domain, &pci->bus,
+                     &pci->device, &pci->function);
+
+    if (ret != 4) {
+        printf("Unable to extract PCI device address from '%s'\n", buf);
+        return -ENOENT;
+    }
+
+    return 0;
+}
+
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 337ef3c25..dc4d87151 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -8,6 +8,13 @@
 #define AMD_IP_BLOCKS_H
 
 #include <amdgpu_drm.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+#include <fcntl.h>
+#include <sys/stat.h>
+#include <sys/types.h>
+#include <sys/sysmacros.h>
 
 #include "amd_registers.h"
 #include "amd_family.h"
@@ -183,6 +190,13 @@ struct chip_info {
 	amdgpu_device_handle dev;
 };
 
+struct pci_addr {
+    unsigned int domain;
+    unsigned int bus;
+    unsigned int device;
+    unsigned int function;
+};
+
 extern  struct amdgpu_ip_blocks_device amdgpu_ips;
 extern const struct chip_info  *g_pChip;
 int
@@ -220,4 +234,7 @@ asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask, bool arr[
 
 bool
 is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type);
+
+int
+get_pci_addr_from_fd(int fd, struct pci_addr *pci);
 #endif
-- 
2.25.1

