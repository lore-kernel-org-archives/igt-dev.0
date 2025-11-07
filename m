Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C72DCCF9F8
	for <igt-dev@archiver.kernel.org>; Fri,  7 Nov 2025 15:23:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43C0E10EAF8;
	Fri,  7 Nov 2025 15:23:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AdF39dgY";
	dkim-atps=neutral
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17F510EAF8
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Nov 2025 15:23:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sTZIcPNFhl0+CPZKSkOdkzr0ht4K130kyxsO4hwLqdOhGh+Lyl+hcjoKZzBnlJLe4He3pjVzwlmuOuOrmOAZKSr5UA1dNfvrToVySb2aODPQDOSYt4J57o6Dp5I/Ix/t2/4bUWFZX5Zvi8ySaIHBbNLTLwInbpUYt1eAAijIzKB8r0f7v/B34Mh2KLYWpw2MMSY9WgPNj4kykEC/AvVxyi2KHY4o38JVhrxyw+5qm9zkjxlPVDDVMqWzk4f4Y6Dx3TijIB6uj0rIg8aPJogl/MzlWMKx78bITAY65tjZSRKVKkOeTCi2clQRbYbi0USRU2wVs0gcWBq+eRGvcTPg0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCz3/KNAdIDHBpjWXVJfF2vzjYEGllijQwaLlayBHf4=;
 b=VR6/qaSZQANkJZgptj7V68PjLhFt16XtEsyRm9eAZkU8hFCd0uhV3NQUs3bF2IuOAVeYj0kOmO0R+PMD8EjffCFeID+XXaasT7LILl/boScmOxvr5KkOQCk111VH1GEcXB1qDjWGemzGfwJmvS7MYOOiJXPHO+K91EyQCRptJNU6EtBqhVREGR0OJVyvTDFDTPbuZbSeTMv+V+PRvuJMBOSKiyW7U5gSSE14MX1zHvvPQpNP3tw7O5eAqn6hmBVdR6I+BgmhejdD74Cl1Xz+AtI1LUSSxKeuv/neXcmpwtnZ7ejjAEHjflS852gjf5ysM5FDEHb0w55SqVB99ir32A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCz3/KNAdIDHBpjWXVJfF2vzjYEGllijQwaLlayBHf4=;
 b=AdF39dgY+kh9onzvk0IrXWiLSiYPP+vExjKdm6fgt6JvexLRsEFAr7VFe6QIS5F9kL9PHDXC1ZpD9XTDlmL9NFoQAFrD0Wu25ssJsrWPBNizo2G8t43Yuwwm5Es/Cq/UWJvjKuLIt6jl97XtXh3nw+UBjZGylTctlccJ16F9TpI=
