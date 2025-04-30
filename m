Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F01C369DC
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:37:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6A610E6AC;
	Wed, 30 Apr 2025 01:37:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Grm/z2Fz";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062.outbound.protection.outlook.com [40.107.243.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6DB410E6AC
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:37:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=atDvDyE9274x58CDg3AeSxQxllR7p56juwlNlAqymrOsxn4ucO28QT/yHmpFuFndPFKnG+U/JuWAvax7hxSZhbXIjypVKtdljqFQoQl9um/draU6m/Ir3+OMIlo/r4N+dwbV3ITih9vJX0rY+lkflbV03Qlcl12URBEmb2Ff8aHLZ3yH4s+RhqOOcJcyFzYU8XT2ugC2GN4lmk6FqwpIV2OfvVNWF77ikYbJN36TDNqTwUD2IWCpy0wv0DONzIfgVgd4vh+I0kidteLmF7birNFPcJyFEy5hisp9YLwunVdmKeRwm/Lj3F0QFw2vP4YlCoBNvhO90Kxc90bK6vEAjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiFTY2YLmV1LRVrrERFGLeSG2tQJr+Z47+fHunHGOkI=;
 b=jMHNKPFcgCtk0jNqYbUHX7SOIyh+D1HVBdiWGlQBFVfLUkyLz/M6b7o64VRA1a1NERoU9WQv8fkMGEXXuJinnJu5mrrGren3qjVo/+Wu8u0yoqzR9KNlfi3b8+31ctNZGGmcKIz5qNxzVcwEsa/WXRwgJpiTlzwX9SMWmbOn9rm4UGTP6ldtlPL/7W9NGOZmsZSf162MZh57Z6SpRsa0wAiHcJ6U99sK0mv2emZiBsxQlQkx2ysZq47cDdzPiqeT+pObZE48hPGiTthP6EGbyfRF0OcNfV2Pjr/xZUEXk5G5qMxD3DlDUl697rdwDhifwWEca9t1P9xSYY3hHU+7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiFTY2YLmV1LRVrrERFGLeSG2tQJr+Z47+fHunHGOkI=;
 b=Grm/z2FzaldhGK8F9Oh2jlMAPuhaU9yKnVfCvjUDF6+P2X2Ard93Ak3uFxF1u+TqjNwMOVAcsBe+hsb94QfA+HZ9bJPK27UZv+2trwuzsWRcX5Mh/3SMYsQUIsHPNPB8n9JEmJf+gy1RLR8s3p0MV4gKak+X0ZWQe6DHVQki/D4=
