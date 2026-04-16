Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA8FF8D760
	for <igt-dev@archiver.kernel.org>; Thu, 16 Apr 2026 16:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A56010E8D9;
	Thu, 16 Apr 2026 16:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mVdHD3iV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9CE10E8D9
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2026 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776355795; x=1807891795;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2evRt25Wd+cLzzMc9Gk/Q/LKrHlLJPlK2o7YGEuq+Ho=;
 b=mVdHD3iVEauFak1VsHjZTv6fQSUQ82xpszNp2Gmb70tjGXEIFnNCG0Ru
 qbA4VMzVmiBgQ7x8gOmQ7Zb5POprnlGT2YEa631sxFTyCOmIlDKy70CD/
 5CQQAGJvED+rwjKqf+xx/dG4yeaVt95tEy4Nx8iMfDR9sM91ZBuQVtc6Y
 5Psg3lfPebaIsRft7/t1RTlZPobI/LPiu8b98RoRk0VQKCcqnfHvL4qXs
 Bv3Mmzal1hr8W+r7I+jaAaH8zRk1QT+tg+MMGgEjxgmZG7g06nraz1RH+
 r/8Mfdw5E7ArZvJBtvPRu6rcnAtLQvv5ToF5yOZvlnyMfnMmpUafTUMP8 A==;
X-CSE-ConnectionGUID: psxK30LoRLqJfHeI2ZRQ2A==
X-CSE-MsgGUID: 8j7gfIV/TACq4IAA5CfdJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88811767"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="88811767"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 09:09:55 -0700
X-CSE-ConnectionGUID: CZ/iLF/OTS61DX0MDqhd9w==
X-CSE-MsgGUID: zZ8mibf0Ry6J15U/1Ln4IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; d="scan'208";a="254230326"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2026 09:09:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 09:09:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 16 Apr 2026 09:09:53 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 16 Apr 2026 09:09:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K5F7Ze2RMcwwoxa5Aug8SDWD03Tq5rGzvFtbcuxgbvdIGxrltp4HQY2O2D1Tn/o8R3mqY52/nfgdKUGMOQwxtDspc+jeY3NMOglsK/UE5a6d3MYT+S/hJgVpw4UBWw0zXoJaivDHehDSUjBQQYSJJsPiH11CdIdiZpAgv9gkPpaJEnyOye/OTXvjtytos3mhlmSzxnI9busIIwSr2wQaT2Ehn2X9HqlruXrtCksFAKKlF8YOLtSGxUsi+rBxWxgnLtxk+EM3M2QzlEbPRMAJ4m2QE9zlkoIQHd6RZog+oC2yJq0uF8k36YxWiHnVO0WgQ1iY/Ks3YPgiWswIyk5VDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QxW+w2yQtOSZ8tYT5WJ4xJVbbkoX7NCD53qjiTQWYeQ=;
 b=J70Yemg2mVVeCkOH77681K//MZSAjUfl6M7nami6VaQggRjYHqCs5k7PbxnkabeITe8CkrH9wKozi8ngyeI7h+wU74LEnf1O7Ss2GuVUfqkFdjOPoNpVpnY7ZfuK5ntsZlMQ0tAGIkbimzyvwa25iohYXswjjAWPWbTuC0Cz0MmoJxmeNnZTZXYcKTBHfHxOfTTU4iKUNchcjZh7qx9drrKzAQYGY+ZA81A4y9/Zr4ntsilN4ojwwHKvC+dH5QP7qDkhklEr4A1Hk7dKLDex3Ws/Kw698MFqY5SNAF8Cq75nf1DD44GvAKFfpgFT9LDPICbUszT5SjWt/ECYcaCO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.20; Thu, 16 Apr
 2026 16:09:48 +0000
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::f55b:3f29:ceee:24ca]) by DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::f55b:3f29:ceee:24ca%8]) with mapi id 15.20.9818.017; Thu, 16 Apr 2026
 16:09:47 +0000
Message-ID: <59702b08-05d4-43e1-880e-284cd394d649@intel.com>
Date: Thu, 16 Apr 2026 21:39:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v10 2/2] tests/intel/xe_vm: Add support for
 overcommit tests
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
References: <20260408073546.3500698-1-sobin.thomas@intel.com>
 <20260408073546.3500698-3-sobin.thomas@intel.com>
 <41cb7a4ad9786a4446cc6cd2378d1fe5f5effad3.camel@intel.com>
