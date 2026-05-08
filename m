Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329F5CD3445
	for <igt-dev@archiver.kernel.org>; Fri,  8 May 2026 18:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7F310F58B;
	Fri,  8 May 2026 18:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yYWRb/UF";
	dkim-atps=neutral
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011056.outbound.protection.outlook.com [52.101.52.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D3010F58B
 for <igt-dev@lists.freedesktop.org>; Fri,  8 May 2026 18:15:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SsVsAJgAE0hT8VgJ/D3RQn1B0N9MsDCNnH+xyplQLXaO2jRp7bAVuEXmHkj+W+/w0qoW0x43L4qb5Fpy1d2m+tHonzPGzjIfmXze80Iz94lEjaOSSgar0R2zEep+v9t3LAr87bS6nvJmi1ttkGKv2MAQGNIWgy1SuGxLm6TVoVuMS7p8xt8SF4rjg8I8/oCCUKj3c0L+xVpKrPfTF+8l1+XH+nfJt5Tmj39cbRrQm6HvuTNEEuY8Wv/KDsKZFvEWxuQ/HcCULunSYco5yUVKT+6Z5+dnqrNMpM+zOSo/AtIBCEXiOe9MV2+5m+Nb2CTmFyv5L7+Sa5g7VWKdxKPusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iW8x0C//luMHHajE+eg55sA7HtcrDE4Vmut9xN71suE=;
 b=lkhd4+MTVc91zlJOmQC6Jx2BfREyiHUTomlD6BK9kpE7euNBSaz24cgKVedGwOBJ6kzWlkmZ+x1OBuHKh0d0I1IbhcSIsw3xMY7qggwbzF+vhl1Hx4T9P0qS/cVJ4ScMHG/L0fFLVYvf/30Rin5tS//mBvpgcNe4TjFPnMGlh2OoNEWooR5efU61ehu+EhU87GwcgQEr0ldtuH/+TPcxDRG2CmjvviAQIVGxLoOvzIkoOrrUR/Q5Wis5mp0EhF93wwVK+JUmHWHmuosYnbjd9sRnVZEJKrf53InNcN14iEjJfp5K2W7AT9H3rZalDh0gA6BSvjOxYn4p9YXoQ8xj5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iW8x0C//luMHHajE+eg55sA7HtcrDE4Vmut9xN71suE=;
 b=yYWRb/UFrxLwFi0MLjVg4AV0FyPnGCpVolH+h0KBfOL0KQgrdh5EtwglDGmNP0Wfa1vN6lyHLLY7eCc4I/UPbVEHkisObNVc1G739bN08BcCylH8TB8cEHIVa6Lnjkl6xRZhRVBjZ2Fc4E6LHvFZEs2RanRVzorjFrBynQ3EmQc=
Received: from MW4PR03CA0058.namprd03.prod.outlook.com (2603:10b6:303:8e::33)
 by PH7PR12MB7914.namprd12.prod.outlook.com (2603:10b6:510:27d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.19; Fri, 8 May
 2026 18:15:03 +0000
Received: from SJ1PEPF00001CE0.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::e3) by MW4PR03CA0058.outlook.office365.com
 (2603:10b6:303:8e::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.19 via Frontend Transport; Fri,
 8 May 2026 18:15:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00001CE0.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Fri, 8 May 2026 18:15:02 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 8 May
 2026 13:15:02 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 8 May
 2026 13:15:01 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 8 May 2026 13:15:01 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Michael Strawbridge
 <michael.strawbridge@amd.com>
Subject: [PATCH] tests/amdgpu: temporarily skip amd_fuzzing_sysfs on Polaris
 and Vega20
Date: Fri, 8 May 2026 14:14:41 -0400
Message-ID: <20260508181459.36546-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE0:EE_|PH7PR12MB7914:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d9f8bfa-c9a0-4087-747d-08dead2db96e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: RrUHTroemK0/5AKgfwoWZmq/4Tg/+UgI9+j6SU6jRd+ozPTJ1v6cBTP2df2skgMdT45JDmbcsOau8qrI7eh/GZ7ktD2t6TlbNCOxad4SQ4VgDkdj0mh9WFeZlR8lNT1c7hlHPIQfGWfK5+vjWHTF8qX9mMtmTV0OL9ZKEJ8m57w6pA1t9Xlk+5HjJ56vf45xglXc7qMO4g104beQz7AT0qnmDR7O9dHxefplnD9TiyUN0FNNhQtsMKVNUYubyhj8TynH+P9oHrV3KaJjZPq2E20CghwqcjmfnFBDgVp4hoTd6IsRY6iOC78gBNsK2xVWk1tftKb8rCU8Wvk3dAC2K7X8UqIReRmXSFC51TqOm8U7DyVFCCJB6Kfmjj1XcErGY4StQtxenM7L1Gd/pafSsbWAKegNba4LhoqKU8gFJaWGRVdraXo24grr3iDdGCo8aotw+TMXyhujtegLmtGcnYpI/ZpHkd6sdjtO24SnsKGZ9O+fkymUWrkJkbrHQUHnbWr5O6ol0ISMNDKDHpy/KfRja06BK6/DlWNjQwLYtDWxO6nDVW4p+NS9kbR/RT1ASBi1VsiIyS4HdVVDm9bV78sRvB/TXQqVbwwWypAuCFsh09jlTkGoz98aFH1HZv9AslV2iFCf31sHw32M/WgFVsK+w2SlBy/Ya2BaY+QCh4LaDdUerxpKpEDqu8mxzhVzskdzZXXDNPSYcefB2KxzCfhKrSztDv63alBhzZ+T0sI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: +slN3FD3qGR6u92sXApZbXJPFMnHfAX/QxJy154LWHLRr86koUhDnGJOjps/ngpOwPfpt3e/pPpzqRv7lHZDhzFDDQeC++1K6cGvlqbHS9pUzKfMGYRkVsl35ddQtWBOohjuTk9R2ML2Q3kRgdPtlP9KVrvHdGVrWddEjBXt0DFeKja3jkxpNTpj0nXm2Ote76XKr0E0SBtfmisxBCDzL0CgvO3j0DMWyKHFuQoG7sd6Vi0gKZzQYCCpPEk73thMIWT6RvYtaXlE/mHtyY27vRMeD3Lqipc+qX88zAXm3RzhWzBARuLXG71mXetAnQ77zZjab3lXwwb/7U2oHj7RNWSXKOGdNpFg+pO/ymDEdzlzOWB3sdu/UhAT5T46XgHNSrs9qkoEY7uSKmFffeXh7EaGucqOulHixHW11MA3HEY3nzkt9ZNKnw2RONmFs1Qr
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2026 18:15:02.7995 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d9f8bfa-c9a0-4087-747d-08dead2db96e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7914
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

Temporarily disable PPTable fuzzing tests on Polaris (AMDGPU_FAMILY_VI)
and Vega20 (AMDGPU_FAMILY_AI) ASICs while kernel-side robustness
improvements are being reviewed upstream.

The test writes intentionally malformed PPTable data to exercise kernel
error handling paths. Some edge cases in the v1.0 PPTable parser's error
recovery paths are being addressed in parallel kernel patches.

This skip is temporary and will be reverted once the corresponding kernel
fixes are merged and available in target kernels.

Cc: Michael Strawbridge <michael.strawbridge@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing_sysfs.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/tests/amdgpu/amd_fuzzing_sysfs.c b/tests/amdgpu/amd_fuzzing_sysfs.c
index a9b53ce81..b02f3b7ce 100644
--- a/tests/amdgpu/amd_fuzzing_sysfs.c
+++ b/tests/amdgpu/amd_fuzzing_sysfs.c
@@ -28,6 +28,8 @@
 
 #include "igt.h"
 #include "igt_sysfs.h"
+#include <amdgpu.h>
+#include <drm/amdgpu_drm.h>
 #include "amd_sysfs_spec.h"
 
 #define AMDGPU_SYSFS_BASE "/sys/class/drm"
@@ -722,11 +724,33 @@ int igt_main()
 	char card_path[MAX_SYSFS_PATH];
 	const struct sysfs_file_info *file;
 	int card_found = 0;
+	int fd = -1;
+	amdgpu_device_handle device = NULL;
+	uint32_t major, minor;
+	struct amdgpu_gpu_info gpu_info = {0};
+
 
 	igt_fixture() {
 		card_found = (find_amdgpu_card(card_path, sizeof(card_path)) == 0);
 		igt_require_f(card_found, "No AMDGPU card found\n");
 		igt_require(getuid() == 0);  /* Need root for write access */
+
+		/* Open device to check ASIC family */
+		fd = drm_open_driver(DRIVER_AMDGPU);
+		igt_require(fd >= 0);
+
+		igt_require(amdgpu_device_initialize(fd, &major, &minor, &device) == 0);
+		igt_require(amdgpu_query_gpu_info(device, &gpu_info) == 0);
+
+		/* Skip test on Polaris (VI) and Vega20 (AI) due to known PPTable handling issues */
+		if (gpu_info.family_id == AMDGPU_FAMILY_VI ||   /* Polaris (GFX8) */
+		    gpu_info.family_id == AMDGPU_FAMILY_AI) {   /* Vega20 (GFX9) */
+			igt_info("Skipping fuzzing tests on Polaris/Vega20 (family_id=%d) - known PPTable handling issues\n",
+			         gpu_info.family_id);
+			amdgpu_device_deinitialize(device);
+			close(fd);
+			igt_skip("PPTable fuzzing not supported on this ASIC\n");
+		}
 	}
 
 	for (file = amdgpu_sysfs_files; file->name != NULL; file++) {
@@ -758,4 +782,11 @@ int igt_main()
 			break;
 		}
 	}
+
+	igt_fixture() {
+		if (device)
+			amdgpu_device_deinitialize(device);
+		if (fd >= 0)
+			close(fd);
+	}
 }
-- 
2.54.0

