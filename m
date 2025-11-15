Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D8BCE8D6B
	for <igt-dev@archiver.kernel.org>; Sat, 15 Nov 2025 00:20:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8173210EBEA;
	Sat, 15 Nov 2025 00:20:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GbW88jCl";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013053.outbound.protection.outlook.com
 [40.107.201.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0466E10EBEA
 for <igt-dev@lists.freedesktop.org>; Sat, 15 Nov 2025 00:20:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V+er/apOsmqUYlgh+6aICwZ7omHwSjrzmH0JibBDEe6gskZakL8F9govdGZe310lXZfOr/Oq5RQEq/EEGTB0V2w1tPlOXI2zWIY6RGVIBQqaMD4eB+gwFc4vh5rFn9hDIeGwNvXleTw/BZ86NNT1ubLAAEbJjthAQf2aIJTqrvOtzrLgku1M3fqvdL4BpG1xliAV9Abw0oAeTJI3MNAPJxrmgCciRCB8DQgsV4wHQYO05Vsd1l6Y86uD6yWSP+YMQJGUIstK0XWkrzqpohwlsqPsZQ1WEXfzloo1xtCkVX4VjrGGYGGGTkNoabWvQdxXEbeLZs1pHvDrEJd5ddZkFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GF2/X7qvI26tj0PkaKo19uc3gagRg/VDiX1MjAHEQW0=;
 b=X+tnN99d1PPre6d4Fh6hSJaSB7jL+woJHO1+WbqTk9zMQ9zqV9vnIpenc+ccKQGg5exq3ekdfMSFuWXUtVzJG6Nn4y5cWA0netWJI02wpQLH68Pqb5F2r80cCOO8X6Rrk83UAdDzTY8lZe2IPp+RsgINg0+zQ0FWyPWLFVqRAY8CZhQKK8psl+/PN0S7p4lFLQUDzbcHgZfrpfn04l12oGNHbbO55Ac6eQgNkVqihC+oRk1AZrDxw8pxujiMfechJX4yYOzo44JB8kzTt0RxrBT4mqEEP6Ee6FsOexPj93tTi7y06U2TS66p+4VUwHQfaHck8JQST8etHBKIP8LLbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GF2/X7qvI26tj0PkaKo19uc3gagRg/VDiX1MjAHEQW0=;
 b=GbW88jClhF/jsJa42+hRV3EkSjCpBjGqdYFCyibb8uQmGu/rRDlUXD6NBJ1PAEPDfBsFrDrfAQbi5pS7zmOssyJut7iL+uSjAIaYjl8FVimCUOTi7hv8RLD9n50urAdc88fPaB3qUn1F++ZiF39BIR9lYB/1stGNbc0X3x9vanM=
Received: from BLAP220CA0008.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::13)
 by SA1PR12MB6824.namprd12.prod.outlook.com (2603:10b6:806:25f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Sat, 15 Nov
 2025 00:20:29 +0000
Received: from BL6PEPF0001AB4D.namprd04.prod.outlook.com
 (2603:10b6:208:32c:cafe::58) by BLAP220CA0008.outlook.office365.com
 (2603:10b6:208:32c::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.17 via Frontend Transport; Sat,
 15 Nov 2025 00:20:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB4D.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Sat, 15 Nov 2025 00:20:29 +0000
Received: from kylin.lan (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 14 Nov
 2025 16:20:28 -0800
From: Alex Hung <alex.hung@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <alex.hung@amd.com>, <harry.wentland@amd.com>, <leo.liu@amd.com>, Leo Li
 <sunpeng.li@amd.com>
Subject: [PATCH V12 08/32] lib/igt_fb: Add igt_copy_fb function
Date: Fri, 14 Nov 2025 17:18:17 -0700
Message-ID: <20251115001841.3563993-9-alex.hung@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4D:EE_|SA1PR12MB6824:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a64cd2-8d69-430d-59eb-08de23dcc876
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OHd5fbIHLl/I4koQBBLVMuUNHnOCd2UXKvB7Gl4qzm0l6ZzDIUrQimLVqvli?=
 =?us-ascii?Q?JT9dFlRRTjB1p0iLahIHGbSeFnRW+2ULVLFO2z786E9bPoeJ6Vqx932NpnzH?=
 =?us-ascii?Q?pE+S7eXR42I+t3p8E6qzJotuvQjEp/vRCE0KeYRtHOYD1O2M4hzdf+5gC1pg?=
 =?us-ascii?Q?/gwJgd1bQtVImahkM57VBOikdBsK3WWANK4dePwmOqwPNxyFnfM/CWU9UZw5?=
 =?us-ascii?Q?NGVw2H2wbclT0EOhNk9bof1dk2au2PthpRub0EppiraEiBI6uly5D8Tqhe8v?=
 =?us-ascii?Q?/jr0+3EDffBCnrN6rnHrAPNIOMCnO4HKEVLwp1qS9SdBKeNR/1xgEWHiVyAL?=
 =?us-ascii?Q?OaFOLSQw1bSIkWvIjwmldB5kjIlLkPKecAm8B7u62t5DTVBzZVLgLev1Smq/?=
 =?us-ascii?Q?s75kg2vU2rWxCWN3eyYGqhkqFQa/gTRWP9vX/IduIcvRVEi6bbg17PA7eX03?=
 =?us-ascii?Q?mOJLoxQjZpBGnuESHwGN0qiqydeuWWxlNvc08vzvjVi/9l1EBaDGJqgR5uSO?=
 =?us-ascii?Q?Lkc+XL7udNZuspieo4QoVookw4b/4Qb9q2Qab0rdiFUFR1LjvapWxyPqtG+s?=
 =?us-ascii?Q?JLRJlfQvBBw9MYqfQ6/Zai44cxJ26ZuidBfMGjgdEJMOWBdTND2mScsVM87I?=
 =?us-ascii?Q?BZmNXZLNi04TTe7lV6IxIZ+SRmsaduEyC7v7cpUWzIOcqj/dETflz6sxKf8z?=
 =?us-ascii?Q?Kf9vJp18W6L4hgEmAHxr++Qh2YZclAQPM/djODGfqU0WAtZLbUpFoxGrNEje?=
 =?us-ascii?Q?C8Ag+xPN2YJr9XBUQtVbFhLsQhF/+wGMRiT0HVYj3Cgl/XKHAe+sH/GmB1kT?=
 =?us-ascii?Q?axnZovzru+vHvOAX39px40rkg51wMMolfimfVSpPjxSMocxToIqwHUsrl4AD?=
 =?us-ascii?Q?5/7urgmW3/qd1Ozhm4eKcMgwKuzEGf9cwoc3ASnb0+7BGodBfLhCuducvTgS?=
 =?us-ascii?Q?K+3PifSY6tYyfRQK/N6YOgw8FQrrSSauz4jbbcBQ2Ra2TU6D1++EjrMxrqRx?=
 =?us-ascii?Q?BBOqfz7Gc7vmtyBHqk6CFDd4D8Bn438AJYWOp1POn9ePWh4yje4oKCp31DML?=
 =?us-ascii?Q?T7tniWSIigkSVGRCedhcN4ZUXk5K5acEfRQAcN3B3iIDzZSzwjKhMyLaEc2v?=
 =?us-ascii?Q?lSW7oNfAdG/TAdrKzBXOfucU7NL9koBkzRovOaR+fgNJmlRKLzf6d6AAhHf2?=
 =?us-ascii?Q?jCgTbdBR6EaVrQLWup1Ke6Ly/Rzi0tZOmIarAKtrDt78Z/Q5ZXorqMZAUW6p?=
 =?us-ascii?Q?MUyoioFnsePfhJpPEFx9UeBIjZIG9rV2iuF7nj9msu2QcvugIDWnWdjq5M5Q?=
 =?us-ascii?Q?XWVbRIsQAVpHopzizT5zIGAnISAR2MEpvplwczPVuYnoDWDS/C0TcCo7qh3P?=
 =?us-ascii?Q?C8oS/7dCoPEG1nV+didVLEJ4bgdtEBE7Lb7l2byNMmsnqvMlSeeflAumr2ru?=
 =?us-ascii?Q?C1AYi7ARrSE7wejgsCAfUnUzxS/QstEWH3omHaTecfptVeYdgUT7esCFTz7D?=
 =?us-ascii?Q?Q3nGxSqBfOZsXdbCtZ5irS6vtcGEwqa/mX5PSABYyWrVqDPwrKm23zS8kX61?=
 =?us-ascii?Q?72yn2n7ZS3jFpKDCPOo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2025 00:20:29.5703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a64cd2-8d69-430d-59eb-08de23dcc876
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6824
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

Add a function to copy fb of DRM_FORMAT_XRGB8888.

Signed-off-by: Alex Hung <alex.hung@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Leo Li <sunpeng.li@amd.com>
---
v12: 
 - Replace fb->width * fb->height * cpp by fb->size

 lib/igt_fb.c | 39 +++++++++++++++++++++++++++++++++++++++
 lib/igt_fb.h |  1 +
 2 files changed, 40 insertions(+)

diff --git a/lib/igt_fb.c b/lib/igt_fb.c
index a1df3d070..d20ff1095 100644
--- a/lib/igt_fb.c
+++ b/lib/igt_fb.c
@@ -2172,6 +2172,45 @@ unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 					  fb, 0, 0);
 }
 
+/**
+ * igt_copy_fb:
+ * @fd: open drm file descriptor
+ * @src: pointer to source #igt_fb structure
+ * @fb: pointer to destination #igt_fb structure
+ *
+ * This function creates a new framebuffer with the same properties as @src
+ * and copies the pixel data.
+ *
+ * Returns:
+ * The kms id of the created framebuffer on success or a negative error code.
+ */
+int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb)
+{
+	char *in_ptr, *out_ptr;
+	int fb_id = 0;
+
+	igt_assert(src);
+
+	if (src->num_planes != 1)
+		return -EINVAL;
+
+	fb_id = igt_create_fb(fd, src->width, src->height, src->drm_format,
+			      src->modifier, fb);
+
+	/* copy buffer contents */
+	in_ptr = igt_fb_map_buffer(fb->fd, src);
+	igt_assert(in_ptr);
+	out_ptr = igt_fb_map_buffer(fb->fd, fb);
+	igt_assert(out_ptr);
+
+	igt_memcpy_from_wc(out_ptr, in_ptr, fb->size);
+
+	igt_fb_unmap_buffer(fb, out_ptr);
+	igt_fb_unmap_buffer(src, in_ptr);
+
+	return fb_id;
+}
+
 /**
  * igt_create_color_fb:
  * @fd: open drm file descriptor
diff --git a/lib/igt_fb.h b/lib/igt_fb.h
index fe0bb580c..ac0e0909e 100644
--- a/lib/igt_fb.h
+++ b/lib/igt_fb.h
@@ -141,6 +141,7 @@ struct intel_buf *igt_fb_create_intel_buf(int fd, struct buf_ops *bops,
 					  const struct igt_fb *fb, const char *name);
 unsigned int igt_create_fb(int fd, int width, int height, uint32_t format,
 			   uint64_t modifier, struct igt_fb *fb);
+int igt_copy_fb(int fd, struct igt_fb *src, struct igt_fb *fb);
 unsigned int igt_create_color_fb(int fd, int width, int height,
 				 uint32_t format, uint64_t modifier,
 				 double r, double g, double b,
-- 
2.43.0

