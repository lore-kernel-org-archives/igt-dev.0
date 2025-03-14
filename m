Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7656EC282DE
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 03:33:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDEFC10E1A4;
	Fri, 14 Mar 2025 03:33:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="faTn9le1";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C476210E1A4
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 03:33:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NlM4Vi/NGpk235FFzuIL0URhW/qbl0pWIaRgQWNNQ+reFedKXOXFbcolDyt9/qZ/yWiFndOeA9WKzpr0N8yK4HVNL99Jfi6vOby91+0pDqE8p9ytIrZLRg3edF+yYSpOm5FdZuG1cdRAKW92HjXdLh9g6Cks5RQwIMyD9YiCB6NeaXiGlObcdmCwFqsfT3UXV1s1Fzg2lUpqSOYAsthkJmj1VctZa38umHMElrCHv8Ew/mT3dmhFe2f2R8unizHPdJb7MczFSquMAZwBGZbDAhuVoTw5834UZ5HArR8jmCHJDYUJx3J+nw7YSNUR4G64oQEumBlhrsZvNA4f8O8gyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IPN2Wpd3RlzuNRFSDpoF9QGWHE30RCw0jybo0ne0Yw=;
 b=kQdq+n7ZI1qw9RI6sociC5g4OESMYBTnKUnqEKKfRylAFiPJZv6mR9fOXoWApG0KK+2NBfo+6RgUcLcsz/0cNsBwNkszPG4YVcefnjbI5CcuZ19yRLk0snwoPe91G68JPrUcwZKpFNc8Caoxl0iVN6+StQZSe5VB5vlSFcIPg+EE6oSZIr/Tl/qh5/HTeh9p/otIJaOLzsQmQbX6lDu2j6yYbxUFcGzGSh10k/m122+yRef1G/td0u4Xl812AxGsywpZEcHJ38N1H3+NqK77c2gAoeT3+0DddzOPzeNkC3ewOQfBfqPQAyN5s27bOHKJvEVJKNrwIWkFSuo/Nh+3GQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IPN2Wpd3RlzuNRFSDpoF9QGWHE30RCw0jybo0ne0Yw=;
 b=faTn9le1JE18ZIseXqITw+aLeqoMer37oBoXAZ07J7CAknZHTJVWie7eP5XjSnSwMZeBJpce1vmIUy9din/A6FHn/W+BOVTiJu9tiknTXJPLNwLjYQ3snQK578/xl80TEoikFZ/XOW56g6MaPSJGP94VOcq9M08QXzQy0AG+J20=
Received: from MW4PR03CA0038.namprd03.prod.outlook.com (2603:10b6:303:8e::13)
 by DS5PPFE52C859EE.namprd12.prod.outlook.com (2603:10b6:f:fc00::666)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Fri, 14 Mar
 2025 03:33:02 +0000
