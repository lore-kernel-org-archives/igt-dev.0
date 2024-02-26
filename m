Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61394C5478C
	for <igt-dev@archiver.kernel.org>; Mon, 26 Feb 2024 21:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D335B10E40C;
	Mon, 26 Feb 2024 21:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uNFt/KI6";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2072.outbound.protection.outlook.com [40.107.220.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A262710E35B
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2024 21:14:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bAF/nZ7bh3UsbC96BPrnJ9pvW5nkWnoOA4xAp3l3a8pialv8TBwhY4xWwtSz06nSj/tDfJ9grCVkZRl1oWvnlE+ff6uqQEQysjih/Uk13U4V+ZNK5nm89q0IyvkgZYZiggoXoSw/dsxYx/KqeZU6NVKh55RvzO7DM5pLR4emnDCy9OqNJNXDVUuUZzZX4dXZCD61CLJ4rVd8wcTAJ/EK52Lk37Oe2GMkS2s5eJJguGiknToY1YosTMar7OYbEt+hEbcLZjEKd9E8oDMCUsHnbso7VtYP+KS6uV6r/7mjcKlSOrCQcgkR6g/9twcENs7by2gH5vcpHxVAebntm+dglA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EEvU/gfuCDAITdLIOiISvxkaa2gtkMXOQYKFdxBWKJE=;
 b=KlfMUD49YD4VLkx3ebfMaI9DNngajW+bsOyBaDkPsI6VCx9fpZFhyKeIOJNSruZ4qSKQCYz5fPmaSif+zSWOWcdwPvEq7bYmezXXSit3sHe7LD1RcER+RLGcZRz5pYjwJ1pxHPjlwUGQuxv2D51qnh0TAIbiZCza/KMk+4pHQ8r7Ni85CMUrEkjI91e4p0wh4xSdUCkKr+zsbBCk/X0UJg2Jg3fw1edt+2bot2RN7LzAcjJ3cUqpNqy7ej539uYBVgnMilN32VklXoh92dmwZJmWSRnLHpPG1FwzrpWRNIEL+7dL9NV7ai0K1kFRNheGKbYjl+crKFIvhUIZC6BC9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EEvU/gfuCDAITdLIOiISvxkaa2gtkMXOQYKFdxBWKJE=;
 b=uNFt/KI6mSeaZq1NSmJSXyf69MOz+JVT9Hy+dV0sFrTTKTAEqUoRDVgosc1+QLW2bykdZ+QvD8oFkvTWyp6N1mpFh2Gzej2vJPlR7rlh51e+n/2QBzlEWFukkLzTX4p+TCtsiBBl7deY0GvT3TlVmm+z4p298Gpalr0we4xoCLQ=
Received: from MN2PR15CA0022.namprd15.prod.outlook.com (2603:10b6:208:1b4::35)
 by DM4PR12MB7597.namprd12.prod.outlook.com (2603:10b6:8:10b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.33; Mon, 26 Feb
 2024 21:14:30 +0000
Received: from BL02EPF0001A101.namprd05.prod.outlook.com
 (2603:10b6:208:1b4:cafe::36) by MN2PR15CA0022.outlook.office365.com
 (2603:10b6:208:1b4::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.49 via Frontend
 Transport; Mon, 26 Feb 2024 21:14:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A101.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Mon, 26 Feb 2024 21:14:30 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 15:14:30 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 26 Feb
 2024 13:14:29 -0800
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 26 Feb 2024 15:14:29 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [RFC PATCH v5 01/32] lib/drmtest: Add is_vkms_device()
Date: Mon, 26 Feb 2024 16:13:45 -0500
Message-ID: <20240226211416.100660-2-harry.wentland@amd.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240226211416.100660-1-harry.wentland@amd.com>
References: <20240226211416.100660-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A101:EE_|DM4PR12MB7597:EE_
X-MS-Office365-Filtering-Correlation-Id: 352cc776-2d2a-45ac-2b50-08dc370fec08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7cGb1YlQ1sGyC4zmFGrFoPbdmTrRYr7LkMvCE8GThrFx8Md6fAMGGFNmXhKeWX5Be3+gtJtoAi2L/9ixVIhC6vx6LtuSTJnKHn3TLUz7Xjiep1ZZPZW8f0vUk/s6v6T2gNcMYWO4a8chms+/FoaGS3b7EDwFTZpo2xMtOqAnC5xSwvC21Ayoid4N3hAGxVZZVy3q6PbXeallXlA3zZHcd/M8XpIkCnuubZfFKFBJOTWISxBia93RdGOy0ROjlVOLLYaK3031Acz3OHkR6dNufc7NS3rz2xKLwMMDgMb+vc+ax/6U+8BE3yWhouP/akPLEG6IWt8K5ndleJ+rhLtaqK9Hz6cShw+wd+/0bBB7smTeHwLEQLFQxRCDwOuxLL2NLlXMKivyy+0RlGJ/33DdWQpjOmCUdHT3zjngi56c0UHU2BaGGBN5W9KYh7Gs2Wu6m2m+usp/T2yCxf+FCdBm3z85RNVlWNzzOCOdvyuXglYaioS/QWd70CeyWqpUpXGOW52o9hQzD+ks6BoDO6sLa349xDbT0pgYnmG42q4VicQdXrf1rhV75HCpmAawBMu/N4jPHRCJwLIWUdMs5PDeyDmWGioRrgdJqPw2OujAxN+D/OcnDso1kbZQfwCkj7L4zcph77I+UoCzIyqpc9qk4KgS7qdpZUbH53qZ1IKKK0SQccYbNZUPKQW39nXjLQ/B+BN3MwFCRzDKJ6GePbCFMbirm0+ZgcZxHP+jboEPofSO5Ztt2Gu6NUAQ+Mxw3Fud
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(36860700004); DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 21:14:30.3294 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 352cc776-2d2a-45ac-2b50-08dc370fec08
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A101.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7597
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 lib/drmtest.c | 5 +++++
 lib/drmtest.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/lib/drmtest.c b/lib/drmtest.c
index 52b5a2020e09..7df9bd0b7cbe 100644
--- a/lib/drmtest.c
+++ b/lib/drmtest.c
@@ -106,6 +106,11 @@ static bool __is_device(int fd, const char *expect)
 	return strcmp(expect, name) == 0;
 }
 
+bool is_vkms_device(int fd)
+{
+	return __is_device(fd, "vkms");
+}
+
 bool is_amdgpu_device(int fd)
 {
 	return __is_device(fd, "amdgpu");
diff --git a/lib/drmtest.h b/lib/drmtest.h
index 6bc81973499c..ddf8ae083b04 100644
--- a/lib/drmtest.h
+++ b/lib/drmtest.h
@@ -121,6 +121,7 @@ void igt_require_nouveau(int fd);
 void igt_require_vc4(int fd);
 void igt_require_xe(int fd);
 
+bool is_vkms_device(int fd);
 bool is_amdgpu_device(int fd);
 bool is_i915_device(int fd);
 bool is_mtk_device(int fd);
-- 
2.44.0

