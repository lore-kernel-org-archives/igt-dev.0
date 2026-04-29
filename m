Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B33FF8873
	for <igt-dev@archiver.kernel.org>; Wed, 29 Apr 2026 20:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E81210E061;
	Wed, 29 Apr 2026 20:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aDHBms0F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7F9410E061
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Apr 2026 20:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777495933; x=1809031933;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=wnQuHEVQLqLTCile8KVOaqe4eb3Vg7qsb9sWyiImU6g=;
 b=aDHBms0F5Xmmv2VdyVvwxlckPfHHQcZqGiU+f9qngzR2AyT0GIVZy2lN
 LTzaLUEeCc+Euppod3ORe3Tt8Qmp4v9JYUh1dXLIkf97EHjYE3Otbrnev
 3o0UAII8SAcP+qA1KeaDIbC3XVdv/T6Tc5FhExBS0UbH1gVbTr8gbKBFu
 uMOJ6UQ0i/1mav/S5AqiRjYN5nBHEjavc7/Yo57AEslcIRMJmZ/LO5X2s
 TImaTb9M5V0MlFvuzEUjX3J+DJ9WDiSSjKA066uT1ZbI7vRS1jE6GGEyK
 3aOcz8FTAaEgGHDbLi05NO+ngpFe23ciVIQhV7RQzoXv4aNdFM7SM5wWf Q==;
X-CSE-ConnectionGUID: 0EJg5x7LRX+LslMES2jy9A==
X-CSE-MsgGUID: YyzFsjW6SYi64zauGsN+og==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78490609"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="78490609"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:52:12 -0700
X-CSE-ConnectionGUID: gU6Fg1PVTfG0Ekn3VSLYIg==
X-CSE-MsgGUID: sKM3p2AQTOyiMY5SZ8kA7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="238350810"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 13:52:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:52:10 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 13:52:10 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 13:52:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T6n0ac9uGvH0KJaMZa9PAtVBlOnot+PThaMWR6MgdGIx8ffWrN4sbFiMv5NCrfB4tKw6exWEX70tz9pPoMS9p5m+4Y3Wcm1cP8hqthFpP1Ea0S+q2XtxKhyQz3HCqdaCqyU34I3LosG/4a3/XYrbFnBQZjJmqmTvamSrQShp7hDK4C6pdPWXOjTq0tmadg//dA1+alywzCxe82LotkEWvHdXtulJo+CPc1Q4M0dMFS6Fap1lw/oOjIikF2NCjfWnjPmA3hET0TNUzOcO9xFhEhJ97Bub8tY157FsnBruljGqFQJFK8Hgx8XP8FeKqk9m/bU0BiSRdBhBiKuhJEtq6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z7M2vCu6gyNbqtfzs0RZpZirf0cVXU0qvuQBFhHeEeQ=;
 b=EnEEllpj55G3jG/ywZlhEHuc6YefXHBIj53Bjsycs+3ksxOJoCk8PK+XHEbX2uQY4eDYVpfE6g/eOO/EXSq+faMR+SQGIBj4RQr2joazVDVw2otvgfFlUBJQHYEnLLcdx4hWE347qxcIK70/u8u5pmoUPRNhVyBnhmj5y41l4k8iJfBgsgQJ76L8IbyqQWCzBz3HEAR+KddhT2A17SUO5QcD12QwsHUL16bGmGZG8jwWvJBgIvN7TcmLPCfNCGzm7/yjmyAm/nOt7fB6Lv6N3BPTNal6B9lSZ5L8OYCerqeEWgLZczzCtscklJ1gOm45cF1+nyDXkJGRLHwxWm56dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8033.namprd11.prod.outlook.com (2603:10b6:510:246::12)
 by SN7PR11MB6923.namprd11.prod.outlook.com (2603:10b6:806:2aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Wed, 29 Apr
 2026 20:52:07 +0000
Received: from PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc]) by PH7PR11MB8033.namprd11.prod.outlook.com
 ([fe80::3aa3:869a:aaf2:c8dc%4]) with mapi id 15.20.9870.020; Wed, 29 Apr 2026
 20:52:06 +0000
