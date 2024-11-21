Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87269D6ED09
	for <igt-dev@archiver.kernel.org>; Thu, 21 Nov 2024 11:23:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F2910E1BB;
	Thu, 21 Nov 2024 11:23:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U6Qgfqh1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C2810E1BB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Nov 2024 11:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732188237; x=1763724237;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=gXyNpcoM+x+xMq8nchG8AaU/y3o+pkAiUHvLc11z7OA=;
 b=U6Qgfqh1eNT9mxY34q1BYzvCFYdBRQad+QKzk9yJTwLBuzAIOS8ksLa4
 YxU8J2zpRRs8IW5EOto5wFh8x+bTViIRLoAfYQtakeqEEaY2b6oxLF1Ki
 B0WIK92LJr+17WxmV4iJXH6TfTp8eylxA5YZm9XTGwKiXWh/UryXT8VQ2
 PBdsEfYsVz4kEvWmR+wEDFZL71YA8jKCEVp/j1xPZi9VeRDNorBZ37c8g
 emQv0GR9mSbVUcE2hsJiMgimzr9tOHzMhqoGAg9cuupSaEbzAlPgwu0IR
 ok0ehWTaAssGEI2ZUCr0fDA9c06M871RPWy72TgvRMuFY2TvMN/dY10RT w==;
X-CSE-ConnectionGUID: cnxu4S7OTCurBX1V206CIg==
X-CSE-MsgGUID: 0BBeduAwRUWj6FBuc72N/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11262"; a="43360325"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="43360325"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 03:23:56 -0800
X-CSE-ConnectionGUID: 4UrTKSJvR4Wi20Jjnwc9xw==
X-CSE-MsgGUID: O4wi/GDHQNS6yLIoXkhLNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="121176489"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 03:23:56 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 03:23:55 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 03:23:55 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 03:23:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yOgeRLarJr8Ay6pl6IL78GDebmJ+mlGtkLmK8f1pQc/Rmpb63OaK66AYXVjSsgelfRG2AqcD9OP1VD2ykHB6bd1ofHplXgozlssEt6i6FbeSXS0cgNrS+Cfp1+Ozb1yHYFatFnUyLG41H7MiPpWVctLK2xCUVK4eAMHWUyZJ6kc9ITCM6FwpCkAPr3DJLapV1ROMc0VuGwwvoKIYv8sWZ3LdPqp2/P6Ep6ft446s/+jRm7Gn7FVe4qRkLrdX0HEXaSr/SV6CUdSw51h4a/3qhPtLor7jsgyVtme4WeXPDrheFJkqx0Jz4S1ckrAeC8utl1sPDFLRe5VmldFaYADqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oj4sFpS1EeycZhR4GleYetD/2ueenvODdz2VWV4g4PA=;
 b=YPZF9cUOZymwvhrH9/U7LZLwtL9tW6Jsa+juJ2MGTJiY7sBdR6lPQGkAmWPejiR+sMeEd7McroxWUM943/+PZ4cFoQBSmsUspg8LkmTly0oGJhUkiyH+yAizsJ2kj24rlVTA9upWaR27brVaMTT8eJFQB+DDZikGqB/uBjqQVV3pOItoq61Uzry03S3ArAbYcrPxR4fXD6sjT8ZbfQb9FBzvjFvzaC/cwrIhtqV6Y7uVzE8z97FjvjpQTosPeivzArXE1MjNXLXWtVSeYQ1jwMxbPdjWO40iyqvnnAcS3VH0p0ftP7SkK6gBgvCQqWJwAk1YN20aZX+kvb0JevF9zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by DM4PR11MB5293.namprd11.prod.outlook.com (2603:10b6:5:390::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.16; Thu, 21 Nov
 2024 11:23:47 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8158.023; Thu, 21 Nov 2024
 11:23:47 +0000
Message-ID: <bae6fbec-e3ff-4b08-8123-ea2c1797475d@intel.com>
Date: Thu, 21 Nov 2024 16:53:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 1/1] tests/kms_async_flips: subtests to validate
 async flips on atomic path
To: Karthik B S <karthik.b.s@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20241015145240.141244-1-santhosh.reddy.guddati@intel.com>
 <20241015145240.141244-2-santhosh.reddy.guddati@intel.com>
 <2f84c87b-7942-461d-bbe6-3cb1d23a3882@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <2f84c87b-7942-461d-bbe6-3cb1d23a3882@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PNYP287CA0030.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:23d::35) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|DM4PR11MB5293:EE_
