Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC2CE6C5FB
	for <igt-dev@archiver.kernel.org>; Tue,  3 Dec 2024 04:41:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087B610E113;
	Tue,  3 Dec 2024 04:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O/8LsYyv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0189610E113
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2024 04:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733200915; x=1764736915;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NYR0PR80OPqAa5CZ/BJKOD9q/JRbu5oxAhrDUE5nR9I=;
 b=O/8LsYyv3ne/jlVLKW7RX5sJmJmex47DfCii5TPZnrA2Zsb7rMcLnNM0
 5zdQuUcfi7C3FXwFDlH1aWh2xZczu4in/gucNQGn5PftcxiR1qgdz1Y53
 nPhTI/20dvDiBdSvxhPg01RKdPNlhEBD0/W/q2AoMKVFGLwlP7JepNOqn
 fH8azMNTxcKaEOhXlrjpwtyrvQzLxTHGdxa0jFeYa0L7zeeArIQlKwDl5
 Rcl5u9JArKj/l4dRYSTj0QxLGWFIT7HfdOus9hVCQknN2qNOFPeVP/r+W
 jCuyT1N8PRsvTT/G7BZ7l4ztmuj9Mr0uFY/IdKeEDBBT+Jz5LUGKuKUso w==;
X-CSE-ConnectionGUID: oy3Pgpd6TQ+5RGO+Zdpolg==
X-CSE-MsgGUID: JLI1BiqeT7CpHHsS8c2vcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="58804728"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="58804728"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 20:41:53 -0800
X-CSE-ConnectionGUID: +hE+9gofRDiACiWQYzx2WQ==
X-CSE-MsgGUID: xSk1E+1iSci6odbCzGGvvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; d="scan'208";a="93399886"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 20:41:53 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 20:41:52 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 20:41:52 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.43) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 20:41:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qZbS03pvJifCRDvjf8aQF6O3wRHINjcGvAlpsTpF0PIZ4IbY+GfJgPSuI/wABCdgLXMe7UVsHTUryKQVd1crPij6BY2/qT6V7srjMFVkK0cR4qWP4hcpk/Ry/TTHiRCM+EGqCnD4UCje0arPgbjZ312H8b5BmGmO9vtQzGjLv4t8GjFOtsfNNmOw7TBIf3oq8H1ZHZSf+ddmfZj/WnEXCDNqxIWT0siD3uFyE0imSmip+F+Nqik0StOhzhqHlLHI2lIb9th3HnCkG9rQzK8aW6oBVnlCiETS/5fGMybuN9peXDNhLPp6cB1LaUIIcBtOpZl1m8DjnL8uNEkodogK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCY6nosdpFvxfN2vzKYvs1vUaYUVLCQBv43/VQUqutU=;
 b=OR2x6jna6QmSwnbLHJNaT6N+HwgYWlfYVwRLM36SogHl08h4GFrSultHjWbm715F5ud7dMUEuCwEtgD1aNnq2P6vsPgVBVbaPI04Jxpn3FPLI8KzoVU+QCf8tBeXWuzGnBNS5y2Bx6ucAAGEdzwh8TT+akpeywEP4Glt64weSkYSlHSXJ4BtE5hPqENtyeMyQ8MIgAw9D8ypX8Gz4duGvNLBAZDuh0v+bglll4ARZtxcwUP/G4DxxUz5AAK2ZtpgFGkYvA5cc5UoEl6/VicthlMPqg/FkNhXjb7Vn/czk3oJMfzbN1TzV8mcn7YxOIu8XKNLuwK58vbWqMZGlYua6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by IA1PR11MB7343.namprd11.prod.outlook.com (2603:10b6:208:424::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.19; Tue, 3 Dec
 2024 04:41:50 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8207.017; Tue, 3 Dec 2024
 04:41:50 +0000
Message-ID: <bf03773a-eef2-4d2f-ab1e-0345acc5d9e1@intel.com>
Date: Tue, 3 Dec 2024 10:11:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] test/kms_content_protection: Account for
 reauthetication in LIC
