Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FDFCD6E4A
	for <igt-dev@archiver.kernel.org>; Wed,  3 Jun 2026 07:08:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E2610F93B;
	Wed,  3 Jun 2026 07:08:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GPMVDT7o";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DD8E10F93A
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Jun 2026 07:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780470513; x=1812006513;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=ec4LQIRY8xlr3I/D7RAdPdVy0OpC8y4soc4+zuS0xLc=;
 b=GPMVDT7odknKEsV+Xw6Px9HnVej3IYrVFpaWIsb/HRPd89Wstm/2QZor
 JNTrBiuBrHVh6vFpOxvn4rtvpFGGc2qvnoHoyBcSeCBMgJDopjNmkV2v7
 buT9S0z9EVvwAcAHaDNWOQ6iBa175OaZbsBPDvzui+jgCSUhwfyEl45AK
 P1RZNjlJguwyK2TFyjbL6sfG/p0FQJGVU6y/JogJwGzPpfLrRhMC1yGaU
 uOO1UmsbvHhg6Ys6DDDYrmO8YjxGWIp+3JFUFmvTdcc79qQyO/3jpNHss
 v0pL03ZL3EqjYiMV/PvzColkkvg2FHKSpVpGymbb+tmG0/AF5vF7QNqKM Q==;
X-CSE-ConnectionGUID: eumYRN0BQJuOXW69gQUwEg==
X-CSE-MsgGUID: 8V4L+LepQnq0iXDohLhrhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="91953925"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; d="scan'208,217";a="91953925"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 00:08:33 -0700
X-CSE-ConnectionGUID: nz+T2ZyASoW4Xuj4mnRCVg==
X-CSE-MsgGUID: Bs07w1vwSnuSu8yZgg2Bxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
 d="scan'208,217";a="239680575"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 00:08:33 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:08:32 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 00:08:32 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.54) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 00:08:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GH9PUNrcWG3rwyu4WekEPiYAd9b0/4zXhzKf+BXlAWc0HRz/TJIyNdfvCegq7gqGEFyOdzrWaR3R2eCsdpWnpJ+egF0pBA3s4DDO1Pb6FV+EaRIKYDLR4tySEasS+QwXxmnqStd1xBQS2DVnU7qKRde79xh2hndbekJh18qWfiSdmZKYVGAKsMOAOqKTJYCIPWbMgHR+iuEZgz7R5YsQFI4pdZ8HYUoiCAhfOglzgl8e4WYjkmPWklgbsEwS1sR7n8p5JpR2/alTrxx6mSbcI6L/6B2S4+rRcLPbueDR6lzBVc83WGitaKzVUFLJk7J1V+5tvlp76Ri54ldk3+7X7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LpuESfc49sHRMj+yKvxJfmZqkZ9GsGADG/IJkccY9PA=;
 b=pt1Kg1qQt72wnfl8maG3sXjA7WppjvaGnN48wK5kfDbe+EHBqebsj1Q7JGfg21FexVl/pbMf02fSfHaLjzrYIZfRcu3bEkipH8s0aqHwh4vCQetCR4W9AWmbklGRY5+3UYA/cAXzQozw9bA4gW1zHl6nIepPZoowMnLwcMPFe62sk/i5Uq5ZxsVVdFzIzHnEtweLLiHNzD150lEeqlLtNt361kHwNtGFIQl7Q37U2EUbqbl+2ECmrgb22Aqu05SKNZJIA7nh7zR78ip7dZFhgPKc1mT7UtvpTo4IGuQsGbbEq9rMemIrqQIRheSVZv11z/QKVZgJboH3T0evh+CuDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 07:08:29 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.21.0071.011; Wed, 3 Jun 2026
 07:08:28 +0000
Content-Type: multipart/alternative;
 boundary="------------3CVR81zrizylyXDnS14QQsI3"
