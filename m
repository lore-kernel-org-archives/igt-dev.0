Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF75CC02181
	for <igt-dev@archiver.kernel.org>; Mon, 20 Jan 2025 13:41:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F9610E41B;
	Mon, 20 Jan 2025 13:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YS0+0WVJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94E3E10E41B
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Jan 2025 13:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737380506; x=1768916506;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=U/08Jb+sVgLXi/MydvpbwR7hbJxr72AH3tCgsgGJCQg=;
 b=YS0+0WVJNmsxZHLxuXiAbGW4ZpY/6IRYsMe0GganIqIMsXeufMLBKJlk
 XT0ZUZp4HlOPID1VFnWLwK5YomJH+BHpDkgz8ReiUDOWe+LEZ+cDlzUBE
 E7Iz8FzdwYgiyoRaQkz8fSOcNjRst+dUeKgftBUNqLxDbytK7vhCm0r5T
 N4E+HH0a/m5SjsolYMzLijZ7yYKAmEwjL/AJ3JCTW9t7ZI2+y3ubVpJr8
 fmYwKpZ5JmltVmpJHZ9Z4Ci7VeEfYMpif8SaP43xGmyPupwx7LTBwt5Ot
 XHvlvZRqbyTX3Qt+T4eBE+z06dI/5NzONI7QEAcM727AcdpHYCAdikPAr A==;
X-CSE-ConnectionGUID: ko3TOPUrTOiAlRJXk0JswQ==
X-CSE-MsgGUID: 6HxkoqDrSLi23uylLUHxPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="48766700"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="48766700"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 05:41:45 -0800
X-CSE-ConnectionGUID: uQqgMtZMSbic70zTNuek1g==
X-CSE-MsgGUID: mloLbKzrTvqLl8F5/fhp/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="106535759"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 05:41:44 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 05:41:44 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 05:41:44 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 05:41:41 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zUcAs50yMFOtz7kuyatE7qNXP1QaveB5QJcClSU7U6tPa9e8IxbC2iNygRsC3hvw6uBAKxHrnV4CpX72t76QjNjTk4liqJSz1BupEpfJJA9FrvjdmuYi0X4upZwm59fM0i9oC9sOmPhkSm/6vLLnTCTgkm6zsyef30XNx1um1M7+GwbTgXOES994BX+xmp7Fija9sJlsiKHRikXhyKIcf9EbC0Bz4hnBvOUiI8y+vTjVJ6wmi1nthnviSL7QEjI9HMOFBs1wuGb5n2yV3vHtwKYuwaaXRxR9aa2YWDDxZ9zny0ZCO6cQJ0uzN8d2CIcCcd6VXnFNl0GYFfanOM3f0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w00PvHFLHoSLny/Vx78Qkzlum3R7hJtALFH3H8ASZqU=;
 b=S59ATkzLRRuzQFPDoGhCdlebyAPFcaJJTLNsP6mmQGKM7v8YuZp8jMDXh15THkCSpQ+QK9iEjo+g1MxeF9AmyJDOPj6w5MhkxMY7JwbpPUIEmsvJp9XbNpqqWygVEq3IzznKige/wvwySgkkPSqKnPirB4dyeMDqx0IyHjyiym2rqyr3zhWus3kL9oZlnXbM3Of+zluPsELCyfusscSm2wDkCFn/hcx9DLx1ib7yuwxH/0FutJVIx8iu36aXK0c3f95AsWmU3+dAHU067WWm5HXz0lacfmJgjKTuuJS+kpRvhmNK6+Qb3yem4vTeMD4IbADeUjqtojzli3JA+M/HiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by DS0PR11MB7850.namprd11.prod.outlook.com (2603:10b6:8:fe::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 13:41:12 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%4]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 13:41:12 +0000
Date: Mon, 20 Jan 2025 14:41:06 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 =?utf-8?Q?Micha=C5=82?= Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_fault_injection: Inject
 errors during xe_guc_ct_send_recv
