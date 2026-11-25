Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DCB8606A31E
	for <igt-dev@archiver.kernel.org>; Wed, 25 Nov 2026 03:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=klXqG248
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D5D10E5DC;
	Wed, 25 Nov 2026 03:49:36 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011068.outbound.protection.outlook.com [52.101.52.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32FA010E5DC
 for <igt-dev@lists.freedesktop.org>; Wed, 25 Nov 2026 03:48:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x+cAR42L+aJKeoohAU4ycC6wFMq3VKDBEIIXFQdiupB6/rkYbhGq9JGCUNer6PPv73rN6ULm0Osip1Ug4TxcQD5bXknV7I5QTn5jG1LtbUYo6zzof2cKjfHjVHgjNKIj286t8RkVHRh45nFGOwm1CeBQ8SkZb5y8S9RUfG4hvMadwpVlbrBN5XXWEuaFG7iDbPmym4w31yyTYbX4z+ac+TAy2gOsho9OzV6MevzA3m27VJB2ejjH90zHWA00+aR9KFE4GipjQwVMPyTfXJ1skTsizpVKvy3QjAeYN15+W4ktlKbHjA39G/i08cSFw2xwNSHnO5MxbOVg1aBWmFqKOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UmljRn81lywmTviSibeopRbiZ84lgrgZDF3h0WEeXXE=;
 b=Ao6XlpwpSeKOyRpixc7wPwgjys7Y/lU7Vf8MvpWyGsInDN3BxRt19MHOwlC0DWipROq3o5XGOJRTA1ZlzHYBtecrE4hEHO/h1Sc6ev2RnrSTo5juqnqg20Ajn7jsZ9orKuzFOAxyMreZKF4JXqa9kScGHa7miS6RDVfuA0zT2HepdoI2M338UelOI1vgBcPikfyWpT5s1xlnvD657h38jlzko/doekoW3ArQZAo2yMT1jmYT6SKsGUf/jdXvZYPnRdA1MXhvSJUnVGHevlwhnGIh4gYzFAr2495PbyzOb30gTbIzpbMCh28Tp/Rj8yV7DU6ho+wp/P41hMyYtkwIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UmljRn81lywmTviSibeopRbiZ84lgrgZDF3h0WEeXXE=;
 b=klXqG248APU/17Wh5/hCWMgwoXpupPZNe5yKz6lqxqk/q5l2/N8EaY/Y3H1plJSY0P7jZOsU7fRrLSJtkOSlG9vWUmiClY13yLC8tAwMwcwXTkog1IHTrv8O6Q7nCLyAb4UnD9xA1t2LWtlxJDxKHUAzg45i4+jvvNtZdJPcO6w=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8705.namprd12.prod.outlook.com (2603:10b6:303:24c::18)
 by MN6PR12MB8590.namprd12.prod.outlook.com (2603:10b6:208:47c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Wed, 25 Nov
 2026 03:48:15 +0000
Received: from MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321]) by MW6PR12MB8705.namprd12.prod.outlook.com
 ([fe80::e75b:745c:ed13:f321%4]) with mapi id 15.21.0662.004; Wed, 25 Nov 2026
 03:48:15 +0000
