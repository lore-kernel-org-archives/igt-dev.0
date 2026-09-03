Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6947C61DD3
	for <igt-dev@archiver.kernel.org>; Thu,  3 Sep 2026 19:25:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 544A310E172;
	Thu,  3 Sep 2026 19:25:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Fmp+wYFh";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011002.outbound.protection.outlook.com [52.101.57.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C7210E172
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Sep 2026 19:24:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/7nSSzM68f2rhZgBmqXWwFHdWtIEG4D7u/iDVpG9rubBuy7fa1LbvSP/SsgegDngHqNOvVY+xLhh1ntoCa8E8OXCWsAWsQlMrcpyl+MsT2LrENLIT6j06WZd1cpG3+sEaCrpCCapJ0vedW3GAW2pVr34wyufaHeYJ2NcVpJuIWazqeHzzkLUOwaG7QGk/l41HhrndlWALzs09WRpBTf63pmmF5WyQgEdxXzJtk+mhrgAL77k4QRQRFP/BpAmzsZudbejC3ev5iC41xLmXj8kokJmSBT0SCabc2FfbGREwHhCjvz+hsQFyD4uRteBEWwXDVFtuy/gbcd4y+trGlAXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hQsne6M36B+R0Z8caRsveD+EDRdFj3Otm+79tLBltsc=;
 b=R++mAwkQ6fqE8osAhyh1kzqt5bQKYLK6R437Jp6MCmuJD74sRrwiOvevgNV2brCYyiGCljDHxBfsbLI+943Ac/O7SXMF1ecJ3HrBd94Jo2jVJPOiu1/wN+9vUPwab0b5jIzTtpk1zhmsFRv4PXBMpTgHz0AslmJNm7H5cH8fhiRbN32wsMmVQO42HCwWFb104qXYK5qLMF5Sp7n+IzBqdC51P3ZAI8MmwwQ9L4bVFALr3IpZKsZcRpqohUM4dbzOP+r2w66QNu4M2pl6388xPNp1LhOeHHzNOec8/xmAAxbCxbYFNyvHBCcEvfvyQ1invREc4MmuwPdFMWVr+B9YJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hQsne6M36B+R0Z8caRsveD+EDRdFj3Otm+79tLBltsc=;
 b=Fmp+wYFhqTIfOlJUfk6q5UfNlriRKJI17j9Dqt2G6QgSao9IfFVwY3WdpJSX6kDVLE4zp+wsksqRX9OUlP97pxcBWvTas9kA2HF8e7T+nMEy/wVcF6S7jp96+40lBCRL1Ul7fMNQeRJ44h7geZl9LEh5cS0jqHNpVt0YRLyr/PI=
