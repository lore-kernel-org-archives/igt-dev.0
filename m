Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DC8C5CFC1
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 04:06:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521FF10E52B;
	Fri, 14 Aug 2026 04:06:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TF/LrZme";
	dkim-atps=neutral
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012042.outbound.protection.outlook.com [52.101.43.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C045B10E52B
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 04:05:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTjEYsKnEltUZemThP0WHBayaa5DkZYziazrnF4sZJrPtlbLXqohtYaaxo3lZ9fG+rdqV8Rtwia8bDP0rx2TBYBIwL9QuUkF0aua5vaN1oc0lAJtyXB44PqU6bcKNGXTwDHGH5hD0jWyTo/0Jjinr8EQ7Hg4/2C3MQunTd0rcxR1R+glGuHbZhO/myGqqMsp4pesqlYp00/CwbmHc9UwG3LsEE0F0QdUze4yatvuEvMHfNuMVmCPxV0tER/83SSvsmhiMjytPWswxneJgsYIOz0xL9VlWCX8Gl+t/gwvy9ztHLc+bnAP7FWBu1QIpxciQT8mc1vd7d1q3L7gH7Xgkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC2FTs7W6oX7B0fXDXQLyOWMMyE1YKZI35b/bBCqFvw=;
 b=Tgi9sqEHZ4neknERc6c+eCyvGtJX+sjhDGarTUhTJKJxCx7xobe34zCf67fIKlhQkTk8GRdooXbtGl/W8nQjYYQPQf5grrNKpMSzDP5gSjDDb7PmiL77BWGGO1AlxbQRDzvCSTLt2KXrJ3xMecpZ1Y08nVYX4HKXF44faVatdF5R6TTz2xghmDDq9Bn10hJ00hLNSg91sUT+f0dRc+M67Qk5J79iSlODIA1nIA/iNrmOqaEyS+ntTVZhvCJ/FrjLprFvDRzh7ffU6IPN0nELEIfAgS5f993Soj/itUM6f2d/I52qY8zjY2L5K4PeY5cC0tGuaSxVs/EERen66k9jzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XC2FTs7W6oX7B0fXDXQLyOWMMyE1YKZI35b/bBCqFvw=;
 b=TF/LrZmek8e5SCw+X/rvnZJzqUjEP9lhdIQSqjue0WHKjGMHMzsOx68gJdXQjfelPgjFuzQXX6RZS7W0Dceuh0sYQyoE7sm3RnRlwBgfQbh1gPu3QLAXm47uaDtqWxc18LIQ9TjU5T9sQY4VQ1t/JejPRbB5SbBEF3XF7/TuAqM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SA5PPFAB8DFE4E8.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8db) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.15; Fri, 14 Aug
 2026 04:05:14 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 04:05:14 +0000
Message-ID: <09f130b9-5b9f-4791-ba50-d7ea6311a0a1@amd.com>
Date: Thu, 13 Aug 2026 22:05:12 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 4/6] tests/kms_properties: keep primary plane
 enabled for each CRTC
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Harry Wentland <harry.wentland@amd.com>,
 Uma Shankar <uma.shankar@intel.com>
References: <20260811143558.141813-1-mwen@igalia.com>
 <20260811143558.141813-5-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260811143558.141813-5-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P220CA0021.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::26) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SA5PPFAB8DFE4E8:EE_
