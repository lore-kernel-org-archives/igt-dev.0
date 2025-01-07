Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9292E77197
	for <igt-dev@archiver.kernel.org>; Tue,  7 Jan 2025 15:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0CAE10E70F;
	Tue,  7 Jan 2025 15:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bs3xDauH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C9B10E70F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Jan 2025 15:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736264519; x=1767800519;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rAOSe0PypN3s9YVnwMEGPjQMJtzY7VyhbipJgTqtJTo=;
 b=Bs3xDauHMr1j5VR7qKj6LfbVEFTlymEiZm8nPHxBYZwEi/FyuQgmRvjz
 sRIOU724Vhaz9UA05ArEpZB/BUppDzebMxZql+UapuTWkop7I2SmNXITH
 5lj5OYok8/f6THUpK8P8usp8x+R2j4LHJQn0GdPq5i3M8crJPLD7lY/Co
 lg6FtriTQe84l44ryngKq/OsWDcscz/y1/+i+dK7/ZkHU4jYlTYvVIbGb
 L/zHKtnhKgN8mb8vXVfNtgo+l2uTUAGrxCIWRSSm5XZHxXDSoZQs1g9bM
 JUfhzUwYnWgZ1Btp4lVnw8i8I0Ay4gUoSOnblldZ7MqZUnUy4LZDAU5F1 w==;
X-CSE-ConnectionGUID: RxFTFBYlRXiB/DR6JJW5mQ==
X-CSE-MsgGUID: IM/MAwnsR8+qY+wY3f3Cqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="36149797"
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="36149797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 07:41:59 -0800
X-CSE-ConnectionGUID: QxHvMSLFTNeHijjvVR7r4Q==
X-CSE-MsgGUID: Vk8pUDteT+S+C7Qy5UlmTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,295,1728975600"; d="scan'208";a="133649866"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2025 07:41:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 7 Jan 2025 07:41:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 7 Jan 2025 07:41:58 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 7 Jan 2025 07:41:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6lTl52aeI7/iI7OALN8Pp3v5ynzygjbIfFLmmR7spuy2IQ7md50M3TNNVSDXMe386PdCi21zbDgb+fPijbPt/ZCls0CaFKdzciMY02/+PiznZgHDtnZcquBIo1fVC16cnNQhtcV+uiYcNUr8J1dqFGEp/N9omqGWTJZbZqhqruwm9pH5uU4Ip+uhn2pXwOvCWuIj3dXku+2sbLYmMlO4iv4UL1SPe8RscB4L9NdVkTxyFl9RHfYG1gmWEA6ksUqvXzayDK63VXo7bgIyuS198fzWNvTIMAWFR4fP1ns8DWFoGUK/6GtaXFeXw2z/Uq2YmrkMW0nPC+Juf4RiQQKjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NfUcrA8I6svaY0mbEmt2BH+KbD+h3A+0P6COVK/Kvw4=;
 b=OKQ6zkVdwaM7kflaD+rXmZ+Qtb2+JnTFQ8+wY7uaD01nwpjjacWbF47BZmyoAkhIHcOrYvnzHIZCJO6NYVpWaF3mw1Szk+mWIBQDPQu8Rpv8XHULLiT88oNPPcTfsbTicQvNgTGR061oHqjk4AV+/8nuv6mTeMffcOZL6qVJx9ea3jgzbLQGfXOfunjnznGcxItnuX78WujSRPJhH3g/32w5vxAH5CIAls8ZJ1arIc7btnrYgqjBn61oiLIATmzLwcLwi53eWfU9c9FdQbNRlsybSYc9z2smDFFw0Kt3gd4O6UOazwV+wfMlhipu5630hVVxx4GQZp1NfpSyda2zcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH8PR11MB7119.namprd11.prod.outlook.com (2603:10b6:510:215::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.17; Tue, 7 Jan
 2025 15:41:06 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8314.018; Tue, 7 Jan 2025
 15:41:06 +0000
Message-ID: <142ea0a6-f881-4df0-8d0f-32557d8dec80@intel.com>
Date: Tue, 7 Jan 2025 10:41:02 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] tests/intel/xe_exec_capture: Add xe_exec_capture test
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "kamil.konieczny@linux.intel.com" <kamil.konieczny@linux.intel.com>
References: <20241206225911.465603-1-zhanjun.dong@intel.com>
 <c4b8b102d50c8cb81524c8d2b5335201c4bc4bb8.camel@intel.com>
 <f48def4f702c6353e4cfd7012a7e606aaaea4762.camel@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <f48def4f702c6353e4cfd7012a7e606aaaea4762.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR08CA0011.namprd08.prod.outlook.com
 (2603:10b6:a03:100::24) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH8PR11MB7119:EE_
