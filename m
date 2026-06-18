Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F0CD98ED
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jun 2026 17:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45E810F388;
	Thu, 18 Jun 2026 17:45:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NE3Dfs0M";
	dkim-atps=neutral
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010057.outbound.protection.outlook.com
 [40.93.198.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E62F210F388
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jun 2026 17:45:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDrWDcnCoP7M9Z2sOWvFuF63fMZ6l9pVU4PqresuNsWOw7sYjOXrWysS46MxcyYDWxzEeQTdm1q5U+MRGSVg92yqDsGtGTgXtlOaVE87M0LvRdwKfArqJY8E38yNmdvx+Ca/UTUhO1d6gprQY/v+XL+191Z9Vvxj7q8taGgIUWDY0w75BRHolFDuDog0URE/aqhlSnwTNKVI+is8aPXtaTg+2kMv+xE2YOu9jtp5+1D24t8exbaj3QD3QQQPnOXxfCNOvLeGo/GAPaLMk9bQqVfaDws7NrugbN1ynef42shf143N5C/PF274kfOiKysODAcgRz4vH1Qa1Rjjik/M9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kjm5p+z7sKAT3qWcFz4YQkli3ozRBSgEWW+5sjru5Z4=;
 b=Ob1N2Hay9OMpsumMGHE5qEIhzsEYm7+qwHDSaxV8KJZ1qx7+WNCkyvqlRIfrzozJf7XJya5LDAFsfnZbgMhpgb4BWLA5EvmwjmBo3TvIZ5i6DFe8GqlH62RE0+TskuUOC73ZjMNl+PU1Nu8ZwHhoGyltySpl2nETeleYsnD1TJbrMQs3ypP03aANbR1jgjD8u7DfN5g5FOPCuh7yuSjr7cuAqUd1y/OM44rklYpI29te5oJ6pddgb05ma6MSPxsCM8HfWj59fQzYZgPX1FBG5thvu7x79IS3v0XrLjKviHkNjFzN/l5QQok9eP3U5lrwOVswDr7XRIEnWeqA4NNgkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kjm5p+z7sKAT3qWcFz4YQkli3ozRBSgEWW+5sjru5Z4=;
 b=NE3Dfs0M7KwFExVEJJyjtVsHmBrsxxrB8mOHYa4bAnpQ9mfZ9lGkmuIT47TfSOzt+ibcPKhz4h92nH/R+y6m/S1P2sJ81z4K/SC2PiyGyZAjNsjR1H2qDmxWkkBvQwpRojI72c03eubzCHcePMCsbMgwVv4sPlD0NEkABfHtCfc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH0PR12MB5606.namprd12.prod.outlook.com (2603:10b6:510:141::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Thu, 18 Jun
 2026 17:45:18 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0139.009; Thu, 18 Jun 2026
 17:45:18 +0000
Message-ID: <af7d07b0-5148-4e9d-be04-ab899de9e2ca@amd.com>
Date: Thu, 18 Jun 2026 11:45:15 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] tests/amdgpu: Add FRL Test Support
To: Fangzhi Zuo <Jerry.Zuo@amd.com>, igt-dev@lists.freedesktop.org,
 harry.wentland@amd.com, Christian.Koenig@amd.com
Cc: Fangzhi Zuo <jzuo@amd.com>, Mark Broadworth <Mark.Broadworth@amd.com>
References: <20260617192449.4166-1-Jerry.Zuo@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260617192449.4166-1-Jerry.Zuo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P223CA0003.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::8) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH0PR12MB5606:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a064e6d-41a2-4bb1-3567-08decd615ca9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|6133799003|22082099003|11063799006|3023799007|56012099006;
X-Microsoft-Antispam-Message-Info: 5N0e5DyiHqbX2IxStruotOMWlsEucER+5+Mt4VGAaDcEe3ghZcqVOJfxvsrmxrpeXSYpn3+7Yhb/XE44vkRXbKj5VZnZ31DGn2y6A5CTielFKjwjLW+SrDLw7OObXQVsPXXLFOOakZu7dBwOZuVmHR8JmHZYWNEfgpEiftOwp8CP8uyh18KctdxPyQbNL0/yRrslwrxipSpd5WHEexqYSnVsYK3vAAjTpxwphJzLgdHEXkFoNqZHnSEu8CxNOf06yUQMY3OoK9oqOADehGRD2t4+6ja+hKcbDK8JTiTEQSFkfbYmdBt9+w2rHJW3K4iR01meRs8vCg+vC4mgXCjXE84MNfQQOf8zFkIFBBKzyLPnKqYodELWWmKy+uzYwXh1yXmyPYNAAfYygIk+BwmePe+jTN9xEF26a/FQI6HQeHxO8+OE6yUIUr1nJ4O3Isrq3cHv7aAK71/yYfbEQGGlQLZ/TizmU/Tu4OnY3FirnjvoD1El0d9rjWh1uiYYFinnfLnSj6Y/i/41FigrVF/7/85Af1in0XHM1OP6f1g5VjWaNM7lakBumyOjePvzzzD8s187RCffqN/yGbkax3eJSoYEtarIGOeB4oUU/TuncVubo0fQw6ak87wieo65XvdFa2HG8MAwDZ45t7vFmmLDLk1qVgh8tJenGc7gum/zh51A6Chienk6v0RUxJgjXPTe
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(6133799003)(22082099003)(11063799006)(3023799007)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YzZ5TXJHWGtMSUFSazJvQlRIWXl4R3M2KzA5dnU3UXRiSVdpSVFqSXgwSU9W?=
 =?utf-8?B?UWF4VHFQeUlOSkJuUVJ2V1NrY1dmMDJZc0h0WDUzU3FlNWFza2JiNitUWnZH?=
 =?utf-8?B?MkVERG5nK3BPTU1ZVUNPWU9zbVVTaFFBTkF6R3FCblpZc1RjNEpGN0FQaG5x?=
 =?utf-8?B?aUwyMU9oWEVEbUJHSi96NFRBT0ZLOW9mVUpLK3FZc0gzdm1wZEZlR2VpTlNl?=
 =?utf-8?B?K3JReU9BbUxsaEQzTTM1VERMTy9kN3ZUQVpxMGRwcWZscDJwODJvc09mZ2Fp?=
 =?utf-8?B?OUhMU1Izc0t2a3d1djhmZEQzUnJNTGxNczAybjAvNXVaWWg3cTVsL2NTZ2xT?=
 =?utf-8?B?UkJUM2lqVFZIb0krV3hBTGpmSTdVWDNmYXVoZm1USGNhMkZONGkyQVNKSWNm?=
 =?utf-8?B?SGFZS1dObHRVY3hpaWpBRFFHR0hyNWNLUVRNQ1VQbWQyVVYrL3lrLzFmVU9x?=
 =?utf-8?B?Z1QxeW5VVVNpZ2Q3Z01JbWdyMDFmc0Q5Zmp6dzdTZFFUNnluZjJ1NzlQaVF3?=
 =?utf-8?B?NWREUHFWc090ajg2b0FkVXp2cEkrSUc1MXpRTEZpVmdaVzBkZGpIVlUydmFx?=
 =?utf-8?B?Yy9pcDY2ZGlGemN1VjBOSVprQVpaSmllWHJ6WWFoclBsYk4xVFNUL0U2cE9y?=
 =?utf-8?B?VVI0d3pnVmVmcC9BajBJeVRZeE9DeVBBZmlLdnR1cVRCSVNPcWIzVGZzcnpG?=
 =?utf-8?B?NUQxQnl3TE9uMGZJZjF3U2FFMU8wbWxoSjF2OWdlcHhMdDZXeEtMZ2RHUVdT?=
 =?utf-8?B?SEhUZ1pocDJGSktKa1loTVVmYStlZHdhZW9mSDM2M2tVbGU4NjhxMW1Dc3NT?=
 =?utf-8?B?M2xONkt2dTFHK1d2eHQ4OE1yTVViNnF6RVBNSFBic1BraDRvSFQrQzdmVGtr?=
 =?utf-8?B?SnZBakZKNWtFdG84bHZVSHJDZGZueEUxWU4xTmlxdmdpTDNJWWZ2U1loNGJZ?=
 =?utf-8?B?aU5uNGNST2xzZ0MxL2V3QldsaXV3MnhGN1NaVnYwR1VlOFM4dFdsZ1hTWm5B?=
 =?utf-8?B?VDZTUW5PNXdIT3BCNEJZdzBMM1VKQTFuZlFKZVE3SVl5cFdsZXBaRmt6VTh3?=
 =?utf-8?B?blErbVBiRHZZbnd2ZVZxY0RHTkFaV3ZNQmNaeDl2dFVoOVM0L3hLRk5RQzF3?=
 =?utf-8?B?aXZoZVZqRDhFOUdXSmVad1FoaHJUTkZCbU12anZCdHFEaGNVRlBpV1NvUXF4?=
 =?utf-8?B?WnhmaDhZNUd6UVFtYVorQlpic0ZVZUN4Mis1YmJ1NmxsWWZWREtpWWhwZlo5?=
 =?utf-8?B?R1JJM2tXckdCcmNRTXlRTTU1UmpGVStXNkIwejZjUDZYNUNObFBaS0JDKytm?=
 =?utf-8?B?bzRGWS9jNHl0bHdSYXdYWm5jS1J6cTV4UXkyZHR3SkhvZWNtd2hSeU9FMUNG?=
 =?utf-8?B?UG0ydnQ1TmVCVnVzVE9CSUV2OUQwTmRXcW1uVHJrNElIdlAvWkpRVFlwMXli?=
 =?utf-8?B?SDNJWFU5L0pFRUE3RlBaUDEwM1g1SjhRUElYYzc0aCtzTzNJZ3VNN1UxUXlK?=
 =?utf-8?B?Q0hJVlBDbU0rTUtyUzkwWks1RXcrOUdsUjBEVWlHNS8rbGFwSHJmTWRKbUdl?=
 =?utf-8?B?eWhFNTFFQUpaVzRnTWg3eVJmT2I2aEJGemtrT0ltbEliM1pBTzRBVFU1eEMz?=
 =?utf-8?B?ZDllb0NBR1NhMG1kL2JmZkVTV1VEUmw3RE42Qld0aGpyVGlGdkNTcmdxMXls?=
 =?utf-8?B?dEFLUWVjUktNVmdDc2FFb3FwaWJGRGlvcUhndVhYd1BuRzhlTWpkTTNTSEdi?=
 =?utf-8?B?RG82Y2YzQnpKR0tldmZhUVl5UjJtaHhGNytXTG1tTmJaYUZYaEUwZGxNdGZ0?=
 =?utf-8?B?QlpVc01CMTR0MkoxekNqeHBNbUVtZzlaaWFja1pkcGR0Z3hqS1cvV0Fiay9W?=
 =?utf-8?B?cFhGR2wyaktJREt5QUllWFlrV3dKYjJqOGt0L2dUVDdpak4zdFJSSlNjdzdK?=
 =?utf-8?B?WGVvTDlBN2F2bGF4MGtSdzkrM2MxOEEzVTE3S1NNS1lWeHQ0OHowdlNNbXM1?=
 =?utf-8?B?bWlsNTFzYXpXVFJaZ05HZHpRMWFZdzlROGlHMzBIYU5ocmpabDRzUzBCUVlO?=
 =?utf-8?B?NzVrK1RYTEZkL3pZWnNhRVpFWDRsb0FQbXZWS2ZKeG5CSXVEVjVOWXo1ZjNP?=
 =?utf-8?B?MGUzcTkrZjEvZDZXTmlEOVkvSm1MVFhFVEIyemplSmdmdzdqcW1XdE1mTWNU?=
 =?utf-8?B?N0hDWW9Ea3ZVeFhRb2s4eFV4Q0FCZ1RSU0FCRzlkMjZFVG5pMWgzMnphQlZa?=
 =?utf-8?B?N1VKVkZXNnFMblpYVXdkNVN1VVJGU2gxeCt2ZDFuTi9ERnNRaVVnbUlyZmJq?=
 =?utf-8?B?YUNIZTd1eEJxTFRGbVRYQjNvci9HQmdiVVBtRlYzTnJKZkFNRlRkUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a064e6d-41a2-4bb1-3567-08decd615ca9
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2026 17:45:18.5102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Goa84jR6jlIZg9jxKdTwyQbF7omFPzVLa+AUHranY7C/bgVMjW/cefqrF4xymnv+RqP5BVkF3ktR1E9sccj/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5606
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

