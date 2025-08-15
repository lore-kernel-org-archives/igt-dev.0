Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DCDCA0ED1
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:12:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA5210EA63;
	Fri, 15 Aug 2025 04:12:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZwpS0rE+";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 377A510EA63
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:12:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LDcpO9rgUw4kS/JClaw8svVspmOvARcxbGNY2WSoyA6nLPB9v6KIlDG1oLodcsJhlzeQqKI81c08phSXoGvdK7lUDJLRpinizyATNbMPbfVU1UhG/H31uZ8N2l+HWA11UYdZ+3dW2apSYsOA10b7SaXRvM9gAC/SZ54wpboqFegl0u57k/7TAMGUFA+X1cD1z3SWW1soGh8S/rsp+qdum7N9As3oxLNKii8bhIlb1azK8lAuwrGXfV53skgQmU6RNrOeMj5bj0pO+26YlpgljHQfZ2NW2tX4oU86b/VtrSbHXHsE87wSDg2CTqzhvAG55W78KWbOECo66VbOH3Ybfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=AOXEeZotvexApsDtcIhgF4OlNmrWSkgrbJSg13VFhpeHPUD6O8z53J544YVFebmTW9lQlyiu9sdUfB6HgB2nzfkT73swCwVYaB2s0KAN23N3nTnxy7voN1yvf6/lG9lehRskepqSIGaurKv9hVJYTb08OBe7D6/nzlpDwi3Ge4Sb+pnGAcjSjBi8+zR0hqnIX4Zu+AFqj47OHgSoCNfsGeP0zlLCnh20oAyqOtV0H5pMyXucJNCiVIV3QmLyrYdp8tWxL5Uk3DpWUNRXGM2IBQzI00GVnELdkPWR92mZFNloqS+lIUOCTQYBG9CWjhEY11A1MNydL28NxJXZJSofrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNqh/UiBfAhqUxZpLKE7ErOwDEyL8/860W7mvRJgxuk=;
 b=ZwpS0rE+Xi+vR6p+0TKe8mxGmXZrSHm+UtDO5jgOEdv4wU2vvzG3xi/lboZYntpbXUvx6eDkGURDkW0dyqbdxKHfaj13RiJBbgpzsZx1KFkz00moTMxwXNMl/LEwoklKAskzrfbz66pfpSrbSTNJCWEpQ+3glkNrs8Vjir706yA=
