Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC10EE7717F
	for <igt-dev@archiver.kernel.org>; Mon, 16 Dec 2024 11:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7711610E5C7;
	Mon, 16 Dec 2024 11:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dwmp4Whn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF7710E5C7;
 Mon, 16 Dec 2024 11:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734349212; x=1765885212;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=X+MtOiUxq2/MN0lzxfBwve8SP+BYk69lc/yWdbn5i0E=;
 b=Dwmp4WhnNPvQ1SKVngd0EvxHSxjD/IBQZ3lToYe9L8k2JGLQxTlK3TAF
 Dl8tij+TSDb9u6vIS8377AqsLaJSJHtUfXLBbL3awwi34D2uCyM+Ezfoi
 rfjnZynKgaPu27HT48yISgxVhbB4a6rXw3ojiBizqALjzdqIIKgv/97Nk
 rFB8uzlJOs0Mxva4H5Hc00PdzXpJ+tL1HGMlD/DepN+iMbHVPbZeiLAPR
 9XIlAWgXrxJukF2O8g16YMB3YN+pqkxBucUBR0SbklqJ48I1zvcPdpd+A
 TttQbWkMwmoiSAoY8+VrZDChxEuunbKCPbpAQJgjk1M+8D0dNxBxzKbCa w==;
X-CSE-ConnectionGUID: MSLDu3JRQ6uOmzR9hXTXZg==
X-CSE-MsgGUID: K2yaObzuQ9SFPmtH8u6J7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11287"; a="34959952"
X-IronPort-AV: E=Sophos;i="6.12,238,1728975600"; d="scan'208";a="34959952"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2024 03:40:11 -0800
X-CSE-ConnectionGUID: rx5K2Ni4RIKDtsiGGJ29og==
X-CSE-MsgGUID: ILH4kldwTvuPWt2dMsNQ7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="102266123"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Dec 2024 03:40:11 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 16 Dec 2024 03:40:11 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 16 Dec 2024 03:40:11 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 16 Dec 2024 03:40:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EvHj7mW4eL7E2yYx0J5Ak/PHafZBq16S150DV/9oRkGG2Tsym9rvOQ2Zs7dmuyeVI5U1RlTpbrcQu/SdKYcuQyTMeB55skTfP5sDA37jzohUNFUdwQpl197ljBjr9LmycLguN8IzttCGjCSg6y4jLba/6OrZWdqqQxiqLlfy9Sn1q75RiiMmiYiX+8ordviLzZ5NVHN+K2h5ua5bqWOm+jTotgW7jYThw9BLm+urnVGPlfTxiV8QnZqJiq06nDLV/DjiUg5Wo1ENYvEoP9WjRfDkYGKkfM/PBuPrkvXBE511S4p99Tbiq1wvj2HmnTqjbK+1Ibn8yxOJ2+W46HayZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uKg/8WzczcI5sUw9AY+JMPGrCeT2UrULQafmMmfaPvg=;
 b=xdeWO+FN/5KW6Qz0ND2QUJrnoqafKqa4xUQxGrWmSWK7P5iT7TdQyNYbEZQH1CA9N8Grq7nSIHgEnpihGfZLwjUij7DZFEukuttGR/i2k6aD+J6840KjfIRHv7rYyj7iOjHmdpwSCV2+qjyx8GN7HrjzfPpAPGQoVN0VCWm0voeYWOGLb1fiERsBImIbx45gq0Wu1iSn8tMLwFpj13MSZe+FxBkuiLPw/Y3AIrawHsDv2yVBNNr6COl9yhevsH6BkCGjYmmk/0BHPmyT5f87QU7RpLUtiHRF2/0qgIYoXdM/qqI8K2zvX+DyMiLmOemhS31X7l9UfNAp/uGnPivP1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6409.namprd11.prod.outlook.com (2603:10b6:208:3b8::18)
 by PH0PR11MB7615.namprd11.prod.outlook.com (2603:10b6:510:26e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Mon, 16 Dec
 2024 11:40:08 +0000
Received: from BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b]) by BL3PR11MB6409.namprd11.prod.outlook.com
 ([fe80::74e:6abd:bab0:3d0b%7]) with mapi id 15.20.8251.015; Mon, 16 Dec 2024
 11:40:08 +0000
