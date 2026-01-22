Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA62D3EE97
	for <igt-dev@archiver.kernel.org>; Thu, 22 Jan 2026 17:09:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0259210EA0A;
	Thu, 22 Jan 2026 17:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="t2a+BvqU";
	dkim-atps=neutral
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010001.outbound.protection.outlook.com [52.101.56.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58DD10EA08
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jan 2026 17:09:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QXeWMLLzDr3yox9U1BxU4Dox8jOB0okk73PMTdzo+OsuzyCOVwRDUSarRiYWAOqTx+OHvohUppwNyiRH9GpUeWCCANbhjhxTJAOJ96bOj20oS7VC1NFRw5SljlQpeghmHsGUtPd9LkEwvaWBnjgc5d3z4zzGw6uF3WgbR8WTI9F9Ql6WY9iSozRHqS8hXRUhz/V2U4OaDdhJ32z2yfWE21GD55w8n/x7n+q+mV1X3rg5PcEf1eEfNZYx5JOcpXoWsBPdXoQf+QRYRuO3DGcFpdAHNpAl5Th0VP6HMF2EO/nEq27qvkVDUcJDU1I5YZw71EAKpZOg33Ih4MFxAwq3ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XIe2byCiVW3hxGXTdTNUU298ib7CBTza3+0EXPOsgdc=;
 b=SFKtOH4Ax3rmSZxvaJ6hmMWv4MHdNr+YkQ/AxdRs1xWz40tQKs8JwPRIoKO0QDrreCats43uRod5KfJ+D2BT/IuYOnTKHi3MnBaKNUgI/NtMxHPfGilQJmlVhBKeSJ4+m70F3MfoRYmu8SXweCz9dNCdXvtyQT19WC3loaz9lWqYNb+LZSaOkh9pA9wN2D8Eq//JtCBlRaiZsO2T40oPY8ZPHDPlSXbxO6RD7n0LLzbGuFKKjdjmvJlXMu0BXxwvRRwp0Lm+ZkIoMNROjAzOjGQEmeI2fQ8/fARRoED/SSMtcKq+GNZFbFZ9jMz3Sm/E/hUqYK/WL7/ZjblbLem1kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XIe2byCiVW3hxGXTdTNUU298ib7CBTza3+0EXPOsgdc=;
 b=t2a+BvqUHDM6GCKr02jsVdMu5G/SaYbCkh7iZNI228xPgYgaJ9WhB+WXcsA9MgNotvLy+Tq7hIaCF/vskwtNJ0ZvPwjMRcqHurmyuDEZRLXzOVmzQXyYQpybGa1ueikSP0bghVuW/cj3OraXEzyeVPLf7Wma2dBpJg7M+pcpiCE=
Received: from MN2PR11CA0018.namprd11.prod.outlook.com (2603:10b6:208:23b::23)
 by BN7PPF2E18BD747.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6ca) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Thu, 22 Jan
 2026 17:09:18 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:23b:cafe::9d) by MN2PR11CA0018.outlook.office365.com
 (2603:10b6:208:23b::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Thu,
 22 Jan 2026 17:09:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Thu, 22 Jan 2026 17:09:17 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 22 Jan
 2026 11:09:14 -0600
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <aurabindo.pillai@amd.com>, Alex Hung
 <alex.hung@amd.com>
Subject: [PATCH] README: Update oneliner build command for igt_runner
Date: Thu, 22 Jan 2026 10:09:01 -0700
Message-ID: <20260122170901.644692-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|BN7PPF2E18BD747:EE_
X-MS-Office365-Filtering-Correlation-Id: dfede0ce-ca38-466e-523b-08de59d8fa4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1OwFxAOx1NEG4Z7fnXN5FyG8QW2I6V80J2kEhMRmrpChh8dqVBLN57fpLfWU?=
 =?us-ascii?Q?27lXfJf8/aMjLzSnXDsH6KxGr6AMwwELVmfTBYh+42vAiVD2/CheFY/AL6MZ?=
 =?us-ascii?Q?06yx3y0t4np6CYgcj37H8YKT7ek8n+Hi75QXIkF8E+vo2KqLWfCS6bWkuQn2?=
 =?us-ascii?Q?HcxDOY0Ldji+6U8R4547G0beRtpdca7a/FTMnjxnmxrTj6VM+HTyxwDnHj6a?=
 =?us-ascii?Q?NN+sQeOkFyJj/ZEDYOkvYE/kijzXSgEbH6DTO5SQjqHbTS8ho7KnC0Qmnvns?=
 =?us-ascii?Q?BwnRU0kFw5pnNghB2MvkKFRB4GC6OE1fKJTD3Mr0QdqqKXdjpQsklrVHFaf+?=
 =?us-ascii?Q?1PbZD+eRnLb14GIupKpENaIWVqSbbEWTkWanfaZFpEC6fTPJcCN+j/G0rl3W?=
 =?us-ascii?Q?JQ6SF7GyNeQh/6r7UBG+40X7PaJCpFzA9EYYB8jV3f6gQsQlXgcwHgeTaDmB?=
 =?us-ascii?Q?cdThfvFd8fWC2Pxt5wg9dZTqpbLm3ufahYwL/FeuW1Wu3tsZjPyyWaIU5pXJ?=
 =?us-ascii?Q?2aB1u9buYYQunl168JafY/dHYSGfA9hR5h4JCpSu0EKRkHwsG0u8sIw2oclm?=
 =?us-ascii?Q?8RPxxtOEQIJxsttpcZwcVQTvfAsDXVycSyXZ3N7AYTtUfUiFp5ubz8JAQFI/?=
 =?us-ascii?Q?a/EWcwqi12EtlkoBNskvpgncqcpwjJMawW2YYDLzQt3igzwDfNBgieC4eRs3?=
 =?us-ascii?Q?0ugAKB5WCwyWceNalsgpCoTyZ2ZsMzuCTg5yxG8gLqFrHfSXFLptF9I6K1td?=
 =?us-ascii?Q?Hm6x8FIAezDgNF1cLhFwyCYtQP9q/OTs2/onIYbXZ6bQLrTztiJbMKHEtUsm?=
 =?us-ascii?Q?jJWlZvtXQybQHq7rAIk1MxW/Mp+4aRgPJtckX11+0Zrf8Bd8aGL6THKbprBR?=
 =?us-ascii?Q?eurTdOKsyGAUvQvD5i4D9gvACJBLcHksd6YedDs9PbwQNJmWrtHklTvGvp6f?=
 =?us-ascii?Q?LJrl2CR/yRAxxRuAs2rzWI9JC+REPEWLnzbQz63aq9M2aUL2UUB5T5dZsTL0?=
 =?us-ascii?Q?vA8ihLaYrVbv6t10D/bRDrYHi5DF9DQAuwblnvyyaDBVYpbXTIQVoQafgI8Z?=
 =?us-ascii?Q?tTuzdfgYaiN9u8A37tAtF6KEqDltB4NuzEFfZmGQEUTjqDoOfWuD2s86jgLw?=
 =?us-ascii?Q?iepkZhNlbPABZxCHxHkOB0I+UXXRwOCzOUnfS1/ZUUXA38f07uaYdPIT0UPD?=
 =?us-ascii?Q?V27+Z16CYcmlNkR2Nx/Vag9Do+jJ6ldCSkWlZ9QbdFe+6oyvJfpwN71nRQMk?=
 =?us-ascii?Q?JotqObbYVqckOKi8JqDFmzNSRQgNUdROtDpIseTK1soDaquQs1eGEXyVD/xT?=
 =?us-ascii?Q?OBB9Q0er3zgVrGxR3KHJwxsb7jcczq6MvddNZiCLbET17Cq1xWcbmf+SNcMv?=
 =?us-ascii?Q?A9kcte4WlqJ1P/ccrYQ7Vm0hY1LD2T3V1GQw9FqBYUufyI3E9SXRgLkcakC2?=
 =?us-ascii?Q?IM99/Y87SfktlBbnhc1PCz7LKIqGgluBVjIjSvzNVTd0r63Jt/92k4qSqYuN?=
 =?us-ascii?Q?mMtL/+kM7cm80qSdDDV1B/KUVMKAZQ2ZpK+JbiHu4kVKjKHeLzSOSZtsYAvR?=
 =?us-ascii?Q?R6NUIn43rpAMZwCzpHZZV25uof0Vsh3q3ogPo/UehQu0IKQrgefClytDkdck?=
 =?us-ascii?Q?ODbqSCJzSdKcKOSPCpOg1PicYeGCRskefYkMhZApAbXwES0SA/FsHAjvyeuI?=
 =?us-ascii?Q?oijLwA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 17:09:17.9745 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dfede0ce-ca38-466e-523b-08de59d8fa4a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF2E18BD747
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

This fixes the following warning:

WARNING: Running the setup command as `meson [options]` instead of
`meson setup [options]` is ambiguous and deprecated.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 README.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README.md b/README.md
index c0382ce43..b4b9a37ea 100644
--- a/README.md
+++ b/README.md
@@ -88,7 +88,7 @@ running.
 The test suite can be run using the `run-tests.sh` script available in the
 `scripts/` directory. To use it make sure that `igt_runner` is built, e.g.:
 
-    meson -Drunner=enabled build && ninja -C build
+    meson setup -Drunner=enabled build && ninja -C build
 
 `run-tests.sh` has options for filtering and excluding tests from test
 runs:
-- 
2.43.0

