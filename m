Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42091C61DB9
	for <igt-dev@archiver.kernel.org>; Fri, 28 Aug 2026 10:05:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82DA10E4AC;
	Fri, 28 Aug 2026 10:05:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OrpNdIOk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120E310E4AC
 for <igt-dev@lists.freedesktop.org>; Fri, 28 Aug 2026 10:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1787911479; x=1819447479;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YpwYg3NxN8YG05wdSvyG5r5/ftr+hvItcmNmdSz5/W8=;
 b=OrpNdIOkjoFxBpau76UyDfcIio6aBSgUJkwaogK3YPWpn2JXcLZ+BEAk
 +w/odCGvBrUYx/zbbCbtYwgw+EVAjzllM6ZsR6/RErAW6aw2kq6BtOt6N
 tmnFPwsuyO8fe4e8J41gHDpCXBzwH7xvHdE8/m/4NsQ1Ew9I+J/76jtRD
 Y1euuu5Mb+UYEkN2aObr+KXWft7AB6UvAWEqSKu+qde4F0TZv0cCc7Ouo
 Hv8QaGLqbLzD0tecDlOd7nSezQCu7Y8N+FUJK+I55nKGsMLTLHFXtQaMN
 HMA0tmCiDdmNfjclcSSkuJ6B9EgP0jGrvjLDhFRN/+3zEHiMvEVy6ysAz w==;
X-CSE-ConnectionGUID: OL3igcxNR2W5wZTxTZwd2w==
X-CSE-MsgGUID: d5wmMhCfTTy/CarTrjf+fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="105791738"
X-IronPort-AV: E=Sophos;i="6.25,248,1779174000"; d="scan'208";a="105791738"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:04:38 -0700
X-CSE-ConnectionGUID: 0CMwO1JXSLqpscVjfu2LIA==
X-CSE-MsgGUID: E7BCmXYiSA2GPIx+PNYNiw==
X-ExtLoop1: 1
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2026 03:04:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:04:37 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 28 Aug 2026 03:04:37 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 28 Aug 2026 03:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o8ya3Zg7clhtHFknHv45999CgmWXsQPLMhmJYTBK0/rpVQbbf7di+rR3ddfT+0p/Cek/R0wvT7lNY+Tu85EJyBEj/MaZvJ3wF5WpGrk40j0H5ygwLn/3ngNne2jg0v1QQmkFob8ipXqf/oEawfx2sEzxAQnclFgab4VND3GIPnvdm7J/Fv56WcZsP5CEqicPGUpoWyWMFyIJrzncYElXDN0/h2vfSi/iyPrT3quxi2JFR+ZNuY5QWgPmmT4ESY+047W+kAmHwh9YTNs7WRX9pAKMWrngwpk243U6G0mAHvroqFcdwrR/Ju1tDl3dTqIxX/CrbhPcROf55f9WKsWYtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LIq+B6F30sNtPK2z84mqMG404CdRTx/4PnBaJzBfljs=;
 b=MtkpMSHFgayjYwzmnr6fa27obyrTdClgrJt7waXk/HeoMIUqkyy7dWfW+AVddrRTSKlTLhg64jkVN4zEKLA7AIOTsGUpOBtOfXk7zFfE6I9CrZujJv/MM+aaooK/U3+prdFYcvbHlofIXf+h7SGJDsk2erO1rd1qJW67DOhi4h0PSGYqRYXSvfcTa3AP/nfUeowgpzih7/OpSNE5hOc8puGJIZf5d6D5zuCVNIQ2VjpV3aHv3EQIv7P5839U/qRqmrW34eoY8y6o6rp6waCKk7gvqyL22JSI9em0gxYQ6ESBBiB1Wb7vKY6fjBw+dXkMAhlcVVYtBVJYD6zBDTHV1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Fri, 28 Aug
 2026 10:04:35 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0360.008; Fri, 28 Aug 2026
 10:04:34 +0000
Message-ID: <a45a1a06-36e0-4d66-99ce-3d558ecd14e9@intel.com>
Date: Fri, 28 Aug 2026 15:34:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/kms_colorop: Use local variable for color pipeline
 cap
To: Alex Hung <alex.hung@amd.com>, "Sharma, Swati2" <swati2.sharma@intel.com>, 
 <igt-dev@lists.freedesktop.org>
