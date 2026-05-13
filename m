Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0295ACD4851
	for <igt-dev@archiver.kernel.org>; Wed, 13 May 2026 07:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95FE610E1B8;
	Wed, 13 May 2026 07:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="C5B54hoG";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012060.outbound.protection.outlook.com
 [40.93.195.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2F010E1B8
 for <igt-dev@lists.freedesktop.org>; Wed, 13 May 2026 07:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uM86cuFDrwpMteCyJmxl4naV/t55xHzzqMqzzZ/xKES1t8xbvPWtYbMBs5xgwsfxBoqxwFidr8G7H7bCGiydqQ/3LDuPZRgOmJfMWcFy6g5u8r74JxJ5N1x2VDBAaPY/nkNAaVGqnk0UTkmHHPXhIwr0QJeMCG0pRdLXBJHgIJZDOq6ugfR2yHsHOIaBKhVkAcQfKh2p3K4asTMFO59ZH4AmdoZ/jqvxA9Vt6vejuUVjwVPhia02w9lOBErwbB+QJQsHL2vVDQDJgTAp4OjjAomQtNUlWq6n7YdWyUwkjOXS0Qv6otipZwosjDE1lqt/Z6oTF1YLmZwlKX8I9Ob96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ObBPg4Pr6e7Z4GhNMdOP130PCu6EOuk3gZZwNZMiJaQ=;
 b=GkG4YHcHdRmNw5yVduqcVJtx0A2Pjnk12mhQP8frrAraVvOedacVpSJEbUFMsk9u3KjirDmQuxJWHsxGO5y1zOh6vC6f0iVHwW1kc13KCqIoLCVJ+h2J7LJHzm0PH72YAGiHETrpKlO8IlWZHDKEIgV6q0pd9EmSo/dMQ7tIJ6vQ9HgCiVwT4Eui75Udwu8qwrxQlXimMfl3EVt5n3NexvDGg+g4H4wNbfGZV5ZqhFwMrkO2EHOhhHnZArJOLz6sv6Ax3XgKOgJSlPLQlolbxqvYBSs09P4lAVfDvJdrfObyD0tiktnr3kbEV3C2kV4miOexfw5bjj2aXQX9a7lFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ObBPg4Pr6e7Z4GhNMdOP130PCu6EOuk3gZZwNZMiJaQ=;
 b=C5B54hoGo5wSWJy6JboN2REM3efPktFl39AsRa0VzWSubduaPS4qbXnxQE6QpKwBI2aQwwZP/MhuuSBpqMElFOOMfvJhNAMA2+k/gQ+kGxeo28L17Y0CcjqdtdEcdylVIA5PC60viKd3RMq2TSLS6I7QP/1T+yRKnuz2DrcEl20=
Received: from BN9PR03CA0958.namprd03.prod.outlook.com (2603:10b6:408:108::33)
 by MN2PR12MB4256.namprd12.prod.outlook.com (2603:10b6:208:1d2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 07:06:36 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::2f) by BN9PR03CA0958.outlook.office365.com
 (2603:10b6:408:108::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Wed,
 13 May 2026 07:06:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Wed, 13 May 2026 07:06:36 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.41; Wed, 13 May
 2026 02:06:35 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 13 May
 2026 02:06:35 -0500
Received: from ray-Ubuntu.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 13 May 2026 02:06:34 -0500
From: Ray Wu <ray.wu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <sunpeng.li@amd.com>, <chiahsuan.chung@amd.com>,
 <ray.wu@amd.com>
Subject: [PATCH i-g-t,
 v2 0/2] tests/amdgpu/amd_replay: Add Replay Rate Control test
Date: Wed, 13 May 2026 15:03:20 +0800
Message-ID: <20260513070631.3723466-1-ray.wu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ray.wu@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|MN2PR12MB4256:EE_
X-MS-Office365-Filtering-Correlation-Id: eaa33fb6-11cf-4bd7-49d2-08deb0be2c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|1800799024|82310400026|376014|11063799003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 5A37+k7JGUoG2gnS5zBR4AACJV2ngmOkQAZ8j5cPz2vaQxU43q9uS4e+XfYaEihDLn/yyJ7qF6srl8WYNHqkhnimhTIvQTXwrbpVu6R7lejmjS1xOneX4HbAoXKFolAsbvVt9MZ5rC/9mWAbwEBdN6ImgGZhuDTgQQbAVHPh6/HHIDdt73HBORK4Xzzs44NLoueyIbXQj1VsajVs5NEfLmjrPqogxs4kpunWGxKB9eHXZ8wK42EJxAIvbJSg7LCmYQgmxGkE0uMez+/s4XbXUPSV4SOL/ZUbcJ7DE7djnAPCNuXrgVYEkoq/VBPDTSw9q/mruiA9BM9qdw/QG2rmQI6/bYWfkm6VxnBPnjgH/LkOLqVACaRZwgjnlzcOSOHgQMuLDtr4GKlhAUA9m2JCvwFwZtMQo4BwSePSfEad/U/HMr0UZB059vVhElJFNoSZuz9BxbiY+QcSBsaFjXoAaS+mKeHNkyq/fgkcJg/RoaTJUEwSxFWKzcqOsNkCFVQtUUopTI8sJnHxoxQhFb0MYw5aGX50+uUB8/oLO1OdPuaCmYEnMjOJ3wqe9/oqFESdYBH5k1IKkJ4r1O32q0PjOUUsj/NnSbvZgF3pRvivIxG3NQXLZiXVLKqkECtvCa22Y2jWMI/GUNW0eqyl0p3+2JugPkLLbHFLNWwfh4DdCauZCPnGf8TK2SVhADp2y4uRwo8AwVpWamgMTxiBU7WO0jAJHg18G8vRfDdPkoEEqzs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(11063799003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: HqsSogxcxaNxYeA0+yvzEYsptRirBgXRaucfYcYH8o3TKbBqc4uBiGnsp0RMFGdPoNMAN76IbTOz/VDbz3hKd7xCeqrZDrja6l+pN8zJFONP0q9m7D50HcNk40s+8YWTA3jIdiBppuWToSvqiCtYmYaykyNiIve1AcZ/6jpulJdERTXnzTD6xTpW4eQMts2D7sdhciCuh2/Odb1wxw2OBKLtWVcT6ZXdoTfZ0c+0aRiWi1VkOhVLvNR9sqbvGu8P4LAhqvSkyY1TmDraPV2xysdxUVdNcqVu06f5LgVvR5jYbJZVkK3p3bW+cHS6Pu83E02N6L0H8c1vzumQslc34J/IJVobzCaEzpw/GY3mbQBzpIEUa+e6wXRGXX4X/avLflRHjIHdTqI4pZt1R+4+aBT6A1uNdIhCGcg7i45QatpXesSZiR7iTQ+MzU1xBLwN
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 07:06:36.2638 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eaa33fb6-11cf-4bd7-49d2-08deb0be2c15
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4256
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

This series adds an IGT subtest for Panel Replay's rate control feature on AMD eDP panels,
and fixes a few pre-existing logic bugs in amd_replay that were uncovered while reviewing the new test.

Panel Replay rate control extends the panel's coasting vtotal while the screen is static 
(lowering refresh rate for power savings) and restores it once live updates resume. 
The behaviour is observable through the per-connector replay_coasting_vtotal debugfs node, 
but is currently not exercised by IGT, so silent regressions in either the driver state machine
or the panel firmware are possible.

Patch 1 is a pure bug fix for existing replay subtests:
  - The `test_mode == (A || B)` and `test_mode == A || B` conditionals
    in page_flip_test() / run_check_replay() always evaluated truthy,
    so the guarded state checks ran regardless of test_mode.
  - Three igt_fail_on_f() range checks combined `state < N` with
    `state >= N+1` using `&&`, which can never be true; those
    assertions effectively never fired.
  - Two "mdoe" -> "mode" typos in igt_describe() strings.

Patch 2 adds the new test on top:
  - Two helpers in lib/igt_amd:
      * igt_amd_replay_support_rate_control() returns true when the
        connector's replay_capability advertises
        "Rate control support: yes".
      * igt_amd_read_replay_coasting_vtotal() reads
        replay_coasting_vtotal; returns 0 on success or -errno on
        failure.
  - A new "replay_rate_control" subtest:
      1. Drive page flips so Panel Replay engages.
      2. Wait for the screen to settle, sample static coasting vtotal.
      3. Drive page flips to put replay back into live mode, sample
         live coasting vtotal.
      4. Assert static > live (lower refresh rate while static).



Ray Wu (2):
  tests/amdgpu/amd_replay: fix operator precedence and typos
  tests/amdgpu/amd_replay: add Replay Rate Control IGT test

 lib/igt_amd.c             |  94 ++++++++++++++++++++++++++++++
 lib/igt_amd.h             |   3 +
 tests/amdgpu/amd_replay.c | 116 ++++++++++++++++++++++++++++++++++----
 3 files changed, 202 insertions(+), 11 deletions(-)

-- 
2.43.0

