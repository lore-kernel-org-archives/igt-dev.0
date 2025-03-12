Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7E3C28B28
	for <igt-dev@archiver.kernel.org>; Wed, 12 Mar 2025 09:09:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4347C10E05F;
	Wed, 12 Mar 2025 09:09:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R6n0qZzn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C8C10E05F
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Mar 2025 09:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741770587; x=1773306587;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bE8EWa7bpWSwtYlPg57J3Q7yq+S2po5iUhaEZIPIS7w=;
 b=R6n0qZznzU/OX54h5ovTpKfzcDF8kT302NuFSsrMFcjywOQHG6NOw+GB
 DdEx/NVryAs/mPauY7rG5o/Z08+tlSz8Xa6ZTI7MILDG/vqsSV6kpeF0c
 TFu/yrn1e1YKQEW+k3xgVcdAOy2mrKGG4hvVIWYfHD8orQNbR5/dCQjA1
 NSk7kVlAVTj/oChlptWxvvGvMMZ4G4WN5iZl08J2kQIM4fiTzL7/ttUUI
 AJlSS/dLwxhy84siGejw41qdp2DQ2Esz6f6cen2TVFzo3Jgrq7vg0zhIe
 i1tMs1W7k/Bc5gHLEAoycISoAHxSP1WCvRAdd0ZXLB5xRQhyZFx3w8CxC A==;
X-CSE-ConnectionGUID: adKTiXiISUmAugiBEhDCqg==
X-CSE-MsgGUID: F7p25IGFQNyYKHrqp+vn6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65298878"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65298878"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 02:09:47 -0700
X-CSE-ConnectionGUID: t9rBef7MQBWmPR4ue1nNQA==
X-CSE-MsgGUID: vdDD+CUQSzGwGnisDO0nGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="143776874"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Mar 2025 02:09:47 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 12 Mar 2025 02:09:46 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 12 Mar 2025 02:09:46 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 12 Mar 2025 02:09:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cmn9ussuseasojcgR+K91xuOlzkwQuVITiIIhBt7r7uNdcAW8auV5UaWRUKFUT/RGO13BtyY9/UI/yCLdEnzChjtVkim3Jx67iey9M4zIpV5hIuAHv04v0qpKPiqKt5t8CGDFNHX0/X5PLh8pkc9E783bSYyMKpMoqA2pX1x6FOKqE5crSXMMixcn8QSvNOIm5yScqDi7jJ9QV4qij8ILmdAIrhWOB9jnm2qgAk9PVGEqZUd0vmsKOnsFnj49FXhabXHhjXS21xHleumW7lnOxYHxYkyt5Npa5TrQ6SpUqtWynQs2eM4GhLClhqZztKYZeui3KXW3FcVHIPpelwTmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i/5K938f00CFQ11z8kkxTtPAoULjIjcgEneT+W3jbWE=;
 b=pPx8OZytLC+iJNfIYhIy0yTgXSPgvKFOXjt46ibcVNDAIPTxpCY1rxSklRNsKgUBz2uITqnf3cZr1ftMWoJY4Qjb+GAg1+4jTikgt/bm4OJgY/zmStzUuNqfuRkqYN/nU3oy0blt4eMEj6oaWhIJ+e0qnx9ejQqXsChsF0oLh+BWiS52UcK49fATYf/Q2RLPKwG8p7tGsdOC/NFtXqgv7PnzQIX//5GPnjvSJoiKObKoPAIyleqJO59uNede3+sSTsc4K8And/+4rEgy+ls/TcKMLXdhfLe9SRAom0uYpeVH823/vb7Gf0/dj8lOtvIRAXyaAJ/E/FeFadOTKU/fxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by DS0PR11MB7971.namprd11.prod.outlook.com (2603:10b6:8:122::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 09:09:25 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8489.025; Wed, 12 Mar 2025
 09:09:25 +0000
Message-ID: <a21cc39c-a52e-4126-95a6-8b23c17c3cc3@intel.com>
Date: Wed, 12 Mar 2025 14:39:19 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/4] tests/intel/kms_dsc: Add force dsc and joiner
 test cases
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250107185709.116756-1-swati2.sharma@intel.com>
 <20250107185709.116756-5-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250107185709.116756-5-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|DS0PR11MB7971:EE_
