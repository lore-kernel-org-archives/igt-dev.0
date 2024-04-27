Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6821FC4345F
	for <igt-dev@archiver.kernel.org>; Sat, 27 Apr 2024 04:10:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB991126BE;
	Sat, 27 Apr 2024 04:10:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yo0oPviC";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2048.outbound.protection.outlook.com [40.107.93.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E25F1126BE
 for <igt-dev@lists.freedesktop.org>; Sat, 27 Apr 2024 04:10:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+g+Kz5LeRSdeD772FO+hHHfxHjLycI04B7NGTiVbubC7iarjFJhVksfkb/brHsTv789WNHCPt3wMm2LYeVvcqWHf+Ih60xSEVFeaETy0QtvOSrTJSHEGtWtGgdxpePj7jWspFaNxzBDuqov8hxhtgDQ6VzgRjnbL7hTt6k/uOY1u+1MseQcZdoS0LeistHLF0/mB7A1ESiNNGh1wVb7dJ1y4UrPdl7ymta0uR1wfhQeJWdEOD3yCvT8GoQNYo5CQGdyBX0Y/c5xUbW7MivTmmW+fq6qCwn02cL7cia6SEFxbk6YNUL2Iyn3evITInuffujIkeu6IZIX33iOwRibuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8z12u738t0uTmNRFitZA9Z3Gq+FNVV6QsH7otGJhc6A=;
 b=lZVUB0s6OKG0MqQSuZqwbo/hYJ1V/6HsCwCqgEZwMVeM0vHZCZBMk31eDrGoupEk3tc++5JlbArGAoEK0q8MHAk6oU9UzLmswnNjjwiYEBI8ds9oON1KSLQAsqhWEnHQpFhoI7NaIsQPx8Kn728CVc9c6UucHIs9SkLQPUOmRSIk2WQvw4TWkfNJwYAopBtnEDkbh9qSc3fdptN4kbFl7hME3HqbfJKu0B8SYh1KatYh0iXN7tCNWFVwhvKfkh21Z7/czNsdJ/UB1Eyay5d49eTGvFJhMe2pF2MmUyNvlYulI9x5h2t854Q9/5Qbh5daCMnss8SegNtczSZVwXRGrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8z12u738t0uTmNRFitZA9Z3Gq+FNVV6QsH7otGJhc6A=;
 b=yo0oPviC/u0AMe3PAlICnbx1JND7MS45RqJZpGnN6sW5VXb6psSU9ThcO+x/fthrezGh60r2Sw0+UMfkFEpxXncZg7kXgn6jHAVtDp+KvyDBoCLrESycMx6UDqrADM2SizsMmfdk0c97Imbk2w+DXcYryNYiOrGPWBXMCPpG/hk=
