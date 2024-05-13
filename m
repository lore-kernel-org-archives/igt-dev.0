Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4B7C25B10
	for <igt-dev@archiver.kernel.org>; Mon, 13 May 2024 13:57:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D2710E7A9;
	Mon, 13 May 2024 13:57:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="X/fyMKVD";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 297A410E7A9
 for <igt-dev@lists.freedesktop.org>; Mon, 13 May 2024 13:57:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dt0N5JknxyVuKqIJUnadXJEI6XH7juDvjvd9QMVHgHG4lUP7Q+OaQJo9GGupPw/8WhIAfsuTZP33Shpc5MeUkgjVc0hnAsCo9lTs2UyASolINuMils1X0tf6oHw4GDu4tpfhYIFrhnOoFZrht3ip4sqLQUy0E/+7u4XWqUTH9wBeQK3BWHJRe+bpeMUN99lWnlag6QJNz66+2XVgZwaPlwflR3UHzhHn68vlt6x+NbKfhp1RWACiUbJQuvBgWmzLTItf66yyenUNLoXcH8wPI1fEZIOPM+mYJ6QUKgK6R1d/wxEv0fxaR+jyymrYb2MrpUxXjvBOXdineKFQ6jAnww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fBrliSOW99iV/X/ypT7Qex/UKPNpgWqceKks003h45Q=;
 b=nX+bM3dKDf++B9iWb2gCzfPje3DUY7LIjGQH/gSdV0dYNmnyBCIoZYKh45bTuvs0nU6OxejyRFf1snL1nnjUf0C82GnTnDnpAGpuJ5ONsruIkZ3FaweHmwGafb16ubKuk6e4GSPOql6BD+i5cjjkc7netn5uCsF4xVC6O9hmejjMv8hMRKIfBqzg8bquy27M0J2tP61XL7FAwI4dkY0cVyaxYJDy64KuGXxGbVP6XSvhy1aoDoVm2Q1H6DgHqZLcUZCGkseVCHdTF39C4Aq4U/L+awBiYbs1fojiUaIRh1LMko1CC3t/93bRbD6N/eFHpkvFnATnrcpb68WKp5eJ1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fBrliSOW99iV/X/ypT7Qex/UKPNpgWqceKks003h45Q=;
 b=X/fyMKVDjHqW4X/EnRpyTV12kXk83qDfVyh5bNv60ntiVb6WUr4F621xbtCp0vrs8m3fjpbcfoIu7mhSZieNXNPEvWhYEHWRavpQgr8Cj4SLYy6TZYT49LCJMxdGZ6oVZIVs4Tq/DWVz2sRjMHCoSLBjqMouCLlYuKP9i2xfWZU=
