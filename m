Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF81AC4452D
	for <igt-dev@archiver.kernel.org>; Wed, 22 Jul 2026 00:14:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA5710E2FB;
	Wed, 22 Jul 2026 00:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VLrXdhZx";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012035.outbound.protection.outlook.com [52.101.43.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B3BD10E2F8
 for <igt-dev@lists.freedesktop.org>; Wed, 22 Jul 2026 00:14:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LqTt4IU0hNZxs8JuS4OAEhzKm3tEql2hY0Dk2wzcWJhhXcdZUqo7dO2LeMC8D/0bPdrZfN5VW89kETwOCX6ZLZ6nDPjbnwBMLtJ6yS3T3STGopDR5zYOKFv+F7aRpO0Y4rwTX6S/CxLlsumPxnS495x+H0TvW2L0K6qqlrZnx18RbdPS92RH5JYHZBq4CAwuPSP+e+Pk/ag9YzCgEMBKiPnhNlqkfqCNkrY5xbi2YVMOnw6g8dIoPLbDqyYR2KMzu68ZGltF8xX+wEJeB76sCzPjUlkSu/08pQOY2slI6Q5+LWF62yZAZYG6JXdooZEWEwVYszhBoO+1KmAqcw6XAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c2la9XZ18XXTdG4ULoTqqmacUXlCVM9NuY5XUU32BLA=;
 b=zOxiMKCqod9TCNRr/TCFUc1gDTeYPZ1/PS6yLoCHNJ/0HMxqNetavBL7c7qsaSfpXjl81xliRWG8X7V+pVykkjgd7BekaPX9dFFG/BmK3GftUG3paWIEWV6VzaR772EfONDxmWFbtnuof9UAVoCmnF39aZln+oexJ4sUyICYjU/1ByZt6+zckVhEcni/bNIdBmmuIg6XxKFR57m9BeDuUjGzkAV03+1SSBHdxnaXLiW4V/4qRzwoVPLPnaKuNqGSmzsR1QUdUlMrQSyN9p297aqD19SkbZdJQpq62QTLDO8g/M6PMojPcx1fMJLWUgV/xHHGoLA0Iul9gUAt6++VNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2la9XZ18XXTdG4ULoTqqmacUXlCVM9NuY5XUU32BLA=;
 b=VLrXdhZxOp018ckYIvXQl06eAQjlsb3VwEAxOHOewSjewBeOT0WqcQvZwJ/B9b82Vv6SINc6J2ejisLqzJ8BPwJCAmaaWwaLHPIRsaRSv79EZ8jAGydR88OyYVRKld1Elsc2sV+W8a4B8nHXN0lQraqtN6dY1R0nikBqA/+f5M0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by PH7PR12MB6907.namprd12.prod.outlook.com (2603:10b6:510:1b9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Wed, 22 Jul
 2026 00:14:19 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0245.009; Wed, 22 Jul 2026
 00:14:19 +0000
Message-ID: <b03cc3f9-31f4-46fb-b66d-14e56f980b61@amd.com>
Date: Tue, 21 Jul 2026 18:14:17 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] tools/amd_hdmi_compliance: Add FRL Test Support
To: Fangzhi Zuo <jerry.zuo@amd.com>, igt-dev@lists.freedesktop.org
Cc: Fangzhi Zuo <jzuo@amd.com>, Mark Broadworth <Mark.Broadworth@amd.com>
References: <20260721195612.25545-1-jerry.zuo@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260721195612.25545-1-jerry.zuo@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DM6PR07CA0087.namprd07.prod.outlook.com
 (2603:10b6:5:337::20) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|PH7PR12MB6907:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e451851-2fd0-47e1-e2b2-08dee7862c3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|1800799024|366016|6133799003|3023799007|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: qrzP4A8B6cWzr2vj2CdOQziOMYya6VJCBQUEMohx+PfIHUifaGxx5G+gROfmC0+JXYHoRY/gqemO0R/KoZDG40S8zkGOCOEnABfiyjw4bTsslOngZOV/Ac4GX1eWuJLZIkll6MW1Xhk5ao8Oc2q2hI1MZf1S210wSQv2M+ONoWyCKhB9HZNnsYSuzRBsyixWMfOzL3Y/uqPA92gzVvL1LteJ2irXH+6+Kj00WgOwou5Du/ocWi21jewylokHZZ7ErSbdIcu5Rhdnz2LKutPpwdkfEcepUOpFFfUr2QwHcYuSBZziw9WIX8x1hPI8u4+aobnoS+/Z4gB0LHW4ZqIjeb+H6eGBsHB57Wf/p/xxPAssAiHK9yYv2Bn0nWNlxLgjXfp/I3Kbj/Al1EX8Q0aoAAZoX0UslJ+hn7GlcPsMlgFPyqpjhOtE3qOAB0bL6WcjKgxv7Ul1VPO+RBU6TBWDGvD4o9V+RpHHC2SE8TAahwzXY/SaMxFOKlQMlIj4IjDRYTAqNxME4QAxnHj3iClsfttguI5AmaVHFEkg5Ytue83zSOOX9dLk2y9j2hyskvVbs4FDe5k3xu/MjzqMPB9EQTTfkgdIOclTEY8OViGOiOnC8ssUHf4sE+NL5Dj3cRtyialSKiLfT35CrWLaVozAotZVAbGHGJTZzLW6/ncJEP4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(6133799003)(3023799007)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UFhpUC9PQk9iZ3NEM0RzR1BsZmxJb0t6eE01Z282NGFPL25pdm5FWEdma2tZ?=
 =?utf-8?B?ZGtMOVVTNHpmSUhRekd1V3IvUHJuaUtyL010bllhNzBHdVMxejNoWVVYbjBq?=
 =?utf-8?B?NnFKU3BJZW0zWHRPdDNNVkU3aVhOR3VxNTg0eHoxS0JaazQreXNxdzRLUEt2?=
 =?utf-8?B?SkZiU1hMUWJ6RDJEWEl3UDN4OVdCc05GK2IvQlA0azliUzRreHZGblJyOStr?=
 =?utf-8?B?OWZONWZROTF6eHVPLzZhQjFsTU1IY0hJVzRnK3Jtd0xuK09TRUFoN3gzT05G?=
 =?utf-8?B?cWUrVDB1ajk4WkhWRVpWNDN3bGFYTFN1dk1rRDZoMG1lMlM4L3V4VytCL0Ux?=
 =?utf-8?B?cnVQMzdoNXJmNnFNTms0Sll0ZHNHU0xyMzJISlI3NlI2NFFHTWhHNXREaEpH?=
 =?utf-8?B?K1RTM1p2VEhTMS93SlFybVdXYWRxZ3FjSE1RVnJNbE5ndml0TFc0NWgzbVU4?=
 =?utf-8?B?ZTAyVXRLbzRRQkhUb25EVDdwWHc1NmhPQjIyWTNBQjJ2UWU5Q3JwSHF2aG9K?=
 =?utf-8?B?VWVZWjE3dGdGYUp6cHJackUxM0RUcGF1TnE1TTJvUXZya29zZ1E3OFRmUFFs?=
 =?utf-8?B?R0NYblBxblFNTW55dTdwWHVUbk1PVXlPVG5LSzZoN2VKd3JSUk5qMTY1ZXht?=
 =?utf-8?B?Q3BVWTdpL2kzRTVWZVNvVlc0RkJCNFY0ZUJHTkpHUDFsOHhEaXJna1pVL2tn?=
 =?utf-8?B?S3RzZjAzb3c1bnBmMjJZQzlMQUxCeWVqNzNEVzFNbUhyRG9aTG1DeTUxMk1Z?=
 =?utf-8?B?VThFYTF5L0dmYi8zcE5nUHdFK2VkdEZ4UWY5U3pNSFhldHJCRmQ3ZVE1Vms2?=
 =?utf-8?B?RE5ST0lUc0wyV0RxdXc2VnpvVnU1V3VxbW1mSFZhdkVOWlg4ejhmU2RxcE5p?=
 =?utf-8?B?c1h6ekhmT2VYanl0Nm1pempJZkpVSEZ2R0hBN1A3R0puQ2VtdElxOGppTUJI?=
 =?utf-8?B?eDRDWlh0Q3k4aGNUS2I4dGNMMTdKSGVTZHNOaTIvajl1SmEyc0d0UTljcmcz?=
 =?utf-8?B?R056d2YrdCtFMmNBQmFJekhydExzUWpNeTNraUdha3JRTkNxbW80cHBRRW5h?=
 =?utf-8?B?eFVFVWJ5YkVaY0tLYkh1NzlGQVFKU2xuLzl2WHJkSmh0bVhpRCthTTJ5MGJy?=
 =?utf-8?B?N05mVzBwVElEUkk4RE1sb3RrRmdoNmJ0aE1HaHVYQnJLaWluOFpLVjJ6T0JK?=
 =?utf-8?B?bGNkSGlrQXV3YlgyQU5sK3B2N2FYWXFJRHNXQlFmbWxFNDUrckdpQ3djN3Nu?=
 =?utf-8?B?MVRnQXdESS84RFZhN3RmcmdzdjBJRU5PS29VaVA4NDdvYVM1NDZiWUZxSVFL?=
 =?utf-8?B?M3E5TnhDMm1uaFBzZTlCYVNoZGFsWmlaZDRIWkZxa21sVklEaUwrK1ZVSFcx?=
 =?utf-8?B?c0w5MEhUaHJlM3NIajdDVittZzlORFFRdzV3WExaYUsyanBVd3ROd2tpTDZz?=
 =?utf-8?B?ZnRUYmVrNC8zcnl3SGtpYVlkTW5DT0NNMWdsdlFFZnhuOFhLMVZKUHpoSmxl?=
 =?utf-8?B?MEtQMnN0US94QlNsU1JjRy9HVCtmRkVYanFwL1B5cFJHTGt6N1dlSE1LcENj?=
 =?utf-8?B?WE8wOVZnaTdqSmdKRnA0d3NXT1VmQkhRdVpMazZRSzJNZWZXZUhrZExIVHpP?=
 =?utf-8?B?c0dhUjFJbEQ4cmsxWkhKVjdYM0xOMGtuSkVmSEdFYnhncFFlT21jbXJFU0JT?=
 =?utf-8?B?elJFRFhVOXVtUHZXWEdLSGVndHBsazVLNTc0K2dwNSs1bUVaZUZ4QUsxZWY1?=
 =?utf-8?B?U0puOVZsR1JSNmZaME9NRkwwTlFMVjBmRmRRSTRSNEhMZVl4V25Hb01vMm5L?=
 =?utf-8?B?RGJiREJiaFdjcUxGamhWQzhuR0ZxYXNlTnBjRzN0TGFWM1ZhU2tWa3RyY1hY?=
 =?utf-8?B?Y0s5WHlTdkx3MXVrMDF1Uk5OUXpUNHkvalJ5cXkyb2dvRFRQSE9obnlzNFJW?=
 =?utf-8?B?NVVuT2xGYlVOQWJoVzNySG1Bakd4a29uMFExbUkvcW5JU0pZbXRMbGhKM1lz?=
 =?utf-8?B?SjlmSGY4eTV6bDJGbHJ3SEVvVUQ4T0ZSdGFMa3dnMWtlWkN6SGphVzdCb3dx?=
 =?utf-8?B?aUtaempKSW1IWkVha1FtcjA2VnVBSVc0VXNEN3lnZUU4Ni9KTnlOQTMxd3JF?=
 =?utf-8?B?UGt0TlJXaVBpS1ljYjdUR2xtR25HR0NJa2RHYlducFl0YzZoT0xCQlk1MTJ5?=
 =?utf-8?B?THU1Qm5pZ3pLakE4VlJkazJMK2NxQXFiZmdkVDNZRlJlVnNBVTdGMU5nVGcx?=
 =?utf-8?B?VW9LcUpKTmJ4T2x4RXpQTnN6aGJOcUlZQ21VbWtYcFRmQzFvYTFJQWNoK0xn?=
 =?utf-8?Q?UVBvpM3UKje4I/a6b8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e451851-2fd0-47e1-e2b2-08dee7862c3c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2026 00:14:19.0599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V41jHvj6Nro8pylRFYThOFVKzYQN4MI4d/Om5/Nap/oXtIEjJn5FoXh37YGDvanp20RsNI9BNByxbDtWQeoONA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6907
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