Content-Language: en-US
From: "Thomas, Sobin" <sobin.thomas@intel.com>
In-Reply-To: <41cb7a4ad9786a4446cc6cd2378d1fe5f5effad3.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To DS4PPF07B018B9F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF07B018B9F:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e7fdc5f-7084-41d8-119a-08de9bd2943c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: lAHyq5TcH1GhGkWFmP83XEI4v/KcW+3yzp+OqEqa+84USl3XimXaNwrcBYY9DZsXV03AkAvPOylfJtsBuBxQ6Ame7UKRvOc4LmI2HahkB24uYZHWQ/Zv5aHdgGIcEVoeKmKQQDlhn2WuQmnYaGnRV3G3AKpN/OHR4v8FiDYxmauiF5NV36yDfirCGYJv1AimvhJxWqoaxi10RVAdLPvEVwR2jX7bhMQaCUgE2pH7ZUgfV0iYD8pm2Gbzjx2H9tQt5co1ATZyauSDJpkMklO32HgEsuvbkLXjK6k5+b6ojYC5ODKYc6+69esfKfa3PyQkI/Wts0JG3Ipllqe3jPiLiWinmLb/90Z+KjOaI7YA7SRWDUqtrpuKNyCRcljYMQkcoFRN8vBFL/sJ48mKXs8Oi06V6v6jzqQ+xFmXo6nos4KjqCDievVplOJouTi1GDQ+6JWy7a1yreNuD1bWCkI79Ddr6ayyPO7qVbXiZIwLvjBfHKt892AAIiMuVKtsAkmci2RI6gTRabHWG83vnPD42Q52CGbyCrxuNIOHdKit7dba9fmjPALBjl6GAWB0+jMMLB8hwL1Xx+XJGZ7xI1BH6UzYmX28yicOia2pLeEVmDrz8YWav1c0BUGdkCwwzizIhdOINcjh1uZpyKlE45r0QFecV3pTZrphi3VIlBK+6CkM0VmtA/NVr1oD9MiDAky4Htwa+jGN1g4H3dYhn69cICpBxe63s+b4o1SKPuVkpog=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF07B018B9F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1RXc1RqeHNUenhDQ3o5ZE1pWkN6bnpuVndTNkZaR2F6YUxyU1huWTFmYlo5?=
 =?utf-8?B?cWJjR0RUajBMODczaWZpckVuY2hPWXJmWktOdkkyTGJTNmtZNWx4TnJJdWJ0?=
 =?utf-8?B?dHhoZmRMNGF4aTU0Y2ZhSUFTbnZIS0dISjVvYVYwVndUeklvT1NvUWsybkZL?=
 =?utf-8?B?MnhTMitDUjVTbUJjS21CZHdpU1dNN3JibWt0MVRTV3hiZ0l5d0lJZTZUQmFZ?=
 =?utf-8?B?ZmFhRTdZUXplQ1RLNXRSQ3ZPOXEvYnh3STBQQVZGK2c3SUozY1hWemFBL2VW?=
 =?utf-8?B?ZGRCUENNc0gyaVk5c3V3YUl4U09xOHg4cFU3eTVwVXM5ZG13QlV3Z2Ztandj?=
 =?utf-8?B?aTVSc2o4Ti9tSHE0YnBNaGlhMkVLWnM1MlZrb0FOK1RrQ1QwSGRNQmtJR054?=
 =?utf-8?B?Zkl0a0IrZ0EyazhSa0xLcWNaTzZIVnlSeloxZ095cXorenFUeUkzRmNBQVo0?=
 =?utf-8?B?czBHY3VlNnpHYW9lMGZQbjM2SFNaMDdqZitRMVA1S2xucEhSbHZMK2xLVnlB?=
 =?utf-8?B?OUJyL0lxMjZKT0lmZU8vOVViOURvL3dINGtVb1VJaldJVkczMmVsc09mVnF2?=
 =?utf-8?B?WDFuMGhiVGRJTXBpVEdqdE52S3B2b3JmMnRPeTBJa3FMRkpCZjRVQWdrQTFX?=
 =?utf-8?B?MmlVR29xa3FNdXpTTElVcVFWaFFuMTZ5MndxUmRXMXVMNTA3THV1SDJSb0lt?=
 =?utf-8?B?NFJvQ1Z6VjdTd2Q4Q3BDK3l0M3B2UWRibnVoRTlOZzRaRWx1QXlkNGFJZ2Uy?=
 =?utf-8?B?Z0E5WklCUk5QRUl0aDVvanZyenhzRkN1SEU1cjhYZjY5WHlFWm5SbG9QajZ6?=
 =?utf-8?B?aU9iWVArbk1qVDBCamI2V2N0blBHbExwWUI3K3UxUzhEb0d1WVliQ0RPem9x?=
 =?utf-8?B?OWNpT1p6dGkvRzkrZ0puclRCbGVxbUlRdWtTcm9DcHFvRVN4WU1OQlVEa0t1?=
 =?utf-8?B?OVIrNkNCcEg1aU1GK05Hb2hkNTMrNWFOdWUwaS9zTDJYeVY5bjlOcU1rNEk4?=
 =?utf-8?B?a1RHQ0t0Y3dqUGplMklpdG1sWUdtMFZjc3J0Myt0T2xVSS9YTjg3cWdPQU1z?=
 =?utf-8?B?Qi9pZWtSbXRaQ1hxRW1KaXVCZERvTk43bjhZWWQvZVd2N0NNNnZDSGpxTnFC?=
 =?utf-8?B?WjcrWVhaaWVkdS84RVRwbGJQcDBoaERoMVc5b1lqdlpxcVFMYngxRzdJS2pl?=
 =?utf-8?B?WjQ1SEZDeGpsRlFpUmVrU2dXbW9XR2dCZm9zZXh4eVRaeW5haDVPTXZhZHZm?=
 =?utf-8?B?d2pPTmszYTZ0R002djJEUmw3R05hWkNDTG5vTzV3eGQycHU3UWJHZFVOYk4z?=
 =?utf-8?B?Vkk5NHErQ2JlOVNCNGtJMU0wOUVITmxwcU5wc0lydFlONlFObWREL2hrUysz?=
 =?utf-8?B?a1VpZUpKdmdMZzUxRFpJVFdQL2pXZWtoTlN4VDhRKzNFTUIrTi8zbXpHVXdk?=
 =?utf-8?B?NkN2YkRwQytMeUZSTnZqOFF4QTJWWmU5cGl6V2tac0JqT296bmVMakpMMGtp?=
 =?utf-8?B?SEh0eDdKZkx6c3dqSkhTd2ZjWEtFbGJGN1FqUHU5eGN1azFQaEJad3plcFFz?=
 =?utf-8?B?c05xa3ZXQlUzMHkvYlNjRTVFT3p3dWNGQmplODg2dTUvOXY1cUdsRW5OYVBD?=
 =?utf-8?B?ZGNreGJnMHgvdGVubzk5OEhMWDdpbHpYUlV6aktJNUd3RGVueENGdU5PSEdp?=
 =?utf-8?B?TDdnbTRtZCtVMzNRenRoY2FsQ3RialpieFIxTUhLTHZSdGVTNGtIcklxcTli?=
 =?utf-8?B?c3VXV09GSkpJZU93OXg2Z011VkRISnN4bVlGMzg1VFlDMUhOYVJIU3p6cHVv?=
 =?utf-8?B?eis1R2tZb05KY3V4Q1pZZG43bldwMFVHUGNJZlRLUTkzWnVrcUdsTGNQaVZH?=
 =?utf-8?B?NGo5V0pVSGJBZ1ozeDFyVjdxWEkvV0RoT2Z0dlRBYjBaZVVvclg4VEJzNERB?=
 =?utf-8?B?Y3hyVHgyRzU4dGxoVjdZMG1LQ3g4RjByTVVjbTFlby9rNjVtd1Zkd0VkSmIx?=
 =?utf-8?B?NjhKcS96L3JodGtLR2xJOEJvcGhtZzYvRDVpRkszaUhYaEg1WFBOZVFmeFRs?=
 =?utf-8?B?bzRiRE1EdWdlUXJyZEN2TXVob043TmJzVUswQmhEeCtQc2UyS1VZQlJjd2t5?=
 =?utf-8?B?UXhSZE41U3h4THZrRVB4TzROOUgrUUorc2tRT3IyNnpvUVZCWkl5L2twd2Ur?=
 =?utf-8?B?aEdxeVZQK3pEcTQ2YXRrVndmdjRkN0JDODY3QXBqSm4vOERCM2hxVHRVNlo3?=
 =?utf-8?B?STNnN0J1RStJaGRzckpmbG5aL3kxajgyeFA2WEJ4amx2bXB3czJIczNCVVp1?=
 =?utf-8?B?SitLcnJTVHhoVHp3UlBjNXd0Z0t5RkxEdys2VWJwVjNxcU8rRG9mUT09?=