Message-ID: <2d8a5e5c-0d23-4fab-8113-139bdeaca5a4@intel.com>
Date: Wed, 3 Jun 2026 12:38:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 2/2] tests/kms_color: Add multi-format coverage
 for pipe color tests
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <karthik.b.s@intel.com>, <sameer.lattannavar@intel.com>
References: <20260601082410.798948-1-pranay.samala@intel.com>
 <20260601082410.798948-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20260601082410.798948-3-pranay.samala@intel.com>
X-ClientProxiedBy: MA5P287CA0048.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::14) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: aa1bb0b3-466f-4438-ffc7-08dec13ee968
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|3023799007|4143699003|18002099003|22082099003|56012099006|11063799006|8096899003;
X-Microsoft-Antispam-Message-Info: +pVs3bbmeIHh7NTLE9KlsACkmYI+JvsxaJuxTYN93f71/4R7AmGNdGxVdsylIC4GIw64hBFszbbwF24rshgzi7nxiDB3Z4jlGswrbh/yjeN/0qrKiScyhqyS3Xu+FR4aUKyzYHO939IlzN69LlJcr3uvfLFO9hWgQW9vYKUO36ZEKROKly2sF+NxNcnM/JRY3hOi9q6LBz3WaRlQ2ix+hlcImjyFyEWjGX3XcBUovxPrO1RIVj0O9gwFzwQ3jAbAMVHwt7B/KbnpYxRG4ZpqXmLUuwMvDttWqRSzAehe9U6KYWhIrxDk9qs1GbKOJ6TMDWHWnQDZDs6FkxGpfnvuiTcpjUvW6X6bEC/EhdcZsntQh7hbl+cm/hEL//L8qnzDBZNgRcil801N+t7C/TMQNR6xRTZ3NTzfgjlFdZbeH4zYbfiB+5yzZvA9/+j1QX1mOyGpFt7JfEwcRaP7nGx+L41t6Ft+2+Z16m/PubXRJbS8dUjGB8YCMy2vrTyAdT08z/5jX2vQ4/YvfhiMVYLJ7dUwKBkgmjcjOO3DcheEAA8EKylFvMbZ06Ml4oadxaCyXuBXxXycEejWN+QOQvxLEuv7uxRy0hbMp9DGuyxr6ONVHDRMUOOTjHyZO+AfS6rMNcTSVRao3BEkIywGYu/IYI0SJcMlzzvfXBtxyG9fwUZteEvfQxed1oc1hMtTgPXo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(3023799007)(4143699003)(18002099003)(22082099003)(56012099006)(11063799006)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUlBRUNFL295Zy9YajFrVGFtWXNQdnlCQ0RJU3NKY0d5Vkx4dG5OQ0NmVTZX?=
 =?utf-8?B?SVZsazZ4bDZ6L3VRV1JnNzN2dmdBNTlqYjR5ak4rN3lOQmhjTnV0dHR5dXFr?=
 =?utf-8?B?cE1iNnVXRXB3SGZmbmpnUllVYmZkOHJTMW82S0h6ejNwY0VFTnlGWU1OVEJO?=
 =?utf-8?B?a0plTWxoSnM2MCtPN3hiQVU4bzFkUmF2L0xZTVVTNUNLMUJ1ak9zZysyenRH?=
 =?utf-8?B?WldoRHFEb1BqZkZsUmh5Q2Jtc2w0akVRbVUrTXQya3dqVElPTm4yVnVHSGNr?=
 =?utf-8?B?UGdjcStjRnlEMW1LdEhYNENKWTlmWHNSNU9KSHBzWDd1Z0tSUitEWG5USTB0?=
 =?utf-8?B?VndRSGhCWDhsVWV5R1ZBb054Y25QT2xEanhrTGt1THJxU1B4Zms4bWhyaUtw?=
 =?utf-8?B?WGUwMUV3NWQ1S1p1eTIyTVFlSEZKb0Zqc1FMWWlYa0xpQnBTK3V5QXg4SUdk?=
 =?utf-8?B?c1NiY0ZwQVd5T3ZzeDF3NjI3NWVxQXp6L0FHZDMxYnd2OXZyYkJZcmdWb1pC?=
 =?utf-8?B?TzNPTWtjeHYzV0ZYSjhxR2lGU0N5Tm5tTHBiZEpCb1F6VjVOYmpuaWQzT3Ax?=
 =?utf-8?B?ZFpZaDFTVjJ1S0F1SVFkMmdKVWpyMHk1MnhQWHVSb2tKWUFGN0UyRW4vRnFh?=
 =?utf-8?B?SWh3TjFNYUozUU5ndnk0NWJ4ZFQzbnFzRVBtUGxabWo0S2lZVjlKUmF1bS96?=
 =?utf-8?B?MzBYNXB4emJvSlFlSndSM1BKL21FekJCaEtabGVlek1LTENUcloya3ZrZEpT?=
 =?utf-8?B?MmVoL1E3dUExT1dEc0pYUHRDbW9MRVg1eUhVOEM0Q2dmakp4Y2lRUkg3Wlk3?=
 =?utf-8?B?QW0vRWNXVGM3cTE2bGJKNGZkTlBzeklqMkU3RWhOWU5DandKM0ZZbEMrZFdT?=
 =?utf-8?B?YVpNazBxWENxMzJiNlBYcjlMZ1BKejBZQlJNLzZ4ZWU4c2lqZC9qVktkdS9l?=
 =?utf-8?B?K0o3c1BVMldPdng1VlVSTGIzZzljRXlZb0tTeVJLTlAxZWpWUTIveDZaV3dY?=
 =?utf-8?B?dEtRWHJJRk5SaXo0MjNtdG5IeTJ1dTVzNWdyMGlBZjNzMkZaeU11TjZBQVdp?=
 =?utf-8?B?Ny9ZZ0JHWFlURjlNZmFUUUI3REExNllaL1VYWU04L1JRRnRHZGtla1EySmF5?=
 =?utf-8?B?aGkyOWFWeG1NYU0xZzE3dUlKTExtNkNjU1BHR21QbXRabFUxaDYvYXJKRVhP?=
 =?utf-8?B?R2VCaTV1SWtoa0tKSG5Sa0FlNCtqdFc0emFFUlZGSnNNNHNYRFU4REI3R05o?=
 =?utf-8?B?QkhQeHhldUdXRWNJYlU2TUtRSDZKaG9lQTlMeFZUQVl5NlZRWXMxT21FWGcw?=
 =?utf-8?B?b3ZzQjlWejdKRzdBeUVpQm9lUEpheE5QVlJqYU1RcHJ5dzUzVnR0S1ZyV2c2?=
 =?utf-8?B?YndXSVpCVmpqM0lXMTNsUW5SRVJzYVpGUXBRUnlCcGh5Sk5pZFlZZUh3b2xk?=
 =?utf-8?B?NkVVYTRKRDhrZ081OHJWR3lFcG9QTUtzTlFsZ3lqUVR1cjM1YkxhdjFTZmVX?=
 =?utf-8?B?d1lpVDdjMUp0NTRCY0FXWUY5WHFRcXBKd29iOHlFK1NHcmxFLzloZWltaFRs?=
 =?utf-8?B?NG5EamN6b24rRVhHczNrazF4TXRYL3Nic1VTTU44d2dqMVlVSkRIYzRQV0dR?=
 =?utf-8?B?Vmx2VlYzL0htMEU3Sm1YZnp2amQ1Ty93ZFNRVkQyaXlOcjFYaVBKQXdBR1Fa?=
 =?utf-8?B?RlRYRGxqZ2pkdmJlQnVXUVFlSjRjN0R5enpmU0ZDWDdEZ2ZsekJrb0hzamtD?=
 =?utf-8?B?cUlSYy9HMnJnQ1pzSTAzSllNaWl0U2wyZmt3ZXN2S2pRd2xpb0hDa3NkclYw?=
 =?utf-8?B?OWhpVllTdkxkNVowTm9sRVBFczJiRDNJeWNTZ0h5WjZ2MW96WDIwcUwwQ2sx?=
 =?utf-8?B?VjFUWmJkSHVQYXVBeXZzeUpkbHlubzl4YU1KME9FaHRncnNDd1ZBRmY1Y3lK?=
 =?utf-8?B?OWdZZmRQZnZMY0hHSGJ5eE01cEEzQzZQRlJjNlpnQ25WYjVWd3RaRDNqclR1?=
 =?utf-8?B?RTdWZGRMNEMxTGd4b25YV0c3bnlvdTQ0NnFEUEdFeGhvYjlMY25PZlBBZytn?=
 =?utf-8?B?MmJjSDVqSWVRRElwRXBQSkZicTdGZzN6UnYrOXNqbmwwek1Ed013OHFhNEZH?=
 =?utf-8?B?aDEwRk16R3o2U3gyWTZ6UHZlN3p4M2cyekNwK3Z0Rkl3R2lLSytjMGZhdzc3?=
 =?utf-8?B?ZmhBbnY4U1d4QU80SUNqeEJ0cWtVZk9odlVqcHcrbktkaHhyYmRiSlUreTdx?=
 =?utf-8?B?WHRoaG1vZTNtZ3dXQkpTVlI4N3BqOWFSTU5JVDFOTmZNSGk5T09VRUplazRn?=
 =?utf-8?B?Ym1kNFZlYjJJSUhJWFZFeTdJeFJieXVRRERLSy9JK3ZFMnY0QnV5WU1WanZp?=
 =?utf-8?Q?fX2FSda4R6WAb2zU=3D?=
