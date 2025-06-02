Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C01C5B552
	for <igt-dev@archiver.kernel.org>; Mon,  2 Jun 2025 15:16:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB0210E54A;
	Mon,  2 Jun 2025 15:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1ugkHDO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AAF10E551
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Jun 2025 15:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748877365; x=1780413365;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Yn+9YJoBkC4fO1wSrtI8+DS1rdRJCGt3V4qvh+Q2t94=;
 b=b1ugkHDO7dEjVUtFonXSADwdssGUPZx22JnUWNPqIvMbMES8TGaN1DA3
 lOJgaADoLsd/V+hzqZYU0FhuhqSvGFOgW0nleMAzl2BcQynz9vALuoyN+
 ++POHrzMGCux6QJF+eDYMmN/Amflusahtatakn6ALArIoKALpG7xDdhsp
 s3zFTj+YP//z45/i7QkDTISUXUH0RYcbWD4NTf+RKz4a/+HKq6dqyepat
 NYHTXw5X+wDERUvEcayhNyeRo45wRutb8hPRt40Vn+25J7ZG19DUZy5jb
 P7XSkryNKvk2JqFunrArrEWNrBPpAwcnW7/nuaTG6Wdx1sEDvG7hs703P w==;
X-CSE-ConnectionGUID: NiG/RpMpSzqN9chCjhdMTw==
X-CSE-MsgGUID: EjPngCUgTlmVX0PKYz/HaQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50011685"
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="50011685"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:16:05 -0700
X-CSE-ConnectionGUID: a+csBHKmSuaW9lHAthTWyQ==
X-CSE-MsgGUID: EbnTZ1sTSmaYVy/eKdVScQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,203,1744095600"; d="scan'208";a="144530158"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 08:14:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 08:14:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 08:14:36 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.73)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 08:14:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9Dk1Rj6m+hd3wMsT+bfANHxoYdNo9wkPenPU7iuqltMhjaHlSG0mZpaNsIFlBqyK07urOcTrpgWV4YGy0cxBjaCvR2nN6r7EV60dePoDG7gWtwaRCcw4crzvaGjmHcvcbMk99jJXILZOX+cW1opveNy1UwcuUjb2+/ASNZMonSs6HDE/f9sR7JPjgDT/jI0IeHwYNCxkMaHPzhu8OstWVtHKX9iOyNDx10+0WlIXlZYb5BvEV47ax9EOiyuegzD/V93fb8CaMjcjGkj7vhmPQFLLp9Ia7DsDgbDEtB+7YgtReKBSDtm07RSfXajujjramb1AlJo+7w1Vp16zR1TlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZzmUazRXyGud5kNuEN3rIILlw5rj/hpxAbhAPSNOXA=;
 b=cdMKPQdXL/mmUApUwZnRvExSWcTqW9PTpTMEP3i0evdRK+Y4nyWVG2xjvmBHCZEgQiuOXgaOVQOUnCO0SqRh84CnCBueeN8MLytYqpQgaEFaG5Iyi61NuEXm60tr6O1siDHbu90wTEat8XegKEUVD6/DivRt568QcdtBje/YGEdY25x73vpCOGuLCR2TUInVYG1bSx+0oeoGLZWLdyxnRoSXwDp2TG2RzPLFi0RwquAq9syA/RTOjImZRA7fuitVwmBsdBna8PK7IPdeKIRJ4XuXK9Y7O4wBFYAUB4gHRtNkBzm09OKlSGZ6YxybVz8RGKM8AiF52yg9f6eqse+bgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7904.namprd11.prod.outlook.com (2603:10b6:8:f8::8) by
 DS7PR11MB7888.namprd11.prod.outlook.com (2603:10b6:8:e6::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8792.34; Mon, 2 Jun 2025 15:14:33 +0000
Received: from DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739]) by DS0PR11MB7904.namprd11.prod.outlook.com
 ([fe80::f97d:d6b8:112a:7739%6]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 15:14:33 +0000
Message-ID: <a0da5c25-4ad3-43f4-a418-c5dace6ff805@intel.com>
Date: Mon, 2 Jun 2025 18:14:35 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] tests/intel/xe_eudebug_online: Add pagefault stress
 tests
To: Jan Maslak <jan.maslak@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250526001304.2899977-1-jan.maslak@intel.com>
 <20250526001304.2899977-3-jan.maslak@intel.com>