Message-ID: <34b7c49d-18d2-4f8a-8afd-0487b1c72c4c@intel.com>
Date: Wed, 29 Apr 2026 13:52:05 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/intel/xe_exec_multi_queue: replace sleep with
 barrier queue
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
References: <20260429020856.1857656-4-niranjana.vishwanathapura@intel.com>
 <20260429020856.1857656-6-niranjana.vishwanathapura@intel.com>
 <ab23ef9a6e8b9c8efb500cde38824b9aaf21ef5c.camel@intel.com>
Content-Language: en-US
From: "Wang, X" <x.wang@intel.com>
In-Reply-To: <ab23ef9a6e8b9c8efb500cde38824b9aaf21ef5c.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR17CA0016.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::29) To PH7PR11MB8033.namprd11.prod.outlook.com
 (2603:10b6:510:246::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8033:EE_|SN7PR11MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f6466db-22c5-46e8-904d-08dea6312cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|42112799006|1800799024|366016|376014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1v8b6nlas/Gga0Cp78QZLK419ziF/xb4TuDJd2gO3Lg/ruHOVN105tvC4MJV6BmritoAgJtggbDhyXoqUtWvUj8cxZUvYKBYWugXNGl7jzQEwYm7EdK5dqbkUfvGpFcsCGufOuFLtOE/NaKGS4TEK1jOIu8Hpx3bNBuKSn/zZtB4ia/AlurtMX3tyUttpOwv2bT9qZ5PUGpMBjeAoac8BtEEGWaPTbFuSeZLamyvhLYCWtIc2Itim8t5DWAXOqHsn2I2wZlrRnUwhC7KgMr7ULBu4gQBKIh0lhCISKdVFUPVRQLHaA1YDNx2lU8PZcHhAjaYoR3D7GxdvDtySHUJh6RyA6DcOogKgqB1o0eaY++0BozQacmfQisDhaxIeLBGE4ByN0pbBH07EHoRzHm1i5d+7RJ4gb/Fha05ZvzX/M6YoY0x0Zph3cP18ZV4WHduja2hT4pWN3M6OV+W0+HS5lccmPYb3erLuCjU7+n+VSNLt/wG2vV3ty7S3ruExJsgElU2QMbvw65XsLELDwFT5A+5OZvVpHtUp21sPplm6i8FTYiDrPiQLhHVBwMaF+FMgd7fEALYqQgf8XDBWrTRzHAwSsfbK3AqHnMc8zNBSWraVMk11ci9/NEtCc+AIJ2rLW56ChoZVtwoi36XqzghfrCej7adUkqabmCuchZB0v4jG08trXaJK08NnUK26IZbDmYRkelWk/Y8eX4PTFaAtTkg8fOdAvgmlk+pQGf+Vtg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8033.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(42112799006)(1800799024)(366016)(376014)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TXdOMi9yU3pieXZSa0ppKzBLNTVYOFF1WDZqUkRkNzhWQmptRHFVQjFwNVZO?=
 =?utf-8?B?MDFWekhVY3VJaXVOaVNoR1lLbXJaYnhzdTBTMys2bkJtR2FMMURsU25XcE9u?=
 =?utf-8?B?Q0FycU1zd0ZhaU9KL1lDSGVVNXF4VWpaRy90Z0VWQVlxQVM5UHM0dTR2Y2lL?=
 =?utf-8?B?R2Rtay9HOFZlOUltYVNYQU5xV3RndGVHLzVnSUo2Ukg0MU1xUVhWTUJMNWZY?=
 =?utf-8?B?aHRzODc0clBnS3hYbk9odThRUXF2b1g5M2h3L1lYdXNZU2lLMitXUTZpVEZN?=
 =?utf-8?B?NVBjLzl2NlMrcWwvV1Y0emdhMTdIVXAzMzQ1ZnoxbGlpcll4MUlCUTlWOVNn?=
 =?utf-8?B?dzBCK2wxZnNFUE1WblErNUhhd1RMRU1BSTVrcStUTk9BNlQ1Vk9CSHhDdmIy?=
 =?utf-8?B?dXVsQzFaNTFORVAzUXlQR0tSUStGeitnOWVxalpQZ2JxRThBdDNHdmZJL2pl?=
 =?utf-8?B?TFhtRzN1OXhoTmlFZk1DZlFLZWR5eExWSHp2anVIa2lCcFhNVDZpZ3BYejcy?=
 =?utf-8?B?d24ySjBndGg2K011eUJDbXZpUTNyem9VQzU0aHVTckVReDdTOEJCVjhIVUY1?=
 =?utf-8?B?NmhxNGJpWE9ERUZ4QnJwSWZwamw3bVdPWjZ1UWp6cFdGczhiUWpPUmZVVDJL?=
 =?utf-8?B?c2dSM0cvK0Y3Z29LN3pXajhobi9YWVNpa1YvYjlFcElFRVo4RC9scVFPbjRC?=
 =?utf-8?B?bEF3SFZVUSt5eGZxWTlmNkkvRi9vRmYxY1FzdDByaGxuVzJQeU9MZ0grZmFS?=
 =?utf-8?B?Yi9LRmQzdWc4eU1rQzEyZ2I0MWx3Qk9GckJ2Vi90T1duWVBvVy9PUzRhdkhn?=
 =?utf-8?B?RUZTRkhEZGV4RTZ2c05RTjVIb01COUlxellLUVBZK2gvWUxVZkhNQnVHRkUv?=
 =?utf-8?B?Y3ZkVzl0NVVTaEdGRVRUSWVHcXFmcjhGWDVYOTlpSU1OVEVZUFZVMUVRQWZY?=
 =?utf-8?B?R2pzdjhBUjFwOHMyTkZReTdBMjJNUGJycTlic29WREczMmhXY3o4WVovaEdZ?=
 =?utf-8?B?RjhYVlZHZ1Q2Z1lzV0dOZ0JLeVNJdlZFVVM3cS8yL1ZWa3lFYXdoMGhWRklh?=
 =?utf-8?B?eHN1M2Npc0FFN2E0QVpUUVFmelhGV2xLYnRsdm81VTYzZ0orYllPYklVSk0x?=
 =?utf-8?B?STFBcGY1Uml6aTFwT09wWEpQYXhaNkkxQm1qTnRqQVBDUGZacXg1K0ltU2lL?=
 =?utf-8?B?aWZzK1R5Ym1Qc2lzZllrbHl1S0twbjA0U3RUM3JNTUh5MGJuLzgwNittZmtt?=
 =?utf-8?B?amxXalBmWWJmSzE1YnhzdENkc3lDYjFqM3B0MTNUR2hZTmVRcnREVDU0dXVE?=
 =?utf-8?B?akNUdXNLdmpJZzNoaUdpSDQzaCtka2pLNGxXSkgzckNoYUt5a1hSa3hZdVZ2?=
 =?utf-8?B?T3RldDJKT2lMYnJhVlpIMlA2dXI1M3hCYjJ2YU9xaUk2NXFmYUxhbnQ3TS82?=
 =?utf-8?B?VktmVWE1WnlVTFU5VUw5dFI4R1FsQUtKcCt2d0c3Z0RrblY1T0tBRUdFeFRB?=
 =?utf-8?B?d1RNNnpDbE9IeHNSMmVFaXgzSEMyYzhIU3ZLR1hnQ0pnNUZUb3B1RFV5ckVN?=
 =?utf-8?B?VXAvRHEvSW1YNlJFNFZuUXM5V3dJRm1ERlVTQ0tydjlLMXdqL2tVa1hhcDNi?=
 =?utf-8?B?NlY5MUhNQjJ2UUhWYlNxM1RFYng5dXEzTzQvemlFclQyWDAwN0h3R3RGM1RB?=
 =?utf-8?B?WENMQmhqa1NtbkQvaGIwY0V1dmI5d3EwZkNwZ1NaK3Y4NmdnZm8wdkZieEht?=
 =?utf-8?B?SXdseXp0SEQrZkxiNFByNzBsUERmMGlJZmZsZTY3ZkQ5U3FJdTRSb050Tyth?=
 =?utf-8?B?NWRzYWxic1ByTXhHRjNtcFl5TkYrbWxONkRCU2xjNXViR2FVdWFrVGhET0Zq?=
 =?utf-8?B?SnZxVHJXd2VqWkFENnd1ZzJYczZqdEtqdjZqOUwrYnV3bE9IRWoydW9HNVNv?=
 =?utf-8?B?VXl0elNWMitUbSs4QnFNMlBNYTNxektoZThhSDlZNHFnMGtKZUJ1QTVzWlhI?=
 =?utf-8?B?a2VPVUhFSWxqdVkrS0wwRHBXcVorMVdmOFBZSnZabmdXNXcxU2xINFhIZFU5?=
 =?utf-8?B?TWVuWXkwd2ZVaURFTUFiUjQ4TVVZcUhIY0tyaXFua2FLYVJGdlJQVHMzRlJo?=
 =?utf-8?B?a1JrQUFBWUdaLzhTUmExQkJXM3BJUnNhUVMxWVNNRjZXVnBsd21pS0dWNGpL?=
 =?utf-8?B?VjBEYThLUlROYTV2bzJPbngvcy93QXFYNTk0eVZyNDFyOUs1U0dFWnd1bWNR?=
 =?utf-8?B?QjF4UGlXd2dleUQyc1Jnb1hSUFJZMlF0ZXpUZVg1b09XMlczSDRIUnZOSjRr?=
 =?utf-8?Q?2K34Oci3yOtHVHaoGl?=
X-Exchange-RoutingPolicyChecked: k4ABsUbYqxv6jyVouygdJuwpCzpLrtLOUNNSe+bAqA+GokGybzc4u1kUwOzI4yoj5RQysRjOmHc5rdqRRU/i4dlzxH3oFvHqmqFrsxRz0Wx3LZwP6lbap4AsS/vEwTUZsrhcXNpoWKXfg1u9J7f087rUfrfk07gfO5iUtngnwdqbPW9PxjGgR9DWQbcClnylN0x03zldhDW5CgbthZICbnEm+9+XZW0MXZyHZ0VuxyAxGIECX4qinJJvF/rm0ugAryaGCJ5lFjsRLxYhtjUHTS0WMBHzzkUorjoKIjL21tT1DL7eBdFK9auH1wGxQKgiCX+LDxvJyT5jOQG/XN+zzA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f6466db-22c5-46e8-904d-08dea6312cb0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8033.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 20:52:06.8181 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3NYzDjSTNnzniA6LB4GJ+DM3qFohMG9VaCjK1Tv3TplBO+jNyFZJKaDc829R8wPAUsxJAhhF6Hh6sUybXdWIjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
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



On 4/29/2026 11:27, Summers, Stuart wrote:
> On Tue, 2026-04-28 at 19:08 -0700, Niranjana Vishwanathapura wrote:
>> In __test_priority() DYN_PRIORITY case, replace sleep() with a
>> deterministic barrier using an extra queue in the same multi-queue
>> group. After assigning priorities, submit a spinner to the extra
>> queue, end it immediately and wait for its user fence to signal.
>> This guarantees a full scheduler round-trip confirming the priority
>> updates have taken effect before releasing the other queues.
>>
>> Increase exec_queues[] and spin[] array sizes by 1 to accommodate
>> the extra barrier queue slot at index num_queues.
>>
>> Assisted-by: GitHub Copilot:claude-sonnet-4.6
>> Signed-off-by: Niranjana Vishwanathapura
>> <niranjana.vishwanathapura@intel.com>
>> ---
>>   tests/intel/xe_exec_multi_queue.c | 37 +++++++++++++++++++++++++----
>> --
>>   1 file changed, 30 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_multi_queue.c
>> b/tests/intel/xe_exec_multi_queue.c
>> index 382705d065..8c6fbb2d18 100644
>> --- a/tests/intel/xe_exec_multi_queue.c
>> +++ b/tests/intel/xe_exec_multi_queue.c
>> @@ -381,8 +381,8 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>                  .syncs = to_user_pointer(&sync),
>>          };
>>          uint64_t vm_sync = 0, addr = BASE_ADDRESS;
>> -       uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N];
>> -       struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N];
>> +       uint32_t exec_queues[XE_EXEC_QUEUE_PRIORITY_N + 1];
>> +       struct xe_spin *spin[XE_EXEC_QUEUE_PRIORITY_N + 1];
> Since we're only really making use of this in the dynamic case, should
> we have "+ !!DYNAMIC" instead of "+ 1" here? I.e. we only care about
> the extra barrier one in the dynamic case?
>
> Thanks,
> Stuart
flags is a runtime parameter, so + !!(flags & DYN_PRIORITY)
would make the array size runtime-determined — effectively a VLA.
Even in userspace, VLAs are generally discouraged due to
unpredictable stack usage. The cost of one extra slot is negligible,
so always using + 1 is simpler and avoids introducing a VLA.

