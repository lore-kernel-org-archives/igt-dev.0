Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1047AC5AD5A
	for <igt-dev@archiver.kernel.org>; Thu, 13 Aug 2026 00:47:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F06F10E478;
	Thu, 13 Aug 2026 00:47:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Y6r0TW3B";
	dkim-atps=neutral
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8048710E484
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Aug 2026 00:46:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qtl+Wuhp80WBpMaa10KhyRUmGTsJZwaNeCOMLrGrfaX1BM1McB4JP/Jk1LgK22HycT8rdVU2rn3mu9XD9NPlZskNHa1CPcEmP4tItHhhz0HuwVXR0bggEhcYnWfWE8cNCdUUnzpK3upMGO7RQJ1Xmmsel7W4WNGukP4bEfc/I/Nk892narfQwefPrBkxKstHRVO7TR0yDMzgnuz4lH1vsXlaJFT0CNP0ZwZa4He772EZG2Sog4ghwr3Jh8MqRHvRt64EUfz8IsAHom2q467eSbL/CuuL4OcdIMr/GYO3xbgkKAfSs26uRw8DXRnwyh1PscW2WodhI4GmDpttDXc7MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Dy+4OsEraac4iXzYDqOM5aTf5aijGgQcS8cDN2IpEI=;
 b=F55Fo4pcvdxa9gfHHC/jGk7UKUMZzClHJwNKlWrqEyLknz2X1cbgPD6APc+EqM+k2vL5w1WZQvf06HkF6aZxdASTSMWZ39mAPGm7SnraYkucOdErAyDWrqKe7o6kJq2HgzOk628nJSRZdt+10P5jl3wvwE5H3xUhVEVUrNafTrN8O0yQBH6Tb7FXv+NsT1C0H6co+2LJkM/Nd8iX8GyRf6gQO/5ZVEHiPIzkNSsHqY04pRRPBq0uZLtn7c+KJu3SiBA1qewKsU3FpLSmv3T59YVFzPocpA+LPy8A2ur3SJloigB1FEBOlLWBawLqQPFDw7oajwJs6Uv2CHNQJfnvYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Dy+4OsEraac4iXzYDqOM5aTf5aijGgQcS8cDN2IpEI=;
 b=Y6r0TW3BMs3o9km1fC3hiBMJBVfit1fb/wSOZmEReKKrMZSpuA3iAxfP6c1C/XwMap9C9HDz+Yjnujru77LzeKqUBh3q+PfU2OE1RAyuDNr8/caxxRAjNB23qkrKOut2B5bgWEw8e/he2FPy+kAxNC24kbDj3eyxXk1BwzQlDMI=