Received: from BYAPR01CA0063.prod.exchangelabs.com (2603:10b6:a03:94::40) by
 PH7PR12MB6634.namprd12.prod.outlook.com (2603:10b6:510:211::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.49; Mon, 13 May
 2024 13:57:36 +0000
Received: from SJ1PEPF00001CE1.namprd05.prod.outlook.com
 (2603:10b6:a03:94:cafe::b6) by BYAPR01CA0063.outlook.office365.com
 (2603:10b6:a03:94::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Mon, 13 May 2024 13:57:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE1.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Mon, 13 May 2024 13:57:36 +0000
Received: from sathish-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 13 May 2024 08:57:30 -0500
From: Sathishkumar S <sathishkumar.sundararaju@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Sathishkumar S <sathishkumar.sundararaju@amd.com>, Leo Liu
 <leo.liu@amd.com>
Subject: [PATCH i-g-t 1/2] tests/amdgpu: support jpeg test on gfx940
Date: Mon, 13 May 2024 19:27:04 +0530
Message-ID: <20240513135705.2399645-1-sathishkumar.sundararaju@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE1:EE_|PH7PR12MB6634:EE_
X-MS-Office365-Filtering-Correlation-Id: 70db6c56-7413-42df-13eb-08dc7354a527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|1800799015|376005|36860700004; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L05wYmRLb2tiV0JJcGVQblRxNVM4N1ZJOTVGYkZUMGQ1TDduclFrSUc3cmEy?=
 =?utf-8?B?TkZ0cENXNG5UR1d1WGlOckdYc09JTjV0ajB4ajFGb3JGTHRZcHUrVDNYaDZG?=
 =?utf-8?B?QWtZZC9XSkZVSVl5cmxpYXRnWkk5MkNob3J1bStPVHFXOXk1OHV2OEkzcnpQ?=
 =?utf-8?B?dGkwVDhlMWpadEVTVUxMZGNtcWswY0VkcGQyWE1EUDlRZnFaNkQyK2l2bDNH?=
 =?utf-8?B?QXJJSXpzMXBFZFdZc2t4b2ZlT1JOWlVVRnhLSVdrdW5LZlRCZUxPV0lNU1ow?=
 =?utf-8?B?d2QzUGRsMU9zYVpTY0c0TnUwM2piN2hmVERpN0tvWDg4Z2M0U3BjRmZzVk1Z?=
 =?utf-8?B?SFdKVTVNYjl3bjhHRzhNNHI1SU1ia0lzejU2UWhLYXRlZHpoL2dnM21ZQlR5?=
 =?utf-8?B?bFVSOFRJM3NWVFZrRlU4RFo2U3NoVVhPUEQ3RkY1U1FUSzJ3YzBZSlR1dVdM?=
 =?utf-8?B?RkJ5dm1ZU0t0OWQ5M1dpRFl2MllZTDZIYVM4M0lQTnh4TW9IWENWVFFMclJi?=
 =?utf-8?B?aDQ1eVphaWJoZ0xNc05xenErTzZtYkVnR3RBN1YydWpaV01BajQ1NVQwMkVP?=
 =?utf-8?B?Q1drUGEwRlRZTGxMWmkzMkpuYmNyZE9wMU9UZkNnaVVQbDlnN1hnNEoxMzZm?=
 =?utf-8?B?ZFFOYy8yeWpFd2VzN2pZd3Uyb2hQSGc4bGJDdlFTUzFOSG9iV295NUR5a0lK?=
 =?utf-8?B?UmdRQ040Z1MxY1hvYjhseW80TEFBZTJnK0pRNElCWVZhaWFLVEFEY28yTmNs?=
 =?utf-8?B?dzhjWjZweFpDMXhWa056OUtTczZXYy9MNjNVV1VVSDJkV3pTc3lKQUpJRkpV?=
 =?utf-8?B?WWxIRHhXMHlJYkVvWUZsdS91TS83MUJOR0pjWmJQdTBRZjhaV1ZYQ05Wa25Z?=
 =?utf-8?B?ZDJjQWVOVlhvRGl6UHk5VHZJMGVpZTk4VHNZcUUxVkR0NFEwWlVXRFc1WUZY?=
 =?utf-8?B?Zzc0dzc4Wmgyb1NWend4MmhkZjA1bjgreHV6Vyt5QzluSklpa2pxZFFuQjAy?=
 =?utf-8?B?TkRHOFcvU21tMjdTSTJxOWFFNFBGVndaVk1mWjZTRjE4cEYyemxEWDBTVUpD?=
 =?utf-8?B?SG9nc21rNEkram9WNUwra1pmdHFPSkgxeVhxd0RyMEhTQkxTMEdLZlZadWFD?=
 =?utf-8?B?eEdNQThPTmJ3UGFNbGNLR3dMTG1TUTd6bEx5WWhMeUx4ZGNJM0xGSTRkSzYx?=
 =?utf-8?B?aTZURGxvOWlZL2x6TDhCQ1l1blplZDBwYXpiUVN3V2RVeDFYclBjUnUvbFJO?=
 =?utf-8?B?dkFVRnNzNSs0dVJET1JremhtQTR0MGxCRkFnQVBlTklQMW1NL0dKekJFaUk3?=
 =?utf-8?B?NmRZcDJvQ3pRSmxEbDFpcTBnUkdzL25pSUhrdjB2MFUrby9RK0R6SExPRk54?=
 =?utf-8?B?SUtzUW9XV0kxRlVKZGZ2anZCL1NpRnhpNWpXMnV0TWJac2tBc1BjZG5yRTFh?=
 =?utf-8?B?Tm03bVN5SUdQc2s4cGFDdVJKaWRsSDlKSEN2akU1MGlETENvbE94NUFaVE9o?=
 =?utf-8?B?Ym80N3I4TUh2NXllRHE1MHRSUjkzMng4UEFOUTB5RlNuUG5lYTRHQStESS8x?=
 =?utf-8?B?VTJXM2k4a2RZUm44aHpxWXhmUTJ3elVtaHlSMTNibXgzTkVwM2tOazVkSXZ4?=
 =?utf-8?B?SXZQK1NDdUF1WnRGcHhWUEpQa2NqVytrdEhoeERXdmZXRWJqS3hKaVROTmJv?=
 =?utf-8?B?azZOYTFMVy9aUGxxN2ZzMmI3NVFhMjVYTzMvemNucThmWnNYVG5raUYvQmhx?=
 =?utf-8?B?d3VCa3JGTXJNblBTNW1zU2hEcENEYlJKVUpGQkhyZ1FxYW92SGl5bzZuZUlp?=
 =?utf-8?Q?b0Q0LuFCTx16XcqoHnB/Ia1iC6IiIZcte9Kl8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2024 13:57:36.3766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70db6c56-7413-42df-13eb-08dc7354a527
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6634
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

update jpeg specific register offsets

Signed-off-by: Sathishkumar S <sathishkumar.sundararaju@amd.com>
Acked-by: Leo Liu <leo.liu@amd.com>
---
 tests/amdgpu/amd_jpeg_dec.c | 167 +++++++++++++++++++++++++++---------
 1 file changed, 127 insertions(+), 40 deletions(-)

diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
index bb2a8e97e530..12f5bfcff556 100644
--- a/tests/amdgpu/amd_jpeg_dec.c
+++ b/tests/amdgpu/amd_jpeg_dec.c
@@ -53,6 +53,47 @@
 #define vcnipUVD_JPEG_RB_RPTR			0x4003
 #define vcnipUVD_JPEG_OUTBUF_WPTR		0x401d
 
+#define vcnipUVD_JPEG_DEC_SOFT_RST_1             0x4051
+#define vcnipUVD_JPEG_PITCH_1                    0x4043
+#define vcnipUVD_JPEG_UV_PITCH_1                 0x4044
+#define vcnipJPEG_DEC_ADDR_MODE_1                0x404B
+#define vcnipUVD_JPEG_TIER_CNTL2_1               0x400E
+#define vcnipUVD_JPEG_OUTBUF_CNTL_1              0x4040
+#define vcnipUVD_JPEG_OUTBUF_WPTR_1              0x4041
+#define vcnipUVD_JPEG_OUTBUF_RPTR_1              0x4042
+#define vcnipUVD_JPEG_LUMA_BASE0_0               0x41C0
+#define vcnipUVD_JPEG_CHROMA_BASE0_0             0x41C1
+#define vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1   0x4048
+#define vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1  0x4049
+#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1 0x40B5
+#define vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1  0x40B4
+#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1  0x40B3
+#define vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1   0x40B2
+
+static uint32_t jpeg_dec_soft_rst;
+static uint32_t jrbc_ib_cond_rd_timer;
+static uint32_t jrbc_ib_ref_data;
+static uint32_t lmi_jpeg_read_64bit_bar_high;
+static uint32_t lmi_jpeg_read_64bit_bar_low;
+static uint32_t jpeg_rb_base;
+static uint32_t jpeg_rb_size;
+static uint32_t jpeg_rb_wptr;
+static uint32_t jpeg_pitch;
+static uint32_t jpeg_uv_pitch;
+static uint32_t dec_addr_mode;
+static uint32_t dec_y_gfx10_tiling_surface;
+static uint32_t dec_uv_gfx10_tiling_surface;
+static uint32_t lmi_jpeg_write_64bit_bar_high;
+static uint32_t lmi_jpeg_write_64bit_bar_low;
+static uint32_t jpeg_tier_cntl2;
+static uint32_t jpeg_outbuf_rptr;
+static uint32_t jpeg_outbuf_cntl;
+static uint32_t jpeg_int_en;
+static uint32_t jpeg_cntl;
+static uint32_t jpeg_rb_rptr;
+static uint32_t jpeg_outbuf_wptr;
+static uint32_t jpeg_luma_base0_0;
+static uint32_t jpeg_chroma_base0_0;
 
 #define RDECODE_PKT_REG_J(x)		((unsigned int)(x)&0x3FFFF)
 #define RDECODE_PKT_RES_J(x)		(((unsigned int)(x)&0x3F) << 18)
@@ -104,6 +145,50 @@ is_jpeg_tests_enable(amdgpu_device_handle device_handle,
 	else
 		return false;
 
+	jrbc_ib_cond_rd_timer = vcnipUVD_JRBC_IB_COND_RD_TIMER;
+	jrbc_ib_ref_data = vcnipUVD_JRBC_IB_REF_DATA;
+	jpeg_rb_base = vcnipUVD_JPEG_RB_BASE;
+	jpeg_rb_size = vcnipUVD_JPEG_RB_SIZE;
+	jpeg_rb_wptr = vcnipUVD_JPEG_RB_WPTR;
+	jpeg_int_en = vcnipUVD_JPEG_INT_EN;
+	jpeg_cntl = vcnipUVD_JPEG_CNTL;
+	jpeg_rb_rptr = vcnipUVD_JPEG_RB_RPTR;
+
+	if (context->family_id == AMDGPU_FAMILY_AI &&
+		(context->chip_id - context->chip_rev) > 0x3c) { /* gfx940 */
+		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST_1;
+		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH_1;
+		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW_1;
+		jpeg_pitch = vcnipUVD_JPEG_PITCH_1;
+		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH_1;
+		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE_1;
+		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE_1;
+		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE_1;
+		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH_1;
+		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW_1;
+		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2_1;
+		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL_1;
+		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR_1;
+		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR_1;
+		jpeg_luma_base0_0 = vcnipUVD_JPEG_LUMA_BASE0_0;
+		jpeg_chroma_base0_0 = vcnipUVD_JPEG_CHROMA_BASE0_0;
+	} else {
+		jpeg_dec_soft_rst = vcnipUVD_JPEG_DEC_SOFT_RST;
+		lmi_jpeg_read_64bit_bar_high = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH;
+		lmi_jpeg_read_64bit_bar_low = vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW;
+		jpeg_pitch = vcnipUVD_JPEG_PITCH;
+		jpeg_uv_pitch = vcnipUVD_JPEG_UV_PITCH;
+		dec_addr_mode = vcnipJPEG_DEC_ADDR_MODE;
+		dec_y_gfx10_tiling_surface = vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE;
+		dec_uv_gfx10_tiling_surface = vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE;
+		lmi_jpeg_write_64bit_bar_high = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH;
+		lmi_jpeg_write_64bit_bar_low = vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW;
+		jpeg_tier_cntl2 = vcnipUVD_JPEG_TIER_CNTL2;
+		jpeg_outbuf_cntl = vcnipUVD_JPEG_OUTBUF_CNTL;
+		jpeg_outbuf_rptr = vcnipUVD_JPEG_OUTBUF_RPTR;
+		jpeg_outbuf_wptr = vcnipUVD_JPEG_OUTBUF_WPTR;
+	}
+
 	return true;
 }
 
@@ -277,39 +362,34 @@ send_cmd_bitstream_direct(struct mmd_context *context, uint64_t addr,
 {
 
 	/* jpeg soft reset */
-	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND0, TYPE0, 1, idx);
+	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 1, idx);
 
 	/* ensuring the Reset is asserted in SCLK domain */
-	set_reg_jpeg(context, vcnipUVD_JRBC_IB_COND_RD_TIMER, COND0, TYPE0,
-			0x01400200, idx);
-	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0,
-			(0x1 << 0x10), idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND3, TYPE3,
-			(0x1 << 0x10), idx);
+	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0, 0x01400200, idx);
+	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0x1 << 0x10), idx);
+	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
 
 	/* wait mem */