Thanks,
Xin
>>          uint32_t vm, num_queues, num_queue_priorities, bo = 0;
>>          uint32_t start_order[XE_EXEC_QUEUE_PRIORITY_N] = { 0 };
>>          int64_t fence_timeout = NSEC_PER_SEC;
>> @@ -403,7 +403,7 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>                  .value = DRM_XE_MULTI_GROUP_CREATE,
>>          };
>>          uint64_t ext = to_user_pointer(&multi_queue);
>> -       int i, j, sleep_duration = 1;
>> +       int i, j;
>>          void *bo_map;
>>   
>>          num_queue_priorities = XE_EXEC_QUEUE_NUM_PRIORITIES;
>> @@ -415,12 +415,12 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>                   eci[0].engine_class, eci[0].engine_instance);
>>   
>>          vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_LR_MODE, 0);
>> -       bo_size = xe_bb_size(fd, sizeof(*spin[0]) * num_queues);
>> +       bo_size = xe_bb_size(fd, sizeof(*spin[0]) * (num_queues +
>> 1));
>>   
>>          bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd,
>> eci[0].gt_id),
>>                            DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>>          bo_map = xe_bo_map(fd, bo, bo_size);
>> -       for (i = 0; i < num_queues; i++)
>> +       for (i = 0; i < num_queues + 1; i++)
>>                  spin[i] = bo_map + i * sizeof(*spin[0]);
>>   
>>          /* Use the default priority for Q0 because we are explicitly
>> waiting for it below */
>> @@ -430,6 +430,11 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>          if (flags & DYN_PRIORITY) {
>>                  for (i = 1; i < num_queues; i++)
>>                          exec_queues[i] = xe_exec_queue_create(fd, vm,
>> eci, ext);
>> +               /*
>> +                * Create an extra queue in the same multi-queue
>> group, used as
>> +                * a barrier to confirm priority updates have taken
>> effect.
>> +                */
>> +               exec_queues[num_queues] = xe_exec_queue_create(fd,
>> vm, eci, ext);
>>          } else {
>>                  struct drm_xe_ext_set_property mq_priority = {
>>                          .base.name =
>> DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
>> @@ -474,14 +479,28 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>                  xe_spin_wait_started(spin[i]);
>>   
>>          if (flags & DYN_PRIORITY) {
>> +               uint64_t barrier_spin_addr = addr + num_queues *
>> sizeof(struct xe_spin);
>> +
>>                  /* Assign increasing order of priority for secondary
>> queues */
>>                  for (i = 1; i < num_queues; i++)
>>                          xe_exec_queue_set_property(fd,
>> exec_queues[i],
>>                                                    
>> DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY,
>>                                                     i %
>> num_queue_priorities);
>>   
>> -               /* Wait for priorities to take effect */
>> -               sleep(sleep_duration);
>> +               /*
>> +                * Submit a barrier job on the extra queue to ensure
>> priority
>> +                * updates have taken effect before releasing the
>> other queues.
>> +                */
>> +               xe_spin_init_opts(spin[num_queues], .addr =
>> barrier_spin_addr,
>> +                                 .preempt = true);
>> +               sync.addr = barrier_spin_addr +
>> +                       ((char *)&spin[num_queues]->exec_sync - (char
>> *)spin[num_queues]);
>> +               exec.exec_queue_id = exec_queues[num_queues];
>> +               exec.address = barrier_spin_addr;
>> +               xe_exec(fd, &exec);
>> +               xe_spin_end(spin[num_queues]);
>> +               xe_wait_ufence(fd, &spin[num_queues]->exec_sync,
>> USER_FENCE_VALUE,
>> +                              exec_queues[num_queues],
>> fence_timeout);
>>          }
>>   
>>          /*
>> @@ -566,6 +585,10 @@ __test_priority(int fd, struct
>> drm_xe_engine_class_instance *eci,
>>          for (i = 0; i < num_queues; i++)
>>                  xe_exec_queue_destroy(fd, exec_queues[i]);
>>   
>> +       /* Destroy the extra queue */
>> +       if (flags & DYN_PRIORITY)
>> +               xe_exec_queue_destroy(fd, exec_queues[num_queues]);
>> +
>>          munmap(bo_map, bo_size);
>>          gem_close(fd, bo);
>>   

