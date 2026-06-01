Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409E1CD6E55
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jun 2026 17:12:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBAE7113619;
	Mon,  1 Jun 2026 17:12:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LZb0+XmB";
	dkim-atps=neutral
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772F0113618
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jun 2026 17:11:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mydmcc18P8dd63XlFiwvvj3O7PakIGv2gJ74ywM1nTa+e/06FP479NguJx1xFpRenPnz7d+adray5UUwdTW+hYBIxcJrTNld97uEYFho+fxhs3FMjBJR3L34umj5HmJ7zctJM3lvy0iLBZn+JqylonJyPAtmVyPgTvxNYTg7TaG/NzksxKkLY8VViAt3aKQXqBA/OAaZZ2k+l61Np2iEG8tMAk+0MrIuUdlrkv0o3JNp3FIJHBWQlQmrGMT8waI0y4lTuubvgsUsVN3TgCHmpQfr6rkYmar1NfH9TpXzMmQHXV2NkrbPC4Kx8Th605NYs4H0KJm9z3sfGX+SED364A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmeO9slvCzPQyPJ93YeI0kCcAAUuaOsStMnv8P/bO78=;
 b=jZbng/QMM/xddkB62ezQH6rgpa3SrAaQIcEyL4e+uatSnVntDR5o/nDGzskvzvj4247FoyIApz+pnHcCVvztceR4HjVjCn8uHMbsjjYNuuCmAiJS9WQgwA8m0RpGVFK36Md4aKxY0wKz7lJLC/I/cUhOPshU+fKL3sS5cXOOn/ZRZky4jTjNQU2YXHaGfrPTJoXFb9IXKKb+iT/bf38JsMPCpvbdeB7Fng7jhHARFQLSKaw25bpleza152bzxkZ5E31Lm2DRL5f4EGLJoK5Hd/3fl8i1vRSjQNJ2rXSEjGZ5tZBL2nLql+LeJTAerG7dX0h+fEsjRQAaQqN0/7lZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmeO9slvCzPQyPJ93YeI0kCcAAUuaOsStMnv8P/bO78=;
 b=LZb0+XmBa8Jzl/ZRHMouEQvCxKjVEKy2jJT4ceUC6r6b4UfEI8LRhTBvYAPxsrZO1trTJ6AjaKjW2dmS6X4OxwrvJF7IchqaDrb7jtK8pULg+t6ke7uI8E19d8MVdolvyqoAIG9HAkOg47KK4WrVitURREJfK1nf+Vf6MCxR3nw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DM3PR12MB9287.namprd12.prod.outlook.com (2603:10b6:8:1ac::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Mon, 1 Jun 2026
 17:11:38 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0071.010; Mon, 1 Jun 2026
 17:11:38 +0000
Message-ID: <777dd068-31f1-4b4c-bb5d-d7875dc4851c@amd.com>
Date: Mon, 1 Jun 2026 11:11:36 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] tests/amdgpu/vpe: set blit test based on IP
 version
To: Caden Chien <chih-wei.chien@amd.com>, igt-dev@lists.freedesktop.org,
 vitaly.prosyak@amd.com, jesse.zhang@amd.com,
 Jani Nikula <jani.nikula@intel.com>
Cc: Solomon.Chiu@amd.com, Peyton.Lee@amd.com, HaoPing.Liu@amd.com,
 Yu.Wang4@amd.com