Received: from BN9P223CA0024.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::29)
 by PH7PR12MB6834.namprd12.prod.outlook.com (2603:10b6:510:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Thu, 13 Aug
 2026 00:46:16 +0000
Received: from BL6PEPF0001AB4F.namprd04.prod.outlook.com
 (2603:10b6:408:10b:cafe::a0) by BN9P223CA0024.outlook.office365.com
 (2603:10b6:408:10b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.13 via Frontend Transport; Thu,
 13 Aug 2026 00:46:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4F.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.339.3 via Frontend Transport; Thu, 13 Aug 2026 00:46:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 19:46:15 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 12 Aug
 2026 19:46:15 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.45 via Frontend
 Transport; Wed, 12 Aug 2026 19:46:15 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH v1 0/1] tests/amdgpu: fix userptr PTE invalidation stress test
Date: Wed, 12 Aug 2026 20:46:03 -0400
Message-ID: <cover.1786581212.git.vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4F:EE_|PH7PR12MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e829c56-9f20-402a-cfde-08def8d4484a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|82310400026|1800799024|36860700016|376014|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: jsFyWKIi+4T5vjAjOhnV749/FbeYT9vl4+5GryU2lV7zqaSMy1Lt2W6BjshListxgEIbvhWwE7YoWWk7qGEHw8nt/iDEdrta3L5TurNFGGFWWjw0ROZJHm8WMqFY9kZBcWt4mrjbc1G2qE5Pa15L3yxOdQgy0t85fVejmuQIyiRJYkSs4iQtDZI6JsyalKlsiThjT8K4urVup4ZeC8V39vKJt3pxaBO/aau3BPFxvP0Zsvo3fEtFNiW6XP8vXjtmb/IYoWzpI1PgYU5/4weAanRgCQztHMBmDLVltD6zmi3pd+p6expVbnkx6rAaNhwcEzfivJXxOY0V4B/EYq8ln4RId5MpxNS/Tct9OiIQQWnjCiZCTm2WgjUa6HtPUChkPHrGRjvTeSI8McZgUV0TVlQRWsbsNjyXuC1mPpmySmIZILQCqJnRuhbULeJEgc32ef2eyPollbWwdYHSNYUqnzD9Lygs6k1EuciGY5qT4eJeYwG4bGOCTOs2FMF7YeQo3LgEFzmYLvL6k1/Eu1dKGtj76JS4iKfW532yT6x57q78mzivHhV9zYuItw+VDdtJA6xX8Jtrb08f2Xwkarih9r9iIsqNzJ1Aa7FGRV7U4sYI00iZkrj9IX5Xfdh2qgDurR6MKwVTMo5CD1Ew2HYxhzDrvUu70h3ATMq+NPHiV2cz1dA/HTzvMmm//724cGPj
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(23010399003)(82310400026)(1800799024)(36860700016)(376014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: Mqy25ej2cVJVnzByTG513F2zrbKTuqe2ZH9DuVbDAaXKbiHH4afpbFY1eBXji8U0XRosIURRF3zsCgyjG6tVi779upnn5iB6/2DT12Z/xAsfLS7rBURudqeiYq5KEwA0WgMriJFMwi2Q1MEAzhm8Ts7uJxLYoSHwG3vQRnZKu9syv8/jnWIWsAmBprFg24Q3UE8Io7AOaaQvwo3qbSMNyvKEWYaQ0j6hOIeQg4GFl6rTmGJccsUmpSbMjyaQgUBvOm2cvEDenkmOGAFcAFLllxgKSX1YF7S0ljXpGX069gjjKX1CC8itS+pxO9flZDvhcaLeRVYbqkGC9eJ2gYLgJ+eU0u+lbzpSBYvmYIWOMB1Nhisqcq9Bb7zUEWsNELBgZDFhmNIagVGeQDIT+OrjQw57tiUuOALKyZtv4PmGhHk7Dz0k4nvPf6Qi25Kj3mo6
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 00:46:16.2360 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e829c56-9f20-402a-cfde-08def8d4484a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6834
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

The amd_userptr_invalidation stress subtest used fork(2048) to create
memory pressure, which fails in CI containers governed by a cgroup v2
pids controller (EAGAIN on fork), causing false FAIL on all ASICs.

More critically, the test had a logic error: aggressive mmap-based
memory pressure recycled the original 0xAA physical pages before the
GPU read them, masking PTE invalidation failures on unpatched kernels
and turning the test into a false PASS on both good and bad kernels.

This series fixes both problems:

  - Replace fork()-based pressure with pipe fd pressure only (no mmap).
    Pipe pairs consume file descriptors without physical page recycling,
    so the original 0xAA pages remain resident after munmap().

  - Without page recycling, an unpatched kernel that leaves GPU PTEs
    stale after munmap() will have the SDMA engine read the original
    0xAA data through the stale mappings, triggering the FAIL assertion:
      "destination contains N bytes of original data (0xAA)"

  - A patched kernel fires the MMU notifier on munmap(), invalidates the
    GPU PTEs, and the SDMA engine reads from the dummy zero page instead,
    so original_count == 0 and the test passes in ~1 second.

Tested on:
  - GFX1200 (Navi 48, kernel 7.1.0+, patched):   PASS in 0.93s
  - GFX1102 (Navi 33, kernel 6.18.0+, unpatched): FAIL in 13.2s
    (destination contained original 0xAA pattern, indicating GPU PTEs
     were not flushed after munmap())

Vitaly Prosyak (1):
  tests/amdgpu: replace fork-based memory pressure with mmap in userptr
    stress test

 tests/amdgpu/amd_userptr_invalidation.c | 32 +++----------------------
 1 file changed, 3 insertions(+), 29 deletions(-)

-- 
2.54.0

