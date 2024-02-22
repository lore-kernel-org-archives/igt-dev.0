Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B478C48BF8
	for <igt-dev@archiver.kernel.org>; Thu, 22 Feb 2024 04:31:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D292F10E86E;
	Thu, 22 Feb 2024 04:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b93AC7Bf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E391C10E86E
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Feb 2024 04:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708576266; x=1740112266;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MPEHbTJAiHtVvM5QTgDnTxdWqLLQb8C1hSQ0LfpmBoI=;
 b=b93AC7Bf81hU5LMaSaFOgBSPmC1vxntgGw/tPSQ4VHi60ALI8GTCCsiZ
 Cr+Q2rJgLPLUZajrevx+p36+/XGe56IVY36OLema5wX9kIrRd6xMbZy9P
 Af2w61n41u8tR0yQ+Rv4bkxzX3M3S5fFezZogO6yevjEV3THhC9w5egXG
 F+W4jCQBLlOVTrQAK12br1TJJscDfa7iTFIeqkfe6jVyYy3g/GJhwN67y
 hrTDRh7qDIN2/FUhBOq4/2+jo3uoJwz195Bd85kwzU3FOYCey0cAxugMf
 WSWHDycTSB0BGRvdvey6kfCk0OCyIUJacGpJtaVripUXIi1x8yLa4rvms w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="14201503"
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="14201503"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 20:31:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,177,1705392000"; d="scan'208";a="10073753"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 20:31:07 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 20:31:06 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 20:31:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 20:31:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=No4jBUTwz7izJg3v+lYB9ff+q8i0F6Do1GqP0wFVbPhl/gblW9Gsdm9x6eW4G7tPyn381dOwUCMv9LKJnwaX12fOEv70dcxI20aqbkD6u9npXGBbkbsen/8MMYBPACepTwwgeoUnrgtQ+ChfBXUva9Qc0u1atQZM0IlIL3tvETx2D7d24M08HA+u7n8dD6rk8czO/O4PC3BWPJh+OgTvt7Symh6gITNb3sf/db1UkUTZgFTBzWNCOdySBqAIF6CVBHvxl/bjj54CJCeraIXiqUmLx8VHYxmpzsoyPsgKbWDfqhFdo6PtA1vjtiMmi+BkJttcpldACwk73iv3XvhR3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WR6/EwBRxbH4oJi5HW+ILNW4PGp/tP1e2UlPPCvzQl4=;
 b=GxfO/0B21hb57XkL5AmnG9UKsv2svgldaseLWz2KTQyGbCG6v6/IyzJY+/PTQW9NwKHWHa2+LBedAU/NQeDkLXQ3E9imYu96uUlGhi4lDTx9R6XtG0QoJuBK0WYiRmRZyN/V+T4IZnPr+2EcjAV/B86RxL5gxHB+iFdE641Z496Du6I4LNjoh0BAa1oNwlzk+IlJrsWBJPVrTqzZ2dUBeF2Hc6YG8mso7ZiQqvi4GNV7IUfzOsJbDXx3jChipzOBjGF/BXPmKJ5Rm5E3wl0NKUlog6jn22iFURM6T59quS0z6me/VdKT0u9O3fPzDauv5GGjk+LqZLNCumYOTxwU9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.21; Thu, 22 Feb
 2024 04:31:03 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::3f57:7e0d:60df:27dd]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::3f57:7e0d:60df:27dd%5]) with mapi id 15.20.7292.036; Thu, 22 Feb 2024
 04:31:03 +0000
Message-ID: <9a8f5a3c-d656-4b99-bb97-93d86091c7a8@intel.com>
Date: Thu, 22 Feb 2024 10:00:57 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4] tests/kms_ccs: Convert subtests to dynamic
 subtests
To: <juhapekka.heikkila@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20240221030542.17634-1-karthik.b.s@intel.com>
 <c901ac07-fe78-4d19-9b49-30d2ddf46fc2@gmail.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <c901ac07-fe78-4d19-9b49-30d2ddf46fc2@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ0PR11MB5896:EE_
