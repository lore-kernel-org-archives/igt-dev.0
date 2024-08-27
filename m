Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A40C52D6F
	for <igt-dev@archiver.kernel.org>; Tue, 27 Aug 2024 05:19:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A52A10E05F;
	Tue, 27 Aug 2024 05:19:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1Ps9iKCT";
	dkim-atps=neutral
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86B5810E05F
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2024 05:19:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ss9Ek0vzeLPcwphk0+jShfq2k62ggnFrpALUHb6tMvD2mWwS/q+g/+xJdlc/qbKAkFskVhXGd04z8LmslYSmJfQ84DiCAM6AyXtqN/iDA38LZeaUfOxvXnMaEcvBJPnqqVOlPIDaGSgrDl3ZtK59b0h6jiXPIhz1+dji66QHiGf1fm315je+rSilWL71rnlxHiif5n27APoIfXT2m/jf7tRXRq9u2H1EPO8v46iifZa64lZUUI5O7UAv7clqGQ0VLpXbxH7F/Bn+OZQ4/NiTrB0Nuu2V9Sj7t5Rn9H0JCy2aASHY7gL0LliKoGEFN/OLJtoYcqQOnykZjpeznjyJ9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ekYGvExCqrh5QumHkYT+Pdyphy2dWHXnAXsjEkA5MAs=;
 b=wfIHZMnwX4FwdgOJ7FNBCnqcEPwcUiG8Ty6HMBPnA22igD3z/IF6KwSnI805CCR3cWDIg5eoac6ly9sD9IIp5GFECIOL/3vu0xHrfxB4a5WVbVLOe/2Kb3ey2Lb/Bc9RkKffnlHc/NXs6RY+paroIvdyljNqbvGTJHr5U6zuAc2voN/CESZ0BvY3KOjwEPyZN8NwPWvo3tRyMsrWIhJUCfLqZq4bUHPeKFxp7YZSXzJDYzmkMxWrJJBMOKIgSwHOulxzUiGbFddWSXezLyZnoeQm/jjqZG94Oyo0CXeXOG7q/uIpy8ZD0WQA1mQ3cEtJzc4THXF7D/pW578a+AZXtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ekYGvExCqrh5QumHkYT+Pdyphy2dWHXnAXsjEkA5MAs=;
 b=1Ps9iKCTd2H0KcGulEQfV/VqfPgIJA03zfRJSXtjkTPhkMU6kCp3YUp8Srw8lyN/21xcM+SdGx7kkkFXXo8CkFmOufAWskgN0SGXuDHgYdYAjSoDYRjC672Imo2txOOkw3zjclZamyCI2Ov32ndAokV8feOPP0J5cR31504gjho=
