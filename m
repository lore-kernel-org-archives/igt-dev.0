Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89EA7CD6E5D
	for <igt-dev@archiver.kernel.org>; Tue,  2 Jun 2026 11:49:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 182DB10EFD9;
	Tue,  2 Jun 2026 11:49:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Gk6GMynr";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013050.outbound.protection.outlook.com
 [40.93.201.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29FD10EFD7
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jun 2026 11:48:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKbc61q9xz7HmOj/oVmlwyQ9TL3isSVap3QXUGjZwXzlfWgGsxG9BlLWhdwOtAlBQRaWiIivkfztEu59MkIsDFN2r4OKePqBc0IMlNs53c8ayovMiNxvTZIuu9qrfBDH+qLayR2+A/fdu2kfnK0ByUa9JqDH/CEqyEMHV7bWDckAb4M9Uq4WNOhLplJBsjFdX7X6EjA8/aeKU7D7ZFZv6IVsF4JieXNj+uH/q+QTfiNeH3X7bZL9kY87zHxa+Y9v6wJe3koOhGGv3Z/QCdZESKDNRb2JUjEbAPI9NcHj8U3x5RY2t6/DSQtCnZdnwHjfZpOgLj/wBB5ENH3GtFeCOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WdpLPCcBWa3LE/d6eFvYNYRROLeBFMh8NiuIAPu1ytM=;
 b=Ft8rLmgHH1uaKfDF81p4KKY+2MdxGfmCk6AXe6vN0h+XEnhQMhTSwccJty/0IQ3+JRpz/fGe82C3XHlSYST+VD3NugSS2x1f3BUVQ/OCITiKXhzWC8XjJxct5+W4fBIdx2heA6PHiisJnLA3JUFSlrEY6tV/62jR/VMdJh7rWaxVb4INQs41Hl1/z6+zHpmGcz1+FfJdiw+IpnMT77UxMhYDLmma1ISIv6rNDV1qqChWO8RylO5wmxQ+h8l8c/7PlC52XFHl35t5zsEJ4q+i9zp2qVpHCxxYAo+bKrenv74AnSOSSsv39M1F2CmpVxhu0UdwGe7YdoStNl6jtlXhAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WdpLPCcBWa3LE/d6eFvYNYRROLeBFMh8NiuIAPu1ytM=;
 b=Gk6GMynrtW3yV1Rq8wZsovO6JC62KbPWYiH7WmI0eJ/o/qIriRPjLYF/5x4otb9WclpwivsM9aLIz+x6haPKrB2yQBXSJ/1wvCHPlwiISsMHPYaWp5H+vwndKNWxxOUWgPQYpGtZ2tBmmlzWgUH72eWTsAAePC12XYoLvDKBkC4=
Received: from PH0PR07CA0020.namprd07.prod.outlook.com (2603:10b6:510:5::25)
 by LV8PR12MB9618.namprd12.prod.outlook.com (2603:10b6:408:2a0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Tue, 2 Jun 2026
 11:48:49 +0000
Received: from CY4PEPF0000EDD3.namprd03.prod.outlook.com
 (2603:10b6:510:5:cafe::95) by PH0PR07CA0020.outlook.office365.com
 (2603:10b6:510:5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.15 via Frontend Transport; Tue, 2
 Jun 2026 11:48:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD3.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 11:48:48 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 06:48:45 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>, Jani Nikula <jani.nikula@intel.com>, Alex Hung
 <alex.hung@amd.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t V4 0/2] Update VPE blit test
Date: Tue, 2 Jun 2026 19:40:23 +0800
Message-ID: <20260602114025.649389-1-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD3:EE_|LV8PR12MB9618:EE_
X-MS-Office365-Filtering-Correlation-Id: ea825cb9-0efc-4bba-775f-08dec09ce8f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|13003099007|18002099003|6133799003|3023799007|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: vrfy6rqlQOLw0LSw7Vp4X/SgVBDu7YLSuQMPp/jZb9pLOUcxWMMnEv6bydLivUs2c+Uk4VQ+Dukig9Ffl0VLEKkSan4t1RMvD2iJov3NwjmHVkRyeE/Oq93V2ZVAJ5XWpyvXLcxcErizDqjzlF3MZAE2c3Up5q/e9Bkb3cKdtCptAf9bh+qbGE1/fTLAxcEH0PVJF5Lt9C5y0sPJ0MXJxY15TayLsk+srbO9kn+yerW5GrQcynwECuY/xzxM8oNn4LoatVUOWwoZV/GgENDK4JMu0HG+kXF+GCLcB0g0PKMMIXsY4/oLwco0YWju+8Lp68gx13oCOAgOL+M2+s4nWD/4q9Q9k9RrgfUWgxF3ganbWfgRcwx9Z/mEzxzs386I7stLp8CxbGvv8vs0f7o1ZVcsj47jjeakEuaDyRwE10y15H0w1UuYR5l6BvqxLf/ix7dNULoa2vxqdQ89/0Z0yoFpHZQ6fKp/l5QQMu8H3wIzuIjV7xqL78x1MdSgvvUquh22bamKODtDLw/QCGT+95Zq9Eso+qKVsWFG80pLLJsdyl+qQZU2cRpRvkx8G4mI12BGqhzL/tFhZKxQ1f/L0gM1Etiuq1E5r3OjUqOyX9tmPaWrrzskUS9QgdewsQhYMalpF5Xdv9v7B7Y1JxH0GUssFCwl0aCC4UqGTOBlC7l5xGnmBNvqHihQjeTJph6a
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(13003099007)(18002099003)(6133799003)(3023799007)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: GCYcy7FaFirDmhNF2QQaiMJSDEFXQmisRwUQtkzqu1W6d7kK7vEe6szWg5dpU7htpqx87LytXASbbRN6abknHRXQzNQJAPInUixPjeGO1ouae1eE4OGzjM4p1XoyBhErotqiKU9PYGhuf3+TcM0p8R4e6n9B6Pc0CV5GFIS7wahAhIWKV8ufUYdk0t1RcTA1vbuk8irtYVssAdl1EDxIQiS+71e/nrRloG7cFULLWKn0SvgWmg6ahMEPMJFmHDeYo1+SD+RusNtBMzxc8PJ7DwswwyNvAYY8Zuyk3yrCe3yrwx4rI+vRJVuKMuwhZ8OTbYPaQrk1b+ukYGgOdxC3FtzXFXj1JpSbTFYOOoULJYM6SaSDIDF60XoTve2qegr1yhY4XvunfdHr+5T/T18MLrw59LBKioOJDV6QYoScGFqSnQVy2ZEzoHlWhAvr1iow
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:48:48.7825 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea825cb9-0efc-4bba-775f-08dec09ce8f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9618
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

For new VPE2 IP, commands for old blit test are incompatible for VPE2
HW. A new test case is added for VPE2 in the first patch. A new header
file is added for placing macros and a new source file is added for 
static arrays for vpe commands, so amd_vpe.c won't be flooded.

To retain compatibility for vpe blit test to work on either IP version,
a switch case is added in first patch as well to call testing functions
corresponding to the under testing IP.

Blit test for VPE1 is refactored in the second patch to align with coding
style and VPE2 blit test.

V4:
1. Fix comment style to use C style
2. Fix indent of switch case and subtest declaration
3. Squash version based testing setup patch into vpe2 test case addition
patch, to avoid potential regression

V3:
Put VPE command array into a new source file instead of in a common
header file, to avoid having multiple copies of commands.

V2:
Solved unused function compiler warning (new vpe2 blit test added in
first patch but only got used in second patch)

link to patchwork for V1~3:
https://patchwork.freedesktop.org/series/166844/


Caden Chien (2):
  tests/amdgpu/vpe: add VPE2 blit test and version based testing
  tests/amdgpu/vpe: refactor VPE1 blit test

 tests/amdgpu/amd_vpe.c     | 256 +++++++++++++++++++++++++----------
 tests/amdgpu/amd_vpe.h     |  42 ++++++
 tests/amdgpu/amd_vpe_cmd.c | 271 +++++++++++++++++++++++++++++++++++++
 tests/amdgpu/meson.build   |  10 +-
 4 files changed, 507 insertions(+), 72 deletions(-)
 create mode 100644 tests/amdgpu/amd_vpe.h
 create mode 100644 tests/amdgpu/amd_vpe_cmd.c

-- 
2.54.0