Received: from SJ0PR03CA0040.namprd03.prod.outlook.com (2603:10b6:a03:33e::15)
 by MN2PR12MB4224.namprd12.prod.outlook.com (2603:10b6:208:1dd::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 19:24:47 +0000
Received: from SJ1PEPF000037A0.namprd04.prod.outlook.com
 (2603:10b6:a03:33e:cafe::89) by SJ0PR03CA0040.outlook.office365.com
 (2603:10b6:a03:33e::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.11 via Frontend Transport; Thu, 3
 Sep 2026 19:24:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A0.mail.protection.outlook.com (10.167.244.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 19:24:46 +0000
Received: from georzhanmkm.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 14:24:45 -0500
From: George Zhang <george.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Fangzhi Zuo <jerry.zuo@amd.com>, Ivan Lipski <ivan.lipski@amd.com>, "Alex
 Hung" <alex.hung@amd.com>, Harry Wentland <harry.wentland@amd.com>, "George
 Zhang" <george.zhang@amd.com>
Subject: [i-g-t,
 v2 1/2] tests/amdgpu/amd_dp_dsc: Do not disable DSC for high bw panels
Date: Thu, 3 Sep 2026 15:24:51 -0400
Message-ID: <20260903192458.1149302-1-george.zhang@amd.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A0:EE_|MN2PR12MB4224:EE_
X-MS-Office365-Filtering-Correlation-Id: c93021b5-2d3c-4f15-a360-08df09f103f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|56012099006|10067099003|5023799004|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: SDAlVfNUFp6nTZhqkxlNwa/Lh2yPp0oOBwveC+cRolFXfpgbrua+miTnOq7WO4dns9LHngv3gJ2e2yebW6V3rwGzEytDJ8wQQTEbxw0dMAyInzpeI79GWUcNCGK9CeNq2kUrC/qdkPujXSRK5vB/99zz7/Mk+61dwnP4bHOLQrkEArKSeQuSxPJu5ECiBCSzk5WREa9TzQt/6flK0r5tioDuHgjs7vfiOsEe54H1uwRK5I0hiABfUBpuaqb7lZYjj5/t38IrPEvkO2zDURudjP8yaTDElwCRBT+uQzahGA3vJhZvxMZWRwnYE7ndC88P+P6xiTcd6vlxxAtbRjQjIKWxmTXqZs1y1WbjivsP6l5I2AQCjhAzp8drCriN6DU73T7VcgJFzeryfP94NMZF1PQylNqjBQz0KjtxR+p9VIgc+5vWC78qkVYOFgEM55TL1G8PFqSFEO5GrKoYy37E5Aa8ut+f69wtoV1cx0kx4ugkYIb6wSoX0L3ibdJzXTCHjiZpMAuGyYd9eYftB76PW7JSmBPTXj9RoTLxs61y+2NOYfR7B81clyRreeB1Qu5hHm+irIcKXHl3zTTqhKCehAAPyFmXe+gnPyzQDm7ehDRAo0tbdfmnxA9QIADfvvZTFsBt732l6eYVMEgK3S71e6rvm463VvEwUDQZnHvj6JMAgvRgQNbFgKki39OZjIv9+YIYpOzLJjRJq0bkDaSCJA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(10067099003)(5023799004)(11063799006)(3023799007)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Ddcyby3SYAhqiewMl1UOWAKF/jZLA46DWMWDbOsdr1xe10V92DQQWEwOm9B80RqbtTx3jSfh72KI2Vxrd+GiGByTOTbJAFnthuRDfNQsU3ijhDTz4aGsXTzZqcGq5qznJ9FvfIFDZolhe5xQXuSKVKJs1y/4Avfjo43ItiBv1CjMZ+g2gU7LODU4hYkzE38eOL3BdwigKk7S0MSLMa5lSkGyjV0sd19w9l/vncTe5eb2IhtTdOYlZAADXdjEYZhk3QdjuVr0e9OmxI3Rpg014jXNfcgUOorzkzNQMHGB/ALJxsB2gMD3art9EuRc+26535xZFQ2Ii7AAiHyp7HBBs4QRABxN+Vjywq6eZySkpa/G2ZV4VWXJIeue+zRjsYxkXycmrmURCVd88LsetU0g42DY9yNyz7//rtANyCR1ggN+FYgW2l7QuybGppRaH7UI
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 19:24:46.7115 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c93021b5-2d3c-4f15-a360-08df09f103f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037A0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4224
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

The test previously attempted to disable DSC even on high bandwidth
panels. This would erroneously fail the dsc_enable test even though DSC
is on.

Fix this by checking what mode the panel defaults to when set to
automatic. If DSC is on, then do not attempt to force it off later.

Signed-off-by: George Zhang <george.zhang@amd.com>
---
 tests/amdgpu/amd_dp_dsc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/amdgpu/amd_dp_dsc.c b/tests/amdgpu/amd_dp_dsc.c
index dc71e903e..690a6c39d 100644
--- a/tests/amdgpu/amd_dp_dsc.c
+++ b/tests/amdgpu/amd_dp_dsc.c
@@ -137,6 +137,9 @@ static void test_dsc_enable(data_t *data)
 		igt_output_set_crtc(output,
 				    crtc);
 		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
+
+		/* Make sure we are in automatic mode before we start */
+		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 		test_conn_cnt++;
@@ -153,8 +156,12 @@ static void test_dsc_enable(data_t *data)
 		/* Check if DSC is enabled */
 		dsc_on = igt_amd_read_dsc_clock_status(data->fd, output->name) == 1;
 
-		/* Revert DSC to automatic state */
-		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
+		/**
+		 * We can only force off if the panel is capable of running with DSC disabled.
+		 * If DSC was ON in automatic mode, we cannot (and should not) force it OFF.
+		 */
+		if (!dsc_before)
+			igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
 
 		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
@@ -286,6 +293,7 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 		igt_output_set_crtc(output,
 				    crtc);
 		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
+		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_AUTOMATIC);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, 0);
 
 		test_conn_cnt++;
@@ -316,8 +324,12 @@ static void test_dsc_slice_dimensions_change(data_t *data)
 							     ref_fb);
 		}
 
-		/* Force disable DSC */
-		igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
+		/**
+		 * We can only force off if the panel is capable of running with DSC disabled.
+		 * If DSC was ON in automatic mode, we cannot (and should not) force it OFF.
+		 */
+		if (!dsc_before)
+			igt_amd_write_dsc_clock_en(data->fd, output->name, DSC_FORCE_OFF);
 
 		igt_plane_set_fb(data->primary[crtc->crtc_index], &ref_fb);
 		igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
-- 
2.55.0