X-Exchange-RoutingPolicyChecked: mcNyIg7hlJtXr5C/QBzm8j4XYktaqZB+GbQ60sHoYkleL1/yMIhoDuI6CDt/p5wD7jlr+Vku/PPNMBLALpc3nvJxYdxPxpyrbh7Egf9dAhmcgnbUECznwhlEHaGsFrVrXzkoe9z7Enr4hg6sO/f0q5RacbcBJMNgC1wV8Q0WivC6UfzUzA2zBZvB2nJqtofzkCYcIBTSCDXbyDCluaka1Wb/R41d5i68kqbmhWC8sT4O6ImSn9l1WyrIpgoZ3QWY+vgy05jQ2FqN1vH9YexbhTgpQJOIUZPppJTxJtNVnAZxwRbJ9eqmWHc2Ow9P/CgPw9xCqC+RsrWVNZi9vFxtjw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e7fdc5f-7084-41d8-119a-08de9bd2943c
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF07B018B9F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 16:09:47.0451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zLyzU1cBIrxbyg67RQnTxGz2O9gvyZ7uKE7QVDOu0sO3yfLgjS6my5U6QOCpF6o4oircHndyQAaHXSrrFGOG2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
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

Hi Thomas,

Thanks a lot for the detailed review and for testing the patch.


