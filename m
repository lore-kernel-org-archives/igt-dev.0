Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55724C3600B
	for <igt-dev@archiver.kernel.org>; Thu, 27 Mar 2025 10:04:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B1C10E2E2;
	Thu, 27 Mar 2025 10:04:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GqLu6PMI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A0F610E2E2
 for <igt-dev@lists.freedesktop.org>; Thu, 27 Mar 2025 10:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743069896; x=1774605896;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CGnIXsu8vGy9yriCZc5tO7UtjiYZ56FWzw5uHaIZiJw=;
 b=GqLu6PMIZsLlnNvA9YML99tXs0Y5ewNqcQqXWl2rTHBVATJUcg3ksNl4
 1ivKNjFX0Foagc4jezivPPI4KY1Omol9DYuSbNDU/VbzFuAfrd1LRd6Yi
 R8RMQtGmGG4Et1g+2gBeNnq+nt1W6Uf8v5fp0CXicnTeHty9iuIl6+Uqr
 LuTK3kjpMlVBIrqKN84z3zkI5A3Mqav1KmwaC1lTgF2hm7r8UYmFeROLq
 gBAfgkT9QKb4bLYGBS8ExNnT4TiItVAKekd/zu0GQNSsMSJ2Ca6i5If+j
 fwnAygZIuua1rbcMiYsErtfptThE+OfKsxTNslZoxVIBGewY356PjCgHy A==;
X-CSE-ConnectionGUID: 0ZEMYvJER4mjb+jFLrLp0Q==
X-CSE-MsgGUID: +0IQA5FAQrGWlarcFuCMAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="69754374"
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="69754374"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:04:56 -0700
X-CSE-ConnectionGUID: SHN4KSpfTGiJVKsOMZwpYg==
X-CSE-MsgGUID: Z2plI34iSTiRfsIi+uUFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,280,1736841600"; d="scan'208";a="130186237"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2025 03:04:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 27 Mar 2025 03:04:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 27 Mar 2025 03:04:55 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 27 Mar 2025 03:04:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQMeHRQsp1a6s77WpTLCyljTdEVxLGS0hdZcBSEY46lIfvxU06fqaERShFX/OY6aS/LEQhjWoxiWrh2L7bTEFMBNhCbDccvrmJRBp6/pCZbN/9AlCYFyAMqqLmkD7mq7aIR+wzp4obrhPega38rxtIjYfj1ZmuY5eIJVodflJhSbagMuQQ9rGtQ+rYTyeJTRPeMI4JytbSWgNzd5s8q2cTq6QHADr56pzknp3BEOUSsUUnzC72aST9rXUOU1YeDW7thX02FcQOcIfiZH2O7rGPNuk7chdoMcMXiQdKoXGm8T1P3scHn5NYbjMmJlut19LjYJLwxk35BtpX69ckDoaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+6+CYrSxHezCL3ikSvImD05GkgeC+ougo2VoWuX/1s=;
 b=WI/nCSIVdSoTQgjx778AUEwT/XL0xuIq1JahGNLyviMg6YPnF64lCZAhLROHhX7wjHi8hgOGMscUB0Aeufa/IfN7wjRMMoGPb/08+zgiLF1A8rwHNJh2H6Dp3DdhR3v7xScMqcmLCHc80s4eHIUDpb2tN3xXrm+e2k7eJL/OH/j3fCzy+PtEZVNVwfmaOLHh4pKeWHGk8Gcc74+1IKgxBosQF96sz0ZmEVXA6SsOmVs5HYw8h0IM/BEGKAhv1U4czvYO6yhMCgUQXeFFUGETSkZs3cuIqAsn/3kuqs9amg9TUXGqDH+hF11s4z3hjCZuSdFx0EDdAH7H0wFug2jS/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7919.namprd11.prod.outlook.com (2603:10b6:208:3fa::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 10:04:53 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 10:04:53 +0000
Message-ID: <a609f49a-9fc0-4b41-9b4a-0b2984ec61af@intel.com>
Date: Thu, 27 Mar 2025 15:34:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/3] tests/intel/xe_pmu: Add engine activity test
 for all functions
To: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>,
 <satyanarayana.k.v.p@intel.com>
