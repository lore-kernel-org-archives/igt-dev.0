Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F409C02194
	for <igt-dev@archiver.kernel.org>; Fri,  7 Feb 2025 15:16:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E1D410EB41;
	Fri,  7 Feb 2025 15:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="atGUYHAp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4669410EB3C
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Feb 2025 15:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738941377; x=1770477377;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=d7h6tkPVlgsiBtzkuv8uK0vhk+Ycb5kJfSTrN82uzK8=;
 b=atGUYHApwdO8TyzvSJgVxHsIRud7skrWKS4JdJM2l2+b8eNGGVjYnHMM
 uLyeXN8a76xXX/kpsnBM2r2mGRfb0bp/WdDJM968kPHzqZCf5/KseUnGu
 DBl7OodwSq1K9NTA8tc3J01h1Gu3lFBJMclxlDmdttMzxnVBE5ErS3b/i
 diBWYqSqpOHzubd3gj2v5fGenoXZNB6c3oZcM3lf1+xkXmaoCIaHGxs2u
 gT0LKiN+2TeGrs2D9W4tsYbN1vtG2WwfFgh/5/V1htmb67+L02OfcuBp8
 m1JtSKDwcWPO1pVUHvr7SmB7fv+yj/E1mwJXPbNPkD/Vyv0jnloI5SFSN Q==;
