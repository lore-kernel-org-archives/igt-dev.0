Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16C56F5A8D3
	for <igt-dev@archiver.kernel.org>; Tue, 21 Apr 2026 01:59:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D3BB10E77F;
	Tue, 21 Apr 2026 01:59:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N3i7k2/u";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397A410E77F
 for <igt-dev@lists.freedesktop.org>; Tue, 21 Apr 2026 01:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1776736739; x=1808272739;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=v1fFr5DG6q5kqov8RSeIV52ZKVAL+QOJQujzdwghsso=;
 b=N3i7k2/uz9yAyjJWrET8oq0dmp7y2nOLkrC4b6nvgNPqi6EA4tUIipP6
 vs1/Q7o6B/CQ53uHbJWaNDXyAmucRvDEz60UPuEC0RWFvKdpStJ7U/jEt
 oA7Y94n+DXYNgf5Y6rF2yUsFSWvrlSVS9j9SA3YX6xwzn5q2lJxkHN3mP
 xSdf1hfirdi/JqC99CZND11ee67lTsC1cZJpYcniqNBhQQxAy9Kt0Azvj
 RJzzTXBF9ZI7FBGPAKbP8KWU4zTRRBvBg2ltG7ZpXTnyZbTajh5YkPOJh
 6/poVBbGsK0OiN5rDx3+nDNg974PTqNgPu7ogkt7Lin+ASmLD2RvHnZdX w==;
X-CSE-ConnectionGUID: TTWZCIrhT7CbVfJszqNFmg==
X-CSE-MsgGUID: XR2tNOAqS7iR6p5h4VxVhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="89040953"
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="89040953"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 18:58:59 -0700
X-CSE-ConnectionGUID: ej6Mmg/lQzutZni9yUx2rQ==
X-CSE-MsgGUID: 4wDi/nmIS8a228aM5mHu4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,190,1770624000"; d="scan'208";a="227557709"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2026 18:58:58 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 18:58:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 20 Apr 2026 18:58:58 -0700
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.37) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 20 Apr 2026 18:58:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKw5pjgPDLcMy1OwsDGVUxq7dguqA7JjyupNBzfY5MjZEy1tTTQplvFHHMMb/VtJapdc3NRHt6aQdahIDqRjC8f6iJm92ytJYM77KvK7r8Feras2TE5UhSmB8NZKoaa40MoMrf5f8Z/6waf4uIw9HfPZ10Kvxx+5H/ghg6JvYVveLZBvRZIrBeQ1aNhIGH0slYehE85Q+i7MxTnN7fSRepT+jgKkVhIfI+pRpEiuS+3sPY/J6cDIwiwZXQhyolsoTXpZaLga6KsTQvrztYeNJBOJpz79iZdE0RQzyoLXPK/b2BT5IwrHO7Z28pmnjltmjHGoPmGxgNkub5I9Tcl9hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0u2VI2AiW3dBTNlmCkG5vMlDsXaefG6GZigTQUko+bQ=;
 b=NPHiM5buGwnz5VcgPZ3XjUm5scMIbiIylO003j23P4914jgwuM1IHU4ggW3XEBtwixrXkRmKIhzRecZXYdOAzUcXfHnfdjMMtAdkc4HUWZ30Bhz6lew5GmxfccJwWnD7WOoU5UGhVPn51Eh8GfSuyhCBmtvQymElvvXjHtjUBeFRwYYjQ/1y/iPRexPhVybIc0hm7ckyRHQq8KcAiV6Ztku+xM2IBqueUlDMuH4dgEFy0c5VDmBH6dICS6YrCNpbRDOAwNnVf1tXxPLH9IJA5TIrUNQCqGCLEvGHb0PhMp9OghKvBeMTPd2o3crppxTSoR8QYQxE5ijSLsvBW7CsrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com (2603:10b6:f:fc02::7)
 by SJ0PR11MB6669.namprd11.prod.outlook.com (2603:10b6:a03:449::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.15; Tue, 21 Apr
 2026 01:58:55 +0000
Received: from DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::f55b:3f29:ceee:24ca]) by DS4PPF07B018B9F.namprd11.prod.outlook.com
 ([fe80::f55b:3f29:ceee:24ca%8]) with mapi id 15.20.9846.016; Tue, 21 Apr 2026
 01:58:54 +0000
Message-ID: <70584ded-de1a-461b-98d4-68d13caf6348@intel.com>
Date: Tue, 21 Apr 2026 07:28:45 +0530
User-Agent: Mozilla Thunderbird
From: "Thomas, Sobin" <sobin.thomas@intel.com>
Subject: Re: [PATCH i-g-t v3 1/1] test/intel/xe_vm:Add oversubscribe
 concurrent bind stress subtest
To: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Sharma, Nishit" <nishit.sharma@intel.com>
References: <20260413043318.17931-1-sobin.thomas@intel.com>
 <f6ce6dbe99987671c4da269fc4440420fff98c98.camel@intel.com>
