Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8C2C02188
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 01:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B19F10E322;
	Tue, 28 Jan 2025 01:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NAYD25LE";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB5610E322
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 01:01:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AeG2d6sMIUY/E5AdY1d9IsT80TJlRV1Ul0wr08DTWXGQiRWI1zjcrQ+6sqQyuqAg8OCR0AySL+bQavay1Ir+Xpe1erM6vrgh+NRlktGMoFqKf0dFCyL6IbOBuhKSH4g2VQS6UNNF+w/nT3Yo9ljdMBrBBxFYO9T/B9Dr6Slr+SX08eU8bVyHOcVEybMN6wKGmmmMf+mOBesOMpMvC87E7QuWSWc4+GDTyZz0pxD4UnMVUB5Z8h7dGh+fK/rFUc3fKVmVhLS7WsSgWzoBz7OXbDftSGwwyCfUPEEQCSIUJ1hiLv3bUL1pD+PjOHXvNGSztQRJzSuo04ustHSkJKPx5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+ezu3COVpVXIEJ6Ab1nb6GN1spYAZGUpSvtYe5L4DM=;
 b=ur9H9BKoRYujYR6pPGn6o40CbIlolCGQ3B5Qtwsp3SjPXtM1gins2UYc1FC817o5xV2MtapUrFEOkdUQ8K7jeIUEANWnTnkv7StF3tRpV+orjGzsWexhIX5nRBhKhx9Ud2ZsL57uPzz8AcKHxtambWf9Kfocg6H50zPsZpbc48itr4difhBmxhaqM6nelQFZ0x6HMVIfh0znl+W2gmfN3rRWfCcjwhuvzaWmaYOt8VkaU7PSqtuGiLcCJduBuEG0NtpO9afxripjO5ao51ZNnN3b02Ven863PTxDKB/eRnVc7wI22cdCS3zO6Vgbirqxi/zbYH/XYup9s11pl6kaAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+ezu3COVpVXIEJ6Ab1nb6GN1spYAZGUpSvtYe5L4DM=;
 b=NAYD25LEX1MMB+0DD/UIfkE62RqzJ8P6HX4e9J31Uk8OD/6atd9vy7JFgzmKmE/vV4y5MeAnzTa3vHam136nIYOdUwSygA2SsWw0npUIJXvs4dV9m4G+wMDkOlzyyFdvlvx26DWyXcSTHtoDP67LAEAFGO7FIMrIzK4gYaqtAs0=
Received: from DS7P220CA0036.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:223::24) by
 SJ2PR12MB7964.namprd12.prod.outlook.com (2603:10b6:a03:4cf::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.22; Tue, 28 Jan 2025 01:00:57 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:8:223:cafe::d7) by DS7P220CA0036.outlook.office365.com
 (2603:10b6:8:223::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Tue,
 28 Jan 2025 01:00:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 01:00:57 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 19:00:56 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 19:00:56 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 27 Jan 2025 19:00:55 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] amd/lib: refactor function is_reset_enable
