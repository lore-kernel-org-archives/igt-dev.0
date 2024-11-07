Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A378D29FBC
	for <igt-dev@archiver.kernel.org>; Thu,  7 Nov 2024 02:05:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41F1C10E218;
	Thu,  7 Nov 2024 02:05:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SOhwZT9p";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061.outbound.protection.outlook.com [40.107.237.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D6510E218
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Nov 2024 02:05:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhtMAiz13/qSeKc+IixOx/hyZi17LBYkhtP0LVR9qAYffI7N1BH9BmKWKFqT5VE8b8/h59EQzzuMRA6eVDMNqR36AE/1u/cLiP8yIQDTwviPZeEVZ22FCSruwllnPSFc0OL3qzCHmMtDd/cvvbujEGn3D7SQ74xM4RyKG+k9hGKY7VOY1ONBQEg0Xo8kH/E9ilOZnXOV2o6kIrFNVpPF397fl2cbQ/uOJuRnhTMMGYDSEs4C+g/F5xrR0UB1C7lASkGxKqMQK7kPtysekOhdo3xSI6F+pqJM7Dfgj2LfVGOflaK2cUydSgz0+leEJRdKfws5xAZiOcQO3C9dD773cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4qByevrLDgW/ABbhiPtd86EwkqGSzsryn99206gYAnU=;
 b=yDs5832NKyWH+LMuYyBzn/RU02d+dipwrFl78iOWW+jEwE4aq5tWLUR7bgOn5k/W8VJ/ToKrbO8Y2vJVrgsVYJV0AgAJDPotso9/GciTM/wjeCnSPDLb8/G69f0r7qXtochO6Z63+iH0r2mcXlirnWcm84jpjgyapa7+rXn0kQQfmeGb0MJldnxGsAym0SwCciYGSbS56CzPENcKyYicex+IoQpFucnD4wu1rAeGaxLchNU3uomYUZQsn868qgwgcHPsxxelA+c4oaCDtTxqAvLYg7YV18MOmJ+GbzCCKHvMyyMSm4MxO78rTNYDd/Jt6OX9Ttyx5Vf/Bm46teI83Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4qByevrLDgW/ABbhiPtd86EwkqGSzsryn99206gYAnU=;
 b=SOhwZT9pzyY2w4rBX3x6es6eAlT1xWiIW4a0jZj12AZuoz/toSfd80DUZRu0XM/PXP1b0hSGhSrHPDLCckD26IP2NLZZxYTb2SUKWIre2lY7xukzRb/qKUT+mecnziirWvZta9pgo6MmCDdisW1YevbYF/gSbC7WP7LBpPlcB0s=
