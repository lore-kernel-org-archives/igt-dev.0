Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A07FF513A
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 02:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C237010E05D;
	Wed,  8 Apr 2026 02:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tgZOPdgj";
	dkim-atps=neutral
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013046.outbound.protection.outlook.com
 [40.93.196.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE24310E05D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 02:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5Ked7mk2HIRdCasf/pO2K0uYWjZ36iA02HMtmT+nhxj5wvLXuzFgtsoIv621eoX6PMxts1/ZVSeZoBSoRpOFyfAf3yXTm4nEukBqvC6ZdqWoJKvxx7IrIU7qeUpHhOWH8KHNsVcJGHALfhTCrsawts2/57fmFGIGldKtJW8f92cpBpKeQl8TBQ3zEeOlLMnxGrhFe8vDibDyfZNwuSNy2GFrbtr2KfG0bMhNFMbvdcJnvo5Lcjd/77wKd8DlLN10kR7YneyM6/Gjg51nHvlQtLETS4ldrSQI4HUijtsiq4QnT0OO5qEGc35dC1mNQiomjz2D1DDOLCPC2tJbsCzng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WqASCYlQt4UCGky71FOCw8A2Boqj3fG2XtTNBWLZGHc=;
 b=LItkQbjACVX5L4+xO1XxRvaYTxgHiRogmqNx6bE7IbemQkl+/+iZOZd9iDSHc+bmy/Gru/5DZbnESf358Ll5KYcQEvQTsPMJWVUas4exaPaS3YjwXSgwGlRtPHGP0cEVOq5s0m1Mq4XAPe8f92HQv40LvcmIZUemdS1Ve8qBZAtR5eNf+PuZXzJMfbkdUhwvKucLvOWrQ8+ycMAq51bi+8y5qppYspn15CfYoPb7TugVdIaJdyws1rGpSgod//q8vPJ6ONkcXCKR5nLaca1O+25iXgJsKCzx+z45bp6E1ygAcPEj+2QkqfPSEW9FTQ8M/8prTntAnVexd8wPJKwpmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WqASCYlQt4UCGky71FOCw8A2Boqj3fG2XtTNBWLZGHc=;
 b=tgZOPdgjL+orqscr2j0Nddppp3LhNkj1FB6XOnCATxpA7tPNzB20weEanYGntsNrAWoYEmKgjZB2/sXcnMdLyU9X1FqFRhfe9xQnKhQzSGUzFkxL9WKfACqmijwVfgvaJKsvIsFBtvY3qe05VlxovU/pYjr5NE+cMJDzqM60l/w=
Received: from SJ0PR03CA0265.namprd03.prod.outlook.com (2603:10b6:a03:3a0::30)
 by DM3PR12MB9433.namprd12.prod.outlook.com (2603:10b6:0:47::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 02:48:27 +0000
Received: from MWH0EPF000A6733.namprd04.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::5f) by SJ0PR03CA0265.outlook.office365.com
 (2603:10b6:a03:3a0::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.33 via Frontend Transport; Wed,
 8 Apr 2026 02:48:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000A6733.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 02:48:26 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Tue, 7 Apr
 2026 21:48:25 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 7 Apr
 2026 21:48:24 -0500
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Apr 2026 21:48:23 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 2/2] tests/amdgpu: add string mapping for oversized
 packet length error
Date: Wed, 8 Apr 2026 10:47:58 +0800
Message-ID: <20260408024821.2515174-2-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260408024821.2515174-1-Jesse.Zhang@amd.com>
References: <20260408024821.2515174-1-Jesse.Zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: Jesse.Zhang@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6733:EE_|DM3PR12MB9433:EE_
X-MS-Office365-Filtering-Correlation-Id: 87b8c438-381e-4fde-7361-08de95194ec9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700016|82310400026|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1xtsona9NEUSDNN0BJvjGUcYJhsVNYltBrGPd9q2OskbmLi39ccMd4MfH4Er5v+K4o144X+MW6nrC/cP9dHM2yVbQr63l1qZbeSVNAfEEcRpritc51Q1wp7otQLbUAddpWZgUWfop92Jc51TYNrXQgf0dV06Ek4GkGj7Y7JC31zuE0C+51uak1wtI8tooY8SjrUEWU1B4WaJVuFavsDfDkgdxKwf1o5eiycV8yL2evNmbjJBp76RljfAAR6aNb6xK4+2Py56uaxT3V9RjHwzN8AfeCPO5lFZOCL8DJtQRNO3OgvmHt6c7TyolBPmbL9NBfypy4dOebiTeEUBVpOTKWl/QYpEHQxm46B0mxP70SwhgkXVk71k1yK7v1bWc2k6OoE+gWz9LhnnDEoEwlXz5PTktFuc8zUsVO8cCpfhubUq5Ad5+bCu7bamqFiSkNaLaFFQ8e2/ugtwGCq5CMj709fY95YijJ7B6j0mW9antgXlRH+RvFhPlgAScJoDSe5xvdFZF2z4cH4vO4iHlB3nptuVaEsqV2/3JjOn8ds4n1fyIhtyg35FueMpk6J0Ei10OM4PahNlTBcQfPaUtr3OT3EG0MQ4VZyAgfmlSPxs5YcBUk78gXJ0pwFsLkLfXPl5z9UvElbzSrOFYyH8Sw5z8TndW0Em9gv0G9g9LeipJJ4nqwC9vUcumwZkB72R3E7x+I1M9pggsc9aerK23SDQe6Ze/H7RaOzlWBYJHGdLnZQEDSr49zxmDLfTmePZ6Z5v7tgnoMvI9VmQM4dvq064zA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700016)(82310400026)(1800799024)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: YqisVIa3oKGpSqV1KyWJvhacW341PrjDDGWzuV6TCJhu9y27re+33V21Izr+stlT1yoJg7udg/eBCao9l0mkZJmUNFwcCU+dJInS9/dvRjYbvJNOHmBcMJe5Je5ffFLIEhSnXHHzlHYqpv4IDKSsdHouBRd9yQlxxyxx0bxDd5QfbBp9c05Wc/kdHlPDemPArN9aanZR1HeVo94493QSrLWYVvEXUQRiZmNMrcVKJKt9IXRtGrZs/hFahrvM8aU1R8E4hNZwJBlWhA74cy+HqVgJiq+oc0L+8GMYuEFOOsNkpdWEmL8xfpoA+0bCMjG1ysly6Yk+r8sObTi9nBUu61VLRdKBqW9IYiVWknmylIeajo5p3Mh/t+TNVEF1ACxNT8lfkX/v8SPql9zemtk5HY/E+1AnVHJ36LNGYKYklB5kgDUOi3rYEzRFnwXTLE1Y
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 02:48:26.0384 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87b8c438-381e-4fde-7361-08de95194ec9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6733.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9433
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

