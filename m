Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFBC4C531F9
	for <igt-dev@archiver.kernel.org>; Sat, 25 Jul 2026 07:25:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B70410E0F4;
	Sat, 25 Jul 2026 07:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lJWMlzP8";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012044.outbound.protection.outlook.com
 [40.107.200.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A470910E0F4
 for <igt-dev@lists.freedesktop.org>; Sat, 25 Jul 2026 07:25:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E2n/pa3X8iGPUOQXU11e9cMJoMucYJqD/wwcFBnU9gZuWlB46u/Fgncl3TaEj0if8U+1eByWoCZRelErS6PiEpNmKbz6PFE6OzQMGKphsZMHJkaLeKOkMnQLvA5DYPdnVnvakpLeLoPC+2lLS9kpd9Pe+tvcMmwi+kezP8y3Aljn/xj1WbP4zPZ1P4i0a2aNWtx3mAJ1FYHPGk9cMKyF7p5Sp6mVss44w+eHPokT3++NpK6V5yNClSrBXg05x3U0vMLjrwEBrbXUUya8JwYKtiihgBs/2DC9JVZa56TARpfzGceh/zx09tZol63mCIC3UGyhtIxNT6owPYZIzKE0cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1y0bgrGN5hSw/KzsrcqHqSg9o4om216XdPuhXMWP8ik=;
 b=GkhkltPcnCb8yTtOr4AsCDBviZn9Yzognd7y/jr8ldwCbEcRKQwKO1U0uvLq54GBI594MYEI6RcCYUa5k2SMGooZ9ejHFla18e/b03fFOoGp94pPXjYn7HHkjxxfqpKwIBo5d9zs9lTDHdO/c8NMtDqRamKcdC546Q+poSrnfJP+pu9nDH7GKiKZK5crO3aLED8ryj7vIaa8iyRhFZDSoT/779LdLKVuu33tFz+TTEqqWkm9sCvLJAtvXvuAR+Fg4ISxja29pwdmrYjme3WzgOHK7MGFmi+yA8ZlyF2v9Lw8O8lE/41xNqn7LI6ISeieIDF6oew2coOUoVbnqS42UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1y0bgrGN5hSw/KzsrcqHqSg9o4om216XdPuhXMWP8ik=;
 b=lJWMlzP8+NaikgsXSzh4hITPZMUoPQYXI+4HUocZifam2eVg087kphhjO9h1W0iDuPIotyWjhmMVzqV+qmUoZyznpOy4XEwfCVeULOMB/eDhSF3QYqECpibrqI/0GUPQL1cdOxitIRBGr0oB21hB7UhBX2+1JGaiVPgRjWOoL/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SAWPR12MB999166.namprd12.prod.outlook.com (2603:10b6:806:4e1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Sat, 25 Jul
 2026 07:25:03 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.012; Sat, 25 Jul 2026
 07:25:03 +0000
Message-ID: <bfa70f89-b7d5-4ec5-bea9-9787681c413a@amd.com>
Date: Sat, 25 Jul 2026 01:25:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/12] tests/kms_colorop: Add bypass transition tests
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20260623175737.171142-1-harry.wentland@amd.com>
 <20260623175737.171142-12-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260623175737.171142-12-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0051.namprd03.prod.outlook.com
 (2603:10b6:303:8e::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SAWPR12MB999166:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9d4362-7b3d-40a2-3608-08deea1dd7fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|6133799003|10067099003|11063799006|5023799004|56012099006|4143699003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: UVGADo33Bq5QIN3sfEWtj2g9YHsI/Os7XHo2m4sSuVEcXpIeWIpsPwSMdZB+p+YjazAMGPaL0h2zdybi1ghOrpli7jOmmPoPnXNEKq06NwzChajW9CEU7dsKLj+N6CqwsU/uY3aSgSdM6F8D6IFgG1OaWL0DJErr3Voqt75Nx+X/itQAAdQUwaYcO6UgB16VEv7vbb3Z987Ugp1O7XIBgYK2JrtMum0FKu0+vS5gN/dOxvP+/7ERkhpjNU4EE8bUE2hdhm3CCqUkofg0rn36R5Y/n7CmwVx4+wgE4oPe4Pkp4K2Z4e03IVKEzUUkabBIjI/h8scDOOpwxZyXbXewrwt+Qg+K6cNMu+/c3wN1mIabWWEtFoK3D53nQURgzdgKObO1iLQSKaCc3ZpT4YktQtt8D2fumpYbi/xFZETr5+yBjLWYVSdFQTYuYNSx3o87V0zQNY7f/7BUmbaNdLjrTuZlk3uzLHv0aXKPyh5z0GHieIKTrvWpQwQuUiFTzX6lMjlmf7Am+YYCDvxUgY0Dg15vGBUz9gaCcU+v6rT+5/cLFvgyH8/5S5++mLmcbChNyvMcWVNXpkmuCnnP2eXD4CLldMy7ULFSO+cOC9LNPseUlMjTFG4KY++V+wVBx6cky3jN0MEHco60ol4A5mXmp42OAYuZsPec6gnn0vsIJTo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(6133799003)(10067099003)(11063799006)(5023799004)(56012099006)(4143699003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTlaTW5mS3RxWjlNWmZsK1dGSDhINGNSWjFyZFlwajVCUWdZZDdBN24wQkNS?=
 =?utf-8?B?clRnWFFtdVVUK1Z0S3JQV1E2KzRmTmZ5R1hFYndrL2dXR095NlMwRlZhTWx5?=
 =?utf-8?B?a1Zzb25rbUhYQVduQmtGYjd5ZnV5U2lBNys1MnVpZzUrK0RvSmFTY2tsRjcy?=
 =?utf-8?B?ai9FY3RCMXh0bU1CMXFIbFFWMmF2MVB2Z1ByRTRjOVk1S0ZsbmlVK25ITWpF?=
 =?utf-8?B?c3cvM0NybXI5bzBRaGgwSFNqUXAwQTRQWVhSb2lUYTZPYUkxbUM0aGJzdm1z?=
 =?utf-8?B?TEpOaktIWG43a255MnRzaTN4dHdyL3RDZk1WL21Jb3FudkZVTkJGbFZIN3JD?=
 =?utf-8?B?U09lZTVDbVpSdEF2cFg4dXFWUVcrajk1WjVQbWEwR292WVhQTVJwRjlDbkFq?=
 =?utf-8?B?bjZqZUVrWC9jbkFmTXgyb1ZVNFhCNm5LME9VSEVWVWRSQitIRVpkdStGdkpy?=
 =?utf-8?B?Ty9rMUljQmxKV2xNRnBFcW9kS0R2cElsUEFIQjlhV3J1d3FkZHJ0ZmZidjdE?=
 =?utf-8?B?WUZZckZVeE1nV3FOeE4wNWl5Q01hVG9naGpUZVBsbzBTSGFubWZjK0QzWkxk?=
 =?utf-8?B?VEZaNC9oTlBnKy9TMFAwRUNwaTJzb3ZjYWx5R3VWZTRrbEJRZmJNSXdUVHFF?=
 =?utf-8?B?QWNVVnhUSG1RRXhoYWp0WnZpTzF0OVFQdGkyWTJMWkZZeHREWWR5RDBnaVRK?=
 =?utf-8?B?WmdlakZiZnRTbjROSEo2WWhKNXBRZ1BFVUxKRWJHeVkxLzlyMTdiUDU4blhi?=
 =?utf-8?B?SkM4Zmx3L1U0dEFFaVBnNHMrTHR2WUZtd2o4SUVTcXlBSHBEUCt0UXNVQUpK?=
 =?utf-8?B?ZkxyRFBsVzZPcUhtS1BpejRVSktxb25xVTR2NysxeHJGOEZqbmY2OFY2a3ow?=
 =?utf-8?B?Z0JRKzEzQ1FLOThIenJJT2JHUHNTNW95c1NkZFhkNHc5eHlTc2lvUjVsYmFk?=
 =?utf-8?B?R3NQK1lOaTkyMmJWTEREZlROd1R5eExHR25nQWx3VFc0amRwRDdaUnd0MHlY?=
 =?utf-8?B?WnVKM0pxUjJqbzdlWTdmbVpEOUtSMzNsTzJOS0IxaVg3TTJxS0d3dTFYNjJO?=
 =?utf-8?B?R1IxVE8xWDRQc0UwWjFrSDNRUmd1QXlZZi9oMGtiWTg5L1E5b1NvMmdNS29h?=
 =?utf-8?B?eVljYzdLQjFKV1dZMk5aSndRaVk2OUhGd0FsZE1HZlpTVW96ellTUkd4T3RR?=
 =?utf-8?B?dVJkKzFBbm4yNVlFQnNVeTgwRHl4OHR5L0IrS2VaYnhCbVVDODNjVGM3TlFN?=
 =?utf-8?B?eW5ocXpQaFRpUmR6MHVjSnJSUDQzalBVNStvK2RTbDNLcjN3bldJSDBsZmdm?=
 =?utf-8?B?RzIrZDgwN1VGMmhKdTFGRGxuZXFoR3lGSDJyOCtyeWFzSzNia0JqWXNVdVZ2?=
 =?utf-8?B?Y1FKSXZXTlBtYnJtTnRYSXBFQzR0NUMrVmZLNTEzNDN1SmpYbzYxY0RYMkln?=
 =?utf-8?B?cXRzOWxOL3A0UXBZK3dMZnoydmw0UUlYajUwVTBqeTZSbG9qelVGMjhWRlRX?=
 =?utf-8?B?L0VYSm1QbVEvZXFOMmZzYUtJRzkvdTh1NlRkSXpUZHJvOG9ESFNTQ3hMRHlk?=
 =?utf-8?B?bVppT2F0dmh3S0drTTNXSytsUXVBYlJjV3hIdWhrNEc5K1EvdGkvd0p0YjJ0?=
 =?utf-8?B?eDNxSWpFUXk1bnkzL0Q0aE1PT09iUkJNMGI3a2tlSXdNR2ZWaUl1cWw4eldp?=
 =?utf-8?B?UmZDeEhZWmRtVzlpcVJ5WDMvajVCZ0ZjVERJWG5iM2hrQW9qWmtjOC80dnJh?=
 =?utf-8?B?T1pZNk9hRWd2MHVJZWthYnA4eVNmZUJZY2lRdmZ1V2FQZk85ekF0ZDB0MzdN?=
 =?utf-8?B?U3VLZWQ4ZWl4MFNsNU8rK1MzQkZ4VXc5VGtuT2lKUDMwTjNPK3NZaDBPMW1O?=
 =?utf-8?B?TkZBRzVSMWlGd1ptbmtVY2ZoeFpXQlBXR09rclphZHoyVnJiOUFSTHRuaFh0?=
 =?utf-8?B?bVlKc1E3b2RneUNZMlFRdm5SaUdzYU5XNGdKOE5RMHlzWVROVlZhSE1hR0NM?=
 =?utf-8?B?NUZQWWV5S09rTVBJZ1ViRGlQK2JOaFlvRFA4a0twbEJYK3RLZm9JdUl5Um1T?=
 =?utf-8?B?cUpubWRDY295QTh3ZmF3L2VKMVVpZ2tYeS9EZ1Jqdm9JMGVJc0prbU9Pa0FE?=
 =?utf-8?B?RG1CWEJ6MXVGR0I3cVR4dzZXeW5wVTlEbzVRcEVlL2dNUkdyK2h5ZDBpT2xq?=
 =?utf-8?B?VkxWU1J0RFRLQVdFTThJZDNMM211TlltYkNaK1l3cFV6WjNVQUNvU255TmE2?=
 =?utf-8?B?eDlzY01FOTlGQWE4Y2FmNXlsWGV4YXlzWGNXa3UzcWlGWDFvT3dLS24xTWNo?=
 =?utf-8?Q?e+aMxEKmaxK2EmKuED?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9d4362-7b3d-40a2-3608-08deea1dd7fa
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2026 07:25:03.2873 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uttXCZUzAEJvl4eGyEqWYPstMg2MR4ePImWNjx2TednimbfjkzrLdWO5IxHmkZFEiJvOZjSYDWWpCTLDcLcS8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SAWPR12MB999166
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 6/23/26 11:57, Harry Wentland wrote:
> Add tests to verify color pipeline correctly transitions to bypass state
> after being configured with various colorops. This ensures no stale state
> remains when switching from an active configuration back to bypass.
> 
> This also changes existing test behavior: tests no longer commit bypass
> state at the end, leaving the pipeline in its configured state between
> subtests.
> 
> Test approach:
> - Configure pipeline with specific colorops
> - Verify configured output is correct
> - Transition to bypass
> - Verify bypass output matches input (identity transform)
> 
> Test coverage:
>    * Enumerated 1D curve (srgb_eotf)
>    * Custom 1D LUT (srgb_inv_eotf_lut)
>    * CTM (ctm_3x4_50_desat)
>    * 3D LUT (3dlut_17_12_rgb)
>    * Multi-stage (srgb_eotf + ctm_3x4_50_desat)
> 
> Assisted-by: Claude:claude-sonnet-4-5
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   tests/kms_colorop.c | 127 +++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 115 insertions(+), 12 deletions(-)
> 
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 4e8b2563ea4e..a2784243c0f5 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -80,6 +80,16 @@
>    * SUBTEST: plane-XR30-XR30-multiply_125
>    * SUBTEST: plane-XR30-XR30-multiply_inv_125
>    * SUBTEST: plane-XR30-XR30-3dlut_17_12_rgb
> + * SUBTEST: plane-bypass-XR24-XR24-srgb_eotf
> + * SUBTEST: plane-bypass-XR24-XR24-srgb_inv_eotf_lut
> + * SUBTEST: plane-bypass-XR24-XR24-ctm_3x4_50_desat
> + * SUBTEST: plane-bypass-XR24-XR24-3dlut_17_12_rgb
> + * SUBTEST: plane-bypass-XR24-XR24-srgb_eotf-ctm_3x4_50_desat
> + * SUBTEST: plane-bypass-XR30-XR30-srgb_eotf
> + * SUBTEST: plane-bypass-XR30-XR30-srgb_inv_eotf_lut
> + * SUBTEST: plane-bypass-XR30-XR30-ctm_3x4_50_desat
> + * SUBTEST: plane-bypass-XR30-XR30-3dlut_17_12_rgb
> + * SUBTEST: plane-bypass-XR30-XR30-srgb_eotf-ctm_3x4_50_desat
>    * Description: Tests DRM colorop properties on RGB formats
>    * Driver requirement: amdgpu
>    * Functionality: kms_core
> @@ -273,7 +283,8 @@ static void colorop_plane_test(igt_display_t *display,
>   			       igt_fb_t *output_fb,
>   			       __u32 fourcc_in,
>   			       __u32 fourcc_out,
> -			       kms_colorop_t *colorops[])
> +			       kms_colorop_t *colorops[],
> +			       bool verify_bypass)
>   {
>   	igt_colorop_t *color_pipeline = NULL;
>   	igt_fb_t sw_transform_fb;
> @@ -337,17 +348,26 @@ static void colorop_plane_test(igt_display_t *display,
>   	/* compare sw transformed and KMS transformed FBs */
>   	igt_assert(compare_with_bracket(&sw_transform_fb, output_fb));
>   
> -	/* reset color pipeline*/
> -	set_color_pipeline_bypass(plane);
> +	/* Test bypass transition if requested */
> +	if (verify_bypass) {
> +		/* reset color pipeline*/
> +		set_color_pipeline_bypass(plane);
>   
> -	/* Commit */
> -	igt_plane_set_fb(plane, input_fb);
> -	igt_output_set_writeback_fb(output, output_fb);
> +		/* Commit */
> +		igt_plane_set_fb(plane, input_fb);
> +		igt_output_set_writeback_fb(output, output_fb);
>   
> -	igt_display_commit_atomic(output->display,
> -				DRM_MODE_ATOMIC_ALLOW_MODESET,
> -				NULL);
> -	igt_get_and_wait_out_fence(output);
> +		igt_display_commit_atomic(output->display,
> +					DRM_MODE_ATOMIC_ALLOW_MODESET,
> +					NULL);
> +		igt_get_and_wait_out_fence(output);
> +
> +		if (data.dump_check)
> +			igt_dump_fb(display, output_fb, ".", "bypass_output");
> +
> +		/* For RGB bypass, output should match input */
> +		igt_assert(compare_with_bracket(input_fb, output_fb));
> +	}
>   }
>   
>   static void check_plane_colorop_ids(igt_display_t *display)
> @@ -471,6 +491,20 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   		{ { &kms_colorop_bt709_limited_ycbcr_to_rgb, &kms_colorop_srgb_eotf, &kms_colorop_ctm_3x4_50_desat, NULL }, "fm_bt709_limited-srgb_eotf-ctm_3x4_50_desat" },
>   	};
>   
> +	/* Bypass transition tests - test config -> bypass -> verify identity (RGB only) */
> +	struct {
> +		kms_colorop_t *colorops[MAX_COLOROPS];
> +		const char *name;
> +	} tests_bypass_transitions_rgb[] = {
> +		/* One per colorop type */
> +		{ { &kms_colorop_srgb_eotf, NULL }, "srgb_eotf" },
> +		{ { &kms_colorop_srgb_inv_eotf_lut, NULL }, "srgb_inv_eotf_lut" },
> +		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
> +		{ { &kms_colorop_3dlut_17_12_rgb, NULL }, "3dlut_17_12_rgb" },
> +		/* Multi-stage */
> +		{ { &kms_colorop_srgb_eotf, &kms_colorop_ctm_3x4_50_desat, NULL }, "srgb_eotf-ctm_3x4_50_desat" },
> +	};
> +
>   	struct {
>   		__u32 fourcc_in;
>   		__u32 fourcc_out;
> @@ -569,7 +603,75 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   							&output_fb,
>   							formats_rgb[j].fourcc_in,
>   							formats_rgb[j].fourcc_out,
> -							tests_rgb[i].colorops);
> +							tests_rgb[i].colorops,
> +							false);
> +			}
> +
> +			igt_fixture() {
> +				igt_detach_crtc(&display, output);
> +				igt_remove_fb(display.drm_fd, &input_fb);
> +				igt_remove_fb(display.drm_fd, &output_fb);
> +
> +			}
> +		}
> +	}
> +
> +	/* Bypass transition tests - RGB formats */
> +	for (j = 0; j < ARRAY_SIZE(formats_rgb); j++) {
> +		igt_output_t *output;
> +		igt_plane_t *plane;
> +		igt_fb_t input_fb, output_fb;
> +		unsigned int fb_id;
> +		drmModeModeInfo mode;
> +
> +		igt_subtest_group() {
> +			igt_fixture() {
> +				output = kms_writeback_get_output(&display,
> +								  formats_rgb[j].fourcc_in,
> +								  formats_rgb[j].fourcc_out);
> +				igt_require(output);
> +
> +				if (output->use_override_mode)
> +					memcpy(&mode, &output->override_mode, sizeof(mode));
> +				else
> +					memcpy(&mode, &output->config.default_mode, sizeof(mode));
> +
> +				/* create input fb */
> +				plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +				igt_assert(plane);
> +				igt_require(igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE));
> +
> +				fb_id = igt_create_color_pattern_fb(display.drm_fd,
> +								mode.hdisplay, mode.vdisplay,
> +								formats_rgb[j].fourcc_in, DRM_FORMAT_MOD_LINEAR,
> +								0.2, 0.2, 0.2, &input_fb);
> +				igt_assert(fb_id >= 0);
> +				igt_plane_set_fb(plane, &input_fb);
> +
> +				if (data.dump_check)
> +					igt_dump_fb(&display, &input_fb, ".", "input");
> +
> +				/* create output fb */
> +				fb_id = igt_create_fb(display.drm_fd, mode.hdisplay, mode.vdisplay,
> +							formats_rgb[j].fourcc_out,
> +							igt_fb_mod_to_tiling(0),
> +							&output_fb);
> +				igt_require(fb_id > 0);
> +			}
> +
> +			/* Run bypass transition tests */
> +			for (i = 0; i < ARRAY_SIZE(tests_bypass_transitions_rgb); i++) {
> +				igt_describe("Test color pipeline to bypass transition");
> +				igt_subtest_f("plane-bypass-%s-%s", formats_rgb[j].name, tests_bypass_transitions_rgb[i].name)
> +					colorop_plane_test(&display,
> +							output,
> +							plane,
> +							&input_fb,
> +							&output_fb,
> +							formats_rgb[j].fourcc_in,
> +							formats_rgb[j].fourcc_out,
> +							tests_bypass_transitions_rgb[i].colorops,
> +							true);
>   			}
>   
>   			igt_fixture() {
> @@ -653,7 +755,8 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   							&output_fb,
>   							formats_yuv[j].fourcc_in,
>   							formats_yuv[j].fourcc_out,
> -							tests_yuv[i].colorops);
> +							tests_yuv[i].colorops,
> +							false);
>   
>   					/* Switch plane back to temp_fb to keep CRTC active */
>   					igt_plane_set_fb(plane, &temp_fb);

