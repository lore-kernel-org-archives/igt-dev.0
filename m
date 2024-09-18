Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E236DFA3758
	for <igt-dev@archiver.kernel.org>; Wed, 18 Sep 2024 07:13:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80E4610E548;
	Wed, 18 Sep 2024 07:13:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LBgRJ7Y3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4581A10E548
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2024 07:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726643602; x=1758179602;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9VCPb/RHKG17b1W0wyc4uqPdgpRQteYlPjCI3iEh72s=;
 b=LBgRJ7Y3OmDody3eFMa6eTWR3K5ZaGCIH89Q4/vzl3fXFsWrao607ObX
 +rUSX+cezRCBOYG2IY39BTr6kd/LEQ7X9Q9zEH9WpuxMeuB5+17Us0aKY
 G/jzHcXYJTh4WPlfByblFtS+7REV6kwdtAx97Y0Sy0/y5tCkA/6YoOC8m
 hbyUML0gAgDH/Qf0qtG+kmaemXRW9OWRQK/lEDPCEOiZazc0R1pR+hzb1
 EoFVo5J4jwrA3UK/1UVB8bUp1AbMAMG4nx2zfEIXIxIUe+UAu1MxQ3gSB
 r21BaLaVlvH+fk06bAYAyKAbO+azCtEApyMyA+IEabQQgTxtdLbslDNrW A==;
X-CSE-ConnectionGUID: lLoL12EmRJSUJLj2juHIhQ==
X-CSE-MsgGUID: cIgM2jeVT9O9SE69yETZdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="48050921"
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="48050921"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 00:13:22 -0700
X-CSE-ConnectionGUID: cy5vLRr2Q4W9s2+AyP5HIQ==
X-CSE-MsgGUID: MNAWagRrR7eQBG1/Tu+Xpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,238,1719903600"; d="scan'208";a="69453995"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 00:13:22 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 00:13:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 00:13:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 00:13:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gSRP2YitnAObPfKijwm298k4/q0F1GDMs5Eqtf87vunlOLp2AbIJJit6s4l/bQ8hcexEJuUhei6p3diyRx9zh91aZVM09dWlvaVlpf9rJO1WZjOHYEfKX6bg2WF71KwvE6U6FWtgT77CwaEqNcwxtG4hO50kLe8OzFmcSne5uCdjB2vOCUz5WanML/u1pMPRcgz3mDhmnbGERalYfoFPVTtix5IoFzLBfMcSPqWrOEWvEGtSOuIeU/3+wHdi2VEAwyFCCXRdkrpx+lyPkMIaD4jrYEASYvA8k0TT0jy0J2l4RGtIxow2pLSivXtuOd4SiGsv/HQ6F42RSo4eybGCSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1U7S0N12VzjDD5c7Vll2qMbKSNhHCSkRCJ7vo6bvd8=;
 b=FbzjRew1DWCgwi65r+/QjjNbHL1M4o9H0DvtPhhVn3yCA47TA7NrURMFHqWfYwv5w1r3mRVNXoe14jUVi8wIvx9Hl/AO7zQ0uPQF2uqiGIfL1Bk9hlnpxDMBIdoIDvr8lwNN29OuYRGr88EE+Qo46XU/r8c4Zgrc6P1UStIyMDnjybPourp/AYeiKMwwloo2opaJcNap9/7N0BGMT0mJSbUJ2YW3f1AOuO7rEueWs4bL6QKa+BG/E37pS+pSy3OOOT0i1+BaQLScGO/LrZIFE/94s6gGPY1GsKJfkYvYLyVjEPN8DorOXm95HDG6mAzQdUy0+hV8ouJgykJsIdzEwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SA2PR11MB5211.namprd11.prod.outlook.com (2603:10b6:806:fb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 07:13:18 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%3]) with mapi id 15.20.7982.016; Wed, 18 Sep 2024
 07:13:18 +0000
Message-ID: <9b8a90ba-b31c-4a40-a501-5269fa9e00e7@intel.com>
Date: Wed, 18 Sep 2024 12:43:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 1/3] tests/kms_joiner: Add tests for Ultrajoiner
 validation
To: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <ankit.k.nautiyal@intel.com>, <kunal1.joshi@intel.com>,
 <bhanuprakash.modem@intel.com>
