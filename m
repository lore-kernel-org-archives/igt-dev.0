Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7D6C87FC9
	for <igt-dev@archiver.kernel.org>; Tue, 29 Jul 2025 06:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD17410E5D1;
	Tue, 29 Jul 2025 06:37:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PTVgDlO6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F7A10E5D1
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jul 2025 06:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753771027; x=1785307027;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PyAcs1z/JdJbAWBb636VRCaIun+BZuOhBgpekgVXgho=;
 b=PTVgDlO6yYJjKPUkCGgz9rWt2LC5WX3RAuO1MggJ4dJlF3FyyttPaN4F
 ZiAo311x95Omnzubv9Z/TmRaf4ot4GG5dqqGbMVuOQ+Le7zAPYwiNoUNI
 A8Jfl8IFfEMyKuc7V+youzFWJ7Ol3+ALfSqHjTh8ojyU5+FvhZfOkdnlI
 LvetKfEQDa/sXYerieSP0lnqaYXwZmW/lFwk6OXpKGC3sgLiCXVNOUbhd
 t9HUzZuEvecAnaS5jaaJd96eQztV9hIcxIOsVvQyvwz/hRdazHAMN9lnE
 m+T9zn+qnSH8Sb9h1TEqhqSVAyxbDeZqnoSdGSC7ZA/UAl1hx2dAf8zjh w==;
X-CSE-ConnectionGUID: 6HT7/OiyRzWQ7FhZPbypDQ==
X-CSE-MsgGUID: x0xUo9EhRp6TbJD5zI2TVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="73480307"
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="73480307"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 23:37:03 -0700
X-CSE-ConnectionGUID: M46HawKcRHKOgxduwPlpAg==
X-CSE-MsgGUID: 2M3qMl1ERRSXsWoT1bSIbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,348,1744095600"; d="scan'208";a="162659732"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 23:36:58 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 23:36:57 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 23:36:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.67) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 23:36:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Oz2+eX8fcBaq1HEZw87Wp4gTjhn/BHw01DzRQFTe4Dha2IlBVBtINAjoVTHsdxlV4g6YAIT9YBLKnBQs90bR1pqTJllQHsK2f7RqUXKsLibuXHjn/KSAivdiSh3cEicI0xTbfFYhCITeZmhgUpuihALbSkD+/WOBRV4okRGMdAoDQ3JzDNRsQM4vGE9qvx1fjxLj/lUsAk41z2jQFS1WdgFCV7GEIElVFdWsR86tZrlRomqGX0eXMxlp/p/ptCdmRRdGzG6OgNqvamKcDlhN9Qvixfst3pC17S/ddtjhZwF4kpisM4aQbGuBgyRTmnz2xSPYYj7UoctQpXCNGMHf3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5tZt56/M7A0PfRJIcsQHvaoEwkxP6U+pmxo9/v6Yxs=;
 b=YJdZ/obUhKKMKiGoOvSw6iucWPLP45fzt89BwDhMFUNhgdnECvM9e3lA6ECst/ipOGKh+sL7ZDbHvn4NtUNYEld2Tkc1uVJB0+aBp+u6R1gIKignTA41gBta9iZd0bUaM41YG3EpszPaAFLLkh71G0QeQeXLEGMKbZbZi9ypTn3DJdSs+PKro/r0rYKFXce4KntjbsDLmSoSTShWjY97TDuwuhsOBIfBHnRwS0Yrh2vJogCRMOwdIBvp+Etr+OK/i16qse9C3kefpoxWrhe6bpC7aExz2O9oO8QFYtdBH7msigsWh3xE8hy/DFRpjHtwPsZf//81Bm7WITS4+daZZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7368.namprd11.prod.outlook.com (2603:10b6:208:420::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.26; Tue, 29 Jul 2025 06:36:48 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8964.026; Tue, 29 Jul 2025
 06:36:48 +0000