X-MS-Office365-Filtering-Correlation-Id: f2acf44b-7c78-4820-41ac-08dd2f31b300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXJFQTFBR0JiQWZKT3RZNVVKMUNDTFg0RGZvZlJ4RkNJYk90NUpqZDRIRGRN?=
 =?utf-8?B?MjR6VFR2a0hDMGNTd2VlVzVPck5pMGZHZW0xY1hObUFqTVFlMHVTWG12ai9U?=
 =?utf-8?B?aUh3Q1dVTXZWTjZoL2hDemlrUVJmMDZYQnhrQUs2TlNCNk1KK29kdTE1Qlhw?=
 =?utf-8?B?eXRvd0kyREluUmFqKzJNQkc1VlladC9hV0llcVMwUTZMY3hLSEV5TGpFZjI3?=
 =?utf-8?B?VlZOdjF2ay8yeWFsRDBaZUQ4WWV2UldwVkgzUzdCV2RDQWw5VUJJV2JURG5D?=
 =?utf-8?B?WkhjN3pRVkhUWVVBQUUrRlpkeTNKN3dkU24raHRUQjNVbnQxbEtTMklMTGR3?=
 =?utf-8?B?dnBQZmNWSzJrWXQ4QkhLRVd1cHJQUkNVSkVmZ3liNWRocHQvR3NVUG9mUnJr?=
 =?utf-8?B?Q2Uxbm5HSUV3UE1CY1A0RVFVYTMvVkZlbjYvWEh0Rk54cy9PMnlwVVN6VWZr?=
 =?utf-8?B?WGtlUnF6dWl2U1FuQ1lvbFFpNGI1bkVMTzB2WHRoZS9tc01JZUFZNG12K1Y2?=
 =?utf-8?B?c1hNOHFoYXlIekJERWxrNmRrUzRvYkxQZzladmlRT1dnVTJMN0VrNWMvOC8z?=
 =?utf-8?B?ZTMrUjYxM2VTaEE3QnkvSXloU1Z3SHk5Z0xvd2ovMXJiSTFsRkd5NWRKb2t1?=
 =?utf-8?B?WXA0OGxyQmFtS0JjT1BRWjZNZjhDN2lXVERWL2pxMURrRVJiL09IZTBNZ3ZX?=
 =?utf-8?B?L0dRb2lMTHRaWWtGZUViQnZvSmtFNVRMNzF0bXJ5NEJIYms2Ym5LVkZwYjhM?=
 =?utf-8?B?MFRsQUtPaDl3eEtHK3JzTFdIc09aMUJCLzJPY3didHZVMTIwQkpTSk01ZWNv?=
 =?utf-8?B?b0ltWkVpNjF3MSt4VEk4ZkFEK0daVWJ5UnlpQTdlbU1UWHJJaEpLU2c1YjFj?=
 =?utf-8?B?dWd1dUNxUDJVQkducjhwbS96dHVjUEQwWmdRSThjdEhDZnplUzRoWnR6NzdW?=
 =?utf-8?B?bUdrU0FGanRoblhsY3R6VmZQYWpLVC9GejR4OTVXUkxsUU9QSmtCZVFDOWRa?=
 =?utf-8?B?ejdqWWp5VWJvOEorczcxaU0xL1ZVcDdGbUlpNzBWWit2akhuZ1pnTE95SXYz?=
 =?utf-8?B?VWVoSjBvRi9GR1NBN3lQQ1dYRmdMOTRrMGdVNlp3OGtWMENGZjFyUXFmaHM3?=
 =?utf-8?B?dG1aTzVmZGtsdnVwbDR2YklIMjdwdEljc2ZsdTZrWVZyQ1l5d0FGKzIyYW9v?=
 =?utf-8?B?NTlmYWdJZXFMM3dnNnhIZXJ6MURtSWdJVG96ZVB0M2ZTdjQ5WG91Nmo0by9L?=
 =?utf-8?B?bVJBTVZEMjVoQmVLRm1ZVUVjdWt2WjlmY21wanphV2NhTys4SExKUVdNMitk?=
 =?utf-8?B?R2ZjcXZXV3pEZVpINllGWlZ3bk92em5LcUpPOXlJZGpmK1hjQ2Z2TGMyTitS?=
 =?utf-8?B?dml4OCtCQ1lJcituNm12N21IZFpBaWRJSzFkOGd6aVZPa29HQzhVM00vd1lo?=
 =?utf-8?B?akR1UHpXNXQxTmIzU3F3em5vWGNJYTBVSm5CeXN6U2JCNUtOdUVDc0xpNHVm?=
 =?utf-8?B?VkhnL3FsQ3FBOGZzejJWeVJsVWtiQXNaTWYrL1BKY3htUGJzemRueSt6ekp6?=
 =?utf-8?B?Tk1rS2pyb25BRGR5Wkoyd1lDdzFxdlBoT2xyMFFmRWo5bU5lWVRud3R6YW5r?=
 =?utf-8?B?WUdPd0sybmNwQTlsT0MzNC9QUFFHd2RvSGJRZGRQL21KdUVma0tBZE5nbkF3?=
 =?utf-8?B?ZDNtdGtWMTYzbXJZWmpSeGNvNWtOWFZTYkNCQUZTdVVzQlVoYzZySENOU0Jj?=
 =?utf-8?B?czlJYXpCbnFDK0JlQ0llaFA4b2pQd1lNUExkVTRzWFV3cTR1bXRTWHl4Y1ZV?=
 =?utf-8?B?bFVuamRkclBBRGlJRWdQWjRPRzIvbjhOVDBuNndqWlo1c3cyZVhHOStrNVdO?=
 =?utf-8?Q?3BMQYju3CChy6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUtSMlZaVVNxcFVtWFF0QW1ieFcvbHI3bm9jM0xjWjhncGZVcTdyM1RNdjhn?=
 =?utf-8?B?d3g4YjN6NjhmcGQ3NXRVMG9KUG8rbm40QUxuNXdSbStRU1BuTzcwMmFMTnMr?=
 =?utf-8?B?TE51ZVV0cFJ4RWd1RFhiNm1PanR6dDdpOVVKaUYxa0ZCSzU5T0RtNERROXll?=
 =?utf-8?B?QnFGNFlnUURwZnJ6Qzl5di9BdE5pNFRBN0pDRzY0aEdnVXRheXhGQVVWV2cr?=
 =?utf-8?B?eVo0Y2J2Q2J3YkxPc2tkajBqNWhHV0hrc3BydHQxcnp5NEtKc3dJRHV6ZjhL?=
 =?utf-8?B?blo1NUNRc1BySWJVNDZPdHpOMEwwVllmenFVRGdLK1grRXJqSWJQUldjMTBm?=
 =?utf-8?B?bDI4RkxTU1IyZ1pvM1VvZFpGZ2YwZEFDRzlRaDZnT082QnM3RnhMYXlCV2kx?=
 =?utf-8?B?bytaVFNmdWRQOElEbVNnQ240VGhSZ0VBK0NxVTRTTEZXL0MwTXh2NzJwREUz?=
 =?utf-8?B?dFlvd0dVZHZJbDd6M3doUlloVXlDVVlSYlgyV3A4TDFPMFphMUxWczl1K3Vs?=
 =?utf-8?B?NHJhQmVuOGVoc0Q0aFBWcFRSMWFIYm42UVZKNTQ0OVNJNHpQWVJRMTVaQlhw?=
 =?utf-8?B?aGdUTEI3WTVHdW1ycUNLc0JaTmNyQ0prYnRPNDIxaUZiL29nbkZKWHhRSkZQ?=
 =?utf-8?B?MzAwWDFWWHVFTXUrK3B3d2VWRnNzek01VUlJK0NFd3kyQzFJVTgzMTZMRkpq?=
 =?utf-8?B?WEQwQ3lPWFcxc3o5T1F4b0ZvUjlHdklmc1YxWjRBeVpqcWFCM0ZhRm04bXFH?=
 =?utf-8?B?SnN3bE9seUV5L29rYVJSU1BWa2ozc0RveUcyc2pMazk2R0JkVC9taldsMVNq?=
 =?utf-8?B?dTJVMzBMNWxEUk9nNW0wbTZqUzZqTGFJZUxHOXJSVFBBcGVycFdvWWxiNFVH?=
 =?utf-8?B?WDRaRUxMTzdRU0wyWGxtWHdRNlorZ29POFFPSkpQZzNSUnVxUzl6dXdHbnov?=
 =?utf-8?B?dHJNbHJoS3J1ekpkMlBERXhiS0xndmx0NTNGNUNjTmRjaFFrTGpPQVAxTkp3?=
 =?utf-8?B?bWdrbEdkd21Rcnl4TWZoMEZCeStHNEE4RXpxUGErcnlNVXJ6dktqMWRna1li?=
 =?utf-8?B?dWZwYk5oc1poU3NSYXFidEFka3VOTm0vMzRaZktRbFJCL2lQVld3LzJZemlE?=
 =?utf-8?B?enhHRkVCYnZWanliSHJGN3NyTWRwMTVmL3VvWHZTL3dBZ0MxYVpiTllSeEJw?=
 =?utf-8?B?Q05HenJPdy95YzY5SGZCRURsMHRQYzBGNUxFcmIrblVtYWxYaDRNcTdRSGhz?=
 =?utf-8?B?S2dWeGhOUzVyWVdWNjNBUGVwQkpQYVVPbGZQbndMeThNZ0NQWHVnUFBjb1pJ?=
 =?utf-8?B?M2l3VHdMamorSURYemhILzlnSldYUjFIeS9oU2NsVnBOU3VJMVRkMmdjNE5N?=
 =?utf-8?B?dWJaeDZFYVU5alF6UDlmekZ4bmQ3aFdBVmM0NEh4d2FlbXNaN056Q3Jsa1g5?=
 =?utf-8?B?ajlJbUdiS3hPclhhS3E5R3FBM21SQzBHOTdrMDRiU2w2REhUOTRHTlVPajNB?=
 =?utf-8?B?eEFWUVdySXcvMVVqaFZQc0kycUJvK0psaEprZXpJUXN5SE1kNTVEdFM5Q25J?=
 =?utf-8?B?WkhlQzlLUFJ6emdOcWt1Sm55Ukl2Z0Rwd09VRUtVWndycGZWTjJDZmlKV2Jh?=
 =?utf-8?B?UVhWYkN2QVBIVVJCWnNUTEcwZUwvQzRHYTA5bHY3ZW40bWJZdVFCN2ZJRnpC?=
 =?utf-8?B?dWZUdGloeFNXS29vZm1jN1IvWjZYWGdPcFQ4WmlvWWRJU2RFNDMwTHpMT3NT?=
 =?utf-8?B?QU9sK01WRTEvdjVNVUpodWk5enNUK1pBTkpOUTA4MGk0Z29kdlE4Qnhrd3BB?=
 =?utf-8?B?K3VqM1N0TUpoWWEvV3FTWVpjczZIWk1sOFVWRFZ5TFd5UExtazNqZTUzd1FR?=
 =?utf-8?B?WWdqdHg5WE9NekJ3R3VyVkgyMEJrZUI5WXhkY0o3S3UwS1JBaU53NFhLb29U?=
 =?utf-8?B?VzlMbEJ0aDQrTXRCNE5aSlZQUGFYV1FFNTBqNmFyZ3hkLzYxVVNJVmh5MXl2?=
 =?utf-8?B?TUtscWlkR0thK2VybkpMK1UzdWRMNVlycE5ObXlUNkxCblRtd3ljeG96OUxq?=
 =?utf-8?B?T2RCYXJLRlJHSkVJcG9ST2tvYjAwa3lkL3Iyb0dwVFdKUm5SVGdSVkVxeWgw?=
 =?utf-8?B?SjVYUFZIZ1ZIQTM5Y3BkODJOVHl1TENnU0locHlGNjIrSTlDYWVnbThmZSth?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f2acf44b-7c78-4820-41ac-08dd2f31b300
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2025 15:41:06.1903 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RiqoaaAHqHPFEb2n2MuLW8tmmQdrvOhq1kMqhnYhCSozjD2/6IAS+TLl00B1TO/wiKPa4DHAzarsZtxRE/SVzQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7119
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



