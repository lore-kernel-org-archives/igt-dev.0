Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85803CA0EE0
	for <igt-dev@archiver.kernel.org>; Fri, 15 Aug 2025 04:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E1410E9CB;
	Fri, 15 Aug 2025 04:10:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WwRHdCld";
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D643E10E9CB
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Aug 2025 04:10:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=THVWQFRT8v52Nlre8VylxgYkbnubk6dvd4WPDY3Jg7smQQqlsMcVSfZAQ2ZK/Z1ebi4u/hfpKHskfKD+zqc2jlesLtn6IHJB614fslbFD4p0kYTVER92A68ogHYzsu2oiPDdI56bXq5GPcO08xHDlKt+oYBYWso8QirqurVwI3AKwzK+3fXVceK4/DWx5bK7ul+FUK/2SJvyuKymHwb0xXwtQZYnzOZ11l5Hfu5IJjH3ugyPKTfGJyzIzNrLdNGwpueKcOxo8lZYaiqnmcBCEG2uk3iUqogBeOlnv2wDfsAw1NcXFFGskp3cT8vqPdvbJEEN3jMrNoaItF8YKOyGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1g5bzaamTV0d+LXNLTDWQ01B49sEJEqD4PpsNtCRJs=;
 b=PP70FHOCkH6MgGi2afxJgntPTHJ81wngQft+Mho/ehWAFghkKYwdnVP8B5ay+vSTQhTWcrKAHkLUrlweMI/FXIJBNFdRyKwCH0EBaC68GjtFHkmqBWEqK04ljJrE5L2yH9fCZuLXN5pPQ8bEKcAqHbB2WB1Y4la3agYwe2GsaHxDH4QIdf8UfTSKq8T4d73JtJxqAn7vDkSrzh2h5V5XfhmetKZAkaSM1aRW+eeH4q1QabdMj+E2ZZD5/5qsC69NV0M91oSMa1V21K4XnUZSi5ahQBiJzqGlcCQtwDfouXcPWs0uir2NapTOuqf8GZq/2w2F0YIq97KNLEyfJkgtIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1g5bzaamTV0d+LXNLTDWQ01B49sEJEqD4PpsNtCRJs=;
 b=WwRHdCld2+n249hW1gRAcKXSBRcyzY6npQPbH8KIWm8CuSfEHptmZ4laVKaSz/Vsf9HYv1lxCFwSBY9gjAmlKvDRV3nbghJq1SQaeVBVCB6g4mbV9T/kGr7r7up5zxdohKKeZoHCxiwa3wkyEZxgaZexd2T7D2MJ/+u6vfNhYk8=
