Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 454C3FA373B
	for <igt-dev@archiver.kernel.org>; Fri, 13 Sep 2024 10:07:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF42610E07E;
	Fri, 13 Sep 2024 10:07:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LVsJnEch";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2064.outbound.protection.outlook.com [40.107.94.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431AE10E07E
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Sep 2024 10:07:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzLXEeTkg9G6Cecw18YqXaD2OzfNgb4MgtnzVsv5TvVSeSvjVcl8NDUywHpaih0wdYmKjlFuEqLS+UZZzWHiZFv0Ys+k8wKQerqDTeN0qgwj7qm0hZbwTzdVB23UvggUMjpCvdxDNfEWG9CGqqL2JFMA1C3TrIcMu+1+HhNLw0n6f3qt/9MDsrLSnhbJGe/otp9pnxq/Rn0CQwcg8SJlXSbJphPDyASl7qAVPUK//xsaH51liZwdsbE5yhJOWxYCMLyVdzaJQB02fgLYb/O59Fa5RvPSSePosK02j5GR6Bhjf0OjqsyoU3hDqYMl4QAqJ1va2viEjjOH8HOEuINZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3bPB30Az3HM4C6CRqIz1zFdPtzzVvMTmah6bQ5WZpHA=;
 b=Yl2Bab6wdIPgOVsilobH6xOZely1rzcBV5/Ln5ttZEPDG1GRAWURJGWPekZZyBur4Gev2drU+vW3KXJHnRNaPOHS/+xEjqeTWlBQ2oTi+fJgeKySdFeJuYRkGRdhvp3n3wbfHKLCl3XqHEutEJ8xuuRqtwFdlJDgfhtGJIQbB8g8gyYSaqXovAPO1E8aGdVB+ELi80p9s+w98S4NNR9Xl6vGP+4v7buOJjsfmsF5h3EKmFm5VZ8w6AGrRBo/VG/ko2WGK4Ppo6Slu3qyaiQbSvihd8aQg9451bFFdWXLp+NVb0LSOk6L/NECH3at6YqLc2pkEsVr+p2UszQ2PTBZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3bPB30Az3HM4C6CRqIz1zFdPtzzVvMTmah6bQ5WZpHA=;
 b=LVsJnEchExpVIZs8Da/yvktXRajUikuNL9/fW4O8vTHQi+s7k4458Uk+ySHxywQVhNe2mFkdEtvemGXb9vy2GERCUhgcAiLL6Xptgq2wDXBidqPCQIclDFFUfxeMwND5RVIhWFT/sz/fE6OGKDO2gYSbeJx98b1dY2FYYoAqzB0=
