Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E650EC3DA7F
	for <igt-dev@archiver.kernel.org>; Mon, 12 Aug 2024 07:51:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984F810E06C;
	Mon, 12 Aug 2024 07:51:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="hTcvoDDf";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2087.outbound.protection.outlook.com [40.107.244.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B787810E06C
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Aug 2024 07:50:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nn2pSm6sahENQdvtWnfHOMTaVfVu/pjen8IwElKJ2ihP1SMSg6FNIwltAckpbm+8Nv8nsicjVWMxw+lDGqPmmqPrBXf7pv4LZUtihvRB07dLsCGHf8pKt723GqayyK6+kiGX/TczW9LzhQMym0dsqAVFbqIyv8AAkhaoNlKvl1a1jQbo0ff6/zSK4+J19E1JNW8mVlDh+b5N8XUgHlPLfEPEVR/gKMqWLR3ssQ/sT5JJHw1B9pbt3YoxeB+xsIo/YFfBDuogaMNdhYddcrHnx/YSwPu3hKPSNc8yiFIEw7h1F1m6Hy/wng+zAZziY3lxNGPFNaJQXqkR6uydJZaIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5jJJm7cMCd/IN6Qx8HdG0F/dW70ZWHEgsqlK7mmrB4=;
 b=W+pbPtcaC1s2cTP3U79qAKTmGgb7ZPKZCG54a0cZBue0kpLxJvDtqYKgLTeZM9jwN4/WOdMsRbCXHHS+/egqc5DBOIOhMaOiT3Fcv86m1rXrB12pt29of7ZiS0K1FFWEvzRSgfzCS2TlPbBVvDBo5phT82D5M915RfVlPFVNVyB3JEPTFvTQ1UWtBhjdE6e1v7jpOvCXyd57nqg7qmeg/wmenB37yEZOYe7t2B0VVLprWSJ51JbJUwTGLuSZjYfvFai4YEujV8o9R0Ky861w4GYiUXJpfSljAr8qq3fUK8+j1T24OXcsFCdG9j1xq0fB8Wnub6ezzgSp4acWhLyfsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F5jJJm7cMCd/IN6Qx8HdG0F/dW70ZWHEgsqlK7mmrB4=;
 b=hTcvoDDf1uxhMwbd1lpkEn4Yaqf+CPoMlCN4FOchqGRSCX3kPquh7eNL1yD1fXqBInLWirgIQPIYIJcXlr5VqaQKCr4xfPITihYVevV4Cx8cmenCWv+ylzQmTEAlykEWQvopPNs1GhnQBMyo4ygLpThX10JyC6v3JEK3aJDUDm0=
Received: from BYAPR05CA0043.namprd05.prod.outlook.com (2603:10b6:a03:74::20)
 by BY1PR12MB8445.namprd12.prod.outlook.com (2603:10b6:a03:523::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.19; Mon, 12 Aug
 2024 07:50:55 +0000
Received: from SJ5PEPF000001E9.namprd05.prod.outlook.com
 (2603:10b6:a03:74:cafe::7f) by BYAPR05CA0043.outlook.office365.com
 (2603:10b6:a03:74::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.13 via Frontend
 Transport; Mon, 12 Aug 2024 07:50:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001E9.mail.protection.outlook.com (10.167.242.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 07:50:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 02:50:54 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 02:50:52 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 "Jesse.zhang@amd.com" <jesse.zhang@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
Subject: [PATCH i-g-t] tests/amd_queue_reset: fix dynamic subtest issue for
 amd queue reset
Date: Mon, 12 Aug 2024 15:50:51 +0800
Message-ID: <20240812075051.2925305-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jesse.zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E9:EE_|BY1PR12MB8445:EE_
X-MS-Office365-Filtering-Correlation-Id: 677448e2-ce87-43a3-180d-08dcbaa37ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8gW2HTwywbzQfEcHlXw/nCj0Bb7QB9JALgN220gl01isgrnPt+oNA64IAw+3?=
 =?us-ascii?Q?Bf8u98lt5vpLg7wqB+duvtUxQyIxJ9AKax5vlMk5HPTiaWBKYIRi+CQqjbTL?=
 =?us-ascii?Q?g3Ah3tONvPT7/2oKkgRQ4JUSIM/x0/gGEZGQGUr7+GjSlEW79sQ5VTFOyXhj?=
 =?us-ascii?Q?0Xrh048zaWhBQO8+j7ItDW8z4LB3h/mlJM+0USR0xVYWF6M4GYXFLFaAKxU/?=
 =?us-ascii?Q?/T2HR5baiHdb4cFLyDy1W0l5di6WhgWUMhUkJJJJ6UdMf/jRgUv6QuGGxfrX?=
 =?us-ascii?Q?piMS3sdFK6AXYevmm9uWL7LR1XNCxpR7KcyEbvHXP1D1Znwv9cdVbBbPNWis?=
 =?us-ascii?Q?IPH5JeqLiW+pc73B3OXRl5JnkAJFzIksxHOM59aC/lbsnRIQPn8o34tBsONu?=
 =?us-ascii?Q?VA/CXa1C7xvV/Wq298ZOdTbp1puvv/kaysziZawBjzhCGdUreOz8WPCxJOSk?=
 =?us-ascii?Q?eMCdTJ4M9tnAATmF0Gtrs8vn+INp8404hW21TT4b1PymGvasL1CbdeSHFx32?=
 =?us-ascii?Q?OldzDoY6YIVvP1AC8JPtWC/m5Zs7cp+f3Rr1AlRpueEKWjMHLxJK6QjmNcEa?=
 =?us-ascii?Q?929DdWtDpPXJVq5V1qsEvst5TShk9RA58J1Cs3Fn+cWMk4BieMgNVhWD5AyV?=
 =?us-ascii?Q?T9T05+GSSC99a1yqJOD8RJRAfpdwrVm2AxHaz9NC2YmR5r1Y+4fHoOO3+lbP?=
 =?us-ascii?Q?ST4ZYBe+i/KHOQK4xH1CMs4K5vxMU8ujDUsOUlTfWK29Mgy32TRpgsoXrLt+?=
 =?us-ascii?Q?XYki0Qu5b//ituaVd4DFGJTwXLcG5oOKzYzGTmeRF4qdBmc+nNqHJqrXjwy2?=
 =?us-ascii?Q?eEa1GdHxbjSimziRiHDz8TZxVa1b32RF5+2Ez8rvp72paYFw4cRAqInTNcct?=
 =?us-ascii?Q?Sv9PDtnkNPu6QoHswgEgFD4GTi0aDCrhwjotIORLjjO1U3yTc84jSY2ZjOGZ?=
 =?us-ascii?Q?OgWzFb0wBPK9Waks0TP6cgBzegoXsDZiGYJasJ7UNd+bytjE79TIQ79DSKzr?=
 =?us-ascii?Q?VM1yS2E6xzLcfH9JGTRZKsAnJFQLELKOkbTWBizZYFQg4twAUdxH2tTjmtNk?=
 =?us-ascii?Q?id/xtIHgNHbURSyDa+mIKEAnwj22dhirvVnv+Sj6IZ3SjHFqTGOjKCb2XNxq?=
 =?us-ascii?Q?KCyhvww8aLXTDhmYi+VBMT50jIZ2x7+dltqO1i6Fk99HPZO72A2nifmvaf42?=
 =?us-ascii?Q?pHcBuocaLTotJaLTUCmk/V9qaOShkeVk1tgofNzApT3FvA6cr87Q4wJxXyaP?=
 =?us-ascii?Q?p6Cua3XU38J2wVUl3Kc1kW5C5Rm057iFtQKoxGKWt+eJFM+/ZdwZYF8PDztC?=
 =?us-ascii?Q?gytPSeKZ75ULLbhmIbw57SeyNL86LOACMCW7Fh3osfCWYxKa0E53mTOCgev1?=
 =?us-ascii?Q?NY7YzDa78wVY3koLic3OK38GTeImn5FQ6XJ7FqqSbTqMHfqWY62D+Yu+hIsh?=
 =?us-ascii?Q?V8xIIYKm2ycOFQy3heMQIQ+im7GNlu35?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 07:50:54.9452 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 677448e2-ce87-43a3-180d-08dcbaa37ee3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8445
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

Correct the usage of igt_dynamic_f or it always print SUCCESS, like this:

Starting subtest: amdgpu-gfx-CMD_STREAM_EXEC_INVALID_OPCODE
Starting dynamic subtest: amdgpu-CMD_STREAM_EXEC_INVALID_OPCODE-1
Dynamic subtest amdgpu-CMD_STREAM_EXEC_INVALID_OPCODE-1: SUCCESS (0.000s)

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 1a128265a..729286d82 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1000,9 +1000,8 @@ igt_main
 			igt_describe("Stressful-and-multiple-cs-of-bad and good length-operations-using-multiple-processes");
 			igt_subtest_with_dynamic_f("amdgpu-%s-%s", ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAPHIX", it->name) {
 				if (arr_cap[ip_tests[i]] && get_next_rings(ring_id_good, info, &ring_id_good, &ring_id_bad, i)) {
-					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name,ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAPHIX");
-					set_next_test_to_run(sh_mem, it->test,
-							ip_background, ip_tests[i], ring_id_good, ring_id_bad);
+					igt_dynamic_f("amdgpu-%s-ring-good-%d-bad-%d-%s", it->name,ring_id_good, ring_id_bad, ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GRAPHIX")
+					set_next_test_to_run(sh_mem, it->test, ip_background, ip_tests[i], ring_id_good, ring_id_bad);
 				}
 			}
 		}
-- 
2.25.1

