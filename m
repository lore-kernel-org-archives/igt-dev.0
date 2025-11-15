Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6149DCE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:25:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A35F10EC06;
	Sat, 15 Nov 2025 00:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yj2HqZSX";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012032.outbound.protection.outlook.com
 [40.107.200.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB18310EC06
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:25:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RPfDCzVx/W/clVQwrWYIrlyTMigNVqru46DIS/fCjpVe/eDF5s3y7F2YxLh3ubp6WT28bF4QSG937eqMfV6lj4Vzhit0gsW+aJ+0eqfzBbjIUBrkap0agNH/lXy9kJ1yFvcR3xfZ1+fH6ILKUda5Q5+nmwpSNgloGH2w45Qkrp0tipggiCVk6cIpbclT7p2gDuiFO93nkwyWLdlAMF4OKu8XyjRt+qhhjOryKj1TTCa8C+lbWijr9xeYBK/CnYnbEE6tZlefziXRNiPXtWkAfz2lST0uG3HKuIXZSkrhHn4VRWzAW4Fz4U+sy5yFfTs+56fx3QOYWYbeC7wK6gToSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cMotHwf55LbcVp+qc1s0Ih9m2qKjXzk6CVCDEO0Iji0=;
 b=cAjbbRubFh03jLMr90Ncp1lMmmb6Vg9QO3oPEo2Z7OCp9MDipYobMrtJQ1AFw3EKHBfspBuFyz6Z+Pg4yoPtDVs0gDeCUzqYwhR4XFF2DZRXNDU4lY2UTxz2pamjfU4VAda1ko+3fkqaioBre1HPJs+LA5/aegjBn+yYySjG8PCoRd5SJ47E2xaX6VtTsUwcs+iJQzde5GBkCYd1nPPCNbO8UKbxAVNFyCod2k4hkxY6G5Kbr6jMNnQrANFhxkPl3YvG64olLCRb1ZEGl5afV3QDV+NJTH9QxYp7NnVtGf6PHH5xd5NT0WVM0M0ZyRtw5XJ/AioF2IVc3DIMqWTZMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cMotHwf55LbcVp+qc1s0Ih9m2qKjXzk6CVCDEO0Iji0=;
 b=yj2HqZSXWaeTBAqQoKRSy1U4s1gU7jC0ZxFLkEgCHXkr5LQ/NNXnet5AIEMgdQrIm/kdA7V/BKvpeI17hS/KfHzxxOqoRKwDS2gPQNxwib36FdSnKoKzXlo9CcNokQvAnb0FuSkx/LslyMiddUgQT6rTYbd8eECVpRVbd54oobQ=
Received: from DM6PR13CA0034.namprd13.prod.outlook.com (2603:10b6:5:bc::47) by
 SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.18; Sat, 15 Nov 2025 00:25:01 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::8e) by DM6PR13CA0034.outlook.office365.com
 (2603:10b6:5:bc::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.8 via Frontend Transport; Sat,
 15 Nov 2025 00:25:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:25:00 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:24:27 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 28/32] scripts/convert_3dlut.py Convert a 3D LUT to
 igt_3dlut_t array for 3D LUT API