To: <igt-dev@lists.freedesktop.org>
References: <20241128091425.1794814-1-suraj.kandpal@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <20241128091425.1794814-1-suraj.kandpal@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2P287CA0006.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::12) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|IA1PR11MB7343:EE_
X-MS-Office365-Filtering-Correlation-Id: 704198a1-981c-4787-fff3-08dd1354cd29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0NqYW9VMFhRNHJpSkhkZlR4bERqRm9Jc0FrTldId1owOWJWQk1xUmgxeDNY?=
 =?utf-8?B?TktIMWc1dVVha25aV0tYVHVtZytEM2w4ZCt6VFBiSVdHQU9jc05BZ2RNVUhU?=
 =?utf-8?B?NlFiMU5KbytNcTR3dGVpT3JlUW5mcnY5WFB6OE96YlREWXVVcEVhMkJjQ3JE?=
 =?utf-8?B?UDhZQVBEdEhwd3g2QTZLVjA5RVhzS1lIZS9xUmExTWNnRy91enhEb1NCQ1NT?=
 =?utf-8?B?UVA1QkhaZ2U3UXoyNFNuaXcvcnJRemErMjV3a2REU3dXZURFbU9RcXlzcWkv?=
 =?utf-8?B?ZEtkWmlHUDJhRWE1MXBIaGNhMWd3cEszSHN2ZDIrejhEdE1lVkZUTjdHOHBF?=
 =?utf-8?B?OTdaRTVyNUtnalZmd2RCanVCU3VmOW01WFkyV1BMbktsOFY4UG5PMElwWHp2?=
 =?utf-8?B?d1JWdlo5L1FrUXJvV29RNnFMVWt5TzRaUUVhSFBuVksyTW05RFMxeHVzRXZu?=
 =?utf-8?B?Um1UL3R1ZlErWTNZT05zUzNRcS90UTU4cTRXd0E0SGtFV1d3QXR6TTFnZ2d6?=
 =?utf-8?B?b1VHSjdEL2lVRDhUQ2RGMEl3ZFhseWJDKzk3WU9abEszb0xsZ29BWGJ6VndO?=
 =?utf-8?B?dlgyNzdzOTN2RDVpcEFNV2FLMGcxYlZOUkcxdFBXZlMxUHp5cE5PNHE5ZTJo?=
 =?utf-8?B?QmdjTTcvcHI5YjlOT3dIRC9GZW5pSmdSOGJVUEhqcnQzOXJkVHBJS3Vsb0k5?=
 =?utf-8?B?UzlweFByZmtLdEQxUy9pMWYySmZXRklIQ0JQeTZubW0zakhMYUcxSzZ3NFVh?=
 =?utf-8?B?c2puaW9pRzV4ZldMQWFlWHd4LzA3am10SUNINDdBRGo3M2xUbDh5bmt1Szl3?=
 =?utf-8?B?bDNHY2VsSGhNSXpEeDczTElRbnk1UkVIVG9sbEd4RjFiTFBGWDAzb3FEYzFz?=
 =?utf-8?B?VDg1aWpJZjZmSVZRZ3I0VGd1R3U0Z240VldYM0RoVFRlTC92VlQrSEVRZnR0?=
 =?utf-8?B?YmFJNjhiTXFBTURPQ3VaQTArLzRtVk1HMks4TjhhSFFWdmc3NDByamREVFB4?=
 =?utf-8?B?d3hFeGsxTG5GajNlbTNyUzlpSmFnMG5mN2J0c0V3UkdKUW9qSFNndGNCSitI?=
 =?utf-8?B?TktEZ1VwOUVqK2liS01tbW5Uc3ZQL3R0cFd4eDBlM3pmOThYaExxWWJvUmNQ?=
 =?utf-8?B?T09MV25RL0RaakFpSm5DNUZSczZWU2ZiWDVVczRmSEk2TVpMQVZ0QWtRamU4?=
 =?utf-8?B?d0lhNjNJTVY0SU45eDh2dHU0Q2xTTkNlL1FFR0piS0NETTRlL01OWnhNMm1p?=
 =?utf-8?B?MXZyS1hIdjhVNW52TzJXOEx5NnVibUZXMHhGdjFmclJ1SXZWazFpM2g2WEt1?=
 =?utf-8?B?THpraFpPZW1kUTZsbWxGSWxjVzg3S0VVM0ExaGY2L1BoVjBmU1gxc24xdUxh?=
 =?utf-8?B?eW9pN2plU1FWZUI3RUlpYjI2cnFIUUhLVGhEa3ZjeWpsdTdhNGpSVHgzZ3JP?=
 =?utf-8?B?QlRFVjZITlRYcW15cFFjYXVYcnlDdWd3QllFVzd5SEZZa0NZYzhHQUpLcXJV?=
 =?utf-8?B?MWRESVkrdm1QcmlBVGNZZENkaC9iNmZuTnRtRXBMN2VnVGpCekNTakw3SGF4?=
 =?utf-8?B?cGZkaHZ5bU03dHZkcEhXeGZoTnU0M1orZlRyeUoxVVVJMDE1TWxMc01lYW9O?=
 =?utf-8?B?RGxtdTlmeVBrL1lvZnZsWElwVHJ1Yks0UmNwTXVhZ0dMQ241aXlaTVlQcFk2?=
 =?utf-8?B?V0NvVTc3a1dpNXh5S0swbk9kZ21WZDEyUldYSU94bnpmNkVyM095TmVORTdD?=
 =?utf-8?Q?czNF0olfOkRX0nLhYA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M2lITFJ3b0I4VUdZVmxmQjhkN1lQQkVlVkRHL0EwaExrQWZpQ29PaUJrWS9r?=
 =?utf-8?B?L1FrZCtLSGJRUFJEb3JXWnpXakF6a21COXFGcmhOL0kyalNONmIzdFZNWVBh?=
 =?utf-8?B?Y2hTVU1Qc1NJWHEzTlZFajZVMjR1d1pXUTBPY2ZINTMwaG8rQSs3NnhKQzB1?=
 =?utf-8?B?UlJNeFFsczE5YVlTdjFXQTR4Zy9JQUZvVjN2aGdXY2YxTEJ1UnhId2ZUY3Nx?=
 =?utf-8?B?NEJDSlRwenIvOWYwUUFwZjhqQ0htVXJFRUZpUy9QS1hNRzB2UjBTTXVrT2pi?=
 =?utf-8?B?MzJidU1Dcjd0MFZLc3V4QWdlS3FPZU1uZlN4dFRia1BUb21saFlqOW43R3Bh?=
 =?utf-8?B?WmdWQUw0WXorLzJoY0MwcEhBS1RqdjEyajdSSldmZW54SmtYbUJGV0srSXRF?=
 =?utf-8?B?aXlkdGg1SGgvK1BvNmhjUmVJRURlay9WUXdrYU9HaE5vRVRsdisvR2o1Ukh5?=
 =?utf-8?B?SGpRdFVqQytHb21xM0pwQnlDRnRVeHVtcGpiY3JtejZVVFhyV0ZrblZ1UUp0?=
 =?utf-8?B?M3FYVjJvVzAxaU1nb1p3QzliZjliSjRRUnhTUGNoT0EvTnhMQTlTUHkwNlZ1?=
 =?utf-8?B?UHVHRXBJdGNscFZKMk1walNvRlduTm9RaU5JWGlubitlQnVNaFFhRjcyRlli?=
 =?utf-8?B?cFRLVzdPQlZWWSszKzdpOUlpOGNMOElJYW5BTWdDVWtQYnpUc0F5VmZPVTJE?=
 =?utf-8?B?Y1QwYk1yUGptY2RSZ2ZrdzVGVDF4OXRFazFvTzZOK0lOQUtCNkFVLzc4NnNZ?=
 =?utf-8?B?SGVlUGcxaVBzTERRZktVNXdYeW05OFhScTJVR2hncllLU1VUTnZmVmVKYmV4?=
 =?utf-8?B?VU5pK3FRNEdlenY3MlpJS3UzRHNRZ29sRkhVVWczL09OeFJOakdQYWtGeURZ?=
 =?utf-8?B?a0dHNkhVQ0RtNjQrakNocHlBd2VJMW1Kajkvb0QxeVRlZXdYUGdib2ExdjVJ?=
 =?utf-8?B?bXdBNWlPQmtYcUFlTnBOTThCWHAveE5NeXV4b2ZBcHE4M2ZpTEhtNHM4aTdJ?=
 =?utf-8?B?VW9jbm1Sdko4aktsSVFXL0JzQ1JJRWRLbFVRY3VubnErZmk5TXdoTklVUi9h?=
 =?utf-8?B?d3REUmtvVHZOaElwRlJiQnNFU29vU2ZxUjV1YkxxUThpaHh2VitEdEJkY1Rw?=
 =?utf-8?B?aVB1dWJHYTJLZE1UUTZwbjJrWTBOZ1Q2ZVI3dVExbFIzNElURHNkanNETmJY?=
 =?utf-8?B?cmxLSGJUZklFOEs0a1hIaG9NU0N5ZC9YcW5nVTFZRWMvME5KRlpLaWVKMTZh?=
 =?utf-8?B?aVBqelpOQllRWFdXckdBa0tlbHRTeXcwNDE0c0tOT3VWNUdlaGxDbi9XREFk?=
 =?utf-8?B?RzlwTWFabWhUNnorNEpCNXFRQ2JNY3l4cStJUE9vbmFuY0IxRjBzZHhaNE5Z?=
 =?utf-8?B?eUFDRlM1cUJrUXhhWVppWk1WOWJYellTL09zdUtyTHlSbXk4aGFwQjZZeUdR?=
 =?utf-8?B?WG05ZzRZRlhkcnNrUWc5aWxqZFd5RElHL0FxaURubFAreXB5amV4cWVreVcy?=
 =?utf-8?B?a05ZVHczR0NacTZKZ0lMRVlURnplcVdtenFYRVYvdTJ3TUh1MG9QVGhJQ0kr?=
 =?utf-8?B?alN4Q01KQkZaR0JjU044U2ttdXV5YklCdG4vVGlRY2VpZTd4SkNINlkxZVUx?=
 =?utf-8?B?UG1aQjY3Y2dtRktIS2o2ZnBReXpVVnF6NEN0VWlNbWlPd1hvWXZQSEYzU0ky?=
 =?utf-8?B?aXJ3NktieFNvYSs0alBITE5WUWNFZDQzN2lobEpKTll3c3NubC9yWTNqeTRw?=
 =?utf-8?B?YmtPWlIvbitZNVVrZDhIdVdtV1F2RlEwSWZOWlZJMC9xRjhUelBlZFRuMHFj?=
 =?utf-8?B?dWUwSG1XMXNGUkJ3b2FNNDVEa2pQVEpNWitUNitGa1M5aEhrZkYzVzlRdGpO?=
 =?utf-8?B?QjhEc1FtRUh0eUMvT3lVcUZkV0JUNlJpMC85cUZSMFd1bWE4dUU2R3hDdFAw?=
 =?utf-8?B?WE80a1Q1dWt2eFpNQ0xBSTA4a0F5K0xvc1k1RzRXNjJvWUp2bjMzT1UwZmlx?=
 =?utf-8?B?bWRYMmlCUUFxb0JMLzVxVDQ0eVZJQlJtaE5vRXBRWCtVVHpubVFJMEJtOE56?=
 =?utf-8?B?bjNuMFV6RVI2dTVFd2gvT0xMckk1eSt0cW9uQTNkWjlUaGwwd3hjQW0yaW50?=
 =?utf-8?B?RWozb28wYnVHR1ZyQ1pkYStZM1Q4K09UU01tVFdkK0RrSXJLQ2c3U0NaeTFZ?=
 =?utf-8?Q?DW97n4up81B4g65KiRBHr80=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 704198a1-981c-4787-fff3-08dd1354cd29
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 04:41:49.9831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D36Nroi+Z1sg/ongs6K7NzDsnpGUTqYGwr5DSqLBxpGX+aONGujLR2V+lk6M6NkGVKjdcOgOSSuasvROUVjnsoX0gQm9+2cB5fI3li/VDPXEMMXQswRGU2KSV0CX+oPu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7343
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

