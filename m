Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49738CA6007
	for <igt-dev@archiver.kernel.org>; Thu,  8 Oct 2026 10:13:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFE0D10E6DD;
	Thu,  8 Oct 2026 10:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PkLU06nz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67C810E6DD
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Oct 2026 10:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1791454335; x=1822990335;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=nZXG6u3gkWREafTVXAolGdgw7+eXbdvveDr05HhJwWM=;
 b=PkLU06nzWCEaWlanCB5BNRQJIkyntmLo2ShIj+CU44GQo4IUPj0cRH1f
 RxBvgFFLJHPTTSAS/YhFakPOu4gO4OoLoNEmcKodnlpso3hY4CwXI5GDT
 6CQ7ztmWshABQYLuBFuCv+Vzik4NrTOV7uqqtQbPv8niDwYC0ydRxAM5x
 puMsHqGD4uhxUUIJI85qoFUsAj3x6zooWh/XeHJ+GBY9ioTqRWm/EpoQC
 I9gY9UWxNqGx3A0NamBegDNEmTK1mK3MRQzBHq1ogTJzXZsDSnMrHvW2O
 Cj2Nvq0Aoh7qxG82Mc6eizVytRO54pdH41Cr3Xwg+VqRGAzp5QtNfIobi g==;
X-CSE-ConnectionGUID: HCh6ZqR0TJauaMheRfkpgw==
X-CSE-MsgGUID: lErnZdBuTZeyh8B3UAXcRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="122963"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; d="scan'208,217";a="122963"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:12:14 -0700
X-CSE-ConnectionGUID: iRAK//a0SGud0xw50thG3A==
X-CSE-MsgGUID: 8w2yH1seRoaH9e0Ntyct/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; d="scan'208,217";a="8594"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2026 03:12:14 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 03:12:13 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 8 Oct 2026 03:12:13 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 8 Oct 2026 03:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I7cq+iIb7ctL9qdkcQ6boaU0UbKA/QWokmL7hA2EMz4T4D1iAVybcDqfkZxt/wbBy6zFXXPWXv8wzZZC3Uv2OFMEJ3t6FjvWmvdcX51cy/jdg8YBqYbi8JLeJvBpS9Ssao8RjfHu0sNN+DukacdEAiKYeP9oVvipaocYqhNAQN/xb1o99QvqfVV4mlkDcdPtAgyhwnVi1CxzBZCIdTWgahDlA1kTsrF7kvuxgyaHIAp/WHQ2/qf4cH8av1qeDXJnTiNXRnvrdUcf6JhqHRoj+o8zzHGt9+UUvB1g2OXaJDNH/FYUQjBuFNSnSUjxD/+yUnIF3tW9ZD+EAP2ShSkFSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0KF5KZ6R7qqOrP2AwjbREUOh8ox2Rh0Jzq0O5uk5xEQ=;
 b=UoZfX/7l+m256xzN6ShXynnJSGXQVin0rOyLFJQ1bAEFNTnT0M7vg2/K9umGH+bH+otlL3KtzrkYs+NJ6vAkch+APbSjbZWcWxFDi7OSgzFhNerdKvtG5631BS/cEUznQyesVle7Y4HnxNTVIdZ5GE0JYkIgOSBuxrZRNL3iSyrfDngfcPhRRYJP+MKakG3bQPta/slv06CvOHUxE9R/1+jNLjzXPYGz2s7xqGfuE7zQtmw+goQymP+ykOG8m3kRjDEOBDdXKtQPlSDC7IpFOhOlbAUMeYETKUQpnrjz97drrF8k0HoWnP7jS7IXS6gFq6dBZbwnghDwb3R7zJYR0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5415.namprd11.prod.outlook.com (2603:10b6:208:315::14)
 by IA1PR11MB6147.namprd11.prod.outlook.com (2603:10b6:208:3ed::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Thu, 8 Oct
 2026 10:12:11 +0000
Received: from BL1PR11MB5415.namprd11.prod.outlook.com
 ([fe80::2bb1:a951:b2a8:e165]) by BL1PR11MB5415.namprd11.prod.outlook.com
 ([fe80::2bb1:a951:b2a8:e165%3]) with mapi id 15.21.0472.015; Thu, 8 Oct 2026
 10:12:10 +0000
Content-Type: multipart/alternative;
 boundary="------------MaLl2yFMEnZgn2vrasvGD0XS"
Message-ID: <fd914b92-c9be-4c46-82e1-7c9df0806fb7@intel.com>
Date: Thu, 8 Oct 2026 15:42:02 +0530
User-Agent: Mozilla Thunderbird
From: "Thomas, Sobin" <sobin.thomas@intel.com>
Subject: Re: [PATCH i-g-t v5 5/5] tests/intel: Add oversubscribe concurrent
 bind stress subtest
To: "Sharma, Nishit" <nishit.sharma@intel.com>,
 <igt-dev@lists.freedesktop.org>, <matthew.brost@intel.com>
CC: <priyanka.dandamudi@intel.com>
References: <20260922110438.2402109-1-sobin.thomas@intel.com>
 <20260922110438.2402109-6-sobin.thomas@intel.com>
 <f3794783-c9a3-4641-b979-530b6599bb8c@intel.com>
Content-Language: en-US
In-Reply-To: <f3794783-c9a3-4641-b979-530b6599bb8c@intel.com>
X-ClientProxiedBy: MA5PR01CA0033.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:178::10) To BL1PR11MB5415.namprd11.prod.outlook.com
 (2603:10b6:208:315::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5415:EE_|IA1PR11MB6147:EE_
X-MS-Office365-Filtering-Correlation-Id: 85b45d5a-a2e0-42a3-f855-08df25249d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|260925021911599003|260925021311599003|56012099006|10067099003|260925022911599003|8096899003|11063799006|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: 5tR9BAIPK33S44+TWBcTqNiNLoLM+vZF0UPNntxrUBMa/KpmEjYWh/O9/xnAZtlIvw7txtmEipDqt149yWCOvpvLVXlOpnltIXL3b26jXlGYvBOsZrEvtryS7JaNCEuCdJuD48UK6Mx0E7tdrwAKUVtMFgdhNZG6/jDZsQ7lWlnaQBfwm3pdfMCHXWfqrrVQY15GAzpOO+PXhHLCPTqIo7A6A8Po6ZhaaCvSXw7vLqTUNX/x6d28eGiK8QV07ah1+1AYilD7hb8b/eD9AwqnSDmhE3WgrC9X8BHCZ6uNFx4x8L7+athMuZRT7iRFEgxRGc3bKllYefrgwfF7GxgtiJsMW9Ook40kE79tdwzVE8grtBjR5aG26iDTYq+n3c+Te0f1CL5knPAhqpvQRZRgrIoSLrxEOQA8yCkWx+0cafHPKaaHlLhbPlCBwboXAU7I4XzbNWyL4QyxgKLXNYLWc0zUUUwhuQeC2IR/O5H6eRzmImGv9YMf00Ysf3ipAL/yv0zw5DL+KF/dcWRYOV6V32h/Vtf9b9vnezZ4vQqr3ViSetMKfy/LHLmX3CwBV/hcR3xQLecB8/hkLygtawC8Y7P58FeiTDcDRNrp51XNvB71BkgXxY9bc1kH2xcpJh2nw4UklN/IpFb1c0VkNSKtVeyplz/y236fC6RBYPdgqcI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5415.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(260925021911599003)(260925021311599003)(56012099006)(10067099003)(260925022911599003)(8096899003)(11063799006)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?clN0Q1dPYnBybk42SWJNR01uNUJaRENzbXpEUUFhcXlUejVsYXU0YlcrNzYz?=
 =?utf-8?B?VEZqZ3B2QUJqcU5WbzhPOWJJMklrVElJbWlXZXlSekpWU1RsQXU5RjdXZDgy?=
 =?utf-8?B?cmRJTkdEVUZWSmQyRDFIaXZOVHJlQVZPdlNJSExiT1RCRzlzZ0taQUNDaFh5?=
 =?utf-8?B?ZkpHT1pBbjVVQzlteFMxSW5QcGR0d1hiQ2l5T1FnZmZqK3p2bjBER1VmTlZK?=
 =?utf-8?B?a08yWmd5OERtcEJ2QlZWeElOcWVoMTA5RkxTUzBDYzYyUjEwS2ErNFovWWk3?=
 =?utf-8?B?MGtwYnVnVVI4RXN1N3JZR0lnN1ZzenFmbER0d2w1Vk5GVngxcjE3dy9iOUp4?=
 =?utf-8?B?NS9HM1JMRTNZWmRFNEFXS1Q1WEs3Z1dUTitpb1N5bWpEVjJVNmR0U1lrS3ZN?=
 =?utf-8?B?YUZaRVBsY25RMS9DRjRZSTBjbTdBdUFxbXg1SWtWdjl2VXZ1S2Q2NHZJSk9T?=
 =?utf-8?B?bzNaOHJkbUdKNWREUkU1bjgxM1lFakRGaHJ4QlBzWlZjN0hybzVIYmF0M0Ro?=
 =?utf-8?B?OEdyTTk1ajlyRTZtUnRnYTZic2ZBRVl6azlsaHI5ZXlBN0VnRmJBbjZDa2pa?=
 =?utf-8?B?WXRzT0hSbHBTWHJDQUZleXJaSXFtdEtZVFRCS1BoRnhmSnJmY1VYM0RyZ1lQ?=
 =?utf-8?B?NDY2WmQ3ZHlSNXZXRGFJSVpCUVFhQVhBK1FJZ3gvRXYvTE5idUxCV05UWlNZ?=
 =?utf-8?B?SG9DUTFheWJOdmVtMHUyYXdhQmJmb0hZVUYrUGNEVW95U2diWnBCSW4vNXlo?=
 =?utf-8?B?RkIvVFdmSWtuaGJaeG5GbGFxOVQvdjEzSXFsUFBtZ3B1NjcrNUFHTVlieWFH?=
 =?utf-8?B?UlZJTkZEVWJ0WUhGTksyMi8yd1Q0SGtuMWt4QXIrSzlWZWpRblAxb1BXRUxr?=
 =?utf-8?B?M3hnbmd3dzF3Z1h6SFZmdHF1V0orK0VWa3hQdHp0b0VtUjAvV2tLcGNKRXNR?=
 =?utf-8?B?RTBNUU5BS2NHNytZTnRVWTd5ZEJVa3N5VXZZc2N1VHAvdVdlTXlFNmxmOWtm?=
 =?utf-8?B?MFZLQzQ4eXk0QmJaMU5EMHBtMFI4SHMyUllpTmZXMVlVYjN0Qnl1SHhlV0pk?=
 =?utf-8?B?QUt0NGFZVk5hY0ZWRUZyOURJYW1ma3VFOVg3N0x4MHFudGUxbzk1dWFyUmdC?=
 =?utf-8?B?WTVrZmFXaWFRaXBOTFZTRTBDSFprbmx4SWgzVE5pTnNuVXhTSCtNOUtaNC9x?=
 =?utf-8?B?NEJVRVdReDF1MjNIazJDb3YxbXovMGw0SExKUEhVSW4xY1hpbmlnN0RHbnZI?=
 =?utf-8?B?bnN4RXRMRTZGamlxazhUUlZyL2RlaVlRM1c4bWhZaWpNaHlBUWcyT1M5ak0z?=
 =?utf-8?B?bWdaakVxKzVSNk8rcGpCVVRYS2Q1dTlGclRNVjdiRHZUaHNRQlZyYWRvQlg1?=
 =?utf-8?B?ampUcElKbzNySDFWZFNEc0Q1NERjWEkzTjQwV3RVN0huY3R3YmpCenY1a1Zm?=
 =?utf-8?B?dmpQQ0Q4cnd6cGFBdlB4NjdjS0FFU29KdmMwUHkxVDF2bHdQNmFaVktnZHpE?=
 =?utf-8?B?RW9Wa2hoRGhPNjdrOVVIODQ5OTBMZTEvQlJhVUpHOTh5ZWJVeTM2WHE3YXgy?=
 =?utf-8?B?aDJnUUU3bUtSa3FvUERidVhMK2ZOaE1KTGl0OHZMTmxHRTZ5QWJqL01LT0Ry?=
 =?utf-8?B?S3lzWjI5eTN3Z2lVRjVrU1B1cmVobnpsbWIrRkxlU3Q5YSsxQzV1azJJYmdh?=
 =?utf-8?B?cFBqMmZTU1V1Y0dKUFEwMGVpUy82WkxpWU1xeWk0Tjg4a1AwZTVSdHlDWWkv?=
 =?utf-8?B?YUg4c0s1RUxMSUNUdFZqRUVkbmpxOU5XMnBtVjMwU0JMUzNJay8vNTBBWDVH?=
 =?utf-8?B?QnhOaDZxWlIrdzZUVmJocnhPZzVsM0ltOWRaeTNhaGxyZkpjUXhmdit3V1Q4?=
 =?utf-8?B?V25uWVFmdE9EUUg4bStwSk5qbzUweGIxVGpVNzJNcUE4Z3ZpYUpYc2kvTUVp?=
 =?utf-8?B?dVhqSU5uWnAvZWFtYlI2NW1rUUh2dnFlTTlPdzVGWWJjTk40QklGWFZhWUVn?=
 =?utf-8?B?Q1ppTWFIVFA4Y3VPMkx4TW9pRngvOTVwcW00NFFRZitnYldoa1RMc0s4MlVQ?=
 =?utf-8?B?T2VDd3g2bXNlT1ZTbDBweTBwcExyQ2lKc1lHMnlwUk4yajE5OU4wRjJreVRD?=
 =?utf-8?B?QzNneGtGTE9EQk1zWWQ1VHdUa1E0enluMTUrbmwzL3hTNWt4L1N6NENiRE1X?=
 =?utf-8?B?TWVSTFZnazlsamdyYXB4T1hTMmcrS1JVV0ZvREhYbm5BbkM3VURGZmxJYllq?=
 =?utf-8?B?SUNyQThNQnZ1T3pmQWZROVBLb3VyZWRQWTM0YnY5bm5GM1h1bjVyM0FhQnN1?=
 =?utf-8?B?MW1RVTRmZGxmU1A2ZStOeldvTEFKaEtSYkI0Q0krY0MvUDdwNWVjdz09?=
X-Exchange-RoutingPolicyChecked: zgDgsDcKiDUbLJMrAdVYcPWWmk5w5DOUJl9x1XPnkEaHNQSUd70/twD2yN50LOViDJ+yT1tQpepiP4m6jquvI+oe2hKZijX6pMx3XEQM0cfgrKi1RqfvajE0i+JeCPdc9L7iDlD1EG3KNi8BHqY8u3iUnmGpB40+XVzGjhFbR8crrxwKI6pWVNPwK6bovmFWv94pNobiQzuFxbnh+/1bsbbOLB4DFCYXTq32VQArBww7bvqVnjxuShgzx5IGn0BV0GlxK6Q+Ac7leM6PluVzlZ49KyfJ5UJ8hz97PUk334q56vMc9KT1gDHIvQdrqKw8vGTUEQCgMqLF5sISc6tIgw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 85b45d5a-a2e0-42a3-f855-08df25249d0b
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5415.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 10:12:09.9439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nZfS9ODZ3Q0eg0tIpThhtrkUAlgZsKj8clR25rNeugIINcZStq4D40YS16Qy+N7VFsT3JJh093iZqU6AdL2Mdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6147
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

--------------MaLl2yFMEnZgn2vrasvGD0XS
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nishit,


Thanks for review  , Most of the changes will be taken care, please find 
inline response.


>> Add test for oversubscribing VRAM in multi process environment that
>> creates VM, bind large BOs and submit workloads nearly simultaneously.
>>
>> Previous coverage lacked a scenario combining multi-process bind
>> with VRAM oversubscription. This generates memory pressure with
>> multi-process VM Bind activity and concurrent submission, exercising
>> the bind pipeline under eviction pressure.
>>
>> v3: Fixed minor nits
>> v4: Refactoring of the create_bo ( Nishit)
>>      Fix child process exit deadlock in release_ready_processes() 
>> (Nishit)
>>
>> Signed-off-by: Sobin Thomas <sobin.thomas@intel.com>
>> ---
>>   tests/intel/xe_bo_alloc.c | 533 +++++++++++++++++++++++++++++++++++++-
>>   1 file changed, 532 insertions(+), 1 deletion(-)
>>
>> diff --git a/tests/intel/xe_bo_alloc.c b/tests/intel/xe_bo_alloc.c
>> index d8368087b..2ee468c62 100644
>> --- a/tests/intel/xe_bo_alloc.c
>> +++ b/tests/intel/xe_bo_alloc.c
>> @@ -29,6 +29,17 @@
>>   #define THREAD_VA_STRIDE GB(1)
>>   #define SZ_4K_SHIFT    12
>>   #define MAX_ALLOCATIONS 50000
>> +#define INT_ADD_CNT 4
>> +#define TIMEOUT_NS (30ULL * 1000000000ULL)
>> +#define MAX_SRAM_TEST_SIZE GB(32)
>> +#define GPR_RX_ADDR(x)          (0x600 + (x) * 8)
>> +#define MAX_PROCS 20
>> +
>> +#define EXEC_DATA_ADDR        0x100000ULL
>> +#define EXEC_RESULT_ADDR    0x200000ULL
>> +#define EXEC_BATCH_ADDR        0x300000ULL
>> +#define EXEC_UFENCE_ADDR    0x400000ULL
>> +#define STRESS_BIND_ADDR    0x40000000ULL
>>     /**
>>    * SUBTEST: all-sizes-once
>> @@ -76,14 +87,48 @@
>>    * Description: Test 50 random BO allocation sizes in test table 
>> with a thread per engine,
>>    * leak the binding, unaligned bind addresses
>>    * Test category: stress test
>> + *
>> + * SUBTEST: test_vm_oversubscribe_concurrent_bind
>> + * Description: Test enough random BO allocation sizes, bound as 
>> arrays of binds, to trigger
>> + * evictions with 2 processes per engine, leak the BO munmap / gem 
>> close, unaligned bind addresses
>> + * Test category: stress test
>>    */
>>     #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x))
>>   #define MIN_BUFS_PER_PROC 2
>>     #define N_ALLOC_SIZES    256
>> +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull
>> +
>>   static uint64_t *alloc_sizes;
>>   +struct gem_bo {
>> +    uint32_t handle;
>> +    uint64_t size;
>> +    uint32_t *ptr;
>> +    uint64_t addr;
>> +};
>> +
>> +struct xe_oversubscribe_ctx {
>> +    uint32_t vm_id;
>> +    uint32_t exec_queue_id;
>> +};
>> +
>> +struct mem_bind_sync {
>> +    struct gem_bo *bufs;
>> +    int n_bufs;
>> +    uint64_t *binds_ufence;
>> +};
>> +
>> +struct process_data {
>> +    pthread_mutex_t mutex;
>> +    pthread_cond_t cond;
>> +    int ready;
>> +    int failed;
>> +    pthread_barrier_t barrier;
> barrier not initialized but used. I think it's not required


Agreed. This was missed, was part of  earlier patches in thread part. missed

>> +    bool go;
>> +};
>> +
>>   /*
>>    * Data-driven subtest matrix.
>>    *
>> @@ -103,7 +148,8 @@ enum test_type {
>>       TYPE_ALL_SIZES,
>>       TYPE_RANDOM_SIZE,
>>       TYPE_ARRAY_BIND,
>> -    TYPE_THREAD
>> +    TYPE_THREAD,
>> +    TYPE_OVERSUBSCRIBE,
>>   };
>>     struct test_case {
>> @@ -114,6 +160,14 @@ struct test_case {
>>       bool requires_evict_ram;
>>   };
>>   +struct oversubscribe_params {
>> +    int n_proc;
>> +    int n_vram_bufs;
>> +    int n_sram_bufs;
>> +    uint64_t vram_size;
>> +    uint64_t sram_size;
>> +    uint64_t total_vram_demand;
>> +};
>>   #define LEAK_BINDING        (0x1 << 0)
>>   #define LEAK_BO            (0x1 << 1)
>>   #define EVICT            (0x1 << 2)
>> @@ -244,6 +298,478 @@ static int __xe_vm_bind_array(int fd, uint32_t vm,
>>       return 0;
>>   }
>>   +static void init_pdata(struct process_data *pdata)
>> +{
>> +    pthread_mutexattr_t mattr;
>> +    pthread_condattr_t cattr;
>> +
>> +    pthread_mutexattr_init(&mattr);
>> +    igt_assert_eq(pthread_mutexattr_setpshared(&mattr, 
>> PTHREAD_PROCESS_SHARED), 0);
>> +    igt_assert_eq(pthread_mutexattr_setrobust(&mattr, 
>> PTHREAD_MUTEX_ROBUST), 0);
>> +    igt_assert_eq(pthread_mutex_init(&pdata->mutex, &mattr), 0);
>> +    pthread_mutexattr_destroy(&mattr);
>> +
>> +    pthread_condattr_init(&cattr);
>> +    igt_assert_eq(pthread_condattr_setpshared(&cattr, 
>> PTHREAD_PROCESS_SHARED), 0);
>> +    igt_assert_eq(pthread_cond_init(&pdata->cond, &cattr), 0);
>> +    pthread_condattr_destroy(&cattr);
>> +    pdata->ready = 0;
>> +    pdata->failed = 0;
>> +    pdata->go = false;
>> +}
>> +
>> +static void process_ready_and_wait(struct process_data *pdata)
>> +{
>> +    int ret = pthread_mutex_lock(&pdata->mutex);
>> +
>> +    if (ret == EOWNERDEAD)
>> + igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
>> +    else
>> +        igt_assert_eq(ret, 0);
>> +    pdata->ready++;
>> +    pthread_cond_broadcast(&pdata->cond);
>> +    while (!pdata->go)
>> +        pthread_cond_wait(&pdata->cond, &pdata->mutex);
>> +    pthread_mutex_unlock(&pdata->mutex);
>> +}
>> +
>> +static void process_setup_failed(struct process_data *pdata)
>> +{
>> +    int ret = pthread_mutex_lock(&pdata->mutex);
>> +
>> +    if (ret == EOWNERDEAD)
>> + igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
>> +    else
>> +        igt_assert_eq(ret, 0);
>> +    pdata->failed++;
>> +    pthread_cond_broadcast(&pdata->cond);
>> +    pthread_mutex_unlock(&pdata->mutex);
>> +}
>> +
>> +static void release_ready_processes(struct process_data *pdata, int 
>> n_proc)
>> +{
>> +    struct timespec timeout;
>> +    int ret;
>> +
>> +    ret = pthread_mutex_lock(&pdata->mutex);
>> +    if (ret == EOWNERDEAD)
>> + igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
>> +    else
>> +        igt_assert_eq(ret, 0);
>> +
>> +    clock_gettime(CLOCK_REALTIME, &timeout);
>> +    timeout.tv_sec += 30;
>> +    /*
>> +     * Wait until all children have either reached VM Bind rendevouz
>> +     * Or, failed setup and exited the test path.
>> +     */
>> +    while (pdata->ready + pdata->failed < n_proc) {
>> +        ret = pthread_cond_timedwait(&pdata->cond, &pdata->mutex, 
>> &timeout);
>> +        if (ret == EOWNERDEAD) {
>> + igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
>
> If pthread_cond_timedwait() returned EOWNERDEAD (a lock holder died) 
> code made the mutex consistent
>
> but it is checking igt_assert_eq(ret, 0) which will fail as ret is 
> still EOWNERDEAD, so in case of EOWNERDEAD it should continue to check
>
> ret    if (ret == EOWNERDEAD) {
>
> igt_assert_eq(pthread_mutex_consistent(&pdata->mutex), 0);
>
> continue;                 /* re-check loop condition */
* Sobin: Agreed . Will be taken care in next revision*
>
> }
>
>> +        } else if (ret == ETIMEDOUT) {
>> +            igt_warn("Timeout waiting for the child process: 
>> ready=%d, failed =%d, expected=%d",
>> +            pdata->ready, pdata->failed, n_proc);
>> +            break;
>> +        }
>> +        igt_assert_eq(ret, 0);
>> +    }
>> +
>> +    igt_debug("Process rendezvous: ready=%d failed=%d total = %d\n",
>> +          pdata->ready, pdata->failed, n_proc);
>> +
>> +    /* Release every successful child into VM_Bind at same time*/
>> +    pdata->go = true;
>> +    pthread_cond_broadcast(&pdata->cond);
>> +    pthread_mutex_unlock(&pdata->mutex);
>> +}
>> +
>> +static int build_add_batch(struct gem_bo *batch_bo, struct gem_bo 
>> *integers_bo,
>> +               struct gem_bo *result_bo, int ints_to_add)
>> +{
>> +    int pos = 0;
>> +    int i;
>> +    uint64_t tmp_addr;
>> +
>> +    batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | 
>> MI_LRI_LRM_CS_MMIO | 2;
>> +    batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
>> +    tmp_addr = integers_bo->addr + 0 * sizeof(uint32_t);
>> +    batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +    batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +    for (i = 1; i < ints_to_add; i++) {
>> +        /* r1 = integers_bo[i] */
>> +        batch_bo->ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD | 
>> MI_LRI_LRM_CS_MMIO | 2;
>> +        batch_bo->ptr[pos++] = GPR_RX_ADDR(1);
>> +        tmp_addr = integers_bo->addr + i * sizeof(uint32_t);
>> +        batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +        batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +        /* r0 = r0 + r1 */
>> +        batch_bo->ptr[pos++] = MI_MATH(4);
>> +        batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCA, 
>> MI_MATH_REG(0));
>> +        batch_bo->ptr[pos++] = MI_MATH_LOAD(MI_MATH_REG_SRCB, 
>> MI_MATH_REG(1));
>> +        batch_bo->ptr[pos++] = MI_MATH_ADD;
>> +        batch_bo->ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0), 
>> MI_MATH_REG_ACCU);
>> +    }
>> +    /* result_bo[0] = r0 */
>> +    batch_bo->ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 | 
>> MI_LRI_LRM_CS_MMIO;
>> +    batch_bo->ptr[pos++] = GPR_RX_ADDR(0);
>> +    tmp_addr = result_bo->addr + 0 * sizeof(uint32_t);
>> +    batch_bo->ptr[pos++] = tmp_addr & 0xFFFFFFFF;
>> +    batch_bo->ptr[pos++] = (tmp_addr >> 32) & 0xFFFFFFFF;
>> +
>> +    batch_bo->ptr[pos++] = MI_BATCH_BUFFER_END;
>> +    while (pos % 4 != 0)
>> +        batch_bo->ptr[pos++] = MI_NOOP;
>> +    return pos;
>> +}
>> +
>> +static void create_exec_queue(int fd, struct xe_oversubscribe_ctx *ctx)
>> +{
>> +    ctx->exec_queue_id = xe_exec_queue_create(fd, ctx->vm_id,
>> +                          &xe_engine(fd, 0)->instance, 0);
>> +}
>> +
>> +static uint64_t *
>> +vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx, struct 
>> gem_bo *bos, int size,
>> +         int *out_err)
>> +{
>> +    uint64_t *ufence;
>> +    struct drm_xe_sync bind_sync;
>> +    struct drm_xe_vm_bind_op *binds;
>> +    int i;
>> +
>> +    binds = calloc(size, sizeof(*binds));
>> +    igt_assert(binds);
>> +
>> +    ufence = calloc(1, sizeof(*ufence));
>> +    igt_assert(ufence);
>> +    bind_sync = (struct drm_xe_sync) {
>> +        .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +        .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +        .addr = to_user_pointer(ufence),
>> +        .timeline_value = 1,
>> +    };
>> +
>> +    for (i = 0; i < size; i++) {
>> +        binds[i] = (struct drm_xe_vm_bind_op) {
>> +            .obj = bos[i].handle,
>> +            .obj_offset = 0,
>> +            .range = bos[i].size,
>> +            .addr = bos[i].addr,
>> +            .op = DRM_XE_VM_BIND_OP_MAP,
>> +            .flags = 0,
>> +        };
>> +    }
>> +    *out_err = __xe_vm_bind_array(fd, ctx->vm_id, binds, size, 
>> &bind_sync, 1);
>> +    free(binds);
>> +    return ufence;
>> +}
>> +
>> +/* Returns 1 (caller should skip exec) on an allowed OOM error, 0 
>> otherwise. */
>> +static int bind_bos(int fd, struct xe_oversubscribe_ctx *ctx, struct 
>> gem_bo *bufs,
>> +            struct mem_bind_sync *bind, int *bind_err, bool allow_oom)
>> +{
>> +    if (!bind->n_bufs)
>> +        return 0;
>> +
>> +    bind->binds_ufence = vm_bind_bo_batch(fd, ctx, bufs, 
>> bind->n_bufs, bind_err);
>> +
>> +    if (*bind_err) {
>> +        if (allow_oom) {
>> +            igt_assert_f(*bind_err == -ENOMEM || *bind_err == -ENOSPC,
>> +                     "Unexpected bind error: %d (%s)\n",
>> +                     *bind_err, strerror(-*bind_err));
>> +            igt_debug("Bind failed with expected OOM (%s), skipping 
>> exec\n",
>> +                  strerror(-*bind_err));
>> +            return 1;
>> +        }
>> +
>> +        igt_assert_f(false, "Unexpected bind error: %d", *bind_err);
>> +    }
>> +
>> +    xe_wait_ufence(fd, bind->binds_ufence, 1, 0, TIMEOUT_NS);
>> +    return 0;
>> +}
>> +
>> +static int fill_random_integers(struct gem_bo *int_bo, int ints_to_add)
>> +{
>> +    uint32_t expected_result = 0;
>> +    char expr[256];
>> +    int len = 0;
>> +
>> +    for (int i = 0; i < ints_to_add; i++) {
>> +        uint32_t random_int = rand() % 8;
>> +
>> +        int_bo->ptr[i] = random_int;
>> +        expected_result += random_int;
>> +
>> +        len += snprintf(expr + len, sizeof(expr) - len, "%s%u",
>> +                i ? " + " : "", random_int);
>> +    }
>> +    igt_debug("%s = %u\n", expr, expected_result);
>> +    return expected_result;
>> +}
>> +
>> +static void cleanup_bo_resources(int fd, struct gem_bo *bo)
>> +{
>> +    if (bo->ptr) {
>> +        igt_assert_eq(munmap(bo->ptr, bo->size), 0);
>> +        bo->ptr = NULL;
>> +    }
>> +    if (bo->handle)
>> +        gem_close(fd, bo->handle);
>> +}
>> +
>> +static int create_test_bos(int fd, struct xe_oversubscribe_ctx *ctx,
>> +               struct mem_bind_sync *bind, uint32_t placement,
>> +               uint64_t *addr)
>> +{
>> +    const char *mem_type = (placement & vram_memory(fd, 0)) ? "VRAM" 
>> : "SRAM";
>> +    int ret;
>> +
>> +    for (int i = 0; i < bind->n_bufs; i++) {
>> +        struct gem_bo *bo = &bind->bufs[i];
>> +
>> +        bo->size = GB(1);
>> +        ret = __xe_bo_create_caching(fd, ctx->vm_id, bo->size, 
>> placement, 0,
>> +                         DRM_XE_GEM_CPU_CACHING_WC, &bo->handle);
>> +        if (ret) {
>> +            int saved_errno = errno; /* capture before anything can 
>> clobber it */
>> +
>> +            bind->n_bufs = i;
>> +            if (saved_errno == ENOMEM || saved_errno == ENOSPC) {
>> +                /* Continue on OOM, expected when oversubscribing 
>> the VM */
>> +                igt_debug("%s allocation failed at buffer %d 
>> (OOM)\n", mem_type, i);
>> +                break;
>> +            }
>> +            /* We are returning as this is a fail scenario */
>> +            igt_warn("%s allocation failed at buffer %d: %s\n",
>> +                 mem_type, i, strerror(saved_errno));
>> +            return -saved_errno;
>> +        }
>> +        bo->ptr = NULL;
>> +        bo->addr = *addr;
>> +        *addr += bo->size;
>> +        igt_debug("%s buffer %d created at 0x%016lx\n", mem_type, i, 
>> bo->addr);
>> +    }
>> +    return 0;
>> +}
>> +
>> +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync 
>> *vram_bind,
>> +                   struct mem_bind_sync *sram_bind)
>> +{
>> +    for (int i = 0; i < vram_bind->n_bufs; i++)
>> +        gem_close(fd, vram_bind->bufs[i].handle);
>> +    for (int i = 0; i < sram_bind->n_bufs; i++)
>> +        gem_close(fd, sram_bind->bufs[i].handle);
>> +    free(vram_bind->bufs);
>> +    free(sram_bind->bufs);
>> +    if (vram_bind->binds_ufence)
>> +        free(vram_bind->binds_ufence);
>> +    if (sram_bind->binds_ufence)
>> +        free(sram_bind->binds_ufence);
>> +}
>> +
>> +static void create_bo(int fd, uint32_t vm, struct gem_bo *bo, 
>> uint64_t size,
>> +              uint64_t addr, bool map_now)
>> +{
>> +    bo->size = ALIGN(size, 4096);
>> +    bo->handle = xe_bo_create_caching(fd, vm, bo->size, 
>> system_memory(fd), 0,
>> +                      DRM_XE_GEM_CPU_CACHING_WC);
>> +    igt_assert(bo->handle);
>> +    bo->addr = addr;
>> +    if (map_now) {
>> +        bo->ptr = xe_bo_map(fd, bo->handle, bo->size);
>> +        igt_assert(bo->ptr != MAP_FAILED);
>> +    } else {
>> +        bo->ptr = NULL;
>> +    }
>> +}
>> +
>> +static bool calc_oversubscribe_params(int fd, struct 
>> oversubscribe_params *p)
>> +{
>> +    uint64_t target_vram, target_sram;
>> +    uint64_t total_vram_bufs, total_sram_bufs, max_by_mem;
>> +
>> +    p->vram_size =  xe_visible_available_vram_size(fd, 0);
>
> Sizing used xe_visible_available_vram_size() gives 
> vram.cpu_visible_available; which can be small
>
> to accomodate big BOs or 2x demand, it should be 
> xe_available_vram_size which gives vram.total_available;
>
*Sobin: **We should take visible ram as  available vram can provide 
false  assumptions while allocating;
*

*This will help in early bail out if sufficient VRAM memory is not there. *

*If whole vram is given there will be more number of eviction and can 
cause more*

*probability of OOM.*


>> +    p->sram_size = (uint64_t)igt_get_avail_ram_mb() << 20;
>> +    /*
>> +     * Dynamically cap VRAM oversubscription so the overflow into 
>> system
>> +     * RAM stays within 25% of available RAM. On small-VRAM platforms
>> +     * the 2x target fits within the cap and behavior is
>> +     * unchanged; on large-VRAM platforms (e.g. PVC) this prevents OOM.
>> +     */
>> +
>> +    target_vram = min(p->vram_size * 2, p->vram_size + p->sram_size 
>> / 4);
>> +    target_sram = min_t(uint64_t, p->sram_size * 50 / 100,
>> +                MAX_SRAM_TEST_SIZE);
>> +    total_vram_bufs = target_vram / GB(1);
>> +    total_sram_bufs = target_sram / GB(1);
>> +    max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC,
>> +             total_sram_bufs / MIN_BUFS_PER_PROC);
>> +
>> +    p->n_proc = min_t(int, max_by_mem, MAX_PROCS);
>> +    if (p->n_proc <= 0)
>
> On low ram machines it might execute single-process but above in 
> description mentioned 2 process, so
>
> condition p->n_proc < 2 should be checked.
> Agreed: This will be taken care.
>> +        return false;
>> +    p->n_vram_bufs = max_t(int, 2, total_vram_bufs / p->n_proc);
>> +    p->n_sram_bufs = max_t(int, 2, total_sram_bufs / p->n_proc);
>> +    p->total_vram_demand = (uint64_t)p->n_proc * p->n_vram_bufs * 
>> GB(1);
>> +    return true;
>> +}
>> +
>> +static void test_vm_oversubscribe_concurrent_bind(int fd)
>> +{
>> +    struct oversubscribe_params p;
>> +    struct process_data *pdata;
>> +
>> +    igt_require_f(calc_oversubscribe_params(fd, &p),
>> +              "Not enough VRAM/RAM for oversubscription test\n");
>> +
>> +    igt_debug("VRAM size: %" PRIu64 "MB, System RAM available: %" 
>> PRIu64 "MB\n",
>> +          p.vram_size >> 20, p.sram_size >> 20);
>> +
>> +    igt_debug("n_proc = %d\n", p.n_proc);
>> +    igt_debug("VRAM: %" PRIu64 "GB\n", p.vram_size >> 30);
>> +    igt_debug("VRAM demand: %" PRIu64 "MB (%.2fx oversubscription)\n",
>> +          p.total_vram_demand >> 20, (double)p.total_vram_demand / 
>> p.vram_size);
>> +    igt_debug("Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n", p.n_proc,
>> +          p.n_vram_bufs, p.n_sram_bufs);
>> +
>> +    pdata = mmap(NULL, sizeof(*pdata), PROT_READ | PROT_WRITE,
>> +             MAP_SHARED | MAP_ANONYMOUS, -1, 0);
>> +    igt_assert(pdata != MAP_FAILED);
>> +    init_pdata(pdata);
>> +
>> +    igt_fork(child, p.n_proc) {
>> +        struct xe_oversubscribe_ctx ctx = {0};
>> +        int rc, ret, fd_c;
>> +        uint64_t addr = STRESS_BIND_ADDR;
>> +        uint32_t expected_result = 0;
>> +        struct gem_bo integers_bo = {0}, result_bo = {0}, batch_bo = 
>> {0};
>> +        struct gem_bo *vram_bufs, *sram_bufs;
>> +        int pos = 0;
>> +        struct mem_bind_sync vram_bind = {0};
>> +        struct mem_bind_sync sram_bind = {0};
>> +        struct drm_xe_sync batch_syncs[1];
>> +        struct drm_xe_exec exec;
>> +        struct gem_bo ufence_bo = {0};
>> +        int vram_bind_err = 0, sram_bind_err = 0;
>> +
>> +        vram_bufs = calloc(p.n_vram_bufs, sizeof(*vram_bufs));
>> +        sram_bufs = calloc(p.n_sram_bufs, sizeof(*sram_bufs));
>> +        srand(child);
>> +
>> +        fd_c = drm_open_driver(DRIVER_XE);
>> +
>> +        igt_assert(vram_bufs && sram_bufs);
>> +
>> +        ctx.vm_id = xe_vm_create(fd_c, 
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0);
>> +        create_exec_queue(fd_c, &ctx);
>> +        vram_bind.bufs = vram_bufs;
>> +        vram_bind.n_bufs = p.n_vram_bufs;
>> +        sram_bind.bufs = sram_bufs;
>> +        sram_bind.n_bufs = p.n_sram_bufs;
>> +
>> +        ret = create_test_bos(fd_c, &ctx, &vram_bind, 
>> vram_memory(fd_c, 0), &addr);
>> +        if (ret) {
>> +            process_setup_failed(pdata);
>> +            goto cleanup;
>> +        }
>> +
>> +        ret = create_test_bos(fd_c, &ctx, &sram_bind, 
>> system_memory(fd_c), &addr);
>> +        if (ret) {
>> +            process_setup_failed(pdata);
>> +            goto cleanup;
>> +        }
>> +
>> +        if (!vram_bind.n_bufs || !sram_bind.n_bufs) {
>> +            igt_debug("No BOs allocated; VRAM/SRAM unavailable, 
>> skipping\n");
>> +            process_setup_failed(pdata);
>> +            goto cleanup;
>> +        }
>
> When a child hit an allocation failure it called 
> process_setup_failed(), jumped to cleanup, and exited normally (status 
> 0).
>
> The parent only waited for children to exit — it never checked whether 
> any test executed. So a run where every child failed
>
> still it'll be reported as PASS. Instead a counter e.g. failed_count 
> should be incremented in process_setup_failed() and after cleanup:
>
> failed_count value must be checked so that user knows during setup/bo 
> creation fault happened
>
> something like: igt_assert_f(pdata->fault_count == 0,
>              "%d child(ren) hit unexpected setup errors\n", 
> pdata->fault_count);

*Sobin: *=> We are creating multiple process and will be doing bind at 
rendezvous  .

Some process can fail due to lack of SRAM / VRAM that will be skipped 
unless we get a

real fault for those conditions assertion is handled .

We can track the process based on OOM as some child process can fail 
with OOM

>> +
>> +        /*
>> +         * All allocations are complete. Report Ready and wait until 
>> every
>> +         * child has either reached this point or repported a setup 
>> failure.
>> +         */
>> +
>> +         process_ready_and_wait(pdata);
>> +
>> +        /*
>> +         * VM_Bind starts only after the parent releases all ready
>> +         * childen.
>> +         */
>> +
>> +        if (bind_bos(fd_c, &ctx, vram_bufs, &vram_bind, 
>> &vram_bind_err, true))
>> +            goto cleanup;
>> +
>> +        if (bind_bos(fd_c, &ctx, sram_bufs, &sram_bind, 
>> &sram_bind_err, false))
>> +            goto cleanup;
>> +
>> +        create_bo(fd_c, ctx.vm_id, &integers_bo, 4096, 
>> EXEC_DATA_ADDR, true);
>> +        expected_result = fill_random_integers(&integers_bo, 
>> INT_ADD_CNT);
>> +        igt_debug("%d\n", expected_result);
>> +        create_bo(fd_c, ctx.vm_id, &result_bo, 4096, 
>> EXEC_RESULT_ADDR, false);
>> +        create_bo(fd_c, ctx.vm_id, &batch_bo, 4096, EXEC_BATCH_ADDR, 
>> true);
>> +        pos = build_add_batch(&batch_bo, &integers_bo, &result_bo, 
>> INT_ADD_CNT);
>> +
>> +        igt_assert(pos * sizeof(int) <= batch_bo.size);
>> +
>> +        xe_vm_bind_lr_sync(fd_c, ctx.vm_id, integers_bo.handle, 0, 
>> integers_bo.addr,
>> +                   integers_bo.size, 0);
>> +        xe_vm_bind_lr_sync(fd_c, ctx.vm_id, result_bo.handle, 0, 
>> result_bo.addr,
>> +                   result_bo.size, 0);
>> +        xe_vm_bind_lr_sync(fd_c, ctx.vm_id, batch_bo.handle, 0, 
>> batch_bo.addr,
>> +                   batch_bo.size, 0);
>> +        create_bo(fd_c, ctx.vm_id, &ufence_bo, 4096, 
>> EXEC_UFENCE_ADDR, true);
>> +
>> +        memset(ufence_bo.ptr, 0, ufence_bo.size);
>> +        xe_vm_bind_lr_sync(fd_c, ctx.vm_id, ufence_bo.handle, 0, 
>> ufence_bo.addr,
>> +                   ufence_bo.size, 0);
>> +
>> +        batch_syncs[0] = (struct drm_xe_sync){
>> +            .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +            .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +            .addr = ufence_bo.addr,
>> +            .timeline_value = USER_FENCE_VALUE,
>> +        };
>> +
>> +        exec = (struct drm_xe_exec) {
>> +            .exec_queue_id = ctx.exec_queue_id,
>> +            .num_syncs = 1,
>> +            .syncs = (uintptr_t)batch_syncs,
>> +            .address = batch_bo.addr,
>> +            .num_batch_buffer = 1,
>> +        };
>> +
>> +        rc = igt_ioctl(fd_c, DRM_IOCTL_XE_EXEC, &exec);
>> +        igt_assert_f(rc == 0, "xe_exec failed unexpectedly: %s (%d)\n",
>> +                 strerror(errno), errno);
>> +        xe_wait_ufence(fd_c, (uint64_t *)ufence_bo.ptr, 
>> USER_FENCE_VALUE, ctx.exec_queue_id,
>> +                   TIMEOUT_NS);
>> +        result_bo.ptr = xe_bo_map(fd_c, result_bo.handle, 
>> result_bo.size);
>> +        igt_assert(result_bo.ptr != MAP_FAILED);
>> +        igt_assert_eq(result_bo.ptr[0], expected_result);
> Here child should report completion also, something like 
> child_completion(pdata) { pdata->child_completed++;}

  Agreed/


>> +cleanup:
>> +        cleanup_bo_resources(fd_c, &ufence_bo);
>> +        cleanup_bo_resources(fd_c, &result_bo);
>> +        cleanup_bo_resources(fd_c, &batch_bo);
>> +        cleanup_bo_resources(fd_c, &integers_bo);
>> +        cleanup_sram_vram_objs(fd_c, &vram_bind, &sram_bind);
>> +        xe_exec_queue_destroy(fd_c, ctx.exec_queue_id);
>> +        xe_vm_destroy(fd_c, ctx.vm_id);
>> +        drm_close_driver(fd_c);
>> +    }
>> +
>> +    release_ready_processes(pdata, p.n_proc);
>> +    igt_waitchildren();
>
> If a child is killed or blocked before reporting, the parent timed out 
> after 30 s,
>
> it releases the rest and calls igt_waitchildren() which could wait 
> forever/hung. Here all forked children
>
> should be killed first.

Agreed . The child process will be killed after 60 seconds of hang in 
child process.

We will be using  igt_waitchildren_timeout

>
> Both counters updated above will be checked in assertion to know the 
> real cause of error
>
> igt_assert_f(pdata->fault_count == 0,
>              "%d child(ren) hit unexpected setup errors\n", 
> pdata->fault_count);

  => fault count will take count of the number of child process that got 
failed with reason other than OOM.

As discussed offline we can summarize the count in the summary at the end


for e.g.:->


Starting subtest: test_vm_oversubscribe_concurrent_bind
Oversubscribe summary : 7 processes
Setup Faulted (unexpected error): 0
Setup skipped (OOM cases) 0
Bind failed (ENOMEM/ENOSPC) 0


> igt_assert_f(pdata->child_completed >= 2,
>              "Need >=2 processes to complete the oversubscribed 
> submit, got %d\n",
>              pdata->child_completed);
>
>> +    igt_reset_timeout();
>> +
>> +    pthread_cond_destroy(&pdata->cond);
>> +    pthread_mutex_destroy(&pdata->mutex);
>> +    igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0);
>> +}
>> +
>>   static void alloc_sizes_init(void)
>>   {
>>       int i;
>> @@ -986,6 +1512,7 @@ static const struct test_case test_matrix[] = {
>>       { "threads-leak-binding-rand-sizes-50", 50, LEAK_BINDING, 
>> TYPE_THREAD, false },
>>       { "threads-leak-binding-rand-sizes-50-unaligned", 50, 
>> LEAK_BINDING | UNALIGNED,
>>         TYPE_THREAD, false },
>> +    { "test_vm_oversubscribe_concurrent_bind", 0, 0, 
>> TYPE_OVERSUBSCRIBE, false},
>>   };
>>     int igt_main()
>> @@ -1011,6 +1538,10 @@ int igt_main()
>>                   run_threaded_bo_alloc_test(fd, t->count, t->flags);
>>               }
>>               break;
>> +        case TYPE_OVERSUBSCRIBE:
>> +            igt_subtest_f("%s", t->name)
>> +                test_vm_oversubscribe_concurrent_bind(fd);
>> +            break;
>>           case TYPE_ALL_SIZES:
>>           case TYPE_RANDOM_SIZE:
>>           case TYPE_ARRAY_BIND:
--------------MaLl2yFMEnZgn2vrasvGD0XS
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Hi Nishit,&nbsp;</p>
    <p><br>
    </p>
    <p>Thanks for review&nbsp; , Most of the changes will be taken care,
      please find inline response.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:f3794783-c9a3-4641-b979-530b6599bb8c@intel.com">
      <blockquote type="cite">Add test for oversubscribing VRAM in multi
        process environment that <br>
        creates VM, bind large BOs and submit workloads nearly
        simultaneously. <br>
        <br>
        Previous coverage lacked a scenario combining multi-process bind
        <br>
        with VRAM oversubscription. This generates memory pressure with
        <br>
        multi-process VM Bind activity and concurrent submission,
        exercising <br>
        the bind pipeline under eviction pressure. <br>
        <br>
        v3: Fixed minor nits <br>
        v4: Refactoring of the create_bo ( Nishit) <br>
        &nbsp;&nbsp;&nbsp;&nbsp; Fix child process exit deadlock in
        release_ready_processes() (Nishit) <br>
        <br>
        Signed-off-by: Sobin Thomas <a class="moz-txt-link-rfc2396E" href="mailto:sobin.thomas@intel.com">&lt;sobin.thomas@intel.com&gt;</a>
        <br>
        --- <br>
        &nbsp; tests/intel/xe_bo_alloc.c | 533
        +++++++++++++++++++++++++++++++++++++- <br>
        &nbsp; 1 file changed, 532 insertions(+), 1 deletion(-) <br>
        <br>
        diff --git a/tests/intel/xe_bo_alloc.c
        b/tests/intel/xe_bo_alloc.c <br>
        index d8368087b..2ee468c62 100644 <br>
        --- a/tests/intel/xe_bo_alloc.c <br>
        +++ b/tests/intel/xe_bo_alloc.c <br>
        @@ -29,6 +29,17 @@ <br>
        &nbsp; #define THREAD_VA_STRIDE GB(1) <br>
        &nbsp; #define SZ_4K_SHIFT&nbsp;&nbsp;&nbsp; 12 <br>
        &nbsp; #define MAX_ALLOCATIONS 50000 <br>
        +#define INT_ADD_CNT 4 <br>
        +#define TIMEOUT_NS (30ULL * 1000000000ULL) <br>
        +#define MAX_SRAM_TEST_SIZE GB(32) <br>
        +#define GPR_RX_ADDR(x)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0x600 + (x) * 8) <br>
        +#define MAX_PROCS 20 <br>
        + <br>
        +#define EXEC_DATA_ADDR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x100000ULL <br>
        +#define EXEC_RESULT_ADDR&nbsp;&nbsp;&nbsp; 0x200000ULL <br>
        +#define EXEC_BATCH_ADDR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x300000ULL <br>
        +#define EXEC_UFENCE_ADDR&nbsp;&nbsp;&nbsp; 0x400000ULL <br>
        +#define STRESS_BIND_ADDR&nbsp;&nbsp;&nbsp; 0x40000000ULL <br>
        &nbsp; &nbsp; /** <br>
        &nbsp;&nbsp; * SUBTEST: all-sizes-once <br>
        @@ -76,14 +87,48 @@ <br>
        &nbsp;&nbsp; * Description: Test 50 random BO allocation sizes in test
        table with a thread per engine, <br>
        &nbsp;&nbsp; * leak the binding, unaligned bind addresses <br>
        &nbsp;&nbsp; * Test category: stress test <br>
        + * <br>
        + * SUBTEST: test_vm_oversubscribe_concurrent_bind <br>
        + * Description: Test enough random BO allocation sizes, bound
        as arrays of binds, to trigger <br>
        + * evictions with 2 processes per engine, leak the BO munmap /
        gem close, unaligned bind addresses <br>
        + * Test category: stress test <br>
        &nbsp;&nbsp; */ <br>
        &nbsp; &nbsp; #define GB(x) (1024ULL * 1024ULL * 1024ULL * (x)) <br>
        &nbsp; #define MIN_BUFS_PER_PROC 2 <br>
        &nbsp; &nbsp; #define N_ALLOC_SIZES&nbsp;&nbsp;&nbsp; 256 <br>
        +#define USER_FENCE_VALUE 0xdeadbeefdeadbeefull <br>
        + <br>
        &nbsp; static uint64_t *alloc_sizes; <br>
        &nbsp; +struct gem_bo { <br>
        +&nbsp;&nbsp;&nbsp; uint32_t handle; <br>
        +&nbsp;&nbsp;&nbsp; uint64_t size; <br>
        +&nbsp;&nbsp;&nbsp; uint32_t *ptr; <br>
        +&nbsp;&nbsp;&nbsp; uint64_t addr; <br>
        +}; <br>
        + <br>
        +struct xe_oversubscribe_ctx { <br>
        +&nbsp;&nbsp;&nbsp; uint32_t vm_id; <br>
        +&nbsp;&nbsp;&nbsp; uint32_t exec_queue_id; <br>
        +}; <br>
        + <br>
        +struct mem_bind_sync { <br>
        +&nbsp;&nbsp;&nbsp; struct gem_bo *bufs; <br>
        +&nbsp;&nbsp;&nbsp; int n_bufs; <br>
        +&nbsp;&nbsp;&nbsp; uint64_t *binds_ufence; <br>
        +}; <br>
        + <br>
        +struct process_data { <br>
        +&nbsp;&nbsp;&nbsp; pthread_mutex_t mutex; <br>
        +&nbsp;&nbsp;&nbsp; pthread_cond_t cond; <br>
        +&nbsp;&nbsp;&nbsp; int ready; <br>
        +&nbsp;&nbsp;&nbsp; int failed; <br>
        +&nbsp;&nbsp;&nbsp; pthread_barrier_t barrier; <br>
      </blockquote>
      barrier not initialized but used. I think it's not required <br>
    </blockquote>
    <p><br>
    </p>
    <p>Agreed. This was missed, was part of&nbsp; earlier patches in thread
      part. missed</p>
    <blockquote type="cite" cite="mid:f3794783-c9a3-4641-b979-530b6599bb8c@intel.com">
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; bool go; <br>
        +}; <br>
        + <br>
        &nbsp; /* <br>
        &nbsp;&nbsp; * Data-driven subtest matrix. <br>
        &nbsp;&nbsp; * <br>
        @@ -103,7 +148,8 @@ enum test_type { <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TYPE_ALL_SIZES, <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TYPE_RANDOM_SIZE, <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TYPE_ARRAY_BIND, <br>
        -&nbsp;&nbsp;&nbsp; TYPE_THREAD <br>
        +&nbsp;&nbsp;&nbsp; TYPE_THREAD, <br>
        +&nbsp;&nbsp;&nbsp; TYPE_OVERSUBSCRIBE, <br>
        &nbsp; }; <br>
        &nbsp; &nbsp; struct test_case { <br>
        @@ -114,6 +160,14 @@ struct test_case { <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bool requires_evict_ram; <br>
        &nbsp; }; <br>
        &nbsp; +struct oversubscribe_params { <br>
        +&nbsp;&nbsp;&nbsp; int n_proc; <br>
        +&nbsp;&nbsp;&nbsp; int n_vram_bufs; <br>
        +&nbsp;&nbsp;&nbsp; int n_sram_bufs; <br>
        +&nbsp;&nbsp;&nbsp; uint64_t vram_size; <br>
        +&nbsp;&nbsp;&nbsp; uint64_t sram_size; <br>
        +&nbsp;&nbsp;&nbsp; uint64_t total_vram_demand; <br>
        +}; <br>
        &nbsp; #define LEAK_BINDING&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0x1 &lt;&lt; 0) <br>
        &nbsp; #define LEAK_BO&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0x1 &lt;&lt; 1) <br>
        &nbsp; #define EVICT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (0x1 &lt;&lt; 2) <br>
        @@ -244,6 +298,478 @@ static int __xe_vm_bind_array(int fd,
        uint32_t vm, <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0; <br>
        &nbsp; } <br>
        &nbsp; +static void init_pdata(struct process_data *pdata) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; pthread_mutexattr_t mattr; <br>
        +&nbsp;&nbsp;&nbsp; pthread_condattr_t cattr; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; pthread_mutexattr_init(&amp;mattr); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(pthread_mutexattr_setpshared(&amp;mattr,
        PTHREAD_PROCESS_SHARED), 0); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(pthread_mutexattr_setrobust(&amp;mattr,
        PTHREAD_MUTEX_ROBUST), 0); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(pthread_mutex_init(&amp;pdata-&gt;mutex,
        &amp;mattr), 0); <br>
        +&nbsp;&nbsp;&nbsp; pthread_mutexattr_destroy(&amp;mattr); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; pthread_condattr_init(&amp;cattr); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(pthread_condattr_setpshared(&amp;cattr,
        PTHREAD_PROCESS_SHARED), 0); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(pthread_cond_init(&amp;pdata-&gt;cond,
        &amp;cattr), 0); <br>
        +&nbsp;&nbsp;&nbsp; pthread_condattr_destroy(&amp;cattr); <br>
        +&nbsp;&nbsp;&nbsp; pdata-&gt;ready = 0; <br>
        +&nbsp;&nbsp;&nbsp; pdata-&gt;failed = 0; <br>
        +&nbsp;&nbsp;&nbsp; pdata-&gt;go = false; <br>
        +} <br>
        + <br>
        +static void process_ready_and_wait(struct process_data *pdata)
        <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; int ret = pthread_mutex_lock(&amp;pdata-&gt;mutex); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; if (ret == EOWNERDEAD) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        igt_assert_eq(pthread_mutex_consistent(&amp;pdata-&gt;mutex),
        0); <br>
        +&nbsp;&nbsp;&nbsp; else <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0); <br>
        +&nbsp;&nbsp;&nbsp; pdata-&gt;ready++; <br>
        +&nbsp;&nbsp;&nbsp; pthread_cond_broadcast(&amp;pdata-&gt;cond); <br>
        +&nbsp;&nbsp;&nbsp; while (!pdata-&gt;go) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pthread_cond_wait(&amp;pdata-&gt;cond,
        &amp;pdata-&gt;mutex); <br>
        +&nbsp;&nbsp;&nbsp; pthread_mutex_unlock(&amp;pdata-&gt;mutex); <br>
        +} <br>
        + <br>
        +static void process_setup_failed(struct process_data *pdata) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; int ret = pthread_mutex_lock(&amp;pdata-&gt;mutex); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; if (ret == EOWNERDEAD) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        igt_assert_eq(pthread_mutex_consistent(&amp;pdata-&gt;mutex),
        0); <br>
        +&nbsp;&nbsp;&nbsp; else <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0); <br>
        +&nbsp;&nbsp;&nbsp; pdata-&gt;failed++; <br>
        +&nbsp;&nbsp;&nbsp; pthread_cond_broadcast(&amp;pdata-&gt;cond); <br>
        +&nbsp;&nbsp;&nbsp; pthread_mutex_unlock(&amp;pdata-&gt;mutex); <br>
        +} <br>
        + <br>
        +static void release_ready_processes(struct process_data *pdata,
        int n_proc) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; struct timespec timeout; <br>
        +&nbsp;&nbsp;&nbsp; int ret; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; ret = pthread_mutex_lock(&amp;pdata-&gt;mutex); <br>
        +&nbsp;&nbsp;&nbsp; if (ret == EOWNERDEAD) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        igt_assert_eq(pthread_mutex_consistent(&amp;pdata-&gt;mutex),
        0); <br>
        +&nbsp;&nbsp;&nbsp; else <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; clock_gettime(CLOCK_REALTIME, &amp;timeout); <br>
        +&nbsp;&nbsp;&nbsp; timeout.tv_sec += 30; <br>
        +&nbsp;&nbsp;&nbsp; /* <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * Wait until all children have either reached VM Bind
        rendevouz <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * Or, failed setup and exited the test path. <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
        +&nbsp;&nbsp;&nbsp; while (pdata-&gt;ready + pdata-&gt;failed &lt; n_proc) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = pthread_cond_timedwait(&amp;pdata-&gt;cond,
        &amp;pdata-&gt;mutex, &amp;timeout); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret == EOWNERDEAD) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        igt_assert_eq(pthread_mutex_consistent(&amp;pdata-&gt;mutex),
        0); <br>
      </blockquote>
      <br>
      If pthread_cond_timedwait() returned EOWNERDEAD (a lock holder
      died) code made the mutex consistent <br>
      <br>
      but it is checking igt_assert_eq(ret, 0)&nbsp;which will fail as ret is
      still EOWNERDEAD, so in case of EOWNERDEAD it should continue to
      check <br>
      <br>
      ret&nbsp; &nbsp; if (ret == EOWNERDEAD) { <br>
      <br>
      igt_assert_eq(pthread_mutex_consistent(&amp;pdata-&gt;mutex), 0);
      <br>
      <br>
      continue;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* re-check loop condition */ <br>
    </blockquote>
    <b>&nbsp;Sobin: Agreed . Will be taken care in next revision</b>
    <blockquote type="cite" cite="mid:f3794783-c9a3-4641-b979-530b6599bb8c@intel.com"><br>
      } <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else if (ret == ETIMEDOUT) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_warn(&quot;Timeout waiting for the child process:
        ready=%d, failed =%d, expected=%d&quot;, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pdata-&gt;ready, pdata-&gt;failed, n_proc); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(ret, 0); <br>
        +&nbsp;&nbsp;&nbsp; } <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; igt_debug(&quot;Process rendezvous: ready=%d failed=%d total =
        %d\n&quot;, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pdata-&gt;ready, pdata-&gt;failed, n_proc); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; /* Release every successful child into VM_Bind at same
        time*/ <br>
        +&nbsp;&nbsp;&nbsp; pdata-&gt;go = true; <br>
        +&nbsp;&nbsp;&nbsp; pthread_cond_broadcast(&amp;pdata-&gt;cond); <br>
        +&nbsp;&nbsp;&nbsp; pthread_mutex_unlock(&amp;pdata-&gt;mutex); <br>
        +} <br>
        + <br>
        +static int build_add_batch(struct gem_bo *batch_bo, struct
        gem_bo *integers_bo, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct gem_bo *result_bo, int ints_to_add) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; int pos = 0; <br>
        +&nbsp;&nbsp;&nbsp; int i; <br>
        +&nbsp;&nbsp;&nbsp; uint64_t tmp_addr; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD |
        MI_LRI_LRM_CS_MMIO | 2; <br>
        +&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = GPR_RX_ADDR(0); <br>
        +&nbsp;&nbsp;&nbsp; tmp_addr = integers_bo-&gt;addr + 0 * sizeof(uint32_t); <br>
        +&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = tmp_addr &amp; 0xFFFFFFFF; <br>
        +&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = (tmp_addr &gt;&gt; 32) &amp;
        0xFFFFFFFF; <br>
        +&nbsp;&nbsp;&nbsp; for (i = 1; i &lt; ints_to_add; i++) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* r1 = integers_bo[i] */ <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = MI_LOAD_REGISTER_MEM_CMD |
        MI_LRI_LRM_CS_MMIO | 2; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = GPR_RX_ADDR(1); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; tmp_addr = integers_bo-&gt;addr + i * sizeof(uint32_t);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = tmp_addr &amp; 0xFFFFFFFF; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = (tmp_addr &gt;&gt; 32) &amp;
        0xFFFFFFFF; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* r0 = r0 + r1 */ <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = MI_MATH(4); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] =
        MI_MATH_LOAD(MI_MATH_REG_SRCA, MI_MATH_REG(0)); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] =
        MI_MATH_LOAD(MI_MATH_REG_SRCB, MI_MATH_REG(1)); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = MI_MATH_ADD; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = MI_MATH_STORE(MI_MATH_REG(0),
        MI_MATH_REG_ACCU); <br>
        +&nbsp;&nbsp;&nbsp; } <br>
        +&nbsp;&nbsp;&nbsp; /* result_bo[0] = r0 */ <br>
        +&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = MI_STORE_REGISTER_MEM_GEN8 |
        MI_LRI_LRM_CS_MMIO; <br>
        +&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = GPR_RX_ADDR(0); <br>
        +&nbsp;&nbsp;&nbsp; tmp_addr = result_bo-&gt;addr + 0 * sizeof(uint32_t); <br>
        +&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = tmp_addr &amp; 0xFFFFFFFF; <br>
        +&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = (tmp_addr &gt;&gt; 32) &amp;
        0xFFFFFFFF; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = MI_BATCH_BUFFER_END; <br>
        +&nbsp;&nbsp;&nbsp; while (pos % 4 != 0) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo-&gt;ptr[pos++] = MI_NOOP; <br>
        +&nbsp;&nbsp;&nbsp; return pos; <br>
        +} <br>
        + <br>
        +static void create_exec_queue(int fd, struct
        xe_oversubscribe_ctx *ctx) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; ctx-&gt;exec_queue_id = xe_exec_queue_create(fd,
        ctx-&gt;vm_id, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;xe_engine(fd, 0)-&gt;instance,
        0); <br>
        +} <br>
        + <br>
        +static uint64_t * <br>
        +vm_bind_bo_batch(int fd, struct xe_oversubscribe_ctx *ctx,
        struct gem_bo *bos, int size, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int *out_err) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; uint64_t *ufence; <br>
        +&nbsp;&nbsp;&nbsp; struct drm_xe_sync bind_sync; <br>
        +&nbsp;&nbsp;&nbsp; struct drm_xe_vm_bind_op *binds; <br>
        +&nbsp;&nbsp;&nbsp; int i; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; binds = calloc(size, sizeof(*binds)); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert(binds); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; ufence = calloc(1, sizeof(*ufence)); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert(ufence); <br>
        +&nbsp;&nbsp;&nbsp; bind_sync = (struct drm_xe_sync) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type = DRM_XE_SYNC_TYPE_USER_FENCE, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flags = DRM_XE_SYNC_FLAG_SIGNAL, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .addr = to_user_pointer(ufence), <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .timeline_value = 1, <br>
        +&nbsp;&nbsp;&nbsp; }; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; for (i = 0; i &lt; size; i++) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; binds[i] = (struct drm_xe_vm_bind_op) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .obj = bos[i].handle, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .obj_offset = 0, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .range = bos[i].size, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .addr = bos[i].addr, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .op = DRM_XE_VM_BIND_OP_MAP, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flags = 0, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }; <br>
        +&nbsp;&nbsp;&nbsp; } <br>
        +&nbsp;&nbsp;&nbsp; *out_err = __xe_vm_bind_array(fd, ctx-&gt;vm_id, binds,
        size, &amp;bind_sync, 1); <br>
        +&nbsp;&nbsp;&nbsp; free(binds); <br>
        +&nbsp;&nbsp;&nbsp; return ufence; <br>
        +} <br>
        + <br>
        +/* Returns 1 (caller should skip exec) on an allowed OOM error,
        0 otherwise. */ <br>
        +static int bind_bos(int fd, struct xe_oversubscribe_ctx *ctx,
        struct gem_bo *bufs, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mem_bind_sync *bind, int *bind_err, bool
        allow_oom) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; if (!bind-&gt;n_bufs) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; bind-&gt;binds_ufence = vm_bind_bo_batch(fd, ctx, bufs,
        bind-&gt;n_bufs, bind_err); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; if (*bind_err) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (allow_oom) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(*bind_err == -ENOMEM || *bind_err ==
        -ENOSPC, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Unexpected bind error: %d (%s)\n&quot;, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *bind_err, strerror(-*bind_err)); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;Bind failed with expected OOM (%s),
        skipping exec\n&quot;, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strerror(-*bind_err)); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 1; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(false, &quot;Unexpected bind error: %d&quot;,
        *bind_err); <br>
        +&nbsp;&nbsp;&nbsp; } <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; xe_wait_ufence(fd, bind-&gt;binds_ufence, 1, 0,
        TIMEOUT_NS); <br>
        +&nbsp;&nbsp;&nbsp; return 0; <br>
        +} <br>
        + <br>
        +static int fill_random_integers(struct gem_bo *int_bo, int
        ints_to_add) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; uint32_t expected_result = 0; <br>
        +&nbsp;&nbsp;&nbsp; char expr[256]; <br>
        +&nbsp;&nbsp;&nbsp; int len = 0; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; ints_to_add; i++) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t random_int = rand() % 8; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int_bo-&gt;ptr[i] = random_int; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expected_result += random_int; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; len += snprintf(expr + len, sizeof(expr) - len, &quot;%s%u&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i ? &quot; + &quot; : &quot;&quot;, random_int); <br>
        +&nbsp;&nbsp;&nbsp; } <br>
        +&nbsp;&nbsp;&nbsp; igt_debug(&quot;%s = %u\n&quot;, expr, expected_result); <br>
        +&nbsp;&nbsp;&nbsp; return expected_result; <br>
        +} <br>
        + <br>
        +static void cleanup_bo_resources(int fd, struct gem_bo *bo) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; if (bo-&gt;ptr) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(munmap(bo-&gt;ptr, bo-&gt;size), 0); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;ptr = NULL; <br>
        +&nbsp;&nbsp;&nbsp; } <br>
        +&nbsp;&nbsp;&nbsp; if (bo-&gt;handle) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gem_close(fd, bo-&gt;handle); <br>
        +} <br>
        + <br>
        +static int create_test_bos(int fd, struct xe_oversubscribe_ctx
        *ctx, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mem_bind_sync *bind, uint32_t placement,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t *addr) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; const char *mem_type = (placement &amp; vram_memory(fd, 0))
        ? &quot;VRAM&quot; : &quot;SRAM&quot;; <br>
        +&nbsp;&nbsp;&nbsp; int ret; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; bind-&gt;n_bufs; i++) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct gem_bo *bo = &amp;bind-&gt;bufs[i]; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;size = GB(1); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = __xe_bo_create_caching(fd, ctx-&gt;vm_id,
        bo-&gt;size, placement, 0, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_XE_GEM_CPU_CACHING_WC,
        &amp;bo-&gt;handle); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int saved_errno = errno; /* capture before anything
        can clobber it */ <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bind-&gt;n_bufs = i; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (saved_errno == ENOMEM || saved_errno == ENOSPC)
        { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Continue on OOM, expected when
        oversubscribing the VM */ <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;%s allocation failed at buffer %d
        (OOM)\n&quot;, mem_type, i); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* We are returning as this is a fail scenario */ <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_warn(&quot;%s allocation failed at buffer %d: %s\n&quot;,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mem_type, i, strerror(saved_errno)); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -saved_errno; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;ptr = NULL; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;addr = *addr; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *addr += bo-&gt;size; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;%s buffer %d created at 0x%016lx\n&quot;,
        mem_type, i, bo-&gt;addr); <br>
        +&nbsp;&nbsp;&nbsp; } <br>
        +&nbsp;&nbsp;&nbsp; return 0; <br>
        +} <br>
        + <br>
        +static void cleanup_sram_vram_objs(int fd, struct mem_bind_sync
        *vram_bind, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mem_bind_sync *sram_bind) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; vram_bind-&gt;n_bufs; i++) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gem_close(fd, vram_bind-&gt;bufs[i].handle); <br>
        +&nbsp;&nbsp;&nbsp; for (int i = 0; i &lt; sram_bind-&gt;n_bufs; i++) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gem_close(fd, sram_bind-&gt;bufs[i].handle); <br>
        +&nbsp;&nbsp;&nbsp; free(vram_bind-&gt;bufs); <br>
        +&nbsp;&nbsp;&nbsp; free(sram_bind-&gt;bufs); <br>
        +&nbsp;&nbsp;&nbsp; if (vram_bind-&gt;binds_ufence) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(vram_bind-&gt;binds_ufence); <br>
        +&nbsp;&nbsp;&nbsp; if (sram_bind-&gt;binds_ufence) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; free(sram_bind-&gt;binds_ufence); <br>
        +} <br>
        + <br>
        +static void create_bo(int fd, uint32_t vm, struct gem_bo *bo,
        uint64_t size, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t addr, bool map_now) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; bo-&gt;size = ALIGN(size, 4096); <br>
        +&nbsp;&nbsp;&nbsp; bo-&gt;handle = xe_bo_create_caching(fd, vm, bo-&gt;size,
        system_memory(fd), 0, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DRM_XE_GEM_CPU_CACHING_WC); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert(bo-&gt;handle); <br>
        +&nbsp;&nbsp;&nbsp; bo-&gt;addr = addr; <br>
        +&nbsp;&nbsp;&nbsp; if (map_now) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;ptr = xe_bo_map(fd, bo-&gt;handle, bo-&gt;size);
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(bo-&gt;ptr != MAP_FAILED); <br>
        +&nbsp;&nbsp;&nbsp; } else { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; bo-&gt;ptr = NULL; <br>
        +&nbsp;&nbsp;&nbsp; } <br>
        +} <br>
        + <br>
        +static bool calc_oversubscribe_params(int fd, struct
        oversubscribe_params *p) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; uint64_t target_vram, target_sram; <br>
        +&nbsp;&nbsp;&nbsp; uint64_t total_vram_bufs, total_sram_bufs, max_by_mem; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; p-&gt;vram_size =&nbsp; xe_visible_available_vram_size(fd, 0); <br>
      </blockquote>
      <br>
      Sizing used xe_visible_available_vram_size() gives
      vram.cpu_visible_available; which can be small <br>
      <br>
      to accomodate big BOs or 2x demand, it should be
      xe_available_vram_size which gives vram.total_available; <br>
      <br>
    </blockquote>
    <b>Sobin:&nbsp;&nbsp;</b><b>We should take visible ram as&nbsp; available vram can
      provide false&nbsp; assumptions while allocating;&nbsp;<br>
    </b>
    <p><b> This will help in early bail out if sufficient VRAM memory is
        not there.&nbsp;&nbsp;</b></p>
    <p><b>If whole vram is given there will be more number of eviction
        and can cause more</b></p>
    <p><b>probability of OOM.</b></p>
    <br>
    <blockquote type="cite" cite="mid:f3794783-c9a3-4641-b979-530b6599bb8c@intel.com">
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; p-&gt;sram_size =
        (uint64_t)igt_get_avail_ram_mb() &lt;&lt; 20; <br>
        +&nbsp;&nbsp;&nbsp; /* <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * Dynamically cap VRAM oversubscription so the overflow
        into system <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * RAM stays within 25% of available RAM. On small-VRAM
        platforms <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * the 2x target fits within the cap and behavior is <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; * unchanged; on large-VRAM platforms (e.g. PVC) this
        prevents OOM. <br>
        +&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; target_vram = min(p-&gt;vram_size * 2, p-&gt;vram_size +
        p-&gt;sram_size / 4); <br>
        +&nbsp;&nbsp;&nbsp; target_sram = min_t(uint64_t, p-&gt;sram_size * 50 / 100, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAX_SRAM_TEST_SIZE); <br>
        +&nbsp;&nbsp;&nbsp; total_vram_bufs = target_vram / GB(1); <br>
        +&nbsp;&nbsp;&nbsp; total_sram_bufs = target_sram / GB(1); <br>
        +&nbsp;&nbsp;&nbsp; max_by_mem = min(total_vram_bufs / MIN_BUFS_PER_PROC, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total_sram_bufs / MIN_BUFS_PER_PROC); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; p-&gt;n_proc = min_t(int, max_by_mem, MAX_PROCS); <br>
        +&nbsp;&nbsp;&nbsp; if (p-&gt;n_proc &lt;= 0) <br>
      </blockquote>
      <br>
      On low ram machines it might execute single-process but above in
      description mentioned 2 process, so <br>
      <br>
      condition p-&gt;n_proc &lt; 2 should be checked. <br>
      Agreed: This will be taken care.
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return false; <br>
        +&nbsp;&nbsp;&nbsp; p-&gt;n_vram_bufs = max_t(int, 2, total_vram_bufs /
        p-&gt;n_proc); <br>
        +&nbsp;&nbsp;&nbsp; p-&gt;n_sram_bufs = max_t(int, 2, total_sram_bufs /
        p-&gt;n_proc); <br>
        +&nbsp;&nbsp;&nbsp; p-&gt;total_vram_demand = (uint64_t)p-&gt;n_proc *
        p-&gt;n_vram_bufs * GB(1); <br>
        +&nbsp;&nbsp;&nbsp; return true; <br>
        +} <br>
        + <br>
        +static void test_vm_oversubscribe_concurrent_bind(int fd) <br>
        +{ <br>
        +&nbsp;&nbsp;&nbsp; struct oversubscribe_params p; <br>
        +&nbsp;&nbsp;&nbsp; struct process_data *pdata; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; igt_require_f(calc_oversubscribe_params(fd, &amp;p), <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;Not enough VRAM/RAM for oversubscription
        test\n&quot;); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; igt_debug(&quot;VRAM size: %&quot; PRIu64 &quot;MB, System RAM available:
        %&quot; PRIu64 &quot;MB\n&quot;, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p.vram_size &gt;&gt; 20, p.sram_size &gt;&gt; 20); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; igt_debug(&quot;n_proc = %d\n&quot;, p.n_proc); <br>
        +&nbsp;&nbsp;&nbsp; igt_debug(&quot;VRAM: %&quot; PRIu64 &quot;GB\n&quot;, p.vram_size &gt;&gt;
        30); <br>
        +&nbsp;&nbsp;&nbsp; igt_debug(&quot;VRAM demand: %&quot; PRIu64 &quot;MB (%.2fx
        oversubscription)\n&quot;, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p.total_vram_demand &gt;&gt; 20,
        (double)p.total_vram_demand / p.vram_size); <br>
        +&nbsp;&nbsp;&nbsp; igt_debug(&quot;Processes=%d VRAM_bufs=%d SRAM_bufs=%d\n&quot;,
        p.n_proc, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; p.n_vram_bufs, p.n_sram_bufs); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; pdata = mmap(NULL, sizeof(*pdata), PROT_READ | PROT_WRITE,
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAP_SHARED | MAP_ANONYMOUS, -1, 0); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert(pdata != MAP_FAILED); <br>
        +&nbsp;&nbsp;&nbsp; init_pdata(pdata); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; igt_fork(child, p.n_proc) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_oversubscribe_ctx ctx = {0}; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int rc, ret, fd_c; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint64_t addr = STRESS_BIND_ADDR; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; uint32_t expected_result = 0; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct gem_bo integers_bo = {0}, result_bo = {0},
        batch_bo = {0}; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct gem_bo *vram_bufs, *sram_bufs; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int pos = 0; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mem_bind_sync vram_bind = {0}; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct mem_bind_sync sram_bind = {0}; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_xe_sync batch_syncs[1]; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct drm_xe_exec exec; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct gem_bo ufence_bo = {0}; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int vram_bind_err = 0, sram_bind_err = 0; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_bufs = calloc(p.n_vram_bufs, sizeof(*vram_bufs));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sram_bufs = calloc(p.n_sram_bufs, sizeof(*sram_bufs));
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; srand(child); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fd_c = drm_open_driver(DRIVER_XE); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(vram_bufs &amp;&amp; sram_bufs); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ctx.vm_id = xe_vm_create(fd_c,
        DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE, 0); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_exec_queue(fd_c, &amp;ctx); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_bind.bufs = vram_bufs; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_bind.n_bufs = p.n_vram_bufs; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sram_bind.bufs = sram_bufs; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sram_bind.n_bufs = p.n_sram_bufs; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = create_test_bos(fd_c, &amp;ctx, &amp;vram_bind,
        vram_memory(fd_c, 0), &amp;addr); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process_setup_failed(pdata); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret = create_test_bos(fd_c, &amp;ctx, &amp;sram_bind,
        system_memory(fd_c), &amp;addr); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (ret) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process_setup_failed(pdata); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!vram_bind.n_bufs || !sram_bind.n_bufs) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;No BOs allocated; VRAM/SRAM unavailable,
        skipping\n&quot;); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process_setup_failed(pdata); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
      </blockquote>
      <br>
      When a child hit an allocation failure it called
      process_setup_failed(), jumped to cleanup, and exited normally
      (status 0). <br>
      <br>
      The parent only waited for children to exit — it never checked
      whether any test executed. So a run where every child failed <br>
      <br>
      still it'll be reported as PASS. Instead a counter e.g.
      failed_count should be incremented in process_setup_failed() and
      after cleanup: <br>
      <br>
      failed_count value must be checked so that user knows during
      setup/bo creation fault happened <br>
      <br>
      something like: igt_assert_f(pdata-&gt;fault_count == 0, <br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;%d child(ren) hit unexpected setup errors\n&quot;,
      pdata-&gt;fault_count); <br>
    </blockquote>
    <p><b>Sobin:&nbsp;&nbsp;</b>=&gt; We are creating multiple process and will be
      doing bind at rendezvous&nbsp; .</p>
    <p>Some process can fail due to lack of SRAM / VRAM that will be
      skipped unless we get a&nbsp;</p>
    <p>real fault for those conditions assertion is handled .</p>
    <p>We can track the process based on OOM as some child process can
      fail with OOM</p>
    <blockquote type="cite" cite="mid:f3794783-c9a3-4641-b979-530b6599bb8c@intel.com">
      <blockquote type="cite">+ <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * All allocations are complete. Report Ready and wait
        until every <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * child has either reached this point or repported a
        setup failure. <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; process_ready_and_wait(pdata); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * VM_Bind starts only after the parent releases all
        ready <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; * childen. <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; */ <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bind_bos(fd_c, &amp;ctx, vram_bufs, &amp;vram_bind,
        &amp;vram_bind_err, true)) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (bind_bos(fd_c, &amp;ctx, sram_bufs, &amp;sram_bind,
        &amp;sram_bind_err, false)) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto cleanup; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_bo(fd_c, ctx.vm_id, &amp;integers_bo, 4096,
        EXEC_DATA_ADDR, true); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; expected_result =
        fill_random_integers(&amp;integers_bo, INT_ADD_CNT); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_debug(&quot;%d\n&quot;, expected_result); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_bo(fd_c, ctx.vm_id, &amp;result_bo, 4096,
        EXEC_RESULT_ADDR, false); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_bo(fd_c, ctx.vm_id, &amp;batch_bo, 4096,
        EXEC_BATCH_ADDR, true); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pos = build_add_batch(&amp;batch_bo, &amp;integers_bo,
        &amp;result_bo, INT_ADD_CNT); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(pos * sizeof(int) &lt;= batch_bo.size); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_bind_lr_sync(fd_c, ctx.vm_id, integers_bo.handle,
        0, integers_bo.addr, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; integers_bo.size, 0); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_bind_lr_sync(fd_c, ctx.vm_id, result_bo.handle,
        0, result_bo.addr, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result_bo.size, 0); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_bind_lr_sync(fd_c, ctx.vm_id, batch_bo.handle, 0,
        batch_bo.addr, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_bo.size, 0); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; create_bo(fd_c, ctx.vm_id, &amp;ufence_bo, 4096,
        EXEC_UFENCE_ADDR, true); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(ufence_bo.ptr, 0, ufence_bo.size); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_bind_lr_sync(fd_c, ctx.vm_id, ufence_bo.handle,
        0, ufence_bo.addr, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ufence_bo.size, 0); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; batch_syncs[0] = (struct drm_xe_sync){ <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .type = DRM_XE_SYNC_TYPE_USER_FENCE, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .flags = DRM_XE_SYNC_FLAG_SIGNAL, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .addr = ufence_bo.addr, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .timeline_value = USER_FENCE_VALUE, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; exec = (struct drm_xe_exec) { <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .exec_queue_id = ctx.exec_queue_id, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_syncs = 1, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .syncs = (uintptr_t)batch_syncs, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .address = batch_bo.addr, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .num_batch_buffer = 1, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }; <br>
        + <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc = igt_ioctl(fd_c, DRM_IOCTL_XE_EXEC, &amp;exec); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_f(rc == 0, &quot;xe_exec failed unexpectedly: %s
        (%d)\n&quot;, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; strerror(errno), errno); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_wait_ufence(fd_c, (uint64_t *)ufence_bo.ptr,
        USER_FENCE_VALUE, ctx.exec_queue_id, <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TIMEOUT_NS); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; result_bo.ptr = xe_bo_map(fd_c, result_bo.handle,
        result_bo.size); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert(result_bo.ptr != MAP_FAILED); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_assert_eq(result_bo.ptr[0], expected_result); <br>
      </blockquote>
      Here child should report completion also, something like
      child_completion(pdata) { pdata-&gt;child_completed++;} <br>
    </blockquote>
    <p>&nbsp;Agreed/</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:f3794783-c9a3-4641-b979-530b6599bb8c@intel.com">
      <blockquote type="cite">+cleanup: <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cleanup_bo_resources(fd_c, &amp;ufence_bo); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cleanup_bo_resources(fd_c, &amp;result_bo); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cleanup_bo_resources(fd_c, &amp;batch_bo); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cleanup_bo_resources(fd_c, &amp;integers_bo); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cleanup_sram_vram_objs(fd_c, &amp;vram_bind,
        &amp;sram_bind); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_exec_queue_destroy(fd_c, ctx.exec_queue_id); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_vm_destroy(fd_c, ctx.vm_id); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_close_driver(fd_c); <br>
        +&nbsp;&nbsp;&nbsp; } <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; release_ready_processes(pdata, p.n_proc); <br>
        +&nbsp;&nbsp;&nbsp; igt_waitchildren(); <br>
      </blockquote>
      <br>
      If a child is killed or blocked before reporting, the parent timed
      out after 30 s, <br>
      <br>
      it releases the rest and calls igt_waitchildren() which could wait
      forever/hung. Here all forked children <br>
      <br>
      should be killed first. <br>
    </blockquote>
    <p> Agreed . The child process will be killed after 60 seconds of
      hang in child process.</p>
    <p>We will be using&nbsp; igt_waitchildren_timeout&nbsp;&nbsp;</p>
    <blockquote type="cite" cite="mid:f3794783-c9a3-4641-b979-530b6599bb8c@intel.com"><br>
      Both counters updated above will be checked in assertion to know
      the real cause of error <br>
      <br>
      igt_assert_f(pdata-&gt;fault_count == 0, <br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;%d child(ren) hit unexpected setup errors\n&quot;,
      pdata-&gt;fault_count); <br>
    </blockquote>
    <p>&nbsp;=&gt; fault count will take count of the number of child process
      that got failed with reason other than OOM.</p>
    <p>As discussed offline we can summarize the count in the summary at
      the end</p>
    <p><br>
    </p>
    <p>for e.g.:-&gt;&nbsp;</p>
    <p><br>
      Starting subtest: test_vm_oversubscribe_concurrent_bind<br>
      Oversubscribe summary : 7 processes<br>
      Setup Faulted (unexpected error): 0<br>
      Setup skipped (OOM cases) 0<br>
      Bind failed (ENOMEM/ENOSPC) 0<br>
      <br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:f3794783-c9a3-4641-b979-530b6599bb8c@intel.com">igt_assert_f(pdata-&gt;child_completed
      &gt;= 2, <br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot;Need &gt;=2 processes to complete the oversubscribed
      submit, got %d\n&quot;, <br>
      &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;pdata-&gt;child_completed); <br>
      <br>
      <blockquote type="cite">+&nbsp;&nbsp;&nbsp; igt_reset_timeout(); <br>
        + <br>
        +&nbsp;&nbsp;&nbsp; pthread_cond_destroy(&amp;pdata-&gt;cond); <br>
        +&nbsp;&nbsp;&nbsp; pthread_mutex_destroy(&amp;pdata-&gt;mutex); <br>
        +&nbsp;&nbsp;&nbsp; igt_assert_eq(munmap(pdata, sizeof(*pdata)), 0); <br>
        +} <br>
        + <br>
        &nbsp; static void alloc_sizes_init(void) <br>
        &nbsp; { <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int i; <br>
        @@ -986,6 +1512,7 @@ static const struct test_case test_matrix[]
        = { <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;threads-leak-binding-rand-sizes-50&quot;, 50, LEAK_BINDING,
        TYPE_THREAD, false }, <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; { &quot;threads-leak-binding-rand-sizes-50-unaligned&quot;, 50,
        LEAK_BINDING | UNALIGNED, <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; TYPE_THREAD, false }, <br>
        +&nbsp;&nbsp;&nbsp; { &quot;test_vm_oversubscribe_concurrent_bind&quot;, 0, 0,
        TYPE_OVERSUBSCRIBE, false}, <br>
        &nbsp; }; <br>
        &nbsp; &nbsp; int igt_main() <br>
        @@ -1011,6 +1538,10 @@ int igt_main() <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; run_threaded_bo_alloc_test(fd, t-&gt;count,
        t-&gt;flags); <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case TYPE_OVERSUBSCRIBE: <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; igt_subtest_f(&quot;%s&quot;, t-&gt;name) <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; test_vm_oversubscribe_concurrent_bind(fd); <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break; <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case TYPE_ALL_SIZES: <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case TYPE_RANDOM_SIZE: <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case TYPE_ARRAY_BIND: <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------MaLl2yFMEnZgn2vrasvGD0XS--