X-MS-Office365-Filtering-Correlation-Id: 71ecae89-486c-4103-1527-08dd0a1ef736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QjNXaUJZOXE0OC9Jam9XODBlTzRNa2t6Qy9TNVloZC9xUlA4cUE5WnFtMGJx?=
 =?utf-8?B?MFFBYTg4VXpKcWFjR3EvdnE4WmxZZ25sUDVIVTQrRmhXdFhmdlJjZDBTSWF6?=
 =?utf-8?B?UDJGOUZDMndkQWNXTVlwKzNJT1QxVUlCZ2ZrV1E3cVFxUExVM3dMQjBpcndk?=
 =?utf-8?B?ZUtmZmdRUkRwREZsbGdEUmJFdDUzdXh1U3R6ZjdxYUh5ZnlPcTY4MDYwLzFS?=
 =?utf-8?B?ZnBQcGVDZHJmSFFKWVl0NEFBdGl4Rk5oVDE5amFrc0s0c3UyZkZYWUpzQWc5?=
 =?utf-8?B?MFl5eSsrOTBjQWNBY3oyZ28yb0NlY2xNbE05VEpUVDdkZTZvZWc4ZGhCbXpi?=
 =?utf-8?B?OW5SY3ZlM3h5SkVHTzg1aVRBMThzV1paSXVlMjJFaE42MGZGRmw4TWZ0d2k4?=
 =?utf-8?B?cWtGWloydUpXVjFHV1JHYW45TCt2bE4yN3RDeWJDeVUvSW5tN1pzSkYvQzRo?=
 =?utf-8?B?VkJBNU1UYW1qTTNJMXJ5d0Nqb04wcXZaQ1JrbVhwMkpoeGJNWHdlT2dGUHM4?=
 =?utf-8?B?QXNFZmJYOXkyVzIrUzRkQ2xEdUx0SWZJdE9YL0UzRkRKaTlUOW91alNaWStD?=
 =?utf-8?B?Rk9rVGJXdndKNEMvOFU3blhDOGpuNmtCOU9Cd2JONWNXc2tjQThyTTBlS2dn?=
 =?utf-8?B?VXZCc3NiNUNXaDBKSFNxZkUzYmE0QUZpMFdHVDRDc21ITnpDYzNOVkhoMDkx?=
 =?utf-8?B?bk5QaHVyeXpWK2xnT29pdy9HTWFDNzZWWEQ3SDhYK2wvTHA5Q2pDSWlNc3RS?=
 =?utf-8?B?bFMvS0hTN2IrejRBYjc5Yk9Ed0J2UGwrWnJzV0VQWVlucWw1bXFRVjRxbzFy?=
 =?utf-8?B?c292aVEwQzJ2U01aQU43ajRsR2JQUUh2RkxFUndKbDBWcGRmZk1MM29jMmln?=
 =?utf-8?B?S1IyQlA2UUpQaDlnWFFCV0FzallsOFBpTWNhczI1dXRucktEWHR2ek8raW96?=
 =?utf-8?B?QUJhNWRPL0h4QVNXZjJ5TlhEM0l5ZGl5NU9yNlBVOTlQOEhYSkNHc3IzK25u?=
 =?utf-8?B?a3VVQllpL1ZPNUN5cEU4cnlsOEZZQ09JaGNYLzlhTStKMmFMSkZtZnFtd1B2?=
 =?utf-8?B?RXhnT0tNYVRQWS9YUkFITyt2UWR0VGRoWWtUTGM2TVhFdFpQRHBMVnJJbWNv?=
 =?utf-8?B?M2FabW8zSGgwdlhSN3U1dmxXTGY5aVA3Nk9wRDdpNm1IaFh6Q1QvUlhrdUx0?=
 =?utf-8?B?Mmp6Rm44TnlKRmVoQ0JmS3NEWlhZbDVIcVhiSll3ZFZtaTNsalRDbGFnbjhu?=
 =?utf-8?B?V0tRMmdYV1QvcVhVV2d0VXd3THlxUHI5ODdYTkMxUXRBWnJVUXcrVnl6bnVx?=
 =?utf-8?B?QXV2VktUUmhySlJoQ2hQb2Vic1lWQVRwbzBBbHJxKy9HeHdqa1RpZGtKWUZh?=
 =?utf-8?B?bjYwd2Fsa21Zd0hIUFdMLzBuNDdFb3hlU0tSUzhhRnVBSHB5ZFBPY2gxSHNN?=
 =?utf-8?B?aTkyK2x5S2gzTTVmcUN0TXhvNkpXZ2lwNUZBd3NlSFdOU0NqWkp4Rk51SW1G?=
 =?utf-8?B?cmlLTU5PdXk0QUthV3YvRnRXYURpQVVpbUpPanB5RC9lamdhZ2EvdXF6VEdv?=
 =?utf-8?B?U1RaZzdkcm9EUUZMaFV5bkhONjZ0NDAwN3h5THpTa0RCbnJDUmxZbERrUXpK?=
 =?utf-8?B?TUZ0ZUJzdEJUK2xRa1Z5cXZKZVY0TXNiRXZVcWg2eUpWRXUvdmE2SldoZmlU?=
 =?utf-8?B?SjlBNDdkcVQrTk1mRXpWR3lxckdEWmpQVzNsZlNsb1B4V2JwRWFuSml6eVNQ?=
 =?utf-8?Q?2waEn7k32ypy7O7UiPqlFHHBa8kOWbvjpQbCgmc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0V4b05xNWZEbmduTXZEUHVGQng1c2krT3lJKzgwVWNYNGc5am5aamtjU0FQ?=
 =?utf-8?B?TkFFbVdlcEE1M0ZpeFRkaHRHd3VvZmFLdzFJVlN4eEtpK0xDZGExSXBaOVov?=
 =?utf-8?B?bTUzaDYxS0dlOFowTDZDU2xwdVVtaGRBNFIzRzNKZDJyZ0dCeWdycG9KV3pl?=
 =?utf-8?B?U2YzM3E4TS9QY2hWNk5vRjJFV2hDWjRqcUJvSVdIWkp1a21ISWF4WWFlS3cz?=
 =?utf-8?B?ZGhJQzdlb2Nyc3BWeHBCTWpFbVBrNXZ3VlpOeTJHamFDQVJ0dnBEaE9ZeTVM?=
 =?utf-8?B?cDF2cDFiTXowckZ2Vk5rVm1McVV2Qml5UW55K3E5QkpnYzFXaS8xOWJQeVRk?=
 =?utf-8?B?TjFuVE44S1ZRcllnOU9UUW1KQVZRMWxMOGNTVjlORytSY25YZzZ1SGtPeHVJ?=
 =?utf-8?B?RncxTWdybVNHdnBiNXpGRGFyRlZmR1BLSnA3VVpFMTRQV3dKY0owa094Z0NN?=
 =?utf-8?B?NDdXUWtsM2c2V0ZtRmI0N2E5aUpkYXRUN3VKM1FoSDEzQ1BqZVNmU1hMTGk4?=
 =?utf-8?B?RTF6cklOaEFRRlpSK0Fxamd1VXdpanBkREFOSlhDakQrR2NJNW9NT2Jqbkcz?=
 =?utf-8?B?ZitaZTlzaDhkbFp4TlV3UnQ2ZmIvYWRxcysxcnlCb3lacEt2cGpQbmFNTTht?=
 =?utf-8?B?UGI0bC9VWThmQytGRks1UlhSK2g2dFFmMkVtTVM2NGZpV3FMdy9TenhvWmNi?=
 =?utf-8?B?aEdzbVRaV3YrK0p1QzMvS1Y1SlNOaTAwK1RtbVVnWFVja0NEQUJPaXhjdHFn?=
 =?utf-8?B?anNrdW9BY0o0MU02dks2eTdraG1lRHo5ZlJOR3ppUEZEN1JFMDFscXdiTTRS?=
 =?utf-8?B?SE1OUVd4aUM5WVFpUm1yVE05OTM5eExINU5oTEZsUE9zbDRIK0xOZUMveHR4?=
 =?utf-8?B?bEVlVVZmZ0Q0WWZFM3R0OGZOOGw0YTRESzFKUzFQRHVXNFAwaVZhMXVLSXBV?=
 =?utf-8?B?K3ZYWmtnRnFhUXhWY3dLVHdOdzlJQTlHVWRNMzF4MnNIdmgxM0lLTTEyeSt6?=
 =?utf-8?B?MmZ4alpSNXQrQnlzRENnUzBIaWY4a3RmK2hQUEtGMDdCS1RwdzNpVHRxRWpj?=
 =?utf-8?B?WGp2dXZreWsvTmVNVWV5d1JselZWR3RKTDlrU2xnamlvdUM1MmpQUEIwNkdG?=
 =?utf-8?B?c1doVHRhaTFJQlZVeXdEMzhrVktIUTVtekVQSGRpYTBtVHBYdlY3cTFaQk9S?=
 =?utf-8?B?Rm9iU2FwZGFpanpNN3I3UC96VDl2QitLWDNRQTVVaGxrUU5XWXB1RFAvT2RY?=
 =?utf-8?B?RHNmZTBrczNDRzJSdFFaekVlR29ud2RkMUpweE5VTlJLMlRaMlJGSTA2Q1pw?=
 =?utf-8?B?SCtGNkFlSmtkZ1FLTHN6MTltNEd5RzVlL2hwKy9hcFpFdkZMeG00aDAyVDBi?=
 =?utf-8?B?c1JneG92eC9UZG1DbU82a3U0YkFNS3NBM29zWFdCMHlFT1lIQXlzcGxGSWhI?=
 =?utf-8?B?YVJtK1YzLzY4KzZGbVVGbzV0VGVrUTFmbEU5MzZXZ1c0bVJPaXhhdUJUVHds?=
 =?utf-8?B?QjlXTzByWFQ0Uk9TaGRCSVluTkY2Mm1vdEQwajRhUWhldUkxQnBvTHRsYTU1?=
 =?utf-8?B?MlAvc1F4Z2xLZThIdVJ2cXhsQzdUK3NWZ1UwRFNPSWQvYlI2OU9rb3d1ZEFO?=
 =?utf-8?B?dVliWnhZWmxHVC81MmVrVExJekgxL0RWQitwRWFlTG9IVzRiSVpDOUZNT2h2?=
 =?utf-8?B?WUdhaVNodnF6c2hXNTRGcHZ4ZzRab3RUSUpvaklMNFFlWGw1Q3hvalRtUmdM?=
 =?utf-8?B?WGg0bVZzcG5HWTJsQUdKWXZoUlpRZHZhWVl4R29PQUt5dG5FNzMvTUJHZzlJ?=
 =?utf-8?B?ZW94Rlp0S2tHU0VxdnhWR1lNSHl1NVBoWGVBRnNzdzU1cURXS0pTOVF5anBa?=
 =?utf-8?B?dWlpdEhxMjlmR3JxcWZFaHNUMWh6dGFTcUNIaFFYSi81eFYzUXdzRnRsaU5W?=
 =?utf-8?B?VEZpbVJRbHZVZ2JocTN6dFBFQmVoR2RrT2hHNjJJTnNzcWdNLzNVMVlKS1RE?=
 =?utf-8?B?ckN6R0FHY3Nlb2hEelNQeVVxbTJ1MndKTjUwWEJINWtPOWdpdlBoL0RNM3Rp?=
 =?utf-8?B?NW1IaFdxWGNNSlRXK28xcUtNN2xDR0dvUjFXdFJlMWE1Qm9ucnI2YWVYSlRQ?=
 =?utf-8?B?N3RvRzk3NFV2b0QzNmdRZHg1UlBzakdGeS9oY3VlOHVWMGVnNkhPV3JmZmJu?=
 =?utf-8?Q?eR301hxByiYfs84GC+5b10k=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 71ecae89-486c-4103-1527-08dd0a1ef736
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 11:23:47.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mnJVrmQC/JsUJSy4fc9Vb7tb+Hp89IVPcZmoAkeAYY6o8Ex1EV5umKdtL4gG24UFiEKn1Fro/jLV2BlsnfH+5ZpYH9MILOWCPFsEhRj/ycKhOAKq/AdEz9HiWWBQr07e
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5293
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