CC: Harry Wentland <harry.wentland@amd.com>
References: <20260803080340.2088027-1-chaitanya.kumar.borah@intel.com>
 <31a2d660-7968-47e5-ad3c-e32dac8c1a36@intel.com>
 <bd02d25f-fb9b-4f38-b189-0449af5ff897@amd.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <bd02d25f-fb9b-4f38-b189-0449af5ff897@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0212.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::9) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: a4b98166-e016-4ff6-b25b-08df04ebc2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Y/Rgl5+8Iy5x5BBjYKS4nnJTVYj9MEifmg7I+8Alfmwpv8v45RwuABHLFRM92nV6wlsnfwVhYUTYLHoe87KujhJqVHbXpYd3nb3sRnfMArrxlfqHphjSfRpbbOgnJnRMo1GoCvargU/UepmMTGfCK95Aju49NR3tBbLQbzKBG8e01/wBTZvGjuylfOtIDWuMsvf9pDgtaYop2GRUPpxWbQIx5Ev9Z0UoedLOHPfCswzT/S4137eXfpU8ipbYLqw68ZLHGIP/JWM0yLUeX7eJ7y0ph8+TQEzw1fOOk8OGs3akDO4ijcTXwT8L0edy3ygdFhrcx8P3a+MXKjy+qK2ze0hSs46n5Rm7Rx/R1HoeA9Ro9eU/RiL4j9R/4O6u/VOF71vhoBsAbAk2nYXViLr+FdniR9OrN8QPLoeTV/lhvhywk0EoeZKTuiX1lN93anln1+tffRUEKr/+mHfwJhauaRGqRDFDme44JfdRu+9C3ytjPr/OxOuzpYhtVb3KXHjnFKCQGi4rKRhC+1aoGlYy4A+qDPIN7aOr/5zm2Bkv4jXzA+6jgpc9DXSVBbj7ZEQJe1Bvd5zCjmCSuXXKkhH+nf3IN1PbiGSeGAw66OAi2ZNEyHSTudDFB1N1qbbsDJUGDitarWqhKzqJocTa8Uzpuoezmnw9iHLwoyMVhqRBOZg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cm9VMWNtUzN5UG9iaVBUZDljNVpWR04rOVFuQ0ZtVnhUZGh6M2hkclJKdVFl?=
 =?utf-8?B?a01yNTRaY0dkSkpxb05xWHVOYXY5bm9GekZxcjZiWlJhcktac20rSS9GMHpI?=
 =?utf-8?B?R3FOajN2MVBDYXhKRHRtRDFzVzBCTmNEc0tOZmJ0SVgyajVOSGYwMkJwVDhP?=
 =?utf-8?B?bXhPdU9XeVR6Vlc5MGlYUXdtRWQxUWhZTk1SZW1RSm9rRGduQkhyOXFldWFp?=
 =?utf-8?B?R1pjQlV6Zm5sNkw0WDAwMUtLcFNxTzNLSUtrdnU3UXhlTWROOFB5VVFyTXhF?=
 =?utf-8?B?NXZITDlVVWl4T3Y3MytsWFcyYnU4VTRCVUtzVHYwUHNsU1Vja2wvOVlSMHFM?=
 =?utf-8?B?Q1VGOENqeStmWW5VWkh1eHQ0SU9PQnhlZHM5bXU5WVdKOXRpNFN0R1pwSVZZ?=
 =?utf-8?B?cGhnYWlLMFAwdmw4WXZpa0x3T1BQZ1dZUkJjcFREbUMwc0hxN2tiS25Fdmpv?=
 =?utf-8?B?MlpkUlNYU3VMSkE5VXZoc1NjeC9wYW9hTWk2ektUdXB3UnQyQzc2TC9VTXI3?=
 =?utf-8?B?QVlkaTRqR1ozUnVwWHFaUFM4cloyc01YZzNzVjhtVFBBbTZXQ0dSZE9iMFhR?=
 =?utf-8?B?S3VWMnY2d1FEbkptSVgyMkIwUS95R0hlZ3JoT0l5bW9nSkt3azh0dnhlY0FK?=
 =?utf-8?B?TUZjZGx3bDN0VFdUVnVrcVFXMEV4VHBGWjFOMVVuazFtTjNIODJsRTNJbFdo?=
 =?utf-8?B?RlI3N2ozZVFNOWdDenUxampwTFZMME00Nk9xdWxBdXMxaDJ4bzdlOVhZeHdM?=
 =?utf-8?B?RU5EZW5pb2V4NTRFY2pzL3UrU2E5L2RScTExRkpKS2gvMFdGYVRScHY3WFlR?=
 =?utf-8?B?b3ZwT2ZxZW5vQytUVGlyckI5N1NQcTAxSGlUbFJNTmd4ZGlUUDQ1RkVQS3d5?=
 =?utf-8?B?UllBU0ZaRFRrYjVJaEsvZmFIQ2VhaWZ4bzl5Y3J0SE1WV1htdEZURCtickxB?=
 =?utf-8?B?czg0bFZpNHNueEV2NStzM2JISDV2UXJlcU1QcTdJVG45Y2RaaWlBQS9kSUt2?=
 =?utf-8?B?UEVld0hyeHpGVjZETk4xNnQ4VHdoU0RFNWtXU21zMEh5ekdHOHc1R3ZNZFhz?=
 =?utf-8?B?S1JXMmdyR0JuZWxEdGNmVEltbFpvZHBqSU1Wa0ZrTjcrNGY2STNsVlBnRkk0?=
 =?utf-8?B?M2RKWG5aRFJSNWd1dVQwdUwwZUl5WHdJNUNCL3hma242SmJjTzNSSUp2T0xR?=
 =?utf-8?B?dmlVQnM3MUYrZVkwSytiNVNwOUdESWtiR3BzbHFEWG4wU2RJR1EyUStUVkVt?=
 =?utf-8?B?SklOUVZxWDhPRS9hdFZjcWpvc2I1V2VWQTVBck1NK2RObWwzbW1tOFdrRFYy?=
 =?utf-8?B?aW1CR3NpNEx2dzB3SEducnFtK1NwNGJZUUpDNXhnQzhnaFFXMnJFeEZpTnpo?=
 =?utf-8?B?QS96VEVTcHkzUUFNditjVFhlYW1ibUEzZVFLZFYyYUNEZWh1V1ppN2tCKzRU?=
 =?utf-8?B?YVlLcVk1cEtHc0pBR1lTNWdEZmp1RS9JUzIwMUUvd0NwdzJFQ3NTMmFjZFh2?=
 =?utf-8?B?SEZJcnJNM2xMQVh5YXk0OXVvWmRIeXczSlZTQUJEdnNUWWlPRHJNTFFwSjhF?=
 =?utf-8?B?THJBMFhJYlNBT2JLdkUzVHpENStycG9TM2dONDgxNG05VGJmeTJ1Q2lKVm5u?=
 =?utf-8?B?cjNRQzB6ZjUrckpXYllOS29GOU00UUkyODljZWxDUmN1c3pXbkdQZ3Qwdncx?=
 =?utf-8?B?UGRPT1YwR1N1Qm9kY2RtL2ZneEVZSWlxU0tGc1ZpcThDZWo0NGIwRXRtc2Ey?=
 =?utf-8?B?b0lEdmllN1BmWFVsN3c2aGZRTnRtTmZ1QWZrTFBlbEpGcVhiMXNEK0FueTNB?=
 =?utf-8?B?em9ZQkdXM3V1NC83Uy9rZGIveWx6MjZ2ekk4TFcvb0x5d3JtR09tYVRsMC81?=
 =?utf-8?B?dTBPdjJEVzRmeFRPQzNOZUhEZGx3QmY4cCtqOUVmalpCakNadXdZcGcwRy9m?=
 =?utf-8?B?NWNGK0hDVHlRb1F1Nk1GOVNDU2tTVytDYWttK1d5R294UG9lTnNKZmxKbFhr?=
 =?utf-8?B?cUthdDFvZkxHaG5CUVVzN1MwTmF5UlQ1Q1dUK1RKY0pxK2I3eFk5d3FzdVdR?=
 =?utf-8?B?MWp1VGp6M1NmWDhDdzA5YTVJME9wSms1U0tldHZ5My9CZHB5V2ZFZk04eitO?=
 =?utf-8?B?NXVYdHdXVFI0TS9VamRSck5Ubm5OTk1ZeTdjUUtqL0lGT29ndG9oVHhJOVZk?=
 =?utf-8?B?TjQ2aFIwWTh2bitoTWVzbmNVS3hIMUdoeFZuNUdKZUpwMS8vcjBvVXMwM29s?=
 =?utf-8?B?SU1ZeStBemVwaEMyYUpCUS9uVXo2cXBzU1BUS2lLNkJlVVhDVy8vcmZ3d3ZJ?=
 =?utf-8?B?ejduVGtsaGhSeEZFd1FtNWRLakMxdDE3UUtTajJzWEM3cXFBamZvVUVvUklr?=
 =?utf-8?Q?g3TNVzGWBsYnChPI=3D?=
