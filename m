Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79AA8C3600B
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:43:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C88010E793;
	Wed, 26 Mar 2025 23:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KB8kFZeu";
	dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2053.outbound.protection.outlook.com [40.107.220.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DF0910E793
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:43:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xWp6BNIAqwfWYA0Rtt+mY88BG4XH0BXE78925/v9ERzWThRcBR0i/HVYN7DlFtMqTHx7+iJB9yqhug2JC7CXdDvDhO0lpqxksQLMb5F6d6cb3MLkt+1315pS2sNe5EIWQ+grkgxQdsNtrjQ+GgUHC/eaicPb3iMngS30h4CTK2Ffnbp3/00MxuzQOlkTwY/LVrZQXyQ8MPHw0O6c1kT02LMfW4u67KstR+iPCFYkpFd2u+qiSfy+h1lNM5tEL/m+CIPSJXwfbMOJOIaKyymNjVn9t0B7cplMgv5EMmT5o73WvOiefnNiQ7mzV07yRF46f1uZ06zqcZD7VojbG97sUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6ahGQ7T1q4Agymp7Kq6qS5YTWvM0wxa23PCKDyfKvsQ=;
 b=sh2f6JJOemMLX7TRKLOOii7PhCsq5dytfCnvlJXjjevwrDY1CV4t00ve/qSDggG4dez0mueg3BUHVo2dXUsIdiOc1pDlevC6/VSy10jJ7My9ZTt7vIUNmtoYRvgZC8aRyuyygFQ5R/8IP0Y0lVt5EUlzpNk9ZXr39uHX9KH6C5JvK2MzhtjSL+1VfuJmj6LG4MKDYBr5wNS2dPEATE1Z/29qmFlfjj8Vsr4j/tbJ8Kn8Cuu3CcfDrWRVqlKC2XawyObH9f1Mh19gBF8ueyX4WktCadPJ0SCSRTAui3+Kxze7NOJ0P1e5tzaMPNN/lxUjgE2bZUQjMhWsjcXfrU/i2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ahGQ7T1q4Agymp7Kq6qS5YTWvM0wxa23PCKDyfKvsQ=;
 b=KB8kFZeu5rVR/hD+r9vkDnWHFaT2iu5rPp50yPZyOW8jNuA9UlnsY/6DJiI1WtyFHSl2VKRWk33o6loCtrrJVEkXKo4xUIAZ8hL9bFu3yNxCrERNeSGQ+zJmM2WQ7n3NNHzP/44LTSYUqO4luH5xI9maAQhxhotnbHh268HoNC8=
Received: from LV3P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::8)
 by CY1PR12MB9673.namprd12.prod.outlook.com (2603:10b6:930:104::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Wed, 26 Mar
 2025 23:43:09 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::1f) by LV3P220CA0029.outlook.office365.com
 (2603:10b6:408:234::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:43:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:43:08 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:43:08 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 18/37] tests/kms_colorop: Add 10bpc test and skip if format
 not supported
