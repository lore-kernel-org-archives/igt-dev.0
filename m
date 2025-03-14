Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABB5C282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 08:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D228710E378;
	Fri, 14 Mar 2025 08:46:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHADD7dH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10E6110E378
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 08:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741942018; x=1773478018;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xLx/ap6V2eIyeZbgq6L3BpFkfxzdfH/4h1fy98OoHw4=;
 b=gHADD7dHpzjB9Bc0rOU6qiImfpLErzoIY6Hb+GjzWUKbM5tmj4epell3
 ITLmGM/E960H18cXVBsR4iCVoKSLtUE3M5IXxxCsRQIi517cL0WnmwtxX
 NOiFmpYCcdD+lYCnGc5uYZ405ihCJ1au/vfsttrP9aPEb6UVJYf4B24cA
 iqzdfbdK1kSoosDRxhnR0e5Vo09V7DCuz+Z7PHBj0+1jaRA4ML9WIdo6K
 LReq8RZPryHkv9mZaply3MBVCtSz2kJGOQ1IO4G+Ptw8yZMUI81nxoqc7
 Qi9prkbC8GS4pkTg9jd80R7Fbg+eQvLu3mSE4PSd+FPmkQbAWCwgNxzgg g==;
X-CSE-ConnectionGUID: YyqWPKUQRR+SBSCQbzRGjA==
X-CSE-MsgGUID: B7P8LW29Sh+an3dKZz44JQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="68452304"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="68452304"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 01:46:57 -0700
X-CSE-ConnectionGUID: YzvuyeEpSbqqv70tiXpayw==
X-CSE-MsgGUID: b9xBlJeCQcmFg78jx2405A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126270840"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 01:46:57 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 01:46:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 14 Mar 2025 01:46:56 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 01:46:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrXluln2MCT6G86/eOzQAz2IaUyXAtZO6XTwwG5nX6HlAN1pBMXdsb0x6YwlxziTePBBI1rUWwsOivDYVf/AKRfHjDF/KGb0zDdb9UaEe6+z/sQRZeQyEAi7FCkX5tMNFjeaUhtnVOHIvbh4PRcUHCfCgERpCr/k4T/UzgHoxjAVGqtYtjmjD/HN2Ukt1gs95LiMBKYVdgXdFMuIcwwBGOjhKtG9WEWlWSaB6UtWoTnHLNti1y42SDExnXjnIsPlNS58m00nZPlC+/8pQ65DFOkXLQoj5+fNAN95OiqSjSp6OoWJY3S5ynZB/x2/vajutsbxMHKPDzEkhTrdEcxUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjHZUe7LpWL60goaYWyyt4AlcsOPVVui3CNWiSZhUW4=;
 b=rtQJNQJnFo4/tbPlePfAnn7pqGERwzNKuVTgFQfKaBm+WveUMTrm0Nz6tYrPKF+8NSJ2at76s3WRC9tbJbnINlxbUdVA9LnOuJNmsuZvosY7wxSjwQRBfJa1MXaASZE/N1NfmHxGiud7WKPSALnFxJaGEs1ZthUgroXVIXNtlGc8uv/rCfY4QNWxnw2mhbZYe2uvQoY8TnOZutRnP6TXYTSyVbIAw1/CNSe1+nfH67ANVxsP7XKUzH0pqGscNrsiHUIzLWJB/8auYsoW27rJIKqF4hfvil2UomfNX9rVxYxlLN9Xo2gE5djARByQCXZ0yYSzNAEBhNuxCo974vFaRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH7PR11MB5765.namprd11.prod.outlook.com (2603:10b6:510:139::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Fri, 14 Mar
 2025 08:46:54 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 08:46:53 +0000
Message-ID: <dad47720-0fb7-4ed7-a8b2-f7c5445c46dc@intel.com>
Date: Fri, 14 Mar 2025 14:16:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 2/2] tests/intel/kms_test_config: Add mandatory
 fields
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250312092654.567154-1-swati2.sharma@intel.com>
 <20250312092654.567154-2-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250312092654.567154-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0099.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::7) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH7PR11MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 893971da-9377-4d4e-ef0f-08dd62d4c4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1ZReXVZVkp6NWN2RzJKUWlpRWFLSUhiU1B2eGFvT25nSmF2eFZpT1R4a1pG?=
 =?utf-8?B?cW5ueTh6NnVkWUtLSjk0Z3dHbTdXbENmdXJqcTJoN1o2OWZod2lNZkN3d2x2?=
 =?utf-8?B?dStJTVFHdjlCKzJPbCtLSGJzbWliVENqSllFcWdhN1JRR2dxei84NzRrQ3ZT?=
 =?utf-8?B?NmlKZ1IzQ2ROTTZ2UUFRVmpDWlRsUVBUaVVQbzhCMTFFK1I4cHVJdXowNEwv?=
 =?utf-8?B?V2dPa01EejJiVXpndEtsK3VhRXJHWkZodVZWWlhNZVo5cDVtSXZxL3RmTUVG?=
 =?utf-8?B?WTlEM2lIQ2p2NU96QVBNbC8rTUhMelF3K1MxUjhzQ1JTRVhOK3haUGl6NGkx?=
 =?utf-8?B?THZwNGFJSVFlZlNGNGNFWEZQM2FpY2ZNYUpYOGE2Z0ZVeGxhVUlhYXZ3ckR1?=
 =?utf-8?B?eTFwTnBIVHdidVdNU2dnamM4TjVwR2tSZ0Nidk1qTVhhS0JVdlRjTHVGNlpK?=
 =?utf-8?B?YWU4WExldml3QzVaMllrYmxnbUF3cUo4YXEwT05ndEhOTmxaZUl3RlE3cVR2?=
 =?utf-8?B?MmRpeG9qZkpXYlZ1ZDBtdWRCeU5kemJzSFI2UHZBRC9vaElteHVTbWNROXpa?=
 =?utf-8?B?ZUJqNWNjR3plRHoyQnFlSWtkWDM5MzA5bnN2Wnc2Mkl6VitVTDdWb2d2Sktt?=
 =?utf-8?B?V2ZCSDZHMk9lbFp6UzExNjhCSWszcjJpbTU0c0hmalkxU3dCbGNvbm94L0xU?=
 =?utf-8?B?VjVudjI5UWZVQWplamhZSVNTTFJlZDB5eWx1cWpiWU9neGhVY0VkVyt1dkd0?=
 =?utf-8?B?ZjJUR25hOVRwRk1oTWJ1OGZVT0RyZkpqRkp5SEcvekNHRlEvTkNKU2VnNHZj?=
 =?utf-8?B?TjAvZjc3TkxNRjl4K1NON3psWVMxb3ZZYkRQOEorYlMyeHVSeFR3eE1jczQr?=
 =?utf-8?B?cWRFR3oya2cyZVBhMTdBN3AxZTdRdU9kNW1yQ3NwempkTWRSb2djcUhoN1Vn?=
 =?utf-8?B?Y04wZVRteXl3TVpLalhTNzVBRThlWHVjd0FDOEcyNTdMOXBuMVp0MWV5U0lx?=
 =?utf-8?B?MXhhT1dsbWFJMFJqQXJiMVBjUngyRVB5aUJZODViL2lEK3BZemNBeHdiR0dJ?=
 =?utf-8?B?VytTdjUrc0ZzM1dOOE1ocDBBOThWTDJFSkVzeWJ1dVBQY1BBN2pPRU5sdFVr?=
 =?utf-8?B?VC9sRkkxcFl0ejF1ZnJ0ZVkvdnZJcjZteE51c1RxRUFOOXZnSmdhRHR1eHlh?=
 =?utf-8?B?RDloaTdyY2xSeVFIRExkZSt5aEErc0lPckF3RXFMNUMzSXFkOVNSN3VvTkNZ?=
 =?utf-8?B?NE1sTmxUdlIvbkpuTmxkUzYwZENtd2xuWTF4akNKcVJIUU15eGJLeEhseVo1?=
 =?utf-8?B?NURqblZzZ0N5SHI2NitycGRJaisrUWlwSUdPSDFCajBpci9BZzFzUHZYODNh?=
 =?utf-8?B?d2RBeTRBTE9pclpBN05xSFpyWXg2Skt6ZDV4TzJSSCt3Zld0NzcyUVRqMzF0?=
 =?utf-8?B?b0Q2ZHREdDRPNXlqTllvQ3NuRUNUVU4vSlZxS2FPc1Q2bTFRV0pPQnR0bFlQ?=
 =?utf-8?B?TGV2b2JaRmx1Ukg1WnZ0RTladG40Y2ZYdmpTNnhoc0xmWkNUSUl5RWgwbHhW?=
 =?utf-8?B?aDg5dkRDSUF2TTRLTnZqdzlINFordlpUQ1JCb08xRGFrL3pya2lmajdHa0tx?=
 =?utf-8?B?ZGVwb05jbWNvWWdQb2VLZ1prT2NHaDlEbVBaNGNFQ3dua1hKbi9ZYk9mM1lH?=
 =?utf-8?B?NDhRR0lnR1N5V3kvWTZ0dlVRcXFuM2tXeUNJWU1CZ1lOdmszWkdFbDRhMXBs?=
 =?utf-8?B?NkZQOE41TWMyY25ab283NCs5NGFHbWZScTVqemc4VlF2MC9rMkV6RzRuT3RG?=
 =?utf-8?B?ZTZRbDJJdCtZeEtBL3E0SGhzRWI5NTNqcFgzeEpaN05EU2hFdFVyb0RQUTFz?=
 =?utf-8?Q?iJ40ub7DJx3Y5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmxGd0ViR2RpY3Z0MlRLcEVySVNDNTd5RFJuZmJaRkFkR0ZSSytiWHVWbmtV?=
 =?utf-8?B?Mi8wdU5XUEdmL1g0WVFaUmZpT2ZsWjRnYnZjWjFxdEZnbGhZR2FRQ3FScDBj?=
 =?utf-8?B?REhRU2tOVkJjSkhXQTEvSk9UMG5EbVNSc0IzVnBVbTdRSXhUMWJDYldjWFN2?=
 =?utf-8?B?MU9rQjJ4WlJTdzBEam03Y0E3Rm5VYmhkbGVBazB0NlVWYUltWGJJZnpDNnpC?=
 =?utf-8?B?RzFybWtiNzJueVc1TU5ibmgrbW81WmVkWS9TcFl1WXFUSEIzY29lUTZxYWQr?=
 =?utf-8?B?V1VQNGpDYTRhM1MydjU1QU5KQmpyVnhld1k3b3VSaGdhMkJtUEZLN2RWazRm?=
 =?utf-8?B?czhhdmF6ejFFNUtIRjEvSkFUSkU2WU93WDNKc2s2TGxVc1AzcXFjOG40SSt3?=
 =?utf-8?B?ZmFBL3FTV29Xb05vSGZqTGQ4K084UDBGaUJuREJoQUlBQkJJMmROeWhpZGVy?=
 =?utf-8?B?NjEweWFFT0tUNUtIMHJ6NWlzN2NqUCtxNWN3RHRrYjI0dHhRdTFVR3l2VXhR?=
 =?utf-8?B?M3ZtcnhlOE9kSmtvdXJyUWtDS3kwYXRmdi81REJPc0JrMTRzdkU5WmpwUEQ3?=
 =?utf-8?B?Mzlnanp3eHFDV0g3TnI1eFRJdTJPYWk3cDFJWGl4cTFmR3FzQTBCWU9SS1NR?=
 =?utf-8?B?OWNiZXZPa2s0YWFNZkoxVXIreGd2b3VNdFhFNGNiMEwrN09zMWRzdXQ2eXU5?=
 =?utf-8?B?eXdiYnV0RTN4dlVLbnFNa2pWUjVFZHFxY2ZxV2MvZVZVQTBDVENGUUM3Y2oy?=
 =?utf-8?B?VlVxZFR6S2I1eVJObktiTmh5MTdHUjY4YjYzUTJtN2grQlVXQnUyS3NGRTlq?=
 =?utf-8?B?RzMvVzY4dDBIWlBSeVEvNW1GR1NQVUVSWFF1WkZ1UGZUQVJIQXBHbno4TFcz?=
 =?utf-8?B?bGRwZFpNdmY5elc3V0F2anNDYVBYT0ZmLzdVdHM3bDZmUzRqOWpRTkpzUnFP?=
 =?utf-8?B?Szh6N1pPNHBHSXYwU3FFa2pzSU5ueWxzZ2hTR0VqU0MrWm1MV25obVpUbzVL?=
 =?utf-8?B?dFdxTTRiK2N4dG1JcTRET1phQlBDUzRMaE1RVEZ5MnZUQjc2OUhmMHlLZjFD?=
 =?utf-8?B?UGNrcGVXRkFPT0Y0OGZ5eU5ITGF3cmwxRjFXb3BBZFBja3ZZRjR4WUluK2xN?=
 =?utf-8?B?WklwVUk5U3E5ZGw3MkIyZG5qTTN6c0NZVVF1K1J4c3RNbXgrTTV4RlNSSVVo?=
 =?utf-8?B?dk9MY0Z5dThoWldOVzhWekZBYmlzdFZKY1lscXV0WllmbHdma2pueURtUTdM?=
 =?utf-8?B?b0M3LzFxcTNpekN4TnRKL3hJdXllbXMyOXZ1Q0l3dUtYenJPaDVpc2pnRmpt?=
 =?utf-8?B?ZnM0d3hBNnpQUmlPWDAvZUJKVU9SckFDQ0lmNW9BdTl2a2twQ1JhNmw1NlRl?=
 =?utf-8?B?K2pqMFM3cy8rNVpBc0haSnZvcG9vWGltdlRFTWtpMFhza1pDOElreXpQcDBD?=
 =?utf-8?B?KzFXSGw1aGg3WHJEOC9LYXY5OW1aRnU3NGZOc1Q2UmdCcDRHUmF3UnFKODhm?=
 =?utf-8?B?aGhpZFZzbVgyTzk2NEFIQmRURzl2NmdWc1hES2MwelhvcnZpU3hKNFFWYXYy?=
 =?utf-8?B?Yk9saVgraCt2YkZvRHNBSFgrSkRnOHVkMHk3MlE4S2FnY1p5Zlc4WWFOQ01Z?=
 =?utf-8?B?L3RDQ1hGZm9kUjNLc3MwY2FiNnJWVm9neWM0Y2w0eGw0V25lMHRSSk5jSWZa?=
 =?utf-8?B?L3ZLMElueDVBTmUxYzh4ajNNTmk0dXpyVHBrd0gvOVRIbWE1TVBaakgrNnlr?=
 =?utf-8?B?bm5RQmFOZk5sOGxHTVpzSTZYdTlhK0VjeGwwTkxhUUp3VUtRSE5MMHlNS0Yv?=
 =?utf-8?B?Q3FZTmFaUXVhTjlLbTVENHRja2ROa1BIQ3FuOHR2QVdNTFJ2THhDbFVOKzln?=
 =?utf-8?B?VWo2aXhjSHR5Z3JYTDRlMFdUSy8vSkJlKzJsMWd6NkJqVWszaDBZLzRvS2Nn?=
 =?utf-8?B?b0dFWk45YjVaNlZ1MWd2aDlBVVJpT1BUWFpzbklVdHRCRFdpMWFCTi93Tlpq?=
 =?utf-8?B?WFIvZk9tNUNDeVVrdlgzZVBwVjJQU0taZDNGdFk3cThBWURyQXhyQXFhbjZx?=
 =?utf-8?B?SDd2U1FldkVaRDdPcTB6VE1ObUE5eDh2Rk5GZlZoUzB2OWZKMkFJZ1VKa2R5?=
 =?utf-8?Q?VNWyYdwqnAqlIoAVqnSp6GWZD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 893971da-9377-4d4e-ef0f-08dd62d4c4a8
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:46:53.2182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jUOqZU4n4zG0VFtuofYFNnag1XBD/nQSHaojXg223AGsneLGp3d7oNlkm1T+WYJRlJh8KZ6+LTTsWIc2vdr7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5765
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


