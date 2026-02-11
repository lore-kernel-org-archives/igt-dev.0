Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF384E9E2E9
	for <igt-dev@archiver.kernel.org>; Wed, 11 Feb 2026 11:41:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68BB210E00B;
	Wed, 11 Feb 2026 11:41:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bZ+470sQ";
	dkim-atps=neutral
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012018.outbound.protection.outlook.com
 [40.93.195.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7035010E00B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Feb 2026 11:41:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fzZKXccSPPTOAzSlZSbMx8IRlNN9W/rcySvhagtqdIFXGxYIYFtL9jhSSVL6NJBoAPGnCeXf8UQohGjheLScVVBv4+j1o27RfwIH5VPHuv5MN65ey0WojUuuTrTIrAMBVSCz4BJ8Aqey2cYYqbPnKmoWq+L32QJ+ZrqTIqWcYNRT101HyPVPJk+uext2AizFoRXub/9r68K82ld+EaG8LKDl6ZvDPFcKvWLBZL7Vw7+AqZbH00tjfq+3q1smQBdxvpefxLopXCVIl3bu1yAyxxIsLt/SRPLBuYGWJs8tL30gCIiM9UrrWJNu59sopei8DX5CRWBuqlZxrPOK/zLFtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jx4FnVxSlw3vMBX1zqIP68u0S19P58Dj8BHUj4NImW0=;
 b=vennu+cp4wHu3BAakFuKui0VRzGBhMe/jw0IwBVbcKuKSJkc9ZkBMeemnYGbSkdh8J3EytoTFwBpx7JZzUacomMlq7Qb32RsdfRCF5aMfqnja+IZKDN/mm7hpfjY4nIA8hkU0Qm4uM28IPuoqg4XiNARZfAzSbwW5fqknLdnrHbMNaOEWI4eQGwMR1tLIzPtMP9i0aZZx0qkl7+7BMoSLLQ4N9/P8ylbR/NbGaxtKBr72e6JNz8wjnlUNslOsMOKoqOqAUz/S1oZ6+NTleicb6opLSeMYmSswKmcPJhNnK8kayZ4Uwg5GacdqtIn7cdzFeS/ccjJeD0x5kun31kCRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jx4FnVxSlw3vMBX1zqIP68u0S19P58Dj8BHUj4NImW0=;
 b=bZ+470sQSCdSC50i2baMFAK4IvbhL/MPDtjibcqfqJdX6NmLNL9XIcyoB8pyYUDbXf3Sx1SyW33rX1rB2mg5y+bwJG6OUmQdtXWJ7rbqgd5Hl3QFYAzjyVKEANy8mS1o0lJhl5Mo+i/jSPTzDU0qlJDxamdts6RqwGWr9ogqGP8=
Received: from CH5P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::19)
 by IA0PPF52B16157D.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bce) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Wed, 11 Feb
 2026 11:41:02 +0000
Received: from CH1PEPF0000A34C.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::b7) by CH5P223CA0003.outlook.office365.com
 (2603:10b6:610:1f3::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Wed,
 11 Feb 2026 11:40:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000A34C.mail.protection.outlook.com (10.167.244.6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Wed, 11 Feb 2026 11:41:01 +0000
Received: from amd-X570.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 11 Feb
 2026 05:40:59 -0600
From: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <vitaly.prosyak@amd.com>, Yogesh Mohan Marimuthu
 <yogesh.mohanmarimuthu@amd.com>
Subject: [PATCH i-g-t 1/2] lib/amdgpu: support FWM packet in user queue
Date: Wed, 11 Feb 2026 17:09:21 +0530
Message-ID: <20260211113922.11211-1-yogesh.mohanmarimuthu@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34C:EE_|IA0PPF52B16157D:EE_
X-MS-Office365-Filtering-Correlation-Id: 58fcbf06-b422-48f5-1363-08de69626e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/eG9wfPIlHOMCIqlIP1bVgV6fEIocMAdfuZPlJE5r2ZX1bkK+7vCJ1ZI2QsW?=
 =?us-ascii?Q?BVR7P4WSOkzi07GdwT9bXDGWY2ch5u5yU5P9sacVaw/uij6TqdLwC0TYY0Up?=
 =?us-ascii?Q?MJJBJL2uznavI+R8CfrrXN66lvaBeZ09v1Fg9NQllIe9BxhpeUR7v0woVpeq?=
 =?us-ascii?Q?ScA1whKoqmxuUCd+TlZNP2FeEf9SGPIGWnagJHoGuRU/BdKIBtNB5QEH0L9Y?=
 =?us-ascii?Q?d80YavEl5I+x7/hCJFPSjABUduk+6gEAhIjcb2DPSv4ZTMjP4P/X+X1c0g4H?=
 =?us-ascii?Q?wj/l61bCutwctzDP5SkxleY23mkbxHrGPA7vmWFcmK1Gp6RpL28ai29p0qfP?=
 =?us-ascii?Q?WU5CDx9ujK8MM9+2/bok09Dx+cGYcNGRAbdHZL2h3kJjS2uVsk2ypTAf00Qp?=
 =?us-ascii?Q?jDq2iW2p/XDfUQTclorRk3t6DVxFsK2cTpFpRjSfSNd4p0MAwCyibhHUgZKS?=
 =?us-ascii?Q?iOMD8L4FgsPaWs625atDWCpzGe3Dhgs9DTOgyOdBmTuoaEScRKfgbjwnQg1x?=
 =?us-ascii?Q?/Y0K15HgoGUT+Yh7m5uyPdcHUQybkjDskVGxYFLeEFsKqW+213EH1BM1HZlH?=
 =?us-ascii?Q?0zA35/Spf1b4Ctnpu9EFLw/Qdde5FO7lq9atuUANrPog9Sv4p5R3x4b4aj/n?=
 =?us-ascii?Q?Fi/j4FXXEyNc2lLuiFXrTLlEorIXEV6O1hJKmglWGweY8EKvnAlkIViA0sQ1?=
 =?us-ascii?Q?vVwiJSlEQGm+LEdjYxJBCF9OfVVwLIcFjkpuuoiqqtwF7UsvsWk0FpEYH+ZX?=
 =?us-ascii?Q?atwQ2XJvbpAGcqJAP1g+rMOnl3gnBP1wLrvD88blekSored+Kqp53FTF5wqM?=
 =?us-ascii?Q?YCTqzwcUMx2H9RMg+hceO6S/jFQYk/aAcbp8aBkPDeo+14AT8MtpZxjdSp0E?=
 =?us-ascii?Q?ec4KZw8y2AipwmfdDT+axtR5Tubh67E35E4XZvkeoA6TgvpC5EGO1OHqGHpV?=
 =?us-ascii?Q?0Eztho2x0CaPiihbZ5G9hGeyzzo6myab9rw3HDomgq5uDUxX5tmvjDi/m6FX?=
 =?us-ascii?Q?q7vrO9/gkTiVK0dUeD1Guwf5pQ9sk/2qbYXb//u+rOPV08xJqKnFl0OOf+mW?=
 =?us-ascii?Q?vPRSgz2oIoq3lEaXcCOvt4wUHL2kgTEMixrQ8nRICdwXgRAgtvTowIlX15Cw?=
 =?us-ascii?Q?Rn+U1RZzv8GcF/Tl9IJbm+t0r0e9VT0SND7TODICTZw/TwhCAa78Yv/2GbA5?=
 =?us-ascii?Q?gMQV2PKnTi+P+5FVQFEDvxJ+zaDQqQvtOVJmFQs9wYAc8LV8lDtv5GgQgbnU?=
 =?us-ascii?Q?2awEgmwcgMb4FHEZoljwHp0pZoQa3rtgBaTkNW3brTFxu+xj7JproVV1k2ZA?=
 =?us-ascii?Q?ScwghvSb4SOIUPKz2+yWj7mvKzUNF8TlsYEA4jJVnwvKfKgdT7HhHFMGAprH?=
 =?us-ascii?Q?RHY3KLQmB4G6dpbKOjPJamCgUJp3SqP8dez8pfOap9GOLtuE7RwwWsPj26Ez?=
 =?us-ascii?Q?2IyADhMW7B2XWwAZCgCMQqPK2D9szsjHVhaPEStbSw4aP1DqQGXnC3E/sYnL?=
 =?us-ascii?Q?a/eb/VNdJ9EgZx6rmWWQjuYeiT+IjPNgetHZ7U+DcGxRHTXs14zG2Zu0IMYL?=
 =?us-ascii?Q?0LskzJ4p2BMSmsKSSL9Q22d/d335MRVZl+Mlrpbm1Qx/aSLBxJ5fC0QPg+5l?=
 =?us-ascii?Q?wgwunVr0VHCfF1L/5HuTETI9VomU5zUA+0eVx//uB9TV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: DPH9sezjeInql/KBuWOuzm8RR9VyCDlPHZQ2L0VWAylkPJZ7SQclgB9g3FYerUyuj0s7PXaYj9MYvouQ+ROCMXTuYTTZuRmk2tNE7JUi4uozZapsWtCUEQ8GUdpzfrJnlbiinAsW19DpOB0K8m3gfHe0mWLs/3KWqJZ4+NNcoMpjmxldgsYxqI+UA3Knli/KOd+i6pf1mLhhTQhq1YZp6TUU67J5+iCrfU4aP2ioX9TllZISOOJ7byQilGGwlOBJi8cSM1weeenJUSbeJq6yBZlXzxe1S/sHYyHoWwlbsLJzkP9V6TBZ6O20luQSR5TUjxQJqtz5qKpVyOjF6oMfieFcIKzps9BuuxKEGq0GSC8h5IUCpvJgLpbzY8qe5Xn23icVL7FjWyxJM4nxqhQdoE9MnytNvZ+KyRBn1fDSTlEMMfJZFzlh1hjdYAaJQFQD
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 11:41:01.5515 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fcbf06-b422-48f5-1363-08de69626e93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF52B16157D
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

Also add WRITE_DATA job start marker packet optionally. This can be used
to know job has started and make FWM packet negative testing timeout to be
shorter.

Signed-off-by: Yogesh Mohan Marimuthu <yogesh.mohanmarimuthu@amd.com>
---
 lib/amdgpu/amd_PM4.h                |  6 ++++++
 lib/amdgpu/amd_command_submission.c |  5 +++++
 lib/amdgpu/amd_ip_blocks.c          | 27 +++++++++++++++++++++++++++
 lib/amdgpu/amd_ip_blocks.h          |  5 +++++
 4 files changed, 43 insertions(+)

diff --git a/lib/amdgpu/amd_PM4.h b/lib/amdgpu/amd_PM4.h
index 8f59b4223..923826656 100644
--- a/lib/amdgpu/amd_PM4.h
+++ b/lib/amdgpu/amd_PM4.h
@@ -224,4 +224,10 @@
 #define	PACKET3_INCREMENT_CE_COUNTER		0x84
 #define	PACKET3_WAIT_ON_CE_COUNTER		0x86
 
+#define	PACKET3_FENCE_WAIT_MULTI		0xD1
+#define		FWM_ENGINE_SEL(x)		((x & 1) << 0)
+#define		FWM_PREEMPTABLE(x)		((x & 1) << 1)
+#define		FWM_CACHE_POLICY(x)		((x & 3) << 2)
+#define		FWM_POLL_INTERVAL(x)		((x & 0xFFFF) << 16)
+
 #endif
diff --git a/lib/amdgpu/amd_command_submission.c b/lib/amdgpu/amd_command_submission.c
index 52327c69e..399171b44 100644
--- a/lib/amdgpu/amd_command_submission.c
+++ b/lib/amdgpu/amd_command_submission.c
@@ -10,6 +10,7 @@
 #include "lib/amdgpu/amd_sdma.h"
 #include "lib/amdgpu/amd_PM4.h"
 #include "lib/amdgpu/amd_command_submission.h"
+#include "lib/amdgpu/amdgpu_asic_addr.h"
 #include "ioctl_wrappers.h"
 
 
@@ -185,6 +186,10 @@ static void amdgpu_create_ip_queues(amdgpu_device_handle device,
 		ring_context[ring_id].pm4_size = pm4_dw;
 		ring_context[ring_id].res_cnt = 1;
 		ring_context[ring_id].user_queue = user_queue;
+		if (ip_block->funcs->family_id == FAMILY_GFX1150)
+			ring_context[ring_id].max_num_fences_fwm = 4;
+		else
+			ring_context[ring_id].max_num_fences_fwm = 32;
 		igt_assert(ring_context[ring_id].pm4);
 
 		/* Copy the previously queried HW IP info instead of querying again */
diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index 12f92a1d5..e8803c6e2 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -659,6 +659,33 @@ user_queue_submit(amdgpu_device_handle device, struct amdgpu_ring_context *ring_
 		amdgpu_sdma_pkt_end();
 	} else {
 		amdgpu_pkt_begin();
+
+		if (ring_context->job_start_write_data_va_addr) {
+			amdgpu_pkt_add_dw(PACKET3(PACKET3_WRITE_DATA, 4));
+			amdgpu_pkt_add_dw(WRITE_DATA_DST_SEL(5) | WR_CONFIRM | WRITE_DATA_CACHE_POLICY(3));
+			amdgpu_pkt_add_dw(ring_context->job_start_write_data_va_addr);
+			amdgpu_pkt_add_dw(ring_context->job_start_write_data_va_addr >> 32);
+			amdgpu_pkt_add_dw(ring_context->job_start_write_data_val);
+			amdgpu_pkt_add_dw(ring_context->job_start_write_data_val >> 32);
+		}
+
+		if (ring_context->num_fences) {
+			unsigned num_fences_in_iter;
+
+			for (unsigned i = 0; i < ring_context->num_fences; i = i + ring_context->max_num_fences_fwm) {
+				num_fences_in_iter = (i + ring_context->max_num_fences_fwm > ring_context->num_fences) ?
+					ring_context->num_fences - i : ring_context->max_num_fences_fwm;
+				amdgpu_pkt_add_dw(PACKET3(PACKET3_FENCE_WAIT_MULTI, num_fences_in_iter * 4));
+				amdgpu_pkt_add_dw(FWM_ENGINE_SEL(1) | FWM_POLL_INTERVAL(4));
+				for (unsigned j = 0; j < num_fences_in_iter; j++) {
+					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].va);
+					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].va >> 32);
+					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].value);
+					amdgpu_pkt_add_dw(ring_context->fence_info[i + j].value >> 32);
+				}
+			}
+		}
+
 		/* Prepare the Indirect IB to submit the IB to user queue */
 		amdgpu_pkt_add_dw(PACKET3(PACKET3_INDIRECT_BUFFER, 2));
 		amdgpu_pkt_add_dw(lower_32_bits(mc_address));
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 424b3210a..17f94fd5b 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -279,6 +279,11 @@ struct amdgpu_ring_context {
 	bool user_queue;
 	uint64_t time_out;
 	enum uq_submission_mode submit_mode;
+	uint32_t max_num_fences_fwm;
+	uint64_t num_fences;
+	struct drm_amdgpu_userq_fence_info *fence_info;
+	uint64_t job_start_write_data_va_addr;
+	uint64_t job_start_write_data_val;
 
 	struct drm_amdgpu_info_uq_fw_areas info;
 };
-- 
2.43.0

