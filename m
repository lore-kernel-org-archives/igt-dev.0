Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 581F2C61DD3
	for <igt-dev@archiver.kernel.org>; Tue,  1 Sep 2026 15:04:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4DB10E3CD;
	Tue,  1 Sep 2026 15:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KiMRGmG4";
	dkim-atps=neutral
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012026.outbound.protection.outlook.com
 [40.107.200.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6939C10E3CD
 for <igt-dev@lists.freedesktop.org>; Tue,  1 Sep 2026 15:03:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F2erZb1u/0NMaFD8w6ztLLyb1LOVG0shoRJaUt0lC4b/ULENkWg1zqH8o809E5Sou1KotFNow/vm6GHh68jiFoM27Wb+hwRXvOrnVwRMWoqtSQacvTXWdqoJY3OEs1CRDoZIVE+GarAA2cImYeVM7yOajCpVSZRseKDEKdb/vkiwPuuRSAvhgEu9oFB3pdVTNXBSJsaWUV5WDt2SIaO80djegZHiTeyBO8hzEHHzwt/FseXau2F7CMSPXpcKjko5C3TESDbxOLVtat44cLJHxZjPH6ZduRs/Wq+u6ufKFsvA8c2ODTjWVJF98FMPoozLJhpDrtS5r2Db+C+m5CC8mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJKzVo2yGfyzVcAAUUafA5kGpZ9m8L7rDKArwclbUXo=;
 b=yULyR7yie2zWMkVEySeKNCo3P356UcVtyQH3an9T2DJWRDfrK+N81G+EU3FsU7TVkNYgqauzUAoBQ3XysJ2UBpAKhevhUCpk0Ql2guZbsN6E1O0mmdUwycOnPHj/8xwDcazqARNcVkz0d4+xMyn0FjN2ZEXj/n1t/1RpoqKJPYUYsYMb4kosYK6yFTRXCZZtW8qQeHDZhLkQgyx1MYk/h32IPzHfqmLCxxBRwrHdZmSNEHr9ltxIWSvF6Qox5ueL8kcSqRrOMArDHFXTJlONQtzcdpD7/04xmBS0gfsrglAjcVQMNyFd6ohIZl6vnwLUJEDGJ8TRoaw+hmXR2PlZmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJKzVo2yGfyzVcAAUUafA5kGpZ9m8L7rDKArwclbUXo=;
 b=KiMRGmG4FqMJGFm/ffwyVGY+u8vpI8coDN7rBkrmnuZfx8NsU8wyGPVo1wc7u6DCStpcbbwVgVQ2YTxg72TWAkPxHJqxdopDCqLWNbYoGVC4jtiTosyT+7RPSl+hql8Y5iqqYx2MGm3XJZlFRKqp6mDkhz04+AXmjB7g6FmpZxg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 15:03:19 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%5]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 15:03:19 +0000