Received: from BY5PR17CA0027.namprd17.prod.outlook.com (2603:10b6:a03:1b8::40)
 by CH3PR12MB8535.namprd12.prod.outlook.com (2603:10b6:610:160::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Wed, 30 Apr
 2025 01:37:13 +0000
Received: from SJ5PEPF000001D5.namprd05.prod.outlook.com
 (2603:10b6:a03:1b8:cafe::3b) by BY5PR17CA0027.outlook.office365.com
 (2603:10b6:a03:1b8::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Wed,
 30 Apr 2025 01:37:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001D5.mail.protection.outlook.com (10.167.242.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:37:12 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:37:11 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, Bhanuprakash Modem
 <bhanuprakash.modem@intel.com>
Subject: [PATCH V8 09/36] lib/igt_kms: Destroy colorops on exit
Date: Tue, 29 Apr 2025 19:34:27 -0600
Message-ID: <20250430013454.226910-10-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430013454.226910-1-alex.hung@amd.com>
References: <20250430013454.226910-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D5:EE_|CH3PR12MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f2c35d4-da78-4464-fac0-08dd878787f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KohFgse0K8sH3muyD7GeO69z+O74Gpj+HlTl9StjgIOmV8+CmwZEWA57m/br?=
 =?us-ascii?Q?HS5rvts/vraX/8n2SvG48iYULLgxOKtgz05CDyjIE43dWtSy2+tf5T2za/2k?=
 =?us-ascii?Q?PV2HE3piEcl1rtFX/ls5EOWr6RlTzEzAVwsGFxhipqTSB1PJ1A+1XimnFSc/?=
 =?us-ascii?Q?zHPNDAHs/NoWFy9fDlgqa3j026khUwMHIqWf3/PcCfMhdtlf1sMKsqPswEcS?=
 =?us-ascii?Q?JFoBaggSCO3Bq/946DtMqeTNp+ACTcrTZbxARK7tvb6mClOyNSLCJUXqeJ/7?=
 =?us-ascii?Q?uWBqkXkgqefvDAxaBZVLKH9+wUvYnRIuMMxbtzcKTlxeRdF8LnhC7NP4lp8m?=
 =?us-ascii?Q?OR0zpQ9oEe4M6QyKnoVDguu9pb9WHpNv6PHmhR2H4GPMowxsZFf7XeIwyaKt?=
 =?us-ascii?Q?azYZDLHTEjYIwZCwDtoO+DG7bbU8hcVb6TA9bK1cMNluH0GnqvdSQ9GFnpf/?=
 =?us-ascii?Q?EG67IW6MYTMaHfCkmkmQpvAhUrbWn2wMFC8xs8lAm/DDrEasNN4o617qFKVY?=
 =?us-ascii?Q?SeJkuo/JQW71RmwoCB1EhSs0shuuw2vIqHKo5yHILBAQc60soe+d3kcqSZ+f?=
 =?us-ascii?Q?XvuJOB7wBQGN5RSlmvXQksLJcsVPYu5zhJjd5RqtsZxrbB57fLMFs5/9l7yY?=
 =?us-ascii?Q?kOM/aPS1tVGQeH+wY/fl+4kU1wKWoMWVMWowJKb3OXk/+zMluyPwgxOr7DZT?=
 =?us-ascii?Q?dH2w8Wck5vyqiTi76m1dycY9dR0ljeDQ4LELrNzalKfO2YQRM9RNGPCQhtuQ?=
 =?us-ascii?Q?+g3wF+LJ17OFKGBhyc5920HStlLbDOEg7+5fyh5U1iVmNUZplnb76bjgJtUk?=
 =?us-ascii?Q?2r11CTXV4kWiwHXqImChx0OeiCLuxujwCSoxMGozWLosQl+hf3AEn+jquTkK?=
 =?us-ascii?Q?EmImgAS6Tqvo7zeKpMjV7ZrkSOIHSAVhT6VpKIH3ryYHmv9dr6F/6Ir0S8hO?=
 =?us-ascii?Q?qGUnYZ+BtgO3f8+n3OLcyjXJl1Md0eK3+C64f2Hl030Hf29vPvdwnmk764vT?=
 =?us-ascii?Q?yOiOtWaGCATsVWGnr+4VVaqh8ucn1QHsHgexE1GK0UhfpfRB9IqAjSuUtnyO?=
 =?us-ascii?Q?TPmw65rCpTiv9Ff3/sCFFTSVsSB2uilk9IC8T38kG+kCfdhklawhtx66dWqV?=
 =?us-ascii?Q?UmA41OoOGcVKtzNDpUdmBjhw2O9740YzIyXeHkqKKutLtZXXN2LptIFdHB+z?=
 =?us-ascii?Q?FBqzyh7D6frJF3GjNg2bfaOnLubdYzsFMMy/THd4B5Li+CxZnYAGarOF5GDF?=
 =?us-ascii?Q?fc3zLoRTxmqW12RpT36yJufPtVOcVFrC+vQ9v37cHcVKCRxPA0b0yPtb5+W7?=
 =?us-ascii?Q?jvp8Tn95M2nfkwk04wNJzzavzJ61MH+aXTkob+AioEc2Pb0A45dqleI7UDNh?=
 =?us-ascii?Q?gB4f68PMI42omfuwi00i1yfFgStqjYGrl2hGOnbJ/gJm0yHerwbbpKXEn0+W?=
 =?us-ascii?Q?iwl2SAP9QOn5TICxNxFbl+fP6wyOXyXWlpQ7XRFMq5bYBOP31PbNukJJ0I2q?=
 =?us-ascii?Q?XvfNpsABBWhibpdalmmD7LmdUvxVIZHMW+p6?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:37:12.6637 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f2c35d4-da78-4464-fac0-08dd878787f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8535
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

From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Free the memory allocated for colorops on igt_display_fini()
- Disable COLOR_PIPELINE on igt_display_reset()

Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
---
 lib/igt_kms.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index e5d51487a..0df892d28 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -2703,6 +2703,9 @@ static void igt_plane_reset(igt_plane_t *plane)
 	if (igt_plane_has_prop(plane, IGT_PLANE_HOTSPOT_Y))
 		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
 
+	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
+		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
+
 	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
 	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
 	plane->gem_handle = 0;
@@ -3431,12 +3434,15 @@ void igt_display_fini(igt_display_t *display)
 
 	for (i = 0; i < display->n_outputs; i++)
 		igt_output_fini(&display->outputs[i]);
+
 	free(display->outputs);
 	display->outputs = NULL;
 	free(display->pipes);
 	display->pipes = NULL;
 	free(display->planes);
 	display->planes = NULL;
+	free(display->colorops);
+	display->colorops = NULL;
 }
 
 static void igt_display_refresh(igt_display_t *display)
-- 
2.43.0