Content-Language: en-US
In-Reply-To: <f6ce6dbe99987671c4da269fc4440420fff98c98.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::17) To DS4PPF07B018B9F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF07B018B9F:EE_|SJ0PR11MB6669:EE_
X-MS-Office365-Filtering-Correlation-Id: 232be7ea-e39c-43d3-e87b-08de9f498ae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: Inx6jGuhfPrx4VSfsfTahjC/zNf+X/vWfXrbFOu8T6gsqXCT/RZkhZ14SrdEyRYrlqbnzkZeeeflOFPSTrnXh4ACthM4NlScd96BnoPGU/XjaTWejBgYdmXMdAdDJMEaA8unupVVd2iV90kd8BnFpxydDK1u0xosnsWqSf1WBTVyBcZpcFNNKe0YhrYGhdAc6PtpwlLa7XEC/dGULhC7gYMLdIHueaaHPaErf5wkJeyyiHdTRoXzMu+pA8yFRpJ7tiF5UaOxJ7d7f9qW3GVugVr4qKz0cpzAmMNhhSMJaneaponDdr2+qcHpfUsFYWbpFjmLs+W8uRbvhk8H4MMUaFblD1z8F9EvVwTBpWvMYTfy8PDlfwSfOO0LxaMGX0K1geHUQxaH7MpIZDjtlipFYXNxrtkPJReUJNdqENvfHHDY0JYaxXonT/m6nW2ht0+K5SBfkLx7b+tcIsttuCldFyyVevQagKIQ6LeaKR/jji4ba87dlA5Ze8dmli+sKmTC2OsFSEmH54RxVam27lyCEyIz1qopOoMSvyi5aondQ9630eS1vCnRK0iUJRz5ThQBdbKfNqsq6a4qUC10r/DAcKrMRm+MzgePTfr1Xw4DBhxcyV691fUeYW5UYEk8nEACv2Conm2gpJiQvs1L3/5KvjokJQoW4e7kN49vlCz2gaRpn+Iv/2BrIiq5sZckHgyzILPgdWn4DlVrzMYDJ+06xA1XplKWDdACGkbJtYU6ie4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF07B018B9F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3I2VW83UDhjQzgwdEVubDhybS9zNGZ5VjIyK0oyVGVVMVRuZWZYR2kyQVJj?=
 =?utf-8?B?NzdtbEFYdkswT25HaUtLUmxWQ2pJQktsRW5KbVVkY1ArT09UU0NGSWFiRXBz?=
 =?utf-8?B?eE5PM1JFdktTaGMwOWQ4S1dyeGIybDJ3STJ5Mjh4bmdoREt6SnlRNXZNWnNC?=
 =?utf-8?B?QUg3NWpmT0NmREtNazI5eUlXVE9hcENTaGwwenNGR2VRNmFxZVU3ZWp3clYv?=
 =?utf-8?B?UVV6dVJxVkkrZEhZdkZNeVFLY2l1TzIveHRaekxSWEQyQUVaUitTR1BmNHpJ?=
 =?utf-8?B?Y0lSZjFPV0dvcnZpWEFwSW9kY0pxaDUrQzI3SjZTTFd4dTV5VnRXL1ZCK1dF?=
 =?utf-8?B?NUh2d2RUSHNXK1JqeGJ0bHR6bXVWYWxMUWlFMEFaZzJ5TUVWQnJ3SWFiaGp5?=
 =?utf-8?B?Ri9FZmtjQ2xma0I0QUp6WllGV05sZDdiZVVacG5EajQzbENvcnR0N05mSEVu?=
 =?utf-8?B?aGs3SUY4c3dFMER0K0FKWFBjcCtobURCaXpHaUIzU1NSeDJ3MjZiUEdZUGRa?=
 =?utf-8?B?THNYbmV4amxZYkx0MlpQVlk5MUhEendvVGpKUS92dHBmQ0JIZUtES1BvUGND?=
 =?utf-8?B?U2h3dVJDd0VTVkNNN2JIczRCNUVnNHhUOGxwSUIweWFrRmxwVWtxOXhIUkxD?=
 =?utf-8?B?MGJrRGFsd0pSS2NxV3ZnMXdYdXVlQ1NyZ2laVzhJclhIdW5NQzFZZ3VHVkZl?=
 =?utf-8?B?MG5MOStqZm84UHhqRWV3SXhsNUIra0pWcnZrMWFnN2E2YkY1eXprR2tGRnRl?=
 =?utf-8?B?UWowYWRwT0FjdncvVDA3UUZwaU5ieUthS0Z5dTVQcWd2UlRvMlhucWFiS3NH?=
 =?utf-8?B?S2h1TXA2RnQ4QnVNRngvcDJrMHNzeXBzRkVVWnFjQm5BVHE4Qm1MUk9JeWJ6?=
 =?utf-8?B?cHlFVHRySmxUL1dOOUpLYXJBUnlxTXZqVHdnZWV3ODdqNU5rMlJZcjBWZVJD?=
 =?utf-8?B?SUI4VzZCMDV3TjA0d0I3M1UyL1V0Z0pNeGVCMEFubU1aM2ZWalp6cnQvUm1n?=
 =?utf-8?B?MDlmM3NBbGtrT0hhSEYyUEZQeTYrbC9wQ0xteDlQR3ovV2VZVTFHRkczUkpG?=
 =?utf-8?B?OUhHdzJPamVuRXJBNE1QeHFKdzNLaDV5SDVtTHVyZ3RFdVBQZkJ4eHloQVFQ?=
 =?utf-8?B?c250bEkxQWZOKzBmblQydDRzR2tjOVcyNXcyMkFLam43UGZHL0lhRUc4Rno5?=
 =?utf-8?B?RXMxTjY5Nkl0K2ZtKzZXTUlRV3J0VEh0NlZDQXVrMEVseDBrUXdyL01QMXBh?=
 =?utf-8?B?dkxVQ0Noemlva1kyNUN6QVdLQkc0ZE1BSm10Zk5nUlR3WXRvTDNpRmZLQzdG?=
 =?utf-8?B?emVudkdaV3VRaHFXNkZjTkN0OG83Z0l0cE1xbWdwVUQzREpvb3BLR3dIWER1?=
 =?utf-8?B?ZjYrUGpVN3Q5S2ZCcXJ1NUF6VEp5TTloQ1lrZlZIUEd1a3AyQWdvWXo5eGh2?=
 =?utf-8?B?MndiWXg4Y1pLMnQ0Y1RIZUZ0YkU3UEM4Zy9FQ3ByV3VlNXdVQThkU2tCQVB6?=
 =?utf-8?B?TVNLVXROZm0zT0lYREo4WXJZVGlsell4TXdsYnVwNXJFSzc2elhESnRrTVB0?=
 =?utf-8?B?K0hmckZCQVVEMStYTHJLQWVETCtJclBKQU5POGg2eExlbGgzWWlwV095TkVj?=
 =?utf-8?B?WEJ2emJhbEZnQUFWclhyOThZSTNiM3hmelc1TUljRitPcUlZYTg3YkdUTTVs?=
 =?utf-8?B?Q2xzYmdMZWpSeHRFQVd2RTlXT2VnVDVWd1p4WU5qOENCdHh1bnoyYk1yOFVB?=
 =?utf-8?B?dnNUMXFLWHUrK2NWZFZhUXpqNEZaaDJZUWROcnhPUXNaU0h6dXV4VzhpbHA2?=
 =?utf-8?B?TVFGQWpiRmI2VEs5eTlCbEFuZzdSeXc5ZDl6UnNUU0VtQXFRQ290dE9CbWhw?=
 =?utf-8?B?YWdHQWpyVnhMdFZ2S29FM0VmeUZ1LzhMZHY4bFFOM3pERVFkV2lDSzY2TWVr?=
 =?utf-8?B?N084NjluWVFNVVhSZElhZUpuZ1lOZ3VrL2xTcXNiNW9VWDl5NHFFclR3SDZ0?=
 =?utf-8?B?ck1iY0ovbkhKTUJxemtmL29mWlgzaVVZVDRXZVFJQmV3L21VVzU0cXRJbEdX?=
 =?utf-8?B?RFIxbStYNm4yTWoxR0hwL21rc1NrdURPMGVUM2pzRE90cCs0RVduaWllTEJP?=
 =?utf-8?B?ZEUvb29GMTBnZS92ck9YUEc2eUU2dVBNYUFCMmxHL1hhUUNqUHVRUlQ3YVdD?=
 =?utf-8?B?L2toZGhOOElaY0M1R2RwN0lIRERPOGtNQlZ1OTFDaWhwd3ZKcHEweWNQY3F4?=
 =?utf-8?B?clcrSFJhYzRwVitZeFlMR0xLK29FclZyUWRRVWlPNTAyaGNkQ3RlRjVxZ0FB?=
 =?utf-8?B?WEs0bytnTUw5bktKYVU4R3RIZWNjL2c2RjA5ZXJVRmpFOWRObUdDdz09?=
