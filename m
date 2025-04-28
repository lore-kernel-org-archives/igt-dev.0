Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25936C36005
	for <igt-dev@archiver.kernel.org>; Mon, 28 Apr 2025 04:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C930A10E371;
	Mon, 28 Apr 2025 04:46:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mtea5h/Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227AC10E371
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Apr 2025 04:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745815561; x=1777351561;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yVcuTa8MWICPx9N9v6xWVio3at3EeJJOM2Q9v4Nb+KQ=;
 b=mtea5h/ZqEvzqVieZJMRG04QqYrci754XFBhLDGglCBaZoMvc6ElGfOP
 f6FWtaxb5bNPaKYCS5jCtBaoW1aEl8IzYBYM8OTRP/Fu9wf48PigM7Ifo
 NWPjq9i4badt+E+KLJ4VcFnmdoPje4LWtjn4jZcgqWZrFjQQqAxGBp29b
 qOmg7ekBmxRlDXXq2QztimrUM7I5rASGHNlbwRRVkuzyva+V9+/OyhnhD
 foS5qbsqJvi2T08aZRLLSTuPsSZ6hQApW/TMzRN1csbFEf+iYzKQ8Fp/R
 kkov0gH1ClYnEuVDtTgEYXC7VXukv3SzOQ+lI1RJnECVJ+WuNKS2qHc0x A==;