Received: from MW4PR03CA0262.namprd03.prod.outlook.com (2603:10b6:303:b4::27)
 by CH3PR12MB8994.namprd12.prod.outlook.com (2603:10b6:610:171::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.20; Fri, 13 Sep
 2024 10:07:36 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:303:b4:cafe::d5) by MW4PR03CA0262.outlook.office365.com
 (2603:10b6:303:b4::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.23 via Frontend
 Transport; Fri, 13 Sep 2024 10:07:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 13 Sep 2024 10:07:35 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 05:07:35 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Sep
 2024 05:07:34 -0500
Received: from JesseDEV.guestwireless.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 13 Sep 2024 05:07:33 -0500
From: "Jesse.zhang@amd.com" <jesse.zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>, "Jesse.zhang@amd.com"
 <jesse.zhang@amd.com>
Subject: [PATCH i-g-t] tests/amdgpu: print expect error information
Date: Fri, 13 Sep 2024 18:07:32 +0800
Message-ID: <20240913100732.2271010-1-jesse.zhang@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|CH3PR12MB8994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fed503f-944f-44f6-cdc9-08dcd3dbe446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TcGeMsqDUSEavJVoUPEA8pjHUDZAbPsmQmjI0Hjq2BWWmdlUa3bsB2UU72Lp?=
 =?us-ascii?Q?qOPZK05xHwOSjzmfWHu4CLeShkhHGyww7V5A1+4iZ0ICacf/f17t/wwqJNI7?=
 =?us-ascii?Q?Ayv0j2QGd/7wfIGJ0dcQ6nxTeYOmegVQxu4HnKG/QZqOKYHaXy3RbFVCcXXL?=
 =?us-ascii?Q?C9pFD4bMEOy/FFeS258jg8NYhUeuoOj0KN07T+2RA1a6UELYXKy9qxLy66gG?=
 =?us-ascii?Q?+cKz9IplVy4oOSB0vBQkRWjTVXFSNhc7KeYnEkXtKYcRWcRwpnspQUPZQ0Z3?=
 =?us-ascii?Q?TMb6YAaDE15WL8AIYHHfRjhTNiB1Ug4cvfAFkfRrymNuF7obXH3E3RP6yaTu?=
 =?us-ascii?Q?NZ3HMbhF7iq49pfNwZ7ehN+kHfPHBIuzYfkmoWrKUFwzClVOmDttRCoRKyKy?=
 =?us-ascii?Q?K0Nwv3PwO8OaI70yhXeaA0Ho7wUfgw1dM4FKbkaKuD3QWnCjvwjpxUv2z/fZ?=
 =?us-ascii?Q?IfRvdFz3UJwFNM3Dybv5e8VktOYTaGcW3Z/y225a2a8HL/Hua7b3zSdjHHuB?=
 =?us-ascii?Q?LxdNsMSD5zn9wnH7VQyNuqKOtdSb7sBvv1/+ZYKAPHvTw23UXepUKViwSzID?=
 =?us-ascii?Q?we4qNSaLmjqYZMhpL2dUWMZ2ZfjzhGBjw3xWPIOrRUR8H4nUyIPcQ8HgjRW3?=
 =?us-ascii?Q?Sj3KFxCMLvIpqLdWzS3aMvPu2rVF7kZ74mV7POtvUC3n8dEvRs0PsJkBfILt?=
 =?us-ascii?Q?XiRp2eZVFBB9RBnt0cOZKM/+d40iEf4S5I9wqVjh7lrek5/A7eNTosullGDM?=
 =?us-ascii?Q?njDXm/0OYufRP4SvFz3Lv8Kx/cyenXhen0rmaRD7CjddchSs/LFTCQC/jFNr?=
 =?us-ascii?Q?HdkbJPjaPA+zeYj3xV534xBt99vKcfrGuJwVjnjSn8GQ803FAkZ/xcJ8fGwG?=
 =?us-ascii?Q?dn0zAdHSKe/RyWJNx776yrb4jtYvpirjP3Onn47Cnd/AWEAnrfryaOrycxda?=
 =?us-ascii?Q?lVOGrkd5Mn3oJJXzQGnXrvdHeXNYqAhr+6v0VPC4iXUOZdron6XBc9GDhwR7?=
 =?us-ascii?Q?KSYVKcq+PGsfg3fvLTKuFVJ12weVI0WHlGhSs04XHYdo659XnOGpEcXj51QE?=
 =?us-ascii?Q?qq1LsPDXQ2djHl2qabgIZzrZsbeaC3ang/IGPCCr6lJX/pavKgR1ssEfgnwP?=
 =?us-ascii?Q?nYn45LaL1KaWGrWQmgO2ZPWvAwFtdO7UfAm4VG5SnruAHwxfFlK2bkQQPLk0?=
 =?us-ascii?Q?IG8OKmrQn8igy8AxZyKWJSsP9E4KPqF3qVZcgKkd6iLYVtz1XPX5nCUzGrGc?=
 =?us-ascii?Q?UgvNdi/VwIeV3QTerw7GNoBbudOAV0iUAdjPpzxrXx4wa3gX8cigSC6KqJFr?=
 =?us-ascii?Q?Yz8Ihl98uEHymlNocbmW/oxj8GN/B6lRhlIGAyCPRlxrV+MKUaDxHGiTIBHn?=
 =?us-ascii?Q?66Cb4mZ/Lj1NT3TGhpieBJJvtrO2p8AFQtnCkdNSiIjl5AA99oyZV/xC26hd?=
 =?us-ascii?Q?EkX3f2j+jWlAMfjkj8TNkMj53fqLcDIB?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2024 10:07:35.9036 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fed503f-944f-44f6-cdc9-08dcd3dbe446
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8994
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

Because they are negative tests, some errors are expected.
Print the expected errors for each test.

Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 68575d496..bd0deb271 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -1090,6 +1090,7 @@ igt_main
 	unsigned int ring_id_bad;
 	unsigned int ring_id_job_good;
 	unsigned int ring_id_job_bad;
+	int expect_error;
 
 	enum amd_ip_block_type ip_tests[2] = {AMD_IP_COMPUTE/*keep first*/, AMD_IP_GFX};
 	enum amd_ip_block_type ip_background = AMD_IP_COMPUTE;
@@ -1146,7 +1147,6 @@ igt_main
 
 		r = is_run_device_parameter_found(argc, argv);
 		snprintf(shm_name,sizeof(shm_name),"/queue_reset_shm_%d",r);
-
 		fd = drm_open_driver(DRIVER_AMDGPU);
 
 		err = amdgpu_device_initialize(fd, &major, &minor, &device);
@@ -1186,6 +1186,17 @@ igt_main
 			process, sh_mem, const_num_of_tests, info[0].hw_ip_version_major,
 			&monitor_child, &test_child);
 	}
+	//print expect error table for each test
+	if(!argc)  {// --list-subtests arg is 0
+		for (int i = 0; i < ARRAY_SIZE(ip_tests); i++)
+			for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
+				expect_error = ip_tests[i] == AMD_IP_COMPUTE ?
+						it->result.compute_reset_result : it->result.gfx_reset_result;
+				printf("test ip: %s,  test: %s,  expected error:%d \n",
+					ip_tests[i] == AMD_IP_COMPUTE ? "COMPUTE":"GFX", it->name, expect_error);
+			}
+	}
+
 	for (int i = 0; i < ARRAY_SIZE(ip_tests); i++) {
 		reset_rings_numbers(&ring_id_good, &ring_id_bad, &ring_id_job_good, &ring_id_job_bad);
 		for (struct dynamic_test *it = &arr_err[0]; it->name; it++) {
-- 
2.25.1

