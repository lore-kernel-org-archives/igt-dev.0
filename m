Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E734C79F82
	for <igt-dev@archiver.kernel.org>; Tue,  8 Sep 2026 20:55:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE5610ED66;
	Tue,  8 Sep 2026 20:55:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Pv9nMepZ";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012005.outbound.protection.outlook.com
 [40.107.200.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A91A10ED66
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Sep 2026 20:54:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x7VZ5Ov/Cwgtrl/U+bUeD2THPF3YnsE1TpIr0BezW0VHH8sG7SF4GAAkPqk5Dp8zUKZU53QeLZAHZT9vNTyJlfb9bHEIBYkAuZexKn9oQHZSJPElgOAxBuuAugIAM9CPMEEmSSYceXFI86jujzY17kCfTm59UdP6EI9NWlIP2AUSQ0FCIyMwGv+aIVTEcpC2YFBce/1z7ouCYdu+xV07SMwLLX/LRg8D4xM85OxpzOT1TSn/+y1H5dGXUnDnhuzerLwpKRe5JHP9kJB+N5nUnO5bELAb1UXQbPUngd6oYuxEU8CYYOcAoVG3B0cTTHZb+sxMANPjPj9z7foN/RBkZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jkgN56YXeRHiq8nSeqaIHZ4Guuz6DR4ctoCbcNbYNUU=;
 b=mZXTBERgBheoVszNHZW3aCoBEXyL/UuYgk7AWSKQ0fKJW7piUweRRtJrVn2QsvTClNZ2+xDsAwZzfjdFig8ZriE1YeYyMToKYOZp3G5H4/115L57KyBlnq4iVY8MCLRef00hZ5qr4KTqveP+MPL7aR4sDQX3cbQcrxjHyMMipqZfRS7vbj+ZBJNMtM1zhJtxc1akatzcFMB+mFhHt0RWAOEA70eJ7iHPARGBKXYFC01fDMASge5iscipY4v+A42KKHwF71FrtzQRNZ3I8SHdGZReP2NCBgO6H9ti4vN/4E3D5rdq5q0EmVNyL0nfZlkFrjT6CSnGYxnkUIhmV/y6GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jkgN56YXeRHiq8nSeqaIHZ4Guuz6DR4ctoCbcNbYNUU=;
 b=Pv9nMepZatAoIBEWhcrjNBrQA3kMIMTYasgZpo3RgmrOWeqfcexOa9paByJihB0medXKXrIOjnrqPLfcWuLU2yECetBtV7ub7dg9Gf2MrgezGMKEs0rAKm6dRczzq4/XSHmNRuM9B6qhBAsSjsN5acpDoZdUZKZvFYGKe3aG7eA=
Received: from CH0PR03CA0188.namprd03.prod.outlook.com (2603:10b6:610:e4::13)
 by IA1PR12MB8264.namprd12.prod.outlook.com (2603:10b6:208:3f5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 20:54:27 +0000
Received: from BN5PEPF0004698B.namprd02.prod.outlook.com
 (2603:10b6:610:e4:cafe::30) by CH0PR03CA0188.outlook.office365.com
 (2603:10b6:610:e4::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Tue, 8
 Sep 2026 20:54:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN5PEPF0004698B.mail.protection.outlook.com (10.167.245.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Tue, 8 Sep 2026 20:54:26 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 8 Sep
 2026 15:54:26 -0500
Received: from roman-vdev.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Tue, 8 Sep 2026 15:54:26 -0500
From: <Roman.Li@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, Roman Li <Roman.Li@amd.com>, Harry Wentland
 <harry.wentland@amd.com>
Subject: [PATCH i-g-t v2] lib/igt_amd: parse link_settings records by label
Date: Tue, 8 Sep 2026 16:54:22 -0400
Message-ID: <20260908205422.686351-1-Roman.Li@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN5PEPF0004698B:EE_|IA1PR12MB8264:EE_
X-MS-Office365-Filtering-Correlation-Id: 1515dce4-80ff-4572-9699-08df0deb5ec8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|36860700016|1800799024|376014|10067099003|6133799003|3023799007|18002099003|56012099006|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: mLPiim8TYgG30nW4V/MapsNuKtj7MF6UR0Pr070nOMgmKz4zF/FRlgrzxb6/Dpf/CMK4x9mAEsmo1s8B+A94EtmiK91ab/1pfZes/1kEw7IDcf2A+0sK/isaA0NHUQMukKuLuGSXOCtzmb3ESf7IdkAVg7RvCgdwj65EBN6PHLtwfhe8OyS/tX7DUadJoprQdiIufvJul6X2PTVAEtTry636v/kbdkYWznHvKr42Y63pOM8ZcAkNvqddf7k4UxBSPhhDYeggCHqlX4Ibq7GmO3+zTRiRC31/c+vnCrAmOrzxJGWXYgU8PDuC2a80fqPd4B+8oSsauZz3r9k3N7KgLd13b/Bol8boYl/AWWxuyTo9LHOVr4AS6XHYUwXo9Mek4HjX2dKI46VrgPfjeV2YT/Oe3cFU8Fw9Zt9h+3t9IpVeeM/xLtxJubqDG9uDwHjrZU2Xq+Vx13TIrnwh4XcGkep4wHAe4f53Y96MQM36ByEaImeafPxs6LUlHqm7RYSFBJPVTYXNgSGTlqN4sa6NnZpwuWGiluwgAFV7+bR1UZIWhWJpJ1dp8ixDraUJvOsj6OYrjPmCpTlIqYVvov6cX9exSl2ATxaclUW4kryJTqAqM3OW4Vz0335QoOiyNRai3P+DDB4JLe31zlUeE8wRzLVbWSKA/AQx083eYJnDN1z61DBE178KdbebxZBIx4p2Diy7G3EfEyPoodoJv86xGg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(36860700016)(1800799024)(376014)(10067099003)(6133799003)(3023799007)(18002099003)(56012099006)(11063799006)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: ReBk69o3iZkTSw7qY3TuGODqjCEVW6liDf/zmztKQujv0W0BaSJ2RBSSM6QVWK4pbm8bYXkkPe6fPmiAcp0zclsQYYh5o2tKUUs77in15hSJRF76BU1JrNN05pMUdUIc/oRZLlwZ/UaoI1QbgAkIx0WsRTi2rCdIkbZus9XvD46yogNBoyAt2ZFoc+xbsuat617MwmJ9M5ZlG2UsL0Cdz0onPK/ZdWcHKydxrO6kULRRc01zeTmaVNZymWRyk+E9u9dNmr2srZsIhVRBNzwrqc79LrkYPqyUTEdS0jx3A6bu4XPSFdkfx9w+G7C8Au9Fo2F6/MD9wQmnz7wM38pnI4bIs3fSdstUq+6hRwcUHo0wm0hTgQOKXYVzKWpJiZLyrfRs/TSSIeYyPqcaB2YetbhZ8rye2YcDCp+uehbhMlqsvFR3FlqisFGLDUEVEeSG
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2026 20:54:26.8150 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1515dce4-80ff-4572-9699-08df0deb5ec8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN5PEPF0004698B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8264
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

[Why]
igt_amd_read_link_settings() depends on an artifact of a kernel bug.

dp_link_settings_read() passes strlen() of each format string as the
size argument to snprintf() and advances its output pointer by that
same fixed amount, so each of the Current, Verified, Reported and
Preferred records is truncated at a NUL written inside the buffer.
The parser rewrites those NULs to ';' and uses them as strtok
delimiters.

A kernel fix for that truncation is pending. It makes the node
emit a single, properly terminated string, at which point the whole
buffer collapses into one strtok token: only Current is parsed and
the remaining records stay zero. amd_ilr@ilr-link-training-configs
then writes a lane count of 0 taken from the Reported record, the
driver rejects it as invalid, the link is left at its previous
configuration, and the trained lane count no longer matches the
requested one:

  Write training setting - lane count:0, supported link rate idx:0
  Actual link result - lane count:4, link rate:0x1E
  Failed assertion: reported_lc == data->lane_count[CURRENT]

Parsing by label is correct either way, so this can land ahead of
the kernel change.

[How]
Locate each record by its label with memmem() over the number of
bytes actually read, then parse it with sscanf(). Searching the raw
buffer rather than treating it as a string keeps the parser working
whether or not the records are separated by NUL bytes, so both old
and fixed kernels are handled.

Tested on eDP with both kernel variants: amd_ilr passes in both
cases.

Link: https://lore.kernel.org/amd-gfx/20260624180829.4775-12-george.zhang@amd.com/
Cc: Harry Wentland <harry.wentland@amd.com>
Assisted-by: Copilot:Claude-Opus-5
Signed-off-by: Roman Li <Roman.Li@amd.com>
---
 lib/igt_amd.c | 42 ++++++++++++++++++++++--------------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/lib/igt_amd.c b/lib/igt_amd.c
index 47e587e54..e7e8def58 100644
--- a/lib/igt_amd.c
+++ b/lib/igt_amd.c
@@ -833,10 +833,11 @@ int igt_amd_trigger_hotplug(int drm_fd, char *connector_name)
 void igt_amd_read_link_settings(
 	int drm_fd, const char *connector_name, int *lane_count, int *link_rate, int *link_spread)
 {
-	int fd, ret;
+	static const char * const labels[] = {
+		"Current:", "Verified:", "Reported:", "Preferred:"
+	};
+	int fd, ret, i;
 	char buf[101];
-	int i = 0;
-	char *token_end, *val_token;
 
 	fd = igt_debugfs_connector_dir(drm_fd, connector_name, O_RDONLY);
 	if (fd < 0) {
@@ -850,23 +851,24 @@ void igt_amd_read_link_settings(
 
 	close(fd);
 
-	/* Between current, verified, reported, and preferred are null terminators,
-	 * replace them with ';' to use as the delimiter for strtok. */
-	while (strlen(buf) < sizeof(buf) - 1 && buf[strlen(buf)] == '\0')
-		buf[strlen(buf)] = ';';
-
-	/* Parse values read from file. */
-	for (char *token = strtok_r(buf, ";", &token_end);
-	     token != NULL;
-	     token = strtok_r(NULL, ";", &token_end))
-	{
-		strtok_r(token, ": ", &val_token);
-		lane_count[i] = strtol(val_token, &val_token, 10);
-		link_rate[i] = strtol(val_token, &val_token, 16);
-		link_spread[i] = strtol(val_token, &val_token, 10);
-		i++;
-
-		if (i > 3) return;
+	/*
+	 * Some kernels separate the records with NUL bytes, so locate each
+	 * one in the raw buffer rather than treating it as a single string.
+	 */
+	for (i = 0; i < ARRAY_SIZE(labels); i++) {
+		const char *label = labels[i];
+		char *rec = memmem(buf, ret, label, strlen(label));
+		unsigned int rate;
+		int lanes, spread;
+
+		igt_assert_f(rec, "Missing %s record in %s for connector %s\n",
+			     label, DEBUGFS_DP_LINK_SETTINGS, connector_name);
+		igt_assert_eq(sscanf(rec + strlen(label), "%d %x %d",
+				     &lanes, &rate, &spread), 3);
+
+		lane_count[i] = lanes;
+		link_rate[i] = rate;
+		link_spread[i] = spread;
 	}
 }
 
-- 
2.34.1