X-MS-Office365-Filtering-Correlation-Id: ab1bcbf1-51a7-4055-c112-08dd614595b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3oyMWtsMGRhY0lUQlBjNnJ4UGVaMFpNY3lldkxHTVBzcFo1TFMvQUtOZjF6?=
 =?utf-8?B?VTZHSHIrSkY2cEcvcVhuK2RqbmEvdnE4ZThZTnBlbWdkaU1DQ0tkNjQrUHRS?=
 =?utf-8?B?YXJ4UlhHZGQyYisvdGxkb2I1UUd0Y3hqb0plRFI0QU5KZzhHREtreVR1bVlT?=
 =?utf-8?B?R3pkWlk0dzRHeFkrK2VveHBsTmFPZFBRejRjMGJBakVVeVJaaS9ocGdaY2Vj?=
 =?utf-8?B?QjY4NHhmYzVqdllaVm5RbkxjWEFmaG1zZm5PcjQ2amVscENsRHdWVVhTWG41?=
 =?utf-8?B?VnE3Ty8wbEZyWk0yeDFobm9WUzZnK3NLVTExL0ttUEVianNqSnVVOVFiM3ZV?=
 =?utf-8?B?TUhKaGt5clZGTEFGMGpCVFZRdnpjV1E0QWxsU1lyOU5BK0hUUlNPaE50UE5E?=
 =?utf-8?B?U1NsYzgxYng1aTU4ZGVQdHh3L0hFSDRzR2E4NlI0dlIxdGk5c1V4T251enV6?=
 =?utf-8?B?ZVBMeW42STY0bXhkTmFRb1lmcDZCeUl5VW9aaVozSzk2cGk5eDIzZEpDOWhI?=
 =?utf-8?B?MFhmVk51VlNreE5Fb1QxMnB5WHdiN20zdEc1b0NDSjNqOFdHZDMxVHlJT0p4?=
 =?utf-8?B?RnhUS3FqeTN3dFY0bTdlOG1ta0NPc1NWRmFJUHNIZENIdy8xcCtOUG83NUww?=
 =?utf-8?B?Nm43ZkRndnQ1R3d1K3lFWmZWS1RwYThReEtrV0xTMVg1SkRBQTlBL2JDS0dv?=
 =?utf-8?B?RkhBS1YwVVRNcE5Tc3A4Y0hoNmgvQXFKK3NvcWIzRU5XWE1qVUF5Rk9FUTJR?=
 =?utf-8?B?NUUyYjl2clVqZ3JFUEZRZGhMOVN5TERNRFpZTXk1ekIrS29rUTFYRVFPVDVl?=
 =?utf-8?B?a1FQWllwVVhOQm0vc1dFd3NWK2daR1FBaXZhY2lRMVV6ckhSZi9IL1k4RFNU?=
 =?utf-8?B?Y0hOSDc3QkkzTFVraklCOHFMVi9mdlJ5TmRaR1JvKy84MGNYeE0zT2x6Rm9h?=
 =?utf-8?B?eXZJTEVMVXVLYVRkQVBaS3h4K1ZrR0wxREt3RUJsM2VGSUoyWHYvbWFQVHlv?=
 =?utf-8?B?b2VJQnhucFhKT3FMWlRuVEJ5N0JKdXgrb2dSNmNXWXBySDNRbXFma2w1b2Vz?=
 =?utf-8?B?dk9ERlZGQklHOVNrQ2h3cW81Y25rSlo0Y2FhbXpqOExQOWJBb0piUytWU3gz?=
 =?utf-8?B?SjFuSVc2Rkw5ajFJT2NHV09mbGZhSXo0UTkxWlE2UjhBRzRvaXp1R1hJWXBs?=
 =?utf-8?B?RmhKYWNwT1RwV0ZzTE1QTER4RHVKVEs2eHhxOW8wMzFSNEREYXQ5K2szMVVP?=
 =?utf-8?B?M1diazlEWjEveThSU1BuOCtxSEdjaXZTVDk4R1NDTUx5ZDRpYmJEaldOcVEy?=
 =?utf-8?B?NkRmb3VBd053OHBIVjMyekdjbkdoR3pjcS84Z0dyYVVscFN6Uzc5TnRsOUgz?=
 =?utf-8?B?UlE5bFdzRU9HNFAzWGwxQVlGUVlFR09rR2c3QjBrTUp0MjZxOVJSSi9hMURN?=
 =?utf-8?B?V1N0akFzUUoxWk9UTnlnMzNIN2xDZzZndlpqMzB4UGt3M0tyU3p5M2JTeEk2?=
 =?utf-8?B?Y25scFVxTTNkYWc1QSsxY0ozTEtMNUFOc2lzTk8xMUZjN3U2UTlrbzhTd2d2?=
 =?utf-8?B?SkNRd3p2NlVHVGwvS2Y5OUtCazJFWHVzZENyd2ppelpacXhIUXFKeEVNMUQw?=
 =?utf-8?B?cnd6ZFRrK2pxZzZyZ25ER3R6N3VXZE1USzM2TVRNK21Qa0hMWDEyR2tZV0xM?=
 =?utf-8?B?blE4bnlNcWE3SVB6Unh5ekIxTWFpbHZQZk81UWZhTVVqRnYyWTBRN1FKY3VF?=
 =?utf-8?B?d0xuOXdGZ25nTXdtRTk0M214a21wMTVXVkdDRERJQ3pUbUgwOVJOK1BKVG1E?=
 =?utf-8?B?eUdOLzFOVnQvak1BaWEremtId0tmbnl5VmxtMitERWEwSUtuWmJKV3hLWTI5?=
 =?utf-8?Q?YmYk1+VmUDNw2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEF2K1ZFdDFJcjNGZDNOeUhNTnAyY2lHcHR2STk4TDFxT0lIV2ZsZFpXc0sy?=
 =?utf-8?B?Tjlrc3BlcVJmRXZrUXN3ZTVrbGlyaU5qTU1xV0UzakovUDEzaGhHNkFsQ1JL?=
 =?utf-8?B?emJLRXV5VmZvKzdISThHd1VFZEd3Wmd0em9hcm5FdTBvMERxNis0eWF6TzAw?=
 =?utf-8?B?Y1RGZkZmWEdZQ2NEcEZja3hRNjBxajZ1N1ZlTjFYN1dxS3hpY3k5dFNFSkx6?=
 =?utf-8?B?TkkzbzFPUjVtM0FKUUdsbFNsNGtBK1pFNTdFWnkwVWwvK01XRm54U3JUdGdU?=
 =?utf-8?B?RURUblY5bXMwa3lUTkJnTEp2SyttemNpL09UTTFoV3k0VUpoa3BoMFNSUlAy?=
 =?utf-8?B?eThyeWdJQlFlNlVsekNWUlJVaWdFVGFWWmdncndhTEJibFhEczRScFE2bjg3?=
 =?utf-8?B?MWZZTWFvWTFTUjMzUWx2akt0ODZRNkZBazIvek5lTjEwc0dBb3lkUzlLRm9O?=
 =?utf-8?B?SG1BWWJRRE5UMmxOTDlGSFYyN2xiTC9CclB4QTNJUHFISGw1UEd3MDBONHNR?=
 =?utf-8?B?NnJNZzhtWThseFZaMzJVM1luY3FmVmo5Qzk3eTR1QlVjTGR3UFBCaHVmS25s?=
 =?utf-8?B?WVBDTzQzMUZ0ampDK2g4YjZDRHRFUVdnTk1XUGYyT3ljNGphdytNVEFVbTJU?=
 =?utf-8?B?S0lSTTJLWWFBc3ZZOUpxeitSTmpIdHhvM25EQTNjQWlpYjVHOEFrOVNJdnBX?=
 =?utf-8?B?V0V4T3hja0FHdUdYNWVUZmZKU25hMWdheDRhZ2xwaEVQaTE2dktLTkQrWmpX?=
 =?utf-8?B?MXpKTHUyUUNVUklYaUp4eDVoMitUUGVPTmlFZk96VmMwQVdDR3VMbWZzOG90?=
 =?utf-8?B?RU5hKzFORXRBT3QxM3BaUXZXeWFxOGFCMnpYcWFpMER0RGQzRjA0cVV2Ynpr?=
 =?utf-8?B?K0ZWMy85dEM0TnFweWtSU25EdUdieThqbGVCcU90dmZMVDI0M3BRYm0xbmo2?=
 =?utf-8?B?ZGNwaTUyRHBrbitaVkxvSmRqak9aSXI1cFplcXhEejk0T3dhMlVwMVdnTGlZ?=
 =?utf-8?B?ZVhSYVBTbzVzbkEzWFB3YmZRN0sxYnljUW9rVStUWnhxNUhWRVdnbTBuaWFq?=
 =?utf-8?B?eGlDNk1MbEliT0hveVNwRWZjS1lxbkJoUVlkZGpXTjUyS0F4M1hNWmM3a2I5?=
 =?utf-8?B?U2RjL25NQXRQbElTOXJpQXJFWUdxMDFOMGFhbnZ6cCtnbFhNVCthVnVrRWRh?=
 =?utf-8?B?R29kUEJRdHBiQ2pRTlRjeVVqK0QxZzU5c3hhTXgxQzhEUWMvWFdjdU9SYlJp?=
 =?utf-8?B?K1QrRXB2SlVxSlhIN3ppUGEwQ3RRRkhjZXFwcFVodzRqZGlWSGdRU3oranp0?=
 =?utf-8?B?R0dRUENkY1l2cHhQS0JYSlU5ZWVRZFZWc2ZoSkhEZW9qTzg0Y0Ria0V3TVJp?=
 =?utf-8?B?ZVRMZlFoODZUdlYvSE5Sa3V3RG8wQXlBcXA1eFljY2dqUW8zTlBvVFdPSkNy?=
 =?utf-8?B?SER4QlZWUnNpYjREUmlvSGt3UEtSdTZ6ZFVoRE5ib3lPM2RER2h3UU8xUlY3?=
 =?utf-8?B?YUdSNEw5dUVlWnlzN0VyVm43S2NRWWgxbUxlOFVqODhWQVRWYmNuRm5DUG9C?=
 =?utf-8?B?MUgwa050T0l4Y0lkbkhKd1ZqOUQvRGNJeVBINFozajU3cThsVVFSUVFXOURk?=
 =?utf-8?B?L21pN2hHbmV0aDljeE5DNXJWVnlDZUJ4R01LcEdYSTlTRnJYUnhySStrdGh5?=
 =?utf-8?B?c1V6dXVNa0s4MFFvb1FINnNnODlkWlhHbUwxTXVjYWEybmxjdkw4Z081L2pw?=
 =?utf-8?B?MWZYL3ptVGE1NGxTYWZjU2FYdVhBejdTc2UvNmMrbjllb29nVnIvejRPSk9O?=
 =?utf-8?B?bEtsaFpiWkhPUnAyRmZqYkdCejlTaFdoMUN6emppMnVkZjNNN3FYL0J6ZUdF?=
 =?utf-8?B?R2R5WFZROWJEQStBeUtKSENyZm56N1Q5UzZUaW8zMEdmTndtaWZzK1BFdVdw?=
 =?utf-8?B?NEgzQ2RhQ0kvZEtxRTBpWlk0RUtmR2lESFl4T0tOTHNDcWhraUhTMnUvOU8z?=
 =?utf-8?B?U1BGTDNXZHZiMDA2cEQ4c3VrejJXMjIwYm9lY3cvMVdPQ1hITmkyWHFaSExP?=
 =?utf-8?B?RlNFUkxVaHRZVGRoMjU3NWZnWFRoYS9iV0U3YWVVVEdoTFkvMW5hUWJzRllz?=
 =?utf-8?B?YjVEL1hIcDhGUVBHZk9yYkVIdXNLcmNuaXpsZ1lPR0cxNWJ2aDFqeHNHK244?=
 =?utf-8?B?cUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab1bcbf1-51a7-4055-c112-08dd614595b6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 09:09:25.2317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ip3re9s/m4LyAVf6qeFNWOLup9+upUdibXQ8E65OV+KrhgqQU0isivWcnYxqpISC2e/NPgevQSnWzD00gSECa6461C1VoayGSv+g6yparK4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7971
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