Received: from CH2PR14CA0057.namprd14.prod.outlook.com (2603:10b6:610:56::37)
 by DS0PR12MB7535.namprd12.prod.outlook.com (2603:10b6:8:13a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Tue, 27 Aug
 2024 05:19:36 +0000
Received: from CH2PEPF0000009C.namprd02.prod.outlook.com
 (2603:10b6:610:56:cafe::4b) by CH2PR14CA0057.outlook.office365.com
 (2603:10b6:610:56::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25 via Frontend
 Transport; Tue, 27 Aug 2024 05:19:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000009C.mail.protection.outlook.com (10.167.244.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Tue, 27 Aug 2024 05:19:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 00:19:35 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 27 Aug
 2024 00:19:34 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 27 Aug 2024 00:19:33 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] test/amdgpu: fix unknow test issue for amdgpu queue test
Date: Tue, 27 Aug 2024 13:19:32 +0800
Message-ID: <20240827051932.74382-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009C:EE_|DS0PR12MB7535:EE_
X-MS-Office365-Filtering-Correlation-Id: 05100a78-5163-4749-e10d-08dcc657d767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1ELMjpPqsFiHMvMBb4X1yF868G8byj3Bk4PwAx0hdNKsFQ8RkTkfRwMwFilS?=
 =?us-ascii?Q?5Z+KszmVQ5rDEJqjaEmoTXhUKGt15dfSIxLcbxOcd9Ruv1QSUd9H7jDYcFew?=
 =?us-ascii?Q?gU4g6tnnieyKCKfmfYC8nyBYMsi/5lUNOfeovNIPxNlnsSKYiTltG9i6hGTP?=
 =?us-ascii?Q?dE7/oLgBy9cZXPVdKboDaSGH42Nj8koG4R1eC2TWrY4UEV7Qphlh8ePAhd+3?=
 =?us-ascii?Q?2nzTZMdjihVzmygcCp7W0o82lUgnMfNM+hVtVwAY1vzpmnPLDROpEWYRKL+9?=
 =?us-ascii?Q?fYDp+7pUwobsSE5LUPDRM+dajpx4BkyBjiENelUjsvzeOa7jdrvVWIF7yEZN?=
 =?us-ascii?Q?P8E3EY67xdBYG6dhOxefH8Nl1EmfFi8fvMF/mIqqdASr3mNdWDwqYi3Wk50d?=
 =?us-ascii?Q?uf2y5AA1FnVPg+mDTQbgGwCCrMSWC6QaAsj7NVS+m0g8/7c5uSCC8jGDv4rU?=
 =?us-ascii?Q?hgSr+1iNt2NzOU/HCfZ5vXYziEzPR1mfeRieZu0jxFJKbzCKpEyO30lu4J/x?=
 =?us-ascii?Q?gdgzqmN4WcV1AE6q5KyqWyBgE80ADnXTm9Mc066219boHhHvANZmZuVU0Htg?=
 =?us-ascii?Q?8w02a1eM33pv7mDb3XQsdweWANX7usXKA962EOfH2iDpmf3xfDJf50O6WFmg?=
 =?us-ascii?Q?KmamT9VCen4mCZDc5IjNLEzi9CVwds19XYqAJ9Nr7JZeZtjQw/coGTEE+oF2?=
 =?us-ascii?Q?xn6HQ4gbv6vZoHIfyQPnCdoNtXE1ihczp7Iu4KJorao7WXf+x+Nzw1Vmp0ZB?=
 =?us-ascii?Q?DXVzZ6t1SBuIDDIIhS0uzY1avptUbx5KI5pXG9YmjthZ0D+b0reKxjRdSDt8?=
 =?us-ascii?Q?LgGAgpKJa/2quuxg1nOIloZk01rcAwe2ddDtZ4b+B/Ho1RU2EeBfXBmV2D99?=
 =?us-ascii?Q?/Fx0wmmWTJKLAb+FKAjM+4vdFKw/INIwPGjOIfUbhqKfdDVs2Dpir0pPI38d?=
 =?us-ascii?Q?9KvZKpiDIG9yiRBUsX0C0Qhu8skpTYnoSOCPWGu4M8wpp6aT3UbIT352njap?=
 =?us-ascii?Q?Fy1mbGA3Zv08JPls2VPoqxetnKEUkjZZkRRS8f2UWGrkkxsNSphFzaZlsfct?=
 =?us-ascii?Q?FmVvvvLfx+u6q8CmPJyTzPYlsSdDRIEBDXZOUYzPl9Aap6TayiMH2xVupZoi?=
 =?us-ascii?Q?d9pjnoTChz9QDX9HKV4lx3MRUyyNqPuXb+eH6Q4zdRqEu+yPmfBllkEB9cLV?=
 =?us-ascii?Q?qHnTSL0TsssJ+N0owBMD/ESgPK6YMQ621mCmZaUoWnHy3JQZ5XTPZ5vhFUgz?=
 =?us-ascii?Q?UFC9PcDwKMZrAjEP0ej4aruiazD5HFNm5Mt7Exv5N0Q195cgWz7WAlIKaZ5L?=
 =?us-ascii?Q?OCjW2UDx4e0uasfs+uliX6xIXZKoSbL0wyKg9bA4Cyc+UAix2kWQZQSdkVZs?=
 =?us-ascii?Q?A8HVj0mjwUcuHY3WxJdwaDSb4+EZELRaKkX/BoexY9WC+seU1uexB2EhYt1Q?=
 =?us-ascii?Q?5zDehDbtbbMdexLipMSjOMGxr47kREVl?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 05:19:35.7193 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05100a78-5163-4749-e10d-08dcc657d767
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7535
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

Queue reset does not exit properly when executing unknown subtests.
Because other processes are still functioning.

It should exit the other three processes
(test, background, and monitor) for this case.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 60208e085..85408e3ff 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -70,6 +70,7 @@ struct shmbuf {
 	int count;
 	bool sub_test_completed;
 	bool sub_test_is_skipped;
+	bool sub_test_is_existed;
 	unsigned int test_flags;
 	int test_error_code;
 	bool reset_completed;
@@ -148,6 +149,7 @@ skip_sub_test(struct shmbuf *sh_mem)
 {
 	sem_wait(&sh_mem->sem_state_mutex);
 	sh_mem->sub_test_is_skipped = true;
+	sh_mem->sub_test_is_existed = true;
 	sem_post(&sh_mem->sem_state_mutex);
 }
 
@@ -327,6 +329,7 @@ static void set_next_test_to_run(struct shmbuf *sh_mem, unsigned int error,
 	sh_mem->good_job.ip = ip_good;
 	sh_mem->good_job.ring_id = ring_id_good;
 	sh_mem->sub_test_is_skipped = false;
+	sh_mem->sub_test_is_existed = true;
 	sem_post(&sh_mem->sem_state_mutex);
 
 	//sync and wait for complete
@@ -405,6 +408,7 @@ shared_mem_create(struct shmbuf **ppbuf)
 	shmp->sub_test_completed = false;
 	shmp->reset_completed = false;
 	shmp->sub_test_is_skipped = false;
+	shmp->sub_test_is_existed = false;
 
 	*ppbuf = shmp;
 	return shm_fd;
@@ -1128,7 +1132,6 @@ igt_main
 			create_contexts(device, &arr_context_handle, const_num_of_tests);
 		else if (process == PROCESS_BACKGROUND)
 			fd_shm = shared_mem_open(&sh_mem);
-
 		igt_require(fd_shm != -1);
 		igt_require(sh_mem != NULL);
 
@@ -1136,7 +1139,6 @@ igt_main
 			process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
 			&monitor_child, &test_child);
 	}
-
 	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
 		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
 		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
@@ -1154,6 +1156,10 @@ igt_main
 			}
 		}
 	}
+
+	if (sh_mem &&( !sh_mem->sub_test_is_existed))
+		set_next_test_to_skip(sh_mem);
+
 	igt_fixture {
 		if (process == PROCESS_TEST) {
 			waitpid(monitor_child, &monitorExitMethod, 0);
-- 
2.25.1

