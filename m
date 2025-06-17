Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA82C7114A
	for <igt-dev@archiver.kernel.org>; Tue, 17 Jun 2025 04:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9560D10E540;
	Tue, 17 Jun 2025 04:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NhaqC7rZ";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E8310E540
 for <igt-dev@lists.freedesktop.org>; Tue, 17 Jun 2025 04:43:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RkCnikJQM+IjXFRNBS/80gWOOwEMEoa8oniSY7jk87vmZNeaVA4gBJ9FfCxLKUOQu5N84g7uKQo3AOwK9IVM/HKQ2NNz1j+V0Pou/TjSuxkyh2+Ywj04Ot/PqzsRqyEI4W97wFPYzQ6kTh1YKGQfqG34tp+Vt2rODe6k9GkixLpyrDef+5JR9fItqXY1tBb+eJ798prIPSYrqoA3f+63+CtfHKU//iB7lTwhOuroG5n2M9ApUVDAg/qdaPN6nIyZMervKVjDZOatkIE1LzDV6CUXcZ6zx21lPjWGXdf1/iLffrfpa+/hDFES2q7a5hFUmh6htbfbmykkywOSfg832g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=jj3jDAWJX5OqZKM0dTEw00qHi7RmOL0XbgiaJRvAgna6aMxanetsYbK/9YH0meCyVZmoRoguJckSA3CCEosXFQ6S62djGQXQPdhb1gj5uZ4QM9LJuT0fy4yMkI1ivIZ+tbb1WnXj5MgMR3sgGb1vtRrE1V9thG9sET5BjrdqmCLmCiisj5StgNy+qIB3MfEudE2wEYR0E75c5KaRWFJHvF5E402EqX0J5w9UFK+x1Jeuf+j5R4HzxqfYRKBHzAzTecXfMvb6XCJJeul2CilmWxuh0wwQdsPa2eUfojoJQO76VOjujTsjoFlkQCQRTBI9ZV8ySQnBgyljfXnlR+pJ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=NhaqC7rZPPucb0BweGeJssraVF7F3nRxBzlLZjizJ4Lz/q0RXoCmurh+9oe56mtkHfeKhKID5lHMSPHSMtCF+pgaFgOn4NRGzlfXBW6PE/6Timp2IgjMwIuuqOPvZuYu9jEy1s4uCGXD9PISMhq5IBDNQMiHeUGtm8+nSInE5s0=
