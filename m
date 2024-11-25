Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99B2D3B7F6
	for <igt-dev@archiver.kernel.org>; Mon, 25 Nov 2024 09:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DCFD10E087;
	Mon, 25 Nov 2024 09:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hXwf4zSk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECBF410E087
 for <igt-dev@lists.freedesktop.org>; Mon, 25 Nov 2024 09:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732526766; x=1764062766;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=XO0T13SdsGO9Ue07pUkgvhZe+IFSRq4o4owR/aoADro=;
 b=hXwf4zSknS1ZWrSZsWl/wP3Pzby7CFpbM6GMs1iKnV7+a4UIVx0Luv3W
 xm+LxaoUJrBNX8Gp1aWYdPKdYPVIYcY1LMlz7/S0OokGxSbwYWl6Iwmlx
 6mmpAD9iYFJvUHXGKUfYreIoiZqelL/92VL3UwkDPVaWZ1MAJzuZy5/0a
 VKTu6JC+/NM8JLQIHoT7urwNPQB9i/oIIwTo/HQhCPzCivnWPxDIA2ftz
 FAIXVP2SWSd0SqfGiWWqVmSlavvJqRjta72iv8Dc3SWzHQdlIow+BzaqI
 ZJZ736lvpmKv1Rj4u7uU618hHrxdiJ2txG3OPSOvQdHbPSsmhAz1TYbRH g==;
X-CSE-ConnectionGUID: WMUtTGLZQOKxxUiR5zdnGg==
X-CSE-MsgGUID: 9nQHpyreR6qMmR+1vRS9NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="35474586"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="35474586"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2024 01:26:05 -0800
X-CSE-ConnectionGUID: lR2Er5B8S9u7JH2ZVYsrzw==
X-CSE-MsgGUID: JM8pXqzKR5C/qJNe9hFGkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; d="scan'208";a="95305550"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Nov 2024 01:26:05 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 25 Nov 2024 01:26:05 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 25 Nov 2024 01:26:05 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 25 Nov 2024 01:26:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jhnb8U7bT296U2Szw+uN33CcU768dd8ZrKDHepL0D35iNKK1q+ZYBpbhnYbUXZCCBVAJ22idBtA+AKZ2O2qPRCqAvDNF0WyL9IoPQ/emZyF14e2vG/HdgIjQiVsTomQk5NuTfLEDWHk5VrBFHlXwVGm91hkMLJEoFvZtyzRTGF7ZGyFc2mBgorb3lMRUnSQlTkbq5EjrQYVqBJwp8nG0gwiJQCXJ9ZiE8I9ZvjA2hOF3CKyQrVxIspORU4LyN/rJclNfK/j5NPRrTdhhNxz+OWIkcJQ6fqYPJ5urwlkkmuzfDoMevOjmCZxpKNg89qJhrCxHE+oqU9zvmwd45sr8BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pw2UpJK7yGp/XZ1EsOMhVIAP2+mUHtC8DQIEHCG77T4=;
 b=NCcue5MppM7NtuqHOU6FmG8hhXILDgYbqwsF9MX7pCpf7TjgA1CoW8o3TjC1GnLS2X6MD/sl/YY6Pik3UcpHvncT+dGyaIVWT/f1hhO0xWg2ZabmbZlBKfXADX9YOcheAHG++wMke+t0L1IzubHrpLGqxBaKGmTRpMyp+T5vsDRgf/2+8K9Xd0tLi3jz0V7QUvLbL4BOMqOhtf6C/Ogp4csgS1b2jW6tJvUlKqBsN+MPM4D5HyOGAG7BnxfdJBskyi0On/xaKXb7VAiVKDWVISvMoErqC6ONAUxVhf5wgjtFAAhWQm2MI5Fn8G1Xlf0HhaMCUCHhrZqoNkkUyDu+JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.21; Mon, 25 Nov
 2024 09:26:02 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%7]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 09:26:02 +0000
