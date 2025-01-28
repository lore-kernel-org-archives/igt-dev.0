Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986EDC0218A
	for <igt-dev@archiver.kernel.org>; Tue, 28 Jan 2025 19:24:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 503D810E143;
	Tue, 28 Jan 2025 19:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tIDkqaRR";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2081.outbound.protection.outlook.com [40.107.92.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B57C10E6ED
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Jan 2025 19:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLTUV29eQdQIZ2DTeZVgJWujX6rV3WuFVkeBteo5TO/VOmWxPKBpf3+xEIyKzKIBlEQVxqxzDwPZneqJe5eYAmI85zMuI+f9DfaPXRrOBDQvUYE6/GEwxZpbi9e6Uf/P2wWMiaHmYyJTzm1LpUOsj5fpZRl6zNnrQgJiC3MbD4rzKXOt5oUfcogRk4YT2e5uJRJD5LNPc6moqMZbNEu5kQIYa/ewmCeRrr5NJvUzFAXNPAQiolh6bdhapJGSYdAJKHsW4poHmkDpxf95Bm/BKUY/og2Ugsw2QB6FoG3F1q2lsgRp3wY4UqGA3GD/8vHe4/4v7r4oXccVnXuhiZfMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MqIDIshLt/gyqyv9inXDH17T9L8kD+o5YmN2BjMiMNk=;
 b=xRK62hk8j2JUF2ZDovdN2h5GQqAaObzv2iVX22Pd7lbdo3Qyy0ATE3B7HF7m3G57atYMJbeck20jjfkj55V5267mViQduL85irE7ZTR/hH821lWGwdpoYt2EWnjoge8/lCBgEXYZwDzZemnF2e2GZW4WApfnih2x2XbzdMD03LvLOwFKCdBx4KqyDjJJT4JXE5B1P0jeWd/Mw1LJ5eBbveLEx5ItdrHLbDtELz9koOR+hYIoywD0sVFiI2H1SySgDcdSv6aZ5QWrBC2ehT8IjkjPD2Hj0zBf+2qzglRsDDi0aQxvrTTB8hJpb5K4ZznX6Nos+Z/pw1sP35ALeEgnzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MqIDIshLt/gyqyv9inXDH17T9L8kD+o5YmN2BjMiMNk=;
 b=tIDkqaRRDhczI11VNikBMVdubXQDsewIKFLv0nYmRgTdwxY4qCnz6HQH+uBfC6GHqU6i7LFUkAPWRIUUkRHO7qtLMaPSf62hhhIBoX6jnLLpbgj9idjulnOShLyWRRGelDuQ/Y5xhwCyCxdsM/9njn8AZxEYkF54Pm1AmlG1Ulo=
Received: from BN0PR04CA0096.namprd04.prod.outlook.com (2603:10b6:408:ec::11)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Tue, 28 Jan
 2025 19:24:46 +0000