Hi Karthik,

On 07-11-2024 11:03, Karthik B S wrote:
> 
> On 10/15/2024 8:22 PM, Santhosh Reddy Guddati wrote:
>> subtest to validate async flips with atomic commit
>>
>> v2: refactor repeated code to function (Karthik)
>> explicitly set atomic_path to false in legacy tests (Karthik)
>>
>> v3: fix test_crc and test_invalid subtests
>>
>> Signed-off-by: Santhosh Reddy Guddati<santhosh.reddy.guddati@intel.com>
>> ---
>>   tests/kms_async_flips.c | 170 ++++++++++++++++++++++++++++++++++------
>>   1 file changed, 144 insertions(+), 26 deletions(-)
>>
>> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
>> index 5dec71291..b5961028a 100644
>> --- a/tests/kms_async_flips.c
>> +++ b/tests/kms_async_flips.c
>> @@ -67,6 +67,26 @@
>>    * SUBTEST: invalid-async-flip
>>    * Description: Negative case to verify if changes in fb are rejected from kernel as expected
>>    *
>> + * SUBTEST: alternate-sync-async-flip-atomic
>> + * Description: Verify the async flip functionality and the fps during async flips using atomic path
>> + *
>> + * SUBTEST: async-flip-with-page-flip-events-atomic
>> + * Description: Wait for page flip events in between successive asynchronous flips using atomic path
>> + *
>> + * SUBTEST: test-time-stamp-atomic
>> + * Description: Verify that the async flip timestamp does not coincide with either previous
>> + *              or next vblank when async flip is done using atomic path
>> + *
>> + * SUBTEST: test-cursor-atomic
>> + * Description: Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip with atomic commit
>> + *
>> + * SUBTEST: invalid-async-flip-atomic
>> + * Description: Negative case to verify if changes in fb are rejected from kernel
>> + *              as expected when async flip is done using atomic path
>> + *
>> + * SUBTEST: crc-atomic
>> + * Description: Use CRC to verify async flip scans out the correct framebuffer with atomic commit
>> + *
>>    * SUBTEST: async-flip-suspend-resume
>>    * Description: Verify the async flip functionality with suspend and resume cycle
>>    */
>> @@ -105,6 +125,7 @@ typedef struct {
>>   	bool suspend_resume;
>>   	bool allow_fail;
>>   	struct buf_ops *bops;
>> +	bool atomic_path;
>>   } data_t;
>>   
>>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
>> @@ -259,6 +280,21 @@ static bool async_flip_needs_extra_frame(data_t *data)
>>   	return intel_display_ver(devid) >= 9 || IS_BROADWELL(devid);
>>   }
>>   
>> +static int perform_flip(data_t *data, int frame, int flags)
>> +{
>> +	int ret;
>> +
>> +	if (!data->atomic_path) {
>> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> +				      data->bufs[frame % NUM_FBS].fb_id, flags, data);
>> +	} else {
>> +		igt_plane_set_fb(data->plane, &data->bufs[frame % NUM_FBS]);
> Hi Santhosh,
>> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
> Can we use commit here instead of try commit so that the assert check 
> later can also be avoided?

We are using try_commit to handle the return value in the caller. This 
approach ensures that both atomic and legacy pageflip return values are 
properly managed within the caller.
>> +	}
>> +
>> +	return ret;
>> +}
>> +
>>   static void test_async_flip(data_t *data)
>>   {
>>   	int ret, frame;
>> @@ -276,9 +312,7 @@ static void test_async_flip(data_t *data)
>>   		if (data->alternate_sync_async) {
>>   			flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
>>   
>> -			ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -					      data->bufs[frame % NUM_FBS].fb_id,
>> -					      flags, data);
>> +			ret = perform_flip(data, frame, flags);
>>   
>>   			igt_assert_eq(ret, 0);
>>   
>> @@ -287,19 +321,16 @@ static void test_async_flip(data_t *data)
>>   			flags |= DRM_MODE_PAGE_FLIP_ASYNC;
>>   
>>   			if (async_flip_needs_extra_frame(data)) {
>> -				ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -						      data->bufs[frame % NUM_FBS].fb_id,
>> -						      flags, data);
>>   
>> +				ret = perform_flip(data, frame, flags);
>>   				igt_assert_eq(ret, 0);
>>   
>>   				wait_flip_event(data);
>>   			}
>>   		}
>>   
>> -		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -				      data->bufs[frame % NUM_FBS].fb_id,
>> -				      flags, data);
>> +		ret = perform_flip(data, frame, flags);
>> +
>>   		if (frame == 1 && data->allow_fail)
>>   			igt_skip_on(ret == -EINVAL);
>>   		else
>> @@ -428,9 +459,7 @@ static void test_cursor(data_t *data)
>>   
>>   	do_ioctl(data->drm_fd, DRM_IOCTL_MODE_CURSOR, &cur);
>>   
>> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id,
>> -			      data->bufs[0].fb_id,
>> -			      flags, data);
>> +	ret = perform_flip(data, 0, flags);
>>   
>>   	igt_assert_eq(ret, 0);
>>   
>> @@ -450,6 +479,7 @@ static void test_invalid(data_t *data)
>>   	int ret, width, height;
>>   	struct igt_fb fb[2];
>>   	drmModeModeInfo *mode;
>> +	int flags;
>>   
>>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>   
>> @@ -457,6 +487,8 @@ static void test_invalid(data_t *data)
>>   	width = mode->hdisplay;
>>   	height = mode->vdisplay;
>>   
>> +	flags = DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT;
>> +
>>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>>   		      I915_FORMAT_MOD_X_TILED, &fb[0]);
>>   	igt_create_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>> @@ -465,16 +497,27 @@ static void test_invalid(data_t *data)
>>   	igt_plane_set_fb(data->plane, &fb[0]);
>>   	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>>   
>> -	/* first async flip is expected to allow modifier changes */
>> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id,
>> -			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
>> -	igt_assert_eq(ret, 0);
>> -	wait_flip_event(data);
>> +	if (!data->atomic_path) {
>> +		/* first async flip is expected to allow modifier changes */
>> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[1].fb_id, flags, data);
>> +		igt_assert_eq(ret, 0);
>>   
>> -	/* subsequent async flips should reject modifier changes */
>> -	ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id,
>> -			      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
>> -	igt_assert(ret == -EINVAL);
>> +		wait_flip_event(data);
>> +
>> +		/* subsequent async flips should reject modifier changes */
>> +		ret = drmModePageFlip(data->drm_fd, data->crtc_id, fb[0].fb_id, flags, data);
>> +		igt_assert(ret == -EINVAL);
>> +	} else {
>> +		igt_plane_set_fb(data->plane, &fb[1]);
>> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>> +		igt_assert_eq(ret, 0);
>> +
>> +		wait_flip_event(data);
>> +
>> +		igt_plane_set_fb(data->plane, &fb[0]);
>> +		ret = igt_display_try_commit_atomic(&data->display, flags, data);
>> +		igt_assert(ret == -EINVAL);
>> +	}
> 
> Please document the reason as to why we are not using perform_flip 
> function in the invalid subtest case.