Extend queue-reset error string table with the new
CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE enum.

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 tests/amdgpu/amd_queue_reset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/amdgpu/amd_queue_reset.c b/tests/amdgpu/amd_queue_reset.c
index 7cd2ff79a..73a99bb89 100644
--- a/tests/amdgpu/amd_queue_reset.c
+++ b/tests/amdgpu/amd_queue_reset.c
@@ -264,6 +264,7 @@ is_dispatch_shader_test(unsigned int err, char error_str[128], bool *is_dispatch
 		{ CMD_STREAM_EXEC_SUCCESS,                   false, "CMD_STREAM_EXEC_SUCCESS" },
 		{ CMD_STREAM_EXEC_INVALID_OPCODE,            false, "CMD_STREAM_EXEC_INVALID_OPCODE" },
 		{ CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,     false, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH" },
+		{ CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE, false, "CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE" },
 		{ CMD_STREAM_EXEC_INVALID_PACKET_EOP_QUEUE,  false, "CMD_STREAM_EXEC_INVALID_PACKET_EOP_QUEUE" },
 		{ CMD_STREAM_TRANS_BAD_REG_ADDRESS,          false, "CMD_STREAM_TRANS_BAD_REG_ADDRESS" },
 		{ CMD_STREAM_TRANS_BAD_MEM_ADDRESS,          false, "CMD_STREAM_TRANS_BAD_MEM_ADDRESS" },
-- 
2.49.0