Message-ID: <cd87af6c-9e84-455b-b6e5-7d27595fa17c@amd.com>
Date: Tue, 1 Sep 2026 11:03:16 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tools: rename HDMI compliance utility
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com
References: <20260827185355.378279-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260827185355.378279-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT1PR01CA0114.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::23) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 92ef5904-ccbb-4cd4-18b1-08df083a2897
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|3023799007|56012099006|6133799003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: kexKRAHphhF+DZK3UEcMFrY4HQwbE/UqnFbZFp5IsNInQlEeMiAG8TnojNG1VbVm5rfWSHBFlDQX/qg1hpvUiRbGoZACouKx9KL7AEISgW4C58oe8UUR8lIFdCobt9d1V+dzSQx+AKBfWx2c+WG18fJFaLzEgjz8crGiqwK2bF2fvzZe0WGk+Nix7m1x2IAij3YiJXpu7RMEuHZPJC7QmO08mB4VEDdMZtwTPVWC6oPFvaRzTdjLYnXBywCcX8RfBhBqCKOMGYzasMuo3+WxyIcJC8jiY9F2P8Cc9Lxa139KxJOE5ihOXrFuldduA3KFOOdtfctnYITSOEq7ksbBtURFyG4RThW04ClOtLAfRY5lJqtkJHOGhzoknCvGdCGA85ooFe1r8klGUIeQHby/emr87pK4i7fTxi0SAywYc5SclAfqoAD1VNyfVh4KbfTR/7nHMnIAXrGu2WPMioMjL8bbOrGvaUkUv34Z/YirI+LMiNUovLMI40NPbA++MrEumZUGQ+Dt6ODJ4WNjGZoqZRB0gnAn+jV4DsQPPNqusoPo57MLXTaOboUmZ2OmU7/1IYuEYni8or+yYql5Nn2o4SpKtsQ/u8+f/qQ46n0dgIzNlSXTVsQV93o9R5Cl3Q5YJLELdAHMPo1rGtPSrSxutkIIfCUQhluKfGFstzEjy2U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(3023799007)(56012099006)(6133799003)(11063799006)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmZ1M3Jwd3dPMEllVWtvZ2xtTVRHMllaUTFlU2pRcWY1T2ZBRm00d21kdEJ5?=
 =?utf-8?B?VS9rN2I4dFhMa2F5NEU1TDM4QnM4Z0x3ZWwzYTZKT0lIT0xNZlNQYzRtRE03?=
 =?utf-8?B?U1pWcmcvcUlxeHpIYWxMa2xycGo3UklQK2tsemNGaVlmL1J1bzArTDJEOEMx?=
 =?utf-8?B?K1pYQnFHOURyWGJqUk1PTUQwMFlyZ29SalNRbno0VDcrWGpUZ1J6K01DTzNM?=
 =?utf-8?B?ZEdLN2t2QXZyaHdUQjZ2TU5pOTlPVkFxamJxUW81dHAvT3RTZzhuRlZOZDRC?=
 =?utf-8?B?M2lKc2ZZWFVKVDU2UUl4KzI0bTdrK3pLcStKRVduNU5DZll5RktFNVZDVUJp?=
 =?utf-8?B?Z2diNGh1aVBzajNKdlp4VTI3akFkVmtZa3ZqU0lObVozMXpDVUd6S3RNdG96?=
 =?utf-8?B?NDNQRHpPNWJGNFZJMVBnL1pyZ1Q4bXFNNEVESXcxbWpOdG9ScURFUm5VM1E3?=
 =?utf-8?B?OXdFd0EvUUFId1BEZUJNNkVzM1BvMFRyZm5tTVBoQzdBL3VIR0s4VkJCaHM0?=
 =?utf-8?B?Vm5FSE5pVHZNVE1NNjhETjVjcStYazIrbmVxRkN5c1JwZlA0S1NjNUprdks3?=
 =?utf-8?B?R2NxWm1zWW5BUjRzalZVMmh5L0xscVRYUmJtTzJxc2Jkbk1TR1dCeDNFQ3RQ?=
 =?utf-8?B?aVJyenY4RXFFSHAvMzd4N3lBUHlJMXFKRmw1Qm9uQlZhazJWRWFUa1FmVlRG?=
 =?utf-8?B?cVFtdTdWRzNPeXdzK1NRZy9UMVkyelZxRTVRU3d3QStSWXFUUzljR3BEQ2V3?=
 =?utf-8?B?ZXd5Z3NhVFBtL0ljeWw3ckN3eGx1OUZUZXFrS0VlckN4OHIwUSt3Ym53Rjli?=
 =?utf-8?B?YWVTaE5JUlgvOVQ4M3lDZHhIVkMxSitKaVZqUm1WOVZmWFJuT0FJZmRBQVVZ?=
 =?utf-8?B?NER1aXl0OEdWMm8zUlhHcWJ6alNEUkNubEM3MTRkam1XaWpSeCtyK2ZTSVBI?=
 =?utf-8?B?dUxFaGNXSDJUOFRCMDRvaGFyWUpodk9MWmJLeTdTS2hOTk1kUStQWkplSGR1?=
 =?utf-8?B?MElRL0RUZTdHemR5SDJSakovbmlmNTJwTVliOGsrUi9idXdQRUF3L0poSkNa?=
 =?utf-8?B?elJwQS91YlpZNXFiSWdQNnJESWptZjdEQVpkQURidVh2Z0d2K0Z1bWJ2cWE2?=
 =?utf-8?B?TEtXV0NZV1h2VzlvNk9BcGVtb096WmhmbXJqTmRZRGZGSmtxbmhvbnlJbUtB?=
 =?utf-8?B?d1o0QitScm9FNkNsUDhCLzlQWjJEMDdNaEljNE8rMS9oR2kvaTZra2pYMXRW?=
 =?utf-8?B?MEZHZHZ5NW1TMW9sdm9HZlBaYkNDcFdabjVJUjJkSDJiVHQwbFg5VFJLbmNt?=
 =?utf-8?B?alpoVVlScnFMREtsR0Z2Nkc4bUJoWVVUdHNyY0NmWmp2bG1lMW9vTWdVa1gz?=
 =?utf-8?B?bkwwTlZvc3U5UXkvdUpydFNsSEJ5Smg3R1ZaSFgxOTBBNVdZaFhGMHVvUndH?=
 =?utf-8?B?Q25lTDJZOGdlVS90dlk1SWxLL0hDV092NEhGdjBnVGg5ZGd6NnZITVpFR1hO?=
 =?utf-8?B?VW5SbjhBeVJ4aFA1bzQ4aktxSTlRaVI2KzNhUFB6a1I5MXFTZmZvZWFYSXdQ?=
 =?utf-8?B?SStrR1ZzOFNUcXBoMW1IOHpTQ0V1clRoRVA4Tmd3OTJWQy9tNXZYNFNNV2lX?=
 =?utf-8?B?ZjUyZmtmOHYrLyswdXQ1ZC8rQzdQSzRsL210SnE5ZDBRMmxnWUJwcUp6c1V5?=
 =?utf-8?B?R20xaVcrTi9rMlFKQi9HUDF6cFJkdVpINU8yRXdYc21NUnk1MnAwNU16bE50?=
 =?utf-8?B?WU0zSlByTXhjRXB5cXpRWVhxVWFvRXlhRVRyZVVtRGI5d0xvTDRTdDlma3FH?=
 =?utf-8?B?N0k4ZlYzOGJaYm4vVlF5T3E5MGNqRDhtdHJyQ1dnNlo2R09rUzM1NDgwWGx3?=
 =?utf-8?B?TXh5RFNFWVU5Si9HYlY3eGVCR2IrVGJyZmMrR09mZUgzVVpxelNCUFRtdzli?=
 =?utf-8?B?YVF1R2FUV1NiWE82cDNLMHZwajF0dFk3Q3dUemUzYlZWVkYwWnJ5TVlkU2Na?=
 =?utf-8?B?ajl5ZjY5V3loWFRoZXdDelRrOEE0WkhRRU85QnZXTWVSM2R2VWpqdU1MbFBq?=
 =?utf-8?B?ZnU5UmdVaDdiVWxLeEF0MkxXVHgrcWdOWlpJNkp5cFdjdmRITEdXQTZyRC9Z?=
 =?utf-8?B?WW54YWdaSkdIY3h3cjBYVTc0ZHRubFBnbzYvUmJXTEsyeVc3YXdJaWROVHVF?=
 =?utf-8?B?ZXNqV3BQMkZBeUlhcWNjeTFuNEZucFJQS2l5STljQnJJV2o2WE9UcTF2UHZP?=
 =?utf-8?B?dCsxS29FVmxyRmI5Y1VCT0Fxa2NyQzlqT3pKdWE2eXp3Y1FwYTRnWFdiRTNO?=
 =?utf-8?B?VFkvOEdqbm9CSkxSWUs3a3ppSE1YSFRQTWw2dFMvbENtM0hhWEVkUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92ef5904-ccbb-4cd4-18b1-08df083a2897
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 15:03:19.4564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jIljGQwERHjaESAstptARSTT4bbx2KWGPBMww0K/na83Dn74K2qrBZ9xVKcUCMgejiqw64VTD8vys/FRgVKPoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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



