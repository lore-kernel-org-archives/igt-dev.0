Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B65CAC59A
	for <igt-dev@archiver.kernel.org>; Fri, 19 Sep 2025 16:55:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B67610E24D;
	Fri, 19 Sep 2025 16:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zwoSyPVp";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010033.outbound.protection.outlook.com
 [52.101.193.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2260410E24D
 for <igt-dev@lists.freedesktop.org>; Fri, 19 Sep 2025 16:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9qeOMQpZ5W45fCYmuzxOBSyY2U9Gdm2xx76/2hBjVYdMAKzQltGu3/UoGjF6bkUhytPZUHtaHpdT09JE0GSOINoR+FcaMg2uAKiTTYxtwByf7aJQt4djQCFmJfxInhRiuGlsFJkjpQbTZnJeeCq1Vc2AEwxoG2xooEy6xG8cHUXMV6LSB0yY0mCSKUO88w0oxbfv6q/dtuCGpZghI8lQjwWb1F81FGPfUFViWDFRa8JRp5cOXWEpIQthpOIteJAyju4Y/2acMo9b1a9/9RPjFZ0LZg1g7qvLQ304d9BQgKEe9kiDm5IfuvMyvE9027Y9zigg7/cGCTqiuFMGmLwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BW2AVOLbJJs953+iROuQXHL7LchBvtDXTdmrp+AFME=;
 b=TMWGzw7Tq5fNETW/BezPGkkKqbNwUfCvfNnjtpP6bYXnrVrAPV+TElZRD5l1A/URpAV32aFwBC4bm4ZuXknvkyXHaDd426AiWFkU4+WfPHowrdyqCJzkt7xDo7Rq6aEmSjlQLGq378m0Mqg0fUrG4CaMvG5QJ5aPvZ526cvRubBCSMYUBp6yusXGE/Ji+GZeVecT2oBFgs1CLdodTKb6xNru35i8F7MwW4tSZkGgEsjjgAYGTIlmoQuxkj69LI4TbiAyUl6ZTtlLTDmpvRJ56hzAFIe9AN9N6VjbejKpmtPe8JU+5dVxGLcXv02lN5Kj7BRlOc/STx8b32lILNisMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BW2AVOLbJJs953+iROuQXHL7LchBvtDXTdmrp+AFME=;
 b=zwoSyPVpRfDyLmOJEWt4HzSV0ciBgSkfiLVLga4H8vdG04MOQHk+Xa2U4sUaRNSQLD0+BoUpGI7LZvWmfPhfPutzehdlAVucKd9UGGSVJN47Uisa32GON9GkAh6Nfs/r1zpcCtANM8GKgIX9O8k0IfSn2aO7LG3MDRme6i5RP0Q=
Received: from BN9PR03CA0850.namprd03.prod.outlook.com (2603:10b6:408:13d::15)
 by SA0PR12MB4415.namprd12.prod.outlook.com (2603:10b6:806:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Fri, 19 Sep
 2025 16:55:46 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:13d:cafe::e8) by BN9PR03CA0850.outlook.office365.com
 (2603:10b6:408:13d::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Fri,
 19 Sep 2025 16:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Fri, 19 Sep 2025 16:55:46 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 19 Sep
 2025 09:55:45 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Sep
 2025 11:55:45 -0500
Received: from AB350-desktop.amd.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 19 Sep 2025 09:55:44 -0700
From: <vitaly.prosyak@amd.com>
To: <igt-dev@lists.freedesktop.org>
CC: Vitaly Prosyak <vitaly.prosyak@amd.com>, Leo Liu <leo.liu@amd.com>, "Kenny
 Ho" <kenny.ho@amd.com>, =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, "Jesse
 Zhang" <jesse.zhang@amd.com>
Subject: [PATCH] lib/amdgpu: Temporarily skip VCN ENC/DEC tests for RX 7600
 until proper fix
Date: Fri, 19 Sep 2025 12:55:38 -0400
Message-ID: <20250919165538.70152-1-vitaly.prosyak@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: vitaly.prosyak@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|SA0PR12MB4415:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c8a14f-d014-4eb3-d170-08ddf79d60b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UGpUWXVGbEUwdGxWeEpnZXRMRmM2WWloVXQxcy9UbThiQTF5ajVUQ1BTTmlV?=
 =?utf-8?B?Vmc1UitBU2tNeEFUMzZPOGpKOENPYjdxeUpHM1A1SkdmZ0k0UWJkbm9rSXFL?=
 =?utf-8?B?M1ZSRnJlYkFhU2JWUXFmR1NXam1rdVRKZjRsR0hiSjBQWTZKalNxQlVQWllS?=
 =?utf-8?B?dDF4WmhPemhKNysxbXlYWnp2YzBFODVQTHlWdDhiMXNCQmdUZEhyUG1jakth?=
 =?utf-8?B?WVIrdXlNa3FGZzBTemVJWXZDNzlYenVWQlFlc2JMY0ppN1c5eUF0N2sxbThx?=
 =?utf-8?B?amJoaVpiV01yVkdBa0tZYnJjRTByUFNvN1pCN09QNG0vTHh0dWpjVk9mVFBh?=
 =?utf-8?B?RGhoQnA5d0IvNk1hWDlJVTJWZTJ1NTcrSzNiT0x3Q1FDN1hoWVg0SVhNWnRr?=
 =?utf-8?B?SDBwSFIxb21SOTlTbUt0dWFoVTNIbXM1c3pnbkYvbEJ0NGdwZnNvUXBpdGwx?=
 =?utf-8?B?bnNibWtsZ0hGMXl2M0Nnd01WTGJXSk4yRXVVb1duVVVKQVU1NEZkMkVkSmln?=
 =?utf-8?B?OFBhczVYZUhiODNLVmEyQTd1THlQeTZwcnVFTXhBb04rNXhLQjlPZytrNlc2?=
 =?utf-8?B?UXVZdVlMRHJOQjVVeWlHTDloNFF0Um1NdGdtVk1MQUNYOG13SkltWUczRS93?=
 =?utf-8?B?K2I3UTh1UVNHQmtsV242WGRYdXkxQUlOSlVoZktQWDlGbWo5YjJONmMzNUtM?=
 =?utf-8?B?cmF4Z3ozamt3VXM3NUFhaHZsbGJZQlBCWU5qbnkxUE9zSExOUmc4dlU5MjBu?=
 =?utf-8?B?dTVTdHhpVlBJWEJCVjRGbjEya3pJYWY0Q1RFMVBYQldEZVVsL0hiT1pkL3FR?=
 =?utf-8?B?eStoSHkvZWFUVEVrYklIT3duVnYwekEyT1ZHa2Y1NmVkMno1cVFVVm4yZndG?=
 =?utf-8?B?QSt3ZU5rcnlQZjhpWWF0R25ORG5RVTY2NFJmbFBPY2srT0E1STNXVTYweUFG?=
 =?utf-8?B?cVg2SjdYMWpJaGFhYmtEUU4zUFJxYjlvK0VmbWNwOFV5MVFuQU0wbWRhTmQ4?=
 =?utf-8?B?WS9CRllXcjRac1FzemdmWUJ1dXFVb0daQmszRDkxU3hTVU12bUx4cUl6dStV?=
 =?utf-8?B?Z0Rjc0VnaS8rYTdQcHVCWXRqYnp2OEk2aW94b3ArbFJnVS9JVWMrNDF3R004?=
 =?utf-8?B?ZnpLRjFUbGE4VHFkY3phQVJsU3R5UWQvZFRRQ2VFeXFHY2c3aTc5VWRUY3Rh?=
 =?utf-8?B?Y1Z4aFVtNlNyVnE5YlRLd2FVbW9yVUhYTm1XblpUcGYyRUFNUExaSGR0OU9a?=
 =?utf-8?B?Yk5tQmFZSXlXUlBZdG5LaFZxWW94M2R5MjV4bXZHRXlsZEVwSTBjdkYrUHBm?=
 =?utf-8?B?NlBwTjhuYnNDUW9OaDdTNnYxOG44VmhqN0FoRHNaUEF2OW9UWEZOM0hqbllB?=
 =?utf-8?B?OTVNSTlqOGF0VCtKVDhWak5tb0ZneFpjMDErNzMzdy9TRTRLaHRxTTFmdzRM?=
 =?utf-8?B?M1AzNlZJS2pDTVRTMHh0cWlGSVd6cVM4amw5VDVEL3Y4d2xLa2RQVUdFWkg0?=
 =?utf-8?B?TThFZitWSENNdElFdnJwblBKemhURWxNcUJ4VWNiZ3dmVVB3akJRM1dWcko1?=
 =?utf-8?B?MEczQzdhc0pmTTRVUWNQQkNjK0J5bW9iVkRlVjJqK2JUTHowbGNSSTBFZG8w?=
 =?utf-8?B?VTl5d3hTN01ab1Y3ZHpENXpUVjRDUVo4RGRKYXRmNFBYU2l2QVJxVmFXdGxh?=
 =?utf-8?B?TXk4S2lJYUZDSUVkUDBUckN2MXZIbjM1NkF6RlUzbHBJZjBmNzRzbjVnV3A1?=
 =?utf-8?B?WHRheC9IVkJSUkc5K0p3ZitoVkRsOENOejlDbUY5cUEwUW14RFJCYjVSbHl3?=
 =?utf-8?B?TW1oYVh1WkdCajZ3SDRDcXY4NGJOa3VsNmQxb1pzZmNRN1hVdGVqRlc0UVBr?=
 =?utf-8?B?Z1piQTl4U2dRKzlmRVVEai9QK0tscFFocGNrc1JVK25PWXNLNDJUV3VSY0Vq?=
 =?utf-8?B?ODBqVHhsSElodVdrS1lGeDJ3K1Z6UVRYY0dQbWhVNENMZGNnSXBLdFpkSTVC?=
 =?utf-8?B?S05DeS8ya0pYeXh6R1ByL0taVXFYTW0vVnB1WnRFdlk3OXJhekpMak1NalJT?=
 =?utf-8?Q?qyOIUv?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2025 16:55:46.0383 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c8a14f-d014-4eb3-d170-08ddf79d60b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4415
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

v2: Fix comment to GFX12 (Alex)

Cc: Leo Liu <leo.liu@amd.com>
Cc: Kenny Ho <kenny.ho@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Jesse Zhang <jesse.zhang@amd.com>
Signed-off-by: Vitaly Prosyak <vitaly.prosyak@amd.com>
---
 lib/amdgpu/amd_vcn_shared.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/lib/amdgpu/amd_vcn_shared.c b/lib/amdgpu/amd_vcn_shared.c
index 3888ec112..61075d8db 100644
--- a/lib/amdgpu/amd_vcn_shared.c
+++ b/lib/amdgpu/amd_vcn_shared.c
@@ -59,6 +59,13 @@ is_vcn_tests_enable(amdgpu_device_handle device_handle, struct mmd_shared_contex
 		context->vcn_reg_index = 2;
 	}
 
+	/* Skip VCN tests on Radeon RX 7600  (GFX12, chip_id = 0x51, family_id = 152) asic_id= 7550*/
+	if (context->family_id == 152 && context->chip_id == 0x51 && context->asic_id == 0x7550 ) {
+		igt_info("Skipping VCN tests on RX 7600 (family_id = 152, chip_id = 0x51, asic_id = 0x7550)\n");
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