X-CSE-ConnectionGUID: CM4XfibfSZ2yHAYopM0Lnw==
X-CSE-MsgGUID: OnIK+wGQQyS94lR8g2nSYA==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="47406766"
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="47406766"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:46:00 -0700
X-CSE-ConnectionGUID: J31iTZdxQeidzJxUiHJW9g==
X-CSE-MsgGUID: vR1UBqerTJq+BXH3IkzrhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,245,1739865600"; d="scan'208";a="133715227"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2025 21:45:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 27 Apr 2025 21:45:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 27 Apr 2025 21:45:58 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 27 Apr 2025 21:45:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V4gbh5pAxsfcs5w8sxW/kX0eIsP+sVpWNFPx1h8kDWrMCe9r66Do3CoWN9RHFXXdasBNCxc0BibnqqJaRTOCveCrJWez/uE21oFL/2Se54ELrK84k8o4cck66PZes9w0fdS5fEOF50WKLWsfSYnu5IOKEmgxf3Zk13G8F9FbcLBB7gWQc/IbJXdF/NfQ1RnnMtxHZLNRMgmT5KZExGwMaElBFRbgKvLqvIDSt9eP0yZ3G6QwLYF2DyhbZWT5IuaTSjbcy/J23wKxJDhXclYz+AGy7s6khnK12kWVW+w0x7SRlQFcoZY0Do8vRLirVrgCa4MRmm/jHGxSwJYDr4lzow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xTYbgyydWvi1u8SKMkkaKb8+EidhbhyS8JwlBtbgJ54=;
 b=nn41ntvgemX0okf1HlqKEHPJf16mj+pTkTZlFXDp9rOlkxct6EmyYMOf+v30aDpWjTeaOIg0nLCI2aVLwwdyaYIaytbW8Q62PXOK3em9LFEBQ7G9KGtJrDARd/8KCq7yaYLDNasRaMIM+uptmCQP0grAb2Knp/1x8DNq21VtAhQ1htk82rs5s2rnl85wSK2OtWZhwGbwxVqhK600798yqwdzbLGDFDbs337Z4XgDWH/h90NoupOyLm+dB/SsD5nyfU/qs/Q5EWxdC2f3kGLCFu20gNi0TvcpQm5ViBw7rzZoLcKTLQlN8u5tBtwyiGrrqe/bypatRDjhIMF6kRDGhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DS7PR11MB6064.namprd11.prod.outlook.com (2603:10b6:8:77::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Mon, 28 Apr
 2025 04:45:53 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8678.028; Mon, 28 Apr 2025
 04:45:53 +0000
Message-ID: <fc42fb61-e59a-4d62-a617-ae774f3edf1c@intel.com>
Date: Mon, 28 Apr 2025 10:15:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v5 1/2] tests/kms_async_flips: Split subtest to
 handle linear buffers separately
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <arun.r.murthy@intel.com>, <chaitanya.kumar.borah@intel.com>
References: <20250424074506.2946884-1-santhosh.reddy.guddati@intel.com>
 <20250424074506.2946884-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250424074506.2946884-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0017.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::36) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DS7PR11MB6064:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b584240-00f3-4d97-8edf-08dd860f8e75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SjRMUHVldWVicERpN2gzUDZtVGF1TWNNbEJpNlBwUDRSTU41aHBFUlp2Ulg5?=
 =?utf-8?B?WWxINlNjU1h4TXFlalJKOVpLbVZxNkdmZkw4RkFsVHhBd3lyZEU5cE16ckFQ?=
 =?utf-8?B?bHlDeTh4U1dybml1RDBJWXNnT1ozaERISDFqdGVYS2o5SlFUaXRvS1FBdHBx?=
 =?utf-8?B?Sk5vdm5EWHJsSXdiRUgrd1dJeU8yakE1TlBFaUxQTGR2dDN2K1Q1REdZV3ZZ?=
 =?utf-8?B?RXMzZ1h4eTdYRU4rZ0FEUFEvcEFKUU1TL3V2bFJZWGRJd2U3OGx2a2FJVC9I?=
 =?utf-8?B?NDhRZkZscnVwa2NGcE13aFAvZXlmaEFZYlVVUEwybjcxWE81UVVJMEJOZ2Fy?=
 =?utf-8?B?Y3l5TVlPTlhjKy9JSE1UVW1pWVFQNGNqamsrNmZySnI1QUxhSlQ5djI2czRm?=
 =?utf-8?B?elRJV3hybFZIL2R6d0ZVdThoZ011b3NLZGdVM1YzbHRxbThnN0gvaVcvUzZM?=
 =?utf-8?B?THduL3dLMTRYSmRSZHVhZnpNOXdBMExqemVPMXM2QmNON0hIMTZ3UDlUMlha?=
 =?utf-8?B?aDVQZTZsSStybVQ5bHBRTkZqV0NsRkVkcnNnUmtFK25jVXdXSzlkYXZVMTBs?=
 =?utf-8?B?QXArNjRaMndaa2RIVmdSVmlJMTU0ZG1iOE5VeVpGODZ0bGV5c1hhb1llZS8w?=
 =?utf-8?B?YXJoM05aUEJ1NlF6TVBacDBOOWVqN0c1d1p2STRWQWp1WUNuWUZpakpaSmkv?=
 =?utf-8?B?akNWdFBVVFIrNTNDUWNJSVFMQmtEaE52TDJYV3FNQSsvb3JuL01NY241QkNP?=
 =?utf-8?B?Ynp2WU5sTGp1anZLVU5FeC9RZ2F0MGRiT0hvK0dOVjRzKzhpcmZ1ekxzM1dW?=
 =?utf-8?B?UHZ1Q2E1eW10L0lGZ0MvcHVHR2l3VlZRVTJFdUFHSXE1c2VFaUlEMUZLblhm?=
 =?utf-8?B?T25hRkZRa0VyMWtqSjQxUUV6emtTYWFsSDJUekp6UmYzSDBoZytuUXBSWlBT?=
 =?utf-8?B?NDdQeXNxRUxLWCtaRW81MHBmSXZtWHVmeElsUEYrL0psS3NtdzNtdEdkVk44?=
 =?utf-8?B?VVZXNHZLRnFiVTVlMk03dVJwRXgvZWZQMFJvMnZtZ0U2TVV1TWcwR0Uvb1dk?=
 =?utf-8?B?eERVSk5oakM2eS96WmxKTldJdFlIQXFqeVhLU2xscGpUQ2w2QWp5T25kU2Qv?=
 =?utf-8?B?Zm1CelM1Z0JObnUyZmJ6bkxzYjhRZXozWlJrQUNFZktNVmpmb29VeXgrNUV3?=
 =?utf-8?B?bnVqYm04dEN0MlhYV1dvZWpnaGZ4VFFKOW4xMDA2RzMvWExRc05ia0dPRFg2?=
 =?utf-8?B?RWJrZ1JKT3hKRFE0YXpMbTFTUEZPeVRrNmhUQmU5WEtyVGdKdDVKSkM3RlNQ?=
 =?utf-8?B?T0lyZnpuQ1Rvei82aXZZZXlUVkg0L0tXOVVJbTYvTFVuZ2JVUlIxSnhWRDU5?=
 =?utf-8?B?d0lkWlJFVzRrNlpMR0kwUmFyUSs2T2p6WWg4SkFYcVpiMVN4dStaVHA2dFE5?=
 =?utf-8?B?WUVra2VpU1kwNUtPcVI0OG90LzJuR0MvaTZ2R20wUTgxeUJ5am51NzRTdk5E?=
 =?utf-8?B?d2x0V1haT3VaZmM5cnVUVlIyMTZaQThGRi81dnJaVzlPbmlMbCtwbWgrVHR3?=
 =?utf-8?B?eFpEQlNHUThuV0psejF5K0hmVVhPbk56Uk96NndjcGM2VUw2enhIWitqZmMy?=
 =?utf-8?B?anNkMzE1anFmcEZxM2pGd1RkUGNjTGNnRzROdUw5UDliTmVUOUlkRHdrT2dL?=
 =?utf-8?B?VjJiSnBDemZTR3Zzd0dyZUFRTE9WVWU4U3BxNy9aL0x4OTFoSktjb0JYVm0x?=
 =?utf-8?B?YVB6TitTNmYzbk9yaDNSUDd6MnNmTk9EMUlzQkZtb1hTSk50S0lZQXdVcTNx?=
 =?utf-8?B?STMvRlNudzQvVUtTRFppSjdndHZHSWprWDErMGdsMmlLS1hSbXExNFc3WFl3?=
 =?utf-8?B?b2d4c1I1QWFRMHcxYTF6bWo3RzJuZnhnM2s2dEpjWlpLNG02Vm5ZZGhGa3Br?=
 =?utf-8?Q?tx1DpYVQ7vE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGNDMk1EckMxbm1kQzUwZTZPVWpEcDJlRmpWQXQwY0hzTGRYdlZ3MXlyNnIz?=
 =?utf-8?B?dlFTTnhGaVI3amVBVklKblhFekNnRmtkTHZXT0RmajZkKzlGN1RmK1lFM1ZQ?=
 =?utf-8?B?c2VPeFc3OTVYbEVpVndDL2FKU25jdDV1c3RnM05CN3JYR2dRVG0xZmYrRWtH?=
 =?utf-8?B?ZzNCejJVTzVVa1F0Z1JmTndFM0h0RTBPNXlCeDRMMHUyeDQ4Q0U1WkcybitI?=
 =?utf-8?B?amF0VE5QVXhlejJsNWszQVZMYmNEMVFuQWwrZXd1ellWR3huWW1rNTlPUlQ4?=
 =?utf-8?B?M2NTZmF5OTRHZURtVnNxN2NsMSt2T3orNVN2OGhFWDJvQjBaMS9UMVBYQzcy?=
 =?utf-8?B?clVqR2Rid3dOa1FFdUpkYk9sbmtwSVdJN1NQMVN4cWxOc2tNNDQ5UVlTcmpU?=
 =?utf-8?B?ZzM0WUErYTI0RjVncC9pQS9ac3duaW02dEhiMEx3OUE1KzdsN1VjeUFKZThu?=
 =?utf-8?B?bDkzbk14dlkyb0dzemxmSWdDYnJPT3BwYzRBbU9BK1kwUW1LSWRyQXhVR2h5?=
 =?utf-8?B?eEpiTFdaTGd2aElNRHE4U0xqbnh2bkV4cGlDRno5enpWVEowQWZYZEJkQWho?=
 =?utf-8?B?MmpaYVZnSkxTVG8rWDVVcDBWaDFjQ1kxUURWOFJUaHhNUGJUY0tzU01LWUgr?=
 =?utf-8?B?alBtUUFaZFBraHQybXVwTVBTUFNPZTNPSTY2NE45RUE5NnBweHlBWXVTeUNS?=
 =?utf-8?B?Wk5OMWN5b2IyNi9kSkNub3BMWmd1R2x2MmY3S0hOWm1RSWZOUklucUlwcEJN?=
 =?utf-8?B?MVdrR3dOelBkN2MrdzRpdUhNTTByTU9aTFRZaVNRWHNPSVRqS1FGMWt2clJX?=
 =?utf-8?B?SHllbC9UWTZDUmNxM25ZTXozb092a2E3WmxBSEVvZDRNeFRpMFI1VXRKSGg3?=
 =?utf-8?B?U05WRElQeit2ZTBoMWsrck9aSFp2U3FXa0oySXcvNjl3ZVhCb0doVC9mQmJL?=
 =?utf-8?B?Ulpqc1pCMEt5ZEV3OGwyWEZCYkZLYXFoK1pxQ1pFdFF4ZnZNY2M2bjUxejBC?=
 =?utf-8?B?VlJXWHBTcmh4UzlzR2JzeDIxV2wwbm1wU25vZkhLMzA4VlZJQllUeDdMOTcv?=
 =?utf-8?B?OWsvZTlJbHhZM3VNUFVGM2U5YzJwb3lyYkVTT3JKeXdISUxOVnZjOFowbHhX?=
 =?utf-8?B?QS8wd25WbHcyaWx3ZGRxeGFZenhLYzg0NE9nbGVQa1pTVWpGVVhPekhCUS9s?=
 =?utf-8?B?SE5oWWlJQ0NzYlRBM28ydEU5TjRmQzFuN3ZUL3owZnNYNThKUlJrWlBBZUt0?=
 =?utf-8?B?UElUSkFNalJvdDl3SVBkWG50aWhCK2tyT2VlQlk4RklBREpyakZvL1BDdDNX?=
 =?utf-8?B?RjdFdWJMWVdVTDRCQ1RmMmUycUMvandKK0krSFJFbEJBQUc5RlJCYU1rYXk5?=
 =?utf-8?B?OUlGcEFvTGxsL1R2aUczOGt3WURteEZzUXhMeHlybHBTQTVwQWdhVXVZM1Rt?=
 =?utf-8?B?cXBmZktiem1xUXVSb0JLb3VHVnZCaDRuVlU2Y25wQnhpOGlkZ0ROZUw3ZDVX?=
 =?utf-8?B?WENhb3ZOcXZkMFRJMWs5WEFza1dYdmdoV0R3U3QrVzdtV3FRTkJaVkhXNXJJ?=
 =?utf-8?B?REJoQ3JCcWMzSVZJL24wWitNdDNuem1teUk2WHpvdFJ5dXowZi9WRVN1UjVh?=
 =?utf-8?B?bjQ2TWxqNDhaR3JTWTB5cTVmOTlZQTNRNzdhaVFVSGxneFhBMi91VE1Fbnc1?=
 =?utf-8?B?UDdOVUF2UlR2SXRTYTl1ekR6bGpJZHlXRzZabUp5RzAzS3B3QzBvUURyZ3hi?=
 =?utf-8?B?aXZVeGMvd2IxZHVtTVJwTXFQSWI0Q2pmWnpzaGVTWW5qUFRxN2IwcnF2TDU5?=
 =?utf-8?B?aDdFQ1BCaUNmTjFVaFg0OTB6OHoxNWxROGxicjFESDlNU1o3d0g3c0EvdDNE?=
 =?utf-8?B?bnd0Nnc1aDVDYXFSY1Q2TmdtYnZsQk9GZE9BK0VzRElQYVNxY3o5R3JzaHV3?=
 =?utf-8?B?b3JLbDVOSEJkNnBDV2hlblVURUVTdjBJeFRlRmdCcU9UQ2l3Q0Z6WURETkNO?=
 =?utf-8?B?M2xBVW1VaXJ4RVZTdytxcTVHeWJzbTJCYjZjZXRKaDF4dmxzZnZoL3NxTTFU?=
 =?utf-8?B?ajdZZmIzajN6SzRGNVE0Z1Y0cERsa3JoVnB5WkI4MkQ2cXhqOGFQQzVsamhE?=
 =?utf-8?B?U2xZNWswWWQrQXByY0FOekxwNkpLanUxMDdRaTFaYm9wWHNlS0tGSVJwT1Z4?=
 =?utf-8?B?VkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b584240-00f3-4d97-8edf-08dd860f8e75
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2025 04:45:53.3856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 22w7iN8XkRHcIeLu8er/tK7yZ3gfw4EhWJm0rMYWqkSj6PtFFHkSKJL6fDa3Dp7MdESxZ/op5fEJ3jZgrUBHyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6064
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


