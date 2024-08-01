Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A96AC3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:10:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C854410E8F0;
	Thu,  1 Aug 2024 10:10:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kO78SkYA";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDE110E8F0
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:10:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWxQz/7rh78lB4cDJZ4gYbZQC852SWi0LS+erQ709vF19e4C2qstmbb4y2nTPZ9S7Ou1JB5Trp2z4Np0KshWxve7ZW+Owj38Q1CXViARWtYDKQaJKCTLumDDpGaNVpakAh78+yUckOdWPwgToAiHVDGweEwfh8kx8yr94gBn3UOTdYudXIDkFeIv/8/zwyb+RtjqNfp/e+cP+Embbb8K9RCeZx+UF2d0fz5O27mv1TEVwtyQVK1Vjn98YqHS3tKYc1v7wDfKXtcIoJvoZYhqim9iJ3esPAwemP0vefJscK0DEITon4C/jliPV76tnM2UmCOicAu8g09FSb4+WAQQoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VtUNSkCK5xZBfeiS5mRjpizxSVsBPRAUbvgUKC2ZQDc=;
 b=OUMtnRDH2kV9IAg+XBD98SenMh/wxXCzNZTXlvknPv1TWLhs9sQT1ihAjaSseIyqSnE0kj2OhxQgeRd4nu1RZqHiDkvKkgzLQpTzR6ZjbUq/wiT1K6LKXURkJ7K5oqjduDkQnWzHHwPbC0fGuJ5i8L2eTbDmKKhv8Q1aaZzG9li1SaZaBYAfFYPhQn/0AjVO73e9wHzrDOvDUJSTWurrSzE6dpQ4JeEHOpvIq90g/A9T80FH6MPcfLnIL1iVOu1tE7TTY5cvMjlGn0F+ke1PKbqj2f3zUIzK91gUETAAsQrGuRBmvdi0+WeKk26e9UkDqy0j6u3mzWTa/Qpq2pB7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VtUNSkCK5xZBfeiS5mRjpizxSVsBPRAUbvgUKC2ZQDc=;
 b=kO78SkYAZAMDJzua9Z/zx/vDw2X9ZBttTBLg4Z0CowiAqP1VZ5KEN+uWzL6Gz1Zv6/FqeVux2Z2gNcuu/RwjnbiSIX/8dnLViMJc40QtnILMgmyGDvhg+/qBBboGhYI8Dy200iP0SIL3wHyBnV+ajzBYALEcwIXzcnCHSXKK9ac=