On 1/8/2025 12:27 AM, Swati Sharma wrote:
> Add test cases where we are validating force dsc and force
> joiner.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_dsc.c | 192 ++++++++++++++++++++++++++----------------
>   1 file changed, 120 insertions(+), 72 deletions(-)
>
> diff --git a/tests/intel/kms_dsc.c b/tests/intel/kms_dsc.c
> index 5508e7a9e..b88a4875e 100644
> --- a/tests/intel/kms_dsc.c
> +++ b/tests/intel/kms_dsc.c
> @@ -57,7 +57,27 @@
>    * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
>    * @fractional-bpp:               DSC with fractional bpp with default parameters
>    * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> - */
> + *
> + * SUBTEST: dsc-%s-%s
> + * Description: Tests Display Stream Compression functionality if supported by a
> + *              connector by forcing %arg[1] and %arg[2] on all connectors that support it
> + *
> + * arg[1]:
> + *
> + * @basic:                        DSC with default parameters
> + * @with-bpc:                     DSC with certain input BPC for the connector
> + * @with-bpc-formats:             DSC with certain input BPC for the connector and diff formats
> + * @with-formats:                 DSC with default parameters and creating fb with diff formats
> + * @with-output-formats:          DSC with output formats
> + * @with-output-formats-with-bpc: DSC with output formats with certain input BPC for the connector
> + * @fractional-bpp:               DSC with fractional bpp with default parameters
> + * @fractional-bpp-with-bpc:      DSC with fractional bpp with certain input BPC for the connector
> + *
> + * arg[2]:
> + *
> + * @big-joiner:			  big joiner
> + * @ultra-joiner:		  ultra joiner
> +*/
>   
>   IGT_TEST_DESCRIPTION("Test to validate display stream compression");
>   
> @@ -83,11 +103,13 @@ typedef struct {
>   	int disp_ver;
>   	enum pipe pipe;
>   	bool limited;
> +	int joined_pipes;
>   } data_t;
>   
>   static int output_format_list[] = {DSC_FORMAT_YCBCR420, DSC_FORMAT_YCBCR444};
>   static int format_list[] = {DRM_FORMAT_XYUV8888, DRM_FORMAT_XRGB2101010, DRM_FORMAT_XRGB16161616F, DRM_FORMAT_YUYV};
>   static uint32_t bpc_list[] = {8, 10, 12};
> +static int joiner_tests[] = {JOINED_PIPES_DEFAULT, JOINED_PIPES_BIG_JOINER, JOINED_PIPES_ULTRA_JOINER};
>   
>   static inline void manual(const char *expected)
>   {
> @@ -149,6 +171,7 @@ static void update_display(data_t *data, uint32_t test_type)
>   	int current_bpc = 0;
>   	igt_plane_t *primary;
>   	drmModeModeInfo *mode;
> +	bool status;
>   	igt_output_t *output = data->output;
>   	igt_display_t *display = &data->display;
>   	drmModeConnector *connector = output->config.connector;
> @@ -161,6 +184,11 @@ static void update_display(data_t *data, uint32_t test_type)
>   	save_force_dsc_en(data->drm_fd, data->output);
>   	force_dsc_enable(data->drm_fd, data->output);
>   
> +	if (data->joined_pipes == JOINED_PIPES_BIG_JOINER || data->joined_pipes == JOINED_PIPES_ULTRA_JOINER) {
> +		status = kmstest_force_connector_joiner(data->drm_fd, connector, data->joined_pipes);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +	}
> +
>   	if (test_type & TEST_DSC_BPC) {
>   		igt_debug("Trying to set input BPC to %d\n", data->input_bpc);
>   		force_dsc_enable_bpc(data->drm_fd, data->output, data->input_bpc);
> @@ -260,17 +288,22 @@ reset:
>   
>   static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		     unsigned int plane_format,
> -		     enum dsc_output_format output_format)
> +		     enum dsc_output_format output_format,
> +		     int joined_pipes)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_output_t *output;
>   	enum pipe pipe;
> +	int n_pipes = 0;
>   	char name[3][LEN] = {
>   				{0},
>   				{0},
>   				{0},
>   			    };
>   
> +	for_each_pipe(display, pipe)
> +		n_pipes++;
> +
>   	igt_require(check_gen11_bpc_constraint(data->drm_fd, data->input_bpc));
>   
>   	for_each_pipe_with_valid_output(display, pipe, output) {
> @@ -279,6 +312,7 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   		data->input_bpc = bpc;
>   		data->output = output;
>   		data->pipe = pipe;
> +		data->joined_pipes = joined_pipes;
>   
>   		if (!is_dsc_supported_by_sink(data->drm_fd, data->output) ||
>   		    !check_gen11_dp_constraint(data->drm_fd, data->output, data->pipe))
> @@ -299,6 +333,16 @@ static void test_dsc(data_t *data, uint32_t test_type, int bpc,
>   						      data->drm_fd, data->output)))
>   			continue;
>   
> +		if (((joined_pipes == JOINED_PIPES_BIG_JOINER) && (data->pipe == n_pipes - 1)) ||
> +		    ((joined_pipes == JOINED_PIPES_BIG_JOINER) && (!check_bigjoiner_constraints(data->disp_ver, n_pipes,
> +						 data->drm_fd, data->output))))
> +			continue;
> +
> +		if (((joined_pipes == JOINED_PIPES_ULTRA_JOINER) && (data->pipe == n_pipes - 1)) ||
> +		    ((joined_pipes == JOINED_PIPES_ULTRA_JOINER) && (!check_ultrajoiner_constraints(data->disp_ver, n_pipes,
> +						 data->drm_fd, data->output))))
> +			continue;
> +

