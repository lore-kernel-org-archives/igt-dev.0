Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A59DCC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 23 Jul 2024 11:49:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EFC10E587;
	Tue, 23 Jul 2024 11:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aeGZiV4e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8129A10E587
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Jul 2024 11:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721735376; x=1753271376;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I8QM6gVV2+KDuOyaXXiQZ2CarA5QavyuwqICE2K8l0g=;
 b=aeGZiV4e6q4+OG6pOCh9JRYRBP+TquokWmU8gAcuTEVI83ooS8a+fWHx
 eM3HBScE8m9V6gb7EiRi0uGweUbpzcG+7lYIv/Ve39O7SkkT6I+AGrUfV
 iwRUmCVULNK4eb/nZFfcLddneARuzy8LlDaGhffNQHNKv2lhKlXwMPH12
 rxwmA1TosgBb2kJJz3IDQk7c2QBunfm0OOxuYEwxatNZx92YF1h5s/CDz
 pLtya/T/3DtN4S+b02TU5H7hqGmXOxzRSDxV0Ek7FwX/dyIHtoDevfjS5
 Q5lk3XVDnf/BSuhEi8ZxR6XXxZoyeecUvRseALUL44cNuLCAGg4jYlcXE w==;
X-CSE-ConnectionGUID: gflEyoVHRKmN6VUvErt9gg==
X-CSE-MsgGUID: kSWptLcvQd+g8uUMQnmQZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="19489402"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="19489402"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2024 04:47:56 -0700
X-CSE-ConnectionGUID: jfoCnvLGQvWyQE1YV/5ArQ==
X-CSE-MsgGUID: mRFCdHgNT4yNes3b9AHHUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; d="scan'208";a="83223607"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Jul 2024 04:47:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 23 Jul 2024 04:47:54 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 23 Jul 2024 04:47:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 23 Jul 2024 04:47:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BFk9kzKt6VtN4YJG0tT/J8FngKI4GCOOjDNfF75KvHAlxdYH/Vd1tQ+OkosPgssDNLUHO2X4vVi4uPZPdVNCf4A6HmFXqd36IHMiEdM08kmMCSMR4MBcntynXcF3sR7CAOSG4YEai3QixRobtsj5loGNYG9cv9Eu6btmCnF//U6lYMyxk7Mqs4Wnoak5lmkHBvEI+5YREG8Ay5gsmLwsLjYODuB0EHQh5qM6k+8hRsQFiQNbROb877imhZJ0tPr1AHoWCawQPRHDtRd5VCljdwMHk/2q7wWTwf0wAnaqfVNdhCDRizDdrEm5szUbF0VMvGwAW7vMDf5D3oFHrJMr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdDh043+FIitRIlYhPJiQj8AK9JQ6n3tVXO1B+N5UWU=;
 b=xpZACVs3/x6fW1XbG47QwYi2imwVSf2QWnEUH4qRnS7M7jgrosfN2FEgse2S5Y0uV/sZH2iOkIvlwCeOjKeongwUtXN3BeDHHZbT/AQcwOtLheruIRYqYSTubvGh8iD1ZSeoN3v5hdjIJdu4SempyrR3Xvn4X0pwyJbwMnjN71b5FypjzhTw2nck2v/b6DxBAvDR2GW3y/elh5458h6nOxoi5o0juFWGhjzqAfKCULMPi67hSH+oqrVx4TShAFakLqeseOcrkaQ9hrYySDyIyj3IzwMG/wqYvP0PRmVbtPbD0hfqGCG5QWZYMlaA4pibpVfKWz/YHQyf5hHvtXXg3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5719.namprd11.prod.outlook.com (2603:10b6:8:10::6) by
 PH0PR11MB7585.namprd11.prod.outlook.com (2603:10b6:510:28f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 23 Jul
 2024 11:47:52 +0000
Received: from DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf]) by DM8PR11MB5719.namprd11.prod.outlook.com
 ([fe80::9996:d2ce:a20:d9bf%4]) with mapi id 15.20.7762.027; Tue, 23 Jul 2024
 11:47:52 +0000
Message-ID: <459258eb-ead6-436f-b407-c9ab24c485b7@intel.com>
Date: Tue, 23 Jul 2024 17:17:13 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/kms_vrr: Add new test to validate LOBF
To: Jeevan B <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>, <animesh.manna@intel.com>
References: <20240723042850.2651902-1-jeevan.b@intel.com>
 <20240723042850.2651902-3-jeevan.b@intel.com>
