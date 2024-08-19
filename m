Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D86FC5472E
	for <igt-dev@archiver.kernel.org>; Mon, 19 Aug 2024 20:59:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83ADC10E429;
	Mon, 19 Aug 2024 20:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kzX0W031";
	dkim-atps=neutral
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CC810E48C
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Aug 2024 20:58:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FEHOREvz2ZwqC1WdVnZdDQ8HIzCKcLxPUR/McP0MOg9lR6/urVaC37JXUoGSs/Ms0oF1T0ix67204d6YBiBZp1BF4K3BkafOMSibjd0cH6DPSwqZwKL5PB8vhf5ibZOsU5TC/jsbW7iacdBOWRRkQGhhORAMVVyN6+/Ekw81gponDwHi9ZWjy7yjLOsmG2PbqF1mAA0IFvBwc76PVITW7vXhk16gSYPreIhQcGXJbWaeLhgIb9Xx4ZnuKEqCdxjKvCVa4Qgq/U0SJ5pwqrhJ4I4U5C0e5kjehK9lPPmcMT797TD5mkw3oKRJRdfn02EmIDyaYva6kNq/tEchwJfLLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ICbuYfGRVwocFBH131J2Tl+pwQoiRXcyG29Wp5KeU4=;
 b=dlYKSDrf/gu0YGtOaka8bm3zcpKUOEtqhC4mEP0PaCZEUcAgAJSKHcwt+qbRU78RJZieaFHyQPOVPTZzXC8peVoGHkcOn8rkcCH4KBrUgqhMadnUrKlDh+bxH3/serXMI8FBm3W3hwoyIMpWTGApwbUgKNRZUeI7Xg+VFUM85Zf4KOQS4eUGKlS6HO4Y3ziTQW6KEPVFgwV8STEKyEumax0gRkyaJq21wQxWgoKis+ZBG8BZM33AuzI7z525HaY/7/BQMJmdd5G6Dh9e4erac3hlPjdpKkh/Wcxz3RHyEP8lFklIzn8QDIL7SP+njU4t5Sqch9vtVcoArhDXR/LmQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ICbuYfGRVwocFBH131J2Tl+pwQoiRXcyG29Wp5KeU4=;
 b=kzX0W031NOIGCXOpxvPJErkfdQQ+IVtiQ0j0lakiaMBR+yfhUfRRk86jkTofOI0fNlGRjr3Uu+Ipskfaa5SYw1+LUHUwEEWdn9ah4k+TV1IgKMg2qNto1mgDQzzCbY+bebdm1i9i5T/GnRR79pg4UXCbJhOkezuNrrJ7NZIiO0w=