Content-Language: en-US
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20250526001304.2899977-3-jan.maslak@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DUZPR01CA0323.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::24) To DS0PR11MB7904.namprd11.prod.outlook.com
 (2603:10b6:8:f8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7904:EE_|DS7PR11MB7888:EE_
X-MS-Office365-Filtering-Correlation-Id: 87675648-079b-4785-d358-08dda1e82de5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azEyWEdxcDZZZ0lDc1ZBYS9DMnpLN2JRNnNOSzdKZkhRZ3dIdVh1UTR2RWRF?=
 =?utf-8?B?azFnL1JHVHYzMTNoNVVSRkFzVzliWnQvQU9XbzJobmpoa0ZTRXlSWVc3SkxV?=
 =?utf-8?B?R09DaDF2dTA4NDRsc2MzMDh5c3pMby9INjg4cXhRSmxQbjVnd25aWEJBOTVL?=
 =?utf-8?B?TTU4eEZMT0pyZHpOdU9hR0lXc0Z1Q1pxWm5iUGpnTzNCOXEvR2UwNzdYQ1hZ?=
 =?utf-8?B?MVUremhBdTJ4ZXQyeUhxUXE2OThTRUZZdCtZWXVtbWxmcWo0RSt3RW5RakVL?=
 =?utf-8?B?YUowWWQ1Zk5BQXhMVlBIYXpRT2huYXRFc0ptNTc3UkRVVXdnaDhDU3lIV3gx?=
 =?utf-8?B?YW8yaTBwOEVXb2dhVnl5Wm5ldmZJOGNVU0FwR2lyMTRIaFUwTDlsejBlMHF4?=
 =?utf-8?B?cnMzcXIrbnNmaDZNOWYvaTBKS2RrUGZQUFRybXBXc0UxbDBTWEpmejdpa3NV?=
 =?utf-8?B?UUo0SHJWcy9yTUEybUxsK3MzTmFPT29MajNSNlNDbnZVVTBsaWhFTGZsYktI?=
 =?utf-8?B?REw5L0pHVWVGTUZnMXBxU1dRVS9vUDQvcGFNM1B0WEpjb2pubE82d1JHTE4w?=
 =?utf-8?B?Z3RSY25zWEhIeUJ6Tnh1ZGdhbjlBaWFQSWFpKzAwelhOZ3c2VkhpNzhPeE1O?=
 =?utf-8?B?aE5ZR1A3K25VbnpiMU1rVW9iRDhZNjZERmdid0c0MEJrMkx6NnZxczN5RGx3?=
 =?utf-8?B?c0J3enFXd1JwR0I5blpjV3FwVkd5K2l3UklFWWdzcUdvMWl5NTF4S2o0bnZF?=
 =?utf-8?B?SkREc3c1N1NlekpNRVV1UXJOczlUaGN1OUpIeEJzMm8vZ2ExWkxlV0pwaHpo?=
 =?utf-8?B?Z0YxdmEzWFNZQ0pyelNnL3hQTEQvcVVXK1dMQ1BqUmhnNzA5b3hlZ3ZTV0Nj?=
 =?utf-8?B?V2hFTmhlNmNUUkxoellEMVNaaEY4STBzQTY5eVpIcm5uRWVQOHZWZm0vVERO?=
 =?utf-8?B?amQwZlhlZEJFdk5aYzVISTdDMlcyL2EwMXFiVnRFUGpMSVZaQU1OSEpYbjhC?=
 =?utf-8?B?Z0t5MHp2UkhCalRhTThtc2hocEtyUGhPVEpyVUtzVFVvTEU3ZXFHNGZFUXZt?=
 =?utf-8?B?b0l6RjQvK3ZFRGJkeTJpYVZzWWVHdkJ1dVpqWGs5NUJQdGFWa2hhTm9BOWsz?=
 =?utf-8?B?eE42U3pmd3VremZTUXR0ZmZNWU9JVkw4WmIrYUFvL3ludENlSURNYmRWV1lu?=
 =?utf-8?B?REJNWHRLNnlLL3ZkaXRWeDlFUWVHa0o5N1NKYTZpNk9tdlYrWjlmVTkwSk9q?=
 =?utf-8?B?ak1LWWlxT3VzZDB4VnJNTCtldXFVWThOSVk3d3lZVjg2NlM0VjRVcFNTalM3?=
 =?utf-8?B?VllIUEIzbk56UlpGYm0vZGI4U1NnM0I4d0Jod3hIcDdsQ0d2UWQ1ekR6eTlQ?=
 =?utf-8?B?WDlFUzFlN2FJakR1SHB4LzcwcG55VmM2NTRSVjBNcU9NMkptWGtUaWdXZ3U2?=
 =?utf-8?B?MTRTWUM4czJiSXJ1OURpNVQrQzdnV0lDQXpGNTVsanpTTmdpZDJTdWxMWUJZ?=
 =?utf-8?B?V3c2cmZrTk85T0ZiVFVvTllWSUlLRnROVFNrcXF5VVltVHYrRUg0UVVCT0hM?=
 =?utf-8?B?NnphcHJaUGdEMlN1S0RDOFFPTHNxTmdSSGJyU2FwSElORDV4cFZjbE90NWIz?=
 =?utf-8?B?TUpSL2lWOUlqZlNUQlpCd2tiQVl0RXZYV0Q5UklVMEh5QTJPRVh4T3RiRDE4?=
 =?utf-8?B?bHY1ZUpndldNUXlLUE45WGUya2d0SlZyOEtUenByUVhORVhKc0VZWlRZbWxX?=
 =?utf-8?B?Y0RFT0NmOGQvc01uUW1JZWRVVlI5Um0xdTg3OTFkU3FSeDUvSndpT1BtMzNs?=
 =?utf-8?B?VXBwbys0VTF4a0xORzR3OHVmZzNwZXJXTk8xL0hVc0pkeWplTEpNKzMxMC83?=
 =?utf-8?B?YU5CRHBHY1IwRUkwRGRoYXZpQ29kNTV4QXR1eHFhOGRHaXNOcXZUQ3JkSUpw?=
 =?utf-8?Q?q6/Y3DUmBUw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7904.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a0E0anhvYk9ZVFcxTVc0WEI1VGpNLzdWb2hPYmxVbXZZb0ZNWnZraU1JaWJZ?=
 =?utf-8?B?T1BPRXY0ejYwUHV3UWhIZUZlN1ZqQU9RN2ZFb1hkNmU0dUNCSzh1REQwSGxG?=
 =?utf-8?B?eHIzbjVwdk9ISUUrSU5vVXpqZU1ZOTJYbFdIOEptNFFCUGNYYUpoOXByWEgw?=
 =?utf-8?B?bUJNMStqVEprSVFQWStGYTlUS0JyY1FtclNNWVZ6ZkZRaHRQUTdOSXRQa1Ft?=
 =?utf-8?B?M243M1NSc2E3ZU1PK0x1dGpXdE1WYnlwbG9pa2pYQ2tzSEwzYXozOVhSbUkr?=
 =?utf-8?B?NDBxUC9iSDFZc1F2MUFzdE9zQ2xiNmdyajFucUhIUlpNZ1pnQm40eDZWN0M1?=
 =?utf-8?B?Sm5Wa09GdFlXK3BuSzBHemE2R21hQmcrTThLV2JmSDlySW9yNzhxZXhabEpC?=
 =?utf-8?B?cE9vSk00dUhoVkZJaFgvUGsvZm80RExVak5oN0JXVUZDcC9UdFEwTWh6QW1Q?=
 =?utf-8?B?VVFZeHFaM3A1TUpWbnA5bG5aM1Bxa2x6YmlUR09Zckc5ZldzNnpCNmJSZXFr?=
 =?utf-8?B?NXBZRzFubnczZ1dBUjgySDJMUHg3WVVqZHVRampYU0YwdEdxVVlicUtGREVR?=
 =?utf-8?B?THFkeEJ3cXk4S1FqNk1BSjF6TzRyN3Nma09mRFh6ajBqRFFES0hTVmdCTmhj?=
 =?utf-8?B?OTRWMXRBd0ZJWXppMVZNU0ZBdGRyT0tSd25BVGtpN3NvN3JkVzg4VUZsWnJk?=
 =?utf-8?B?a0dUTnJ0dEtlWExyZVhiWTBhZ3kyZm1GWEdjN0tlWlNTQ2wyV2hHTE5KNnda?=
 =?utf-8?B?clAxSVMvTUlyZnV6V01SWkE4YXc3QUF1V2loVjJEMGRMRmR5bE5TS3lua2xE?=
 =?utf-8?B?bDhNZXlJKzlvSFpxazhiZDFYcEpENFpNUWRpak5iSlBUVkk0Um5WeHJ3amRh?=
 =?utf-8?B?aUN3aHJYUm5CVmE4NDNaRmZZYTl5eTFCTnRUOGlwclZnekx1ZFJ3WWtzdDBi?=
 =?utf-8?B?bXN5UlN4em8vbHRHZ1h5MGpQY05uSjZ5em9OVFJDOFJTZXB6OFZMM0ZpU2pl?=
 =?utf-8?B?OG9ibjJSOEM3eTZnS2FVTHI2YktTSnhNSmVYL2lmY2k5UXMrU1kzTnJGZG5I?=
 =?utf-8?B?cEhlWjVEeHBUOGltY3Zwa1hOS2lGNWpieWlNTU9oUzcxcVBZM0t3Wm1vaFh2?=
 =?utf-8?B?WTd3M0pPV2V5UTFFam42S081bFVJZWxJWG1vNHNISHN4Q2p5OWhLbDdzV0FO?=
 =?utf-8?B?Z2FQVmRtT1U3bkZTMkhQdlhVWWdqandPNHZveUVrcEtXL1VTNCtJRTM3ckhv?=
 =?utf-8?B?bm84QlYySHRSc1BPQmlBbFM3bUpkYTcvU3ZTeTY2RVl6MWEvQWF6OWhoTFJU?=
 =?utf-8?B?VHB5L25WTDZOYXJiMklVVVEyMTFUdDRUZEZXWExBVmp6V3dEenVBSWpURDNx?=
 =?utf-8?B?OFc0T2V5VEFsKy8wN2Q1ZjJxcUxzWlYwRk5pU1E2c2dIUm5xazk2VXM3N2No?=
 =?utf-8?B?aVdTdmxncThpTjMyUkI3Z0hrL20rdkZ6dFZscC9JSHFtQ3N5RkpuS1VVZ0Z5?=
 =?utf-8?B?dlVDR2xUMWpzZncvVnBIajZ6QzdVMzRKQ3U5WDUwZk9vdGlmeWxmOGUrcXA4?=
 =?utf-8?B?bmJXSTZDRFZLbm1KaEVxbW9vanVsU2NyOW5uTEFKMy9SbFhySGRmM1JpUHM5?=
 =?utf-8?B?clp3SDFsdTQrdWVBS2ZOb0xiRSt0MTd2QVUvTjI4Qnh6anhiUXZieHFYaUp4?=
 =?utf-8?B?K1FXcTV6cjhWUTk5TXFLU1crWVBFcGxrUjY1M3ZZMFJaaEN0ZGliWldvNUJN?=
 =?utf-8?B?dVhyeHVwU01saVRlNXI4YzVJc0NPR0E3N1VYZ2VXUEp6U2xQcmU1RkhDcWdj?=
 =?utf-8?B?eHRXY2FJb016NTNNVHNpWkI5ZUZTV3hqcHhPODRVdGJqNXA2TG5GWEw4UWp5?=
 =?utf-8?B?YXFtS1g5dndXMWwvdWppQzIzWkxWUThPclV2Z2NEVXZJeGpybldYVWpucEQ3?=
 =?utf-8?B?TmJ0Vlg3RWNJY1B0V3JtNVh5eGpyMkR6bGhWTGJXUHRTczkwREJxbWFRcVNw?=
 =?utf-8?B?cXZLOEpHdFFxVzJMUkhHUWtkamNlZUJjNUJ0ZnZWVHRiazJGM3ZWb0RrYWly?=
 =?utf-8?B?MFcrMU1mL0VFNXF2c1NDQS96Tlk4QVpjTG0xTndPVnRYZytoS21sdUhReVBQ?=
 =?utf-8?B?Y2E1LzRmQmh3QXpkQ0ZURndDaCtseEsraGRJVW9IV0YreXZFaFJWNGRiUTNQ?=
 =?utf-8?B?RVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87675648-079b-4785-d358-08dda1e82de5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7904.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 15:14:33.5694 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uoREFOep0R1w+lMWopFzKs4qZ+PekzCPspIYO8Mtw5ql2e4Uy3pkBdFoPuz5puzSapC2PeHfm1t4Fgd3sMwoMlYB0fst6Q1boxTze1caNKg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7888
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



On 5/26/25 3:13 AM, Jan Maslak wrote:
> Add a stress variant of the already existing
> xe_eudebug_online@pagefault-[read|write] tests that increases
> number of threads in the shader and number of threads in
> threadgroup to their maximum available amounts.
> 
> Signed-off-by: Jan Maslak <jan.maslak@intel.com>
> ---
>   tests/intel/xe_eudebug_online.c | 27 ++++++++++++++++++++++++++-
>   1 file changed, 26 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/intel/xe_eudebug_online.c b/tests/intel/xe_eudebug_online.c
> index 3d138bdc3..ad62dd929 100644
> --- a/tests/intel/xe_eudebug_online.c
> +++ b/tests/intel/xe_eudebug_online.c
> @@ -39,6 +39,7 @@
>   #define SHADER_PAGEFAULT_READ		(1 << 14)
>   #define SHADER_PAGEFAULT_WRITE		(1 << 15)
>   #define FAULTABLE_VM			(1 << 16)
> +#define PAGEFAULT_STRESS_TEST		(1 << 17)
>   #define TRIGGER_UFENCE_SET_BREAKPOINT	(1 << 24)
>   #define TRIGGER_RESUME_SINGLE_WALK	(1 << 25)
>   #define TRIGGER_RESUME_PARALLEL_WALK	(1 << 26)
> @@ -126,6 +127,9 @@ static struct intel_buf *create_uc_buf(int fd, int width, int height, uint64_t r
>   
>   static int get_number_of_threads(uint64_t flags)
>   {
> +	if (flags & (PAGEFAULT_STRESS_TEST))
> +		return 65535; /* 64K - 1 */
This value causes the Local Y Maximum and Local X Maximum values to be 
set higher than the values that can be set in the COMPUTE_WALKER_BODY 
structure used by the COMPUTE_WALKER command.
Please check that these values are set correctly in the 
__xehp_gpgpu_execfunc() function

G.G.
> +
>   	if (flags & (SHADER_MIN_THREADS | SHADER_PAGEFAULT))
>   		return 16;
>   
> @@ -1068,6 +1072,10 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	struct intel_buf *buf;
>   	uint32_t *ptr;
>   	int fd, vm_flags;
> +	uint32_t num_threads_in_tg = 1;
> +
> +	if (c->flags & PAGEFAULT_STRESS_TEST)
> +		num_threads_in_tg = 64;
>   
>   	metadata[0] = calloc(2, sizeof(**metadata));
>   	metadata[1] = calloc(2, sizeof(**metadata));
> @@ -1115,7 +1123,7 @@ static void run_online_client(struct xe_eudebug_client *c)
>   	sip = get_sip(fd, c->flags);
>   
>   	igt_nsec_elapsed(&ts);
> -	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, 1, shader, sip, 0, 0);
> +	gpgpu_shader_exec(ibb, buf, w_dim.x, w_dim.y, num_threads_in_tg, shader, sip, 0, 0);
>   
>   	gpgpu_shader_destroy(sip);
>   	gpgpu_shader_destroy(shader);
> @@ -1629,6 +1637,18 @@ static void test_set_breakpoint_online_sigint_debugger(int fd,
>    * Description:
>    *     Check whether KMD sends pagefault event for workload in debug mode that
>    *     triggers a write pagefault.
> + *
> + * SUBTEST: pagefault-read-stress
> + * Functionality: page faults
> + * Description:
> + *     Check whether KMD sends read pagefault event for workload in debug mode
> + *     with many threads.
> + *
> + * SUBTEST: pagefault-write-stress
> + * Functionality: page faults
> + * Description:
> + *     Check whether KMD sends write pagefault event for workload in debug mode
> + *     with many threads.
>    */
>   static void test_pagefault_online(int fd, struct drm_xe_engine_class_instance *hwe,
>   				  int flags)
> @@ -2664,6 +2684,11 @@ igt_main
>   	test_gt_render_or_compute("pagefault-write", fd, hwe)
>   		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE);
>   
> +	test_gt_render_or_compute("pagefault-read-stress", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_READ | PAGEFAULT_STRESS_TEST);
> +	test_gt_render_or_compute("pagefault-write-stress", fd, hwe)
> +		test_pagefault_online(fd, hwe, SHADER_PAGEFAULT_WRITE | PAGEFAULT_STRESS_TEST);
> +
>   	igt_fixture {
>   		xe_eudebug_enable(fd, was_enabled);
>   

