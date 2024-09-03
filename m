Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A045DCD37AE
	for <igt-dev@archiver.kernel.org>; Tue,  3 Sep 2024 20:45:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B97B10E528;
	Tue,  3 Sep 2024 20:45:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="n4+f+4MH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46E8D10E464
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Sep 2024 20:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725396315; x=1756932315;
 h=message-id:date:from:subject:to:cc:references:
 in-reply-to:mime-version;
 bh=xUjdREV2+VupBxMv6nhFoSsB4lA2G3aRDT4H5r1JDEk=;
 b=n4+f+4MHs+c5HutiL7Y928ti12zKq9qNnVhyGZtoNF9XGfoyiv+RVtLt
 +YHiuWFfE3T0FXIlJoBDZn+t3k2kdAtJAaOZwlnZym5KoR81XFtfgAyJ2
 44W++wVCK+IBMycmSbxeJ7G4W90rL7IwZ4taksVXMLepZNCemx+JNIX8I
 YuAII9edXq5GNrtPkwVFEInziN34q2Po6uOSYp0HLbkgkXqVLFwFkkf0C
 wTE+qoAWbXVeEX1Ha44pgDGgXdY9a92qe378u8PNoaAOPivRsxikJlzud
 rFqmXjtIoqzXjMRinNxrpS75pztiMbcxz1rpgens68ppf7oRxv6bIuxja w==;
X-CSE-ConnectionGUID: c8/CrYBQRf685a41CKw6Cg==
X-CSE-MsgGUID: hEmPfPEUTEatquG6UWR2tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="35413595"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208,217";a="35413595"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2024 13:45:11 -0700
X-CSE-ConnectionGUID: jiGU38yJShG4mtko0xuz6g==
X-CSE-MsgGUID: SKWv6uesSPuTK98PHaerew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; d="scan'208,217";a="69902823"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2024 13:45:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Sep 2024 13:45:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 3 Sep 2024 13:45:07 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 3 Sep 2024 13:45:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fHRwKx+Q9I+RczLM398szTkIu88s6v6nhkJUhQ+cb437XqknoeyqbnNAQERYCTs02mUdPwtAK8FKT2wZd/YWSKGVuao9WvNUG1Uc5CHZgvD3PrZBlnQ82Q61AMhdIcl/7h/xDniiBSx7L4KTdPBz9y9Od1UsonEs+uVyQ7096ranesB+uQAnjtd76lFMVPK2Llxq+QrKWi8eQZiEjxPBgX3fnZy0BOtHul0+7GSrQZ6eSbIbtQuSl638CkCwe2K0QUaLmHYszY92zXs+aJ++BWnWP8nt3gIVP1ZooeNMkGmj25xGo0LV6L2aMYf/a7D24ipJKcCgn52YL21z5EB0SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcDGVR6GsdsQcSpdml6oka9ZVG0sFBSi0ZmAI6n0Jdc=;
 b=QArUEDh1FYn8i6VOtEtvRRbedXtkvksSEt89nwQmY2fF7a/RtdXC4ef5y/WUVayTPPrf4k9QkDZk1W73g870cfSKJ4cCM2wgwGJhbLL8klQACaaLkG4hRfTmVr+VokltemG+1579uG/Df1PhJdHHES/PJ+SFap+qFbulCVV2cl1BrVgDLhlNMc3XS6G5FQiuqlB4tFPS7dEfRZNOXdoen0q4mBF70erBnn/tiHnoK7ie4DgbxsQRL/76fyCkuauKcu/Ldr5mscqup++YjUmWwQ/tqJ2PuRIftaeIBwSq47SrNuyQZ71ztOd3Y8XDCf/gDI0bU6GwDafGhHeSDm4fnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 PH7PR11MB6330.namprd11.prod.outlook.com (2603:10b6:510:1fe::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Tue, 3 Sep
 2024 20:45:04 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%3]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 20:45:04 +0000
Content-Type: multipart/alternative;
 boundary="------------ayMaTXDnLo8WEfr3CLECrTW8"
Message-ID: <c7b8d319-e1a6-4213-9616-8b680141af1e@intel.com>
Date: Tue, 3 Sep 2024 22:44:57 +0200
User-Agent: Mozilla Thunderbird
From: Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH i-g-t v4] tests/intel/xe_exec_fault_mode: Don't return
 early
