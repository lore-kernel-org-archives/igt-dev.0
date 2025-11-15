Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A029CE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:20:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49EA510EBE2;
	Sat, 15 Nov 2025 00:20:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="feoGiw3W";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011049.outbound.protection.outlook.com [40.107.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E036410EBE2
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:20:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRF3FqOnnv9FDGRfxP6R7hhgIgF42iLnYmVovhvCxYUafWTH/CI8yYy3s6NnSVeO1NROBTE/a1004NuF7RHxt4V1ioaw9GRzeoZzFY1y+L9CheKaUVwocqX6fTzLlcJItQV4zbORInmUHE5cfTZs2zFufZeNbb6DJaCEySpAL551I2eCeSXQXVf/uBCHpuWRIk5qYmDPz0l2aVn1gYo5NABwjqBnNA2dYRwYxjGV6NXWICZfQQVia/jbTtbgYQ7tOZk3OsWNLehi/PHgONSOme+1BUQ3zvo2MTWGlq0RpldOnNF0u1b1IRv5FVpuf9WVS58gMxb7aXVdlEPpYTo7EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1/vag/mT3EzB3USDaN7Hx1lJFlTiIAdnOZRpQKv5XoM=;
 b=bWPQhCz0r31UfvW7vXgTw73kStNOg5TdvIdChpcbm91j+rZAgMuYUTQV2m+GDmTDS4Tu3DMMtQLK9/1etSBW6BGgHIeBHo020vNnixVaWbws9jiDxxpKLSJnSW0V2wtQJvYhhDEWg9lXf/4HbM4tVhIU3s1L4ZO6qnXz/lk9bPRcw8JorB1hu8DfEJJqW0+ApqQDR5fB8hkDDs8NaxwWhWs4TdC33alMZxNzXhEinKv6/a+bFIGWaKVbacc/p79BNdVYG7Ody1z4+/J/LkPB8YOxsV/1XYVBC+nHGQaPm6x6XPSCXO9z++BbDhaVOTdokLaHVrLIcVkqpZ8QEpOVEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1/vag/mT3EzB3USDaN7Hx1lJFlTiIAdnOZRpQKv5XoM=;
 b=feoGiw3WhEtCkPPsNF07lisWmLBTUuGB6TdbyuSlt4Q9BOur58gcSvocEJK0j9SODnCDjlbBS1jXkU9BfedQMY02/C8cJnmYZ43UDNrgFAU7XKHN9/vDZYUatj91QAMbTDRCIA7sLTMxeyWExnmnKediK6hd4jRHN+APRFwB8vo=
Received: from BLAP220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::34)
 by SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Sat, 15 Nov
 2025 00:20:06 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::f4) by BLAP220CA0029.outlook.office365.com
 (2603:10b6:208:32c::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Sat,
 15 Nov 2025 00:20:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:20:06 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:20:04 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 06/32] tests/kms_properties: Add colorop properties test