Other than nitpick below,

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 7/21/26 13:56, Fangzhi Zuo wrote:
> From: Fangzhi Zuo <jzuo@amd.com>
> 
> 1. Add 2.1 mode list.
> 2. Extend support of pixel format to RGB/444/422/420 and
>     color depth to 6/8/10/12/16 bpc.
> 
> Signed-off-by: Fangzhi Zuo <jzuo@amd.com>
> Tested-by: Mark Broadworth <Mark.Broadworth@amd.com>
> ---
>   tools/amd_hdmi_compliance.c | 438 ++++++++++++++++++++++++++++++++++--
>   1 file changed, 423 insertions(+), 15 deletions(-)
> 
> diff --git a/tools/amd_hdmi_compliance.c b/tools/amd_hdmi_compliance.c
> index e0ef78d81..a60176c0e 100644
> --- a/tools/amd_hdmi_compliance.c
> +++ b/tools/amd_hdmi_compliance.c
> @@ -38,6 +38,14 @@ typedef struct data {
>   	int timeout_seconds;
>   } data_t;
>   
> +enum dc_pixel_encoding {
> +		PIXEL_ENCODING_UNKNOWN = 0,
> +		PIXEL_ENCODING_RGB,
> +		PIXEL_ENCODING_YCBCR444,
> +		PIXEL_ENCODING_YCBCR422,
> +		PIXEL_ENCODING_YCBCR420,
> +};
> +
>   /* Video modes indexed by VIC */
>   static drmModeModeInfo test_modes[] = {
>   	[0] = { 25175,
> @@ -100,6 +108,102 @@ static drmModeModeInfo test_modes[] = {
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
> @@ -284,7 +388,7 @@ static drmModeModeInfo test_modes[] = {
>   		3840, 5116, 5204, 5500, 0,
>   		2160, 2168, 2178, 2250, 0,
>   		24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_16_9,
> -		0x40, "4096x2160",	/* VIC 93 */
> +		0x40, "3840x2160",	/* VIC 93 */
>   	},
>   	[94] = { 297000,
>   		3840, 4896, 4984, 5280, 0,
> @@ -344,7 +448,7 @@ static drmModeModeInfo test_modes[] = {
>   		  3840, 5116, 5204, 5500, 0,
>   		  2160, 2168, 2178, 2250, 0,
>   		  24, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_64_27,
> -		  0x40, "4096x2160",	/* VIC 103 */
> +		  0x40, "3840x2160",	/* VIC 103 */
>   	},
>   	[104] = { 297000,
>   		  3840, 4896, 4984, 5280, 0,
> @@ -370,6 +474,288 @@ static drmModeModeInfo test_modes[] = {
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
> +		  2160, 2168, 2178, 2250, 0,
> +		  120, DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC | DRM_MODE_FLAG_PIC_AR_256_135,
> +		  0x40, "4096x2160",	/* VIC 219 */
> +	},
>   };
>   
>   static void signal_handler(int signo)
> @@ -440,22 +826,42 @@ static void wait_for_keypress(void)
>   	} while (c != '\n' && c != EOF);
>   }
>   
> -/* Write 0 or 1 to debugfs entry "force_yuv420_output" of connector */
> -static void set_force_yuv420(data_t *data, int force, int conn_id)
> +static void force_pixel_format(data_t *data, int pixel_format, int conn_id)
>   {
>   	int fd, res;
> +	const char *entry_name;
>   
>   	test_init(data, conn_id);
>   
> -	igt_info("Setting force_yuv420_output to %d on connector id %d\n",
> -		 force ? 1 : 0, data->output->config.connector->connector_id);
> -
>   	fd = igt_debugfs_connector_dir(data->fd, data->output->name, O_RDONLY);
>   	igt_assert(fd >= 0);
>   
> -	res = igt_sysfs_write(fd, "force_yuv420_output", force ? "1" : "0", 2);
> +	igt_info("Setting %d on connector id %d\n",
> +			pixel_format, data->output->config.connector->connector_id);
> +
> +	switch (pixel_format) {
> +	case 1:
> +			entry_name = "force_rgb_output";
> +			break;
> +	case 2:
> +			entry_name = "force_yuv422_output";
> +			break;
> +	case 3:
> +			entry_name = "force_yuv444_output";
> +			break;
> +	case 4:
> +			entry_name = "force_yuv420_output";
> +			break;
> +	default:
> +			goto out;
> +	}

nitpick - the above indentation needs fixing.

> +
> +	igt_info("%s\n", entry_name);
> +	res = igt_sysfs_write(fd, entry_name, "1", 2);
> +	igt_info("res = %d\n", res);
>   	igt_require(res > 0);
>   
> +out:
>   	close(fd);
>   	test_fini(data);
>   }
> @@ -470,11 +876,12 @@ static void set_max_bpc(data_t *data, int max_bpc, int conn_id)
>   
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
> @@ -510,8 +917,8 @@ static void usage(const char *name)
>   	igt_info("-t vic	Select video mode based on VIC\n");
>   	igt_info("-v		Test on 'Virtual' connector as well, for debugging.\n");
>   	igt_info("-i conn_id	Use connector by ID\n");
> -	igt_info("-b max_bpc	Set \"max bpc\" connector property\n");
> -	igt_info("-y 0|1	Write 0 or 1 to connector's debugfs force_yuv420_output\n");
> +	igt_info("-b 6|8|10|12|16	Set 6|8|10|12|16 bpc\n");
> +	igt_info("-y 1|2|3|4	Set RGB|YUV422|YUV444|YUV420\n");
>   	igt_info("-e seconds    number of seconds to display test pattern and exit\n");
>   	igt_info("NOTE: if -i is not specified, first connected HDMI connector will be used for -t, -b and -y\n");
>   }
> @@ -523,7 +930,7 @@ int main(int argc, char **argv)
>   	int vic = 0;
>   	int conn_id = 0;
>   	int max_bpc = 0;
> -	int force_yuv_420 = -1;
> +	int pixel_format = PIXEL_ENCODING_UNKNOWN;
>   
>   	memset(&data, 0, sizeof(data));
>   
> @@ -542,7 +949,7 @@ int main(int argc, char **argv)
>   			max_bpc = atoi(optarg);
>   			break;
>   		case 'y':
> -			force_yuv_420 = atoi(optarg);
> +			pixel_format = atoi(optarg);
>   			break;
>   		case 'e':
>   			data.timeout_seconds = atoi(optarg);
> @@ -561,8 +968,9 @@ int main(int argc, char **argv)
>   	igt_require(data.display.is_atomic);
>   	igt_display_require_output(&data.display);
>   
> -	if (force_yuv_420 >= 0)
> -		set_force_yuv420(&data, force_yuv_420, conn_id);
> +	if (pixel_format >= PIXEL_ENCODING_RGB &&
> +		pixel_format <= PIXEL_ENCODING_YCBCR420)
> +		force_pixel_format(&data, pixel_format, conn_id);
>   
>   	if (max_bpc)
>   		set_max_bpc(&data, max_bpc, conn_id);