Content-Language: en-US
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20240723042850.2651902-3-jeevan.b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0077.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::18) To DM8PR11MB5719.namprd11.prod.outlook.com
 (2603:10b6:8:10::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5719:EE_|PH0PR11MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d8af09e-cc4d-4e7d-7d1f-08dcab0d4892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjhLVFZwcHdBeFpnVUJSYTF2aWY1NEVTV0U2eUlJOEw3SW1CUEFUeTRaMHFa?=
 =?utf-8?B?NVJmaW5BVnVJdDFyM0svMWhBOStoNnRhd2R1YnBsay9yb045NE5tSGE2emZr?=
 =?utf-8?B?K0I2SzAxZWhtQUt5TFlhSWFBcUxCeUZaNSs1amQyR29tU3RwVGhLLytBckx2?=
 =?utf-8?B?UkR4ZFZDaHZyL0hJTWl6OFlyV0ltS1JPZ2UvQ0JlcGNkWmtPSkhLZC9MalVY?=
 =?utf-8?B?QUMwYkN6bHhnTjNScVJzL1gzZDR2ZzJkUXJhb2JwZ1pqWkIxYjNIR1p2dG1M?=
 =?utf-8?B?YVVpWjErLzFSNXlSUUFjTmVBbzlpZEhyOXYrNEl3STczTE9Uc2VSZm4xc0Mz?=
 =?utf-8?B?SVhwT1NaR3ZGMFZRc1lyQTRWVnF3RWhIVWFpaVdFZnFrMGZMT0dONHB3R2lJ?=
 =?utf-8?B?T0pzM0M3T2FWMjdUcVlaK1c3QzQxc1JjUDFkclF1OTJXMDBJOUNlOXdSdXNo?=
 =?utf-8?B?bnpWR05PUlZQOU0vdGV1WjU0T0pkNU85Y1BhcGg2Y0kvZXZKQi9iTTROWTNs?=
 =?utf-8?B?SHZEdFNIUlBLQVUyUlJVS2NBUDNEZ1pWeVByNnRkbmtxdSs4Z1p0ejZNYkpO?=
 =?utf-8?B?c0VIZlRXQlhyMUJYcTR4OUJBc0txZXJUR0hUL2FoVDdkK0FTLzV0cnhBN2R1?=
 =?utf-8?B?bFhIYm02RFJQSUlsZjVvdm0vRmpVbUhEa295N2VZUEtpOXhBejJwQmpHczRa?=
 =?utf-8?B?aG9rQVNkSlJxV0Y4cUoxYlpSTlhFMG9ITmxMZzB0YThHcG1UZGdvUlJwT2hI?=
 =?utf-8?B?WmJLbDA1VG5tbURUakN0bzRTdUVVZStMUm5nazd2UVNuOTdhQU5OZTRuQWpa?=
 =?utf-8?B?V2NFb3J0MVB6aW9seWZiY1BETkZFdVpiSmtpejFZRS9VQnVmcTBFOGZhZ29i?=
 =?utf-8?B?dzVjbWkzTSsvclNTa1p2UHZwbHE5L0FwUlZVaWhDL1RndEJaNGJoSXRzU01v?=
 =?utf-8?B?NlhVZkxURFlyS01HS21nekJBeExuSzU4aTArWUdZYXhpbHVkd29QR3BkSXc3?=
 =?utf-8?B?TWVMTmtqM1NzdTJlaVBRcEc2bkI5NXlwQ3ZJSVIyYWY4SDVOdVhZTURYWUF1?=
 =?utf-8?B?UklsaDFvUDZDaDc4MUVwS3JqT1ZCZGxCN1dCZGI0KzFyTzBHRUpQUk1XMlFC?=
 =?utf-8?B?ZGNiOE1LQ0IveE5jUHVyaG14a1AwTFVub25IazhFbWdyOFd6SGx6REw5RE1j?=
 =?utf-8?B?MzhXdDBRRGhzWDhCQTdSTTd1N1k4QkFOYXlOcXE3eEgxcnpWeWU4L3dZNGJ3?=
 =?utf-8?B?YlBjWEg1TVo2UXd1VXR1eW8yU0VuZWtOOHdOTUdiYUdHQzdSUW9xOFJyUGdG?=
 =?utf-8?B?TkcvZGRJK00waFFOek1td0M1d0RHTDcyWUU4cnhNcVR1VU93anNTYzNFQkYx?=
 =?utf-8?B?WXc2bUdQcHhyVG5PakJxWFp6eXZ4SXh3T1dFOERaTFJHZ2ZHaDZ0c1BEQUNE?=
 =?utf-8?B?UjZMWXB6V0ZjVTRiRUpwaHFocGRXZm9WaStDR0s4YU53eENkZnltQ3Zzemh0?=
 =?utf-8?B?VUVyK2pUNWFWRkUvWmMvTkdUYTdmQ0hKZEN4V3ZOeDRGNWRHRkVjSHNQenZy?=
 =?utf-8?B?UVZLNDJLdUp0N0thS2NJUU5qUHg2c2JxSjBmTW0yQjJRb2xxUklZMnY1RkR5?=
 =?utf-8?B?RFdldHN2VEFLWWlubzhZQ1dWLzMwSjJrbVEzczdLM1RRS2JFcUpEVVBYWFA1?=
 =?utf-8?B?Q0JuN0Zib3RLZGRYNFp6VFZVSjhXK1FpUVZPK0Z6d2QrNUVMeGRIQzlnT1JK?=
 =?utf-8?B?TFUwWitpamJSUW1QOTFNRkorS2tRZFRqaGF2UnppOStydGhDR0FCYktpYjJF?=
 =?utf-8?B?V3BtclErYW5HZkYzVmh6dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5719.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTc0YXRMVC9WMjVGZHBlQWFBQVQvUnBRZm04S0NuK3NuZG80TXQ5RGhuUHBH?=
 =?utf-8?B?d2ZGa3hjRnhyd0drVmQ2OXZ1b3ZKdWQ0TUpOYmNGb0ZDTHJ4aWh5R3RwU2NW?=
 =?utf-8?B?Yms1b1VHcWFTVWRxLys3ME9OM2dwY2hWcDFaL3hoSndOaHlWNVNRbzdVV3M3?=
 =?utf-8?B?dkNjbytTQU5IcnVNSjR3cTFOc3VnZWZ3NVYxNGxCb29tdjhLMytFUjlhWVhL?=
 =?utf-8?B?NWJvUUtvNGhXMVp3djlQYmdZTndhRllWTWhOTE1VZHlIY0xmL25YdkxMMVpC?=
 =?utf-8?B?YWQvRlh2SVJuM1MzZm1NNVA1bnJET3l4d0FuNm9NSzczdTVjMGl0VzBUcGRL?=
 =?utf-8?B?dEtQclY3R0JMR1VDSTA4VER2eXNOZHgwVFdQbkhwZzJRRDc1L0JoWG15MHY1?=
 =?utf-8?B?VkljYkhoNjhsSSszRERueTcxUjlIZVR1K0JqUWt1d0NhN2J1OUtLTlUwaUhs?=
 =?utf-8?B?NVVZNDUzRTdTTGlpUE1XYzRDSzl3a0lieXlsZnJmSnMxbzFCSjh5K0RTLzhK?=
 =?utf-8?B?LzA3Snp5TllZSlQ0OFpnMUpaNW5DaGdkYlBwWnZ0SUYwaCthNDFjQ0F0bkZo?=
 =?utf-8?B?NFdnK2J0Vlk2aTNOdEV6ZCtXUzJwSzFZeHhKdU5HRlg3d2ZPUmxRUFVhSVZt?=
 =?utf-8?B?RVVTdTdJWUVqSXExdE9xR1VlZDZ3QktLM3JMSWhhR0xWazlaTm9EVnNJQmcr?=
 =?utf-8?B?dnkzQlZTaTN4R2VYRHdUUldEdzkzeU1TLzB4SFR2MVU0dUhaTGJlVGl6blRs?=
 =?utf-8?B?NmlydlRzdzRWRlBVY0RMT0RMdnJRUGdvWFRLdFFHbTNDWGh2Y1k5alZmYTBJ?=
 =?utf-8?B?c2NlL0ZpTEEzdEgzd3Y3dXV1S2JLNWZDTDZpbWNZYm5IQ2g5TFRaOUN4dGdN?=
 =?utf-8?B?VEVVSFpxYmFydXNWa2FpajRGbENhR1AzbzNlRmw1Q2RreXBmRFZjdUV6dTRN?=
 =?utf-8?B?ZGY4MHRzN2U2d1lrQjFxVndFY0ZtVUdUM3ZFczVRR2xFVUVPSTlRKzk0NDNl?=
 =?utf-8?B?T3Q0SE9WUXJrMGgwVGxQdnhYdk8vV3JsbWZlVTI0ZnZ2UVZiUkJPdW9pQ0Vw?=
 =?utf-8?B?ajM2cU1vMXRqbmo3SkViVnFGdUQxeWs3ampyYm9ROVNLelN2VVY1MDFzZ0Zt?=
 =?utf-8?B?bGVsMjMvQmQvckxhcklVM0JzRThaazlXNUdMa2Z5UEd2TmkvYVRRek5hcklG?=
 =?utf-8?B?SXlNZzFhK0dpVkpJWkVFb1hUTHplZHlocU1neXJ6V2QwTTVnQURRcGNwTjFN?=
 =?utf-8?B?VTJPT1JhK1hobjRqYm9yWTUvRFRzRTlaWXpBNkNvaFdFeUdhYnRhNHlaRG1Y?=
 =?utf-8?B?eW9wUFZiUXlmVE1RNVNYejlsVDJOSzhZMjZXSzVUUWxKT1p4VXI0WDBvNnVH?=
 =?utf-8?B?OWkzSzVjYkQ2QVhVdExGeHRHM29EVG5kaFlZTFk0ZnVyVkxlaXVpSnV0Zit6?=
 =?utf-8?B?SThWdHpjMnFnKzMrb0tOd0t1SGpWZTE3M3hkeFF1Qm9WMSttWnpqRUNWNWlx?=
 =?utf-8?B?Wm5PRFpkQ2R6d3FUVXJCWmk1akxMM1VlVjBML2ltaHFDODJNQlZlbW9RWUx2?=
 =?utf-8?B?cjBwZFN0ekppRkRlN0x2OER1ZDBMdEk3c2Y1NGFwVkM0TkI0TlNZRThjd1lD?=
 =?utf-8?B?WnM5eFR5b2wwUFgwRGgzbmxUeDdKUTFWamtPNE01SzFFT1JhYjFueG15bFdV?=
 =?utf-8?B?MlJwemE1SDlCMnMxWVlHdFNKQ0Z1NWRlMWo0cE9KdU9HQThSYjhmTzFqMkNs?=
 =?utf-8?B?bmVjMFM1ZHR1Nkk1ZUR6c29lT1BHczMwUTl3bmVLMzRVZjI0dzcxazBZTXlB?=
 =?utf-8?B?WkR4K3NFZk56dkc0NlB1cVdYOEVMbkJMNVRZWEg4QmRPN3A3YkNGbktnemd0?=
 =?utf-8?B?YXB5TDdkaEU2VTQvWng4dWhHc0pXcXgra0pnbzVPRTlxQnJqVm04K0ZoTWVI?=
 =?utf-8?B?TmlrSGhnWWFMSlp0aFJvM3BDei82MlJhV0NvTlpqMEdjS3RTMkJzWUxYQWRL?=
 =?utf-8?B?QTJCbnh0dis2amRrZm5PTGFnN1A4c1JNT0hnRjRrRm14anFRUEV0VEdKZWtm?=
 =?utf-8?B?OWdmc1dPZWkrdGJlTmRjWTlvYk1hekt6QUtHSWZuN2FwQVpTRTVraHVpVUV2?=
 =?utf-8?B?WXlVOWdZd2hxUkZZYU9zaDJYRm90TTVpbENFbFdzSjdjVHRCbVZJS1ZsTnpZ?=
 =?utf-8?B?MlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d8af09e-cc4d-4e7d-7d1f-08dcab0d4892
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5719.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2024 11:47:52.1233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kLYkyVTOeylRwfRw0Ed74TahaMfFHxNYo1io320/r1yzChVCPfbnim6CzpO6PdRDHuqbjkJeW5s0dgArOXDNz6yPtYL53m0Shonsij9hUfk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7585
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

Hi Jeevan,

On 23-07-2024 09:58 am, Jeevan B wrote:
> Validate pseudo static refresh rate changes in the VRR with
> fixed refresh rate framework for non-psr scenarios.

What is pseudo static refresh rate? please elaborate, so that it would 
be easy to review.

> 
> v2: Add PR check.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>
> ---
>   tests/kms_vrr.c | 58 +++++++++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 56 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 7e8885f16..d45d38657 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -31,12 +31,18 @@
>    */
>   
>   #include "igt.h"
> +#include "igt_psr.h"
>   #include "i915/intel_drrs.h"
>   #include "sw_sync.h"
>   #include <fcntl.h>
>   #include <signal.h>
>   
>   /**
> + * SUBTEST: lobf

Please sort SUBTESTs in alphabetical order.

> + * Description: Test to validate link-off between active frames in non-psr
> + *              operation
> + * Functionality: LOBF
> + *
>    * SUBTEST: cmrr
>    * Description: Test to validate the content rate to exactly match with the
>    * 		requested rate without any frame drops.
> @@ -106,7 +112,8 @@ enum {
>   	TEST_FASTSET = 1 << 7,
>   	TEST_MAXMIN = 1 << 8,
>   	TEST_CMRR = 1 << 9,
> -	TEST_NEGATIVE = 1 << 10,
> +	TEST_LINK_OFF = 1 << 10,
> +	TEST_NEGATIVE = 1 << 11,
>   };
>   
>   enum {
> @@ -129,6 +136,7 @@ typedef struct vtest_ns {
>   typedef struct data {
>   	igt_display_t display;
>   	int drm_fd;
> +	int debugfs_fd;
>   	igt_plane_t *primary;
>   	igt_fb_t fb[2];
>   	range_t range;
> @@ -784,6 +792,44 @@ test_seamless_virtual_rr_basic(data_t *data, enum pipe pipe, igt_output_t *outpu
>   	}
>   }
>   
> +static void
> +test_lobf(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
> +{
> +	bool change_mode = false;
> +	time_t startTime = time(NULL);
> +	time_t secs = 4, change_time = 3;
> +	igt_plane_t *primary;
> +	drmModeModeInfo mode = *igt_output_get_mode(output);
> +
> +	igt_info("LOBF test execution on %s, PIPE %s with VRR range: (%u-%u) Hz\n",
> +		 output->name, kmstest_pipe_name(pipe), data->range.min, data->range.max);
> +
> +	igt_require(output->config.connector->connector_type == DRM_MODE_CONNECTOR_eDP);

If this test is an eDP specific, then this is not the right plase to add 
this check. Please refer output_constraint() in kms_vrr.c

> +	igt_require(!igt_get_i915_edp_lobf_status(data->drm_fd, output->name));

Please check above comments.

> +	if (psr_sink_support(data->drm_fd, data->debugfs_fd, PSR_MODE_1, NULL) ||
> +	    psr_sink_support(data->drm_fd, data->debugfs_fd, PR_MODE, NULL))
> +		psr_disable(data->drm_fd, data->debugfs_fd, NULL);
> +
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_create_color_fb(data->drm_fd, mode.hdisplay, mode.vdisplay,
> +			    DRM_FORMAT_XRGB8888, DRM_FORMAT_MOD_LINEAR,
> +			    1, 1, 1, &data->fb[0]);
> +
> +	igt_output_override_mode(output, &data->switch_modes[HIGH_RR_MODE]);
> +
> +	while (time(NULL) - startTime < secs) {
> +		igt_plane_set_fb(primary, &data->fb[0]);

No need to call this everytime, as you're using the same framebuffer.

> +		igt_display_commit(&data->display);

This will be an empty commit if there is no change in the mode.

> +		if (!change_mode && time(NULL) - startTime >= change_time) {
> +			igt_output_override_mode(output, &data->switch_modes[LOW_RR_MODE]);
> +			change_time = true;

Assigning type bool to time_t is not correct.

> +		}
> +	}
> +
> +	igt_assert_f(igt_get_i915_edp_lobf_status(data->drm_fd, output->name),
> +		     "LOBF not enabled\n");
> +}
> +
>   static void
>   test_cmrr(data_t *data, enum pipe pipe, igt_output_t *output, uint32_t flags)
>   {
> @@ -973,6 +1019,7 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   {
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
> +		data.debugfs_fd = igt_debugfs_dir(data.drm_fd);

Please make this variable as local to test_lobf().

>   
>   		kmstest_set_vt_graphics_mode();
>   
> @@ -1030,13 +1077,20 @@ igt_main_args("drs:", long_opts, help_str, opt_handler, &data)
>   		igt_subtest_with_dynamic("seamless-rr-switch-virtual")
>   			run_vrr_test(&data, test_seamless_virtual_rr_basic, TEST_SEAMLESS_VIRTUAL_RR);
>   
> -		igt_describe("Test to validate the the content rate exactly match with the "
> +		igt_describe("Test to validate the content rate exactly match with the "

Not related to this patch.

- Bhanu

>   			     "requested rate without any frame drops.");
>   		igt_subtest_with_dynamic("cmrr") {
>   			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
>   
>   			run_vrr_test(&data, test_cmrr, TEST_CMRR);
>   		}
> +		igt_describe("Test to validate the link-off between active frames in "
> +			     "non-PSR operation.");
> +		igt_subtest_with_dynamic("lobf") {
> +			igt_require(intel_display_ver(intel_get_drm_devid(data.drm_fd)) >= 20);
> +
> +			run_vrr_test(&data, test_lobf, TEST_LINK_OFF);
> +		}
>   	}
>   
>   	igt_fixture {