Received: from CO1PEPF000075F1.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::d7) by MW4PR03CA0038.outlook.office365.com
 (2603:10b6:303:8e::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.27 via Frontend Transport; Fri,
 14 Mar 2025 03:33:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000075F1.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 14 Mar 2025 03:33:01 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 13 Mar
 2025 22:33:00 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <chiahsuan.chung@amd.com>
CC: <alex.hung@amd.com>
Subject: [PATCH] tests/amdgpu/amd_hotplug: add missing include file fcntl.h
Date: Thu, 13 Mar 2025 21:32:49 -0600
Message-ID: <20250314033249.2426485-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F1:EE_|DS5PPFE52C859EE:EE_
X-MS-Office365-Filtering-Correlation-Id: 35eb247a-e2b3-4c83-094f-08dd62a8ec8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T2JoN1lERkR2OHZENnkwbHN4NHdXaVdveC9mODVyaGt1YnV0Uk90eE5jVzZY?=
 =?utf-8?B?UW81OTk2YW1ZRE1kTld3cEt5Mkp1eDdmdzNuOUh5NCtaazRoZkpEdU56U0FH?=
 =?utf-8?B?eStjQk9sdjdGL3FXalhjUFZQOFMvZHZJckdxMHBBeVlLWmtYWjNoQWg1bnlC?=
 =?utf-8?B?NlJJRVE2Rmt0VkJqSFRBSHQ0SUFsYWp5VUEweGd6UmNIb2wzbSt6ZmUyQ2N2?=
 =?utf-8?B?bTRpNmhWbVlLb3cySmlRdDVtYkZKYS9IbURJdXUwanBaS3VoZEhFNDNlSnBr?=
 =?utf-8?B?SFE3Kzd1WmdpOW5FQ3RZdXZpOEFnWllIb1dvZjdGd1JUY0o3RjJHTmRGYTNx?=
 =?utf-8?B?Y1hrWnBmcDhOcW4xUSt0VlVFZHpNc0ZUU2JRY0hzT09sTFNvT3Z6SGZ6N3p4?=
 =?utf-8?B?Z2x4R21ZaTB4SWUrV2ZLQTh1a2l1WGxwVmRWeWdVYjU2R2FmVEZlaHYvTTc4?=
 =?utf-8?B?cUw2a2I4RU4yZkIxNWxYS2Fyc1R1VHNBa0JVTjV2SFBRVmluWE91SE9sRS9y?=
 =?utf-8?B?akk5YVhNS0tGbHdDcFFiNHhPck43YmxDRmxlR0ZZV21jUTZ4Rmg0S1E3WVNm?=
 =?utf-8?B?eGFrd2R0U0pjTlpxTGs4bXNNbXFzaWFmVmxzbTZndTZGdzk0L2tpNitCSTNs?=
 =?utf-8?B?T1QvQktTYlRrR3UzNU1aVVUrc215RTNqNGh0TkJaRGducGZiS3QyR3ZqTXZC?=
 =?utf-8?B?WkdEMVhra0NoWVlHa0lHcFpFMVRnL1ZpYWVNZ042bkNzQTVoell1NjBaYUdE?=
 =?utf-8?B?dWV1MjdlWVZBV3V0a0dhbFBiNkxGbXlZSUd2U3B1YytWMjMxL2pyWkNFSTNm?=
 =?utf-8?B?M3RxNkNNc3R2eW5QaG9xKytKVm1DUjBWL0dhVVNhK0VlV1U1dCtlcW84eUkx?=
 =?utf-8?B?NXl1ZWlkaHZWVWpRN2pnZ1hkeThlcytLNURQVnZFdGlxQ2ZqM0lTY2g4OTM2?=
 =?utf-8?B?eExxU1A4NDBDa0gxZFlSMFlCak8yU2ljVFlDcCtqWnNrelhXWnBUdXNKbHBz?=
 =?utf-8?B?MktzeElwUVVVdC9IRHl3VCtMUE41RytVZlRPd1dxMis3cVRyaFd0a1dyclho?=
 =?utf-8?B?R1FFbXpSc0czNnFRYkxnNEJuOXBvcE4wR2RFSFBmZWpFbmR4Tys5aXBXbkxH?=
 =?utf-8?B?Z3RTaGZqdGpmbnp5TWtWQlZ6aURRelJJNkJ6alRuK2JFWm8wMmJLOFdlSXVN?=
 =?utf-8?B?R09WblR5aTVVd1NiSE52dXJCK1RTbWhCUmZtbDBJYjcvMFBlejFvajIzcVRm?=
 =?utf-8?B?QmVqTDRuT0p6U0R6M1JTQkx4Mm9OUS80Ri9YcWNyVHN6MDF5QW9XckFSekRP?=
 =?utf-8?B?VVlIUFhaYlhEb0ZLdi8xWEJqMCs4ZC9GTnBWVHlQbjBwaXhoMGxSeU1OV1Vl?=
 =?utf-8?B?SEhUUWZ2L2VtQVJGMy9rbk5kaWlVTk5Vck9nUmhTSElSVGU0VU9QME9PSk5s?=
 =?utf-8?B?M0NHVldFc2Q1V0Q3cDAvTW02MVo0dHV2TkVpc1ZrL3dvc2ErdHVIZGIxVTND?=
 =?utf-8?B?RFFmSGtIZTJVc0lzWnJVQjNhRjFZRnNtQmpzd045TWZ1UHJxWHVrbGMvTGpw?=
 =?utf-8?B?Z3U1VVQzZ0JoQk5hYVAwVFczejJxWnRLQzlFcTJrZEpBUWtPaXhMZi85dm5F?=
 =?utf-8?B?RmdsdE5LVkFjTmFNbnUwYm1pcmh5UlVqQmIreEk0eEdNeW5pOXdkZHc2Q2Vi?=
 =?utf-8?B?YkUwbkMxTDU0L3VJc2E4bCtjdGsvbFdTcFREMEdHL2dnc3pZc2hNTlVRTFp1?=
 =?utf-8?B?Q2sxOU1NYWVlUytpeFpiRFBUR28vUnVPSjJxckVlbTJRUlA1d0x4Sy9MQldG?=
 =?utf-8?B?SVlvTFkrclFCQXc1UnFwOXo1TjF3ZWlHUkJmMjh6MENCMi9idXNqdzJTWk5P?=
 =?utf-8?B?VThab3hZV1ZBTmpNMjdsSEVZNUxWQ0t1R2h4TFU1czlSK01pMVYxV24yMUR6?=
 =?utf-8?B?ZGNUUE1FVmhLRjhaWlFBRU9YeENsd2loSjNUZmhvWEhSc1Nia2NacU1iS0Ez?=
 =?utf-8?Q?aQCtiSHpZSyh0ZlTGqdoGiA2CNerAQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 03:33:01.7544 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35eb247a-e2b3-4c83-094f-08dd62a8ec8c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F1.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFE52C859EE
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

Add missing include file to fix cross-compilation errors:

../tests/amdgpu/amd_hotplug.c: In function ‘is_system_s2idle’:
../tests/amdgpu/amd_hotplug.c:110:7: error: implicit declaration of function ‘open’; did you mean ‘popen’? [-Werror=implicit-function-declaration]
  fd = open(MEM_SLEEP_PATH, O_RDONLY);
       ^~~~
       popen
../tests/amdgpu/amd_hotplug.c:110:7: warning: nested extern declaration of ‘open’ [-Wnested-externs]
../tests/amdgpu/amd_hotplug.c:110:28: error: ‘O_RDONLY’ undeclared (first use in this function); did you mean ‘STA_RONLY’?
  fd = open(MEM_SLEEP_PATH, O_RDONLY);
                            ^~~~~~~~
                            STA_RONLY

Fixes: 6796e79abba2 ("tests/amdgpu/amd_hotplug: Check the suspend state after resume")
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_hotplug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/amdgpu/amd_hotplug.c b/tests/amdgpu/amd_hotplug.c
index ee3256c0b..bbd50452b 100644
--- a/tests/amdgpu/amd_hotplug.c
+++ b/tests/amdgpu/amd_hotplug.c
@@ -20,6 +20,8 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <fcntl.h>
+
 #include "igt.h"
 #include "igt_amd.h"
 
-- 
2.43.0

