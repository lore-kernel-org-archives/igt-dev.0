Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F833105D996
	for <igt-dev@archiver.kernel.org>; Wed,  8 Apr 2026 02:48:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48CA10E05D;
	Wed,  8 Apr 2026 02:48:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="H8SWNUBZ";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012064.outbound.protection.outlook.com
 [40.107.200.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D18610E05D
 for <igt-dev@lists.freedesktop.org>; Wed,  8 Apr 2026 02:48:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aytj0vOgGDutFxt2Y69lPj2wondOIY0xS8GQE3AtbV0HwcHGPTAmCxYMTJXFmrWRX4kWINDvMeZ9tMrFn8YFJ7JSoqX4xqaf3TAJXF8ADLIh8sI+Nkqt54oq8Gu+sbhI4VQbKCddT8zllsotsupMJBH1Gn5MakotBgnjCWZC4hkU9aiskomygTw9E9+lg2J0F3FrJ0XoH0rEGcqpv/sd30HTdy8SFhvvNvt7n+qxYF+wbm1QmWHsNswtDfheNSignGvgPH1qcDO5lU7L04R2KUQYs7ZJkJgBnrleaGsWmYqjUPZXHPzBee6eIx/ettDLwJJsmKk8V+cNsdPikj8Fpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJsXBul2KMg30IQB5nB/F/YpZPC2YFzTRA81wJP8IXI=;
 b=RItPyQ44MDaWI/loAFJK59dfgnmS7dCBzzbcEPiZ6n+wY0N1CAWHKobWh0hwJe+pRoZsYSjx9r1M0IMv5zGOLwL4lu1mmFh0TTVwZFJ3qkoe4zxOyT8rJPN3tjNcD4lJwnZcozOxGWUdu6fSz0HaQYslwZW/r9i6UsrVPXdSECZvpYkrIRDotbXC1MjW7SHU3J5H1rAVxknnGdFqQM/O2lBEG5XwhDYjGXR6F3Z6ltBPcgSjGSjwJgFti8H5BP82qllhlT0KTuh2XjJRtUEBbHIZUB0tI3XpnHbKSxoNJ85uBTkSNvcP2AmUaypxfn4MSkg57dpIBoFuO9HG4+eTOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJsXBul2KMg30IQB5nB/F/YpZPC2YFzTRA81wJP8IXI=;
 b=H8SWNUBZAqAGrxpQFwcb8v7MG0F2cIK7ICJzsyY1tJg+cxt5C7Zqg335cAyt9PP2adAA6kaBiXtuHLSpFcnOJAttbejF1ZjrZ0QJRIH+oe58IKnBqfxMuOdqE3Gqcb5JBfCh7JYmjExotLhCou/A3I+BIqB4+dzF00ayG/LgfJs=
Received: from CH2PR05CA0058.namprd05.prod.outlook.com (2603:10b6:610:38::35)
 by LV8PR12MB9335.namprd12.prod.outlook.com (2603:10b6:408:1fc::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Wed, 8 Apr
 2026 02:48:25 +0000
Received: from DS2PEPF000061C4.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::4a) by CH2PR05CA0058.outlook.office365.com
 (2603:10b6:610:38::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.32 via Frontend Transport; Wed,
 8 Apr 2026 02:48:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS2PEPF000061C4.mail.protection.outlook.com (10.167.23.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Wed, 8 Apr 2026 02:48:24 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Apr
 2026 21:48:23 -0500
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 7 Apr
 2026 19:48:23 -0700
Received: from JesseDEV.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 7 Apr 2026 21:48:21 -0500
From: Jesse Zhang <Jesse.Zhang@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian Koenig <christian.koenig@amd.com>,
 Jesse Zhang <Jesse.Zhang@amd.com>
Subject: [PATCH i-g-t 1/2] lib/amdgpu: add oversized invalid packet length
 error handling
Date: Wed, 8 Apr 2026 10:47:57 +0800
Message-ID: <20260408024821.2515174-1-Jesse.Zhang@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF000061C4:EE_|LV8PR12MB9335:EE_
X-MS-Office365-Filtering-Correlation-Id: cff9e2c9-9be7-4bb6-a628-08de95194da8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: TAR7JaSG5mNExkRbwSqP/LoXZtI5WURPVpIjFQxT262H7z6MGYW1TXcwESV5tmA4YZjSSWG0GGEPy5etPPjfoj8cOtU1Y/h177TgAENhdKiL67V5ll4Wq0T5xTNl3xWPYGd0JUPaCuPNx9ZHvPufS7nujQxLClP68OR6+Lc9uLWI3GqTzsxI4oFcSc3VRB3EH5mhfUR7gciVu0zD2hAozC6qVRYk7/pGN/qyNG8Qkp9te+8KIaLTgasjt5dtXJa4DgYQIJ9Qc4uLf+Wgg/DtL4uz9vwC+LuORNOmE19iDeqiove9VxHMXkyHR2JrWWCWSyLa02x2Br5X4NHDOAocgUms3x+A0/odSYLPzICToPHCEdW+EdiD6ashYkvT+vQG78PHZt0VTeeOzA3aNxaJ4dXU/tGjgC0+fI3LseUWJqA87HteFcU1+T/DwgfQOrghlmXJ1kxsSHypa7FbjHoPS5bdXqwsNBa0ZuOrKfelu+/CkkVFZ6/ExQkT/8HpEPgP1WM1XlLRk6L5A4B/3+ou6hICb6+qY1of9BMfoWHYMIeYfo/7HUuQefJ7xcz+bg1fBbDzOViwVq3t58Ayz2wSIftCxYOiG22v8G2NcXuY49jGFC4hqDDVOFyjcvhJni63L3212iBBWhmRFOTygmWH435R9Kcji7qY9y19DKlSHL58/SK+RPKtBDKnoEJFNk27KpBhVID89n7gZM2UR9yCKI1ie4SOdhxjjJOjl4YtF95AcHvEwRycRMuU9APVNp6i9/yghpF5daju+drAXZuKsg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(56012099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: eEBVYWQnc2VzBNvj3tfobDMTeNK7ZcpEUtGkg+PDD/XQwr/YfWaotENtWMeccDCVPsB6qNQuG9fo8dFzp/1rFDf7nPcVXUt6GMe7iJ42Jp1WQbSGorplfwOHTTvZH0wRsu0iUYuJxN4yj0oFoJJgDlp2ICP8l9fb7JHOdBowpjNNK+Qq6DwBGzitlnbTC2jnAsC+/wIemGbtmBpLkrKEf3kokK2pxb09xVpnzUQGb0UxbkRUVn3TMDt886DcyA4v6LYQH8D1jl50rSt/y2MRejnqd9F6eiYel+/ZcCmfTYqrys4qCt9RFrN5Yanzh8Jp15hYGv+kclp1xxWzwHtBa7lohptDtHLsJK5TM0S5+8/R+QkF0OA4imK3LPFRKq8WzmfzjXEZK+sKG9CXBpHO9pKtQdDh5Uuw7pi7rJBUqmY5G+ReSzKkC/yxob0DNakE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2026 02:48:24.2122 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cff9e2c9-9be7-4bb6-a628-08de95194da8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF000061C4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9335
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

Add a dedicated cmd error type for oversized packet length and handle
it in gfx_ring_bad_write_linear().

- add CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE to cmd_error_type
- in gfx_ring_bad_write_linear(), map this error to:
  stream_length = ring_context->write_length * 2
- keep existing invalid-short-length path unchanged

Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
---
 lib/amdgpu/amd_ip_blocks.c | 2 ++
 lib/amdgpu/amd_ip_blocks.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/lib/amdgpu/amd_ip_blocks.c b/lib/amdgpu/amd_ip_blocks.c
index f0376a3e7..80aa5569c 100644
--- a/lib/amdgpu/amd_ip_blocks.c
+++ b/lib/amdgpu/amd_ip_blocks.c
@@ -284,6 +284,8 @@ gfx_ring_bad_write_linear(const struct amdgpu_ip_funcs *func,
 	  */
 	if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH)
 		stream_length = ring_context->write_length / 16;
+	else if (cmd_error == CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE)
+		stream_length = ring_context->write_length * 2;
 	else
 		stream_length = ring_context->write_length;
 
diff --git a/lib/amdgpu/amd_ip_blocks.h b/lib/amdgpu/amd_ip_blocks.h
index 6bc8c3706..eb118c68a 100644
--- a/lib/amdgpu/amd_ip_blocks.h
+++ b/lib/amdgpu/amd_ip_blocks.h
@@ -146,6 +146,7 @@ enum  cmd_error_type {
 	CMD_STREAM_EXEC_SUCCESS,
 	CMD_STREAM_EXEC_INVALID_OPCODE,
 	CMD_STREAM_EXEC_INVALID_PACKET_LENGTH,
+	CMD_STREAM_EXEC_INVALID_PACKET_LENGTH_OVERSIZE,
 	CMD_STREAM_EXEC_INVALID_PACKET_EOP_QUEUE,
 	CMD_STREAM_TRANS_BAD_REG_ADDRESS,
 	CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
-- 
2.49.0