X-MS-Office365-Filtering-Correlation-Id: 721a45a1-d813-4f0b-6cde-08dc335f13bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HO6heaBbhgp1gqWM0/nEbgbB1r7nmteXcQQUVtDr1aIXM1HLPpn69CasSTJPpeZTQsBw5HB0xLQXntU1pHyW9+zBgAQfV+A+d4d7bgyzq1CFC1xVzVrCY7Ss3p7HwJ3BPpVLkFS76W7jEsb7W8C+Xr0QbLJPKADzM0c0xcymkRrlA15lMLZdllgZq9ETjWG+Y/YPC9zEpmmsJul2gZaRuQmAlo3VSpGcaKE0VgmoSdFCbeMjSsqS3WQw29NV6L218OFEzegQAUlnowVAoEh+XC+DDcMGvdO8bWcnWvd9nyXjKNDieVD7FXjJhpD3mO7OZb4hPTDtmLbHVT1kSWvQ9wLOlBPse3lHU1oWS/zY/zlVPmqtBEDbY6Z2dqg5d/Nzo6s9/eMvOe07YyKrfYMaBMz5/t65wGZkNc6B8eBswlVyEyey5iCA4JeaAokO5QAOtzg7/WML+rFfEQtXSAFCX7hH24hmQbnzQvwCI79AZciJuFb/unzEqXyFIFjVf0B9pgOyfnZAp7QnW/wdI2ACGqlaciEM8a1oyEVjmfIYQk4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDhma0J0RVhQNE9xN29OaVcxbTB5QklBblVsSTg3Y1I2UjBlelNTN0EyMC9p?=
 =?utf-8?B?YmU1TWZuK0JteGFKWEN1ZmdibXBjS001NmxwdnY1VUhyUVFKUDRKOWQ3Zm82?=
 =?utf-8?B?MGEzc2pFaTVoR2t4TG5IVExVKzR2a29NUkZvMEhsbEFsN1BhZ1htOHk0MnB0?=
 =?utf-8?B?K1ZFaGVlM0ZqU3hEMUpVcGViaktLSXp1WmVKWmN6dDJwZVR3ZHBKZ3I4Mjdh?=
 =?utf-8?B?aGlUQzRBN2VLZUhGZFhlVmY0SXYvWmtJZTNUazgyNmszWmVBUXhiUzFMNTRX?=
 =?utf-8?B?YnFsdG13TkpMSUxRWXVtOWNSNVFXV0ZPVVZMWkdEOS9wT2ZJRllxT1RRenQ3?=
 =?utf-8?B?dXRjc3lqb2kydmtpUTZUYjV1a0tvN2NKZndvdTdFd2VJOHFOS1U4WUEwYVpt?=
 =?utf-8?B?RUJMS2JIOFl3RHZrQXduSkFEOWZjaXdMcUIvRUV3OUNkZkZVZTYybzNuZm9L?=
 =?utf-8?B?QlF2OWN0L0hVZWdRdkp5VlZ1eHdUczhkZUR3aWlmVGtWM0hRb2xEZ1pIOVF5?=
 =?utf-8?B?Tm9zOFR2cWsvYlNBZ2EvR3JOSHZ5dkZRQnVRdSt3VGVnQXRHRDJ3QlRMWVBm?=
 =?utf-8?B?T1F2ZEw4dXdXaTFaeWV3ZGJRbjZWYTFkSlhCNDNyUFFuVXJXQnNWekUvcEdU?=
 =?utf-8?B?NStXK3EzZzhEbHEvazJscC9TMmpjYmpLZmgrMlRCYXgrWndyQ3dmRmJ5dTg4?=
 =?utf-8?B?Z1NmOWpsY2Q4a0ppVmZMTVNTb1lLclYzSHhFRldNMHNyNjlacUZyS0lreFc4?=
 =?utf-8?B?aEJHeVpmUjRQcHFkTU1rNXpiOUZoRSs1bDBoZDExYkNhUkZLY1JHYmVJaDVz?=
 =?utf-8?B?MjJQM2UzbWlGSWRyUmN5RXNWaHR2RzFiMjl2RU1vWnE2QjZ0WWhxTHdoNkNm?=
 =?utf-8?B?bW05ditYU2RGZzZuOHlhV2UwRG5wUStybTM5MXBybnI3L012T1RBTStGbkFM?=
 =?utf-8?B?dXJVd3ZjSTdOZ1NlNU53MTVFSXdVZnZCTDJtenVhaExTSzMvR0JxNXhrYmkr?=
 =?utf-8?B?OGRXaVY4amsrSjdpOFNqalBYM2R5QWRDbytrKy9YL0ZVU1dDVHVwVHRVRmlw?=
 =?utf-8?B?RGpCK3NDdmRaM3JpckthQldwdmVmK3JQR210VlNTazNkMzB1OE9QdlF5OFha?=
 =?utf-8?B?eExZdjVUL05nd1VlNzNQZlA3b2RLY3gwNVEwRUdWYlNLcDhTSDdEemdTRndI?=
 =?utf-8?B?bUxITFBFd1dLei90bm42S2crdU44WTFJNGFMZFZPUnVRNmRBVVVGTHNLVVBk?=
 =?utf-8?B?Wjd5L21abXJnYmlUd294TWNaN2k1ZWtNcnA3VmoxcWEyclpKeCswYU9DNW1q?=
 =?utf-8?B?bVpnS3BDakVKcUVLUTJ3aitBTjZ3SVlXM0k2dFYvV0JDTGlJbkxSMUg5Z0RD?=
 =?utf-8?B?OEtnMDk3OVIyZVpiM3ZndC80UmMwTFoxcG0yL2ZneXFXV3Q2bmg5OE5HM2hB?=
 =?utf-8?B?MjZySW9HNVlRTjlXNkpFUTNLd2FPOTRjemdUN1g3ekRIK1JJTUxHcDQ4Z1ZV?=
 =?utf-8?B?OWFjNzRmVU9wZTlXNlZiN1hTUnVCWkVReEdMYlhEWlJrMnRKTjdCMlNIajV2?=
 =?utf-8?B?SHJZa2xkdDJOWmFFOW5DV3Q5ekNPNXVvYTgrbDFpcU04ZzFQbmxQdzRtNlR6?=
 =?utf-8?B?cFR1dThRS2Vnb2F6ZzB3YzFXMzNkQjRTYThFc0Fjdmh1eExSeTJvUGc1dU1U?=
 =?utf-8?B?SU5uNFBva3NtYVplWWN3NURGMDB2YjZHaVhocGVUMWEwenpJRE9ZQ0dvYkNw?=
 =?utf-8?B?M0ZpYzd6RGpJcW1RbSswSVV5bUxKNDQ5ejBEczh5ZTFLM2xEcVNIbFEvM0Fs?=
 =?utf-8?B?MmFEWWZmWnV6Ujgrck9wc3ArNVZlbjhiTDZ6KzNKMWpQbUZFTUp0bEp6N2Jl?=
 =?utf-8?B?cGVZMzAxYlVQcVRTNUVQVWVlTVNDbHo1MUpENExQbW9Ia3lRUXBRbEJ3Y3BS?=
 =?utf-8?B?alBqTUpNeDkyeTFmc3Y1NkJNWGtVZVA2WmltcitJeWRoYzcrdEdWZU9peHpY?=
 =?utf-8?B?dkw3VllWcHIxcjJURkcwMWZPcHAwdm84c0ZvdUVDRmtmSFE4RldJZUFaV0ZL?=
 =?utf-8?B?M0hoOVFIWGxMWjZBeHhadXdkWG50QU9oRFVpTk1jTXpwNmpZWG9Hd21nNjh6?=
 =?utf-8?Q?mSXxSklRbpb1mXkspFEzPj0Zo?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 721a45a1-d813-4f0b-6cde-08dc335f13bf
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 04:31:02.9506 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ALvaypQ5ikHQsFa6rMZZp4WTV+bQuqaMlz+tau80EBo7UuygHABdoFXjkrPFiK/J21nxOVLuzjsGExI/PtHQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5896
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


