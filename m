Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 650C2CAC5B5
	for <igt-dev@archiver.kernel.org>; Thu, 25 Sep 2025 21:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1623510E2DC;
	Thu, 25 Sep 2025 21:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="jw1aNy+g";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012066.outbound.protection.outlook.com [52.101.43.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3365810E2DC
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Sep 2025 21:01:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HbNTHCC3l5I2Uboex/vaPiFB6Hl/owf4wHqtegfUKaOgvB6AHM4xlj83L5kspDtOuy9/OKjPBVfRLTVvZ0kOzwu0FA2t04IuzCsXw7ecXED2J0Ldq7GO6v3yfoRwJ7cZHy8JVu7/QRyiJCcPLZ+0YorngQZ1oWiWd5Ic1HAp3eUz418OZO5vWCEqrrFC3ETvG/Y7h2THtAHB3N+tQVL8z4ZOhtbUlqgOsJTt7AFm710vH9lvErDL7IyDiRkeSbDAT/JwccTP3nrb0EhugoMviMLfQhBdkTV3DwBIXm152dJOcGt2nzpU3teLC3aZSljwLbFGjUYcHAJuDgiXJ4y5vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cubkbS/aejeXFpvFAUoM3RckQ9PuaPOjguqXa3MTKLg=;
 b=pqp30zMULhj2py9ykJJUhP2BOIyReIYYbeWdLP0g9so7mkyNEIaEJCTkjqvs84NZB3OqPmRPb2Ggk41m94caSi1sKPpey5XIoXXX7DdiGlByuFOHbnP0czjfWvgtEeA4PbX899EpfFPrZ/J7FyQi8qwwMqZqES/HvUR/I9u5D1W0gkywLtmwN4L7yipDnUTUZD9DbCmjN3x8FNY/TElabs+lHTCp2q8XRbgHam2ZUglg7Nn1QfLkkY6+Y47WTnv20q77ISM/rn0EB7resz9HA+eF7lABHrblJA+5aAIAOXotp33DoRZI4BznpW8nbYv0dT5HU/eSRSrrRL9tBXRdtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cubkbS/aejeXFpvFAUoM3RckQ9PuaPOjguqXa3MTKLg=;
 b=jw1aNy+gY5lWgAg/ZQ2WCAWkYdXEkK2+hXBOf6Y7oI26KJbpCvFAZmuILFp28AiN+ijPpbr2ntwVZUwzl/lVMfm2RtE1ZnZIPtyrQMcP8Fda+M+eyrYncyyscHVHyj11drcA8pBh0ZlCzx3XLAvbCjv2pRy7BYcQNX0xm53a5Ig=
Received: from CH2PR05CA0018.namprd05.prod.outlook.com (2603:10b6:610::31) by
 IA1PR12MB6164.namprd12.prod.outlook.com (2603:10b6:208:3e8::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.10; Thu, 25 Sep 2025 21:01:00 +0000
Received: from CH2PEPF00000143.namprd02.prod.outlook.com
 (2603:10b6:610:0:cafe::5c) by CH2PR05CA0018.outlook.office365.com
 (2603:10b6:610::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9182.4 via Frontend Transport; Thu,
 25 Sep 2025 21:01:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF00000143.mail.protection.outlook.com (10.167.244.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 25 Sep 2025 21:01:00 +0000
Received: from yinjiyao-dev24.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 25 Sep
 2025 14:00:59 -0700
From: Yinjie Yao <yinjie.yao@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Yinjie Yao <yinjie.yao@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
Subject: [PATCH 3/3] Revert "lib/amdgpu: Temporarily skip VCN ENC/DEC tests
 for RX 7600 until proper fix"
Date: Thu, 25 Sep 2025 16:59:02 -0400
Message-ID: <20250925205946.324277-4-yinjie.yao@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250925205946.324277-2-yinjie.yao@amd.com>
References: <20250925205946.324277-2-yinjie.yao@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000143:EE_|IA1PR12MB6164:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e4082f7-f929-4d64-e09d-08ddfc76a1a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DHV2tHJn3PFXNb7Npc3q61WJDZ/br1gq0ezi3VK1GDTJxgC5VbH4XCOXM+am?=
 =?us-ascii?Q?LFo58U6xh7SCPus2CRUBMz0mG7e3KnWa01iE6NKGtV/o85WTnuY3QlQ8T7OK?=
 =?us-ascii?Q?2CwX6YG1gNpC+AWPgkB6lc6qYqeBVjlvl/XVIKdG8eqfN4G4j34msaUALnPW?=
 =?us-ascii?Q?TA/IrI/UEpDVLTkK7PeD9GhDuh53OVAqxUS+IxZxhzMqdMaVz0SOaMvKuRDg?=
 =?us-ascii?Q?uK+9kK/ALeRX+fNQoBdhF4Y1FNHH+UkPqnglua2IFHKOM9dlVg+3GvF/yvYx?=
 =?us-ascii?Q?2img+UHkq7tQrfKcuRBLn0AB1/QVJg2tbSw80tsdCCEBe6iVXfpfTMLyvKdY?=
 =?us-ascii?Q?5KvWAJLBWf+0uc2jdjMkxXUSTX0s6xECc9sGaU8tT+b5vbltOBq0KGMsqVjk?=
 =?us-ascii?Q?LHnURROzo5YTy/w0PP57tHe2mdCawiEXC0LM6jTSJ3PJf/C8g5JESkaWoBre?=
 =?us-ascii?Q?cGrBL90qyCEoP0sg0Md/GQvn/4YDQrQ+65yP7uu6uruDg1LBFg7VB9BchbXI?=
 =?us-ascii?Q?ushDcjDg0BYOX/fGO9D9ZcqLE5nk5RaY6tNIjLAzYiE9ex1tbiQEreDljIEw?=
 =?us-ascii?Q?NKW9fnPTmbK2ARwN19s89b6wCrVOm9G6fMFCS1tUbehkdLkEah3GPBRoedbm?=
 =?us-ascii?Q?NyKMY9GJOXfgUbEKMNl2s7/RfB7s5w3vPozCnvHFVNbvpdmx3LHKiMj3YIZD?=
 =?us-ascii?Q?bXxvHJDviYuGsN7THxji4p75+TTe2tVXA6Pi1h8hi93TWQW2jh8HfDTKiDUV?=
 =?us-ascii?Q?urJ5X+nfjqqEtZmnxiKRszVuBHkmcRXx03ld1cKg7k8VAWjw4F0c/cwhLPrW?=
 =?us-ascii?Q?UTl+YbvmQpsjevvEcbEGQxANANWuR4kVtnnMxmcOTIK964uKGKj0IIBF3hnT?=
 =?us-ascii?Q?8C6spacWKPJE1Ph6e39rMw73b9j7hVe1CIA70KuyUn/fdbqGl8esVp/Pqz0V?=
 =?us-ascii?Q?5EDkx9yS3rA8Wk4nN4ok0/SZILn8ftVxhp3hrg7do2cuEW/Fj/7Deh7PCsKf?=
 =?us-ascii?Q?aKPx4GrR0Rj31UkkvLVx3TbL9rwYxOeiAJqhTOd7HTnN2vpD34IeHvSKGowy?=
 =?us-ascii?Q?cfMHt6yNs664eehNlhjMuPS6ENPuRmClPckcME3Sett0TeDF1AS/D0OjqjLk?=
 =?us-ascii?Q?TlSsOxjzdbQnCfQDepSjspF6yLysSZnlyisu9aw+KDl8TTABUU+yJ585zKdV?=
 =?us-ascii?Q?uqftvwp0RN9Wf1l5xMIoWw8+Yp7sdYuJuqBrYPJxnlVIr80R8LXn5/NiVT2r?=
 =?us-ascii?Q?MG+xVUk93+Ydj61/igc/fuzUinQCrNA0Fk0Gblh34S8tfnNY9O5D2fX9xaWB?=
 =?us-ascii?Q?MKLHqPJAkZEdqh+Leq7Eh51+th3OhyMwsvB0K+3ul0o06mkR9JejLsyyErTk?=
 =?us-ascii?Q?E4HFTizYAXD6TjYhkm8cvnlkVwNw7Wr7lmfdMIuAvL11TMVIdiLK321vToxK?=
 =?us-ascii?Q?C4o3gCmhdjJqj4hUHw8ZxZOhUoipBjJyvzt+Eri6Wlci+s4u07i81FGlgIhL?=
 =?us-ascii?Q?SJCgdFq5drc/am8iPpp9lFIYlCDWkq7hcAjq/8bsbYUNI2e4UcbnbRtU3bIC?=
 =?us-ascii?Q?/KzoikvMHcv+hhS4x4g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2025 21:01:00.4476 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e4082f7-f929-4d64-e09d-08ddfc76a1a8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000143.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6164
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

This reverts commit 3be9db4e3fe89e35b67037cb2bdb6e34e85cae26.

Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Signed-off-by: Yinjie Yao <yinjie.yao@amd.com>
---
 lib/amdgpu/amd_vcn_shared.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
index 32766c0b4..3888ec112 100644
--- a/lib/amdgpu/amd_vcn_shared.c
+++ b/lib/amdgpu/amd_vcn_shared.c
@@ -59,13 +59,6 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
 		context->vcn_reg_index = 2;
 	}

-	/* Skip VCN tests on Radeon RX9000  (GFX12, family_id = 152) */
-	if (context->family_id == AMDGPU_FAMILY_GC_12_0_0 ) {
-		igt_info("Skipping VCN tests on GFX12 RX9000 (family_id = 152)\n");
-		return false;
-	}
-
-
 	return true;
 }

@@ -195,4 +188,4 @@ vcn_dec_cmd(struct mmd_shared_context *shared_context,
 	default:
 		igt_info("Not Supported!\n");
 	}
-}
+}
\ No newline at end of file
--
2.43.0