Message-ID: <Z45SciO11d9-aaxV@fdugast-desk>
References: <20250120083410.26904-1-satyanarayana.k.v.p@intel.com>
 <20250120083410.26904-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250120083410.26904-3-satyanarayana.k.v.p@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: VI1PR07CA0291.eurprd07.prod.outlook.com
 (2603:10a6:800:130::19) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|DS0PR11MB7850:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d80623b-f478-4692-d26c-08dd39581a7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFllL0R6RC9iUjBieDR6Sm5FdnUvWVJVOGZiTWliL2hhU1NvMTA4Zml4VGxY?=
 =?utf-8?B?RHBXbWVvdTVIRDBKdmZuOVNzV2drYnp1Q3M4eFVOY3VtSmFLeE9tNmoyM2pK?=
 =?utf-8?B?RldUYjZNbkEvTXVtQ2ZjSVF5cmR5anJudGpqSzVhd1RZcHlRakh3MThGWXJw?=
 =?utf-8?B?QWR1SE5GZFdmM0orUWgwZldFcm1VYUNCWE5jS1FhVndVL2ZLb0NpL0JLWVox?=
 =?utf-8?B?TDdWWjF0U2x2ZXJCUGZuZC9IcVpvMkx5bEF1bzdIbGtWWVdpUUFqc0tvMk9Y?=
 =?utf-8?B?N2N6d2NOZGJyYU52STRUUkdkKzJFWHM0Tk81VGpaRnlMM1pHc0l1bVE5OE16?=
 =?utf-8?B?MEd6dzJtWmtjaEs3YnFvU1B5T1lXRklFSVlFa1ZxUVBhTkV2M3BDZDgyV1dN?=
 =?utf-8?B?d0lWTkVJMmF3SldtSFFYUzFHR0ljek1MMVc2Z0YzNEhqek94NXpaVWpYSFFm?=
 =?utf-8?B?Y1I2NUJlWlRtM0lYUCtRdHp1RTNjNlRXTXBZZE91RG1PUVhreHlqWlgwVm9l?=
 =?utf-8?B?QUM1ZXVDSWl5cFhMRkNRcjJKZWduR2hRaGw3ekt6M0RwdzdKd2VkSFdYWmpt?=
 =?utf-8?B?RkU1cE5hWlBtNXFmOHRacFloeWZHcjdGUzdaWmhKcGd4UjFxY3cvNzZ1a21i?=
 =?utf-8?B?ejd1QkphTm0zSVdaS2lFbERxNXZ1THlEVlZnbkIwZDF3MEt1ZnowelgrdE1t?=
 =?utf-8?B?OHgrR0xaSXpXNzJ2bytwZW1NbXRibklDQllOdjVlek44ZWRHYUt6ZEg5clBm?=
 =?utf-8?B?L29WQXY4UE9jTitoUUxUK1pFa09pMmJrUjhVdWtkWSsrODZPOXJtWFQ0MGd6?=
 =?utf-8?B?c2FCaVF6NXpDVm1UYXhCWnJJeEZxVWNuR25WejBsbVJEalBOc3dxL0ZkSDNm?=
 =?utf-8?B?b2xGRFZrYWhDTWFlZk9KK3FGb1FMYTJ5TklpVmY0eVc2Y09ManlkcWc1MTNL?=
 =?utf-8?B?aiswM1UxSXJhWCs2THJkQmhicG91bHRwSGVaSEY0ZkFBcG9KRlZzajRjUWxm?=
 =?utf-8?B?UkZudituQm1uTWVVaEl0VHNEVzE1NktrT1B6UGw2VVBoSmZPeENFM3Z6VW9x?=
 =?utf-8?B?NTk3eDVmTm1sZE9hVFY5cXg1YkZ1eXJPYzdiRytVTlF5ckhPY0xrM3R3R1dS?=
 =?utf-8?B?WmplQjZsTFRjMjRGTCtDYWk2bkZXNjR3Zmg4TytiVm85M0IrdDdRVU00RHpE?=
 =?utf-8?B?eVBTZGVJVFRRK1c0YnUzeUF4ZVdod1JGL2w1eVZlckZRelUrbU43VE45T2Ri?=
 =?utf-8?B?blRVRjR3M2NOMHFsSFAzRHBNZXNFZHRsZVk5K2gydWdkbGRmcTd0cWlkZ1ZC?=
 =?utf-8?B?T25DaXVyc1JNam4rVGwvaUl5QXY1SEV5c3FRcTB6NC8xQVoyU0VHWGszdTZB?=
 =?utf-8?B?QldJOFFocHJtQVdMc0xyK1lPZFBUSDhxUHdNVElNZlF5c2prL090eUs4Qm9S?=
 =?utf-8?B?cnhFMGd1c0dlemg4Qm1GVGlXWDRTWXV5QUNGMnBvbmJuS3V4RzU4TTUxclRy?=
 =?utf-8?B?UmJpVmVuR1orMUgwV29VMHh0dVVBaWxHTlFBM01pR1ByZXBOdFFTckY4cGcz?=
 =?utf-8?B?OVhCeEg4K0wxTHpqbGZsMW9JekVCSlQ4ZzBLRk8wQXV4U0xiSm9sUUM0SzRp?=
 =?utf-8?B?ZUU5RCtSWXhrZTNXMGxhY0ZscHpZcTBLRm5KOUFWY1dXTUw5QVFQZnVzRFhS?=
 =?utf-8?B?S0p6YTk1UGI2T3FCQnBiY1MxSWtPU0crSlZIMDN0UjVITVRaZmhDY05YM2Ni?=
 =?utf-8?B?ZlI1WVdseWJkblA5TWNSRXlDMTBYdVVBOGluaGVJckdVZnRrSEgyYTlEWHNm?=
 =?utf-8?B?RjE4R0hYRW44UVRFVmFCekZmdUFUVldlTGtDTW9TUklQNjhLYjRTT2tFOVN3?=
 =?utf-8?Q?Pmavhaz5JlXa3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d1k4ZUh1Qy9yMW1Kc3FmV1o1WklmSzVWTm95RnIwSDJsanVtVTJiekJtanZW?=
 =?utf-8?B?SVkvRmhJUzlaK29vNmJHOUI2NUtIeUNKNCtJWVZjVFEvamFUVWR3dXh0cndG?=
 =?utf-8?B?QmlMUE1taHh5WnZUMkI5UzVCTHBFdGNJK2JaRTcrUE1qaXhoMk1zVG5vcUNN?=
 =?utf-8?B?Wkx2UFpFb2pBeHRhRUdvMlFkRWt6NTdOK3RuV3RVTmJJenc5WHROZWxyLy9W?=
 =?utf-8?B?R3pMNGJsb2dVTi9EcUhGL01nSUQ1d3JNbzRKYWpmazhSZWptcktEUFMwZzBk?=
 =?utf-8?B?cXNqL0lYd1hKeWxBM1lwQXRxYSsvVW9KQUZJUGgzbFh6aC95V2JrWFNRbUgv?=
 =?utf-8?B?dk4vcWx0amN0ZFpiOWthbHNxMzl2M2F4b1l3Vmh4RzFpTFNJbzBtbTF5b3dt?=
 =?utf-8?B?UGlYMWhscjJrWTQ2VDJLQ0hQaXZyQ1FKcHJoTWNFYkZNSHN4UzZmU2dYQldt?=
 =?utf-8?B?NVJFTmJWRDFTZ1phMm9QOVZuVWZsOXdaZVNPRmVVZGJRWmk5a0k2anNSUk1N?=
 =?utf-8?B?RVorTDk0VVI3L29ZUVNnMzZ1TmtXazRXa0ZjYXdhTGJEUFNOYi9ySVJBempV?=
 =?utf-8?B?TDVTajNQMUhMazBEUmVIRG9OaGJiRXl1Q0JQNUFUVUFWZTBVNGtaaTVnZWti?=
 =?utf-8?B?MmlXVHVOYkQxM3k0cjNqZFhmUUVyRUZ5R0VyYzdLSENndS9LTXpxTzc3TEI0?=
 =?utf-8?B?b2ZKVENOVVNMdnVzQWM5QXJZS3ZuOVFlQklIeE9PY3dBbFdMbllZMk40OVhy?=
 =?utf-8?B?eU91eWJvT3I2aHFOZ2dHS1p4UzlmRnJVZHQ5cUtwcWQzaGxnZGJzR1FGU2g5?=
 =?utf-8?B?cnJjekIyMXArVWVBU2dIQ2w5MHpTc3NUdmxhNHZFRTdTSGtic3VHbEc5aUEy?=
 =?utf-8?B?a20vc2FIVGJTOStGM1V2WkNvaXpEcDhxU3l4c29Dc20xNE1ZQkRIWW9KZmEv?=
 =?utf-8?B?MklYU1p3SXM4dHpvaVlFT1BqY0V0VXZJU01CbUJpQkxxMlJLODU0cHZwME1t?=
 =?utf-8?B?TElXNXVSeVl2SVZZek1jbER4ZWtoeEFXS2xzQ3J3Mms4aUNmNGdEc2xDd0VU?=
 =?utf-8?B?Rlp5YVRiS3dTS2psOGx5MmkyaTFYb3FIK0RBT0p2R0FlcGY5RXR6amtvQmIz?=
 =?utf-8?B?NGRBYTc3THlmK1RRaDZtYzNXZENMamJGYnIyVjV5RVowYjc3OTdvWkhkbEdy?=
 =?utf-8?B?ZTcrZ2JMbWNueXE2bnNOMFZTUGRtODF2TXI1dUYzcDhCQ05CWE5HbWdvS2NK?=
 =?utf-8?B?ZUZMRTREdFVVUWpWZjJRTGpOWE5UYmdxWDU5aEx3TW9FS1VpWm9oVUl0aktn?=
 =?utf-8?B?MmRYMVhnamdOaXFBMFdDNmtxamd0U0lKZTZKNWtMbU55aC9MdEdJaERQWk9P?=
 =?utf-8?B?T0FpeEg4a2V4NGczZmhZTks5dzJrNm5icVVSaHcyS0FpVC9QUktmN3pTUWUy?=
 =?utf-8?B?bkpRVm9MdFBSMndobTZBb1AxcDlnOThtR0szQ3p3K1BUbkhXK3YxNytGVDY3?=
 =?utf-8?B?Yjh4cDhUTE0xSTdycm4zQ3MwNDVqY0doeVJtckdYZ2dZTVBFeUJ6TmtCZTcw?=
 =?utf-8?B?VUxUWUVPSGZ5MmxNZGpoTHFxVjMxd2taVngzby9qVWNRZHJudXFUVzFpS1Yy?=
 =?utf-8?B?Q1RiaHBnd3psU1FoOW5QdzQzeHN1K29NQ01OdmdEWDBWcHRDWUZRRC9TVVJw?=
 =?utf-8?B?ZU83WEwwNitRZTMxSncwTEVYNlVzNFBwU3RFK2l4MlVjOSs4K2tqVy94dE0x?=
 =?utf-8?B?TFZWMklFcDdwT2o4UDVXQzlEb0dKMlVoTFFaN1MyRVhNYmlzMHRxK0FzZERz?=
 =?utf-8?B?Vm1FV0lwZzRkcll0R2pjQTR0bWNvSGUwem5EdkMvM1RtcTdadDllRThMbDFl?=
 =?utf-8?B?S0tFT2dNU1pscWxCdXZOamRHNnpFK1hQYzhRYy9XYWVXTVI3NUQ0SzR2U2Vl?=
 =?utf-8?B?UW1Gc0FUTDdiR2NJVUUrM0F5TDBWSmJsTktpcW91VHhKUVNTdzAzdHRiZFBN?=
 =?utf-8?B?Z2xQTEZwaU9IQzBqQXRFeTFVRnBqSFJmaVFjLzdZc05uSkgrSW1zK084UjB1?=
 =?utf-8?B?dEZLc0dob0grdFN3UTNKRGYySi9DaEMvb1A3MiswL1BpNFVqODZxbDk0d3FD?=
 =?utf-8?B?UXllay9aVm5ZeHdSZ05NZmp3aFVDNG5mN0I3OEgvVHJWUGptNmNCYmYxMVRa?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d80623b-f478-4692-d26c-08dd39581a7d
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 13:41:12.2149 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SvJ4beUsWtBfARJkthLVdmO72QvY6XYqX65ZQWwj+AOhMovUC/1NG6wBqnAthfZF2wSsi1DD3iNmfANmNZJ0eUaCuGxZfyv7QPAZG4FHAkk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7850
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