References: <20240911072204.22825-1-karthik.b.s@intel.com>
 <20240911072204.22825-2-karthik.b.s@intel.com>
 <ef73dc37-0556-47e6-8953-8c3ad3ca9140@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <ef73dc37-0556-47e6-8953-8c3ad3ca9140@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0060.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::14) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SA2PR11MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: d07ea00e-0ff7-4286-126e-08dcd7b15e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?elJZbmw4R0EvTm1IRVVCVU5ycjdnK2NFOGp5NWppMUQ4RHFvZWE0NHQyR2FL?=
 =?utf-8?B?bVZTRTJ6Q1duWFpybDVRTFJabUUzSE9uWjJnTXV3d1lBUmNiM1JtZmFtNkY1?=
 =?utf-8?B?VS9nSUpxRHNTN2t0MVd0bVMxYzk1cGtncWMzNTFkdXl4YUZQWVBwVFNNZmta?=
 =?utf-8?B?N1EyZlp6QXkzN0VtU0FWYUFlZVBxNGtQSERLK08yZG4vTS91ZEdPb0hmang1?=
 =?utf-8?B?UTVJY1pNaklkZk9zdzBKY1JDNUgvei9ocENBMUhrUmNFWmhvWC9KdTBZSmhm?=
 =?utf-8?B?TXJyL3ErSnlDQUdyNWZLMWJ2TlRBUi9OeThJejhYTllVY0NaLy9ROXlhUXhj?=
 =?utf-8?B?dXZONWVGYms4YUtHYitPUnhaUzNwR01rWWl5a1VuMGJyNFZsSmgxUW9YaERS?=
 =?utf-8?B?Mnl2TGJsUmp5TnMxK1ZtbDJTc0REVmt4UWIxb3NSV3dBZnhEbFZNc2FlUDl0?=
 =?utf-8?B?ZCt5bWhmUXFmSUJqcmNTek1hZ29yRlFPeHhhNjF1Y0JRbVpyVlRpdFFSNy9w?=
 =?utf-8?B?c3VjeWxXbWJJTEVWcnVPaDVTK01JUFRleFhsbFgybVdadVpLSWRNNVVLQnF1?=
 =?utf-8?B?cHhtQ2Vwc3JUTHlCOTRjaW8yaFdIVzRFZXQxdlIrYUR6aWk4UTJKcldLMVNJ?=
 =?utf-8?B?Qkk5WEMxU09vVUQvLzBmMnV3OFdwaCtzSGJ0ZVhVUTRzR3cwTjVETnhiRWFP?=
 =?utf-8?B?R0FXUHVZblIxeUtXNGs0M1ZGcGY2UjBMamNIekpWaVhTNXpoVTdVcGVlT0V2?=
 =?utf-8?B?czFKZmxqY2E4THoxODE5Sll4b1JFM3Q0UHhhL29JT1djUUVZRzVSTS91NVRk?=
 =?utf-8?B?Y2VwRGRhUk5EN3ZIMlprNE9NY1NURTQrQmFqK3B2M3F0TW4vZmsvYjkxR2xq?=
 =?utf-8?B?Mmg5L25QMkxHVEZUcDAyVUZoQXNYSm83dnVzUStSSVpXYjhTT0p3c2ZBd2lP?=
 =?utf-8?B?b1FFTTExMWtBS3kzNmpjUDVxam50RFE3RnJQYkVYdzc2STNkeDFRQVVxQXlp?=
 =?utf-8?B?UzJ3WXJJMXZ1TDdNUjdVdGh2RUFPZzZ6Smd0OWlGNWRqTVhvT2RONnRQVFRB?=
 =?utf-8?B?clBhL0F1T2hHa3JXZ0FLeE80WjhQeERtbFl4RFU1TGlzQXpXY29Rbnlqajcx?=
 =?utf-8?B?Tk43bVo2Y0RCWTlyWDlFT2VCZmxVY3NqVTRkYmtjV1dQditoQUFUOXpwYjZl?=
 =?utf-8?B?Z3hMdGNydkFwVE9zSCtMYWtvODNqNVdScjF5RWFYR0MxNzB1RVBIdXdRT24z?=
 =?utf-8?B?UGhsakROcG1lQnc3SmttenpZSno0T3AzaHdrRlgrYXhJV21YeXBGVjd0R2ZJ?=
 =?utf-8?B?UFJ4TWk4bzFVWlZWLzFqRkphLzZOK1kvNmN6SnFKbkZUT1FxZTZpSzhjTldy?=
 =?utf-8?B?RVFTMDlHUVR1VFZVSk9XT0hxaXV0dGk5WVU5SFI1eERnY0J3WmxXYlkyZXoz?=
 =?utf-8?B?VXF2VHI0UmNzZEJ6MUxySzZSdXFCOWdaMWoySDA1STBqMlYwZUxWNTdRTU1N?=
 =?utf-8?B?MzlBeHZHWG5YUFhWd2crOWdnRHp4RHF4VUs1L2JXNmhud0xMcnQyTHQ2a3Qr?=
 =?utf-8?B?L3A2eGw0VTZkRGg5MWdWYjBiMk5uQzJidjFaTjhKa3c4SUNrNkZPa01pcVRw?=
 =?utf-8?B?OUlob0JOQTMrVmowY0VlRXdOcU5iNTBlOTdhSmI1RkhVT2tQTlF1MVE4aGJF?=
 =?utf-8?B?Z2pTSUxINmtpSTBTdHBrUkMvZHRMaWNFZHFlUGRSTVQxMXpuYjIrR2ZiZ1B0?=
 =?utf-8?B?R0E5eUNiSHlwTmk4VWd5dnIzVVlWZG9Pd3R3Z3pyQTB6Vjdkc25pWGRPaXh6?=
 =?utf-8?B?ZlJzamlHSkZ1NnlPYlErQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVlpNFQ5Ym15VHVWKzFkRVM0Zm1icnFZZ1dQcHEzZjN1Wm5xbDBjcE9uOWpP?=
 =?utf-8?B?dEVwNW13cWVvTWRzd2NNcUlvbnpTR0k2ZVJYVnBNMzhMVVZVdS9wclJQTXZl?=
 =?utf-8?B?Z0VvVEVGRUVvU01NUHFWMTQxQ05YcG1tQ2J2Vm1GcjkvK3diOFlnOVh5UkYw?=
 =?utf-8?B?YnRhM0kvUUd3WjNDSTgxYis5c1FhRXFZc09HbG02bHdoR1RZTU4vMDJZaGRw?=
 =?utf-8?B?bjNVR2UrSWU2QzRxYlBQSWFCWlQ4bXJjdENnUmdyVTJ5bC9HVTRrcnkxakJl?=
 =?utf-8?B?Q2t0SzdKblorVXE1bkJPSlBEbmVFQXRWcGtvVW5zSmlLZDMvUWpkdUVhblN0?=
 =?utf-8?B?clJEQ3VSZVV6NU04Nm5kTHJzKzZFUkFMTzJQZk1VUFR1U3N2NkRBemRXd1B4?=
 =?utf-8?B?bTBGSmk1bFZOU0FVdk1CQlljdDhpWHQ5Ryt6N1VTajFyWFBQZnVlZDBFZDhZ?=
 =?utf-8?B?dXkxRmYwU0Q3QjdQZXpjWFlnby8vY3pQWTEva1E5REtwZ1d1Q3RncjRSS09S?=
 =?utf-8?B?YzdvZzl2emhNS2t6Wi9hZWxRRXJBOTNXM0MyMTVqT3ZYSnN0VmhrMGZGTVB4?=
 =?utf-8?B?V3JqeUVVVzluVk1Cb0ZCZDE4Z0Nob2lOVDJPdHJkTkJLSjY4eTdYeDZHVWtw?=
 =?utf-8?B?aXBZTEF1RGxJZWRmZjNPTElYYVBrT05mY1B1SUJnL0huUXlCNEpJb1pmVDZS?=
 =?utf-8?B?RmxUa1pKSThaWEFXRG5GengwRkw1VXZVREhZZkxRWHh6UG1FMndMWmVUcVo4?=
 =?utf-8?B?b29NQ0lYSmVZTFRoYnhBVlh6YVZ5NDQ5V2paekJWQVBUMTJFTDJIWHhIN1Vq?=
 =?utf-8?B?RDVPRGRVRWU2WVN4UTg2aFpqL3JMRjByOWJtL2hWODh0SFRaanVkdUFWbGxM?=
 =?utf-8?B?OTNydFViWU9BMzh3SGNXRjk4czRBdkdqdVhFYUVZcUV4MWZRRDllbE5qWnU4?=
 =?utf-8?B?OGJqa0dTNDgyQk5ENEpVYUIweklwWXQ1WGZ0SnFkMG00aElJY3hxR1V1OWxK?=
 =?utf-8?B?VFFoYmdiOFJkdE5vN3BQV1VqTVI1TzBHSEpBVlVtMnAxSWdJckZGcm81em5I?=
 =?utf-8?B?d0xaZVBNK0ZyS2Y5QmwvZTVSbUVQV2VsSG9sWXNvMks3OHY5MEwzTm5sYXZW?=
 =?utf-8?B?cDBVVVNlWGNtSFExbi9sRVh5OEc3V0ZRRDFlb2gyVzRjblpVd2FYeTBWclNT?=
 =?utf-8?B?S2M5eW5TeHd0dm9Mamh3czBxQkg5UUh5TmJLdWY3ZWo0VlB2Q3l3Mi9aU1cv?=
 =?utf-8?B?OWhJQ25YK3c3RmFTNXV1WHdXeUhTejd2cFZZZnJtNkU4cEU0V2NNTzlrMmxy?=
 =?utf-8?B?TkJaeHkzbEVHVHEvNXBpZ0VTcy8rUWVvQkxUdEwzVWVSN2xmRWt2MXErdFBI?=
 =?utf-8?B?WExTYlYrNUVzVG0vWlFIZ282cklMMUxWL2ZiUU9MMm1iYWluTFhVd3BabGhQ?=
 =?utf-8?B?OWdNWXZpTG51ditONjlvekVERitQdnJHMFRiV2MyZUdFWkpxeWp5czhzM0I3?=
 =?utf-8?B?cGpQMGREQllvVjN4TE9scWRiUWFrNmI3NmxlV1hQNTR3UjMvTDNEbjJQWXJ2?=
 =?utf-8?B?OGcvREs4YkltZlRCcEViSG9MSnNkekwvTE5ZeC9VOXZsVzlPbmhuam1OT1dp?=
 =?utf-8?B?MEZBd1lXL0QreEJDazE2NjBnUkRLY3VJVU1PVERwRlA4M0VNS2thMUdBbWhZ?=
 =?utf-8?B?ODBBREIrSTZ6dWNjcWp3OVpVRndjWU1Qc1hGbCtwV0FweldwVzJadmlFUmtV?=
 =?utf-8?B?blVONnV3b2d3S0c0U3JOOWxsemhCamgzRlg3S0x2eThOWFNjTGVhNkVoZGwv?=
 =?utf-8?B?UmUyVlZhTnRGZG9XQ1VRYWNJMldDZlVPUWJkcmdSWHNJR3YxYWVlZ2xEN003?=
 =?utf-8?B?blN4Y0s2ZXVYUi9xS241SzQ3cXpDTVZNRnlZcTlMMlJGREZUQlpNZFYveVJY?=
 =?utf-8?B?cWtyTlVhblpWZ3UwK2REcU9JMWJGWDZQRVRnZzJCUnd5ckFXS29kc243SVB1?=
 =?utf-8?B?WkI4L1NJdVViK0FvbXp5WWRKL0NQQVVWempLbmVOKzZ0VnlxNm03T1VuOUpt?=
 =?utf-8?B?QXF5N21IKzhuSy93dlZ2RGJkNnJwRW9uUFUzdVF5aUNBUGlqTFpkNjZZd01z?=
 =?utf-8?Q?S0JM9Y8WUH+87TZlxJbZKyOof?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d07ea00e-0ff7-4286-126e-08dcd7b15e6d
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 07:13:17.8602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SjPHxwmFruq3MagY25YWoFn/rg/2k64BeMtlLJrYhA8Q9H9m0TnXC0b6jMRnAxPNSx/+6WPs5/d/RvhLZVzKmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5211
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