Received: from MW4PR04CA0205.namprd04.prod.outlook.com (2603:10b6:303:86::30)
 by SA0PR12MB7462.namprd12.prod.outlook.com (2603:10b6:806:24b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 15:23:25 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:303:86:cafe::40) by MW4PR04CA0205.outlook.office365.com
 (2603:10b6:303:86::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.9 via Frontend Transport; Fri, 7
 Nov 2025 15:23:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.6 via Frontend Transport; Fri, 7 Nov 2025 15:23:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Fri, 7 Nov
 2025 07:23:17 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 7 Nov
 2025 09:23:17 -0600
Received: from [10.254.40.65] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 7 Nov 2025 07:23:17 -0800
Message-ID: <e7520dfe-4405-422a-81e4-56a9c1a3ea4a@amd.com>
Date: Fri, 7 Nov 2025 10:23:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V11 00/32] IGT tests for the KMS Color Pipeline API
To: Alex Hung <alex.hung@amd.com>, <igt-dev@lists.freedesktop.org>
CC: <harry.wentland@amd.com>, <leo.liu@amd.com>
References: <20251030042801.2315866-1-alex.hung@amd.com>
Content-Language: en-US
From: Leo Li <sunpeng.li@amd.com>
In-Reply-To: <20251030042801.2315866-1-alex.hung@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: sunpeng.li@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|SA0PR12MB7462:EE_
X-MS-Office365-Filtering-Correlation-Id: 08fbfdd6-7df3-4b7c-d8ad-08de1e11977e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|42112799006|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nkp6TWhyZ3B3eVRLeUozK3dqZGFFTGhXZm5KUEduT3dUL0RFZ2JJSHdLKzN5?=
 =?utf-8?B?bzQ3Ny9vU1FJdSsvT0wrRS8weDRRMC9GaS9LdGs5ME9OU1p0RGZ6LzJ6Sm42?=
 =?utf-8?B?UVNlVmorb1gxR0ZTN08zOHF0NVdnQWtQVWgyczV4NUdzYlJDd2RHZi9OUnJ5?=
 =?utf-8?B?WFlKK2kxNHpCdExoSUJSLzl4eVVOMzlXdEIwbFErNTNmUmNZcDZhZml5Tit3?=
 =?utf-8?B?dmlTTW81by9UdTBtTkNtbDdEcTBpalVEbEttR2xVbjFyVkZnY21IaWF0R1ht?=
 =?utf-8?B?Z0xJZjlIV3U5WHVRcDI2MHJMSy9uRnlOOVh4RG9DaWxJbGlYR1M5Z0g4TmlG?=
 =?utf-8?B?MmNsVVJ4andGWkZsdDFjSDlpS3hOaGtTR1BoT2pteXFvZmhRZUV2SVhDb3gr?=
 =?utf-8?B?dmhLUU03RTFlRFVveS80N0ppOFhydy9LVWtDcFNFaXRRRlR0cXpaR2pUUnNt?=
 =?utf-8?B?UW5XZ0R0dXNqNGpBVXdEbGZsTTEvUWF0Rm01L0FhOWVvbXc2ZlpKbjdaYmlF?=
 =?utf-8?B?WE1ybWEzRUVLUyt5emFXWGszT0xqQ21wV1paSE5FUGlNeDFZcTYxUDFMK1Qx?=
 =?utf-8?B?NDJKb2dFWXJmUjIzU1Y1ZjlQbTh0c2xoQXVIdk9kMHpkUzh0TFFESVowRzFu?=
 =?utf-8?B?TDRUTzJyY2h3aGNWcnptVkhidytvWkdYeW10RjMzbHlzQ2liMHd3WHpZVmhm?=
 =?utf-8?B?MnFEYUIrMHl2TDBMMEdPSWp2L1VkQk9kWGtqQUhFOEplelBEWm1TNXhrekV6?=
 =?utf-8?B?S1hCaWk3NGZUQjc1S0VBQkpjZmFQZFVyaW1FYWNQWWVMMDBZbXZKSk9TSXlI?=
 =?utf-8?B?cklrWFZkRDJ1a2tndGNqS242dVFxaHdKV2llRkozWWMyQVNyTit1VnRoOUpI?=
 =?utf-8?B?bSs4K3NMRVczZ0RvU1ljcGFkMC84KzRFTzBTYkRiS1VwK295TEU5ZGJOa0RH?=
 =?utf-8?B?R0hORHY5OW9XQ1VraUtMMWE3QS85d0VRMktCUlp5Z0poWk1jWWEvckJuK1RI?=
 =?utf-8?B?TjFOZ1ZrbUFkMlhwQkNBQTUybHhTTlN3L2JqMkVSc3d2Y0hwNUZtaXNuZFdD?=
 =?utf-8?B?bHpoeUFlT1pnZEkyN0U1ZVVUSlQ0Wll6OXRvTDVlSzRNak1oQS9rL3d2TG5a?=
 =?utf-8?B?enJGR2RHYUg0c3ZnR3VIVjVkd3Y0TjZxUGRJbUd4cmRyMEltWEYxeVdrMWR2?=
 =?utf-8?B?Q1F3Wkdoc1J6bm9XUytOVk5Sczh3a2JabldCQ29SdzFvNUZSVXJEVlpWczkx?=
 =?utf-8?B?YXlGRHNHcVhVZ1dPTWRZdDZTY1ZPVlg2RlNsUHoyS3Jwc2ZzUmM1QURDdlg1?=
 =?utf-8?B?aXR2REZVUEVpVHZaendoYWR4Z1JMamdsWlJMK0ZUVG40ZURLWjlpd01Ud3V1?=
 =?utf-8?B?OTN4ZmdleElsdjZrTHRVMUsvdUEvUVN3ZjNGb1hCUnpuQzNUSUJnK3c1YXl3?=
 =?utf-8?B?QVhTdlBERU53U1hpVmRZOEJzdVNoSGxoOERDdFcxMXRHVXdlYnd4QjROUlNy?=
 =?utf-8?B?cjBIMklJdndtTVB0eGxIVmpBTWh3NzBYOHFpaXdwNDVsS2pzKysvaGc2QSsr?=
 =?utf-8?B?VkV1d21oZjF0bkV5WldCWE5tcExUWjA5ZUhQay9Gb21vL1hrT3RUTUREdjF3?=
 =?utf-8?B?ZVR3VlFhN0MwSitCMHI3NElHUmJzbWZRWHNTajZoVVl1YXlqaUpnOXZ3N2c1?=
 =?utf-8?B?Zlhnei81b3N0QnRKeWJNTGZqdVNWeWJVZ1J2VDFubEV0bUFBTkxoeFk2bXdI?=
 =?utf-8?B?eHk2cjdCRjB3a0FFWmdhNE5UYlZJV2xxYTNwVStKVVg2N3drWXRTRjRNT1dB?=
 =?utf-8?B?K3d1QWJHZzdlT1psQWpkRDVscmdWNWZaQjRjSGdkd1dVcTk3ZnhFZTBZYlU4?=
 =?utf-8?B?U2RXbzJmd056Rkk2b1FERHFGRndCaW8raDdLemlWS1pCSkllcmhVWWJCcUtO?=
 =?utf-8?B?VHpvWEE4aGdqL3BoM21FSGJ3VDlHQ1JrRStqMUJUWi9XWjNoL0xsRjlQeHZC?=
 =?utf-8?B?ZmRIaXpPd0FDYWt6Tm1pTUhnMGZObHQvNTNlbStjL0txbW55SHF0VklsVklP?=
 =?utf-8?Q?nrzgfU?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(42112799006)(82310400026)(376014)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 15:23:23.6771 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08fbfdd6-7df3-4b7c-d8ad-08de1e11977e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7462
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



