Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CB9C36008
	for <igt-dev@archiver.kernel.org>; Wed, 26 Mar 2025 23:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789E510E792;
	Wed, 26 Mar 2025 23:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K2ZVNFZG";
	dkim-atps=neutral
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4485D10E79D
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Mar 2025 23:43:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMnvj7EcnVBTHgTRNzuAH8B7TBAbAjoWAeqFcroxCv07YvYqbUY/S4SZehGx/+Wx5hRqPRUWBQdmroQ131S1Hq2Ai4KeE0sxubFEmwy2D6AgD7iVIvaFYYrswYiw+74AZsa/FQbwWnxW4+NTjchwAnMD8eUufwSrZP0jF9JdlEJxG84DccmARGA2MjK1srAgNM3G2xeGj2xdvmMiZm7ufKAhivI+6Xk15SZlIgGePrBFLPIBIgN+AkPBhkPjRMg3GgAz+14F1KyAG0asrAETtpLauGLqnXlMG8rn+5iM/Mw0vvp6crjvlatDFUCeW7Zi0bBsYq7/QDm00puZSPU9Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AxIwUjU4hIC0eZgf20mVSWkD4csrJf8tz+xjuo/SaKU=;
 b=kR5y6BQzAqlqz64y3PlUvWpOXk5f6nP10nithZOnmsAw/CfUeF7BZrmcQ+D2EIgqFVnqsYQI09fjXhrbX+MlbA9fTFZIjOWScU4ri4cSjRDV7eGE/6jrAQn0lwuNoqjyI2FtLDL8R5gCYYZxBgHNXzn4OkHUzcw9bD4zxecQiQY5cZQRQM+whiI0yGO6AM+kg6FChgO61rD0PRpwlWAJBRfUORX3VaNRGmdWkAGMG69ZGSjSO6aSGvJJYjnI07BVEuwQm3zZQ6ZAoG1igHpZf/dX3CYJfcvDwF+//UYQ0JAy+/jvEhmM5Dpq3hgkkr7DxsfLZiEeD95LGKwRBopIsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AxIwUjU4hIC0eZgf20mVSWkD4csrJf8tz+xjuo/SaKU=;
 b=K2ZVNFZGHixwTNlz/tvScDtMhTqIi0sNv8cwQs4u2GORYAhBbnQ0wUMzvvwU6VTznE6cg/wJFt1iBxgjFnA0bBFjSlZShzotgc/jLToPyTyuajzlL80Pi7RNIwJCVBCU1UA7w5zhTfuIVii2Wirx+3+fg2OUGevgmU+tka8mjsQ=
