Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7117CC982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 21:13:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06D8710E324;
	Mon, 21 Sep 2026 21:13:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JDO8z0sM";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012057.outbound.protection.outlook.com
 [40.93.195.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E9F410E324
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 21:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I+NNp2yoE4O1T4NpXyT3ZlWy1ubhpT0QGb8SCVGMZy2kMEqJ1vzkdwWmAW12UNBHm/Xo8hzTsXlLg88BvQAhu0YSog9SvwSjgrxz70WyTew6DH4vrhFjxmvnIXnS33YGJ7/1/87u6uV5m//VpE8zrrRwQPvmmMq4gyJBpmaCaeRoZ2tcMyKKiH9KWNbPOWsrBYWL6M9YPQZGsaLiIZXWrWnSx6ASTSLvieapMYQuv2zle37mT0BBLF0cgzfk39s1yiDcYBRnefZfh2fTBXfmwsyxHK0nQcEiq4O4EX42G1Pt0Qo8z19hUAmUSA18MtjM0FGcrVFFo5b2dirs0mxZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bGvuUPGb5/jiZy5nGjM5ZhqVl9hO4Xd1tQq6dI/8IHU=;
 b=tdjqTypQKJDfVPsfIpAgWxO2e69s8kt6jr+dstUmhNv9alGe5cpp3+KzREARJj1anbvXgKLkPN+wEIuHGMAD0TJGD2ATtzmSJoVrbXT0lDf2afOhGxlSyvF4cl9HfBFLY5bDns0lkUTYh8lM4ukraamQfKjo7l1kGPas77Ul+RynjxXgC5gXeygbAndlEZTklZclkp9wVO4jqf+DXWqMajktXj+3OM7RBI8+xBY1whwkI99Vg7Wr6RO4h2WquRZrTzIihbt85Ynf0N91exUlzwsqpsao+9k7Z6T8vlJ0AbksvlPUEl51bijz4Gi8LAyeJD2/NlvNixMHbRcAaf7Ttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bGvuUPGb5/jiZy5nGjM5ZhqVl9hO4Xd1tQq6dI/8IHU=;
 b=JDO8z0sMz8OzXAgxlqiKQUDtZeab1vo+stefyL8pYgsiRed+KcQtQaEzhzDqSLzreRbmX4ePYeedTdsD2f4LjB+cl9LGPq8HYUcYWAw6YG07a53bJimh3LbgKRjbV015F5Ly2wYxu2kwPVKqlqLolRLsE6qYe1jqz46RkjZ+5N0=
Received: from SJ0PR03CA0068.namprd03.prod.outlook.com (2603:10b6:a03:331::13)
 by MN2PR12MB4208.namprd12.prod.outlook.com (2603:10b6:208:1d0::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 21:12:52 +0000
Received: from MWH0EPF000C6190.namprd02.prod.outlook.com
 (2603:10b6:a03:331:cafe::8f) by SJ0PR03CA0068.outlook.office365.com
 (2603:10b6:a03:331::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.16 via Frontend Transport; Mon,
 21 Sep 2026 21:12:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000C6190.mail.protection.outlook.com (10.167.249.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Mon, 21 Sep 2026 21:12:51 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Mon, 21 Sep
 2026 16:12:50 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Haoming.Qi@amd.com>, Alex Hung <alex.hung@amd.com>
Subject: [PATCH] tests/amdgpu/amd_cursor_overlay: include fcntl.h for ARM
Date: Mon, 21 Sep 2026 15:10:52 -0600
Message-ID: <20260921211052.789426-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6190:EE_|MN2PR12MB4208:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0d379c-89e8-47ee-b6a3-08df182518f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: JxKUpT1mOXj+BsDYMtrPqQ4OlH/fZtjA3XI5Ehe+Hz31Nc/fUKeSh/zJdQhN0QAT8DtSwaBGUX2/jJWP2zaHn2DbqRKuJxtwIVqHwgiW8kAoB24n7RnbfuV5DrNr38m4D97nuBXhpPntrfIE5LUum/jQ/RiDi9o252AjIJ7utbn9ASKdF0G8UQsxKpAAjn8OI+2BWQh47MGagTW8JQ6rv8IfQqDrXXyKCRPyH0c0E+hUfnoGE8FfGciUrM/U7CA5q80yc8v3AhdGj7L6ic7nwHxqXWbIicGpWm6bzb595LiJfnhb63O4BG00089MA35L5K0MzbXitbDDf4z6JFaCJ0clWDVlLTSJEKcxMZH3pnHYuW28rXCKdxuD9VYgzRketORtM6DesGdCt/4EGmDJr26wr0+1WiOCIm/QiwwQHD0KsqHfmQkVY0hSwajnnpirWGuy3iicIrCi/4Yat9nJczns0rAUmTiXum11mHB7br28sMqBBS8h/Xm/WPrz/COUfhfUJe5k99Ah6VgFtaCs4LwazP+KIDNWICX5W2cWMHgD6lKn1VWY8ZnUd3vd8uessKQxueJ/Sm+lpoFcQjuguqtseaazPDBfgiLvGe/gPruoBHLlgNWBXpZhL+ZM5/ylJO0SL7CvwZh+e3Xuopqzd6veCH7o8P+T/VKZ6ONhGIvcDFsLnDGTMqZdRWZfzJztwN2fwTCZK/TZZnRBJXBk2A==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(10067099003)(56012099006)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: VT+NJIz4T3XEy4Y+7LAIjzgsPtB/tCauKLJeGb6R+Vp4QVc/w8KEvPvbNGaXnBoQhlalLYDo0X79OpmvrKMc+V4/PaO5EMlQiTXC6lmQ5IsISgKI1LJnv0CrxuZtGmcWQcm0zPG5kduavLxJ2P5waXpu55+aRKTuYWmIucXLZE4Pq47EvfJ3LR7DdtpCIhYZ5rDTR/vIRak9dktrl8TrTbD3SltJn6XZY/AY9fs8VBpvACRp5OSj8Vz/rY5hDGoDGyojTP4TeTZ1vvng1pzA0gEOd38OlL6M3bY01CzCM73pPpV/0eCxLqRhXbXvoNBbL0AeVHWXulLrmF18FffYmqEhoI1Lj40tuNW3N2ntqsdAxW0WSM9k35NcbUUjQzM4z+k3B4hK1TXNn6NyKAlSJp3G4pdwHbKwFfe8jA6yU8330OhlwRk8oi/o3sIqwada
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 21:12:51.9978 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0d379c-89e8-47ee-b6a3-08df182518f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000C6190.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4208
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

O_RDONLY is used in get_max_downscale_src_width()
but fcntl.h is never included. On arm64 and armhf the
macro is not pulled in transitively, so the build fails
with "'O_RDONLY' undeclared".

Include <fcntl.h> explicitly so the definition is available on all
architectures.

Fixes: 520aba273f39 ("tests/amdgpu/amd_cursor_overlay: skip scaling subtests unsupported by hardware")
Cc: Tony Qi <Haoming.Qi@amd.com>
Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 tests/amdgpu/amd_cursor_overlay.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/amdgpu/amd_cursor_overlay.c b/tests/amdgpu/amd_cursor_overlay.c
index 166f9b928..7af48d74a 100644
--- a/tests/amdgpu/amd_cursor_overlay.c
+++ b/tests/amdgpu/amd_cursor_overlay.c
@@ -1,6 +1,8 @@
 // SPDX-License-Identifier: MIT
 // Copyright 2025 Advanced Micro Devices, Inc.
 
+#include <fcntl.h>
+
 #include "igt.h"
 #include "igt_kms.h"
 #include "amdgpu_drm.h"
-- 
2.43.0