Date: Mon, 16 Dec 2024 12:39:58 +0100
From: Mikolaj Wasiak <mikolaj.wasiak@intel.com>
To: <I915-ci-infra@lists.freedesktop.org>
CC: <igt-dev@lists.freedesktop.org>, <mikolaj.wasiak@intel.com>
Subject: Re: =?utf-8?B?4pyXIGk5MTUuQ0kuRnVsbDogZmFpbHVy?= =?utf-8?Q?e?= for
 tests/intel/i915_hangman: Fix spin engine hang (rev4)
Message-ID: <iuspbdmehobv2att75zgefpnexkxcqxc7ctcjfev63i2sbcygs@rcmt725sdosp>
References: <wk2ejntldlc7ayamr7iiblcmh6jumx5a563jpfllco56d4z53p@2ib6m5s55dfx>
 <173385708911.928132.3781234299776821392@b555e5b46a47>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <173385708911.928132.3781234299776821392@b555e5b46a47>
X-ClientProxiedBy: DUZPR01CA0181.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::22) To BL3PR11MB6409.namprd11.prod.outlook.com
 (2603:10b6:208:3b8::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6409:EE_|PH0PR11MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: 10c69fc3-9f2b-4d45-a81e-08dd1dc66476
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHI3VEI1QkZCM05pYjFRbDJZM2Jxb3g1NmlOL1EwMjN2UE05SFVkWUdyNFIz?=
 =?utf-8?B?aDQvVjR1WDBZZkx3YkRXcHAvTnVHNGVyTXUvdFhsWHJkOWR4NlBHNWhNdEc1?=
 =?utf-8?B?YU12d1JjbDhjbVJQZzc5dEMvTHBCK2llYWNrZWtSYytCVVFMcDZXYVVqblBP?=
 =?utf-8?B?S3EyMmp4M1cvbTV1K0RzeXVqRjJRcWpMd0lhaFRST0ZteVZpeENDS3lPSWxO?=
 =?utf-8?B?bG4yRG1EZVA0VW5WaU0xSGprWXFuc0RTck9TT3kxTitoVWdUZTZnWGZ3S05S?=
 =?utf-8?B?MGs2Zk9UdUtoRkcwQVFaeTA1UjhWUEg1OVlNK3RjMmNvMGt0UnZ5L00zaEI4?=
 =?utf-8?B?Z1l6Mk12NzFZMjBiRTdqRE1UdXdBL3dIK3NQZjl0N0NjOHZ4L1A3UnpmQ0pL?=
 =?utf-8?B?N1FwZVZNNGlEYU13em4xNGkva2txYjRUdUtHV2M0ZDIvTXMzRlNsZnkyejJU?=
 =?utf-8?B?YkNoOGthQmQwNUlBZFVmV0hoR2ZjcEdXWXZHNzdPdWlQcDNFVFAzRVRmUHZ6?=
 =?utf-8?B?ME5oSGpPSmZhQ3dVaFBpM2R2TWhDY0l0cTVWYVZ5MERtQWQvTWJVT3NRNit0?=
 =?utf-8?B?VXBpMXZyb25jMEF6ZFlOWnJjcEx0NXFPRFhNZWlGeVNZbGlXc0Vad2RJTW1n?=
 =?utf-8?B?NEZBbzFWU2QyODNjUGRDRmhVMllDN0l4VjRUb0RoWHd3am5iS2tkd0lrQ0R0?=
 =?utf-8?B?VWV5a1BxRzJGZHR5WEhjMkFlY3ZuQWdrMks0TzlWQ0hVTHRWR0JobGp1eDFZ?=
 =?utf-8?B?azhEWlFTMndLZzNLMWxCSVVCTTNZRmlOSkFBVUNGNUdIQ3hCSXFsN21Ba0w3?=
 =?utf-8?B?VDczNzRJOEwyeFFPd0djcmVkVk9oRzU4c2Z0YXpqU0FsdFJmYnMvNVFLK0Z2?=
 =?utf-8?B?M3RveVg2clFZVmE0Nmpwa3VZTHBwSkxndWVPYStxYmZtMXhZMURzRmdMS3Ez?=
 =?utf-8?B?REFjS2M2MElBdlM1SHRhaStBbWcvSUpKdVorb0R2djhFcEYxUHR4YUsxenlY?=
 =?utf-8?B?M2NiNUMycnpBcjdRaGhqSGhHMXNma2g0a0VNZ3QwRzloOGM5UXNjZ3FYYzNK?=
 =?utf-8?B?b1ZsODFPNzA5K3pyTkRMbnk3czRzQkRWMlpaTTlIOXFRVG1GaWVLbUhKSUVo?=
 =?utf-8?B?MHNPRDZBWk5NT1hkVHJEbUJZdTdFdGN1ZWFVUEFHWllrSlZ2dDl3TlFGb1U0?=
 =?utf-8?B?NDFnNDZuKzNwMVZHQkc0QklxcXdlMnkxdjU4bGtkZG03M3JGWjNRYitrd3ZB?=
 =?utf-8?B?TDNFakVhcXM5bGF1Y3d1Z082dGpNUU9sMjBpT2dseUcxSEdpRThScTRYTkhy?=
 =?utf-8?B?YXRNNkdQMXpWajdqd0d5RmJyd3ZrSWwrZVlPOG9QaUE4b3JiRnpqdkdpY0ZM?=
 =?utf-8?B?NnJpNUhDaHkweXptakozZ1VUZklqQ2ROMy9oSmpxcWNMTkYxRW5oWlUzb0Fi?=
 =?utf-8?B?YWIyTHZTRlN3NTdTWSs0ZXE4cm5zejdmdTlncGl3S3IvVnNZbUZ2RkpBZVdx?=
 =?utf-8?B?ZVR2cHZjcUM1cG9BZXRFeWJYbkIzbkxOdkczbFYzb1VNOUlqRlhrMmJ1cUhw?=
 =?utf-8?B?V0QxeHBkR1RSV3dpK0pZQXVmaWs1QzZlL284RnRMR2djeVZtaFpGc3l6akg4?=
 =?utf-8?B?NHlKT2dBWEdaK3YwWXNvSmh0SkJ1T2N0ME9iY0preHY3ZzVGai9OMUJXbWZp?=
 =?utf-8?B?WEVDRytXQ3pvVmNnb1pxd0hTSWpKU0EzQk5lSDF0MDgwZ0lHWFVNdlRaOHdn?=
 =?utf-8?B?c05vVS8wZlRQRVJoOHNMSzBqRGJtQW0rVWw5aGpvemkrcEhIMldXdmg2SDFW?=
 =?utf-8?B?TjliVmtCcFVYT1ZiZHhYQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6409.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WGhzSUFsNXlucDVYQkxBWVhrMER0NWF5TCt3Qitidkt1TTR3QzhNQWhBVmp3?=
 =?utf-8?B?bjJKcVI0NUpzNUE3TWhlYlFjeWRES0YyYmUzV1ZqbFViSzMwSTVjVHRGajFl?=
 =?utf-8?B?Mnd4RkJDMmo5dllhWXljdzFYcnc5OVFoTVAwVHY0dGovbm5od3lqdTBlZ1pU?=
 =?utf-8?B?Z3hpRURRdHF0a010MTRacGFraVRPTzQ4TkNkNjZZa1UwL3o2V3gzNDJsT2Z6?=
 =?utf-8?B?YzUzaHZhYlpUVTNOYmVIQksrZ3NTaXJFQjFGZ0Q5U3FHTmhKQTNnNjViR1VH?=
 =?utf-8?B?OHRKVmRVL0Rpb0xONk1xUnlLUmRiTS9NdllyaVErVHdnRVdmMU1XS2dYcUtX?=
 =?utf-8?B?c1ZNZktwT1pISmxYMEw3Qk1UTEJWZjZmYmdvSlFFWHYxaE8wSno2U3UrRmVV?=
 =?utf-8?B?aWN3TGFWbWttM0cyZUVYMEdwZTZzSVZZOUFQS2tYY2FzZExydzNSRmtXcjJq?=
 =?utf-8?B?M1RkREgzNjdiaFUwZnYvVWd5cmhKWm5TRFJUdjR3QUpEUUhaYXV5NzNscGFY?=
 =?utf-8?B?SXpBbmNRVFpMVTFobnZqY0UvbEVNK3FjcEd4ZUFJbyt3N0Zyay90Y284eVA3?=
 =?utf-8?B?c2wvamgxbWJQWXFvczhUbUw4c1FWeHZOYmV0bm5hNVVKRjIralU1NGRqV3Ji?=
 =?utf-8?B?dWxaUzB1SXhheG5kTzAvWFlSNTFTcEJNSENEcWhnQ2NPUzhjaVNjV3JNTjR2?=
 =?utf-8?B?VmJLeUsyTVVqaGJ5Wk5jR0VlbmNxUi9mTXJzT1J2UVorMVlVVFF2dUc4N0VF?=
 =?utf-8?B?aEVUUTlYRDNoWlNPWndkcVdKZU5OOHNldU5TNWoxZkhtWVQ0RGtXWFF1S2Vs?=
 =?utf-8?B?RU1xMEJKQXdrRVVhUjg0WlBQMDdmdlJkakZBMW1heG1TdGFXS3hIbWVvUk81?=
 =?utf-8?B?TUY1YXNFMEdaMjVmZW42L2ZlNHZLRHdKNFM4VGkwRmszajFvNUxCTnR3dWNq?=
 =?utf-8?B?dG81TmxrQlhUUzBWcmJSblg3QzhYRGxRbU56ejFuV0tabHZQa3hVNjlkNm00?=
 =?utf-8?B?cUdDYUdIVitNTG1nL2lZeHZROUpDbmpkYXovNFdnblcyWC9VTk5mM3hTMGFF?=
 =?utf-8?B?aXFncGdPRmtmTFJGTXNSd1lnY3hCNkpTVEdETjZqbjN5U3g4TGdHVm5Wa1lI?=
 =?utf-8?B?a1dQYnNXMWxNWTVkM0N4SUxPSlQwMHVla3FXZFN2aEt2UWNHakl6N0NtQzNR?=
 =?utf-8?B?Z3JDVHVlN2hwcTA4SXE4QWpMeHNReTRqMDZTclN6RXJnUTJZTlJEL0hIa1B0?=
 =?utf-8?B?emRFd2pseEQwUFdjZFIyNktFNWlCZGVhVGMwQ1E0Q3pNYzVwNWJUbWFLUWg3?=
 =?utf-8?B?UEllWUJ5QVdRVVFqNk1BbUF5TFdKUExWY1NZRlhzZFcyM2FRQjlITC9uNWlq?=
 =?utf-8?B?SUFPK0ROY29HNTcyaUQ0dXFpbnlRdjg4eGdKeUx0bVJNVlhIdWhJeW5HMHpD?=
 =?utf-8?B?dXVteURFNGo0ZUdGOGpId1JUbC9DQkFleVVnaFJUa3RHTlU5M1I5UE8vbWQ0?=
 =?utf-8?B?aEFvcXFFMGVyaTRFWHptRitEREFGVUdxOWJITnZUMUllcnR3aHM5UGdhMDNw?=
 =?utf-8?B?M3NLVmlsUXFSVGo1RmFRUFhSdlJmZTVqSmVsT3V6a1JzWk5YQlJyR2ZLNnpP?=
 =?utf-8?B?TndTSDdBMzVVSGJqNG1IWjdNZDY5V0cwcmlNNUE1YWpPTDR3WEFiYk14Rjl5?=
 =?utf-8?B?emUxQVdoaVErNFJGOUl2VXNTeFJ0azBVcjlWNkN6b3lQTmVPWjBicnA0eHpL?=
 =?utf-8?B?UjgrTjNFTGhGVjcyRUlDbVp5VXZlS3d0Smkrc1J0TlQzY2VVenBXZlZ4VUFv?=
 =?utf-8?B?UnVzZjdsWUJrUnFVaEJsbE9XeElYV3hMRGdQSGJUajdaYXk0c2VBK3U5aFZT?=
 =?utf-8?B?RWlYQ3JSYVhXR0UvZDhidHFDYWJqNEFpbm93R2Zuemo2MzNjUmxqeFA4a3p0?=
 =?utf-8?B?emlpTXExZ1JhYUZaU0M5WTllMGxOVmtxUExJWWw1M3IwNU5ocGRHZ1ZpNGZi?=
 =?utf-8?B?RTF4VUJBRmFUV1QwelorRU41S1J0amdoRUd3OTN5WkxGbEtOT3NuM2x0dGxl?=
 =?utf-8?B?TDFmS2w1MW9ZSVE4b1dtci9mM25zRkdrbkNHRmdxd3hmakZMOUFCWDRBVDFM?=
 =?utf-8?B?M1RiU3VsYUlXSmtUZS96RnNnV0JzMEthQ2JjVTJUejUybmRlaGNobnZORFNI?=
 =?utf-8?B?RFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 10c69fc3-9f2b-4d45-a81e-08dd1dc66476
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6409.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2024 11:40:08.4007 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tlxj9bHBAYSKnVnBWE0Iy1VyMfx0mnNtnft/RZr74nWap23KpA8of4SQuKcMkMGwmt59NSJcN3i79bDO5MZCsX7uArQDqzNq4x9IQHaU4Qc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7615
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

On 2024-12-10 at 18:58:09 +0000, Patchwork wrote:
> == Series Details ==
> 
> Series: tests/intel/i915_hangman: Fix spin engine hang (rev4)
> URL   : https://patchwork.freedesktop.org/series/141694/
> State : failure
> 
> == Summary ==
> 
> CI Bug Log - changes from IGT_8147_full -> IGTPW_12283_full
> ====================================================
> 
> Summary
> -------
> 
>   **FAILURE**
> 
>   Serious unknown changes coming with IGTPW_12283_full absolutely need to be
>   verified manually.
>   
>   If you think the reported changes have nothing to do with the changes
>   introduced in IGTPW_12283_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
>   to document this new failure mode, which will reduce false positives in CI.
> 
>   External URL: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12283/index.html
> 
> Participating hosts (10 -> 10)
> ------------------------------
> 
>   No changes in participating hosts
> 
> Possible new issues
> -------------------
> 
>   Here are the unknown changes that may have been introduced in IGTPW_12283_full:
> 
> ### IGT changes ###
> 
> #### Possible regressions ####
> 
>   * igt@gem_eio@in-flight-suspend:
>     - shard-glk:          NOTRUN -> [INCOMPLETE][1]
>    [1]: https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_12283/shard-glk6/igt@gem_eio@in-flight-suspend.html
> 
>   

Hi IGT ci infra

The above regression is unrelated, the patch only focuses on i915_hangman test.
Please update filters and re-report.

Thanks,
Mikolaj