-	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND0, TYPE0, 0, idx);
+	set_reg_jpeg(context, jpeg_dec_soft_rst, COND0, TYPE0, 0, idx);
 
 	/* ensuring the Reset is de-asserted in SCLK domain */
-	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0, (0 << 0x10),
-			idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_DEC_SOFT_RST, COND3, TYPE3,
-			(0x1 << 0x10), idx);
+	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, (0 << 0x10), idx);
+	set_reg_jpeg(context, jpeg_dec_soft_rst, COND3, TYPE3, (0x1 << 0x10), idx);
 
 	/* set UVD_LMI_JPEG_READ_64BIT_BAR_LOW/HIGH based on bitstream buffer address */
-	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_READ_64BIT_BAR_HIGH, COND0, TYPE0,
+	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_high, COND0, TYPE0,
 			(addr >> 32), idx);
-	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_READ_64BIT_BAR_LOW, COND0, TYPE0,
+	set_reg_jpeg(context, lmi_jpeg_read_64bit_bar_low, COND0, TYPE0,
 			addr, idx);
 
 	/* set jpeg_rb_base */
-	set_reg_jpeg(context, vcnipUVD_JPEG_RB_BASE, COND0, TYPE0, 0, idx);
+	set_reg_jpeg(context, jpeg_rb_base, COND0, TYPE0, 0, idx);
 
 	/* set jpeg_rb_base */
