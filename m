Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F821C5472D
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62BF010E48B;
	Mon, 19 Aug 2024 20:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Q3DDX1FQ";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2085.outbound.protection.outlook.com [40.107.102.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F87510E482
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fumIsR6lA3HNk0Sdr5JAGYhoC2ItXT5HTSNDtx+R9us+gA/sHtO4OQmIVNl0VUt3gh+dFmS84JS9UF9tuTyZaZRwqlBu/znvSR72nbhC2zmZKnI0DngZfLUT+Rn2yrqpgJTYAuYcI1bEY+E6h71/nYyseqaW1ZeqsvKEyK1IlACM7XoGbefb4x4kgkXxctkBZVOFLZQiJWm41vkg8NYXu6kFxMAWjlbi+uVKJDAwUYcpBiT5aS7gpP9NEwGHYwwG6ns6XYbyOPRp/II8AKGoASXF3uSICP2WJvGk7BDSoUk/kDFEjOp6g1vDzgXr5YtKl8jYHQ9TkVNNiIzotOp1EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvsXuvHKm+qo7QbyQ5RdDf55MiIqPNbCXNi6CIyk6VY=;
 b=Sj0A09vrE2gAkk4mE8ZJT+fH9Tg1ywLHLoGqXzul6iI3J5OciZrPhMovjTaI7cirHflvKT9cTV/xIBXTZ/ijC3VkNYlPNNwgXExlNuZwLLVUoCPe6KH4mgQT5hZnVJxvbnlWA25SaqyQKWDeHxGpDulMQ9yddEP33gaP9yuP+qoUBqCFhLPhIsuLFg1Cugw3o6CkOu2a3NqGOScPRM1mJloPcDjPQYHa5GclPVkIjhVI7N4DZPWJsjHwVSXHHJtOLmxQ586LayQYU1AFAklQJhpFocjop8xPCPh7d0adFP7hTGHOofE9xxLoxu9vQ4d+1eVbpYxcW4bGstpT37WW2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvsXuvHKm+qo7QbyQ5RdDf55MiIqPNbCXNi6CIyk6VY=;
 b=Q3DDX1FQI5jxpmLeEP6Sr+d97kPzeqj3WCYXmkQjrG3XHWfcC8qsmwNTuQMx1atji9WiuQWY2OcDjIOFJcAlHN8u7ktj7ZE4Gn6O7/sgNjuP4qP07zyH5dNUBWPEZ4+u4unPiVHvIdETc+GvZMmJCq/RFgAfaVsOK0lzAfnz/T0=
