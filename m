Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150E7C282DE
	for <igt-dev@archiver.kernel.org>; Mon, 10 Mar 2025 11:35:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A6810E0D2;
	Mon, 10 Mar 2025 11:35:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fomd4MLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D332E10E03A
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Mar 2025 11:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741606520; x=1773142520;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=I1FfVZqzh/IgfD25uAW0BG78suMjspj8LW1fZKPt3eQ=;
 b=Fomd4MLsC97bsRgEg38dyUQrFGcgqGZomIdVp+YTGG+YNpBFm6A8Ln3g
 ppbOmTlfjMOLKoIVCkom3iZ5RKitfXpoTSVHzIJ6CbapxMycSIUuHis9O
 B9bLVPiln7h23hTGBazbxOcw2cv4td3LswNyFGu67RsL2WVvunuSk2ADs
 HRjbTZEcf0+tVdsuIidIZdWy6vhh+Z6t/tI6a5gDiWqhRYPimv//qUw4Y
 VFgCKMLhIYVwvgt5YiLFeWnbtTSQ8flJQJM6zPhYgq3UFZI9CiamEUXxS
 FHSDzmfCn4gxLeNW2JvCG6myzD2v0uVY1BAy238JTcXvI41EIZIVs/H3e w==;
X-CSE-ConnectionGUID: CSAKW8GBSAqwEK9HEJKphA==
X-CSE-MsgGUID: RkKhrhikRw2LDtzBN0A4aA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="46249158"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="46249158"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:35:19 -0700
X-CSE-ConnectionGUID: mxM4KScoTheWgqvZd0XQSQ==
X-CSE-MsgGUID: f8SiWZaXQqKcerXtxpmzNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="119686815"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:35:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 10 Mar 2025 04:35:18 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 10 Mar 2025 04:35:18 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Mar 2025 04:35:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WX3fAW9CdmQ8svgMilH/50uATstPlvAczKNo1T8SNJAX0B9KdzSdCDeQJxaqeE8Ljb3kpIx3CCjZeSFKF+v1HNTi9cDYcU6GEKMgsWgX4FJ/8t4iqLdJ1qfdbQ1RDXea4vL6cp43tev9SMZlLADtSt3036rntDO/UeaQzRtAqrbdaTgAeF0JnvIZbg9PXNVmqy7x6QIIdPANwPBLrf+lfzNd2JGKiRKF8D9KuzKFS8XEUQDMPRlP8yC/NzKwQZEGkUhy+nveebVIpGfHHulXz714HkY0mXqZtoVDO/3fCz/YX3GHDs0BM0C6FQbccjCbGCjh9NBzgTkJLRIOOoB28g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vltHKqxD/OC+2f5jhJCzmz80QUSlAuAELoQytnb5uDI=;
 b=gFetClcB0cdxvu8ENUC1ylg1Gb4Sno1/TG0HT7izA0/1ZLP8+JAoJxGOzntuGvW21Co70MHcn7PAMDdtEDC4moxIcE2PKqDLKbkw87Zzsy6T9zfOBL+R6ADvrj0g4ObYGyjuIrAU6gTCppUKcgWqS4iRDfmXIZDYBD1DJqcl2CChGZVzfiEPBmq340fhYoqeBNb5CUrzeT1ZX97wbAp7YOjDAZMfDFC6ldeVaMavvf3UbYFd1NMp/omfdEiR0ToLeOvU80Fo+fkZibYbNYZYsrMXdyYk8JXgHp72CWi4+oSRyiHro9B9X7vz99D8qOyaL+3V+KUlrjoIMCknh1KoHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB8571.namprd11.prod.outlook.com (2603:10b6:510:2fd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 11:35:02 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 11:35:02 +0000
Message-ID: <3bbc3033-f602-4883-a721-2161c8420955@intel.com>
Date: Mon, 10 Mar 2025 17:04:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_pmu: Add function engine activity
 test
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: <igt-dev@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <lucas.demarchi@intel.com>, <michal.wajdeczko@intel.com>
References: <20250304101019.3274493-1-riana.tauro@intel.com>
 <Z8t0B1QDdptwOI09@soc-5CG1426VCC.clients.intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z8t0B1QDdptwOI09@soc-5CG1426VCC.clients.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB8571:EE_
X-MS-Office365-Filtering-Correlation-Id: 121e8463-58af-4cb8-9bcf-08dd5fc79871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajg5UGdHRjJZcVp4Vmo2ODdCVXcvRVRhQXZGSndIM1JVMjIvaGxrbWVDUkFn?=
 =?utf-8?B?Z09jZmpBbzUzWFNYcHJKMUkraklrcGgrMThHN3ZBT3dkQTRXYjRyNzE0UStk?=
 =?utf-8?B?ODdsWTZYM1RmK3FRbU10R0JXMDJKQlZvZ0J6RWdwbklCN2hnajlydW9TMVNU?=
 =?utf-8?B?Nnc1OEtBTlFGcVR1SVhQWkJvdDRNa2hqdWhrNGFwVVoxcmRsLzNtTEJrWlll?=
 =?utf-8?B?dDVsQWRYUDRVQ0d5VEJwV0d6Y0FnY3B0a2ozWnNaSE5kUEVRb3Rqc0o2ekY1?=
 =?utf-8?B?QWlKbnhRVHg5UmhqbVFiMU1WOVFPWk44c01Oa0FwY1pWekRKU3FGaGMxNHRU?=
 =?utf-8?B?R3BzcXJscjhNb2lnSmNzWnU4QTdqZkNGWTg4LzM0Wlg1RVJIZ2RydC9NNitX?=
 =?utf-8?B?d09pU0ZaR1l2TXNuSHRneTlFWE1GOVNLbVNNZGplVW9COXFib0xWRjhpVGV3?=
 =?utf-8?B?T09RRVFROXRXNWdXV1V1WG8wbUJxSk16QjBZZWVDQVhleWVZRmRqTktqRTFn?=
 =?utf-8?B?TmJZN0NNcVJMNDJzZytGc2RiQUJHdklHVlVzM3hLN0YrWU1sNUNQWWVPWHJn?=
 =?utf-8?B?a0FqWmtnWXRzY2dlVDFjTEVhU2VWbUJhaWppVEo1eEZ3Ukx0UXV2THRKajY4?=
 =?utf-8?B?L0RSbjNjSmtZVFFUK2F3ZFZOeFBYei8yN0haRTNaazJVbnVWRGlSVzNFaWph?=
 =?utf-8?B?U3p0aHFtb0RHQ3VaWGduMWVJRldpVnBsWXJqZy8rV0svUUpCa2VlVkM5RjBj?=
 =?utf-8?B?NnJ3Um5ZaWUrMmZXMkg1cmdYL2hCWTFiUDFtSGVsaERtcnVhdVNGRVNSODAx?=
 =?utf-8?B?clJELzJkUTVwT1AyOFM0Z3d0ancxbkRhZUptZm8wUk50ZjRhbmJodEpoMkJr?=
 =?utf-8?B?QkFIY2xNdmNTdTJYWmowYXZKSFhPZUx3aGdHTFE4Z1BzMjNKTDluanBTWnpY?=
 =?utf-8?B?ZUR6R3FISlVzZ1VxdE5nS25oakpJOThIa3FPT3p5OUJwOCtRVXozTCt4TEky?=
 =?utf-8?B?WDNsRklkaXJzVURJQlM3YmE3aVVwWFNxZ051bml5TTlWZGZHN1dRZmMxNUwr?=
 =?utf-8?B?NDZVbEtQcFJxbzRyYnVhdFlwcG9NVXRTZk1HUGY3MFRSWGJ6UGRPU2xsUGs4?=
 =?utf-8?B?NUdYcjluV0tLQ3pHVXd3MFM5cS9zelJqaXdTcG1tUGJNUU5XdFF1ai9sYURP?=
 =?utf-8?B?UlkzTmpNbG9Gak1HeElxU0ZHakJYa3d3MjhNSUJabXhPeGFKU0pMWnc5RlVk?=
 =?utf-8?B?QUx0NHpVRnZ2dmttanE3MkgxdEhVVm5Ua1Qzc2ZQdkhRbU9sdTRoNmZPOUJm?=
 =?utf-8?B?U1FMeDlrNEtGak1ZYWZ1bGptZHgzeFltM09SYnFDS1hvQTd1aytUYzN0OE96?=
 =?utf-8?B?akp6V1Fhc0RRN3U2ZStBZzFoSzdHVWxZZnNOYmIxbi9kYTVpOVNBRnVUM1NX?=
 =?utf-8?B?WjVBMHEzQmRYNEljVmdRbEZpY2ZlSEFrK1ZLYkhDNWs0MmJTeHJ6TEQrbFhU?=
 =?utf-8?B?NEhGc3ZQZEVabHlhZFM5L1E4Y2l1anFKSUI2d0NUeGs2TnUyN3lIOXlDVWll?=
 =?utf-8?B?Mm9Nc0hEd0hxb2ljUUt3SVF5QVpZcWcxL1MwOGNvZHlIelhSemIwMHUveGhy?=
 =?utf-8?B?TW1mbW1WS0pzcmFOeFExZm9CQ0VDc2N5d0RrZngwWFRVRFVSYXRhbnp5L2Fh?=
 =?utf-8?B?MHFOYlRnOCtzZndSY3hzQmk3YzhoZEREVXNRTXdnSkhJMnZLcCtnc3gvQ0Y3?=
 =?utf-8?B?OUpERUNQY0d4WlA1ODlKYWQzazVrQTRISFlmeEt2c3BmYjNRSWwyREZ5dmNw?=
 =?utf-8?B?OEVYdkZNUHRSdlFJckJZNzYvOGdJcUlCbUdsU2V2RHVZNXV2Nk1JcVVKdHJJ?=
 =?utf-8?Q?dc90T3tyD7tqU?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmZMKzZISmRnVEY3cklzYWdUMXMwT0EyaiszY1AwT1ppZVg0OFJTWXUraEFj?=
 =?utf-8?B?T0VzOWxpR1dFeEV4SzZONTZJM0dwc3Myb3BWU3R3VlZ0b0tKazNJbGhFS1Ni?=
 =?utf-8?B?amtMaVhwNkxkZmNWc3pwNm1GRTlaUEFvMGpJQnRtVGZLc0NOdUgrOXVPTWNk?=
 =?utf-8?B?d3JKUkowbGtNQ1FDTnd0NmVNZHJjY0Fqd1VDZmxJQkZ3NW1RR3MwSmJ3T1hh?=
 =?utf-8?B?Y1E4ekNhWkk3dlFnL3h6Mjc4eDNxK3NJaHdnUXpHTWRJNkNibktYZFhxM3Jx?=
 =?utf-8?B?RUdKTThxUHBlZ0NqZzdxeFNsZ0U0bUM3MjBYZFBvMlJSY2NrRVFBUWlBSHY4?=
 =?utf-8?B?dGp2SXcyYzdKTjdpcXVZQlNyWlNZaHhFdmh5TVhmcUYwdEJUclkveDJoanVh?=
 =?utf-8?B?a3RrUnRPa2plc0RJc1QxS0RsMWliSzU2R09WcTBwYjRvMFZyYmJSV0wwSU1C?=
 =?utf-8?B?dExTQlFFSHp1U1V1OFVPNkpZQjcyWS9hWis5ZUJ1Mk5pU2RSZmlRQWYyaGtE?=
 =?utf-8?B?SHluVlNOcHpmK0hkZFRXUVBqWUVnb3htRUpBTzBNQlMrenFGa2pjZGVmQ25h?=
 =?utf-8?B?RkVJVGZ4QXdOd1JPbVpITFNudmdyWERwRUxDTlAyMEtobWMwaHN3cE1yc2lq?=
 =?utf-8?B?djhNZVdkaVByY05pQUVyalhoM1VIMDRXK3RCTzNJbER2YkJISCtTWGxrb3Bi?=
 =?utf-8?B?NWQxZTR3TnFjQjdhZDJHN3FlT3pCU0RNTEJiYkc3RndjeFc0cXYvanhTWEtF?=
 =?utf-8?B?eldaMzQxWENGb3RyMjRwaGxpQkR6bTlNR09FV0ZpTG1rZ3REcWFKRTZzTTJQ?=
 =?utf-8?B?K09xdXlMSW1FSEpKYXR2UzRwd0dnc1NOMEhqTDRDTVFORmNoRzlEeS9JTllx?=
 =?utf-8?B?Q0pDcXZTQTJWT3AzVElBb1c0aGtCZER4aGsvMXcwZ21iZzRhdWxYQktoLzd4?=
 =?utf-8?B?bEtqWkRCVDdRU0FRcXptSWVsK2psU09lS0pTcVdSNkN4QWU0a3hUUnI4TURh?=
 =?utf-8?B?RTZFdGtWVXd6d3dodnBXbEJReVF0MXNEbndDNC85dmsvbU41dURUWE9PSkhM?=
 =?utf-8?B?R2QyUGlCbVMxQnU5VWdFZnp0OEFmYWJBUWtVTDEwdXZHYk9RY2NzVVhWbElH?=
 =?utf-8?B?OTVxU212eHd1V3JvcTdMZXVTanhVYzhyaWtFR1hOY0haN0hjYzFzOUlUL2NI?=
 =?utf-8?B?RDQ3MDE1MUdjQm0wem9IVFhQVmxWWjljbGdwakcxVkhrMXZCb2M1cVp0SU41?=
 =?utf-8?B?cndvVjJLQnF4QTRZWFhvbi9VUHZEN25CVGhnSjlLSU11dlJtVSswcjN2dTVp?=
 =?utf-8?B?ODMvTjdXM0Z1RWgrQmZIREcxN0J4VWFZVEwybVJkekJjSTdtZEZoOEM2V2ZW?=
 =?utf-8?B?a3YyWEZ5cWVtWW9jNG1Mck5uNzd3UmxPZXFmbk40dDVWbnBjSGRpYlRDTGRx?=
 =?utf-8?B?aG41eEp4Ri9nemxxVDYyY0k2dWZmVG9RRDNxaXZrSDBhcHQ5aUQvYmVhai9v?=
 =?utf-8?B?bzNqOFo5amlwalZCV2dOZU42R0pEU2FkK1RLUUJ0WUtQSUxXcXMzZ1VyUzRU?=
 =?utf-8?B?UUcydTlZL2ZFWk51RlZIbTZSZmJhS2lheWlmVTgzNjZEajQ3OEFIU0VtbkNZ?=
 =?utf-8?B?WjVwNEVpSmRZYk50Vks2eHJWR2VJOG1iRDVnbm9OZFRKQWhxUDRnU1RGMWtp?=
 =?utf-8?B?U0pUZnEvMVBSVW1mMGVOcDY1R1JyL3dwWmQ5VWxEaytucDlhbkxCN0NPRld0?=
 =?utf-8?B?bGVhZkZtVS8xZnFrdEhML0pwWjYwSGZXS1ZNUUR6SXdCQzU5S2FFY3FXRStL?=
 =?utf-8?B?QkxXaUJKVWpwUGZDU3JXSTJyRTdOdXNoaGJzSUZYMS81aFlIa0Jnb3VKRjEr?=
 =?utf-8?B?Q1U5ZUlkMUErTHExN1pYcElSbTBPMitjUlU4NFV0T0lBU2dGRmFkZWZlMjg1?=
 =?utf-8?B?V1B1cmVBWWZ6WEEvekM1M2pBcjNRb25maG52SzFDL293MUJncXIwMmdwRnhL?=
 =?utf-8?B?QW1JdG8zTjB1V0pBZTRSY1VsY0dBTDJVcVc3SlpOZUdzQzhtUGl3TDgvem0r?=
 =?utf-8?B?RExaMWxJb0VtZXRGZm9tUnI5KzhzODJvYnJJNVhZcXJVWm0zblZqTi90Z094?=
 =?utf-8?Q?va+bu74ZqTMykRqxa55MqE8oS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 121e8463-58af-4cb8-9bcf-08dd5fc79871
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 11:35:02.1014 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dliUzPRKZhkxnI4HT9hcCLM1uSwVUjjXtVykt+IeF2gTLhOnLgEh82pp3RWDRKRhdpYhJQhLwVoP+B66jg9BVw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8571
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

Hi Umesh

On 3/8/2025 4:02 AM, Umesh Nerlige Ramappa wrote:
> Hi Riana,
> 
> I am numbering the comments so that I can let you know if any are optional.
> 
> On Tue, Mar 04, 2025 at 03:40:19PM +0530, Riana Tauro wrote:
>> Add a test to validate per-function engine activity by
>> running cork on all functions simulatenously
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> tests/intel/xe_pmu.c | 89 ++++++++++++++++++++++++++++++++++++++++++--
>> 1 file changed, 85 insertions(+), 4 deletions(-)
>>
>> diff --git a/tests/intel/xe_pmu.c b/tests/intel/xe_pmu.c
>> index 4584fc7d3..5a93d581a 100644
>> --- a/tests/intel/xe_pmu.c
>> +++ b/tests/intel/xe_pmu.c
>> @@ -14,6 +14,7 @@
>>
>> #include "igt.h"
>> #include "igt_perf.h"
>> +#include "igt_sriov_device.h"
>> #include "igt_sysfs.h"
>>
>> #include "xe/xe_gt.h"
>> @@ -106,7 +107,7 @@ static uint64_t add_format_config(const char 
>> *xe_device, const char *format, uin
>> }
>>
>> static uint64_t get_event_config(int xe, unsigned int gt, struct 
>> drm_xe_engine_class_instance *eci,
>> -                 const char *event)
>> +                 int function, const char *event)
>> {
>>     char xe_device[100];
>>     uint64_t pmu_config = 0;
>> @@ -122,6 +123,9 @@ static uint64_t get_event_config(int xe, unsigned 
>> int gt, struct drm_xe_engine_c
>>         pmu_config |= add_format_config(xe_device, "engine_instance", 
>> eci->engine_instance);
>>     }
>>
>> +    if (function != -1)
>> +        pmu_config |= add_format_config(xe_device, "function", 
>> function);
> 
> (1)
> How about just have a new helper that takes in the function parameter:
> 
> - Make char xe_device[100] global to this file and initialize it in fixture
> - define new helper, something like:
> 
> static uint64_t get_event_config_fn(int xe, unsigned int gt,
>                                      struct drm_xe_engine_class_instance 
> *eci,
>                                      uint32_t function,
>                                      const char *event)
> {
>          return get_event_config(xe, gt, eci, event) |
>                 add_format_config(xe_device, "function", function);
> }
> 
> For any counters that are not function specific (rc6 etc.), they can use 
> the old helper.

yeah this can be done. Will add this
> 
>> +
>>     return pmu_config;
>> }
>>
>> @@ -143,10 +147,10 @@ static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci, un
>>     uint32_t vm;
>>     int pmu_fd[2];
>>
>> -    config = get_event_config(fd, eci->gt_id, eci, "engine-active- 
>> ticks");
>> +    config = get_event_config(fd, eci->gt_id, eci, -1, "engine- 
>> active-ticks");
>>     pmu_fd[0] = open_group(fd, config, -1);
>>
>> -    config = get_event_config(fd, eci->gt_id, eci, "engine-total- 
>> ticks");
>> +    config = get_event_config(fd, eci->gt_id, eci, -1, "engine-total- 
>> ticks");
>>     pmu_fd[1] = open_group(fd, config, pmu_fd[0]);
>>
>>     vm = xe_vm_create(fd, 0, 0);
>> @@ -187,6 +191,75 @@ static void engine_activity(int fd, struct 
>> drm_xe_engine_class_instance *eci, un
>>         igt_assert(!engine_active_ticks);
>> }
>>
>> +/**
>> + * SUBTEST: fn-engine-activity-load
>> + * Description: Test to validate engine activity by running load on 
>> all functions simultaneously
>> + */
>> +static void engine_activity_fn(int fd, struct 
>> drm_xe_engine_class_instance *eci, int num_fns)
>> +{
>> +    uint64_t config, engine_active_ticks, engine_total_ticks;
>> +    int num = num_fns + 1;
> 
> (2)
> s/num_fns/num_vfs/ everywhere since it truly is number of vfs.
> 
> OR
> 
> don't rename, but add 1 to num_fns when you call 
> igt_sriov_get_enabled_vfs().
> 
sure will follow the second suggestion
>> +    uint64_t after[2 * num], before[2 * num], pmu_fd[2 * num];
>> +    struct pmu_function {
>> +        struct xe_cork *cork;
>> +        uint32_t vm;
>> +        int fd;
> 
> (3)
> why not just include after[2], before[2], pmu_fd[2] inside this struct?

i tried this, before and after cannot be placed in struct because of 
pmu_read.  i think pmu_fd can be placed. will move that to struct
> 
>> +    } fn[num];
>> +    int i, idx = 0;
> 
> If you include everything within the struct, then you can drop idx. Just 
> use 0 and 1 index.
>> +
>> +    pmu_fd[0] = -1;
>> +    for (i = 0; i < num; i++) {
>> +        config = get_event_config(fd, eci->gt_id, eci, i, "engine- 
>> active-ticks");
>> +        pmu_fd[idx] = open_group(fd, config, pmu_fd[0]);
>> +
>> +        config = get_event_config(fd, eci->gt_id, eci, i, "engine- 
>> total-ticks");
>> +        pmu_fd[idx + 1] = open_group(fd, config, pmu_fd[0]);
>> +
>> +        if (i > 0)
>> +            fn[i].fd = igt_sriov_open_vf_drm_device(fd, i);
>> +        else
>> +            fn[i].fd = fd;
>> +
>> +        fn[i].vm = xe_vm_create(fn[i].fd, 0, 0);
>> +        fn[i].cork = xe_cork_create_opts(fn[i].fd, eci, fn[i].vm, 1, 1);
>> +        xe_cork_sync_start(fn[i].fd, fn[i].cork);
>> +
>> +        idx += 2;
>> +    }
>> +
>> +    pmu_read_multi(pmu_fd[0], 2 * num, before);
>> +    usleep(SLEEP_DURATION * USEC_PER_SEC);
>> +    pmu_read_multi(pmu_fd[0], 2 * num, after);
> 
> ok, I see why you haven't included before/after/pmu_fd in the struct. 
> Maybe you
> can still include pmu_fd within the struct since you are only passing
> pmu_fd[0] to all the calls (which would be fn[0].pmu_fd[0]. That should 
> still
> help get rid of idx in the above loop.
yeah this can be done
> 
>> +    idx = 0;
>> +    for (i = 0; i < num; i++) {
> 
> For this loop you can use a local idx = num * 2;
> 
>> +        xe_cork_sync_end(fn[i].fd, fn[i].cork);
>> +
>> +        engine_active_ticks = after[idx] - before[idx];
>> +        engine_total_ticks = after[idx + 1] - before[idx + 1];
>> +
>> +        igt_debug("Engine active ticks:  after %ld, before %ld delta 
>> %ld\n", after[idx],
>> +              before[idx], engine_active_ticks);
>> +        igt_debug("Engine total ticks: after %ld, before %ld delta 
>> %ld\n", after[idx + 1],
>> +              before[idx + 1], engine_total_ticks);
> 
> (4) Maybe also print the function num.
> 
>> +
>> +        if (fn[i].cork)
>> +            xe_cork_destroy(fn[i].fd, fn[i].cork);
>> +
>> +        xe_vm_destroy(fn[i].fd, fn[i].vm);
>> +
>> +        close(pmu_fd[idx]);
>> +        close(pmu_fd[idx + 1]);
>> +
>> +        if (i > 0)
>> +            close(fn[i].fd);
>> +
>> +        assert_within_epsilon(engine_active_ticks, 
>> engine_total_ticks, tolerance);
>> +
>> +        idx += 2;
>> +    }
>> +}
>> +
>> /**
>>  * SUBTEST: gt-c6-idle
>>  * Description: Basic residency test to validate idle residency
>> @@ -201,7 +274,7 @@ static void test_gt_c6_idle(int xe, unsigned int gt)
>>     uint64_t val;
>>
>>     /* Get the PMU config for the gt-c6 event */
>> -    pmu_config = get_event_config(xe, gt, NULL, "gt-c6-residency");
>> +    pmu_config = get_event_config(xe, gt, NULL, -1, "gt-c6-residency");
>>
>>     pmu_fd = open_pmu(xe, pmu_config);
>>
>> @@ -253,6 +326,14 @@ igt_main
>>     test_each_engine("engine-activity-load", fd, eci)
>>         engine_activity(fd, eci, TEST_LOAD);
>>
>> +    igt_describe("Validate per-function engine activity");
>> +    test_each_engine("fn-engine-activity-load", fd, eci) {
>> +        int num_fns = igt_sriov_get_enabled_vfs(fd);
>> +
This has to be done after pf check
>> +        igt_require(igt_sriov_is_pf(fd) && num_fns);
>> +        engine_activity_fn(fd, eci, num_fns);
>> +    }
>> +
>>     igt_fixture {
>>         close(fd);
>>     }
> 
>  From my end, (3) is optional.
> 
> Are you able to configure sched_if_idle? 
I tried by provisioning the VF's with execution quanta
If the results are for a
> specific sched
> policy, then I would add a igt_require in the test.
Yeah was checking CI, everything failed or skipped.
don't think CI will run this test except when vms are enabled. Will 
check if there is any sriov igt lib function to enable the vfs and set 
execution quantum or the sched policy.

Thanks
Riana

> 
> Thanks,
> Umesh
> 
> 
>> -- 
>> 2.47.1
>>