X-MS-Office365-Filtering-Correlation-Id: 3835f8f6-fd85-49b4-031e-08def9b93e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|7416014|376014|10067099003|56012099006|3023799007|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info: GFmjsclyk7rsN9O1hRK9+Cpj81gxUFfSAJNOZezyuWURwEpM/fkgl1j3FJOlLoBrGmw7LrkyssD8mpyIwaU9IGR04yBWACHM/tgj0ViHVGhdU0cNZZb9Kk00hVe4039krWe2lRQUl9K2i30iSK/T9JHUBEZWe8d57+0CFc6PzqoD6fo4IHYML+Aj//c5T/gCbUoyKzMOzFtqpNO6W5ppu2+sDmq/rzWDtyHU8xRfIDXGJwt8HCum7ZegOayCbWmm+pNgkE+VNxwJjJFPzMdviU7YJtN5hzUJ0ehSwXgoOP9BZZCH7+F8K4kStMAsfSQ3xfB56abuATKNVT6NL2giZuTLCF8lv7FOIlUkweE4+YDJDjO1ZIUE+rT+yvTRMQYhRnDJaLfITrrzmLxq+UXRUh/L5HHKylw9Mx+84gYC/L9/OfpIgfepFn1ZR/YCbv+WIMZWPmMf+6/mMsaAFJFJ7LPy/3Zyu1sl5pjBnSAdliLA2+rL+6ISVa1AHEfp+RTI9rQinhj5ucjHHgafUv/2JplAvr0TeIq+l+s+XSdSlamahqm+xg7OKaMkpbHziwOpKT48YzAr/hs3tqSZv5muJYqXzo1vnHz8aroXTuy+UP+ixu6m/DCqQ9t8HClLKzyi2VHPgKUALgWK+x9v/Q7jmlZLOquZxCODloRXGEUl2/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(7416014)(376014)(10067099003)(56012099006)(3023799007)(22082099003)(18002099003)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXdiR1NTcWxpaWZPWlM1MFhwMGhNTzA3bkJtK1JJWWZ1dnVPR0N6YitDYkR1?=
 =?utf-8?B?NEw3MzRLZDBjcU9IQkxwV21sMTZkUHllZ0FlNU5LUU5TTzhzdjE2c3lkNWZW?=
 =?utf-8?B?TE9NRExKL0V0d1RCc0xEMDlFY2Q0YVpNQ1cvcUNucm05VXVDUjNPZncyd1lW?=
 =?utf-8?B?TGxKMTJBOGc0aDliUzR0UU9tSjFHTFh2UFpCWDRlMzI4QkNLK0o0QXZKWUJM?=
 =?utf-8?B?ak94SHJDdEZyRmlDTlc4anNNdjVhRjFiZUVmcGpWMGNsUEpkYTVidVpJR2R4?=
 =?utf-8?B?VndSSEU1RUVDQUs0dFRwamhXNXRLVUJQSzczNHJNRXp2OXR3ejNFeDgva2NP?=
 =?utf-8?B?NU9TS042ak5FcDJxSWl1VnpuTzNBVTVvNS9XK0p6OEZ6MDhVdFdSRHR6QVBr?=
 =?utf-8?B?bVJiSVMvL0EyQ0swRnIrNWxLMzM3d3pERnJlZzgwb1cveUVBWUhFLzd3RFNz?=
 =?utf-8?B?WWlGeUhKOXJHc1B4M2F0dDhvZ2FTLy91djZaNzE5dWNSR0taOStHRU55UVZy?=
 =?utf-8?B?c2MrVHRscG04d3gvVE1GY0xjNnBXMDA0UjNpZU9FSUJPOFBNaG1aNkdvWWxU?=
 =?utf-8?B?V3JhZWh6eEo3cmJORWNUSjZSNDZJc0FQeDByVFhjclk4NzFKcVZzZW5NSHUx?=
 =?utf-8?B?VUpPODNqdHlzMHU0RU9TQmd6QlVFYURBNXNYaU53c3FjQlRwRDNUWjJyOFRj?=
 =?utf-8?B?MHd6c2Uwdmo2TzUzSW9VNW5NTTFjT3RiRGN1MWQyMVdIYVdWNlBHcWhyOG5C?=
 =?utf-8?B?U2V4bnZwR25QMjZ5Qkgra0ZwbEpnL3loaHNuYWI4eHN1RTNZWElobWs2NUZT?=
 =?utf-8?B?RXNqZVJHbTFhQWU4QUFhY1JpS2cwNHR0VFU3Z2o3OTEzb0VML0hQWDhlY3dV?=
 =?utf-8?B?T3FpSXpNUGloLzJScFRvcWtWVmVBNDJxc1hxSkdZVndRbFMxRnBOTGE4SXFX?=
 =?utf-8?B?enVyemRmd1BaUWdZcG91Rmc3TEoxbHNKVlBwWUNPeGxWcEoyamNPYUk5UVpF?=
 =?utf-8?B?RWJHUFpHQnlycS9iWVdieTdZZmlzVkdZUEZ1Q1ZQS3Z0b2M3aHpGejZPaE1r?=
 =?utf-8?B?bUNHeWE5R0lyS2NUczQzM3BmbmRwSjFNcWNybXZ2bmNaWE42VHN5aFY0VWU4?=
 =?utf-8?B?K1RIYWp3d01zTE91djhFVnJBbnhEd3RSMUw5QVFaRWEyQnZjMGdDVGt6VHlY?=
 =?utf-8?B?KzJnekdrRldQSk9EeTMra0lXdDRNdk9MeC9uajF5R3N4bjAybHFYcDVUbFA0?=
 =?utf-8?B?Tk9hdWF3L1pTWmNlSnFSYVdSbGwyMyt3L1IrV0JVblU2NWl0V2pDS3Y5a3dW?=
 =?utf-8?B?VFBGSEFCTW5LTUEvOUl6VjFDNVhxSmxLbkt1RVBOalBLYXJtbFh1bGdtSEEx?=
 =?utf-8?B?OHpTZlBlelh4N0ZUMDVHdlJ2NXZDdForYURGYXN4ZzVNWUFnK0QvSVNsRjg1?=
 =?utf-8?B?Rks4UElBY29Sa1ppdDEzT1NFN24wWHp1QUVsU3N2ZEJ3WjN6K1ZraFRhdTRu?=
 =?utf-8?B?azltb1FjK3ozNjAveFFLN2FRbjZLUkFmaFVpMmJzYkxEbEsrcnYwcTJMalRi?=
 =?utf-8?B?YTZlSmZFMDRFb0M4VHlQVWtDOTJIQzFRejBKTXJxZEFLU0dLS0dRYVlBckhR?=
 =?utf-8?B?QjZtNldYVTV5QVArc0hwSGZNZ3hBRGdYcE5QcFhBZWYySWczRFVOZnNRVFo3?=
 =?utf-8?B?RWh1MDdqTXB5eHVJMmtlclpSQlJEaFZiRTRkdmVoRmNYbWlOZ0R3MU5TWGZ1?=
 =?utf-8?B?Sm5UZ1Nhc3BGL3NBaXRiaTJNNCswOWcrS0hYUjRpSW5xTWN3NHRHMTVEejdD?=
 =?utf-8?B?MU14TFFzMGNrSXlZZHNmYUZacktiakhuRVFVK2IxeGRpRS8zVFV2SzB0cG1V?=
 =?utf-8?B?bUtkb3BWbkczalBUcitQN0IyY0hiTW9YNnFkaW5zK2RKVDJTVjRIZmRrOW5n?=
 =?utf-8?B?eHpSRzRsTzJZZll5enFYTGJ5Mjc1VW1Na1lYWGo3U1kya2kwcGpBa1pzMk84?=
 =?utf-8?B?YjF2UTZQczVHOU1TRnBTU0RHRitHQ1VyVEpXTHpJbFRGekxuTlNWdi9CcENV?=
 =?utf-8?B?WloydlZlTGZNWUc3QnpJdnRKMkRwUFM5ZVY2TENhWEZLM3Y5cm4vZys0d2xU?=
 =?utf-8?B?eGcwRlViQzZRQkNzNjZJa3haYndwT1JQUEtEMHJPamEra00zRHVTM2E1akNF?=
 =?utf-8?B?aThBYnhaWTBmZDJPZGVQREVpM3RPMGEvV2VaNUV0S0pNb3RIT2s0VWpnTEpM?=
 =?utf-8?B?OTBsZ2dGNWJtZWhPSzVlUmFnbkQrc1BqS0U3VUp1UUlPUE1IblRuc2VnMkVh?=
 =?utf-8?Q?0Inc4kzJ5T9TxHE/2H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3835f8f6-fd85-49b4-031e-08def9b93e7b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 04:05:14.8400 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WpLym+uFeqf3Q8/RPEJtpqfXaHpwvzfwnqT8/Vp3op2/kMAjQaALw5V5GVr9dtOJeV9OobEGAb7zyG9H3aNnwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFAB8DFE4E8
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