To: Andrzej Hajda <andrzej.hajda@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Tejas Upadhyay <tejas.upadhyay@intel.com>
References: <20240829180051.3286-1-nirmoy.das@intel.com>
 <fdf77e79-3ab4-4209-93d0-d084f31cc27e@intel.com>
Content-Language: en-US
In-Reply-To: <fdf77e79-3ab4-4209-93d0-d084f31cc27e@intel.com>
X-ClientProxiedBy: TLZP290CA0006.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::16) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|PH7PR11MB6330:EE_
X-MS-Office365-Filtering-Correlation-Id: fdcab6ba-9209-4995-0be9-08dccc5949d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUUwQXE4bk5JQ09vZUpPTnVjOHc2ZlZaY1d1OVVIb0ltZkdFR2luRFhoNDJB?=
 =?utf-8?B?RWFrdjdjUVBheWl6andaUjgwbXlJWTJrQ1pUbWlLRi9FQmlrMDVqMUJxNXFU?=
 =?utf-8?B?V3FYM0N6US9peTJHWDl4a290aXdMT3g0SEx1KzBDSW5yTGFkR3Zab1h0TXFu?=
 =?utf-8?B?VUNpbUR1c2N0alZRbmpOUGp0UmdIRVZGTGw5ZkhzcG1ocG5MalhSK2QwenBs?=
 =?utf-8?B?NjB1SU9QK2xuWUx5N0prMldFaUhmTlRERWN6L0tDcjlkVUxLNXRkNUlIRUJL?=
 =?utf-8?B?ZTlDMmkvVFFnQlNnaEtEOHFKK1J2aW5CUUVRVUtBSnJsRXpWNldnY2FXRlh3?=
 =?utf-8?B?bVVaYnpWNm9wYmRLa1NiaEJDT3Z3alkxbnJSYUFJQ1JtdEgzcHFYUjhnVnhh?=
 =?utf-8?B?RWtQSktQc2FJNEs1WVBYaDZsbGhJM2lLTEZGZHZyK2VNa01LZU5zbk9qRlBL?=
 =?utf-8?B?OGkvUFB4WVpNUHZIOGwwSk5FcDM3TkFoVVYvbHp3Wm56MUl2ZGZwWGVjeUcw?=
 =?utf-8?B?MkZIMGRWcHVYUlFwZWg4YzVBRGJWV2VCU01vQzVNQWUxblFUS0R0T1A3enlX?=
 =?utf-8?B?alFjWDBqTm51djVQSm9JUzhROEZvNWtCMytmOXU5d3JVTmxUcVJRdHBVLzlF?=
 =?utf-8?B?WUZ4Znp4MTd4RnFQRmJwUlJpZm1PY3hUZEF3K08vUW9PUFpieitnQlJUNlZY?=
 =?utf-8?B?d0dTZkZ1UitqVHJ6MUNmRkNiVTA0Z1Fsd3g2TStPSGV5UG9RVjAwaWpwWE9T?=
 =?utf-8?B?V2dwaHhJaGtJS0p1dVdocS8zaDIrT0hycjZ1WDlmUjFJQzdhZW1YRHhlNUMw?=
 =?utf-8?B?akFUSmJHUTNxR3V1dWVOU0FydFN1L0lSS21CRzFJWGs3cm4vWFZvbmpEWkFO?=
 =?utf-8?B?RlFMMzhoNnBmWi9ISVNnWk05akNNejBrcDBuNE9EUWdJM3Awekc4bm5oeTRh?=
 =?utf-8?B?dTNYYkhscU4xTW5oRGY3eDI2WE9VYjJiSGVJZGMxRjlSbUcrVCtNOWo5VnA0?=
 =?utf-8?B?eE4vcDNGOU1hR2p4Ykd4LzZreTFBSkIrc0wwN211cndwS2VuZHVnQkxCak5S?=
 =?utf-8?B?VFdqaVVEMzRTR1dLUXp5Q3IrR296T1dYam55SWF3T0ZCMXkzalg0RWFUZ1Nz?=
 =?utf-8?B?cFFET1Z5L0FyenRoMDFqQUVBTE9IM2FNMDhkdnJIUk5NRUxhblBUT0htZEo5?=
 =?utf-8?B?R0NGaVI5eWNweURuVHRyTHhxSklpRUJJTmVkZ2N0TFhYTGxTQ1ZLSEtFNmNs?=
 =?utf-8?B?ekg0M2J0WUFqRHJNR1JGbW9peC8zYU5ScVFJNVRGT1U5ZWJGeHF5MG9KMVJQ?=
 =?utf-8?B?VjFodW5ZczNwZ2tYU3phSjB4NVkvSWUybDVXM0tpMHJ3U2sxMUNpM3NVNExa?=
 =?utf-8?B?aGtVUTBkdzZMdVlyODhvUno4TkxiYXpIbjRNVjlSVVNJQ3FyQVhSWVFyR3gw?=
 =?utf-8?B?ODJaUFljdUJkUDBuOHNyWWJOZ1I3bjluWjQwNDhIMS81dUxWMEpTUkxSb2d2?=
 =?utf-8?B?emR6LysyUnc1NlB0S3cxeFI2YzJVL3dFbmtvUVMra0NSczZwN2h4cmNjWlFQ?=
 =?utf-8?B?YzVZRDZMMlVtdHhCRFhtTjMrbkVSOS8wa0FkcG5oTjRPVVJtYjc2Nmd5Tkhz?=
 =?utf-8?B?RjRlOGVCSW44bnVnZSsvVlVjbmh1NGVqbksyUmtyc1FiZFdZMy90YWVOMjIy?=
 =?utf-8?B?enFkMHBUNnNLdFZXSndaeGNGUmxEOWtCajZCb1EvdnZPa01aOWphb1JlTEsz?=
 =?utf-8?Q?ozLmjE3+Y6gAzIqzSU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWVhcDVUU3BMTThCTDlTUWtyYWdOQTVmWmttN1VNWko3dkZyU0hFaVRGU2Rj?=
 =?utf-8?B?aGluSUlzMW0vRktYS2N6N3lKQVAvRWVGN2ltYXFZVTFITmcwcTczTVFSVnFu?=
 =?utf-8?B?MnJPMmEyMTIzVEF2eTNwQ0t4NmxLT3VlZm5qSVdTSEVMZDI0RC9YVmRlZGpy?=
 =?utf-8?B?T2E1Z3Q5SVZOdUFKWXByenA3NWpDTE9XRmVsRkJHc0tralE0TktwRDBjaWxG?=
 =?utf-8?B?S2lQNE9DRS95dnVFOFpBdllHaGZGKzBCVFJXVFY1eERTMEljNkFFOVpuSWhS?=
 =?utf-8?B?bDE0VGxLV3RqYzUwWCtyOVl1VkdmM0J6VFdscDNDelhiKytMS3U1YWUzRis0?=
 =?utf-8?B?Qlc0eEpESE1kVFVheXBwdHFteWhMR3JlZXJ5bWZoa1hzQ1hhSnpqSTMyTytN?=
 =?utf-8?B?djlTKzJBb00yVFVsOU9zVGJRY09hRGJjWkRDdU95YUFOVXNrSUd4Um1vdVNJ?=
 =?utf-8?B?ME5Jd3BjaFo2czFmNzAxMzZ1MVZYdTgwNEJ6bUNQRVNUSmNRM3JJbElJeHRW?=
 =?utf-8?B?bUlsYVJReDRWQkpkZnVod2pQVWs1ZytsRCtJMEhGZEk1ZDhBNVI2UjA2YzhU?=
 =?utf-8?B?d2h0WHUyZWp6U3laWDQycDVLandZQk82R0dUa3lGNXRFVDRmUVlFOGFOTkpu?=
 =?utf-8?B?alhVakJvMHI5bmd5UjdPemk2UkZ3VU1TRTN2SFhDcmQzYXZCaGhRMXY1S0xN?=
 =?utf-8?B?L3NpNVZMV0lLOXZVVjdiK3RzSnFBQUlQaTFST0dpaU1jNjROVHBaSG5IdEE5?=
 =?utf-8?B?dFhBOTVFcXhNblcrZjI1OWxEK0xwQXEzVzZQK2h0eFpFdGk3L0M4SWtFRmFR?=
 =?utf-8?B?WFpaNFRZZTdmUTlBd0g1SGh2RzlMUjFXWlNjaGdQUk9GZkh4U2kvNUxjdTg0?=
 =?utf-8?B?R1FXSGxKbGJNRkVXc0o1MGdRZWJ0VnJOb3RhL2RQa2MwbkFuWWVHd0UvL2g5?=
 =?utf-8?B?SEpkaTBQOHRsMGw2RUdtdngxZjlXYlJuUE51NWdJTFRLWDh0U1hIelVGVC9p?=
 =?utf-8?B?cUpCM2FScWFSU0pQRGdqbGVnR3AxR0xyZm9uclRjQkx6NTUvSG5XTzAydnZG?=
 =?utf-8?B?bGxUeW9yd0h3R2l5UE5hL1Q0THRMMTFCVERteHNXb3gyK3RyS0tQYThaNnAw?=
 =?utf-8?B?dzhTWW1GUG5xQ1pveHVGdWhLaXZnbkY0eDNlV09XNFhIU1FZT3lTbzFMNllX?=
 =?utf-8?B?NG8wcVNKRm1mY0o4WDZ0Y2tPMEJPd0tLak9saW9KclhPb2RHdGZuVkhEYWdF?=
 =?utf-8?B?czJXK2thWldKZ3NPbG0xVWp2ZGN3MGd2RUJOQlhCVy9IdDZnMEJSUDB2eHI1?=
 =?utf-8?B?WkNyU2RDbmFkLzVIQ1NoazF0ZUdndTcvdGxHeDdvRkdLeW9VRms5cktEa01O?=
 =?utf-8?B?SnVoblVJUm85UTQzRWtsQjh2SXVVQ29FZTcrdGRKUHp5TmJVZXBvR1FQR2NR?=
 =?utf-8?B?eHNjMzZ5NWxHRFhmYkEyN0dRQ2lQYjhTUlU3ODZ6Y0pTdDhwQzM3UWpURUZy?=
 =?utf-8?B?UXpMTXBWaVluNVR5dStndFRYTnc3MmxUODR5bko4emtuclVzb1phdWNuTjYy?=
 =?utf-8?B?aWc1R1VtbHk2cEtaMG56OWpabWR2czFacXNNTWJtMCtSVTJtNTBSTlB4bUUv?=
 =?utf-8?B?OUN5NCt2ZEVISjMyQVphZlBha3dzYmw0WVBuSzB5N0xJNG1QbkFoVDhGTEdx?=
 =?utf-8?B?MjBnUWhPSW1VT2VWWHlLTDJsYU9ZWnk1N2RRNnozNVlqUVk2UkM2S3J6NERz?=
 =?utf-8?B?VHZrakJ2R2gwZTJJd0NHSlRFREVBVWZRWDQ1MGJwT1FuN1JjaFhkdUZ0ck9k?=
 =?utf-8?B?NnhjMm5uTGFxZmgxV2NlcElDM2I0SGMwS0dhcTMzVVZUOW8zMnNXb044empU?=
 =?utf-8?B?QmJ1Ri9jZVI5d01qZExTK2VnREljV0xyT2dPLy9ldHFRc2FXWWpPMFlONUtV?=
 =?utf-8?B?WkNMQ3R1YmtYOVk3NU5QUXZ5MFFiMFBDOVU5SkdkdzZJSTVvRHA4aDNXU0RM?=
 =?utf-8?B?S3QrNGJCRXRER1VvNWpBZE1DNTl2ZXBvUVJGclJPaXl6TDlhZkgzNVp6czRR?=
 =?utf-8?B?aS95Vk5TZEtyVlpKaFBmZjJjVlBkS21NUFZ1N214K3M4SnJ0L0hrZ25DMjA4?=
 =?utf-8?Q?kUtu6GVOD+SstyBnv2PGF0BgJ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fdcab6ba-9209-4995-0be9-08dccc5949d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 20:45:04.4983 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFszAhPgm0i7y0WU/WgoFUQ8sxkn4MwYTFZIaJVOoyBc6MN+9ZjnxVAIGiqII2a3ANe3hHa+sURfqrn1BE1GtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6330
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

--------------ayMaTXDnLo8WEfr3CLECrTW8
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 9/3/2024 4:48 PM, Andrzej Hajda wrote:
>
>
> On 29.08.2024 20:00, Nirmoy Das wrote:
>> Tests that are causing pagefaults should wait for exec to queue
>> ban/finish otherwise pending engine resets because of on-going
>> pagefaults would cause failure in subsequent tests to fail.
>>
>> Not all execs will generate page faults and in such case reading ban
>> property is not enough but the signal should either -EIO or 0.
>> so read that instead.
>>
>> v2: specify timeout reason and iterate over exec_queues(Andrzej)
>> v3: increase timeout
>> v4: check for signal status to be -EIO/0.
>>
>> Cc: Andrzej Hajda<andrzej.hajda@intel.com>
>> Cc: Kamil Konieczny<kamil.konieczny@linux.intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Tejas Upadhyay<tejas.upadhyay@intel.com>
>> Link:https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>> Signed-off-by: Nirmoy Das<nirmoy.das@intel.com>
>> ---
>>   tests/intel/xe_exec_fault_mode.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
>> index 1f1f1e50b..fa050d0dc 100644
>> --- a/tests/intel/xe_exec_fault_mode.c
>> +++ b/tests/intel/xe_exec_fault_mode.c
>> @@ -329,6 +329,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>>   				igt_assert_eq(data[i].data, 0xc0ffee);
>>   	}
>>   
>> +	if ((flags & INVALID_FAULT)) {
>> +		for (i = 0; i < n_execs; i++) {
>> +			int ret;
>> +			int64_t timeout = NSEC_PER_SEC;
>> +
>> +			ret = __xe_wait_ufence(fd, &data[i].exec_sync, USER_FENCE_VALUE,
>> +					       exec_queues[i % n_exec_queues], &timeout);
>> +			igt_assert(ret == -EIO || ret ==0);
>
> "ret ==0" - missing space.

I will fix it.


> Btw in theory we have n_execs * 1second  (128sec???) total wait time.


We will be trouble if this ever happens for one store instruction :) I 
could add a 1sec wait and then run the

loop but I think that is not needed.

>> +		}
>> +	}
>> +
>
> If I placed change correctly in the code it could be replaced by chain:
> if ((flags & INVALID_FAULT)) {
>     // your change
> } else if !(flags & INVALID_VA) { ... } 