References: <20260527120802.617332-1-chih-wei.chien@amd.com>
 <20260527120802.617332-3-chih-wei.chien@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260527120802.617332-3-chih-wei.chien@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0381.namprd04.prod.outlook.com
 (2603:10b6:303:81::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DM3PR12MB9287:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f18343f-0647-4315-e657-08dec000d765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799007|11063799006|6133799003|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: OaLnlYvZhc1jr0NUhAasPhBlduKLLWtLimIcYhecwgHyARQz16z0U7jLlyc8bg7S4PSIqFF9PZGcwNlrBH51obUNQgTzygEp1XuA3c5yEZHwjHuiU5OeoG3BXpQThERz8L2SuXXC1JdtqHhr8R/Ys5m6/DrywAukxptbLCIFGlXAhu/hN6ZiwosU4z9dK6UNfVP2WoqgvSyDoLMWBwgXrYE9nuqztOAPG6opgvw/UMYCuZGWwURga+8v6Iz7kvfz/w9LXv0j5GXo4vMyS7F3+JyBP7euns6ydMvOeIkdjNFN9KgQf8ThVZ6qVQJP8liIEPqI/8xbdlPMCWnAZEgWRGYkxrA8o8iEzq1LTvFbyBqG8GMFeEx1Riy6VhznSER87YAbTNo0dssJM8Yum5uz8tMEgSPj8ftvocaiFfSm/OtscxqXTnj1s9Q2rzr63SbwAeqzNb4ZFHqj+FfQ0tDkH+bFVl+C7I4FobsJ6etLNp3VtRSSki/wcvoGNNuLBXO7HaNpR0ksRNksfTWc+HG1IHMrrPJTSc+b7T58Opb4cBnqQ+o4A+q7x/qEslk8324C0dph86UO3GBVh4Xak9OF7BUB8IXO4rgQpNiKnkd5T/gKy4kqiBud+l/huujh0FE1nIqDDgVnF/v0BMpwPU9vIL5cFkDhX5Zk7bASdHeLekVSk1rwhvCoInLYa8gd9Ugf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799007)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zkg3TVhXRy83OGY1VWVsRlBCMERtdHFab3hDeHB0a25OaTZESk45cEgvT3ZQ?=
 =?utf-8?B?a2J6R004UHJIbHRLb2tOMnljQit2OU9wa2s2Vk5QTzRuZ3BjUjNPOCt5Yksy?=
 =?utf-8?B?MjNlUzJsbWcxWTUzMUlpL3pxRVhkazVlMURRWUY2SG5NRGdDcmlIbWRzbDlZ?=
 =?utf-8?B?VFBsU05NQnJ0Nm9id1V5Zi9ITVlBeEZ0aDBuWkFsUjlocG8wVC9NQjZucVda?=
 =?utf-8?B?QnA2cllGb2dxSXpkVXN1a0h5bE9UZFpVa1VpVWdVM2xKRjh4YU5CaWk5ejVK?=
 =?utf-8?B?QVAvWVlva1FMSlhITTIweUpqWHRnTmFzU2lOUkdaWFUrWmhTZUR1MHNDUDBR?=
 =?utf-8?B?NjRYSDhXV0tDUlFGSG9LUFh2NVlZRkxMdVBKc1BTeWZiZE9nRW4zUUFDQTJq?=
 =?utf-8?B?azdvTEhYYytOekpjcjE0Y0JZRmRVTjJQNVVHcWpON1M2UXgyYUNoL3lEMG95?=
 =?utf-8?B?Z3lQSTc1MUZqUlVSaTB6bzc0ZVF3OE4zWHdCQVZVcm1vQkJXMnY3NW0yN0Jm?=
 =?utf-8?B?bVZPRlBQZmRFbEY2enoyWnp2QnFnNFdxZ3E3TE56UzFkZ1BpczM0dnNYa3BX?=
 =?utf-8?B?NkxndFdUS2Q4VUtzMDlvNS9EemQ4Ui96NStFZGRnSExBaDlDaDBpM2IzZGIr?=
 =?utf-8?B?bXkrdHJvMHNhYndZeE9sWDlaU2FIS2FVSVpycEZDd1BnRVZWem1mMnh2NVVZ?=
 =?utf-8?B?cDdaTkZwMXhyaUR6Z3dXZWZkZGRNM0JaWGJYdHhtYjkxUk9UL1VRSnFqeUJo?=
 =?utf-8?B?TDdDWGdvckpZM09LcXhRN0JlenlSaVFmNlplS0pXeU9wa0NoQUJtUVhXTWZm?=
 =?utf-8?B?YkMxUE83Lzk2RnZocWduenVkSlRHNUJuK2RqUnJyVzQ1Z21hU2V6NEQyV3Bo?=
 =?utf-8?B?eUpTQzVwY2w1OHdDTjdvYXFzKzNIYysxNVV0bWVKR2x6d3lkbjExVE90b1dE?=
 =?utf-8?B?THBGaXpaLzByakZ6NmhzQ1dzbGUvZlJmMU1XMVVFMFVDOXJLdDRSclRJai8z?=
 =?utf-8?B?MEFuQWhCN0dVam9Icm00NUxud1IvdXRWa3REVWVRM1BrdzNLbi96ZUNqSVBQ?=
 =?utf-8?B?SGxtWkg4MitNK2t5aHJQakYvNGxQU05uMDRtNFJUL0ErT2ZCSHArQ3VMdk00?=
 =?utf-8?B?ektOZjY1MDh3STVqWVFNbTlTa1BTY1FxbnI5aU1tRThEekdNcUNJVXhBQkcv?=
 =?utf-8?B?cEZQcGJKVVF2T2s5S01DUkkyZUVacnoxeTFKb3hzYjlvVnluYnRBQlNSdGsx?=
 =?utf-8?B?WWxrRHFhbW8weitOQ1VRZ0tpOTM1ZnRxRnhvVVFPTS9ibDV3UGxFQUs3REd6?=
 =?utf-8?B?T09manM3MTdUeXBlRXRkamtHYWRnb3U0WVFUM1lGRFpwRzNoNU8xS2R6WUJO?=
 =?utf-8?B?NVlQNEdlQ3A4Q0k5VmZaLzY5cHVBeER4c3ZwQUpjcUVVWnFYSHRoWXB0eHZn?=
 =?utf-8?B?T1JvWFZKbUQ3RjB2UzJFQURhZjlLVVc2SUtDNUJGZE9GbFIrVk44Y0xSVzNx?=
 =?utf-8?B?cE4rU01IaW14bG95bzhwbGF5NDJpYU1iMmJ3NW9MQ0hGUmRCbVhoMk5FeTgx?=
 =?utf-8?B?MW8xbk5ERzBBRXZtMFRGaWdIL2J0L2tNdHdZUmdhK2xOWlJGMU0ydnowVUNS?=
 =?utf-8?B?blh0T0VsL2pkSTlBVmtvNkNQeHhSVml1Nnhld3YyYk1xaldRbUIyREd1WmFN?=
 =?utf-8?B?U2FEdnB5K0FBdUFhSlJrY3M3OUZ4aG5HM1dkUTgrT25PZmtGYklWenhKdmUr?=
 =?utf-8?B?cm1qNG44WVlKSDhxUzBaVjNQT0JDMHhaWEYxOXlhV29CY3RtMmE0L3h2VXI4?=
 =?utf-8?B?L0ppNjFUU1hNeXJUMkRwWjEyUE5kOXh2bmo5UzlUSWhOdDZhL0ZGaTdFWVY5?=
 =?utf-8?B?alhPRis3bUNUUjVwWkNrdHlxMTJ0VW5kVUFackFidGg5dW5GU1lRRjU1TFA0?=
 =?utf-8?B?NFlJeFBvZzVJRXlLaG1sOXZVeUpKRHBQRmFsQXE3ak1IbFlYTDJia0ZJUm1h?=
 =?utf-8?B?ODEzbk5WYUkvMkFxdUJXMC9obWRnQ2ZvOC9INFBTNHJjV2dRbHRQWnBHNmJy?=
 =?utf-8?B?WnRPUVUwdkxlUUxVQnoxMzFXdmN0aVF2b2dSZDJsVGNabXFaNUt6MGt1Q1V6?=
 =?utf-8?B?TzUzSW16QWFhRFZhdDFSaG9zTVVvZDhYVDRPbmlQRkVoM2Q4eGhmZFNqNkR4?=
 =?utf-8?B?QXBxRXpPYlA5cTNtY3NjZXZxQ01XMng2eVFtU295RkM5VWJhUzAzS3dqU2g0?=
 =?utf-8?B?dm9XaytMbll1Ni95SjhVV29qV2NuUnlVeGliS2o3UnR6cmhOVnFvUTdTTlNK?=
 =?utf-8?Q?qZ45VYRT6E113vGhke?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f18343f-0647-4315-e657-08dec000d765
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 17:11:38.1785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ll+m5AXFfC0GoHE8dd1efme/C/1zoB8hC3yGHP/b6SVZmYFdswuaYT1a28l6mBy+hd5j1UB94igu+uP/GxtWBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9287
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