Received: from MW4PR03CA0114.namprd03.prod.outlook.com (2603:10b6:303:b7::29)
 by CH8PR12MB9839.namprd12.prod.outlook.com (2603:10b6:610:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:12:31 +0000
Received: from SJ1PEPF000026CA.namprd04.prod.outlook.com
 (2603:10b6:303:b7:cafe::28) by MW4PR03CA0114.outlook.office365.com
 (2603:10b6:303:b7::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.17 via Frontend Transport; Fri,
 15 Aug 2025 04:12:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000026CA.mail.protection.outlook.com (10.167.244.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:12:30 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:12:26 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 26/30] scripts/convert_3dlut.py Convert a 3D LUT to
 igt_3dlut_t array for 3D LUT API
Date: Thu, 14 Aug 2025 22:06:55 -0600
Message-ID: <20250815040659.3321102-27-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026CA:EE_|CH8PR12MB9839:EE_
X-MS-Office365-Filtering-Correlation-Id: 1be0ed91-3169-455b-283e-08dddbb1f40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XcwSk08fsU6b+ZqaRq4y3KJbTiF6wdSPJaWeJW0GzeV53jbHjWmAX1y3Jrrt?=
 =?us-ascii?Q?FUWXahiXGw/CqX1Q1knWPlu0ejkdX9jWLN6AyAnfa99Ux/DtGhPOIqr+7C2a?=
 =?us-ascii?Q?Qe0wrV0hN5+yMutrygmBvZ7PPNn7hooHEx1t4rpptLuRhTsVO7E51jTBtqfP?=
 =?us-ascii?Q?Guc2QP2SJPOCBJxe5Bw5LL88YGt4ZxO0dyX93/Kf6w1dSM5VlDnm/4p/3jK0?=
 =?us-ascii?Q?IpcZ3WrIgObjLoTui9iKuYS41KaoOkBF3mTT+LogE84oZSKReQSQV5a53LKm?=
 =?us-ascii?Q?CAGdZz56KRH8hiyeHwRjxaS8t0XK0AKu0juT8ZMuICjcwVwIXriz0jWbZm5+?=
 =?us-ascii?Q?Im2ct8x5uJ/klYPJPad2CdltAnfLauFGhrbxKwBdpsFdP54uUx98UONMexGO?=
 =?us-ascii?Q?C4FskyDSoX0lc1Nd3XgVi9IOkSGDfzw1UDJEISJV+BIfZdNitTJ3NukhD18+?=
 =?us-ascii?Q?UCAXIXrg+3iSI/MWAInnUsa0huv1uUZa00UT2WevXL8DbeMuWdamzuqa1KvV?=
 =?us-ascii?Q?Sznr8ARrQI9teolMnyXuz6MdmqhekUHLs0QoBZZPk079M7jafui/rlAJ/M/R?=
 =?us-ascii?Q?yYz7PO72ITikRmdxxRWDt6uSCV80tvPVNcSmVDFbiHsyd7Vubnu0acyvqADU?=
 =?us-ascii?Q?9jB9eyNmGDg15MbAJb/yR6bu8vjKt4Rq4o9YJurlMZXBBMSkpHSgQhG5EFa8?=
 =?us-ascii?Q?xiyTtttZwLO/weZX3LNT9+EJSfyl6JTTmlnTG54iPxkgJnuS88jsgOJ1EHg9?=
 =?us-ascii?Q?P2KuK54AelwbKQfyN4lY+FI0oaC89bMrMhNG7JTQNl4GRpjqgUp6CjqY4izx?=
 =?us-ascii?Q?fki4iV+nhTvpkY3WEzefFjERhmDRQDdgmV9GHnGem4y+rih19QMlfsEjLSqH?=
 =?us-ascii?Q?oY+CPdHOfVDW5YODQ7HYtPI8Pybl35VtVtCNa4ykzfHp8cNgtBYLXZNEvFPx?=
 =?us-ascii?Q?0hkZR/5oJCimJpdrX1+bO/zVMLh5fgFoMpiqPhJUV2rWZRW0+V6xRW5GE1s/?=
 =?us-ascii?Q?1iiedVcNhoSfcdmN4ewuhwHtLVKEcb/cNyMsYUGI4zWOwp85WEqQkSEcOvJo?=
 =?us-ascii?Q?hd0cYG/7M9SbXD5oS99G/J9BpYeLmF8aw3nDKyifWP6S4GBStXP9IMkgoRkb?=
 =?us-ascii?Q?x2igrHFXmCoBkQPeZDLZ+5PXtSsKncFUgJSyHGXU5yOlQCp7CTHbUaCvg6eA?=
 =?us-ascii?Q?ty5uK1K4DUrQBRLnTT2T61IoV72ZV/8jDpYNKpusa0OMM2HY8ayjWsi5frww?=
 =?us-ascii?Q?SA++Emb7Ub7KOm+N+ijuRDeAJmOu6N17s7uXGUdfTpGfN8FVBL6NrJtSa8cQ?=
 =?us-ascii?Q?Z/k82JLa7Z/R7PG0F6LOZ9jwCM9TJ097WSz21ezeAWgl98DKuQ5tj9o/tCBe?=
 =?us-ascii?Q?So7vDlpB/XV87Gp6cLo6vsVDSHSEiJ66hk+IbZfLgma3+J2YgvCPZ8SeKOWA?=
 =?us-ascii?Q?2p5spKLVyUynqnTDc7KUxKqrSyr4QYwN0Nw1eFjK4pdRGHJiX0OUjYLwu/aF?=
 =?us-ascii?Q?/XbVrG13HC//RHO4Dv20yUJ8p8p9dPmhhAyn?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:12:30.5336 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1be0ed91-3169-455b-283e-08dddbb1f40d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000026CA.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9839
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