On 3/12/2025 2:56 PM, Swati Sharma wrote:
> To maintain consistency across all KMS test documentation, lets
> make few fields mandatory.
> Let's follow the following pattern
>
> 	/**
> 	  * TEST: <test name>
> 	  * Category: Display
> 	  * Description: <test description>
> 	  * Driver requirement: <i915/xe/i915, xe>
> 	  * Mega feature: <mega feature name>
> 	  *
> 	  * SUBTEST: <subtest name>
> 	  * Description: <subtest description>
> 	 */
> TODO: Upstream documentation for mega feature

Hi Swati,

Since we're making mega feature mandatory in this patch, wouldn't it be 
good to have the documentation for mega feature as part of the same 
series and getting them merged together?

Thanks,
Karthik.B.S
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_test_config.json | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/tests/intel/kms_test_config.json b/tests/intel/kms_test_config.json
> index e11c7f4fe..aeb16a94b 100644
> --- a/tests/intel/kms_test_config.json
> +++ b/tests/intel/kms_test_config.json
> @@ -28,10 +28,12 @@
>               },
>               "Category": {
>                   "_properties_": {
> +		    "mandatory": true,
>                       "description": "Contains the major group for the tested functionality 'Display'"
>                   },
>                   "Mega feature": {
>                       "_properties_": {
> +			"mandatory": true,
>                           "description": "Contains the mega feature for end to end use case, e.g. the 'PSR' feature."
>                       },
>                       "Functionality": {
> @@ -44,6 +46,7 @@
>           },
>           "Driver requirement": {
>               "_properties_": {
> +		"mandatory": true,
>                   "description": "Describes any Driver specific requrirement, like i915/xe."
>               }
>           },
> @@ -59,6 +62,7 @@
>   	},
>           "Description": {
>               "_properties_": {
> +		"mandatory": true,
>                   "description": "Provides a description for the test/subtest."
>               }
>           }
