Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79353C54764
	for <igt-dev@archiver.kernel.org>; Tue, 20 Feb 2024 22:32:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C262A10E19B;
	Tue, 20 Feb 2024 22:32:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0a5t7sWV";
	dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FA510E19B
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2024 22:32:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGHVmmdcxOL9pPXsy/pGwvW8xiy0Kz4RsXKKV8db/sFTWQMqYKOw1PjM3/iT9iOWdy2Ont7i8zYKGpM0uEmN0qUpwhZCSndfSwTnHvuUFTM8S/CXm0RPreN5Qn2XEt1uhsGYcxowybbEE+Q7jY5HOF7Q16mvD0ShLIbFkjP9Aamm8XMio2lyTVQKls8H1ScUwPwhz8kdumfSF3acdbXXoHfmkWw+lmq70D44+yiHw9VK/osennm9TyBbT3dTUpkGbCWCbv9twJehtTxP85XqGMNY8rZl0K08Zu+2zZSGDv3+jZ5JCh4CC1Qd/kI7NuO5ib0l/DugLNBkojU3TveTwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b98Hv68vIbnVsqDfEGDV35gGPgEoP6ryDiBw+U0qTj4=;
 b=XV4wGRDCkB1Agw/fAhSxt0VPmbXeZPfkLWzYYzKkv9jzi8PcKYeZTPTbE6CAeXuOhXhUCPfScNCercNBrH55JsUaIQEw9UvlvIGXGeio46xe8DioacyDX/unKGcDGfRUMJuixWsRwdQi871zYlwJAjzE9mzf4yzqH7FFsddEtyXhhyGHj5ia367p+lZRxjpyXQxGJ8kLagTck2wWpn+JWPEsalfk+J6+m7sATGe7rhqU3u6f67no7T7q4f2WhqbZpJtC1BsY/Y+FlYfFBZLbRNSRLVi5ttqP6Ex6hq4Di8KU/kXkZht82wqle1KvkrdpwaUAM6no6+sXgzi8AA4uXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b98Hv68vIbnVsqDfEGDV35gGPgEoP6ryDiBw+U0qTj4=;
 b=0a5t7sWV7VXn3UNR1HlTkPhwLnxcEfcmy6SPidDC2fsc3stL/xzwU3gKcOH3hpsAk5STjrSJP8U2pJHBX1tNVBCMYPHtjlKmMiFMpTP52FOg/3taOPjPsa/xk3BLSIN94cV95z8MQPADDtUBpOTWhLjWTF2OBtLm8D5oGtgZcuY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA3PR12MB8802.namprd12.prod.outlook.com (2603:10b6:806:314::18)
 by SJ2PR12MB7941.namprd12.prod.outlook.com (2603:10b6:a03:4d3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Tue, 20 Feb
 2024 22:32:43 +0000
Received: from SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::e068:fefe:34e9:97b9]) by SA3PR12MB8802.namprd12.prod.outlook.com
 ([fe80::e068:fefe:34e9:97b9%7]) with mapi id 15.20.7316.018; Tue, 20 Feb 2024
 22:32:43 +0000
Message-ID: <d966c4be-81c5-4e22-b8e3-54086f8ede5a@amd.com>
Date: Tue, 20 Feb 2024 15:32:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [i-g-t] tests/amdgpu/amd_bypass: Fix psr edp rx crc read
 timeout
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, hamza.mahfooz@amd.com,
 wayne.lin@amd.com
Cc: markyacoub@google.com
References: <20240220191554.111722-1-hersenxs.wu@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20240220191554.111722-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4P288CA0084.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::18) To SA3PR12MB8802.namprd12.prod.outlook.com
 (2603:10b6:806:314::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR12MB8802:EE_|SJ2PR12MB7941:EE_
X-MS-Office365-Filtering-Correlation-Id: fa00dc39-6927-4306-0f8e-08dc3263da68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/GzkePhlBs1iidkp9ttmneLSSs0eUrKsSXxK0izS/8FtHbkrVcweGcJgK0vEUi28XT00XprAa9So/D6HmfsPneH4813avDjuwH2nz17RbgdV5pemrfj/w607ze+wsNnV1HibhGWGyhzYpGukSOgNeRTPucAEh+YfWjtHq5g07b25p7rUcUpD+SoiVuBO41Hbb6aYT4Tn5SdmR8i3bffve5om3Ban0BtNBaclRmobzeAf1ck3nYtCzjV7bAzJxKQzqombHF8wpQpBhqXMbBFtM5NRwU2akgXgcwSHHcTVl5tWKRgUx4GcbXK7Yhubtuv4vyA4JRgcIUyB/Hfq2saMdOFK2IZgmvTPBaveNscP6n+FpLRiro/XzXn7Ho5REc21jAwYrNV8g3FHU5bG3/ooA9z7zMtRcqxVycI23TAD6t6OV8YpWsYTuIylnqf8QNPBAdVgmxIvqzJCUhY6kgiuw+6gvXuMK2Kt4UVi/9oI/sZyKQvJnjt1qSrIBX677xmoJnaH6D+cJZO8NYnK5dMWrC9/WZUu3cGajixr0g+paQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR12MB8802.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cytScUVOT25xTTF0U2pGNVBGWjJZT01SL2JOcGVwNG9KMUpoeGUzcnBlQWdI?=
 =?utf-8?B?K3lwMmpwbEcyYWZWV1RVZW9ZZkNHYWZIMWpidHg2ZnN4bFlDdUVvSW8ya0Rh?=
 =?utf-8?B?TzgxVzJEcTI0SHkrM2tQZC9zbEg2emI5Ny8wOGpYZUxIQVlCOUhWaWM4MXRK?=
 =?utf-8?B?SlJ1TEF5WVBKMzg1a2pxMndFVzNvaTNuaUY5ZmpUMlVFblArSFBWTnNFOWdo?=
 =?utf-8?B?MHdhN1FvQ1h3VU1XM3dGM25qWG1SK0NyVXZmTjUrc2V1SSs1dUIxdEJUTWZL?=
 =?utf-8?B?WFJNTFJHYi9JS0ZqWVpWclAxdTMvZjRlQ2ZvNWdTOURwbzh5TG12d1BUT1lN?=
 =?utf-8?B?a29KRlpqeWhQZ0VsTHRUbW9Gem85T01MWS9iV0ZBYUgxSDZzTjRScVdNc2tZ?=
 =?utf-8?B?N0h3eUVlaytrSUhtY2VnRU9SRUdqZ2RxTzY1S2QxZ2U4SlB4NzRDOG9tdEdw?=
 =?utf-8?B?K2V5Mkw0SFpmeVVCSXQ4UHhaSm1oZXFVd09VL2pJazMxdVh1bnRabDkrUWI3?=
 =?utf-8?B?ZisyUGg2cmxZTGxXbWc5bDc5YkdDMW5id3JkcVZFWktoZ2E3a3NVWXJYMHpj?=
 =?utf-8?B?VlNnSEQ1RDNtenU1Vmp2ZVU5SnBEakdXdXZobTMraTJBZ2pyY2F3K2pMWER0?=
 =?utf-8?B?NVN4bVM4RVVnbVh4dXBsVlRPNW5hRDVvbTFMdlV3NDd6TEdkaG1iVk5XK3JI?=
 =?utf-8?B?c1FKZi9DREY2SiszeVl5OUdVV3FKaVliK1VJOEZaYm5BS3JOYTcyWUw4aDdN?=
 =?utf-8?B?cmo0ZUFXZzR3a05LNTVPS1JRTXZjeFY1eExyWmJNdFgyd1h1cENUSis4VEcy?=
 =?utf-8?B?Z3d0NkRjOTB0RjlVbEp2QWt1SHN1Y3BWamU0SmdQanltbVM5U3lPZVEvejRz?=
 =?utf-8?B?ekRMa2tNSWI3VVlaZllIVEQvSnZtTHJTUCsyWHl0ajhVTlZVZlc4MkFjbFho?=
 =?utf-8?B?K3FJOWJweTNNQndrcjJic1V0dlh5dDZob3hpQjJSeWgzT3I0T0VTL1RQY0ti?=
 =?utf-8?B?OThiOFk3cFk4cnphN0dObS9UaTUrZGJpNHpWaStrTTRmUTN1VFdVeUNZR1Rn?=
 =?utf-8?B?eDBWQU1LeDNRSlMyQ2VpUHRpNndEK29kR0tDMkd3WUlkclZGVG9CeFo1VS9C?=
 =?utf-8?B?RVV4cWdLanVHVkhtdlJ0TEl4eVoxTnVwdUJFdW9UK3pLcXRJcjEwdmVIY0pC?=
 =?utf-8?B?bTNXaVpxalpUMWZNeERaeGRVbzlnYnNKQllzSmZ4Wk5Gc1VQY3JORzZlekd3?=
 =?utf-8?B?MGk3cDBQY2o3ZEk0Z0IwL0NXTWxibTVBa2Q5bEc0VXFJcmJsY2lwQ1A2RnVp?=
 =?utf-8?B?c2hRL1FnTTdobCs1QU42ZWxidmpYb1lmMEl1czRpd0pLZ3JlUW5HRkllL2xr?=
 =?utf-8?B?RTVSdDN6NjNMZlVBNVJOTnYxUytkNTBydnBVQTR0Z0xDNDhFcGJyajVYdGVS?=
 =?utf-8?B?cGtjaE15V1Nkc1o2U1dTWGU5U016TTZmWWkwTXdVdE5tNzFOWDhNaEhUWEhj?=
 =?utf-8?B?L245Z1ZxOHQrVlZDS0lGdGtuSWthMDhGMjlVVTJPWlpoZGVwRTJ0dElmekZm?=
 =?utf-8?B?ZXNpVDVIWG5tWVVUcG92MWMzbFhtWDFTa1VySmxob09KWTFHd21XUUF5Y3FN?=
 =?utf-8?B?dUgxbnBHbnJMckFlaysySW5mVDNxTG5HSUVVR0RWZ0lxV2NQclFNTUVBNytX?=
 =?utf-8?B?YmwvNGFlMWFPTWxIR1hGRXNMbGNkcXdFMjkwQ1BKQ2JqVFdGSUJpcENuM1hV?=
 =?utf-8?B?Zm54ckJSSzJWbk5mOE45Z0NjYnJYN0R5aWo5cFQrT3VaU2JIdVFxY1FlQXE2?=
 =?utf-8?B?NlJ2NUNhY1BJdnRmYVM2TWJlbDhGS3lJSGsvOGh1ZW5lSFBzUjBxditTb0Fj?=
 =?utf-8?B?VzBnK3d0elJTckZ6dWMwRzhHZVpjcjA2RU1qbE1kTURjNXhyS0txV3QwQzhL?=
 =?utf-8?B?dFNJYVFHR3pSUU9sbDQzdjF1NmhwSkE2eUU4NDNwdE50RWVpaS9ZQ0ZPVHNI?=
 =?utf-8?B?MU52VnJnRG9hTVdJWHRmbDRrd05VWGR1M25uT29vRWJWZFdjZUZSSkxDTDNn?=
 =?utf-8?B?eUl5azdTL1JCdzRXdW5RbUo0WkpMU01QcEFIeXNFU2tnZ2tkSUMxM0hpNEw5?=
 =?utf-8?Q?cr8fjSZumohFm8lCmX8jzeQt7?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa00dc39-6927-4306-0f8e-08dc3263da68
X-MS-Exchange-CrossTenant-AuthSource: SA3PR12MB8802.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2024 22:32:42.9306 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yq/eFny+FBfAh05YdEkdBgDxwIpP3V/7Pjy+jbw1bgtCK9AGn/b0Em/2lLBFO1OjT1LCI+b3IKi3hdg/0aOWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7941
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

On 2024-02-20 12:15, Hersen Wu wrote:
> Disable edp psr before tx reading rx crc.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/amdgpu/amd_bypass.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/tests/amdgpu/amd_bypass.c b/tests/amdgpu/amd_bypass.c
> index d192a30ea..01946de24 100644
> --- a/tests/amdgpu/amd_bypass.c
> +++ b/tests/amdgpu/amd_bypass.c
> @@ -72,6 +72,17 @@ static void test_init(data_t *data)
>   	data->output = igt_get_single_output_for_pipe(display, data->pipe_id);
>   	igt_assert(data->output);
>   
> +	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +		kmstest_set_connector_dpms(data->output->display->drm_fd,
> +			data->output->config.connector, DRM_MODE_DPMS_OFF);
> +
> +		/* Disable PSR before reading eDP Rx CRC to avoid timeout */
> +		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, true);
> +
> +		kmstest_set_connector_dpms(data->output->display->drm_fd,
> +			data->output->config.connector, DRM_MODE_DPMS_ON);
> +	}
> +
>   	data->mode = igt_output_get_mode(data->output);
>   	igt_assert(data->mode);
>   
> @@ -367,9 +378,23 @@ static void bypass_8bpc_test(data_t *data)
>   		igt_assert_crc_equal(&data->crc_fb, &data->crc_dprx);
>   	}
>   
> +	/* igt_pipe_crc_stop is called within igt_pipe_crc_collect_crc,
> +	 * but kernel drm_dp_aux_crc_work is not flushed out. Create
> +	 * and commit of new fb let kernel stop dp aux crc work.
> +	 */
> +	igt_create_pattern_fb(data->drm_fd, data->width, data->height,
> +			DRM_FORMAT_XRGB8888, 0, &fb);
> +	igt_plane_set_fb(data->primary, &fb);
> +	igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +
>   	igt_plane_set_fb(data->primary, NULL);
>   	test_fini(data);
>   	igt_remove_fb(data->drm_fd, &fb);
> +
> +	if (data->output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP) {
> +		/* Enable eDP PSR within kernel driver */
> +		igt_amd_disallow_edp_enter_psr(data->drm_fd, data->output->name, false);
> +	}
>   }
>   
>   igt_main