Received: from CH2PR19CA0001.namprd19.prod.outlook.com (2603:10b6:610:4d::11)
 by DM4PR12MB7741.namprd12.prod.outlook.com (2603:10b6:8:103::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 09:55:52 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:4d:cafe::f8) by CH2PR19CA0001.outlook.office365.com
 (2603:10b6:610:4d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.22 via Frontend
 Transport; Thu, 1 Aug 2024 09:55:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 09:55:52 +0000
Received: from prike-code-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 04:55:49 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Vitaly.Prosyak@amd.com>, <Jesse.Zhang@amd.com>,
 <Alexander.Deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Subject: [PATCH] tests/amdgpu: update bad length case
Date: Thu, 1 Aug 2024 17:55:40 +0800
Message-ID: <20240801095540.2517506-1-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|DM4PR12MB7741:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f9a130e-f6ab-485c-6975-08dcb210212e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ux3IURFKvLd3eTAofKBVHgyhpgv0vrqg1DxSDimSr1ct68D6OuP23t0cglzx?=
 =?us-ascii?Q?oIhah5HCBevk6WwCnfBMkU1XVUHaRAv4xplOayExww586i8khvl3GvSkRsHN?=
 =?us-ascii?Q?vnIMHMLPBSLK9EOuoqMUnjRdIyDolQVGLOQkhbc/M53EI4yZ4bpJxKjZDp1y?=
 =?us-ascii?Q?K50g7U5NAbpVfPpO6DB1ONTuVnDsPiVo/x1onxUcUnvQeQhmMI8YY+Xn28Ds?=
 =?us-ascii?Q?NHwbZhfjnD4Ik2yCtyjdALjZ+TCNt4AFivPgqm8mZN9hKJHKzU18soNztVoc?=
 =?us-ascii?Q?fp7d/kOtUHf0zJbjCVrLstOJNsS+ogj8QGshTJgPbYSH9nkpCjN9Q+m6CFQ4?=
 =?us-ascii?Q?4/mm2JzoAGtzP15h4es5OMKuOgfoYlNuu17H3ZpdJV7dgdbe0Y3vpkP1Oqk+?=
 =?us-ascii?Q?7nAZ0AO39gchUK3mmHkLqwNi1mV7ZapM4p3EQxcdD4QpamP1SiLGov45Aepz?=
 =?us-ascii?Q?vdh2b3Jv5FWKJFflEgSOZnrbvpN3UrXbJD2mbgNeo0whzms/MS2BnQK/qylJ?=
 =?us-ascii?Q?c9m44Tv3NFTkWfurSOfw2tLti4uEjHr+S2YEZEkstX/d1rMyMMu6HhCnmUZi?=
 =?us-ascii?Q?lG6MBbTz8Vj6MJWNP8BGGNgZS6fO4wfx6+EumJsjEbpyEG5FSy1iJPJkuhva?=
 =?us-ascii?Q?CgGlAPfS0feJDlXzWqWdQktcrOy1j7M9Q1UOcJobYaj/aJa8/nmux+xZkUoD?=
 =?us-ascii?Q?laQ7eZkvm122pc4Hj81izIcwJBrf6ksUAcFgpCeOk6uuGk/vmi9S7HUv1ZHP?=
 =?us-ascii?Q?Yz9eHIibOvqab96LefAcOlTcbkDezv8Uwn33xHqH83sXG9PcN45qzEK6UaYX?=
 =?us-ascii?Q?ROz7QiN5SBuVDvmIlh9Uv3YSN1O3XhgVuF7LpJ2PF6gKYoj0fpaDYPUGY2/B?=
 =?us-ascii?Q?MMWubZtgAiuHky+Ohh7owqWy8uIeCdrZrAvwE8H4/aaRLNZAy6RSMG4WSCmC?=
 =?us-ascii?Q?2BB69jXAbkdDW0i+sbe6uGttvX+GS/sHqmo7cH8D3+HBEZleYIj/ILoCb3iA?=
 =?us-ascii?Q?kEIDLcuBkRFOakoazaCCXNjHo6pX08iuATWcK0/Bb41N7PdSb5gxHAYZfUOg?=
 =?us-ascii?Q?BMr6uq4uVL+AgZLUhjgxSkmMqqekvqJH2C8mk4wBAG0/yyYelVs8wnaGmzh3?=
 =?us-ascii?Q?n4ctE0Iqs6JYiRqF+RQAX37ghmhdGZOdmwX98ZZ/sg+sq+LS0sA30uj+goXg?=
 =?us-ascii?Q?dzwYJqi5G5FNh7LOdM7tJ4pWFc1zPKwG9+xnJ+6MpuPo5V82tCRa96KhSmfb?=
 =?us-ascii?Q?JLIrEmkAAnietVEDwO+MQl1oQo6JjYY/WJC1r3wMxwsDumnKIEOGFUlAlyAZ?=
 =?us-ascii?Q?H6irT1kACp8eA4cPcA+tOYIwMt2C33wYqz9+MAOQXiZFDWMxdh/YJeEjYQxd?=
 =?us-ascii?Q?6AaVRrNE+HDD6wz56QFOXLWXQFDEgyRi6FXMW2SttHdU7f1GqX56cEMgzHDu?=
 =?us-ascii?Q?P/XS43DRa8p2KtMsDfl/Oc4BpUVZRxwP?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:55:52.4428 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9a130e-f6ab-485c-6975-08dcb210212e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7741
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

In the bad length case, when the header length has more than 4dwords than
packet stream length then CPFW will pending on the stream data and raise a
CP halt error which requires do the pipe reset. As to the orignal case
of header length is smaller than PM4 stream length then the PM4 stream
data may will create a bad opcode error which only requires the queue
reset. So for testing the pipe reset need to update the header length
bigger than the PM4 stream data length.

Signed-off-by: Prike Liang <Prike.Liang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index f675b97dd..503b68431 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -189,7 +189,7 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 		      const struct amdgpu_ring_context *ring_context,
 		      uint32_t *pm4_dw, unsigned int cmd_error)
 {
-	uint32_t i, j;
+	uint32_t i, j, stream_length;
 
 	i = 0;
 	j = 0;
@@ -198,6 +198,11 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 	  * But the range applies to all asics.
 	  * 0xcb-0xcf, 0xd2-0xef, 0xf1-0xfb
 	  */
+	if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
+		stream_length = ring_context->write_length / 16;
+	else
+		stream_length = ring_context->write_length;
+
 	if (cmd_error == CMD_STREAM_EXEC_INVALID_OPCODE)
 		ring_context->pm4[i++] = PACKET3(0xf2, 2 +  ring_context->write_length);
 	else if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
@@ -223,7 +228,7 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 		ring_context->pm4[i++] = upper_32_bits(ring_context->bo_mc);
 	}
 
-	while (j++ < ring_context->write_length)
+	while (j++ < stream_length)
 		ring_context->pm4[i++] = func->deadbeaf;
 	*pm4_dw = i;
 	return i;
-- 
2.34.1

