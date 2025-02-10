Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32828C02198
	for <igt-dev@archiver.kernel.org>; Mon, 10 Feb 2025 07:17:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFED010E4A9;
	Mon, 10 Feb 2025 07:17:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FbUka3EM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D95D10E4A9
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Feb 2025 07:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739171826; x=1770707826;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WXNDsagUCMUNN1EFYe6pfymjjuKaGHM/THA0TFr2syQ=;
 b=FbUka3EMPDwJBPxgB4QdqLWTvYNpqy2jb+5WGpEYch1A6FCEQmFsZRPr
 rGp3UgVxT4P9jEu14FJjj37VQLFs5BPvNDAtedzNhJob44X9g5OgBeszD
 Cwu4LmX+fKc2ISd9lvILUtLiiu922skFVs+0qB8piLJmK5AU3+B6CRKBD
 E0ChZJVaG0EQK9GUooNoVbB0CxxETq1vAbD02LBPCY+sWjbki9zNKfdkM
 Yqzog50UigQR8er1+QaGgqfLulptJf58mtOnwMApFChz2WAsk5XGpOQgc
 9QZnN0CM3xEP14md00zU8ScVf1rf1s5Qy9lD/4V+o/fiNBP/npusTo8MC A==;
X-CSE-ConnectionGUID: BkaTa2rUQvq5EofD8PAsdg==
X-CSE-MsgGUID: 7iRO5wvzQiWJuXYtFtR1zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="43664811"
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; d="scan'208";a="43664811"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2025 23:17:06 -0800
X-CSE-ConnectionGUID: gzjLAOLvSQymO4/YEAVfCQ==
X-CSE-MsgGUID: 5k4QBTc6S4qhyc6RFSQJNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117312840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Feb 2025 23:17:06 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Sun, 9 Feb 2025 23:17:04 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Feb 2025 23:17:04 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Feb 2025 23:17:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QoMpYhitVq121hh3RLe17m+JSHh7NNS9/WIRtTCJK8W/phncd6f5zTn0UdNy9oON32t+YN1bKMQXei0J83FIwJAYkgYplm3qwaXJl4pdhYrA2aMYPaIlnXLLN8b2Ocz+bOP/evTMOmDt3XDZ6Tlt8ihSSr8mCrpuQ7lUTr9x5HHFIiwdqO7ZGup0NjIwYPJlKbNC5kRROhUqsvVJBXAFd9bOsr0fZMvC0jp25yUw2bnXaqLRlu3uxBSjKX+wtaafp6bwicIPQll0C9kHZU+I0fmGK2+aD7cEYfVoLRx0s/8l2hEnkUsL82mnkBYmnL47J9zTtZlv8e2XyP/1+fzA2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Fefz8UXKU4QlVqFtPnHprhfNiJR/SSpT3CMKi0ihzQ=;
 b=XkzeDAKgu/PhjUrFHBkGAQetmKEjxW9amnF6ZWXX8cFK5vOJPa5bhRkXHnqRx4CwF0mZJIrQL3KB0FSW1QMfeGyjy2YD/mTbU8MG06+vFu1rg54w/4giV5v9PsE46OQ8mCBgFcO4ZsnwcZ0y5ljqQS0lCJnczDv+Aq/SBKVAHsSvMztvJ25oR8FY/Y+j3KbWaDnyffbZv8MSsxPyzIodW2HT3Qyg/MsflWnBfUUa5ZaKcXp5ybKfGB26NMpYoK06t7tdlyRY7evhS1tNtIIrPRtdoxule+gCwk1Ynpn64CuzWWfDY2MOAY2FAu0u9VFpWcOTsPM+5KqorzHw4nqVAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB8164.namprd11.prod.outlook.com (2603:10b6:8:167::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 07:16:42 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8422.010; Mon, 10 Feb 2025
 07:16:42 +0000
Message-ID: <5a6c2b35-666e-4146-9ddf-78fd1d8458a0@intel.com>
Date: Mon, 10 Feb 2025 12:46:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/5] tests/intel/kms_mst_helper: add helper for
 MST-related functions
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Jeevan B <jeevan.b@intel.com>
References: <20250203081241.659139-1-kunal1.joshi@intel.com>
 <20250203081241.659139-3-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250203081241.659139-3-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB8164:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e5556f-14c0-4c73-a2e1-08dd49a2de73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmJFS3pJY045dGEyd05ud0RuaElFN05EUlovQmNFSWg0TmtDYXdRTUtMaUYv?=
 =?utf-8?B?cG8wT3B3eFRXMythbVYvNWVSRS9IOXM1c2JPM2VIN3R2QnJJNnNMSzB1VW83?=
 =?utf-8?B?K2l0Qm1Halo0ekl5UkNYbWEwSFI1L05iRHhrbHZTV1djNFc3NFlRajhPRnJk?=
 =?utf-8?B?bjZBWG9zWG0xVFgzVURiTXljak15UHl3NVd0N0JSY3VRdHhJNlZJZVZxMUM1?=
 =?utf-8?B?RnIwQ0xzV1BrbmlqcXZidkhiQ1BmNG9ZRncyS212bVYrQlp0bHBZNXdBeFNP?=
 =?utf-8?B?ci92eWRrdXJoK2ZHZUhVMUpNWmVNUjR2a3JRTG9LamZoWlEvVEhBWUwrRTFw?=
 =?utf-8?B?ZlhoZFNWSkxnbFNyN0hvTGwxblpMdHd5cHJ3V0VENW52bEF3VlFhaVdOSldH?=
 =?utf-8?B?T2VndXl4SWUwZUlGQi8xZWM3Zlk5VTJxUXFxVmJma21OcnkrVW9relB5SDMz?=
 =?utf-8?B?RnJaa2txSXNpbVBxUHl5bk5nZE9BendZTmdUNFA2dG9abUVNYWw4RWJvTTNM?=
 =?utf-8?B?Z28xSHZYeVpNa1FmdzR0a3VOUnlrak5sWjQyUlkyZmlOUTZyMXVITmNYMktt?=
 =?utf-8?B?cGgzTHJ4TkhTeHpmY3lKS2IvZWpRbC9yTTMrSGJybHg5d2RiNG1qbWgvcHE0?=
 =?utf-8?B?OUZtNFUwdm5ybzl6b2FTMXI3WDI5TXNIdXB2T1JmaVVQZDRmdytzb2I2VG1a?=
 =?utf-8?B?cUZRYk1FSWkzOFZNMW9EZENtKzR0bWhQZTQ2dnIzUlZaVENYbEFpeDVnVGgv?=
 =?utf-8?B?OW5UUTNjNW9RcjZjWTI5VStFYTZ6UWJKUmFSZGhlcFl0ZnFVN0dMOE93Tk43?=
 =?utf-8?B?bzF6MGVBM24rd0NGN3VpaXRrWkNiNGNXVURsaU9kOEkyOUN1M242YTNEc3Fw?=
 =?utf-8?B?NkVMZTdTaFZJNGdyMzRkL0RPQnRTTmM2MlFUWVdvTU9TYWRuL3R4djZlWnRh?=
 =?utf-8?B?ZDYzbnRKRG96YWRaOHdWVFhaWU1BWTBXZ29UTCs4Wk4yMS9zeityOFVjMzM1?=
 =?utf-8?B?eFc4aUIrRVVzQk1xZGprMzFabU9QTGVCc0NySDdXck9tRm1PUStKVXpBR0pP?=
 =?utf-8?B?cDBwUm9Qc1ltWi9GRi9RRFZzUENkYnN0UnR6ci8zbm1HUWhwT2hNdzhFVkk3?=
 =?utf-8?B?VkFuWFVyWTJWK0xTYXYwTDhUL2plUFUxdXNzT2NlRVlXQWVXUWw0NkovMEFW?=
 =?utf-8?B?Y2dhYnFna1F0Y2RtZ0R0bmFjYTgwblVxUFRKaFFYdWdUUlFkVWp2VU5xOU41?=
 =?utf-8?B?YmZoTkVocFRIM0FxaFFHc1BJTXRUN2xuN3RZVzNxQXdZcUhRbGhWVHQwN2Ew?=
 =?utf-8?B?T0pER1AyS2hIMzZzUXJoVDJuUW5qcTFLSkFuVFd2eHpkY1VTdkNiTktoNlll?=
 =?utf-8?B?Z1FiWjBxTWgwb3VraDNNOGdLblFubG5kNSt2ZHZSWjM5eFJmdC9HdUhkMDlm?=
 =?utf-8?B?SDZoY2xZbnFxQWllMmt6T3J6RUZBMGxMTUVLZVcxcTh1NkdGZTV1dFJqNXJK?=
 =?utf-8?B?WktwZ1g3MkdrdXFwQTNLNjJFUFpPWWZkU3VjelpmS3ROalIxc1BMcmNmZHUv?=
 =?utf-8?B?dWxCMlEyRVBieDFTY3N0a1ByWGx5TE5SWEQxSWNBY1NtMUQ3Nk9SN29heURo?=
 =?utf-8?B?L3JmaHFVclNMNzV4NzkzWkVBcmY4Q3J4L002dTdLRjgwZWJ1ellVUjVBdUdT?=
 =?utf-8?B?QUxmbE5mT0VObEFpWUNKSzRHRUJ6VWl1U1NNMHdlM3o0YkxFNEF6NGJGdk1r?=
 =?utf-8?B?cUFjNFNBMW03R3dVbTlQTUs3QkFORjBiOWlSUWROSE42TWFLcURjMzZjdE1T?=
 =?utf-8?B?NEt2anZtcExOcDZEejR5SmZtS3FNaFA3UHF3Nkh0RmFVK1dxNEhaTTZkamND?=
 =?utf-8?Q?UQkbAv3gkWQn2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGhPeHQ4MUJ0cndPZjNvSkZ5U1c1MXZiNnI5WCtsZjFuaUcwRXNEOFgrTzRn?=
 =?utf-8?B?VVJ1UHNBOHdZVUZtUk9Mcm56R0t1UDRET1RFT2g4UGVERUtwYTEycERUWlVC?=
 =?utf-8?B?VFVWWDBXWW1NckEyWUFqcnpKNXBIdVVQQ2R2WG1DYkw5SWN2UTZVYXRvN25F?=
 =?utf-8?B?UkIvSnlYQU5DTStvdUtjV21KRDUwbFFnTE40NDFLWEJDdEJMeWdvUWJ3dlo5?=
 =?utf-8?B?NWtITnpOTmtJR3k1WmdlM3M3QlVFN3EwUVVSSUJFNUZWdVNPWDZpMWFRZUpm?=
 =?utf-8?B?RnU5UTZLSzAvQkNPVU83eGsrVE81aDJ4TGEwemlOMkNDMnQyM3pxSFNPRGNv?=
 =?utf-8?B?Z28rcGdqZ21rSUhNWTlVOW1MakpOaGl6WUZHc3VnandYY3dZUWtzR0FpTkxa?=
 =?utf-8?B?V0N4S3hBUGhKOGpwYVFkc05na2lqN3NmZDBBK1JrR2pvWmY3ZHIrRG90c3Bj?=
 =?utf-8?B?WVB6bnB3U2JuNVlkZmd5eEFicC96eUx6SkRIT21KOFdqVnRZbVk2N281ZCtM?=
 =?utf-8?B?aCtaemU4dlRHV1QrUGY0aDBwanZmSmxtcWoxZWNoeG1Td1pNcTRtTUl3elZF?=
 =?utf-8?B?ek4zbzl6TkRCWi93Smg3Z0lYZCtPd1lHWjZjWUk0Snlhb29RVnJweWk3bXBH?=
 =?utf-8?B?TDdQakt1QTBNNi9ROFFVN25rc2F6ZFEvMFV5cFViQXk0VHpHeGlkN25uUWZW?=
 =?utf-8?B?TnJNbFhjdTNzbTUzUTVPV2lINEhYcDdhYlppTnhRRWtaaWtyR1d5QTgwY0dx?=
 =?utf-8?B?UTVoblhiQXZyOFpPWHVGZURON0ZXNWNrRUFPZC91S3pRL0RnZW54cGkyVWo1?=
 =?utf-8?B?dnhZaURvKzRaT0g0aWpyMXU0MGdOOGNPVzFwSjlzc0dHdFU4Wm9Semk1Qmsy?=
 =?utf-8?B?SGUwSmZpRUUyejQxdGc4YklJc1JBdUo0bkZ2V0IrQksya2V4dC91UzhQSFdM?=
 =?utf-8?B?RTEyMFhNNEhTRW5QWmc2UmFIak4vbDhBTkQwK21TOUwxWko5eEUrMmx4cXRB?=
 =?utf-8?B?L0xhQ0w0WkpaR0RXTXJjS2JQL2V4NnN4eVFHYkJPZ3N6alJ3VElsR3JkWmdO?=
 =?utf-8?B?NTBQSTFuWE5ubFBrMlZSVit5T1RvOEcwdk9WaTRXc1FXVUs1RnlUYjVYaXJO?=
 =?utf-8?B?ZEVMbUNseDkvR0FRWmJwNmVkVTkrSEVCSi9MdnpjaE54VEZTQXBrZ3lwSlYy?=
 =?utf-8?B?c2dIdkpnTUlTRkhnVTA0NWJFbkNUcXlXM3NtNmNWN1NmMmFXQVI4L2p6REJQ?=
 =?utf-8?B?dk4zVmord1UzZDhuV3JIY2YrSVNSZEQ2SzRTM1dVd0xIVWhkTCtBMTZwOVVY?=
 =?utf-8?B?amViSTFFeWJ3WkZDSnNhQWhvczU0SE5lRTFJQktjZEUrbk4xcFdteUZXY2lo?=
 =?utf-8?B?b1lsWTYvOG53Skpxbi82WmhqRTFMbkxQMEVyUXlTYXNSRUNMRUFYQ2RJMlNV?=
 =?utf-8?B?U20rT01lZ0VKYVV1Z241T05LZTRsNEFvVWgzQS80RHBDUDFxaGNFRVlBa1FC?=
 =?utf-8?B?eFdjQ2h4VHNYR2NGaVE4ZHdwTFFNMnBnRURYY3hFTzU3ayt5cWVJcnlKNjVW?=
 =?utf-8?B?TXNUOW9RbFJjM0FXVWVCcVV5Mm1iY1ZSZVBYVTFnbldLNlJEeTdDbm9wMk1s?=
 =?utf-8?B?ZUNKVmNCV1V2UEUxVGV3Q1pjZW80WEVKdkcxaDRaSjhiTmZPeTJTTG5mY3Rx?=
 =?utf-8?B?U0lpcFdDalVydkJGTlN1MjY5UTVZV0UrOGFZc0ZPN3gvcVREcTdDV25IYmZp?=
 =?utf-8?B?U29vRHcvdXB4eWJMM3F5LzV3MklSblBKWFRVRWEzbWpXYkdCcUk2a250ejl3?=
 =?utf-8?B?M2NCQmtzY3NzVTgxRk9zcXZtampya0JpQVhBWUlIYWh3MWJiYU9tNnJVeC82?=
 =?utf-8?B?S1dFVGQ1anNSc3prT3lXNVpoVmFBWVE2RU9CdzR2dU1LMHVKdUl5bHVETFY0?=
 =?utf-8?B?YVVxc0FlZ2xFajZpam5RYkV5K25iWXNxWjVQb0RTM2VIeko0RlZWaWtMTWtj?=
 =?utf-8?B?Q0hXbGpTUXRUZ240elNEUDJGMnFENkEvaFRFK24vU1lzVlpGRzZqakkxU0Vv?=
 =?utf-8?B?Yk5UZUp0N2xvSG1MazlYeDlvS1MrVXkzSk5WcG1HaG0wK1QzV3R1OHdEVVVS?=
 =?utf-8?B?RjB4ZDRTWlpub3ViOTRwTkxEaEhzMWk5R1pIWlFRd2QrU05YMzAyK2NEby94?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e5556f-14c0-4c73-a2e1-08dd49a2de73
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 07:16:42.5688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sd1bTnY/xvOKNkImVRqn0zK6czBEMRnT8DubIggJvgYJkMCzeSGpo+xpbEeArGC/0TNhIx5n8lW9+wohgMz3zY0iNNEYd7dV+egdoTjFFZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8164
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


