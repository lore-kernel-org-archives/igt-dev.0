Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C69C52D6F
	for <igt-dev@archiver.kernel.org>; Tue,  6 Aug 2024 23:39:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB8F10E41B;
	Tue,  6 Aug 2024 23:39:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nvMUZgad";
	dkim-atps=neutral
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6653C10E41B
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Aug 2024 23:39:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5cPaqhEnrOvDCdsKk121N611MKrA4sTByYD0oSCrgXxFXLcmTcSWcxetmS/cYJRZ78JG1tYMqVC3W/mR5D9YVasFf2lbNYS3fBM7jK0sYB3K54uvL+nWB60BGwq6uNEE6Z4dV0QbBMojxOjIolQl3jo5cQrKsdXZ/kEJwuImOa6rX6NJ+df0QSI5J6Ow9F4Yu0mYa5NK+CVvKlK38O+fd+RfFdS3frgaEc3njIE3NXsryTu9riFAF8quKZBQ0MB3lgRhFbs4QJ1eA+rICAAtxpXx/Gr7xOxhQLDEtVRKK0107T6NxQ5ZMAFbWssRLozjIWf2874dhwlA6gxjyys2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymq5f64NEv60PXOfatZmydNWpVFOolMyYRSJSW/Ljig=;
 b=NM0yP5AfXClMTj24FJpg2eG26/pMehvhHL33UE8MDdqfOImj1wNt3ihjR1eDzD9hMEKJzzEGuFmVyiBacJWs/G1LXlGXl/js8HQTeOL0dlte5yNe3H2UNrAlyvwPL+k15aHl27yj7M/yfyPhWsxqm9LlKguaEJaQVv6aLVJQAPGIVVF5iCT4eWGazcwTujSHGIqKN2GHyElVDH7abCzmBS8PNf8YF/EM0ONSgKDqkhxlAaIfg09YYVLD6YEn3fej5Glt4rNbKpClpc/uq/sgCEPpBsBTao99O9YMaGR2Zj3IXu54vS/YUtXCqv7eP2kKC8+L+aIO90WnobZ/PKJ6MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymq5f64NEv60PXOfatZmydNWpVFOolMyYRSJSW/Ljig=;
 b=nvMUZgadmUjakAnoY2ujJNYioKDU9wTDvAKJAbHHykn/dQephoRGyCotPJhYthAknvvmv4PFcoSYiZ8Xkv7CyKB7q1PsDYEJX2d23HBOwqcHaxsv0tKAVKgk+WvuLWLstvj5QPhdqs74/rnJWaHaERiNdQtHMDqykEM1ZQaTjcw=