On 4/16/2026 6:06 PM, Hellstrom, Thomas wrote:
> Hi!
>
>
>
> On Wed, 2026-04-08 at 07:35 +0000, Sobin Thomas wrote:
>> Current tests focus on VM creation with basic mode selection and do
>> not
>> support overcommit scenarios.
>>
>> This change adds tests to verify overcommit behavior across different
>> VM
>> modes.
>>
>> Non-fault mode tests:
>>   - vram-lr-defer: DEFER_BACKING rejects overcommit at bind time
>>   - vram-lr-external-nodefer: Long-running mode with external BO and
>>                               no defer backing
>>   - vram-no-lr: Non-LR mode
>>
>> Fault mode tests:
>>   - vram-lr-fault: Fault handling allows graceful overcommit via page
>>     faults
>>   - vram-lr-fault-no-overcommit: Verifies NO_VM_OVERCOMMIT blocks
>> same-VM
>>     BO eviction during VM_BIND while still allowing eviction during
>>     pagefault OOM
>>
>> These tests validate that VMs handle memory pressure appropriately
>> based
>> on their configuration—rejecting at bind, failing at exec, or
>> handling
>> it gracefully via page faults.
>>
>> v2 - Added Additional test cases for LR mode and No Overcommit.
>>
>> v3 - Refactored into single api call  based on the VM / BO Flags.
>>
>> v5 - Addressed review comments (reset sync objects and nits).
>>       Added check in cleanup
>> v6 - Replaced __xe_vm_bind with xe_vm_bind_lr_sync and refactored.
>> v7 - Add failable xe_vm_bind_lr_sync to handle the failure in the
>>       vm bind in case over commit happens.
>> v9 - Replaced xe_vm_bind_lr_sync_failable with __xe_vm_bind_lr_sync
>> v10 - Add ENOSPC error, moved BO map after bind is completed.
>>        Removed special casing LR Mode.
> The naming printed out from "xe_vm --l"  becomes
>
> overcommit-nonfault-vram-lr-defer
> overcommit-nonfault-vram-lr-external-nodefer
> overcommit-fault-vram-lr-fault
> overcommit-nonfault-vram-no-lr
> overcommit-fault-vram-lr-fault-no-overcommit
>
> Some tests appear to duplicate "fault" in the name. Is that
> intentional?
There was additional print. Will fix it.
>
> The test "overcommit-fault-vram-lr-fault-no-overcommit" fails on my
> system. Was it properly tested?

Thanks for pointing this I will cross  check , However I have tested 
this on PVC and and other platforms Also CI results was positive.