On 2/3/2025 1:42 PM, Kunal Joshi wrote:
> Add helper to centralize commonly used MST-related logic.
> igt_find_all_mst_output_in_topology() enumerates MST outputs
> that share the same root connector id.
>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Reviewed-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/intel/kms_dp_linktrain_fallback.c | 28 +++------------
>   tests/intel/kms_mst_helper.c            | 48 +++++++++++++++++++++++++
>   tests/intel/kms_mst_helper.h            | 10 ++++++
>   tests/meson.build                       |  1 +
>   4 files changed, 63 insertions(+), 24 deletions(-)
>   create mode 100644 tests/intel/kms_mst_helper.c
>   create mode 100644 tests/intel/kms_mst_helper.h
>
> diff --git a/tests/intel/kms_dp_linktrain_fallback.c b/tests/intel/kms_dp_linktrain_fallback.c
> index 415005774..bcfb2f0a0 100644
> --- a/tests/intel/kms_dp_linktrain_fallback.c
> +++ b/tests/intel/kms_dp_linktrain_fallback.c
> @@ -16,6 +16,7 @@
>   #include <sys/types.h>
>   #include "igt_sysfs.h"
>   #include "igt.h"
> +#include "kms_mst_helper.h"
>   
>   /**
>    * SUBTEST: dp-fallback
> @@ -47,28 +48,6 @@ typedef int (*condition_check_fn)(int drm_fd, igt_output_t *output);
>   
>   IGT_TEST_DESCRIPTION("Test link training fallback");
>   
> -static void find_mst_outputs(int drm_fd, data_t *data,
> -			     igt_output_t *output,
> -			     igt_output_t *mst_outputs[],
> -			     int *num_mst_outputs)
> -{
> -	int output_root_id, root_id;
> -	igt_output_t *connector_output;
> -
> -	output_root_id = igt_get_dp_mst_connector_id(output);
> -	/*
> -	 * If output is MST check all other connected output which shares
> -	 * same path and fill mst_outputs and num_mst_outputs
> -	 */
> -	for_each_connected_output(&data->display, connector_output) {
> -		if (!igt_check_output_is_dp_mst(connector_output))
> -			continue;
> -		root_id = igt_get_dp_mst_connector_id(connector_output);
> -		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> -			mst_outputs[(*num_mst_outputs)++] = connector_output;
> -	}
> -}
> -
>   static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   			      int *output_count)
>   {
> @@ -83,8 +62,9 @@ static bool setup_mst_outputs(data_t *data, igt_output_t *mst_output[],
>   		    traversed_mst_outputs[i] == data->output->config.connector->connector_id)
>   			return false;
>   
> -	find_mst_outputs(data->drm_fd, data, data->output,
> -			 mst_output, output_count);
> +       igt_assert_f(igt_find_all_mst_output_in_topology(data->drm_fd, &data->display, data->output,
> +							mst_output, output_count),
> +		    "Unable to find mst outputs\n");
>   
>   	for (i = 0; i < *output_count; i++) {
>   		output = mst_output[i];
> diff --git a/tests/intel/kms_mst_helper.c b/tests/intel/kms_mst_helper.c
> new file mode 100644
> index 000000000..9d52068f7
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.c
> @@ -0,0 +1,48 @@
> +#include "kms_mst_helper.h"
> +
> +/*
> + * @drm_fd: DRM file descriptor
> + * @display: pointer to an #igt_display_t structure
> + * @output: target output
> + * @mst_outputs: filled with mst output of same toplogy as @output
> + * @num_mst_outputs: filled with count of mst outputs found in topology
All below these seems to get added erroneously. Please remove them.
> + * @n_pipes: total number of pipes available
> + * @used_pipes_mask: pointer to a bitmask (in/out) of already-used pipes
> + * @master_pipes_mask: bitmask of valid "master" pipes
> + * @valid_pipes_mask: bitmask of valid (non-fused) pipes
> + *
> + * Assign pipes to outputs based on the number of required pipes.
> + * This function will assign 1, 2, or 4 consecutive pipes to each output.
> + * It will also mark the used pipes in the bitmask.
> + *

Need to fix the documentation, doesnt seem to match with what the 
function is doing.


> + * Returns: true if all outputs can be assigned successfully; false otherwise.

Generally bool is returned when we want to check a specific thing which 
has true or false answer.

In this case, we are trying to find mst outputs which can succeed or not 
depending on the config.

Better to return 0 in case of success and negative error code in case of 
failure.


> + */
> +bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs)
> +{
> +	int output_root_id, root_id;
> +	igt_output_t *connector_output;
> +
> +	if (!igt_check_output_is_dp_mst(output))
> +		return false;
> +
> +	output_root_id = igt_get_dp_mst_connector_id(output);
> +	if (output_root_id == -EINVAL)
> +		return false;

Let this change be in a separate patch, in the 
kms_dp_linktrain_fallback.c, and then it will be simple code movement 
from one file to another without any functional change.


> +
> +	/*
> +	 * If output is MST, check all other connected output which shares
> +	 * same path and fill mst_outputs and num_mst_outputs
> +	 */
> +	for_each_connected_output(display, connector_output) {
> +		if (!igt_check_output_is_dp_mst(connector_output))
> +			continue;
> +
> +		root_id = igt_get_dp_mst_connector_id(connector_output);
> +		if (((*num_mst_outputs) < IGT_MAX_PIPES) && root_id == output_root_id)
> +			mst_outputs[(*num_mst_outputs)++] = connector_output;
> +	}
> +	return true;
> +}
> diff --git a/tests/intel/kms_mst_helper.h b/tests/intel/kms_mst_helper.h
> new file mode 100644
> index 000000000..291fcebfe
> --- /dev/null
> +++ b/tests/intel/kms_mst_helper.h
> @@ -0,0 +1,10 @@


Missing License header.

Regards,

Ankit

> +#ifndef KMS_MST_HELPER_H
> +#define KMS_MST_HELPER_H
> +
> +#include "igt.h"
> +
> +bool igt_find_all_mst_output_in_topology(int drm_fd, igt_display_t *display,
> +					 igt_output_t *output,
> +					 igt_output_t *mst_outputs[],
> +					 int *num_mst_outputs);
> +#endif
> diff --git a/tests/meson.build b/tests/meson.build
> index b2a7d7760..b9dd162cc 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -367,6 +367,7 @@ extra_sources = {
>   	'kms_chamelium_frames': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_chamelium_hpd': [ join_paths ('chamelium', 'kms_chamelium_helper.c') ],
>   	'kms_dsc': [ join_paths ('intel', 'kms_dsc_helper.c') ],
> +        'kms_dp_linktrain_fallback': [ join_paths ('intel', 'kms_mst_helper.c') ],
>   	'kms_joiner': [ join_paths ('intel', 'kms_joiner_helper.c') ],
>   	'kms_psr2_sf':  [ join_paths ('intel', 'kms_dsc_helper.c') ],
>   }
