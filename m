Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAC0CD4F54
	for <igt-dev@archiver.kernel.org>; Wed, 20 May 2026 07:41:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 585EB10E096;
	Wed, 20 May 2026 07:41:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IbH0WgcJ";
	dkim-atps=neutral
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012020.outbound.protection.outlook.com [40.107.209.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7343A10E096
 for <igt-dev@lists.freedesktop.org>; Wed, 20 May 2026 07:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g0tAqRqqDXRMYCUKOPG4eaM1WBf+w4CUyRANdqFSBeOdkMUGNbD1Jb9AN9WBM+Z2gGy4n4Td2PXILREM8jZs+qdMYT5e3vjN0L0edyb0l+lpHKvkVBlfBZ6+rYNbfpzy7f3aZGYOCGfWUSJLdwGXuIKhcVSz2pN+ABjhsxt/B4+gJpeXfgxnUvzP0Ep3ILWEkMzBZ878FLm5UTbJ1Pl6gznzuXAOyIe4X7enq0PASjp4XT6qUHc1SsMZGAI1Kr5eATqyTJizKH5QMQad2WlfzYEJpsYLasWQFvP/wqQUITh8OCbKcMNiU6gBh3OxzizQvILZnaSLHZlo9GE4qRejQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uyxaoo3aoiQQ65NsehODzgLVKtQyNfIqH3sqdG1LoKA=;
 b=ilfrMS/Hs5Hictn/LicVdS3RUjK4mXgUk9S6pXipqC8o9hZ+uAPaQlnx2HqUjJc+xtJEiTBOxD5FetFRFIjonlkJpPDy7ILlw4wRrTMBB2g9fmRHtbMUwUHn8NaWq7dMTQZs0Cz0XnrnJtYgkXYbZRFF0mFoomeQdfxpqkrJ6YnJ1vXOMPfRFaAV8iy6NOwh+m3q3Xr4nqfSDolKB2zaFRAHkFJFLfOfw2V44/Q1B9Yd+oS5O2SaKtQeNSASB3+GcvZBIMOauR7Zm82uCHbkrsUjhU6+V/VDcwv6Nxu9KSgHYF5wuHVaRG1IC6n4RUMy/t+nWeafMTDAj9rqXODkbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uyxaoo3aoiQQ65NsehODzgLVKtQyNfIqH3sqdG1LoKA=;
 b=IbH0WgcJhTYmw4XR+f+88d0WaMQit4Y3YfBKRSOSrrZgZvms2OUe3pefOd0tiIFRVFmFYYNbIVCfI60CSo7hczh6iPxQwvY94Yz2kUsjGS7Sldiax5Mwssox+rHB/NYDFl8ohgzFpCo/0CFleZaaVSgleUmOMMgbkkCzi1iW2og=
Received: from DS7PR03CA0104.namprd03.prod.outlook.com (2603:10b6:5:3b7::19)
 by SA3PR12MB9227.namprd12.prod.outlook.com (2603:10b6:806:398::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Wed, 20 May
 2026 07:41:01 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3b7:cafe::c6) by DS7PR03CA0104.outlook.office365.com
 (2603:10b6:5:3b7::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.48.14 via Frontend Transport; Wed, 20
 May 2026 07:41:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Wed, 20 May 2026 07:41:01 +0000
Received: from caden-arch.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 20 May
 2026 02:40:58 -0500
From: Caden Chien <chih-wei.chien@amd.com>
To: <igt-dev@lists.freedesktop.org>, <vitaly.prosyak@amd.com>,
 <jesse.zhang@amd.com>
CC: <Solomon.Chiu@amd.com>, <Peyton.Lee@amd.com>, <HaoPing.Liu@amd.com>,
 <Yu.Wang4@amd.com>, Caden Chien <chih-wei.chien@amd.com>
Subject: [PATCH i-g-t V2 0/3] Update VPE blit test
Date: Wed, 20 May 2026 15:33:17 +0800
Message-ID: <20260520073320.14656-1-chih-wei.chien@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|SA3PR12MB9227:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a658817-8a9b-4a67-7593-08deb64323f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700016|13003099007|56012099003|18002099003|11063799006|3023799007;
X-Microsoft-Antispam-Message-Info: 9q+Vr/DX/GZB9yxmFYZXpYH9xTGDnlugZMqkwwsPXNdqZlpyt5D5bX1vv+Nik3ycLck9XXzS2pRse30XcVTkbxuWK1MF59c5KsKgwrPA+tin4CgH36ZVbj7nhZqXz2yPmW4x+ImC+23RiSE0nkcZxRgRzCnRvFwdh8hoS0diNxNRGMsicfMXl4P40FJ7pKYdbMSRjSQ6kBv4RV8HzqnTMKg/SummhZfscJrXVnDRauJwOKum0JutTaI2T4zvPsL07KnCkZ7RvcvhPuKo8841WH4r4XWGOXlAgTFkCzEnPwq4SKGPLqe+opXUM+TM3tG07fGAVFBvshBFtW6nf8keCKwcB+HDGfrKcVGpaGJLmZ3eujbYecgw8YfAyPDiIKQL9OehTb71n6eyAJkNuZyvMDrUFaP3MxvbJl1R2v6rjiub9Y+vMKqRR/4kbUmlqZPPcbhDBAZxXxNx+fIyYoY6U+llalBbl3r85rBFUOzdc91m6UUOR3/nNZehuLOHmkpRwNVhJhKQTmcX/VioCLS/9Zwvgn+XckSMwFPm2FRyRWF2xP/ovaIaYMdAe4QWLnEGGIQkQIgULj67ES7OPUDW1kNJwYS5xq1pivVwf2LZ3ABDAp9iGZa+1wccj1U2c7BJj1i6ehBx0RWlmnE+xKU9oELOKFPuaw3azDS4EM1VZdWny7E6gxNg9PIc0bXv5yNy
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(13003099007)(56012099003)(18002099003)(11063799006)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: /yqeSIIZtWtPpscPZ5Za6OOsmv8YAt+UB5gK8AqS5qLy43vMxtei2u5Mu2n/zQkgFLTBYIUJljfJmufhXDUwgHyzEBE+nYxXhX7nr7ehEyNmq9TB7W/RNo8ALsYRGZdXel2lc8427TU9DM6cGHiqJpgGVQNzIBofLbMIcrS6qKEUx2/ADi/md2vpQq8DFKwKpNyCbdKXNp3X3J0LNohp/U2VdbJGx5E0GYPT7Q3ITWJCq8yHrK+LrezpScS3rQ0+BsFlcs2FjMjDTOSC+mpsKy7P0PTPkXg08OFTdWPIngzDHD1i92yW4ELEa+jM85zsZZ3BQC7gDjqSjxnEbxTAgUXGrb6IU07NkreqVysi53eufKvxIQIfEYmKSZqsfypTveapawYFRzZFlofa+Z140HjOv3QfgRTZTNa8IAIEMkRSbeEoY+4koFstYoTcrZ/H
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2026 07:41:01.4799 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a658817-8a9b-4a67-7593-08deb64323f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9227
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
file is added for placing macros and static arrays for commands, so
source file won't be flooded.

To retain compatibility for vpe blit test to work on either IP version,
a switch case is added in second patch to call testing functions
corresponding to the under testing IP.

Blit test for VPE1 is refactored in the third patch to align with coding
style and VPE2 blit test.

V2:
Solved unused function compiler warning (new vpe2 blit test added in
first patch but only got used in second patch)

link to V1:
https://patchwork.freedesktop.org/series/166844/


Caden Chien (3):
  tests/amdgpu/vpe: add VPE2 blit test
  tests/amdgpu/vpe: set blit test based on IP version
  tests/amdgpu/vpe: refactor VPE1 blit test

 tests/amdgpu/amd_vpe.c | 235 +++++++++++++++++++++++++----------
 tests/amdgpu/amd_vpe.h | 272 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 444 insertions(+), 63 deletions(-)
 create mode 100644 tests/amdgpu/amd_vpe.h

-- 
2.53.0