Received: from CY8PR12CA0072.namprd12.prod.outlook.com (2603:10b6:930:4c::15)
 by DM3PR12MB9325.namprd12.prod.outlook.com (2603:10b6:0:46::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.31; Thu, 7 Nov
 2024 02:05:36 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:930:4c:cafe::d3) by CY8PR12CA0072.outlook.office365.com
 (2603:10b6:930:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.20 via Frontend
 Transport; Thu, 7 Nov 2024 02:05:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8137.17 via Frontend Transport; Thu, 7 Nov 2024 02:05:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 20:05:32 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Nov
 2024 20:05:18 -0600
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 6 Nov 2024 20:05:11 -0600
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/4] lib/amdgpu: add gpu reset check
Date: Thu, 7 Nov 2024 10:05:07 +0800
Message-ID: <20241107020510.350132-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|DM3PR12MB9325:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f70c246-065b-4b25-e1b5-08dcfed0ab38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+BL71TDuniIzSPE2CSx153gQzV3wh4Phsygtey01GPCmQ0ilkcJjqCItkY7m?=
 =?us-ascii?Q?rAjjmZr48xvWh+Lv2yFNbKUJ6aL8VftE+HRMAFNzOioafMU1ZZRa9VWEijQF?=
 =?us-ascii?Q?UNhOyHh20npIBvSiz/fAT9txz7s026OzWMMyK7o5YqMUsIDOeEKPI1MxllS7?=
 =?us-ascii?Q?UuRy3Syrl2YA5nKkyoJkUfKVIIK7+QKCZMZgs1MqxaiE58Pfzgeg8keDXf6l?=
 =?us-ascii?Q?W7qMIpYO0W9RY8KtS3JRFQ0MNeUs0+YNB9kRZyBWxVggyXwEw9BkWgNf0SVB?=
 =?us-ascii?Q?VQ15H+CepNdz6G3Mt8de7vnZTObD1+NQxVd9bLqx/pHbpvPU1M30UmGm+xMz?=
 =?us-ascii?Q?zyzvZVK7jj0sznXsoJWwNDAEYj6Psg28d82niyOSLxnspOJY6unKbicqaU6h?=
 =?us-ascii?Q?Yl1Pn0pBKzKhhhxFapEb2mMnh3aQ7FHLCmRS3bMjTkUfl6ucpWOXG4cSrRQI?=
 =?us-ascii?Q?cf04RAqb4qCcKDejy4O14hRHn7EWIH5n8WRjWjo6XJPHrENJ517IbNhdjRIg?=
 =?us-ascii?Q?mXtTqKvbtEn2jmi8zOGiWKOXC3Wtehpeu5RRp9MvmlzZvl+v/NZ5leqQmzc2?=
 =?us-ascii?Q?TzzVsbEtaP6uGGvdZT10V7aKGdKw0wajUepGtcTZCV5vEWR6olJB54HA/e4/?=
 =?us-ascii?Q?sas9U0KU3YYRLKVbAv5aNseAFQVM1K/4XSbbAJ7nsaq3gj6OA3ZuRYIzb2iQ?=
 =?us-ascii?Q?ZV0ZcKMALkZWtJ6llhWjLahrVpkL5TNPEVjmD9/8TCmx5mY/dOoAp1Ydc5mA?=
 =?us-ascii?Q?OQ1oIpzlsPtPNmGnDq2iCID6g/1sj5hGNqMijvby47gd3r0WG4uWBB9TOtUk?=
 =?us-ascii?Q?NKrdZhJd6ICmK7sGCsdE3hAZAhHSSP1SUI64DY6d8d3uegR4I9izb2g3CiI7?=
 =?us-ascii?Q?POMF9mGfhws3n9iNl+eYRDHZvAHKA87M3jbHGu8mfpCCvPbUuxHMoeMfqFGs?=
 =?us-ascii?Q?U5qN29QlrTGruG3WtAr7xbx0GdeK3rFMHqRgn5jd1MbRQaL9dlD0QqtU6fkl?=
 =?us-ascii?Q?ifLluh0eNxthn40ZYHfLr3Vdhh5zZYiviNcGJIuOC0TuibuHfdn4z0anW0HF?=
 =?us-ascii?Q?mzgPtCR8h5eMMs/1Vl1JtSP23DAGF9/lZ2g+2cuXWrWdzN6Y52gY4HXLTmy/?=
 =?us-ascii?Q?Vb0Tw0WZP7Z3QrUyMs98Pf4RjKMpLY21DPRhqaMyX/K8JcF4roP+YhhWxdta?=
 =?us-ascii?Q?HRwolmIyFH2Vkexk3ByZhkAkt5Zy8xgc+B6L8keQCiicyulzcyvv51geUB/5?=
 =?us-ascii?Q?DgZVQD3vdTssEzi6rIN5SgN7AA1iMPMzPho0qXS/90v3gv96zqFTapctKt06?=
 =?us-ascii?Q?V+W+vGD/tXee1H/Jk161j1+l1+un2JHWHOaalHLkmGCsDnw/vGDoJHvrS7ES?=
 =?us-ascii?Q?s+RrXTRZ+tX/0NTJ+4AYvFVmba9KF/ecNiBrZpPcPsPVE6p6cw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2024 02:05:35.7802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f70c246-065b-4b25-e1b5-08dcfed0ab38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9325
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

