Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC39ECC6B03
	for <igt-dev@archiver.kernel.org>; Tue, 13 Oct 2026 05:32:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BC3D10E073;
	Tue, 13 Oct 2026 05:32:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CDA10E073
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Oct 2026 05:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791869497; x=1823405497;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D38Sb4Jeu/igzX6IVd95Wx+LI4gmwluE7H12Bvj113Y=;
 b=nvusDf6iFuK2p6wpHwPYBvKnkkTf6Hw3ddR1nO67L0aW5IKilc8sIYyl
 Rl5/YDc/8L9sKoUKNj63098rS9z2w/xBoVS8cUDoYL4lv+CzJuPkg4kYz
 oaJVrRKanRUJkkBqUfVF7J+BAXqaWX4LAD/ppHrC49fovS/dz+QBivy8K
 f2ucIY9UJgoVQVNr5VyGSh8guqslwT+I1vvvsjCGln2akKA91Exy/xF0C
 BeuOckVK8xnPGeS4YzNzHkoKt67w7PMDBaVnA9KP9oySrVPPKzi20AI+U
 ZZpf8AetvAu6XQTzWfEfpr7LV6poUpDAm4YPkz08oEwCOSiusDmMxAzS7 w==;
X-CSE-ConnectionGUID: 1tlERjohQaaz2SzCSKm7Kw==
X-CSE-MsgGUID: 9Wmh6PAuQuK5b0QRQMyByg==
X-IronPort-AV: E=McAfee;i="6800,10657,11933"; a="575007"
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="575007"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 22:31:36 -0700
X-CSE-ConnectionGUID: kmxWbP4UR36ob4E0FPAZiA==
X-CSE-MsgGUID: c/IhV/T9TpCiPK3Mv5woAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,155,1787036400"; 
   d="scan'208";a="2850946"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2026 22:31:35 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 22:31:34 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 12 Oct 2026 22:31:34 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.31) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 12 Oct 2026 22:31:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fvOfxS/w2XQImjWlHl2XDy7dLr9T+U3ygDf+PaNKbqd+xAyFmIJgLZvwu1nRQ0T+iKaelbXyXYh69XnmOy2LxHubKEuaH5TiwQIJfJzAS39anxOkVs3P+nLJvDckAjSIM7dlJ1ORrjGAOO64aPpBmkHnrKgoNpSZXbXP+E4t7aD69P5VvImY1hW4v3HMZ+AZwaXMZauLAGqLxKF37vd51N9R/9RX7juBY8uQ0TBmvKqZCAnjNrzk7Wh+rPPerKwBErkYQ7Cp5YO0CCs6HchXyH1sqIRVKqNZK7y8V1xtG2ibepc5gxbyhzgdXRKkrbvs3kAL8A6uHdZB3i1/D0cWFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRbkPfSXz9BfqkgmmzxmXulGPKD4lFpX76mYqxH6AAA=;
 b=jhhDEBFBY36h/KXP3gvwnZS3Hl8+AGPZrN58CgLGCDbYsHwrXm6rOoCXT2Lnqfd9/Qrt06nC2HdaDarihYZAJEgTBeMx9PVHBx/qG7GOdJDpBXsT/taPSjkQUqPi8t5XiqiqQcmrFv0j4d4+pc/DnTh6nekbMFZVPnZ1s2fY8/lW+XUK3biM0XrGjvjpWtxOUsIKj9MBFsy89tF4q9Tg6up4RPnBmHlPXrkStjVzRwDbb+9ZQvMWNG+KJWq/N+Xs4Vru9x8UOEHp98nz7qvORHfk6JuSPxq5Mtsf5fcwftX9pbq3WW/QAKysH330caDnCQas8HgSVl7yWZBVJH5U7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS6PR11MB335692.namprd11.prod.outlook.com (2603:10b6:8:4c5::21)
 by MW3PR11MB4523.namprd11.prod.outlook.com (2603:10b6:303:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Tue, 13 Oct
 2026 05:31:32 +0000
Received: from DS6PR11MB335692.namprd11.prod.outlook.com
 ([fe80::78a1:490b:60e4:6d57]) by DS6PR11MB335692.namprd11.prod.outlook.com
 ([fe80::78a1:490b:60e4:6d57%5]) with mapi id 15.21.0496.021; Tue, 13 Oct 2026
 05:31:32 +0000
Message-ID: <670491b1-0f6e-4f2a-87b4-6144da4d257a@intel.com>
Date: Tue, 13 Oct 2026 11:01:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/xe_vm: Validate host memory for
 overcommit tests
To: "Sharma, Nishit" <nishit.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@intel.com>
References: <20261010134809.2844905-1-sobin.thomas@intel.com>
 <fcbf40ff-fc1c-4fa3-8c8e-414614ef95f2@intel.com>
Content-Language: en-US
From: "Thomas, Sobin" <sobin.thomas@intel.com>
In-Reply-To: <fcbf40ff-fc1c-4fa3-8c8e-414614ef95f2@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0044.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::17) To DS6PR11MB335692.namprd11.prod.outlook.com
 (2603:10b6:8:4c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS6PR11MB335692:EE_|MW3PR11MB4523:EE_
X-MS-Office365-Filtering-Correlation-Id: 435cab49-14db-4de1-3cc9-08df28eb3d28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|260925021911599003|260925021311599003|260925022911599003|10067099003|261009223027099003|4143699003|11063799006|5023799004|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: d33t8flEDUgPAaHfCFCQuIEieo5qoPAoY4sEuZV8Irmb2OxLYGO2QL+edOmd+WUd2oycf/gM1/8jl4/0qn0kElkWejkGGaPcLCfbOvbjfYE9+ZXiFn1/Q0Z+GQHGQThbV29C8qlSoeMKdRspQdk5HNlkr80cCZF4zaVkoPLYUaA7L2EOKKzkzH8ZCRi/kaUepxjZu46Qr7vFkDLxW+vTQ3twbnUVsq3XhCgPscA2q+7xVumSeHm4Jpf136iavja6wJ+Hm4qHe7HmBZat+SKNDRNHsMgQ2QRmzwlL9etsx0bdcrJJ8/6jSDCB/bpHq+v7YB9uyxU33v4O6d88cOEiO80c/h66EvsRmlrZz5j6SFA3tYUPZRt2yN6t5GJ5Gs2dfNZR/BlT1AmTo9+fCzTfiDtah5TKZAJxus9GRI5UtPwWTRwPzW0LZrMy0oIKnXdl/Y/69jdxK49QOmgr+u4zrjju2OoD8iDxvz5RN2np1fiO/v6QUi/oZ83HTIMrnEB8IhG9xhIFIt3YfTtffmzssCJ08dmUidCz7qqqGXn9is3Y9VKwBjR6j5QuWvXKW4HXIcBvDvHhO1nehnLbuZSMC12QjTuyYHZAQfOKM6Hieqq/vCr0403lUAN8wC0F/3OCHrGBSFQ74VhPzhxfohwyVi3kWj8E/6NPbjOvFcqcMv4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS6PR11MB335692.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(260925021911599003)(260925021311599003)(260925022911599003)(10067099003)(261009223027099003)(4143699003)(11063799006)(5023799004)(6133799003)(22082099003)(18002099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YTZvM0lFdzREMkdJOVBYZFpwYm51bWxWK0VtK0pTWWxTSENkT01Hd0tpMmhw?=
 =?utf-8?B?U3k2NHl5SFlpYnJUVXJJUjJvWGsreWNCTDA3ajdEMHJFYy9rblNUdXJNYXdn?=
 =?utf-8?B?d3o0OXBpUWlQcTE5SGRnanIvbEZ1T0hiMnNYTlRWcFZwaGdaZ0hrT0I1cGVo?=
 =?utf-8?B?S3dIQkNBMGtVUnlNS0NDK2QyZDRtUklKR1RXWU1GSnVOem9wb2llNWcyWXFj?=
 =?utf-8?B?bW9DL28yWUJHNmlhcFBBUnhXaThYL21zT3ExZkxlenhQeExNdjBBRXBkU0F6?=
 =?utf-8?B?R1NVclBtUzlYbWhDdTJISWJjb2RpajRjRzI1dFNtODB5SnhtMmcxMHJYRUd1?=
 =?utf-8?B?OUovR0kzQWFvMmQvOEl4RkRPTWNrc1BYVXR4a1FZZmw4UkZibjl4T1dGVkJO?=
 =?utf-8?B?L0prTy9RL0JBRjlCZURQOUNTWHNrbWxOQW5WMGJqaExRWjd1UmgxRFdyMHZH?=
 =?utf-8?B?NEpQMDZwQWVuMG96eERqMjZheWY3NGx5MDhLUlNpd3pPVlNaM2NQK3FoRk9V?=
 =?utf-8?B?eVdYdkh2ay9VTG5Nc3NIQlY5ZjRCdmcxT1hrTFlEM2xvMUttS2dSR2JPSEJh?=
 =?utf-8?B?ZTZTOGtVVUowT252WElLMldNcVZPNG1pRFV0R1VBQ29obVFEUDBPOVBUdzAw?=
 =?utf-8?B?WVl3aG9id1FQeHJVK1FjRmdPa3h5U3J5bHNrMGFrblUwdktnTUl4bXhtZ1J5?=
 =?utf-8?B?Z3dYUkEvR0RaRlFtcEVqT3pURkxYSjNiV1l2TUx4TjZRb2F0WmVjNWhoMU5R?=
 =?utf-8?B?elRUM3lGOTl2bHJMbnZpNTNGanB0WkNZbi9XeE1kK05UUG5hU2FBekJQbkpG?=
 =?utf-8?B?ZTJLZngzL0RxYStkL0x4bnkwaEdTdUtQWlltclFGdGo0bWxGaDh1ekF6cm5V?=
 =?utf-8?B?R1pWMUkycU1LV1RZUENaclpaOVgvZXNuall4SWR0c24wSUtQTEc0bHBqblpX?=
 =?utf-8?B?RTl4RFErdmRyWGVYbWZNdUFMQTVoeldGWkRzcnFrV2pCdVdtMjBzY21kUWVE?=
 =?utf-8?B?SkI3enJNd3c3VDRoWGlEN3pQbXU0YXRYckUrSXpYL3gwUGVNSXNUbVRVZDNp?=
 =?utf-8?B?ZWNKbmliN1hoeDJaZWN3TjVveFZjQVZqaU9Kc0dpS05BN1ZROW81TmMxNWRJ?=
 =?utf-8?B?MVgzOWtZczA3V3I2SHIvZ3l2ZTZZd29IcWVBV0JmSlVZa2cwQWRLMXJVcjR5?=
 =?utf-8?B?aURlQkFJNGsxSG8zVTB3RXlVL08wT2NmSU1zdFF4dHdGY2NQSzFTM3JuRVd3?=
 =?utf-8?B?UnZGMXdXR0FFZ3NWMnN1ZzZ1NS9HUHZrWWYzNUJpN0J2SCtNcTQ0bTI1Ymp2?=
 =?utf-8?B?UXNuUVJEdUMxclREdmpublZsSHhMY2VpOVc4WGxsbFVDL0E1TFN6ZHl1djY1?=
 =?utf-8?B?QUNocitodUw4TEFwQ09WTkJEaVJrbnc5Y2orVWhjd2o2azdPVEwrS3MvTzF4?=
 =?utf-8?B?QW5DcUJqL3l4bmFneXdvemVySXJUamtQcWg5Zmp2N2IybU9oUHJqYkw2SGdi?=
 =?utf-8?B?ZTJoRGkzR01WNzNkR2ZMRlRoSStMMHd5K3FaR2d0MjJodGtOTDkrZXlJTFRx?=
 =?utf-8?B?MHpybU5WU2w4UFpVZEJPRTd5aFNwaGNTVkR3cmdLR0VvMGkwbm9aTmdYdVJm?=
 =?utf-8?B?WDAzVWdwZ25uOXFoRnBEWUtIaDkySjRnV2preDVvcXErSW93bEJmMlp2bmk4?=
 =?utf-8?B?UUxSVEdERDBEaGRGc2JwNzIyZ09hZHpmNDBMTUtyck5wcitEa21QeFMxcGJD?=
 =?utf-8?B?SjA3ejZPMEVyMWNqU3J0OTEzUjlNVCtrZTBSWVBXQmZpSmpKTEZQYWhiRDhR?=
 =?utf-8?B?a2VFeGc0RUpjMGoveWFReXhTbDMrM1kxVUVNWVVQU1FZNHorSGEvQTgvdmxp?=
 =?utf-8?B?akx1L0pLejVZZEZGWTBXTWlsdm9GVkszbFc4OFN2UmhiUDZWUExaU0IyOWlZ?=
 =?utf-8?B?NmpCcndSS2svYkM0RWpxUUMxVjlleWdYVnZ4aGxUUU1WZFAvS0VNS0NDSGZK?=
 =?utf-8?B?U0xhWnVuYytJeDR0QzAvRjNZVk9LOStoQ0V5WGk3Sit1SHIxQlZXQ25HYUto?=
 =?utf-8?B?RnZtMWpCb1Y4R0IzVGNHWTBVT2txK01Dc2lmckRwM2FZbEVaSEJuUmN5M2J4?=
 =?utf-8?B?NWdSM2JsQmh6TUxZTjB1YTlkcmNGUnh2TnNBeHNaTSs5amRRV05VMis0SW9I?=
 =?utf-8?B?SkdJLytIa3FQTjNpRkNBdWFzMlJzWUdYNnB5enpvOStDT1R3TnBnc1FwMTFC?=
 =?utf-8?B?VWN0eUFRbGFzb2tiS1F0MWxGNFAvRzQ3c1J1aHFMQkI0RUk5OHhXRHVrWWRQ?=
 =?utf-8?B?bkpLU1IxU001OWdDOWFnTXAvSkJLM1U0V0M2WFhOZXBpOHZPSTVrdz09?=
X-Exchange-RoutingPolicyChecked: ncu1MRHzzuxcPEvpO9NPKFTKXX7p5Y/BneE5b+vppoVU23Xtdb4SqOU/BuU89gTXnWZImyjBSMahaydrjWLnyw0sv4gwdBxeEz3NPId3b597tcs5TG9Lz91S6szZpDVcsJvRiBPAEN3V+Q8xpYNOzyNNHCJSufGDgigdKrJ6hZKDf/iCjCtvqysdyMGEApvflFhScpEbHBzWMEDREeMgbyAOfncM579XFMYhV+WLwipaQT3vnCBTXXV1YG5grUrA3qAXfolUb0bdP7w5zktMgzkPB8r6UFOvH18FhEu3Ni5HRXuH3yu78VwhJfcSJIFoIrog6s+5ss14ATCSnk4mEQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 435cab49-14db-4de1-3cc9-08df28eb3d28
X-MS-Exchange-CrossTenant-AuthSource: DS6PR11MB335692.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 05:31:32.1616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jj5Y9qT2HUWgmCSkDpqHJkWImNG9yxN+Y4Y9a8kI4hjxpGkxCUKNzJb4LoBzeIg9aNA3S7w0jbjFceOrUfkRcQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4523
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


On 10/12/2026 11:29 AM, Sharma, Nishit wrote:
>
> On 10/10/2026 7:18 PM, Sobin Thomas wrote:
>> The amount of VRAM available for the overcommit tests varies
>> across platforms. As a result the host RAM space required to
>> support the overcommit workload also varies based on eviction.
>>
>> Query the platform RAM space and visible VRAM before running
>> overcommit tests. Limit the overcommit working set to 50% of
>> the currently available RAM.
>>
>> v2:
>> - Base host-memory requirement based on the run time budget
>> - Drop user_vram and SRAM Handling; all the cases are VRAM
>>
>> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
>> ---
>>   tests/intel/xe_vm.c | 48 ++++++++++++++++++++++++++++-----------------
>>   1 file changed, 30 insertions(+), 18 deletions(-)
>>
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>> index 1d109e783..5598c8ae7 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -2385,10 +2385,10 @@ static void invalid_vm_id(int fd)
>>   }
>>     static enum overcommit_stage create_data_bos(int fd, uint32_t vm, 
>> uint32_t *bos, int num_bos,
>> -                         uint64_t nf_bo_size, bool use_vram, 
>> uint64_t data_addr,
>> +                         uint64_t nf_bo_size, uint64_t data_addr,
>>                            uint32_t bo_flags, int gt_id, int 
>> *num_bound_out)
>>   {
>> -    uint32_t placement = use_vram ? vram_memory(fd, gt_id) : 
>> system_memory(fd);
>> +    uint32_t placement = vram_memory(fd, gt_id);
> Here if vram is not available (iGPU) it'll return 0 and bo creating, 
> cpu_caching will be happening using 0 placement which is wrong. 
> vram_if_possible(fd, gt_id) should be used.


The overcommit subtests are VRAM-only: the caller has 
igt_require(vram_size), so on iGPU
the subtest skips before create_data_bos() is reached and placement 0
is never used.


>>         *num_bound_out = 0;
>>   @@ -2497,7 +2497,6 @@ struct vm_overcommit_case {
>>       const char *name;
>>       uint32_t vm_flags;
>>       uint32_t bo_flags;
>> -    bool use_vram;
>>       uint64_t data_addr;
>>       int overcommit_mult;
>>       enum overcommit_stage expected_stage;
>> @@ -2510,7 +2509,6 @@ static const struct vm_overcommit_case 
>> overcommit_cases[] = {
>>           .vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
>>           .bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>>                   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> -        .use_vram = true,
>>           .data_addr = 0x1a0000,
>>           .overcommit_mult = 2,
>>           .expected_stage = EXPECT_BIND,
>> @@ -2520,7 +2518,6 @@ static const struct vm_overcommit_case 
>> overcommit_cases[] = {
>>           .name = "vram-lr-external-nodefer",
>>           .vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE,
>>           .bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> -        .use_vram = true,
>>           .data_addr = 0x1a0000,
>>           .overcommit_mult = 2,
>>           .expected_stage = EXPECT_BIND,
>> @@ -2531,7 +2528,6 @@ static const struct vm_overcommit_case 
>> overcommit_cases[] = {
>>           .vm_flags = DRM_XE_VM_CREATE_FLAG_LR_MODE |
>>                   DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>>           .bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> -        .use_vram = true,
>>           .data_addr = 0x300000000,
>>           .overcommit_mult = 2,
>>           .expected_stage = EXPECT_NONE,
>> @@ -2541,7 +2537,6 @@ static const struct vm_overcommit_case 
>> overcommit_cases[] = {
>>           .name = "vram-no-lr",
>>           .vm_flags = 0,
>>           .bo_flags = DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> -        .use_vram = true,
>>           .data_addr = 0x300000000,
>>           .overcommit_mult = 2,
>>           .expected_stage = EXPECT_EXEC,
>> @@ -2553,7 +2548,6 @@ static const struct vm_overcommit_case 
>> overcommit_cases[] = {
>>                   DRM_XE_VM_CREATE_FLAG_FAULT_MODE,
>>           .bo_flags = DRM_XE_GEM_CREATE_FLAG_DEFER_BACKING |
>>                   DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM,
>> -        .use_vram = true,
>>           .data_addr = 0x300000000,
>>           .overcommit_mult = 2,
>>           /*
>> @@ -2568,15 +2562,14 @@ static const struct vm_overcommit_case 
>> overcommit_cases[] = {
>>     static void
>>   test_vm_overcommit(int fd, struct drm_xe_engine_class_instance *eci,
>> -           const struct vm_overcommit_case *c,
>> -           uint64_t system_size, uint64_t vram_size)
>> +           const struct vm_overcommit_case *c, uint64_t vram_size)
>>   {
>>       uint32_t vm = 0, *bos, batch_bo = 0, exec_queue = 0, 
>> bind_exec_queue = 0;
>>       uint64_t sync_addr = 0x1000000000, batch_addr = 0x200000000;
>>       int i, num_bos, num_bound = 0, bind_err, create_ret, wait_ret;
>>       size_t sync_size, nf_bo_size = 64 * 1024 * 1024;
>>       enum overcommit_stage actual_stage = EXPECT_NONE;
>> -    uint64_t stride = 1024 * 1024, base_size;
>> +    uint64_t stride = 1024 * 1024;
>>       uint64_t overcommit_size, off, data_addr;
>>       int64_t timeout = 20 * NSEC_PER_SEC;
>>       struct drm_xe_sync bind_sync[1] = {
>> @@ -2607,10 +2600,15 @@ test_vm_overcommit(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>       uint64_t *user_fence_sync = NULL;
>>         data_addr = c->data_addr;
>> -    base_size = c->use_vram ? vram_size : system_size;
>> -    overcommit_size = ALIGN((uint64_t)(base_size * 
>> c->overcommit_mult), 4096);
>> +    overcommit_size = ALIGN((uint64_t)(vram_size * 
>> c->overcommit_mult), 4096);
>>         num_bos = (overcommit_size / nf_bo_size) + 1;
>> +    igt_debug("Overcommit sizing: case=%s multiplier=%d "
>> +          "vram_size=%" PRIu64
>> +          " MiB overcommit_size=%" PRIu64 " MiB "
>> +          "bo_size=%" PRIu64 " MiB num_bos=%d\n",
>> +          c->name, c->overcommit_mult, vram_size >> 20,
>> +          overcommit_size >> 20, nf_bo_size >> 20, num_bos);
>>       bos = calloc(num_bos, sizeof(*bos));
>>       igt_assert(bos);
>>   @@ -2632,8 +2630,10 @@ test_vm_overcommit(int fd, struct 
>> drm_xe_engine_class_instance *eci,
>>       exec_sync->addr = to_user_pointer(&user_fence_sync[0]);
>>         /* Create and bind data BOs */
>> -    actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, 
>> c->use_vram, data_addr,
>> +    actual_stage = create_data_bos(fd, vm, bos, num_bos, nf_bo_size, 
>> data_addr,
>>                          c->bo_flags, eci->gt_id, &num_bound);
>> +    igt_debug("Overcommit BO creation: case=%s actual_stage=%d 
>> num_bound=%d/%d\n",
>> +          c->name, actual_stage, num_bound, num_bos);
>>       /*
>>        * On EXPECT_CREATE nothing was bound so bail out entirely.
>>        * On EXPECT_BIND with no BOs bound there is nothing to execute 
>> either.
>> @@ -3499,10 +3499,22 @@ int igt_main()
>>           const char *mode = (c->vm_flags & 
>> DRM_XE_VM_CREATE_FLAG_FAULT_MODE) ?
>>                       "fault" : "nonfault";
>>           igt_subtest_f("overcommit-%s-%s", mode, c->name) {
>> -            igt_require(xe_has_vram(fd));
>> -            igt_require(xe_visible_vram_size(fd, 0));
>> -            test_vm_overcommit(fd, hwe_non_copy, c, 
>> (igt_get_avail_ram_mb() << 20),
>> -                       xe_visible_vram_size(fd, 0));
>> +            uint64_t vram_mb = xe_visible_vram_size(fd, 0) >> 20;
>
> VRAM-size query repeated. Called here and below in 
> test_vm_overcommit(). use something like
>
> uint64_t vram_size = xe_visible_vram_size(fd, 0);
>
> uint64_t vram_mb = vram_size >> 20;
>
Done. The visible VRAM size is now queried once in the subtest:

     vram_size = xe_visible_vram_size(fd, 0);
     igt_require(vram_size);
     vram_mb = vram_size >> 20;

The cached value feeds overcommit_size, num_bos and required_mb.
test_vm_overcommit() no longer takes or re-queries the VRAM size;

it only receives num_bos.


>
>> +            uint64_t avail_ram_mb = igt_get_avail_ram_mb();
>> +            uint64_t ram_mb = igt_get_total_ram_mb();
>> +            uint64_t required_mb = 0, budget_mb = 0;
>> +
>> +            igt_require(vram_mb);
>> +            igt_debug("Overcommit sizing: case=%s multi=%d ram=%" 
>> PRIu64 " MiB\n",
>> +                  c->name, c->overcommit_mult, ram_mb);
>> +            igt_debug("Overcommit sizing: mode=%s avail_ram=%" 
>> PRIu64 "MiB vram=%" PRIu64 "MiB\n",
>> +                  mode, avail_ram_mb, vram_mb);
>> +
>> +            required_mb = ALIGN(vram_mb * (c->overcommit_mult - 1), 
>> 64) + 64;
>> +            igt_require_f(required_mb <= avail_ram_mb * 50 / 100,
>> +                      "Overcommit needs %" PRIu64 " MiB, over 50%% 
>> of RAM + swap %" PRIu64 " MiB)\n",
>> +                       required_mb, avail_ram_mb);
>> +            test_vm_overcommit(fd, hwe_non_copy, c, 
>> xe_visible_vram_size(fd, 0));
>
> Target and BO count were being recomputed. It can be calculate BO 
> count and Target once and pass them as argument in test_vm_overcommit. 
> Something like
>
> uint64_t overcommit_size, bo_size_count, require_MB; --> randomly used 
> these variable names, change them
>
> int number_bo;
>
> #define OVERCOMMIT_BO_SIZE (64 * 1024 * 1024)
>
> overcommit_size = ALIGN(vram_size * c->overcommit_mult, 4096);
>
> number_bo = (overcommit_size / OVERCOMMIT_BO_SIZE) + 1;
>
> total_bo_size = (uint64_t)number_bo * OVERCOMMIT_BO_SIZE;
>
> igt_assert(total_bo_size, vram_size);
>
> required_mb = ALIGN((total_bo_size - vram_size + ((1ull << 20) - 1)) 
> >> 20, 64) + 64;
>
> test_vm_overcommit(fd, hwe_non_copy, c, vram_size, overcommit_size, 
> number_bos);
>
> overcommit_size and BO count computation can be removed from called 
> function
>
>>           }
>>       }


Done. The target size and BO count are now computed once in the
subtest and test_vm_overcommit() no longer recomputes them:



