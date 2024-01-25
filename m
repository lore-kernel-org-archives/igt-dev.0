Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C44A9C47DDF
	for <igt-dev@archiver.kernel.org>; Thu, 25 Jan 2024 03:44:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CDD710EAB0;
	Thu, 25 Jan 2024 03:44:24 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2072.outbound.protection.outlook.com [40.107.244.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07AC410EAB0
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jan 2024 03:44:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WLXo3/+1PbHPthnlm2FfFbzcZAnHxJqP7knue8tXEtkwmqWpCh1gy7JZ/DyE0FFv0qIYrkk7K44IP5d8XZbmBuU1mkIWT0R4Fwi6RLIQrR7nxlFmLrjoMrZQBOopOavqtIPH3lYRcoalPSO11FdWdrQ29Fi/RQjO2RN11BjlElxol8mVcPUOQ85/GIq55ILlotFRYXCMNpovJV6bXju2jg6yjbtCTv/EPfl7c6NqnMHzfHYjfQB2YRLejU8k0xNRUxLCChe7AbLkQGWgz+Ys2tG/kuKdUwB6D2nJeZjoICj8LvR4xnS8v1baQyc31+8ohXKXyi8uYiKG6Oc3spAl2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+x5u/ai34tnfCcpujJOYT8J5N5y92ylKu/qsPULSLBk=;
 b=Dl2FBtVrmNcv5wMTLbquIGuigAJjkb041ira/uYG7eRH574dsfhKKGYARCoGoqyHxOmRmHZPju5EDsz1j0jwz4fMJ8//QoiCF5v3SZuMLdw8KtFhpM4gqG+xjY9X34W08Qw8Jhnfv5WD5O+2XQgixdJ/cyVRkz4EamuF3nI2jODS8At6f+kkWwdq/9hCJPljLfkSHhqoVIgElRvgCTkRrmshBoaQ27EbeKoSbZW+vxG2wq+W32zD99PDiGM2NSDQWLJPF6ezJtiZFjPuG8F7wDvQpmxAkHssAS8WU6KkcdpU6R3ulqpNBBOnEKewRp/DM/7SfkXHQ3iCtaJT/HfAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+x5u/ai34tnfCcpujJOYT8J5N5y92ylKu/qsPULSLBk=;
 b=yX0WCUS8m2H9hebtdr/GeQOa91XxjHmS7zzDEYvmLRZSqRNXMDvBw4xGnSbZvQB0DwbMNnAgL7FxafdW59c34ruvPcKacBpfwe8yQWS2La/mp8aCtY4uRnjv30vaxG/2uA08iLipXfZMXQcQsBWZAnQqwYGAWwwoiGPw1OO8huM=
Received: from MW3PR06CA0011.namprd06.prod.outlook.com (2603:10b6:303:2a::16)
 by LV3PR12MB9267.namprd12.prod.outlook.com (2603:10b6:408:211::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Thu, 25 Jan
 2024 03:44:20 +0000
Received: from MWH0EPF000989E5.namprd02.prod.outlook.com
 (2603:10b6:303:2a:cafe::9c) by MW3PR06CA0011.outlook.office365.com
 (2603:10b6:303:2a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22 via Frontend
 Transport; Thu, 25 Jan 2024 03:44:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989E5.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Thu, 25 Jan 2024 03:44:19 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 24 Jan
 2024 21:44:17 -0600
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Wed, 24 Jan 2024 21:44:17 -0600
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
Subject: [PATCH 2/3] lib/amdgpu: add a CS helper function
Date: Wed, 24 Jan 2024 22:44:12 -0500
Message-ID: <20240125034413.232349-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240125034413.232349-1-vitaly.prosyak@amd.com>
References: <20240125034413.232349-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989E5:EE_|LV3PR12MB9267:EE_
X-MS-Office365-Filtering-Correlation-Id: b5e698d1-ecfa-4180-77ba-08dc1d57e9bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kG3r7ep6uX41dCRc9350uewomkMtNCvFF3cksCli74g2Bk9g/zR/2RaWVmOCu79bscBRism4wH19LMGM5Yt+D6CaEaMlZPsvNWuTyklFOgrs9Ue08iTg5AlA/s9UOd4NbS7vG6lvY7p+4B0HOKef5fhIBLU7VgBAPGNsYRWTvcZKe125QZQXqRKbExDgGBHsFPn68imQ2exRadnvsMB0p8HKezcLBoWgK9F6br/SGGTd2tMplhTNxfvaj40aBGAkzfbApGSfM4mty2yc144ktN6rRc6ffrZs1PHOsc4G91R9ty/MhtzXMpBnk9BaCO1WMJYyStloeK8yLAwWH+JjCxaemrsARJzij5vkeEt0hdMlxKc3mvDC9oGI7yHXGNfJn/JfWPxyXnmiMmq4Ll81Nvg5As3VR6Be8AvSIcvYKvazTzuuq+txSU10XPIcjE4U8qFcT2nTuGDVluRHCApzxtoW/y3Uv4pi8vm83ojjQYuPddaRN3TD0iMnI2aDJTwX7i+V6j9aDHm7S//TixZM1T260VsB517CLv8D7k2L5V5qXHeN4QdxzVoeVxk94hpsoGREyRDZ9IO33PJkRXxYdbs3i5cqDf4MzY/9FpO9XOiabw8WHeE2ACzPcsEetr02CfJrg30K8GmQ6g9Y+ujygMDIB+Mjr7eV0j7LPakPFQ5/Fjyb7e3U7OEAkk9b49ZZFHLv56gbZoKiN+x8YvDRIFMFFCTSfpaBnWsR3aENlG/9GAUXq+gLq15bcNDIqOlSvWNetqqIFHGiO9fvEwFxFQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(346002)(396003)(39860400002)(136003)(230922051799003)(1800799012)(451199024)(82310400011)(186009)(64100799003)(36840700001)(46966006)(40470700004)(2616005)(316002)(1076003)(54906003)(47076005)(6916009)(70206006)(70586007)(5660300002)(426003)(336012)(26005)(40480700001)(40460700003)(7696005)(478600001)(6666004)(83380400001)(2876002)(36756003)(2906002)(41300700001)(86362001)(81166007)(356005)(36860700001)(8676002)(8936002)(4326008)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2024 03:44:19.9008 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e698d1-ecfa-4180-77ba-08dc1d57e9bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9267
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Christian
 Koenig <christian.koenig@amd.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Add a cs helper function.
CS helper function works as RADV
radv_amdgpu_cs_submit. We want to validate
and ensure the integrity of the following
functionalities when  the following method
is called 'amdgpu_cs_submit_raw2':

1. Gang submission when several different IPs are into
   a single command, but those IPs are shared the
   instance and ring numbers(ip_instance, ring).
2. Use 'AMDGPU_CHUNK_ID_BO_HANDLES' vs explicit parameter into 'amdgpu_cs_submit_raw2'.
3. Not use  'AMDGPU_CHUNK_ID_DEPENDENCIES'.
4. User fence always present except for multimedia ring commands.

RADV uses those scenarios.

Cc: Jesse Zhang <jesse.zhang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_cs_radv.c   | 172 +++++++++++++++++++++++++++++++++++++
 lib/amdgpu/amd_cs_radv.h   |  61 +++++++++++++
 lib/amdgpu/amd_ip_blocks.h |   2 +
 lib/meson.build            |   1 +
 4 files changed, 236 insertions(+)
 create mode 100644 lib/amdgpu/amd_cs_radv.c
 create mode 100644 lib/amdgpu/amd_cs_radv.h

diff --git a/lib/amdgpu/amd_cs_radv.c b/lib/amdgpu/amd_cs_radv.c
new file mode 100644
index 000000000..3c51ff7ef
--- /dev/null
+++ b/lib/amdgpu/amd_cs_radv.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+#include <time.h>
+#include <sys/time.h>
+
+#include "lib/amdgpu/amd_memory.h"
+#include "lib/amdgpu/amd_sdma.h"
+#include "lib/amdgpu/amd_PM4.h"
+#include "lib/amdgpu/amd_cs_radv.h"
+
+#define TIME_MONOTONIC 2
+#define OS_TIMEOUT_INFINITE 0xffffffffffffffffull
+
+enum { MAX_RINGS_PER_TYPE = 8 };
+
+static bool
+amdgpu_cs_has_user_fence(struct amdgpu_cs_request_radv *request)
+{
+	/* TODO */
+	return false;
+}
+
+static int64_t
+os_time_get_nano(void)
+{
+	struct timespec ts;
+
+	timespec_get(&ts, TIME_MONOTONIC);
+	return ts.tv_nsec + ts.tv_sec*INT64_C(1000000000);
+}
+
+static int64_t
+os_time_get_absolute_timeout(uint64_t timeout)
+{
+	int64_t time, abs_timeout;
+
+	/* Also check for the type upper bound. */
+	if (timeout == OS_TIMEOUT_INFINITE || timeout > INT64_MAX)
+		return OS_TIMEOUT_INFINITE;
+
+	time = os_time_get_nano();
+	abs_timeout = time + (int64_t)timeout;
+
+	/* Check for overflow. */
+	if (abs_timeout < time)
+		return OS_TIMEOUT_INFINITE;
+
+	return abs_timeout;
+}
+
+static void
+os_time_sleep(int64_t usecs)
+{
+	struct timespec time;
+
+	time.tv_sec = usecs / 1000000;
+	time.tv_nsec = (usecs % 1000000) * 1000;
+	while (clock_nanosleep(CLOCK_MONOTONIC, 0, &time, &time) == EINTR)
+		;
+}
+
+uint32_t
+amdgpu_get_bo_handle(struct amdgpu_bo *bo)
+{
+	uint32_t handle;
+	int r;
+
+	r = amdgpu_bo_export(bo, amdgpu_bo_handle_type_kms, &handle);
+	igt_assert_eq(r, 0);
+	return handle;
+}
+
+uint32_t
+amdgpu_cs_submit_radv(amdgpu_device_handle dev, struct amdgpu_ring_context *ring_context,
+		struct amdgpu_cs_request_radv *request)
+{
+	int r, num_chunks,  size, i;
+	struct drm_amdgpu_cs_chunk *chunks;
+	struct drm_amdgpu_cs_chunk_data *chunk_data;
+	struct drm_amdgpu_bo_list_in bo_list_in;
+	uint32_t result = 0;
+	uint64_t abs_timeout_ns;
+	bool has_user_fence;
+
+	has_user_fence = amdgpu_cs_has_user_fence(request);
+	size = request->number_of_ibs + 1 + (has_user_fence ? 1 : 0) + 1 /* bo list */ + 3;
+	chunks = malloc(sizeof(chunks[0]) * size);
+	size = request->number_of_ibs + (has_user_fence ? 1 : 0);
+	chunk_data = malloc(sizeof(chunk_data[0]) * size);
+
+	num_chunks = request->number_of_ibs;
+	for (i = 0; i < request->number_of_ibs; i++) {
+
+		struct amdgpu_cs_ib_info_radv *ib;
+
+		chunks[i].chunk_id = AMDGPU_CHUNK_ID_IB;
+		chunks[i].length_dw = sizeof(struct drm_amdgpu_cs_chunk_ib) / 4;
+		chunks[i].chunk_data = (uint64_t)(uintptr_t)&chunk_data[i];
+
+		ib = &request->ibs[i];
+		assert(ib->size);
+
+		chunk_data[i].ib_data._pad = 0;
+		chunk_data[i].ib_data.va_start = ib->ib_mc_address;
+		chunk_data[i].ib_data.ib_bytes = ib->size * 4;
+		chunk_data[i].ib_data.ip_type = ib->ip_type;
+		chunk_data[i].ib_data.flags = ib->flags;
+
+		chunk_data[i].ib_data.ip_instance = request->ip_instance;
+		chunk_data[i].ib_data.ring = request->ring;
+	}
+
+	assert(chunk_data[request->number_of_ibs - 1].ib_data.ip_type == request->ip_type);
+
+	if (has_user_fence) {
+		i = num_chunks++;
+		chunks[i].chunk_id = AMDGPU_CHUNK_ID_FENCE;
+		chunks[i].length_dw = sizeof(struct drm_amdgpu_cs_chunk_fence) / 4;
+		chunks[i].chunk_data = (uint64_t)(uintptr_t)&chunk_data[i];
+
+			/* fence bo handle */
+		chunk_data[i].fence_data.handle = amdgpu_get_bo_handle(request->fence_info.handle);
+			/* offset */
+		chunk_data[i].fence_data.offset =
+					request->fence_info.offset * sizeof(uint64_t);
+	}
+
+	bo_list_in.operation = ~0;
+	bo_list_in.list_handle = ~0;
+	bo_list_in.bo_number = request->num_handles;
+	bo_list_in.bo_info_size = sizeof(struct drm_amdgpu_bo_list_entry);
+	bo_list_in.bo_info_ptr = (uint64_t)(uintptr_t)request->handles;
+
+	chunks[num_chunks].chunk_id = AMDGPU_CHUNK_ID_BO_HANDLES;
+	chunks[num_chunks].length_dw = sizeof(struct drm_amdgpu_bo_list_in) / 4;
+	chunks[num_chunks].chunk_data = (uintptr_t)&bo_list_in;
+	num_chunks++;
+
+	/* The kernel returns -ENOMEM with many parallel processes using GDS such as test suites quite
+	 * often, but it eventually succeeds after enough attempts. This happens frequently with dEQP
+	 * using NGG streamout.
+	 */
+	 abs_timeout_ns = os_time_get_absolute_timeout(1000000000ull); /* 1s */
+
+	r = 0;
+	do {
+		/* Wait 1 ms and try again. */
+		if (r == -ENOMEM)
+			os_time_sleep(1000);
+
+		r = amdgpu_cs_submit_raw2(dev, ring_context->context_handle, 0,
+				num_chunks, chunks, &request->seq_no);
+	} while (r == -ENOMEM && os_time_get_nano() < abs_timeout_ns);
+
+	if (r) {
+		if (r == -ENOMEM) {
+			igt_info("igt/amdgpu: Not enough memory for command submission.\n");
+			result = ENOMEM;
+		} else if (r == -ECANCELED) {
+			igt_info("igt/amdgpu: The CS has been cancelled because the context is lost.\n");
+			result = ECANCELED;
+		} else {
+			igt_info("igt/amdgpu: The CS has been rejected, see dmesg for more information (%i).\n", r);
+			result = EINVAL;
+		}
+	}
+	free(chunks);
+	free(chunk_data);
+	return result;
+}
diff --git a/lib/amdgpu/amd_cs_radv.h b/lib/amdgpu/amd_cs_radv.h
new file mode 100644
index 000000000..8b6dcaaa2
--- /dev/null
+++ b/lib/amdgpu/amd_cs_radv.h
@@ -0,0 +1,61 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright 2024 Advanced Micro Devices, Inc.
+ */
+
+#ifndef AMD_CS_RADV
+#define AMD_CS_RADV
+
+#include "amd_ip_blocks.h"
+#define AMDGPU_CS_GANG_SIZE	4
+
+struct amdgpu_cs_ib_info_radv {
+	int64_t flags;
+	uint64_t ib_mc_address;
+	uint32_t size;
+	enum amd_ip_block_type ip_type;
+};
+
+struct amdgpu_cs_request_radv {
+	/** Specify HW IP block type to which to send the IB. */
+	uint32_t ip_type;
+
+	/** IP instance index if there are several IPs of the same type. */
+	uint32_t ip_instance;
+
+	/**
+	 * Specify ring index of the IP. We could have several rings
+	 * in the same IP. E.g. 0 for SDMA0 and 1 for SDMA1.
+	 */
+	uint32_t ring;
+
+	/**
+	 * BO list handles used by this request.
+	 */
+	struct drm_amdgpu_bo_list_entry *handles;
+	uint32_t num_handles;
+
+	/** Number of IBs to submit in the field ibs. */
+	uint32_t number_of_ibs;
+
+	/**
+	 * IBs to submit. Those IBs will be submitted together as single entity
+	 */
+	struct amdgpu_cs_ib_info_radv ibs[AMDGPU_CS_GANG_SIZE];
+	/**
+	 * The returned sequence number for the command submission
+	 */
+	uint64_t seq_no;
+	/**
+	 * The fence information
+	 */
+	struct amdgpu_cs_fence_info fence_info;
+};
+
+uint32_t
+amdgpu_get_bo_handle(struct amdgpu_bo *bo);
+
+uint32_t
+amdgpu_cs_submit_radv(amdgpu_device_handle device, struct amdgpu_ring_context *ring_context,
+		struct amdgpu_cs_request_radv *request);
+
+#endif
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 4cad30d1e..97a9ad489 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -20,7 +20,9 @@ enum amd_ip_block_type {
 	AMD_IP_UVD_ENC,
 	AMD_IP_VCN_DEC,
 	AMD_IP_VCN_ENC,
+	AMD_IP_VCN_UNIFIED = AMD_IP_VCN_ENC,
 	AMD_IP_VCN_JPEG,
+	AMD_IP_VPE,
 	AMD_IP_MAX,
 };
 
diff --git a/lib/meson.build b/lib/meson.build
index 0fc11b26c..6122861d8 100644
--- a/lib/meson.build
+++ b/lib/meson.build
@@ -144,6 +144,7 @@ if libdrm_amdgpu.found()
 		'amdgpu/amd_memory.c',
 		'amdgpu/amd_command_submission.c',
 		'amdgpu/amd_compute.c',
+		'amdgpu/amd_cs_radv.c',
 		'amdgpu/amd_gfx.c',
 		'amdgpu/amd_ip_blocks.c',
 		'amdgpu/amd_shaders.c',
-- 
2.25.1

