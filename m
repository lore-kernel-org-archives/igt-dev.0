Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C418CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:34:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D4010E8C1;
	Thu, 30 Oct 2025 04:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HXXdAb1M";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012052.outbound.protection.outlook.com
 [40.93.195.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9CD10E8C1
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:34:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RdOsek1Q3sGTQj0BRtgCrWFSIR0d0Q8NnILO4GKsY6sgRdBjOXC8622FHTAs37TseHZi8UJCOOD0hLD5+nZeIWXzvXwryztWysZADyEuwYOgIP8U1GUTP0lU9WxzRERtZ7XlwIGXLJWbB4FodTgObVt3Yqy8SmYvAx5saoNhPuz0hm1hn74lZG094gQEqqPFL/i+cMdMKzoRSavKkrtitkmkVzsyo/cHorinx9zvAEsntT623nH/vdvNQmRbGcVLihNPZ9HLi0CsdtK1kD7Sl9NrsTsuHQ0qiqieMNd2Fm7ZzQiChS4VsLBIHziIeAKnCVBT3mSSHtNwubQouyWedg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=jHXiijAaxHWb5TlwFP4VSoNqy+Lj7lG2e8+ecXmPbBKQZzfqNk9O+GZBpOHGv2DCHQtk215ktuk4mYGUC1gFRNFegEG1ijlpvmrshK5aQo+85pd1QKbm9Q0+TjoqIg/6h2ibTUyUDs3ao1IN7amkhjzZs/kzPZUPiVgd6CGtYsdx2KTAc5zCMNgI4ulCrSDEmWkx4pIBNniLaZRGor5nVz5v19GOx/2n2VxKS6pWgTM0xJHpm4e39HKK8J/YDul6nnevlHSlaTSNMbVSanjl3H9YPdNhvdGf+aY4+/HlLug5f1TSnaWU+9HhbdKN/hm5p9J7O2p266P1qivxDvUqgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=HXXdAb1MviEBAuD3+QfZAOR5t8qhvb57zOalrYFvoRMQJKu19j/QizK5wk1T1SW7ZfujWka1z8AwdNZ5yeLStfR66XIGYoZk7dSjWctKyPp1NOOsUfh7w4m1pv2ETRcbX8yxhVn0TKa3a00gvX8KuTWnjZg65B8cqHoYPrlCptk=
Received: from PH8P221CA0057.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:349::12)
 by DS7PR12MB5813.namprd12.prod.outlook.com (2603:10b6:8:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 04:34:30 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:510:349:cafe::91) by PH8P221CA0057.outlook.office365.com
 (2603:10b6:510:349::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.14 via Frontend Transport; Thu,
 30 Oct 2025 04:34:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:34:29 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:34:28 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 28/32] scripts/convert_3dlut.py Convert a 3D LUT to
 igt_3dlut_t array for 3D LUT API