> Some more comments below.
>
>> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
>> ---
>>   tests/intel/xe_vm.c | 358
>> +++++++++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 357 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>> index d75b0730d..9c8ab15a3 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -20,6 +20,7 @@
>>   #include "xe/xe_query.h"
>>   #include "xe/xe_spin.h"
>>   #include <string.h>
>> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
>>   
>>   static uint32_t
>>   addr_low(uint64_t addr)
>> @@ -2376,6 +2377,350 @@ static void invalid_vm_id(int fd)
>>   	do_ioctl_err(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy, ENOENT);
>>   }
>>   
>> +static void create_data_bos(int fd, uint32_t vm, uint32_t *bos,
>> +			    int num_bos, uint64_t nf_bo_size, bool
>> use_vram, uint64_t data_addr,
>> +			    bool *overcommit_detected, uint32_t
>> bo_flags, int gt_id)
>> +{
>> +	uint32_t placement = use_vram ? vram_memory(fd, gt_id) :
>> system_memory(fd);
>> +
>> +	for (int i = 0; i < num_bos; i++) {
>> +		int bind_err;
>> +		int create_ret = 0;
>> +
>> +		/* Create BO using the case's create function */
>> +		create_ret = __xe_bo_create(fd, vm, nf_bo_size,
>> placement,
>> +					    bo_flags, NULL,
>> &bos[i]);
>> +
>> +		if (create_ret) {
>> +			if (create_ret == -ENOMEM || create_ret == -
>> ENOSPC) {
>> +				*overcommit_detected = true;
>> +				igt_debug("BO create failed at %d/%d
>> with error %d (%s) - overcommit detected\n",
>> +					  i, num_bos, -create_ret,
>> strerror(-create_ret));
>> +				break;
>> +			}
>> +			igt_assert_f(0, "Unexpected BO create error
>> %d (%s)\n", -create_ret,
>> +				     strerror(-create_ret));
>> +		}
>> +
>> +		bind_err = __xe_vm_bind_lr_sync(fd, vm, bos[i], 0,
>> data_addr + (i * nf_bo_size),
>> +						nf_bo_size, 0);
>> +		if (bind_err) {
>> +			if (bind_err == -ENOMEM || bind_err == -
>> ENOSPC) {
>> +				*overcommit_detected = true;
>> +				igt_debug("BO bind failed - error %d
>> (%s) overcommit detected\n",
>> +					  -bind_err, strerror(-
>> bind_err));
>> +				break;
>> +			}
>> +			igt_assert_f(0, "Unexpected BO bind error %d
>> (%s)\n", -bind_err,
>> +				     strerror(-bind_err));
>> +		}
>> +
>> +		igt_debug("Created and bound BO %d/%d at 0x%llx\n",
>> +			  i + 1, num_bos,
>> +			  (unsigned long long)(data_addr + (i *
>> nf_bo_size)));
>> +	}
>> +}
>> +
>> +static void verify_bo(int fd, uint32_t *bos, int num_bos, uint64_t
>> nf_bo_size, uint64_t stride)
>> +{
>> +	for (int i = 0; i < num_bos; i++) {
>> +		uint32_t *verify_data;
>> +		int errors = 0;
>> +
>> +		verify_data = xe_bo_map(fd, bos[i], nf_bo_size);
>> +		igt_assert(verify_data);
>> +
>> +		for (int off = 0; off < nf_bo_size; off += stride) {
>> +			uint32_t expected = 0xBB;
>> +			uint32_t actual = *(uint32_t *)((char
>> *)verify_data + off);
>> +
>> +			if (actual != expected) {
>> +				if (errors < 5)
>> +					igt_debug("Mismatch at BO %d
>> offset 0x%llx",
>> +						  i, (unsigned long
>> long)off);
>> +				errors++;
>> +			}
>> +		}
>> +
>> +		munmap(verify_data, nf_bo_size);
>> +		igt_assert_f(errors == 0, "Data verification failed
>> for BO %d with %d errors\n",
>> +			     i, errors);
>> +	}
>> +}
>> +
>> +static void bind_userptr_fault_mode(int fd, uint32_t vm, uint32_t
>> bind_exec_queue, void *userptr,
>> +				    uint64_t addr, uint64_t size,
>> struct drm_xe_sync *bind_sync,
>> +				    uint64_t *sync_mem)
>> +{
>> +	*sync_mem = 0;
>> +	bind_sync->addr = to_user_pointer(sync_mem);
>> +	xe_vm_bind_userptr_async(fd, vm, bind_exec_queue,
>> to_user_pointer(userptr),
>> +				 addr, size, bind_sync, 1);
>> +	xe_wait_ufence(fd, sync_mem, USER_FENCE_VALUE,
>> bind_exec_queue, NSEC_PER_SEC);
>> +}
>> +
>> +/**
>> + * SUBTEST: overcommit-fault-%s
>> + * Description: Test VM overcommit behavior in fault mode with
>> %arg[1] configuration
>> + * Functionality: overcommit
>> + * Test category: functionality test
>> + *
>> + * arg[1]:
>> + *
>> + * @vram-lr-fault:VRAM with LR and fault mode, expects exec to pass
>> + * @vram-lr-fault-no-overcommit:VRAM with LR, fault and
>> NO_VM_OVERCOMMIT, expects bind rejection
>> + */
>> +
>> +/**
>> + * SUBTEST: overcommit-nonfault-%s
>> + * Description: Test VM overcommit behavior in nonfault mode with
>> %arg[1] configuration
>> + * Functionality: overcommit
>> + * Test category: functionality test
>> + *
>> + * arg[1]:
>> + *
>> + * @vram-lr-defer:VRAM with LR and defer backing, expects bind
>> rejection
>> + * @vram-lr-external-nodefer:VRAM with LR and external BO without
>> defer, expects exec fail
>> + * @vram-no-lr:VRAM without LR mode, expects exec to fail
>> + */
>> +struct vm_overcommit_case {
>> +	const char *name;
>> +	uint32_t vm_flags;
>> +	uint32_t bo_flags;
>> +	bool use_vram;
>> +	uint64_t data_addr;
>> +	int overcommit_mult;
>> +};
>> +
>> +static const struct vm_overcommit_case overcommit_cases[] = {
>> +	/* Case 1: DEFER_BACKING */
>> +	{
>> +		.name = "vram-lr-defer",
>> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
>> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>> +			
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> +		.use_vram = true,
>> +		.data_addr = 0x1a0000,
>> +		.overcommit_mult = 2,
>> +	},
>> +	/* Case 1b: External BO without defer backing */
>> +	{
>> +		.name = "vram-lr-external-nodefer",
>> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
>> +		.bo_flags =
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> +		.use_vram = true,
>> +		.data_addr = 0x1a0000,
>> +		.overcommit_mult = 2,
>> +	},
>> +	/* Case 2: LR + FAULT - should not fail on exec */
>> +	{
>> +		.name = "vram-lr-fault",
>> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> +			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>> +		.bo_flags =
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> +		.use_vram = true,
>> +		.data_addr = 0x300000000,
>> +		.overcommit_mult = 2,
>> +	},
>> +	/* Case 3: !LR - overcommit should fail on exec */
>> +	{
>> +		.name = "vram-no-lr",
>> +		.vm_flags = 0,
>> +		.bo_flags =
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> +		.use_vram = true,
>> +		.data_addr = 0x300000000,
>> +		.overcommit_mult = 2,
>> +	},
>> +	/* Case 4: LR + FAULT + NO_VM_OVERCOMMIT */
>> +	{
>> +		.name = "vram-lr-fault-no-overcommit",
>> +		.vm_flags = DRM_XE_VM_CREATE_FLAG_NO_VM_OVERCOMMIT |
>> DRM_XE_VM_CREATE_FLAG_LR_MODE |
>> +			    DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>> +		.bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>> +			
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> +		.use_vram = true,
>> +		.data_addr = 0x300000000,
>> +		.overcommit_mult = 2,
>> +	},
>> +	{ }
>> +};
>> +
>> +static void
>> +test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>> +		   const struct vm_overcommit_case *c,
>> +		   uint64_t system_size, uint64_t vram_size)
>> +{
>> +	uint32_t vm = 0, *bos, batch_bo = 0, exec_queue = 0,
>> bind_exec_queue = 0;
>> +	bool is_fault_mode = (c->vm_flags &
>> DRM_XE_VM_CREATE_FLAG_FAULT_MODE) != 0;
>> +	uint64_t sync_addr = 0x101a0000, batch_addr = 0x200000000;
>> +	uint64_t overcommit_size, off, data_addr;
>> +	size_t sync_size, nf_bo_size = 64 * 1024 * 1024;
>> +	uint64_t stride = 1024 * 1024, base_size;
>> +	int64_t timeout = 20 * NSEC_PER_SEC;
>> +	int i, num_bos, bind_err;
>> +	bool overcommit_detected = false;
>> +	struct drm_xe_sync bind_sync[1] = {
>> +		{
>> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +			.timeline_value = USER_FENCE_VALUE
>> +		},
>> +	};
>> +	struct drm_xe_sync exec_sync[1] = {
>> +		{
>> +			.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +			.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +			.timeline_value = USER_FENCE_VALUE,
>> +			.handle = 0,
>> +		},
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(exec_sync),
>> +	};
>> +	struct {
>> +		uint32_t batch[16];
>> +		uint64_t pad;
>> +		uint32_t data;
>> +		uint64_t vm_sync;
>> +	} *batch_data = NULL;
>> +	uint64_t *user_fence_sync = NULL;
>> +
>> +	data_addr = c->data_addr;
>> +	base_size = c->use_vram ? vram_size : system_size;
>> +	overcommit_size = ALIGN((uint64_t)(base_size * c-
>>> overcommit_mult), 4096);
>> +
>> +	num_bos = (overcommit_size / nf_bo_size) + 1;
>> +	bos = calloc(num_bos, sizeof(*bos));
>> +	igt_assert(bos);
>> +
>> +	igt_debug("Overcommit test: allocating %d BOs of %llu MB
>> each",
>> +		  num_bos, (unsigned long long)(nf_bo_size >> 20));
>> +	igt_debug(" total=%llu MB, vram=%llu MB\n",
>> +		  (unsigned long long)(num_bos * nf_bo_size >> 20),
>> +		  (unsigned long long)(vram_size >> 20));
>> +	/* Create VM with appropriate flags */
>> +	vm = xe_vm_create(fd, c->vm_flags, 0);
>> +	igt_assert(vm);
>> +
>> +	bind_exec_queue = xe_bind_exec_queue_create(fd, vm, 0);
>> +	sync_size = xe_bb_size(fd, sizeof(uint64_t) * num_bos);
>> +	user_fence_sync = mmap(NULL, sync_size, PROT_READ |
>> PROT_WRITE,
>> +			       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>> +	igt_assert(user_fence_sync != MAP_FAILED);
>> +	memset(user_fence_sync, 0, sync_size);
>> +	exec_sync->addr = to_user_pointer(&user_fence_sync[0]);
>> +
>> +	/* Create and bind data BOs */
>> +	create_data_bos(fd, vm, bos, num_bos, nf_bo_size, c-
>>> use_vram, data_addr,
>> +			&overcommit_detected, c->bo_flags, eci-
>>> gt_id);
>> +
>> +	if (overcommit_detected) {
>> +		igt_debug("Overcommit correctly rejected at BO
>> creation/bind (created %d BOs)\n",
>> +			  num_bos);
> Shouldn't there be a check for each test where overcommit is expected
> to fail that it actually gets an overcommit error at the correct
> location? Like exec() or vm_bind(). Also that it *doesn't* get an
> overcommit error where it shouldn't.
>
Currently this test only detects that overcommit occured, but does not verify where it happened will update the test to explicitly

track and assert the expected failure stage per configuration.
>
>> +		goto cleanup;
>> +	}
>> +
>> +	/*
>> +	 * Create batch buffer first in SRAM as focus is to
>> +	 * check overcommit in VRAM
>> +	 */
>> +	batch_bo = xe_bo_create(fd, vm, 0x1000, system_memory(fd),
>> 0);
>> +
>> +	igt_debug("Mapping the created BO");
>> +	batch_data = xe_bo_map(fd, batch_bo, 0x1000);
>> +	igt_assert(batch_data);
>> +	memset(batch_data, 0, 0x1000);
>> +
>> +	/*
>> +	 * Fault mode requires sync_addr to be GPU visible via the
>> VM
>> +	 * CPU local address are not accessible to GPU Page tables
>> +	 */
>> +	if (is_fault_mode) {
>> +		bind_userptr_fault_mode(fd, vm, bind_exec_queue,
>> user_fence_sync, sync_addr,
>> +					sync_size, bind_sync,
>> &batch_data->vm_sync);
>> +		exec_sync->addr = sync_addr;
>> +	}
> Here's another special-casing. The above requirement is not specific to
> fault-mode.
>
> Will make exec_sync->addr = sync_addr; across all modes .
>
>> +	batch_data->vm_sync = 0;
>> +	bind_err = __xe_vm_bind_lr_sync(fd, vm, batch_bo, 0,
>> batch_addr, 0x1000, 0);
>> +	if (bind_err) {
>> +		if (bind_err == -ENOMEM || bind_err == -ENOSPC) {
>> +			igt_debug("Setting overcommit to true\n");
>> +			overcommit_detected = true;
>> +			goto cleanup;
>> +		} else { /* Assert any bind error other than -ENOMEM
>> */
>> +			igt_assert_f(0, "Unexpected bind error %d
>> (%s)\n", -bind_err,
>> +				     strerror(-bind_err));
>> +		}
>> +	}
>> +
>> +	igt_debug("VM binds done - batch_bo at 0x%llx\n", (unsigned
>> long long)batch_addr);
>> +	/* Create exec queue */
>> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>> +
>> +	/* Use GPU to write to each BO */
>> +	for (i = 0; i < num_bos; i++) {
>> +		igt_debug("Writing to BO %d/%d via GPU\n", i + 1,
>> num_bos);
>> +
>> +		for (off = 0; off < nf_bo_size; off += stride) {
>> +			uint64_t target_addr = data_addr + (i *
>> nf_bo_size) + off;
>> +			int b_idx = 0, res = 0;
>> +
>> +			batch_data->batch[b_idx++] =
>> MI_STORE_DWORD_IMM_GEN4;
>> +			batch_data->batch[b_idx++] = target_addr &
>> 0xFFFFFFFF;
>> +			batch_data->batch[b_idx++] = (target_addr >>
>> 32) & 0xFFFFFFFF;
>> +			batch_data->batch[b_idx++] = 0xBB;
>> +			batch_data->batch[b_idx++] =
>> MI_BATCH_BUFFER_END;
>> +
>> +			/* Submit batch */
>> +			exec.exec_queue_id = exec_queue;
>> +			exec.address = batch_addr;
>> +
>> +			res = igt_ioctl(fd, DRM_IOCTL_XE_EXEC,
>> &exec);
>> +			if (res != 0) {
>> +				if (errno == ENOMEM || errno ==
>> ENOSPC) {
>> +					igt_debug("Expected
>> fault/error: %d (%s)\n",
>> +						  errno,
>> strerror(errno));
>> +					goto cleanup;
>> +				}
>> +				igt_assert_f(0, "Unexpected exec
>> error: %d\n", errno);
>> +			}
>> +			xe_wait_ufence(fd, &user_fence_sync[0],
>> USER_FENCE_VALUE, exec_queue,
>> +				       timeout);
>> +			user_fence_sync[0] = 0;
>> +		}
>> +		igt_debug("Accessed BO %d/%d via GPU\n", i + 1,
>> num_bos);
>> +	}
> If a test fails with overcommit during the bind phase, then the exec
> phase is never executed. Is that intentional, or can the exec phase be
> run on the bos that actually got bound?

At present we are focusing on overcommit detect and exiting the test 
case with the message.

Will try to check if we can exec bounded bos.

> Thanks,
> Thomas
>
>
>
>> +	igt_debug("All batches submitted - waiting for GPU
>> completion\n");
>> +
>> +	/* Verify GPU writes */
>> +	verify_bo(fd, bos, num_bos, nf_bo_size, stride);
>> +
>> +cleanup:
>> +	/* Cleanup */
>> +	if (exec_queue)
>> +		xe_exec_queue_destroy(fd, exec_queue);
>> +	if (bind_exec_queue)
>> +		xe_exec_queue_destroy(fd, bind_exec_queue);
>> +	if (batch_data)
>> +		munmap(batch_data, 0x1000);
>> +	if (batch_bo)
>> +		gem_close(fd, batch_bo);
>> +
>> +	munmap(user_fence_sync, sync_size);
>> +
>> +	if (bos) {
>> +		for (i = 0; i < num_bos; i++) {
>> +			if (bos[i])
>> +				gem_close(fd, bos[i]);
>> +		}
>> +		free(bos);
>> +	}
>> +	if (vm > 0)
>> +		xe_vm_destroy(fd, vm);
>> +}
>> +
>>   /**
>>    * SUBTEST: out-of-memory
>>    * Description: Test if vm_bind ioctl results in oom
>> @@ -2385,7 +2730,6 @@ static void invalid_vm_id(int fd)
>>    */
>>   static void test_oom(int fd)
>>   {
>> -#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
>>   #define BO_SIZE xe_bb_size(fd, SZ_512M)
>>   #define MAX_BUFS ((int)(xe_visible_vram_size(fd, 0) / BO_SIZE))
>>   	uint64_t addr = 0x1a0000;
>> @@ -3115,6 +3459,18 @@ int igt_main()
>>   			test_get_property(fd, f->test);
>>   	}
>>   
>> +	for (int i = 0; overcommit_cases[i].name; i++) {
>> +		const struct vm_overcommit_case *c =
>> &overcommit_cases[i];
>> +		const char *mode = (c->vm_flags &
>> DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
>> +					"fault" : "nonfault";
>> +		igt_subtest_f("overcommit-%s-%s", mode, c->name) {
>> +			igt_require(xe_has_vram(fd));
>> +			igt_assert(xe_visible_vram_size(fd, 0));
>> +			test_vm_overcommit(fd, hwe, c,
>> (igt_get_avail_ram_mb() << 20),
>> +					   xe_visible_vram_size(fd,
>> 0));
>> +		}
>> +	}
>> +
>>   	igt_fixture()
>>   		drm_close_driver(fd);
>>   }
