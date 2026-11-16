Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18495606A32C
	for <igt-dev@archiver.kernel.org>; Mon, 16 Nov 2026 20:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=X44nDnPo
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0A6510F440;
	Mon, 16 Nov 2026 20:16:29 +0000 (UTC)
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012052.outbound.protection.outlook.com
 [40.107.200.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EB3110E3FA
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Nov 2026 20:15:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bNGRuxGvK8Gwv89a5A0bXeRQv4/g1NwqOb8HALMr6nb2B97TZx3oh1x8pVuPKTj66oh13KD2TnKlzyvcx0vFTISuo28iqyEvBGQ3XPDSXRgflrLtS/rXCZxz1okfY9PpPPl1CcnW+Lws00vnN05GU71sBMTFzPNU/4EuqrrFJjIPM4FrzNqbvxRawWPW7b5UVxr9wKKD4yFauLWGrr6ke2Ttk99PxonqDIFCUTCYdc8P5IQ0F6J1AeHtGNfKDFApxYlx6WfmN9GHapt1EqJSc1ufFDHDlzOHk209RJpV8IgnZpF5gEeNV6tshWp9rZPjVuvMcpSueOXJZXP/D8ffsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXu4mIbBJwvHcovi9Y1CMne7vXopzeknwwpsVG0V3R0=;
 b=jh32pF2Vg4p5GI9aU/zj6L/Y3k36SvwEVTn4L/JYtPUNn2EGnDrK8rVPU0Y/vRChVpHPlkQ4V+QhpJePbtZrODDu4fLKLcOW54El3OlSiRzF1NTDLGtpUCB629V+5sKJGj3ZPKjpFQ3mCykiaY/CKJ4u7BSRH3sQhUxHd/T3UVWIyQGRP3E1lg6DfC+UIZTKkNEuULdhHZQc5Z06FrotYC6egsuS5lJiXc5MI2wMQ7md7ogtb2sH/CbuXoyxdwWroy0+6nD0E9UfwhbIa5MbK8QS+yRx4+OkZDqC+Jti2gPvQsqTNT/zHGBSyr0CktRdmE2JfBaUq5tuUOPGlpoYYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXu4mIbBJwvHcovi9Y1CMne7vXopzeknwwpsVG0V3R0=;
 b=X44nDnPoMu/f0m6afCyzfMkzV++K9cfBiHx/UI2NXRWnzBKwd6JJ2T5cAAoYPiXdYoEuVNl4uBwTin9kX28qClYe91BFJw6BWltphyWmrHPy5jZv1ufY6XARuznXL+TlwS+cqkLKUia0qd9NiMTDMAZ2DmoGNuouhG8BogLgwpc=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA6PR12MB893085.namprd12.prod.outlook.com
 (2603:10b6:208:601::18) by SA1PR12MB6872.namprd12.prod.outlook.com
 (2603:10b6:806:24c::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 20:14:23 +0000
Received: from IA6PR12MB893085.namprd12.prod.outlook.com
 ([fe80::3f4e:1f38:3db2:270a]) by IA6PR12MB893085.namprd12.prod.outlook.com
 ([fe80::3f4e:1f38:3db2:270a%5]) with mapi id 15.21.0615.013; Mon, 16 Nov 2026
 20:14:21 +0000
Message-ID: <5eca7dd0-a2c2-43bc-a25a-229df367bfb1@amd.com>
Date: Mon, 16 Nov 2026 15:14:20 -0500
User-Agent: Mozilla Thunderbird
From: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [PATCH 3/3] tests/kms_colorop: check writeback formats first
To: Alex Hung <alex.hung@amd.com>
Cc: igt-dev@lists.freedesktop.org, Haoming.Qi@amd.com
References: <20261114020614.830491-1-alex.hung@amd.com>
 <20261114020614.830491-4-alex.hung@amd.com>
Content-Language: en-US
In-Reply-To: <20261114020614.830491-4-alex.hung@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBP288CA0032.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9d::17) To IA6PR12MB893085.namprd12.prod.outlook.com
 (2603:10b6:208:601::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA6PR12MB893085:EE_|SA1PR12MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 67417d50-fc4e-46b8-488d-08df441e3396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|11063799006|4143699003|56012099006|261021121427099003|261026140227099003|261021123027099003|261026121527099003|261022105027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: oSktGUy/C4wER/briP2JZc5C/CFIeKqBrNPxKac+Yg6ejCFw6b2RTdiDiVRDHyENeTMZof3+ucN8zMigRButmReFIl72co2ZF0A7FwuiAcAbEX1aqKqPGe7oPYPeY76O44BUIY71Aof9fA4nSJ+ZkaczxdPm87CezoM/kWRgRRJYxO6jp8TozzynbhDxkkka9FqHg+hGw04ndcMgLXr8yZJyjwMp7vYKLmCB74PGLcDZe/iTQWDwLFnTGm/L6YaeB9KGsal0r9eLkFc6igs+P5/Ux2DGgiLvMBEe11K9zQNGooK9yZv0wsPhvWZehdr1g0FqBopjJkYvnmv9BvdkcjfbOX/WLrK6fRtgPungVMLYKac3h9vX+dYihHbY3/M2jBRBM+/LdjCnAtPtAWdwTL0kns6JHe2Vd5FeHAYhdgk0rITgrG1jYfTHN+JnAFCuFEdeguOYeVLZ/Mgv5ZjMs1N7VGDnPDREKTaOJiqFacljZXtVUeT9Xyxmprgd23W7QqF2fRZxp2YBF0otHo/7/omq4YVa1cpaiUSAGWEzi8hfgzCB5fyzKdj0W6XKkTpX3bcC3A1AiTTYf3RKibkS/33K6GVklRVCGpM4bmAix+dTvmGmmCle5cgui2DXfaEEPOLkypqJMF5eLnaSiWzVEjxjZNqA0aQhDM8XPjSV7j8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA6PR12MB893085.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(11063799006)(4143699003)(56012099006)(261021121427099003)(261026140227099003)(261021123027099003)(261026121527099003)(261022105027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkhTWFdNVmM4VGI0QVY5NWpSK0RtSkRVZWNhL2Z4UVozYXZoSUhiTWJXVEx3?=
 =?utf-8?B?ZFJVZE5BOHh6bWlqRVdYc3NURFJ6RTdXVEVpWjQ5SHpwc1JlOUF1TEtlVVFV?=
 =?utf-8?B?SGdMTEZTOCs3bG5sdnlIU3pJbkhzKzN2RWcrM3hwdHMzNGNwSWxLZ3BBUytz?=
 =?utf-8?B?RHJoVFpIb3FvQmRCQlRYa1VxNVdnVVZ1cXJ5MDhCUUMxaTdyUWphZlFueE9y?=
 =?utf-8?B?emErVi9CNmxsWHBaUkVwZk04TGs2MmR5UVl2eVkzbmVGZlRpbytndDV1K0tM?=
 =?utf-8?B?RDg5WXFGdzkxS01NWG45WmN2YUxUendCcHp5VnFXTWhlNnUzbTdKeXkzUWE3?=
 =?utf-8?B?UXZWaGJDMzVuTDRxY3JySnh5d0NKVUpFREVndFFpQjZJank4RS9hZGJzenlR?=
 =?utf-8?B?cVYzWU5OTUlsaUJmeTJ0UjNRL1JnS3lndndUOGFieXViRFI0bHNrVGpCUC9K?=
 =?utf-8?B?UGpwRnhTQks5T2pKQXBKTHAxd2F4Q3NIdDNPOW9PRzU4UGE0NG9GemtZeUl2?=
 =?utf-8?B?Y3kxT1RybFZ1a0Nndjd3alpQNjVVdDZvM1BIN0pHUTA4aDVBQnBTeGNtbHlQ?=
 =?utf-8?B?b2xJQW9QL1FTa0t6QkVFa1RQSTlPMTBEd0c4ZHRacU9MQ05FNk5YMm5Ubmht?=
 =?utf-8?B?WitSYjBVL2tEYnZlZ3d2MlJ0bUdMUEd5TGlnVXhva3JJaGliS3NvNC8vYWxQ?=
 =?utf-8?B?aEtHVjh0d08yb0MwU1VqbnFMc0UwbStld3hBbDF2YTYrVDZhN1BHK3lpVEdi?=
 =?utf-8?B?VlAyaU5YWnVxWkZtc2VEYmR4NFZXSmF6d0czSjZmZWxrYzY0eFhqWVp3bTk1?=
 =?utf-8?B?KzROOWdQK3JFM1owZVFBRExpYXErQnJtbmViek5BTklyaXh6UkNpOGNZd25N?=
 =?utf-8?B?OERmTHM2YXZ3Rm04aExTU2huaEk2S25qYUVIeTlSaEV3dXIzZWV1UWh2bGNZ?=
 =?utf-8?B?Ym9ic3dHNGlLTWt3OVNXS3o2SjQ5MTU0cnZwdDQyUi9wUXdTL2cwRFZ4a2hu?=
 =?utf-8?B?YVJ4bE1pMUs4L3NueFF3NkNDclo4K1ViaVphMzJWZ0NPcjRyMk5QQ1Q1V2RB?=
 =?utf-8?B?QnFKNEQvcG1UaTdSZDBwanJFb2c4WGlpOUIzaHF3NGt4Zm94eHJnL1RrSzNm?=
 =?utf-8?B?VkxnbW52VGxPYk1mT2x4WWZVbEwyYWQ0NzMxWTFPcWJyK1pIZUh4N2VwMnEx?=
 =?utf-8?B?ait2OWMvWWxadGJUQVd5OUs5ZStQc3lvejlsLzV0eWtNRW1iKzVncGczRjFx?=
 =?utf-8?B?VFluTHpBZDNvaXc4V2hpMjhBYjZUdTJTUDJrNys2VThSZ24xYjRjMWlVVnVo?=
 =?utf-8?B?dlNNYXVKRDI1MFJmelBvOWI4VUplaWNjTHU1Ly94Uk0wVXRucTBEaUlweEpH?=
 =?utf-8?B?R1hZWmtvZE5xT0s2ZUdQcDBWL2Y3UGorTkUxOXZITlNKRVBVR3BnMCtYME95?=
 =?utf-8?B?M0ZVVnlKVnllcWo4aTB1NkpaQk05Snl2M3orbjRiL2xGMlBDYnJZWmVjRWpQ?=
 =?utf-8?B?MmM4MzZxQWNNZURCT0c5R3c3S2xBQks2UDdMREVkaGR0QkZoUGc3QVR2K25r?=
 =?utf-8?B?akxSYWFyY3F1dEI1Mktid1ZETHo1V1ZsN1R3MkFCcHV1YVpURm1aUEpwY0F4?=
 =?utf-8?B?U0F4OHV4ZGtHeEJxeGtEZmkvRTN0czlEQk5ySFJEODNSQ0U3dWMrRFh2OWQv?=
 =?utf-8?B?UnZkMDh3c1hCalJaVjBSeDVYRytmNnR2U1hwRXFIeUp6QStyd0o2UVRUYXRa?=
 =?utf-8?B?YTU1eFdvZG5aMENBd293M3V5UWxKNW5uVVdGZEtTSndqc0lLb0tJaG5jekpU?=
 =?utf-8?B?REk2ZTNFUFJtOUNTQXhiMWtzSlZBUERmb1hEOUxqTjg0MUNnMHBpbmZlZzAv?=
 =?utf-8?B?bnluc1YxMFBDeXhmbWpiZWNKWjdwemY1N1oxLytiT1hodEZ3Uys0N2Z4ekFF?=
 =?utf-8?B?NllZUHp1d3AwVmNGTXU5clJta3pZL0xMQTdjMmVnb0VPTTJ4OFRhbEI4TGw0?=
 =?utf-8?B?Mk9iYnMrVFFRVzV6RkNmdGZlaXVwVHVLR2I5ZWEzbGZrTUNpVjErL3hJQjR5?=
 =?utf-8?B?VUh6K3dtNXRkZHFsalc0MGZJbFdQdzFDRUNaTGtMUkdkZmRhV3NGSmtGbnZo?=
 =?utf-8?B?RjZESmRyem1qN0cveDRIMUtGRHZ5K3REUnAydTBzT05zbzhpTmZNdXBxb2p0?=
 =?utf-8?B?UE5tbkNBRHNZSllKZzFtV2dzMEUxSjBQWnVHM3VPeGtuWm5hTm9wTlJWK01m?=
 =?utf-8?B?UjZTUkhiQjk0c0c4OTlGZHJkRUhPd1EwaEQyMmVFWGNQVlp3enpEUzU0cUMw?=
 =?utf-8?B?RDdjalB5dWVRcTRvcktkc3BDSW51a0hwckJJdWErWDIxb3lOYnJjZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67417d50-fc4e-46b8-488d-08df441e3396
X-MS-Exchange-CrossTenant-AuthSource: IA6PR12MB893085.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 20:14:21.5809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /7WAh15/2u7uxu7/hVJvM7JhNQoI02I6kaGR3S0mFyrALo20Y1AOXakJajKcLVvBt8qibdF52jiX6BvGIQGtXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6872
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

On 11/13/26 21:06, Alex Hung wrote:
> check_writeback_config() creates an input framebuffer before checking
> the writeback connector's format list, then creates an output fb for a
> TEST_ONLY commit. kms_writeback_get_output() repeats this for every
> CRTC, so an unsupported format still costs one fb per CRTC.
>
> Check the per-connector format list before creating any fb, create the
> probe fbs once per connector and reuse them for each CRTC, and move on
> to the next CRTC when its primary plane lacks the input format instead
> of skipping. Also free the leaked format blob.
>
> Signed-off-by: Alex Hung <alex.hung@amd.com>
> ---
>  tests/kms_colorop.c | 65 ++++++++++++++++++++++++++-------------------
>  1 file changed, 38 insertions(+), 27 deletions(-)
>
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 284e08b1c..538fdbb21 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -122,12 +122,13 @@
>   *
>   */
>  
> -static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
> +static igt_crtc_t *check_writeback_config(igt_display_t *display, igt_output_t *output,
>  				    drmModeModeInfo override_mode, __u32 fourcc_in,
>  				    __u32 fourcc_out)
>  {
>  	igt_fb_t input_fb, output_fb;
>  	igt_plane_t *plane;
> +	igt_crtc_t *crtc, *found_crtc = NULL;
>  	uint32_t writeback_format = fourcc_out;
>  	uint64_t modifier = DRM_FORMAT_MOD_LINEAR;
>  	int width, height, ret;
> @@ -141,14 +142,6 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>  	width = override_mode.hdisplay;
>  	height = override_mode.vdisplay;
>  
> -	plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> -	igt_skip_on_f(!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR),
> -		      "plane doesn't support fourcc format %x\n", fourcc_in);
> -
> -	ret = igt_create_fb(display->drm_fd, width, height,
> -			    fourcc_in, modifier, &input_fb);
> -	igt_assert(ret >= 0);
> -
>  	/* check writeback formats */
>  	wb_formats_blob = igt_get_writeback_formats_blob(output);
>  	format = wb_formats_blob->data;
> @@ -157,23 +150,45 @@ static bool check_writeback_config(igt_display_t *display, igt_output_t *output,
>  		if (fourcc_out == format[i])
>  			found_format = true;
>  
> -	igt_skip_on_f(!found_format,
> -		      "writeback doesn't support fourcc format %x\n", fourcc_out);
> +	drmModeFreePropertyBlob(wb_formats_blob);
> +
> +	if (!found_format) {
> +		igt_debug("writeback doesn't support fourcc format %x\n", fourcc_out);
> +		return NULL;
> +	}
> +
> +	ret = igt_create_fb(display->drm_fd, width, height,
> +			    fourcc_in, modifier, &input_fb);
> +	igt_assert(ret >= 0);
>  
>  	ret = igt_create_fb(display->drm_fd, width, height,
>  			    writeback_format, modifier, &output_fb);
>  	igt_assert(ret >= 0);

igt_create_fb() treats an ADDFB2 failure as fatal, so a YUV group on an
RGB-only-device fails instead of skipping.

Instead create the FB's after the igt_plane_has_format_mod check and let
it skip on unsupported formats. And call igt_create_fb there only when
if (!input_fb.fb_id).

>  
> -	igt_plane_set_fb(plane, &input_fb);
> -	igt_output_set_writeback_fb(output, &output_fb);
> +	for_each_crtc(display, crtc) {
> +		igt_output_set_crtc(output, crtc);
> +
> +		plane = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +		if (!igt_plane_has_format_mod(plane, fourcc_in, DRM_FORMAT_MOD_LINEAR))
> +			continue;

The continue here leaves the crtc on the output. We should probably clear
crtc, writeback_fb, and writeback_out_fence_id.

Harry

> +
> +		igt_plane_set_fb(plane, &input_fb);
> +		igt_output_set_writeback_fb(output, &output_fb);
> +
> +		ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> +						    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +		igt_plane_set_fb(plane, NULL);
> +
> +		if (!ret) {
> +			found_crtc = crtc;
> +			break;
> +		}
> +	}
>  
> -	ret = igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TEST_ONLY |
> -					    DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> -	igt_plane_set_fb(plane, NULL);
>  	igt_remove_fb(display->drm_fd, &input_fb);
>  	igt_remove_fb(display->drm_fd, &output_fb);
>  
> -	return !ret;
> +	return found_crtc;
>  }
>  
>  typedef struct {
> @@ -208,16 +223,12 @@ static igt_output_t *kms_writeback_get_output(igt_display_t *display, __u32 four
>  		if (output->config.connector->connector_type != DRM_MODE_CONNECTOR_WRITEBACK)
>  			continue;
>  
> -		for_each_crtc(display, crtc) {
> -			igt_output_set_crtc(output,
> -					    crtc);
> -
> -			if (check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out)) {
> -				igt_debug("Using connector %u:%s on pipe %s\n",
> -					  output->config.connector->connector_id,
> -					  output->name, igt_crtc_name(crtc));
> -				return output;
> -			}
> +		crtc = check_writeback_config(display, output, override_mode, fourcc_in, fourcc_out);
> +		if (crtc) {
> +			igt_debug("Using connector %u:%s on pipe %s\n",
> +				  output->config.connector->connector_id,
> +				  output->name, igt_crtc_name(crtc));
> +			return output;
>  		}
>  
>  		igt_debug("We found %u:%s, but this test will not be able to use it.\n",