Message-ID: <30dae7b9-a8ea-46f7-ae4d-a1d8e0d89112@amd.com>
Date: Tue, 24 Nov 2026 21:48:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] tests/kms_colorop: Add Gamma 2.4 and 2.6 tests
To: Harry Wentland <harry.wentland@amd.com>, igt-dev@lists.freedesktop.org
References: <20261119155432.2494029-1-harry.wentland@amd.com>
 <20261119155432.2494029-2-harry.wentland@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20261119155432.2494029-2-harry.wentland@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:303:dc::6) To MW6PR12MB8705.namprd12.prod.outlook.com
 (2603:10b6:303:24c::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8705:EE_|MN6PR12MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ed887f1-2bc2-486d-9dd6-08df4aa6ef42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|261026140227099003|261022105027099003|10067099003|11063799006|4143699003|56012099006|261009223027099003|261021121427099003|261028144727099003|261102123227099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: FlmqjndIS0gXY4nvKEQo4jUjtbYlA4isWoHu/X5+OLrX4Cwh315DJIIpmLXN45Iy36H3/qnb9a/MjQjmEV29n0j4BjSoqydWOUX/5WQT67IIFlf5d369YWyC8STm2B8csgnIOS9Yld3CEBKDxLVSkAcBwhv4ExT7fHvvgtrMDh6TESbdGNe1a0TwL70PzOr/DDIL9WBuI6kZDIrZx5wtbJ5nnClPUilrbA9bjQXhj/+LWaUT/JSXNpcPGmrUoCbZ6AMgi8mhVf1XnBCWK2g5KiMhnHWwIY3HdaLVFR8cXw4x7gM+G/rljqtoDeeMvsjuemhb4etFB+GU8gdBfictVRPxs0QXW8IqprB6JKrBqwToJgj6k/xyn6StLfbkE8UF+VjBqnrP5iKkBpja8s3a2Y4+60QPbVq2qEgOeaqtru38gs1zJQ690e4uWDsAsI7flRyyl26eFS3WqFvWgR3A9iqui7A+gSDea/e+2GYnf09ABPAa/uQkmfvuDTCSWQsWeLA8ibmrqnEqnfykI2BkJZavhZfe64Q+6QkQPfOqWp0hEBHyuSSUMkqvtjfIn5pkuwFmVWAXoa5rZo6jqdE6X6lPTxavZamELMZO1/OqRB1G/7dx0J6WVhc+tcMUw2vrqnH8J/Y7Jh4+ec42VrXDKLSZu0+mjBNiMJsG76JQWjg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8705.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261026140227099003)(261022105027099003)(10067099003)(11063799006)(4143699003)(56012099006)(261009223027099003)(261021121427099003)(261028144727099003)(261102123227099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGgzZG5kaVcrMjVJK1dUbUNOQStDenliZnZNZ2gzcGRnTWtvd2NhVEJpU1hx?=
 =?utf-8?B?NUYzNUR4RXdoQzNOQkEyVk1sdDVmMlRyNnI0cndqUTZiMTFCeTgzMXZ1Mk5D?=
 =?utf-8?B?RXQ3UExaSzBMcG9PbWQ3R2RHdktTZXpzT29OYzhzdHViamxKWXVDVmp0UXBM?=
 =?utf-8?B?WE5uZ09qdGZiV29ZYlZ4N213MGVKTTZKSzUzZkxyVTQ5TzNjTEcwZjJiTUJx?=
 =?utf-8?B?OFhNcitqZGJUdzZRWGw3NFBibmhvWXdXd2dJVjNkbGxGTnNtMW1sUWEvY2ZN?=
 =?utf-8?B?UlVMQlREK2xza3dJb1NHM1I0K0RmMWFzcFFZbzd5U3dKMEZrSkNrbFd0U1da?=
 =?utf-8?B?YWlROGt6ZWRhR0hNQXZpem5kMEM4ZW5uZlJ1bWY5N3dmaVMwR1lva0VwRFYv?=
 =?utf-8?B?ZUlpeVY0MUY3MGE0SkNYVkw5MjFGYzFxUzgxT2RDcERaeXJRb2s5OUt6U0dK?=
 =?utf-8?B?dTdVcWE4WWVLZEg1aXVpbWpuT0xTLzdWMmxuU0wvL1d1M002Y0hYN2MvQ0Q5?=
 =?utf-8?B?b3dDSEcrdVZSQjNGeWZVcmVMNENUQy95ZmxEMXBja0YvemV6NDQ4VmJzNERC?=
 =?utf-8?B?aGxjalFwMEh3UEwreFZOQURwRHR0elU3N251ZUoyMXlEYVpJR3ZWWjNscUNH?=
 =?utf-8?B?Mk16WlM4bTFxMHNBZG9OdHVxZjF5U1RzQUN0Q2lvSUtERDVNNDJlbGV5OXo2?=
 =?utf-8?B?dHZ2K1lnQzYxQkhFT1hQZjJzUkt2ck1EOGxPWWF6K0R5dk9RTWszMVBPZHp2?=
 =?utf-8?B?T2FNUG9jd2NBMU9GRjNTUFdhM0JuUzNmV1lNT2N3MkZTdDUwK0JuMHhMNUN2?=
 =?utf-8?B?TzFUR0lyNk9lWWpreE9PNjlpOHNsRVUyT1JEMHRzb1pyendXWGVGSmVNMDk4?=
 =?utf-8?B?MGZCenB4VVkyTXNwSzg1U3YwNXZtTVpFVkQ0R2M4Wm9pWWZjQjNVVFdzbUla?=
 =?utf-8?B?bStDUUJLMC9RcXVJZjQ3UWt5dWNMQmo5dTJUWlZCc1Y5Vis2aE5JcGFrYTlH?=
 =?utf-8?B?UDAxRndLMTFiRGRuZldiT1hNWmE4WFM3VWgwc1g1cExWUHlwdkNRZUxZclJD?=
 =?utf-8?B?UGUveTdyMHNuWnNySkpnYWdKcW9sMElaMDVBckJCRnVpSXpKTTdEa2g3ZXF1?=
 =?utf-8?B?SnNya2Y0d3REK0pKbzJnT0hqMnV4cjdzbVd3QS9HMWV2cFpNTzBBZUFkM1gx?=
 =?utf-8?B?NE81aEdoOUc1TXBYeVlXa0M1c0FDdUREOUE1RU9uK3VvcWxOR3YwTFNsdWZh?=
 =?utf-8?B?cXd5RW1oK1hrbjVxem1NWXN1eWNtOEpKRVFlL1B5MzdTN28vSkloV1dKRGRU?=
 =?utf-8?B?U2g5NkVzdlpQNG91QmlZQ24wb1MvRTA2RmZjNXBpci9NYlIycEhUWDF6V0xr?=
 =?utf-8?B?ZHU3a2p3NGswa0VKeXZGMEkyODRjbHA4L0VZY21vOWpWQThNTE41U09LY2d1?=
 =?utf-8?B?d2tJVGFHUDRjbmVzdEtjVkwrcm1VNFNmV1ZUaHNHeHRDSnU0RjlBa2J1SkRC?=
 =?utf-8?B?cjFRY3BhaWExR085SFhOWGJhY2ZYVnhLdW42RXhMOVd3V1NMOXRTNnBKaDlR?=
 =?utf-8?B?eGMxSGtMSW1HRS9JRmFxMVFqMGVXeHNyUXg2WHMxeDBEbkxCNEp1UjRIRndC?=
 =?utf-8?B?R3NNbzc1NjA5Tk8ydjlLVFJnQzc1c1UzK2dXRjkzcGVrdnZNeTJGT1F1ZG9E?=
 =?utf-8?B?NFRhL2tvYURhb0pRc1FJTHVVTXFldGZjNGN3U2xQNUZPckU1a1N6cHVVcENy?=
 =?utf-8?B?Zk1MM2N5cEFIaEZzUmZ1SFQ2TGI4cTdLd1dEd2FFS3l0ckFiMWlGaXFWeEh1?=
 =?utf-8?B?dG15YzFNTWVTcGJHU2RCNERPT2xrV1d5NjE0dWErZ05nUEtDR29KVitGV0JI?=
 =?utf-8?B?UGtjNmpSZTJZYnpSMU1QK1ZjTkIzdEJGTDhSNnNWenFWc2ZWaXNBWFFNOG5K?=
 =?utf-8?B?WEptQU5QVEw5MmxtQkFxRFljSklBRUcwbEl0a0hoVnJLaVRwSlpiaWRlYTBG?=
 =?utf-8?B?SC90VTVEakVVaGc4NWh0ZUorckdkb29UekdUcDBCVGYwYlBZL1FoWjN6QXox?=
 =?utf-8?B?UUhraU8yVXUwdkt6eVJaRmcrQm80QjlDb2phdU0vNmd3VHNzQ3JhU3BJZEN4?=
 =?utf-8?B?VXlTVGtMWGRaVnpwTCtVOFd6VnQ5M0tncGkvQkZhcVdoOUZ4bFlJaTlxV2Ju?=
 =?utf-8?B?MldpWCt5OWVNcVJCQnFsY3pmckVEWDcrOUtWb2djTXJVWkJpaDZLQnlERm04?=
 =?utf-8?B?TnBtY0JYU2QwRTRvb1UzMlhuN3hOb0JJU2N1UW5DNHUzbklYTGdFSVF3clFv?=
 =?utf-8?Q?tcWBn+DSTgErr4fMPV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ed887f1-2bc2-486d-9dd6-08df4aa6ef42
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8705.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 03:48:15.1115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ot9bmfyI3thfk/XzDMQInZBcn/g2yN+dmC35T9WjBKfWDrF7a+dhbkruioSrkuTb2qNjCekU0L4UD7IZURm0dA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8590
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Tested on DCN 3.5.

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 11/19/26 09:54, Harry Wentland wrote:
> kms_colorop already round-trips Gamma 2.2. A compositor that uses a
> 2.4 or 2.6 power curve needs the same check.
> 
> Tested on Navi 48.
> 
> Signed-off-by: Harry Wentland <harry.wentland@amd.com>
> ---
>   lib/igt_color.c            | 20 +++++++++++++++++++
>   lib/igt_color.h            |  4 ++++
>   tests/kms_colorop.c        | 18 +++++++++++++++++
>   tests/kms_colorop_helper.c | 40 ++++++++++++++++++++++++++++++++++++++
>   tests/kms_colorop_helper.h |  8 ++++++++
>   5 files changed, 90 insertions(+)
> 
> diff --git a/lib/igt_color.c b/lib/igt_color.c
> index 582fc6c0c3bc..decc5116e8f8 100644
> --- a/lib/igt_color.c
> +++ b/lib/igt_color.c
> @@ -195,6 +195,26 @@ void igt_color_gamma_2_2_inv(igt_pixel_t *pixel)
>   	igt_color_powf(pixel, 1/2.2f);
>   }
>   
> +void igt_color_gamma_2_4(igt_pixel_t *pixel)
> +{
> +	igt_color_powf(pixel, 2.4f);
> +}
> +
> +void igt_color_gamma_2_4_inv(igt_pixel_t *pixel)
> +{
> +	igt_color_powf(pixel, 1/2.4f);
> +}
> +
> +void igt_color_gamma_2_6(igt_pixel_t *pixel)
> +{
> +	igt_color_powf(pixel, 2.6f);
> +}
> +
> +void igt_color_gamma_2_6_inv(igt_pixel_t *pixel)
> +{
> +	igt_color_powf(pixel, 1/2.6f);
> +}
> +
>   static void igt_color_apply_3x4_ctm(igt_pixel_t *pixel, const igt_matrix_3x4_t *matrix)
>   {
>   	igt_pixel_t result;
> diff --git a/lib/igt_color.h b/lib/igt_color.h
> index d66cfebc4191..8c598856d8fd 100644
> --- a/lib/igt_color.h
> +++ b/lib/igt_color.h
> @@ -114,6 +114,10 @@ void igt_color_bt2020_oetf(igt_pixel_t *pixel);
>   
>   void igt_color_gamma_2_2(igt_pixel_t *pixel);
>   void igt_color_gamma_2_2_inv(igt_pixel_t *pixel);
> +void igt_color_gamma_2_4(igt_pixel_t *pixel);
> +void igt_color_gamma_2_4_inv(igt_pixel_t *pixel);
> +void igt_color_gamma_2_6(igt_pixel_t *pixel);
> +void igt_color_gamma_2_6_inv(igt_pixel_t *pixel);
>   
>   void igt_color_ctm_3x4_50_desat(igt_pixel_t *pixel);
>   void igt_color_ctm_3x4_overdrive(igt_pixel_t *pixel);
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 0ccd1acdf06e..e118a9b978a6 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -40,6 +40,12 @@
>    * SUBTEST: plane-XR24-XR24-gamma_2_2
>    * SUBTEST: plane-XR24-XR24-gamma_2_2-gamma_2_2_inv
>    * SUBTEST: plane-XR24-XR24-gamma_2_2-gamma_2_2_inv-gamma_2_2
> + * SUBTEST: plane-XR24-XR24-gamma_2_4
> + * SUBTEST: plane-XR24-XR24-gamma_2_4-gamma_2_4_inv
> + * SUBTEST: plane-XR24-XR24-gamma_2_4-gamma_2_4_inv-gamma_2_4
> + * SUBTEST: plane-XR24-XR24-gamma_2_6
> + * SUBTEST: plane-XR24-XR24-gamma_2_6-gamma_2_6_inv
> + * SUBTEST: plane-XR24-XR24-gamma_2_6-gamma_2_6_inv-gamma_2_6
>    * SUBTEST: plane-XR24-XR24-ctm_3x4_50_desat
>    * SUBTEST: plane-XR24-XR24-ctm_3x4_overdrive
>    * SUBTEST: plane-XR24-XR24-ctm_3x4_oversaturate
> @@ -70,6 +76,12 @@
>    * SUBTEST: plane-XR30-XR30-gamma_2_2
>    * SUBTEST: plane-XR30-XR30-gamma_2_2-gamma_2_2_inv
>    * SUBTEST: plane-XR30-XR30-gamma_2_2-gamma_2_2_inv-gamma_2_2
> + * SUBTEST: plane-XR30-XR30-gamma_2_4
> + * SUBTEST: plane-XR30-XR30-gamma_2_4-gamma_2_4_inv
> + * SUBTEST: plane-XR30-XR30-gamma_2_4-gamma_2_4_inv-gamma_2_4
> + * SUBTEST: plane-XR30-XR30-gamma_2_6
> + * SUBTEST: plane-XR30-XR30-gamma_2_6-gamma_2_6_inv
> + * SUBTEST: plane-XR30-XR30-gamma_2_6-gamma_2_6_inv-gamma_2_6
>    * SUBTEST: plane-XR30-XR30-ctm_3x4_50_desat
>    * SUBTEST: plane-XR30-XR30-ctm_3x4_overdrive
>    * SUBTEST: plane-XR30-XR30-ctm_3x4_oversaturate
> @@ -448,6 +460,12 @@ int igt_main_args("d", long_options, help_str, opt_handler, NULL)
>   		{ { &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2" },
>   		{ { &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, NULL }, "gamma_2_2-gamma_2_2_inv" },
>   		{ { &kms_colorop_gamma_22_oetf, &kms_colorop_gamma_22_inv_oetf, &kms_colorop_gamma_22_oetf, NULL }, "gamma_2_2-gamma_2_2_inv-gamma_2_2" },
> +		{ { &kms_colorop_gamma_24_oetf, NULL }, "gamma_2_4" },
> +		{ { &kms_colorop_gamma_24_oetf, &kms_colorop_gamma_24_inv_oetf, NULL }, "gamma_2_4-gamma_2_4_inv" },
> +		{ { &kms_colorop_gamma_24_oetf, &kms_colorop_gamma_24_inv_oetf, &kms_colorop_gamma_24_oetf, NULL }, "gamma_2_4-gamma_2_4_inv-gamma_2_4" },
> +		{ { &kms_colorop_gamma_26_oetf, NULL }, "gamma_2_6" },
> +		{ { &kms_colorop_gamma_26_oetf, &kms_colorop_gamma_26_inv_oetf, NULL }, "gamma_2_6-gamma_2_6_inv" },
> +		{ { &kms_colorop_gamma_26_oetf, &kms_colorop_gamma_26_inv_oetf, &kms_colorop_gamma_26_oetf, NULL }, "gamma_2_6-gamma_2_6_inv-gamma_2_6" },
>   		{ { &kms_colorop_ctm_3x4_50_desat, NULL }, "ctm_3x4_50_desat" },
>   		{ { &kms_colorop_ctm_3x4_overdrive, NULL }, "ctm_3x4_overdrive" },
>   		{ { &kms_colorop_ctm_3x4_oversaturate, NULL }, "ctm_3x4_oversaturate" },
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index 388b990ca4ff..41c3b95fab49 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -17,6 +17,10 @@ const char * const kms_colorop_lut1d_tf_names[KMS_COLOROP_LUT1D_NUM_ENUMS] = {
>   	[KMS_COLOROP_LUT1D_PQ_125_INV_EOTF] = "PQ 125 Inverse EOTF",
>   	[KMS_COLOROP_LUT1D_GAMMA_2_2_OETF] = "Gamma 2.2",
>   	[KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF] = "Gamma 2.2 Inverse",
> +	[KMS_COLOROP_LUT1D_GAMMA_2_4_OETF] = "Gamma 2.4",
> +	[KMS_COLOROP_LUT1D_GAMMA_2_4_INV_OETF] = "Gamma 2.4 Inverse",
> +	[KMS_COLOROP_LUT1D_GAMMA_2_6_OETF] = "Gamma 2.6",
> +	[KMS_COLOROP_LUT1D_GAMMA_2_6_INV_OETF] = "Gamma 2.6 Inverse",
>   };
>   
>   const char * const kms_colorop_fixed_matrix_names[KMS_COLOROP_FIXED_MATRIX_NUM_ENUMS] = {
> @@ -150,6 +154,42 @@ kms_colorop_t kms_colorop_gamma_22_inv_oetf = {
>   	.transform = &igt_color_gamma_2_2_inv
>   };
>   
> +kms_colorop_t kms_colorop_gamma_24_oetf = {
> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
> +	.enumerated_lut1d_info = {
> +		.tf = KMS_COLOROP_LUT1D_GAMMA_2_4_OETF
> +	},
> +	.name = "gamma_2_4",
> +	.transform = &igt_color_gamma_2_4
> +};
> +
> +kms_colorop_t kms_colorop_gamma_24_inv_oetf = {
> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
> +	.enumerated_lut1d_info = {
> +		.tf = KMS_COLOROP_LUT1D_GAMMA_2_4_INV_OETF
> +	},
> +	.name = "gamma_2_4_inv",
> +	.transform = &igt_color_gamma_2_4_inv
> +};
> +
> +kms_colorop_t kms_colorop_gamma_26_oetf = {
> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
> +	.enumerated_lut1d_info = {
> +		.tf = KMS_COLOROP_LUT1D_GAMMA_2_6_OETF
> +	},
> +	.name = "gamma_2_6",
> +	.transform = &igt_color_gamma_2_6
> +};
> +
> +kms_colorop_t kms_colorop_gamma_26_inv_oetf = {
> +	.type = KMS_COLOROP_ENUMERATED_LUT1D,
> +	.enumerated_lut1d_info = {
> +		.tf = KMS_COLOROP_LUT1D_GAMMA_2_6_INV_OETF
> +	},
> +	.name = "gamma_2_6_inv",
> +	.transform = &igt_color_gamma_2_6_inv
> +};
> +
>   kms_colorop_t kms_colorop_ctm_3x4_50_desat = {
>   	.type = KMS_COLOROP_CTM_3X4,
>   	.matrix_3x4 = &igt_matrix_3x4_50_desat,
> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index 4392386eaa16..fee9f2250760 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -37,6 +37,10 @@ typedef enum kms_colorop_lut1d_tf {
>   	KMS_COLOROP_LUT1D_PQ_125_INV_EOTF,
>   	KMS_COLOROP_LUT1D_GAMMA_2_2_OETF,
>   	KMS_COLOROP_LUT1D_GAMMA_2_2_INV_OETF,
> +	KMS_COLOROP_LUT1D_GAMMA_2_4_OETF,
> +	KMS_COLOROP_LUT1D_GAMMA_2_4_INV_OETF,
> +	KMS_COLOROP_LUT1D_GAMMA_2_6_OETF,
> +	KMS_COLOROP_LUT1D_GAMMA_2_6_INV_OETF,
>   	KMS_COLOROP_LUT1D_NUM_ENUMS
>   } kms_colorop_lut1d_tf_t;
>   
> @@ -106,6 +110,10 @@ extern kms_colorop_t kms_colorop_pq_125_eotf_2;
>   extern kms_colorop_t kms_colorop_pq_125_inv_eotf;
>   extern kms_colorop_t kms_colorop_gamma_22_oetf;
>   extern kms_colorop_t kms_colorop_gamma_22_inv_oetf;
> +extern kms_colorop_t kms_colorop_gamma_24_oetf;
> +extern kms_colorop_t kms_colorop_gamma_24_inv_oetf;
> +extern kms_colorop_t kms_colorop_gamma_26_oetf;
> +extern kms_colorop_t kms_colorop_gamma_26_inv_oetf;
>   extern kms_colorop_t kms_colorop_ctm_3x4_50_desat;
>   extern kms_colorop_t kms_colorop_ctm_3x4_overdrive;
>   extern kms_colorop_t kms_colorop_ctm_3x4_oversaturate;