Received: from BL6PEPF0001AB76.namprd02.prod.outlook.com
 (2603:10b6:408:ec:cafe::92) by BN0PR04CA0096.outlook.office365.com
 (2603:10b6:408:ec::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.23 via Frontend Transport; Tue,
 28 Jan 2025 19:24:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB76.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Tue, 28 Jan 2025 19:24:45 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 13:24:45 -0600
Received: from AB350-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 28 Jan 2025 13:24:44 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Christian Koenig
 <christian.koenig@amd.com>, Alexander Deucher <alexander.deucher@amd.com>,
 Jesse Zhang <jesse.zhang@amd.com>, Michael Strawbridge
 <michael.strawbridge@amd.com>
Subject: [PATCH] amd/lib: refactor function is_reset_enable
Date: Tue, 28 Jan 2025 14:24:42 -0500
Message-ID: <20250128192442.61513-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB76:EE_|DM4PR12MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb6d009-39fc-42ed-7d2d-08dd3fd16ca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IM/pIwZWcCyysEwE3ldbcwUw9ciTcs1VvOCQdIfhgOmBSFPjiXbhyzneEasE?=
 =?us-ascii?Q?dPQ4uy/0sV3sU4VTGpAU7bBsFh5QDpg4q37F9Ybc8VdZhjMh9mUztrKD/v3R?=
 =?us-ascii?Q?WOhCvY/i8V9EEls7ubpmScbHbbi7/gkgXgTOIhJkElixhpRjfBh6Ez/CwMR3?=
 =?us-ascii?Q?tZzqdXhWpjfVfdb7WMLEA5J7OEwyhIl4zztbQSR3wIAUGqHe+MWLwg/F6tL8?=
 =?us-ascii?Q?A25AaTNIr1YIG3nhg3ItEouWk9rIkxydzRghSfsvpFT7cgWU0Idbch4jKsf2?=
 =?us-ascii?Q?6ZzVNZl15TjUh1ddNYMfFf79zRbviFUGoaq/AgEkocls1o2H/y+/+hYuSDH7?=
 =?us-ascii?Q?8actwXB/qBiVrgh24iGpLThkpVe525W4DNvSoyg99hXwlpULdQfEDw2cPF5I?=
 =?us-ascii?Q?/rb3gvClIJ87CbzzhLM7uNbA0xfKQWOJx3K+/HbdTKnd0WgJrNcv1LLlId6Z?=
 =?us-ascii?Q?cSfvD9voyuDXQnUwY4FgU6e/LAt4SXd4ot1cYnRAK4zeilIobAMW5Nzhsa7F?=
 =?us-ascii?Q?YrF3+Re+9zlWwsKEWxwzBmJRN1KMolnpIcW7RYSeWah2QskX42yPOeLrq37l?=
 =?us-ascii?Q?/Wu1YLdg/1u9u1D+bbgmnrZWZub0gBfbb9Nel/HZ/T8c9JDeC7CyXgXvWupM?=
 =?us-ascii?Q?yUwkZUrsk/wrQNJt8RAka4+Nzgoe4HYJPqwtCzjL7pttdDD8LTBU50NIygPH?=
 =?us-ascii?Q?rK+3b1r9pN9uY3BxvwTeY+/cw4VxK5CwJCym9LfDZd8wWavjk9pWjemaYhVn?=
 =?us-ascii?Q?DX7UiZMyF6NSz5QeRFh2oULksD+7n2l5bk87SC0yLuQt/k1qwxz0vA9/F7lu?=
 =?us-ascii?Q?GXwd7a2s/Ro3yxGG4bpTJ4qNYoQNuvIaspEXcjgA7eSNNLhfhPKLf5yurXtj?=
 =?us-ascii?Q?YuFWBedSobOV1rOcWErxq2pKjfl8sx2HKy9s55zny5ewNqq8Kb/bzKMllf0Q?=
 =?us-ascii?Q?CNEkGVRosRM5HC51xGKOnpO8QM1KTybm/Shwu3EU75OaU27THbz6OPCPIr20?=
 =?us-ascii?Q?effg0IWgr1pUDxBdG3wPNnu7v+XCggSGzibrAuqoUk3Fp/pI6QIogBCY6I2U?=
 =?us-ascii?Q?EQ4Gr7T6678zVT2bvSXrUxU1bt5mzsbiQYCHeTGwPJkr/4UHrPh/XIEb85/z?=
 =?us-ascii?Q?EGZmsYJ7rz98wV7B+ywYU+8bNT7/T+U2vMyoI370ZSszaTSaB5hyk71/CrU+?=
 =?us-ascii?Q?NStKoGbKVVZpHhtQugRHFAaiY8lZIBcaNXW4o7qm2TdfhOfoeKZgpeuacS3q?=
 =?us-ascii?Q?7Qwldv834tDuAJrky1qR40q7aqPVCKeQrCLcOrbRRtv9LlCy4RduwTO8/EtS?=
 =?us-ascii?Q?22LLzAnb4Q5Cb8p6Un2FKZBCBSMrSmU63FrHTGsxy+bD6QxlNn1TqbxrOv7I?=
 =?us-ascii?Q?pd0UQXn9QzpFc/RDmVJNj/zaK/8wPxLj1qaUkmEx48k6rbaKZ3h6fpRcXI+A?=
 =?us-ascii?Q?3tadecJoIzl/YhgE1Fz7nPRADor/fQfrIwkxEZamBBaZuA+1uAlo57I+SbP7?=
 =?us-ascii?Q?xKfMKWXNR3IgSEY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 19:24:45.9262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb6d009-39fc-42ed-7d2d-08dd3fd16ca6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB76.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6447
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
`AMDGPU_RESET_TYPE_SOFT_RESET`, AMDGPU_RESET_TYPE_PER_PIPE
or `AMDGPU_RESET_TYPE_PER_QUEUE`) and attempts to open and
read the corresponding sysfs file, e.g.,
`/sys/bus/pci/devices/0000:08:00.0/gfx_reset_mask`.
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
Cc: Michael Strawbridge <michael.strawbridge@amd.com>

Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 79 +++++++++++++++++++++++++-------------
 1 file changed, 53 insertions(+), 26 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 2b1b84414..f063ad0ab 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -1006,11 +1006,27 @@ asic_rings_readness(amdgpu_device_handle device_handle, uint32_t mask,
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
+		{"pipe",	AMDGPU_RESET_TYPE_PER_PIPE },
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
+	int found = 0;
+	int i;
 
 	if (ip_type == AMD_IP_GFX)
 		snprintf(reset_mask, sizeof(reset_mask) - 1, "gfx_reset_mask");
@@ -1019,33 +1035,44 @@ is_reset_enable(enum amd_ip_block_type ip_type, uint32_t reset_type, const struc
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
+
+	//igt_kmsg("cmd: %s buf: %s LINE %d FILE %s\n",
+	//		cmd, buf != NULL ? buf : "NULL", __LINE__, __FILE__);
+
+	if (buf != NULL) {
+		token = strtok(buf, " \n");
+		while (token != NULL) {
+			for (i = 0; reset_arr[i].name != NULL; i++) {
+				if (reset_type == reset_arr[i].reset &&
+					strcmp(token, reset_arr[i].name) == 0) {
+					mask |= reset_arr[i].reset;
+					found = 1;
+					break;
+				}
+			}
+			if (!found)
+				token = strtok(NULL, " \n");
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
+		igt_kmsg("***FAILURE mask found 0x%x requested 0x%x operation is not supported LINE %d FILE %s\n",
+				mask, reset_type, __LINE__, __FILE__);
+
 	pclose(fp);
 
 	return enable;
@@ -1105,7 +1132,7 @@ int get_pci_addr_from_fd(int fd, struct pci_addr *pci)
 
 	if (ret != 4) {
 		igt_info("error %s Unable to extract PCI device address from '%s\n",
-				__FUNCTION__, buf);
+				__func__, buf);
 		return -ENOENT;
 	}
 
-- 
2.34.1