On 9/17/2024 10:36 AM, Reddy Guddati, Santhosh wrote:
> nit, IMO guard the array boundaries against overflow, otherwise 
> overall changes LGTM.
> Reviewed-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>

Hi Santhosh,

Thank you for the review.

>
> On 11-09-2024 12:52, Karthik B S wrote:
>> Add a subtest to validate basic ultrajoiner modeset and a negative test
>> to validate invalid pipe configs during an ultrajoiner modeset.
>>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   lib/igt_kms.c                                 |  44 +++++
>>   lib/igt_kms.h                                 |   3 +
>>   .../intel/{kms_big_joiner.c => kms_joiner.c}  | 150 ++++++++++++++++--
>>   tests/meson.build                             |   2 +-
>>   4 files changed, 183 insertions(+), 16 deletions(-)
>>   rename tests/intel/{kms_big_joiner.c => kms_joiner.c} (74%)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index dd530dbab..cf453dcfc 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -6347,6 +6347,50 @@ bool bigjoiner_mode_found(int drm_fd, 
>> drmModeConnector *connector,
>>       return found;
>>   }
>>   +/**
>> + * igt_ultrajoiner_possible:
>> + * @mode: libdrm mode
>> + * @max_dotclock: Max pixel clock frequency
>> + *
>> + * Ultrajoiner will come into the picture, when the requested
>> + * mode resolution > 10K or mode clock > 2 * max_dotclock.
>> + *
>> + * Returns: True if mode requires Ultrajoiner, else False.
>> + */
>> +bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock)
>> +{
>> +    return (mode->hdisplay > 2 * MAX_HDISPLAY_PER_PIPE ||
>> +        mode->clock > 2 * max_dotclock);
>> +}
>> +
>> +/**
>> + * Ultrajoiner_mode_found:
>> + * @drm_fd: drm file descriptor
>> + * @connector: libdrm connector
>> + * @max_dot_clock: max dot clock frequency
>> + * @mode: libdrm mode to be filled
>> + *
>> + * Ultrajoiner will come in to the picture when the
>> + * resolution > 10K or clock > 2 * max-dot-clock.
>> + *
>> + * Returns: True if ultra joiner found in connector modes
>> + */
>> +bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>> +              int max_dotclock, drmModeModeInfo *mode)
>> +{
>> +    bool found = false;
>> +
>> +    igt_sort_connector_modes(connector, sort_drm_modes_by_res_dsc);
>> +    found = igt_ultrajoiner_possible(&connector->modes[0], 
>> max_dotclock);
>> +    if (!found) {
>> +        igt_sort_connector_modes(connector, sort_drm_modes_by_clk_dsc);
>> +        found = igt_ultrajoiner_possible(&connector->modes[0], 
>> max_dotclock);
>> +    }
>> +    if (found)
>> +        *mode = connector->modes[0];
>> +    return found;
>> +}
>> +
>>   /**
>>    * igt_has_force_joiner_debugfs
>>    * @drmfd: A drm file descriptor
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 25ba50916..4455632f4 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -1216,6 +1216,9 @@ int igt_get_max_dotclock(int fd);
>>   bool igt_bigjoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>>   bool bigjoiner_mode_found(int drm_fd, drmModeConnector *connector,
>>                 int max_dotclock, drmModeModeInfo *mode);
>> +bool igt_ultrajoiner_possible(drmModeModeInfo *mode, int max_dotclock);
>> +bool ultrajoiner_mode_found(int drm_fd, drmModeConnector *connector,
>> +              int max_dotclock, drmModeModeInfo *mode);
>>   bool igt_has_force_joiner_debugfs(int drmfd, char *conn_name);
>>   bool igt_check_force_joiner_status(int drmfd, char *connector_name);
>>   bool igt_check_bigjoiner_support(igt_display_t *display);
>> diff --git a/tests/intel/kms_big_joiner.c b/tests/intel/kms_joiner.c
>> similarity index 74%
>> rename from tests/intel/kms_big_joiner.c
>> rename to tests/intel/kms_joiner.c
>> index 7c370bc60..633bf51c7 100644
>> --- a/tests/intel/kms_big_joiner.c
>> +++ b/tests/intel/kms_joiner.c
>> @@ -37,13 +37,20 @@
>>   #include "igt.h"
>>     /**
>> - * SUBTEST: invalid-modeset
>> + * SUBTEST: invalid-modeset-big-joiner
>>    * Description: Verify if the modeset on the adjoining pipe is 
>> rejected when
>>    *              the pipe is active with a big joiner modeset
>>    *
>> - * SUBTEST: basic
>> + * SUBTEST: invalid-modeset-ultra-joiner
>> + * Description: Verify if the modeset on the other pipes are 
>> rejected when
>> + *              the pipe A is active with ultra joiner modeset
>> + *
>> + * SUBTEST: basic-big-joiner
>>    * Description: Verify the basic modeset on big joiner mode on all 
>> pipes
>>    *
>> + * SUBTEST: basic-ultra-joiner
>> + * Description: Verify the basic modeset on ultra joiner mode on all 
>> pipes
>> + *
>>    * SUBTEST: invalid-modeset-force-joiner
>>    * Description: Verify if modeset on adjacent pipe is declined when 
>> force joiner modeset is active.
>>    *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs,
>> @@ -54,20 +61,24 @@
>>    *        Force joiner applies bigjoiner functionality to 
>> non-bigjoiner outputs thus,
>>    *        the test exclusively targets non-bigjoiner outputs.
>>    */
>> -IGT_TEST_DESCRIPTION("Test big joiner / force joiner");
>> +IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>>     #define INVALID_TEST_OUTPUT 2
>>     typedef struct {
>>       int drm_fd;
>>       int big_joiner_output_count;
>> +    int ultra_joiner_output_count;
>>       int non_big_joiner_output_count;
>> +    int non_ultra_joiner_output_count;
>>       int mixed_output_count;
>>       int output_count;
>>       int n_pipes;
>>       uint32_t master_pipes;
>>       igt_output_t *big_joiner_output[IGT_MAX_PIPES];
>> +    igt_output_t *ultra_joiner_output[IGT_MAX_PIPES];
>>       igt_output_t *non_big_joiner_output[IGT_MAX_PIPES];
>> +    igt_output_t *non_ultra_joiner_output[IGT_MAX_PIPES];
>>       igt_output_t *mixed_output[IGT_MAX_PIPES];
>>       enum pipe pipe_seq[IGT_MAX_PIPES];
>>       igt_display_t display;
>> @@ -286,6 +297,81 @@ static void test_joiner_on_last_pipe(data_t 
>> *data, bool force_joiner)
>>       }
>>   }
>>   +static void test_ultra_joiner(data_t *data, bool invalid_pipe, 
>> bool two_display)
>> +{
>> +    int i, j, k, ret;
>> +    igt_output_t *output, *non_ultra_joiner_output;
>> +    igt_plane_t *primary;
>> +    igt_output_t **outputs;
>> +    igt_fb_t fb;
>> +    drmModeModeInfo mode;
>> +
>> +    outputs = data->ultra_joiner_output;
>> +    igt_display_reset(&data->display);
>> +    igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +
>> +    for (i = 0; i < data->ultra_joiner_output_count; i++) {
>> +        output = outputs[i];
>> +        igt_require(ultrajoiner_mode_found(data->drm_fd, 
>> output->config.connector, max_dotclock, &mode));
>> +        igt_output_override_mode(output, &mode);
>> +        for (j = 0; j < data->n_pipes; j++) {
>> +            /* Ultra joiner is only valid on PIPE_A */
>> +            if (invalid_pipe && j == PIPE_A)
>> +                continue;
>> +            if (!invalid_pipe && j != PIPE_A)
>> +                continue;
>> +            if (two_display && j != PIPE_A)
>> +                continue;
>> +
>> +            igt_output_set_pipe(output, data->pipe_seq[j]);
>> +
>> +            primary = igt_output_get_plane_type(output, 
>> DRM_PLANE_TYPE_PRIMARY);
>> +            igt_create_pattern_fb(data->drm_fd, mode.hdisplay, 
>> mode.vdisplay, DRM_FORMAT_XRGB8888,
>> +                          DRM_FORMAT_MOD_LINEAR, &fb);
>> +            igt_plane_set_fb(primary, &fb);
>> +
>> +            if (invalid_pipe)
>> +                ret = igt_display_try_commit2(&data->display, 
>> COMMIT_ATOMIC);
>> +            else
>> +                igt_display_commit2(&data->display, COMMIT_ATOMIC);
>> +
>> +            if (two_display) {
>> + for_each_connected_output(&data->display, non_ultra_joiner_output) {
>> +                    if (output->id != non_ultra_joiner_output->id) {
>> +                        for (k = 1; k < data->n_pipes; k++) {
>> +                            igt_plane_t *plane;
>> +                            drmModeModeInfo *mode1;
>> +
>> +                            mode1 = 
>> igt_output_get_mode(non_ultra_joiner_output);
>> +
>> + igt_output_set_pipe(non_ultra_joiner_output, data->pipe_seq[k]);
>> +                            plane = 
>> igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +                            igt_plane_set_fb(plane, &fb);
>> +                            igt_fb_set_size(&fb, plane, 
>> mode1->hdisplay, mode1->vdisplay);
>> +                            igt_plane_set_size(plane, 
>> mode1->hdisplay, mode1->vdisplay);
>> +
>> +                            ret = 
>> igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
>> +
>> +                            igt_plane_set_fb(plane, NULL);
>> +                            igt_assert_f(ret != 0, "Commit expected 
>> to fail on second display\n");
>> +                        }
>> +                        /* Validation with one output is sufficient */
>> +                        break;
>> +                    }
>> +                }
>> +            }
>> +
>> +            igt_display_reset(&data->display);
>> +            igt_plane_set_fb(primary, NULL);
>> +            igt_remove_fb(data->drm_fd, &fb);
>> +
>> +            if (invalid_pipe)
>> +                igt_assert_f(ret != 0, "Commit shouldn't have 
>> passed\n");
>> +        }
>> +    }
>> +}
>> +
>>   igt_main
>>   {
>>       bool force_joiner_supported;
>> @@ -297,7 +383,9 @@ igt_main
>>       igt_fixture {
>>           force_joiner_supported = false;
>>           data.big_joiner_output_count = 0;
>> +        data.ultra_joiner_output_count = 0;
>>           data.non_big_joiner_output_count = 0;
>> +        data.non_ultra_joiner_output_count = 0;
>>           data.mixed_output_count = 0;
>>           data.output_count = 0;
>>           j = 0;
>> @@ -310,24 +398,31 @@ igt_main
>>           max_dotclock = igt_get_max_dotclock(data.drm_fd);
>>             for_each_connected_output(&data.display, output) {
>> -            bool found = false;
>> +            bool ultrajoiner_found = false, bigjoiner_found = false;
>>               drmModeConnector *connector = output->config.connector;
>>                 /*
>>                * Bigjoiner will come in to the picture when the
>>                * resolution > 5K or clock > max-dot-clock.
>> +             * Ultrajoiner will come in to the picture when the
>> +             * resolution > 10K or clock > 2 * max-dot-clock.
>>                */
>> -            found = bigjoiner_mode_found(data.drm_fd, connector, 
>> max_dotclock, &mode);
>> +            bigjoiner_found = bigjoiner_mode_found(data.drm_fd, 
>> connector, max_dotclock, &mode);
>> +            ultrajoiner_found = ultrajoiner_mode_found(data.drm_fd, 
>> connector, max_dotclock, &mode);
>>   -            if (found) {
>> +            if (igt_has_force_joiner_debugfs(data.drm_fd, 
>> output->name))
>> +                force_joiner_supported = true;
>> +
>> +            if (ultrajoiner_found)
>> + data.ultra_joiner_output[data.ultra_joiner_output_count++] = output;
>> +            else if (force_joiner_supported)
>> + data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++] 
>> = output;
>     >> nit, IMO guard the array boundaries against overflow, otherwise 
> overall changes LGTM.
>
> if (ultrajoiner_found && data.ultra_joiner_output_count < IGT_MAX_PIPES)
>         data.ultra_joiner_output[data.ultra_joiner_output_count++] = 
> output;
>             else if (force_joiner_supported && 
> data.non_ultra_joiner_output_count < IGT_MAX_PIPES)
> data.non_ultra_joiner_output[data.non_ultra_joiner_output_count++] = 
> output;

As we're only looping for connected outputs here, we wouldn't be hitting 
this case.

Thanks,
Karthik.B.S
>> +
>> +            if (bigjoiner_found)
>> data.big_joiner_output[data.big_joiner_output_count++] = output;
>> -                igt_output_override_mode(output, &mode);
>> -            } else {
>> -                if (igt_has_force_joiner_debugfs(data.drm_fd, 
>> output->name)) {
>> -                    force_joiner_supported = true;
>> - data.non_big_joiner_output[data.non_big_joiner_output_count++] = 
>> output;
>> -                }
>> -            }
>> +            else if (force_joiner_supported)
>> + data.non_big_joiner_output[data.non_big_joiner_output_count++] = 
>> output;
>> +
>>               data.output_count++;
>>           }
>>           if (data.big_joiner_output_count == 1 && 
>> data.non_big_joiner_output_count >= 1) {
>> @@ -337,6 +432,7 @@ igt_main
>>               data.mixed_output[data.mixed_output_count++] = 
>> data.big_joiner_output[0];
>>               data.mixed_output[data.mixed_output_count++] = 
>> data.non_big_joiner_output[0];
>>           }
>> +
>>           data.n_pipes = 0;
>>           for_each_pipe(&data.display, i) {
>>               data.n_pipes++;
>> @@ -346,7 +442,7 @@ igt_main
>>       }
>>         igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>> -    igt_subtest_with_dynamic("basic") {
>> +    igt_subtest_with_dynamic("basic-big-joiner") {
>>               igt_require_f(data.big_joiner_output_count > 0,
>>                         "No bigjoiner output found\n");
>>               igt_require_f(data.n_pipes > 1,
>> @@ -358,9 +454,19 @@ igt_main
>>                       test_multi_joiner(&data, 
>> data.big_joiner_output_count, false);
>>       }
>>   +    igt_describe("Verify the basic modeset on ultra joiner mode on 
>> all pipes");
>> +    igt_subtest_with_dynamic("basic-ultra-joiner") {
>> +            igt_require_f(data.ultra_joiner_output_count > 0,
>> +                      "No ultrajoiner output found\n");
>> +            igt_require_f(data.n_pipes > 3,
>> +                      "Minimum 4 pipes required\n");
>> +            igt_dynamic_f("single-joiner")
>> +                test_ultra_joiner(&data, false, false);
>> +    }
>> +
>>       igt_describe("Verify if the modeset on the adjoining pipe is 
>> rejected "
>>                "when the pipe is active with a big joiner modeset");
>> -    igt_subtest_with_dynamic("invalid-modeset") {
>> +    igt_subtest_with_dynamic("invalid-modeset-big-joiner") {
>>           igt_require_f(data.big_joiner_output_count > 0, "Non big 
>> joiner output not found\n");
>>           igt_require_f(data.n_pipes > 1, "Minimum of 2 pipes are 
>> required\n");
>>           if (data.big_joiner_output_count >= 1)
>> @@ -374,6 +480,20 @@ igt_main
>>                   test_invalid_modeset_two_joiner(&data, true, false);
>>       }
>>   +    igt_describe("Verify if the modeset on the other pipes are 
>> rejected "
>> +             "when the pipe A is active with a ultra joiner modeset");
>> +    igt_subtest_with_dynamic("invalid-modeset-ultra-joiner") {
>> +        igt_require_f(data.ultra_joiner_output_count > 0, "Ultra 
>> joiner output not found\n");
>> +        igt_require_f(data.n_pipes > 3, "Minimum of 4 pipes are 
>> required\n");
>> +
>> +        igt_dynamic_f("ultra_joiner_on_invalid_pipe")
>> +            test_ultra_joiner(&data, true, false);
>> +        if (data.non_ultra_joiner_output_count > 0) {
>> +            igt_dynamic_f("2x")
>> +                test_ultra_joiner(&data, false, true);
>> +        }
>> +    }
>> +
>>       igt_describe("Verify the basic modeset on big joiner mode on 
>> all pipes");
>>       igt_subtest_with_dynamic("basic-force-joiner") {
>>           igt_require_f(force_joiner_supported,
>> diff --git a/tests/meson.build b/tests/meson.build
>> index 00556c9d6..c8cba1b9a 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -242,7 +242,6 @@ intel_i915_progs = [
>>     intel_kms_progs = [
>>       'kms_big_fb',
>> -    'kms_big_joiner' ,
>>       'kms_busy',
>>       'kms_ccs',
>>       'kms_cdclk',
>> @@ -255,6 +254,7 @@ intel_kms_progs = [
>>       'kms_flip_scaled_crc',
>>       'kms_flip_tiling',
>>       'kms_frontbuffer_tracking',
>> +    'kms_joiner',
>>       'kms_legacy_colorkey',
>>       'kms_mmap_write_crc',
>>       'kms_pipe_b_c_ivb',
