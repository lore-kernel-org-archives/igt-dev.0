Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F69606A320
	for <igt-dev@archiver.kernel.org>; Thu, 19 Nov 2026 06:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=JHJCC/Oc
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 983EF10EB84;
	Thu, 19 Nov 2026 06:26:17 +0000 (UTC)
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012009.outbound.protection.outlook.com [52.101.43.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C492810EC68
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Nov 2026 06:19:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zAX9e+fspXLR/mtPTE6uYhp+RQY9luWKCXLa8ZN0yOVIDj742ZY+W3+Z93N1Muf8uBmaTD6BatJZbTQ7BG1eeCXrCSxs467JZ/aNckOXolrS7ghFiLW/rDI8D1rvXLD5QzKsV1f7GlSzXER0qmE1ZTTRht52pMEJqqX99gZ9WEdrO/EEpOIT+fpmTJ6fSudC83eN6f2iR5pJqPUcJzzt0978y1S2A6K5G/j8YyqHhTFkkH9LvJUm95nrQWy6vvxDY2+VXixhTpdI4VlBvxSYvLImUAcRUk4q157+KJOgeR5BWQi52j6jalR3c0Gr08poZkQQk1i3IuAwQfHmQNI+Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/+OfOJrPRaLCDyc63LpD/EFK5nlf7uem8LpsdH6+n4=;
 b=w81Yz+FCZcb8wQjMccGCJSnkTQqBwXbC4mRf4rsvHqte1gFTzL+YRxkMwa7qQ/4s3Gs1gb7VqpW3GrFOKDHtXEtKIog9wfmWQir9sHTQc6DhdPGiheKgQVYmkOvafTWbWtQaNlZ1scu/K3jsRYh0mekvG2wuRDi9EfGFN4URLzT3RzT1dlxwsEHmCNqOVH1iIfpit2ac/tsR/W0lvwPIqj8H3UYpVtsUfDnC4OCTM11oyS50to0b1wXETM6mXj3GDvaNcmkPhPP9KjqcMoGeO8/6jmybaA/kBx53xFWAEVh6HVS+/q9aEKrw1i0SsShqBYrXZ/HntQrQr3sIybioxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a/+OfOJrPRaLCDyc63LpD/EFK5nlf7uem8LpsdH6+n4=;
 b=JHJCC/OcTXU7I0vDHNKgWUPoj+O4tWFKIaZ5Pe6upWMhekQCZjLQiuMhqC/aFRvu3obWoyw9u5YR6EceYFL9DyHMGMPmOyYxGh9eCrDD41cshP4T8Y5ijErXrMzF3xcigERpD1kbLQ6aEcwJDFDtsWmw/9ZQbbx6NKkhWqy5Fic=
Received: from PH8P220CA0036.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::16)
 by SJ0PR12MB7473.namprd12.prod.outlook.com (2603:10b6:a03:48d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 06:19:07 +0000
Received: from CY4PEPF000392DA.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::1d) by PH8P220CA0036.outlook.office365.com
 (2603:10b6:510:348::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Thu,
 19 Nov 2026 06:19:07 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF000392DA.mail.protection.outlook.com (10.167.247.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Thu, 19 Nov 2026 06:19:06 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:19:06 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Thu, 19 Nov
 2026 00:19:05 -0600
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.57 via Frontend
 Transport; Thu, 19 Nov 2026 00:19:03 -0600
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
 <Pierre-eric.Pelloux-prayer@amd.com>, Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t v3 05/11] tests/amdgpu: add SLTH tests on compute user
 queues
Date: Thu, 19 Nov 2026 14:18:26 +0800
Message-ID: <20261119061847.3442210-5-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
References: <20261119061847.3442210-1-Jesse.Zhang@amd.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF000392DA:EE_|SJ0PR12MB7473:EE_
X-MS-Office365-Filtering-Correlation-Id: ba1148cd-0fcd-4fcd-7a6b-08df46050416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|18002099003|22082099003|3023799007|261009223027099003|56012099006|11063799006|261026140227099003|261102123227099003|261028144727099003|261021121427099003|261022075727099003|261022105027099003|10067099003;
X-Microsoft-Antispam-Message-Info: UlEIAI6MJFZ1DLN0C+cMwrAfSGLGk/++fxP4zm5Q0bwW8wrOnvFcqEqIXLP3oAcBTvDlzzs6hGmw1UalXEP7cTpp8MC2+8FGZccG5iEEkL98tGs7QD7EQkw70ZdVE0Eibui6CXuE82BprNMkSCM1LtWv4A2ySKqwuUEYF2ymuQQpUgok8F8hzhjyCYau+Z6+6gowyUr1kIdUAvM9DpQNJtbUHXGvzPE9Fbz2fGgVpvqRg6+2UPDO6wlqQXMHHMXBfI6VggoTu3yW7S+4YsSGlOaQSuZ0dzctJ9/+A/3EoQA8CQV1FB9yFPVUTvDaDh1v5fkCU53LW/p+ZCE+VbB3L3L/zoOEsl0V5vzu2SkypFpL89LIlAsKR9le/0ckFbIRg9oX2EvKs+nlfzE2yYMzOQhEHwfIglRXZPyrLDCSyNeOHPCROh1CVuLOvlEN2CMagJ/Z4fuslq98nIUWSYXjMOmPyD9djuYK1k5EUHkD/Aaa9ufwLKEgYAXr8jYRxk6SvNlV47G+dKsLvBzg/JWtBBUMX9dvMLfXB4W3lExQgzJFWHfxyOmvieRE6/AQL1MEVPZt9aZM2oLmDZ+qQUJA/T7DkBiztLZ+p7tIMTOrO/Kw30PbbjOC5q9mt7RVLg+6haOeE2Y5HFY+iUUX7rGik1Gp1lqPVy0DI6Mo5BMyplpmWMp+WUc6YSVwp54R0vGDezimPusPqZ48oAftL+GQ6Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(18002099003)(22082099003)(3023799007)(261009223027099003)(56012099006)(11063799006)(261026140227099003)(261102123227099003)(261028144727099003)(261021121427099003)(261022075727099003)(261022105027099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: w+JTVOG35m2RnBvq+oiCWn3We4fN6q52JX7QxgzHpmHdjjj9oRYSDkTcdurmXcS4FZCNmznZznF4qfCQqSLwoIwF4ijo3D21MUFFu4Ee7bnGcqgqvGj1V+7G9T7Pii2tP5DVRCVInEZFo9Jq38jM+eT4w91w1y08ZnP03JkIJhptPdVCRzsp7H/Zg4tHQqwGCld3abn0bl7m9/7s0dzI5+AJeZqz6CfPAXPlfVfCmcaHwQXHHYATFcy8ASYPsWEGSo3LtaPChrzrGoHpxnDeFHxv9c0eWMmVemRm1n4wV4skoQAs3aTPjmqVK1jXtxMI66ExsSwtwjWYfGa2qILHsKCPtBxVyliXNgn6UucSwzW5vArIqRM8ZFipM0ZmBiW5gV+WpclPyVwV8meKyNngm4ZzhR8c+ymi1bI04B9JmxHwQXtqJJgE6Rq45XvnJka9
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 06:19:06.6342 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba1148cd-0fcd-4fcd-7a6b-08df46050416
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF000392DA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7473
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SLTH tests run the VGPR proof on GFX kernel and user queues and on
compute kernel queues, and the return proof only on compute kernel
queues. The handler is set per GPUVM, but user queues get the trap setup
from the MQD while kernel queues get it from the per-VMID registers, so
the compute user queue path needs its own coverage.

Add slth-comp-umq-vgpr-proof and slth-comp-umq-returnproof, and
slth-gfx-umq-returnproof for the missing GFX user queue return proof.
They are skipped without user queue support for the IP.

Reviewed-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_basic.c | 54 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/tests/amdgpu/amd_basic.c b/tests/amdgpu/amd_basic.c
index 2037c71ad..364ba774b 100644
--- a/tests/amdgpu/amd_basic.c
+++ b/tests/amdgpu/amd_basic.c
@@ -2276,6 +2276,42 @@ slth_comp_kq_returnproof_test(amdgpu_device_handle device,
 	igt_info("COMP KQ RETURNPROOF COMPLETE\n");
 }
 
+static void
+slth_gfx_umq_returnproof_test(amdgpu_device_handle device, int fd)
+{
+	uint32_t value;
+
+	value = slth_umq_run(device, fd, AMD_IP_GFX,
+			     slth_prepare_returnproof_shader);
+
+	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
+	igt_assert_eq(value, 2);
+}
+
+static void
+slth_comp_umq_vgpr_proof_test(amdgpu_device_handle device, int fd)
+{
+	uint32_t value;
+
+	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
+			     slth_prepare_vgpr_proof_shader);
+
+	/* The trap handler sets v2 to 42 before the shader stores it. */
+	igt_assert_eq(value, 42);
+}
+
+static void
+slth_comp_umq_returnproof_test(amdgpu_device_handle device, int fd)
+{
+	uint32_t value;
+
+	value = slth_umq_run(device, fd, AMD_IP_COMPUTE,
+			     slth_prepare_returnproof_shader);
+
+	/* The instruction after s_trap sets v2 to 2 after the trap returns. */
+	igt_assert_eq(value, 2);
+}
+
 int igt_main()
 {
 	amdgpu_device_handle device;
@@ -2454,6 +2490,24 @@ int igt_main()
 	igt_subtest("slth-comp-kq-returnproof")
 		slth_comp_kq_returnproof_test(device, fd);
 
+	igt_describe("Check-SLTH-trap-return-resumes-after-s_trap-on-GFX-user-queue");
+	igt_subtest("slth-gfx-umq-returnproof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_GFX]);
+		slth_gfx_umq_returnproof_test(device, fd);
+	}
+
+	igt_describe("Check-SLTH-trap-handler-updates-VGPR-on-compute-user-queue");
+	igt_subtest("slth-comp-umq-vgpr-proof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_COMPUTE]);
+		slth_comp_umq_vgpr_proof_test(device, fd);
+	}
+
+	igt_describe("Check-SLTH-trap-return-resumes-after-s_trap-on-compute-user-queue");
+	igt_subtest("slth-comp-umq-returnproof") {
+		igt_require(enable_test && userq_arr_cap[AMD_IP_COMPUTE]);
+		slth_comp_umq_returnproof_test(device, fd);
+	}
+
 	igt_fixture() {
 		amdgpu_device_deinitialize(device);
 		drm_close_driver(fd);
-- 
2.50.1