Date: Wed, 29 Oct 2025 22:27:57 -0600
Message-ID: <20251030042801.2315866-29-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|DS7PR12MB5813:EE_
X-MS-Office365-Filtering-Correlation-Id: 76bc7321-5867-4c22-74cc-08de176d9dc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4cknAgUrqm7Xg3ubMEhd5FM4wSEh8uYX7pOFTFxctnc/DuS4myU7bbrp8DjK?=
 =?us-ascii?Q?au6jBGKoDCnbhX3c+3hUIDkMVH+/8YZycAhgsy+gmlv948qj1VCufNzApoiW?=
 =?us-ascii?Q?X/nTZGO4BFMnfsYY1GMWq0qj4YpIVQKbMJtzlED3a+2Y9jWpL6ATpGGsxm7j?=
 =?us-ascii?Q?FqlVoXoFu7W2d4FssVbSJP9xklm+l5ns/LgxvydAdYazQsKFT2hY5q5YqkEn?=
 =?us-ascii?Q?K/xYWCJPu4Ik0pW758AAJgsJwF89k6b8hdTEhN7XGpQBUbt9u/k8guI3hIkh?=
 =?us-ascii?Q?icwK2Ziikx3cTDlp1N1EskMioXN5cNFFz1eSjYcC4JmpNmmWKkpzMcP47VtE?=
 =?us-ascii?Q?mlEEjKeBTVvpWfcQGUO21+sAAEZfGIpVPViSo//7LXJrM+CjHR23raxAK/Cq?=
 =?us-ascii?Q?fqH3Mmn1v9McwKKYiphkmlbdf1pNk7ZBi9vf1nv4JNDYnPi+dQf1T9ShMOaj?=
 =?us-ascii?Q?lOe9BTystYT6tjrK8eZ50kBwdYEFcPLQnutPT7y2/UptouYwWVc0cChvziyT?=
 =?us-ascii?Q?7ZeR+wTOE96WcKbaEFY+owE98JcmvAuo6+zCjq3ePXKBi2n/gfzGmfzKb1m8?=
 =?us-ascii?Q?FIb5v2Ri2ggduY2LDRGGowDSnsZbKd5T6DC5EMRw2+A+D7afUF7ZInF9j3Gz?=
 =?us-ascii?Q?JMbfKOb03qmeYFxApP892nF2kfCsZ8nUGONVAEDCWSdhKMhRUyugr4t9uSXB?=
 =?us-ascii?Q?lDgbhIvaUNLJ54QrzvWNxEMUzZupqy0p3voyFNEdDLTKeyyWLCoZ3/k7/YwW?=
 =?us-ascii?Q?XfY5mPETy+6SopCnZyvgas6RD37hgdTKwEANW+4QFKhE5D3bKf8xLZj1cxGz?=
 =?us-ascii?Q?jEPR5/yQrlZzNKYGwF+ZDbnpt3a65ki8obcsxWNcrAtfC4Ut2+Z2r/TfyZkI?=
 =?us-ascii?Q?fFnIK3OnjKc0YgWuv+4Nyzh+UjDF19YO5mxipAeu0Qv1ru9EJzFeHfaxNajB?=
 =?us-ascii?Q?Rz21RB8abcyeVvyh7DTPozyL8n2aFw5VLVbL9UfgWJ7TQVAItzSHnNde8VPT?=
 =?us-ascii?Q?iJb0viJW39ZjgyaEkw/oSXPM6vVfCb3qQ6aIHxjxR2FQQO7AWBzN1BLKF0NF?=
 =?us-ascii?Q?I75PtDJxrZZ05zK7/T8Vwhxk74srWEoIAFQTwEtwLian3cy+dELr51sBPk/m?=
 =?us-ascii?Q?eN6VPwv1huCQ7cilw3h6RV8ictVFwH7eW2lRiHNsjD9ZyfjwglGvtOUo0t0S?=
 =?us-ascii?Q?s1L1ecplIUAXZdxK/FQrcuCR7ZyTPr6zWoKyH1Vex3SeaTf2lMadwN3Kmrj/?=
 =?us-ascii?Q?gaI0aDGyvw0Qg8umVBn4YmXvGJJkPW2RC96pOvSWf3tIG7RHVLXbpGtReGIF?=
 =?us-ascii?Q?8QaJ9nQ+WWN0igQA/+PWXCA6nRGHxQHjs0w51iv7KO1Bl45/ZJF4IhO31C74?=
 =?us-ascii?Q?Vb5R47QqHlwh2xbvGL+BtzNewdGb3fDpJSXEqzxkTCbg3IEgdS1/w2gEDE1C?=
 =?us-ascii?Q?jTi9eI1lVXH3hwfsn71456NdrRm2YouahoZn/hcihB5S9peX/gmy8FCmU8up?=
 =?us-ascii?Q?7J9pVlCXuvdlw+Jbrh16/kahW9CKiIZfEEhFSc/Fm3Wql7e+n8OuEu5koHmo?=
 =?us-ascii?Q?tU6VJgYpjRpMaLzfnOw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:34:29.8623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76bc7321-5867-4c22-74cc-08de176d9dc9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5813
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