On 5/27/26 06:08, Caden Chien wrote:
> Commands for new VPE version may not be compatible on older VPE HW
> (e.g. VPE1 HW can not execute VPE2 commands).

If the previous patch can introduce regression (ex. "not compatible"), 
can this be squashed into the previous one?

> 
> For test runner to run all tests without manually specifying which
> blit test to run based on udertesting IP version, a new switch case
> is added to execute the blit test corresponding to IP version, in
> the single blit test entry.
> 
> Signed-off-by: Caden Chien <chih-wei.chien@amd.com>
> ---
>   tests/amdgpu/amd_vpe.c | 27 +++++++++++++++++++++------
>   1 file changed, 21 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/amdgpu/amd_vpe.c b/tests/amdgpu/amd_vpe.c
> index 809f22d17..9c72b1c0b 100644
> --- a/tests/amdgpu/amd_vpe.c
> +++ b/tests/amdgpu/amd_vpe.c
> @@ -176,7 +176,7 @@ static int check_rgba8888_hmirror(void *addr, uint32_t width, uint32_t height)
>   	return 0;
>   }
>   
> -static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
> +static void amdgpu_cs_vpe1_csc(amdgpu_device_handle device_handle,
>   				struct mmd_context *context)
>   {
>   	const uint32_t vpep_config_offsets[] = {0x34, 0x128, 0x184, 0x1c0};
> @@ -337,6 +337,25 @@ static void amdgpu_cs_vpe2_hmirror(amdgpu_device_handle device_handle, struct mm
>   	free_resource(&dst_plane_bo);
>   }
>   
> +static void amdgpu_cs_vpe_blit(amdgpu_device_handle device_handle,
> +				struct mmd_context *context, struct mmd_shared_context *shared_context)
> +{
> +	switch (shared_context->vpe_ip_version_major) {
> +		case 6:
> +			/* VPE1 has major version as 6 */
> +			amdgpu_cs_vpe1_csc(device_handle, context);
> +			break;
> +		case 2:
> +			amdgpu_cs_vpe2_hmirror(device_handle, context);
> +			break;
> +		default:
> +			igt_info("Unsupported VPE major version %d in blitting test",
> +				 shared_context->vpe_ip_version_major);
> +			igt_assert(false);
> +			break;
> +	}

Can you run checkpatch.pl from linux kernel?


ERROR: switch and case should be at the same indent
#39: FILE: tests/amdgpu/amd_vpe.c:343:
+	switch (shared_context->vpe_ip_version_major) {
+		case 6:
[...]
+		case 2:
[...]
+		default:


> +}
> +
>   int igt_main()
>   {
>   	struct mmd_context context = {};
> @@ -370,11 +389,7 @@ int igt_main()
>   
>   	igt_describe("Test VPE blit");
>   	igt_subtest("vpe-blit-test")
> -	amdgpu_cs_vpe_blit(device, &context);
> -
> -	igt_describe("Test VPE2 blit");
> -	igt_subtest("vpe2-blit-test")
> -	amdgpu_cs_vpe2_hmirror(device, &context);
> +	amdgpu_cs_vpe_blit(device, &context, &shared_context);
>   
>   	igt_fixture() {
>   		amdgpu_device_deinitialize(device);

