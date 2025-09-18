Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D912ACAC59F
	for <igt-dev@archiver.kernel.org>; Thu, 18 Sep 2025 08:47:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD8D10E68C;
	Thu, 18 Sep 2025 08:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rSKWOhrE";
	dkim-atps=neutral
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010034.outbound.protection.outlook.com [52.101.46.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488BD10E6C3
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Sep 2025 08:47:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aow6Rnsx/KWLx5FTBXqDJh8+ZSLZej9wrNmge1045jVaggUF5EmcuPse46nnptJxJd0Gred41H/x01VJxG2LtbZl7oJ7OdplAM8tMhI24KcKucMQkVjnX8c5RMMAzQJziVy/Mh/deqe38wHxk6ThfTUg9DG6AIBDzYTQ/MoWUguEeOP8dMrQgFbMLclAjvjOwc8xsQsFMl+mkf30diQ4pMjSULIHfE9z81csqf2MyUtBChw7ZoMF1l+UFHed8CH8rW5WnHbcNTgwf8hVnRbi3RbcfLor+97ICIEXPGIfTjSQdJV4VVL6raSw99etvHX148THLZsGbCCH6LWqiAN5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGnfDu1APGHGvqFEumDmy0kpOOIUNM16pVu3t1jaeNQ=;
 b=j/XPXizsKhl82gjBNlk2FQmw8faP6EUQ5wxEPrpkM87UC/0+hkjQrKAijlTbmxuxDDZz0tWDFQx7nXzX/y38oD/fubJVjZSig69lEuir/aUVkCfPXiLdHTvZmYwvdGYYr9cvu/XAHQ+hZMDG9xs2w6ur5MiRpbGamC1HzlwVpqibWI4eq05jHJz2aigzuWbOQQt8ISGvlEmCS1aaNMkbddfB8f5uyF2ZVZsPhMSxDysIQmr8jrWECdDMwox95KUkcWMCGoJS1rl12fIntoVt+e2grcn6bsjyMDeqBktQFIJlKxqB0n6WQH5PFSHfF1i01uMn5pMwF6XlgpRPa6kaCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGnfDu1APGHGvqFEumDmy0kpOOIUNM16pVu3t1jaeNQ=;
 b=rSKWOhrEhne5iIUCkCfLxhC93NtfgQBvXiXuCxM/Ag4e5xwYZBSm7FkrUyFEefafT41ZJl7oP/JoBU7XyHa9lhzZ5RJ7aSyOW4xOhhAlLhwtJZHfhpiNCbLxnFzMCEQHWYuTPOU9+BDutJOvWzcrnFdmeeuM7DvlHiajBj0OGIQ=
Received: from MW4PR04CA0353.namprd04.prod.outlook.com (2603:10b6:303:8a::28)
 by MN0PR12MB5929.namprd12.prod.outlook.com (2603:10b6:208:37c::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Thu, 18 Sep
 2025 08:47:12 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:303:8a:cafe::24) by MW4PR04CA0353.outlook.office365.com
 (2603:10b6:303:8a::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.22 via Frontend Transport; Thu,
 18 Sep 2025 08:47:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Thu, 18 Sep 2025 08:47:11 +0000
Received: from srishanm-Cloudripper.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 18 Sep 2025 01:47:08 -0700
From: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>
To: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, "Alex
 Deucher" <alexander.deucher@amd.com>, Vitaly Prosyak <vitaly.prosyak@amd.com>
CC: <igt-dev@lists.freedesktop.org>, Srinivasan Shanmugam
 <srinivasan.shanmugam@amd.com>, David Yat Sin <David.YatSin@amd.com>
Subject: [PATCH 0/2] tests/amdgpu: Exercise MMIO_REMAP remap page (alloc/map +
 HDP flush)
Date: Thu, 18 Sep 2025 14:16:53 +0530
Message-ID: <20250918084655.2192395-1-srinivasan.shanmugam@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|MN0PR12MB5929:EE_
X-MS-Office365-Filtering-Correlation-Id: f09a62ac-8bb5-43e9-ef61-08ddf68ff5be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTNwaWkzeUFsaWRaUW12aEFEcnVsekl0S1RqTE5Oa0p1WW4zaWlxbTJONm1p?=
 =?utf-8?B?azhkbGovQkt3a09tQklZQVBBZjJlUnY3N3pOdk9WQXVwUTdIVldMQ2IrZTJp?=
 =?utf-8?B?RFROSGJESGl2V2dLKzFNWnYxS01wZ1RINW5lRmZDMUtYRE4rbEJiZjNWV1U4?=
 =?utf-8?B?MzU1TlFOZmROcXV1RlBsbHZuTE02c3d1TWdCUUcrRTFQdmc3UzZKaFBSOUgz?=
 =?utf-8?B?aWFuVU1sd1RtcGV1MGJZL3FoWE5xRDBnOThIWGpWSUlXR1lySC9hQnZmUDU1?=
 =?utf-8?B?U0ZDZEJWTm1tYllxbnN1SHgrMDFNZjhhbkJpM013c3BFVCthbHhhaE9DcHhK?=
 =?utf-8?B?eW43cDRrOXJSR0pWdVRCTmlvaGlRQ0xiM3NyZS9TY1Jvbzd3NWFCbnRtN0lj?=
 =?utf-8?B?YTdRWHdQSFl2eEVqMzdOUUhwS1RpS3FvZnRyYm5sU0hRUllBRUtOVXBCVGcv?=
 =?utf-8?B?MzJjMm5CSzR2bThmMVk0R1MrZEZtNHQ2RkNwTDh6cVRZYTZzdUdmUm14d1JQ?=
 =?utf-8?B?KzdZVzBzOFNHVUZ6VGpXUlVYTUVKZHVWV0VsMDgxcStrcVJ6a2ZtZ2FHRjhk?=
 =?utf-8?B?UnExY0pNc2tiYjZ1SE8yTzdodzUzc1kvZThqTlRVd2h4Nk9paVdvRTMrUC9t?=
 =?utf-8?B?OVpQTjlEd2c1MGRpVkFvU3BnUUZRLzV6OHl6ZkNURGNmc24vWkk0WDVjK1NN?=
 =?utf-8?B?R25hdFFTVzRyMEg0QkdUKzdRdzhoVktqZlpRNGJ1TVpFZ1E5SE5rTVVJcTls?=
 =?utf-8?B?aERPTWNLMVBWem1SS0pPQnJuWi9lK0JzWlFvRGxOZmJxZEtENnZ5dWpWbjl1?=
 =?utf-8?B?S1hsQUxwTzk3c083RmFyQ3lod1AwYmV6YVFqVE4vaTFPVWFwSFlid2YvVkhi?=
 =?utf-8?B?TFRpQVk3SnFhOFhjL24xcWs2anVUT2k5N21iNjNsNGtXaTVhQWFkMGtNYWEv?=
 =?utf-8?B?TGcwV1pMdFIxdjk5ZzdKUDBrcHBvNmdkam1CYStDbk15NE9uYWdpT0pPSkF0?=
 =?utf-8?B?c0ZqeEwrS29LbUljOG5HM1dwNFBsSWM5MjhyaUJlaDRUMnN4cXd1NkpIVmtk?=
 =?utf-8?B?MkJ0MDJLTGFsN2t3amplM1hTZTFrODh2dVplNnRmSnVpYVdlRzlIU2YzY3ZL?=
 =?utf-8?B?Q3YxUysxYVFvTEZxVWVRZVBMMEdiRUdLTzJsUkgrN1BNUlRuc1VFak1zV0FW?=
 =?utf-8?B?NlhhTk96OStqS2xOVGNmNDVWMXNwcEtGbG1zdWYvUkJDVWk4bllNcEJxcmE3?=
 =?utf-8?B?LzVldUplczhwaEtkK1g3TEdzbEhlR3RiUnl3VVZ5NVhPMGN1WnY5QnFOUlJj?=
 =?utf-8?B?bS9adUFwamNPTjJ0c3hFVEUrYjBKZm5FcHNIQ09hQXZManpVRVMrSGlYZThw?=
 =?utf-8?B?TWxxenBDUWNSNUlzWWpCS3NxZ0pwY2F5Wnc0T3NOYStvem5hTWhUMWs5bmVI?=
 =?utf-8?B?UHZMVkQ0YnMxRW82MlNmTmlBMWF6dE5kdGZVVUNOQ2RpeUpsTWpyRm5ISkt4?=
 =?utf-8?B?RHJwYW9kU1cxQVZiZjFhVFpzeEpUbm4rdWl4T25ZV1NqSTUwUXhzT0U1WVBN?=
 =?utf-8?B?MkV3eVFYbExYVCtlTGFFcWNJeDhscVk0NDFNaHFUZWhUYys3R3ZGb2F5bU9Y?=
 =?utf-8?B?VEF2TUZkejl6YUFIMzBnclNjcVRTdWtZeDhrOVhzSE90NE4xTVJkd0FCT1NG?=
 =?utf-8?B?K1dFK3RuNmFNbTcxSEdoajAxQ01Yb3RrTEFmRlUwQTVLTUhHMHBud1VEV1pU?=
 =?utf-8?B?b2Qyb1RXQjBQTERsb1U4NXdoem1vUDN3WVN1b2YwdXlyZ1N1cmNUcTBudGIx?=
 =?utf-8?B?V1g4U0hFNFVyZkpvMEk1bXZzYlI5R0NLMHBzVWVuM2x2RWtmZlZyeHNsLzV2?=
 =?utf-8?B?SkNWSDE4ZXJ3a1MxdEZpTzFqYVVWU0xmV2c4T1VoTms3eUlQdVpEM2xGalJL?=
 =?utf-8?B?TTFnNTVER0hIWXRmYS9JM3hxR0dzRDF5OEZRL3FOWnF2cENFOE1oamVwRmcz?=
 =?utf-8?B?bTRVeVlXcjh3PT0=?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2025 08:47:11.8812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f09a62ac-8bb5-43e9-ef61-08ddf68ff5be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5929
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

This series adds two IGT subtests in amd_bo.c to exercise the MMIO_REMAP
remap page:

  1) mmio_remap_gem_create_close
     - Allocates a 4 KiB, page-aligned BO in
       AMDGPU_GEM_DOMAIN_MMIO_REMAP and immediately frees it. Skips
       gracefully when the domain is not supported
       (-EOPNOTSUPP/-ENODEV/-EINVAL) or system PAGE_SIZE > 4K.

  2) mmio_remap_map_and_poke
     - Allocates and CPU-maps the 4 KiB remap page, then write-1 to
       HDP_MEM_FLUSH_CNTL (offset 0) twice, followed by a dummy read to
       post the writes. Unmaps and frees on exit.
	   
These tests help cover the basic KGD/KFD MMIO_REMAP path (allocation and
BAR-mapped MMIO access).

TODO: A kernel patch enabling this path is pending merge; once it lands,
the Link below can serve as the stable reference.

Link: https://patchwork.freedesktop.org/series/153209/#rev5
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>
Cc: David Yat Sin <David.YatSin@amd.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Signed-off-by: Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>

Srinivasan Shanmugam (2):
  tests/amdgpu/amd_bo: Add mmio_remap_gem_create_close subtest
  tests/amdgpu/amd_bo: Add mmio_remap_map_and_poke (HDP flush) subtest

 tests/amdgpu/amd_bo.c | 144 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 144 insertions(+)

-- 
2.34.1