Hi Suraj,

On 28-11-2024 14:44, Suraj Kandpal wrote:
> During LIC the link may fail due to a variety of reasons but this
> does not reflect a problem with HDCP. It becomes a problem only when
> we are not able to recover from the Link Integrity Failure.
> Add a check to see if CP property is CP_DESIRED and if so give it time
> to reauthenticate and fail only if this reauthentication does not
> happen.
> 
> Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> ---
>   tests/kms_content_protection.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/tests/kms_content_protection.c b/tests/kms_content_protection.c
> index 59dca54df..aa88c6bc1 100644
> --- a/tests/kms_content_protection.c
> +++ b/tests/kms_content_protection.c
> @@ -376,9 +376,15 @@ static bool igt_pipe_is_free(igt_display_t *display, enum pipe pipe)
>   static void test_cp_lic(igt_output_t *output)
>   {
>   	bool ret;
> +	uint64_t val;
>   
>   	/* Wait for 4Secs (min 2 cycles of Link Integrity Check) */
>   	ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
> +	val = igt_output_get_prop(output,
> +				  IGT_CONNECTOR_CONTENT_PROTECTION);
> +	if (val == CP_DESIRED)
Please add a log message here something like
	igt_debug("Link Integrity Check failed, waiting for 
reauthentication...\n");
> +		ret = wait_for_prop_value(output, CP_DESIRED, LIC_PERIOD_MSEC);
> +
>   	igt_assert_f(!ret, "Content Protection LIC Failed\n");
>   }
> 
Also add closes tag.
Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3508

Thanks,
Santhosh

