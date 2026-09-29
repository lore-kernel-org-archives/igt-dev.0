Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CF2CA5FAC
	for <igt-dev@archiver.kernel.org>; Tue, 29 Sep 2026 15:54:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 425C410E1AD;
	Tue, 29 Sep 2026 15:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CC2sMK1j";
	dkim-atps=neutral
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03BF310EF7C
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Sep 2026 15:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g87B1XFdb0R305LPCCVx8wIXsubvEPtRy4uUyqcnw1otOyfTRvH99BCqt/BgM5gD/2bkiRxnsE+Qlw8gRA9W95DsM+XDCwq8U44+SiABRgUZog8EgGJFTY/EQZnZ8eeKR6mxlsogNIYqy0GWBWv6m5jpDaDuKR3bEy4P5o2Wa6llyusDW4V5a2KVNy0BVkaX0FbN7c1Nwz3ImXZ2patYMZTs4mSTJFjc2ZGz7pKMOQjNxPw1TWqzQmZsAjEHVL082zE8fjWDxEyLV7VdpiBRqB9Vdjo6a+LYAWDK9/Rum1hKZZatCu+sLK6HpC8vr4eC4MigTeEiwC00tktl+a+UAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIGklM7j6UADrYiqNMxShQtOTORCWG77RDekZZiv7fA=;
 b=NzbdMzC5jIpoea/JxRhlzCOv0n31zRzoXo5yopQGH1KHQiLS+Y3XMNvIcOR+AFg2N+QIru5tl1KDG6cozQqrV61fBxYLt4dWcTIbRsSbVVIIDs+LPH4v4PSonCu2EfB+VGwJCwy2A+FCfoZCaKJIfb4G/3DKHVT18fqs2pXvjNLuYvv+cRt/vsQSdMhKyfN+I7GSgx5At3X8OpUJK1N7y0DRIN9x7hev7LVXOkouSwGlZi9Zg1oP3/TdsU1IYxCcWz48cteoEw8EDVZZ3we4IkY7lZjL21t/QNKUaFF+JuQ2FfAyPuvBEWQ+bf5BWapcKwO131TFvDpdt0v1K+7U5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIGklM7j6UADrYiqNMxShQtOTORCWG77RDekZZiv7fA=;
 b=CC2sMK1jtpCNofYEyNP67xWFDXtlJFONRRUJsipsK4Fdq9ZZW5V7VKxvMiiYJaAB5bB8msNg4LSjcEQR9vq5XjPh3bScuhFEK6zHmvKr8C3JI8aJVW30Ry8ydkqP9PX5PT8l6kLCq6P4MDu+7DdpWEcxkrddL7k2eWKiKs5hO/Q=
