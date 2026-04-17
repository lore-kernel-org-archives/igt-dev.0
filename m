Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB8FF43689
	for <igt-dev@archiver.kernel.org>; Fri, 17 Apr 2026 09:38:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3CB10E98F;
	Fri, 17 Apr 2026 09:38:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YFxzvlY8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD0B410E98F
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2026 09:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776418700; x=1807954700;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=F8R0/kH9GY9C3032zRDOYkjbYSZWARUjqDdZ+FziB00=;
 b=YFxzvlY89k5oQCBShoRMUoqHKTXZiSwCebwVVMum+U2Ci2PAfY+9eUbY
 0/KcwNbKx9UuaqYxzfBARVVHNQshdHMNVHlAUu/yyaOLNX05no4TUm0q2
 D1kchjsIP2ktJmdqX+zHD83LvuevhgBu5RyaVNoXfAHw0hFr/Tto9+Kd2
 Wu/Eh5yIvgiFwYNGv7o8rtSS0ySaquiJRM/nVoqQVa0dWiWaKoz7ofSmI
 O+ftTsU/HRJWsQLlXHAoy/ZvgTiMsTb6mZ3M2GB1yrO248J96iLBjJW0y
 24GPkEEYWx5czfbBAZcltMkRaBBr/g3JzcjcsvqO8jMZnMPzmhNMAGJvB g==;
X-CSE-ConnectionGUID: ucza1927QgyDpB5H005NGA==
X-CSE-MsgGUID: z/zgD8uPRTqQGWZYl57qAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="77505286"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="77505286"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 02:38:19 -0700
X-CSE-ConnectionGUID: 0T5c16W1T4Gps6CyTMXeOw==
X-CSE-MsgGUID: BcoOIm1JQtKrIvVUTwrA2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; d="scan'208";a="230131665"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2026 02:38:19 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 02:38:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 17 Apr 2026 02:38:18 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.30)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 17 Apr 2026 02:38:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WQgHH1z6cJu7Hf0XnIJsioMeTP4m40VueJZvoTaTyVuNTwLCFKhUwvBfbVTba+DUtQT/6o0DuaQLhedUAHCqjw6HRihRTpijlT8N72nctyD79XTy/58RHNnqy0Kw9sUVxDZr5SSIk8j3y8ToIldU10e5dKaGj/LDxW6yKV+59nwtaIR8RZ3KFKyS9aAVDCy0VJNNF++ThSi7K0SHvJ5tF2gQ7I+1zvAnE5bsitUb5n/Cump8GFQY8TpgDv7DkoaS2vJJhpIAynHeGTPhCcLaF5YFo71xKf7ObwuAHXMq9wBHP8m/FB2kcWHJUylJc2Tiz/x1VxdQzedDDX2JnN0wUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jz20cXIkQZ+41vYEjD9kN9ekOFOeZFs3a+HjqU7C1tk=;
 b=TDja//shermbZhx2A70MVtFLD8YoY1B3uSBxQBcrO5ejU2Zxpz69NAsiZceZ6Xl1AwI0wHb/TniOTUeClmlhVs+2LOIJk/kvETQAATa5f5C+ptI13m90OL4CW3rrOzOt2Y1qSvFvUkHUrAtTtA//lt07B0/qYQFcsM9Elu2su1nzNJ6ttWjouFhZKvhG4t86kE9sGXb2YwJlKYbp9cY+5BQPPW9UQUAQHH1VrsXI5aChoqloPdhKSQjydqmbpdHE3XKYCMWaB/vAHH0Gw+KqTOkdLG2Pwzein5LbxhWgFI/TX7Pur3IBEyV7IXceSW87rm4Dr2fUgLZ4v0dDjFaD7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB5880.namprd11.prod.outlook.com (2603:10b6:510:143::14)
 by DM6PR11MB4516.namprd11.prod.outlook.com (2603:10b6:5:2a5::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 09:38:16 +0000
Received: from PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd]) by PH0PR11MB5880.namprd11.prod.outlook.com
 ([fe80::b706:268e:9753:cdfd%5]) with mapi id 15.20.9818.017; Fri, 17 Apr 2026
 09:38:16 +0000