References: <20250321110958.3557106-1-riana.tauro@intel.com>
 <20250321110958.3557106-3-riana.tauro@intel.com>
 <a5717516-fdc9-4006-b5f2-e2392787813b@linux.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <a5717516-fdc9-4006-b5f2-e2392787813b@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0059.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::19) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7919:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad74a32-4c6b-442b-9e28-08dd6d16d1b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2hSekt4aDdIclNKYXV3S0ZQZ29xK1RpR2NQUVRpZEFlcWsvUjBvRmpMUVUz?=
 =?utf-8?B?MVowK0c1N3VTSWRGS1UrYk1Tc0Y0UlNnN3ZEZXhqVDNLOVRtcVRqcmRkVVRU?=
 =?utf-8?B?cnM3VkYwU3ovYmxNOSs5WkJHL0RSc0plaEgxNCtrRWxzRkFRTzJhbC9GUnpX?=
 =?utf-8?B?UzhDaXVaUzFQaHFGSzYvTEh3bW8yVXhjRWlYWDd4K0xnaVFCSzR6eXc0N1lR?=
 =?utf-8?B?T2NQSkRGQiswdDR5eWNvMkN2YjE5cHJlRFFVSnprdzFQZzZkQlVjSzlyVTJw?=
 =?utf-8?B?ZGc2bmg5OCtES09oT05KRlExd0FGY1M1dytGNW9TN3RFZ05nenlWTmR2TUlQ?=
 =?utf-8?B?am1FQTdOaDZSVXNRelBLdVFrNDhFaWVPTTlVeVN5QlZIMVpHeW9SOHZQZ09Y?=
 =?utf-8?B?TG5WUVNoR1ROTVd5L1JxbUY1OXlSSExvcCtSQldwYXZlWDltRWUrQzRvL3h5?=
 =?utf-8?B?dUxyOXN5ZG1BR21KVnhCZVJlT0F0WXZBajRKQmtCZ09Ka0plSXRyWU1PenZa?=
 =?utf-8?B?MmIxS0xZdUtZMFllUnU3eGVUQXpHTFMxQmoyMnhuR1h1TVUvWTVXb21SQXo3?=
 =?utf-8?B?U3V6d2poSHNpbllSUUFtRHdrRVMrcmhyaVMwOVZrUjZDZjYxODFFclRLOWpq?=
 =?utf-8?B?eVJqcFV0MGVDQ1g3QzJPV0JRVHlFTTUwSFc0bUlxczl0V2tkWHdWbkdKazNQ?=
 =?utf-8?B?Q2VCMDhNd0hvYmpnRkJ6clJ2Y3V1OU8xalZUQWpOcXorcjFRemxMNFJsQUx1?=
 =?utf-8?B?ZU5BQTFTQ2Z6Ymw0MjMyODVzWGh2VWQ2ZVFQYU1DcHQ3OXlJMG9KMWNkUUxx?=
 =?utf-8?B?UnlmK1EyUzNsM2wvWXJrZldnOEpQZU5HRTJaUFYvbkl5WE9HbGRtRkVaMDNz?=
 =?utf-8?B?elpxdVh4VkF0YjRLc09XMTV4cnFHRmIxTFhxcnFoWFBVUldMaEpQM0R1UnJ6?=
 =?utf-8?B?enpqdURadVpxSytKNGNOWUdMQk03UzM1QndIYXVLRkNod3g1WXhyZXdsZHZM?=
 =?utf-8?B?a1h1M1paaXdzUndCN1ROcVcxUnVoZHlBRmlKTHVQc1lML1FMWWV3UlJMclpp?=
 =?utf-8?B?QkxCTDdCemNodTFFZ3NzUi81WUZ6MXpEa0hRWCtwZlUrNkNCSWp2RFRnajlv?=
 =?utf-8?B?eTZsYkZkNTRhZ2JnRTd0NUE2cEkraEJucVhxN0NUa3lCTGV4NGtjVWowRDVC?=
 =?utf-8?B?aEh1NzJ3QnFHOFlhWHhkZCtHY3ZGMjgwcnM1YzFnbWpsYzV5Ny9jMm81THI5?=
 =?utf-8?B?THdEZmJhbDNKME9TZldGUFFnRjF2WVgyeExCR1VZREJ3eGg3MXRJKzc1dCth?=
 =?utf-8?B?aTM2VEF5eDZuL24ySUZpOHJlQmkxV2hrRlhyTWRMMGtFSk1ZVllIZVFTemJX?=
 =?utf-8?B?cWJjZ2d5dHErbjIrczJ5c2lTSGo0NUhJZGtqTkw1L1QzUUxxUUFPMGVpWEVI?=
 =?utf-8?B?NURsL2k3ZS9GWDZBVGRsVmYwd3hJdTc3bGJQWkZwaGxmeEFYdkw0NlJ3Z0sz?=
 =?utf-8?B?V05lK0ZuTkowZzRjZzBUNGRVMjg3cVRPL0ZHWGNxK295em1Jc1JwT2tSNXV1?=
 =?utf-8?B?azRsYkI2eDBDSVd6RkpFRkVDditMTEtHaS95SlVQMCttSG9KN08zSjE1N1d0?=
 =?utf-8?B?QTl1SFR2eGVSVjM2OFRQYmIzVWNkZ1lWT3ltc3RHY0VCYTdudy9TcHdLdDRs?=
 =?utf-8?B?eWcyNGs0TExIbTdXZHh0QTRjeHZsUm1hdWEwL28wbVkwbzBCbmc4UDRTQmRS?=
 =?utf-8?B?VGJzQnFLRkw1eEJYZ201SnUxYXMzUzlnbFJyRlVDdWdweEhDWmtCRHh1UTB3?=
 =?utf-8?B?bG5yRXFhT2JIL0R4L3pHVEpCT2xKWXoxNndyT2ZvT3pzUlFONUhiQmt4WGkz?=
 =?utf-8?Q?45F2mItXEavnH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1ZxVk1QK2Y2Sm1wZ1J6STVvVXZ6Mlg1dzlEWWFPazF4WEYyKy9UT2N2NVl1?=
 =?utf-8?B?SmszWnArSUw4SmE1NzZFTXVBRzl3bEFRRjByYkU5ek8zSmdZdW10OHQxWjFs?=
 =?utf-8?B?ZXpBS0w3NlRaMm1HTTRoc1V2UmpoRHNzdDQ0Sk9WaXo3YkFjZnVuOTBRVG5D?=
 =?utf-8?B?VUxLVXB1SWdwbGNYRE84K2ZLeHBlN21tTXBYVHRRYkRuMFNQdXYreEtINERh?=
 =?utf-8?B?MjZCTk9zNWxvK1dSbjUxZmhENFd5LzRjckNMVmhocHR3SnZ2cTBhZXA0ZS9G?=
 =?utf-8?B?UEVrYVc1aHh3ZW5NWU1lRDVCbGgvNzFXSTFsK0pJS0QycUxwWnMxYnhlTUZm?=
 =?utf-8?B?d3EyMHhVYW5QNTdvbjNiQVF2d2luYWR1dGhkK3VlN1lYWUd3SmdlOUtQMHE0?=
 =?utf-8?B?RzhXTEI0UXd3Tjh2NEpiSkpmVU8zTytIOGNzcGJJekczdDlJQ0g4NWdkd0M0?=
 =?utf-8?B?WHdhVFRVWFpOd2pnYlNLYkhzZ0d2bjdObi9DVDZ5TVN4N25WRFZhbk9NU3Fj?=
 =?utf-8?B?SW94R0dVcGZtSUdzRnkvMHhhVkZETW1tbzdCdWRlc0QxYXZHNVAzWnhZZWwv?=
 =?utf-8?B?UC84aTBhUWtJM1ZEZUNpcThkeng5MzJvemM1L1JJb2tpc3E4QTF3VVkxcUo3?=
 =?utf-8?B?eTNsbXg3RjFBZHRqVENueVB5RmRRbVBXTE5kdXg4MVpsUldvZHBpNDVQSUI5?=
 =?utf-8?B?TEdoRUVQSnlUZHpYaUdLMGRuaE5UVjMvenYrM1M4Qm9wemQ3cUwwNmxDK1hl?=
 =?utf-8?B?cmtOZmpmNC84Z2JJMllCRTRTQ1NnS25hMThHcHF3Y1FnVlhESXNJdjg1RU1Q?=
 =?utf-8?B?ZExGcWRQa1BOMGMxNFhBd2kwSmNpWDBNakQ2QlFSRndmZFRoY0dLQTlwbzVr?=
 =?utf-8?B?TDVMZE9KMXBuQmlrMmxJZy9rcWQ3ZmNJdDdlbkJVS1Y4MGZQSnNxMHZLb2Qv?=
 =?utf-8?B?VFdzV2RhZlgvZU95TjdkcWFzTkFRM1QwRlpyc2ZNak5jdkJRaUpKcExNWlFH?=
 =?utf-8?B?Zmx5bG9pVkxxMERZRE80eW9kQ1hqRjhybURkd3djQ04yMEZKaTRrOFpYdC9q?=
 =?utf-8?B?eVQ5dmNra3UyZ3NuVDR3Qkg0N3NUaFRLVEZtaGx0MGJnTkdwcVlMSUpLTGZh?=
 =?utf-8?B?bEVVeU13QTZFbWlOZ0E3UHozN240cUxYRmxIYTQwWlB4QTg1TURNK00yUHZr?=
 =?utf-8?B?OHhiaTVKZElNcHZ2YjNyWHBJWTNwSFUzWTlwWGhBR0YrZ0NKTE82Q2tZWmdz?=
 =?utf-8?B?cTVRR1VtTG0yZ2VnZGN3eFFSRFltR1hrR0hQU0NsaXJ6SU8xNmRtT3hmRXVQ?=
 =?utf-8?B?SGdjS0JSNjNWcDZIUS8zR01mRUV4ODd3QitjU09rY0xOTjBRRGc4eWhWdG9J?=
 =?utf-8?B?Wmsrc0FTUU9aZlBodVVvQmkxaUN1WlQweVhSZE9VUmJSNmtvYWVZOEN6b1hv?=
 =?utf-8?B?VWZvL3Z0WXM1VVpuTjY3R1RJbnhpcW8vMmFoQ0d5TU9YK3dBMjhnSVFsTlVL?=
 =?utf-8?B?amI1cFRoaU1yTlVVbHB5WEt0UlBHcllHTEJPeVB1NFRQdUtQL1kyOSs4T2M1?=
 =?utf-8?B?TWZOM2NJNTBJakNXQjhUL1NmWDJwdzRyT0RvUWhhcnRXVXc1ekpFMnUwUlpZ?=
 =?utf-8?B?ZzZ6SEt1UkhTNVlsQUM2anFPMDhTVU5HVk5UL2RZRlZYenB1ZTdsbm0yYlEx?=
 =?utf-8?B?YVZGbEJCQVhTbVBGS0FweDJGS1RSTk9COEtVRGw2L1YrZFlZcUNZOW9xRDVP?=
 =?utf-8?B?VUlDcmhvcXpqOUE4aHZRZVpGdjRYeE1LM0JTTGJSakF4N2JQR0VBMHZnOG9Y?=
 =?utf-8?B?c3Z0WmZsUjhsNWtZUytxNzVnVTFmUlJlWG55eXgxRmNMa0hKU0RHWDlnLzlS?=
 =?utf-8?B?WENKZHRnWHUvK2RMWG1oVTFFTnJZbjYwSS9NcGZYRGw4UEExUVhUL1p6OVdV?=
 =?utf-8?B?d0l3RkVoMWdaUzNjNjIwNWZTd1grNHB4bHk2TWhHRmJIcCsvRSt3ZXg5NUcv?=
 =?utf-8?B?TDF2SnpNbk51eElRQXJiL3BjTlZEcXI2REJsdndrV0RWb000akxyY3FLS1pB?=
 =?utf-8?B?dm8zU1FUdm1qem5kTEE3c0hmYllyczZ6WUVVVWJ1QWxWY3pPeDZyRlN5SElp?=
 =?utf-8?Q?D/PzLahrOsPvldY3JpUAzXGy2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad74a32-4c6b-442b-9e28-08dd6d16d1b6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 10:04:53.3858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WreKvsr67EsMBZpp/ndF0c9iiZZacvNEwjqvRJXovt1Cw5Svz8GCKJ5428HaVecY0oD3FqxvlVvoauxKftUNdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7919
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

Hi Marcin

On 3/26/2025 4:20 PM, Bernatowicz, Marcin wrote:
> 
> 
> On 3/21/2025 12:09 PM, Riana Tauro wrote:
>> Provision and enable 2 VFs with execution quantum and scheduling policy
>> set. Add a test that runs workload on all functions simultaneously and
>> validates that all engines are equally and fully loaded for the
>> entire execution quantum of the function
>>
>> v2: add a different function for function config
>>      add function details to log
>>      move pmu_fd to struct
>>      enable and provision VF's (Umesh)
>>
>> v3: split patches
>>      move exec_quantum to variables
>>      skip test if vfs are already provisioned
>>      fix assert (Umesh)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   tests/intel/xe_pmu.c | 129 +++++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 129 insertions(+)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index f0959abe2..9a1f9b39e 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -14,11 +14,13 @@
>>   #include "igt.h"
>>   #include "igt_perf.h"
>> +#include "igt_sriov_device.h"
>>   #include "igt_sysfs.h"
>>   #include "xe/xe_gt.h"
>>   #include "xe/xe_ioctl.h"
>>   #include "xe/xe_spin.h"
>> +#include "xe/xe_sriov_provisioning.h"
>>   #define SLEEP_DURATION 2 /* in seconds */
>>   /* flag masks */
>> @@ -124,6 +126,12 @@ static uint64_t get_event_config(unsigned int gt, 
>> struct drm_xe_engine_class_ins
>>       return pmu_config;
>>   }
>> +static uint64_t get_event_config_fn(unsigned int gt, int function,
>> +                    struct drm_xe_engine_class_instance *eci, const 
>> char *event)
>> +{
>> +    return get_event_config(gt, eci, event) | 
>> add_format_config("function", function);
>> +}
>> +
>>   /**
>>    * SUBTEST: engine-activity-idle
>>    * Description: Test to validate engine activity shows no load when 
>> idle
>> @@ -187,6 +195,73 @@ static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci, un
>>           igt_assert(!engine_active_ticks);
>>   }
>> +/**
>> + * SUBTEST: all-fn-engine-activity-load
>> + * Description: Test to validate engine activity by running load on 
>> all functions simultaneously
>> + */
>> +static void engine_activity_all_fn(int fd, struct 
>> drm_xe_engine_class_instance *eci, int num_fns)
>> +{
>> +    uint64_t config, engine_active_ticks, engine_total_ticks;
>> +    uint64_t after[2 * num_fns], before[2 * num_fns];
>> +    struct pmu_function {
>> +        struct xe_cork *cork;
>> +        uint32_t vm;
>> +        uint64_t pmu_fd[2];
>> +        int fd;
>> +    } fn[num_fns];
>> +    int i;
>> +
>> +    fn[0].pmu_fd[0] = -1;
>> +    for (i = 0; i < num_fns; i++) {
>> +        config = get_event_config_fn(eci->gt_id, i, eci, "engine- 
>> active-ticks");
>> +        fn[i].pmu_fd[0] = open_group(fd, config, fn[0].pmu_fd[0]);
>> +
>> +        config = get_event_config_fn(eci->gt_id, i, eci, "engine- 
>> total-ticks");
>> +        fn[i].pmu_fd[1] = open_group(fd, config, fn[0].pmu_fd[0]);
>> +
>> +        if (i > 0)
>> +            fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
>> +        else
>> +            fn[i].fd = fd;
>> +
>> +        igt_assert_fd(fn[i].fd);
>> +
>> +        fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
>> +        fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
>> +        xe_cork_sync_start(fn[i].fd, fn[i].cork);
>> +    }
>> +
>> +    pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, before);
>> +    usleep(SLEEP_DURATION * USEC_PER_SEC);
>> +    pmu_read_multi(fn[0].pmu_fd[0], 2 * num_fns, after);
>> +
>> +    for (i = 0; i < num_fns; i++) {
>> +        int idx = i * 2;
>> +
>> +        xe_cork_sync_end(fn[i].fd, fn[i].cork);
>> +        engine_active_ticks = after[idx] - before[idx];
>> +        engine_total_ticks = after[idx + 1] - before[idx + 1];
>> +
>> +        igt_debug("[%d] Engine active ticks: after %ld, before %ld 
>> delta %ld\n", i,
>> +              after[idx], before[idx], engine_active_ticks);
>> +        igt_debug("[%d] Engine total ticks: after %ld, before %ld 
>> delta %ld\n", i,
>> +              after[idx + 1], before[idx + 1], engine_total_ticks);
>> +
>> +        if (fn[i].cork)
>> +            xe_cork_destroy(fn[i].fd, fn[i].cork);
>> +
>> +        xe_vm_destroy(fn[i].fd, fn[i].vm);
>> +
>> +        close(fn[i].pmu_fd[0]);
>> +        close(fn[i].pmu_fd[1]);
>> +
>> +        if (i > 0)
>> +            close(fn[i].fd);
>> +
>> +        assert_within_epsilon(engine_active_ticks, 
>> engine_total_ticks, tolerance);
>> +    }
>> +}
>> +
>>   /**
>>    * SUBTEST: gt-c6-idle
>>    * Description: Basic residency test to validate idle residency
>> @@ -225,6 +300,33 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>>       close(pmu_fd);
>>   }
>> +static unsigned int enable_and_provision_vfs(int fd)
>> +{
>> +    unsigned int gt, num_vfs;
>> +    int pf_exec_quantum = 64, vf_exec_quantum = 32, vf;
> 
> Are those arbirtrary exec_quantum values ?
yes these are arbirtrary  values>
>> +
>> +    /* Enable VF's */
>> +    igt_sriov_disable_driver_autoprobe(fd);
>> +    igt_sriov_enable_vfs(fd, 2);
> 
> Perhaps we want to skip if sriov_totalvfs < 2 ?
Will add this>
>> +    num_vfs = igt_sriov_get_enabled_vfs(fd);
>> +    igt_require(num_vfs == 2);
>> +
>> +    /* Set 32ms for VF execution quantum and 64ms for PF execution 
>> quantum */
>> +    xe_for_each_gt(fd, gt) {
>> +        xe_sriov_set_sched_if_idle(fd, gt, 0);
>> +        for (int fn = 0; fn <= num_vfs; fn++)
>> +            xe_sriov_set_exec_quantum_ms(fd, fn, gt, fn ? 
>> vf_exec_quantum :
>> +                             pf_exec_quantum);
>> +    }
>> +
>> +    /* probe VFs */
>> +    igt_sriov_enable_driver_autoprobe(fd);
>> +    for (vf = 1; vf <= num_vfs; vf++)
>> +        igt_sriov_bind_vf_drm_driver(fd, vf);
>> +
>> +    return num_vfs;
>> +}
>> +
>>   igt_main
>>   {
>>       int fd, gt;
>> @@ -254,6 +356,33 @@ igt_main
>>       test_each_engine("engine-activity-load", fd, eci)
>>           engine_activity(fd, eci, TEST_LOAD);
>> +    igt_subtest_group {
>> +        bool autoprobe;
>> +        unsigned int num_fns;
>> +
>> +        igt_fixture {
>> +            igt_require(igt_sriov_is_pf(fd));
>> +            igt_require(igt_sriov_get_enabled_vfs(fd) == 0);
>> +            autoprobe = igt_sriov_is_driver_autoprobe_enabled(fd);
>> +            num_fns = enable_and_provision_vfs(fd) + 1;
> 
> The drawback of enabling VFs inside this fixture is that it executes for 
> each subtest outside the subtest group (e.g., engine-activity-load 
> above).

There are only three tests for this feature so added in the same file
instead of creating new test.

> It might be worth creating a dedicated test with sriov in its 
> name and considering not limiting it to just two VFs.

Are you suggesting to use this and get random vfs.?

for_random_sriov_vf(pf_fd, vf)

Is there anything for execution quantum too?

Thanks
Riana                       >
>> +        }
>> +
>> +        igt_describe("Validate engine activity on all functions");
>> +        test_each_engine("all-fn-engine-activity-load", fd, eci)
>> +            engine_activity_all_fn(fd, eci, num_fns);
>> +
>> +        igt_fixture {
>> +            igt_sriov_disable_vfs(fd);
>> +            /* abort to avoid execution of next tests with enabled 
>> VFs */
>> +            igt_abort_on_f(igt_sriov_get_enabled_vfs(fd) > 0,
>> +                       "Failed to disable VF(s)");
>> +            autoprobe ? igt_sriov_enable_driver_autoprobe(fd) :
>> +                    igt_sriov_disable_driver_autoprobe(fd);
>> +            igt_abort_on_f(autoprobe != 
>> igt_sriov_is_driver_autoprobe_enabled(fd),
>> +                       "Failed to restore sriov_drivers_autoprobe 
>> value\n");
>> +        }
>> +    }
>> +
>>       igt_fixture {
>>           close(fd);
>>       }
> 