Message-ID: <6b40dda4-5230-48c4-989a-025df881e7f6@intel.com>
Date: Tue, 29 Jul 2025 12:06:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v1] tools/gputop/xe_gputop: Keep engine activity
 percentage between 0 and 100
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <anshuman.gupta@intel.com>
CC: <lucas.demarchi@intel.com>
References: <20250725113502.3180536-1-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250725113502.3180536-1-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0017.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::12) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7368:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a84ba41-26f5-408a-c07e-08ddce6a4b0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ak8xT05yY2d5VmcwZmVXcFZlc0lvekkwYzNueGVUS3BDMXp2blpENXVoWC9S?=
 =?utf-8?B?cHJDUTVXZzdtNnQvYWFIOUE0VUlRTzlselNUTDU4QlhweGN2TXZOZjJaUTVU?=
 =?utf-8?B?bGFTcU9GT3FVOS9DQlFaaVRoVVdwbVMybEZRTW0rbUlpM0ZOSFFpckxKNXZQ?=
 =?utf-8?B?VUlOR3U4dEMvUmVVd3RSYURIQ0kzZ2FuR1pwWWVIemZDS2plV05FNm4zSzVW?=
 =?utf-8?B?V0Z0Z0Z1MTFMZkFkZDFvSnlvQ0pqY0tWRFlSMkR3MlBnU0k2UlFqOEovbjNY?=
 =?utf-8?B?WnBacmtLLzBQU3dEaFI2SW1KSFVXUjlCckMzUEduc3NHT1RzeHlnTmZTRG9D?=
 =?utf-8?B?WlBWNTJCUmFXMlA0MmJrTHpiVENxSklmcWFWZU1yT0NQc05BbGhSSk0yYUNs?=
 =?utf-8?B?aURycm9hbVJsdjllaW5YZXVKNi95L292R0Uwb1Nac0EvMzJYNFhaZ09QRFlP?=
 =?utf-8?B?U08yYTFPUzhnMXZ6dmI3cTVVYjc5a05Zblp6T01SZUZTTktqbW5xbmVKYzhD?=
 =?utf-8?B?UVhuSlpDUHFyd2ZlVUZRQUd2NUY0anRxZTRjVHVPWVVhMXJCUTk4ZWJkc01s?=
 =?utf-8?B?UEhzMEdJdDh6TnVLOU1tZVNKZVpaZ1BBWXZiTytueVBWdnQ2SWp0eGprdlB3?=
 =?utf-8?B?V3BReDNwcHc1K1ZCdzdEUzhjTXhnbXFvSXV2RFFHZjhHZC84V3JhRGtGTHhV?=
 =?utf-8?B?bGVEV2ZqSzRSdUQwZCtWd21IeHlQWStSSVR1bjlhZERFSGtXYkRkekF4U1l5?=
 =?utf-8?B?QWlRVWUxWTNaY1BoMVN2U0dVQ25JK0xxMkVmbjYzUWR1THl3eEdIalJ3S2E4?=
 =?utf-8?B?UmJhbjJsNlpLWmFzTURDeERQV1k5R21HZ2llTEVlTURhSW9rOHNPY0hSdVg4?=
 =?utf-8?B?NnVJOGtQbS9MViswWm1mcDJSVTl2MW9BeVVMb1RUVVR0bDVSc1dmWnpxUklV?=
 =?utf-8?B?dmRQVHczY2xhYVdVdEFiUk5UREpSMGFpZ1lDMC9YR2tjem9NNysvRXlvcUZI?=
 =?utf-8?B?YXVtaTZ0Mk90Q1RrL25vbmVvTnhEa0pxaWt1SFBNYzNCbmNOK1N1NXFxbUVB?=
 =?utf-8?B?NzR3K3lwMlJKOWNBekJSWDZmM2VlMnVlR281V1F5aWcrbE0xdDBYY0Zqdnp0?=
 =?utf-8?B?bDNlNExNNUFUQVJIaWphaDZWK1RONlA3alNJVG03eFprbWxKL0ZDUVFWZEhN?=
 =?utf-8?B?NjROdm1raHJFTFFVWmtiMkplbUdqZW5QcXo2ZTlzVmpGV2Q1M1dMaEJDbDJN?=
 =?utf-8?B?MWVPeWlIODJ4MUhKeXhOSmpSU1YrU20yQ3lTZHdkVXZMbE5RQjUvRDYrQnVt?=
 =?utf-8?B?QUR5VWNnYmFmVWJQb1FWSmI2ZlNzbkZOOXRoRUxVRFZXQlhsQmRrcktVVDlI?=
 =?utf-8?B?UGt1R3FhbEwySFQ4Zys2TCtZQUl2d3pkTHlZM0pjK1NxbURrTG5vRC9oalRl?=
 =?utf-8?B?ZjBEckMzTzkxSG9Bd2FYekFaS09YbFN5THUvQ0xZTk1sV3UzSUpmMFJveDB1?=
 =?utf-8?B?S1VpWmZ3aHFoMStlRnhnekNlSEIyZGJ0Y2x2M09aTUJUYUZ2ZDdHc3pYWGtE?=
 =?utf-8?B?RDluUnlENjcrRmY1eUZISXpuMmlyUy9IVGJOcnZTbytDVzh0SEFVSnhFTGw0?=
 =?utf-8?B?V3RZL09WYTEwT1N5elJZZjF2cy9CS3VkVjFkL3JCNTlUZG5qdStuSXVlbTR5?=
 =?utf-8?B?WWxXeHBGbWdpNnN1K2RTN2hGTXdLSVdnZlM4aTJIN3AzV1poa0VrM0RQY081?=
 =?utf-8?B?aGphWmF6c2VES0R5aGhxYW0remFuQ1hkZ2s3SDk0SnZyMGQ4ZWpIbzBSRW9O?=
 =?utf-8?B?MWRoQ3hFYTAzV1ZQMmtTTkwrM2FvbTFsdFg5cFpTcTE1Uzd4VEN0Z0ZxQXVB?=
 =?utf-8?B?S1RzeDhUV1JXdGxFbVE0SVVqTVVFbGZZSHB3MThRMnp3Smc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1o0YUZyaHBEN0ppSVc2NmNqUFY2aXRzaEpFaDJEZHlQMXhKZTBiT090cHVD?=
 =?utf-8?B?c01zRzFVcHRBcWJOby9Kb0M0WHE2UzdKYWh4K0pHWC9uV0tlaExLdERFUzBu?=
 =?utf-8?B?dmYrSVFOanpHcVBlZWdwZllSMmZjL3poT1ZTOHg3ZzJSQk1aVFk3WlVmcG1Z?=
 =?utf-8?B?czF5WHNnc3psc1BWWFNXa2x1czRid2ZkZFNWUGxDZ2ExeDE4U2gxeDQwakVj?=
 =?utf-8?B?akpiMHYvM2E5VmhqWktmWkxINitZY3dqTW14WjB1N2MxQ0tDMkZoN2F4K2Qx?=
 =?utf-8?B?MXlid0Q3bnhqMGRNVU5YSmJBbW4wQzE0VjMwS3pKWlJ5MGpGTU9LeUJkaU51?=
 =?utf-8?B?RTlRb1Z0M0F6UWhDUjlxN3ovSGxXRkd6bnc4QUtMVjVMdmp5Z0ZSaWRMMi9w?=
 =?utf-8?B?d3ZWNklzOGFSR0ZrR1phREhvN2dqM09TdkxkS1FRTFBKRXBUODFKM3VYZjNZ?=
 =?utf-8?B?YzVuZCtMZStnLzlERlB6N0NRRGRwaEUwci9seDJ1eEhsektpTUYzckYrQ0ww?=
 =?utf-8?B?REhIQVZlQjFERmN6YkVVUnBjbFZNZ2tib0Z5MUNXSlBrdkVuWnRuaWRnUnpE?=
 =?utf-8?B?eGNtOS9kUUtzcWVhaHJNbk83ZXhzS0xLdkMzbHV0dkZ3VnlLWDlsUHNNcWNp?=
 =?utf-8?B?R0d0Tm1PUUlFZUJzTzFrOElTYWJLWHpDS21sdjVVbURQVGlyWXNoTC9paVhr?=
 =?utf-8?B?K0taUlJyd3ZRS3puVGFsS0kzZmErN0tpWmVEbVNyL0JyaFVsMld1Y0dBMDdW?=
 =?utf-8?B?Y1ZtTVo4VnJXWnBiODNMdVdJU1pmLzZBYzhORXd0bFZudVZUNFlJNjhaWlE1?=
 =?utf-8?B?YThXTnJRNmdKay96bnQ5ZW90eEdKODFGWmwxZUxrVmZ5SW03U2pQdHpDNmRJ?=
 =?utf-8?B?eU5EMDgwVTF2Y09jZDF0MGQrWUdJeWMyYThzMFk0VU9kZ2V2V0NlQW9RL2F4?=
 =?utf-8?B?cFZweWIrYXdQZ1ZpRjR0cTNLZ3IybmRBdElvaHdvcmNDV1UyMFpJTmNReXRr?=
 =?utf-8?B?UkdUeEJJbFhrcFBmalIzbFlSdFlQQjMzbFg1UUI2QldFUWlEeVcrVU5CbDho?=
 =?utf-8?B?Z01BQ2ZBZGFQNktWd3FTSjBWSHdpbHM4MFhydHhRc0V0OXhqVGpwUFFKTlhN?=
 =?utf-8?B?dDgydDdSKzBDU20yTlFEd1VxVUlseERDY0lER3dZT29KMHRwN1krcUs5cmQx?=
 =?utf-8?B?Sy9MZDFNbUxBNjh0Mm0xZnkxQWJVTUpVWEUwM0ZKajloVDhUVWJHRlB3cTdm?=
 =?utf-8?B?MCtvQ0tvcjcrYXJoS0VxVHQwYzZ1a20wWWN5Y2YvQ1hHdnNReGwvTnluUTVJ?=
 =?utf-8?B?MUxETmRVVnRSQ0RtWXpiZkl1QTljek5zcEtTeE1KWFJnZnFKL2hTd1NVdGYv?=
 =?utf-8?B?ckxpelhyWG9UV2p2Q0NydFMwbXhpclpSN2c0SzdVME1ROFg5WHBZRDF4Z25k?=
 =?utf-8?B?eXZ4bzhKOGxFSGFoUW9BMXNIY2JYeUljVXF3ZVErUnc0OU1BQWFEdFlTelo1?=
 =?utf-8?B?TlRGMGJ5QTQ0d3hnL0ljSGVlRysvS0dQNDBKVm1BN1JabnVvcmNXaytLOXh6?=
 =?utf-8?B?aHhkekgraC9EblBuN2MyQk1pcFc4N25KOSszYWpnUVd5N1Y3d1c0blBYeGMy?=
 =?utf-8?B?TlZXMFJ5bGJMbkR6elJoanhaWnpGYnBlR3lZQm1TYjVPc2M1ZVMxRDNXdkRJ?=
 =?utf-8?B?Tzl1SDZhLzNYMXcwZXBYUUdGT0E2SjlUdlJYSlNyTXlZU1h4VWZUZlkzZ2Zh?=
 =?utf-8?B?UkN0ZkJsSlRsc3VYbTc4ekpNdDgyTUw0Y2QyUWV1cEpzRzU2K3I4YngxQzRx?=
 =?utf-8?B?TlNLb04zNjU4RnlwNkN0aDBUMUplcFY0eFpJdEo0MjdVS0R1emFoYVZVSWow?=
 =?utf-8?B?blZhRFh1ZW43RHBDbVNQRm5lMEtBeUwzdUlrNkczZU9zKzFFdEtFeTBqcGNH?=
 =?utf-8?B?cE1VNFNYTExkYlRPSENWYmcxdGZrWkJGZHA5ajZieWFITXhiVmFpN1pNZW80?=
 =?utf-8?B?WHU3aGJIYXZlN1l4clkram1IazVPemxIcGZLbEtjRTJLL1lwMjdBVXRaMTEz?=
 =?utf-8?B?S2tWSlFvVUk0WDFLTXA5T1Z1eEw4M2hTTGdPTUF6cUw1ZzBSTzhRY0RHVkQ1?=
 =?utf-8?Q?B6MYHFV6MKY2BVBV57acSoe8T?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a84ba41-26f5-408a-c07e-08ddce6a4b0e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2025 06:36:48.1425 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15vG50R1sxO9aGO3CQlShwsdqv7CTYB0TVlxZtB+HHoOvMoODbnCB/z6MsEwOLLX2mjwHDXysDuAbMSLV/GqGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7368
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



On 7/25/2025 5:05 PM, Soham Purkait wrote:
> Engine activity percentage within the valid range of 0 to 100 prevents
> out-of-bound values that could lead to undefined behavior during runtime.
> One typical scenario could be during a GT reset, where the engine activity
> percentage might spike to a very high value, potentially leading to a
> segmentation fault while setting the progress bar.
> 
> v1:
>   - Use clamp for clearer and shorter percentage bounding (Lucas)
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>


Looks good to me
Reviewed-by: Riana Tauro <riana.tauro@intel.com>

> ---
>   tools/gputop/xe_gputop.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/gputop/xe_gputop.c b/tools/gputop/xe_gputop.c
> index 9757369a8..bb2caa6ea 100644
> --- a/tools/gputop/xe_gputop.c
> +++ b/tools/gputop/xe_gputop.c
> @@ -281,7 +281,8 @@ static double pmu_active_percentage(struct xe_engine *engine)
>   	double percentage;
>   
>   	percentage = (pmu_active_ticks * 100) / pmu_total_ticks;
> -	return percentage;
> +
> +	return clamp(percentage, 0., 100.);
>   }
>   
>   static int