Date: Mon, 25 Nov 2024 10:25:50 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <igt-dev@lists.freedesktop.org>, <chris.p.wilson@intel.com>
CC: <krzysztof.karas@intel.com>, <andi.shyti@intel.com>
Subject: [PATCH i-g-t v2] tests/intel/i915_hangman: Fix spin engine hang
Message-ID: <w4npzgyztxkpsliinu5racl6pnxndfohxmybsmuv47lk25f2rw@7kdownjakpou>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
X-ClientProxiedBy: YQZPR01CA0028.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:86::14) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|DM6PR11MB4564:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8d0228-4c24-4adc-e222-08dd0d332d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OWVFT1dwY0pKSFU3MTJKTkZ6V2tlaGtxQWo2YWhablVLQjg0Smd0d1RidXhM?=
 =?utf-8?B?OXpacm43RzZQeFZrcFUvQTcybXZibmFEM3pIMGc3TkR2bU00VWF5Vmk4QXZl?=
 =?utf-8?B?Vm9Ga2pjLzh1b3FTbDMzbjgrMTUwZ3doVDNMTnQvK0p3WTJUcGhRVkI3OFk1?=
 =?utf-8?B?eEQzZ05aN0lvajNmN2xubjJpdThGUzdhT08rZFRNM0J6YWlEOHZzUnNMVThK?=
 =?utf-8?B?ZHFISkkrV0c0YW9odllhbW9OZXVZYU5Ed213MjJnTkZYT090WjBHK3BSSTJh?=
 =?utf-8?B?cTZYYmNDRDBvTXV5RWRCTHdCNERVcWExSzlKdklrWFhzNHd5eTJ6OUgrZjVP?=
 =?utf-8?B?NE9oU1Zkd2tQd0NGUlBoVzllVzJ5ZE5JQmVRQkRuWlR4cDZyODZlWU1zQjh6?=
 =?utf-8?B?cjYxNjZKcFBDenhveFJJWWVSUS9rODVGbnNVcVd2OVdSSmc0RVdYTlRubnVD?=
 =?utf-8?B?WmpzSEpLWWFjRWlYNHFkWS9NUzl0STY1L0dPZUlBb2thNDNEUGFDUEpTMmVq?=
 =?utf-8?B?TzJ6ckZocktBQ2Z0QjcvR2h5dHZOaGJpbC91VGR0ckZLT1lmeUswajNQNndz?=
 =?utf-8?B?ZW5aeFNtaXZMeHkyQUU0ekl6MVZUY2gzb1daOTlEamd1N3RUNkZybDRYcitl?=
 =?utf-8?B?Z3ZXeFpwWnpuSHFTRVU3QStFWjZqSTRuRStiUUo1YVFyREpvaXN1WlZ2aktP?=
 =?utf-8?B?eVVBYzZWOVBRV2RNM0VyOUFUREY3QWwySDk5TmlTc2k2NlFac3NYZ2tMbHpq?=
 =?utf-8?B?QXlzWkVVaEVuelV6eFVlTGVBNEtkR1VyOGFTYy84S0VpRi9sTmw0TWNuUTVR?=
 =?utf-8?B?RnpCWFJRdWlRcHpjOGtvSEZJSm1VK2tXMktsRFlLUUd2ZU9McFovZjNXZGg4?=
 =?utf-8?B?YXZWb3dwMlN4RnhlcGtieXNxMENqeVRxS2VKUjlmZmczQkVKWDI5N0ZBZ3Av?=
 =?utf-8?B?WFdwNzNZZERKd21pREtWZ3NlN1UyTGtNK1JJMHN6Mm1JMndNeE8rVlkwZjNF?=
 =?utf-8?B?RGFXNEc5Y1lUL3R0VFpEa2F1WWVicHRKUGxscUxQc2lyODZWU29vZWlSUVd1?=
 =?utf-8?B?K21EVE5senpRK0cycjVaeEJNd0lIY1QyZGJ4ckFwRDNTWU91NXNKRHhYdDAw?=
 =?utf-8?B?R1hwbkV4N1hDTjJXZE5YZEdLblZ3bUpiM3ozY0lUWDEycG9zL2lmWmtoMXAz?=
 =?utf-8?B?a0tUcmUxMGprVUJobUhEd1V2eFk2b0JvT0JGSTQrZnF4KzNoN3VCTlpqVlVl?=
 =?utf-8?B?eWpXSXJva2FHbkF1VWhzNlNlSDdUVVpxMnQ5OVlXaStsOVhmTUZ4N3FmMVJQ?=
 =?utf-8?B?djBqK2cySW9vTDd2UWoyYTN1SU9xNVp0ancxUkZkVHVDdVRzTmVsOWI0ZEww?=
 =?utf-8?B?L01PYitFaktnYk8vZm9CbE92bW81bEgzTzhWb2RDdTlXbDM4ZEtoMTB1dEw0?=
 =?utf-8?B?aWs3NXl5cjlkbnYrWTd2dGdSaDBBY1Vlc2ZKMDVoVVRRajhxZVJmODBSUVBj?=
 =?utf-8?B?M2dPYnhFN3FRL2V0VDRyVUcrRHZmT2lRSGZhWkNHdHptaHRVRzRpUGRFUStk?=
 =?utf-8?B?UFZMK01mTVRIMm5ETTVCOXpDOStucjNnUEJzS2M5OFRoaTBpV0pDSkNUSXN1?=
 =?utf-8?B?TnFpaUtRZzVzUU5VY3hOL2s0Yi9TbEh0c1BEc2xyVDgyOFZwWEh0YnFDelJs?=
 =?utf-8?B?R2VianpuTGVFaFNUdkdDYzFxNklaZVM5azZhQm82MXdxbTFsK0hiYVk0QU85?=
 =?utf-8?B?K2NmVFByTEJ1NzBpR1JFcGhtOWF3Rnd6ZSt0aXQ5YnM0eCtYL1JyalFjZjNS?=
 =?utf-8?B?MkJCMjlhWjM1Q3o1bUpaQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NjlCc29Kb2xHdU9BaUtRTDdRdy9KbDg2WWZ1elQrRVpXWkpZNE9IaU1JSjNB?=
 =?utf-8?B?Sk9mQWg5TkVFTVllTVVLdUo0alZXaHdwR3J6bVdGOFBiMVBTZTgzTWdOYU96?=
 =?utf-8?B?RUVnNWc0aWt1YllJRlJsV2MrOGtQeXhLUlByN1MvMG1XNkdkYzFNVlc4V2lJ?=
 =?utf-8?B?VVlncXgxWVdBbTBnaDBwSlhJWG9yMHFvVy9vT0VyNU1sbGpia3VJditnd0xn?=
 =?utf-8?B?WTI2WG8wSTQ2Lzl3Und2anZ4bGpXc292UG1VVjRjK3pnL1VyUlVEajFWblkx?=
 =?utf-8?B?ZjB4YlZ6dTlUUWw2dHArdU1YZGRJeU1MUGY0UUpXOWxKMDU4L0w2NndNb2d1?=
 =?utf-8?B?ZHNzTzI5MTArQ0VuZWM3OCtHZ3l1YWg0aXZvUEw1MmRpM2QydzBhbXE1SEk5?=
 =?utf-8?B?eVRBdVMyY2txeDRzNHhrdW1RRmdaSGFqUHhpOHdubVRuTUtuZFNTa2NWTkNl?=
 =?utf-8?B?SUlBeVB3c25UQkpnT3luTmdJUnBpRUlQMHhSaHFWbWhhV3BsNmdjSHNxTDky?=
 =?utf-8?B?U21ib2lEYkxQQm1FdXNLWlBJQ3g2Z2xDTjJTd2ZYYk5PdlZvVWlyRWFSaU1x?=
 =?utf-8?B?WUdmcDlBTWVlWWVLb0FPQXVYQ2c2T3VNbmcyS3FhaXhZRkZiWjhuaGdwbE5p?=
 =?utf-8?B?V3JVTm93ZTg4a0hlRUZqRndtVEJES0VjYzk1UWlQK1JCM3VoUFhoSE1TTVJR?=
 =?utf-8?B?Vkp1K0NtZFY2c01FdHdSRGRQT2hNOWtid2JtNkhkMG91a3Jib2RHQ3Y3UHd5?=
 =?utf-8?B?dS9jYmVpWlZlK0pTRFZrNSt1RDBqak9vZnhKTytSS0ZPV2ZCcFRrWWJONlNB?=
 =?utf-8?B?YmRoeUppSk95bm85RjZZeFFlL1NDakZRN1ovVld1Mi91LytIRStiMU1IWll6?=
 =?utf-8?B?dlVld095NkwrZklSMWNoTWNCTExlNnoyVmRDakMydktndUMwQzZMdFZLa0Mz?=
 =?utf-8?B?M01SRWZnc1B5ZVZxUTlKbTNMdWhiZG5vK2pWUmdFQzNYeGQ5bVI1NVNBcnNR?=
 =?utf-8?B?YVFnTzZhQnJKcUEweWpmT2l2dzBiQ1Y3bGhUcUFGZWJiS2NrOHU5WG8vQlg3?=
 =?utf-8?B?OGRjVmNoRWlPRE9iWGtMcUFreUovS1pYSkFCZUsxNUJhaXBsS29ScjROWXJz?=
 =?utf-8?B?VjBoVldaNUYrbXdLVDZjbzBiWlIxUmJCM09YazE5b3g5cXhVTnVGMzlIdytU?=
 =?utf-8?B?VTdMRklBTlplSlArMHIzNndYb1owUmFqaXY0YTZjdmZCWHFhL3VnZ2pwNkR5?=
 =?utf-8?B?TlhiOW1pM1dGWXhraWVnZ3BoZGxHVTQ4Z0JucUFsZ3ZUUWxFaTlZMWRHcDRJ?=
 =?utf-8?B?UmdPSWhpdEFzWFNCRy9kaUgyejRnNmFYZmFqM1p0Z3NsVWJzbWRZL0VxT2hH?=
 =?utf-8?B?UWVhSkRNbnlFY0tiYXpRMmY2dDI2dE9rVHVCc3VwWHUxTzcxMmFpTmRaSG1H?=
 =?utf-8?B?WWxrUTAvVVdjRmcrNnE0dHRIcjFlOXptVXZvUXR4RHJWRVJzdFZTTWNRck9C?=
 =?utf-8?B?M2loMFhRS0pFTHBaUVlHSDJSRSs5dHhUbzhYN29XUVNFSTFQYXR2R21TcmtV?=
 =?utf-8?B?c25SS1BKRTJjZnBrVjlSakVIeDBUWVgrSUZLakdaRDdmRkpjZktKUHh1RjNo?=
 =?utf-8?B?a3ZQYWFKNUdJOFVzRTVQMUN1Z2xqK0R0bEsxSnNvTUFZemhoKzN5akNDUWpI?=
 =?utf-8?B?Q1VvUDdNWlltMytvOTVHWUh1OTdDR2VDS2xITStYWkdnNldPVjVVeE1qb29a?=
 =?utf-8?B?OXoxYVpqSHBqZUh2TGJ1czNvZ2Fua2pQakl5ZDQ0K1NjMkZWNWYyWm9sN2Uz?=
 =?utf-8?B?cTRlajNHUGtHRWtzYnRoVWJlNW5MNWt3Y2JQdTBEWmlaK3pSOVlMbEFLUy9n?=
 =?utf-8?B?cmNTUWdwK2FIaDM1R0g1QVJ2Qkw3aEdjVjVZYjlvdC9uZklVaWFBQ2dUdkVZ?=
 =?utf-8?B?Sjl0aUNtSE5kMytwWXYxYlhrZ3pwRjJjdnlpeHNpN2Z5MFdVbTVKUVNVaWNZ?=
 =?utf-8?B?clBIOTdFKzNqOVhBanE3VlQ3TUVuWll4WStMWHNCSzBxRUltQW5Tc1Q2eDRr?=
 =?utf-8?B?b1A0em9rV24zd1VNTHpPczNYVXRjbFVEa0tBb2FKRUhvTVlBbUZFRTY5NndD?=
 =?utf-8?B?RUJ5aWxiS3Y2VUtpMUY3VWNoTmpmelp1WGM1OHNUS3VOV2YrQ0toaGxRMk94?=
 =?utf-8?B?TkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8d0228-4c24-4adc-e222-08dd0d332d65
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2024 09:26:01.6146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CEEv7qwIziNc0rMG3u2Y8ywob3hI+hKf0yevkkM2XcsaL49CEAUsL0deYQ3ZkZtlMnG1Lad7kE5Vgf6z0sWH3zQ/hPCwGKQQavjr2Ht6aQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4564
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