-	set_reg_jpeg(context, vcnipUVD_JPEG_RB_SIZE, COND0, TYPE0, 0xFFFFFFF0, idx);
+	set_reg_jpeg(context, jpeg_rb_size, COND0, TYPE0, 0xFFFFFFF0, idx);
 
 	/* set jpeg_rb_wptr */
-	set_reg_jpeg(context, vcnipUVD_JPEG_RB_WPTR, COND0, TYPE0,
+	set_reg_jpeg(context, jpeg_rb_wptr, COND0, TYPE0,
 			(JPEG_DEC_BSD_SIZE >> 2), idx);
 }
 
@@ -319,59 +399,66 @@ send_cmd_target_direct(struct mmd_context *context, uint64_t addr,
 		uint32_t *idx)
 {
 
-	set_reg_jpeg(context, vcnipUVD_JPEG_PITCH, COND0, TYPE0,
+	set_reg_jpeg(context, jpeg_pitch, COND0, TYPE0,
 			(JPEG_DEC_DT_PITCH >> 4), idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_UV_PITCH, COND0, TYPE0,
+	set_reg_jpeg(context, jpeg_uv_pitch, COND0, TYPE0,
 			(JPEG_DEC_DT_PITCH >> 4), idx);
 
-	set_reg_jpeg(context, vcnipJPEG_DEC_ADDR_MODE, COND0, TYPE0, 0, idx);
-	set_reg_jpeg(context, vcnipJPEG_DEC_Y_GFX10_TILING_SURFACE, COND0, TYPE0,
+	set_reg_jpeg(context, dec_addr_mode, COND0, TYPE0, 0, idx);
+	set_reg_jpeg(context, dec_y_gfx10_tiling_surface, COND0, TYPE0,
 			0, idx);
-	set_reg_jpeg(context, vcnipJPEG_DEC_UV_GFX10_TILING_SURFACE, COND0, TYPE0,
+	set_reg_jpeg(context, dec_uv_gfx10_tiling_surface, COND0, TYPE0,
 			0, idx);
 
 	/* set UVD_LMI_JPEG_WRITE_64BIT_BAR_LOW/HIGH based on target buffer address */
-	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_HIGH, COND0, TYPE0,
+	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_high, COND0, TYPE0,
 			(addr >> 32), idx);
-	set_reg_jpeg(context, vcnipUVD_LMI_JPEG_WRITE_64BIT_BAR_LOW, COND0, TYPE0,
+	set_reg_jpeg(context, lmi_jpeg_write_64bit_bar_low, COND0, TYPE0,
 			addr, idx);
 
 	/* set output buffer data address */
-	set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 0, idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0, JPEG_DEC_LUMA_OFFSET,
-			idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 1, idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
+	if (jpeg_luma_base0_0) {
+		set_reg_jpeg(context, jpeg_luma_base0_0, COND0, TYPE0,
+			JPEG_DEC_LUMA_OFFSET, idx);
+		set_reg_jpeg(context, jpeg_chroma_base0_0, COND0, TYPE0,
 			JPEG_DEC_CHROMA_OFFSET, idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_TIER_CNTL2, COND0, 0, 0, idx);
+	} else {
+		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 0, idx);
+		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
+			JPEG_DEC_LUMA_OFFSET, idx);
+		set_reg_jpeg(context, vcnipUVD_JPEG_INDEX, COND0, TYPE0, 1, idx);
+		set_reg_jpeg(context, vcnipUVD_JPEG_DATA, COND0, TYPE0,
+			JPEG_DEC_CHROMA_OFFSET, idx);
+	}
+	set_reg_jpeg(context, jpeg_tier_cntl2, COND0, 0, 0, idx);
 
 	/* set output buffer read pointer */
-	set_reg_jpeg(context, vcnipUVD_JPEG_OUTBUF_RPTR, COND0, TYPE0, 0, idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_OUTBUF_CNTL, COND0, TYPE0,
+	set_reg_jpeg(context, jpeg_outbuf_rptr, COND0, TYPE0, 0, idx);
+	set_reg_jpeg(context, jpeg_outbuf_cntl, COND0, TYPE0,
 				((0x00001587 & (~0x00000180L)) | (0x1 << 0x7) | (0x1 << 0x6)),
 				 idx);
 
 	/* enable error interrupts */
-	set_reg_jpeg(context, vcnipUVD_JPEG_INT_EN, COND0, TYPE0, 0xFFFFFFFE, idx);
+	set_reg_jpeg(context, jpeg_int_en, COND0, TYPE0, 0xFFFFFFFE, idx);
 
 	/* start engine command */
-	set_reg_jpeg(context, vcnipUVD_JPEG_CNTL, COND0, TYPE0, 0xE, idx);
+	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0xE, idx);
 
 	/* wait for job completion, wait for job JBSI fetch done */
-	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0,
+	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0,
 			(JPEG_DEC_BSD_SIZE >> 2), idx);
-	set_reg_jpeg(context, vcnipUVD_JRBC_IB_COND_RD_TIMER, COND0, TYPE0,
+	set_reg_jpeg(context, jrbc_ib_cond_rd_timer, COND0, TYPE0,
 			0x01400200, idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_RB_RPTR, COND3, TYPE3, 0xFFFFFFFF, idx);
+	set_reg_jpeg(context, jpeg_rb_rptr, COND3, TYPE3, 0xFFFFFFFF, idx);
 
 	/* wait for job jpeg outbuf idle */
-	set_reg_jpeg(context, vcnipUVD_JRBC_IB_REF_DATA, COND0, TYPE0, 0xFFFFFFFF,
+	set_reg_jpeg(context, jrbc_ib_ref_data, COND0, TYPE0, 0xFFFFFFFF,
 			idx);
-	set_reg_jpeg(context, vcnipUVD_JPEG_OUTBUF_WPTR, COND3, TYPE3, 0x00000001,
+	set_reg_jpeg(context, jpeg_outbuf_wptr, COND3, TYPE3, 0x00000001,
 			idx);
 
 	/* stop engine */
-	set_reg_jpeg(context, vcnipUVD_JPEG_CNTL, COND0, TYPE0, 0x4, idx);
+	set_reg_jpeg(context, jpeg_cntl, COND0, TYPE0, 0x4, idx);
 }
 
 static void
-- 
2.25.1

