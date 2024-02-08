Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD708C48260
	for <igt-dev@archiver.kernel.org>; Thu,  8 Feb 2024 05:55:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624F810E13B;
	Thu,  8 Feb 2024 05:55:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="D5RoskNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3AD10E13B
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2024 05:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707371707; x=1738907707;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=9vsBhgCKWFvE1NFQm9Rm3tAtU/uvyFEuOUcDx2f1uHk=;
 b=D5RoskNtuZBGXR7nBq/WY2SSakmSlkXbofF7Nv4XPPqnWWcfTNgc1Zk8
 fSD9zc28dzr1q1VFmf5AGOTR8VGKLWYP3wR3ZPkx94XokvkC5emrojx4f
 Ej/mRuKSLRvQuCP7uAFni3pp+PxIaoHModnHeOugQMqGPy0CykbIwXEtt
 n2fPZS1RP26W5gVJhV7+FVIp6MyoOmEjmVvw4xI55lhQbGKXXwjbTqfA5
 Mm43D0InAr3SofH/XE61D46qM9PuFyu8pkkwyKKS14hchtEhYfy9tNOP2
 6UwRfqSgIk+xkUQOJndFYh/5jumiQXNKc/5TlbfC47DF7bFq2IEbcliN8 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="4933202"
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="4933202"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2024 21:55:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,252,1701158400"; 
   d="scan'208";a="6329797"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2024 21:55:05 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 21:55:05 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 7 Feb 2024 21:55:04 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 7 Feb 2024 21:55:04 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 7 Feb 2024 21:55:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EkfR9m/GXofgmzppV2C/VoJdeT3NKvIlSWHyu1vynp9pRzxk+evZYIoRELEM4M6oXW+63Q+xc86hSgkVU5Od26qjPLy/4tJ1LaC4z3BX1aDI0KV/QUfaQzGmF9fPvYfggsK4osWhPVM0RRiIf79LxAi0gdFkkINO+P7G5BWzvgsfHCMe4KKeOtRbZ/aLsJTL3azZE/p/srQwsn5CVfwITJU9o+ZlSt0HiGnNukOhbslompVSJ+QtVbxcBJAoYZTpxXWLDxdt8IURoAyQ3+oLI5jgARo3oVTG1QFKgMGYxcYwHsdbEbDWeZK5LetNm2VwJrNt45u6sC93OqNHWKs0lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wdxt7L8dhY4c6bGSvBDcm4TrdLzcKOgVeHQOilo9WG4=;
 b=hwJ0AkOvKTyeNPREppLXKfgPdBs2+eoA+4/1MduIxtPuQJYM3APpnKFwIX+dmJdvmEhdJyNtjN5l0UW3lwi/iiBXP9uUR1bmAqcf8QyN+s+DFdiY3QYqsKiYLfNuOI1ULmHFMxzSjHFEOyJj6jrfh1dwqma0xeVvs/8IAnXshxL2I/fSRLA9z9d+f0DC255O2h/r80Ly13ptU1Xz7DXxf9MOZW4slnsFDYgom5RYRkExiAN4rVoMazouA1QW+KaLw7EMEaDsyQkDSmvL2I1qr4nRDBi+k5IQzx7n5ktaZUidPPNsbz9DprFHOUXWBJahPMI4GNwx8UCkER8DY9sZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5694.namprd11.prod.outlook.com (2603:10b6:408:167::10)
 by DS0PR11MB8737.namprd11.prod.outlook.com (2603:10b6:8:1a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.38; Thu, 8 Feb
 2024 05:55:02 +0000
Received: from BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::e248:604:86eb:6fa5]) by BN0PR11MB5694.namprd11.prod.outlook.com
 ([fe80::e248:604:86eb:6fa5%4]) with mapi id 15.20.7249.037; Thu, 8 Feb 2024
 05:55:02 +0000
