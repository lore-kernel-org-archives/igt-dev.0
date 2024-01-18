Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C954C4707B
	for <igt-dev@archiver.kernel.org>; Thu, 18 Jan 2024 10:38:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF01310E76C;
	Thu, 18 Jan 2024 10:38:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08AEE10E76A
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Jan 2024 10:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705574314; x=1737110314;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=S3QOI1+6cPLIfYXDsyxsukk817uaYaQytMB8G8N1ZV0=;
 b=jzqJWV8N2/Fc+1Gg7wVQ5+8zw5m37p5stfEHJjkixM2OBXzqAq/jTofK
 NpUCOFCSw+aVK/hPE97esigUrr2Kj8d8+ZpPxv/AXVGVcAdJ++PzAdzzB
 LnVxPGqJhRnOkCi9TWqPFT4FDXX3S6G5WhhIFjX8D80o/JEnWIuo/nOsV
 4HJU5/DEhucP5JdMHqLrxUNQ25IaId6KLvSYVDdily3bSPlYuxjlrcYP7
 Fhq3wdp8LqJgOpe1dkMDf6/ZqSFrOPfapfM3+R+QQyqseECG21Si0kE/R
 VDEQIZVG6tFxzw+4WShKg6Ae1QxuLYoqdl7Ql3/Wa5oJYHw0ogBV+Ee/Q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="19008166"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="19008166"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 02:38:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="760828200"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; d="scan'208";a="760828200"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jan 2024 02:38:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 02:38:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 02:38:33 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 18 Jan 2024 02:38:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZqOGHouoWUpHB1vfsb7CLLJTHyrPzZE6kCjq5QwBJ/fdQ5fb+H8ny7QiIduaBTK7r8biuqWWTXQs+cxOVRsOtDQaZ3bjD8FCVQXOhPi77RnK/TwU/bvv5HYhbj1/s1gqaSuMa1pNMh8W2x/FsrZR+WvOS8A6+ZS7URTRWpibBEu2RNNIWebrQhVu8j6TGbMZE6p/hgPeS5qZOjTY2OKzQJdeHZwlwOxQpL3v3nsZkOQ8hPOGhYaxo9bafPfcURj5YMuXKKZJosmGzlWBHt/pDXJUp0MmgS6UqoD6zW7/QAzZRLGeJ+As4Y3sZ+sSxOzt23fS8kGeLmMTHrK8jPZpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yRSP9UVvls8OsPkDlljkA1yIoVoCBDsYuLOI4Ul4m4A=;
 b=fbfBwizmjoAelTXxYwcCgDgmGbXPCPUYvyYWzKB4sUZ761oqUNg0Cns7Ycojx+ecq/or4RciGROks/0aXiDAkJUgQ76NoFYnn85lvGJAAHshiMesqrdS2Dm7t/9khyk1hSs5K+y95jC9w+Pz5noSA50FkkT33ASKjokHBRHo4Jxu3uTBK3Rc3rYKJ0E3HRbJe41CSGcuZNNRWk1eBt5NHaDh0631H8+VjChzjSWOvxIMIfKd9tEhHtQgtQv75N3uvfKByIcOX43YL9B11m2Eavrulza/cOEOhYqGrXeQzW0MX6OB86KsgxVykWFCZUXxvvr6kYn5E56y4CAjoDq/oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by MW4PR11MB6933.namprd11.prod.outlook.com (2603:10b6:303:22a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Thu, 18 Jan
 2024 10:38:25 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::9cbe:76c6:c834:b88c]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::9cbe:76c6:c834:b88c%7]) with mapi id 15.20.7202.024; Thu, 18 Jan 2024
 10:38:24 +0000
Message-ID: <f9be4e23-d5d5-4f7e-bd62-a25739ec1266@intel.com>
Date: Thu, 18 Jan 2024 16:08:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] lib/igt_kms: add support for choosing big
 joiner mode
To: "Joshi, Kunal1" <kunal1.joshi@intel.com>, "Modem, Bhanuprakash"
 <bhanuprakash.modem@intel.com>, "Sharma, Swati2" <swati2.sharma@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20240115105854.827266-1-kunal1.joshi@intel.com>
 <20240115105854.827266-3-kunal1.joshi@intel.com>
 <b5389ad8-8b98-4c04-b337-e39e7d20f5cb@intel.com>
 <0173fd3b-cf12-4aa1-977e-a994af9c91b0@intel.com>
 <6f95475b-1d5c-43ba-9fe3-310475ef7898@intel.com>
 <8fbaa612-67e2-4d7d-9f0b-eefd394ddf93@intel.com>
 <407a6e9e-b0be-4b67-bbde-94f51a46fe52@intel.com>
 <c5ebf27a-ef80-4ebc-b1d5-95ddd7a629d7@intel.com>
 <29fe498d-56b7-4d65-b3e4-42172c17f404@intel.com>
 <dac7774b-b91c-4cb4-87f9-a4d59d77e878@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <dac7774b-b91c-4cb4-87f9-a4d59d77e878@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0010.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::11) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|MW4PR11MB6933:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c35c019-9d0a-4cb1-3a34-08dc1811995a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dnmiZnATbmKBG3kjsSdtm8kykDLhUdlnuXx2sorFbguLds27hZOjl8s+zjWiFSQqmF9js+CYQDwHhOWmNLG81iPbvm5S3XYqxiESjQ1gJSZQ4vgVZ/A2aJuUmaJYXpKeYjT6v4P7uKHj3e1J+DWZ+iFwjUzeX7Oi9p4CJcqMtPX6k/z+/lGZ9Et3Gh7pt8m+TgacxdoFCy5LyWnKD8kOAimM5i9pw/p0R/ChMVXUUU76J0cssLcb/l7+M46f7StMGw28u8VLC8TBBUXJ5d2wBs6/g8sv5VF52PFkQcVngizELG6cQdm5NBN1Frajsih0Mjk4ySp0DrHRvz3DXEf/dIaNI2c3ePxRlGMG84WH6h/iNnWL4OIOx9l9KWM4I39TQWI0AQz40+AuXDNPp2bpOBWubxXcs1MZlL7DWVxCTo1Y2VKUnQYpTqgOUQW1/CM/fa49j+jwj0bpWxo/cxyqMRRCRV6hzLKqO0JY+0VATWj+ckIr+EGsVfnRxnD38PU/gbe/RxJaIBG5uttkUz1mYZyQhygub/Pcbml7cgKCQJZSoxGyg/gN7nUxjW+L55eFiPouYd9Q3S2cDroKa17EaBOkD2714Iv0SUfHJ6bY+jeFTfdhww7RczCGp7w5JjZi7nUa61DUDOQcVaSN42DgLQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(376002)(39860400002)(346002)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(8936002)(6666004)(8676002)(53546011)(6506007)(41300700001)(26005)(36756003)(5660300002)(2616005)(38100700002)(2906002)(31696002)(86362001)(83380400001)(82960400001)(6512007)(316002)(66476007)(6486002)(66556008)(66946007)(110136005)(478600001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3JzemNaQk5zTXR6T3g2eUFUZUtkRFJMMzlNcThaNzI4Y1RkOW1tdWM2aUlq?=
 =?utf-8?B?YW5DV0xSQ2hIUnR0UjRad0VHZHZTNlczb1ZFMm9ET0VNMnlhSWFoVjhObWZX?=
 =?utf-8?B?V1RwM2k2NVREcGUrN2dkYU1TRU5OaDlWQmZWVWRYaVIvTnBKL1BlVWdFWEJl?=
 =?utf-8?B?UThJQXBUQnAzdkdFc0Y3ZWR1RTJxZVBRemdxSXBxS1FwV2dRWTlqcGZSNzdT?=
 =?utf-8?B?ZzBnTDYydmpoTnVVTS9ZT3pxVk9SQWllZE9BOU1CQjdXK2U0cFA1V2lDVDJW?=
 =?utf-8?B?UFZoR25OTjdpbnFQQTBweDNWK3JhWmlQK0VsNVo0Nm5xSWdFdnpQcXRhWWxT?=
 =?utf-8?B?Nzd1elNNUTArWDIwL0h0aTF1ZlBaNVZBQlYyaThLV0R0OTZnQW9NTFk0dEVM?=
 =?utf-8?B?QkJPc092R2VOQTZtbExUcGtiOUxTbitHTWlNYmE4SWoxQjlZaGxnRWdjQlYy?=
 =?utf-8?B?VWpkQndleEJQRjVqM2c3K0FHL2VXVnVXOUxnU3FFMi9RdDhRL3lTQXQzMjQ5?=
 =?utf-8?B?ODVuYS8wWkhNR1RPNEdyTUIwZEpscTUzQWg0cjVTOGFyK2JnN3MvMDNxbjF6?=
 =?utf-8?B?Y1JTUVp1N056bEFPWDU1cFR3eHBFclRuM1I5RGkxVmV1WVlMK0FES1lpVW5m?=
 =?utf-8?B?RFRVMnk0UXBVQXlYbzNjS1d6dDB1Ly8yemRKVWNxeTlmVHdyb0pUTVZRdzNz?=
 =?utf-8?B?bkx3THU5bVNFRXF6M3k4b3Y5ZWdTZjZQZWJQblhDMCtwSEg5VEFFdUVQcmlU?=
 =?utf-8?B?UjBuek83S2g5Q21LQWdramhxZ25hdDlJSlpCazgzbk1IWkFNVkF3WXA0MHFG?=
 =?utf-8?B?ZGdNOE9nUDJXOW9ZaFY0eEU2d08vV0NZMWIxTDl2UmdJU3gwYVJsTWk2NGxJ?=
 =?utf-8?B?OFU2SzNLUjhVV2VnS1JwTENQTTRZSzZ3clZPVmNVRmg0Rk1HWE9WMURSMjNk?=
 =?utf-8?B?WXBITHg3QTZieFpKSEpacitvYXZETTlMOVhlZmVzbG8zM3RLKzVMYXdXMTR0?=
 =?utf-8?B?cW5qSjNTQ1VuOEErMlM1UXVMaEc5V1dSbkZETHAvSk9hNmF0Ynp4K2ZuK0ZP?=
 =?utf-8?B?ZEJpZ3BHY3pHZVpxbzVUblBiTjZGaWtBeU5BOUVSekhnYllucnozQ0RTQ3Fw?=
 =?utf-8?B?c2pEa0RBS1MvUWJhRloyVkZVZTd5bXlLQzRKL3ErYWMxVHQvYUVwajd6TGt3?=
 =?utf-8?B?RmlTallhL2tMTlhkeGROalRkZHI5YlQvRXIwTVRKWFFQbDNabXUxTTV2RWZz?=
 =?utf-8?B?Z1hUb0czTERUdWtiSjA1U08vai9vM2dYNXZPdnBsUEVXTkk4dU5QdmtudGth?=
 =?utf-8?B?b2UzNkZUekVNemVVVUczMWVIcjcvOVJrOElBRzdxY3RJQzNzd2sxOWJvQXQy?=
 =?utf-8?B?bHYzTXJ6Rks0S05XenVwYSsrYlZlWTVCU1lsT2RRVFgyeTkycUF6bjlJaGJr?=
 =?utf-8?B?OTRwNFluSU5ESUZjTUN5SmJ2dVJhbFNhYXJRc1RKVFI4RVF3ZHFkakZYYXZW?=
 =?utf-8?B?U0twRXRzUmZnaFU4K0kwR2R6NWlRbDJmUER1WTBoVFg3MU94UmZXb0Niajcv?=
 =?utf-8?B?UzU2Nk5INTY4MHNqbVQ0QkVXTFFPZ1hGbmlxdVNPbDQvOVVueUt5bHYzWEkv?=
 =?utf-8?B?ZFJqbmtNdGsrYysxSkZZS05JOGRiWWNER1M5MVNiWCtYUWkvRWVZUnpscHp3?=
 =?utf-8?B?OFFJbkFkU3JXdUVLU0VOV21XMkF5STZMbTAwdFNXZEVWZTR4d2ViZjNmMysv?=
 =?utf-8?B?bU1FU1F4cnNrM01CNy9EdG5WSzlUclR6VkNtUW0rNk96Q2NnaHZmM0loQTkr?=
 =?utf-8?B?OTJRYllRR3dvcjgyTXNuNzg1Y3YvRmZVKzFZTXhab2hJRXJ5MXl1dWJsa1Bu?=
 =?utf-8?B?RjNqRHliQjFPeDFQdjZvNEttUHlUbkdWN2FWYmJUNEVaVENzbkU1Z2ZuUjkv?=
 =?utf-8?B?V1VCUUtUMXRsOEpLNm53SVM2ZDRZdDFBQy91ZTZiRzcvZDROdlFET092N0RQ?=
 =?utf-8?B?Y21mOHJ2U2NLNys3Wjc3djdJb1prZm1DQUNVQzJXVE9VSzlCdWpuQWhtUHA4?=
 =?utf-8?B?eWdqT1VmYzhuWXB1RWlDSTVETklrVEVpajU3RTlFMDNUcGlEMmIxeWhJUlUx?=
 =?utf-8?B?Zkc5aXNVUlNrUFd2OFZhWXJzdXp5MnR1R3FMdkhLRE1ud202R1FNSVRReW5Z?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c35c019-9d0a-4cb1-3a34-08dc1811995a
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2024 10:38:24.7120 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x6SwzkTbTRvzcjDAmaZ+d5ZT0ocYk80Ncu8QumaHaL4a8A+Q0oyg9nYzyX24q6N4ql69pwCF88ktbavVPyDA8m7cGRMVrPO0MksCN/6Ep/U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6933
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


On 1/18/2024 2:44 PM, Joshi, Kunal1 wrote:
> Hello Bhanu,
>
> On 1/18/2024 2:40 PM, Modem, Bhanuprakash wrote:
>>
>> On 17-01-2024 02:44 pm, Joshi, Kunal1 wrote:
>>> Hello Swati and Bhanu,
>>>
>>> On 1/17/2024 2:25 PM, Sharma, Swati2 wrote:
>>>> Hi Kunal,
>>>>
>>>> On 17-Jan-24 11:14 AM, Joshi, Kunal1 wrote:
>>>>> Hello Swati,
>>>>>
>>>>> On 1/16/2024 5:33 PM, Sharma, Swati2 wrote:
>>>>>> Hi Kunal,
>>>>>>
>>>>>> On 16-Jan-24 5:29 PM, Joshi, Kunal1 wrote:
>>>>>>> Hello Swati,
>>>>>>>
>>>>>>> On 1/16/2024 4:34 PM, Sharma, Swati2 wrote:
>>>>>>>> Hi Kunal,
>>>>>>>>
>>>>>>>> On 15-Jan-24 4:28 PM, Kunal Joshi wrote:
>>>>>>>>> add support to choose big joiner mode with environment
>>>>>>>>> variable, use mode with highest clock if no mode with big joiner
>>>>>>>>> found.
>>>>>>>>>
>>>>>>>>> v2: reuse bigjoiner_mode_found (Bhanu)
>>>>>>>>> v3: avoid returning from multiple places (Bhanu)
>>>>>>>>>      avoid frequent debugfs reads (Bhanu)
>>>>>>>>>
>>>>>>>>> Cc: Karthik B S <karthik.b.s@intel.com>
>>>>>>>>> Cc: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>>>>>>>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>>>>>>>>> ---
>>>>>>>>>   lib/igt_kms.c | 24 +++++++++++++++++++-----
>>>>>>>>>   1 file changed, 19 insertions(+), 5 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>>>>>>>>> index cb6d57c2d..2c4210d4b 100644
>>>>>>>>> --- a/lib/igt_kms.c
>>>>>>>>> +++ b/lib/igt_kms.c
>>>>>>>>> @@ -1771,8 +1771,9 @@ void 
>>>>>>>>> igt_sort_connector_modes(drmModeConnector *connector,
>>>>>>>>>   bool kmstest_get_connector_default_mode(int drm_fd, 
>>>>>>>>> drmModeConnector *connector,
>>>>>>>>>                       drmModeModeInfo *mode)
>>>>>>>>>   {
>>>>>>>>> +    bool found;
>>>>>>>>>       char *env;
>>>>>>>>> -    int i;
>>>>>>>>> +    int i, max_dotclock;
>>>>>>>>>         if (!connector->count_modes) {
>>>>>>>>>           igt_warn("no modes for connector %d\n",
>>>>>>>>> @@ -1781,21 +1782,34 @@ bool 
>>>>>>>>> kmstest_get_connector_default_mode(int drm_fd, 
>>>>>>>>> drmModeConnector *connector,
>>>>>>>>>       }
>>>>>>>>>         env = getenv("IGT_KMS_RESOLUTION");
>>>>>>>>> +    max_dotclock = igt_get_max_dotclock(drm_fd);
>>>>>>>>>       if (env) {
>>>>>>>>>           /*
>>>>>>>>> -         * Only (0 or 1) and (lowest or highest) are allowed.
>>>>>>>>> +         * Only (0 or 1 or 2) and (lowest or highest or 
>>>>>>>>> joiner) are allowed.
>>>>>>>>>            *
>>>>>>>>>            * 0/lowest: Choose connector mode with lowest 
>>>>>>>>> possible resolution.
>>>>>>>>>            * 1/highest: Choose connector mode with highest 
>>>>>>>>> possible resolution.
>>>>>>>>> +         * 2/joiner: Choose connector mode with bigjoiner 
>>>>>>>>> support or with
>>>>>>>>> +                 highest clock if can't support big joiner
>>>>>>>>
>>>>>>>> Shouldn't this be only joiner mode?
>>>>>>>>
>>>>>>>>
>>>>>>> You mean can be named as joiner mode because same can be used 
>>>>>>> for big joiner / ultra joiner?
>>>>>>
>>>>>> I guess this should be bigjoiner mode only. For ultra there might 
>>>>>> be other restrictions which we need to look at.
>>>>>>
>>>>>>> or
>>>>>>> We are returning the highest clock mode if no big joiner mode 
>>>>>>> found?
>>>>>>
>>>>>> Yes, this is my query here. Why are we returning highest clock 
>>>>>> mode if no big joiner mode found?
>>>>>>
>>>>> We can return either with highest clock or highest resolution or 
>>>>> default mode,
>>>>> Since we have the other two already covered used highest clock.
>>>>
>>>> But why we need to return something if bigjoiner mode not found?
>>>> If its not found, then we won't get to know only bigjoiner mode not 
>>>> found and we are falling back to default mode.
>>>> @bhanu what you suggest here?
>>>>
>>> Consider a setup with two display's with one having mode with big 
>>> joiner support and other doesn't have any mode
>>> for enabling big joiner.
>>>
>>> In such case we expect the tests to run.
>>> We can discuss on what mode to use on the display (highest_clock, 
>>> highest_res, default) which doesn't support big joiner, but we need 
>>> to have a mode there is
>>> what i understand.
>>
>> IMHO, We should fall back to default mode if there is no bigjoiner 
>> supported mode available.
>>
>> As per my understanding, Pick the mode that exercises the max 
>> bandwidth if there is no bigjoiner mode available is the expectation 
>> from Kunal.
>>
>> - Bhanu
> Will select default_mode in case of no big joiner mode found.
> Will have separate parameter for the bandwidth.

'Highest' and 'lowest' make sense for any driver, but IMHO bigjoiner is 
Intel-specific terminology, do we really need to have an environment 
variable for that.

For most purpose, highest itself should be sufficient, if the test-setup 
has a panel that needs bigjoiner.


Regards,

Ankit


>
>>
>>
>>>>>>>>>            */
>>>>>>>>> -        if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>>>> +        if (!strcmp(env, "joiner") || !strcmp(env, "2"))
>>>>>>>>> +            found = bigjoiner_mode_found(drm_fd, connector,
>>>>>>>>> + sort_drm_modes_by_clk_dsc,mode,
>>>>>>>>> +                             max_dotclock) ||
>>>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>>>> + sort_drm_modes_by_res_dsc, mode,
>>>>>>>>> +                             max_dotclock) ||
>>>>>>>>> +                bigjoiner_mode_found(drm_fd, connector,
>>>>>>>>> + sort_drm_modes_by_clk_dsc, mode,
>>>>>>>>> +                             max_dotclock);
>>>>>>>>> +        else if (!strcmp(env, "highest") || !strcmp(env, "1"))
>>>>>>>>>               igt_sort_connector_modes(connector, 
>>>>>>>>> sort_drm_modes_by_res_dsc);
>>>>>>>>>           else if (!strcmp(env, "lowest") || !strcmp(env, "0"))
>>>>>>>>>               igt_sort_connector_modes(connector, 
>>>>>>>>> sort_drm_modes_by_res_asc);
>>>>>>>>>           else
>>>>>>>>>               goto default_mode;
>>>>>>>>> -
>>>>>>>>> -        *mode = connector->modes[0];
>>>>>>>>> +        if (!found)
>>>>>>>>> +            *mode = connector->modes[0];
>>>>>>>>>           return true;
>>>>>>>>>       }
>>> Thanks and Regards
>>> Kunal Joshi
