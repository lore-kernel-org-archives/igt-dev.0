Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E664C3ABA5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Apr 2025 01:42:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34F4A10E692;
	Wed, 30 Apr 2025 01:42:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GBrAJOV1";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B3D10E692
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Apr 2025 01:41:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a0B7ZbOW1IG/zriS/J72WMLHAgXfG8CBBzLtTDFifb2Wls+9eawixD7oW0qKoYuWuCkEC6CQeJpTdN1J6JXJ6G91yYsczrK7V/05MHl2n9gw+N6nPLYDAgVTX7ksJWLTBQAh56cdWnSPwA4GfyrOoXEXX7HiJhblCn6hkwklMkNs8EZY+1Z0pG+n6QqQLrHF0I9/beBFQVnL+Fv8v6n6nADx0LQj2aHrAbfFxaPY5S6NcDVhMGNNHGHIUDL8FUGnbQYUzB+4sKxc1tWLAuutpcFb5zAqQSHCNclodGxAS5u0X0YDX2dEHq+uWCx8chU1j3jAhTtDaLHxzBmr7HGPNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=ak4K4ALf39/toiKdTMZwjNUyygZnVfIm4EdZBsgev9Jgq7vZXRR//6YH3fa4Mpw9hd7SKSqyC5OGaigF394YGz+WpWW0U7lEXzdKDJXGZ4EtN7VVcLknHce26f3NnUd8JGW7pGTltDlI8C0+NKjdichT3wxZS1Z2HXSiAd37qmM+7o0rK6R/oCgeYJ8XMdiCS88/f77Eg+i6PZCP8WpKYcMW2jB3uFxa3MI1RYnHoWdSY4/IJ3pictvW9YkpseXdWbbPGdXLpMUW+vcWbns1QvQCawEc+CeNZdZUd6zgAXUEnk3zggkx7aFn0Wp7MxvXoeevQ6XeKogs97rl8YQdZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=GBrAJOV1TXK/7yTICQ98ATdqBNjG+suZ/KWaMlXk5R3itDPC4Wutj+UKnbRKYyNUGZeQ/XM5oNcgNdS2k0zFoYppr7A4XB7VJKDJlF+T9DKHLrPplP5X57eT5NyqsieCeM6hUYxH8iwAj8PIdLkBytlcnXMU42J9pD7bDKbfo7w=
Received: from MW4PR04CA0272.namprd04.prod.outlook.com (2603:10b6:303:89::7)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Wed, 30 Apr
 2025 01:41:53 +0000