On 8/11/26 08:23, Melissa Wen wrote:
> For AMD, a primary plane must be active to keep CRTC active. So stop
> reusing primary plane fb for overlays, give the latter its own fb.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> ---
> 
> v2:
> - detach different changes from a single commit (Chaitanya)

Were patches 4 & 5 a single patch? I think they belong to a single patch.

Ignore me if this was discussed before.

> ---
>   tests/kms_properties.c | 12 +++++++++++-
>   1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_properties.c b/tests/kms_properties.c
> index 292a04a2a..87614346a 100644
> --- a/tests/kms_properties.c
> +++ b/tests/kms_properties.c
> @@ -237,7 +237,7 @@ static void run_colorop_property_tests(igt_display_t *display,
>   				       igt_crtc_t *crtc, igt_output_t *output,
>   				       bool atomic)
>   {
> -	struct igt_fb fb;
> +	struct igt_fb fb, afb;
>   	igt_plane_t *plane;
>   	igt_colorop_t *colorop;
>   	int i;
> @@ -255,6 +255,16 @@ static void run_colorop_property_tests(igt_display_t *display,
>   			 igt_crtc_name(crtc), plane->index,
>   			 kmstest_plane_type_name(plane->type), output->name);
>   
> +		/* AMD requires primary plane enabled to keep CRTC enabled */
> +		if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +			drmModeModeInfo *mode = igt_output_get_mode(output);
> +
> +			igt_create_pattern_fb(display->drm_fd, mode->hdisplay, mode->vdisplay,
> +					      DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR, &afb);
> +
> +			igt_plane_set_fb(plane, &afb);
> +		}
> +
>   		/* iterate over all color pipelines on plane */
>   		for (i = 0; i < plane->num_color_pipelines; ++i) {
>   			/* iterate over all colorops in pipeline*/