Hmm we want to skip the cases where we have joiner and we are either 
executing for the last pipe or check_constraint fails.

With the suggested function in previous patch, both of these can be 
simplified to just one:

if ((joined_pipes == JOINED_PIPES_BIG_JOINER || joined_pipes == 
JOINED_PIPES_ULTRA_JOINER) &&
     (data->pipe == n_pipes - 1 ||
     !check_dsc_joiner_constraints(n_pipes, joined_pipes == 
JOINED_PIPES_BIG_JOINER ? "Bigjoiner" : "Ultrajoiner")))
     continue;

Overall I agree with the patch and the new subtests.

Regards,

Ankit

>   		if (test_type & TEST_DSC_OUTPUT_FORMAT)
>   			snprintf(&name[0][0], LEN, "-%s", kmstest_dsc_output_format_str(data->output_format));
>   		if (test_type & TEST_DSC_FORMAT)
> @@ -348,85 +392,89 @@ igt_main_args("l", NULL, help_str, opt_handler, &data)
>   		igt_require(is_dsc_supported_by_source(data.drm_fd));
>   	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters");
> -	igt_subtest_with_dynamic("dsc-basic")
> -			test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with default parameters and creating fb with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> -			test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> -				 format_list[k], DSC_FORMAT_RGB);
> -	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> -				 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB);
> -	}
> +	for (int i = 0; i < ARRAY_SIZE(joiner_tests) ; i++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters");
> +		igt_subtest_with_dynamic_f("dsc-basic%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +				test_dsc(&data, TEST_DSC_BASIC, DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC on all connectors that support it "
> -		     "with certain input BPC for the connector with diff formats");
> -	igt_subtest_with_dynamic("dsc-with-bpc-formats") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -			for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> -				test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> -				bpc_list[j], format_list[k],
> -				DSC_FORMAT_RGB);
> -			}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with default parameters and creating fb with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(format_list); k++)
> +				test_dsc(&data, TEST_DSC_FORMAT, DEFAULT_BPC,
> +					 format_list[k], DSC_FORMAT_RGB, joiner_tests[i]);
>   		}
> -	}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it");
> -	igt_subtest_with_dynamic("dsc-with-output-formats") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> -			test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> -				 DRM_FORMAT_XRGB8888,
> -				 output_format_list[k]);
> -	}
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_BPC, bpc_list[j],
> +					 DRM_FORMAT_XRGB8888, DSC_FORMAT_RGB, joiner_tests[i]);
> +		}
>   
> -	igt_describe("Tests basic display stream compression functionality if supported "
> -		     "by a connector by forcing DSC and output format on all connectors "
> -		     "that support it with certain input BPC for the connector");
> -	igt_subtest_with_dynamic("dsc-with-output-formats-with-bpc") {
> -		for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC on all connectors that support it "
> +			     "with certain input BPC for the connector with diff formats");
> +		igt_subtest_with_dynamic_f("dsc-with-bpc-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
>   			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> -				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> -					 bpc_list[j], DRM_FORMAT_XRGB8888,
> -					 output_format_list[k]);
> +				for (int k = 0; k < ARRAY_SIZE(format_list); k++) {
> +					test_dsc(&data, TEST_DSC_BPC | TEST_DSC_FORMAT,
> +					bpc_list[j], format_list[k],
> +					DSC_FORMAT_RGB, joiner_tests[i]);
> +				}
>   			}
>   		}
> -	}
>   
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with default parameter. While finding the optimum compressed bpp, driver will "
> -		     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> -		     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp")
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> -				 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> -
> -	igt_describe("Tests fractional compressed bpp functionality if supported "
> -		     "by a connector by forcing fractional_bpp on all connectors that support it "
> -		     "with certain input BPC for the connector.");
> -	igt_subtest_with_dynamic("dsc-fractional-bpp-with-bpc") {
> -		for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> -			test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> -				 bpc_list[j], DRM_FORMAT_XRGB8888,
> -				 DSC_FORMAT_RGB);
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++)
> +				test_dsc(&data, TEST_DSC_OUTPUT_FORMAT, DEFAULT_BPC,
> +					 DRM_FORMAT_XRGB8888,
> +					 output_format_list[k], joiner_tests[i]);
> +		}
> +
> +		igt_describe("Tests basic display stream compression functionality if supported "
> +			     "by a connector by forcing DSC and output format on all connectors "
> +			     "that support it with certain input BPC for the connector");
> +		igt_subtest_with_dynamic_f("dsc-with-output-formats-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int k = 0; k < ARRAY_SIZE(output_format_list); k++) {
> +				for (int j = 0; j < ARRAY_SIZE(bpc_list); j++) {
> +					test_dsc(&data, TEST_DSC_OUTPUT_FORMAT | TEST_DSC_BPC,
> +						 bpc_list[j], DRM_FORMAT_XRGB8888,
> +						 output_format_list[k], joiner_tests[i]);
> +				}
> +			}
> +		}
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with default parameter. While finding the optimum compressed bpp, driver will "
> +			     "skip over the compressed bpps with integer values. It will go ahead with DSC, "
> +			     "iff compressed bpp is fractional, failing in which, it will fail the commit.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp%s", igt_get_joined_pipes_name(joiner_tests[i]))
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP,
> +					 DEFAULT_BPC, DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +
> +		igt_describe("Tests fractional compressed bpp functionality if supported "
> +			     "by a connector by forcing fractional_bpp on all connectors that support it "
> +			     "with certain input BPC for the connector.");
> +		igt_subtest_with_dynamic_f("dsc-fractional-bpp-with-bpc%s", igt_get_joined_pipes_name(joiner_tests[i])) {
> +			for (int j = 0; j < ARRAY_SIZE(bpc_list); j++)
> +				test_dsc(&data, TEST_DSC_FRACTIONAL_BPP | TEST_DSC_BPC,
> +					 bpc_list[j], DRM_FORMAT_XRGB8888,
> +					 DSC_FORMAT_RGB, joiner_tests[i]);
> +			}
>   	}
>   
>   	igt_fixture {