That fits well, I will do that.

> Up to you. Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>


Thanks,

Nirmoy

> Regards Andrzej
>>   	for (i = 0; i < n_exec_queues; i++) {
>>   		xe_exec_queue_destroy(fd, exec_queues[i]);
>>   		if (bind_exec_queues[i])
>
--------------ayMaTXDnLo8WEfr3CLECrTW8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 9/3/2024 4:48 PM, Andrzej Hajda
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:fdf77e79-3ab4-4209-93d0-d084f31cc27e@intel.com">
      
      <br>
      <br>
      <div class="moz-cite-prefix">On 29.08.2024 20:00, Nirmoy Das
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20240829180051.3286-1-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap="">Tests that are causing pagefaults should wait for exec to queue
ban/finish otherwise pending engine resets because of on-going
pagefaults would cause failure in subsequent tests to fail.

Not all execs will generate page faults and in such case reading ban
property is not enough but the signal should either -EIO or 0.
so read that instead.

v2: specify timeout reason and iterate over exec_queues(Andrzej)
v3: increase timeout
v4: check for signal status to be -EIO/0.

Cc: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:andrzej.hajda@intel.com" moz-do-not-send="true">&lt;andrzej.hajda@intel.com&gt;</a>
Cc: Kamil Konieczny <a class="moz-txt-link-rfc2396E" href="mailto:kamil.konieczny@linux.intel.com" moz-do-not-send="true">&lt;kamil.konieczny@linux.intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com" moz-do-not-send="true">&lt;matthew.brost@intel.com&gt;</a>
Cc: Tejas Upadhyay <a class="moz-txt-link-rfc2396E" href="mailto:tejas.upadhyay@intel.com" moz-do-not-send="true">&lt;tejas.upadhyay@intel.com&gt;</a>
Link: <a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630" moz-do-not-send="true">https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630</a>
Signed-off-by: Nirmoy Das <a class="moz-txt-link-rfc2396E" href="mailto:nirmoy.das@intel.com" moz-do-not-send="true">&lt;nirmoy.das@intel.com&gt;</a>
---
 tests/intel/xe_exec_fault_mode.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/intel/xe_exec_fault_mode.c b/tests/intel/xe_exec_fault_mode.c
index 1f1f1e50b..fa050d0dc 100644
--- a/tests/intel/xe_exec_fault_mode.c
+++ b/tests/intel/xe_exec_fault_mode.c
@@ -329,6 +329,17 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
 				igt_assert_eq(data[i].data, 0xc0ffee);
 	}
 
