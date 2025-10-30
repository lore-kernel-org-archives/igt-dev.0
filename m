Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3514CCF9EA
	for <igt-dev@archiver.kernel.org>; Thu, 30 Oct 2025 04:32:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E4E10E8B0;
	Thu, 30 Oct 2025 04:32:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="b0lLc56F";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D527310E8B0
 for <igt-dev@lists.freedesktop.org>; Thu, 30 Oct 2025 04:32:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yb/Izm6jvuxhTz58DckqSFY6tZMcrcsIPHAbUfLKTebxXMNxNgyl9qdO6wAKxcaiCSI+2Y9MtvhnzUJoQa2UQHeI7lgC36IgpBS+VeTrlGktYf8z42K9GCEDXcQhEDdt4/mGdwUyGfA11iXigQ9DyoRtKZPuid+t+9mdwLwYktPmAb0j/nkBsMr168Mex1CGDaSAqhtWSb6tM9+n1xn4Y6u68vn9SzJfAfas3+yQ+WpNFQF4RT+klfR3RYt/M/RD1cz7KsdHNV2+IqPg5flU1ZcnOcDbhLHwPByrL/dCEVeLWTRHx4Llz9els8MyHQdcfxBLTLLxxCXvF+wFMadLZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p6467YJPayYUvfeE9D4KlVv/1vyyIEdypI5/CTOgWJ4=;
 b=gZyNwSBp5Lo3Z99OuhnfL4bZ5BZTUvplxvs1R05RHV8XOMpeINP0yoXBwDNCj7InOGIVxf7G/mhYhICFlMQKMVeYwAZOfeLIQoUB2VlaGghDuvgsPyy4fYgvCMqpcd4H8MRdzxxdExr4PS6+gPLj4og4EZ2+GiBKkdB6h+KoWTumdxhezcOALytt1PjaayKwoQyqhXbuW31yWTKdsO++wvgQJEV+G8VwMKRBca3eLGimdGQYfiYsYiOAdpgFqGpsZ3BbGjY1c05DXXkHZNjpdpI6s3zKSzny15VUf/46kNRX0b0tT0e3cE21t2h68zpmdihQ+KYzZxw0YczZnv9JAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p6467YJPayYUvfeE9D4KlVv/1vyyIEdypI5/CTOgWJ4=;
 b=b0lLc56FxJI4jft1ipfTvrCxsrrfGZrhu/3DIMewiXv1sjoQY6lpAF0UJ0jAmAKSnDAK3+Kv8eYrnhMxAv58eZqVs1q6L2WMMqoV9IHT8u2EMb2eJGJ2mhkZf9FJD4kSMEbfmFS+MKBDOL4qfjAeAJEW0kEVq6TH8X49Sr3YW7c=