Will add the new revision in the new revision.
Thanks
> 
> Regards,
> Karthik.B.S
>>   
>>   	/* TODO: Add verification for changes in stride, pixel format */
>>   
>> @@ -588,6 +631,8 @@ static void test_crc(data_t *data)
>>   	int ret, width, height;
>>   	drmModeModeInfoPtr mode;
>>   
>> +	igt_display_commit2(&data->display, data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_LEGACY);
>> +
>>   	/* make things faster by using a smallish mode */
>>   	mode = &data->output->config.connector->modes[0];
>>   	width = mode->hdisplay;
>> @@ -620,8 +665,9 @@ static void test_crc(data_t *data)
>>   		paint_fb(data, &data->bufs[frame], 1, height, 0xff0000ff);
>>   
>>   		data->flip_pending = true;
>> -		ret = drmModePageFlip(data->drm_fd, data->crtc_id, data->bufs[frame].fb_id,
>> -				      DRM_MODE_PAGE_FLIP_ASYNC | DRM_MODE_PAGE_FLIP_EVENT, data);
>> +
>> +		ret = perform_flip(data, frame, DRM_MODE_PAGE_FLIP_ASYNC |
>> +				   DRM_MODE_PAGE_FLIP_EVENT);
>>   		igt_assert_eq(ret, 0);
>>   
>>   		wait_events_crc(data);
>> @@ -708,6 +754,18 @@ igt_main
>>   		igt_describe("Wait for page flip events in between successive asynchronous flips");
>>   		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
>>   			data.alternate_sync_async = false;
>> +			data.atomic_path = false;
>> +			if (is_intel_device(data.drm_fd))
>> +				run_test_with_modifiers(&data, test_async_flip);
>> +			else
>> +				run_test(&data, test_async_flip);
>> +		}
>> +
>> +		igt_describe("Wait for page flip events in between successive "
>> +			     "asynchronous flips using atomic path");
>> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
>> +			data.alternate_sync_async = false;
>> +			data.atomic_path = true;
>>   			if (is_intel_device(data.drm_fd))
>>   				run_test_with_modifiers(&data, test_async_flip);
>>   			else
>> @@ -717,12 +775,30 @@ igt_main
>>   		igt_describe("Alternate between sync and async flips");
>>   		igt_subtest_with_dynamic("alternate-sync-async-flip") {
>>   			data.alternate_sync_async = true;
>> +			data.atomic_path = false;
>> +			run_test(&data, test_async_flip);
>> +		}
>> +
>> +		igt_describe("Alternate between sync and async flips using atomic path");
>> +		igt_subtest_with_dynamic("alternate-sync-async-flip-atomic") {
>> +			data.alternate_sync_async = true;
>> +			data.atomic_path = true;
>>   			run_test(&data, test_async_flip);
>>   		}
>>   
>> -		igt_describe("Verify that the async flip timestamp does not coincide with either previous or next vblank");
>> -		igt_subtest_with_dynamic("test-time-stamp")
>> +		igt_describe("Verify that the async flip timestamp does not "
>> +			     "coincide with either previous or next vblank");
>> +		igt_subtest_with_dynamic("test-time-stamp") {
>> +			data.atomic_path = false;
>>   			run_test(&data, test_timestamp);
>> +		}
>> +
>> +		igt_describe("Verify that the async flip timestamp does not coincide "
>> +			     "with either previous or next vblank with atomic path");
>> +		igt_subtest_with_dynamic("test-time-stamp-atomic") {
>> +			data.atomic_path = true;
>> +			run_test(&data, test_timestamp);
>> +		}
>>   	}
>>   
>>   	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after async flip");
>> @@ -733,9 +809,25 @@ igt_main
>>   		 * supported in cursor plane.
>>   		 */
>>   		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
>> -			      "PSR2 sel fetch causes cursor to be added to primary plane " \
>> +			      "PSR2 sel fetch causes cursor to be added to primary plane "
>>   			      "pages flips and async flip is not supported in cursor\n");
>>   
>> +		data.atomic_path = false;
>> +		run_test(&data, test_cursor);
>> +	}
>> +
>> +	igt_describe("Verify that the DRM_IOCTL_MODE_CURSOR passes after "
>> +		     "async flip with atomic commit");
>> +	igt_subtest_with_dynamic("test-cursor-atomic") {
>> +		/*
>> +		 * Intel's PSR2 selective fetch adds other planes to state when
>> +		 * necessary, causing the async flip to fail because async flip is not
>> +		 * supported in cursor plane.
>> +		 */
>> +		igt_skip_on_f(i915_psr2_selective_fetch_check(data.drm_fd, NULL),
>> +			      "PSR2 sel fetch causes cursor to be added to primary plane "
>> +			      "pages flips and async flip is not supported in cursor\n");
>> +		data.atomic_path = true;
>>   		run_test(&data, test_cursor);
>>   	}
>>   
>> @@ -748,6 +840,21 @@ igt_main
>>   		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
>>   						       I915_FORMAT_MOD_Y_TILED));
>>   
>> +		data.atomic_path = false;
>> +		run_test(&data, test_invalid);
>> +	}
>> +
>> +	igt_describe("Negative case to verify if changes in fb are rejected "
>> +		     "from kernel as expected when async flip is done using atomic path");
>> +	igt_subtest_with_dynamic("invalid-async-flip-atomic") {
>> +		data.atomic_path = true;
>> +		/* TODO: support more vendors */
>> +		igt_require(is_intel_device(data.drm_fd));
>> +		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
>> +						       I915_FORMAT_MOD_X_TILED));
>> +		igt_require(igt_display_has_format_mod(&data.display, DRM_FORMAT_XRGB8888,
>> +						       I915_FORMAT_MOD_Y_TILED));
>> +
>>   		run_test(&data, test_invalid);
>>   	}
>>   
>> @@ -756,6 +863,17 @@ igt_main
>>   		/* Devices without CRC can't run this test */
>>   		igt_require_pipe_crc(data.drm_fd);
>>   
>> +		data.atomic_path = false;
>> +		run_test(&data, test_crc);
>> +	}
>> +
>> +	igt_describe("Use CRC to verify async flip scans out the correct framebuffer "
>> +		     "with atomic commit");
>> +	igt_subtest_with_dynamic("crc-atomic") {
>> +		/* Devices without CRC can't run this test */
>> +		igt_require_pipe_crc(data.drm_fd);
>> +
>> +		data.atomic_path = true;
>>   		run_test(&data, test_crc);
>>   	}
>>   

