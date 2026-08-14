Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C47C8C5CFCF
	for <igt-dev@archiver.kernel.org>; Fri, 14 Aug 2026 03:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511CC10E52B;
	Fri, 14 Aug 2026 03:42:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zsai3qCP";
	dkim-atps=neutral
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013051.outbound.protection.outlook.com
 [40.107.201.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E67810E524
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Aug 2026 03:42:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QDDdvSQ3nNgYHaY18BlCPWuGHMO0KJwIV52HFckSklrJnVS4E8YWIPIx30lyeGQ2LuMnz/QIwaPH/h36nPIeWsMe3DFO2ypAHL6mqsZ3oIGBCkxS70wbwZHFHKgxo6uv5DHP/+Ab9FuJvaJb1PLfKJcLy+X5axSJHYUaz26Ty98abkbcpPFp9mQc7LiPBsQNn1uRQ5ztmCAIuZSoEyqpj62+pRDPC0ux5VkdO38gV40xgz8oyX5+ZpORxEs8rRiBBv9rAEtguQszPiBAiU3051PQ4TuHe8d/wEQwRhtHjvQoKU35t39GGH9mDUpAkqLttVcEkqaJL7pObGHddbvqpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ij187I377hufvnc1OPohr42F8AyMH0b7Uy6RLMjW46c=;
 b=fe2rf8uzf85gBmKD/GIHT4Ij0M5jnYnxLuskKFjHYVoMhZT5dAPuJVQVDTSsbO/swi6SRACBcY9RcjqLXGTSEu8aRgiIT4SV9BIxUA6Tt6jLhSnFovR1VqL+oX1QXAJjDSQT3E9wX1D2OtKIaEK6bvUu+EItztOn/s7/GZ9F9rzrqM6CWtOos/ZiMoqTU5Y1KtdLb1CHvfbbHDtbJSwQOETJZmXyo8vZZnU+7T6k2kT7f53LY1PKjREva+lgK8OZsZXpis++795+JxhgR2lFTZnfF/KpQNh2iehQ/up2SHPai5hlhPyBvP5CHDzxV1BLwmz1GB40NUYNWGv2bdoFvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ij187I377hufvnc1OPohr42F8AyMH0b7Uy6RLMjW46c=;
 b=zsai3qCPLNjzfvVTIX2f+95svpQXwYRa+JpNfGg4bEaMYNRFuowtBP4x44xkCEhBLWczpmRrgKLzaSPNscC+nUZ+D7g78MT0C1A1QnX+YpGAfQQVgRLEsdPgGQBpYKrQmGgtsXTAodL9gVFqzIa8cm9GxK2+XZb6VJ5WsBnvKJk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by MN2PR12MB4141.namprd12.prod.outlook.com (2603:10b6:208:1d5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Fri, 14 Aug
 2026 03:42:00 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 03:42:00 +0000
Message-ID: <28a180a6-eca2-4cd6-b166-388765140de3@amd.com>
Date: Thu, 13 Aug 2026 21:41:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/6] test/kms_colorop_helper: only check if a
 given enum value exist
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
 <20260811143558.141813-3-mwen@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20260811143558.141813-3-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0335.namprd04.prod.outlook.com
 (2603:10b6:303:8a::10) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|MN2PR12MB4141:EE_
X-MS-Office365-Filtering-Correlation-Id: 47292bef-54d1-40ce-ec9c-08def9b5ff13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|23010399003|18002099003|22082099003|4143699003|56012099006|3023799007|11063799006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: g2/rQRkOGYSz0l+py7QjYCRacnnj8xy5tlAcsykuef1ZQ4Fnbc6U/fHf8+/Ka8rYxqZbkvMdT1p/IFQ8hbu/Y8FgaeqnB3VbHBr1Gr3MymXvwlvyA7z2Dgaz/uuBvcj5Jch+bUy6TFNLQ1TRRUE0+DhA1ySFs0qJlnSqWkxcqXvvk/s8uT0s0ZhVOGvxk0/njP2U7009RbQy/6TUaRHqd6Dgd3y/+CBpRV8kN+SzJdcWE2Ku1WuQXL2Vp0lsx3cxVJ4Sm1wn9Tm+tOaHV2qn329hRixGNOJfofvx66gx8JBYLgY3QLOG5AtnULf/iKPoylkKLozxs1gbf5YjnqgqT9DtctWMyeApMPnAPgxOnbXeaEWFqWh6doX+zoVgZ6TIukJjXW7rKEfndy+QtU7XcagtUHtC2ikk8ldONbbWHE8GTAXEq/cyo+fm8omFojAtqi94+CsjjCQkE9CDtTaD1WLi+UoAjIISRGixOgYbWRZl7FsIFTTZsNcxIQ500lHGR3LOIXQqRXFtQW3JgSN9dpfL6Y1o/xYtu2t8Oct/oCcp5sVVDd2BNe84AZSYKiaYPP9yJD9h/pHew6A3H3ttYxKCSm6bljhAqFJqX0QiVdeXMxZwXDGtww13tG4X6FYduGbMCYt7Fw5g9zyByhqrgDK1p9VzK/WVOoEpKMn26sQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(4143699003)(56012099006)(3023799007)(11063799006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QyswT3duVkRlZ1g4dGo3WnlPdk1CVllKSHFhK29MMHpIR25zWnJ1TTkrcHhF?=
 =?utf-8?B?OWhxVnZKOHJna09YM3k0UzVFTStzZ0JwdnZjOHJqbmdwWVBjc0ZhdWVEUzJT?=
 =?utf-8?B?QXpnRHpQUlpSSEZjM0l1QS9BZ3pCS0ZEQnIvRXBXdEVrNFhpNzlnMkhwZHJv?=
 =?utf-8?B?YkJlNUxrZWNZTEVabVZpZVpRTFBKUFNNR3FUYTNIN2U5Z2c1a3hqaHBNR0pH?=
 =?utf-8?B?M1dRSncyT2sxWlRKLzM2UkFXajZEeW0zQVdHM0l4dVVIdWx2UGF2SXhtZGoy?=
 =?utf-8?B?TktHcEQvclRDZzlFY1ZWdWxGN24zQVloWGpZa3NDT0lBRjFpdVVzSkliN0p3?=
 =?utf-8?B?czBqSHM4ZWJYYWpLUWYyd2h1eXduYjVVeDdiRkdGa1BOa1huTTF3Z0U1OVpu?=
 =?utf-8?B?M1hYbHpMWkNqK0w2SC9BSzAxWDVNck5QUG1nclpISUgxZnNBeGI3emxXMVRm?=
 =?utf-8?B?VHZ5S0QyNGllcnQya3RzOHY4UEx4aE5pd0dCMVc1ODR6WS9CZ3VkQkVHQzA5?=
 =?utf-8?B?bGVQUWowdm54TXJlOHhpUzBOd1U2TmwzMDFsL1pKVWp4M21qMVFpdGpNT1lR?=
 =?utf-8?B?bUREQVFidjZzME9CbkVnTmMrRWt2Rm04ZXNCbi83d002YWVCN3Z6TnZqTGt3?=
 =?utf-8?B?eC9lNkZwaUExRTlGdXl5NFJkZjFmb1o1MmRyWHZQMTRUWjZMblpiRzhiU3lD?=
 =?utf-8?B?cmFjRnBMUVFqNnhsRHJCOEt0TDVzU0hLTGIzc3pWRG94eHdETWhZaHdFOXhH?=
 =?utf-8?B?ZGRuZDRYSnNsQWYwNUNta2tLMlhRb01LOFlOT3hna0hsN0haNlZxQWpOV1pB?=
 =?utf-8?B?L0dJM216OGFJUjFqTFFZMFlsYzVnS3FZTG9TSHpFaWZXY2E0RnZ3SW1NSksr?=
 =?utf-8?B?enVLYXhhL3JuSG95U2x2Yys5L252YXJoUmlxcXZ4clNYbyszTG12dGhubjNI?=
 =?utf-8?B?NGl2eWxzRDZQT2VTNzhmU3N4UnR1Z21pK0dpNlBGN2F4VDJMb3FUSjFObjZk?=
 =?utf-8?B?NzJxSFNKTUxHakNqOXZPNGN5U0pFWGNkN1MrY2s3ZkxyMmdVYTJkdnZyL3A5?=
 =?utf-8?B?Zi9tS1hOVTlUK3VFUWgwZmtzejJYdE9RaUxWL1lmT2NMQWJrNjhGaFNvVURa?=
 =?utf-8?B?clZ6NldjWU5TdG4wVVFMZTZCYUdaZnE5QmFUbm9VcHg2WXhtMGN6bmEwd0N0?=
 =?utf-8?B?SlFGYWpleXhOZ1F6UEhEZ3drbFdsdXA5dnlsMUQ5N0R6S3VWS21pdkw2WlZu?=
 =?utf-8?B?NHY0R2VBUlBia3dOcnprUDZEcTZDbm9HTEZuRk1acWVIMWU0ajJ5UEh2Z3Fn?=
 =?utf-8?B?MENraXhHZUlzbXFJM3gyK2dINkhuR2dzK3JzdnNyY2JsOU80K2xwK3RNVm1x?=
 =?utf-8?B?bW85c2hqd3ErbGRaWkNyNnJXQ2hKbHJPQWdEb0NGdUkrMDlaNWFORWR5Tjhv?=
 =?utf-8?B?QnFPejgrTTlEVVQ3dUN4OWNvS0xqTmViVnZGRlhzL09JUCtjTEpLak1yeUR1?=
 =?utf-8?B?RGprUVloYldIUzdXM2JLalo5S0NkeHpJR2twTzFVNDRyeUZNVlRYTUgyelU0?=
 =?utf-8?B?eU12TUhROU1kTHVnT2ZuOGZOTnNtRThIdzhOWEZhVElwT0VUOUNQMDFkdldE?=
 =?utf-8?B?S1ZGY2w1blMzckl3UEV4Y0JUNG44YW14WmJIN0t4NVVmL252TFhveXgzYkZQ?=
 =?utf-8?B?dURyckxBMHlTT3hyMEI2cFdjNVBkcC9va2w2b1ZMSlV0emxIbHdIV05BOWpT?=
 =?utf-8?B?SXpMZ3VMU3lUWWQwa2JUWEM3aHgzYS9NajNLdTdEbE5jejBUMERPdzhxVWFL?=
 =?utf-8?B?YkV3Mk8zd2xLTzFOOHVwL2xiYVdqWTEwdDZzZDByUFBrSFJIeUU2QnllNlBm?=
 =?utf-8?B?aTN3NksrZVduV015V1l6dXR1aWRtSzJzRURiVnpmVTFWSndVdzBGSS9lNUhN?=
 =?utf-8?B?ZzVieVowOVROeFZUdmxLaHc2N2NXbmtVT2VaNWpvNENjeWU2Tm53RzU3a1RD?=
 =?utf-8?B?Rm5yWWVqeHlzSjRvT3hmVENxVStGTzUzZnUxZzA4b1gweUU1TmdPSm1ucDBi?=
 =?utf-8?B?emNEUko0b1pFT09ocUF3WmpVdWNpTGlicDZxdUl3Y3A4aHlZZ042RVU2Q3Na?=
 =?utf-8?B?L2RxVGhJU1g3ZDZ0enF4ZkNLNUYzUUlkL3RrazdFb0lZUk1leDlWY0doeHlx?=
 =?utf-8?B?d2c4Qmp1UG5KVkRlMGJOdGMrRGZCTVZMSTVURE4ySDFsOWsvajNqMkp3Zmtj?=
 =?utf-8?B?cFZWUjMwOXR3RHdKUXBTNllvLzg1VkI1cm9mYXI3NysyK3JlWmtqOXhYbVFz?=
 =?utf-8?Q?iZzxBN624ThGV+oUIS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47292bef-54d1-40ce-ec9c-08def9b5ff13
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 03:41:59.9712 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nL11zwxGJsJRzs1eEdCeaWJPzNq7alQiimEdN7cNJg02rxB9YsxJf8AfmbDsbwIH9tUnLpOzPOXKxJN2O76VkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4141
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
> Don't trigger unnecessary colorop property changes to just probe that a
> prop enum exists and can be apply. Make can_use_colorop() read-only.
> 
> Assisted-by: Claude:claude-opus-4-7
> Tested-by: Alex Hung <alex.hung@amd.com>
> Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> 
> --
> v2:
> - remove extra space (Chaitanya)
> ---
>   lib/igt_kms.c              | 26 ++++++++++++++++++++++++++
>   lib/igt_kms.h              |  4 ++++
>   tests/kms_colorop_helper.c |  4 +++-
>   3 files changed, 33 insertions(+), 1 deletion(-)

The patch touches both lib and tests - should the subject uses 
"lib/tests/..."?

or the should should use "tests", not "test"

> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 1e3cea781..900f88d0f 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -4506,6 +4506,32 @@ igt_colorop_replace_prop_blob(igt_colorop_t *colorop, enum igt_atomic_colorop_pr
>   	igt_colorop_set_prop_changed(colorop, prop);
>   }
>   
> +/**
> + * igt_colorop_has_prop_enum_value:
> + * @colorop: Target colorop.
> + * @prop: Enum property to check.
> + * @val: Enum value (as string) to look up.
> + *
> + * Read-only counterpart to igt_colorop_try_prop_enum(): returns whether
> + * @colorop's @prop accepts the enum value @val, without setting it or
> + * marking @prop as changed in IGT's cache.
> + *
> + * Returns: true if @val is a valid value of the enum @prop on @colorop.
> + */
> +bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
> +				     enum igt_atomic_colorop_properties prop,
> +				     const char *val)
> +{
> +	igt_display_t *display = colorop->plane->crtc->display;
> +	uint64_t uval;
> +
> +	igt_assert(colorop->props[prop]);
> +
> +	return igt_mode_object_get_prop_enum_value(display->drm_fd,
> +						   colorop->props[prop],
> +						   val, &uval);
> +}
> +
>   /**
>    * igt_colorop_try_prop_enum:
>    * @colorop: Target colorop.
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index 521a03c01..ace8c2b1f 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1023,6 +1023,10 @@ uint64_t igt_colorop_get_prop(igt_display_t *display, igt_colorop_t *colorop, en
>   	} while (0)
>   
>   
> +extern bool igt_colorop_has_prop_enum_value(igt_colorop_t *colorop,
> +					    enum igt_atomic_colorop_properties prop,
> +					    const char *val);
> +
>   extern bool igt_colorop_try_prop_enum(igt_colorop_t *colorop,
>   				      enum igt_atomic_colorop_properties prop,
>   				      const char *val);
> diff --git a/tests/kms_colorop_helper.c b/tests/kms_colorop_helper.c
> index aaee4e567..5b79fe789 100644
> --- a/tests/kms_colorop_helper.c
> +++ b/tests/kms_colorop_helper.c
> @@ -205,7 +205,9 @@ static bool can_use_colorop(igt_display_t *display, igt_colorop_t *colorop, kms_
>   	switch (desired->type) {
>   	case KMS_COLOROP_ENUMERATED_LUT1D:
>   		if (igt_colorop_get_prop(display, colorop, IGT_COLOROP_TYPE) == DRM_COLOROP_1D_CURVE &&
> -		    igt_colorop_try_prop_enum(colorop, IGT_COLOROP_CURVE_1D_TYPE, kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
> +		    igt_colorop_has_prop_enum_value(colorop,
> +						    IGT_COLOROP_CURVE_1D_TYPE,
> +						    kms_colorop_lut1d_tf_names[desired->enumerated_lut1d_info.tf]))
>   			return true;
>   		return false;
>   	case KMS_COLOROP_CTM_3X4:

