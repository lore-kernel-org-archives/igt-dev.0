Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E9E8CD11C2
	for <igt-dev@archiver.kernel.org>; Wed, 10 Apr 2024 10:13:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79B61132AE;
	Wed, 10 Apr 2024 10:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cQNX/sS1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EECE1113292
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2024 10:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712743981; x=1744279981;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=NyskEdsyU/p19SW4fKzQQfUG2vYlvESU7+lTikC5QjY=;
 b=cQNX/sS1N8TgrIVBdFoPSkk/d4HUp0ir2T0y1F/hVQRrs//ynUj9ri5P
 DrKY290SrxOL7eq050fJS5fwJ3vrPlk89Y5UbKwkIM57DX75C+YtlPQzf
 MnUP267fzbjCsnuiKaWVTQlESUlzi1BYceJoPBfC5CDM6R/430YYr4aE1
 FsGtj37nGxcSW1oLMnG6vaUNXmkp1IKSbpv4bX6CKFHz2o2hENjnVTTGU
 mmJgEU8L7ytHbDq7yaMyKqqwk1OND4NpL2ih5NaN83X40ZFX39RTDaMrH
 HDeNrTrAda9A9vFLEghUFmQP7CaGFtvq1nrHLekmJj5AEVJBQN+WA1ljV A==;
X-CSE-ConnectionGUID: tN7ZcY9XRp2DEiupVLdNFw==
X-CSE-MsgGUID: veve1uEGR9aqlHRfJ5oTew==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19525133"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="19525133"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 03:12:53 -0700
X-CSE-ConnectionGUID: BSkfBbn5S2Kci3IViiqPvA==
X-CSE-MsgGUID: nXRROinaQUC+/98eBIE8Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="51736935"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 03:12:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 03:12:52 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 03:12:52 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 03:12:52 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 03:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZQM2+BOk8SCmXZ2WNOOQFwbbpdizU+wr44DR6VxJcPDJfa7uHcMkFso356AnlmNZhGaw/zAknjsuwUxUT6rvcgGUpBxD52rGbt2Jyg+UK5EkscxDvZjR6rCGLhRuW2/ztJFkLjjGeGZRz+FWZkcfX7bp9tjXDa7hhCT+w+XWSDXEtszX60AGseY8l1+e/J/vGeuCQvK2HarmSbdh+FqGBTCJxdOWbFeflpHVtFnvZY96ZCBT+x1b5BOh56EaFnJn3ylvh6V82Up1P076sfHcYkJjyK0PYQNs9qbe/XHT4j0Q4g/f4DL3FoQfE84gy0Kumvr4ommsy8RVrooMI6+ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nNokhHqCbUdnokzFYq/NH6Y+PyCwfQm+jZT5fABwDFk=;
 b=dW3+5YgpWbKazDfPF04sCYe/Sk/t+mWyxbrkdrVlf0Dxe1mFuebOHwrgnyYY7aNzHtdhYr/I9CMoVY94L1HTdNh/oTO8XBXibuBNI4LUfxCoashAEnlUaJn4aW3kPfeIi/+oajNEw+/mokaeH5wVHg2RoZ7YYsZK2UoeF0DnVK1CantskxCz2Lv5A/QKZhD9OsU3IQTzRecT0rPa+R1Y4FWWbMCC0Ald1GixR/L31tLX8RzUy+2pwGyVYbRHa0ZXmDlVl8Yqqs3dZmb1YrRaXj25IPqNbbcGTZkK+c9Yr1WFSUUuFKjpL3P3UNrNoZqfoKzvY73UQC9Sk/ub0upD0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7388.namprd11.prod.outlook.com (2603:10b6:208:420::8)
 by MW6PR11MB8439.namprd11.prod.outlook.com (2603:10b6:303:23e::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 10:12:44 +0000
Received: from IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5]) by IA1PR11MB7388.namprd11.prod.outlook.com
 ([fe80::12e2:8615:27f6:95f5%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 10:12:44 +0000
Message-ID: <7911ca23-490e-42b1-8d3b-41b4d75887a0@intel.com>
Date: Wed, 10 Apr 2024 12:12:45 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] lib/intel_blt: Add functions which extract and
 check object ccs data
Content-Language: en-US
To: =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Akshata Jahagirdar
 <akshata.jahagirdar@intel.com>
References: <20240329091655.1347862-1-zbigniew.kempczynski@intel.com>
 <20240329091655.1347862-2-zbigniew.kempczynski@intel.com>
 <94371ee6-82a9-40a8-b29b-9ef459f3ac6a@intel.com>
 <20240410083331.pgu4aunpcefh4zkt@zkempczy-mobl2>
From: Karolina Stolarek <karolina.stolarek@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240410083331.pgu4aunpcefh4zkt@zkempczy-mobl2>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::6) To IA1PR11MB7388.namprd11.prod.outlook.com
 (2603:10b6:208:420::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7388:EE_|MW6PR11MB8439:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pKjQ/0PkEVhkQJWVwVuiKmfVAzdPrDdzsV7bVWwuzrropCrStSxKR94/QO83B0ar/OLnq63R7sK6WYFUdHZtB7ZcvOIAS7/npVVb53JZi1bBgNMfsaBgOMpwBLQuNyLbfsuRf6lpgW1ToQ7UgiX5TzKRWp5zecnqBFDTTMbU+iE56GKqMrXv4CIdJsFFC9Z8Ko11RWk3m7jIuVA1RTo897zPLelAw8LnhM13hKgJFifoptfklZLEaeZurW+P0wYrxbFQrKs6HNjDj6k1mCTswp/g+O+nbT3G63ieyOTaNxjQLrH2ZlYU/InHTx9Ym/ahQJ1FWXdHuXmIklLBz6BSb204QjXXxeMBEL4A7q2OvnQi70y/9gaHxwKI8cdV31Zuw7lJNeDY3X368boQ3wJYHJ7I4YkoSzsifgV2cVqGu36B5palEVkkvGRw51VXOQuJ61Z2VILKmfx73ofmVDdG5H0DWMPVGQd8zWV2hHHFxM7FXGBReGZHLpj1djjpyKWNDGe1LLS21RQm+i1AFKWFKbmGrjpPtzMiQJYh94+9yaLdbTTNWBYaPmSD/jjfaWQ4y/6mfw96sUKqGi3129VuH2a0IALNrkM9NQS+TTB7yzEcf7ioXRNSnVPPqvtPV5ixobKSLYBJqaIqgDrOOLzd9L+SWsatbe7elfXNi/WdyDE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7388.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWpWR0JLZklJblM2ZlJWVVprd090bDZCYmVBMjZzcWJ5NEZvMFBjYkdCbGRD?=
 =?utf-8?B?dHVvcEY2K1cxRW05QVFxb21VSjcwWU0vRHZPN3dLaHZ6VHpWWWpzOWx3L3FS?=
 =?utf-8?B?ZFBIVnF3S2h1MVBLVjE1ekgyR0ZTWkZPSDlVZGpqc0k2N3R4VWJVWGw2YTNk?=
 =?utf-8?B?bThmV09HRW1jMnR6ZzlBQW5KbGlHTmZ4Y1JYTDl5T0F2RXdmbVpvWVNObU0x?=
 =?utf-8?B?b1krTW4wWHR3ZEwxeGs0aFl5NHpna0gyQ1JrQnAwWnltTDJreUVsRUVqMi9O?=
 =?utf-8?B?MkpyRGE3cERQUzljKzBqT3MyTGgrRmtjVVVicTJRTlBWSEdrWk5Qd2hkL28v?=
 =?utf-8?B?cy9QRWllOEpqVnpuODhTOEF2SHhlVnlVTW55bFdocStiU0RKTHBuQ3FtNDdv?=
 =?utf-8?B?YjZmVmp1akM5OUJpRVZkMGZRS3ZBc3pjT3djVWtRRXdnbFZxSmYxL2VVV0ta?=
 =?utf-8?B?czU5aFBBNlBBczBpTXNFZ1BGR3lMNnYzcmx3T1BQLy9OeEpDYzJ3QlRDUTVw?=
 =?utf-8?B?VkY4MHNqcGo1c0U0TUlXUHVlczg0dGl0cGRwek5idGtnVmVRelFXOVFLWHFS?=
 =?utf-8?B?S2FmVVlsbjBxZWtnM2VUWWlVQWxrdEY3b2d4amw2dmh5V1g2RTlaUlJHczJY?=
 =?utf-8?B?dWNyeTlXMUxBQ1RmV3ZnZ1lNaDViSitaOHlHeCtRN3JqdXIvSVlmNU5pbEZL?=
 =?utf-8?B?YjlMZ0VOWitlRU8rMkozUEFRRkJlQlhwUnVQWjNFUTU1ZUhtMUJyeE9HQkZF?=
 =?utf-8?B?U0RwYjI2c00rcFovd1MwWFR1VER6UjY4UHE5QzExM2VjU2JXRk5hQ0VITUpX?=
 =?utf-8?B?aVhKRjhmbVRmTTRxZGlodFQ3OTBBRE5TdTh4RlBZOGtza2VOSnU4ZERCNHYr?=
 =?utf-8?B?dkRXQzQrQmJoVGlEWU96SmtkS1Nqb2RzbjhMYmxuOG9IRStTNys2OGx3WHZt?=
 =?utf-8?B?anA5emtMTUswbEZpYlljWlgwQUxqSStJQy9iWFA4QzF0MjB1T2w0OFZFQWNy?=
 =?utf-8?B?ZG5VQXdPbE13ZnlFcW9TR3k3dVd1dko4WGZhRmZVVmRVWjhBSVZWdUMwdUho?=
 =?utf-8?B?TzNCaysyU2dDRGNqV0FFWk9mcUZSbCtQYThXZE9DakJMTXk5ejJNYkVtdTI3?=
 =?utf-8?B?N0ZMRGRpQi93ZE5sQzN3ZUJJK3laVUhmamlGVlpDMzkxWjNFaStQUmVHL2ho?=
 =?utf-8?B?SjhDeHRIY2hQbmcxOXpBaW9JakRtQkhxOUVUY3hudVNOL1lnSVdwVXdIZERZ?=
 =?utf-8?B?bC85bmx3MWJDdDBJYXFreTAxd2ZNdGFtUmpDZ2duVmJoek5oZHE5bjc1UnQ4?=
 =?utf-8?B?MXN3WEhNOEpkQjFJdHdZaEhVMWk0QTdTYlhyczBwbmhhSjczTGdEa3NESlQ5?=
 =?utf-8?B?aEU3SCtFVm5ZeXM1Wk5qL3lMRlE5Y1pwS1k0VVF2RS9LZDk2SU91VEdmT2dO?=
 =?utf-8?B?c0RaeElScm04c2dJbThFSk12VkFNMkdlMVRQWmpSdXo3dGtQMEZBWjRESXR6?=
 =?utf-8?B?dG1PdFFrZGtEQjZleGZ5cDdYeDlXWjFwRnQwTkhRR1BORTNFU2RaQmZXWGQv?=
 =?utf-8?B?MThGU2xaK2JYSWs2ZGVyaDR1U2tQMDZ3MXFkNHBrQUdtczAydkt3S0hidnNH?=
 =?utf-8?B?ZTVGREN3ZFpJL3NSNFN4Qm9uU0VBUWRwZ2NRYy9WMFZHU3JlR0VwVnhRUzhu?=
 =?utf-8?B?MmxVd25KTHRqS2JTR0U5QndteU55YjBtN3JtYXBNS3JyQjhORVYwaU9STjJT?=
 =?utf-8?B?TVJZaVcvTTM4K3RzRHpwUCtwdm03eVJUN3ZSRG1LR3lRMFQvRWZ5R3NuV1lj?=
 =?utf-8?B?NUdTNEIyUFNnc25BUjFjMkVtanNsUk5BMnl3NExtTXVNMm1CODlhbEEyS3ZG?=
 =?utf-8?B?ZWQ0OG9FbFozeUlPcTlQamdMUWxORWlxZGQ2RGpseE9aU1AxRjNyelFtTkhh?=
 =?utf-8?B?TGRvSHZmcVpOT0ZtMGZPbm4zTUhIelJQckxRMDFUVkVSNXpuZ0U5RVI2WTlT?=
 =?utf-8?B?OVpwU0x6SXF0eU9nUzJvNTcwY0dlTVRwaEFqejRLdU1FcW5SdU9NbjFuOTNM?=
 =?utf-8?B?YnBXUDdDVGlWRzNGU3pXWW5xY3UyZHVPVGE3amx2TEFvSnRCMlZQSzZ4aHV0?=
 =?utf-8?B?UkVUOVFQK2p4WEhia1NwWnJ1aTZLeGNqSGlLY0k0V0N1akhia2tPd1VTdFd1?=
 =?utf-8?B?TUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1659bc76-caab-466b-40f3-08dc5946c389
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7388.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 10:12:44.4713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HJWDTyqZhiXRiWyUfh6pL7HHJbdahJWoWSPUgb919OB8FyQh48+8dD583pnbvkhJYMs/lQD/587IinoBdYltCKtkg1P+S5Vi/t33+/l59Gs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8439
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

On 10.04.2024 10:33, Zbigniew Kempczyński wrote:
> On Fri, Mar 29, 2024 at 02:31:36PM +0100, Karolina Stolarek wrote:
>>> +
>>> +	blt_ctrl_surf_copy_init(fd, &surf);
>>> +
>>> +	ccscopy = (uint32_t *)malloc(ccssize);
>>> +	igt_assert(ccscopy);
>>> +
>>> +	if (surf.driver == INTEL_DRIVER_XE) {
>>> +		uint16_t cpu_caching = __xe_default_cpu_caching(fd, sysmem, 0);
>>
>> sysmem is undefined here, I'd move the definition from below to here (i.e.,
>> to the line before cpu_caching).
> 
> Eh, well spotted. I've added xe path first and most variables were
> defined on the function beginning. When I've extended and added
> i915 path I've missed that.

No worries, that's what review is for :)

>> Apart from that, the patch looks good (+ one nit below). I haven't test it
>> on my machine, but I trust you played with your changes to verify their
>> correctness :)
> 
> I've tested it on xe/xe2 machines and I didn't notice any issues.

Awesome, thanks. Once you fix the spotted issues, feel free to add my 
r-b to both patches:

Reviewed-by: Karolina Stolarek <karolina.stolarek@intel.com>

Many thanks,
Karolina
