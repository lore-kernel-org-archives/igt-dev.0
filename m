Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13683C79FB7
	for <igt-dev@archiver.kernel.org>; Wed,  9 Sep 2026 20:45:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9175610F295;
	Wed,  9 Sep 2026 20:45:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IucZU5VQ";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010062.outbound.protection.outlook.com [52.101.85.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C55D10F27F
 for <igt-dev@lists.freedesktop.org>; Wed,  9 Sep 2026 20:44:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G6uXkx2+6T98b5AcCMTEjDsp7juvTUC5vrsaQvjuKo47XmgpuJ1Sk0na1U/ZD6T02LSK8/ip+9EvHvpeg1d6lUVUZ4FHKxbjBJHvhGFIhImJ4/JBrvhFnYIfRRWSDBw1zXVT2Fk8DEBPHswIDoHOMJqwozEjMIBJNm+YqLDzBFxb73MpS11WgZU6BSrGVIxY4hGz9+TIau1HFuGJEYn5gV7wV7ke9tpqLXc1bQytpg6b4amFdmf480+to3S9kIXImyjO0fCsnGl3JM2N2SqE1CexCLYoMwaP6dCsggK+aMRqn6TY4TEE8jZMhVA9X+bOBnHsm4tWSat4B+IqqVTH7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ObJ9VxhUzrCYsg5GNOBVpfZSskW6FBhhW+2+8bGJs4=;
 b=UfMthy0kuaikyRbOcAUS+9cUEp2op7M+ly1XXa1VlwFUncTxXSiehxjJ3SzCML/efPtl5mnUuYGPEWeYYaH2ZXiEHSYAE2usWnjEoZbELtYaa/O2qCmFQaMNOUbR/SPi/9Uq6UUiva3FCVwU8ZgBcbmgapZErzGRsTCjpvLXmh5Kf2i7yUK+GYjfWLxI5q35D3FmI/4Pviy6XxLccKViVJ+0qG9l6kzR6IWQj55/JCzu1CqMy28rHIvPNucUhVGjW1ASDlCm3aqTPeuVZv1C0olhCMkmOTGMeDYUsUwzABCVSAjuTqvzqr4FwcH6MtzhFqRt5XYEJtmBGq5DK2JHcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5ObJ9VxhUzrCYsg5GNOBVpfZSskW6FBhhW+2+8bGJs4=;
 b=IucZU5VQCJf/N1qKr4M89wRbJThRgx5AzGEDdaH0Hb6gEJdmPw0WTUU9cT5z3BEpOUrmwHbh7fe0p5birW5q86SuyCxmm/Y0wU1olhHxIIUb2bz0i2scxH4XX9NLeSjO5isQ1KrvGhvKc8lc22Eeg0NZ53ALaYr8hZ4XkXb4pdo=
Received: from CH0PR03CA0447.namprd03.prod.outlook.com (2603:10b6:610:10e::24)
 by DSVPR12MB999148.namprd12.prod.outlook.com (2603:10b6:8:38a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Wed, 9 Sep 2026
 20:44:18 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::54) by CH0PR03CA0447.outlook.office365.com
 (2603:10b6:610:10e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.15 via Frontend Transport; Wed, 9
 Sep 2026 20:44:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 20:44:18 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 9 Sep
 2026 15:44:17 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 9 Sep 2026 15:44:16 -0500
From: <Roman.Li@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, Roman Li <Roman.Li@amd.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH i-g-t] lib/igt_amd: improve link_settings parser for old
 kernel compatibility
