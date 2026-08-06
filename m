Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EB9C55174
	for <igt-dev@archiver.kernel.org>; Thu,  6 Aug 2026 02:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B15B810E167;
	Thu,  6 Aug 2026 02:13:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Me71bzvy";
	dkim-atps=neutral
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012050.outbound.protection.outlook.com [52.101.53.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD6710E167
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Aug 2026 02:12:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vk++L0W6PFcWTTKB8M7bxxMCCKm/OqOXGj0RQY7dhrvqdsx0126THjwkXaRH9ZA39H5UiyN8CfI2JAmvjovcLau2VFQf2bbrTOB1xKXOgx24CQJfDSSAHeK287GKOnhS8NY7R1llHvojzwELCzM5wMbgHXV3J8Yo5uQY1jhA3wMeBjEB0nzBdkNlXSt5830K/ji8rq2+1lHY1oSElt/xP4joTI/ipoF2jcfSGugqDnBNAd7FlZgO75YoM5ZBfSRgunkne9bP6wAru+mobPznBY1Ajajh0p8t5DHLIB1A83zJpgYozoM80py/4inr+Pe+KZaHPZ9RlOsp+YJ0/NhL+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZ6VFL69J1NUWiAFf54x+tyNM1ouM8+aeqp1PgyNZc8=;
 b=xeJc+fXmjeFIj1hXt4c5tD6AiY3yWSft71kVJ5xa21Q9PpeckK3q8WXwCG40U3ZQ+xEWEKCX9E84siMfFtkDlMB7brcuB3l/BVGuSzCMx4ICk0ndeUAa+y9FA9jiwUVztJt7136KdenK7ikjkL35PO8sJEmq6JKbgKYZnEPJ46xhsoLgqet0VJ/xFTAwzTrme+d8AtuWkFp5PrwlVeXYuhdV4g6/F5ClaL2hllnO0+fO/5sU9QXRgwdBfBo0hGJBl8p6zbrdpXmdJsPIf2SlsbeXelFYxoQn4omzD8JsBpAF3vCyqjavQ7a7geJw1fr6z1cZVRKXhN1fKJIpaWOWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZ6VFL69J1NUWiAFf54x+tyNM1ouM8+aeqp1PgyNZc8=;
 b=Me71bzvygw/LWx7OcIbfDDa98es1fMCcqa9RCTahXb6qdLXHFMVVLQkZJAvsoY7ntfUck4guEJhfYnC+A5XdUndnqqLA2OKVueG0AfzFTBcLWFAJg7uRbKEkeXUJhfyPTKFTbzYzsQFaEX/SH2ONzHw5olQoHkiVRgwfl96p1pk=
Received: from MN2PR06CA0003.namprd06.prod.outlook.com (2603:10b6:208:23d::8)
 by SJ2PR12MB8784.namprd12.prod.outlook.com (2603:10b6:a03:4d0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 02:12:36 +0000
Received: from BL6PEPF0001AB77.namprd02.prod.outlook.com
 (2603:10b6:208:23d:cafe::74) by MN2PR06CA0003.outlook.office365.com
 (2603:10b6:208:23d::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.19 via Frontend Transport; Thu, 6
 Aug 2026 02:12:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 BL6PEPF0001AB77.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.6 via Frontend Transport; Thu, 6 Aug 2026 02:12:34 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 5 Aug
 2026 21:12:34 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Wed, 5 Aug 2026 21:12:33 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <simona@ffwll.ch>,
 <jesse.zhang@amd.com>, <christian.koenig@amd.com>,
 <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v5 0/2] IGT tests for DRM_IOCTL_GEM_CHANGE_HANDLE (race
 conditions + edge cases)
Date: Wed, 5 Aug 2026 22:12:09 -0400
Message-ID: <20260806021232.200317-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB77:EE_|SJ2PR12MB8784:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c180484-1b83-4627-d982-08def3602e2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700016|376014|23010399003|18002099003|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: WPA+VikOBAxBvxVHnQXwCNQqVyicKJ1FmX0JVCkQshnjzmIpRweRsvJyujp9hufA3McYm9IlR0ndzmba5gdTHaWHB9XucQEmnqOqUgX84lQBAfaFSAiUIS7a64scXzwmstNI/01TgCAv1QVweeB+yEG5stYv2WLeWVZOR90erb+nMjrc+dE8o3BVmsab+zpB3u9LiHHUUmSL1P4Qu/sZZnZHH+rOXjEzHCGBW0+PeIZdFUJ12QF5Wv/91UfaUtV4ypI+6G93LI64zdnLHgeZuWwoObwu8MyN168gfkrtFj5PVwkuoNwvGsS0oru4xtHzfN4SKBLR7Q/0Fr4qcw/nT6aN5Vg2NNCLI4HsLEK7VlHyX3Ql1hWZrxSC9+GQJXdv7ql6HlHBGpULa/bnSj+Sb5z4AQjrMOc6K/LpmaD2vM7Mgwsg8da3QocUZyFm+xsP6F/hqgE6SY7yq5e9Q0bLfKc2G77lqV2s8idKfDmzqShxhVr+pg43f53uhHTaHVY8qgSU9LkOBJtTmh0bEjnduhXamMzWDk4/yk1hapjxDVhtgFQbgWHqY5zFoJHkP9r5VsxN9fEk8d3XMCRC6FednN7s+hViK4lC+WRhDPjfqT/XUavTW7gxxH73BKOWieik4RUDpWxSSDleYWU8mLu8gqNQ4IscL84QEwqOCVzCPV8/htGqiKHN/yVYTsLT8h99LHJbDR5ecjStQlka/ajeNQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700016)(376014)(23010399003)(18002099003)(11063799006)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: axwndKLtOAmPE2C/J7QlX/FAJNhuhDLd1MVyxQuYteQX2RWCyCt1SUPDEwQQRRzWnO/XkyOteeqqEPSaFFAVgDztbSxwgCbjNQGmxu9M0QUd7xS7MicBWmaGqUxTtXTI9Lu3id6TF+BIOd1ah8aCkY8fMBTlzNSOe4kZoQLkvvgJqiRiDjvvCYkhktoscA1roocmPufKP46gbhQEt4n8EhRv5NeZtSTeD3Xn6qVgRbCiZr0zhBmwMNMfM8/8cHMgW9lA9LWv7lKK/0o/2+slPEtRFirg9uOO98FZNWBkKH//FDuEElfeb7AIEs7AjOEPtcxMHOZRFXNfwZ9Fd5EK3r/AaKHq+O8UUDCUqf41znvGYJCJivCNl3UrLW978h5HutrvoFmCZvl0SpRGS9fvgu1Jex6XuhjzD0DCEyuinTs1lq6YYXvtZ48HvqdhBZnC
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 02:12:34.9850 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c180484-1b83-4627-d982-08def3602e2c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB77.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8784
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

This series adds IGT tests for the proposed DRM_IOCTL_GEM_CHANGE_HANDLE
ioctl, which allows renaming a GEM buffer object handle within a DRM
file descriptor without closing and reopening it.

The ioctl is needed to close a TOCTOU race window in userspace GPU
command submission: an application reads a handle, the handle is
renamed before the kernel validates it, causing the kernel to operate
on a different object than the application intended.

Test structure (2 patches):

  Patch 1 - 7 race condition subtests validating that the kernel's
  locking prevents concurrent-access bugs:
    - race-change-vs-close
    - race-change-vs-change
    - race-change-vs-prime
    - race-aggressive-change-vs-close
    - race-exploit-single-thread
    - race-exploit-random-handles
    - race-close-before-lock

  Patch 2 - 5 edge-case and functional subtests validating correct
  error handling and basic operation:
    - noop-same-handle
    - invalid-new-handle-exceeds-int-max
    - invalid-handle-nonexistent
    - edge-new-handle-zero
    - functional-rename-verification

The tests are GPU-agnostic and work with both Intel i915 and AMD amdgpu
drivers via DRM core. They are placed in tests/intel/ following the IGT
convention for all gem_* tests.

Detection method: KASAN reports in dmesg (requires CONFIG_KASAN=y on
the test kernel) for concurrent-access races; errno validation for
error-handling tests.

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Simona Vetter <simona@ffwll.ch>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>

Vitaly Prosyak (2):
  tests/intel: Add gem_change_handle_race test suite
  tests/intel/gem_change_handle_race: Add edge-case and functional
    subtests

 tests/intel/gem_change_handle_race.c | 1971 ++++++++++++++++++++++++++
 tests/meson.build                    |    1 +
 2 files changed, 1972 insertions(+)
 create mode 100644 tests/intel/gem_change_handle_race.c

-- 
2.54.0

