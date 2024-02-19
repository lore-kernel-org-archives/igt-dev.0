Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE64DC48260
	for <igt-dev@archiver.kernel.org>; Mon, 19 Feb 2024 08:13:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BB410E192;
	Mon, 19 Feb 2024 08:13:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ha+Nx6/N";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C708110E192
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Feb 2024 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708330396; x=1739866396;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qFRLuHP1fxpWArzFaapSuzdPI0knaiq4EP52Pi3EmYU=;
 b=Ha+Nx6/NUv+PD3unVC7s2in2XXJHDvXC9Q/9IUgrE/8ll0AGRhAWvj58
 HMb0f1AchRzGJVql0RbXEQJdNtKwUay9PHAhvBY/qTJjrqP8ErKGCXVxi
 W66AbBnYOf1vrNqzpRNJQ36xdtr4niZAs+JbYybNZZmcpz9N4vmPzQ4tv
 kxyW4ZYDFye2l0uKQcJ3KHkXp5RYtErXYnR+Esacn2sT3y7xZI+7tDn2N
 A05p2qh9ZOIIhyZwu66H96cwbFwpf8+BtyMqutIQCE4c+O6DoyJtFv7/C
 dOxR8msP1wy203HauzON0s7vo1QfA5ex/GEPZ68EpsnkG+O3gsT0xv9cR g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2525979"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2525979"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2024 00:13:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9093895"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Feb 2024 00:13:14 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 00:13:14 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 19 Feb 2024 00:13:13 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 19 Feb 2024 00:13:13 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 19 Feb 2024 00:13:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aEs5K4jImt+WWvqg8LzWAuuD3a4syNHFz3qhRXvzBH3a8ilgePNK8gjFjswYxhAwjd0HLcXRtcq6GGUZ8Z1iyti7iGdcZflUNLZ+H7NszgD5EU0R5VbaWWHhP6FJPibwl5LmFsOJ/su+UG0QdpQwi54Z+oylXB6hv9bnAAi3fIOMpGYBbhh8yyrn7V4oqpb7Yh6jBEbHwEgQixzLp338KF/nD2+rKH7+DTnoOBei+eJ81H8hr997yPZ2GqwylT4gzBRPIg+ZmMM94kTLMegFJbgtTk6uldzpXISLtT5dUoRb48r3GcyVQw9UMYiZ8DN20Sk35IFFHZZd7bRjVvV9xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DYEA0Sx1oSfw+k0p1cl4Dx2tf3HtNrMYZChUWcv7p2Q=;
 b=ePDBEDZrGDWdZfhULDKwoHrCNOa3h13AGFySABCMlGDiWVyCNyfkW5EiclCibZ/fKB6aZRuEMHnQYeXc0myJBmk8ex4pPQftBDlbiGoVppvehfgcE0RO04pGvYQekdRohROQ187NwheF2yMnFS2ehjgZQbsSV445fro2cCyy8zVLgt7obe55o+t37iu9WxPzQZUTddAZCDroH5R25652pNtS/a42msTnXBAFUG/btON7v84lURJaUqq82J6E9/pgCVtGS0y9OJKfLB49HrMEwI8K4oCXs2SqMTaG8oKaku+b7s/2930YUlEl6wk/ZCEk5EHyjMQsssdV1NU6UaI1EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB6889.namprd11.prod.outlook.com (2603:10b6:930:5e::9)
 by MW5PR11MB5883.namprd11.prod.outlook.com (2603:10b6:303:19f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.34; Mon, 19 Feb
 2024 08:13:11 +0000
Received: from CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035]) by CY8PR11MB6889.namprd11.prod.outlook.com
 ([fe80::bf71:4b0e:6d66:e035%3]) with mapi id 15.20.7292.036; Mon, 19 Feb 2024
 08:13:11 +0000
Message-ID: <53d147f8-eba2-4030-a506-bb7fffd65eaf@intel.com>
Date: Mon, 19 Feb 2024 13:42:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/3] lib/igt_psr: add support for PR selective update
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Murthy, Arun R" <arun.r.murthy@intel.com>, "Manna, Animesh"
 <animesh.manna@intel.com>
References: <20240218091704.2259937-1-kunal1.joshi@intel.com>
 <20240218091704.2259937-3-kunal1.joshi@intel.com>
 <18efe76c653963719a02755b432e754c9daad723.camel@intel.com>