Date: Wed, 9 Sep 2026 16:44:08 -0400
Message-ID: <20260909204408.936021-1-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|DSVPR12MB999148:EE_
X-MS-Office365-Filtering-Correlation-Id: 2418893e-0bba-435e-51af-08df0eb31e71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|10067099003|11063799006|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: vCIRm9dIu8ltRtc3K213fekQ5C5cit1KJh29w3IG6ddQ2cd/WskeosrtQ0nwXvYetbi8PpNH25Horv40qdx91LkO9ubMb6dH0kB2WTigBgZKhOcdt9zPBjZBevCqwZrmmafsUATBnEh0YWvr3Y3dy0b7PKmEl71jipBahNkx9r30Fl7IUIIsNKJdfMyjIy2X6efxAjm8TnYCHu1X5wQdBS8w6u4PwTIKJe2I0GW3DSd2IFCIhEvstAd0O5p2s70fFpius04klhKHln6GFQ8v3J/vToxuN2eT4SP3Iqu7q6LGo2m004w+YRy5Fwj3zHee+bAwDjE5iJ5eofuUoKw1MV79TabI8rJasAmIoRh5uXQI/c3ilzqOIrbG3p0iKTK1A+ON/xY01h3ysYhspyFifjFZBQqxiduNw2i/sDdfIw9bbVWkQqibs21SyaYTGlmX1gfaaD75dYAfULnRTDFZs0i65I+7pFTKRJ+tGxuVBDmGakE6nNg5WkK+AfPmmEuHkGz4amHqd/Tv10uEu5V6oVQG1zFOOZknTgYv+u31C14hO1+gvdcgLOTI31mkghWitJ7d8w32Da3759F/0GVCqHBwl1KeuXyxJ3ZFCbw3XwYkA9+Sx7AQiRJZl3twWzm+iAM2FWriE4epBBGHxn/L+MaeuKIBZuhXIWuNltuz5Sesim+Hvm0E+RXT+QKF3U4YSBbz1G3omHFOT8kuB2k6LQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U4hyaTc6QcOMnbc7CDrF8rS90UV9IqLJTtL8fWBFxwLQMmo5PoC7daZKndecD6ysGDrUQvwBZktMyBeDkWEm/h0yLEr8hCGQoJZIlZbPwwfMFBsa36bVHg72/t6h9+aLspYlVMthtfg6xE0JVUFjClIWeIH0yObe0Mq9YkEzjJITAtJVLZc3udc+EOpfZTPuMexqZzW7HHt6kwFEkkMVg/9lsTVam+2Jiqs2cIZZnsgU4R/mTPLdkglqo+IXBAcFzbkqA4egvt8xhJS+uXe6iHjUpNL0OkMIruq+B7GfDQu7TRG2xX8/tHVHD6EvdGe5/XA3Qp2lo1/OktEDahGWKe0Mxsb/Jq2J/6+5pP8WniJxepHiuC4d8+PL226GBPS0bQoUsbV00JhPmXhsEd4BmsKi0Y1AQnG7ARDDZBEDb55RboyQtyiTGXglVRRjAXKa
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 20:44:18.2020 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2418893e-0bba-435e-51af-08df0eb31e71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999148
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

From: Roman Li <Roman.Li@amd.com>

The previous fix uses strstr() to locate each record label. However,
strstr() stops at the first NUL byte (C string semantics), which breaks
backward compatibility with old kernels that embed NUL bytes between
records. Only the Current record would parse, leaving Verified, Reported,
and Preferred unset (0), causing the same failure as the original bug.

Use memmem() instead to search the raw buffer across NUL boundaries,
combined with sscanf() for parsing. This works with both:
  - Old kernels: with embedded NUL separators
  - New kernels: with contiguous single string

Also replace hardcoded loop bound '4' with ARRAY_SIZE(labels) for
better maintainability.

Tested on eDP with both kernel variants: amd_ilr passes in both cases.

Fixes: f234bbd294f5 ("lib/igt_amd: don't rely on NUL separators parsing link_settings")
Cc: Harry Wentland <harry.wentland@amd.com>
Assisted-by: Claude Haiku 4.5
Signed-off-by: Roman Li <Roman.Li@amd.com>
---
 lib/igt_amd.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 7d33ab658..ba1cfabcf 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -836,10 +836,8 @@ void igt_amd_read_link_settings(
 	static const char * const labels[] = {
 		"Current:", "Verified:", "Reported:", "Preferred:"
 	};
-	int fd, ret;
+	int fd, ret, i;
 	char buf[101];
-	char *ptr;
-	int i;
 
 	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
 	if (fd < 0) {
@@ -853,22 +851,29 @@ void igt_amd_read_link_settings(
 
 	close(fd);
 
-	/* The debugfs node returns a single NUL-terminated string of the form:
+	/* The debugfs node returns a string of the form:
 	 *   "Current:  %d  0x%x  %d  Verified:  %d  0x%x  %d  "
 	 *   "Reported:  %d  0x%x  %d  Preferred:  %d  0x%x  %d\n"
-	 * Locate each label and parse the three values that follow it. Do not
-	 * rely on embedded NUL bytes (or any other delimiter) between records,
-	 * as the kernel emits a single contiguous string. */
-	ptr = buf;
-	for (i = 0; i < 4; i++) {
-		ptr = strstr(ptr, labels[i]);
-		if (ptr == NULL)
+	 * Old kernels embed NUL bytes between records; new kernels emit a
+	 * contiguous string. Use memmem() to locate each label across NUL
+	 * boundaries and sscanf() to parse values, so both layouts work.
+	 */
+	for (i = 0; i < ARRAY_SIZE(labels); i++) {
+		const char *label = labels[i];
+		char *rec = memmem(buf, ret, label, strlen(label));
+		unsigned int rate;
+		int lanes, spread;
+
+		if (!rec)
+			break;
+
+		if (sscanf(rec + strlen(label), "%d %x %d",
+			   &lanes, &rate, &spread) != 3)
 			break;
 
-		ptr += strlen(labels[i]);
-		lane_count[i] = strtol(ptr, &ptr, 10);
-		link_rate[i] = strtol(ptr, &ptr, 16);
-		link_spread[i] = strtol(ptr, &ptr, 10);
+		lane_count[i] = lanes;
+		link_rate[i] = rate;
+		link_spread[i] = spread;
 	}
 }
 
-- 
2.34.1