+	if ((flags &amp; INVALID_FAULT)) {
+		for (i = 0; i &lt; n_execs; i++) {
+			int ret;
+			int64_t timeout = NSEC_PER_SEC;
+
+			ret = __xe_wait_ufence(fd, &amp;data[i].exec_sync, USER_FENCE_VALUE,
+					       exec_queues[i % n_exec_queues], &amp;timeout);
+			igt_assert(ret == -EIO || ret ==0);</pre>
      </blockquote>
      <br>
      <pre class="moz-quote-pre" wrap="">&quot;ret ==0&quot; - missing space.</pre>
    </blockquote>
    <p>I will fix it.</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:fdf77e79-3ab4-4209-93d0-d084f31cc27e@intel.com">
      <pre class="moz-quote-pre" wrap="">Btw in theory we have n_execs * 1second  (128sec???) total wait time.</pre>
    </blockquote>
    <p><br>
    </p>
    <p>We will be trouble if this ever happens for one store instruction
      :) I could add a 1sec wait and then run the <br>
    </p>
    <p>loop but I think that is not needed. <br>
    </p>
    <blockquote type="cite" cite="mid:fdf77e79-3ab4-4209-93d0-d084f31cc27e@intel.com">
      <blockquote type="cite" cite="mid:20240829180051.3286-1-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap="">+		}
+	}
+</pre>
      </blockquote>
      <br>
      If I placed change correctly in the code it could be replaced by
      chain:<br>
      <pre class="moz-quote-pre" wrap="">if ((flags &amp; INVALID_FAULT)) {</pre>
      &nbsp;&nbsp;&nbsp; // your change<br>
      } else if <span style="background-color:#ffffff;padding:0px 0px 0px 2px;"><span style="color:#000000;background-color:#ffffff;font-family:&quot;Consolas&quot;;font-size:10pt;white-space:pre;"><span style="color:#000000;">!(flags &amp; INVALID_VA) {
  ...
}
</span></span></span></blockquote>
    <p><br>
    </p>
    <p>That fits well, I will do that.<br>
    </p>
    <blockquote type="cite" cite="mid:fdf77e79-3ab4-4209-93d0-d084f31cc27e@intel.com"><span style="background-color:#ffffff;padding:0px 0px 0px 2px;"><span style="color:#000000;background-color:#ffffff;font-family:&quot;Consolas&quot;;font-size:10pt;white-space:pre;"><span style="color:#000000;">