The subject should be "tools/amd_hdmi_compliance: ..." as it touches 
files in tools/ directory

On 6/17/26 13:24, Fangzhi Zuo wrote:
> From: Fangzhi Zuo <jzuo@amd.com>
> 
> 1. Add 2.1 mode list.
> 2. Extend support of pixel format to RGB/444/422/420 and
>     color depth to 8/10/12 bpc.
> 
> Signed-off-by: Fangzhi Zuo <jzuo@amd.com>
> Tested-by: Mark Broadworth <Mark.Broadworth@amd.com>
> ---
>   tools/amd_hdmi_compliance.c | 437 +++++++++++++++++++++++++++++++++++-
>   1 file changed, 428 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index e0ef78d81..dc24430dd 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -100,6 +100,102 @@ static drmModeModeInfo test_modes[] = {
>   		50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
>   		0x40, "1920x1080",	/* VIC 31 */
>   	},
> +	[32] = { 74250,
> +		1920, 2558, 2602, 2750, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 32 */
> +	},
> +	[33] = { 74250,
> +		1920, 2448, 2492, 2640, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 33 */
> +	},
> +	[34] = { 74250,
> +		1920, 2008, 2052, 2200, 0,
> +		1080, 1084, 1089, 1125, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1920x1080",	/* VIC 34 */
> +	},
> +	[41] = { 148500,
> +		1280, 1720, 1760, 1980, 0,
> +		720, 725, 730, 750, 0,
> +		100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1280x720",	/* VIC 41 */
> +	},
> +	[42] = { 54000,
> +		720, 732, 796, 864, 0,
> +		576, 581, 586, 625, 0,
> +		100, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "720x576",	/* VIC 42 */
> +	},
> +	[43] = { 54000,
> +		720, 732, 796, 864, 0,
> +		576, 581, 586, 625, 0,
> +		100, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "720x576",	/* VIC 43 */
> +	},
> +	[47] = { 148500,
> +		1280, 1390, 1430, 1650, 0,
> +		720, 725, 730, 750, 0,
> +		120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1280x720",	/* VIC 47 */
> +	},
> +	[48] = { 54000,
> +		720, 736, 798, 858, 0,
> +		480, 489, 495, 525, 0,
> +		120, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "720x480",	/* VIC 48 */
> +	},
> +	[49] = { 54000,
> +		720, 736, 798, 858, 0,
> +		480, 489, 495, 525, 0,
> +		120, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "720x480",	/* VIC 49 */
> +	},
> +	[52] = { 108000,
> +		720, 732, 796, 864, 0,
> +		576, 581, 586, 625, 0,
> +		200, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "720x576",	/* VIC 52 */
> +	},
> +	[53] = { 108000,
> +		720, 732, 796, 864, 0,
> +		576, 581, 586, 625, 0,
> +		200, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "720x576",	/* VIC 53 */
> +	},
> +	[56] = { 108000,
> +		720, 736, 798, 858, 0,
> +		480, 489, 495, 525, 0,
> +		240, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_4_3,
> +		0x40, "720x480",	/* VIC 56 */
> +	},
> +	[57] = { 108000,
> +		720, 736, 798, 858, 0,
> +		480, 489, 495, 525, 0,
> +		240, DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "720x480",	/* VIC 57 */
> +	},
> +	[60] = { 59400,
> +		1280, 3040, 3080, 3300, 0,
> +		720, 725, 730, 750, 0,
> +		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1280x720",	/* VIC 60 */
> +	},
> +	[61] = { 74250,
> +		1280, 3700, 3740, 3960, 0,
> +		720, 725, 730, 750, 0,
> +		25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1280x720",	/* VIC 61 */
> +	},
> +	[62] = { 74250,
> +		1280, 3040, 3080, 3300, 0,
> +		720, 725, 730, 750, 0,
> +		30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		0x40, "1280x720",	/* VIC 62 */
> +	},
>   	[63] = { 297000,
>   		1920, 2008, 2052, 2200, 0,
>   		1080, 1084, 1089, 1125, 0,
> @@ -284,7 +380,7 @@ static drmModeModeInfo test_modes[] = {
>   		3840, 5116, 5204, 5500, 0,
>   		2160, 2168, 2178, 2250, 0,
>   		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> -		0x40, "4096x2160",	/* VIC 93 */
> +		0x40, "3840x2160",	/* VIC 93 */
>   	},
>   	[94] = { 297000,
>   		3840, 4896, 4984, 5280, 0,
> @@ -344,7 +440,7 @@ static drmModeModeInfo test_modes[] = {
>   		  3840, 5116, 5204, 5500, 0,
>   		  2160, 2168, 2178, 2250, 0,
>   		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> -		  0x40, "4096x2160",	/* VIC 103 */
> +		  0x40, "3840x2160",	/* VIC 103 */
>   	},
>   	[104] = { 297000,
>   		  3840, 4896, 4984, 5280, 0,
> @@ -370,6 +466,288 @@ static drmModeModeInfo test_modes[] = {
>   		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
>   		  0x40, "3840x2160",	/* VIC 107 */
>   	},
> +	[108] = { 90000,
> +		  1280, 2240, 2280, 2500, 0,
> +		  720, 725, 730, 750, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "1280x720",	/* VIC 108 */
> +	},
> +	[109] = { 90000,
> +		  1280, 2240, 2280, 2500, 0,
> +		  720, 725, 730, 750, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "1280x720",	/* VIC 109 */
> +	},
> +	[110] = { 99000,
> +		  1680, 2490, 2530, 2750, 0,
> +		  720, 725, 730, 750, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "1680x720",	/* VIC 110 */
> +	},
> +	[111] = { 148500,
> +		  1920, 2558, 2602, 2750, 0,
> +		  1080, 1084, 1089, 1125, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "1920x1080",	/* VIC 111 */
> +	},
> +	[112] = { 148500,
> +		  1920, 2558, 2602, 2750, 0,
> +		  1080, 1084, 1089, 1125, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "1920x1080",	/* VIC 112 */
> +	},
> +	[113] = { 198000,
> +		  2560, 3558, 3602, 3750, 0,
> +		  1080, 1084, 1089, 1100, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "2560x1080",	/* VIC 113 */
> +	},
> +	 [114] = { 594000,
> +		  3840, 5116, 5204, 5500, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "3840x2160",	/* VIC 114 */
> +	},
> +	[115] = { 594000,
> +		  4096, 5116, 5204, 5500, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		  0x40, "4096x2160",	/* VIC 115 */
> +	},
> +	[116] = { 594000,
> +		  3840, 5116, 5204, 5500, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 116 */
> +	},
> +	[117] = { 1188000,
> +		  3840, 4896, 4984, 5280, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "3840x2160",	/* VIC 117 */
> +	},
> +	[118] = { 1188000,
> +		  3840, 4016, 4104, 4400, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "3840x2160",	/* VIC 118 */
> +	},
> +	[119] = { 1188000,
> +		  3840, 4896, 4984, 5280, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 119 */
> +	},
> +	[120] = { 1188000,
> +		  3840, 4016, 4104, 4400, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "3840x2160",	/* VIC 120 */
> +	},
> +	[121] = { 396000,
> +		  5120, 7116, 7204, 7500, 0,
> +		  2160, 2168, 2178, 2200, 0,
> +		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "5120x2160",	/* VIC 121 */
> +	},
> +	[122] = { 396000,
> +		  5120, 6816, 6904, 7200, 0,
> +		  2160, 2168, 2178, 2200, 0,
> +		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "5120x2160",	/* VIC 122 */
> +	},
> +	[123] = { 396000,
> +		  5120, 5784, 5872, 6000, 0,
> +		  2160, 2168, 2178, 2200, 0,
> +		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "5120x2160",	/* VIC 123 */
> +	},
> +	[124] = { 742500,
> +		  5120, 5866, 5954, 6250, 0,
> +		  2160, 2168, 2178, 2475, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "5120x2160",	/* VIC 124 */
> +	},
> +	[125] = { 742500,
> +		  5120, 6216, 6304, 6600, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "5120x2160",	/* VIC 125 */
> +	},
> +	[126] = { 742500,
> +		  5120, 5284, 5372, 5500, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "5120x2160",	/* VIC 126 */
> +	},
> +	[127] = { 1485000,
> +		  5120, 6216, 6304, 6600, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "5120x2160",	/* VIC 127 */
> +	},
> +	[193] = { 1485000,
> +		  5120, 5284, 5372, 5500, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "5120x2160",	/* VIC 193 */
> +	},
> +	[194] = { 1188000,
> +		  7680, 10232, 10408, 11000, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "7680x4320",	/* VIC 194 */
> +	},
> +	[195] = { 1188000,
> +		  7680, 10032, 10208, 10800, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "7680x4320",	/* VIC 195 */
> +	},
> +	[196] = { 1188000,
> +		  7680, 8232, 8408, 9000, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "7680x4320",	/* VIC 196 */
> +	},
> +	[197] = { 2376000,
> +		  7680, 10232, 10408, 11000, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "7680x4320",	/* VIC 197 */
> +	},
> +	[198] = { 2376000,
> +		  7680, 10032, 10208, 10800, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "7680x4320",	/* VIC 198 */
> +	},
> +	[199] = { 2376000,
> +		  7680, 8232, 8408, 9000, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "7680x4320",	/* VIC 199 */
> +	},
> +	[200] = { 4752000,
> +		  7680, 9792, 9968, 10560, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "7680x4320",	/* VIC 200 */
> +	},
> +	[201] = { 4752000,
> +		  7680, 8032, 8208, 8800, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> +		  0x40, "7680x4320",	/* VIC 201 */
> +	},
> +	[202] = { 1188000,
> +		  7680, 10232, 10408, 11000, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "7680x4320",	/* VIC 202 */
> +	},
> +	[203] = { 1188000,
> +		  7680, 10032, 10208, 10800, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "7680x4320",	/* VIC 203 */
> +	},
> +	[204] = { 1188000,
> +		  7680, 8232, 8408, 9000, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "7680x4320",	/* VIC 204 */
> +	},
> +	[205] = { 2376000,
> +		  7680, 10232, 10408, 11000, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "7680x4320",	/* VIC 205 */
> +	},
> +	[206] = { 2376000,
> +		  7680, 10032, 10208, 10800, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "7680x4320",	/* VIC 206 */
> +	},
> +	[207] = { 2376000,
> +		  7680, 8232, 8408, 9000, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "7680x4320",	/* VIC 207 */
> +	},
> +	[208] = { 4752000,
> +		  7680, 9792, 9968, 10560, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "7680x4320",	/* VIC 208 */
> +	},
> +	[209] = { 4752000,
> +		  7680, 8032, 8208, 8800, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "7680x4320",	/* VIC 209 */
> +	},
> +	[210] = { 1485000,
> +		  10240, 11732, 11908, 12500, 0,
> +		  4320, 4336, 4356, 4950, 0,
> +		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "10240x4320",	/* VIC 210 */
> +	},
> +	[211] = { 1485000,
> +		  10240, 12732, 12908, 13500, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  25, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "10240x4320",	/* VIC 211 */
> +	},
> +	[212] = { 1485000,
> +		  10240, 10528, 10704, 11000, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  30, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "10240x4320",	/* VIC 212 */
> +	},
> +	[213] = { 2970000,
> +		  10240, 11732, 11908, 12500, 0,
> +		  4320, 4336, 4356, 4950, 0,
> +		  48, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "10240x4320",	/* VIC 213 */
> +	},
> +	[214] = { 2970000,
> +		  10240, 12732, 12908, 13500, 0,
> +		  4320, 4336, 4356, 4400, 0,
> +		  50, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "10240x4320",	/* VIC 214 */
> +	},
> +	[215] = { 2970000,
> +		  10240, 10528, 10704, 11000, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  60, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "10240x4320",	/* VIC 215 */
> +	},
> +	[216] = { 5940000,
> +		  10240, 12432, 12608, 13200, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "10240x4320",	/* VIC 216 */
> +	},
> +	[217] = { 5940000,
> +		  10240, 10528, 10704, 11000, 0,
> +		  4320, 4336, 4356, 4500, 0,
> +		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> +		  0x40, "10240x4320",	/* VIC 217 */
> +	},
> +	[218] = { 1188000,
> +		  4096, 4896, 4984, 5280, 0,
> +		  2160, 2168, 2178, 2250, 0,
> +		  100, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		  0x40, "4096x2160",	/* VIC 218 */
> +	},
> +	[219] = { 1188000,
> +		  4096, 4184, 4272, 4400, 0,
Should it be 5120? It says 5120x2160 below
> +		  2160, 2168, 2178, 2250, 0,
> +		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		  0x40, "5120x2160",	/* VIC 219 */
> +	},
>   };
>   
>   static void signal_handler(int signo)
> @@ -460,21 +838,62 @@ static void set_force_yuv420(data_t *data, int force, int conn_id)
>   	test_fini(data);
>   }
>   
> +static void set_force_yuv_pixel_format(data_t *data, int yuv_pixel_format, int conn_id)
> +{
> +	int fd, res;
> +	const char *entry_name;
> +
> +	test_init(data, conn_id);
> +
> +	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
> +	igt_assert(fd >= 0);
> +
> +	igt_info("Setting %d on connector id %d\n",
> +			yuv_pixel_format, data->output->config.connector->connector_id);
> +
> +	switch (yuv_pixel_format) {
> +			case 2:
> +					entry_name = "force_yuv422_output";
> +					break;
> +			case 3:
> +					entry_name = "force_yuv444_output";
> +					break;
> +			case 4:
> +					entry_name = "force_yuv420_output";
> +					break;
> +			default:
> +					goto out;
> +	}

The above indentation is incorrect. You can use checkpatch.pl from linux 
kernel to check

> +
> +	igt_info("%s\n", entry_name);
> +	res = igt_sysfs_write(fd, entry_name, "1", 2);
> +	igt_info("res = %d\n", res);
> +	igt_require(res > 0);
> +
> +out:
> +	close(fd);
> +	test_fini(data);
> +}
> +
>   /* Set "max bpc" property of connector */
>   static void set_max_bpc(data_t *data, int max_bpc, int conn_id)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_fb_t afb;
> +	drmModeModeInfo *mode;
>   
>   	test_init(data, conn_id);
>   
> +	mode = igt_output_get_mode(data->output);

"mode" is not used anywhere below. Is it necessary?

> +
>   	igt_info("Setting max bpc to %d on connector id %d\n",
>   		 max_bpc, data->output->config.connector->connector_id);
> -	igt_create_fb(data->fd, 128, 128, DRM_FORMAT_XRGB8888, 0, &afb);
> +	igt_create_pattern_fb(data->fd, 1024, 1024, DRM_FORMAT_XRGB8888, 0, &afb);
>   	igt_plane_set_fb(data->primary, &afb);
>   	igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, max_bpc);
>   	igt_display_commit_atomic(display, DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
>   
> +	igt_remove_fb(data->fd, &afb);
>   	test_fini(data);
>   }
>   
> @@ -510,8 +929,8 @@ static void usage(const char *name)
>   	igt_info("-t vic	Select video mode based on VIC\n");
>   	igt_info("-v		Test on 'Virtual' connector as well, for debugging.\n");
>   	igt_info("-i conn_id	Use connector by ID\n");
> -	igt_info("-b max_bpc	Set \"max bpc\" connector property\n");
> -	igt_info("-y 0|1	Write 0 or 1 to connector's debugfs force_yuv420_output\n");
> +	igt_info("-b 8|10|12	8|10|12 bpc\n");
How about "-b 8|10|12	Set bpc to 8|10|12 bpc"?