Date: Wed, 26 Mar 2025 17:35:50 -0600
Message-ID: <20250326233609.2980110-19-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250326233609.2980110-1-alex.hung@amd.com>
References: <20250326233609.2980110-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|CY1PR12MB9673:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f1e7fe5-b31f-4174-056a-08dd6cbff69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?r6EgcvexaI7bY1nYCIGJhWzKKKPwvqNKMlgKM4WP4h+K7ftcSTWtaE+zD8SF?=
 =?us-ascii?Q?p8u8UlIEHcSat5Ty03hmyvU7v1CzhDdlmnopfTXXK57C+WKtAvPOEBMsphrz?=
 =?us-ascii?Q?ELjTM6eHHDaY2lLWX609cvrxZA20F/z4Aa1sTP0Tp1TPRK+2LSaLeVZ4Rekm?=
 =?us-ascii?Q?L0AquWf30JP9w19zAg0ZgwahIs16yrzGmehocW5ANwL9MJxTcGKJhRSvG1Lf?=
 =?us-ascii?Q?weg7Zdm7YonVmSdMr3lCJoOzjLUpbiQl3nr7dHfLVvG0hmkDmi8hduEEHqEm?=
 =?us-ascii?Q?XvnSpav0ZBo3ycuH671gUiw+GxTyuvb30eNlK8p+fHsXOs/PR/T21Q8EWzVn?=
 =?us-ascii?Q?KNTwjjwL3jMUWTawDEkauhXYA3Ws8cmVeSp5/PG0oiSQncbohFqayNt9fU2u?=
 =?us-ascii?Q?5YLjQRIR0tDi+5T85yFVyfLT+dDbq/kLRgLZm6UqvUctXoEjsOPLy3RO/9sD?=
 =?us-ascii?Q?dBaSxvDoTPKPSFkiFVkPaXL32YNv64I9SvCvZStqDU4zXZRHhsAsglQEBIw9?=
 =?us-ascii?Q?nGfQTWbCpvsm58PsXFr8BsuoVfq89DjcIaWswtCEt5/noar083x88mXAuzoC?=
 =?us-ascii?Q?2dDtxVVFMGspc0UwnK5cD3hQeCmz4IEgWVf0lFHmeXoHAhCF1R4X1HrWs1mJ?=
 =?us-ascii?Q?ujDbZH/p8PWZL33ln3naCHW/Y/msJWcB4FuEmos9ab3MjCKB1UuentbqxnMm?=
 =?us-ascii?Q?J2wESoSh+vaFRyw3HsLqZXkDWT1l9vcIqqwusnOEv+B0qXqOdQYDpk/IHvAP?=
 =?us-ascii?Q?Uutgw1Te5jzMMPBfmipiII70rkWDoBz5zPupdjE514hgy5uQMbyvNsQ9j/7n?=
 =?us-ascii?Q?6MHqhih9MJ5DCG6Ory3Tn8Mi+Bg+iCDrY8ibOFq8OSYvzz+UkkHXo1eHb8ff?=
 =?us-ascii?Q?JXeQ/U0GgyR6MqKBmYRnR9P3q9QaDIM/UOslJNUyziZU1d/XOc0z4pz3Ox2F?=
 =?us-ascii?Q?ukf0DcnKDhAzNwEhiJerymum22Ix5K7532LZdASRyWaxdWnV+ptDhN8iQoGX?=
 =?us-ascii?Q?IW3FI7Ryn2FrU+6k958kDaPPLBLvAk/53xZdEXZYd9/oi/6S5+5Fu3EVhQms?=
 =?us-ascii?Q?jXVKnxtva0iGResu17n22JDw10ek5nUiqjPJSEij59vHtK58G8ZiZDVk/nc2?=
 =?us-ascii?Q?IQRk+ij9jQwaN03QkA86J6QUKFnPqMzluyu3WQNZxCpQCgS5GnwS12eRIWpE?=
 =?us-ascii?Q?RGP4NDXvFCKSYgmipN3YECV1ngZI8dtHvGI6r/zz4BhOtXmpRpdddp1Vfiar?=
 =?us-ascii?Q?3jj4Qi4xBdUQ5v3MzqXyD5hFD1NDEf2bKePcVVyYbulcVpd2tx/wzFP0Xnqs?=
 =?us-ascii?Q?aIjYxlSPY9SaFsRTv75+sdo1K3r0YddGrunrSClXf7zmwthjSrcdauy8DMGZ?=
 =?us-ascii?Q?klFUGHeKROMeC10MHes0GDoNb5WP9lrRDa0/norh9bQJ1mLgMFRm3SsfxfJV?=
 =?us-ascii?Q?K2tKMS93A0l71RVWRv1LAU2knLzUE6w/hg8k/lRO1wpESj/q2A1NR0H/txk0?=
 =?us-ascii?Q?Nq+T93NXVG71mCQ=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:43:08.8179 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f1e7fe5-b31f-4174-056a-08dd6cbff69f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9673
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

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 tests/kms_colorop.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 3a12b84d2..56c232ef3 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -41,6 +41,7 @@
  * arg[1]:
  *
  * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:			XRGB8888 framebuffer and writeback buffer
  *
  * arg[2]:
  *
@@ -74,6 +75,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	width = override_mode.hdisplay;
 	height = override_mode.vdisplay;
 
+	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
+	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
+		      "plane doesn't support fourcc format %x\n", fourcc_in);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
@@ -82,7 +87,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
 
-	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
 	igt_plane_set_fb(plane, &input_fb);
 	igt_output_set_writeback_fb(output, &output_fb);
 
@@ -519,6 +523,7 @@ igt_main
 		const char *name;
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
 	};
 
 	igt_display_t display;
-- 
2.43.0