Received: from CH0PR03CA0004.namprd03.prod.outlook.com (2603:10b6:610:b0::9)
 by DM6PR12MB4417.namprd12.prod.outlook.com (2603:10b6:5:2a4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.30; Tue, 17 Jun
 2025 04:43:16 +0000
Received: from CH3PEPF00000015.namprd21.prod.outlook.com
 (2603:10b6:610:b0:cafe::ef) by CH0PR03CA0004.outlook.office365.com
 (2603:10b6:610:b0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Tue,
 17 Jun 2025 04:43:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH3PEPF00000015.mail.protection.outlook.com (10.167.244.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.0 via Frontend Transport; Tue, 17 Jun 2025 04:43:10 +0000
Received: from SATLEXMB03.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 16 Jun
 2025 23:43:08 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>
Subject: [PATCH V9 32/36] scripts/convert_3dlut.py Convert a 3D LUT to
 igt_3dlut_t array for 3D LUT API
Date: Mon, 16 Jun 2025 22:36:27 -0600
Message-ID: <20250617043631.2920587-33-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617043631.2920587-1-alex.hung@amd.com>
References: <20250617043631.2920587-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF00000015:EE_|DM6PR12MB4417:EE_
X-MS-Office365-Filtering-Correlation-Id: 724ba16a-6c60-4dbd-7528-08ddad59766a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vWrdTWk3rZOGCIyXbcrPdfs7LdSfN8mCpRjWTiFHIs1v5vCuvE6B1+/qMKnZ?=
 =?us-ascii?Q?u0k0gFfYLO15g6s/GCp78NbGVszAhRndmuhsLvMWGkRWhpyV4Tktzf4/9+3n?=
 =?us-ascii?Q?kfOjoN9j1+rycMWCjjovj17hbLt1ZKAYT0c8U4wqf90p9ClvWZ6YXhci08Ms?=
 =?us-ascii?Q?3PV+shN4fwJxB3Mn/psB4TyD2GIwBG7Fhg23ZvDm0LQ2Ww1vPx2BfZlbjeCd?=
 =?us-ascii?Q?+xEWN/o5q7cgmXcfSJ4WkDE7/vGgx6eNPj80XUv/RbCPAuIM8Y3APPttMCCY?=
 =?us-ascii?Q?KvJZ0jriJ2cizqkxOzxQa1W9NiJE2K9A89pFKMlA+ueknRxuE4LLQ4K65dGY?=
 =?us-ascii?Q?wuhKKxyiKOVJhZyNn+WmZg0KwxsS6HSIMSv9RkRYTQSxvDPCe6nNYn5HUMX5?=
 =?us-ascii?Q?MZkSzrP+HFXtee9HW71vgK8LHnIiHkhgbs52gVNuiMuj9M674zmFhf7q2RS4?=
 =?us-ascii?Q?d1OAASCVygjrEmcmmJpcX8dnqrMsspcXsPSlPInJ6VQ3lvJNnk8qgfE6S7mQ?=
 =?us-ascii?Q?Q7uMUwoeaEQdKzF2urO7JbR49sCdQkJi35lUbT9gSTg4xtNXv1ZMmR5at7yx?=
 =?us-ascii?Q?hsLAwA2sAyf3w5p6TOXJIZOjy4/us7z1PtrIRZSJBSbJJ8rNi7qOvvxFjVl5?=
 =?us-ascii?Q?Op/azv0PImIKyAA6yH6zXauG/M4cTjPhdybQ49uy79lv30sSu3v+gdMBbmcW?=
 =?us-ascii?Q?1PMnQCGTyFNskKJ+kVwPU2UMo8fJInWxdVQo8vJ9+fwPum6HOTFBJCMRolju?=
 =?us-ascii?Q?dB4x5k+Xqi42pdf3dTk56YLeqzhjK5VqOya9DtxIOXvn+n7bWuv8lYa/NAVR?=
 =?us-ascii?Q?7qX4AAaVXt+HB2oo+UQNXPb2LqbaviJNZ+Kf0Gh+IQHF+XBrdbevqk1HsWro?=
 =?us-ascii?Q?XjWKlM1+nQQoBgNzmbcSLnEOQ8KnpsQPmoOOAZnZ7L+mn0gdv1VueSKUcews?=
 =?us-ascii?Q?3TpnUS9TrT60wFKt8D9+WUsvz0IvojVPLV+EymOXBl6ePOJTyDLcMQuWFSou?=
 =?us-ascii?Q?pLpq5A8AcYTjbIi8jRwGhAEQCk0vsgEbhrWbmlYjKT33v45/X9ffrDZ44VGf?=
 =?us-ascii?Q?xGWce6QlBFmgsQba8GlmRT/GIFrEX3y5/xPqKnZ5nFv4Rg+pD6M/fF3bAs/v?=
 =?us-ascii?Q?fQcT6n66dtHiFp9UBzF3jWn8KpYUkNMEL3CVgSgWHwFQVW2wqNW3u9TGBqOH?=
 =?us-ascii?Q?7AL5gvCGO0Op/RknvTLVfde1KMGbkhoFX9mi1Bk+wadwhLQdQmi9KLtQRg3I?=
 =?us-ascii?Q?5cawL8m/BjjcS5juKlNRTcZ91Ur04IhgxAVMKenkY4QGMU+vyTW7sW+DA0Vi?=
 =?us-ascii?Q?KLNGUQMKNGrSrY3sB3cXIAKVK3+USYfnAAPHrrFoxBB8s4StSJdmMQs6v3+E?=
 =?us-ascii?Q?rnpZA2b4gYmGtn9cDzP4uzdxll/l+wnjowd2eeCtbB7ZrXa4NQ3PvURpI5g+?=
 =?us-ascii?Q?FxKg5A+PKC6ZgUaj6MD7kIpglmaL8qaJbUISLNyL2sQOxGlsEdpanzxGaRyg?=
 =?us-ascii?Q?w4DfgPXob9l4Wt7mHYFhMqC0Dqf3QRxVjT9Z?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 04:43:10.6289 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 724ba16a-6c60-4dbd-7528-08ddad59766a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF00000015.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4417
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