X-CSE-ConnectionGUID: YPRN+D9LQ86CmSZ+PqRZqA==
X-CSE-MsgGUID: kK/SlpFiRH6Bvb3QeRN5JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11338"; a="39493282"
X-IronPort-AV: E=Sophos;i="6.13,267,1732608000"; d="scan'208";a="39493282"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2025 07:16:17 -0800
X-CSE-ConnectionGUID: q51MymXnTMasZ+JiqL0J7A==
X-CSE-MsgGUID: Ej/iUGudRPWRbgmSCWq6eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="134779262"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Feb 2025 07:16:17 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 7 Feb 2025 07:16:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 7 Feb 2025 07:16:17 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 7 Feb 2025 07:16:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YmXXTiLOr2obpwHCk5LK5bNw3Ef6nzjxrMmuWAzWjJBAB2UISr0lnOxVxTvAy8tjKKZS62kF0Y9Rq2wXgaWaWsEq4sLZyWhbhGhXXcAMIVdNBsnyaKTNZwa4NPPxEn1XFlkH8CIUhu2fyd5IkJoqDWNv4HhhwOKB7iuU7wY71pWkuaiD+9B+mlZcXa8uFW3Sgdc9U7+B6DxieiNYi1ncfn44KtRlIIiiQzHmUxmjSOscyTeQwxNwn4Sw48EYXJW3eqUugH9YGl84bsOudHFN/q34dXsdisRbdCmaeRgeSNmnJ4CBv4D4T2OPigKzEheHXgEEW6XKce2hks5GXr4THw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0k6323PQrQKuvNYzyqyBio9VipwO/sjPNdgSbZpu43c=;
 b=SMpFbckC3Zsdz0xDYBWS2UR+5JQ5LinpToF28AZA0zpZ/UC9Wj5F92ln+WLBjxAoib47+hsd092XO5k1WwuSg5Cn9Kr+gK2W8jlv2onqcSlZTf5pfJRPv7AUHox0XSenY7bXsc+p2qpNCRI5X2kO9BaMciBE4uQy/BjrWJ6bYEmWeaBYRE7/hp8z5PRCpzG3wL0gw7KCy8fk59xDvyAJV9XdjN7or0yXUzb/rB5SU1IfIv4bPo3f6c9lLG6Coonq3gfWQicvjnfY4eqE/MxXx/8kYtHhljxECwudPoqXxmxfc+Y2v3AN2ehNQKXgkJQELrfnpBQ1YYtpeC9Sqlc+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by DM4PR11MB6166.namprd11.prod.outlook.com (2603:10b6:8:ad::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Fri, 7 Feb
 2025 15:16:12 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.8422.009; Fri, 7 Feb 2025
 15:16:12 +0000
Message-ID: <87412be1-83d2-4df6-b44c-ed4471984bb6@intel.com>
Date: Fri, 7 Feb 2025 10:16:10 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/intel/xe_exec_capture: Enhance test to check with
 DUMPABLE flag
To: <igt-dev@lists.freedesktop.org>
References: <20250205184143.233197-1-pravalika.gurram@intel.com>
 <c8facc8d-f2e5-4789-81a8-7ae9a3fbeca7@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <c8facc8d-f2e5-4789-81a8-7ae9a3fbeca7@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0354.namprd03.prod.outlook.com
 (2603:10b6:303:dc::29) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|DM4PR11MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a8f34e9-0e63-4ca8-957c-08dd478a5ba7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TkJnd0g3SU5MWEJSZU5LMFNGTXRVRmdFcWNWZUw5UC9EUGdsa3l0QzBLcnpK?=
 =?utf-8?B?dlhUb0ZxQmJ3YUpkNjdYNms3Q3FLZXcrRHlxdjNzK3pQS2M5TUsxWVZyMVdm?=
 =?utf-8?B?RzdrVGRZZGZ3STZrZjMzZG02MG5WR3Fna1Qrcm5nVzVLRCs2Smt3MXdkKzdS?=
 =?utf-8?B?YVVqNHY3SUJZRU9hLzdFM3gyZUpINGkvUTI5R29lSFprbk5lcm52L0dhYVdH?=
 =?utf-8?B?T01jUkZvV1c0dldsMngwUjdBMWxyM25KOFFJbHNzUVpKbEtVaGFFTkx0VGtJ?=
 =?utf-8?B?c3ZwcjNlOHMydW9BT2tDcStDUFNnZkxCWmUySk5zcUg4dWRKVjc3ZDdIL09k?=
 =?utf-8?B?NzJGUXdLRXdOOXppb1dmMnI0M2Y4RGVUeDV6U3hKNERBS0E1Y3EyR3RvL3o2?=
 =?utf-8?B?ZE4reFh3cHNDVlo0dkZpejMrZlJKV1FybWpHdmc4OUhRWkNzWXVPZWhuUDZS?=
 =?utf-8?B?SWhsTFFMeWl1dlYvK1E1SFY0WFByczZOblQ5eWFhVERKN3NJeXlCejJrbXpq?=
 =?utf-8?B?WXFTZzM2WDl6Q2U2bDhyQ3UvTldqNFFQekRpSlNKVGxubk0yNytDWUlVQkds?=
 =?utf-8?B?MWtCK3V4Tnp1cE5YRFlRcEcreitFeldwc1lHNXdBNGROL3pveDlDbTIxTHhM?=
 =?utf-8?B?b3BjbVN2MFBBTFNMTzQzMDAycDZ6OVlyTTdYRUlURXRJZGo2cmRzQzhIZkNS?=
 =?utf-8?B?NVpaSDF1YnBOZjQyUnVucGUzb0tSVU52VjNUbGVOL3lwRzIyN215K3l0b2pi?=
 =?utf-8?B?N1EreHAzZS9NTGVXOU5MQjM5M0p4TkN1N3hybVpFQjdQWjgxS3QwQU5BdmZL?=
 =?utf-8?B?RGJJb01zMDUyTzVkL1NrUmVGMDQ4eHM2RHlMeXgvQ0c5ZlAxWUNHbWFGR1Uw?=
 =?utf-8?B?VmdkVi9qdHlZWkQ1OTBnSFE4Q0l5OVAyL21TZkJoYzNSNkVJakNiemtVa0xT?=
 =?utf-8?B?Y2J4ajByaU9nRVB3ZlRGSFhUVDlaZm1tWGRadDdNczlDMUh6bkd5UW9kN1FB?=
 =?utf-8?B?VlFwN3c3eXFaNy9nL09lQXVLMDM5czJHdVgrbjJWV3RSTE85UFVMdHNtY2R6?=
 =?utf-8?B?LzFOVDF4WTVPanhqMG9LTUcwOXE4dnYvaWZQaGZKZFZXUkRhSkxVb1cxTzhC?=
 =?utf-8?B?Q3EydTBFTXBZa0JLcjV3d3cvTWN5d2JXbEx5M0U0dGd3dmptVFg5Q3NnYnU2?=
 =?utf-8?B?U3RKWjJWM2N6Qm91ZnN3dXBzZWcxWVV2M0RtOU84SE9CaUpRYy83TmZVTGt5?=
 =?utf-8?B?U0t0MjdRSXkycWQ4eE5RSnJYd1I1cERKZE1LUWZJZ0hIM24rRlNKbmQ0eDlX?=
 =?utf-8?B?V2xNZEp0K0NJMVJ3eUVaRmJaL1BVV21ZMkJ0KzhkNzFqbjRmakJyQm4xYXVK?=
 =?utf-8?B?bWlxTmZoOFNySTR0ZXdZa3l4ZmlMWWV6c2dZREgwV0RMR1VDalhIVkg5K3ky?=
 =?utf-8?B?QldwNFcrYTB5b1JpaVZOclJaYXU5WURyZTBVUGwrZWVJbFhoK0x3MUVhd2Ru?=
 =?utf-8?B?SFNXVVQ2bEMvNUpBQ3AxOXl4WUpzRis5cjdualZXM1VyYXJEM0xQdkF4QnlF?=
 =?utf-8?B?aXh1bThZRHYxTHhSOUhzOW8rOENJUGJ2UnhyNVhHQkJ3czE0SUt0SGlTTGNV?=
 =?utf-8?B?c2R3V2owZnJoQ1dMcFFNZ1VaR3d2aWpid2hYbWpVWnNGNUVvZ0s2MG5oRlU1?=
 =?utf-8?B?MXFaeWdXWXZpK045NzBqUzBSZjJ3L3FkMFlxemJXWmxXNERJS0dHMkVTNVNv?=
 =?utf-8?B?Q3o0WmtRbTRCUCtFbHk5TEs4OThTaitXY1g2YzZDNTEvcjR6a3N0aG1wcEN0?=
 =?utf-8?B?MzZEL1dPWGlSZmVrcG5hVEtJUUF1VC9Ebm5YSysvdlBqUCtTaWlHOHM4YWQx?=
 =?utf-8?Q?Tm8yAtUl0esd6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WEM5WmlJTnhyc2prdnVIamNMWTA2QlZndGNCRDRRM25SbnZBV3AzTDEzU2Uy?=
 =?utf-8?B?Z2hCQm95NlVpVjdFQ1hkTWxpdzluc1VqaURmUjNSNENudi82U0d4TlR0MXJN?=
 =?utf-8?B?d1pTTGlxNlBnMkMvNm5RNlVad3VuYVlDWUVTWXU1ZFJMQldnL0NuQW5XbTgy?=
 =?utf-8?B?TU9wT041OXJpU3RvMWZHWHdqSUFNNzRDdTJkU3hEQnJWZ3dBV2hhQTlTQUdl?=
 =?utf-8?B?TUM1cUJLOWFDdjkzOTc0V2JPb21iaEh1YkdrdGxrUkRNeXlWMWMvc1dWYVNM?=
 =?utf-8?B?TUNnVnhPN2tnaVNyVkd3cGpZK21mb1czNFdXZlp0NVd3ZWlSb1ROcWtOaElC?=
 =?utf-8?B?ZDZHUnZNcElSVEljUlJOSHc0YXVBVllxZG1tcnY5OFkrbVZCZXg3bkZwbHIy?=
 =?utf-8?B?c1hMNjVPOFErbnhFZmYrMFNKQzVwemRJYmJ1QVNiSmRZYzZPZVQ1MnAvaTl0?=
 =?utf-8?B?QmlmMEhOUUVQbVhxa3B2NVZibHVXNnFEdjI0NGNBZUpHWEhBa1h6aGtPZ2l1?=
 =?utf-8?B?MnpMZDlteDZ4SUhOSWdRNnJXcVc5NGd1bzRKdlp1WHdxTzdSd016OFMwWVlQ?=
 =?utf-8?B?NSs2dGJtTlJSbmx1anZkaTlDYStqQ2JNOW1CNHBaaHNRdksycWlqbEx1dUFW?=
 =?utf-8?B?ejU4b3IxTzZHOHBzNUlKaDNJa0VJWEl2VWt5cUpwSFNHYy9tMnhJdndjODg0?=
 =?utf-8?B?bHpsOXNsMjhsU0JETDFITDAwUEFaL0M1NEcrcW82cWo4STBPak5iNVlISnRX?=
 =?utf-8?B?cE9XU0JxdHM0NzdQaTdFZjUvN1lrV2hxSzhIc3R2S0FFaWhVZG9rdHN2SkRm?=
 =?utf-8?B?ZEhOTi9aVTc5bk5VVUZYUmJjaGZvMGJjcFZMSEpRdzJlcFNiYjJIV1FJWjlG?=
 =?utf-8?B?c2RjSEFIb2VuRTdZeTBCcmc3QW1wdk9uZUlEYWY0TzZycU96R3lXN0VramVX?=
 =?utf-8?B?bGFLcXRQWjFRR3VLbGZ5RnFDZXovVDFFcmtBU1ZjaEVxZzNPek1VV3FONGhC?=
 =?utf-8?B?TjhxamNIR0NVZTFuRHlEdFlXakpYbXlpdTd2bUl6c3phTHBsSk1tL3NNOHF3?=
 =?utf-8?B?L0dXSFVYckRSYW9oVE9sbzBvTkcvMEVuc3QyUG5iL21pTlBURTJWb0xNOWVt?=
 =?utf-8?B?ME5JT08xVTg5NHZkN3p0NmFpRjZrdE9PUUxYaFJhaDAvd01UbXVxcGhUVkJq?=
 =?utf-8?B?SkNCRXI3REJXTDA5b3hycUlaUHcvRG9wTXErUG5QdEpxaXR0ZkdNWThJSEZB?=
 =?utf-8?B?UWZpV0czKzl5SktQZVhVblhxT3NPbmVYMWxrRzk2R2d2QXkvM0xTcUsvekVI?=
 =?utf-8?B?VkYvS09CSXA3ZHVXakt0Slg4YkVCVjdaSDYrbG92dkpKOTd0aWZzSTVIWEJv?=
 =?utf-8?B?YTJqQVB5M2hadTJiNURreHZya2w1bUN6aXVwMTVEeTlnNEFRbVpBK0N1ZlpE?=
 =?utf-8?B?TlhDSk5zdHBtMld0czFjSE5JQklxNmI3ZCsya2djT3U5TDcwMTkxNzZOWmZj?=
 =?utf-8?B?TzMvdFMzZmNWZENMNklYNUhmRnlESzI3OUIxTmxCVFRCQnZKNlNBMVBLTHp1?=
 =?utf-8?B?ZjU4d09LejlVL0trT0g4VC9ZR0xXYkRqanIyLzhVNU8rMFpleUQxL0VjQmlu?=
 =?utf-8?B?Uk5DOG5xZXN5VmJhSHJreU1GMXZtdnQ0bXF6eEoveEMrbG91N1hBOHduL1RP?=
 =?utf-8?B?UGpRU2QrSDM1bDVQdmFvbytwUGVWdldHcTBGeWN1UFJtMWhHdlM0bkhoRGxi?=
 =?utf-8?B?SGRDckRPajVWaVZManVveDNSbW91SXB5ZitxVXRpWTk0YjRtR0xBQXh3VmR5?=
 =?utf-8?B?aExVNXlGTGVhQjcyYlRQWjc2ZmtGaTBCQ1QwaHVST3FJUlVNY3loZFRsUkY2?=
 =?utf-8?B?eVY2M2JVMitUaTZENUN5T3U4cHNvbnZURHJKdWlQUWVVQjIwNXplMWJXM0V2?=
 =?utf-8?B?UXhIRlJEUzZZd3I5aHROOFg0MTlZT0w5NTFmTWpBbEVBc2h1YXA2U2wxN0U5?=
 =?utf-8?B?Y0RiVVdVeGJaTHhaTzNKZHh4YjA4R2pMcWV1cW5RaVBFdUs5MmUxZndQU3VH?=
 =?utf-8?B?Qzk5VzhyYW5zcnlVQUE2UmlFblYzZ3dZcjE0MXhNUmRGd1ltakI4R3YyMExJ?=
 =?utf-8?B?RnY0M0s4RkprSEJabWN0aDZ3SjlsMU0yZlhPdkhxeWU1c3YvN2FKNktBYk1F?=
 =?utf-8?B?TVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a8f34e9-0e63-4ca8-957c-08dd478a5ba7
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2025 15:16:12.6992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sfr/QbYZMfQLH3hUCLXt8ZED9/6WqROXjnqDHJR9xiqrn2dLwbAJLcmK+lpgpfmYwoxyEXKzRJDa7J2f3qBrFA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6166
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



On 2025-02-07 10:05 a.m., Dong, Zhanjun wrote:
> 
> 
> On 2025-02-05 1:41 p.m., pravalika gurram wrote:
>> check if the VM is there when DRM_XE_VM_BIND_FLAG_DUMPABLE is set
>> in the generated devcoredump.
>> check VM address within the range
>>
>> Signed-off-by: pravalika gurram <pravalika.gurram@intel.com>
>> ---
>>   tests/intel/xe_exec_capture.c | 64 +++++++++++++++++++++++++----------
>>   1 file changed, 46 insertions(+), 18 deletions(-)
>>
>> diff --git a/tests/intel/xe_exec_capture.c b/tests/intel/ 
>> xe_exec_capture.c
>> index 55ec3d4bd..4eaa3f4d1 100644
>> --- a/tests/intel/xe_exec_capture.c
>> +++ b/tests/intel/xe_exec_capture.c
>> @@ -53,16 +53,15 @@
>>   #define DUMP_PATH            "/sys/class/drm/card%d/device/ 
>> devcoredump/data"
>>   #define START_TAG            "**** Job ****"
>> -#define END_TAG                "**** VM state ****"
>>   /* Optional Space */
>> -#define SPC_O                "[ \t]*"
>> +#define SPC_O                "[ \t\\.]*"
>>   /* Required Space */
>> -#define SPC                "[ \t]+"
>> +#define SPC                "[ \t\\.]+"
>>   /* Optional Non-Space */
>> -#define NSPC_O                "([^ \t]*)"
>> +#define NSPC_O                "([^ \t\\.]*)"
>>   /* Required Non-Space */
>> -#define NSPC                "([^ \t]+)"
>> +#define NSPC                "([^ \t\\.]+)"
> Add "." as delimiter, that's fine.
> 
>>   #define BEG                "^" SPC_O
>>   #define REQ_FIELD            NSPC SPC
>>   #define REQ_FIELD_LAST            NSPC SPC_O
>> @@ -77,6 +76,8 @@
>>   #define INDEX_ENGINE_PHYSICAL        2
>>   #define INDEX_ENGINE_NAME        1
>>   #define INDEX_ENGINE_INSTANCE        4
>> +#define INDEX_VM_LENGTH            2
>> +#define INDEX_VM_SIZE            3
>>   static u64
>>   xe_sysfs_get_job_timeout_ms(int fd, struct 
>> drm_xe_engine_class_instance *eci)
>> @@ -177,7 +178,8 @@ test_legacy_mode(int fd, struct 
>> drm_xe_engine_class_instance *eci, int n_exec_qu
>>       };
>>       sync[0].handle = syncobj_create(fd, 0);
>> -    xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>> +    __xe_vm_bind_assert(fd, vm, 0, bo, 0, addr, bo_size,
>> +                DRM_XE_VM_BIND_OP_MAP, flags, sync, 1, 0, 0);
>>       for (i = 0; i < n_execs; i++) {
>>           u64 base_addr = addr;
>> @@ -287,10 +289,6 @@ static int load_all(FILE *fd, char **lines, char 
>> *buf)
>>           /* Only save up to MAX_LINE_LEN to buffer */
>>           safe_strncpy(lines[i++], buf, MAX_LINE_LEN);
>> -
>> -        /* Stop on END_TAG */
>> -        if (!strncmp(END_TAG, buf, strlen(END_TAG)))
>> -            break;
> The target line located after END_TAG and is at the end of dump, that's 
> why this search is removed. But could put comment in comment message 
> about this? Remove search for something need some description, we don't 
> want it to be removed silently.
And add example line, like:
204 [1580001a0000].length: 0x10000
in comments somewhere, like check_item_u64 or where it was called, make 
it easy to read.

Regards,
Zhanjun Dong
>>       }
>>       return start_line;
>>   }
>> @@ -351,7 +349,6 @@ static char
>>                   value = &line[match[target_index].rm_so];
>>                   line[match[target_index].rm_eo] = '\0';
>>               }
>> -
>>               if (key && value && strcmp(tag, key) == 0)
>>                   return value;
>>               /* if key != tag,  keep searching and loop to next line */
>> @@ -361,16 +358,44 @@ static char
>>       return NULL;
>>   }
>> +static uint64_t
>> +compare_hex_value(const char *output)
>> +{
>> +    char result[64];
>> +    uint64_t ret_val;
>> +    char *src = (char *)output, *dst = result;
>> +
>> +    if (src[0] == '0' && (src[1] == 'x' || src[1] == 'X'))
>> +        src += 2;
>      this is works with "0x123" case, to skip the leading "0x"
>      how about "[0x123]" case?
>> +
>> +    while (*src) {
>> +        if (*src == '[' || *src == ']') {
>> +            src++;
>> +            continue;
>> +        }
>> +
>> +        *dst = toupper((unsigned char)*src);
>> +        dst++;
>> +        src++;
>> +    }
>> +    *dst = '\0';
>> +    ret_val = strtoull(result, NULL, 16);
>> +    return ret_val;
>> +}
>> +
>>   static void
>> -check_item_u64(regex_t *regex, char **lines, const char *tag, u64 
>> addr_lo, u64 addr_hi)
>> +check_item_u64(regex_t *regex, char **lines, const char *tag, u64 
>> addr_lo,
>> +          u64 addr_hi, int tag_index, int target_index)
>>   {
>>       u64 result;
>>       char *output;
>> -    igt_assert_f((output = get_coredump_item(regex, lines, tag, 
>> INDEX_KEY, INDEX_VALUE)),
>> +    igt_assert_f((output = get_coredump_item(regex, lines, tag, 
>> tag_index, target_index)),
>>                "Target not found:%s\n", tag);
>> -    result = strtoul(output, NULL, 16);
>> -    igt_debug("Compare %s %s vs [0x%lX-0x%lX]\n", tag, output, 
>> addr_lo, addr_hi);
>> +
>> +    result = compare_hex_value(output);
>> +    igt_debug("Compare %s %s vs [0x%lX-0x%lX] result %lX\n", tag, 
>> output,
>> +        addr_lo, addr_hi, result);
>>       igt_assert_f((addr_lo <= result) && (result <= addr_hi),
>>                "value %lX out of range[0x%lX-0x%lX]\n", result, 
>> addr_lo, addr_hi);
>>   }
>> @@ -435,7 +460,7 @@ static void test_card(int fd)
>>           igt_debug("Running on engine class: %x instance: %x\n", hwe- 
>> >engine_class,
>>                 hwe->engine_instance);
>> -        test_legacy_mode(fd, hwe, 1, 1, 0, addr);
>> +        test_legacy_mode(fd, hwe, 1, 1, DRM_XE_VM_BIND_FLAG_DUMPABLE, 
>> addr);
>>           /* Wait 1 sec for devcoredump complete */
>>           sleep(1);
>> @@ -451,10 +476,13 @@ static void test_card(int fd)
>>           check_item_str(&regex, lines, "Capture_source:", INDEX_KEY, 
>> INDEX_VALUE,
>>                      "GuC", false);
>> +
>>           check_item_u64(&regex, lines, "ACTHD:", addr,
>> -                   addr + BATCH_DW_COUNT * sizeof(u32));
>> +                   addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, 
>> INDEX_VALUE);
>>           check_item_u64(&regex, lines, "RING_BBADDR:", addr,
>> -                   addr + BATCH_DW_COUNT * sizeof(u32));
>> +                   addr + BATCH_DW_COUNT * sizeof(u32), INDEX_KEY, 
>> INDEX_VALUE);
>> +        check_item_u64(&regex, lines, "length:", addr,
>> +                   addr + BATCH_DW_COUNT * sizeof(u32), INDEX_VALUE, 
>> INDEX_KEY);
>>           /* clear devcoredump */
>>           rm_devcoredump(path);
> 

