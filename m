Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE343D172CD
	for <igt-dev@archiver.kernel.org>; Mon,  2 Feb 2026 05:08:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CCFC10E103;
	Mon,  2 Feb 2026 05:08:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Dwl37B62";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013057.outbound.protection.outlook.com
 [40.93.196.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F2DF10E103
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Feb 2026 05:08:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fsWUmHtgoeGP9WAH0N1t9M26VemM4BMmZU5FxonygsynmZIZQ5Rvxj3bQZzpWW9lOufA5EERRp+Qfk/hP2gq+bib/BQ1+Y9BggBx9/o2NgL9w4mFNPtPxq1Qx3mXLXv8wmtNenaHcVvSAAahvDmzztQhMnKMrp92ZW5HcEDt1H9D9LKK2f15uahqn3s3fcv0/ODN3vgLZ62iAJZCAsfFa98h8hWTOGcbD7a5AsYXsFQnPy3zuUb/3itlq10Ztr1vHAUZtLTqHPoFAau9Zkhf+J4k6zFADmWOXpUfO3y/yeM/pKgzIMHmUQnDgOZnPx8N5En93XeAmrblc0CvrpCJQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYs2YgZXbgzDsHNP9ezMNpvjabTee1K5ci4KnXWo7uE=;
 b=upIpBRH+DdqhzL8iWFDL8yd+Zwn+OpZLAinh+kEUJhWIlKCEhpuga6JEZoEn/dQIXbowTTOEFWVVCbtCPeehmTQSItt4NAtKyGERhLQiBmhr4sH7oMe1Q/OZfJZHryfEooMlp+ibDQR5bLHuG+PDdnofXJjoCROKSNie+7C4qD8Wxs7wuGTjpf1HLwipsWAUotlzcfbKy2ezpLWTYe1SsP/O5bz3eSYakZNrCDZAn0Q1DcgV2Z63JAUzjqUAB0foXij598XBeFCayxUraaqpSF4D1EWOcqXv+a7Z43bc7Be4k3bulHYvBB3DGtq6LvHEeXKfgnNzvYLx+uYaQcKyZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYs2YgZXbgzDsHNP9ezMNpvjabTee1K5ci4KnXWo7uE=;
 b=Dwl37B62i1eqWq25z0FqSp3U7SO7/6RXeU9P3YPRC3uXspZBlkBAKoZmEMuM0yUznv/AS5zKpjUB95rUMiB4pai4ex64fyst0LWH0Dk2pk3UUErFPUN9M/+zblJ+Np4H1ZcJG/aFhnkPDG6LxKUUnTiK43eIp7TuNc094LocJpA=
Received: from BYAPR08CA0015.namprd08.prod.outlook.com (2603:10b6:a03:100::28)
 by MN6PR12MB8544.namprd12.prod.outlook.com (2603:10b6:208:47f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 05:07:58 +0000
Received: from SJ1PEPF00002316.namprd03.prod.outlook.com
 (2603:10b6:a03:100:cafe::83) by BYAPR08CA0015.outlook.office365.com
 (2603:10b6:a03:100::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.13 via Frontend Transport; Mon,
 2 Feb 2026 05:07:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF00002316.mail.protection.outlook.com (10.167.242.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 05:07:57 +0000
Received: from rtg-jaguar-KRK2e.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Sun, 1 Feb
 2026 23:07:54 -0600
From: Tessita Thomas <Tessita.Thomas@amd.com>
To: <igt-dev@lists.freedesktop.org>, Vitaly Prosyak <vitaly.prosyak@amd.com>
CC: <Tessita.Thomas@amd.com>
Subject: [PATCH] tests/amdgpu/amd_jpeg_dec: Add VCN JPEG IB alignment
Date: Mon, 2 Feb 2026 10:37:38 +0530
Message-ID: <20260202050738.518285-1-Tessita.Thomas@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002316:EE_|MN6PR12MB8544:EE_
X-MS-Office365-Filtering-Correlation-Id: 56a791e3-6908-4932-f29d-08de6219078a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/C3ZwAlzGhWKw4F/i9FmGew12mxbFa4qP01cWtxT+DsVLtuJAAj47yGnMvi6?=
 =?us-ascii?Q?QX6pIqEMY6LKj6pxYm8kqA6qFaXyvv+w/o4LianLrl/xvozhQRWfkP7VO8R1?=
 =?us-ascii?Q?OtvN7VHNNthMtzhq4LXS0dPUrE+41ApS4DwvT1AJl9pXlc5gCEsR6jY13Q+r?=
 =?us-ascii?Q?z1tguwEO4O1ydHEJi6Nn+2O40YyYXFkEPJac442wA+V3nfcIsIocc+1T9A7x?=
 =?us-ascii?Q?kCagXrxy8ee9IGWDBSncau8yAgb3nRy17y/BMgB+P9AGEW9VPDYevqYojGXQ?=
 =?us-ascii?Q?sZNICCb3WNL/6sDQD/UmRf1JPPDduegdf+XTfXb3MQSiA1c/icpUgXysNI7h?=
 =?us-ascii?Q?FPKakPQwDybhu9HoRh16iwrdfb3aOmK1nAsaDmqDM8gHKcZWAurlcnckLJic?=
 =?us-ascii?Q?jgJVKapsFqJRciNXPZHw2SUGeIrxjJvZDMFt4WFrEfmA8V0SFXxkFITICKeh?=
 =?us-ascii?Q?mL29KhuMyv+R5EROoCJ/xCj0EQf8L7J9Rbj/AbrOPXoMx10GVr0MbsERL3KO?=
 =?us-ascii?Q?KqQyOJdcwtk9x+s6nTPruQu1e8MplhCV07dBnKsFIJooJDPiTA4HkL/LZ9Pz?=
 =?us-ascii?Q?Hx0HF1KeFe02habbWd/Xhn9O+Tk+NHKgZuFgRm0WrKM6Gt/Z1sFyULCsSBtr?=
 =?us-ascii?Q?oII4WAJM5eZFdrbC0p5DTpMPKq61UG46d9JLfG+SDyd2UoJE/3S+dN00IclE?=
 =?us-ascii?Q?yeDqisC2AKTIfsFiDcEPdzPMzkeKjJ5PCvVtTjzTCdXPQsgZ5h/jA7AmQR2L?=
 =?us-ascii?Q?gcQD+k20QL1ByAOa3aEJ7Jovpns+zwlJwriryeZQ8UGSGm0EtNsaUC+4DvAQ?=
 =?us-ascii?Q?JUymyNfe6kSrb8Ws01K/RVnbv6IeSQR5d4N/OJA5VRJLvArAgThLH36cCqa/?=
 =?us-ascii?Q?ZQ1WsRF1BK7endJN8Th6YvmxgRgSAC9v9oYDaJD8Y+Xi/h3BxJqGQPJ1nyWa?=
 =?us-ascii?Q?tZG+kawJN44FGzJIJW83jCPT67EUiye7LzZTlHLUvWkKrywTm0K8/lio1I6z?=
 =?us-ascii?Q?oPHbyaqbY4Xzyy0pon2bvMAVL7QXcmaT1g4E6H7tjmuHj4UFdyWlsz5r4PbU?=
 =?us-ascii?Q?G7YtySkpxqBb8G29QqVD5/Ag2PucesQB1k66KSxYEmcKWS6KW8+f7/ki/+eP?=
 =?us-ascii?Q?QhacFKH6GdxIQz1X30oSgoLBdmghZbo3PoDsPOQjxH2ozx9wp1TYgveVvSsn?=
 =?us-ascii?Q?9+WMJi3+Nc/YsA9vkmlRE8CXMI+zQutTwyWeoTpw0Sbl+a1SZsXslC03pbAt?=
 =?us-ascii?Q?M/9BQoJr6jzegVAyhE1GitIiOU6R9j89/h9+NaI/eun9rAQi/TXlroE7AtQM?=
 =?us-ascii?Q?OHEyDbZPbyF27UemlFaVb+T4gjHwBlQXJkv/Cfaco8AeaiqyQ763jdvBXaNr?=
 =?us-ascii?Q?z7HOZAfQqqIm04gkQ21I5JruPHks58t7O9fJpYsLblHw7j+JqOp4RT9ShqDd?=
 =?us-ascii?Q?H6/CWy8Ju3WlSH1X7GFFNHBD62EUBnQ2RQUPRP7tknjSZqZIob7Zm5TPac+e?=
 =?us-ascii?Q?SpzsY5s0bh6ZtKXzjW4H5hbon7FWQ70N0cO+ZzuG3Jeu6m9EQTCZ5nakt+tu?=
 =?us-ascii?Q?EczxwjU2Xsh88/yRvnd8U2e0OEzhRqhNXqJgH5Crl6RxrM1OXaInNPC8Wdk6?=
 =?us-ascii?Q?D+2+zKqlL7001dAFBZiYvfHublfyKDw7J/XRwQVWjlwee90QljVAOtW7nGrz?=
 =?us-ascii?Q?GYB1QA=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rXRdsbW2ZYs5Hwt3a1i/yy4W7FB3dKTFy/PjL3kAAhe6zArId0N6kLi7cM9q09/QY+/jE5S1q5MfEJ8YrtaCT6Y9rzhTBdxwBiH1XRLIsfF67uMNNW71MnpTvPax/dj0vNM1qUTN34EeT+QELNqzyEYOOVAP4VqpN+4NWUrKOBepct214hXgzzSiBBQD927ouhvEUlbXngZQAWDRmJlCj9p+4lS521GyCI72Uk4feVFsD8uTRQQVxFXcj6mcnhQC7qcFgqrnUInMFVznHhWt48wDgyvuuatgsoMqszkTBR2DnLKHTHpSalT8sC1xzKv+poRulSkX0yCB6VmRxU2OCcVfaoZxaBoVja4piHk6O3fHgzcVAjyUW+gUV+q6yfxLUBTWLCfTWeMdQK2WMb3lbL1jhYBBb6jXR9MUoH3xuXPABA27kkQgqpakZ1hF080U
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 05:07:57.2103 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a791e3-6908-4932-f29d-08de6219078a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002316.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8544
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

VCN JPEG (VCN 4.0.5+) requires IB size to be aligned to 16 DW
(ib_pad_dw_mask = 0xF) according to hardware specification. The
current test does not align the IB before submission, which can
cause failures.

This patch adds IB alignment logic in amdgpu_cs_jpeg_decode():
- Validate initial IB count is even (required for 2-DW NOP packets)
- Pad to 16 DW alignment using 2-DW NOP packets (0x60000000/0x00000000)
- Add capacity checking to prevent IB buffer overflow
- Add assertions to catch alignment violations early

This ensures the test properly aligns IBs before calling submit(),
demonstrating correct usage pattern for VCN JPEG submissions.

Signed-off-by: Tessita Thomas <Tessita.Thomas@amd.com>
---
 tests/amdgpu/amd_jpeg_dec.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tests/amdgpu/amd_jpeg_dec.c b/tests/amdgpu/amd_jpeg_dec.c
index ed005b3a1..f0876bfe1 100644
--- a/tests/amdgpu/amd_jpeg_dec.c
+++ b/tests/amdgpu/amd_jpeg_dec.c
@@ -193,6 +193,22 @@ amdgpu_cs_jpeg_decode(amdgpu_device_handle device_handle,
 		send_cmd_target(context, dec_buf.addr + (size / 4), &idx);
 	}
 
+	/*
+	 * VCN JPEG (VCN 4.0.5+) requires IB size aligned to 16 DW.
+	 * We pad using a 2-DW NOP packet, so the initial ndw must be even.
+	 */
+	/* IB capacity in DW (IB_SIZE is in bytes, divide by 4) */
+	unsigned int ib_dw_capacity = IB_SIZE / 4;
+	igt_assert_eq(idx & 1, 0);
+
+	while (idx & 0xF) {
+		igt_assert(idx + 2 <= ib_dw_capacity);
+
+		/* 2-DW NOP packet for VCN JPEG */
+		context->ib_cpu[idx++] = 0x60000000;
+		context->ib_cpu[idx++] = 0x00000000;
+	}
+
 	amdgpu_bo_cpu_unmap(dec_buf.handle);
 	r = submit(device_handle, context, idx, AMDGPU_HW_IP_VCN_JPEG);
 	igt_assert_eq(r, 0);
-- 
2.43.0

