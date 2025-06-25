Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47056C83000
	for <igt-dev@archiver.kernel.org>; Wed, 25 Jun 2025 04:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C49A10E65B;
	Wed, 25 Jun 2025 04:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sgW2xLt3";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2088.outbound.protection.outlook.com [40.107.244.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D72C910E65D
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Jun 2025 04:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C+vGHRfIX201yGNZpkBaevAXwfbP2sidPr+5P4h3HwJMB8TqK3Eftob933UJCMkwwgeelUQUbWbLS09TAj4OYkhqL3qoC0AuM0rhq0e5yI+5BJZSpNVQn1hElBPgPl0hcjed34yapoEPYAVtFwE406rGj8nrmdQeLMyxESLphtGogzFyAAWs6tvZmWKGPkQDbWcHLf8X3fhD6+kE1SCOFj0loQhIdK+WXeqgNqB9LE5/jr57LzD0aI6Mhbz9eWR1Cq8eOZZljqMDAe5orjpYYU8IIFXqzLpY7PyhnrBledw0MyhDfGe+ysp+RLw8X8H8uz+IYP1jghHC4ZZu25AnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFvt3GjUXYwvM68I2A5pKbPz9Ouy7qsWUpu9DsF5LNY=;
 b=pkGgdDJziaHlKZEwW6ZhXnIlt02y2TPSrmMltK+1WIrk/nUW26LZBZG+xHqTBl+79xIT4GLCeak46ydFYWQmxYvVrPmUX2z82DQajX/wzEYVu5uuMrbX8Z2F1XjqRM1s+W1ptWPW4lV6KPmrINVDL6UGiaIGwHSdgISKYYSK5H+VG1q7oAMmwFBY+xFvLu1YjU5SqVadRcZgE9lZ5wu3AgAexIxeQKwTumAjEDpMCZxxs2jz8SZlc2oasuOz7QL0TBxpH+5tCH6jAtzZNlYAHSMw8uUmFGrAi1iJceCty6cGFOWZat0+ovwB8R/xBBlVUOzCrdmXiHhNQE5fhVYpyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFvt3GjUXYwvM68I2A5pKbPz9Ouy7qsWUpu9DsF5LNY=;
 b=sgW2xLt3AcCZwfQKsCLJiGFMvE29gUe30rzm89lIuLfRXwQGG1P4JE7xkXP0cLvoja7RGNJIDFy3TFKz4lzimV/eNqJCvs3xnP2u5SiIiUD+7w7we2mCRFt1+4FPOQHmDsx59OvNvcbQFuCQv8PD4m47pp8DEknyX4T6vbTFjBU=