Received: from LV3P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:234::33)
 by SJ2PR12MB8182.namprd12.prod.outlook.com (2603:10b6:a03:4fd::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Wed, 26 Mar
 2025 23:43:21 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:408:234:cafe::71) by LV3P220CA0001.outlook.office365.com
 (2603:10b6:408:234::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.43 via Frontend Transport; Wed,
 26 Mar 2025 23:43:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 26 Mar 2025 23:43:20 +0000
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Mar
 2025 18:43:20 -0500
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>, <alex.hung@amd.com>
CC: <harry.wentland@amd.com>
Subject: [PATCH V7 19/37] tests/kms_colorop: Skip if writeback does not
 support fourcc
Date: Wed, 26 Mar 2025 17:35:51 -0600
Message-ID: <20250326233609.2980110-20-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SJ2PR12MB8182:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ffaf320-822f-4e0b-b4b9-08dd6cbffdc3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+qINzRVYiuwRlaXB0w8NSfZB4cKXHDbl7r8Y0rHHAKGDVQFfV5uOyWcU7TtV?=
 =?us-ascii?Q?gS4oN3WQAO68fnIp/f/CVWOf8NhYN3oOHtODBhwe5jFJ3ijr7YquyCZD5uv9?=
 =?us-ascii?Q?Ky2i0APWwtHY/vKTXfa5Y4Wz/AVrzfPrEzgjF546f0nbbRV/JemHViqq9Hyn?=
 =?us-ascii?Q?SYyEkMTgowjCNqirzgNYWo6gRJ4bXoEPq2lHlyDh0w8padcOFKFyWbETM8bM?=
 =?us-ascii?Q?fxf6iWnjQvA03OswO9qNe6NqK9OuZwceiLUnLjl6/BVlhnSHvGUJ8XNXVDBV?=
 =?us-ascii?Q?lZPGMVc31ipGC39ctOcLYTvSQku5qq+aN50pIVykWoh2gW+Iou6kKAXXSDvB?=
 =?us-ascii?Q?W9CUR9LPYyjMaMHJrSq7D668QK9b7tooAnJGzfsPoDLYgfZ9ntuywbPIbtpH?=
 =?us-ascii?Q?OjWb0JnzdgTHiFoRyobYVfj+uduUSEPNjfNER2xhBuy7kQtfIWyjXt+GpjtH?=
 =?us-ascii?Q?9K5kvf6iKzMCNUmQRP9OkKfmRHg6rNgtIEhTO6l3yfZXKEo7HTI+byelKKEV?=
 =?us-ascii?Q?w4HRh2LRdzVDILVxKEXSTSB9h9bDlDYXC/IEW9loOVPEVkWYu01swKhIWP1T?=
 =?us-ascii?Q?qoMovOhWRLofpOroE3ERKThxULddPn9ilCVrL5ennupX8MGK8p1wWsR27kyW?=
 =?us-ascii?Q?3d1IMcdeQmPXh5F3FySCOXsl6J3OWJrtwzH39Xij44BWZt5gZesH9VBWIvXB?=
 =?us-ascii?Q?4PGweT0ekft8fjzak7aeRLN9KXxJTIWJ7QdwYpNwSBQdSpRMrGhlA7i1wcU/?=
 =?us-ascii?Q?hsZ/97TCUA2EGucq26ulIeDB31rvhySJsLgdz5Bg76egG0ZisKk7e/uaYlux?=
 =?us-ascii?Q?R1yN+wmk/UMrSbVBl/S2pkZekmEpGlAfWevNT2cRQRNSt1UpPKg+xQAAz86x?=
 =?us-ascii?Q?KV8hR9+KAoKEGriHqyquepYCREl9uVxMrZ4Ab0pnVbNQ8QTaGdN7bvo+wXeY?=
 =?us-ascii?Q?d4mGu/HrI/r/kiqHyReJnjMjswx4UTmKP8dZCvo+TOnxTJL00cQucRC1WEQb?=
 =?us-ascii?Q?qBcmb0SrdqHP9vUJwO/ot68eu3rEtht5iuax6ZRlwLTX1VktYB0nScpcxm3B?=
 =?us-ascii?Q?AnWiUY7S9Pw7Qb9jUqKalMlQ1pkV5uMVwxGj3J4Ee/2PSSO7kIMX57N1uYL9?=
 =?us-ascii?Q?ZR3HflgcQBBMpAJPc15c/Cw+hsN/lda07NAbrl98jR8huPCsL4mQl+CZa7of?=
 =?us-ascii?Q?Wdfjv7cT6rJsExwnQdDMFUvr/M7q3k1xNHEZ7MMbBCiHPBmNKTqLLRHR0R+0?=
 =?us-ascii?Q?dBEglOroQaJ00FjwjkOjgXtn+33Neu8VrZoTemEt66ZiQtvuyYtWS6TLHK8z?=
 =?us-ascii?Q?5+N6bbMR1Mz+E//WDc12+KoJRFdLs7QFjmjMr2Z7/eqMtkU/nxwx1G3bziyZ?=
 =?us-ascii?Q?O+nY0ug7KqDbrcSVMvGp2cOt/iz+sr9EOJ7E5V/h04JL47sIATZhDzNnLSeA?=
 =?us-ascii?Q?eU8wJ71VgupGEfEvLafg9MSR/SQPmZJSpFcU6W3B10vMRoJWPEXR41HA8neM?=
 =?us-ascii?Q?xZ1//awLREuvvAkxmuZf/Yp+9JoyBZkeKhRZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2025 23:43:20.8024 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ffaf320-822f-4e0b-b4b9-08dd6cbffdc3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8182
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
 tests/kms_colorop.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
index 56c232ef3..4c1751c3b 100644
--- a/tests/kms_colorop.c
+++ b/tests/kms_colorop.c
@@ -69,6 +69,10 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 	uint32_t writeback_format = fourcc_out;
 	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
 	int width, height, ret;
+	drmModePropertyBlobRes *wb_formats_blob;
+	int i;
+	__u32 *format;
+	bool found_format = false;
 
 	igt_output_override_mode(output, &override_mode);
 
@@ -83,6 +87,17 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
 			    fourcc_in, modifier, &input_fb);
 	igt_assert(ret >= 0);
 
+	/* check writeback formats */
+	wb_formats_blob = get_writeback_formats_blob(output);
+	format = wb_formats_blob->data;
+
+	for (i = 0; i < wb_formats_blob->length / 4; i++)
+		if (fourcc_out == format[i])
+			found_format = true;
+
+	igt_skip_on_f(!found_format,
+		      "writeback doesn't support fourcc format %x\n", fourcc_out);
+
 	ret = igt_create_fb(display->drm_fd, width, height,
 			    writeback_format, modifier, &output_fb);
 	igt_assert(ret >= 0);
-- 
2.43.0

