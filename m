Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2DF5C87FCB
	for <igt-dev@archiver.kernel.org>; Wed, 30 Jul 2025 22:20:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB5D10E45A;
	Wed, 30 Jul 2025 22:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3GGKeanB";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEEE10E45A
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Jul 2025 22:20:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=krGkfjs8HZONr/3nDD6QRaTPPng3ehbNJbcrPzrmRbhBTJxe5ThT6K9/hKmMO/R8l4psBeXKc4fUCdgS6hyy01S0sXMmQwDq58I7rlxqcRdIiD9EZObFdySBaPoyUKFcAssBdtyYnU9f+DiYYA71Lk2EMr0fhDqGKLhTxLKzTNIPKtnEhOy02aetYMg/XVucqQWPvKKIA7kCDHyd7OkkBurDck8mJY7Fr8r1vJ9XRqldCxfMRh21bSrwANG9Ij3fq56LFx90xE6PaOYiTjYLjQ/WQ44AYplS4ISdhqMo7tGIuEmZ4lMZDsThS+KfimAYXzIOk9iGCao2BCSIF61vTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8sGOqte8DcPTyelSiiheq3Lw8b1k182sSfovWFgMkZg=;
 b=GTWMzo+zroEIHnp+37yh/2xEXM5h2yf9Aq9xzZ0+cDj3odltxWLnpJud20Jx/CWzgc0u5t13Z2f+Q17IRVh4M8miko+Q812JIGVg6UoEdfpBn6eLA1W65lreT6X3o8dv7BwCmdP8ogiFrxdDHO09KC/LKB1GFeg4FtrNPJcmZbz0G8t6Sx80lGM9Ky62eWCMADnGqybQzm1Gb88kqahSgE46YJHf3xDATuN2xF+mAEANPcs4uN/TboyN/7UyV/dsk3C04zNsDYX3tFY3F/63bbCqWl1o5zJM9D9dV3nTmaYYVENx6AZPIpBGeFx8mlTHDxq/610bHJ6YT62sezN23A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8sGOqte8DcPTyelSiiheq3Lw8b1k182sSfovWFgMkZg=;
 b=3GGKeanBLSQeB9yNfLmRAP6Q+FxqJ/sGNPAp3QTNdUrT1cfNi6HYxzKU/f8RcLOiRVdXHmDpjlJWpBp1y1RFqPM53xnYuM52cDrvD6ypRvKVIguaKDpxL8a4+GObDEI3PCYQ3jWmuEUddNS+teM4pbWPNSvPahoHZXHd+M6h4Jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB6420.namprd12.prod.outlook.com (2603:10b6:510:1fc::18)
 by CH3PR12MB8756.namprd12.prod.outlook.com (2603:10b6:610:17f::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 22:20:32 +0000
Received: from PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af]) by PH7PR12MB6420.namprd12.prod.outlook.com
 ([fe80::e0e7:bd76:e99:43af%3]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 22:20:32 +0000
Message-ID: <ad5c8bf0-ff18-488e-b7d5-a6d4dd3a36e4@amd.com>
Date: Wed, 30 Jul 2025 18:20:22 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/amdgpu: Add multi-GPU test cases for
 AMDGPU basic functionality
To: "Jesse.Zhang" <Jesse.Zhang@amd.com>, igt-dev@lists.freedesktop.org
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
References: <20250729072221.3717641-1-Jesse.Zhang@amd.com>
Content-Language: en-US
From: vitaly prosyak <vprosyak@amd.com>
In-Reply-To: <20250729072221.3717641-1-Jesse.Zhang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0298.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:6d::25) To PH7PR12MB6420.namprd12.prod.outlook.com
 (2603:10b6:510:1fc::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB6420:EE_|CH3PR12MB8756:EE_
X-MS-Office365-Filtering-Correlation-Id: abd61529-52cf-4dfd-0764-08ddcfb74c0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUtLVkpVdnR5Qy9sZllmalRsR3pYUkhyMVBWR1p0MVRBOEkrZElLbFJlYmxF?=
 =?utf-8?B?bnNzYmI1dkIvenBQTWJaU090MGJnTWlIbHcyVTU5ZHNieVN4emhJZXBTdXJo?=
 =?utf-8?B?MWUyVWViVldFTUJ0N29ITE0rNmpLNWErc1pOWm5vS1B0cVNHcGJMTTcwbklE?=
 =?utf-8?B?QUZ0Y1ZTRnU2MzFmWlgwdzNDbFo2Q3BrNUx3UXpYWWpDRzl5VlUrajFoQjFS?=
 =?utf-8?B?cGxqM3pHNVloUit4NjZmNW45eW9jQkl4M3BqTDFoR2ZaRUtOTmtSaStjNFdh?=
 =?utf-8?B?WlM1MUU3bWtkT01VcUJoeWFybG1VTlVOZjNRczZhcCt3bHpEMGx3bVRCdzBV?=
 =?utf-8?B?YnluZVV6d3VHSFJJTHFGcHBJWGs5STBiam82WTJZL0JLMHh4T2Rwb3lWSlZr?=
 =?utf-8?B?ekI2MnRqWEhvYTQrOHNhZHJSWXVUTnd1TFZtOHJiUHIzRkhHY3pBWnJpWGRB?=
 =?utf-8?B?emxZR0R1bjNIaU84MVBYY0ZHTXBrcTEraTNVSzdlb2VHeEt2RkZIQ3kxR2FU?=
 =?utf-8?B?V2I0NS9CM3pZMjhsY0JwRTZueStOcFc0L0liQWpDWm83MDZVZDAreWxaWllr?=
 =?utf-8?B?YXJ2TlZXLzJpeGlsell5Uzd6bjhERHl2V3V6cVNlMForQ3FwUzBSYUVwdUdR?=
 =?utf-8?B?WEl5MTR0SGFFREgwR3poUzg5VndwZldtMENabUIxSE4xSVNkSHloSmpEbit2?=
 =?utf-8?B?RWllbkJMdHpNYzEzbUNDOFphK3VjVkZxTVp0Uk1lMzgyazgveFB1bE1zbXpu?=
 =?utf-8?B?YzhDRHd4TFJUOXBsZkUzUWkxdzI2SmlBbHYxVnBLbDZROU43UitMcUtsM1Vu?=
 =?utf-8?B?eitOR0Y3dmttck91TkQzZ0JqbEJaMmZUUlNCaXRKREVOSno5MW5qY0FJZjNq?=
 =?utf-8?B?T2FXck5ac0tMUEJOaVMwRE43UkFsRkVuT21XMjhhMG4xbG5Gb1NNL0VEcUll?=
 =?utf-8?B?Z2ZwamluRUVGWkVqclVxaWMzNy9vVzdxVEp6L2NCSlA3djYzSWRSR21tRGp6?=
 =?utf-8?B?dGd4MWEvcUIvZEljYzBrZzBzRXp5bUE3NEhWWmFRNFFCU3lVaGMvK3pvY0Vv?=
 =?utf-8?B?NGFyNkhSTnRNTjd6WFVGTEpiTk4zWGIrQnh0aEtFWTh4b2E3N1ZVZ0NKb0xm?=
 =?utf-8?B?bTFBeGF6UjFqYWI2WCs3ZUdxcHEzWFJKUWVSaWNJVkZOeWpCeTFPUzN1RWJO?=
 =?utf-8?B?UmpmL0FnTE9tNVlCbllVMXVQejNzQzdFbTNQWXdRUWpaa3ZEUGJoSy9UZTBE?=
 =?utf-8?B?NE9lYm1CRTNUbEJzQTdnbnJPMWtWcS9RSEd5bElZOHBJbTRWN1V5N0RVMG1V?=
 =?utf-8?B?aS9kcm1lQUtSdmRGZ2tJWWplZVAwVWtkN0F2WVcxWHFwd3FBL0hkT0FnNUN5?=
 =?utf-8?B?aFNtQVg1aFZ5NWtBT1prZERPU1RsU1FzL2NWMkVZUnRMOXZJdCtzVzR1WDFa?=
 =?utf-8?B?YUlSckYvUFhacUVVZUNnVm5DZjdNTUpsMUlNYVQ3WmUyRm9KZHd2SHF4Wmdj?=
 =?utf-8?B?cTl3YlJQdStpZmd2cUdZK3RZUFU3TzJ4eUNsRTBCTVE1cS9XQ1VtWVVhUklJ?=
 =?utf-8?B?VE1RdElaNWk1WkJ2dDZOcmdTa0Z4UXdWTHp4K1pTTWtZUFJFWEFhekdYWkpU?=
 =?utf-8?B?QjZaRGF4dFk1bnpWTmVieDVVZDFvUzFWKytqSlovVG1XZmZvbjNHRWJsTHlh?=
 =?utf-8?B?c2pGSjhmbWlsVUxoMitlM0svbHc0djIzRXFrK2JqaE9zS2FZNkpyRklRUkRO?=
 =?utf-8?B?dkdteE5OZ0JJQy9xNWVxNjJrZDBvR2Z0S0ViUlpIV0ZkUzlOTHdrZTJldk9K?=
 =?utf-8?B?M0VDSktJZzYxQm4vSnlvdTY4YUVhbityNnk1UWpOeWt5Z3oyYW5sdEJWR1oy?=
 =?utf-8?B?eWpLYVpPNzhHK3pYdzFMaUwwRkJMeG9Xc0ZoSlcrN0IyUXExNVpsNVk2c2Ev?=
 =?utf-8?Q?r0qDt/Ar63A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB6420.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0hyZGpYdU9CZVlzci9Yd0VoQVBGUC9qR0FxMXpqcWtWOEhzRmt0cjF0cVI2?=
 =?utf-8?B?NjFuaXY1ejZ0cEVMNTBtK0VKMk1sZnhsZmVKbnZ6d3JCN1pFWlpIdDgxQ00r?=
 =?utf-8?B?NE9RUnN6aWo1N253c0VoWm1oMFdTM29YOG9EZ3JtaW91WTFMeWJuNmFhYTRa?=
 =?utf-8?B?ZzJMWm9TNEhpQXJjaGtFbjhyUzVZdmJEWFhUelZOdlVYQUdSczJLdFZBZUpl?=
 =?utf-8?B?Q1RmTm5rQWFybFNZUUFDM3NkWlNzS3JaYURYZXQvc2VyUlV3MzlkNFJqelNm?=
 =?utf-8?B?cnNPWFgybnRkam13bUplcU90SldwZkt3MWxtNUpjV25kbWpvTDlKRnFsd3pJ?=
 =?utf-8?B?RTMwd0dUaHdBREJ1YVF5bVhGMHZVTnI5MEFpOTdMUFM2WVZYNUdxaWlHSmZr?=
 =?utf-8?B?NEE0bEVDVDhybEVQTmFrRTdzSTRKU0VidXYzS0RsaVd6TnJSMXFBVnFTaUJE?=
 =?utf-8?B?c0dwUy9kcGtFbVNOaUxYQnJ1Q1JzVkZPYlREVHIrSVM5Z0JIUjhEV1VTNU5m?=
 =?utf-8?B?aFpoOEgrTU4vdGJ3b0tHSmxLZ1JYdEVQY1FjY296ak1FRDJvd1FaQXNudjRn?=
 =?utf-8?B?WjJtVWlsM0pwaGt2MFh0NUVobFh0QnZKem1MOURkNTlMNVlyRUE2T00zTFRk?=
 =?utf-8?B?OWNyYzZncXVRaVZmM2hqb1dWZGlRTGFPSVNUOXZqK2RXZ2FBR2xwWnk5OG1J?=
 =?utf-8?B?WTVSRVluWElZTU9odzlHbVlTSVNEVEhmS1FDa1k1bDBCZnZJRFlXdCtoV3Av?=
 =?utf-8?B?c1dnek52QjRidDVKMFJ3MkFXT0RRbWs4RlREZWcyeXVzalRuVjhJcjhnZW1L?=
 =?utf-8?B?am5kM280alJqbUc4L2gyOC9TdCtnSDdBd0M5OWVXejZvRDJ3cll0cSs0eFYr?=
 =?utf-8?B?RDRaVEt4WlF6SkZPVDhzNFVEWEVmQyt3YU9jZyt6dlZONHJDSStvNzhsY21n?=
 =?utf-8?B?QkhaenVuVzJiemZNRGJhNDJkN2huMncrQndpbHl4TnJQSFF4Q2tDWFpFRHkz?=
 =?utf-8?B?dEVBNFN4U3VYTEozOWNMNE1qMlNENm4rbDMwd0RFQWVoZVRNM3JmUjVEMTM0?=
 =?utf-8?B?Y3dxcEhTTUN5R1ByL2l0SEkxanhHZnY1UG83MmpBc0NWK0J3aFJBM0RjeE4x?=
 =?utf-8?B?dVJTRm00UCtwL0xNbEYwc2lzVTZUcWNOK1FEdGZEK1FLV3J6SDZNOWJ4Qm1J?=
 =?utf-8?B?cmsxT2d1YzNnc3dEQ0tQNU54R3BSdnRycjRWNmtCTHlvbTZpaW9ablFwenYy?=
 =?utf-8?B?R0FnTlRoVFhVcUJJUlVSTk1FNFN3clVRS1Q0V2tlVUQzdE4wQ0V3VXVHSWd4?=
 =?utf-8?B?Zjcxd0duSytaNUp1SE1BbXd3YjZMQlJ6M0ZGakZuMXpkazg1cWs0QWgxY3Jw?=
 =?utf-8?B?T2EwQW9FVFhGS0svaTZnZGtZTWJIRUtmRzkzc1hWUGQ4NlB4SzZKY1ZqcmFs?=
 =?utf-8?B?QWlaaFkvM3ZPK3lVTGdZVmhMVXdGOFdKQW53bnVmQVMwczZjcFZLSXNSbWRR?=
 =?utf-8?B?K05JZnVKV3pxSzlOMC9Ucm1pTEpva3loSDcwckppR0JFeUcrcitpeWhHY0th?=
 =?utf-8?B?M2YvWVFoV1RDNHc5THh0R0N4OEpKR0xncm9peEZaeVhzbUNGQ1RWdmprRkdH?=
 =?utf-8?B?U2UzUzZpN0ozS0s5VWJvVGFrM2lPaUxqT0UxNExBMllXbk8vRmQyZGd2RnZI?=
 =?utf-8?B?WStqWTBXVTRRMC9LdTZYNktTOTJDa1dTNVBpcmJRdW1FeGNpYlAwNTZEL0Za?=
 =?utf-8?B?NTA0V3Zia1BmOFJYVWdQcDRkNnp3VTZSUDlwRGhxb2poZmw3b1VKa3BvWTY4?=
 =?utf-8?B?UHJRbHM1RjZmSWxPaUJBWWlPUlFST3p1bks0R25VS3c5S1c3N3FBZDlrZWZG?=
 =?utf-8?B?bjJ3NnJhckhKNzFMUHRvTk5tZ2ZYU1luS01CMlV1ZHN1YTJWWEdVand2dDZL?=
 =?utf-8?B?bDU1dkxsS0pBTGs5VlRWb2N5VXQ3d2RsbmRvMlF2QVdkVjcybHUyaGVkVEE0?=
 =?utf-8?B?RU41RnFQazY2TmVheHNtMGc5aHg2QVRURkpRamJIL2VJKzRUYSt6SVhEYVhM?=
 =?utf-8?B?YWs5dTRKOTZqeVF5RExrd04vYm52RjAvM2xmbytCWkVSWm4vbmROcERQbVYz?=
 =?utf-8?Q?px+4ESNr3jJyDF66kcO6TYHNF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd61529-52cf-4dfd-0764-08ddcfb74c0c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6420.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 22:20:32.1629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HWqoMs0/yPTyHabnEiZYNpFev+T3uZIbOGs/nyMH4XpCPvY+1G7g+w+//LfIA5syfArC+vD+yUJOIG6itseUFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8756
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

Reviewed-by: Vitaly Prosyak  <vitaly.prosyak@amd.com>

On 2025-07-29 03:22, Jesse.Zhang wrote:
> From: "Jesse.zhang" <Jesse.zhang@amd.com>
>
> This commit introduces a new test file `amd_basic_multi_gpu.c` that
> verifies basic AMDGPU functionality across multiple GPUs. The test
> includes:
>
> 1. Memory allocation tests for different memory domains (VRAM visible/invisible,
>    GART cacheable/USWC)
> 2. Command submission tests for GFX, COMPUTE and SDMA IP blocks
> 3. Multi-fence synchronization tests
> 4. User-mode queue (UMQ) tests when enabled via environment variable
> 5. Combined queue testing across all IP blocks
>
> The tests leverage the existing helper functions from the AMDGPU library
> while adding multi-GPU support through forked processes for each GPU.
>
> v2: move the multi-GPU subtests into a separate file (Vitaly)
>
> Signed-off-by: Jesse Zhang <Jesse.Zhang@amd.com>
> ---
>  tests/amdgpu/amd_basic_multi_gpu.c | 425 +++++++++++++++++++++++++++++
>  tests/amdgpu/meson.build           |   1 +
>  2 files changed, 426 insertions(+)
>  create mode 100644 tests/amdgpu/amd_basic_multi_gpu.c
>
> diff --git a/tests/amdgpu/amd_basic_multi_gpu.c b/tests/amdgpu/amd_basic_multi_gpu.c
> new file mode 100644
> index 000000000..22a93ca08
> --- /dev/null
> +++ b/tests/amdgpu/amd_basic_multi_gpu.c
> @@ -0,0 +1,425 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2014 Advanced Micro Devices, Inc.
> + * Copyright 2022 Advanced Micro Devices, Inc.
> + * Copyright 2023 Advanced Micro Devices, Inc.
> + */
> +
> +#include "lib/amdgpu/amd_memory.h"
> +#include "lib/amdgpu/amd_sdma.h"
> +#include "lib/amdgpu/amd_PM4.h"
> +#include "lib/amdgpu/amd_command_submission.h"
> +#include "lib/amdgpu/amd_compute.h"
> +#include "lib/amdgpu/amd_gfx.h"
> +#include "lib/amdgpu/amd_shaders.h"
> +#include "lib/amdgpu/amd_dispatch.h"
> +#include "igt.h"
> +#include "igt_multigpu.h"
> +
> +#define BUFFER_SIZE (8 * 1024)
> +
> +/**
> + * MEM ALLOC TEST
> + * @param device
> + */
> +static void amdgpu_memory_alloc(amdgpu_device_handle device)
> +{
> +	amdgpu_bo_handle bo;
> +	amdgpu_va_handle va_handle;
> +	uint64_t bo_mc;
> +
> +	/* Test visible VRAM */
> +	bo = gpu_mem_alloc(device,
> +			   4096, 4096,
> +			   AMDGPU_GEM_DOMAIN_VRAM,
> +			   AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED,
> +			   &bo_mc, &va_handle);
> +
> +	gpu_mem_free(bo, va_handle, bo_mc, 4096);
> +
> +	/* Test invisible VRAM */
> +	bo = gpu_mem_alloc(device,
> +			   4096, 4096,
> +			   AMDGPU_GEM_DOMAIN_VRAM,
> +			   AMDGPU_GEM_CREATE_NO_CPU_ACCESS,
> +			   &bo_mc, &va_handle);
> +
> +	gpu_mem_free(bo, va_handle, bo_mc, 4096);
> +
> +	/* Test GART Cacheable */
> +	bo = gpu_mem_alloc(device,
> +			   4096, 4096,
> +			   AMDGPU_GEM_DOMAIN_GTT,
> +			   0, &bo_mc, &va_handle);
> +
> +	gpu_mem_free(bo, va_handle, bo_mc, 4096);
> +
> +	/* Test GART USWC */
> +	bo = gpu_mem_alloc(device,
> +			   4096, 4096,
> +			   AMDGPU_GEM_DOMAIN_GTT,
> +			   AMDGPU_GEM_CREATE_CPU_GTT_USWC,
> +			   &bo_mc, &va_handle);
> +
> +	gpu_mem_free(bo, va_handle, bo_mc, 4096);
> +}
> +
> +
> +/**
> + * AMDGPU_HW_IP_GFX
> + * @param device
> + */
> +static void amdgpu_command_submission_gfx(amdgpu_device_handle device,
> +					  bool ce_avails,
> +					  bool user_queue)
> +{
> +
> +	/* write data using the CP */
> +	amdgpu_command_submission_write_linear_helper(device,
> +						      get_ip_block(device, AMDGPU_HW_IP_GFX),
> +						      false, user_queue);
> +
> +	/* const fill using the CP */
> +	amdgpu_command_submission_const_fill_helper(device,
> +						    get_ip_block(device, AMDGPU_HW_IP_GFX),
> +						    user_queue);
> +
> +	/* copy data using the CP */
> +	amdgpu_command_submission_copy_linear_helper(device,
> +						     get_ip_block(device, AMDGPU_HW_IP_GFX),
> +						     user_queue);
> +	if (ce_avails) {
> +		/* separate IB buffers for multi-IB submission */
> +		amdgpu_command_submission_gfx_separate_ibs(device);
> +		/* shared IB buffer for multi-IB submission */
> +		amdgpu_command_submission_gfx_shared_ib(device);
> +	} else {
> +		igt_info("separate and shared IB buffers for multi IB submisison testes are skipped due to GFX11\n");
> +	}
> +}
> +
> +/**
> + * AMDGPU_HW_IP_COMPUTE
> + * @param device
> + */
> +static void amdgpu_command_submission_compute(amdgpu_device_handle device, bool user_queue)
> +{
> +	/* write data using the CP */
> +	amdgpu_command_submission_write_linear_helper(device,
> +						      get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
> +						      false, user_queue);
> +	/* const fill using the CP */
> +	amdgpu_command_submission_const_fill_helper(device,
> +						    get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
> +						    user_queue);
> +	/* copy data using the CP */
> +	amdgpu_command_submission_copy_linear_helper(device,
> +						     get_ip_block(device, AMDGPU_HW_IP_COMPUTE),
> +						     user_queue);
> +	/* nop test */
> +	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_COMPUTE, user_queue);
> +}
> +
> +/**
> + * AMDGPU_HW_IP_DMA
> + * @param device
> + */
> +static void amdgpu_command_submission_sdma(amdgpu_device_handle device, bool user_queue)
> +{
> +	amdgpu_command_submission_write_linear_helper(device,
> +						      get_ip_block(device, AMDGPU_HW_IP_DMA),
> +						      false, user_queue);
> +
> +	amdgpu_command_submission_const_fill_helper(device,
> +						    get_ip_block(device, AMDGPU_HW_IP_DMA),
> +						    user_queue);
> +
> +	amdgpu_command_submission_copy_linear_helper(device,
> +						     get_ip_block(device, AMDGPU_HW_IP_DMA),
> +						     user_queue);
> +	/* nop test */
> +	amdgpu_command_submission_nop(device, AMDGPU_HW_IP_DMA, user_queue);
> +}
> +
> +static void amdgpu_test_all_queues(amdgpu_device_handle device, bool user_queue)
> +{
> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX, false, user_queue);
> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_COMPUTE, false, user_queue);
> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_DMA, false, user_queue);
> +	amdgpu_command_submission_write_linear_helper2(device, AMDGPU_HW_IP_GFX | AMDGPU_HW_IP_COMPUTE |
> +							AMDGPU_HW_IP_DMA, false, user_queue);
> +}
> +/**
> + * MULTI FENCE
> + * @param device
> + */
> +static void amdgpu_command_submission_multi_fence(amdgpu_device_handle device)
> +{
> +	amdgpu_command_submission_multi_fence_wait_all(device, true);
> +	amdgpu_command_submission_multi_fence_wait_all(device, false);
> +}
> +
> +igt_main
> +{
> +	amdgpu_device_handle device;
> +	int fd = -1;
> +	bool enable_test = false;
> +#ifdef AMDGPU_USERQ_ENABLED
> +	const char *env = getenv("AMDGPU_ENABLE_USERQTEST");
> +
> +	enable_test = env && atoi(env);
> +#endif
> +
> +	igt_fixture {
> +		uint32_t major, minor;
> +		int err;
> +
> +		fd = drm_open_driver(DRIVER_AMDGPU);
> +
> +		err = amdgpu_device_initialize(fd, &major, &minor, &device);
> +		igt_require(err == 0);
> +
> +		igt_info("Initialized amdgpu, driver version %d.%d\n",
> +			 major, minor);
> +	}
> +
> +	igt_subtest("multi-gpu-memeory-alloc") {
> +		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
> +			amdgpu_device_handle dev;
> +			uint32_t major, minor;
> +			int res;
> +
> +			/* Initialize device */
> +			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
> +			igt_assert_eq(res, 0);
> +
> +			/* Run test */
> +			amdgpu_memory_alloc(dev);
> +
> +			amdgpu_device_deinitialize(dev);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("cs-gfx-with-IP-GFX") {
> +		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
> +			amdgpu_device_handle dev;
> +			uint32_t major, minor;
> +			struct amdgpu_gpu_info gpus_info = {0};
> +			bool arr_caps[AMD_IP_MAX] = {0};
> +			struct drm_amdgpu_info_hw_ip info = {0};
> +			int res;
> +
> +			/* Initialize device */
> +			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
> +			igt_assert_eq(res, 0);
> +
> +			res = amdgpu_query_gpu_info(dev, &gpus_info);
> +			igt_assert_eq(res, 0);
> +			res = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
> +			igt_assert_eq(res, 0);
> +			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
> +			igt_assert_eq(res, 0);
> +			asic_rings_readness(dev, 1, arr_caps);
> +			/* Run test */
> +			if (arr_caps[AMD_IP_GFX])
> +				amdgpu_command_submission_gfx(dev, info.hw_ip_version_major < 11, false);
> +			amdgpu_device_deinitialize(dev);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("cs-compute-with-IP-COMPUTE") {
> +		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
> +			amdgpu_device_handle dev;
> +			uint32_t major, minor;
> +			struct amdgpu_gpu_info gpus_info = {0};
> +			bool arr_caps[AMD_IP_MAX] = {0};
> +			int res;
> +
> +			/* Initialize device */
> +			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
> +			igt_assert_eq(res, 0);
> +
> +			res = amdgpu_query_gpu_info(dev, &gpus_info);
> +			igt_assert_eq(res, 0);
> +
> +			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
> +			igt_assert_eq(res, 0);
> +			asic_rings_readness(dev, 1, arr_caps);
> +			/* Run test */
> +			if (arr_caps[AMD_IP_COMPUTE])
> +				amdgpu_command_submission_compute(dev, false);
> +			amdgpu_device_deinitialize(dev);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("cs-multi-fence-with-IP-GFX") {
> +		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
> +			amdgpu_device_handle dev;
> +			uint32_t major, minor;
> +			struct amdgpu_gpu_info gpus_info = {0};
> +			struct drm_amdgpu_info_hw_ip info = {0};
> +			bool arr_caps[AMD_IP_MAX] = {0};
> +			int res;
> +
> +			/* Initialize device */
> +			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
> +			igt_assert_eq(res, 0);
> +
> +			res = amdgpu_query_gpu_info(dev, &gpus_info);
> +			igt_assert_eq(res, 0);
> +			res = amdgpu_query_hw_ip_info(device, AMDGPU_HW_IP_GFX, 0, &info);
> +			igt_assert_eq(res, 0);
> +			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
> +			igt_assert_eq(res, 0);
> +			asic_rings_readness(dev, 1, arr_caps);
> +			/* Run test */
> +			if (arr_caps[AMD_IP_GFX] && info.hw_ip_version_major < 11) {
> +				amdgpu_command_submission_multi_fence(dev);
> +			} else {
> +				igt_info("cs-multi-fence-with-IP-GFX testes are skipped due to GFX11 or no GFX_IP\n");
> +			}
> +			amdgpu_device_deinitialize(dev);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("cs-sdma-with-IP-DMA") {
> +		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
> +			amdgpu_device_handle dev;
> +			uint32_t major, minor;
> +			struct amdgpu_gpu_info gpus_info = {0};
> +			bool arr_caps[AMD_IP_MAX] = {0};
> +			int res;
> +
> +			/* Initialize device */
> +			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
> +			igt_assert_eq(res, 0);
> +
> +			res = amdgpu_query_gpu_info(dev, &gpus_info);
> +			igt_assert_eq(res, 0);
> +
> +			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
> +			igt_assert_eq(res, 0);
> +			asic_rings_readness(dev, 1, arr_caps);
> +			/* Run test */
> +			if (arr_caps[AMD_IP_DMA])
> +				amdgpu_command_submission_sdma(dev, false);
> +			amdgpu_device_deinitialize(dev);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("multi-gpu-cs-gfx-with-IP-GFX-UMQ") {
> +		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
> +			amdgpu_device_handle dev;
> +			uint32_t major, minor;
> +			struct amdgpu_gpu_info gpus_info = {0};
> +			bool userq_arr_caps[AMD_IP_MAX] = {0};
> +			int res;
> +
> +			/* Initialize device */
> +			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
> +			igt_assert_eq(res, 0);
> +
> +			res = amdgpu_query_gpu_info(dev, &gpus_info);
> +			igt_assert_eq(res, 0);
> +
> +			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
> +			igt_assert_eq(res, 0);
> +			asic_userq_readiness(device, userq_arr_caps);
> +			/* Run test */
> +			if (enable_test && userq_arr_caps[AMD_IP_GFX])
> +				amdgpu_command_submission_gfx(dev, false, true);
> +			amdgpu_device_deinitialize(dev);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("multi-gpu-cs-compute-with-IP-COMPUTE-UMQ") {
> +		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
> +			amdgpu_device_handle dev;
> +			uint32_t major, minor;
> +			struct amdgpu_gpu_info gpus_info = {0};
> +			bool userq_arr_caps[AMD_IP_MAX] = {0};
> +			int res;
> +
> +			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
> +			igt_assert_eq(res, 0);
> +
> +			res = amdgpu_query_gpu_info(dev, &gpus_info);
> +			igt_assert_eq(res, 0);
> +
> +			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
> +			igt_assert_eq(res, 0);
> +			asic_userq_readiness(device, userq_arr_caps);
> +			/* Run test */
> +			if (enable_test && userq_arr_caps[AMD_IP_COMPUTE])
> +				amdgpu_command_submission_compute(dev, true);
> +			amdgpu_device_deinitialize(dev);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("multi-gpu-cs-sdma-with-IP-DMA-UMQ") {
> +		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
> +			amdgpu_device_handle dev;
> +			uint32_t major, minor;
> +			struct amdgpu_gpu_info gpus_info = {0};
> +			bool userq_arr_caps[AMD_IP_MAX] = {0};
> +			int res;
> +
> +			/* Initialize device */
> +			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
> +			igt_assert_eq(res, 0);
> +
> +			res = amdgpu_query_gpu_info(dev, &gpus_info);
> +			igt_assert_eq(res, 0);
> +
> +			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
> +			igt_assert_eq(res, 0);
> +			asic_userq_readiness(dev, userq_arr_caps);
> +			/* Run test */
> +			if (enable_test && userq_arr_caps[AMD_IP_DMA])
> +				amdgpu_command_submission_sdma(dev, true);
> +			amdgpu_device_deinitialize(dev);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_subtest("multi-gpu-all-queues-test-with-UMQ") {
> +		igt_multi_fork_foreach_gpu(gpu_fd, gpu_idx, DRIVER_AMDGPU) {
> +			amdgpu_device_handle dev;
> +			uint32_t major, minor;
> +			struct amdgpu_gpu_info gpus_info = {0};
> +			bool userq_arr_caps[AMD_IP_MAX] = {0};
> +			int res;
> +
> +			/* Initialize device */
> +			res = amdgpu_device_initialize(gpu_fd, &major, &minor, &dev);
> +			igt_assert_eq(res, 0);
> +
> +			res = amdgpu_query_gpu_info(dev, &gpus_info);
> +			igt_assert_eq(res, 0);
> +
> +			res = setup_amdgpu_ip_blocks(major, minor, &gpus_info, dev);
> +			igt_assert_eq(res, 0);
> +			asic_userq_readiness(dev, userq_arr_caps);
> +			/* Run test */
> +			if (enable_test && userq_arr_caps[AMD_IP_GFX] &&
> +				userq_arr_caps[AMD_IP_COMPUTE] &&
> +				userq_arr_caps[AMD_IP_DMA])
> +			amdgpu_test_all_queues(dev, true);
> +
> +			amdgpu_device_deinitialize(dev);
> +		}
> +		igt_waitchildren();
> +	}
> +
> +	igt_fixture {
> +		amdgpu_device_deinitialize(device);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/amdgpu/meson.build b/tests/amdgpu/meson.build
> index a8f85bbd8..7cb1c0f57 100644
> --- a/tests/amdgpu/meson.build
> +++ b/tests/amdgpu/meson.build
> @@ -5,6 +5,7 @@ if libdrm_amdgpu.found()
>  	amdgpu_progs += [ 'amd_abm',
>  			  'amd_assr',
>  			  'amd_basic',
> +			  'amd_basic_multi_gpu',
>  			  'amd_bo',
>  			  'amd_bypass',
>  			  'amd_color',