Date: Fri, 14 Nov 2025 17:18:15 -0700
Message-ID: <20251115001841.3563993-7-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251115001841.3563993-1-alex.hung@amd.com>
References: <20251115001841.3563993-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SA3PR12MB8802:EE_
X-MS-Office365-Filtering-Correlation-Id: 6224044f-75ee-4b35-3721-08de23dcbae3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bD738qfApW8nAP+FwxSBVSJoA0g2p+Dg8mwnmhkoPxZorWit/uWIoaFEMlV4?=
 =?us-ascii?Q?iVazwih3+MpSUDOOb2EdXdp3InQ15Tq75Qv4GVe6yvJ7oVgtSSkBZ0J3E7SU?=
 =?us-ascii?Q?/xep7mP/fEnYeR0hZHj95YzSKlGALn0NvwmSz8K7KyDuxv9amx1Du4jLZKO9?=
 =?us-ascii?Q?MxQ+yioqcJ+LWKJ7wb9cbytjyF7cX4F1GrctGszinbNLsDYIjl/1IIQ+K1lc?=
 =?us-ascii?Q?KERXSKMzfjbmqZQ0WC5LCfwuOlsPMXe+JF0zpIPWrxia6dpY+qX96AHiiyep?=
 =?us-ascii?Q?U6/nLc710QTN/tdEzIogcZiTkPCCZzNtCMjxN7uwD7ecKwFDtHOf/RTHWZ8P?=
 =?us-ascii?Q?aBPn2hmXa5oIN3KKLpdiJNMM3ftrFu7ftGv5x4d2c6sZ2juVpQlVZOMH0AdK?=
 =?us-ascii?Q?O4eYSoHs3WA05lr8AUgt5zEvihcK42BzkkfNsgyc/uDy5CuKR4YFaIuRTU0u?=
 =?us-ascii?Q?4lPr/miUG8eFgR9MBK4+WHmPMvnLAqJ4LHc1G9tc0jJJN2mxtbriUS9gvsL8?=
 =?us-ascii?Q?hA+R7PwbfUSHzsAhrJ5fW/LW8e8MrDufSURR03qdBd/+AfSSswPZKQNUjVI1?=
 =?us-ascii?Q?140FPfr1PPs3eqmUH7f0xlFGJhuPiDjXBnh903n9zBZuoBlnzcne5gj+TWJJ?=
 =?us-ascii?Q?55jyxLdg4Mh9JlHRAEf+wAxMH8aDApuE8F+CUwvZbuvwcSf4e9ZbVIJ0IsJ+?=
 =?us-ascii?Q?EREyjacmp0fyFRyvZUT4e0J8cqNQjo+o7vln1i3LRkdsARVJyhcpIG/osGzy?=
 =?us-ascii?Q?L8CdZDHWKq9j7OY7PMeMG+AuvhnadFAGVM7u+EOy8555/f+OOjyPdfX5WG62?=
 =?us-ascii?Q?Hs1tHHx/uJz/qDp21/N4ghAr0dd0wX5xij0LUjD57U714Sgv2zE2p8Rg8GCX?=
 =?us-ascii?Q?WaoPkjcArRMSxx9qriKvPRHBzT9nRkjcT5lfoJsy4Kb5WQzou7TlwGgdNlN7?=
 =?us-ascii?Q?QCnr1G/Rfq+kyPUptKFTNW92fpW3bN8sVllHMtFETPrEzUZBeVpKcp9DhPED?=
 =?us-ascii?Q?7kw09Nrvk3NAnFPK8j/Yx+OpoY5G/F+A9mGfLPAlnHQsGZnDn6EKWKpdT3iF?=
 =?us-ascii?Q?Mv7Bp4+7Zb3ouobw2wVG/h3FDmsWP0JlMvgA5hkh05S7fW6bkMp3LGubjSJK?=
 =?us-ascii?Q?2UWRyYx38WOrEgHuFiCtqP0eQ8DhYW+qZUgg+Fa1og6M8VNW3Oj7ObvbJX6u?=
 =?us-ascii?Q?6TdbPLwm5a1iFhUB+PjDd9xtp4I6PbBK6qnGWKAj+B48Jy7EW6MHAPbjTV74?=
 =?us-ascii?Q?Wqq0IHWTMehozgXYYUS5vnFa6zyiG5DQUFBa19RrSNWQ6VSR/+8TnJCfY8na?=
 =?us-ascii?Q?emghTEsgCF99/9MQCT5O4C5nAoWX3P92p4W2vOuar0gPeVqmJhH/Y7lBZjVy?=
 =?us-ascii?Q?49Tqz6ux+NeQnjWLzJmTvMGLi7Faw3QGSWQQOnIXNysRrq6xMYp1meINgUAR?=
 =?us-ascii?Q?rKCMinm/6Cug18LaG3dMnyr5CPn7oegTfa2SlSO0adPf6ABUtFYQGS/qmV++?=
 =?us-ascii?Q?EV3IdlAw1lwsKsIfoDT+1lyDjhpil+VK0rnltscT3URRP/qbRE9mYQmo6CA4?=
 =?us-ascii?Q?8rL3RqAmGh4zP6dGLDU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:20:06.7974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6224044f-75ee-4b35-3721-08de23dcbae3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8802
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

