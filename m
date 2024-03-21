Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709DDC54E67
	for <igt-dev@archiver.kernel.org>; Thu, 21 Mar 2024 02:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F5210E428;
	Thu, 21 Mar 2024 02:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Bzlxr4dp";
	dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB14510E428
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Mar 2024 02:04:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RPnN6wXOtCeE7VP/M59bYkZgaSYcKtx5lEfoj9zLuzykEDzej5OOmZTm5PJg4hW46wKXrl0gh+KmYKBNVidgPZU9NiJ3aQ3U0oqEk/3E3TUN1Px9fnEZogiSkyneFtG8c0e5hgwrvQ/p8j7+s981lRUdM9QfjV8lLlLgx8/jNTLSh8cgChg+OBfDt2jY0vCDqKD+8RtubiT371ZXKvUFZSq8BE0SN7/DQIMRSHEOI2ji+ovYPBGMhx1J4o58hTk6AJ86Bt5IEDsGbXxtKAmbULR2NZmDrFgQTHOl33PIorsau5sci8ix/HM6O742vq0XpNRtEusCB+I0x4dEy0xx2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS+ZjKlvS4Al251cSwiK9cY7eJVSGYCvR9CwY39fJ8A=;
 b=UdjfcIYve5cJxyEC0sdzczvhvnoAUE8se5pdjIdGDfjULWycy2gSKECOZOvOYUrQfBE4usZdEgdUYnVx7+J66QT+ltRZ6UO1Iyj5V7LRMFhX/9jBkEirA633ZfMxFliJ/ukpYKCsU/T+f5gIl6BzVWfS+zIG6YQf5IT5BjAxFJx6WKchcqLLXOijma0rgqepJ6g/UFvUMbvroxZ/Tlo/CzycyKh2D8hb0k6qjgJyUMsCuTXp4JA2nMuiL8AjozRym/Gx6Ip11RtRvRMKRuaqBKi1T7TQfVwH5pWrPDVX2g0D2TMCwq2lDroSRzOaiLLnqS8PNhg268WMu593oAzoDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oS+ZjKlvS4Al251cSwiK9cY7eJVSGYCvR9CwY39fJ8A=;
 b=Bzlxr4dppG2UuTa1fnHvbEhHpb+llzYufsgQ++YHiA8NRml1jSwA2S2k4DHc+/SWfgvuVCLCuRFSIyim6kyVOIJBE9bDNW+3qMBx3PJOj18Yf49+waSdFyVgF8qziHqyYeedWD9jt0ki4llbsmaTuiGy0yGF8VVfRs/5Nsbxhk8=
Received: from DM6PR21CA0004.namprd21.prod.outlook.com (2603:10b6:5:174::14)
 by SA3PR12MB8762.namprd12.prod.outlook.com (2603:10b6:806:31f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.30; Thu, 21 Mar
 2024 02:04:36 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:174:cafe::38) by DM6PR21CA0004.outlook.office365.com
 (2603:10b6:5:174::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.12 via Frontend
 Transport; Thu, 21 Mar 2024 02:04:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7409.10 via Frontend Transport; Thu, 21 Mar 2024 02:04:35 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 20 Mar
 2024 21:04:34 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <rodrigo.siqueira@amd.com>, <harry.wentland@amd.com>,
 <hersenxs.wu@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH 2/2] tests/amdgpu/amd_vrr_range: Skip on unsupported connector
 types
Date: Wed, 20 Mar 2024 20:03:54 -0600
Message-ID: <20240321020354.843729-2-alex.hung@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240321020354.843729-1-alex.hung@amd.com>
References: <20240321020354.843729-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|SA3PR12MB8762:EE_
X-MS-Office365-Filtering-Correlation-Id: 121b6fd4-5413-4da3-13af-08dc494b41fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nCoJZ70XJsDTt/CNm/D4n2bIWAZn5QVEdiRWq3hha3B+h08bi/9BSIt1B2ECNLI6LLb3Sedh47l03ge+vDiWzKU8DZPMShRG9RlxmfwZlrYMXqubQq2B+Y682Nlf+1lhcpmW3T3s0InupfBwdHQHAsQOXBLsDHtSumZrpMmB+g+xtewmDoC66dJWelSKJJb/4cfEre00Ej0dOGo5I2jg3ShrWpRm7SUsZcIsVtK7dWWhGr8o2mLfOgK7+U0SrFfwMaUocy3etuga5YDvap4xupt9QyUBe7UohKETbO444i4zQJ2WRXiVYSTer2PjNyHixhkGzeIdMKOXotLGrkAgawqC5QfDXyHuTzisi5VW3USERx238aRuV9O49F7L2atHYKsJCFJ9yOooeaRnknhY3eBRcNzmXz7sRdW/41a1p5cO7QU1U9727OEU0Jcw/TJ0F0IbaspQexuFzYLGF3rfQulYBIXkrBXq8akYjIdKnnekwcLKQgcdZWxQ0kfnrJKBkJv5MMdu2iBoy3VuwBWxvq2hKnlku7LMHJQcFMmk04Cg9tN++bStNFdEXj+CBENYYk50ebtmwKhmA0GrzhLjCDcksic3rhjpVz17u5yAYnjqWzwJMkEwESZ+tiAb5vzpyHFOnP9WZyYkdX/xi8tiLCYSxZ/Alp1VB5JULsVtIQZy9G/vv9vWSJy54+EhyREOPCs/jpzhJC3XITbXyYlkq1EdNZ6gaXc59IDXU7Y//AFldn74XzLAT8LVBps7x6RV
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(36860700004)(82310400014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2024 02:04:35.7178 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 121b6fd4-5413-4da3-13af-08dc494b41fb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8762
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

edid_database includes a set of EDID but does not includes one with
connector type == DRM_MODE_CONNECTOR_WRITEBACK. With writeback connector
enabled, this will always fail even if writeback connector does not
support freesync. As a result, freesync tests is skipped when there is
no match in edid_database.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_vrr_range.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_vrr_range.c b/tests/amdgpu/amd_vrr_range.c
index a77895622..79db6f9c4 100644
--- a/tests/amdgpu/amd_vrr_range.c
+++ b/tests/amdgpu/amd_vrr_range.c
@@ -208,7 +208,6 @@ static int find_test_edid_index(uint32_t connector_type)
 		}
 	}
 
-	igt_assert_f(0, "should not reach here");
 	return -1;
 }
 
@@ -268,6 +267,8 @@ static void test_freesync_parsing_base(data_t *data, uint32_t test_flags)
 	for_each_connected_output(display, output) {
 		/* find a test EDID */
 		j = find_test_edid_index(output->config.connector->connector_type);
+		if (j == -1)
+			continue;
 
 		edid = (const struct edid *)edid_database[j].edid;
 		expected_range = edid_database[j].range;
-- 
2.34.1

