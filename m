Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5789DC61DD6
	for <igt-dev@archiver.kernel.org>; Wed,  2 Sep 2026 19:36:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA7F10E055;
	Wed,  2 Sep 2026 19:36:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LHfIZg1Q";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011036.outbound.protection.outlook.com
 [40.93.194.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30E3610F32A
 for <igt-dev@lists.freedesktop.org>; Wed,  2 Sep 2026 19:35:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGmsFB4cLceJfTzOHp+SjVnyOf7rqNAefl77BlJUp16BG+7XhwoVuVZr0P1RPlrmn9zJQVr2O7TuRONmzxhJGYFM/LlemWYutOue2ySxtAIGCrdZMzf2t2K6ai6bU19vpOyKqd7v/QEvo5+QpiKOZwEFti1w/8E9pq64dRG9i/bzivXscJUJdZvyvu8F/BmrhM9iCThylMkYtafrQTz14EpXrODX3S0XvSEQmJnthCY7QEh0OJiVQKDIHOF1Wi007WnGWzkxIpgNsM2VhtqBoclOAB/X8y5F8xKjqqMLldWMQ6bZ+59lGKexLd+MLSvkHpH2sexb7DXie/MpjX4kBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeeDKUmfneG07kFgKwhjoxHt6IjSGe913+tpetaIpGE=;
 b=ECayRE508zFkTnDmYUmnptKY9Lg/1eN+dY3/DDH8guKYP6Ie0XU32dTaQA9tBcJPOWkgcV9wPkUvCPXvfnleu5Z+QxS/zQMGCFNnDupqvNqzIlNWKU1esfv9uXa3W1L6YzI4YjjsgQ5flV+ZOExUE9Rn1hPCGB/cbPrNQRpVc4kFk6chXCgDpVnvMQvBupKqdthzFb9o+FvGtvZDSEcdZzrnSH10gAP4GX6qTeA8L9zpv3y4ej7ZKPMUdBS9zJwThwOjmZIEQMbb9jV93w/4GTJTedwPDgKOmlCK4foZkO58EmZH8FIuYSIOIrRgJR4Q9U8dO4lvBW9Q9dOog8iFmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeeDKUmfneG07kFgKwhjoxHt6IjSGe913+tpetaIpGE=;
 b=LHfIZg1QrJK9d/2+TjO4uoZ9/QBdJbPAYL/iihBq6MTjIXRIClRTQ28a+ihZq29fCMHefk6v65/TGkGA/nsJseM3Zw5K1usXRBRteCvxMJdrIz44wGCZ5YT/1HGldao7HmOpdcvISyRjvHwUDJdpV7HmtfotjiEyjl/3YWlQvRs=
Received: from SJ0PR03CA0061.namprd03.prod.outlook.com (2603:10b6:a03:331::6)
 by MN2PR12MB4064.namprd12.prod.outlook.com (2603:10b6:208:1d3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:35:20 +0000
Received: from SJ1PEPF000037A2.namprd04.prod.outlook.com
 (2603:10b6:a03:331:cafe::a8) by SJ0PR03CA0061.outlook.office365.com
 (2603:10b6:a03:331::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.10 via Frontend Transport; Wed, 2
 Sep 2026 19:35:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000037A2.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Wed, 2 Sep 2026 19:35:19 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 2 Sep
 2026 14:35:19 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.46 via Frontend
 Transport; Wed, 2 Sep 2026 14:35:18 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v1 0/1] lib/amdgpu: fix platform range matching with
 chip_external_rev
Date: Wed, 2 Sep 2026 15:34:44 -0400
Message-ID: <cover.1788377261.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000037A2:EE_|MN2PR12MB4064:EE_
X-MS-Office365-Filtering-Correlation-Id: a0477930-6464-472d-0b49-08df092952f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|36860700016|82310400026|376014|1800799024|56012099006|10067099003|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 2la8nx2wzR9Vnvvr4ugA6FQv/zqnmwdhZ0UN9GeyhagrKCFakafb+X563/vXU7D2qdL6FjB6r4Z+0WW0Bk6O08T5+JEix+h5gyouw0w+z9zjjGDGPKYXov+jnaYaYmpgHowZINfHuAooJ9XCfaT8z8HNTKrZ26QpnQ7Nu1cqbOQEknPh+DJsVZNkq1mRKjuOtLNBoFdZX/NkwW/fiTc9oR+mDngUiab0AoKFmoKH8hUV9dPa/CtVOeKloz+PQ1aowZUpymnh4MXaujeF3oqiQ1s1n1RX2ohcGHsf/iU1ZwPID3+fBpxqE5rHo7k8gERdF4HLSBAzQ3T5oRsWszU1jdTdufk+2NH6sQHaASk5VvRqsAm7qfWXNwH9vsj6R8R2zgAdlbbdyUQ+OmmFEF4FombzASImBhuEMqU3uHSEyqMENqf/eH/E54J6el1LqDkO5YqVPQulhGP3NpWiv8bp6EANLhJYijvE8pmnn/eBjiK2oqQUz8dCfzkiPF/x0+ED2zmmziMZ5cJuzk2ayhR4cLrfQoR45Yjogg5vBxc51C+5vB7OWUutftTtDbbqAGWbgSuXNSgVgdDBOJPykghDvE208imRpE7NSgAqLaDk+xZKRt3HbcaRio5lgHVVOYGzPNBnzOrwtPNU1nF46raBd7IUdw1nwCxgiBRRUytceQh45iQ5HaaWt2QaT4bhunPzBkKwJFdhL57kpwm0cp0u9w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(36860700016)(82310400026)(376014)(1800799024)(56012099006)(10067099003)(11063799006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 4iZXC22mc8Ior/hje9KLHwjowIQbJuA86yFviucnbgc2kSNwzI9kA8y5YOgww8Ae3ypWvSvUvFmoP/d5fHoxnU7FF6rPXyPB+WllkUW0+MCdwcHUdB1JUrmc93gxNHFJ9Yt/5DrlystVUOg1XX6n/ikQFCZSuu4rRpg2l0oRBO12ExA+o5yheYRENjMy7JD+RSQ7lg7sjwCnpi+bJ1HF01bXtIgAYkEe+o1OE+D+K3oubL0HczB8Pi5cbUR2KXbB+j7ne2FLmvgyMNOWDsZkBUEGGolqI2fLHLIobkO1DU1MA1J0Pq5AaXnrLjYGlKBAQogq9PrL1ePu29rNExJPWJSoMh7o5pnov6yffWSevb+Ll5wD9e6Ygv/aJmXNRmdiJHHJWvrWYsqi/5rqM0RDKXBdT4qKB3EGJBJhWYuxH58MzSAmZp6ISW+f8zQtGpDs
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:35:19.8387 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a0477930-6464-472d-0b49-08df092952f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000037A2.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4064
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

This single-patch series fixes AMD platform range matching for navi32.

navi32 skip rules can fail because the matcher used chip_rev. On some
systems chip_rev is 0 while chip_external_rev contains the ASIC mapping
value (for example, 0x20). Prefer chip_external_rev when it is available,
with a fallback to chip_rev for older kernels or devices. This restores
the expected platform_skip.conf behavior.

-- 
2.54.0

