Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856E9C3DA64
	for <igt-dev@archiver.kernel.org>; Thu,  1 Aug 2024 10:59:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F59E10E907;
	Thu,  1 Aug 2024 10:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DMuKhonG";
	dkim-atps=neutral
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2073.outbound.protection.outlook.com [40.107.102.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63DA010E907
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Aug 2024 10:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tEIAiGkRB/FAWoPXVAJ7RiHv+A8d7/LaujGH19Ad6Cx7OTu1l1Lw9jmTvK1WJOXry5doAG+OCOTGSVW0KC4UWePHnyWSul5FlNlXlzuAJDUz9w5p1qFBffWPQz7YQLO80DJSnuxSCAWc7MiNXv0VNvT6tzlwsk9wnxfY6n1r2yTek+FH71yvpCMxJFX7OHgPncVaC5AYv6T6K+z3gC3YLAB3YZtLySMcPZ8iXxSYWTOLdQP8libRfvra/dXm1PzMRZXbzKMK2awVNoJy/MiKuXb/1KnTaWF4vkPboVVpIIJDkFlPnlIq8W5ZTqwHkQjOgnVGH0Kf4/uI6YMZxqeNhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUQUFjoX160bdKGjxVc4tlFjIyTDl+Hj2L0LBg01wI8=;
 b=kiQVz7sY2GkvBlT5WBhb9omYKZK03PwtQi9pCtXH7jbpLMY5+ABenBpfqROps2LpAG/JhrPt5IDh24cGQg5p9ROl6mu6Z9/8LwJjsgMYZEPuqCSmT7V+vaZhPMyCdbikxei8cEV2TXmjJMbtzBSKmIMsrrVD5OaOSOf3nJNiWfPSQB5tDyKcX+y5Iq7R4IP0wGL/bYE5FNaaLWuGxkD6fAnYmQstCLkvz70ySLo2FlHvHZ8gN+16M1891IT03yPGbphzjHgioLH7otGBcODtuvipv+IxZgM+G3y1QMpmneblBmTqooK9/CRp3b2ZisgN5PJOv0/OKRMUGQWBK1YbBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUQUFjoX160bdKGjxVc4tlFjIyTDl+Hj2L0LBg01wI8=;
 b=DMuKhonGVM5ROz72UoliI+HlQ15aA93MJvTd7hZwXnbrs33VAiY5/ca7YWI6pJqnIZ7ovRdpa0E5FRC9Cvpn30fJ1enV9j63sZiIS37M26f7Sz/AWEw7tfnKguD8QofuX0wkXZweziDN77vTmKtGfbyY8bWhRoBAFoxOJ2Mghsc=
Received: from MW2PR16CA0038.namprd16.prod.outlook.com (2603:10b6:907:1::15)
 by DM4PR12MB6447.namprd12.prod.outlook.com (2603:10b6:8:bf::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Thu, 1 Aug
 2024 10:59:38 +0000
Received: from SJ5PEPF000001F1.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::69) by MW2PR16CA0038.outlook.office365.com
 (2603:10b6:907:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.28 via Frontend
 Transport; Thu, 1 Aug 2024 10:59:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F1.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Thu, 1 Aug 2024 10:59:37 +0000
Received: from prike-code-pc.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 1 Aug
 2024 05:59:35 -0500
From: Prike Liang <Prike.Liang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: <Vitaly.Prosyak@amd.com>, <Jesse.Zhang@amd.com>,
 <Alexander.Deucher@amd.com>, Prike Liang <Prike.Liang@amd.com>
Subject: [PATCH] tests/amdgpu: update bad length case
Date: Thu, 1 Aug 2024 18:59:25 +0800
Message-ID: <20240801105925.2523913-1-Prike.Liang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F1:EE_|DM4PR12MB6447:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a054476-14cc-46ab-1bf7-08dcb2190938
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ageHNTygFdAuF7bOUAlWhP5WbubPZUbPdEqdECg1Mf6gEuwyMO45zkDS58Bk?=
 =?us-ascii?Q?0d66VlMIzAtxCL4ehyk32md4QE5AmVIe6zsV8D88WNZoAybUFdSqFnDhjs0I?=
 =?us-ascii?Q?iGvHppJ3SVJRR1bw1Z1VH5MdcVwQdDJXGVbtW2pzdop353V3Lek0kOh6jz8g?=
 =?us-ascii?Q?2kW0TZQx8W1teO71wBeVQJcvuAFXn13lD1GIQmgnAfdMEmI8WEj8v2mmEL0t?=
 =?us-ascii?Q?HhYjykotaKn7BFMeD6KxNsRYKdwMa20C7YaZ7+znXRRM4IAihMPG6vXDBlau?=
 =?us-ascii?Q?G/4PuueoENGbnfa9HI84u2v/uxDWB0XMseft84OU2tbIuOkYuajYl24GJt9s?=
 =?us-ascii?Q?nAM3FYFd0eRyHSrJs30/bOirhUc2caBkMnDeBvPHs0bj2BKk8AOMSOnhFsGB?=
 =?us-ascii?Q?Pnf8k3LS0udi4hcXhDooXSCI6TMdjuClpkUko7w1jnuX826fVT27F4QUhSGI?=
 =?us-ascii?Q?dfSUNkLD9VGdJa9VRVa6LKLkkX3xKUl/D3aURvXElImh1sBCzlTuNx29+YWC?=
 =?us-ascii?Q?QTTg0/ygVRikMMQGMuUWDCGBHT4DJBvu+msofmnJ/j31Ro+M6EHMD5w1/DuO?=
 =?us-ascii?Q?H4mcGH93u+9wLTXDtsx1cn6shBjc7s2HikeaZVNCzsMOPgVUwudOSJ8K3kCP?=
 =?us-ascii?Q?WAIIXBvH8iwB8PJRlO3UPPVDRMjct9hWD9uKqECcvymTCtDxL218BhA4ltaW?=
 =?us-ascii?Q?PJzTH27y5fBoGfMP/KSW2vl4ERoVdtP56luJIa2Y4y5Ui3ZxBiUwHvpL6vTJ?=
 =?us-ascii?Q?WYAHLbmHwQlVeIUWb3F/SjLj+kal/h8GWVKvCKz39FZCek9DowDxfCkecL4h?=
 =?us-ascii?Q?2bNU8bI/oa9kQutcLeUWUOsbVQj+o57nSmTNMIMbP6ae+/uGfUUsuIB3enOx?=
 =?us-ascii?Q?ZuhJEAoCsoENrBqsnQyaxbpp2gvbgFoOtXOcrqAcuqgbYSDAjUb8hRq6ZWeU?=
 =?us-ascii?Q?TXDUZPoLxD4idoGma0arbK5JlISCq739H9twOUUGY4BpTRqdt32HVDFdCWEQ?=
 =?us-ascii?Q?LsezCLhsge4U/cIG1T/zkp5Vv0oOfWFo5md1/E76d5ZMG7JS/kQjRQ2waRJo?=
 =?us-ascii?Q?xyt0mSpTHfpEYWvsvcDdgmsD5pn6pLPaNZkMXPIwOLN7/2GuEmjyxD/rDzOe?=
 =?us-ascii?Q?H6NQ0Tdt+j1W+Cig782EDQVtGiDAPeX0LihLM2c3f52TAIbrFqe263WN5+C8?=
 =?us-ascii?Q?wPTDCMOaxKqEZ4rQbknIu3KvqqBXDnES1aIjD6vz/youd/BknNu8/T4G0MOK?=
 =?us-ascii?Q?apqMn6tET/qxbkEKI4cu7AoF7QKsLBfZtX+Hzi5LqFn4L9gb8FWjXkPU9Y7r?=
 =?us-ascii?Q?oLgBfdl52WZcgRZUOOmRJ0LhyLefXVUJ0nwsaUB7/qXu0v+sa3w7EobsSpcW?=
 =?us-ascii?Q?knifRGYNLyRTb8nrhckEF3ZS1LP6L+xEXAlRLDg5WHF+FUclVjgxVVmbX0tX?=
 =?us-ascii?Q?7qKf5ggDtzEXkwdkXzGnPjU6ZWgAGnSJ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 10:59:37.6803 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a054476-14cc-46ab-1bf7-08dcb2190938
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001F1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6447
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
index f675b97dd..3ffacc065 100644
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
+	if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
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