Date: Fri, 14 Nov 2025 17:18:37 -0700
Message-ID: <20251115001841.3563993-29-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: 50ebb985-7272-423e-bb51-08de23dd6a11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?j3D6+Rf496eX7QjYWa6qQdnn1s1XG/V84z89JJcCZodlq0QlbNQhS8x0jQlx?=
 =?us-ascii?Q?IMAUpAQLpPlc3J/9/fjqwShdOXmp4EuG6Ijz4+M5Umlcxi0cqwHn2+C+sy1q?=
 =?us-ascii?Q?n0RGbqN9npdhqBUpURbXDhl++NtDxUx28n+dToyfLIfwwF6YNvvchCYvFgD5?=
 =?us-ascii?Q?ytmQzrhvLtjT1LRz8Bstn63sENEAkQ1PYrt+VTrOsr8lJmcUu3ON8lfrGrMv?=
 =?us-ascii?Q?e2CKxvSqgsOLEoXab5DzyK8OgajJ8P+C7t769e2yezNLQV8YfzDCEcixtnyY?=
 =?us-ascii?Q?5xveD4UQOPxCbZmxnL3sVQMnOm8tv+vI0Q7359yii+uAMyghZ3tFOl34nj94?=
 =?us-ascii?Q?Oi3axnwNeMKKVYwFSe9nYbFyVWs18X6+SV6c37vswJ4pj9t10rIS2QmCM4mO?=
 =?us-ascii?Q?20f6gnBv1RZ8QKofD0/q5snpIggxUD7ikAUq2xlwg4jHu+P20fI8koMxpd5Z?=
 =?us-ascii?Q?LX0XJVPSx4DkW+RL+RJgS8WkcvTaLArIk1e+BoiQa8fVVGCb02/YD/fVHiLk?=
 =?us-ascii?Q?yqHsVaf9/IMvZTDaUdNxpNCRqPweZtth/+wQRPo/k7encDUnw948pLGUxCmc?=
 =?us-ascii?Q?yXXttoneFlP7c5dpxvc8W5JOTDpGVXteo9SbkHHfscNG2focHpD4OooVuMve?=
 =?us-ascii?Q?6Pp3WzU+BRMgX0mWkNBFDEOqSeevfEV2PlulTJKcc05sKM1Pa/FJVpvZprh0?=
 =?us-ascii?Q?HhorBhqtcFtqa49b5P6rHlfttGLP+Lh9ZUyhmN4ROlYAPuDqYx73GlfMP/yv?=
 =?us-ascii?Q?DMxqnk+bcyhLa8sAQPm7dwbeEnXI8pB+lM5mPVDmWT+0j7/7uO63J/jmFxc5?=
 =?us-ascii?Q?AyTgz6kutrkMLAmL4Q+RW6In1b58Zh9XE3M/wUlrdfRl4vypePzPP4d79lzT?=
 =?us-ascii?Q?odkzKHwcfVdDXD04XTST4jFLCTFV/NkU6Z+rnGafehyzEN+MHX8XQGZXlleO?=
 =?us-ascii?Q?LGSpmBggC2O2e9nMOnYxFFKR1A6qLEJoGgQ6JtPHIgQZn+Yt2+1BhehXVlv6?=
 =?us-ascii?Q?BG5/j0oQj5p0aWbWNPdqyP45Ra7gbJI0RfGpn0oEYHjXsxcMNytixQfHvS/C?=
 =?us-ascii?Q?scy3IplRGQ2VlXBid4PNurV9KKN87Kmwv08teD7rwstRXSy9cQjxryem4V7F?=
 =?us-ascii?Q?5DgkntcZ6VtiR7J0JYKB0EyoLXB/WZ3oZh1qdmDpV0DhW6KFsgScI63bFQlW?=
 =?us-ascii?Q?OIUx4a3VfFDjB/QjVAps2rri/+MzU9XkG9cHoRqvdJIBlyink4ib5+TmlKva?=
 =?us-ascii?Q?aKvilbHDB6amKv+XMr0gVYIxB1pIBNY6B4c7JenXH72HXfE8eO5l6sJ66Im4?=
 =?us-ascii?Q?NSEC5p4S/CELeBtfwOlAQMymHNWTrvkkfB0BugW6xsHjUpkIlacnL8SSfLAs?=
 =?us-ascii?Q?ZcvH/svU8dER3k75eq4Qmsz7XXwZ4qdQAbVcm/XLmfRugloG1cGKX+zA3OQb?=
 =?us-ascii?Q?Oj8wdOOSE19fduGkuIAzaXagi+Fs2KSxyqDyPLDXlyWZjE76VPOl9/rlJMnr?=
 =?us-ascii?Q?ic6SNTYyZx7RfMFX9gzJudjextMnNoE0ZSsGroGk2OJO493gOKeKTU3Df7fT?=
 =?us-ascii?Q?8q7KWkGeISipl31Y9fI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:25:00.6686 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50ebb985-7272-423e-bb51-08de23dd6a11
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674
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
Reviewed-by: Leo Li <sunpeng.li@amd.com>
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