On 2024-12-12 2:54 p.m., Teres Alexis, Alan Previn wrote:
> 
> Zhanjun, per offline chats with Kamil looks like we need to expand the
> igt_fixture sections before and after the igt_subtest section and
> save the per-engine-timeouts in the initial fixture and restore
> the per-engine-timeouts in the later fixture because the fixture
> section is not bypassed during an assert. That's what i understood.
> That said, we will need another rev of this.

Good point! the per-engine-timeouts should be restored to original value 
no matter of assert being triggered or not.
Although the save/restore for single vs multiple GPU might be different, 
I will take care of it in next rev.

Regards,
Zhanjun Dong
> 
> On Wed, 2024-12-11 at 14:08 -0800, Teres Alexis, Alan Previn wrote:
>> Just re-RB-ing after the recent addition for the change to set engine execution time manually before running the tests
>> on each engine in order to limit the execution time of this test:
>>
>> Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
>>
>>
>> On Fri, 2024-12-06 at 14:59 -0800, Dong, Zhanjun wrote:
>>> Submit cmds to the GPU that result in a GuC engine reset and check that
>>> devcoredump register dump is generated, by the GuC, and includes the
>>> full register range.
>>>
>>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
>>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>>> Cc: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>> ---
>>> Changes from prior revs:
>>>   v9:-  Reduced job timeout to 2 seconds to speedup test
>>>         Add info print to show test is running on single/multiple GPU
>>>   v8:-  Move change list below ---
>>..