Received: from BN9PR03CA0870.namprd03.prod.outlook.com (2603:10b6:408:13d::35)
 by CY8PR12MB8067.namprd12.prod.outlook.com (2603:10b6:930:74::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:44 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::54) by BN9PR03CA0870.outlook.office365.com
 (2603:10b6:408:13d::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:43 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:43 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:42 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Hung <alex.hung@amd.com>
Subject: [PATCH v5 34/37] scripts/convert_3dlut.py Convert a 3D LUT to
 igt_3dlut_t array for 3D LUT API
Date: Mon, 19 Aug 2024 16:58:20 -0400
Message-ID: <20240819205823.316656-35-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: harry.wentland@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|CY8PR12MB8067:EE_
X-MS-Office365-Filtering-Correlation-Id: bc7d53fe-4803-4521-7d4e-08dcc091b615
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TVxeBtQs4KDH9p+KTJ/BU+hU/q7GdIJVz1n2iouT9/NWFaO1YjNibdo/LP+w?=
 =?us-ascii?Q?4TWbr4Kd5gThHvjtiL3zwQnRIjvqEc6GCHkqQUyEPeoDHZbYE8T9BLKztvru?=
 =?us-ascii?Q?LUja/Nqq3SSdZ7MCJIaV/MI8OvkZkoaEA+LBLgMKD7PC3SBM5qabza7dP7MA?=
 =?us-ascii?Q?LI4PtZHh/fVTJntmoutdddbj7MjdictqLucgKrj+YjdyMsGzJUCzYQr1DqJX?=
 =?us-ascii?Q?nJDv4c4HWlHB1OPC+RCs1nfe8YYwcJPzvGUS2f/zXrAiQZmkACQuubNOaGei?=
 =?us-ascii?Q?/VSNWs+grULfwBrn8yrNHdSoj8J5srYlIjOJv9ixScZn5KCrf8yLyxlP/X/H?=
 =?us-ascii?Q?dxi1Xk11Cgi5Hb4nBavkIY5wTD+qjVJaPQ5gI40jNgeREBOVg1sz/TVyovJb?=
 =?us-ascii?Q?XPVkpRoSgCOcUVzxYdsZ4MJwnf0wV14C5YIAzVWMXo5VP4TSffD5axclTYCq?=
 =?us-ascii?Q?r/pnMKkRowdykD30TYybqDuBdUqu93jnmnt7kwrUMSU6sMx2tNNt7oshcLBo?=
 =?us-ascii?Q?5Ps7diJPxdQJtHILr2TKYrx3jjY9/YY4ttAZg0KR7FktF4T9j9TipxEqoXL4?=
 =?us-ascii?Q?961SO6IHKnwyS2crgSqJkYMqDG1CVE/nXNh30yZ4i8ORe4S7f1bGn0nNKBOc?=
 =?us-ascii?Q?NsqUeqBWZPhKQBtVBA2lRdS/fjX7VFxDjEEryQelTbtYQly80xAuaGb4rs6Q?=
 =?us-ascii?Q?EV7nSanZZbh+K2sNMI93QvLJxKd0mXlEY7Bj7lpAvSvX2YHiujjYc3aq5xHq?=
 =?us-ascii?Q?fl4cMN0b6IAKm+UMBc8GpabD/bRaiAZntrZ0/RPJ3oJCI06oVG0eVImSByHH?=
 =?us-ascii?Q?8vkaVpmk1PJYX1se1SQOURcMOJt5ORDcLAJw3/337KXmQ/0GG3YEx4Yw93AK?=
 =?us-ascii?Q?I7V7KL89g7UmYdbiUDeN5ge8fR4qi20F9w9h2njMq/OEIF++LhO8yG/hsFT0?=
 =?us-ascii?Q?W3ii5Bbz6mlddUGcpp5oQlsD1CWCHFyyCIajRjMrLcQin3IXK1trjAOameWf?=
 =?us-ascii?Q?15oadASSPPe3ksRiWbFpEJU1NslOupftVMA01pQmPdXVrB4uZcDoDGZQaynq?=
 =?us-ascii?Q?otvonYVbJV+HExoiAyZZTJEygRRZCT1ZEDf++2zMA02m1tc5OpPubUM7Z6If?=
 =?us-ascii?Q?rgviHaloQ0FdCQhBP+Z3+KaPqH79UY6eagjOn05b4T4EqHs/jmmrhxiLOfoD?=
 =?us-ascii?Q?PaKcwol59Vhz6gnCDU9WEjmGwA08AKCQn0sCaPdfAHusc7IfjsxU4WzoVtwH?=
 =?us-ascii?Q?EpwaNIwQU6bAnIf+/sGj7p6I9fMfmx/7FVC+ayXnrfEIV2bfZzmblkuIHYiB?=
 =?us-ascii?Q?JPLU0KWX32wE/wq6CwizBgBMduapvxuinbuCfd5mwRpKnjAi7ofUn2RHrsT/?=
 =?us-ascii?Q?9Xf4W92q7I/0mWURuVdDj7EiO0OxR/JTG2DNM4O3kQdZ92bO+pgcAOu9lyIM?=
 =?us-ascii?Q?HL6pVPkJ1yYgCWByQmqJ1KnUeQid37yR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:43.6639 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc7d53fe-4803-4521-7d4e-08dcc091b615
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8067
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

From: Alex Hung <alex.hung@amd.com>

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
index 000000000000..35189b549792
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
2.46.0