X-Exchange-RoutingPolicyChecked: A41orjAs695hHld71H8aYEPI74HfxUv7GcgJZ3J79CYrTHi5azxs9B6AI3XiN0lxqO9E1vddR+oVKU4tOkPgCKyQDiY3I50Dvf3w9zwaZ3Qy0SUKpFh1tKIqktSQY1I3mHTZCgKeftJlcEJnL3i33Cgcr2VX8ADn+vT8e/ZZZhJdr7ZuwlknhYgmMsQM+5uO5peXwKKh5HNepHOXtHA51AtYckEWOuOVkZJQvvsrvG9fZ4v1xb9fXaCL1yLPwS+jJNkR9lSGURSf6aMyAPoWoGno6QkBW/XglHcrnNxpgJvlIRqFUu8p4fmqFfFzotyuA72Fg9gEB4EQab95AIrsvg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 232be7ea-e39c-43d3-e87b-08de9f498ae9
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF07B018B9F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2026 01:58:54.8631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjjvESnQ9678tvT9NoLLf2msQpxNv6N8sYGFAUmhxqY/p6IozFlur0rc28Gx1iw6wh69J06D/fgB0PtlztlFQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6669
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


Please find response inline

On 4/15/2026 8:27 PM, Hellstrom, Thomas wrote:
> Hi!
>
> On Mon, 2026-04-13 at 04:33 +0000, Sobin Thomas wrote:
>> Add test for oversubscribing VRAM in multi process environment that
>> creates VM, bind large BOs and submit workloads nearly
>> simultaneously.
>>
>> Previous coverage lacked a scenario combining multi-process bind
>> with VRAM oversubscription. This generates memory pressure with
>> multi-process VM Bind activity and concurrent submission, exercising
>> the bind pipeline under eviction pressure.
>>
>> v2: Removed helper APIs usage clock_nanosleep and commented
>> code.(Nishit)
>>
>> v3: Refactored code to smaller functions.
>>      Added check for available SRAM usage and keep the max process to
>> 20.
>>
>> v4: Remove explicit macros definition
>>      Replace Bind ioctl with library calls.(Thomas)
>>
>> Signed-off-by: Sobin Thomas<sobin.thomas@intel.com>
> First, -ENOMEM can also be -ENOSPC per the UAPI. To check for out-of-
> memory you need to check for both.
>
> There were at least two review comments that I neither saw a response
> to nor a fix:
>
> 1) What are the values obtained by the query_mem_info() function used
> for.
Agreed. There is no active use of this function. Will be removing this
> 2) What coverage is this subtest adding on already existing coverage in
> xe_evict?

  In this test we are performing parallel binds after creating multiple 