On Mon, Jan 20, 2025 at 02:04:10PM +0530, Satyanarayana K V P wrote:
> Use the kernel fault injection infrastructure to test error handling
> of xe at enabling of VFs stage when executing xe_guc_ct_send_recv()
> so that more code paths are tested, such as error handling and unwinding.
> 
> Error can be injected using:
> igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
> 
> v2: Updated guc_fail_* to enable_vfs_*
> Added igt_skip_on(!igt_sriov_is_pf(fd)) to skip test when run without
> enabling sriov.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
>  tests/intel/xe_fault_injection.c | 63 ++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 3a0e2aa29..56616ee17 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -19,12 +19,14 @@
>  #include "igt_sysfs.h"
>  #include "lib/igt_syncobj.h"
>  #include "lib/intel_pat.h"
> +#include "lib/igt_sriov_device.h"
>  #include "xe/xe_ioctl.h"
>  #include "xe/xe_query.h"
>  
>  #define INJECT_ERRNO	-ENOMEM
>  #define BO_ADDR		0x1a0000
>  #define BO_SIZE		(1024*1024)
> +#define NUM_VFS		1
>  
>  enum injection_list_action {
>  	INJECTION_LIST_ADD,
> @@ -281,6 +283,55 @@ vm_bind_fail(int fd, const char function_name[])
>  	igt_assert_eq(simple_vm_bind(fd, vm), 0);
>  }
>  
> +static int sriov_enable_vfs(int fd, int num_vfs)
> +{
> +	int sysfs;
> +	bool ret;
> +
> +	sysfs = igt_sysfs_open(fd);
> +	igt_assert_fd(sysfs);
> +
> +	ret = __igt_sysfs_set_u32(sysfs, "device/sriov_numvfs", num_vfs);
> +	close(sysfs);
> +
> +	return ret;
> +}
> +
> +/**
> + * SUBTEST: guc-fail-%s

Hi,

The test name must be updated in the documentation as well:

    ERROR: Missing documentation for igt@xe_fault_injection@enable-vfs-fail-xe_guc_ct_send_recv
    ERROR: Unneeded documentation for igt@xe_fault_injection@guc-fail-xe_guc_ct_send_recv

> + * Description: inject an error in function %arg[1] used when xe interacts with guc to make it fail
> + * Functionality: fault
> + *
> + * arg[1]:
> + * @xe_guc_ct_send_recv:               xe_guc_ct_send_recv
> + */
> +
> +static void
> +enable_vfs_fail(int fd, int num_vfs, const char function_name[])
> +{
> +	bool autoprobe_en = 0;
> +
> +	ignore_faults_in_dmesg(function_name);
> +	injection_list_do(INJECTION_LIST_ADD, function_name);
> +	set_retval(function_name, INJECT_ERRNO);
> +
> +	autoprobe_en = igt_sriov_is_driver_autoprobe_enabled(fd);
> +
> +	if (autoprobe_en)
> +		igt_sriov_disable_driver_autoprobe(fd);
> +
> +	/* igt_sriov_enable_vfs can't be used here as it is causing abort on any error.
> +	 * Since error in this test is expected, we have written our own static function here.
> +	 */
> +	sriov_enable_vfs(fd, num_vfs);
> +
> +	igt_assert_eq(-errno, INJECT_ERRNO);
> +	injection_list_do(INJECTION_LIST_REMOVE, function_name);
> +
> +	if (autoprobe_en)
> +		igt_sriov_enable_driver_autoprobe(fd);
> +}
> +
>  igt_main
>  {
>  	int fd;
> @@ -319,6 +370,10 @@ igt_main
>  		{ "xe_vma_ops_alloc" },
>  		{ }
>  	};
> +	const struct section enable_vfs_fail_functions[] = {
> +		{ "xe_guc_ct_send_recv" },
> +		{ }
> +	};
>  
>  	igt_fixture {
>  		igt_require(fail_function_injection_enabled());
> @@ -335,6 +390,14 @@ igt_main
>  		igt_subtest_f("vm-bind-fail-%s", s->name)
>  			vm_bind_fail(fd, s->name);
>  
> +	for (const struct section *s = enable_vfs_fail_functions; s->name; s++)
> +		igt_subtest_f("enable-vfs-fail-%s", s->name) {
> +			/* Skip the test if not running with SRIOV 
> +			 */

Is there an accidental newline between the extra white space after "SRIOV"
and "*/" on a new line?

> +			igt_skip_on(!igt_sriov_is_pf(fd));
> +			enable_vfs_fail(fd, NUM_VFS, s->name);
> +		}
> +
>  	igt_fixture {
>  		xe_sysfs_driver_do(fd, pci_slot, XE_SYSFS_DRIVER_UNBIND);
>  	}
> -- 
> 2.35.3
> 
