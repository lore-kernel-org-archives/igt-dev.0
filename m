Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F18F8CA5FC5
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 15:46:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1A710F13E;
	Wed, 30 Sep 2026 15:46:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IMs1Ew2l";
	dkim-atps=neutral
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010016.outbound.protection.outlook.com
 [52.101.193.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4E710F11A
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 15:45:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NzCasvlOtsPRRKRINq4BgoDkniwRwZWI44/W/9xgViInW710VtVT5zdrks5tqlvFambUaMQXoJ3q4o0QG5EzJ2AkMvn25XwqxoN2M0FvQO2KvoeQ0aroMIeneHvlrXeTBvYTwyCmHwp9u5llyTZiLFjxVJFsWFWYx99koDq0l1W6blNDr3NMdYwBvD1h6a/MigF6wa0TYt/RX5zFM9z5Hjp9l7KmK2ff9vTN/2NqssdoC71dPmutOplAY4yXpniTC0FndEeEKl3T30PqAUKMBq/uTRDdP+WxwNE9Etw+sgVb4OvgxSBVAf2QHbn7LfJ3TKtBAv255jp1CHMp99KOAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljhUQdtKb70bsKnDOk4m1ODGWYgJYU5A2ebgTMvEEPw=;
 b=N7mS5XcJdOkjAOMTJ9XfWYwQl4yzLxhw6YZ8BAIITdvk+4qdhzNc0kYv5Aa66eephCd9xBXJs2IjE48ami84Qo7hK+s3CGkfp251nuZ+pAn0jjCAD5rnp1rTlWLQG4AInSBmEeobJH82F0rGCy49BArgZRyaWhoucnFxQ6aSxD1RQR4P0Q0+yHCNX0fZ+dOUqIf9SLOY9JSkLd/lOgHS96V+jVOcjzxuoBq2Jb7bOSWi60UZG4xedEJaYvSxazjpyevbVl2/SSNZNsLF8ZcYvPczoAutqa83wG1aHq+3wzHRCNVp2/d7h4PjPvHulU1F7Lf4NSOyQTfsplcFP5aBzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljhUQdtKb70bsKnDOk4m1ODGWYgJYU5A2ebgTMvEEPw=;
 b=IMs1Ew2lpLEjqZbrOLqRcTyqfTyeWNK1rmMohaS4idvnRu4LT3xvP4esBcV4cL9KgdnmWEAeJa6TY8Fs7vEBn0YNYkcGOS6k1TXGMyiXHpZtrxaWrMJUAYJLs6aJs+tMDOaxAwxY82fA7Bu2ZLYCtiGDDMag9gExrmi25OWG4ss=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 15:45:18 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%3]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 15:45:18 +0000