threads with over subscription, exposing the issue when batch VM bind 
operation

causes eviction of BOs that share the same VM dma-resv lock within the 
same bind operation .

xe-evict is not simulating this scenario as it performs bind operation 
individually not as a batch

In xe-evict the eviction does not occur within the same bind operation. 
It is not having synchronized concurrent bind submission.


>> ---
>>   tests/intel/xe_vm.c | 433
>> ++++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 433 insertions(+)
>>
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>> index d75b0730d..42effbd48 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -19,8 +19,100 @@
>>   #include "xe/xe_ioctl.h"
>>   #include "xe/xe_query.h"
>>   #include "xe/xe_spin.h"
>> +#include <inttypes.h>
>>   #include <string.h>
>>   
>> +#define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>> +#define MAX_THREADS 20
>> +struct gem_bo {
>> +	uint32_t handle;
>> +	uint64_t size;
>> +	int *ptr;
>> +	uint64_t addr;
>> +};
>> +
>> +struct xe_test_ctx {
>> +	int fd;
>> +	uint32_t vm_id;
>> +	uint32_t exec_queue_id;
>> +	uint16_t sram_instance;
>> +	uint16_t vram_instance;
>> +	bool has_vram;
>> +};
>> +
>> +struct mem_bind_sync {
>> +	struct gem_bo *bufs;
>> +	int n_bufs;
>> +	uint64_t *binds_ufence;
>> +};
>> +
>> +static uint64_t align_to_page_size(uint64_t size)
>> +{
>> +	return (size + 4095UL) & ~4095UL;
>> +}
>> +
>> +static void create_exec_queue(int fd, struct xe_test_ctx *ctx)
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	struct drm_xe_engine_class_instance eci = { 0 };
>> +
>> +	/* Use first available engine */
>> +	xe_for_each_engine(fd, hwe) {
>> +		eci = *hwe;
>> +		break;
>> +	}
>> +	ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id,
>> &eci, 0);
>> +}
>> +
>> +static uint64_t *
>> +vm_bind_bo_batch(int fd, struct xe_test_ctx *ctx, struct gem_bo
>> *bos, int size)
>> +{
>> +	uint64_t *ufence;
>> +	struct drm_xe_sync bind_sync;
>> +	struct drm_xe_vm_bind_op binds[size];
>> +	int i;
>> +
>> +	ufence = malloc(sizeof(uint64_t));
>> +	*ufence = 0;
>> +	bind_sync = (struct drm_xe_sync) {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.addr = to_user_pointer(ufence),
>> +		.timeline_value = 1,
>> +	};
>> +
>> +	for (i = 0; i < size; i++) {
>> +		binds[i] = (struct drm_xe_vm_bind_op) {
>> +			.obj = bos[i].handle,
>> +		.obj_offset = 0,
>> +			.range = bos[i].size,
>> +			.addr = bos[i].addr,
>> +			.op = DRM_XE_VM_BIND_OP_MAP,
>> +			.flags = 0,
>> +		};
>> +	}
>> +	xe_vm_bind_array(fd, ctx->vm_id, 0, binds, size, &bind_sync,
>> 1);
>> +	return ufence;
>> +}
>> +
>> +static void query_mem_info(int fd, struct xe_test_ctx *ctx)
>> +{
>> +	uint64_t vram_reg, sys_reg;
>> +	struct drm_xe_mem_region *region;
>> +
>> +	ctx->has_vram = xe_has_vram(fd);
>> +	if (ctx->has_vram) {
>> +		vram_reg = vram_memory(fd, 0);
>> +		region = xe_mem_region(fd, vram_reg);
>> +		ctx->vram_instance = region->instance;
>> +	}
>> +
>> +	sys_reg = system_memory(fd);
>> +	region = xe_mem_region(fd, sys_reg);
>> +	ctx->sram_instance = region->instance;
>> +	igt_debug("has_vram: %d\n", ctx->has_vram);
>> +}
>> +
>>   static uint32_t
>>   addr_low(uint64_t addr)
>>   {
>> @@ -2696,6 +2788,342 @@ static void test_get_property(int fd, void
>> (*func)(int fd, uint32_t vm))
>>   	xe_vm_destroy(fd, vm);
>>   }
>>   
>> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo
>> *integers_bo,
>> +			   struct gem_bo *result_bo, int
>> ints_to_add)
>> +{
>> +	int pos = 0;
>> +	uint64_t tmp_addr;
>> +	#define GPR_RX_ADDR(x)		(0x600 + (x) * 8)
>> +
>> +	batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD |
>> MI_LRI_LRM_CS_MMIO | 2;
>> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
>> +	tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
>> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +	for (int i = 1; i < ints_to_add; i++) {
>> +		/* r1 = integers_bo[i] */
>> +		batch_bo->ptr[pos++] =  MI_LOAD_REGISTER_MEM_CMD |
>> MI_LRI_LRM_CS_MMIO | 2;
>> +		batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
>> +		tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
>> +		batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +		batch_bo->ptr[pos++] = (tmp_addr >> 32) &
>> 0xFFFFFFFF;
>> +		/* r0 = r0 + r1 */
>> +		batch_bo->ptr[pos++] = MI_MATH(4);
>> +		batch_bo->ptr[pos++] =
>> MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0));
>> +		batch_bo->ptr[pos++] =
>> MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1));
>> +		batch_bo->ptr[pos++] = MI_MATH_ADD;
>> +		batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0),
>> MI_MATH_REG_ACCU);
>> +	}
>> +	/* result_bo[0] = r0 */
>> +	batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 |
>> MI_LRI_LRM_CS_MMIO;
>> +	batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
>> +	tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
>> +	batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +	batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +
>> +	batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
>> +	while (pos % 4 != 0)
>> +		batch_bo->ptr[pos++] = MI_NOOP;
>> +	return pos;
>> +}
>> +
>> +static void create_test_bos(int fd, struct xe_test_ctx *ctx, struct
>> mem_bind_sync *bind,
>> +			    uint32_t  placement, uint64_t *addr)
>> +{
>> +	const char *mem_type = (placement & vram_memory(fd, 0)) ?
>> "VRAM" : "SRAM";
>> +
>> +	for (int i = 0; i < bind->n_bufs; i++) {
>> +		struct gem_bo *bo = &bind->bufs[i];
>> +		int ret;
>> +
>> +		bo->size = GB(1);
>> +		ret = __xe_bo_create_caching(fd, ctx->vm_id, bo-
>>> size,
>> +					     placement, 0,
>> +					
>> DRM_XE_GEM_CPU_CACHING_WC,
>> +					     &bo->handle);
>> +		if (ret == -ENOMEM || ret == -ENOSPC) {
>> +			bind->n_bufs = i;/* stop creating more */
>> +			igt_debug("%s allocation failed at buffer
>> %d\n", mem_type, i);
>> +			break;
>> +		}
>> +		bo->ptr = NULL;
>> +		bo->addr = *addr;
>> +		*addr += bo->size;
>> +		igt_debug("%s buffer %d created at 0x%016lx\n",
>> mem_type, i, bo->addr);
>> +	}
>> +}
>> +
>> +static int fill_random_integers(struct gem_bo *int_bo, int
>> ints_to_add)
>> +{
>> +	uint32_t expected_result = 0;
>> +
>> +	for (int i = 0; i < ints_to_add; i++) {
>> +		int random_int = rand() % 8;
>> +
>> +		int_bo->ptr[i] = random_int;
>> +		expected_result += random_int;
>> +
>> +		igt_debug("%d", random_int);
>> +		if (i + 1 != ints_to_add)
>> +			igt_debug(" + ");
>> +		else
>> +			igt_debug(" = ");
>> +	}
>> +	igt_debug("%d\n", expected_result);
>> +	return expected_result;
>> +}
>> +
>> +static uint32_t setup_batch_syncs(int fd, struct drm_xe_sync
>> *batch_syncs, int *n_batch_syncs,
>> +				  uint64_t timeline_val, struct
>> mem_bind_sync *vram_bind,
>> +				  struct mem_bind_sync *sram_bind)
>> +{
>> +	uint32_t batch_syncobj = syncobj_create(fd, 0);
>> +
>> +	batch_syncs[*n_batch_syncs] = (struct drm_xe_sync) {
>> +		.extensions = 0,
>> +		.type = DRM_XE_SYNC_TYPE_TIMELINE_SYNCOBJ,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.handle = batch_syncobj,
>> +		.timeline_value = timeline_val,
>> +	};
>> +	(*n_batch_syncs)++;
>> +
>> +	return batch_syncobj;
>> +}
>> +
>> +/*
>> + * In concurrent VM bind stress tests, multiple threads
>> simultaneously bind
>> + * buffers to GPU virtual address space and submit batch operations.
>> This
>> + * creates significant GPU memory pressure where the kernel may
>> transiently
>> + * fail batch submission with ENOMEM when:
>> + *   - GPU page tables are being updated across multiple bindings
>> + *   - GPU memory is fragmented across many concurrent buffer
>> mappings
>> + *   - Multiple processes compete for finite GPU resources
>> + *
>> + * Without retries, transient ENOMEM failures cause false test
>> failures.
>> + * Retrying ensures we distinguish temporary resource exhaustion
>> from actual
>> + * driver bugs. Non-ENOMEM errors still fail immediately and are
>> properly
>> + * reported with full errno context for debugging.
>> + */
>> +static int xe_exec_with_retry(int fd, struct drm_xe_exec *exec, int
>> max_retries)
>> +{
>> +	int rc = 0, retries = 0;
>> +
>> +	for (retries = 0; retries < max_retries; retries++) {
>> +		rc = igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec);
>> +
>> +		if (!(rc && errno == ENOMEM))
>> +			break;
>> +
>> +		usleep(100 * retries);
>> +		if (retries == 0)
>> +			igt_warn("got ENOMEM\n");
>> +	}
>> +
>> +	if (retries == max_retries)
>> +		igt_warn("gave up after %d retries\n", retries);
>> +
>> +	if (rc)
>> +		igt_warn("errno: %d (%s)\n", errno,
>> strerror(errno));
>> +
>> +	return rc;
>> +}
>> +
>> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
>> +{
>> +	if (bo->ptr) {
>> +		igt_assert_eq(munmap(bo->ptr, bo->size), 0);
>> +		bo->ptr = NULL;
>> +	}
>> +	if (bo->handle)
>> +		gem_close(fd, bo->handle);
>> +}
>> +
>> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync
>> *vram_bind,
>> +				   struct mem_bind_sync *sram_bind)
>> +{
>> +	for (int i = 0; i < vram_bind->n_bufs; i++)
>> +		gem_close(fd, vram_bind->bufs[i].handle);
>> +	for (int i = 0; i < sram_bind->n_bufs; i++)
>> +		gem_close(fd, sram_bind->bufs[i].handle);
>> +	free(vram_bind->bufs);
>> +	free(sram_bind->bufs);
>> +	if (vram_bind->n_bufs)
>> +		free(vram_bind->binds_ufence);
>> +	if (vram_bind->n_bufs)
>> +		free(sram_bind->binds_ufence);
>> +}
>> +
>> +/**
>> + * SUBTEST: oversubscribe-concurrent-bind
>> + * Description: Test for oversubscribing the VM with multiple
>> processes
>> + * doing binds at the same time, and ensure they all complete
>> successfully.
>> + * Functionality: This check is for a specific bug where if multiple
>> processes
>> + * oversubscribe the VM, some of the binds may fail with  ENOMEM due
>> to
>> + * deadlock in the bind code.
> ENOMEMS or ENOSPC are returned due to out-of-memory? Not from deadlock?


Agreed, we are also doing the parallel binds causing ENOMEM/ENOSPC and 
invalid state happens in memory pressure.

Intent of the test is to verify the forward progress under 
oversubscription and ensure concurrent bind operation is not leading to

incorrect failures or hangs, or invalid state in the bind scenario.

Sure, i will update the description accordingly.

>
> Thanks,
> Thomas
>
>
>
>> + * Test category: stress test
>> + */
>> +static void test_vm_oversubscribe_concurrent_bind(int fd)
>> +{
>> +	#define MIN_BUFS_PER_PROC 2
>> +	int n_proc = 0, n_vram_bufs = 0, n_sram_bufs = 0;
>> +	uint32_t max_by_mem;
>> +	uint64_t total_vram_demand = 0;
>> +	uint64_t vram_size = xe_visible_available_vram_size(fd, 0);
>> +	uint64_t sram_avail = (uint64_t)igt_get_avail_ram_mb() <<
>> 20;
>> +	uint64_t target_vram = vram_size * 2;      /* 2 of VRAM */
>> +	uint64_t target_sram = sram_avail * 50 / 100;  /* 50% system
>> RAM */
>> +
>> +	int total_vram_bufs = target_vram / GB(1);
>> +	int total_sram_bufs = target_sram / GB(1);
>> +
>> +	/* determine concurrency from memory pressure */
>> +
>> +	pthread_barrier_t *barrier;
>> +	pthread_barrierattr_t attr;
>> +
>> +	max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
>> +			 total_sram_bufs / MIN_BUFS_PER_PROC);
>> +	n_proc = min_t(uint32_t, max_by_mem, MIN_BUFS_PER_PROC);
>> +	igt_assert(n_proc > 0);
>> +
>> +	n_vram_bufs = max(2, total_vram_bufs / n_proc);
>> +	n_sram_bufs = max(2, total_sram_bufs / n_proc);
>> +	total_vram_demand = (uint64_t)n_proc * n_vram_bufs * GB(1);
>> +
>> +	igt_debug("VRAM size: %" PRIu64 "MB, System RAM available:
>> %" PRIu64 "MB\n",
>> +		  vram_size >> 20, sram_avail >> 20);
>> +
>> +	igt_debug(" n_proc = %d\n", n_proc);
>> +	igt_debug("VRAM: %" PRIu64 "GB\n", vram_size >> 30);
>> +	igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx
>> oversubscription)\n",
>> +		  total_vram_demand >> 20, (double)total_vram_demand
>> / vram_size);
>> +	igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n",
>> n_proc,
>> +		  n_vram_bufs, n_sram_bufs);
>> +
>> +	barrier = mmap(NULL, sizeof(pthread_barrier_t),
>> +		       PROT_READ | PROT_WRITE,
>> +		       MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>> +	igt_assert(barrier != MAP_FAILED);
>> +	pthread_barrierattr_init(&attr);
>> +	pthread_barrierattr_setpshared(&attr,
>> PTHREAD_PROCESS_SHARED);
>> +	pthread_barrier_init(barrier, &attr, n_proc);
>> +
>> +	igt_fork(child, n_proc) {
>> +		struct xe_test_ctx ctx = {0};
>> +		int rc;
>> +		uint64_t addr = 0x40000000;
>> +		int expected_result = 0, ints_to_add = 4;
>> +		int max_retries = 1024;
>> +		uint32_t batch_syncobj;
>> +		struct gem_bo integers_bo, result_bo, batch_bo,
>> *vram_bufs, *sram_bufs;
>> +		struct gem_bo bo_arr[] = {result_bo, batch_bo,
>> integers_bo};
>> +		struct drm_xe_sync batch_syncs[3];
>> +		int n_batch_syncs = 0;
>> +		int pos = 0;
>> +		uint64_t timeline_val = 1;
>> +		struct drm_xe_exec exec;
>> +		struct mem_bind_sync vram_bind = {0};
>> +		struct mem_bind_sync sram_bind = {0};
>> +
>> +		vram_bufs = (struct gem_bo *)calloc(n_vram_bufs,
>> sizeof(struct gem_bo));
>> +		sram_bufs = (struct gem_bo *)calloc(n_sram_bufs,
>> sizeof(struct gem_bo));
>> +		srand(child);
>> +
>> +		igt_assert(vram_bufs && sram_bufs);
>> +
>> +		ctx.vm_id = xe_vm_create(fd,
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
>> +		query_mem_info(fd, &ctx);
>> +		create_exec_queue(fd, &ctx);
>> +		vram_bind.bufs = vram_bufs;
>> +		vram_bind.n_bufs = n_vram_bufs;
>> +		sram_bind.bufs = sram_bufs;
>> +		sram_bind.n_bufs = n_sram_bufs;
>> +
>> +		create_test_bos(fd, &ctx, &vram_bind,
>> vram_memory(fd, 0), &addr);
>> +		create_test_bos(fd, &ctx, &sram_bind,
>> system_memory(fd), &addr);
>> +
>> +		pthread_barrier_wait(barrier);
>> +
>> +		if (n_vram_bufs)
>> +			vram_bind.binds_ufence =
>> vm_bind_bo_batch(fd, &ctx, vram_bufs,
>> +								
>> n_vram_bufs);
>> +
>> +		if (n_sram_bufs)
>> +			sram_bind.binds_ufence =
>> vm_bind_bo_batch(fd, &ctx, sram_bufs,
>> +								
>> n_sram_bufs);
>> +
>> +		integers_bo.size = align_to_page_size(sizeof(int) *
>> ints_to_add);
>> +		integers_bo.handle = xe_bo_create_caching(fd,
>> ctx.vm_id, integers_bo.size,
>> +							
>> system_memory(fd), 0,
>> +							
>> DRM_XE_GEM_CPU_CACHING_WC);
>> +		integers_bo.ptr = (int *)xe_bo_map(fd,
>> integers_bo.handle, integers_bo.size);
>> +		integers_bo.addr = 0x100000;
>> +
>> +		expected_result = fill_random_integers(&integers_bo,
>> ints_to_add);
>> +		igt_debug("%d\n", expected_result);
>> +
>> +		result_bo.size = align_to_page_size(sizeof(int));
>> +		result_bo.handle  = xe_bo_create_caching(fd,
>> ctx.vm_id, result_bo.size,
>> +							
>> system_memory(fd), 0,
>> +							
>> DRM_XE_GEM_CPU_CACHING_WC);
>> +		result_bo.ptr = NULL;
>> +		result_bo.addr = 0x200000;
>> +
>> +		batch_bo.size = 4096;
>> +		batch_bo.handle = xe_bo_create_caching(fd,
>> ctx.vm_id, batch_bo.size,
>> +						
>> system_memory(fd), 0,
>> +						
>> DRM_XE_GEM_CPU_CACHING_WC);
>> +
>> +		batch_bo.ptr = (int *)xe_bo_map(fd, batch_bo.handle,
>> batch_bo.size);
>> +		batch_bo.addr = 0x300000;
>> +
>> +		pos = build_add_batch(&batch_bo, &integers_bo,
>> &result_bo, ints_to_add);
>> +
>> +		igt_assert(pos * sizeof(int) <= batch_bo.size);
>> +		xe_vm_bind_lr_sync(fd, ctx.vm_id,
>> integers_bo.handle, 0, integers_bo.addr,
>> +				   integers_bo.size, 0);
>> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, result_bo.handle,
>> 0, result_bo.addr,
>> +				   result_bo.size, 0);
>> +		xe_vm_bind_lr_sync(fd, ctx.vm_id, batch_bo.handle,
>> 0, batch_bo.addr,
>> +				   batch_bo.size, 0);
>> +		batch_syncobj = setup_batch_syncs(fd, batch_syncs,
>> &n_batch_syncs, timeline_val,
>> +						  &vram_bind,
>> &sram_bind);
>> +
>> +		/* Wait for bind operations to complete on CPU */
>> +		if (vram_bind.n_bufs)
>> +			xe_wait_ufence(fd, vram_bind.binds_ufence,
>> 1, 0, INT64_MAX);
>> +		if (sram_bind.n_bufs)
>> +			xe_wait_ufence(fd, sram_bind.binds_ufence,
>> 1, 0, INT64_MAX);
>> +
>> +		exec = (struct drm_xe_exec) {
>> +			.exec_queue_id = ctx.exec_queue_id,
>> +			.num_syncs = n_batch_syncs,
>> +			.syncs = (uintptr_t)batch_syncs,
>> +			.address = batch_bo.addr,
>> +			.num_batch_buffer = 1,
>> +		};
>> +
>> +		rc = xe_exec_with_retry(fd, &exec, max_retries);
>> +		igt_assert_eq(rc, 0);
>> +
>> +		igt_assert(syncobj_timeline_wait(fd, &batch_syncobj,
>> +						 &timeline_val, 1,
>> INT64_MAX, 0, NULL));
>> +		result_bo.ptr = (int *)xe_bo_map(fd,
>> result_bo.handle, result_bo.size);
>> +		igt_assert_eq(result_bo.ptr[0], expected_result);
>> +		cleanup_bo_resources(fd, bo_arr);
>> +		cleanup_sram_vram_objs(fd, &vram_bind, &sram_bind);
>> +		syncobj_destroy(fd, batch_syncobj);
>> +		xe_exec_queue_destroy(fd, ctx.exec_queue_id);
>> +		xe_vm_destroy(fd, ctx.vm_id);
>> +		close(fd);
>> +	}
>> +	igt_waitchildren();
>> +	pthread_barrier_destroy(barrier);
>> +	pthread_barrierattr_destroy(&attr);
>> +	igt_assert_eq(munmap(barrier, sizeof(pthread_barrier_t)),
>> 0);
>> +}
>> +
>>   int igt_main()
>>   {
>>   	struct drm_xe_engine_class_instance *hwe, *hwe_non_copy =
>> NULL;
>> @@ -3088,6 +3516,11 @@ int igt_main()
>>   		igt_subtest_f("invalid-flag-%s", s->name)
>>   			invalid_flag(fd, s->flags);
>>   	}
>> +	igt_subtest("oversubscribe-concurrent-bind")
>> +	{
>> +	    igt_require(xe_has_vram(fd));
>> +	    test_vm_oversubscribe_concurrent_bind(fd);
>> +	}
>>   
>>   	igt_subtest("invalid-extensions")
>>   		invalid_extensions(fd);
