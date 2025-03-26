Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 915CCC36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:46:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4816910E79E;
	Wed, 26 Mar 2025 23:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5g2IgwZm";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2077.outbound.protection.outlook.com [40.107.102.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1E910E79E
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:46:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=emn7kQaGIaVjdpIkg4iD4wnDA73tZqhxKEWW9hI0TLZpIZXDE35OEJfEpvNdMnWk9MO0Ur8LeuD9aoCicU8meZu1XIitYY5XgdpcCQPeBXBNbaxvmAE0i2SVq6E+jkw9U4JZ4hPloHjtCcKJF3oikl8P+tlns9vtUxCtdVPw2fomR5WLsNDEdAe2JFnsYSFkJQQrzfIfJ+NKiv6TnFzAA08q8Tethmgso4EMEgrLuDLrq+yFAiJJsw/9v2c2vG0cqJq7ya6ZDBvn0C3pUQz5kdvhp6FoUI549UgZuEw2HqRUl2lnJ3szRejDRfIJwYy2r36AcmKSVXj2OFt39YN5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=P/sU87Wibtbz3Ipqr4pHFEfQ4S6cV9+iRnXdeTMK5xmQWxV6F1GMpMxn+qgA+Vj2+C37lwv/+UJYaGVjmaCSfMilkZoYydVauqkxjLD5zpmS5nWF+f0kfufVMaQFotp38kRCy2gtYRnjXk/BNQ5C9p0ZmIeEeYczUAyxgejE33CV9MJDjI4g7VaBYXpneWiJoNySvmMy5fD9c2M+mzLK2CV5fqSrMWWWf/CDxJOqbD6zWUf8az130Ju9DFwv9elZwZEUUvQt5tGUN7YfEdOU+rDsL+QTjiVoDJtENkOt4bgsrCBJQxOvpbQtdSuCchTtyDiNqP59gzKphPwqmrBbSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=5g2IgwZmXMsHux5IwV/drcfdc9DEAzlhG95ZfJu10QPVnnVnrPvm6SPK4Hz+5ga0wXdVsiU/Tltlmeaz3DcaW0aTa1qGutlRO1FTXmqk602HDVTbGwXWPs+GG9gyEB5W4ddcuMhEscWULX1DxEiERDZbC5XmSkDoNAKzqAULj3Q=
Received: from CH0PR04CA0005.namprd04.prod.outlook.com (2603:10b6:610:76::10)
 by SA1PR12MB9492.namprd12.prod.outlook.com (2603:10b6:806:459::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:46:21 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:76:cafe::64) by CH0PR04CA0005.outlook.office365.com
 (2603:10b6:610:76::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Wed,
 26 Mar 2025 23:46:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.2 via Frontend Transport; Wed, 26 Mar 2025 23:46:20 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:46:19 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 34/37] scripts/convert_3dlut.py Convert a 3D LUT to
 igt_3dlut_t array for 3D LUT API
Date: Wed, 26 Mar 2025 17:36:06 -0600
Message-ID: <20250326233609.2980110-35-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|SA1PR12MB9492:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d1cd2d-0219-4652-0341-08dd6cc068fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AZ8TlTto3iZ6EHKWVNdtV8TlsBcRYP7QUeQpllf3G5lskjqhDlKEmw+gRIDF?=
 =?us-ascii?Q?Khp2R4ArE/stTHCvmvVpMIsJ6AJxkArWT89NSwYiv08C+Cj2Z4RvCUkYPjML?=
 =?us-ascii?Q?NT//2t1f+horBMvq4Qa3kB51cW4KYSqCVzN+T0K+om3BZVQ0gnAFeJySz33J?=
 =?us-ascii?Q?SaEPpihZAJr8ygvJiaiECqAQKk96cS6K4OvO1A3h+58KrqiYqYFt83hkgr95?=
 =?us-ascii?Q?FCJFDy50gqvEPoCpmee9rovXDBEdH+A418xn71ISh0H8TMaTlA/Y4lVwKN17?=
 =?us-ascii?Q?+aqM/O1KYWJrvwTr+vbbN9n8wJ4aF51e3quHTALZ9M7Ei2jtNXqRAoMm02TA?=
 =?us-ascii?Q?a5+kDai4tk4+8+mHyMIAdVwOcm8/LpwDNyfP9CnyRyxD/tiKEvh55Vghb3NJ?=
 =?us-ascii?Q?niRxvX20Ja6RdYGwwpeF6rzkxaF151hMOggvXTIXFQhtpCYctDt9bynO2HO1?=
 =?us-ascii?Q?5ZZpu8VTHngKxYqrJogeQYO42FmFt4xPpSSFxbNNQdoWMXMtk+syLkC1ACSM?=
 =?us-ascii?Q?BdugjCD49rzrLsl8fiJ46HiocNf3JwPyVDEme/GEbeGFLGAo1jySk4QQdms1?=
 =?us-ascii?Q?rYbcs9BImI9mVrMlHk430n+YfFOaWPwyg4n6G8KQw/APZ8bdCiMu1xzUn783?=
 =?us-ascii?Q?XC9sPfb9o5BnZS+IyIbl9uC1qtbYtkHLsqfhhOK8hqJqj1JO9vF0v3mRmhSG?=
 =?us-ascii?Q?N3SOq8QKqpRSZH62g91k7h2O00EKLt/VcJxcMblB0JPbdhZAvJ3nWMMb3DyU?=
 =?us-ascii?Q?Pu/3clRNy48ISsf9/2nVUCXhQUZS1KNTTRVgYpOgmjJvQwZoGJpK89KxRqg2?=
 =?us-ascii?Q?bgGhL765Cb3K2CdhlpDL+cKiP43is8X4RMHwgOoNtUkdvHP6eR5E/cIm54NK?=
 =?us-ascii?Q?Lxit90ifz/wdVmem8J2FHKqs+q4qmwUxh8TGfYONLFsRHDMsCyk+d1+gW6aE?=
 =?us-ascii?Q?uO2nmwWSV4wDidycjXyHQuxs/EWCvDFtbFpS9TGgXmhTD+MxUalV5F9IeupU?=
 =?us-ascii?Q?56ObKvo19gsQN+nF69XnNoRWjgT6yxW2UeEv8ahuBI+aRNI8c13R3Aq9I1pI?=
 =?us-ascii?Q?CdOlBqhZgfvrvEDQExJHU3l5Bk82LC3Lc93++BZMecgtJkXbqafWfHK+twW/?=
 =?us-ascii?Q?1KAnwp9ZotppKSGY5UVRagQEOTaxnPaKazUNOgBmRL+dMIkA+C5AkYdT1Q/g?=
 =?us-ascii?Q?0agXzD7iBDzE1z2F9iwxK0qsE2iuVAH2SNspv6Z4A7eG8BqswlPe2waFIOOj?=
 =?us-ascii?Q?VdMpsBKiMGKItDcjNRSee/hPr711Xrvf70isMNkJ3R6JShiX4saSqEYREmDg?=
 =?us-ascii?Q?bip68YRHJQtcCqlwVWxJOdfpNuifMxtxkbZX6+UqQN8dW9DFBJtH3QOsbwRK?=
 =?us-ascii?Q?HNUK58KnsTV9e2NoyjYBhJCcPszsVcZh95hsIZ0fEs60u7/xbDqo2ETktgGd?=
 =?us-ascii?Q?gJ4u2SkM9f5NHl7ywpQWNn2nBnRBpxk66ofOYwJvwNagUeYULyVtZg=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:46:20.6701 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d1cd2d-0219-4652-0341-08dd6cc068fc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9492
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

