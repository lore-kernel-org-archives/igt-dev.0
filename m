Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F54CA5FC7
	for <igt-dev@archiver.kernel.org>; Wed, 30 Sep 2026 15:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A26010E560;
	Wed, 30 Sep 2026 15:44:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LaRpyh/o";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013037.outbound.protection.outlook.com
 [40.107.201.37])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E2F10E560
 for <igt-dev@lists.freedesktop.org>; Wed, 30 Sep 2026 15:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gW9sDItby/abgEBMG5hMwJj5glyGwiujJA6YY4R4s72pDMXpXUOW+e8BQrCuMY1XHensaB7oMf/4YW7P3eYe0YQsbZ8VSEmsBaIAMcDRKMeFfOVH0qsXkdjTrzie/aqVJyqETMYlX9FHYKHP3TRxmsE5Tg2nlFv5I9VkD4xkJOR1BGgmQuupunCzcqprmzB011ghRsr8WwVd7mH9JWG+tCjl/k1ihmrkWEwIrp9HGr6yDGEizaeWJrRPFO8qzPlr8Y4FgKxYOV0GwY8MruIIj5OY10LS10JOR2Fs5srzWvahytZlRKRIW/uh0dtX8GqvGONbB+ySaVLHofK35RVbNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nOr52z3cSIr5vV1ZHDkJVmzPNiexxuwKktzz0bAUS5o=;
 b=zLRcBkPC+NQ2wjgCIVOBOTOL/5mPqZlSo6rr1xvgcOAh76r+SBsljNoJcvRHigm/e45uNQyKR2Uzgx9ghA0UL/QQoCWaRBsVLnFFGu1lanYMBXrESLl4o3dpbVcLnaIpKSaiQFVuogmS26+MHTWqk+FDf2E7pe4x9ooeYWBr0hbRPHCfgsqyJSZU3nGOd4sYT+Je1myYQXMk7auPwDBhEf/iT3ol54GXr9JLjHpbI6eeydFQfa/7hNoWZGOyEqWoKLHIx8VqDTOuw9uvY/+dBJXcvGmrn9a6bBgOBRG0u20I1FTJ90xz7ZaYT1dAYAHS38CQLUH8ggn3yh8FEVycTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nOr52z3cSIr5vV1ZHDkJVmzPNiexxuwKktzz0bAUS5o=;
 b=LaRpyh/oy/DzwUIy5Q6wyuhe2IPDUpg9RJtXMlJY1ZjzA/LwXkJ0jfvcrY9FjfRVqyKe3t44ehQIx8yRlqeV3uFWNZzXZOyiOe0X2Iv8KOxUGKTDN0vJaeubk8s575prrn+u02fgBJeZgWOw+VKrBf8B+ToCydr6IRw6cjS4c64=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com (2603:10b6:a03:486::8)
 by MN2PR12MB4287.namprd12.prod.outlook.com (2603:10b6:208:1dd::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.16; Wed, 30 Sep
 2026 15:43:47 +0000
Received: from SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a]) by SJ0PR12MB7007.namprd12.prod.outlook.com
 ([fe80::6f95:c4a2:894d:9e8a%3]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 15:43:46 +0000
Message-ID: <80f27d2a-28f2-4078-a1a2-7b90fb4101c9@amd.com>
Date: Wed, 30 Sep 2026 11:43:40 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 5/8] lib/igt_kms: extend
 igt_plane_set_color_pipeline to accept Bypass
To: Melissa Wen <mwen@igalia.com>, Petri Latvala <adrinael@adrinael.net>,
 Arkadiusz Hiler <arek@hiler.eu>,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>,
 Bhanuprakash Modem <bhanuprakash.modem@gmail.com>,
 Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Karthik B S <karthik.b.s@intel.com>
Cc: igt-dev@lists.freedesktop.org, kernel-dev@igalia.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Alex Hung <alex.hung@amd.com>, Swati Sharma <swati2.sharma@intel.com>,
 John Harrison <John.Harrison@Igalia.com>,
 Rodrigo Siqueira <siqueira@igalia.com>, Simon Ser <contact@emersion.fr>,
 Xaver Hugl <xaver.hugl@kde.org>, Uma Shankar <uma.shankar@intel.com>