Received: from BY5PR13CA0020.namprd13.prod.outlook.com (2603:10b6:a03:180::33)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.16; Fri, 15 Aug
 2025 04:10:11 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:180:cafe::9) by BY5PR13CA0020.outlook.office365.com
 (2603:10b6:a03:180::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.6 via Frontend Transport; Fri,
 15 Aug 2025 04:10:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Fri, 15 Aug 2025 04:10:10 +0000
Received: from kylin.lan (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 14 Aug
 2025 23:10:02 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>
Subject: [PATCH V10 14/30] tests/kms_colorop: Add 10bpc test
Date: Thu, 14 Aug 2025 22:06:43 -0600
Message-ID: <20250815040659.3321102-15-alex.hung@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815040659.3321102-1-alex.hung@amd.com>
References: <20250815040659.3321102-1-alex.hung@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|IA1PR12MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6861cb-6075-4989-1107-08dddbb1a086
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ExiuzjyPwqf5UPKd//b7941x+3hTJjL8K3v8wul+nyhS540kpnkwrzcq7+gS?=
 =?us-ascii?Q?qIdwaLv9yb5Hr+28GE9tH77Bn30DU6y9KgrYMTxjrcGN2JfebijCxLzuLFdW?=
 =?us-ascii?Q?5FW+mRUKOEuMy5imtx/KbnspLo2s2dHK6NW1W97lU2zYrAKe+ZRJibwIrV/J?=
 =?us-ascii?Q?B+dS3wKNBqC5uujIlMR/UqMpyVJ9zZVqZ9ikoy51FCVtfB8MYqV4pTjrCwrl?=
 =?us-ascii?Q?hK0FrG/oQ0/CVaCLbeHOaK75B8JMZEKx0GmcuXz5/VF+QM4Fe1xx7/g+Cn3y?=
 =?us-ascii?Q?Ost38MvWnD/AXwSO8fYAL3Ic/iZiVfJdov8fFOSmH5YMYw9WT+Xw8Amojdde?=
 =?us-ascii?Q?AeXKyAR8NyAbS6lnEyhKWXq8nHp68h26Wumd/4vhzP8PVHByeqtDnmVwH1+G?=
 =?us-ascii?Q?Bld5vep1ldgIpO50Uq5IG/OaR8QIJLiJEiUp4RDx5XSpaoQvMYwnkVWs1pdr?=
 =?us-ascii?Q?i7IK1DeYJCCLkjh5ne3OB8zfVy2QA9MOACRPY+fpZTKlDuo3TY0jJs+qtvpq?=
 =?us-ascii?Q?nh1hZB31D1gzh8Nd9rZRZQ6QjgvARPF92aPF+0d7KVrZQfgoUh9CNK9rgiCx?=
 =?us-ascii?Q?jJJ7n0vfvZdfmuuWDBq3FzWQpZpdVON5mREJ0vhaQW4wuwso/TIuJOeA4PuW?=
 =?us-ascii?Q?v/xVeg/qo9YkWt7ysvWvRCNZhvstM5R9eIasBEMGhAPradZRP4B1nbG6k683?=
 =?us-ascii?Q?/HTqAy/CEPjV4Y7GcBqNR2uLqfmgJOItn1nv4SVzwMv1HBIEunZlPGMHMafi?=
 =?us-ascii?Q?05tS+F+2mX6djlsNx9+4npd6qk3UxRl9vbsAXd3SZpN6ST66cHleirpy9lgb?=
 =?us-ascii?Q?r8qumF6XoMwH3LKd/h/pE0Wpx4RgTEkg1Tb01pnPpNKRhgPTdt39NbR1RghG?=
 =?us-ascii?Q?ia0BVN/8WXZt3AU9NjCLp9tDc2MZTACBEuL1EC2Wp/V3HMBGtn6jB3PiDix9?=
 =?us-ascii?Q?E+Q2UO6lKLqxneje0bbOAjcSxg5f7F1ruL8mfR2YIYM99gCJE5K/zJWeQ/T1?=
 =?us-ascii?Q?xxb7fTLbsutQW5cDOrHW2U90kQKDhc+VuuOqVHjZbpMxd7Dg01V0hckz4kH7?=
 =?us-ascii?Q?75lJUyOxRl4K2/b1i8gJRxYqJmpEAwWIP0vy8Pj0jaRQVFmtSxXMD2MAL/HS?=
 =?us-ascii?Q?klpVA7wcVKSRI/Tc616BU2aJuREtaFDlPBReZLqxhiJqvS6xbsvCajSIIAOs?=
 =?us-ascii?Q?ZfFH6mD0zCEAj5h1b6R35zP8unS4JsBkV+yS5mVDnOwS+Vf+m3yn3zPffg9Y?=
 =?us-ascii?Q?uTPgQkPT//8YIYHMdeS76q0lqdvcJhWl29NK9Sz6cx+0lbugrX+UWC2X6bv2?=
 =?us-ascii?Q?8eh6AejGtXAWH3H5p6kHPzxhzu7bquZ1qupd7mW2zas08FhX1bQS+a4QDxnx?=
 =?us-ascii?Q?mWF7CE2CRTIBnHnIkijRj+Jmsg26arNTog/JLuf4bokMGyI9GWKtza6ei/FX?=
 =?us-ascii?Q?iQf5gXNIvHOSbTvcG8DU/5oJ1YMynvYGM71KF3ZEL8kFtQqi5SmSjlTJu+Hf?=
 =?us-ascii?Q?J5zt+ExUai5Wbp0+u88ASPsShlWdexcqno2o?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:10:10.3974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6861cb-6075-4989-1107-08dddbb1a086
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191
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
index fe9854ed9..e23f876fe 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -41,6 +41,7 @@
  * arg[1]:
  *
  * @XR24-XR24:			XRGB8888 framebuffer and writeback buffer
+ * @XR30-XR30:			XRGB2101010 framebuffer and writeback buffer
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
 
@@ -508,6 +512,7 @@ igt_main
 		const char *name;
 	} formats[] = {
 		{ DRM_FORMAT_XRGB8888, DRM_FORMAT_XRGB8888, "XR24-XR24" },
+		{ DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB2101010, "XR30-XR30" },
 	};
 
 	igt_display_t display;
-- 
2.43.0