X-Exchange-RoutingPolicyChecked: WRaNhTL5exR3MBM1TC27XA4X6G2mqrVB9fYREsu9sJSy0E33U8GpAsMAbyq2Vq3W4OLxb7evOnPe8k5xxzjofmJnk6kHYYwcfcEBZk5s8+/DFnzOdt5ijx0hq+bpDeqW9tu8bRWnIXk3NE68zRpfeLyIvx8P4jUovAzvi45pSfx4vKoT7lVZwonqSYbUZFznGmHP2EFty6O6qkZngxneIBJcrOR++eG7BKlI9l6YhL5Ee/QYvNu6LZOwDSaBNBsv1ayk81a+/tdKylsE9iwXXVpVool2SEt3WmOxmUODcZHHa0SbJl1Cv5iaTBWSm14EvlUreH4DIjKxXEe0dowE+w==
X-MS-Exchange-CrossTenant-Network-Message-Id: aa1bb0b3-466f-4438-ffc7-08dec13ee968
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 07:08:28.2510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wQ5TW1El8ZWAgtn1CvE4xz5mhjMVuPLFAcPChjcqR7TPfgfi0QC+w/hObWYbD5HJqgonmy1N8TN8abH+y30OCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
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

--------------3CVR81zrizylyXDnS14QQsI3
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Pranay