Received: from BN9PR03CA0387.namprd03.prod.outlook.com (2603:10b6:408:f7::32)
 by DM6PR12MB4434.namprd12.prod.outlook.com (2603:10b6:5:2ad::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31; Sat, 27 Apr
 2024 04:09:56 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:f7:cafe::bd) by BN9PR03CA0387.outlook.office365.com
 (2603:10b6:408:f7::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.31 via Frontend
 Transport; Sat, 27 Apr 2024 04:09:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Sat, 27 Apr 2024 04:09:56 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 23:09:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 26 Apr
 2024 23:09:54 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 26 Apr 2024 23:09:54 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jesse Zhang
 <Jesse.Zhang@amd.com>
Subject: [PATCH] tests/amdgpu: improve fuzzing test
Date: Sat, 27 Apr 2024 00:09:46 -0400
Message-ID: <20240427040946.539853-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|DM6PR12MB4434:EE_
X-MS-Office365-Filtering-Correlation-Id: 07358800-3937-4053-88f6-08dc666fe5cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400014|1800799015|36860700004|376005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1/3hfN/nULP+ySDyrEgV5PRwcyPeQU2PaoALZpzmo4V8eg5xrwbOqwqeP+Wu?=
 =?us-ascii?Q?0OffghqA+JDesMiIV7DpNps0HZQYZ7u8kEPb0jFCxHDT2S5uq5iY2IT3UdFm?=
 =?us-ascii?Q?zN+L7ZJfrZxBGYjU3Szi2fspHqTgJLoXhx57B0A0VNyqK7EMOWpT1lJxIyNH?=
 =?us-ascii?Q?EKw7/91Qtr4llbOV3EYuexrqvICNIeWsZ5S4eUqEgfesm24GK36yjCnI638S?=
 =?us-ascii?Q?pMWUNX/MhNJr7eeU6yLga9srM2OBNATUOt6qC99HPNlQi0HAiVYkY5N9k+RY?=
 =?us-ascii?Q?e9T3wbF8KndbSmQFTLQtJDtvRL4X+al8+zFSkZJI+SQPh88w1HLoVId4IlI6?=
 =?us-ascii?Q?kd8nDk/Wla5XKSkdzMXbSFapAeMPfaQBBahIhrUCpwv2lKBsDlXCDl1Px00N?=
 =?us-ascii?Q?mXogWLYrwHAttzNN+jnN8LTR6VbFhsvmlWrwkl1nxkqppHuCcx6u4unozSpQ?=
 =?us-ascii?Q?09ZzXC/mUPIOopnxTPia9QQzMpQiOdXcWhyeGQmygPdDBc24Ow3OUJvvyKKu?=
 =?us-ascii?Q?Hc2B8t/xswIQpm/qZ1Ivsx1bjGnaPTIdcdq+UZaqt1/pv1bD8uZN8wmTLgQJ?=
 =?us-ascii?Q?2JpvY76614KCurJWDvL9JymW1zI8VQOeRYpj5mUptgFRo9s3Vw2p7f3v7Vgp?=
 =?us-ascii?Q?WRXbqa3uQhtbkp61vDUUD/P7vRZex/wAHjI8Sk3SAy1AWxWjSxvBKr9Bsi3s?=
 =?us-ascii?Q?AO6I5onnYIkjLNoNA5lLRb74hZ00iMr5UrX47dbMFiaDEDTBi/mjtSBWbFuy?=
 =?us-ascii?Q?iPojLtazCZqjFS921lwOAmfxSkeE3hB8WcM15TXrS0q9jSGdBRtIBwl7QO8r?=
 =?us-ascii?Q?DquianbnY1kPuk0j4CBb3IQCZkkB4RJiokwo7T4fEgAw28JV8vWx2z5VIT9B?=
 =?us-ascii?Q?85irKpXauGsEP9cyaWvHh/m6w+uIJFikVODr6WTzVRcOVsNgAHFrwx2yRGcB?=
 =?us-ascii?Q?PRm4UlPPnltRXJY0V5jFKAI6iAtKxtZZKQvLeNi1Kk1WDtMstOPu2OUGrJZT?=
 =?us-ascii?Q?W0RJMOuEAsX32/Igc91ev11UQ6M1soXzwMI8pE7kQDCRIHsZeICa7sV6ZPI5?=
 =?us-ascii?Q?WvoR/8u6nxePtLR+EX+UIZ8x/WzgjV2ARdyfmiLVq+sP9eioQPtfDx764gi9?=
 =?us-ascii?Q?FyU7GSETSlTJmlQrrPa7oHNMwNbT4+7YaafIO91gMLEerj4dpUCRhvR/MciH?=
 =?us-ascii?Q?ueYnm4bmYIWQh5q4VJjxDX5jJEJcabBc1DVR9JJ+vvmy0zeJ2u+F19SsQa9x?=
 =?us-ascii?Q?4PRu9Bf5+C3Sr88bLceenIgTHZskmOQZ/236xtBNfbVg665xpUmWOWV0QfP3?=
 =?us-ascii?Q?UzlZhnq1XFq+M6CKDR3NndV2YNiKOu2HStaKt6fi+OkREN51TIFooFDL8ZeS?=
 =?us-ascii?Q?EGX6T22iBnuczxdaPt75zq3hZGZB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400014)(1800799015)(36860700004)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2024 04:09:56.0748 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07358800-3937-4053-88f6-08dc666fe5cd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4434
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

Improve cs wait for fuzzing test by using all possible IP blocks.
Due to some IP blocks being different for different ASICs's the
return code for ioctl  DRM_IOCTL_AMDGPU_WAIT_CS is ignored.

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Jesse Zhang <Jesse.Zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_fuzzing.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_fuzzing.c b/tests/amdgpu/amd_fuzzing.c
index b47b26cf0..b2bba83fa 100644
--- a/tests/amdgpu/amd_fuzzing.c
+++ b/tests/amdgpu/amd_fuzzing.c
@@ -91,7 +91,6 @@ void amd_cs_wait_fuzzing(int fd, const enum amd_ip_block_type types[], int size)
 		r = igt_ioctl(fd, DRM_IOCTL_AMDGPU_WAIT_CS, &cs_wait);
 		igt_info("%s AMDGPU_WAIT_CS %s r %d\n", __func__,
 				amd_ip_type_arr[types[i]].name, r);
-		igt_assert_eq(r, 0);
 	}
 }
 
@@ -160,7 +159,10 @@ igt_main
 {
 	int fd = -1;
 	const enum amd_ip_block_type arr_types[] = {
-			AMD_IP_VCE, AMD_IP_VCN_ENC, AMD_IP_VCN_JPEG, AMD_IP_VPE };
+			AMD_IP_GFX, AMD_IP_COMPUTE, AMD_IP_DMA, AMD_IP_UVD,
+			AMD_IP_VCE, AMD_IP_UVD_ENC, AMD_IP_VCN_DEC, AMD_IP_VCN_ENC,
+			AMD_IP_VCN_JPEG, AMD_IP_VPE
+	};
 
 	igt_fixture {
 		fd = drm_open_driver(DRIVER_AMDGPU);
-- 
2.25.1

