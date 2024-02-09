Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC90C4828F
	for <igt-dev@archiver.kernel.org>; Fri,  9 Feb 2024 16:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BFE10F73E;
	Fri,  9 Feb 2024 16:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A2eIO1Jv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF1410F73D
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Feb 2024 16:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707496400; x=1739032400;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=XCVCefLCd+SAa9lDlrXyabFrwVUSd3u+a+EyVO6Sv6w=;
 b=A2eIO1JvUpEmkytd5rY+QvkrGl+OwoLTH4+jxZsIjYKKF3wwMAy9asoJ
 TtZxE8jDIUZ3AHwpEINv8VbqMNSGU8e1iMPX/8PUpV+l5VtxdU3VfbKdK
 vQdlenP2rCEjFLCejHT8VkNYOObnxqvso0kOErMwviDzA1u0pUf8v+s/W
 yL9btrBD27IoaVw6tgJSKgNQ5+38gJ3aCBF5+j4u3DjfPO5cBdc/IiHl3
 KLiSMPe6QEh6reO1gCKW4J5MF65TFFuDzgiP3tRGk5Vea6W4YyvINqgQ2
 JiSKnCG+ayG2GhAlc8GQZONTjCaJAgJp11OdkcVI1FgYk8sLz9UQ0dak5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1611316"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1611316"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2024 08:33:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; d="scan'208";a="39412869"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2024 08:33:17 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 9 Feb 2024 08:33:16 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 9 Feb 2024 08:33:16 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 9 Feb 2024 08:33:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AEHSapZg7QDK2W/Ie0Uolggm1bh+4YEoN+wCLXf7Ek6dnEOo1QKr1JgbVvmivHvcXo18z5rFi/bO5+oa9PqhqxuaIs0NVeXuPHvJli7ruqy34voHP+2JJGyvN2ok8aFJMTMUgRqHZLZoV5SLRIWf/5t7xnjaJgP9LZ4ptzwGviGfOD7u7oqopMHAtUSJMSyRSjDNFa6tMo4HVgjGPnZrh+TM05zi++4jVGzQoZZPK2irN8nqNUqGv6+D/zKpyiPyDy6nG2xjqokuaMzrEomHCHnNR7pMha3GWtUQk8SjG3QkRwOJE1cBIAGJ2jO6/yeMEeoZsK3DSM6FevEKcRFMvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0RFQMmOSGCvqFIovwS14acHdfpl95OHdmY+o8wpKAJQ=;
 b=HIEdgYM2+1Ymj9bC4TuiKt0c1C8O0Z5jB7ekOtsFYC4u9nzbiW7HU8hW18IjZ4lB8o6R4rRhmyA5cmMeaJW3bSFKBCLeWOEUdkPReY9x5ZrXxNPJoQySBDjanL8ZRPBvtyD4B03YSS3fOtIwt9GTcZEU/OiQq1jF9vaWO+8Pamfrx/wWWWsgAAU/AsF2scIhemePCA0XYDfdxr0RE9jTn7gtO4Sbe5urMSAC0xpY4FiFmp28KzHN+BzZgjAvTuIwt5AYYV7LE4w59XJmgbdHsA4zjw9s6oTef7iloCiOIiZ/lLt6/mRb1rnN9Sdqkq6MijSC3f7cwIX6OE3mr+i3Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 DM6PR11MB4531.namprd11.prod.outlook.com (2603:10b6:5:2a5::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7270.24; Fri, 9 Feb 2024 16:33:14 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::2a10:3a91:b9d9:5fa1]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::2a10:3a91:b9d9:5fa1%4]) with mapi id 15.20.7270.024; Fri, 9 Feb 2024
 16:33:14 +0000
Message-ID: <840d81e2-cdf9-4701-afed-b7f5b34b5d38@intel.com>
Date: Fri, 9 Feb 2024 22:02:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [igt-dev] [RFC PATCH v3 00/12] IGT tests for the KMS Color
 Pipeline API
Content-Language: en-US
To: Harry Wentland <harry.wentland@amd.com>, <igt-dev@lists.freedesktop.org>
CC: Sasha McIntosh <sashamcintosh@google.com>, Liviu Dudau
 <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>, Sebastian Wick
 <sebastian.wick@redhat.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Christopher Braga <quic_cbraga@quicinc.com>, =?UTF-8?Q?Jonas_=C3=85dahl?=
 <jadahl@redhat.com>, Naseer Ahmed <quic_naseer@quicinc.com>, Aleix Pol
 <aleixpol@kde.org>, Alexander Goins <agoins@nvidia.com>, Pekka Paalanen
 <pekka.paalanen@collabora.com>, Simon Ser <contact@emersion.fr>, "Hector
 Martin" <marcan@marcan.st>, Xaver Hugl <xaver.hugl@gmail.com>, Sima
 <daniel@ffwll.ch>, Joshua Ashton <joshua@froggi.es>, <uma.shankar@intel.com>