From: "Joshi, Kunal1" <kunal1.joshi@intel.com>
In-Reply-To: <18efe76c653963719a02755b432e754c9daad723.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0195.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::20) To CY8PR11MB6889.namprd11.prod.outlook.com
 (2603:10b6:930:5e::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB6889:EE_|MW5PR11MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: e5e31711-9c49-4211-cdae-08dc31229cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Jjuaysl621TCDbIUIakNqTfPNLCdvjlrJAvuVYhN+6OdhJc5Kk1iZc4Q60UyFz3GSkRnJrejkWJSmh6Fc8kjU61ikyzew9Um4qPJmBQuwDGsjBr1Iyr7kVHwwOQhvpViAO6CZ0elXZoLlSimJOCkqg814eWWrWwzEOl/uX47nbUW0tE0wUKPejIP1aMDcfn+pdld4c0nk0n3iw6yMSnIgx2zJS4hjoXlEXtpwyy4glwDs+3N9BfMWR4zsM1L0xe8M6L+o7XZZLs0BNGtPjeWLJfNlAz5sFQTbyG0YfmCibSyIWm5Q5k8PMEJb3MmkCFkcn1rDflYFpcvP00xSHaOA4xh69tWVsDOt1iGPeLKlwNZYyynubj0Rpff0eIs0cXs7Jke5DqbOvrT9QHTStv7WX8uGkF5B9OWkoj5iOQQKVv5bere22xb0s3+1u9hiX5g5wFtTTOe1YlmwcmKNCxBl8agWsOXY2cjGeTPSiDLf0FvO26+ROZO3+4GaNXiys/MglVOQb4u6pw6uvRn6kJJy8pPQ0NPAtkDDs5rATRyTfQ51QWxODocJHRqW4GaafOq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6889.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(346002)(39860400002)(396003)(230922051799003)(1800799012)(186009)(64100799003)(451199024)(31686004)(54906003)(110136005)(6666004)(316002)(5660300002)(15650500001)(2906002)(8676002)(8936002)(4326008)(86362001)(31696002)(41300700001)(66476007)(66556008)(66946007)(6506007)(53546011)(6486002)(478600001)(107886003)(36756003)(2616005)(26005)(6512007)(83380400001)(66574015)(82960400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnhPZWxERlFHNDhNTWMrMGNiL3BFVWNMRVBpRkl5RXNBNWJoZ0NzcVJoOXJz?=
 =?utf-8?B?VVBHNU1MRmRaZlZHd040TkR0cUg0K0hnM21CVjVtcUtCeC9IY2RFT2FjS29T?=
 =?utf-8?B?QnJnbUtnUVBTRnJyL1p5RUpYT0VWTHBUbktkR0hVZy96UTkwRVErZldzbUg0?=
 =?utf-8?B?cEovVHB5aDVCUzRPTnpFZis4WFVFOHBiS3l5ZlhVaCtORzQ4cm9mVExjMmp4?=
 =?utf-8?B?Qk95aTBhY3owYkZsV2lJZDFTNlNhV01XbmNIRlJheXNxcUFGZUhJa3JMOGFI?=
 =?utf-8?B?Z1k5eWVVK2VFbndDY3JxSzRPZDRrUjlJdjcwcUZraHIzc0RMSk14V0w3dzFw?=
 =?utf-8?B?Tzh0UE5ucldZem1qR21MWnRDVXI0TVBROWVWWGQ0T3p0ZU1vYlFyMzR5amtZ?=
 =?utf-8?B?Q29xaWVVWXdDdDJhOXVvNWdzM2NyeUJhVk1jNXdwWEx3VUZOcTIxQlh5RmY4?=
 =?utf-8?B?QWJ0dTdFVm5GL09IRkZucUhmNE1lV2dWV2kwbjA4R3A3Rk5pT0cvYUFNb0tP?=
 =?utf-8?B?NENIdmZuTWNwY1VuKzdxSDFicnZCbk8xT3YyOHVuOGowV1dIQzVQbmJIcmRJ?=
 =?utf-8?B?NHRWYmJvOFlPY2toV2diT2FNSUlWVFkwREhNbGNSanBIV00vZTRSaFIrU3RB?=
 =?utf-8?B?cVFBRG9Vajd6V3VraElFWGVQenVtOVVZemllZEQ3bjRpOXFYRzBYSmJtNThq?=
 =?utf-8?B?cEYvd2xWWHJoWHU4bkk3Sk40UHFKWkZDMFY5NWRnd3dnV0kySDZYWjc4aDRZ?=
 =?utf-8?B?eEVwYWsxbTV0MVNuemltUStVeHAvb3NCRTFheGFucFRJOHJ2TUw4YlJ3bldY?=
 =?utf-8?B?YTBxUnc4SHQyN3VMdThEYngwZERzMFN1enJDMllEU05EQWN4d3hVNkpMUTg3?=
 =?utf-8?B?ZmJCRmF2TlJVWU9OUWIzeHB1NWtmNHR6RTRablRMb1ZhRW9qOEFVcm04eGFB?=
 =?utf-8?B?UktEM3Z4WmRPWVlNSFRuSXMxNlAzdUdjR1J5UklYZ0h6SkVVMENjVWc3YUsz?=
 =?utf-8?B?UnAyZWlpSWZPbkpkY25xem5IVmlIbWh6bVdFY0dGY2hQcUY3OTVQeXh4QUJv?=
 =?utf-8?B?Q1FtQy9mSHdYOVJ0R2R2VUo5YkJybXVjUDdCQUZPTlJqZU43TjkxekFkTnVU?=
 =?utf-8?B?RWlkY29jR2RzMlpyeHRqZ2pDWWRGWVJ1VGQ0Uk81R2hrUzZFTGtrdGtiRzFv?=
 =?utf-8?B?dmh5azNBQnNZWC9oMENPS2YxOTBva2lWVy94VmNLTU14MENrWUN1ZzVwV2VX?=
 =?utf-8?B?U1ZyOTVlSWhoUXVOdEdMLzJQTnZyNGpiZHZWUENVVjZnQlBmUzF5THBTM2FO?=
 =?utf-8?B?VWVWNlZlY2NKRkcwUGN6eFFFSjYrZERIMVdQL2JiTmIweXcyWXhJdktRRytM?=
 =?utf-8?B?Y1VqdkxzQURaWURmaWVPTTN5YVlucnlEd1hvTC9ISzA4SE54Z2tBTTJBNnNN?=
 =?utf-8?B?TVlGUmNqZGlTYVI2SzFGL2pVTy9lZGZORHg1ckhDUVcrTWJ6T1JaWmhFTG83?=
 =?utf-8?B?VzJPUEEwMnFYT2YvVlZRQXczU2ZVMnhyclRpOWZjWnRQcGZQWE1ZZTFUSmZa?=
 =?utf-8?B?M1dQT1VWeVdhRnRzaDVLRk5MSGJqTkhySllFZmpvQlYyaTlaR1NTelNzRzdX?=
 =?utf-8?B?eDBtRC82Q3M2WFlJcVEvSGdBdFNSYlBTQUM5clUxanhHTFlnU0JXaXRBek9N?=
 =?utf-8?B?QlNicFRsdDNrOHZiVEVJNmJYYWE4WGNxa1RKRytZNmtaMVdjVzVlanQvNmFN?=
 =?utf-8?B?WkRJMG50VVFzWndPWFNlZjJLaUcyQ09OcXVoV0NjMFhxZFFLWk94UUF0cklI?=
 =?utf-8?B?VUQvejFrSkVMY0F4ZDJuQjNvZ0xsY0JOdEpmUDBxUzJqYmJHWmRua1pTQU1x?=
 =?utf-8?B?NjdHWVQrR0ZuNTJYZ2dDSDhtaGV6ejdVV2JSUEp6RExrWXFzbVZDVGVoY3Rw?=
 =?utf-8?B?OXpjbFMrUXorZUNFUGRwTFNnWWZ3TlMxK0ZSWXdtbFFjWlpNeWlYMlNqSnlN?=
 =?utf-8?B?UDE2a0xHaEVXQ3UzdHFlNkpOVUJmSi96VU9NZlVLZWV1RndRYWt2b2J4cCti?=
 =?utf-8?B?MkZocHNNdnBsaUFQZm1IYUIzUU9XMEhWRW0xQzdOZlVLRXR0NDlhTmN1alpz?=
 =?utf-8?Q?i/oxUQRQf4o6iZkYLQUsLnbWq?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e5e31711-9c49-4211-cdae-08dc31229cea
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6889.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 08:13:11.4404 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxEzQrVnRRdeLUD2m15YAYDBn2UZUjxj34Y5Wdwyubh7gWclP6q0AW95Aev1DVkHRZ0rYPeR/jdqEufOSNmo7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5883
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

Hello Jouni,

On 2/19/2024 1:30 PM, Hogander, Jouni wrote:
> On Sun, 2024-02-18 at 14:47 +0530, Kunal Joshi wrote:
>> Extend the tests to cover panel replay selective fetch feature.
>>
>>  From kms_psr2_sf test point of view we have
>> check_pr_psr2_sel_fetch_support
>> function to check if PR/PSR2 selective fetch is supported for an
>> output
>> if output supports selective fetch then we check we enter DEEP_SLEEP
>> mode
>> in run function
>>
>> v2: fixed dynamic test name
>> v3: use check_psr2_support (Jouni)
>> v4: split patches (Jouni)
>>
>> Cc: Jouni Högander <jouni.hogander@intel.com>
>> Cc: Animesh Manna <animesh.manna@intel.com>
>> Cc: Arun R Murthy <arun.r.murthy@intel.com>
>> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
>> ---
>>   lib/igt_psr.c             | 36 ++++++++++++++++++++++++++----------
>>   lib/igt_psr.h             |  6 +++---
>>   tests/kms_cursor_legacy.c |  4 ++--
>>   3 files changed, 31 insertions(+), 15 deletions(-)
>>
>> diff --git a/lib/igt_psr.c b/lib/igt_psr.c
>> index cad8cce05..9accd2047 100644
>> --- a/lib/igt_psr.c
>> +++ b/lib/igt_psr.c
>> @@ -41,7 +41,7 @@ bool psr_disabled_check(int debugfs_fd)
>>          return strstr(buf, "PSR mode: disabled\n");
>>   }
>>   
>> -bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
>> *output)
>> +bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
>>   {
>>          char buf[PSR_STATUS_MAX_LEN];
>>          char debugfs_file[128] = {0};
>> @@ -248,7 +248,9 @@ bool psr_sink_support(int device, int debugfs_fd,
>> enum psr_mode mode, igt_output
>>                         (strstr(line, "PSR = yes") &&
>>                         (strstr(line, "[0x03]") || strstr(line,
>> "[0x04]")));
>>          case PR_MODE:
>> -               return strstr(line, "Panel Replay = yes");
>> +               return strstr(line, "Panel Replay = yes, Panel Replay
>> Selective Update = no");
>> +       case PR_MODE_SEL_FETCH:
>> +               return strstr(line, "Panel Replay = yes, Panel Replay
>> Selective Update = yes");
>>          default:
>>                  igt_assert_f(false, "Invalid psr mode\n");
>>                  return false;
>> @@ -317,7 +319,7 @@ bool i915_psr2_selective_fetch_check(int drm_fd,
>> igt_output_t *output)
>>                  return false;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       ret = psr2_selective_fetch_check(debugfs_fd, output);
>> +       ret = selective_fetch_check(debugfs_fd, output);
>>          close(debugfs_fd);
>>   
>>          return ret;
>> @@ -334,17 +336,24 @@ bool i915_psr2_selective_fetch_check(int
>> drm_fd, igt_output_t *output)
>>    * Returns:
>>    * True if PSR mode changed to PSR1, false otherwise.
>>    */
>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output)
>> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
>> *output)
>>   {
>>          int debugfs_fd;
>>          bool ret = false;
>> +       enum psr_mode mode;
>>   
>>          if (!is_intel_device(drm_fd))
>>                  return ret;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       if (psr2_selective_fetch_check(debugfs_fd, output)) {
>> -               psr_set(drm_fd, debugfs_fd, PSR_MODE_1, output);
>> +       if (selective_fetch_check(debugfs_fd, output)) {
>> +               mode = psr_get_mode(debugfs_fd, output);
>> +               if (mode == PR_MODE_SEL_FETCH)
>> +                       psr_set(drm_fd, debugfs_fd, PR_MODE, output);
>> +               else if (mode == PSR_MODE_2_SEL_FETCH)
>> +                       psr_set(drm_fd, debugfs_fd, PSR_MODE_1,
>> output);
>> +               else
>> +                       igt_assert("switch not possible from current
>> psr mode\n");
> There is no need to change this function. psr2_selective_fetch_check
> (now selective_fetch_check) works for PR and PSR.
>
> BR,
>
> Jouni Högander
Have modified selective_fetch_check to check for a particular output,

bool selective_fetch_check(int debugfs_fd, igt_output_t *output)
{
         char buf[PSR_STATUS_MAX_LEN];
         char debugfs_file[128] = {0};

         SET_DEBUGFS_PATH(output, debugfs_file);
         igt_debugfs_simple_read(debugfs_fd, debugfs_file, buf,
                                 sizeof(buf));

         return strstr(buf, "PSR2 selective fetch: enabled");
}

Will this be not required?

Thanks and Regards
Kunal Joshi
>
>>                  ret = true;
>>          }
>>   
>> @@ -358,12 +367,17 @@ bool i915_psr2_sel_fetch_to_psr1(int drm_fd,
>> igt_output_t *output)
>>    * Restore PSR2 selective fetch after tests were executed, this
>> function should
>>    * only be called if i915_psr2_sel_fetch_to_psr1() returned true.
>>    */
>> -void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output)
>> +void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>> *output)
>>   {
>>          int debugfs_fd;
>> +       enum psr_mode mode;
>>   
>>          debugfs_fd = igt_debugfs_dir(drm_fd);
>> -       psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH, output);
>> +       mode = psr_get_mode(debugfs_fd, output);
>> +       if (mode == PR_MODE)
>> +               psr_set(drm_fd, debugfs_fd, PR_MODE_SEL_FETCH,
>> output);
>> +       else
>> +               psr_set(drm_fd, debugfs_fd, PSR_MODE_2_SEL_FETCH,
>> output);
>>          close(debugfs_fd);
>>   }
>>   
>> @@ -389,11 +403,13 @@ enum psr_mode psr_get_mode(int debugfs_fd,
>> igt_output_t *output)
>>   
>>          if (strstr(buf, "Panel Replay Enabled"))
>>                  return PR_MODE;
>> +       else if (strstr(buf, "Panel Replay Selective Update
>> Enabled"))
>> +               return PR_MODE_SEL_FETCH;
>>          else if (strstr(buf, "PSR2 selective fetch: enabled"))
>>                  return PSR_MODE_2_SEL_FETCH;
>> -       else if (strstr(buf, "PSR2 enabled"))
>> +       else if (strstr(buf, "PSR2"))
>>                  return PSR_MODE_2;
>> -       else if (strstr(buf, "PSR1 enabled"))
>> +       else if (strstr(buf, "PSR1"))
>>                  return PSR_MODE_1;
>>   
>>          return PSR_DISABLED;
>> diff --git a/lib/igt_psr.h b/lib/igt_psr.h
>> index 372bef2b2..36ba7f068 100644
>> --- a/lib/igt_psr.h
>> +++ b/lib/igt_psr.h
>> @@ -46,7 +46,7 @@ enum fbc_mode {
>>   };
>>   
>>   bool psr_disabled_check(int debugfs_fd);
>> -bool psr2_selective_fetch_check(int debugfs_fd, igt_output_t
>> *output);
>> +bool selective_fetch_check(int debugfs_fd, igt_output_t *output);
>>   bool psr_wait_entry(int debugfs_fd, enum psr_mode mode, igt_output_t
>> *output);
>>   bool psr_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>>   bool psr_long_wait_update(int debugfs_fd, enum psr_mode mode,
>> igt_output_t *output);
>> @@ -59,8 +59,8 @@ enum psr_mode psr_get_mode(int debugfs_fd,
>> igt_output_t *output);
>>   
>>   bool i915_psr2_selective_fetch_check(int drm_fd, igt_output_t
>> *output);
>>   
>> -bool i915_psr2_sel_fetch_to_psr1(int drm_fd, igt_output_t *output);
>> -void i915_psr2_sel_fetch_restore(int drm_fd, igt_output_t *output);
>> +bool i915_pr_psr2_sel_fetch_to_pr_psr1(int drm_fd, igt_output_t
>> *output);
>> +void i915_pr_psr2_sel_fetch_restore(int drm_fd, igt_output_t
>> *output);
>>   bool is_psr_enable_possible(int drm_fd, enum psr_mode mode);
>>   
>>   #endif
>> diff --git a/tests/kms_cursor_legacy.c b/tests/kms_cursor_legacy.c
>> index a430f735a..91e5e9b07 100644
>> --- a/tests/kms_cursor_legacy.c
>> +++ b/tests/kms_cursor_legacy.c
>> @@ -1849,7 +1849,7 @@ igt_main
>>                   * page flip with cursor legacy APIS when Intel's
>> PSR2 selective
>>                   * fetch is enabled, so switching PSR1 for this whole
>> test.
>>                   */
>> -               intel_psr2_restore =
>> i915_psr2_sel_fetch_to_psr1(display.drm_fd, NULL);
>> +               intel_psr2_restore =
>> i915_pr_psr2_sel_fetch_to_pr_psr1(display.drm_fd, NULL);
>>          }
>>   
>>          igt_describe("Test checks how many cursor updates we can fit
>> between vblanks "
>> @@ -2074,7 +2074,7 @@ igt_main
>>   
>>          igt_fixture {
>>                  if (intel_psr2_restore)
>> -                       i915_psr2_sel_fetch_restore(display.drm_fd,
>> NULL);
>> +                       i915_pr_psr2_sel_fetch_restore(display.drm_fd
>> , NULL);
>>                  igt_display_fini(&display);
>>                  drm_close_driver(display.drm_fd);
>>          }