On 2026-08-27 14:53, Swati Sharma wrote:
> Rename the AMD-specific HDMI compliance utility to a generic
> igt_hdmi_compliance binary and update the build rule.
> 
> Keep the existing AMD debugfs flow for pixel-format forcing. Skip
> that operation on Intel devices until a driver-supported interface
> for selecting the pixel encoding is available.
> 
> Assisted-by: GitHub Copilot:Claude Opus 4.6
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
>  tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} | 9 ++++++---
>  tools/meson.build                                      | 2 +-
>  2 files changed, 7 insertions(+), 4 deletions(-)
>  rename tools/{amd_hdmi_compliance.c => igt_hdmi_compliance.c} (99%)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/igt_hdmi_compliance.c
> similarity index 99%
> rename from tools/amd_hdmi_compliance.c
> rename to tools/igt_hdmi_compliance.c
> index 2af4c0bab..ece0abd1d 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/igt_hdmi_compliance.c
> @@ -833,12 +833,15 @@ static void force_pixel_format(data_t *data, int pixel_format, int conn_id)
>  
>  	test_init(data, conn_id);
>  
> -	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> -	igt_assert(fd >= 0);
> -
>  	igt_info("Setting %d on connector id %d\n",
>  			pixel_format, data->output->config.connector->connector_id);
>  
> +	igt_skip_on_f(is_intel_device(data->fd),
> +			      "pixel-format forcing is not supported on Intel devices\n");
> +
> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +
>  	switch (pixel_format) {
>  	case 1:
>  		entry_name = "force_rgb_output";
> diff --git a/tools/meson.build b/tools/meson.build
> index fbc6c0a00..68c31da92 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -183,7 +183,7 @@ executable('intel_gpu_top', 'intel_gpu_top.c',
>  	   dependencies : [lib_igt_perf,lib_igt_device_scan,lib_igt_drm_clients,lib_igt_drm_fdinfo,
>  	                   lib_igt_drm_stub, lib_igt_tools_stub, math])
>  
> -executable('amd_hdmi_compliance', 'amd_hdmi_compliance.c',
> +executable('igt_hdmi_compliance', 'igt_hdmi_compliance.c',
>  	   dependencies : [tool_deps],
>  	   install_rpath : bindir_rpathdir,
>  	   install : true)