Message-ID: <5f717f88-3f80-4350-beaf-020e60fa3a53@amd.com>
Date: Wed, 30 Sep 2026 11:45:12 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 7/8] tests/intel/kms_color_pipeline: move
 driver-specific test to intel's folder
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-8-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260902180016.303482-8-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::35) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: d2814b6c-6034-48ee-4d0e-08df1f09d3ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|7416014|376014|366016|11063799006|56012099006|10067099003|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: VJicNTv2mIR4aaK/3dbdJwWjS0g0bAyq/R1DHWRymPRbJVVsPgIzPT6c+dBYrtZV/CGNTuXb/Ak3oEAVjKh106uNF9MBpYwwEtHNUzTDPRkeXadIICjFd1hoky/jnA9DqUrUdrNR1iIdIBGAT/NLacmRNiCU2aafGIvKSFvfacpDywTJNsBLPnmh6NTZ4k1aPLkS65HytiBs4cnY55l0pKAI2HwF6CfSmO6JSyzuIT+zW4DsweEOKvaI5DTECdT+pnAJsxt6wJ/i3LtvcRbVssSSIVUt3CUH8Ixg7FKENrcZawTIv57Lf5N1h3YKx16v3K8i1GR16tm0ITT3qRBNVADsxv6+O1CTmN1RHvrhv/Pq78pcK9A4fZFSoYTM3ix3Xox+huAAhL8Apu43rRPoYi7ToQCVZEzcAmNUJnPdAhTYSAIS3oeEpa9xtKjPfeyHpLt9ZzoGitZzTypsiTX9lmkMZtjkHLaioqpMJVJ3AvToicjkwotNxqo8JGUuI4zF6329CTXCsc5dpa46B51tc8/wrN/Y+iAEmF8hS/qCzXEsrtXzqtMTWcuRmGTmTeirdup8yMB77nAu1nbMo8aQ2QIJv8GilnR67F8tUG+F8PeUCSWb6n6PL6q77KNtHSssZjPVCAuiCxft6KXTj3SHyCmtPKg+IUhO5gVZ4tfHO0c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2M3VDN5ODN1Wm9ISlZ6VmJ5SnhtdUJPa3Q2NzdWUEdma2hROU5BWWN4KzJG?=
 =?utf-8?B?YjlpaHdLcWJFSGMzNzZ0QmhEZm5xTm5SNVBtZGRrR3Bsd2V5dWVlbnNoYk51?=
 =?utf-8?B?YUVKb0p1MjJrVVVnLzRXU29ybGttaSs2cU9YWFlHVk5EZ2pUZWxTL01GUW8y?=
 =?utf-8?B?Q296WFB4S2ZuL3ZldzFqd2VvYk5Pdm5Yd1loNUhwcWlUVHRkeFB1Tmh1Znox?=
 =?utf-8?B?bThwTVh5U2Rha21RQnpLcVlDMGdzbUY1TjlmQWVDK01DVkZpSzBndmpURzFR?=
 =?utf-8?B?b0lZQlY2eDdPY1hFZ1ZWL1NMOHdFaWlaOW8vV0JXMndaVEloZnhpNHowQnY1?=
 =?utf-8?B?UmF5TFJGa3FDdlo4TUJEU09kOGFKaVVrejBWaTN6OU11VDRheG1iRUlramF5?=
 =?utf-8?B?ZW8yci9JcUFyaDlrMlVJZ2FTb3F3YzhlbCtmWVFONXV3WGMybTAvRWVwTkQ4?=
 =?utf-8?B?bGFlS2pRR3FhUEhNbHVld1pQbTdiaFRENGNRWmlubzVJUmN2YW85WnNyd1Rz?=
 =?utf-8?B?b1o0SjYzOVViUUNjYnU0VCt5TlZzRUE4T092a1dQZkRrbFJ3RFFZT3lDVEc5?=
 =?utf-8?B?K2ErRW55WHZ4a21HQUZxYUROUVJNQVhmbFpvSnRrOXJqMDZyWFdONTErK0xn?=
 =?utf-8?B?ciswcTVMdVNTTGtNaC9FNThWNXhSWTVEN0U1Q0F0WHFJb3AyRnZTMng0RzdK?=
 =?utf-8?B?U2pFTEdVSjhxT0ZvdEFhT05hM3g1aEtQRjV0VXU0aGV5L0gxbVh1VCtRbjU2?=
 =?utf-8?B?eUw0NUZsQnVVRGh3NHBzelpidVRUUjNpNU9QYVByV1FWY1N4OThSUWIyZ1My?=
 =?utf-8?B?blNBTHNWWGx4TTZVWSs1aFRmWXg4MDAvZ2pLUFMzd0FRN2NNY3Y0a21kTlQ0?=
 =?utf-8?B?N2RIRUV4Rm5ZMzhoQmdocmdYQThaWmx5bTRXWHhUalZRUEI0c0pENXZDZnpH?=
 =?utf-8?B?aVhPd1NSSk51SGF1eUlRQk9lSEJLN1psU0JpbmUzNEFRZENCckRjdUphaXpU?=
 =?utf-8?B?L2tQOGhBZnU1K3dCaXVSQldQM2ozb2IvN3ZzQU5nN1NXY3paUnM2Z1hjaEIz?=
 =?utf-8?B?djNZNXFhbENmNWErNUl3QXc3U0ZCdS9nUW1sQVJ6ZjNhVEZHUFVkVUdhM051?=
 =?utf-8?B?Z2ZjTkVuVFZQMVlKNzI0YlJnTm94dWpMOThzVlBSTXh0N2YzQ25xWlhtS0ZR?=
 =?utf-8?B?TEF4cWpaY2w4TDREdDdVMlp3WjFIeUM1RVdFVDMrcUVVZ2RzOVZDQmJuakpY?=
 =?utf-8?B?MU9UcS9yb2tRVVdwaU9PNHN1ZFBkSEMzdzRlalRFTDBBZ0FRWFBYYUhId1Jm?=
 =?utf-8?B?YlVIcDNTSE1IeGpMOXBIcmt6ZHg5TktQQ1VqWm5YZ1V2Zml1L0pTbi90Vnps?=
 =?utf-8?B?dSttVjUram1Sb0FUbkpBenBMeGtiZlJvbVpzNkVYVTA2aUpUOFhmalJNTDRU?=
 =?utf-8?B?eFZCK0FRWHM2WmJMZHFpaWpsSW41VzdVcEVZSmNVa1FLTEJFZ3F1WXRGSWda?=
 =?utf-8?B?bHc4QW5tM3MzdWROVzZuTkpZYVo0RzkzbnY1Y2N5L0lIaFp4b2h5a2N3VGRD?=
 =?utf-8?B?Q1NiZzR5bHg1bGtaVkM4Rmh6dUZzUnF0ZkZHOWFLbnFWTzV1UGRhY0JzamxR?=
 =?utf-8?B?Y2ZuZDZHeUhHL01leFhySldQK0k1OFhFR3pGS21VYkVOR0tKREdHcWF2bDI1?=
 =?utf-8?B?WkRHVitWVE5KYXZoSDdSbmpHSk1BVXJzdUcvYzNwRGhvRWdrZHk4bGtTcW1X?=
 =?utf-8?B?cDQ4Y3ZLemhseHh6MVF6bmRJTjU0RXpxWEozT2ZTN2g1UFlyR2xjNUd1VUpB?=
 =?utf-8?B?VmZSbDUzZEZjdjI3cWhoeDZsRnZ4SkRyZENKSXBSZEdjZDM3d1cvQURBVXNt?=
 =?utf-8?B?Zi9MbjMzOGsrSXVxRnBBUmIxQ1dxS3JHWDE4cGtHQXMzUXN2aTlldGRZc3da?=
 =?utf-8?B?bVB3NjVuWU5iVjVlcDVLRk1VTUFkMVp4WTNPK253K0tucUVKdmdFOURMYWpF?=
 =?utf-8?B?R2xyanVFSHZYSVVJUVVhUzd1bDNhOVRFYk0zRHlhQUw3WE4zMGxNSHBTWkxj?=
 =?utf-8?B?OEJIU0pnMFY4cVFkQUtMcEZQaFVlRjU4VGVLRWlUb0hCSE9jV1JyQXgrMFRI?=
 =?utf-8?B?aVRwUnRoQjlmVzBTWXZkUkxJTUhoM01zN1VHUnUyREtUQy9MaEVNNklzVStl?=
 =?utf-8?B?VWRvajZwSEJBdnVmaUoxaXpkM0VjM0x1b2cyaTZ1RFI2OVpNNWFCc2M3Zjlp?=
 =?utf-8?B?VmtkalM4RVEzOC8vcStia0plbVZ4WlZJUmpLSndkSXQ1QmliRmdLMjE5OEww?=
 =?utf-8?B?VlNLMElqR1lrbktOSktsMmpPVTBHNFdYaFhvd2pwT1pWNytBNlNFdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2814b6c-6034-48ee-4d0e-08df1f09d3ec
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:45:18.2123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oHLcM7bfMsNps9JnELcwqJHVkYYx7zhzPVGkguotdw0fLre/ZBEAjCEni5sXH0fyb8jgay0zGGq7te+ZB2/7YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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