Received: from SA0PR11CA0131.namprd11.prod.outlook.com (2603:10b6:806:131::16)
 by BN3PR12MB9594.namprd12.prod.outlook.com (2603:10b6:408:2cb::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.12; Thu, 30 Oct
 2025 04:32:04 +0000
Received: from SA2PEPF000015CB.namprd03.prod.outlook.com
 (2603:10b6:806:131:cafe::2a) by SA0PR11CA0131.outlook.office365.com
 (2603:10b6:806:131::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9275.13 via Frontend Transport; Thu,
 30 Oct 2025 04:32:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015CB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9275.10 via Frontend Transport; Thu, 30 Oct 2025 04:32:03 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 29 Oct
 2025 21:32:02 -0700
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V11 16/32] tests/kms_colorop: Add 10bpc test
Date: Wed, 29 Oct 2025 22:27:45 -0600
Message-ID: <20251030042801.2315866-17-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015CB:EE_|BN3PR12MB9594:EE_
X-MS-Office365-Filtering-Correlation-Id: e04d5af3-dae5-464f-2236-08de176d46be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lABznYIQXU80t0Am7bV1YYRiWXyv33XMwNbpoeoSvtTFWu1bmcOhvj1zRz9h?=
 =?us-ascii?Q?4qA+zs69c1sCjQNZPKhri0vwKzxF5aixPGMVlWRzz7r2xpind9JSkHd9Z5dq?=
 =?us-ascii?Q?W6vo0KY1P13+AvmAcwBjTIJo95nqezTVsvl30tJPKGkaSUEfqNwpLATAn6lt?=
 =?us-ascii?Q?vwGAR9YSZYhYx3/u+g/8E+1T24dKD//VKxVF85U8dDKBn4cgrcTa1B8KY/Gq?=
 =?us-ascii?Q?6RR/QI3Ng8iLxDhXiQq/7uNBFviTo90yNn4j4RdiGIXeIUj9loi1jYLwofx4?=
 =?us-ascii?Q?wS7nPrH1/GqLLA/w+OFXhHqu6xTepA8Awyns+WHNt042Likf76iHeCAO2vyB?=
 =?us-ascii?Q?xfOVsWYZlLSF6Ndk2vuMoluSkwWmeF2Thcxu7lC1J5Bka9mblaXduaqkrG26?=
 =?us-ascii?Q?R0FOwXA7vRLlpTQVvoZxVQYy2OUAYtHn8KnEQLZFyieAO9+FKpmwKOoLAV25?=
 =?us-ascii?Q?fAa86NZUOjVKDSOwoWXr4tVFzdoYMXW0gagC7qPkPCV5iYyx7TUYHGPfMnK0?=
 =?us-ascii?Q?o7BYFJ7GeCt23cPY62SAOIvur/Bo+vph4/EY9S6M/AW2uMoB51UlIMxmOuvL?=
 =?us-ascii?Q?oAiuxqp2NJGMjWejIsRqUz4iD/Sp6TuvB1UyARB5+y7HlfULPAbnHD6WpLko?=
 =?us-ascii?Q?E1pDJ6DZJ65zfkfQfsuOP6rdiwXw1uPntM6CSO9/jFWouGxhgvcoklIO73tm?=
 =?us-ascii?Q?zB4tMdRhSyXgXzzNinoFiDZZIQulFHINSMc8caEIQ5DYg74+O1Hft+HOwHEB?=
 =?us-ascii?Q?4YjxSHX3fQwh4KS7oErm9rSUJE9NZPOjZ7zDJtYKfSt1JrtGyHqvZLS1rSU6?=
 =?us-ascii?Q?jobwvGFrrWuyLF2qYdqWw2W//Z3uXdVP3RHJJaHUTAxw63402lMb34xblS2l?=
 =?us-ascii?Q?QGwIqx48VIMUFxG/Z1tmidPpfsuaO86e3Fb1eTjcj/hLBS4HqqXukK0FTAVi?=
 =?us-ascii?Q?FU8IKqehGY4CHYuIoiPRJP5FbWw1BSLYi1VZ5sQ+h2JmPBcxDJ6ndSnPjGoX?=
 =?us-ascii?Q?XxsPlFib+cRYQG7DyV5OpnXBioqEOIfT2THir15EAls8cQWpYhtPAbZf5cwf?=
 =?us-ascii?Q?PIybCV8NvWhrLNS8dCnSvPxl9G5S3XcQ2WZZCPUkLu77+7EWi4cc2PsCYlun?=
 =?us-ascii?Q?3ZS/5x4nidq9UsBoHZoNVgWTbSr7OaTG42Q7LbFCHhzytwXkd3eHrFEv6sZ/?=
 =?us-ascii?Q?nWN3EA9U5cKWQfIjdUT5jI2u/tG+EgnMs5N92ZswDO1qjxsTLkCg183vNPCm?=
 =?us-ascii?Q?ilkP8J7s0/Nq4HNLgarsuTikU7D2sqejWbFUgXe/eyAUKBq3RpxqE1KCdq6u?=
 =?us-ascii?Q?BI0+CGzLXOBjTzbOe9MSDEKeB1nssq22MO3ggshGl9c/2dYe5B4KF9E7LB1G?=
 =?us-ascii?Q?L+5WxbeOK4zkiL7gbl7y/T5uA6u+gLi6wzTEDa/HGJ+BNXJNPj/20ImSkvqp?=
 =?us-ascii?Q?S+GVdOz3+8pZuQk3+1Y3zoZXjmiEx9Y845DbnQs00E+GCtdvXmMMsLSKzE4i?=
 =?us-ascii?Q?tdAVuhXCQBf1/aqQVtOPm3JP5/pwS3Rgj3Nps++t/SyoMGMajO54PC58Bl9F?=
 =?us-ascii?Q?g0LJ4m164hYRkxjoPxg=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 04:32:03.8278 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e04d5af3-dae5-464f-2236-08de176d46be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015CB.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR12MB9594
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

Support DRM_FORMAT_XRGB2101010 color format, and skip if it is not
supported.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 8e677c1d1..8e8f7c63f 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -23,6 +23,7 @@
  * arg[1]:
  *
  * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:			XRGB2101010 framebuffer and writeback buffer
  *
  * arg[2]:
  *
@@ -55,6 +56,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
+		      "plane doesn't support fourcc format %x\n", fourcc_in);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
@@ -63,7 +68,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(plane, &input_fb);
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -469,6 +473,7 @@ igt_main_args("d", long_options, help_str, opt_handler, NULL)
 		const char *name;
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
 	};
 
 	igt_display_t display;
-- 
2.43.0