Received: from BLAPR03CA0144.namprd03.prod.outlook.com (2603:10b6:208:32e::29)
 by CYYPR12MB8732.namprd12.prod.outlook.com (2603:10b6:930:c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 15:50:57 +0000
Received: from BN2PEPF0000A801.namprd02.prod.outlook.com
 (2603:10b6:208:32e:cafe::c) by BLAPR03CA0144.outlook.office365.com
 (2603:10b6:208:32e::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 15:50:57 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF0000A801.mail.protection.outlook.com (10.167.245.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Tue, 29 Sep 2026 15:50:56 +0000
Received: from rocky (10.180.168.240) by satlexmb07.amd.com (10.181.42.216)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 10:50:55 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH i-g-t v2 4/5] tests/i915_pm_sseu: Preserve const qualifiers
Date: Tue, 29 Sep 2026 11:49:49 -0400
Message-ID: <20260929154950.838280-5-alex.hung@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929154950.838280-1-alex.hung@amd.com>
References: <20260929154950.838280-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000A801:EE_|CYYPR12MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bc02248-c9c6-4c35-1f65-08df1e41737e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|10067099003|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: XXgxxP+bOOoZhmU6qOzq42DKsBoysN2oV+uQHcD/3eB9HepmBh+ZJVS5paLhYpGX2UsC5hB0FR3U9i7BkK4QRTFTqErX/qKxCxSFRXGDBd867P2RKo3KKw4BIxu93CbTOs0VSOIi9S2ZeNrmzeoOLNxHYtqg5Mkkjp4yoRFftq+2XS7tZAH8KaRpawF/1OsnYr6fGGUGi6OH8UEiEDzVLLj/gal34x4ctmCSUFxeA0MbrljLKME9bGJxTZnYO7ybhJC4rgO4fJ+I2Sel/hmhZNJA13bZXLopZIGxdYjIT7fRsLQqYNAz5i0Nhxj1IJ2qeNNwkThQPJEVN4aFza7clsVzbsGa+yEcAnSLsXPyufXXW9otia7zUEogYvPqDWRIGNGmek3JjPaH6SYo/Dkyue578OcbpcrnsnFwIsIvuuD3Zh/ZrzwD/FeBvaWNjY12AgwwIwYccyTkWcVE7C+rSY6/qwa0DlOernK4CmuJK2IEklg26SD53PngEiSWS52mb3wsu838ZGWn15wJwsjgqeIxJZz5lGyG3k+vp5UExp6KSUYcdTN3dK7DHL5NDwXRYmfyFPsdKkSvgZQPtFq+vrH3/sRpjfZ/hWXxp/k8O7WW1kEV2/+9XiqEWy6LNPplmIG8Dj2PKCDRWMPCTq/SL1YU6XwcO2hlC1ZsOiD4zdOxPYSH3G8Q4Od8nvOBLLP440stOfy97We5HISgVcEvIw==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: t3WOIiPg/vaKulTkmlNGXWhDCJKaQbR9EsFd+geNY/4AFjBU3Ap+RWiu2VFy9CuzHoCMVIDLbdladhZ63nR2u+CP4etkJ15LuMUy2niXafCoJT4iEOwk1O7Ve7RDTw4YRZWlCzhGUIFiiQOhVPNxiaa1A1kkgnhObjpo59/6nrF6G3xt93ArGODUatrYuDR8ZA54/VabcjiWJfMZOfQiVFqUqDjX6PpxipIyvlYPgf8peEJtG27HGdtISDEWtv/Aym/l5KzUeJ9l8xBVvhadM2PBLgMG9VAo6yPtnqQgVE4d0AB2nW30FWVxdCiL7W+bE5ZpGb3blz5odBVHrM4a8ceHznhx10NBvwj6o+VERba6ifVDIzcDIhpwIYCrfpmPv1gph9b63LD9eTtEBZhMQBHizruJtwN4SoahV7jtDbSG28OiIEXpjaN6z/+v8Lox
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 15:50:56.8832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bc02248-c9c6-4c35-1f65-08df1e41737e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000A801.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8732
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

With glibc 2.43, strstr() on const input returns a const pointer.
Storing that result in char * discards const and causes compiler
warnings in the SSEU debugfs parser.

The following warning is observed on Ubuntu 26.04 (wrapped):

  ../tests/intel/i915_pm_sseu.c: In function 'dbg_has_line':
  ../tests/intel/i915_pm_sseu.c:123:21: warning:
    initialization discards 'const' qualifier from pointer target type
    [-Wdiscarded-qualifiers]

Use const char * for the read-only search results. Pass NULL for
the unused strtol() end pointer so the input pointer can remain const.

Assisted-by: Copilot:GPT-6-Astra
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/intel/i915_pm_sseu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/intel/i915_pm_sseu.c b/tests/intel/i915_pm_sseu.c
index 5dd571a45..a4b92791c 100644
--- a/tests/intel/i915_pm_sseu.c
+++ b/tests/intel/i915_pm_sseu.c
@@ -120,7 +120,7 @@ dbg_get_status_section(const char *title, char **first, char **last)
 static bool
 dbg_has_line(const char *first, const char *last, const char *name)
 {
-	char *pos = strstr(first, name);
+	const char *pos = strstr(first, name);
 
 	return pos != NULL && pos < last;
 }
@@ -128,7 +128,7 @@ dbg_has_line(const char *first, const char *last, const char *name)
 static int
 dbg_get_int(const char *first, const char *last, const char *name)
 {
-	char *pos;
+	const char *pos;
 
 	pos = strstr(first, name);
 	igt_assert(pos != NULL);
@@ -137,13 +137,13 @@ dbg_get_int(const char *first, const char *last, const char *name)
 	pos += 2;
 	igt_assert(pos != last);
 
-	return strtol(pos, &pos, 10);
+	return strtol(pos, NULL, 10);
 }
 
 static bool
 dbg_get_bool(const char *first, const char *last, const char *name)
 {
-	char *pos;
+	const char *pos;
 
 	pos = strstr(first, name);
 	igt_assert(pos != NULL);
-- 
2.53.0