Apply workaround when running background spins in hangman test.
Disable bcs0 background engine when testing ccs0 and vice-versa.

Signed-off-by: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
---
 tests/intel/i915_hangman.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/tests/intel/i915_hangman.c b/tests/intel/i915_hangman.c
index a556eec53..2948cebd7 100644
--- a/tests/intel/i915_hangman.c
+++ b/tests/intel/i915_hangman.c
@@ -365,6 +365,12 @@ static void chk_err(int *dst, int err, int expected)
 #define ERR_FENCE_END  3
 #define ERR_FENCE_STAT 4
 
+static bool
+is_bcs_ccs(const struct intel_execution_engine2 *e) {
+	return e->class == I915_ENGINE_CLASS_COMPUTE ||
+	       e->class == I915_ENGINE_CLASS_COPY;
+}
+
 static void
 test_engine_hang(const intel_ctx_t *ctx,
 		 const struct intel_execution_engine2 *e, unsigned int flags)
@@ -388,6 +394,13 @@ test_engine_hang(const intel_ctx_t *ctx,
 	 */
 	num_ctx = 0;
 	for_each_ctx_engine(device, ctx, other) {
+		/* Wa_14014494547:DG2 */
+		if (IS_DG2(intel_get_drm_devid(device)) &&
+		    is_bcs_ccs(e) &&
+		    is_bcs_ccs(other) &&
+		    e->class != other->class)
+			continue;
+
 		local_ctx[num_ctx] = intel_ctx_create(device, &ctx->cfg);
 		context_unban(device, local_ctx[num_ctx]->id);
 		ahndN = get_reloc_ahnd(device, local_ctx[num_ctx]->id);
-- 
2.47.0