Date: Mon, 27 Jan 2025 20:00:52 -0500
Message-ID: <20250128010052.113824-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SJ2PR12MB7964:EE_
X-MS-Office365-Filtering-Correlation-Id: 7144dd68-ff69-4f69-4a06-08dd3f37394f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2/a8U1Z/KgyrNE3OJY31RPh+/Jy2oVM2eSATH5H8RFFCJHCVMav8sFVXckKz?=
 =?us-ascii?Q?UZt7uY99h229AtD2MADrSu9NUXnvcrUwnx0pkSbumkvnFpZLP1Lg4WM0xO9k?=
 =?us-ascii?Q?tudoEl2IbQA0U7ohPGPZD49abESdqm9EDcCbh4ki223j7oEODUtGMtFpZ0X8?=
 =?us-ascii?Q?T7tBWvW+GQpLsonRuRtu/f+fL63pic7f2g6OdQvRTp67hwyIEvCpDgCz0IRB?=
 =?us-ascii?Q?zLmE8A7n4q4HF9WUXfsQrMsyA5MC7cLPN8gYD4c8yg4wm5UNh0ING152FW7K?=
 =?us-ascii?Q?SMdYSQybfZefllUEiezosbFZNdEMWEUXTy04kwHFRfBH3yxf72/iQzEYPEpk?=
 =?us-ascii?Q?3Sx18u6EbbDvr3sLdwnoTHFydMjvvUxcZGp7jK36Ton2NWEeWN2QFQTeqBQn?=
 =?us-ascii?Q?QeDGK0GfsQQXAXbKaFm21vrf+nOTjQJRaL5TkK/Csw7OWrpUCXR/GlP+pRMa?=
 =?us-ascii?Q?RAgPK+Wa6fKouo0QvQGFNHUxGCkY9Sgdkegy95PJJwSTq4dkRRl1/VjLAlH5?=
 =?us-ascii?Q?qNSdBmLzBlpVIBXLIWGAcIRQejZTJjvB/tpJ+ICvAdg1gL0dGP+t1vBdgdbg?=
 =?us-ascii?Q?W2XBwPGLmOAQ5gzb3kjA8IkxIhCmcLVn9M2FeUyCLJcc4Qw/FcRNSJ/TRBLO?=
 =?us-ascii?Q?oAk8UKC9L9Ox4k0ocROcOOk55AH4piWjBVW+HYBzmk7jn9hHrLNH5Qfu7pr/?=
 =?us-ascii?Q?Ebk1knpTIhK2eqcBpGvnH1aIZ4HxrqzFasR1LO3Nku+yL6Wxiznf4k4nBZe/?=
 =?us-ascii?Q?Melw6mHb0dlGJsf8MmtnyFpFVjjBfHWR1Pm2H3ZBb2rYL/97Rkw2Qlt0xYFK?=
 =?us-ascii?Q?43EQAGT77YM2CYQ1hem5XUaONXs5W8qKai7xKsLrkpnuZK+GPTO5jVc1r+w6?=
 =?us-ascii?Q?yMR9XGtuSofCFTd5F1sMVAN0B43hDZJn1X70Mys5/0ORaKpX/Nn9xCrxFDQa?=
 =?us-ascii?Q?DT+vNP88kjJ2/PXvEFyWtTrCpw6GuIpZ5TxLEJQtPWUfDcvYiVFqe7YPO7gt?=
 =?us-ascii?Q?vA37b/UpovYVuxN3jkgIymKCHVade+jggGtUlDtsJOsb5hJWwzidQ7JfPneB?=
 =?us-ascii?Q?7eUsI4zXeSuy01SyggSRB09uZuNsLpdoiKrTp3DfQWyvsnT0qckzxh4MY77a?=
 =?us-ascii?Q?FwBCfTR06aXNjn+Oqlf8U5eV4/gwbbuxsvHla4CvJjMk/dxABfIP0SnAtR6i?=
 =?us-ascii?Q?HvyrlPBfXJhA9Ixr/xfvK9QiTya8iCyPwzULhHPybVAzhdj9f6vN3smw1sH3?=
 =?us-ascii?Q?2m/ASAS6oa8LkGFYb3yVUQoa/uxB/yUAE36E5aGilBw3wMQUDxIf+ra5W/if?=
 =?us-ascii?Q?4HT8aLqBx8vCtBuh7DBDTcrpJTgjSqx7gLovnits0iIPwf0JYqOnmV0PHiXh?=
 =?us-ascii?Q?0n69HI8zpCg5aFIx6AeVMq46yUf8NF3sjWOwmU9U9KrB0NFBrsx4l9iUbwks?=
 =?us-ascii?Q?r/3ByZ7MUzUGaxWfyJnanI7vf/U7zgvrkpwvwWwi07gmuoExSDXu52DMvvad?=
 =?us-ascii?Q?jfUJ6OsxaIu+bts=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 01:00:57.2633 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7144dd68-ff69-4f69-4a06-08dd3f37394f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7964
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This function takes a reset type mask (`AMDGPU_RESET_TYPE_FULL`,
`AMDGPU_RESET_TYPE_SOFT_RESET`, or `AMDGPU_RESET_TYPE_PER_QUEUE`)
and attempts to open and read the corresponding sysfs file,
e.g., `/sys/bus/pci/devices/0000:08:00.0/gfx_reset_mask`.
It then iterates through predefined keywords such as `full`,
`soft`, and `queue`, validating whether AMDGPU exposes the
requested operation. If the requested operation is not available,
the test is skipped.