On 2/21/2024 5:13 PM, Juha-Pekka Heikkila wrote:
> Look good!
>
> Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Thanks JP for the rb. Merging this.

The selftest failure is unrelated to this patch and the 
kms_ccs@.*xe2-ccs skips are expected.

>
> On 21.2.2024 5.05, Karthik B S wrote:
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_ccs.c | 193 +++++++++++-------------------------------
>>   1 file changed, 50 insertions(+), 143 deletions(-)
>>
>> diff --git a/tests/intel/kms_ccs.c b/tests/intel/kms_ccs.c
>> index 82714af93..4f8e30791 100644
>> --- a/tests/intel/kms_ccs.c
>> +++ b/tests/intel/kms_ccs.c
>> @@ -44,35 +44,16 @@
>>   #include "xe/xe_query.h"
>>     /**
>> - * SUBTEST: %s-%s-%s
>> - * Description: Test %arg[2] with given %arg[3] modifier
>> + * SUBTEST: %s-%s
>> + * Description: Test %arg[1] with given %arg[2] modifier
>>    *
>>    * arg[1]:
>>    *
>> - * @pipe-A:                    Pipe A
>> - * @pipe-B:                    Pipe B
>> - * @pipe-C:                    Pipe C
>> - * @pipe-D:                    Pipe D
>> - * @pipe-E:                    Pipe E
>> - * @pipe-F:                    Pipe F
>> - * @pipe-G:                    Pipe G
>> - * @pipe-H:                    Pipe H
>> - * @pipe-I:                    Pipe I
>> - * @pipe-J:                    Pipe J
>> - * @pipe-K:                    Pipe K
>> - * @pipe-L:                    Pipe L
>> - * @pipe-M:                    Pipe M
>> - * @pipe-N:                    Pipe N
>> - * @pipe-O:                    Pipe O
>> - * @pipe-P:                    Pipe P
>> - *
>> - * arg[2]:
>> - *
>>    * @bad-aux-stride:            Bad AUX stride
>>    * @ccs-on-another-bo:         CCS with different BO
>>    * @missing-ccs-buffer:        Missing CCS buffer
>>    *
>> - * arg[3]:
>> + * arg[2]:
>>    *
>>    * @y-tiled-ccs:               Y tiled ccs
>>    * @y-tiled-gen12-mc-ccs:      Y tiled gen12 mc ccs
>> @@ -85,33 +66,14 @@
>>    */
>>     /**
>> - * SUBTEST: %s-%s-%s
>> - * Description: Test %arg[2] with %arg[3] modifier
>> + * SUBTEST: %s-%s
>> + * Description: Test %arg[1] with %arg[2] modifier
>>    *
>>    * arg[1]:
>>    *
>> - * @pipe-A:                      Pipe A
>> - * @pipe-B:                      Pipe B
>> - * @pipe-C:                      Pipe C
>> - * @pipe-D:                      Pipe D
>> - * @pipe-E:                      Pipe E
>> - * @pipe-F:                      Pipe F
>> - * @pipe-G:                      Pipe G
>> - * @pipe-H:                      Pipe H
>> - * @pipe-I:                      Pipe I
>> - * @pipe-J:                      Pipe J
>> - * @pipe-K:                      Pipe K
>> - * @pipe-L:                      Pipe L
>> - * @pipe-M:                      Pipe M
>> - * @pipe-N:                      Pipe N
>> - * @pipe-O:                      Pipe O
>> - * @pipe-P:                      Pipe P
>> - *
>> - * arg[2]:
>> - *
>>    * @bad-pixel-format:            Bad pixel format
>>    *
>> - * arg[3]:
>> + * arg[2]:
>>    *
>>    * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
>>    * @4-tiled-dg2-rc-ccs:        4 tiled dg2 rc ccs
>> @@ -127,35 +89,16 @@
>>    */
>>     /**
>> - * SUBTEST: %s-%s-%s
>> - * Description: Test %arg[2] with %arg[3] modifier
>> + * SUBTEST: %s-%s
>> + * Description: Test %arg[1] with %arg[2] modifier
>>    *
>>    * arg[1]:
>>    *
>> - * @pipe-A:                      Pipe A
>> - * @pipe-B:                      Pipe B
>> - * @pipe-C:                      Pipe C
>> - * @pipe-D:                      Pipe D
>> - * @pipe-E:                      Pipe E
>> - * @pipe-F:                      Pipe F
>> - * @pipe-G:                      Pipe G
>> - * @pipe-H:                      Pipe H
>> - * @pipe-I:                      Pipe I
>> - * @pipe-J:                      Pipe J
>> - * @pipe-K:                      Pipe K
>> - * @pipe-L:                      Pipe L
>> - * @pipe-M:                      Pipe M
>> - * @pipe-N:                      Pipe N
>> - * @pipe-O:                      Pipe O
>> - * @pipe-P:                      Pipe P
>> - *
>> - * arg[2]:
>> - *
>>    * @crc-primary-basic:           Primary plane CRC compatibility
>>    * @crc-sprite-planes-basic:     Sprite plane CRC compatability
>>    * @random-ccs-data:             Random CCS data
>>    *
>> - * arg[3]:
>> + * arg[2]:
>>    *
>>    * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
>>    * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
>> @@ -172,35 +115,16 @@
>>    */
>>     /**
>> - * SUBTEST: %s-%s-%s
>> - * Description: Test %arg[2] with %arg[3] modifier
>> + * SUBTEST: %s-%s
>> + * Description: Test %arg[1] with %arg[2] modifier
>>    * Functionality: ccs, rotation, tiling
>>    *
>>    * arg[1]:
>>    *
>> - * @pipe-A:                      Pipe A
>> - * @pipe-B:                      Pipe B
>> - * @pipe-C:                      Pipe C
>> - * @pipe-D:                      Pipe D
>> - * @pipe-E:                      Pipe E
>> - * @pipe-F:                      Pipe F
>> - * @pipe-G:                      Pipe G
>> - * @pipe-H:                      Pipe H
>> - * @pipe-I:                      Pipe I
>> - * @pipe-J:                      Pipe J
>> - * @pipe-K:                      Pipe K
>> - * @pipe-L:                      Pipe L
>> - * @pipe-M:                      Pipe M
>> - * @pipe-N:                      Pipe N
>> - * @pipe-O:                      Pipe O
>> - * @pipe-P:                      Pipe P
>> - *
>> - * arg[2]:
>> - *
>>    * @bad-rotation-90:             90 degree rotation
>>    * @crc-primary-rotation-180:    180 degree rotation
>>    *
>> - * arg[3]:
>> + * arg[2]:
>>    *
>>    * @4-tiled-xe2-ccs:           4 tiled xe2 pat controlled ccs
>>    * @4-tiled-dg2-mc-ccs:        4 tiled mc ccs
>> @@ -956,24 +880,10 @@ static void test_output(data_t *data, const int 
>> testnum)
>>   {
>>       uint16_t dev_id;
>>   -    igt_fixture {
>> -        bool found = false;
>> +    igt_fixture
>>           dev_id = intel_get_drm_devid(data->drm_fd);
>>   -        data->flags = tests[testnum].flags;
>> -
>> -        for_each_valid_output_on_pipe(&data->display, data->pipe, 
>> data->output) {
>> -            igt_display_reset(&data->display);
>> -
>> -            igt_output_set_pipe(data->output, data->pipe);
>> -            if (intel_pipe_output_combo_valid(&data->display)) {
>> -                found = true;
>> -                break;
>> -            }
>> -
>> -        }
>> -        igt_require_f(found, "No valid pipe/output combo found.\n");
>> -    }
>> +    data->flags = tests[testnum].flags;
>>         for (int i = 0; i < ARRAY_SIZE(ccs_modifiers); i++) {
>>           if (((ccs_modifiers[i].modifier == 
>> I915_FORMAT_MOD_4_TILED_DG2_RC_CCS ||
>> @@ -987,10 +897,7 @@ static void test_output(data_t *data, const int 
>> testnum)
>>           data->ccs_modifier = ccs_modifiers[i].modifier;
>>             igt_describe(tests[testnum].description);
>> -        igt_subtest_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
>> -                  tests[testnum].testname, ccs_modifiers[i].str) {
>> -            int valid_tests = 0;
>> -
>> +        igt_subtest_with_dynamic_f("%s-%s", tests[testnum].testname, 
>> ccs_modifiers[i].str) {
>>               if (ccs_modifiers[i].modifier == 
>> I915_FORMAT_MOD_4_TILED) {
>>                   igt_require_f(AT_LEAST_GEN(dev_id, 20),
>>                             "Xe2 platform needed.\n");
>> @@ -999,37 +906,46 @@ static void test_output(data_t *data, const int 
>> testnum)
>>                             "Older than Xe2 platform needed.\n");
>>               }
>>   -            if (data->flags == TEST_RANDOM)
>> -                igt_info("Testing with seed %d\n", data->seed);
>> -
>> -            if (data->flags & TEST_ALL_PLANES) {
>> - igt_display_require_output_on_pipe(&data->display, data->pipe);
>> -
>> -                for_each_plane_on_pipe(&data->display, data->pipe, 
>> data->plane) {
>> -                    for (int j = 0; j < ARRAY_SIZE(formats); j++) {
>> -                        data->format = formats[j];
>> -                        valid_tests += test_ccs(data);
>> + for_each_pipe_with_valid_output(&data->display, data->pipe, 
>> data->output) {
>> +                igt_display_reset(&data->display);
>> +
>> +                igt_output_set_pipe(data->output, data->pipe);
>> +                if (!intel_pipe_output_combo_valid(&data->display))
>> +                    continue;
>> +
>> +                igt_dynamic_f("pipe-%s-%s", 
>> kmstest_pipe_name(data->pipe),
>> +                                data->output->name) {
>> +                    int valid_tests = 0;
>> +
>> +                    if (data->flags == TEST_RANDOM)
>> +                        igt_info("Testing with seed %d\n", data->seed);
>> +
>> +                    if (data->flags & TEST_ALL_PLANES) {
>> + igt_display_require_output_on_pipe(&data->display, data->pipe);
>> +
>> + for_each_plane_on_pipe(&data->display, data->pipe, data->plane) {
>> +                            for (int j = 0; j < ARRAY_SIZE(formats); 
>> j++) {
>> +                                data->format = formats[j];
>> +                                valid_tests += test_ccs(data);
>> +                            }
>> +                        }
>> +                    } else {
>> +                        for (int j = 0; j < ARRAY_SIZE(formats); j++) {
>> +                            data->format = formats[j];
>> +                            valid_tests += test_ccs(data);
>> +                        }
>>                       }
>> -                }
>> -            } else {
>> -                for (int j = 0; j < ARRAY_SIZE(formats); j++) {
>> -                    data->format = formats[j];
>> -                    valid_tests += test_ccs(data);
>> +                    igt_require_f(valid_tests > 0,
>> +                              "no valid tests for %s on pipe %s\n",
>> +                              ccs_modifiers[i].str,
>> + kmstest_pipe_name(data->pipe));
>>                   }
>>               }
>> -            igt_require_f(valid_tests > 0,
>> -                      "no valid tests for %s on pipe %s\n",
>> -                      ccs_modifiers[i].str,
>> -                      kmstest_pipe_name(data->pipe));
>>           }
>>       }
>>   -    igt_fixture {
>> -        igt_output_set_pipe(data->output, PIPE_NONE);
>> -        igt_display_commit2(&data->display, data->display.is_atomic ?
>> -                    COMMIT_ATOMIC : COMMIT_LEGACY);
>> +    igt_fixture
>>           data->plane = NULL;
>> -    }
>>   }
>>     static int opt_handler(int opt, int opt_index, void *opt_data)
>> @@ -1060,8 +976,6 @@ static const char *help_str =
>>     igt_main_args("cs:", NULL, help_str, opt_handler, &data)
>>   {
>> -    enum pipe pipe;
>> -
>>       igt_fixture {
>>           data.drm_fd = drm_open_driver_master(DRIVER_INTEL | 
>> DRIVER_XE);
>>   @@ -1076,15 +990,8 @@ igt_main_args("cs:", NULL, help_str, 
>> opt_handler, &data)
>>               data.seed = time(NULL);
>>       }
>>   -    for_each_pipe_static(pipe) {
>> -        data.pipe = pipe;
>> -
>> -        igt_subtest_group {
>> -            for (int c = 0; c < ARRAY_SIZE(tests); c++) {
>> -                test_output(&data, c);
>> -            }
>> -        }
>> -    }
>> +    for (int c = 0; c < ARRAY_SIZE(tests); c++)
>> +        test_output(&data, c);
>>         igt_fixture {
>>           igt_display_fini(&data.display);
>