X-Exchange-RoutingPolicyChecked: FzvzUPaXz1AJhrjjy8Y+coQUpXP8GyMTG77NtaMOi4Y/6Bj1hZ66QsbaUpSwerl8sZUeAfFCvhNx471+QiE2Ald0MOOtq2FS1z+6ENUoNrLcGXmXdJZTM1fU2H18pPf7ivia0UT0rM+N9Ubp0gaYDNOXoV8iCStUz9USqOAbMZaQHJXXZES/cTogsZga6czvXBvqEVXEJPSk5Hjz3L/hElSpSYpgUfK3FKXQ3ht39wuywDkV5ub8ecgMjRMYes0VSHgy++h6Ux+O7atiqKJauhrWFATwQO87m7MoJ2iGQwJ5jvp3LhBZreqZI6yoML3aX+dhfx08LDhgAxAV9kIHJg==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4b98166-e016-4ff6-b25b-08df04ebc2e1
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 10:04:34.7083 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q8O8ag1O2BWMKJ/Q5hzkqXEa+UtWrJqRyh9/nhqXZVkNU1FKk4k/ixMiyyrtkqPsachft/cczothZLPIPbK4Ru0Li/15JzftqxoPFeDfsIk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
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



On 8/28/2026 5:45 AM, Alex Hung wrote:
> 
> 
> On 8/26/26 23:31, Sharma, Swati2 wrote:
>> Hi Chaitanya
>>
>> Patch LGTM
>>
>> Reviewed-by: Swati Sharma <swati2.sharma@intel.com>
>>
>> Also, it seems we have duplicate igt_display_require(&display, 
>> display.drm_fd);
>>
>> It is required once. Anyways, its a separate patch.
>>
>> Alex,
>>
>> Can you please test on AMD driver with above change?
> 
> yes it ran fine. Some inline comments below.
> 
>>
>> On 03-08-2026 01:33 pm, Chaitanya Kumar Borah wrote:
>>> Following the pattern in kms_color_pipeline, set
>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE once and stash the result in a
>>> local variable, then propagate it to display->has_plane_color_pipeline
>>> after the final igt_display_require() (which reinitializes the display
>>> state). This avoids calling drmSetClientCap() twice.
>>>
>>> Cc: Swati Sharma <swati2.sharma@intel.com>
>>> Cc: Harry Wentland <harry.wentland@amd.com>
>>> Cc: Alex Hung <alex.hung@amd.com>
>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>> ---
>>>   tests/kms_colorop.c | 9 +++++----
>>>   1 file changed, 5 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/kms_colorop.c b/tests/kms_colorop.c
>>> index 16db0b8ad..d573d2ceb 100644
>>> --- a/tests/kms_colorop.c
>>> +++ b/tests/kms_colorop.c
>>> @@ -406,6 +406,7 @@ int igt_main_args("d", long_options, help_str, 
>>> opt_handler, NULL)
>>>       igt_display_t display;
>>>       int i, j, ret;
>>> +    int has_plane_color_pipeline = 0;
> can this be bool?
> 
>>>       igt_fixture() {
>>>           display.drm_fd = drm_open_driver_master(DRIVER_ANY);
>>> @@ -417,15 +418,15 @@ int igt_main_args("d", long_options, help_str, 
>>> opt_handler, NULL)
>>>           igt_require_f(!ret, "error setting 
>>> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS\n");
>>> -        igt_display_require(&display, display.drm_fd);
>>>           if (drmSetClientCap(display.drm_fd, 
>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>> -            display.has_plane_color_pipeline = 1;
>>> +            has_plane_color_pipeline = 1;
>>> +
>>> +        igt_display_require(&display, display.drm_fd);
> is this igt_display_require() necessary?
> 

Swati flagged this too and this is probably unnecessary. However, I 
thought of handling it in a separate patch. What do you think?

>>>           kmstest_set_vt_graphics_mode();
>>>           igt_display_require(&display, display.drm_fd);
>>> -        if (drmSetClientCap(display.drm_fd, 
>>> DRM_CLIENT_CAP_PLANE_COLOR_PIPELINE, 1) == 0)
>>> -            display.has_plane_color_pipeline = 1;
>>> +        display.has_plane_color_pipeline = has_plane_color_pipeline;
>>>           igt_require(display.is_atomic);
>>>       }
> 