References: <20231108164006.106967-1-harry.wentland@amd.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231108164006.106967-1-harry.wentland@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0070.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::15) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|DM6PR11MB4531:EE_
X-MS-Office365-Filtering-Correlation-Id: 958bbb92-fedd-4281-a5f3-08dc298ccfec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zFWnpbX04ozqjcldUG4bMnrM0DPj/ZkPoGRxGQtxfBRZTPMHpBoTGEemd/t2eaKp5djWknNNUIxF22KYHCkGLVaelyZuwLiHewTqPwoSU6c1qi+d18OUSIxnf86hs4wNPH+/kzyBIDaP7IjTZem7UQ6yONk0V+N5EjiQtnQIQXZwF0tj4M8SFyVbFxYhjigELDXdnaO3ly1mmLLaUHwKyEEyoe2XLncYdCXAGyjp44Ggj1tlDbDxU879f6pkPfUoa+6J8FEv2vVvBXGEy8DmsuAZ6TzBUYaXJzdjLmsoGwvuvbdddHnsoxRx3VNzQmbRR/t9V/qxq7vl7l7yyoNaXL+1fa88zPC6uHJGPUfph32deLSa08J2ei9Brgivoxpz50UShd2GOxnhoeLBVfkPdbnams8TF2d4WQNsXl3luC+ZQ4ncn+/I08V316PMkB9VXr1FuJvpm+2vzJ+URMUBBAfWo/SQY8o4OzZkZFJo5A06ruQ1uGGRVZQspHIUvyj8wKa/0XZBtSWel01ck9Zak8w4ZqfuQ93ppn4U55VfltI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(366004)(346002)(39860400002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(82960400001)(83380400001)(31696002)(86362001)(966005)(6486002)(54906003)(107886003)(316002)(26005)(478600001)(6666004)(2616005)(6506007)(66556008)(66476007)(66946007)(38100700002)(6512007)(53546011)(36756003)(7416002)(8676002)(4326008)(41300700001)(5660300002)(8936002)(2906002)(31686004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S21vV3NvK3NjUW92Wit4VVl2cWdiMkwrVzFNT0s3U05wMlpyUk4xdm50ZHBB?=
 =?utf-8?B?a0ZsSEMranBwekhlUlZMd0tTMVlvTHVwOXZvQTgwOVhjUnEvbDNYS1h2eXV1?=
 =?utf-8?B?K2tOMTYwclFKV2JuSVFnVEJBemhqUHpXZDJ6U1Rob3RFd3Y0ajl3Q2NQY2FI?=
 =?utf-8?B?dFliUGdzWFhKalhBZWFOVUVHcmVzZUp3WU9XN2NEeUwxU0lHSmRnbnkzWDhC?=
 =?utf-8?B?MlhpNUVGblNDT3R0L21rTTM3Y2kxcGt4cXpkM2dDR0NKTEVhVDRHcGh6cEJh?=
 =?utf-8?B?aVFEOHVFYkprQjhkWUFoN3Z5NVp1MzRoRWhyTWYvbGlwREJpVnNCTDJNMDlu?=
 =?utf-8?B?RU5td1M1dlAwRW54WUh2WXNVaGNQNmw2Yzg1eW1SUXNIWTBvRXR3M285SFlw?=
 =?utf-8?B?aTNvc1QvVmFIV3JiejFwZ1ZHVG1OSGEzUEsraFRnVjB6NGlwMjIxZ056Sm9E?=
 =?utf-8?B?bVR3YUx2eDZPSG85R0ZRM214R1lrVVp3ZktaSmN1Y0RYeHEvdXpUZ01RNjJv?=
 =?utf-8?B?RzNuUzVCT1F2U2h3b2xGU2hxb2xESVEwNXJXaGg0Z2ZBRi84Q3poSlZXTnB2?=
 =?utf-8?B?QUZDVHN0UitiUkNUenI1UGMwWHJBbnU4RWMyQ1VsRGw1UE9aOGZtOCsyV2Nu?=
 =?utf-8?B?UEZnTFR1VWZuL0NGRWRYemJJc1pCYVJmMGV4MnF2QklBM25Bd1FqZk9VQmZQ?=
 =?utf-8?B?WDRXSDBxdm1FODV3QzlJRGJOWEhsOW5tRGtUQzVFZ1VkSHJtdXFpOWpjaUFj?=
 =?utf-8?B?WVU1Z296QkgyTWRNcGdpTTRSS0p6MkZUVDBIUjF3bmk3MTFvT1ZXdThLZFZF?=
 =?utf-8?B?Y3NwL2VJS0dlSytpVjQ2K3ZTL2o0OSt1ZTBPdGV1cElackNDMEpaZHAzb1c5?=
 =?utf-8?B?UHV1VGM2aFkwcWIrY3NUTjdGQUdaM0JmRWJ4ZzhCR1R0L1RjVTlaOWNrR0pD?=
 =?utf-8?B?ZE1UV0lMd2VjMituSHk1OGc1ZlFQWFlwb3QxN2J3bGNRM05GbStvWGUrTC9j?=
 =?utf-8?B?anY5UGY5Nm0weCthNHhlTittRDVGY2phTVBqdzhsVmVkRkRSMkFoRFgzalpX?=
 =?utf-8?B?bEIyYVcycnkyMnh5R285UnlDZ2x4UXhOVjZGMU54VVNITHpmU1FDNGlhQmxF?=
 =?utf-8?B?TDUrRVYybHE3allzTUxOL2dhNXp5dzI5K0J6ZHczL0pKN21tai94MEhWaWVk?=
 =?utf-8?B?eUJJbTB1dnBhTFR6V0ZLLzVKakdtNWg0SEJTYURkSnBlaVIwZG8yZnM2Q1Jl?=
 =?utf-8?B?Z05GbUUrV2lYU2FuNUIreDFZaFk1MEQ1ek1OT0lkQ2NYUG5GRnAyczhFb1dB?=
 =?utf-8?B?YWhKdGNIWmtKdWFRS21QenFTSkJoK3JFVWtLRW9HOVN0MlBxSFVUMDEzRkxV?=
 =?utf-8?B?aWNuQ3JwNVhXK25aaWZVUHNUSlUwUG5hQU9LSStlbGQwcTNPbVFXemUzOWdm?=
 =?utf-8?B?YnY0ZUlqMHZxOVBzTmRTRTJpSTVXTUJMbGw1Wit2UjkvUUN5N1NoNTlHRUJj?=
 =?utf-8?B?VjJzRVhHZmFQVHp5SFRLdWQ2eHFOQnNjbFhvQ0lCalc4cTNSMkhyUVFxREdj?=
 =?utf-8?B?N2dZd0I2MVpEZzBHYThHRGlVU1dkckFnOUlmTkNtWWlJdjZwTjV2dnE4SnBm?=
 =?utf-8?B?NXRQZmlOQjBlbWJiWEltc3R5SlNtQ0w1N2VJK29Fdk5Bbmg0cXZaMm9mbFBp?=
 =?utf-8?B?TlNJOFVpRW9TNS9PSFozcHRTUlQ0VXZMMDFjcFdseDZjMldBbUh6cHluTCs1?=
 =?utf-8?B?VlBCdjBXQko0dzJER2RrYkhLY0k0eE50M0JoSGRSbmlJNVRza3ZkNWprcGlQ?=
 =?utf-8?B?N2FjOWtuUGxlR21KOXJJMWNBSFBjaHpsek9mcDc0ZTNNbVhOdHZFb20xS3pI?=
 =?utf-8?B?UGEyWmEvYWNCbUZHMTFSRXpmM3EvTTE2S0kzd01VemMxeXJuMDlhY0VDdndF?=
 =?utf-8?B?SlFTT3Fjbm5KbG8zUE13cndBZmVzRE54bjZIUDhnU05zMUZaSHdEN3RtcW5Z?=
 =?utf-8?B?eXczK0FLQmorTVFVNGZpaFI4RHFEbUlnMTVldmZCcVB0eVhmTktQamFFVFFs?=
 =?utf-8?B?eFJWeU5pL0xPVVh4bTdrQno4cHVjcU9kcnBQdlJiOTU0RGx4VzIvbDNlSDFI?=
 =?utf-8?B?MFZvS0dyL2hUWUtQRkpzcFRuS0NwOEtwZjFHWXl4VHdiVGh5UXFzY05nZDVo?=
 =?utf-8?B?WWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 958bbb92-fedd-4281-a5f3-08dc298ccfec
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2024 16:33:14.2288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MKPzBahlunMlOMuq7Zlgl9HNDxvP1OLnl4ksh1xANQxyDntohbgZRUtUbd7EtX2ndGWcY/4kvpQMV4sf4iwAev1oSYYuSIt3PNvXqk3eU04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4531
X-OriginatorOrg: intel.com
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

Hello Harry,

On 08-11-2023 10:09 pm, Harry Wentland wrote:
> This series introduces support for
> * drm_colorop DRM objects
> * COLOR_PIPELINE plane property
> 
> Kernel changes:
> https://gitlab.freedesktop.org/hwentland/linux/-/merge_requests/5
> 
> It also adds a new kms_colorop test case that tests the color pipeline
> API. The tests are designed to be easily extensible with a "transform"
> and "compare" function pointer for each test. The "transform" function
> performs the transformations under test via SW routines. The "compare"
> function compares the DRM/KMS result (via a writeback connector) with
> the result derived via the SW "transform".
> 
> There are three tests for LUTs:
>   - plane-srgb_eotf: pre-blending sRGB EOTF
>   - plane-srgb_inv_eotf: pre-blending sRGB Inverse EOTF
>   - plane-srgb_eotf-srgb_inv_eotf: pre-blending sRGB EOTF,
>     followed by its inverse

We made few changes in kms_color & other places to support Intel plane 
color pipeline includes Custom 1D LUT (gamma & degamma) and CTM 3x3.

Hope you are fine if I float my changes along with your patches as a new 
rev of this series (This series also needs a rebase). So that it would 
be easy to review all IGT changes present in single series.

Basic changes are available at try-bot (still need some cleanup): [1]
Please let me know if you wanna suggest another way.

[1]: https://patchwork.freedesktop.org/series/128168/

- Bhanu

> 
> And a number of tests for matrices.
> 
> v3:
>   - Remove need for IOCTLs and libdrm changes
>   - Test colorop properties with both atomic and legacy code paths
>   - move enum drm_colorop_type to drm_mode.h
>   - Add descriptions for public functions in lib (Kamil)
>   - Use SPDX style license identifier (Kamil)
>   - Replace Skia license comment with copyright note in file header
>   - Fix kms_colorop subtests if applicable color pipeline not found
> 
> Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
> Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
> Cc: Simon Ser <contact@emersion.fr>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Jonas Ådahl <jadahl@redhat.com>
> Cc: Sebastian Wick <sebastian.wick@redhat.com>
> Cc: Shashank Sharma <shashank.sharma@amd.com>
> Cc: Alexander Goins <agoins@nvidia.com>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Michel Dänzer <mdaenzer@redhat.com>
> Cc: Aleix Pol <aleixpol@kde.org>
> Cc: Xaver Hugl <xaver.hugl@gmail.com>
> Cc: Victoria Brekenfeld <victoria@system76.com>
> Cc: Sima <daniel@ffwll.ch>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Naseer Ahmed <quic_naseer@quicinc.com>
> Cc: Christopher Braga <quic_cbraga@quicinc.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Arthur Grillo <arthurgrillo@riseup.net>
> Cc: Hector Martin <marcan@marcan.st>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Sasha McIntosh <sashamcintosh@google.com>
> 
> Harry Wentland (12):
>    lib/drmtest: Add is_vkms_device()
>    lib/igt_kms: Introduce DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE
>    include/drm-uapi: Add COLOROP object
>    lib/igt_kms: Introduce drm_colorop and COLOR_PIPELINE
>    tests/kms_properties: Add colorop properties test
>    igt/color: Add SW color transform functionality
>    lib/igt_fb: Add copy_fb function
>    tests/kms_colorop: Add kms_colorop tests
>    drm-uapi: Add 3x4 CTM
>    lib/igt_kms: Add support for DATA colorop property
>    lib/igt_color: Add support for 3x4 matrices
>    tests/kms_colorop: Add 3x4 CTM tests
> 
>   include/drm-uapi/drm.h      |  15 +
>   include/drm-uapi/drm_mode.h |  22 ++
>   lib/drmtest.c               |   5 +
>   lib/drmtest.h               |   1 +
>   lib/igt_color.c             | 344 +++++++++++++++++++++++
>   lib/igt_color.h             | 114 ++++++++
>   lib/igt_fb.c                |  40 ++-
>   lib/igt_fb.h                |   3 +
>   lib/igt_kms.c               | 306 +++++++++++++++++++-
>   lib/igt_kms.h               |  94 +++++++
>   lib/meson.build             |   1 +
>   tests/kms_colorop.c         | 539 ++++++++++++++++++++++++++++++++++++
>   tests/kms_colorop.h         | 124 +++++++++
>   tests/kms_properties.c      |  76 +++++
>   tests/meson.build           |   1 +
>   15 files changed, 1676 insertions(+), 9 deletions(-)
>   create mode 100644 lib/igt_color.c
>   create mode 100644 lib/igt_color.h
>   create mode 100644 tests/kms_colorop.c
>   create mode 100644 tests/kms_colorop.h
> 
> --
> 2.42.0
> 
