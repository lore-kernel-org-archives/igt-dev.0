Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D11107BCD7
	for <igt-dev@archiver.kernel.org>; Fri, 13 Mar 2026 19:03:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A614210E06D;
	Fri, 13 Mar 2026 19:03:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2leoSVHb";
	dkim-atps=neutral
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013058.outbound.protection.outlook.com
 [40.93.201.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9710E06D
 for <igt-dev@lists.freedesktop.org>; Fri, 13 Mar 2026 19:03:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KQcHu2n70ogn1gTKWmliHV2KzVsQ/3TS5k+bXlNGlWPu0x+BDGaviMer6/bstM3dX5nfkMiKEfOoLm5RbHT9cRxPIprwuAx6zBbPjV1TjFQUTsM20NPYGDdAY7TMnjhYhczPzY2BntWWfGGw4b+n1zWkj1aNJJQuqltQmixdlSmVjuga7P/k6nkRtc+6KcRYnZ6I97rVcwe22GWsP1wOuDWpnU0BxtrBQeuaMPlyXa/UuDep1sN0mqfHIc+K5/q9xLFuUeoE3MzrepEMe3hmhdE9OJiHxToT280OnrFvc4YzacOZyJxPUbNGl/lBtBY9+GTYwxpAtRnDfCHt+1Ws/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fug/SHvALcZGXP4nMIHSQgjnBQhVeK6NiRiQcFbfoWw=;
 b=j3AkePD+iUg00fNcxqLH+e/C86wejyt8vOVPL3tHh4mCGyN0BmkhpYoq72waLh64enqES0y2SKXsNI6dTphONu6EQYOWBGjzNF+oeRvGa48L2lFE27arXBHMg8WZ7P0RkZXyeSmxd8ESDKItcsxPHsA8Lg6N9hBt2SWl9t3mZh/n5IbplrcGw8KpdErUfcwbmbx+5EZHydi1jIZ19O4Ui1346bQzjTph2pVoGqf21orNUU/rYycMzfkGFJ+iVfufXcr16VtI3T+mG+uaRp+B27e0SZQIv1bSMVgx96yk/gi+2LEtIzbAKp3DGKmf2Np5xQPrjf3rhIfXdSbuxxm2Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fug/SHvALcZGXP4nMIHSQgjnBQhVeK6NiRiQcFbfoWw=;
 b=2leoSVHbjQtBV/GPBK1ZnarwTm8EBL8JJFcTkVbAeyAxXhlmhqjHuqHL0RWFNRsNB9MI4WX4+ZhTmlUsLgyuIKLnqmv0machbEC+LWomQ1/85MXf2DArJo2RGyGN3l4DnsS8372HmEZGmOcpdUuDKvM9b9xfpQD058jRpPq0yKM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by LV3PR12MB9095.namprd12.prod.outlook.com (2603:10b6:408:1a6::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.8; Fri, 13 Mar
 2026 19:03:52 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9723.008; Fri, 13 Mar 2026
 19:03:52 +0000
Message-ID: <81fe9702-4983-4f58-9db3-5049d30e777c@amd.com>
Date: Fri, 13 Mar 2026 15:03:49 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/tests: Fix gamma 2.2 naming
To: Alex Hung <alex.hung@amd.com>, igt-dev@lists.freedesktop.org
References: <20260311212502.2487982-1-alex.hung@amd.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260311212502.2487982-1-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0111.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::12) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|LV3PR12MB9095:EE_
X-MS-Office365-Filtering-Correlation-Id: 766ff2d6-0486-4c03-549f-08de81334429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: 4NfSo4mXQ4SjW5MyiQuX3YOTyPyXODZk66LZm39TcsLGLWmySwA4FyNBqO7324IVmKOWYjspGW+ojSJqhf0A2ZF9wmprww8zs+Glgcuoornn/OYFGWV18odFJG7ba2YmYUBzX6LvS1ARs4PgLmpqYmeHmXW7rN7tFUsKwcGkSL9AQ0KVp9oLlAAS/vtlKsLoj3mEO03GGSTIhF3jqZilx5xEyOGIOjsY5im/VCXCz17dbG5I4/0VLkjA0pHCkxcb2KhJocDMxYdcMX/xLoZnuFruNdyP6m3Q8A7S1B6BUaaCxWIilWGzuwi2Xb7/yqdhu9xmN5wuWAmb32PXAjS+fW+eElQY99294ubELP1quVmjwkixIExJrPPmRB5mSRUBf2ag3BTKEGUPHFsn+fJV2248mTiqvTBFXqnfcGInYqxeV6Leon3iS4yQKLH2WJbg20zyLq9//0bNuzziLX4c/B7jZKZjDWrOjaq1NiE99GQznnVWjftjiTSfhXaRr25s4QRqqncoLK2WI7pPA4meJwFIVD06kMK9522t9EliAnQEZkkeRnGAyNmvVEVHK12NpA4K8nmJ1oxqhMhHtrg7SnE4zsP4Can7hQGFRMYLQyd/J3DkM2TcYY6PmxZD81Josymrm9ZIRIJrLyTkHFNzqgXfXj2Xqs/nOAXSZO3LcLSUmjMWuH65f5r0Q9+wzREVtNJSOnALLsm6NZqGtlx31T/+dgSdDcK4fLEp31rLM/g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2FNa0Zsc3h2aGltK2lIOUN3ZE1GSVdKV3VBQXJ1ZkRYaGFrajA1N0x6NVNJ?=
 =?utf-8?B?Z20zbktNblJ5NHZMajUrNjl6Zkk3MXZqb0MxZkZtWG9HTXNHM0RtRldmVU02?=
 =?utf-8?B?RGV0UVBSYVdoempMQnlnd0x1OG0yU3JDNHRhYWhyQUU3amp3RmtWWVpwNlJH?=
 =?utf-8?B?eGNZSVVvdFJ6ZGdVNTNDT2dnSkRwRE11aXNCcWhJQlNDWEVyemhxWXJEMVNx?=
 =?utf-8?B?K3BGaUYxeEh1V05HV1FtY2VnUFpKcDJpL3JtYzlqQUhRRmVqWmZnY2U1bjBT?=
 =?utf-8?B?VXVjYUxwd0g4WTJHblJibVFoUUxuTG9ydlVEdmQ4MkhCQ295aXk1UVczQWd1?=
 =?utf-8?B?cjEwaXZSbEk5ejBRSHVzUFNvYWJGNEdDck9qMFlNQXBQY09yN1dESTNXd3dH?=
 =?utf-8?B?aDRjaC96SitKNmtGbXV3cnIvR3pjU0liRjV4UXFNUy9ncTlVQys1Nmp4VCsv?=
 =?utf-8?B?THplY0lzRlFQRW9hN2JyWDFpcFFqT0U1a3BxY3lCZk5nOGJaYndXMEFhd1BB?=
 =?utf-8?B?YkU4aHRFdTgxbkhYN044VzZjVTMyM3J1Q3hkYXlDQjNzOHZ4K05zTHh0NHFQ?=
 =?utf-8?B?V1ZpN2V3bmZmeTVLc0tzTWlxQkR5UXgzdEpJamM1TFdBVXFrQnZDMWNMQlFU?=
 =?utf-8?B?YjYvOWlRWXhuUG1PLzU2UEd1T3hYN0ltUjZBQjhQYTY0ZHFNSU91QitBY1p2?=
 =?utf-8?B?UXFQYjFoRDVsMmNJREt1dVJvQmNpT1RuVDNES011bzMwU3d0UzRhU2xmTWVW?=
 =?utf-8?B?aU5UcUVnNUhYSjBzdlVHTEI3aTNXbzlZSmdRUmdsV1RiVXJTMlNCQmtnRlJY?=
 =?utf-8?B?a0dFT0cyeHF3elFEVER5VVA1czFERDNoWDZlVVEzcTJGNnhjSlBGNE4yU0x1?=
 =?utf-8?B?WlhzT2J6WER1V1RGb0FFNjdZYXo1YlJGUVdIdjdlSXRaNk13c0dvWlhwaW5t?=
 =?utf-8?B?SGJ3b29sQU43VDYzanRWTDFYb1VsWUFIdysxVDNvVkxtL0N6cmc3elZsbGxm?=
 =?utf-8?B?OG9BNFpjUlhCSzR5V1VSUFFDTVlnNCt3UUJac2JaK2VzTjVVR0pxS0wwWDBq?=
 =?utf-8?B?ejhpNUx6Ry9mbWFrUDRWOVB0NmFGT203VVhpd0wyMFB1MzdBYUJtcThlMEJQ?=
 =?utf-8?B?MWVEM3N2Q2tJVmVIcmhJWmlxN1lBbnhBM2RVZkV4cUlaREg0SEZBQXRkeGF3?=
 =?utf-8?B?bjNlY09xSUhONTFPb3Faa281SE5wM0RXTXFVcWJUcklRblhOTHRVdHFibHdF?=
 =?utf-8?B?eWRuOFBlTTliZjJTN25iNlFoMytlclo2dEdCZDkwM1QrM0hsYXkySXhhZUZG?=
 =?utf-8?B?NTZaRC9SSkNtb0tGNjkxZEVxTTcrN0JhQ0IvbmMzVEg3QnJ4OVpUT3B4UXZk?=
 =?utf-8?B?cmE4NEthMGx4eUkvZHZtSWxBOTdZaTJWdzVTMTlqRDJHZHIxcmNYOUNOWGhR?=
 =?utf-8?B?NWY0Vk5iTmY4d1R3YkRNbDRKMDQ2YlpFU3A3TUVoVGhkT1BkY0JFTmczNDZw?=
 =?utf-8?B?dGpZcmZsWVdOa1dGTkZFWWFUTG9JQmFLNmRQalNRRjI2bmVJVW0rQ0ZjZ0t1?=
 =?utf-8?B?Z1RHSHpaWWVkaW5Oc1pxTUp2TDBWbUptVjVLb1FweGJQeEU0bGhiYkhaeFZQ?=
 =?utf-8?B?VXVvaEJCdTBTQjUwTmhrQ3ZnZE5zT3ZsNWY4YktEd3MzT0lqZW8wejdoTEJn?=
 =?utf-8?B?RXlTOTY3NVRZVmZvWVlYM2JoOURBeTZNY1VRWlNzSkpDbTZDNlBYNzJDdGc1?=
 =?utf-8?B?M0tFa3NLaTNvRStQUDE4N3BNOWdGQ1FNNmsrSXJGSUtwbFlJZjVLT1BRdnRu?=
 =?utf-8?B?WFFwY1pHVklwRDNrWFBib3BSRzJ1UlRqYmwwVUU4dmJGVUJoTE82RWsxcGs0?=
 =?utf-8?B?K3gzZXIyOWtzZXlQSVMyNU5XZFJISEV6M2NsWXZEelo0enNya3Z0b2Y4c25I?=
 =?utf-8?B?SnNqUUxwVVVUOVVEampVRU5JOUxvakk1SXczbkU0aWNkYmZyWjF4SmFETkwv?=
 =?utf-8?B?R0lVY1pVTCtKcklra0xHc0EyTFpOZTN4d1JKdlJUcDM5TkkwZ01FK296N25n?=
 =?utf-8?B?Z29PWm1UTGRNWHFSVTBqWFUzeUVHSjJGTUdhQXBxVE9qVTlBdmFOQXJVRnVX?=
 =?utf-8?B?VVIyVUtuZ3pWcS80NllVY2U2dkxxNU1uWFowODBpdVRRcE5GZDN0Z2VRTzBh?=
 =?utf-8?B?OU5wc3hjTGtRb2RqRzdDQ29KNko2TFJISWUwUXZrRFFCS3loejQ2K3k5dHZ2?=
 =?utf-8?B?Z2JZVTFXSjVrQU9NODJmTWo0Vk9WU3Z3TFkyL0YzQ1dXU1E4YTNmMzlZYXdU?=
 =?utf-8?B?VWZDSGlYVlV6N0tDRTNVN1JkREM0ZllNT0FkQnA0a0F1OHR0WHlzdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 766ff2d6-0486-4c03-549f-08de81334429
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2026 19:03:52.1638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ZvAdtVqdRh3kzz4FIZifPdhhU57cdt72IuybCxsRnUw/3qy0xHwfvt7bwTBPlVgSaRGjy7M91m6RT7KL704cA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9095
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

On 2026-03-11 17:25, Alex Hung wrote:
> Rename gamma 2.2 helpers to match their behavior, and
> update kms_colorop test names and transform references accordingly.
> 
> Signed-off-by: Alex Hung <alex.hung@amd.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> Note: this requires the kernel patch "drm/amd/display: Fix gamma 2.2 colorop TFs"
> 
>  lib/igt_color.c            |  8 ++++----
>  lib/igt_color.h            |  4 ++--
>  tests/kms_colorop.c        | 12 ++++++------
>  tests/kms_colorop_helper.c |  8 ++++----
>  4 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index 05ca2d9b4..8c405275a 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -184,14 +184,14 @@ void igt_color_pq_125_inv_eotf(igt_pixel_t *pixel)
>  	igt_color_pq_inv_eotf(pixel);
>  }
> 
> -void igt_color_gamma_2_2_oetf(igt_pixel_t *pixel)
> +void igt_color_gamma_2_2(igt_pixel_t *pixel)
>  {
> -	igt_color_powf(pixel, 1/2.2f);
> +	igt_color_powf(pixel, 2.2f);
>  }
> 
> -void igt_color_gamma_2_2_inv_oetf(igt_pixel_t *pixel)
> +void igt_color_gamma_2_2_inv(igt_pixel_t *pixel)
>  {
> -	igt_color_powf(pixel, 2.2f);
> +	igt_color_powf(pixel, 1/2.2f);
>  }
> 
>  static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
> diff --git a/lib/igt_color.h b/lib/igt_color.h
> index 919330c8b..722446400 100644
> --- a/lib/igt_color.h
> +++ b/lib/igt_color.h
> @@ -108,8 +108,8 @@ void igt_color_pq_125_eotf(igt_pixel_t *pixel);
>  void igt_color_bt2020_inv_oetf(igt_pixel_t *pixel);
>  void igt_color_bt2020_oetf(igt_pixel_t *pixel);
> 
> -void igt_color_gamma_2_2_oetf(igt_pixel_t *pixel);
> -void igt_color_gamma_2_2_inv_oetf(igt_pixel_t *pixel);
> +void igt_color_gamma_2_2(igt_pixel_t *pixel);
> +void igt_color_gamma_2_2_inv(igt_pixel_t *pixel);
> 
>  void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
>  void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index d535be4e5..f94cfb407 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -51,9 +51,9 @@
>   * @pq_125_inv_eotf:			PQ Inverse EOTF for [0.0, 125.0] optical range
>   * @pq_125_eotf-pq_125_inv_eotf:	PQ EOTF -> PQ Inverse EOTF with [0.0, 125.0] optical range
>   * @pq_125_eotf-pq_125_inv_eotf-pq_125_eotf: PQ EOTF -> PQ Inverse EOTF -> PQ EOTF with [0.0, 125.0] optical range
> - * @gamma_2_2_inv_oetf:			Gamma 2.2 Inverse OETF
> - * @gamma_2_2_inv_oetf-gamma_2_2_oetf:	Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF
> - * @gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf: Gamma 2.2 Inverse OETF -> Gamma 2.2 OETF -> Gamma 2.2 Inverse OETF
> + * @gamma_2_2:				Gamma 2.2
> + * @gamma_2_2-gamma_2_2_inv:		Gamma 2.2 -> Gamma 2.2 Inverse
> + * @gamma_2_2-gamma_2_2_inv-gamma_2_2:	Gamma 2.2 -> Gamma 2.2 Inverse -> Gamma 2.2
>   * @ctm_3x4_50_desat:			3x4 matrix doing a 50% desaturation
>   * @ctm_3x4_overdrive:			3x4 matrix overdring all values by 50%
>   * @ctm_3x4_oversaturate:		3x4 matrix oversaturating values
> @@ -382,9 +382,9 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>  		{ { &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_inv_eotf" },
>  		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, NULL }, "pq_125_eotf-pq_125_inv_eotf" },
>  		{ { &kms_colorop_pq_125_eotf, &kms_colorop_pq_125_inv_eotf, &kms_colorop_pq_125_eotf_2, NULL }, "pq_125_eotf-pq_125_inv_eotf-pq_125_eotf" },
> -		{ { &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2_inv_oetf" },
> -		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2_inv_oetf-gamma_2_2_oetf" },
> -		{ { &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2_inv_oetf-gamma_2_2_oetf-gamma_2_2_inv_oetf" },
> +		{ { &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2" },
> +		{ { &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2-gamma_2_2_inv" },
> +		{ { &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2-gamma_2_2_inv-gamma_2_2" },
>  		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
>  		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
>  		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index c3a2b8f13..aaee4e567 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -127,8 +127,8 @@ kms_colorop_t kms_colorop_gamma_22_oetf = {
>  	.enumerated_lut1d_info = {
>  		.tf = KMS_COLOROP_LUT1D_GAMMA_2_2_OETF
>  	},
> -	.name = "gamma_2_2_oetf",
> -	.transform = &igt_color_gamma_2_2_oetf
> +	.name = "gamma_2_2",
> +	.transform = &igt_color_gamma_2_2
>  };
> 
>  kms_colorop_t kms_colorop_gamma_22_inv_oetf = {
> @@ -136,8 +136,8 @@ kms_colorop_t kms_colorop_gamma_22_inv_oetf = {
>  	.enumerated_lut1d_info = {
>  		.tf = KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF
>  	},
> -	.name = "gamma_2_2_inv_oetf",
> -	.transform = &igt_color_gamma_2_2_inv_oetf
> +	.name = "gamma_2_2_inv",
> +	.transform = &igt_color_gamma_2_2_inv
>  };
> 
>  kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
> --
> 2.43.0
> 

