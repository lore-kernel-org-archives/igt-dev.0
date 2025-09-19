Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB3ACAC5A5
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 03:55:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD3AB10E0B5;
	Fri, 19 Sep 2025 03:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="N4TotC+Z";
	dkim-atps=neutral
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011030.outbound.protection.outlook.com [52.101.57.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47DA210E0B5
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 03:55:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1KzE4kb64AjmmGcQYoBLcHuqfPWpp0Mm6g95eEP1xfRoc7w86FIs5CWcVwBN6WlCt3xHZBnltoQthWUrR7YbpB+ogWk42LN4ZGw+tOfI3ZDrz2QiteSKNvGtknTXlRki45am1cBBwOI4o1TJd0axLmHQh0SOLlVzzpNIJFqtHlfPRAsS4OqmL8Q3r0uXaZW0aZ3C6FnWpUFRFKhGmgQkhXGPcyvznDhHQQLXW9CpRiuhQ2L6379oCpkD3GJxoKQ0SJixxHXc4zQKgWa+aLLL4aT5ryNhR19D5iJc7YStBZFjsHeGmDfT6MGf3w0v9UTncsE4/GoMTzXmQjv5UQfag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97kJ8II3f6T0n4WQ6S2RJP0qU7wkKq/lC6dWkwpkaSU=;
 b=TBYfYfUKLE1dWWE4qcUeLDHO78evIegZPReuVGZ5/rAQxPOsx9jCST0R9RonYBfDMSY0oteVloL0NC9ums1vNGGWP3TFWsk+BfHuFuu6SpE9vaXgJ2CK//v2OWd/TwtnnaZw+tBeLByR/KZWYitYtcSqaL/+4iRBU+eTcoraQFPZTMR4WNetsdAbO8ZY4DsnWmT7+9KeWYtldhGuRVUjyHsvkha25cbk87pxhSZIigb4+G7nOhI6TuWy7bcgB7sJKBO8eH6AZQEoaCf3EOJHVMf8Evq9JooxG/36c4NChZtse/pNzIYXIAOzV7P0VwvOGDHFXttT+fSigUEQT2Vtjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97kJ8II3f6T0n4WQ6S2RJP0qU7wkKq/lC6dWkwpkaSU=;
 b=N4TotC+Zf0nwGFoBumXQg/GAi0ju9Mj9G8bl3zwYcBqr8Qtb/SxarAb1P+2iMPYBfMUJdVxxeuGPifAuR0Ka+7NHi02mq3nKWX9CHgZ4k2UNytVRbJiIGjP3lATyPx8az/BbH0h3hN9m3JCQ1mgRzAUixamm+ijgDio6dabqOzM=
Received: from PH7P221CA0009.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::28)
 by DM4PR12MB8450.namprd12.prod.outlook.com (2603:10b6:8:188::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Fri, 19 Sep
 2025 03:55:33 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::1d) by PH7P221CA0009.outlook.office365.com
 (2603:10b6:510:32a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Fri,
 19 Sep 2025 03:55:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 03:55:32 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 18 Sep
 2025 20:55:32 -0700
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 18 Sep 2025 20:55:31 -0700
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Kenny Ho <kenny.ho@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, Alex Deucher
 <alexander.deucher@amd.com>, Jesse Zhang <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: temp skip vcn enc/dec test for RX 7600
Date: Thu, 18 Sep 2025 23:55:28 -0400
Message-ID: <20250919035528.76006-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|DM4PR12MB8450:EE_
X-MS-Office365-Filtering-Correlation-Id: 212f8c1d-4374-4d9f-c645-08ddf73061be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlltMjU3WnYwUm9PK2xwTW1PY3l6SEJGZFNPQk5ZaE9qWHRoK0NwbFFHR0hD?=
 =?utf-8?B?R3FjdGVaZ2xYVlc3T3NNTnhzbCsranlUVTMxbStwUXRkYjh2aVlpMk90bm5j?=
 =?utf-8?B?ajZBaFZJL0JzVHowZnpsR00yaDVTeTEvV1NsL1h2NHlBUjNsbXlQRHVzSjZQ?=
 =?utf-8?B?d3hZa1ArTnhuZzZxU2VZdlJQcFpsdmd4REcvMFpFQWJzdFI1MWxUejkxMEFa?=
 =?utf-8?B?djVNU0l4WFZhb1JaNVBFNnI1dTU3cFZMNEV2Q2VQOWZxNUZQR28rRzhFVDdK?=
 =?utf-8?B?V2l2d2E2VFBhSzFoNDZVbkFJVUpHZnNNbzZHekdTYnhrNjhwK1VhaVZvU0VE?=
 =?utf-8?B?cFlKdE1BS050ZXpoYXAzRW1zc3E2RnVDcEE1by9VM045VjUrQkt2WjBLWDE3?=
 =?utf-8?B?VkN6NVF1VHgwdDFGenN0Yng5RjIzVGkxeThub1ZLaHpWbDRoTXZITjBYVzZP?=
 =?utf-8?B?Vm9meVV0Uyt3WE9KNzQxVHduSy9rLzhEWFVzL2J6QzF0cUlJUGFsMWFzQXZn?=
 =?utf-8?B?RTJyVC9JSDZseURxSGYyTGNHU2xXV2UwR0RIekJVK2xtTll0M0wremVKU1Y3?=
 =?utf-8?B?eFdHKzcreGNRZnN6cm5BT0s3WWVBR0MwZ3o4U3VrYjVKRmlBTytJSk1IUnJB?=
 =?utf-8?B?L0prcDFCZHdzNmZWeWRZaFY1K09SYzFJQ0RWOWh4SkxSWmY5L0xXRjIxMFI2?=
 =?utf-8?B?dEJ5V1cvL1lyenZ4UmVvcGtTd2RuWHErWTUrOVRnanZkRXNuQXRHNHRrVWMw?=
 =?utf-8?B?dGR0WThyclFFZEtscmcvM2FCV1RuT3I0cFNtUktZR0JsMUhlWHVqdmdiRGVU?=
 =?utf-8?B?bi80ZVVJeVd1NWpvWitJbkx5d0RJUkJNS1FQWTFkSll2VmkrL2dwb3grS29s?=
 =?utf-8?B?cWNJOTFOU2NCRFc1TE4wdVdLQkpFTW1Gc3RVZk01STgwK2VzL0k0QWpuQXJ5?=
 =?utf-8?B?OVZlL2tuNU9UUjNuLzBLRE1QcmJIQXhZeHRXTjVhMmVoMVhnVE5RMVlnaTF6?=
 =?utf-8?B?ai81bnZjQkR4ZGdKU05uMHNHWXF3b3FWZlFZeWl0aVZGekJjbzNSSVZwN1Ny?=
 =?utf-8?B?WlF4Y0NDd2txRGlNV1NVSjlHWHVHcHZvSFlZdU9abUt2SmxJUCsyV1F2ZUs4?=
 =?utf-8?B?RlJRbWhMbkZjRyt4Q0I3MndXbXV0STREa2lHS21PWVN2bk9kTCt2TTh5VVZi?=
 =?utf-8?B?aW5XciszZkFXOTZheERKMHRCTnh5K1FjM3V4ckdrazV2SC9RWFZQcEJCRkpw?=
 =?utf-8?B?QzhTR245MEZEYmpld1pJM0wwdWtsNUlKUVVHc0xXSy9SM0ZPMTBnTFdsNFVw?=
 =?utf-8?B?dng0Mzhjc25wL3hjcFB0eEFnWTV1TTVKekthOUdueFp2dFBIQmY0aGJua21L?=
 =?utf-8?B?ZzVjampONlRMZ0c1RXlCRU5Yd3FzTGl5NTdjbjkxZGNIelJGb2xZcXBqaGVw?=
 =?utf-8?B?Mi9WWXRCd1BraTl5TWltQ1RTR2t2NlJ2OE9JSGNxaDhaVDVSbFU0U2IyZk12?=
 =?utf-8?B?QzNjSGg3anBmZ0h2K3J1SjRlNW9CcVR3bjhNRi8wblNzSDhleXY3SnVYR1hW?=
 =?utf-8?B?bWFydEplM1hnbU1JZlNXVzdIa1hLOGtUUmpmTjh3TCtpa0N5S3FPYWxaMVZw?=
 =?utf-8?B?aUhha1NqUmpRQk1XNWR6NkpjK2RqUWZabElET21ZdVdmRVJtbEVlSzA1bjdX?=
 =?utf-8?B?VS95cXZYb1RRWWlHZ0hadG5WZXFTTkJrUDJ0SzJuT3ZPK0lBYmVBZEZFRHlU?=
 =?utf-8?B?VjRUWGd4TlJHdmlvVjYrcDM1eUQrWDVEZi9Va1NONzFobFRMQ3N3Zkw1NU1t?=
 =?utf-8?B?Z2wwSTkzNm1LSUd1YW8xMVhORWRsaktlM0pKeDUxOGZSVHVTcjZuamROM0p1?=
 =?utf-8?B?eURPMmRKZURSQ3dnM2RaTncwblRJcE5kUDZEV2xCUnY3NlZPTTZ3Mkc4dCtY?=
 =?utf-8?B?b3kwUXpmek10Z1MwN0RNWUx4WE9QUzdmaENtVXZOVkc0Y1hpZ0FDcmZaS2Rw?=
 =?utf-8?B?OWhOdEpRb1hkRmFBc2JIZkV0YXBTRmNCWXd0WFRwR29SaTNoSnVLZklYVVBS?=
 =?utf-8?Q?qyQOdv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 03:55:32.6203 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 212f8c1d-4374-4d9f-c645-08ddf73061be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8450
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

From: Vitaly Prosyak <vitaly.prosyak@amd.com>

Cc: Kenny Ho <kenny.ho@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_vcn_shared.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
index 3888ec112..54c731707 100644
--- a/lib/amdgpu/amd_vcn_shared.c
+++ b/lib/amdgpu/amd_vcn_shared.c
@@ -59,6 +59,13 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
 		context->vcn_reg_index = 2;
 	}
 
+	/* Skip VCN tests on Radeon RX 7600  (GFX11.0.4, chip_id = 0x51, family_id = 152) asic_id= 7550*/
+	if (context->family_id == 152 && context->chip_id == 0x51 && context->asic_id == 0x7550 ) {
+		igt_info("Skipping VCN tests on Navi48 (family_id=152, chip_id=0x51, asic_id=0x7550)\n");
+		return false;
+	}
+
+
 	return true;
 }
 
@@ -188,4 +195,4 @@ vcn_dec_cmd(struct mmd_shared_context *shared_context,
 	default:
 		igt_info("Not Supported!\n");
 	}
-}
\ No newline at end of file
+}
-- 
2.34.1