On 4/24/2025 1:15 PM, Santhosh Reddy Guddati wrote:
> As linear buffers are considered corner cases, split the existing subtests
> run_with_modifiers to handle as a separate subtest.
>
> V2:
> Rename existing subtest to tiled modifier and make the tiled subtest
> intel specific, fix linear modifier subtest to avoid skip on non intel
> platforms (Karthik).
>
> V3:
> Refactor run_test for linear modifier and update run_test_with_modifiers
> to skip for linear modifier only (Karthik).
>
> V4:
> Set allow_fail based on linear modifier and intel device.
>
> V5:
> Fix build
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/kms_async_flips.c | 65 +++++++++++++++++++++++++++++++----------
>   1 file changed, 49 insertions(+), 16 deletions(-)
>
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 031417ed8..d8708d803 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -45,7 +45,7 @@
>    * Description: Verify the async flip functionality and the fps during async flips
>    *              Alternate between sync and async flips
>    *
> - * SUBTEST: async-flip-with-page-flip-events
> + * SUBTEST: async-flip-with-page-flip-events-tiled
>    * Description: Verify the async flip functionality and the fps during async flips
>    *              Wait for page flip events in between successive asynchronous flips
>    *
> @@ -66,7 +66,7 @@
>    * SUBTEST: alternate-sync-async-flip-atomic
>    * Description: Verify the async flip functionality and the fps during async flips using atomic path
>    *
> - * SUBTEST: async-flip-with-page-flip-events-atomic
> + * SUBTEST: async-flip-with-page-flip-events-tiled-atomic
>    * Description: Wait for page flip events in between successive asynchronous flips using atomic path
>    *
>    * SUBTEST: test-time-stamp-atomic
> @@ -88,6 +88,14 @@
>    *
>    * SUBTEST: overlay-atomic
>    * Description: Verify overlay planes with async flips in atomic API
> + *
> + * SUBTEST: async-flip-with-page-flip-events-linear
> + * Description: Verify the async flip functionality and the fps during async flips
> + *		with linear modifier
> + *
> + * SUBTEST: async-flip-with-page-flip-events-linear-atomic
> + * Description: Verify the async flip functionality and the fps during async flips
> + *		with linear modifier in Atomic API
>    */
>   
>   #define CURSOR_POS 128
> @@ -128,6 +136,7 @@ typedef struct {
>   	struct buf_ops *bops;
>   	bool atomic_path;
>   	bool overlay_path;
> +	bool linear_modifier;
>   } data_t;
>   
>   static void flip_handler(int fd_, unsigned int sequence, unsigned int tv_sec,
> @@ -266,6 +275,7 @@ static void test_init_ops(data_t *data)
>   	data->alternate_sync_async = false;
>   	data->atomic_path = false;
>   	data->overlay_path = false;
> +	data->linear_modifier = false;
>   }
>   
>   static void test_init_fbs(data_t *data)
> @@ -768,8 +778,14 @@ static void run_test(data_t *data, void (*test)(data_t *))
>   			continue;
>   
>   		test_init(data);
> -		data->allow_fail = false;
> -		data->modifier = default_modifier(data);
> +
> +		if (data->linear_modifier && is_intel_device(data->drm_fd))
> +			data->allow_fail = true;
> +		else
> +			data->allow_fail = false;
> +
> +		data->modifier = data->linear_modifier ? DRM_FORMAT_MOD_LINEAR : default_modifier(data);
> +
>   		igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(data->pipe), data->output->name) {
>   			/*
>   			 * FIXME: joiner+async flip is busted currently in KMD.
> @@ -792,15 +808,20 @@ static void run_test_with_modifiers(data_t *data, void (*test)(data_t *))
>   		test_init(data);
>   
>   		for (int i = 0; i < data->plane->format_mod_count; i++) {
> +			uint64_t modifier = data->plane->modifiers[i];
> +
>   			if (data->plane->formats[i] != DRM_FORMAT_XRGB8888)
>   				continue;
>   
> +			if (modifier == DRM_FORMAT_MOD_LINEAR)
> +				continue;
> +
>   			data->allow_fail = true;
> -			data->modifier = data->plane->modifiers[i];
> +			data->modifier = modifier;
>   
>   			igt_dynamic_f("pipe-%s-%s-%s", kmstest_pipe_name(data->pipe),
>   				      data->output->name,
> -				      igt_fb_modifier_name(data->modifier)) {
> +				      igt_fb_modifier_name(modifier)) {
>   				      /*
>   				       * FIXME: joiner+async flip is busted currently in KMD.
>   				       * Remove this check once the issues are fixed in KMD.
> @@ -844,23 +865,35 @@ igt_main
>   			require_monotonic_timestamp(data.drm_fd);
>   
>   		igt_describe("Wait for page flip events in between successive asynchronous flips");
> -		igt_subtest_with_dynamic("async-flip-with-page-flip-events") {
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-tiled") {
>   			test_init_ops(&data);
> -			if (is_intel_device(data.drm_fd))
> -				run_test_with_modifiers(&data, test_async_flip);
> -			else
> -				run_test(&data, test_async_flip);
> +			igt_require(is_intel_device(data.drm_fd));
> +			run_test_with_modifiers(&data, test_async_flip);
>   		}
>   
>   		igt_describe("Wait for page flip events in between successive "
>   			     "asynchronous flips using atomic path");
> -		igt_subtest_with_dynamic("async-flip-with-page-flip-events-atomic") {
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-tiled-atomic") {
>   			test_init_ops(&data);
>   			data.atomic_path = true;
> -			if (is_intel_device(data.drm_fd))
> -				run_test_with_modifiers(&data, test_async_flip);
> -			else
> -				run_test(&data, test_async_flip);
> +			igt_require(is_intel_device(data.drm_fd));
> +			run_test_with_modifiers(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Wait for page flip events in between successive asynchronous "
> +			     "flips with linear modifiers");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear") {
> +			test_init_ops(&data);
> +			data.linear_modifier = true;
> +			run_test(&data, test_async_flip);
> +		}
> +
> +		igt_describe("Wait for page flip events in between successive asynchronous "
> +			     "flips using atomic path with linear modifiers");
> +		igt_subtest_with_dynamic("async-flip-with-page-flip-events-linear-atomic") {
> +			test_init_ops(&data);
> +			data.linear_modifier = true;
> +			run_test(&data, test_async_flip);
>   		}
>   
>   		igt_describe("Alternate between sync and async flips");