Received: from SN6PR2101CA0025.namprd21.prod.outlook.com
 (2603:10b6:805:106::35) by MN0PR12MB6127.namprd12.prod.outlook.com
 (2603:10b6:208:3c5::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 23:39:34 +0000
Received: from SN1PEPF00036F3E.namprd05.prod.outlook.com
 (2603:10b6:805:106:cafe::5d) by SN6PR2101CA0025.outlook.office365.com
 (2603:10b6:805:106::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.7 via Frontend
 Transport; Tue, 6 Aug 2024 23:39:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF00036F3E.mail.protection.outlook.com (10.167.248.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 23:39:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 18:39:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 18:39:33 -0500
Received: from desktop-host.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 Aug 2024 18:39:33 -0500
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Jesse Zhang <jesse.zhang@amd.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>, Vitaly Prosyak
 <vitaly.prosyak@amd.com>
Subject: [PATCH 2/3] tests/amd_deadlock: add bad memory test for compute
Date: Tue, 6 Aug 2024 19:39:29 -0400
Message-ID: <20240806233930.344130-2-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240806233930.344130-1-vitaly.prosyak@amd.com>
References: <20240806233930.344130-1-vitaly.prosyak@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3E:EE_|MN0PR12MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b0942b4-6051-496e-722a-08dcb67106da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KfyWj73U9TAeB/uUtBleOnK6JTaEzLZA/V94rXPRIa9kSSvYNXLSw/e2KXNx?=
 =?us-ascii?Q?QxlPqP+EhQ1IGyGrl46yfxuAfTZr32X8RmuNXVSyNsjjVCeEc7CweY8VKe3F?=
 =?us-ascii?Q?bdI7HsrkCk4x5CmeadKCw08nIoXUJOPBFPApkBaWycdpwqDjKSPttxZyhmCM?=
 =?us-ascii?Q?kFHhTnQpsWh3ykKYftINQfkwSYsk7KPBpAPkgVX3DlMtPz6RCDIQCSElUcyT?=
 =?us-ascii?Q?VMN2/7W2qeYBxQpQMz3QVtcjhcG9os9vkqYtjz+ndY6XKTPpgJAEYPsKKB3s?=
 =?us-ascii?Q?1Lh3JpRAWotgXZmN1vyUNYTyfVMDp6Nyixn4e0YeBuXHmCbNATzk+ibCGJNO?=
 =?us-ascii?Q?lgWiRC9Zo5YmCWwB+1pQHI4QjtIt4gbYoNtzUdp6UVD+vzUbEgN8ehMTW5fv?=
 =?us-ascii?Q?xqEpM6pJnDiY3c0+o6PAkwwP9xXCGeHlUmlDziNwNQ3rsT/BBCSBCRiZ7MsU?=
 =?us-ascii?Q?k+CgBYEhDrPI2/elJaxcKWBPc2e/TucFIf901QDJ01S9S0xNeYwwePM11gwJ?=
 =?us-ascii?Q?NP98vxeKMDlCe/TjWXyGURvzdyM3naHSimEP58b73xO51ba/5vQcHX5hJWiy?=
 =?us-ascii?Q?4j4rxmJHpwuK+GlYBp1QNQFry/6aYifrBqHf/xnqLOcrPTA36eqfm4HfuY4E?=
 =?us-ascii?Q?DRJko4XjBfwMCJVyu4OgT2JpvDNpvIBQ1Kf9UE5WMbM7lmsa4buobbb2NYKf?=
 =?us-ascii?Q?HVMI5q9q+J7mgEXc2i0X/JBgafyUMR9HW43qhb6rd/Zspz2yzduBghJj1ehH?=
 =?us-ascii?Q?qTeLI94qAEfMFK3iu6lYZiYtExmMkjcJBzJAiEPOAO6f9JKkinjey0a6UJW9?=
 =?us-ascii?Q?PhmM25g00pdBToFD+y8WtBLQaYabVFPaiSyROXtAzrXBRaccNC9Jd06h7FfI?=
 =?us-ascii?Q?iwzJPmjfgWpPnCfS6pZi3YetuAfUWMQNRJB9PXKB/Qf+M1XgbVC6o0mPC5Ug?=
 =?us-ascii?Q?UffTknMKxyPzmqkP/GI6wacMts4ybu9NhsdYB/KLc0bn9BwYGHJj0Eo5pxWi?=
 =?us-ascii?Q?fZACI+GDpLDZ5SVC+F8Sek6eTAAIvtDFt81N9JnWqpHhnRdbSteJ39fEbBwt?=
 =?us-ascii?Q?Kst1kiUzsf1ALblcn6CN09wwBkhC9LS5Zn8GlWYEdyJs0j/Vkycx6q5P6wDD?=
 =?us-ascii?Q?bE1AwHePTNMSYoXQQ7esthh03kztszKvizOMzTu1aaEnjf5urWZB14nlMWzS?=
 =?us-ascii?Q?t+AQGL4bOQgO98AfGzQ/EnHTzHhxhkmaWSFUBbQrI1p4d8coOokAZSZ8Phn2?=
 =?us-ascii?Q?sc0zDin2lMTZuysjuMHEZONZdJIG0m4bnSwvfZ+WLPfhGuKVwTqITvhXSJDO?=
 =?us-ascii?Q?P4/EcjtXh6K9NxdMDWkGRQigTE5k+exYq/IhW6tUaWzBTwjDIOiPprDHxpzx?=
 =?us-ascii?Q?2NhUzMcOG3xk2ILkOJrB87JD4M72nz0iO473a9QXHrOb8YQ7WO2UWxFzABwO?=
 =?us-ascii?Q?ShdBGiUpUz7GQuAiHZ2aoRLf7BGhwzIe?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 23:39:34.1525 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b0942b4-6051-496e-722a-08dcb67106da
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6127
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

From: Jesse Zhang <jesse.zhang@amd.com>

To enhance the test, add bad memory test for compute ring.

v2: Replace dynamic subtests with igt_subtest (Kamil).

Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Signed-off-by: Jesse Zhang <jesse.zhang@amd.com>
Reviewed-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 tests/amdgpu/amd_deadlock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/tests/amdgpu/amd_deadlock.c b/tests/amdgpu/amd_deadlock.c
index 01185bfd3..52ba08494 100644
--- a/tests/amdgpu/amd_deadlock.c
+++ b/tests/amdgpu/amd_deadlock.c
@@ -94,6 +94,13 @@ igt_main
 		}
 	}
 
+	igt_describe("Test-GPU-reset-by-access-compute-illegal-mem-addr");
+	igt_subtest("amdgpu-compute-illegal-mem-access") {
+		igt_skip_on_f(!arr_cap[AMD_IP_COMPUTE], "SKIP, compute ring don't support\n");
+		bad_access_helper(device, CMD_STREAM_TRANS_BAD_MEM_ADDRESS,
+				AMDGPU_HW_IP_COMPUTE);
+	}
+
 	igt_describe("Test-GPU-reset-by-flooding-compute-ring-with-jobs");
 	igt_subtest_with_dynamic("amdgpu-deadlock-compute") {
 		if (arr_cap[AMD_IP_COMPUTE]) {
-- 
2.25.1

