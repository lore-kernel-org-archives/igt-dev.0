Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA014C369A1
	for <igt-dev@archiver.kernel.org>; Wed,  9 Apr 2025 07:50:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D67910E7F4;
	Wed,  9 Apr 2025 07:50:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="dHA8R9VW";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2069.outbound.protection.outlook.com [40.107.223.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D927810E7F4
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Apr 2025 07:50:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O8lnJCfwDD4I4mXDRAm2+LcRXgVviSMYwHqzEeVUqMmX0zsSKn0TAv3hyitFz+GRjfxmNyyMV3pE+ap79zklJaJhEle/LEGCFrkCmlar+yeKgwjU+rGddMTKm6d9Fi7+u0rdvk+yxMFaR35FRaf9JofVBZa9y634wr3IARW+zITMo3xqB5IxEajTfpr6A1SfEl3N4wGbgJIJZWEeZ8RCp6ucsLd1G399Psd/FD6pSDz3TZzqQ1fmKb8PPjrDu7sH3xsRFzcz20veyepHaCuAQQahafGYM9zB8On/106aTVia5yeA7TJeEqeWiTF7/j0xQf4LR9M+Bhg6LVcZaSCElA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yW+VdzIYWcuR50c/UcKkh60FT8j+QgQ6N1uFblmN/x0=;
 b=lgZ5XHLgOqaLxLrZ7k8sS2fOYVmOapprod5xrw4IW666RjDC+wv10FlSKEiHkw3V1QDnRiGRf3Gqa80P/taagRu6rHHvs1+q/kOsmzv4/6v5zklHy7ooFCmMz8QJ0ddgO1f2q9OVSgisya2dFcsbuFiPFIyYq5M0D//n1PjbjOQdijyPYgiiMqlySqiP3VXVHkY0R8F0kTfx+CZtxhMulBW2jnp9UIg1OFCUbUIquCko3FvnukgyqHp74t1zEMLquMhREi4eJpuYJhGUBk6xXpYuNAKp+UNNPvhhjzN8R/UaIxdrejdFByUt7k6TozNDNA2uSILynqVWLVz2VuHXfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yW+VdzIYWcuR50c/UcKkh60FT8j+QgQ6N1uFblmN/x0=;
 b=dHA8R9VWD2QqUdT0pnOabiU9LHAM/SEryJSkFmgqXXgYvBRZabA2VSR9X/0SoJ5ujvlHHuJPn3K/dOnrgKA1HrNFj35GeW95MearSqs+T2RrtB5+aIK1vCP9SmFPORteCfrRvcb6lbp9FEY7Knm6oCFZylI6hWIGRdjEs2MtfkQ=
Received: from CH2PR11CA0010.namprd11.prod.outlook.com (2603:10b6:610:54::20)
 by DM4PR12MB8522.namprd12.prod.outlook.com (2603:10b6:8:18f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Wed, 9 Apr
 2025 07:50:36 +0000
Received: from DS3PEPF000099D7.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::b4) by CH2PR11CA0010.outlook.office365.com
 (2603:10b6:610:54::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.22 via Frontend Transport; Wed,
 9 Apr 2025 07:50:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D7.mail.protection.outlook.com (10.167.17.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Wed, 9 Apr 2025 07:50:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 02:50:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 02:50:35 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 9 Apr 2025 02:50:33 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 <sukhatri@amd.com>, <prike.liang@amd.com>, "Jesse.zhang@amd.com"
 <Jesse.zhang@amd.com>
Subject: [PATCH i-g-t 2/3] tests/amdgpu: Add secure UMQ tests for GFX and
 compute
Date: Wed, 9 Apr 2025 15:50:29 +0800
Message-ID: <20250409075030.2501714-2-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250409075030.2501714-1-jesse.zhang@amd.com>
References: <20250409075030.2501714-1-jesse.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D7:EE_|DM4PR12MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8093c2-f44a-48d4-70f5-08dd773b36c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4ouuaF9G7/qbDlRnu8t4SuT3u0D1PE+trfFzjAjhYJfIa+6lBDYU1zr/uwqL?=
 =?us-ascii?Q?kW2Mx2qZh24DvYVp2GpGgvPBLpv6ER9fgFKI9Qh6vXa9w08bMnwUrHXJ0ZLK?=
 =?us-ascii?Q?fXjHJTzVp4xryG8XuO08qlf3eyMokEwSrtHw7rHTCN/pV0IH9h366P2ckbKY?=
 =?us-ascii?Q?NVrl1cwdCDcocdSclqXGOfaAoXPnN60iLW1FB2stwvZZ8/orCE/fazQRvd3c?=
 =?us-ascii?Q?+8x2yFiO/7cJwSaLN5xaenDiQt5bH7S1hUnpk639JvDB+KblDeREUXdm4m1n?=
 =?us-ascii?Q?i/fdEQA3NpzfM8MIfrGt0aifo7o9yM7NNAOwPxCBGXOveycAdMrE0uUmorRn?=
 =?us-ascii?Q?YOeFgFbMkjfJl5f2zTRJL5908RlKMcL0O66EBQuBHbAGgTVGNK+/yreGFijj?=
 =?us-ascii?Q?HttuB2uH/WogvOEq/YS2IhobuIwUS25SL6JOZjIEMhlyHVqnAC9nTyUkw7Kl?=
 =?us-ascii?Q?G/L7LZMv7HeKQ9OKFDvTXh+P0AhohBAxs10fmy6M4U32IFr0XmwffUO7OEET?=
 =?us-ascii?Q?7xHLEQc2WD464l+9E+ggMBbP4IYJESxVNZE1jwTrbx9YvcwKxjOvKFVa+SNH?=
 =?us-ascii?Q?ZC7lBF3VTexnbQfC4d65kzsUaPIaH8ubLH7QH1/vYBTv8RxfAV7pgAgBtNqB?=
 =?us-ascii?Q?A/d/jpCMsuHkjonqxebtKgjXIoNZTUZ6CxSu+QIjseJN1vu7W59XQ9T50IbD?=
 =?us-ascii?Q?awkbO4agPrwzGph/kLBGthtTWCeSWVYU8XizdFzrzpVjBnWtWgq8R3vBqfqF?=
 =?us-ascii?Q?RazZJMJVYxqyGrW2g5hKPA+lC5kOrHZ8SGdPnczQlJskdSW6Lv4pbijNH4i1?=
 =?us-ascii?Q?+2IHm48w3vJtnYxtcULcJHAG8cLzzB7/w1DyZu8tgtN5HLzrmvAjWwNmjDk+?=
 =?us-ascii?Q?PAD8BVwMEtI9OHVwE4P1q07UtxGjD1rCjBQsN+Euyik2oKGKy/ufvNWOik79?=
 =?us-ascii?Q?rNgBiYFzgpMO0tFk34kBRVR9MTlEm7n3pVd+pA7iw65ZXGcT35HunbWkUfd8?=
 =?us-ascii?Q?uBsUiUVXMeQdcxtNQGzRmNpZPE7ninO0OQqwcIXq2GvyJDeTmRuzt4KDQbbp?=
 =?us-ascii?Q?LH8nRFg6DbQ7FKO3eADJt+fbeEai0JwU35L9i8GfA13pEhvJ8qWn+2+Z+wix?=
 =?us-ascii?Q?AyDUjH2DnjTS3uEAvopWpIMWW1wc3w0cmVrm2mR2woj+R6WjtJkwfhhYx7Qj?=
 =?us-ascii?Q?0ZmrjM1HPPVU6Pzd85fdtmdoQIWWtVMhhh2iYNVCF3SaZsjJqgeT5uZgxlnd?=
 =?us-ascii?Q?fP0XlatvRRCrkgM0Uu1xnjZnTp5Sslx58DID2NRJ410oARhvWy+CAAQqTRjF?=
 =?us-ascii?Q?mECy64IwtSXoqJMm3SWakK5dDiyLErRF/nL320KT2g9QYpOYVMcA1IQ+CEH2?=
 =?us-ascii?Q?KT58CR4aN51vihE0kYekqVGdj7eF8GjWdn7OBu1kS4kMX3T4fzU0axE0MCBd?=
 =?us-ascii?Q?Y5cB/Vh/0/znU+EdmHN2tOXqBPkTa0jFbs5Y3h25Yuco9KuLhYKbbix3w2qJ?=
 =?us-ascii?Q?jnhCQ275c+QkuHTfMSGpFpfbw9yg4bCR61x/?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 07:50:36.1160 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8093c2-f44a-48d4-70f5-08dd773b36c4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D7.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8522
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

Add new subtests for secure user-mode queue (UMQ) validation:
- gfx-write-linear-helper-secure-umq
- compute-write-linear-helper-secure-umq

Signed-off-by: Jesse.Zhang <Jesse.zhang@amd.com>
---
 tests/amdgpu/amd_security.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tests/amdgpu/amd_security.c b/tests/amdgpu/amd_security.c
index 19baaaea0..737e6201a 100644
--- a/tests/amdgpu/amd_security.c
+++ b/tests/amdgpu/amd_security.c
@@ -354,6 +354,18 @@ igt_main
 	amdgpu_secure_bounce(device, fd, &sdma_info, get_ip_block(device,
 			AMDGPU_HW_IP_DMA), is_secure);
 
+#ifdef AMDGPU_USERQ_ENABLED
+	igt_describe("amdgpu gfx command submission write linear helper");
+	igt_subtest("gfx-write-linear-helper-secure-umq")
+	 amdgpu_command_submission_write_linear_helper(device,
+			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, true);
+
+	igt_describe("amdgpu compute command submission write linear helper");
+	igt_subtest("compute-write-linear-helper-secure-umq")
+	 amdgpu_command_submission_write_linear_helper(device,
+			get_ip_block(device, AMDGPU_HW_IP_GFX), is_secure, true);
+#endif
+
 	igt_fixture {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.25.1

