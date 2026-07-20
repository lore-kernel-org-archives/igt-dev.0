Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC8C4C4451B
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jul 2026 02:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC9A10E04B;
	Mon, 20 Jul 2026 02:37:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0+hyc6R5";
	dkim-atps=neutral
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011058.outbound.protection.outlook.com
 [40.93.194.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C53910E04B
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jul 2026 02:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AL5IDDccwjN584SrViz15YjKBAh697wy0KIxLAVoX98AHELe9K5lKmWikrr8SDelKnodCJU207+SC++3hqL6xvUukdRoJ0ZQkWd+suaotH6G0ePjpVqBjhFKPoEaf1PT8697OrbVIXQtcw5MbsNl4aDW/GEhtWNwwOwURsP1owXwDApLRUdtv9XsH7cw/zPK39iCFzFnMsshyCflmvzjyVkacU5t7y5MpUpM5kkKoKLECcNe3SbppSrNGuwsPwiouxroohu4yPfgaPQWcU0A8NgR3/Q3J2SWx2Oj/dc4iBa9Vttfb4/39HtZQb5UetbZwvZqUiB+HxtJJ2bl2Fe4+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlpRwMg501A9/7XcmupzbS8OsBAtNYQa8PlnzWBLLJU=;
 b=aTxPFdzZ1taCFxXqqUdIzN5nicmlQKokrHsO5DdkDDXOIq9qizCQ8oBcNQ/sR58/b9mnEQTegoqLHFbR/8IaegCD5OK9RuUvH/Gwupx/d2Q1BYRL8f7kFcGCJmgQULD6/tFWwR/L+tshTdtwnJc0Jvmpa+iqBe387yif22Z4y7TFFQYoZFCqqMLWLRP71KvxkkDnvX9BzYT4GE5UOpjiQTtjciHUv1a4QOVwAm+BWl36FFrr/WmX7rU6SJ/DmnNOjFj30cv37sVMFz7/zYXvjS08Lh/6MpEchgyXM/8iWXpLvRAYdrx/f4E/9QpqBIYCCzJD4gkc14Xulh52O3eG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlpRwMg501A9/7XcmupzbS8OsBAtNYQa8PlnzWBLLJU=;
 b=0+hyc6R5Pdt46zxDkL8FTsXKv/BJ6qw/TkHG+QM+9EZ2SB1+GAZdf2bns8EMaFDk007EGjgl9hIWkmr3rv9LkyxX/s8SeJFV4NzFa6dcODg1IvbOkMHfvrtlwYIemhfJAs89SeMK/yxDyjw1cBtsazBpBR+HB7Q2ba3B9yPR2LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH1PR12MB9573.namprd12.prod.outlook.com (2603:10b6:610:2ae::5)
 by PH7PR12MB6835.namprd12.prod.outlook.com (2603:10b6:510:1b5::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.14; Mon, 20 Jul
 2026 02:36:35 +0000
Received: from CH1PR12MB9573.namprd12.prod.outlook.com
 ([fe80::d88f:a143:5f79:c148]) by CH1PR12MB9573.namprd12.prod.outlook.com
 ([fe80::d88f:a143:5f79:c148%5]) with mapi id 15.21.0223.015; Mon, 20 Jul 2026
 02:36:35 +0000
Message-ID: <14d9223c-9a01-4489-9c5e-d245eb061f51@amd.com>
Date: Mon, 20 Jul 2026 10:36:30 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip 7efc alpha-swap
 CRC check on AMD at >8bpc/DSC
To: James Lin <PingLei.Lin@amd.com>, igt-dev@lists.freedesktop.org
Cc: alex.hung@amd.com, sunpeng.li@amd.com
References: <20260716063619.3344-1-PingLei.Lin@amd.com>
Content-Language: en-US
From: Tom Chung <chiahsuan.chung@amd.com>
In-Reply-To: <20260716063619.3344-1-PingLei.Lin@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYCPR01CA0174.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::13) To CH1PR12MB9573.namprd12.prod.outlook.com
 (2603:10b6:610:2ae::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PR12MB9573:EE_|PH7PR12MB6835:EE_
X-MS-Office365-Filtering-Correlation-Id: e112e5cc-4a93-4501-2980-08dee607b736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: Fe+7N5t54sCyx6cyeYD2slOi0K7lE0dUSg+Iw6KhS9KycXCkqE72S4/IbmPZllQTwxPN5DaVSUkl99gFvFjNNzGlLT35QTJFw6ij46kiUMRsNaaNEnsRi7pzjBXSkPMBZRLKJpZ2ZrCWklNZbRRJPvdGV4llf6HUzGZRyGpoOATJsh/mAyKloBNosarnn/1f81FS2a72/AUSYG6qwxOv7zmzF7fFcIxHcZAO/aWso0A5hBNUGAz6UU15ckiSfjt9IP18xA96K7u6stbLMiy5rLDY//CmaUmh6GK5z0OiJqmI9gtDcJy7OyirtCwAQANedJzfw48vN8Q348q3KN1ExmaEs2WTWjjBBuI8b7eyxI7qJOXIaWhNAZAAL27dCDer1mvo0bL9FJ2TBq2wQcIpfu11h6JNtCWSwC3MJJ6tqbf6XR6CoHTEUI3TlHJDYEidES3eknUm9hujzTuWz2fbnEJyMTSOqsQTHKnbxlttPqGWctvfmQGlaLnSQ2KwdjaQyB/24/rIKxBwa3zC9WUDeTJG1YJIVhDF8mgJLsJCoApFJ6Gz5gI6wmrTTh4T2ko0A7xiYsh6Fojs8/Mxg6bqi01HnaqpaNpqhFJKW2PXn+sitleleqVlKfKqpGxAmcrwpi66rcfoIRjldNydyZeVud5uq9vFIn4BLESEOAhh+Ys=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH1PR12MB9573.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VURTaWlObHBTeGVEQnlNM3JtWlcvUS91N2V5TUNEYXZSM2hPd3RqRElkUUdC?=
 =?utf-8?B?aXE5cHN0a0RTRlJDNmZOdWNhdE1VMHVyaGQ1UHFHQ2FJVGQzMXpRZFFqaVBR?=
 =?utf-8?B?Y1FrWksxSFY2TmtJRE5YbDdybStidmRJL0FOMzFCRmFwSXhIcHN5RnNOY1RQ?=
 =?utf-8?B?YUIxcmRkL2EyZzRyYXhTWkNQSTJjSmFTN1dMbFBPNVhoNzg2OTkxeUR1dEN2?=
 =?utf-8?B?Vkp5NTIrMm9sNU9IN2ZLWU1xN2pxNlBKa0lYeFE3NXNHWjJrYThFL1Nqem92?=
 =?utf-8?B?TjVHZFEvVzRCRnIxS2dYZjcvMEFlL0x0QjJRMVZuUzR5bkJCOEEwak93a1Fx?=
 =?utf-8?B?MElYTkZRaUJlYWFzcllOZE1QQm9ZdFdVcHZpTXhFNVI5c2poVUZRTW1TRDRI?=
 =?utf-8?B?M0VZUmN5TVIrNHVvVktMUGI1cDl0a1BJQTFDWnFYSmI0VnJabjBXR3pONFRt?=
 =?utf-8?B?QmY3QjZIY21NSGhCREpSMWdIc1hTNUtXN1A1U0NreGxQdEtCbG1sMHkzb1Fi?=
 =?utf-8?B?TlA5dkJ1dWNBazdGMlpDU1gwbTd0dWtVeVVlbE8rUTI0OFBCZUNlR2VPN1FO?=
 =?utf-8?B?alp4d1VtamJyK3JveTlwRFJpT016dGd6K2JlWE4xY2dRYTc1QUtFWHJ3LzR4?=
 =?utf-8?B?NGpDa0gveTFpQUU1bFVGYmVJU3ZEUnpOMXNEelFNZmpLOThyVndZVmEyRHF6?=
 =?utf-8?B?S0d2aVV4TGNoaVUxeGtBSzkyRFMwNFNmUW4wUVozUU04L09IRFZ4UEFQd3BU?=
 =?utf-8?B?c2thZWxwdXFIdUpmUFNqOEZiVFUyOURpZ2VNQk1wbTFrVGZGSVAxSG04dFln?=
 =?utf-8?B?QkFtVHVBME1WaHVKWVBEckIvdzBtR0V1eUZNRXJPcjlLdSsxMU1vdm5QNC82?=
 =?utf-8?B?dC8wN2VoTFpUTTVkM1hlY2tUVit3TVRUU3lCcm51VmdqUXcvV2VkTzdZdFlZ?=
 =?utf-8?B?dXhoN1krbE5keWEvR0xjNXBEc29tZ2ZJUzV1cVBZcG9LTG5sZldITVJHdkhl?=
 =?utf-8?B?NjVyZmpJeDk2akF0cWl0Yjl5RzVMdG85elN2dG12WnZTSFpTd0kvNVlwUUkr?=
 =?utf-8?B?MENPaXhTOTdoU2hLV2dGcUZvTGp2TkhPM2UxSnR2aFVDNkJqaHBXTENQZnFD?=
 =?utf-8?B?cWhKZS82ZDI5U1dEVC85bzE3b3VhZnpoNGdNZHo4ekI0MzQxbFI5UVg0VVZq?=
 =?utf-8?B?RGR2SEdhMjVYOUZuSGM0RUhvekcrblg0WkU2L0RSQXhJU3pYbitsWnVOaS9U?=
 =?utf-8?B?dG9lWXVkWkNWazUySXQxcWFONFN2OHhzckttWXpjSnJzdXRZbmI1T2ZBenZr?=
 =?utf-8?B?K1hNRUZZbTlVc2ViTEttTy8rQ215cmNQY0pmdWxLa1JkV0c5V0x6UzFaaFA3?=
 =?utf-8?B?ZG44WmltN2FMb21Pengrd3kydTBYZ21xYjhwa0JybWwzSzVXM3JmOXh5UEVV?=
 =?utf-8?B?eURZOVFnam8zVzh5R21JaXhDZTdBdXNaVi9EcmpOZ1JHV0czcjVVVk5lOWtu?=
 =?utf-8?B?ZUdqOEw2Y2xpYzlmNjhxSFVYMkk1cVd4SG12VXZqZVhpaTllL1hGazJGVjFa?=
 =?utf-8?B?c1plaStNTHQybnZteWZoaWVWR29BdmQ1a0JIQjJPTmVtTXhYTll2VWFvNUto?=
 =?utf-8?B?OTZKSzJWQ0tMZ0drM05IUVlxRzVHeUJ2Mlg4b2ZseTdNVnBHM1NOWmZjd1FT?=
 =?utf-8?B?UEFMZGpJaHU3dFkwbEFvNzZiNUY4UlZaNk1ETlNqWW90NHFOL1ZObGxuR1hI?=
 =?utf-8?B?QzI1QUZCcU01VnpYaExBeFYyeTBVS1VQakpFc1pFWnVRL1UvQzd3NDFTd2pr?=
 =?utf-8?B?QkNPamZ6U28yWXBKSGF4Nm9KdXpFWUxmKysvTUhLc2lSWWt3L3FzS0pRTlV4?=
 =?utf-8?B?L09uMFRvOThQOGVPcTVPdEJ2TmJMdUgydDZVSGZDT1FjRGNJaS9MOG55eU9H?=
 =?utf-8?B?eStHWkx6UXNBMzNUUm16SkQxRW1VaGJJUzh5UE85bStqcnFkSXo0cmEzTVVt?=
 =?utf-8?B?S0RLYWFvamZTc1BMZEdHOEgvMERiN0lybUs5R2N3S2MxdzFYNEsyOFpxQ3pU?=
 =?utf-8?B?RHQvWlNFUXdrdGxYQ2xZanR3QUtjb3dKMXVXa0pCbENaTkVUa3lEVjNaeTZN?=
 =?utf-8?B?d0Z4L29qOEZjMm12dFh6aDhBVkl6SkxVMGRJdkV0YkhmclhVVHdTYTFXaGtq?=
 =?utf-8?B?MGJobHl4UnlIdkFRZlNnUGd5bXRzc2Y3eEhpaVRqSzV6YnpJdkY1L2VrcHBM?=
 =?utf-8?B?TlN0aDNuVTN6R0I4N0wvdk4vSzZQRDJiY1h3aUZpNTJHNWVtbFRoeC8wQU11?=
 =?utf-8?B?anZxR29WZDV4SytUQ3pkRDdwR016R3pOQldTZzRaa3NZWWdqT1FXUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e112e5cc-4a93-4501-2980-08dee607b736
X-MS-Exchange-CrossTenant-AuthSource: CH1PR12MB9573.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 02:36:34.9274 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OGhLyXlY9vlvFSQIMY+mnu1ab91PHcA86Jnx/d+bRgpHF5Shdd1iqP9OnfhP90jor1j+tbtkhmBQwvHHJ7p1Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6835
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

Reviewed-by: Tom Chung <chiahsuan.chung@amd.com>

On 7/16/2026 2:35 PM, James Lin wrote:
> [Why]
> alpha-7efc and coverage-7efc assert that swapping the plane global alpha
> (the KMS "alpha" property) with the per-pixel fb alpha (0x7e <-> 0xfc) yields
> a bit-identical pipe CRC. That identity only holds when the whole blend
> datapath collapses to exact 8-bit arithmetic. On AMD DCN the alpha/gain
> values are 8-bit, but the blend is carried at higher internal precision and
> only quantized down to the output bpc at the very end. A swap that is exact
> in idealized 8-bit math can therefore leave a sub-LSB residue: at 8 bpc the
> output quantization discards it and the CRCs match, but at >8 bpc, or when the
> stream is DSC-compressed (carried at its native >8 bpc), the residue survives
> and the CRCs differ. The strict compare then turns a legitimate precision
> artifact into a test failure - observed as a CRC mismatch on an eDP link
> brought up with DSC, while the same test passes on an 8-bit non-DSC link.
>
> [How]
> Add skip_if_alpha_swap_not_exact() and call it at the start of alpha_7efc and
> coverage_7efc. It is a no-op on non-AMD devices, so every other driver keeps
> the strict check unchanged. On amdgpu it reads the CRTC's current bpc and the
> connector's DSC status, and skips only when bpc > 8 or DSC is active - the
> conditions under which the alpha swap is legitimately not bit-exact. 8 bpc AMD
> configurations still run the strict compare, preserving the regression
> coverage the test was written for. Track the output in data_t so the DSC state
> of the current connector can be queried.
>
> Signed-off-by: James Lin <PingLei.Lin@amd.com>
> ---
>   tests/kms_plane_alpha_blend.c | 44 +++++++++++++++++++++++++++++++++++
>   1 file changed, 44 insertions(+)
>
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index 3a2649833..e040d5bec 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -33,6 +33,7 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_amd.h"
>   
>   /**
>    * SUBTEST: alpha-%s
> @@ -77,6 +78,7 @@ typedef struct {
>   	struct igt_fb xrgb_fb, argb_fb_0, argb_fb_cov_0, argb_fb_7e, argb_fb_cov_7e, argb_fb_fc, argb_fb_cov_fc, argb_fb_100, black_fb, gray_fb;
>   	igt_crc_t ref_crc;
>   	igt_pipe_crc_t *pipe_crc;
> +	igt_output_t *output;
>   } data_t;
>   
>   static bool in_simulation;
> @@ -442,11 +444,49 @@ static void constant_alpha_max(data_t *data, igt_crtc_t *crtc,
>   	igt_plane_set_fb(plane, NULL);
>   }
>   
> +/*
> + * The 7e/fc subtests (alpha-7efc, coverage-7efc) assert that swapping the
> + * plane global alpha with the per-pixel fb alpha (0x7e <-> 0xfc) yields a
> + * bit-identical pipe CRC. That identity only holds when the whole blend
> + * datapath collapses to exact 8-bit arithmetic.
> + *
> + * On AMD DCN the alpha/gain values are 8-bit, but the blend itself is carried
> + * at higher internal precision and only quantized down to the output bpc at
> + * the very end, so the swap can leave a sub-LSB residue. At 8 bpc the output
> + * quantization discards it and the two CRCs match; at >8 bpc, or when the
> + * stream is DSC-compressed (carried at its native >8 bpc), the residue is
> + * retained and the CRCs differ. This matches observation: the same test
> + * PASSes on an 8 bpc eDP link without DSC and FAILs on an eDP link brought
> + * up with DSC.
> + *
> + * So keep the strict bit-exact check everywhere except AMD at >8 bpc or with
> + * DSC active, where the swap is legitimately not bit-exact.
> + */
> +static void skip_if_alpha_swap_not_exact(data_t *data, igt_crtc_t *crtc)
> +{
> +	unsigned int bpc;
> +	bool dsc;
> +
> +	if (!is_amdgpu_device(data->gfx_fd))
> +		return;
> +
> +	bpc = igt_get_crtc_current_bpc(crtc);
> +	dsc = data->output &&
> +	      is_dp_dsc_supported(data->gfx_fd, data->output->name) &&
> +	      igt_amd_read_dsc_clock_status(data->gfx_fd, data->output->name) > 0;
> +
> +	igt_skip_on_f(bpc > 8 || dsc,
> +		      "plane-alpha/fb-alpha swap is not bit-exact on AMD DCN "
> +		      "at >8bpc/DSC (bpc=%u, dsc=%d)\n", bpc, dsc);
> +}
> +
>   static void alpha_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc = {}, crc = {};
>   
> +	skip_if_alpha_swap_not_exact(data, crtc);
> +
>   	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
>   		igt_plane_set_fb(igt_crtc_get_plane_type(crtc, DRM_PLANE_TYPE_PRIMARY),
>   				 &data->gray_fb);
> @@ -475,6 +515,8 @@ static void coverage_7efc(data_t *data, igt_crtc_t *crtc, igt_plane_t *plane)
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc = {}, crc = {};
>   
> +	skip_if_alpha_swap_not_exact(data, crtc);
> +
>   	igt_require(igt_plane_try_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage"));
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	igt_pipe_crc_start(data->pipe_crc);
> @@ -539,6 +581,8 @@ static void run_test_on_crtc_planes(data_t *data, igt_crtc_t *crtc,
>   	int first_plane = -1;
>   	int last_plane = -1;
>   
> +	data->output = output;
> +
>   	for_each_plane_on_crtc(crtc, plane) {
>   		if (!igt_plane_has_prop(plane, IGT_PLANE_ALPHA))
>   			continue;