References: <20260902180016.303482-1-mwen@igalia.com>
 <20260902180016.303482-6-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260902180016.303482-6-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQBPR0101CA0092.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::25) To SJ0PR12MB7007.namprd12.prod.outlook.com
 (2603:10b6:a03:486::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB7007:EE_|MN2PR12MB4287:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ff2946b-c3d1-40dc-1d89-08df1f099d60
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|7416014|376014|366016|11063799006|56012099006|10067099003|4143699003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: GlkURy8vj4dNZPKFE7ip1ZYckaIw0vT7nFPBHxw3NST3pjKnaXlq/5OZHHSLaFUTHmpNhI8OciM+9QlCCovmb7fSiahxfwrmaK53jaD3oBs1///Y8ohAwODpuCFrZWtF6YhBZB89NQEAnEzpGQyGcvbrGz4M0OSF60T9zQhUdxf8tHHOd59bbuHjgg2YP2S3srFfFxZhigF79ZQj7EKdeXy/7MbJxUZq+/eBrASIy4Fx9UoaFUsBvegoJyxDCpuT2s6NUvsIcvIiZhaUrOmnZtwDke92xPWN3SNqUHYPyv61mGee9vHWoxkETO/oBVfkRzQ6pclGqiuA8NyX5dmW+0Hh0Co70BZEAeYyfLfP4BNh5vUAwAh48JPxz88lUx6ytjDaRK82aY34KYMVUxXfgPrzh/XShYZ8uanQ2JPO7G8oRDMMJ24cR1eRORgvV0+pCUYLTUhS7sXVEqMwGwZJSiq8Dbv0tzn/HZzPwI+nhoNjYoZQete/W/AGdjJ4zopR5bjMfQjVzVnJGLEQ4IsSuYVyr46GIZ3GcYoB0EHd56H9kaV2Xy4Ix6/9hGViJi9poUzddlKGpJ8gUNAasDDQDRFwftPRAaHmqo3R70VrP+/ohd/FVWFn4n0uM/3eaFLI0LYBf/bhN+dm/ZwgIx1e8ZGo5HHa6dPOL8XPnHMmG3M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB7007.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dS9hdC8xVEVuSTdtUkNVWlZIVmYxT0J5eXdFWVB0YkVyZE5ObFZzTFM3Y2xh?=
 =?utf-8?B?OWVJRjd0c3pGaWMxZjdxR0V5alNJSnhRM29MSkVYbVRXUGV0QVNjNWlKLzZN?=
 =?utf-8?B?aFNWVWVnTUdpZExsY1NWZ1NpT3ZmeVZrdVh1M24zYmRKNldJbHhQQUcrQVc5?=
 =?utf-8?B?dFV2UDRRcmJVbUhaVURmdHBSYlFIY1NCeno5OThqV1IrZEgrNmw1QXVzWk9p?=
 =?utf-8?B?cVUxdHo0NVhhUGdkWFBxR09keGhqaG80NFRjWlZ5QkNWbGI0MmdnNG1ScWlC?=
 =?utf-8?B?M2tqb21vK2NrV0dTOVNNbzNpMU1XeTFtR3c4S3JJemluVmhwMHJxeENkVm1T?=
 =?utf-8?B?RGpBcTc1UUtGRHBjVmVWTVkxYnZyMm5JTVkzU2VBZXk2K3hyc1k1WnI5UTRB?=
 =?utf-8?B?S0I5V0RGdUFaREZCbmY5MVJCLytPNDNsR2dZMEFsOHY1V0pjdG9xS0NtT1Fr?=
 =?utf-8?B?R2drRXdVNU04bTRBOXMyckRKdUxlY0NwMWlUSXlDdWlmdGx3alFsL3BzL0p1?=
 =?utf-8?B?dUVsSGxBbmJ2TTAyeG52Z0haVWJWZytKUTlLYTg5Y1lWZ250Um00cmJUcDdD?=
 =?utf-8?B?bG5QVzhENjc1UFNuODNZMTZXaFVEK2t6a1h1Zkl4SERmZzZCTHhCQ09IeEp0?=
 =?utf-8?B?dTN5YmtFR1dVTnQ0ekh4ZzZlODJVclkwbXpXbG14TzFXenVWNmRyTy8xdFUy?=
 =?utf-8?B?V1lQWEs0L2VEZ0ZCYWZaWDlpVUUwUytSTVBWVm8zcldZUzBpbmR2VFdPOC9o?=
 =?utf-8?B?WnBiM0VPS2FHcFNnN0NGSUVFalZjSEFmRGlrek1yYmVsRWlIcnhLN2RuRUpE?=
 =?utf-8?B?ZVNudmRNVUtwdTdWZFFiem96R3h6cDlXbjU2eVZaR09uMTZYdFNjSzYydUI0?=
 =?utf-8?B?anZkVVZjajdQV0pGalpRNU9Xc3oxSVNQK2hyS25hVlVlN0hyZHdobDJJaEZy?=
 =?utf-8?B?ZSt4U2Z5U0UyUDBwOGFjRDFVMFUxZG4rZm50ajFzMmN6bTFybGZ5Vi9IOTBH?=
 =?utf-8?B?Tmc4SWNVRktIU2hXM3QxQWVsMjVqdExHYkE1M2NvKzFySFZ6UkVUWkdZR2ov?=
 =?utf-8?B?U0lSOUJuYWJ0eDNPZk1Iays1dXorR0VGS2pHRFFXYU9WUHBZMFlQOWZBcGhl?=
 =?utf-8?B?SFhrVUdXeGlyZE0zZTlHcGtYaHcyOGZkSGdrRTh6Z2p4WmF3RmZiT2FabklI?=
 =?utf-8?B?SC9jNmtrRzdsa1p6UWhMaEdMd0hpTDhjWXBtdjR1RXJIdXo0MnNkc2FocFRp?=
 =?utf-8?B?MVdSRFIyaWJIQVV4Z28rS3l0QkkzTGl6SzRTQnpPWnRRODhZaVJNSTFSREFY?=
 =?utf-8?B?a0h6eE5QV1dpQXg1TVNDMDZnQkd0THJmMGs3K0kvRndPSW1CL2pydWVudWxx?=
 =?utf-8?B?d0JkMG9ueFY1c3ovdWdXNFZPYkNIOXZhaVZvTEZoMVJSSUFNM0RvSHZYblZT?=
 =?utf-8?B?dlVFM2F3OUhVdjVWOFVTTTAxajdpanVPV1pSSXhpZThkOVhNYWtseXRLb3U2?=
 =?utf-8?B?Q3pyL0tEd1hhMVAvT1hFWHpSejZLUFE1YnZveHhZVlM5WWtQdXhWb0JwNTh5?=
 =?utf-8?B?eWVzaEE4dG14UlRRd1k1VzlhVGdQSnIwOGd4SlFSVjdtS2M5bDRhTkNBUkJ4?=
 =?utf-8?B?eEJlbWtsMDRrMGVqQVRlYTE2SEtPOVJqS0ZXN1lhUzFrbTVCajl0am5xSmpY?=
 =?utf-8?B?ZW05RlI5VE85aktjejJtWTlsZGQ2SE9NeW1ha3JuNERjSEpyZW9kWk1qMzZT?=
 =?utf-8?B?SlYrZnlSbVBkOWxma29BTnRGZmdQbmZycEczNVgrWUdHQndWVmQrdjA2ZWdF?=
 =?utf-8?B?UFEwYWt4WXZuOHNCcTZ3aUVnU3NjS2pVbmlLZXlYL3c0WURKTXhGeG9BM2I2?=
 =?utf-8?B?Rkg2WXlQWW5Ic0VZWlNTZVdyTUFSNHRWcU1kNVBxdGVCYmJkWEdZdEdHQjFM?=
 =?utf-8?B?OThJdWlKcGErZXFKRkpMNHRoRzNwMUsyZ0tkdEVQNS95YkxtQ0JsL1NaclBS?=
 =?utf-8?B?QTJvWXNDZ1QzYVVxTEkwZitycy9GNlFOYnd0VkJOaThJWVZyclYvdXQwTmI2?=
 =?utf-8?B?WkxnV3VQMVlkV2NiRW5FRHZLcGlDeDVVSi9qU0hmUlcrZ1RMbnRuOVptUGlD?=
 =?utf-8?B?Qm8wWkxpajlHL0lUemdxdmVBZjlhd1RxWkxXdCtTUGNCT3Fjb3NVZ0c2MGlq?=
 =?utf-8?B?Qmg1RTBMWVkxNC81SEZlNHlnSms4UkNLa1ZMTlB3eU5KQUNVUTBkVms3TzRt?=
 =?utf-8?B?WmlIU1dtRHZiNzRKaW1OajNwb2NCQTRlNlNwRXgvVlNRbDcrWFVRSW94TS81?=
 =?utf-8?B?UVJUNE85cnF4MjhNQ0RzcGh1bndxOTc3bE54N2dpdHZpUUNJVC9EZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ff2946b-c3d1-40dc-1d89-08df1f099d60
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB7007.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 15:43:46.7049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HQQ5ZM+rGPO+ymgueonrBojr3cv3tJ5noMQgxFMOttm8xMYxIh8n7G9rsvGk5AwJlY6xVEqOUyvY2q2pDpEOFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4287
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

On 2026-09-02 13:58, Melissa Wen wrote:
> "Bypass" is just the COLOR_PIPELINE enum value with no colorop object
> behind it, so make igt_plane_set_color_pipeline accept NULL and set
> "Bypass" instead of making callers poke the property directly. Convert
> its callers, igt_plane_reset() included, and drop the now unused
> set_color_pipeline_bypass() from kms_colorop_helper.
> 
> Keep assigned_color_pipeline pointing at the outgoing pipeline when NULL
> is passed: the kernel accepts a colorop update whose pipeline is in the
> plane's old state, so reset_colorops() must still be able to finalize
> colorop settings in the same commit that deactivates them. No functional
> change.
> 
> Signed-off-by: Melissa Wen <mwen@igalia.com>

Reviewed-by: Harry Wentland <harry.wentland@amd.com>

Harry

> ---
> 
> v3:
> - new patch, replaces the open-coded "Bypass" setting in patch 6
> ---
>   lib/igt_kms.c                                 | 20 +++++++++++++------
>   .../chamelium/kms_chamelium_color_pipeline.c  |  2 +-
>   tests/kms_color_pipeline.c                    |  2 +-
>   tests/kms_colorop.c                           |  6 +++---
>   tests/kms_colorop_helper.c                    |  5 -----
>   tests/kms_colorop_helper.h                    |  1 -
>   6 files changed, 19 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 6039ad18a..cabe60a31 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -2708,7 +2708,7 @@ static void igt_plane_reset(igt_plane_t *plane)
>   		igt_plane_set_prop_value(plane, IGT_PLANE_HOTSPOT_Y, 0);
>   
>   	if (igt_plane_has_prop(plane, IGT_PLANE_COLOR_PIPELINE))
> -		igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
> +		igt_plane_set_color_pipeline(plane, NULL);
>   
>   	igt_plane_clear_prop_changed(plane, IGT_PLANE_IN_FENCE_FD);
>   	plane->values[IGT_PLANE_IN_FENCE_FD] = ~0ULL;
> @@ -4430,17 +4430,25 @@ bool igt_plane_is_valid_colorop(igt_plane_t *plane, igt_colorop_t *colorop)
>   /**
>    * igt_plane_set_color_pipeline:
>    * @plane: Target plane.
> - * @colorop: Colorop to set as color pipeline.
> + * @colorop: Colorop to set as color pipeline, or NULL for "Bypass".
>    *
>    * This function sets the given @colorop as color pipeline on @plane, or fails
> - * the test if it's an invalid color pipeline for the plane.
> + * the test if it's an invalid color pipeline for the plane. Passing NULL sets
> + * the plane color pipeline to "Bypass" but keeps the previously assigned
> + * pipeline, so that pending colorop changes are still submitted with the
> + * commit that deactivates it, which the kernel accepts because the colorop is
> + * in the plane's old state.
>    */
>   void igt_plane_set_color_pipeline(igt_plane_t *plane, igt_colorop_t *colorop)
>   {
> -	igt_assert(igt_plane_is_valid_colorop(plane, colorop));
> +	igt_assert(!colorop || igt_plane_is_valid_colorop(plane, colorop));
>   
> -	plane->assigned_color_pipeline = colorop;
> -	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, colorop->name);
> +	if (colorop)
> +		plane->assigned_color_pipeline = colorop;
> +
> +	igt_plane_set_prop_enum(plane,
> +				IGT_PLANE_COLOR_PIPELINE,
> +				colorop ? colorop->name : "Bypass");
>   }
>   
>   /**
> diff --git a/tests/chamelium/kms_chamelium_color_pipeline.c b/tests/chamelium/kms_chamelium_color_pipeline.c
> index db6107221..5738c6dd1 100644
> --- a/tests/chamelium/kms_chamelium_color_pipeline.c
> +++ b/tests/chamelium/kms_chamelium_color_pipeline.c
> @@ -161,7 +161,7 @@ static void _test_plane_colorops(data_t *data,
>   	chamelium_destroy_frame_dump(frame);
>   
>   	/* Cleanup */
> -	set_color_pipeline_bypass(plane);
> +	igt_plane_set_color_pipeline(plane, NULL);
>   	reset_colorops(colorops);
>   
>   	igt_plane_set_fb(plane, NULL);
> diff --git a/tests/kms_color_pipeline.c b/tests/kms_color_pipeline.c
> index 78860a845..f71416ce1 100644
> --- a/tests/kms_color_pipeline.c
> +++ b/tests/kms_color_pipeline.c
> @@ -168,7 +168,7 @@ static void _test_plane_colorops(data_t *data,
>   	igt_assert_crc_equal(crc_ref, &crc_pipe);
>   
>   	/* Cleanup per-test state */
> -	set_color_pipeline_bypass(plane);
> +	igt_plane_set_color_pipeline(plane, NULL);
>   	reset_colorops(colorops);
>   	igt_plane_set_fb(plane, NULL);
>   	igt_display_commit_atomic(&data->display, 0, NULL);
> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
> index 732b9d57f..2bee1eecd 100644
> --- a/tests/kms_colorop.c
> +++ b/tests/kms_colorop.c
> @@ -287,7 +287,7 @@ static void colorop_plane_test(igt_display_t *display,
>   
>   	/* reset color pipeline*/
>   
> -	set_color_pipeline_bypass(plane);
> +	igt_plane_set_color_pipeline(plane, NULL);
>   
>   	/* Commit */
>   	igt_plane_set_fb(plane, input_fb);
> @@ -315,7 +315,7 @@ static void colorop_plane_test(igt_display_t *display,
>   
>   	if (!colorops[0]) {
>   		/* bypass test */
> -		set_color_pipeline_bypass(plane);
> +		igt_plane_set_color_pipeline(plane, NULL);
>   	} else {
>   		/* get COLOR_PIPELINE enum */
>   		color_pipeline = get_color_pipeline(display, plane, colorops);
> @@ -343,7 +343,7 @@ static void colorop_plane_test(igt_display_t *display,
>   	/* Test bypass transition if requested */
>   	if (verify_bypass) {
>   		/* reset color pipeline*/
> -		set_color_pipeline_bypass(plane);
> +		igt_plane_set_color_pipeline(plane, NULL);
>   
>   		/* Commit */
>   		igt_plane_set_fb(plane, input_fb);
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index da234410e..a109c1b06 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -450,11 +450,6 @@ void set_color_pipeline(igt_display_t *display,
>   	}
>   }
>   
> -void set_color_pipeline_bypass(igt_plane_t *plane)
> -{
> -	igt_plane_set_prop_enum(plane, IGT_PLANE_COLOR_PIPELINE, "Bypass");
> -}
> -
>   static void reset_colorop(kms_colorop_t *colorop)
>   {
>   	igt_assert(colorop->colorop);
> diff --git a/tests/kms_colorop_helper.h b/tests/kms_colorop_helper.h
> index 9a1477666..2a0e3799f 100644
> --- a/tests/kms_colorop_helper.h
> +++ b/tests/kms_colorop_helper.h
> @@ -114,7 +114,6 @@ void set_color_pipeline(igt_display_t *display,
>   			igt_plane_t *plane,
>   			kms_colorop_t *colorops[],
>   			igt_colorop_t *color_pipeline);
> -void set_color_pipeline_bypass(igt_plane_t *plane);
>   void reset_colorops(kms_colorop_t *colorops[]);
>   
>   #endif /* __KMS_COLOROP_HELPER_H__ */