Received: from BY1PEPF0001AE1B.namprd04.prod.outlook.com
 (2603:10b6:303:89:cafe::96) by MW4PR04CA0272.outlook.office365.com
 (2603:10b6:303:89::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.41 via Frontend Transport; Wed,
 30 Apr 2025 01:41:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BY1PEPF0001AE1B.mail.protection.outlook.com (10.167.242.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8699.20 via Frontend Transport; Wed, 30 Apr 2025 01:41:53 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Apr
 2025 20:41:51 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V8 32/36] scripts/convert_3dlut.py Convert a 3D LUT to
 igt_3dlut_t array for 3D LUT API
Date: Tue, 29 Apr 2025 19:34:50 -0600
Message-ID: <20250430013454.226910-33-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1B:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 2896d277-e95b-457f-3beb-08dd87882f18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sH1s92sSKtOGpWThmd8J1kNSkYhbDF0KL7VVJDpI+240+/p5VwAR7+zYjAty?=
 =?us-ascii?Q?9enBw7bZkd+u0/YHl8lt7EItwXuIFjWLCpZ31HPX6PrJOKvtCQzxD+jAOlRJ?=
 =?us-ascii?Q?2FHmpYfYE9++2y3zI2SIQT73O9A28ncH2aBfa3iDREdwEJiKqADx27HQmeel?=
 =?us-ascii?Q?+Gg4YselTuDXz8TPNISf6JrWSlBHiHK5j3h85d9YjUsH9bwtJB5a9HHv4ltk?=
 =?us-ascii?Q?jvDuw5Gq62jncDdFpmoBlU+SwfS7FmpqShoqB/1Gu01mApK6XxcfOI94tB7E?=
 =?us-ascii?Q?TqudPcGZxHMoRkZhim6TNi48LVHS8194r4RPuV39xMyJW2zaxvR5PRUVY2FU?=
 =?us-ascii?Q?QecoX9GjkcTwhRHTIak4olvrih1lbEJVtVWPY92/PltE27LCmXlTDpRg90HG?=
 =?us-ascii?Q?ki7MxR864E6piL0h/9Rl8+GxK7t9hQiYexMPLhnzJT8tD18uNwt15AHi2MoY?=
 =?us-ascii?Q?F3uxEPyUEuxXScTwvqxSflZRG77hVnVMpz1Q9Ylwg3Woj43H06BvAdVRRlqd?=
 =?us-ascii?Q?Vl+oA9g3RxMbCiCeMSY5XIeGMtjSTl1haXGbN65NURBRLGSbATeuG6tcFuHx?=
 =?us-ascii?Q?gqGWqF4kHU8YBWb3h+0/kwBUVGzo/2UVQlWLzNeL9B0ili+WtCXkCaIGuj7X?=
 =?us-ascii?Q?NkI2UpkLI8FvPsi4NZ0Mlb/tKqZq4lO6EClG5dQ9WqkWxKOvaWm0R0rarfKy?=
 =?us-ascii?Q?JohyRuAlehMwidQ7VungdgG+nLwNiEdljqhPMo4W9BbcwZpKsC19V2KpOI1B?=
 =?us-ascii?Q?FiGLqO4regxJyY28zZyVoC0mInEpJQ3vcjwBZ14EH96l5/VP7JR1qAShTGD9?=
 =?us-ascii?Q?JqR2ZbfXHr+jMnOFzm5dBVcoMhgfDwOik+tC6NrI2gApyORTF3nKa9gPiBGC?=
 =?us-ascii?Q?dyjL/XzSeabdFAjKDU79pa8LwuAQfezEU8wIyYo5hVIWnmHXo1USRPfXnTYg?=
 =?us-ascii?Q?VYRLEllaVdnBU2VIeAWnfBlErvyI5yvRs4fLsV2uZrqyDi8fXIXRldr9KsGN?=
 =?us-ascii?Q?yR6UouyXXJpJ2G25eMpvY+bpdvhkSMDKr65GvZrn4tEDvdvIwsUGm8/dWnwT?=
 =?us-ascii?Q?FDN3aidLaZpZSATbALI7XZKnmdpQmM3gPYR21zsPN4S4mW6XymCEdhplD5hT?=
 =?us-ascii?Q?lPMFzvUiqqcj+LYqwdUcEecMqJ7Aq633n8cZYsiCg8Gcc2zTfiKpZ8zRg2Nz?=
 =?us-ascii?Q?xlYWt4IswaTtQ2FpFgXgwggJg/stY38dOYuFi5SIovf1APCNVN+3t0anxxJD?=
 =?us-ascii?Q?tO7P92I0FtVxPE3JCacwr6G/xeBGwNFTVo11JXuk6C/G3q+xaixmTwnDjXSe?=
 =?us-ascii?Q?YQfuQL0jqJvacbEiYN/73yRvq+TMw+h6+klWJfcBY1mIle+7tmoWn2lppAnZ?=
 =?us-ascii?Q?MnZmmu0fyCBO2a6TuZQ5A2SQlwSVK43hrqGyC/RTkWdFK/NdMsJmoMuUxZap?=
 =?us-ascii?Q?AtG33wn056fq1JSgvvHZOhveqMBWvkbtI27WpD1T0fgNMrmteKJqnJP8ljrJ?=
 =?us-ascii?Q?nPkv0pPA5OIQM0TTBbAe99zsx1OfchoyY3eY?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 01:41:53.0488 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2896d277-e95b-457f-3beb-08dd87882f18
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675
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

This script converts a 17x17x17 3D LUT in a txt file to the following
(i.e. 4913 entries):

	{ .red = 0.000000, .green = 0.000000, .blue = 0.000000 },
	{ .red = 0.175580, .green = 0.003419, .blue = 0.006838 },
	{ .red = 0.338706, .green = 0.015140, .blue = 0.012454 },
	...

The text file should contains 3 column (RGB) in following form:

	0000 0000 0000
	0255 0307 0606
	0225 0306 0893
	...

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 scripts/convert_3dlut.py | 94 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100755 scripts/convert_3dlut.py

diff --git a/scripts/convert_3dlut.py b/scripts/convert_3dlut.py
new file mode 100755
index 000000000..35189b549
--- /dev/null
+++ b/scripts/convert_3dlut.py
@@ -0,0 +1,94 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+## Copyright (C) 2024 Advanced Micro Devices, Inc.         ##
+## Author: Alex Hung <alex.hung@amd.com>                   ##
+
+import sys, os, argparse
+import numpy as np
+import pprint
+
+import pprint
+
+class Color:
+    def __init__(self, r, g, b):
+        self.r = r
+        self.g = g
+        self.b = b
+    def __str__(self):
+        r = self.r
+        g = self.g
+        b = self.b
+        rgb = "\t{ " + ".red = {0:05f}, .green = {1:05f}, .blue = {2:05f}".format(r, g, b) + " },"
+        return rgb
+
+def print_lut(ind, lut):
+    for i, v in enumerate(lut):
+        if (i - ind) % (17 * 17) == 0:
+            print(str(i) + " " + v)
+            #print(v)
+
+def parse_lut_file(file_path, max_value=4095):
+    lut = []
+
+    try:
+        with open(file_path, "r") as file:
+            for line in file:
+                values = line.strip().split()  # Split values by spaces or tabs
+                if len(values) == 3:
+                    r, g, b = map(float, values)  # Convert to floats
+                    r = r / max_value
+                    g = g / max_value
+                    b = b / max_value
+                    color = Color(r, g, b)
+                    lut.append(color)
+                else:
+                    print(f"Skipping invalid line: '{line.strip()}'")
+    except FileNotFoundError:
+        print(f"File '{file_path}' not found.")
+
+    return lut
+
+def fill_3d_array(lut, size=17):
+    lut3d = np.zeros((size, size, size), dtype=object)
+
+    for i in range(size):
+        for j in range(size):
+            for k in range(size):
+                index = i * (size ** 2) +  j * size + k
+                color = lut[index]
+                lut3d[i][j][k] = color
+    return lut3d
+
+def print_3d_array_rgb(lut3d, size=17):
+    for i in range(size):
+        for j in range(size):
+            for k in range(size):
+                print(lut3d[i][j][k])
+
+def print_3d_array_bgr(lut3d, size=17):
+    for i in range(size):
+        for j in range(size):
+            for k in range(size):
+                print(lut3d[k][j][i])
+
+def main():
+
+    parser = argparse.ArgumentParser(description='Convert integer values in a 3D LUT file to IGT format.')
+    parser.add_argument("-f", "--input", help="3D LUT file", required=True)
+    parser.add_argument("-t", "--traversal", help="traversal order", required=True)
+    args = parser.parse_args()
+
+    lut = parse_lut_file(args.input)
+    lut3d = fill_3d_array(lut)
+
+    if args.traversal.lower() == "rgb":
+        print_3d_array_rgb(lut3d)
+    elif args.traversal.lower() == "bgr":
+        print_3d_array_bgr(lut3d)
+
+    return 0
+
+if __name__ == "__main__":
+    ret = main()
+    sys.exit(ret)
-- 
2.43.0