On 2026-09-02 13:58, Melissa Wen wrote:
> As stated in test docs, the kms_color_pipeline isn't driver-agnostic. It
> validates color transformations using CRC, which is less accurate than
> comparing writeback buffers, but the i915 and xe drivers require CRC
> validation when the writeback connector is not supported: kms_colorop
> tests don't run when writeback is not supported. Since other drivers
> that support colorops also support writeback, this CRC option is
> currently only required by Intel; therefore, move kms_color_pipeline
> test to the Intel folder and only open Intel's drivers (not any).
> 
> If the CRC-based colorop test is useful for some other driver, the
> required generalizations and switch to the common folder should be made.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Acked-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>   tests/{ => intel}/kms_color_pipeline.c | 2 +-
>   tests/meson.build                      | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>   rename tests/{ => intel}/kms_color_pipeline.c (99%)
> 
> diff --git a/tests/kms_color_pipeline.c b/tests/intel/kms_color_pipeline.c
> similarity index 99%
> rename from tests/kms_color_pipeline.c
> rename to tests/intel/kms_color_pipeline.c
> index f71416ce1..3d41b811b 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/intel/kms_color_pipeline.c
> @@ -353,7 +353,7 @@ int igt_main()
>   	data_t data = {};
>   
>   	igt_fixture() {
> -		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		data.drm_fd = drm_open_driver_master(DRIVER_INTEL | DRIVER_XE);
>   
>   		/*
>   		 * Plane color pipeline support requires atomic modesetting.
> diff --git a/tests/meson.build b/tests/meson.build
> index 1ac89bab7..c1a436420 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -25,7 +25,6 @@ test_progs = [
>   	'kms_atomic_transition',
>   	'kms_bw',
>   	'kms_color',
> -	'kms_color_pipeline',
>   	'kms_concurrent',
>   	'kms_colorop',
>   	'kms_content_protection',
> @@ -250,6 +249,7 @@ intel_kms_progs = [
>   	'kms_busy',
>   	'kms_ccs',
>   	'kms_cdclk',
> +	'kms_color_pipeline',
>   	'kms_dirtyfb',
>   	'kms_dp_link_training',
>           'kms_dp_linktrain_fallback',