GPU reset types include full adapter reset, soft reset,
queue reset and pipeline reset. It is possible to check
whether a specific reset is supported via the sysfs interface
and run special cases for testing.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 57 ++++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h |  8 ++++++
 2 files changed, 65 insertions(+)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index df603618b..40db28d8d 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -995,3 +995,60 @@ asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask,
 		arr[i++] = is_rings_available(device_handle, mask, ip);
 }
 
+/**
+ * is_reset_enable:
+ * @ip_type: such as gfx, compute and dma.
+ * @reset_type: includes full adapter reset, soft reset, queue reset, and pipeline reset
+ *
+ * Check if reset supports certain reset types.
+ */
+
+bool
+is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type)
+{
+        char cmd[256];
+        FILE *fp, *fp2;
+        char buffer[100];
+        bool enable = false;
+        char reset_mask[100];
+
+        if(ip_type == AMD_IP_GFX)
+                snprintf(reset_mask, sizeof(reset_mask) - 1, "gfx_reset_mask");
+        else if (ip_type == AMD_IP_COMPUTE)
+                snprintf(reset_mask, sizeof(reset_mask) - 1, "compute_reset_mask");
+        else if (ip_type == AMD_IP_DMA)
+                snprintf(reset_mask, sizeof(reset_mask) - 1, "sdma_reset_mask");
+        else if (ip_type == AMD_IP_VCN_JPEG)
+                snprintf(reset_mask, sizeof(reset_mask) - 1, "jpeg_reset_mask");
+        else if (ip_type == AMD_IP_VPE)
+                snprintf(reset_mask, sizeof(reset_mask) - 1, "vpe_reset_mask");
+        else
+                snprintf(reset_mask, sizeof(reset_mask) - 1, "vcn_reset_mask");
+
+        snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/0/name |grep -oP '(?<=dev=)[0-9:.]+'");
+        fp = popen(cmd, "r");
+        if (fp == NULL)
+                return false;
+
+        if (fgets(buffer, 13, fp) != NULL) {
+                snprintf(cmd,sizeof(cmd) - 1,"sudo cat /sys/bus/pci/devices/%s/%s | grep -oP '%s'",
+                        buffer,reset_mask,
+			reset_type & AMDGPU_RESET_TYPE_FULL ? "full":
+			reset_type & AMDGPU_RESET_TYPE_SOFT_RESET ? "soft":
+			reset_type & AMDGPU_RESET_TYPE_PER_QUEUE ? "queue": "pipe");
+
+                fp2 = popen(cmd, "r");
+                if (fp2 == NULL) {
+                        pclose(fp);
+                        return false;
+                }
+
+                if (fgets(buffer, 13, fp2) != NULL) {
+                        enable = true;
+                }
+                pclose(fp2);
+        }
+        pclose(fp);
+
+        return enable;
+}
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 109d36602..337ef3c25 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -14,6 +14,12 @@
 
 #define MAX_CARDS_SUPPORTED 4
 
+/* reset mask */
+#define AMDGPU_RESET_TYPE_FULL (1 << 0) /* full adapter reset, mode1/mode2/BACO/etc. */
+#define AMDGPU_RESET_TYPE_SOFT_RESET (1 << 1) /* IP level soft reset */
+#define AMDGPU_RESET_TYPE_PER_QUEUE (1 << 2) /* per queue */
+#define AMDGPU_RESET_TYPE_PER_PIPE (1 << 3) /* per pipe */
+
 enum amd_ip_block_type {
 	AMD_IP_GFX = 0,
 	AMD_IP_COMPUTE,
@@ -212,4 +218,6 @@ amdgpu_open_devices(bool open_render_node, int max_cards_supported, int drm_amdg
 void
 asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask, bool arr[AMD_IP_MAX]);
 
+bool
+is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type);
 #endif
-- 
2.25.1