Received: from DS7PR03CA0175.namprd03.prod.outlook.com (2603:10b6:5:3b2::30)
 by PH7PR12MB6561.namprd12.prod.outlook.com (2603:10b6:510:213::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.31; Wed, 25 Jun
 2025 04:21:49 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:5:3b2:cafe::a2) by DS7PR03CA0175.outlook.office365.com
 (2603:10b6:5:3b2::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.30 via Frontend Transport; Wed,
 25 Jun 2025 04:21:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Wed, 25 Jun 2025 04:21:48 +0000
Received: from tr4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Jun
 2025 23:21:46 -0500
From: Alex Deucher <alexander.deucher@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH 1/2] lib/amdgpu: fix SDMA packet contents for deadlock helper
Date: Wed, 25 Jun 2025 00:21:32 -0400
Message-ID: <20250625042133.6609-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|PH7PR12MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: c8c447fa-6df8-40d1-0f92-08ddb39fcd63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PUTV5xrCcKjMCrb+bOyIJr09sc2Xijeh5pwWFJensxkd7eTHPhIi3JBDK8s+?=
 =?us-ascii?Q?WHOKcYQl4gd8jGlP88W7XF84i6puBj6jqz/7K7vjZ5t6UcMjpUOtjMDqQePP?=
 =?us-ascii?Q?cGgxwJ5WbqgNI4DdWLFcWwLD+XIclRbF1KyOI3vZetZAsbAt/nEusnyrcR+y?=
 =?us-ascii?Q?eg5Cu2r5rzHLFygQhSLTyGDTZZ5z6FWylbEHzf9mXhpXcL6S9dXFvohp8zc5?=
 =?us-ascii?Q?3NsXgMXytswZaudsVM6ZVKFQHRjYf2jQiLo+aPPj+3A1oOo/BLTuTiuYuhD9?=
 =?us-ascii?Q?CXXdW72gNaCvRneu77py7IrGfTQDfOOsaANCqPnMvqz4+Dab0YFVywauk76l?=
 =?us-ascii?Q?DAkUgLCOVIpgeUI10G5juHYEW4Z0W2DTkkFQqj4FX2vtdW5tbSHrLFuqDd/l?=
 =?us-ascii?Q?SapE4ye3GBkltnsej0+lgUqnVC7O/hJCHI+mhDsHnv6pE5Viff+enji3omAH?=
 =?us-ascii?Q?KJmy1szAm9abCHQeTPSmWfn/QrZVa5gepIAja33Z+ulJgUKrtQ0PwzLRZcO1?=
 =?us-ascii?Q?yD9BGVcY6WCP9T6Ih5yJKqFdG4lz8DPXVpQ0zvoxrANHfrgyLTHsg+Sd8wUl?=
 =?us-ascii?Q?1OrhXXp+kcDYdFConLKsZfb4uQOmMtEgefzUYUlRh/S86tCNqeggmFUUloP7?=
 =?us-ascii?Q?ZUmaWV7YdE6JleC0amSwOpLGlOTt3Mxt3zs8/G9TB0c4pGcOPQMTgMe8GFQT?=
 =?us-ascii?Q?sorAXPORjj5gLhZFEtWS2ZHKXEcsSqSRIxeXskulPuIv6YxlAbC3zPu2wbjn?=
 =?us-ascii?Q?EOqQiSlX1L/LqhBR57F5OqtTDbejgeGMfLGmMxpWHTfVn5z/trdn1hOiOxLb?=
 =?us-ascii?Q?H0HJo1WbbUqHFRbWXUnpa7rjQzjU0s+XM07bdelFVxKg7dEQdSndYbvq77pO?=
 =?us-ascii?Q?2V/DlVwvLSmrsCEZnhpQaLhFvIJ0rTx2AnxJQB5WnLJYjYSDyd2nRSANFDpz?=
 =?us-ascii?Q?O5qK4J+RDWgYhycoyEUcUsA51w3JFJtoUbt4yRW8TPxuUfLUgg7rxv7sC1WJ?=
 =?us-ascii?Q?s4/QhA27KiXIHcU6hVUHIlFKXkSRTmLm9Hhn2tdO3hHTcP6KI0gt81j0+CIY?=
 =?us-ascii?Q?7NIO2Iqw6FPbJz5hzuNdEqeCeEXtP6AKOH3T8T3+mATTIIosUlkuCXI0yzMx?=
 =?us-ascii?Q?bJ1oMmTPEOkpPQKDGiWNw3qqRQCz0yFFGCGFJyND0QEoPGPl8hc3UGH+BPYb?=
 =?us-ascii?Q?NoeNgcPWJ+7qXSggM09qHEY7n1qOmojo/DYu+faiZQfcF1El5xXfvnTzsh64?=
 =?us-ascii?Q?E6eM3LL4v3BmW11zHmeASkKVsI8nWmLlpzOxpZm/45tFysjP3/7aCoEQ7uCX?=
 =?us-ascii?Q?GZGvxxcTkOmuAj3s07USlBnZZIAASUor5fn1c+HaXZ4AknZlWsY77S9ihe3e?=
 =?us-ascii?Q?UdGVHQjG39wSUUDRIB5RcIAb4rXB9HsMmdsVULakk71IBPk4ar+k+LPltLIa?=
 =?us-ascii?Q?ZIuv4BM+A9L8i2lTDJlIsyDYUsxUOTTOeYH+4UOZTxt9u5RxxCFVTfpi26mk?=
 =?us-ascii?Q?T7mVCWns1qvdAeCadtaosQglge2yRSTqDh5U?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 04:21:48.2660 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c447fa-6df8-40d1-0f92-08ddb39fcd63
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6561
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

Use the right NOP packet for SDMA and set the retry
to infinite.  If it's set to 0, the engine gives up
after the first try.

Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 lib/amdgpu/amd_deadlock_helpers.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_deadlock_helpers.c b/lib/amdgpu/amd_deadlock_helpers.c
index 3b4822ca0..0cd83f061 100644
--- a/lib/amdgpu/amd_deadlock_helpers.c
+++ b/lib/amdgpu/amd_deadlock_helpers.c
@@ -101,8 +101,14 @@ amdgpu_wait_memory(amdgpu_device_handle device_handle, unsigned int ip_type, uin
 
 	base_cmd->emit(base_cmd, 0);/* reference value */
 	base_cmd->emit(base_cmd, 0xffffffff); /* and mask */
-	base_cmd->emit(base_cmd, 0x00000004);/* poll interval */
-	base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - base_cmd->cdw);
+
+	if (ip_type == AMDGPU_HW_IP_DMA) {
+		base_cmd->emit(base_cmd, 0x0fff0004);/* poll interval and infinite retry */
+		base_cmd->emit_repeat(base_cmd, SDMA_NOP, 16 - base_cmd->cdw);
+	} else {
+		base_cmd->emit(base_cmd, 0x00000004);/* poll interval */
+		base_cmd->emit_repeat(base_cmd, GFX_COMPUTE_NOP, 16 - base_cmd->cdw);
+	}
 
 	ib_result_cpu2 = ib_result_cpu;
 	ib_result_cpu2[MEMORY_OFFSET] = 0x0; /* the memory we wait on to change */
-- 
2.49.0