Received: from CH0PR03CA0343.namprd03.prod.outlook.com (2603:10b6:610:11a::14)
 by PH7PR12MB6762.namprd12.prod.outlook.com (2603:10b6:510:1ac::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 19 Aug
 2024 20:58:44 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::c7) by CH0PR03CA0343.outlook.office365.com
 (2603:10b6:610:11a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Mon, 19 Aug 2024 20:58:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Mon, 19 Aug 2024 20:58:43 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:43 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 19 Aug
 2024 15:58:42 -0500
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 19 Aug 2024 15:58:42 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
Subject: [PATCH v5 33/37] lib/igt_color: Point license header at skia license
Date: Mon, 19 Aug 2024 16:58:19 -0400
Message-ID: <20240819205823.316656-34-harry.wentland@amd.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240819205823.316656-1-harry.wentland@amd.com>
References: <20240819205823.316656-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|PH7PR12MB6762:EE_
X-MS-Office365-Filtering-Correlation-Id: ee65625e-dd2e-4d1f-1546-08dcc091b629
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IcosnB48xjo0qWNS6MZ747MlSv5UWlZ/qgvU8P+RPN/hIACET+a2qGOR9Guu?=
 =?us-ascii?Q?fZQ4PDlPmfQcZ+heQvTkgWdkqKqWPer3ljs5h9x1GuaQ6Fb936BympMAne6W?=
 =?us-ascii?Q?VN2VYTegeof2tPbtVsA2W3Fyxm0quxBfCifPzEWZ4zLbUSbgc3Ms1RJQVdVO?=
 =?us-ascii?Q?wQJIqWAAG0gvLo/gvAyALu+XmOc4JhUrrWf6Trr4ks7xGc3gCYZaPkQivyqA?=
 =?us-ascii?Q?8dlSvEpolTbi+6gkdQF1ohaIbo7PK0O+ifN8ROckmVqhUFx7UjJJ7iBuFES6?=
 =?us-ascii?Q?I9g5LAKJtnDTkTDfksoCX/S1w3kbatRVnt8OlLVlR9thovTu9x+vKEwHxrgt?=
 =?us-ascii?Q?A+nViSS0WaBmZpNeXuKsSD9aUd7IZ755WfK9aSYHr1fNviqzXse66unk4Zql?=
 =?us-ascii?Q?3WWawkdPoQYt5L/mBoIn6Lo41xQGQGiDqPGpQdm8yUEMt2OMs09C4iwy/b6W?=
 =?us-ascii?Q?bIjFqq3V+rUrdQHqnDFvgEQLw+r/BVjwbxFFVq3EDT+9FODu+PS6lWEz8x/x?=
 =?us-ascii?Q?Fj3nMZ8bbphrRc5haEJenSAaByZGGQ4p8bolG5TRQ8Rv6LZ/4hdia4INNS3M?=
 =?us-ascii?Q?2cf1BN2Y5xmCncxwYSWRuWPupMUUlNGep4IUQ0PKcPwdrfJk4r33Nj2sXN3s?=
 =?us-ascii?Q?I3E91bA8ox+t6G1SoWZBR6vwARjOr/xODwLTyKmK+bALTErA6DaqO3ADdUrZ?=
 =?us-ascii?Q?usdk1jld+lzPCDgG6JmN5D1ZyivG20L3MwD5+KHfbJY4zsiJwzYG5A4hJ0vp?=
 =?us-ascii?Q?nfKTE70l7MJJijB3mJJBlP5mCHWmjcE2ZKVNo6jhIYe0qVCLRK+PIdhdpv69?=
 =?us-ascii?Q?1Tg9MgbpJxNqE6bNlrIazMEuxfzbqZpKflhrLkxexbMkMAfIWTjDDoFV8OIY?=
 =?us-ascii?Q?H6LzDBd1qFKvxGf6j9iMuOEjZSOGnt6AhHwjx30spyqdee8OSRks9w2qhRPy?=
 =?us-ascii?Q?hAOfZ/PpPAUMnx3Q8NOLrM6yk0hxIxRJl01ED/TuF4JmRWXn+V4HuHySv06Z?=
 =?us-ascii?Q?HafQaVH2kf/MxoPQh7zIqhTkRjuvGFccdP3VQuMQrSEPOc0LB9u3+8Z/EFCU?=
 =?us-ascii?Q?EnzSjHX5+N1991rrsJy2ii48jP0nHNZtNkVLH+ENEsobTH80xcATdpv1qoX6?=
 =?us-ascii?Q?5oV0iV9ITWo685Z0ZUhcSmSX7sDz9yhMl+qJckjKMsAwHPIRKEhU0HWtmcFK?=
 =?us-ascii?Q?/dA3TuRODRM/SqoamaRu8YExu3RnEy+qlb8LluPd4V2Eo197A6XZcDB7nJWM?=
 =?us-ascii?Q?TvNyDXEkJVWOyEb+zjAE5VREy9pAxUUhGVaX3fREp6JgGeacggD3KPzkr8tl?=
 =?us-ascii?Q?F/jjt4FzcYVqIJvA7S3/Edi4TGq+s4C+uF2n0gew+4cWTGPAiVWgvQd7kkDv?=
 =?us-ascii?Q?9f5NBqYKZGx5GaswdMCCSfB+eVSy/L6YEd+4n+fPBrfkDVebmQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 20:58:43.7923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ee65625e-dd2e-4d1f-1546-08dcc091b629
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6762
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
 lib/igt_color.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/igt_color.c b/lib/igt_color.c
index e6f435bf436c..d3f2ccf00b93 100644
--- a/lib/igt_color.c
+++ b/lib/igt_color.c
@@ -3,7 +3,9 @@
  * Copyright 2023 Advanced Micro Devices, Inc.
  *
  * This file contains code adapted from Skia, which is
- * Copyright (c) 2011 Google Inc. All rights reserved.
+ * distributed under a BSD-style license which can be
+ * found at
+ * https://skia.googlesource.com/skia.git/+/refs/heads/main/LICENSE
  */
 
 #include <errno.h>
-- 
2.46.0