The previous implementation included redundant steps and failed
in certain cases. This refactored version simplifies the logic,
improves reliability, and ensures consistent behavior across various
scenarios.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Alexander Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 71 ++++++++++++++++++++++++--------------
 1 file changed, 45 insertions(+), 26 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 2b1b84414..8df37df37 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1006,11 +1006,25 @@ asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask,
 bool
 is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struct pci_addr *pci)
 {
-	char cmd[256];
-	FILE *fp, *fp2;
-	char buffer[100];
+	const struct reset_arr {
+		const char *name;
+		unsigned int reset;
+	} reset_arr[] = {
+		{"full",	AMDGPU_RESET_TYPE_FULL		},
+		{"soft",	AMDGPU_RESET_TYPE_SOFT_RESET},
+		{"queue",	AMDGPU_RESET_TYPE_PER_QUEUE },
+		{NULL, 0}
+	};
+
 	bool enable = false;
-	char reset_mask[100];
+	char cmd[256];
+	FILE *fp;
+	char buffer[128];
+
+	char *token, *buf;
+	char reset_mask[32];
+	uint32_t mask = 0;
+	int i;
 
 	if (ip_type == AMD_IP_GFX)
 		snprintf(reset_mask, sizeof(reset_mask) - 1, "gfx_reset_mask");
@@ -1019,33 +1033,38 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
 	else
 		snprintf(reset_mask, sizeof(reset_mask) - 1, "sdma_reset_mask");
 
-	if( pci)
-		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/%04x:%02x:%02x.%01x/name |grep -oP '(?<=dev=)[0-9:.]+'",
-			pci->domain, pci->bus, pci->device, pci->function);
-	else
-		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/kernel/debug/dri/0/name |grep -oP '(?<=dev=)[0-9:.]+'");
+	snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/bus/pci/devices/%04x:%02x:%02x.%01x/%s",
+			pci->domain, pci->bus, pci->device, pci->function, reset_mask);
 
 	fp = popen(cmd, "r");
-	if (fp == NULL)
+	if (fp == NULL) {
+		igt_kmsg("***FAILURE popen %s LINE %d FILE %s\n", cmd, __LINE__, __FILE__);
 		return false;
+	}
 
-	if (fgets(buffer, 13, fp) != NULL) {
-		snprintf(cmd, sizeof(cmd) - 1, "sudo cat /sys/bus/pci/devices/%s/%s | grep -oP '%s'",
-			buffer, reset_mask,
-			reset_type & AMDGPU_RESET_TYPE_FULL ? "full" :
-			reset_type & AMDGPU_RESET_TYPE_SOFT_RESET ? "soft" :
-			reset_type & AMDGPU_RESET_TYPE_PER_QUEUE ? "queue" : "pipe");
-
-		fp2 = popen(cmd, "r");
-		if (fp2 == NULL) {
-			pclose(fp);
-			return false;
+	buf = fgets(buffer, sizeof(buffer)-1, fp);
+	if (buf != NULL) {
+		token = strtok(buf, " \n");
+		while (token != NULL) {
+			for (i = 0; reset_arr[i].name != NULL; i++) {
+				if (reset_type == reset_arr[i].reset &&
+					strcmp(token, reset_arr[i].name) == 0) {
+					mask |= reset_arr[i].reset;
+					break;
+				}
+			}
+			token = strtok(NULL, " \n");
 		}
-
-		if (fgets(buffer, 13, fp2) != NULL)
-			enable = true;
-		pclose(fp2);
+	} else {
+		igt_kmsg("***FAILURE fgets %s LINE %d FILE %s\n",
+				buffer, __LINE__, __FILE__);
 	}
+	if (mask == reset_type)
+		enable = true;
+	else
+		igt_kmsg("***FAILURE mask found 0x%x requested 0x%x LINE %d FILE %s\n",
+				mask, reset_type, __LINE__, __FILE__);
+
 	pclose(fp);
 
 	return enable;
@@ -1105,7 +1124,7 @@ int get_pci_addr_from_fd(int fd, struct pci_addr *pci)
 
 	if (ret != 4) {
 		igt_info("error %s Unable to extract PCI device address from '%s\n",
-				__FUNCTION__, buf);
+				__func__, buf);
 		return -ENOENT;
 	}
 
-- 
2.34.1

