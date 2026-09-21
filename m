Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DB2C982ED
	for <igt-dev@archiver.kernel.org>; Mon, 21 Sep 2026 16:16:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9328410E75F;
	Mon, 21 Sep 2026 16:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f+aMpMad";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04FFB10E75F
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Sep 2026 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790007331; x=1821543331;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=7gKZwM05AXvxxVpfwhhKjwJjE2QFkJEtshmcp1iDWL4=;
 b=f+aMpMad9jelx8FuikVLWMpjiiCkjoNKjtg9DIEUiCiSAVxO4Gp0IHPy
 hqyERCU6zPbmprFwZzQZNkvwUmsxjTdCsXTI4Sdtw1SY64dlPv5jCJpck
 bWH5GZmb3P/DY6eAxBk5bsbjcU5daiWoVHTr0nkS/+JaE5SNr9TjU9XW2
 f+Emmo6aPjJ3xD2CXmpx/QhcgcX4BAdAvR2rC+Y8F1t1/fU4M2H6h6m5b
 5eLs+cGowO0tnhitC05oNwzPJlsBhJFJOLTIr0AYTIH3ah6RSx3Sw8qAc
 yPUYQYTqAnEWQXKK1ruOdwAophJxLtHKRyQKpLvz5mPmWs51dXPqptqlW A==;
X-CSE-ConnectionGUID: Be85JYErR/Kal4MEDGiCPQ==
X-CSE-MsgGUID: PG7UmpHpTuKZSNbleb2/pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="78096129"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="78096129"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 09:15:31 -0700
X-CSE-ConnectionGUID: lC2eb0wSQselfhVABcfzVA==
X-CSE-MsgGUID: +4mrEvO3T8Wdn6Jr7+fA3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; d="scan'208";a="271909782"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2026 09:15:30 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 09:15:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 21 Sep 2026 09:15:30 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.10) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 21 Sep 2026 09:15:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XoPr1HAA163/+0a8q9QfzCf0iwyo90cowZS85M+m/uB8z03MjOYihzbipAQm0qXYLqF0Uj2N4jS9ccOWBB0jGq84j7YRu1FCDdHvGTjL+Q0CoDxZTPqw2vG5T+m1RdSZnJCL9XlsyuD2XV0l9na/nldam9OMRsClG05sGlYLDDhzo/+qzixSvrvZ8Jn4kh5avGZKKPcuNbV6cnREmSCLwQ7Lr6Us5h2KUAmDSv91rj2HBjvRgd1j/iqgI8dUCxMxjqzIsaqQYfXpxL45v1aasaQMBtEnZgFYQqEsmBy6+5BOIxuOyFnY1ucSDzt8d/2gPY2Aejd6McQMNPvR2qAyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7T/WHjRGiNGSTXgAOglEBssn17FMwVIV7oonmRDMeA=;
 b=qSMO40gaNhBjakNDA0bav3Y/6RDwIR+2UY4JboRqx+eNx4JXDwz+93QiiFqvJsy4eOxuPOo72dvPfIOlF6auxm5QOGlwWf/ibfT5g7ZN+9fdnuUY52FLsGXDZXTeLhr/otw20b0T0xI/nB8zafkQWnLxJvcnLAYLb/FuGiTPVSdIoiArVOvCZnot5ChnNBmfquWVe+4QmkY94OHQjijUzozlNDIgGzZQ+qg56D4F3PsftCgBHpytBFd7epylSRembMolIvoBVtVkbT+dZieUh+zEpib4v+EBsyPXNBReLfFI0qlcFePS/UpUbyNxB3qyd6ay3wr3/OsqQIgxUFBanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9037.namprd11.prod.outlook.com (2603:10b6:208:580::14)
 by IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 16:15:26 +0000