Up to you.
Reviewed-by: Andrzej Hajda <a class="moz-txt-link-rfc2396E" href="mailto:andrzej.hajda@intel.com" moz-do-not-send="true">&lt;andrzej.hajda@intel.com&gt;</a></span></span></span></blockquote>
    <p><br>
    </p>
    <p>Thanks,</p>
    <p>Nirmoy<br>
    </p>
    <blockquote type="cite" cite="mid:fdf77e79-3ab4-4209-93d0-d084f31cc27e@intel.com"><span style="background-color:#ffffff;padding:0px 0px 0px 2px;"><span style="color:#000000;background-color:#ffffff;font-family:&quot;Consolas&quot;;font-size:10pt;white-space:pre;"><span style="color:#000000;">

Regards
Andrzej
</span></span></span><br>
      <blockquote type="cite" cite="mid:20240829180051.3286-1-nirmoy.das@intel.com">
        <pre class="moz-quote-pre" wrap=""> 	for (i = 0; i &lt; n_exec_queues; i++) {
 		xe_exec_queue_destroy(fd, exec_queues[i]);
 		if (bind_exec_queues[i])
</pre>
      </blockquote>
      <br>
    </blockquote>
  </body>
</html>

--------------ayMaTXDnLo8WEfr3CLECrTW8--