On 01-06-2026 01:54 pm, Pranay Samala wrote:
> Extend kms_color tests to run across multiple pixel formats at dynamic
> subtest level instead of being limited to single format for gamma/degamma
> and CTM tests.
> For platforms where only a single format is relevant (e.g. 10-bit
> paths), limit the iteration accordingly to avoid redundant testing.
>
> This improves coverage for format-dependent pipe color pipeline
> behavior.
>
> v2:
> - Add DRM_FORMAT_P010 format
>
> v4:
> - Split the patches (Swati)
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_color.c | 97 +++++++++++++++++++++++++++++++----------------
>   1 file changed, 64 insertions(+), 33 deletions(-)
>
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 146181fbb..b0adcd221 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -78,6 +78,16 @@
>   
>   IGT_TEST_DESCRIPTION("Test Color Features at Pipe level");
>   
> +static const struct {
> +	const char *name;
> +	uint32_t format;
> +} formats[] = {
> +	{ "RGB", DRM_FORMAT_XRGB8888 },
> +	{ "YUYV", DRM_FORMAT_YUYV },
> +	{ "NV12", DRM_FORMAT_NV12 },
> +	{ "P010", DRM_FORMAT_P010 },
> +};
> +
>   static bool test_pipe_degamma(data_t *data,
>   			      igt_plane_t *primary)
>   {
> @@ -791,12 +801,23 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   	 * for CRC checks with framebuffer references.
>   	 */
>   	data->color_depth = 8;
> -	data->drm_format = DRM_FORMAT_XRGB8888;
>   	data->mode = igt_output_get_mode(data->output);
>   
>   	igt_require(crtc_output_combo_valid(data, crtc));
>   
> -	igt_assert(test_t(data, data->primary));
> +	for (int i = 0; i < ARRAY_SIZE(formats); i++) {
> +		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
> +			      igt_output_name(data->output),
> +			      formats[i].name) {
> +			if (!igt_plane_has_format_mod(data->primary, formats[i].format,
> +						      DRM_FORMAT_MOD_LINEAR))
This check should come before entering dynamic - unsupported formats 
should not appear.
> +				continue;
> +			igt_info("Running on " IGT_FORMAT_FMT " format\n",
> +				 IGT_FORMAT_ARGS(formats[i].format));
> +			data->drm_format = formats[i].format;
> +			igt_assert(test_t(data, data->primary));
> +		}
> +	}
>   
>   	test_cleanup(data);
>   }
> @@ -816,10 +837,10 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   		       const double *ctm,
>   		       int iter)
>   {
> -	bool success = false;
> +	bool success;
>   	bool depth_10bit = false;
>   	double delta;
> -	int i;
> +	int i, n_formats;
>   
>   	test_setup(data, crtc);
>   
> @@ -833,7 +854,6 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   	 */
>   	data->color_depth = depth_10bit ? 10 : 8;
>   	delta = 1.0 / (1 << data->color_depth);
> -	data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
>   	data->mode = igt_output_get_mode(data->output);
>   
>   	igt_require(crtc_output_combo_valid(data, crtc));
> @@ -847,24 +867,39 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
>   	 * get clamped or rounded values and we also need to account
>   	 * for odd number of items in the LUTs.
>   	 */
> -	for (i = 0; i < iter; i++) {
> -		color_t expected_colors[3] = {
> -			fb_colors[0],
> -			fb_colors[1],
> -			fb_colors[2],
> -		};
> -
> -		transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
> -		transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
> -		transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
> -
> -		if (test_pipe_ctm(data, data->primary, fb_colors,
> -				  expected_colors, ctm)) {
> -			success = true;
> -			break;
> +	n_formats = depth_10bit ? 1 : ARRAY_SIZE(formats);
> +
> +	for (int fi = 0; fi < n_formats; fi++) {
> +		igt_dynamic_f("pipe-%s-%s-%s", igt_crtc_name(crtc),
> +			      igt_output_name(data->output),
> +			      depth_10bit ? "XRGB2101010" : formats[fi].name) {
Instead of this should we consider 10bit YUV formats. P010 is 10bit. We 
can have something like static const struct { const char *name; uint32_t 
format; int bpc; } formats[] = { { "XRGB8888", DRM_FORMAT_XRGB8888, 8 }, 
{ "YUYV", DRM_FORMAT_YUYV, 8 }, { "NV12", DRM_FORMAT_NV12, 8 }, { 
"XRGB2101010", DRM_FORMAT_XRGB2101010, 10 }, { "P010", DRM_FORMAT_P010, 
10 }, }; and can have single loop for ctm with initial check if 
(formats[fi].bpc != data->color_depth) continue;

> +			success = false;
> +			data->drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 :
> +							formats[fi].format;
> +
> +			if (!igt_plane_has_format_mod(data->primary, data->drm_format,
> +						      DRM_FORMAT_MOD_LINEAR))
> +				continue;
> +			for (i = 0; i < iter; i++) {
> +				color_t expected_colors[3] = {
> +					fb_colors[0],
> +					fb_colors[1],
> +					fb_colors[2],
> +				};
> +
> +				transform_color(&expected_colors[0], ctm, delta * (i - (iter / 2)));
> +				transform_color(&expected_colors[1], ctm, delta * (i - (iter / 2)));
> +				transform_color(&expected_colors[2], ctm, delta * (i - (iter / 2)));
> +
> +				if (test_pipe_ctm(data, data->primary, fb_colors,
> +						  expected_colors, ctm)) {
> +					success = true;
> +					break;
> +				}
> +			}
> +			igt_assert(success);
>   		}
>   	}
> -	igt_assert(success);
>   
>   	test_cleanup(data);
>   }
> @@ -1158,11 +1193,9 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", gamma_degamma_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", gamma_degamma_tests[i].name) {
>   			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> -				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> -					      igt_output_name(data->output))
> -					run_gamma_degamma_tests_for_crtc(data,
> -									 crtc,
> -									 gamma_degamma_tests[i].test_t);
> +				run_gamma_degamma_tests_for_crtc(data,
> +								 crtc,
> +								 gamma_degamma_tests[i].test_t);

test_pipe_legacy_gamma hardcodes DRM_FORMAT_XRGB8888 (from Patch 1).

But the format loop creates dynamic subtests like 
legacy-gamma@pipe-A-eDP-1-NV12 that always run with XRGB8888 internally.

>   			}
>   		}
>   	}
> @@ -1171,13 +1204,11 @@ run_tests_for_pipe(data_t *data)
>   		igt_describe_f("%s", ctm_tests[i].desc);
>   		igt_subtest_with_dynamic_f("%s", ctm_tests[i].name) {
>   			for_each_crtc_with_valid_output(&data->display, crtc, data->output) {
> -				igt_dynamic_f("pipe-%s-%s", igt_crtc_name(crtc),
> -					      igt_output_name(data->output))
> -					run_ctm_tests_for_crtc(data,
> -							       crtc,
> -							       ctm_tests[i].fb_colors,
> -							       ctm_tests[i].ctm,
> -							       ctm_tests[i].iter);
> +				run_ctm_tests_for_crtc(data,
> +						       crtc,
> +						       ctm_tests[i].fb_colors,
> +						       ctm_tests[i].ctm,
> +						       ctm_tests[i].iter);
>   				if (igt_run_in_simulation())
>   					break;
>   			}
--------------3CVR81zrizylyXDnS14QQsI3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Pranay</p>
    <div class="moz-cite-prefix">On 01-06-2026 01:54 pm, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260601082410.798948-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">Extend kms_color tests to run across multiple pixel formats at dynamic
subtest level instead of being limited to single format for gamma/degamma
and CTM tests.
For platforms where only a single format is relevant (e.g. 10-bit
paths), limit the iteration accordingly to avoid redundant testing.

This improves coverage for format-dependent pipe color pipeline
behavior.

v2:
- Add DRM_FORMAT_P010 format

v4:
- Split the patches (Swati)

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_color.c | 97 +++++++++++++++++++++++++++++++----------------
 1 file changed, 64 insertions(+), 33 deletions(-)

diff --git a/tests/kms_color.c b/tests/kms_color.c
index 146181fbb..b0adcd221 100644
--- a/tests/kms_color.c
+++ b/tests/kms_color.c
@@ -78,6 +78,16 @@
 
 IGT_TEST_DESCRIPTION(&quot;Test Color Features at Pipe level&quot;);
 
+static const struct {
+	const char *name;
+	uint32_t format;
+} formats[] = {
+	{ &quot;RGB&quot;, DRM_FORMAT_XRGB8888 },
+	{ &quot;YUYV&quot;, DRM_FORMAT_YUYV },
+	{ &quot;NV12&quot;, DRM_FORMAT_NV12 },
+	{ &quot;P010&quot;, DRM_FORMAT_P010 },
+};
+
 static bool test_pipe_degamma(data_t *data,
 			      igt_plane_t *primary)
 {
@@ -791,12 +801,23 @@ run_gamma_degamma_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 * for CRC checks with framebuffer references.
 	 */
 	data-&gt;color_depth = 8;
-	data-&gt;drm_format = DRM_FORMAT_XRGB8888;
 	data-&gt;mode = igt_output_get_mode(data-&gt;output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
 
-	igt_assert(test_t(data, data-&gt;primary));
+	for (int i = 0; i &lt; ARRAY_SIZE(formats); i++) {
+		igt_dynamic_f(&quot;pipe-%s-%s-%s&quot;, igt_crtc_name(crtc),
+			      igt_output_name(data-&gt;output),
+			      formats[i].name) {
+			if (!igt_plane_has_format_mod(data-&gt;primary, formats[i].format,
+						      DRM_FORMAT_MOD_LINEAR))</pre>
    </blockquote>
    <font face="Helvetica, Arial, sans-serif" size="2">This check should
      come before entering dynamic - unsupported formats should not
      appear.</font>
    <blockquote type="cite" cite="mid:20260601082410.798948-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
+				continue;
+			igt_info(&quot;Running on &quot; IGT_FORMAT_FMT &quot; format\n&quot;,
+				 IGT_FORMAT_ARGS(formats[i].format));
+			data-&gt;drm_format = formats[i].format;
+			igt_assert(test_t(data, data-&gt;primary));
+		}
+	}
 
 	test_cleanup(data);
 }
@@ -816,10 +837,10 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 		       const double *ctm,
 		       int iter)
 {
-	bool success = false;
+	bool success;
 	bool depth_10bit = false;
 	double delta;
-	int i;
+	int i, n_formats;
 
 	test_setup(data, crtc);
 
@@ -833,7 +854,6 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 */
 	data-&gt;color_depth = depth_10bit ? 10 : 8;
 	delta = 1.0 / (1 &lt;&lt; data-&gt;color_depth);
-	data-&gt;drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 : DRM_FORMAT_XRGB8888;
 	data-&gt;mode = igt_output_get_mode(data-&gt;output);
 
 	igt_require(crtc_output_combo_valid(data, crtc));
@@ -847,24 +867,39 @@ run_ctm_tests_for_crtc(data_t *data, igt_crtc_t *crtc,
 	 * get clamped or rounded values and we also need to account
 	 * for odd number of items in the LUTs.
 	 */
-	for (i = 0; i &lt; iter; i++) {
-		color_t expected_colors[3] = {
-			fb_colors[0],
-			fb_colors[1],
-			fb_colors[2],
-		};
-
-		transform_color(&amp;expected_colors[0], ctm, delta * (i - (iter / 2)));
-		transform_color(&amp;expected_colors[1], ctm, delta * (i - (iter / 2)));
-		transform_color(&amp;expected_colors[2], ctm, delta * (i - (iter / 2)));
-
-		if (test_pipe_ctm(data, data-&gt;primary, fb_colors,
-				  expected_colors, ctm)) {
-			success = true;
-			break;
+	n_formats = depth_10bit ? 1 : ARRAY_SIZE(formats);
+
+	for (int fi = 0; fi &lt; n_formats; fi++) {
+		igt_dynamic_f(&quot;pipe-%s-%s-%s&quot;, igt_crtc_name(crtc),
+			      igt_output_name(data-&gt;output),
+			      depth_10bit ? &quot;XRGB2101010&quot; : formats[fi].name) {</pre>
    </blockquote>
    <div style="color: rgb(59, 59, 59); background-color: rgb(255, 255, 255); font-weight: normal; font-size: 14px; line-height: 20px; white-space: pre;"><font color="#000000" face="Helvetica, Arial, sans-serif">Instead of this should we consider 10bit YUV formats. P010 is 10bit. We can have something like
static const struct {
    const char *name;
    uint32_t format;
    int bpc;
} formats[] = {
    { &quot;XRGB8888&quot;,    DRM_FORMAT_XRGB8888,    8 },
    { &quot;YUYV&quot;,        DRM_FORMAT_YUYV,         8 },
    { &quot;NV12&quot;,        DRM_FORMAT_NV12,         8 },
    { &quot;XRGB2101010&quot;, DRM_FORMAT_XRGB2101010, 10 },
    { &quot;P010&quot;,        DRM_FORMAT_P010,        10 },
};

and can have single loop for ctm with initial check 
if (formats[fi].bpc != data-&gt;color_depth)
        continue;</font></div>
    <br>
    <blockquote type="cite" cite="mid:20260601082410.798948-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
+			success = false;
+			data-&gt;drm_format = depth_10bit ? DRM_FORMAT_XRGB2101010 :
+							formats[fi].format;
+
+			if (!igt_plane_has_format_mod(data-&gt;primary, data-&gt;drm_format,
+						      DRM_FORMAT_MOD_LINEAR))
+				continue;
+			for (i = 0; i &lt; iter; i++) {
+				color_t expected_colors[3] = {
+					fb_colors[0],
+					fb_colors[1],
+					fb_colors[2],
+				};
+
+				transform_color(&amp;expected_colors[0], ctm, delta * (i - (iter / 2)));
+				transform_color(&amp;expected_colors[1], ctm, delta * (i - (iter / 2)));
+				transform_color(&amp;expected_colors[2], ctm, delta * (i - (iter / 2)));
+
+				if (test_pipe_ctm(data, data-&gt;primary, fb_colors,
+						  expected_colors, ctm)) {
+					success = true;
+					break;
+				}
+			}
+			igt_assert(success);
 		}
 	}
-	igt_assert(success);
 
 	test_cleanup(data);
 }
@@ -1158,11 +1193,9 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f(&quot;%s&quot;, gamma_degamma_tests[i].desc);
 		igt_subtest_with_dynamic_f(&quot;%s&quot;, gamma_degamma_tests[i].name) {
 			for_each_crtc_with_valid_output(&amp;data-&gt;display, crtc, data-&gt;output) {
-				igt_dynamic_f(&quot;pipe-%s-%s&quot;, igt_crtc_name(crtc),
-					      igt_output_name(data-&gt;output))
-					run_gamma_degamma_tests_for_crtc(data,
-									 crtc,
-									 gamma_degamma_tests[i].test_t);
+				run_gamma_degamma_tests_for_crtc(data,
+								 crtc,
+								 gamma_degamma_tests[i].test_t);</pre>
    </blockquote>
    <p>test_pipe_legacy_gamma hardcodes DRM_FORMAT_XRGB8888 (from Patch
      1).&nbsp;</p>
    <p>But the format loop creates dynamic subtests like
      legacy-gamma@pipe-A-eDP-1-NV12 that always run with XRGB8888
      internally.</p>
    <blockquote type="cite" cite="mid:20260601082410.798948-3-pranay.samala@intel.com">
      <pre wrap="" class="moz-quote-pre">
 			}
 		}
 	}
@@ -1171,13 +1204,11 @@ run_tests_for_pipe(data_t *data)
 		igt_describe_f(&quot;%s&quot;, ctm_tests[i].desc);
 		igt_subtest_with_dynamic_f(&quot;%s&quot;, ctm_tests[i].name) {
 			for_each_crtc_with_valid_output(&amp;data-&gt;display, crtc, data-&gt;output) {
-				igt_dynamic_f(&quot;pipe-%s-%s&quot;, igt_crtc_name(crtc),
-					      igt_output_name(data-&gt;output))
-					run_ctm_tests_for_crtc(data,
-							       crtc,
-							       ctm_tests[i].fb_colors,
-							       ctm_tests[i].ctm,
-							       ctm_tests[i].iter);
+				run_ctm_tests_for_crtc(data,
+						       crtc,
+						       ctm_tests[i].fb_colors,
+						       ctm_tests[i].ctm,
+						       ctm_tests[i].iter);
 				if (igt_run_in_simulation())
 					break;
 			}
</pre>
    </blockquote>
  </body>
</html>

--------------3CVR81zrizylyXDnS14QQsI3--