Received: from IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c]) by IA3PR11MB9037.namprd11.prod.outlook.com
 ([fe80::397:50af:2184:932c%6]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 16:15:26 +0000
Message-ID: <b2cb705d-f880-4f87-92e4-0020a20ffb6a@intel.com>
Date: Mon, 21 Sep 2026 21:45:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/xe_exec_system_allocator: skip huge-page
 multi-process tests when memory is low
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jia Yao
 <jia.yao@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20260917230748.1825181-1-jia.yao@intel.com>
 <20260921153834.aqh546y7gr5xqyxt@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: "Sharma, Nishit" <nishit.sharma@intel.com>
In-Reply-To: <20260921153834.aqh546y7gr5xqyxt@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0273.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::12) To IA3PR11MB9037.namprd11.prod.outlook.com
 (2603:10b6:208:580::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9037:EE_|IA3PR11MB9304:EE_
X-MS-Office365-Filtering-Correlation-Id: 84277fb0-e248-4998-8621-08df17fb8c11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|11063799006|56012099006|4143699003|10067099003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6e0p2iTRTYk+/PQX6GHUQzh74QmHySWYC77pz4SNULmd/UleVbhOy5plAoiALWV/RXuTUK0aM+8ajlfh7IPt5EJWPY5DJVuOx5PO0EzcJBmKM9Ww6Q5kcXeW5PspQ77H76X93DrPG7ZZxbRQwLm6eS57E663KEnnC4xob4l5wk7OiJR6LGuzux2VU80OwZ6IbHVHNJz0yfXdBYm7mupjaj4iYQpm8RalrxCa/edze5KgVoP1UIqlrACr+7xjk4QnHYtNjl5vdSxW+vDEz5xDOFwS3WFb8QaaQYYXR6CT3a7aSAH5BqOCxSiJ7QsEX1EeBaKYxFVqU6kd2FNvgmvp3ehIeCO+cjtlb/J5XhN5IL4bLT7Tp2JsTN2hJrBUQ8yaxpjgggHsoKRMh2MWVn4MKXVCSQnIatnQQb4Rvsnvu2LBoeneBXB4UryhKnMwe3ZGxFqtMT5ErB9NbIzq3IXjXurXM/X6mwX4mYgFG+JJv3iMoPuVMOW85TWVtpkzyzEuxh8OPL/+lWUrzDMjmChXo9ATcPwXlUjwaT3MpkfyWXV4y5SAb4FAuD8V9G7BaJdm1hyIPJeSxF4OKxz502aotRoiI189Hqqh+TAfXlyo+zyfgK9iIWeWGu0cBo+7Zb0z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9037.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(6133799003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OGlOY05YU3NFRjJ0SVQxV1VPWVVnb1lraVlnUlFjb05sMXJjakMzclE4VFpw?=
 =?utf-8?B?WjVncHlqbnJWRmdkYmZOL3NhWWU2SUI0QXA1RW45MGx2WFp0Wk9lOFg4VHNx?=
 =?utf-8?B?bXlQV0R3aEYyMjkvdDlhcDVsc3ZuUCtXVzlWWEFxelF5ZFZsM2FsT1ZzR1Bz?=
 =?utf-8?B?WGMrTDFTaDRoRDcrYXpQWnM0TXZZVFVpZlRPWTUwTlhRa1pLL0tTZGd1N1Zh?=
 =?utf-8?B?ek5lbDFDM0VPL0psRnczY0h6UzMwVVdLbVlLazVJOGRrb3ZhZW4rNGR5Q1Fn?=
 =?utf-8?B?V29lNFFVNGZwbXJWb2JWMzhGK2dicVJTcjcyQS9zUVNqMkZtWTZpMnY4c0E5?=
 =?utf-8?B?a05hRUFoYWxJaGlKMmVMdE5PY3ZrUmY1QkVqRU9pSFhpOStQQ2ZIUEdXUU5y?=
 =?utf-8?B?ZE5vdlVnaGFHN2N0cmZuSjY0RXY2bDV3RjByMmh4VFQ5aGR0TEh1ZW8wTnF3?=
 =?utf-8?B?Zk4xVFRBNWNTTXJMa25TNDVpVS80SHBSY0lKSVhGeXJQRE5JdXJYM3U2cENK?=
 =?utf-8?B?aFJsWkdrbWxrZHZCNEJ0YjJJQzFMbUhlN2NJSVZVYkw0cFRzRXZXR3d4OHky?=
 =?utf-8?B?WG54VFNHbTFiQllTZ29uSS9LRXQrY1BuVmRXMkZnUDNXL0JGMDNFVytzL0N5?=
 =?utf-8?B?WVQzSC9LMi8wQmJsSGFDY1FNcEVEcnB3SmsyUHFUUW1mRVhCK0pmYnhsdGtn?=
 =?utf-8?B?Mng1TkR2SUdjQklQNUxwQUJoOVp6dWFQRklKb0YyRFprMGZYUkQ4WGYvUXIv?=
 =?utf-8?B?NERueUdSd3NISW9NQmxvejVtckZrQmFQYll1N2hWUXNscWpyT2lWYzUyTmJw?=
 =?utf-8?B?blZWaHRDbmVJcGsxMHVBS0t3NHRiUGd5eVhxcVBNSmhYcGp3TG9KM1IzTkMr?=
 =?utf-8?B?blpUSiswT2phc2V3Tml3clhzSU4vWXV2bkFSZ1EwM0o3cGVFTDRhVi9QSTI3?=
 =?utf-8?B?bFEreHp6K2N1SGkzd3pUZEdFRmNLRVowSXFoK2lyVCtDSmQwY2VvOEZUUmdY?=
 =?utf-8?B?dDVISkIveDZzQmd6RGJFOXpURTloRjRSbE9yMVpHT3NnWW5BTTFyMmNLd3dS?=
 =?utf-8?B?clFodVltNFAwMXpwOW5TcTRaZ2R0MGpGemE0TC9yVlhtRy9BS1MwV21BYWxT?=
 =?utf-8?B?bG56bU0rcTNwVDB3ZHJPb3laUFVyUDdBK0dZeFFINVB0MW85djJNc3AxdTRL?=
 =?utf-8?B?UzVWWkFZT1ZOa1lCRC8vbUpNdjdJTXN4K1JFQkZOcXI1TWI2di85V0NDbmV2?=
 =?utf-8?B?M2FiOGdRNjFNVE52UHFHV25tbDhldjczSnh3UUxLMk5pN3JMaVlGSUg2WGN5?=
 =?utf-8?B?MnNhbWVIUGhvN2VHRDYxNFFCcnYzOEVjZm9MUmhoblFUeDJ6YTYreTljMXhL?=
 =?utf-8?B?ZzNpeUVBRFlibWJMVHRzTXZIdUZ6VVhWQXhqbFdwNVgvMkdmZ2JnQjdaSi9o?=
 =?utf-8?B?Z0gzMk9nV3V1Q28xTmRnTnVqVTcxT2lRazFuN296NlJMYUxpSit3Z2ZEZjFu?=
 =?utf-8?B?WnVSUk9TS2YyS29QK0ZNcTdQbnl0L0FjNVkzZ3pWUHdKZFVaUVJPbGJCa1Fn?=
 =?utf-8?B?ZHJEWVF1dkI2Vkc5c2o2UXBjM2VFYnJ2UlpRZytMdkxSMGtTbERKTElOTUgw?=
 =?utf-8?B?L3F5WUxHZE85VFBrNTlKdUMyQVNnSmpGcFROdlBhU1ZvdHdoWVdHcXowK3Ir?=
 =?utf-8?B?TXl1NHFzWFh1VkVCeHhOZVB3OWxXUEI2b0ZoaitPcklBYllhRUlDTjg2N2dT?=
 =?utf-8?B?UTUzMC9tV09RZUlKN3dRZzVrQWFkRjhJYnF5TDhtQTczWFBtMVFZeTJFUGp5?=
 =?utf-8?B?WDRDcWZjU3NjMGtTNUY3NUZ0Vmt3dDhDY3I2TVlsZFhsekUzNnRFaGtRb2t4?=
 =?utf-8?B?bnBLRG1wTW5FRzhaZFdVSW02MUw4aVNheTJHeUpHanhJSkxUL0tMOGhJYmY0?=
 =?utf-8?B?YU84dUp2SGpMMDZjUzMrVjBvWlp2VE41MGxWWUFHM0hza2RYMGZESVl2MmRp?=
 =?utf-8?B?d1NQbVhaUXYranNjYmJEZHRPcC9iQ3lVQ2E1cG5XbFNRTjFnZ0ppeUJuNVVw?=
 =?utf-8?B?QndjcHhYeE9rdW8wYXlZN3ErTW5xcVdackJMRVE5OUlVV1NPU25lMC9KejBM?=
 =?utf-8?B?OExPbWRlUVB1enlaQVNpYk8reDZlQUZVS2IxNU81RnNzMEc0aEVmTW9mUFJs?=
 =?utf-8?B?ZSt4dmZ3Q281UXZWWTQvZldjMGM1NHNPOW5ISnVMeVB4QXNOMVZhYzlMbkor?=
 =?utf-8?B?elgyMUVLK2ZwZHlwOXhEdXM1SXhWZmNvQk1TVXJuaEhERFdjQUZBdVNIMG9X?=
 =?utf-8?B?UFI3bCs5WlA3VG9RemJlUTFJemg4aVgyRUZEbjM2SFV4UFBXYTU1QT09?=
X-Exchange-RoutingPolicyChecked: nXuIZN5hbhj/cP1pm+DjZl5o3ddiT+U+uKGCUuuvETNmWtEOTif2d9Ba0SdmTNZjWMNrIrlTnaJ+2pqM2C0vK9zqA1DSOS6gr7O6iTLJFF8jyPNtBQDViByqoFUh4aVfYd8duzmuBfXHDDNCbDHCnj4KrH4o8YV4CpTX7tHdXr6/o09dDMaCEVzG11eQgADGwA7N2MphPB41+gTsQG31dOmYPwnilFUMaqkxLmDShxVKcpxc1YYefOS4iMKOCqV8HlvowjEQPAZzJWLcXK54i0cduLLpS7+jKDgS14NmXtzmiqAiTaNWYOl4yNZ3h/i9mRGEgE9iIeW9ZctIG0Z+Uw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 84277fb0-e248-4998-8621-08df17fb8c11
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9037.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2026 16:15:26.5902 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cg835BWlouPt5lHhFHj3j2ipf8tUqN3i3XFJUqQ6duiu8uA/tXUzz5gIoCaSliewGV/jDWG+2VGl9b9G+eaATA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9304
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

Hi Jia,

On 9/21/2026 9:08 PM, Kamil Konieczny wrote:
> Hi Jia,
> On 2026-09-17 at 23:07:48 +0000, Jia Yao wrote:
>
> I didn't looked into you patch, only few nits,
> first about subject, please add 'intel/' prefix, so it will be
>
> [PATCH] tests/intel/xe_exec_system_allocator: skip huge-page multi-process tests when memory is low
>
>> The process-many-stride-mmap-new-huge subtest forks one child per GPU
>> engine and, with the MMAP|NEW|HUGE_PAGE flag combination (without FREE),
>> each child accumulates up to n_execs×SZ_2M of anonymous hugepage mmap
> --------------------------------------^
> please use ascii, better
>
> each child accumulates up to n_execs * SZ_2M of anonymous hugepage mmap
>
>> buffers before freeing them at cleanup.  On constrained systems the
>> total peak memory (n_engines × n_execs × 2 MiB) can exhaust system
> Same here, use ascii '*' for multiplication.
>
>> RAM, trigger the OOM killer, and cause the surviving processes to time
>> out waiting on fences (ETIME / errno=62) rather than failing cleanly.
>>
>> Add igt_require_mem_kb() that skips when MemAvailable is below the
>> estimated worst-case peak and call it in processes() for the
>> MMAP|NEW|!FREE path before any children are forked.
> Did you looked into Xe full results? It seems there are still an
> error:
>
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_15862/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge-nomemset.html
>
> but I do not know if your change should repaire it.
>
> Regards,
> Kamil
>
>> Signed-off-by: Jia Yao <jia.yao@intel.com>
>> ---
>>   tests/intel/xe_exec_system_allocator.c | 39 ++++++++++++++++++++++++++
>>   1 file changed, 39 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_system_allocator.c b/tests/intel/xe_exec_system_allocator.c
>> index 305512dfd..1f57ab0a3 100644
>> --- a/tests/intel/xe_exec_system_allocator.c
>> +++ b/tests/intel/xe_exec_system_allocator.c
>> @@ -1173,6 +1173,28 @@ static void igt_require_hugepages(void)
>>   		      "No huge pages available!\n");
>>   }
>>   
>> +/**
>> + * igt_require_mem_kb:
>> + * @needed_kb: minimum required free memory in kB
>> + *
>> + * Report whether MemAvailable is sufficient.  Used to avoid OOM kills in
>> + * memory-hungry multi-process subtests (MMAP|NEW without FREE).
>> + */
>> +static bool igt_require_mem_kb(uint64_t needed_kb)
>> +{
>> +	/* igt_get_meminfo() returns bytes; convert to kB for comparison */
>> +	uint64_t avail_kb = igt_get_meminfo("MemAvailable") >> 10;
>> +
>> +	if (avail_kb < needed_kb) {
>> +		igt_info("Not enough memory: need %" PRIu64
>> +			 " kB, have %" PRIu64 " kB; test not run\n",
>> +			 needed_kb, avail_kb);
>> +		return false;
>> +	}
>> +
>> +	return true;
>> +}
>> +
>>   static void
>>   madvise_swizzle_op_exec(int fd, uint32_t vm, struct test_exec_data *data,
>>   			size_t bo_size, uint64_t addr, int index)
>> @@ -2228,6 +2250,23 @@ processes(int fd, int n_exec_queues, int n_execs, size_t bo_size,
>>   	if (flags & HUGE_PAGE) {
>>   		enable_hugepage();
>>   		igt_require_hugepages();
>> +
>> +		/*
>> +		 * MMAP|NEW without FREE accumulates up to n_execs hugepage
>> +		 * buffers per child process (one per engine).  Each buffer is
>> +		 * at least SZ_2M after the HUGE_PAGE alignment, so the worst
>> +		 * case peak RSS is n_engines * n_execs * SZ_2M.  Skip early
>> +		 * if free memory is insufficient to avoid OOM kills that turn
>> +		 * the test into a timeout rather than a clean failure.
>> +		 */
>> +		if ((flags & MMAP) && (flags & NEW) && !(flags & FREE)) {
>> +			uint64_t n_engines = xe_number_engines(fd);
>> +			uint64_t need_kb = n_engines * (uint64_t)n_execs *
>> +					   (SZ_2M / 1024);
>> +
>> +			if (!igt_require_mem_kb(need_kb))

return is called if false is returned for igt_require_mem_kb() (enter in 
loop) but didn't take any action like skipping the subtest because of

unavailability of memory in system. The subtest will show success 
always. igt_skip("No memory") should be called if no memory available.

Also in test_exec() for many subtests (available in section array) 
HUG_PAGE flag is passed so this igt_require_mem_kb() should be called there

to check memory available. What do you think?

>> Regards
Nishit
>> +				return;
>> +		}
>>   	}
>>   
>>   	map_fd = open(sync_file, O_RDWR | O_CREAT, 0x666);
>> -- 
>> 2.43.0
>>