From: Harry Wentland <harry.wentland@amd.com>

We've introduced the concept of a new DRM core object, the
drm_colorop, to represent a color operation as part of a
color pipeline.

Add new tests to kms_properties to test the properties of
a drm_colorop object.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
 tests/kms_properties.c | 71 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/tests/kms_properties.c b/tests/kms_properties.c
index 3bdf23aad..21e09504a 100644
--- a/tests/kms_properties.c
+++ b/tests/kms_properties.c
@@ -47,6 +47,7 @@
  * @crtc:            CRTC
  * @plane:           Plane
  * @invalid:         Invalid (connector/crtc/plane)
+ * @colorop:         Colorop
  *
  * arg[2]:
  *
@@ -230,6 +231,41 @@ static void test_properties(int fd, uint32_t type, uint32_t id, bool atomic, boo
 	}
 }
 
+static void run_colorop_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
+{
+	struct igt_fb fb;
+	igt_plane_t *plane;
+	igt_colorop_t *colorop;
+	int i;
+	int colorop_id = 0;
+
+	prepare_pipe(display, pipe, output, &fb);
+
+	for_each_plane_on_pipe(display, pipe, plane) {
+		igt_info("Testing colorop properties on plane %s.#%d-%s (output: %s)\n",
+			 kmstest_pipe_name(pipe), plane->index, kmstest_plane_type_name(plane->type), output->name);
+
+		/* iterate over all color pipelines on plane */
+		for (i = 0; i < plane->num_color_pipelines; ++i) {
+			/* iterate over all colorops in pipeline*/
+			colorop = plane->color_pipelines[i];
+			while (colorop) {
+				igt_info("Testing colorop properties on %s.#%d.#%d-%s (output: %s)\n",
+					  kmstest_pipe_name(pipe), plane->index, colorop->id,
+					  kmstest_plane_type_name(plane->type), output->name);
+				test_properties(display->drm_fd, DRM_MODE_OBJECT_COLOROP, colorop->id,
+						atomic, display->has_plane_color_pipeline);
+
+				colorop_id = igt_colorop_get_prop(display, colorop,
+								IGT_COLOROP_NEXT);
+				colorop = igt_find_colorop(display, colorop_id);
+			}
+		}
+	}
+
+	cleanup_pipe(display, pipe, output, &fb);
+}
+
 static void run_plane_property_tests(igt_display_t *display, enum pipe pipe, igt_output_t *output, bool atomic)
 {
 	struct igt_fb fb;
@@ -275,6 +311,37 @@ static void run_connector_property_tests(igt_display_t *display, enum pipe pipe,
 		cleanup_pipe(display, pipe, output, &fb);
 }
 
+static void colorop_properties(igt_display_t *display, bool atomic)
+{
+	bool found_any = false, found;
+	igt_output_t *output;
+	enum pipe pipe;
+
+	/* colorops are only available with atomic */
+	igt_skip_on(!display->is_atomic);
+
+	for_each_pipe(display, pipe) {
+		found = false;
+
+		for_each_valid_output_on_pipe(display, pipe, output) {
+			igt_display_reset(display);
+
+			igt_output_set_pipe(output, pipe);
+			if (!intel_pipe_output_combo_valid(display))
+				continue;
+
+			found_any = found = true;
+
+			igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe),
+				igt_output_name(output)) {
+				run_colorop_property_tests(display, pipe, output, atomic);
+			}
+		}
+	}
+
+	igt_skip_on(!found_any);
+}
+
 static void plane_properties(igt_display_t *display, bool atomic)
 {
 	igt_output_t *output;
@@ -853,6 +920,10 @@ igt_main
 		  "Tests connector properties with legacy commit" },
 		{ "connector-properties-atomic", connector_properties, true,
 		  "Tests connector properties with atomic commit" },
+		{ "colorop-properties-legacy", colorop_properties, false,
+		  "Tests colorop properties with legacy commit" },
+		{ "colorop-properties-atomic", colorop_properties, true,
+		  "Tests colorop properties with atomic commit" },
 	};
 
 	igt_fixture {
-- 
2.43.0