Message-ID: <6f4cd9f9-b177-4812-bb0d-092dd0017c5f@intel.com>
Date: Fri, 17 Apr 2026 15:08:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] Remove deep-pkgc subtest
To: Jani Nikula <jani.nikula@intel.com>, Mohammed Thasleem
 <mohammed.thasleem@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260417083506.33404-1-mohammed.thasleem@intel.com>
 <c5ae1bf696bfc870cde43d595598de777428ced7@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <c5ae1bf696bfc870cde43d595598de777428ced7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXPR01CA0106.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::24) To PH0PR11MB5880.namprd11.prod.outlook.com
 (2603:10b6:510:143::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5880:EE_|DM6PR11MB4516:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ecc9ef4-1388-4761-d261-08de9c650ced
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Cc/5oWn02q4bWBqs0CiEqlCh/2el7dJm2YDSqFIhYQlVEzbYhsmU/81XU9shJ8vIqOrph/KDjsmdG0y/BVHuOyTAqQofZm/Aofqa9eGKWgsl3nTbJkor1UTUCZYWNBZXFkQ96wpd5ysXuWOHU2o2z9A1YTcuUL4fVgkFLJ+yehEa8wm3l5jpHWxARa3qtVy2zLpgjuOPMm1GwuuKUrb2UgCAyKpg1qeJt6MMLSmYFC4STZXCZvWa6KhXk69YGo9KcBa/t/pZ5v8Q1dTRdeS/R3u2rUcncwDB47Xu1HnO7h+WyDIg3YnzApr2H6HxZNmjDAZOOEIfoVmbtXiuyvBI1aNnrY/6jubkM3ld5rf7Z4/5B4TBpXHMDB+P9TFz/Td2vL2Wg81ZVD+3ALZXrLjZ1VrhLSJl0xpAV1dNW457dWAbp33lviYunmlUtTeuOaSjMiezIYAPaPusQTuYkvkNf3HmONrZei0NB5Fcdwy/hV9grXctRn7gICjx5zs9c27sN+sQN4Q7cZ5EkW7gc51Me3nRrTT80vMwd6VIUn9rfWYeDvPN47jDwD9v+lw4PpNBJm5rI6MeKbLuOjzlPbTSkjaGnPIkp22yMc1bksu+4XLaQT6aw3KCK+NDo/bwOOo8Wqcy7gaUUAsAQNwnrRQjT72/EUK+SFk+s2VgR1gpgmwIA1rAHgYUB/ZddhEWEIlX0j1IN8vi5VZUBBvd5Lz6bOlkkTCmMFwfR8Ec9IzD0ao=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5880.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlMyRER3Y2VNR3BjbmFCWExacW1CLzlqcFJvWEUvMk1RNGFKYkRmQVVGcC9H?=
 =?utf-8?B?RUtld1RpMUlGWVN2aGxSbWtuWnFLSTVLNFdtcVBFWnc0NjFqWEthaTZRSGZB?=
 =?utf-8?B?M1pFZU1nbUZ0OHhZTHRudmRjWGRUQ3k3bVQ4YTRBakl3SEZQT1lsd0lZSVdP?=
 =?utf-8?B?dFVud0pHdXhvdit5SVF4QkhwazQyYVhkNFM1Z254TGdxRmRYd0hFRzBsUkFu?=
 =?utf-8?B?cXM5RmVoTkN0MmY5dkt0T2FLV3F4cmZhSGN6WlZyZ2ROSEVlNW5ya3FmZ3Jx?=
 =?utf-8?B?aXVvQldnOFdaSmZkdThxUW1RTFJIM1VqNzF6dU5jbWFXMExDZlRZcjFxVjQ3?=
 =?utf-8?B?c1QycERnY2VJdWZ6bGQxeG4zbktISzNmdjc0VThwdElKY0g0Y3g3R3pPOE4w?=
 =?utf-8?B?WXJFenBYcDcwRk9OaGIyT1kwYTN0MjBweXBUbFRTeEE3TXhoS1EzTlMrSmQ0?=
 =?utf-8?B?V2w3NHdFNERjRDdtRmF0NVpGNmR6UmdTankvZ2x6Q2dGNUVJV1d3SkJMYStv?=
 =?utf-8?B?YXlpRG5YRXkyc0l2QWhpclBXaWJQM1d0N3lrdkVYR05JQ2xRZkJVQTBETGsy?=
 =?utf-8?B?aUZWdWV4d2lpRmdpcEY5Nkd4QUV5VkZrWTh3NWVBd0kxWktpa3NjbFNrV0x3?=
 =?utf-8?B?VUJiRXJFQzQ5aTNudXVxMjA5RGhhVlpEZ1l0eDQzQlY1VzBISzA4K0t0UVEr?=
 =?utf-8?B?eUJCWm9lWUE2dGRGVlpESnFTOU1WMitub2ZTQ01Fck5rbkc3WktTZ09Nam40?=
 =?utf-8?B?bWd1NnVrVEV4cDB1ZUVnNDdlT0RDTGpkWmJ0d3VydzdRTXRCeXFZQVl0emxo?=
 =?utf-8?B?MzBQbS9yclp2VEpEam04M2RXRjVsWmRQUzI5QTN4YVpIYWlYM0c1dUx1YTYw?=
 =?utf-8?B?ZXdBb09tcHdKSlF3ZjZTQ2w4NVZ4SXV3eURQcytQdGY1aEVOZ2kxVXpHbDVw?=
 =?utf-8?B?eXMwVDhOUDVSZG5YZXlrSlcrTzlXMWQyMFdjRnpTdDB2dDNvT1gyM0V1bG9F?=
 =?utf-8?B?QWtleWZZaE1PWXh2ek1CRlpiNU1ZT3ZqU2RrSXN0WEZJaCswWEMrdjRCTnR0?=
 =?utf-8?B?UE8yRFRvWnNSTjRzVjBZdXpKVFQwV2x6SjZFM2JWV3I3UEtFMHB6N0dqNFhD?=
 =?utf-8?B?TVo4eXgzdE9ibXVRNDNQa0prNktWSGRjYk5PeCtBN1I3d3Fxblo0cldDdFdT?=
 =?utf-8?B?UEFCTktUQkwvbHdLOVZVbnFSUXpRMHc4czREcDVOYnhLanlKbW0xOElzV1ll?=
 =?utf-8?B?Z0Rkb1FJZXkvRzNhZ3A2L1Y4bkJXQ2ZtYlFzNkQwNTgrT0FtVUJHcGdETXU1?=
 =?utf-8?B?dzZIMGF4MFVlU3hqbXJNOVNSNk0vOWVOY1lGL21Sdm9kMldpUnByK2lIQUd2?=
 =?utf-8?B?N2tmQk9iRXhRR053NzZ6ZG96a1hpSmNmemxtMzJ3UFlzVVo2T1ZFUXpIcEZK?=
 =?utf-8?B?aDJOdnMyZ0h4TlFXcmRUcTBpTUR4OW1iT3RLY2o1eU1GOWNmYVhmSDBYeCtU?=
 =?utf-8?B?bzgvTVkyM1E5c1NKVXpXNkpjNk9Ic1BmcG5FLzhxbFc4U0o2UTMyVjVKNnow?=
 =?utf-8?B?ZTVUUTlYUGxhZmVlOXYvZnowMzFGRklJTDdMVWZTSGxscFBPaDdFYzdXclVm?=
 =?utf-8?B?aTU0WnpPdzBRMWxLdXF2TmNpZ29YNlgwdmgvM1NrR0ZqaURIVUxKTHlJOWo2?=
 =?utf-8?B?bmlqay9FaGo1SW1QM1JkTW9QSlRrREoyRHBKcWpaS0JFWFNHNGp3dkZ5YSs0?=
 =?utf-8?B?MEFLR1daTHJzOER4QmQ2MnFSUEwwVUxJZVhvb1Rpa2lXU1dyVG56SlhqTG1K?=
 =?utf-8?B?UVhFTWNDM3BiVEtDNkZRbTVZQ1VNaW92NFFKNEVrY3FKWmltZzA4QlRoUDEx?=
 =?utf-8?B?b01tK3NNVFVUSTA4MU5sSkhUY3NxWjU2OVFCN0FPYjN3cUxGWEFsOFZXZUNJ?=
 =?utf-8?B?V2FoUzZQakh5TnJMWnhIQjU1RFRySEpoeEcwZ3ZQejRzMkluYVhVSEcyMHhE?=
 =?utf-8?B?NlJIdjM2eWFMOFRlTk10Z1BGam13ekNrSWEra3NINWs3azRJQzBtNi8yVGsz?=
 =?utf-8?B?K2F2N2owdlAwbnZrTVF0WDM1VFFLblJSZGxHanp4WXBJaEFGRnVuTVplNTlU?=
 =?utf-8?B?MnpGSnNlUFBxZDJCV2tObHZLbytmbitybkVVK29ONmh3cVBSV0Jtai9UdXZz?=
 =?utf-8?B?MUJybkVxTVlhcTJaeEpFU2VxVTMrcDZGZFlRenp0bnYzbFFIazM3MkFhYTY3?=
 =?utf-8?B?UkVRTmMwTURxY0lmT2dkWC81dStsZSt6OHlYRGM5TE5GSEk4T0x4blZyTU9o?=
 =?utf-8?B?Nmh5b0g2VzhpQWI4bU9BR0thUXpmTDhXbzRONFNsWW5OTTRNZHpEQT09?=
X-Exchange-RoutingPolicyChecked: ILn1kTJlmXfrvkxQSdGxE2roWelfN/L4RsVv1wqsctrWcb9tL1t/XWIMuQm1OA7jS+q29OjtDy34T+6nCzh3lcYNC5oBNafXH6mfPgazT0lhSyNnVVeb0vy2lDAy0EbcRmB/Rr1Ylu3N+1T93A11sBWQ3HGevba0i39yotGe1r1CdyYy4ZWlWeW4rtnRULU50wNqqGWwC22WhDVIz2yJiJk5O86LrhNx52YSIUnweJIUoEZBEpeJewt9WHHAFIjE8Md3ZX/5D+fSsw0s+oJdyIlisnwKOCSNws3WVnK9AR08xJw8aEwd/9iwDwy7HzR9gjvR97AqtMxOCLxHuNabxQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecc9ef4-1388-4761-d261-08de9c650ced
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5880.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 09:38:15.9955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCN/jKaHBIIb+AvDQHHVZ6r2Qaxoo6gEfNwJ1dp9S9N5uL+vJLOLgtFjMS1fGYV/Y5RMHt4nkbeur+8APYbGIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4516
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

Hi Jani

On 17-04-2026 02:23 pm, Jani Nikula wrote:
> On Fri, 17 Apr 2026, Mohammed Thasleem <mohammed.thasleem@intel.com> wrote:
>> Remove the deep-pkgc subtest as it depends on other display IPs which makes
>> testing unreliable. Current validation uses Package C-state counters that
>> are affected by unrelated system components and requires platform-specific
>> checks that vary across different platforms.
>> A redesigned test with proper display IP isolation will be implemented
>> in a future patch.
> Doing this in reverts like this breaks bisect.

Then what's the best approach to follow?

Even in git log, I can see such reverts.

>
> I basically do this on all of my series before submitting:
>
> $ git rebase -i origin -x 'ninja -C build'
>
>
> BR,
> Jani.
>
>> Mohammed Thasleem (7):
>>    Revert "tests/intel/kms_pm_dc: Ensure eDP detection before skipping
>>      test"
>>    Revert "tests/intel/kms_pm_dc: Add polling for deep-pkgc"
>>    Revert "tests/intel/kms_pm_dc: Update test duration to 4 seconds"
>>    Revert "tests/intel/kms_pm_dc: Update VRR handling and eDP output
>>      check"
>>    Revert "tests/intel/kms_pm_dc: Add time unit macros and update delay
>>      calculation"
>>    Revert "tests/intel/kms_pm_dc: Add a new test to validate the deep
>>      sleep state during extended vblank"
>>    tests/intel/kms_pm_dc: Remove unused pkgc functions
>>
>>   tests/intel/kms_pm_dc.c | 98 -----------------------------------------
>>   1 file changed, 98 deletions(-)