Message-ID: <575a9d13-ba73-4705-8e71-408653e428b6@intel.com>
Date: Thu, 8 Feb 2024 11:24:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5] tests/kms_prime: Add XE support
To: Matthew Auld <matthew.auld@intel.com>, Nidhi Gupta
 <nidhi1.gupta@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20240130182033.24900-1-nidhi1.gupta@intel.com>
 <534993f0-6c54-4605-adf2-97511a7679f5@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <534993f0-6c54-4605-adf2-97511a7679f5@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0192.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::17) To BN0PR11MB5694.namprd11.prod.outlook.com
 (2603:10b6:408:167::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5694:EE_|DS0PR11MB8737:EE_
X-MS-Office365-Filtering-Correlation-Id: 58174b5c-765b-44fc-7128-08dc286a7d0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zyr0muVqBt7F5xw/EMCUFjil6oTDxxxMr/QbH9Dwr8OP1PJ0eGOvS41zXkgG4n5jYkn1MmFqbBbLUwufBqTOwFlwZY2eopEaImq4xsnRo0lBU3D+2IJuqIM7ZZYtyzgv8xZ3MqGQaIF105hHyXteOTZKAVJnWcJq9y0EbfO5C0ytH+nm9Z+grSRtd8AzoTkJjcFgeqjRAC5TIEK7vtRRjaXT3FYN/+HP+3ts9VfsAEm/Gyhumcyw5RGgN6/Rqs4U1AXPYzrH7teRZL3PnXkkuOFJaK+VSKcYZoeJBCNmMEDeRBk29St5NBMsptAjufH6Esk+qe5Y4JyxJgE5+dqkYggefWPrxG1HPlXfSWqfHXauF8tpAvI4VdlhDTEo09A0hv9mlebUQF4QJZB+5y6mFYKTjTHdwRULB2WyLlIQ0N8iZHFvepRQje9Qnrux+etG/qO/KTxwUxAiEE5KQsyYaKq3a5sYgpkflgH/SZczWOwpg7unZsw7w1e50P9jzOwwKvmvhWwEyTwOmUjUeeJDkQHDDlQJlQV05BR8VXcUwFzHW6gXSOGKfc26rAnPAOYZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5694.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(376002)(366004)(39860400002)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(31686004)(86362001)(82960400001)(38100700002)(83380400001)(2906002)(41300700001)(31696002)(2616005)(66946007)(316002)(110136005)(66476007)(66556008)(8676002)(30864003)(8936002)(26005)(6666004)(478600001)(6506007)(6486002)(36756003)(55236004)(53546011)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU9UZWhtYTdKc1l5bzlLYTZ5RE9ZWnZuYklNRU9wSDAxMlNyMzhNTVEzanlU?=
 =?utf-8?B?b3hsZTVOdThXZkxpb2FaVjA5bUk2c1c5SDBuRHcyMy8vR0pGTHE5NmNXSmNT?=
 =?utf-8?B?WkxZYVEvRExjRmZ1T3RGYnNtS1ZSaHN5RDFDOE5walVLb3FDVzZXMFozRW14?=
 =?utf-8?B?WC93eWQwKzRCWEpYYXZvSHIwRHhsSFJaRzFVaEhScXZqbFQvWm1PQ1JvVU8w?=
 =?utf-8?B?UEtvRE1OeEhEeDRwSExUaW16cEZGNWIvMWJIRWNDeFlQazZZckNuMTdUQ3h4?=
 =?utf-8?B?amJ1TllhdGx4c0xtMWd2NlljckNoR1EzVkJ6MlgzaGNVVVdrNFZWd2U4OEw1?=
 =?utf-8?B?MjdMLzVMVEtTbGFodldud2UxM2RxWlVIb2QwSmdZOG1nZ21jOG1ZSy9EaEZw?=
 =?utf-8?B?VzhHdjY4MGsyeHVpaC9xNzV2R09TZi9ZdkYySndKR3lhZnc4cTgzS0lXTklv?=
 =?utf-8?B?TmFwM1ZaeWg1S3Qzem4wdngrYzQxdjlNU2h3RmptU0Zvdmkwb2VyaVU5Sy9w?=
 =?utf-8?B?dmlFTUQ4a1ZVR0c0ZXlvTjdxbXFFeFAvWkF6eFBhWGVHZGlEdzJaOERlYWdr?=
 =?utf-8?B?N1Y3V2p1b1pyZlJqK0hUWDMrbDdJaU90ZXl6NUZYOTZOcW9RSUFDZElPaVVW?=
 =?utf-8?B?S1ZCTVpmYXk0MXI0VzRxOXpQd1VyejF2RlFxU0xXZjZDRUgwK0hkcjR5SU5H?=
 =?utf-8?B?WU41ZWFIVlc2emQ2MGkvNVNTY3JjR29qM01zTTJQRVNSV1N3NnhmdGFscXBP?=
 =?utf-8?B?bEl1eHdrZ2lwRnVaUklLSDMyYnBxK24vN3NBMGRNSmVOWERLRjl1SWZNb1Fo?=
 =?utf-8?B?V3hjWFNhWVBkQVhma0FuRjFsYkVNNGRrU0RseCt1M3JkdFdjSUp3OVJRbkFt?=
 =?utf-8?B?bUE5TG16ZkxRV2pGQnlCTi83SVhRRUJEN2dnUW9xQVN6YVhzZ0lteXh5bGN5?=
 =?utf-8?B?N1FGSUhPUzVEZEtKa3cyNGJvWW9TNW84MHRYSkNwS2VkOWVTVmJYZG5Oc3Vj?=
 =?utf-8?B?dm5KQXkyajMybXdsRlRTWkQ3OHkreVJpZklZR0pnR1F2T3U3WVZWWmlndmVY?=
 =?utf-8?B?UkZ0bWI1TGVVdzJQMjRGQVMzZDZwTmY5NTZsR1hWQVpUWnFMT1pnbzNDeVA5?=
 =?utf-8?B?VS9hWkJXZ2x1S1ZhUHhpNXE3T3BhOEUvclhzZVlVSlRJQXNCdHlVeXNPSldn?=
 =?utf-8?B?V1hBbEVjYXIydXBwNDM4amlEQUJpS1RCak5LSFBEcUJ4d3BLQ2xCVGd0d21s?=
 =?utf-8?B?N0Z6cHJTYURLeWtMVS9pbW00Q09SbHdTTFdtQThNcmRIdjVGZUNucDRCUllR?=
 =?utf-8?B?dWRkRmRvK1kzVldTM1NIaXhZL1QxZGk4cm5lK0dJSXlYL0Jka1M3WmFSS3Ny?=
 =?utf-8?B?UGZ3MXU0V2VsNzI3YlhQSDdwMnIyRytneExud25xdzRYWldaSVEyb3l2cUs2?=
 =?utf-8?B?SGdEMUxBcmlOMlNjU3U3UnZoYnBXRWJpRVp5VkFlM0VaQXFFTVRDUUZ2TVR4?=
 =?utf-8?B?Qks1Rzk2ei9PdFRXcnFwYjZGOTNUSk1zcWYxVDNGclJ0bFZMMzRxaU9yK3NY?=
 =?utf-8?B?VXY0aTU0bk9ZUStuc2o3M21BajBUd0ZsUHZseWhjMHpKZ1BKdUl1ays0S2Ns?=
 =?utf-8?B?R01ML0phcUkrVlRrcU5VU1VXSjdqSHVVNmNCdy9FcDMvcGFyOWhCQzZEMmVW?=
 =?utf-8?B?WkN1UVMxenYwMWw3L3lNM1Y1Tmg5U083OXhOazNZQjZRZnNtZDc0ZXJVTm41?=
 =?utf-8?B?NmdZVFVLSmE4c2hRS1RtY3JrRFZlMzVvQmxiSVIyYmZWVTNzTmR0aVMwdUhR?=
 =?utf-8?B?aUpJQnZPaVF6c2t3czdUSGdRMkZ1Y0M3Y3lNclJvYW5xOWJkeng1OVdvc2th?=
 =?utf-8?B?TW00ZTVsYnhteDkwV1pQa1I3ejk5dTM1ZTlielBYVERXY0JSS3ZVZ2Z1SmZB?=
 =?utf-8?B?Nk5iV0J6Z1VMRUk4T3A1QTErdEprZnUzRU1JektKU1FIaExvcEoybXdGeGRv?=
 =?utf-8?B?ZHNFZm55Ym9BWEh0TW5zYys5VXpqRkYrM2VYZW1NOUduOWdkT3JzTXY3cnZj?=
 =?utf-8?B?S04rZE1VcmtWNTc3cm52M0lVZjc1S3pEZjRtMTcrWDJNZmRrL0Z3Q3FKUXhk?=
 =?utf-8?Q?BC9LisTkNy3PtKfp3p00ktmey?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 58174b5c-765b-44fc-7128-08dc286a7d0f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5694.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2024 05:55:02.1557 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tKRNr8fn0yPmbBLOt7e9fA2Iu7vwkLzfFnKfk6Ms+ene1TXAfdOUDy9FSo0TVDxkyrfg0vc3JHE13m7y5+a8Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8737
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

Hi,

On 1/31/2024 6:09 PM, Matthew Auld wrote:
> On 30/01/2024 18:20, Nidhi Gupta wrote:
>> From: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>>
>> Add XE driver support for kms tests.
>>
>> V2: - Use rendercopy method for both i915 & xe
>>      - Minor cleanup
>> V3: - New patch for cleanup & rendercopy
>> V4: - Fallback to blitter
>> V5: - Rebase
>> v7: - Rebase and patch cleanup
>> v8: - D3hot subtest is not required for xe
>> v9: - nitpicks (Matthew)
>>
>> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>
>> ---
>>   tests/kms_prime.c | 188 +++++++++++++++++++++++++++++++++++++---------
>>   1 file changed, 154 insertions(+), 34 deletions(-)
>>
>> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
>> index 135c75168..f5f55a65a 100644
>> --- a/tests/kms_prime.c
>> +++ b/tests/kms_prime.c
>> @@ -36,10 +36,16 @@
>>   #include "igt_debugfs.h"
>>   #include "igt_sysfs.h"
>>   #include <fcntl.h>
>> +#include <limits.h>
>>     #include <sys/ioctl.h>
>>   #include <sys/poll.h>
>>   #include <time.h>
>> +#include "lib/intel_blt.h"
>> +#include "lib/intel_mocs.h"
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>>     /**
>>    * SUBTEST: D3hot
>> @@ -120,10 +126,14 @@ static igt_output_t *setup_display(int 
>> importer_fd, igt_display_t *display,
>>           igt_display_reset(display);
>>             igt_output_set_pipe(output, *pipe);
>> -        if (intel_pipe_output_combo_valid(display)) {
>> -            found = true;
>> -            break;
>> +        if ((is_i915_device(importer_fd) && 
>> gem_has_lmem(importer_fd)) ||
>> +           (is_xe_device(importer_fd) && xe_has_vram(importer_fd))) {
>> +            if (!intel_pipe_output_combo_valid(display))
>> +                continue;
>>           }
This check would be always false case of second-to-first subtest and 
wrongly make found as true? Could you please check this.
>> +
>> +        found = true;
>> +        break;
>>       }
>>         igt_require_f(found, "No valid connector/pipe found\n");
>> @@ -131,6 +141,25 @@ static igt_output_t *setup_display(int 
>> importer_fd, igt_display_t *display,
>>       return output;
>>   }
>>   +static igt_output_t *setup_hybrid_display(int importer_fd, 
>> igt_display_t *display,
>> +                   enum pipe *pipe)
Could you please check if this separate function required here?
>> +{
>> +    igt_output_t *output;
>> +    bool found = false;
>> +
>> +    for_each_pipe_with_valid_output(display, *pipe, output) {
>> +        igt_display_reset(display);
>> +
>> +        igt_output_set_pipe(output, *pipe);
>> +
>> +        found = true;
>> +        break; /*Validation on single pipe is enough*/
>> +    }
>> +
>> +    igt_require_f(found, "No valid connector/pipe found\n");
>> +
>> +    return output;
>> +}
>>   static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>>                   drmModeModeInfo *mode, uint32_t color)
>>   {
>> @@ -140,7 +169,29 @@ static void prepare_scratch(int exporter_fd, 
>> struct dumb_bo *scratch,
>>       scratch->height = mode->vdisplay;
>>       scratch->bpp = 32;
>>   -    if (!is_i915_device(exporter_fd)) {
>> +    if (is_intel_device(exporter_fd)) {
>> +        igt_calc_fb_size(exporter_fd, mode->hdisplay, 
>> mode->vdisplay, DRM_FORMAT_XRGB8888,
>> +                 DRM_FORMAT_MOD_LINEAR, &scratch->size, 
>> &scratch->pitch);
>> +
>> +        if (is_i915_device(exporter_fd)) {
>> +            if (gem_has_lmem(exporter_fd))
>> +                scratch->handle = 
>> gem_create_in_memory_regions(exporter_fd, scratch->size,
>> +                                       REGION_LMEM(0), REGION_SMEM);
>> +            else
>> +                scratch->handle = 
>> gem_create_in_memory_regions(exporter_fd, scratch->size,
>> +                                       REGION_SMEM);
>> +
>> +            ptr = gem_mmap__device_coherent(exporter_fd, 
>> scratch->handle, 0,
>> +                            scratch->size, PROT_WRITE | PROT_READ);
>> +        } else {
>> +            scratch->handle = xe_bo_create(exporter_fd, 0,
>> +                                 ALIGN(scratch->size, 
>> xe_get_default_alignment(exporter_fd)),
>> +                                 vram_if_possible(exporter_fd, 0), 
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +            ptr = xe_bo_mmap_ext(exporter_fd, scratch->handle,
>> +                         scratch->size, PROT_READ | PROT_WRITE);
>> +        }
>> +    } else {
>>           scratch->handle = kmstest_dumb_create(exporter_fd,
>>                                 ALIGN(scratch->width, 256),
>>                                 scratch->height, scratch->bpp,
>> @@ -148,18 +199,6 @@ static void prepare_scratch(int exporter_fd, 
>> struct dumb_bo *scratch,
>>             ptr = kmstest_dumb_map_buffer(exporter_fd, scratch->handle,
>>                             scratch->size, PROT_WRITE);
>> -    } else {
>> -        igt_calc_fb_size(exporter_fd, mode->hdisplay, 
>> mode->vdisplay, DRM_FORMAT_XRGB8888,
>> -                 DRM_FORMAT_MOD_LINEAR, &scratch->size, 
>> &scratch->pitch);
>> -        if (gem_has_lmem(exporter_fd))
>> -            scratch->handle = 
>> gem_create_in_memory_regions(exporter_fd, scratch->size,
>> -                                       REGION_LMEM(0), REGION_SMEM);
>> -        else
>> -            scratch->handle = 
>> gem_create_in_memory_regions(exporter_fd, scratch->size,
>> -                                       REGION_SMEM);
>> -
>> -        ptr = gem_mmap__device_coherent(exporter_fd, 
>> scratch->handle, 0, scratch->size,
>> -                        PROT_WRITE | PROT_READ);
>>       }
>>         for (size_t idx = 0; idx < scratch->size / sizeof(*ptr); ++idx)
>> @@ -178,23 +217,52 @@ static void prepare_fb(int importer_fd, struct 
>> dumb_bo *scratch, struct igt_fb *
>>               color_encoding, color_range);
>>   }
>>   +static struct blt_copy_object *blt_fb_init(const struct igt_fb *fb,
>> +                       uint32_t memregion, uint32_t pitch)
>> +{
>> +    uint32_t name, handle;
>> +    struct blt_copy_object *blt;
>> +
>> +    blt = malloc(sizeof(*blt));
>> +    igt_assert(blt);
>> +
>> +    name = gem_flink(fb->fd, fb->gem_handle);
>> +    handle = gem_open(fb->fd, name);
>> +
>> +    blt_set_object(blt, handle, fb->size, memregion,
>> +               intel_get_uc_mocs_index(fb->fd),
>> +               0, 0, 0, 0);
>> +
>> +    blt_set_geom(blt, pitch, 0, 0, fb->width, fb->height, 0, 0);
>> +
>> +    blt->plane_offset = 0;
>> +
>> +    blt->ptr = xe_bo_mmap_ext(fb->fd, handle, fb->size,
>> +                  PROT_READ | PROT_WRITE);
>> +    return blt;
>> +}
>> +
>>   static void import_fb(int importer_fd, struct igt_fb *fb,
>>                 int dmabuf_fd, uint32_t pitch)
>>   {
>>       uint32_t offsets[4] = {}, pitches[4] = {}, handles[4] = {}, 
>> temp_buf_handle;
>>       int ret;
>> +    struct igt_fb dst_fb;
>>   -    if (is_i915_device(importer_fd)) {
>> -        if (gem_has_lmem(importer_fd)) {
>> -            uint64_t ahnd = get_reloc_ahnd(importer_fd, 0);
>> -            uint64_t fb_size = 0;
>> +    if ((is_i915_device(importer_fd) && gem_has_lmem(importer_fd)) ||
>> +        (is_xe_device(importer_fd) && xe_has_vram(importer_fd)))  {
>> +        uint64_t fb_size = 0;
>> +        uint64_t ahnd = 0;
>>   -            igt_info("Importer is dGPU\n");
>> -            temp_buf_handle = prime_fd_to_handle(importer_fd, 
>> dmabuf_fd);
>> -            igt_assert(temp_buf_handle > 0);
>> -            fb->gem_handle = 
>> igt_create_bo_with_dimensions(importer_fd, fb->width, fb->height,
>> -                                       fb->drm_format, fb->modifier, 
>> pitch, &fb_size, NULL, NULL);
>> -            igt_assert(fb->gem_handle > 0);
>> +        igt_info("Importer is dGPU\n");
>> +        temp_buf_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
>> +        igt_assert(temp_buf_handle > 0);
>> +        fb->gem_handle = igt_create_bo_with_dimensions(importer_fd, 
>> fb->width, fb->height,
>> +                                   fb->drm_format, fb->modifier, 
>> pitch, &fb_size, NULL, NULL);
>> +        igt_assert(fb->gem_handle > 0);
>> +
>> +        if (is_i915_device(importer_fd)) {
>> +            ahnd = get_reloc_ahnd(importer_fd, 0);
>>                 igt_blitter_src_copy(importer_fd, ahnd, 0, NULL, 
>> temp_buf_handle,
>>                            0, pitch, fb->modifier, 0, 0, fb_size, 
>> fb->width,
>> @@ -205,7 +273,63 @@ static void import_fb(int importer_fd, struct 
>> igt_fb *fb,
>>               gem_close(importer_fd, temp_buf_handle);
>>               put_ahnd(ahnd);
>>           } else {
>> -            fb->gem_handle = prime_fd_to_handle(importer_fd, 
>> dmabuf_fd);
>> +            uint32_t xe_bb;
>> +            uint64_t bb_size = 4096;
>> +            struct blt_copy_data blt = {};
>> +            struct blt_copy_object *src, *dst;
>> +            struct blt_block_copy_data_ext ext = {};
>> +            uint32_t mem_region;
>> +            intel_ctx_t *xe_ctx;
>> +            uint32_t vm, xe_exec;
>> +
>> +            struct drm_xe_engine_class_instance inst = {
>> +                .engine_class = DRM_XE_ENGINE_CLASS_COPY,
>> +            };
>> +            vm = xe_vm_create(importer_fd, 
>> DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> +            xe_exec = xe_exec_queue_create(importer_fd, vm, &inst, 0);
>> +            xe_ctx = intel_ctx_xe(importer_fd, vm, xe_exec, 0, 0, 0);
>> +            mem_region = vram_if_possible(importer_fd, 0);
>> +
>> +            ahnd = intel_allocator_open_full(importer_fd, 
>> xe_ctx->vm, 0, 0,
>> +                             INTEL_ALLOCATOR_SIMPLE,
>> +                             ALLOC_STRATEGY_LOW_TO_HIGH, 0);
>> +
>> +            bb_size = ALIGN(bb_size + xe_cs_prefetch_size(importer_fd),
>> +                    xe_get_default_alignment(importer_fd));
>
> Nit: You can drop this chunk. The below xe_bb_size() will handle it 
> for you.
>
>> +            bb_size = xe_bb_size(importer_fd, bb_size);
>> +            xe_bb = xe_bo_create(importer_fd, 0, bb_size, 
>> mem_region, DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +
>> +
>> +            igt_init_fb(&dst_fb, importer_fd, fb->width, fb->height,
>> +                    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
>> +                    IGT_COLOR_YCBCR_BT709, 
>> IGT_COLOR_YCBCR_LIMITED_RANGE);
>> +            dst_fb.gem_handle = temp_buf_handle;
>> +
>> +            src = blt_fb_init(fb, mem_region, pitch);
>> +            dst = blt_fb_init(&dst_fb, mem_region, pitch);
>> +
>> +            blt_copy_init(importer_fd, &blt);
>> +            blt.color_depth = 32;
>> +            blt_set_copy_object(&blt.src, src);
>> +            blt_set_copy_object(&blt.dst, dst);
>> +
>> +            blt_set_object_ext(&ext.src, 0, fb->width, fb->height,
>> +                       SURFACE_TYPE_2D);
>> +            blt_set_object_ext(&ext.dst, 0, fb->width, fb->height,
>> +                       SURFACE_TYPE_2D);
>> +
>> +            blt_set_batch(&blt.bb, xe_bb, bb_size, mem_region);
>> +
>> +            blt_block_copy(importer_fd, xe_ctx, NULL, ahnd, &blt, 
>> &ext);
>> +
>> +            blt_destroy_object(importer_fd, dst);
>> +
>> +            put_ahnd(ahnd);
>> +            gem_close(importer_fd, xe_bb);
>> +            xe_exec_queue_destroy(importer_fd, xe_exec);
>> +            xe_vm_destroy(importer_fd, vm);
>> +            free(xe_ctx);
>>           }
>>       } else {
>>           fb->gem_handle = prime_fd_to_handle(importer_fd, dmabuf_fd);
>> @@ -332,7 +456,7 @@ static void test_basic_modeset(int drm_fd)
>>       igt_device_set_master(drm_fd);
>>       igt_display_require(&display, drm_fd);
>>   -    output = setup_display(drm_fd, &display, &pipe);
>> +    output = setup_hybrid_display(drm_fd, &display, &pipe);
>>       mode = igt_output_get_mode(output);
>>       igt_assert(mode);
>>   @@ -470,6 +594,8 @@ igt_main
>>               igt_require(second_fd_vgem >= 0);
>>               if (is_i915_device(first_fd))
>>                   igt_require(!gem_has_lmem(first_fd));
>> +            if (is_xe_device(first_fd))
>> +                igt_require(!xe_has_vram(first_fd));
>>           }
>>             igt_describe("Make a dumb color buffer, export to another 
>> device and"
>> @@ -480,11 +606,5 @@ igt_main
>>                   igt_dynamic("second-to-first")
>>                       test_crc(second_fd_vgem, first_fd);
>>           }
>> -
>> -        igt_fixture
>> -            drm_close_driver(second_fd_vgem);
>>       }
>> -
>> -    igt_fixture
>> -        drm_close_driver(first_fd);

Any reason why we're removing this? Even if we want this, this should be 
a separate patch IMHO if it is not related to XE support.

Thanks,
Karthik.B.S
>>   }