On 2025-10-30 00:27, Alex Hung wrote:
> This series introduces support for
> * drm_colorop DRM objects
> * COLOR_PIPELINE plane property
> 
> Kernel changes can be found at [1] and on dri-devel.
> 
> It also adds a new kms_colorop test case that tests the color pipeline
> API. The tests are designed to be easily extensible with a "transform"
> and "compare" function pointer for each test. The "transform" function
> performs the transformations under test via SW routines. The "compare"
> function compares the DRM/KMS result (via a writeback connector) with
> the result derived via the SW "transform".
> 
> This series introduces a number of tests for pre-defined transfer
> functions, custom LUTs, 3x4 CTMs, a multiplier, 3D LUT, and a bypass
> test.
> 
> It tests 8-bit and 10-bit RGB surface formats, depending on driver support
> on the drm_plane as well as the writeback drm_connector end.
> 
> [1] https://gitlab.freedesktop.org/alex.hung/linux/-/tree/amd-color-pipeline-v12

Hi Alex, Harry,

With comments on patches 8, 29, and 32 resolved, the colorop tests are:
Reviewed-by: Leo Li <sunpeng.li@amd.com>

Thanks!

> 
> v11:
>  - Add new gamma 2.2 subtests (Patch 31 & 32)
>  - Remove unnecessary TODO comments
>  - Remove drmSetClientCap(... DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE)
>    out of igt_display_require
>  - Remove copyright (which is replaced by SPDX)
>  - Merge all colorop from drm_mode.h in kernel to a single commit
>  - Separate changes in kms_colorop and in lib to different commits
>  - Move sharable functions to lib, i.e.,
>   - get_and_wait_out_fence to igt_get_and_wait_out_fence
>   - detach_crtc to igt_detach_crtc
>  - Add --dump option to replace DUMP_FBS macro
>  - Misc fixes and cleanup in code and comments
>   - remove unused variables, functions and enum
>   - fix typos and incorrect indentation
>   - constify variables
> 
> v10:
>  - Merge some patches accordingly
>  - Change drm_color_lut_32 to drm_color_lut32
>  - Fix 16bit to 32bit coversions in configure_3dlut()
>  - Fix errors and warnings reported by checkpatch
>  - Clear dead code and redundant debug messages and comments
> 
> v9:
>  - Check !display->has_plane_color_pipeline before igt_plane_has_prop (
>    IGT_PLANE_COLOR_ENCODING and IGT_PLANE_COLOR_RANGE)  (Chaitanya Kumar Borah)
> 
> v8:
>  - Add a new colorop uniqueness subtest
>  - Include a patch "lib/igt_kms: Destroy colorops on exit"
>  - Add function documentation comment for get_writeback_formats_blob
>  - Fix indentation errors and a new blank line at EOF
> 
> v7:
>  - Add more documents and sync up with kernel implementation
>  - Update 3DLUT tests according to kernel changes
> 
> v5:
>  - Bypass test
>  - 10 bpc support
>  - Proper setup and cleanup
>  - PQ/BT2020 TFs
>  - 1D LUT tests
>  - Multiplier tests
>  - 3D LUT test
> 
> v4:
>  - Intel color pipeline work, to possibly be combined with v5 in a future iteration.
> 
> v3:
>  - Remove need for IOCTLs and libdrm changes
>  - Test colorop properties with both atomic and legacy code paths
>  - move enum drm_colorop_type to drm_mode.h
>  - Add descriptions for public functions in lib (Kamil)
>  - Use SPDX style license identifier (Kamil)
>  - Replace Skia license comment with copyright note in file header
>  - Fix kms_colorop subtests if applicable color pipeline not found
> 
> Alex Hung (12):
>   drm-uapi/drm: sync with color pipeline commit
>   drm-uapi: Add COLOROP objects
>   lib/igt_kms: Add writeback functions
>   tests/kms_colorop: Add a TF sRGB test
>   lib/igt_color: Add 1D LUT color transformation support
>   tests/kms_colorop: Add tests that exercise the 1D LUT colorops
>   tests/kms_colorop: Add multiplier tests
>   scripts/convert_3dlut.py Convert a 3D LUT to igt_3dlut_t array for 3D
>     LUT API
>   tests/kms_colorop: Add a 3D LUT subtest
>   tests/kms_colorop: Add a colorop uniqueness subtest
>   lib/igt_color: Add support for Gamma 2.2
>   tests/kms_colorop: Add Gamma 2.2 tests for 1D Curves
> 
> Harry Wentland (20):
>   tests/kms_writeback: Fix kms_writeback for VKMS
>   lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>   lib/igt_kms: Add COLOROP properties and helper functions
>   tests/kms_properties: Add colorop properties test
>   lib/igt_color/igt_fb: Add SW color transform functionality
>   lib/igt_fb: Add igt_copy_fb function
>   lib/drmtest: Add is_vkms_device()
>   tests/kms_colorop: Add kms_colorop tests
>   lib/igt_kms: Add support for DATA colorop property
>   lib/igt_color: Add support for 3x4 matrices
>   tests/kms_colorop: Add 3x4 CTM tests
>   tests/kms_colorop: Add bypass test
>   tests/kms_colorop: Add 10bpc test
>   tests/kms_colorop: Skip if writeback does not support fourcc
>   tests/kms_colorop: Refactor to use a subtest group with fixtures
>   lib/igt_color: Support color transform for XRGB2101010
>   lib/igt_color: Add PQ variants for 0-1 and 0-125 range
>   tests/kms_colorop: Add tests for PQ variants
>   lib/igt_color: add BT2020/BT709 transfer functions
>   tests/kms_colorop: Add TF BT2020/BT709 tests
> 
>  include/drm-uapi/amdgpu_drm.h |    9 -
>  include/drm-uapi/drm.h        |   14 +
>  include/drm-uapi/drm_mode.h   |   92 +
>  lib/drmtest.c                 |    5 +
>  lib/drmtest.h                 |    1 +
>  lib/igt_color.c               |  651 +++++
>  lib/igt_color.h               |  149 +
>  lib/igt_color_lut.h           | 4946 +++++++++++++++++++++++++++++++++
>  lib/igt_fb.c                  |   45 +-
>  lib/igt_fb.h                  |    3 +
>  lib/igt_kms.c                 |  412 ++-
>  lib/igt_kms.h                 |  102 +
>  lib/meson.build               |    1 +
>  scripts/convert_3dlut.py      |   94 +
>  tests/kms_colorop.c           |  704 +++++
>  tests/kms_colorop.h           |  266 ++
>  tests/kms_properties.c        |   94 +-
>  tests/kms_writeback.c         |   24 +-
>  tests/meson.build             |    1 +
>  19 files changed, 7570 insertions(+), 43 deletions(-)
>  create mode 100644 lib/igt_color.c
>  create mode 100644 lib/igt_color.h
>  create mode 100644 lib/igt_color_lut.h
>  create mode 100755 scripts/convert_3dlut.py
>  create mode 100644 tests/kms_colorop.c
>  create mode 100644 tests/kms_colorop.h
> 