> +	igt_info("-y 1|2|3|4	RGB|YUV422|YUV444|YUV420\n");
>   	igt_info("-e seconds    number of seconds to display test pattern and exit\n");
>   	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
>   }
> @@ -523,7 +942,7 @@ int main(int argc, char **argv)
>   	int vic = 0;
>   	int conn_id = 0;
>   	int max_bpc = 0;
> -	int force_yuv_420 = -1;
> +	int force_yuv_pixel_format = -1;
>   
>   	memset(&data, 0, sizeof(data));
>   
> @@ -542,7 +961,7 @@ int main(int argc, char **argv)
>   			max_bpc = atoi(optarg);
>   			break;
>   		case 'y':
> -			force_yuv_420 = atoi(optarg);
> +			force_yuv_pixel_format = atoi(optarg);
>   			break;
>   		case 'e':
>   			data.timeout_seconds = atoi(optarg);
> @@ -561,8 +980,8 @@ int main(int argc, char **argv)
>   	igt_require(data.display.is_atomic);
>   	igt_display_require_output(&data.display);
>   
> -	if (force_yuv_420 >= 0)
> -		set_force_yuv420(&data, force_yuv_420, conn_id);
set_force_yuv420 is no longer called. Should it be removed?
> +	if (force_yuv_pixel_format >= 2 && force_yuv_pixel_format <= 4)
Let's have enum or defines for 1~4 so they look informative.

Also, what aboutforce_yuv_pixel_format is 1, which is allowed by "-y".

> +		set_force_yuv_pixel_format(&data, force_yuv_pixel_format, conn_id);
>   
>   	if (max_bpc)
>   		set_max_bpc(&data, max_bpc, conn_id);

