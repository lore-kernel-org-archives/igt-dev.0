Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 238A9D149E7
	for <igt-dev@archiver.kernel.org>; Fri, 25 Oct 2024 19:36:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182910EB78;
	Fri, 25 Oct 2024 19:36:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iH4qnKcc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DE710EB78
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Oct 2024 19:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729884978; x=1761420978;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vSIrsfhpmucT8TuqWaR/poJcclKYApWE3kBluR2yO74=;
 b=iH4qnKcctrNANhfrqaGLblMkXefyTOPoqHUR7YOJ80YnruMGH0kRDvrg
 fEPK3uqTa5ABIWOmyzxLKgkXszoc3wqv73voRZnfizR6r/3oV53ip1Ea3
 jjBYNL6h5PT5tNyP2Uf1ahM9vF/kOGOX00Zfly8OqMco5796uGgPV+eS3
 FInFOr8MNA8PwXnfh3OSm1lL0PjkstHArSfl8yoCSMaahEdlBo5kJ7tVZ
 7NziF35M/63c7B3MptA/AcEhKOXGO3fTZdPlcqowMS1411VoJMe1/Gbs4
 CPZ4As/Mq/mCf6O4nkd9cmpjHY2A+faPdSH/a3b7swy0s7moOl+Dp6JoP A==;
X-CSE-ConnectionGUID: ZOcFwRbGSBuSVOc4emAb0g==
X-CSE-MsgGUID: 9AQnUautQLKQAGZnntO3tQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11236"; a="29463596"
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="29463596"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 12:36:18 -0700
X-CSE-ConnectionGUID: YxNzW2f5QJurHThFd/qW3g==
X-CSE-MsgGUID: VprPd8IpQx6vwm8QKwZhIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="85611720"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Oct 2024 12:36:18 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 25 Oct 2024 12:36:17 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 25 Oct 2024 12:36:17 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.177)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 25 Oct 2024 12:36:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjHHYr+2GuwnpxLdTrEzysBMfDX/z/wjmW/qLP9vyccLHwEkrphg44NqD0pOi4BSULuaKExXkUAPSGvu1mOMyGNXVRb946etfJ9LBezxh7rutNVCAH9lyXywJwKUERonmpMTPxCXPxPSmdPCEjnZiVDkzyuZ+VRd7U/v+xYN5XXY79aAMsOHgJhl0svpr/TZv+oqGbx13yDSWa0XHuibrZ+5fFDYeTACEBvV/LxOh7gXQfP5aoIJ1SsojJr8JNuohmTRKEUd5XNbcWhNKS+84cM7KNrOco8NZ4nDNcCa/prvFDPiB3mfQUqnuA80JAGflWW3G0oWiaVFVdbE0bAg6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aRTzQlnJ+KLgJgUF3nSysnLbvY9RagdxxMg97IyMQq8=;
 b=nK2i1zQgZ+lo1xK9Q8K8bSKtK0TIB05ELymL0CXyxgtQLpd+Eo2NYIk1phVVbrM5XtE2bP3FWY9Ap6pzt3hJEjgmBNyCrgLTer4WeAMthPFWnViFBECrHddoxTbBifqfA+Kt7QqB7CrgQkDm1lmlRRTKtsDGJBEusJzjOtvfNUyELXhCR6rxHst4rtnDrbuN28ELqS0mzFPwf0e+G2On971RMdKDRSYuWBokSJ0XMVBSl7SG49qLT/sgBLCFSMQEmbYiVmxpx7Yfz/AqAFp/xYezYR/vakyRwzdJaYjze7gSnqxOwbeFO/FBzotUB8UksfN6IRpZ98Ao9uFoWkqvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by BN9PR11MB5292.namprd11.prod.outlook.com (2603:10b6:408:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Fri, 25 Oct
 2024 19:36:15 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8093.018; Fri, 25 Oct 2024
 19:36:14 +0000
Date: Fri, 25 Oct 2024 12:36:13 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <igt-dev@lists.freedesktop.org>
Subject: Re: [PATCH i-g-t 1/2] drm-uapi/xe: Sync with OA syncs uapi update
Message-ID: <ZxvzLU/InQ1Lcjgz@orsosgc001>
References: <20241025185205.1327235-1-ashutosh.dixit@intel.com>
 <20241025185205.1327235-2-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241025185205.1327235-2-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0PR05CA0201.namprd05.prod.outlook.com
 (2603:10b6:a03:330::26) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|BN9PR11MB5292:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5c9c3c-5ade-4320-5708-08dcf52c49f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Wjc0eFFCcVBsT3ZVL1hEYS83c2dTWnczNEZrOVNiRzR0VDhFYnZJbUl2RTRW?=
 =?utf-8?B?Qm4wbWhwN2ljbHBDWndid014aEV5K2luMmZiTHRZeHZkWjBoMGNjWXFFKzhU?=
 =?utf-8?B?NURadVNHTTJxZ3dCNTF6YzFLVmRxM1JBK0NYN1ZXbE5tQWl2SGhnTUgwWW9I?=
 =?utf-8?B?bzBaMXlGZkdUS25XNWlJVWxMUy9reGMvUUhRZm52YWVaL1dwR0hTMGZGWWl5?=
 =?utf-8?B?YmVSSUF3Zi94UWR3bVBHM2RkZGpXL2xjV3hsNHl6SnNGaVZid0ZlMnZpaHFh?=
 =?utf-8?B?S0pEV0hUeW1qRVh1ZThITitzT2VwLzh0SGxCMk9mTnlJbFIrTjFxSkQvRU5w?=
 =?utf-8?B?NGYyYzhRVDJ6SXRLVG9ubjRvaElDZjRNTkViUkl6OHl2NmlyLzF2VnJUOTJX?=
 =?utf-8?B?ZTB1S2dVeWFHdDluUU5IVk92UnNseldwZVRuNEh4KzA4eGxmNkFoa0MyZmtL?=
 =?utf-8?B?dVE0bzJhT1JqT1BPTXVyZ0RXQzFCK2FYMk9yNSs4bnZUL0MwbVZiSHJndGRH?=
 =?utf-8?B?clY5R0h6WjFoS0xPSTNVMHZ2S0FGa0t3N2NKazNtZXpobERxN3NXaEViV1U0?=
 =?utf-8?B?SkM3cTJEeEgwMkM5bHEzVnVCSDVzblhUTnM2WHRYa3VqZHQrM1pTMWJuQW9O?=
 =?utf-8?B?Ly9kaFk4SEhEMVp4c2d1TXVMeTMvdzEyM1d1aWdYRXIraC81bG5DMFBiVmVl?=
 =?utf-8?B?ZGk1VjhXK0xRbzM4QU9VaER6RERLL0IwMmZqVENaWkU2UlVUa1owU09HMjhB?=
 =?utf-8?B?T3JjbEd0cWJHSy9vdG5tM2N3U011eGpLcWJ3Ny9YUmN2dll1K2UzOVAxYkQ1?=
 =?utf-8?B?eWthcFRLelhSSTVjZjhQbXY3VnpJV1NCVjhzWGV4aXgveFBvMHlVSzhrYlRu?=
 =?utf-8?B?Q0krS3NnMlBiUU9nUVhQZnNUS2lFUjdYUWplWjd3OHc4ZDRNWDlKSzdCUk10?=
 =?utf-8?B?bEJ1TXVla080T1NMWm1jTlVBdXJkSy9xMFlTTDBCMVBMTENjSGQvWFl3cGNz?=
 =?utf-8?B?M2IwWGdLVHpQclU5cmw3TVpub05xUVVwNnBONko3Zkpna1MrVVByT1poaWNI?=
 =?utf-8?B?TVl6S3l5V1phamh4Nzg1aFl3M2src2ZITkRDdm45bS9TZ0owYmJIYnh0bG5h?=
 =?utf-8?B?N3hjcXJHdVd1bG1PU3krb0hZOWx1ZGZJYndJRjZnaEx3aTMzaTl4aXprU2Jx?=
 =?utf-8?B?dElVeVBGdVBrSzdFR29lWUt2dUlKY0gvbHNvRjBycDJEMlhQZGsxSUh2LzdL?=
 =?utf-8?B?R3NzemhITHFuUW9XZG0wNDZ0NzN1bHF0Njk1akJIOWt5dTQ1bERBUk1Da2VK?=
 =?utf-8?B?L3hXSVJkbFY1Z2tDb01SRC93Mm9zYWw0eUZoQVZjSzMycG9zNUg4WVhtbXRR?=
 =?utf-8?B?THdJRnRSVUV3d2oyWWlwMlFoQkFvTWlNb3p1czZnN0dqR0F0RnhoSmY0akcv?=
 =?utf-8?B?eVp6YlprZGltUDNKYXQ1QnlVTWFVMDhWeXhOU0dDWG9XVlRvYjFwazgyQVhv?=
 =?utf-8?B?WitnTE1jZzdld0djZTljbklxcnRxQmVwbmMwRkI0Qmo4SHU1cllmeU1XcXRk?=
 =?utf-8?B?WitKRmpVbjdMeEcwMUFBN2VqK0hiYWxwZ0RmdHBKL2xhR09mUjhyTVF2R3ly?=
 =?utf-8?B?OTNvK2h0cUlES1ZnOXVLcllZNk1OZTlxeFd0dFlEUHF6Nk5vbkcxSFNKNmJ6?=
 =?utf-8?B?NnVzU3lwWXlMWWVoVXlCRHh1NUJUZXo4S05tWUFPR2QrYjlUOWUwSEdIbVcr?=
 =?utf-8?Q?cniVk2/eqdQsc+bbLfdELKgwnRYv1VlhcjqUxEV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TmUyVzNmWFAxd1Z5akFYN210T2FhMHZ5OGxmTjZaUGhNMi84U2IrWEpHRE42?=
 =?utf-8?B?MUd3YjloRTN4OXBMNXBOemRCNWoxWnBnd0JraG1saWlmV3MxcnprckJwQjBN?=
 =?utf-8?B?RkxyN08zMVdtMzB6cUZKR0UxTTBaeU1iMnlZZ1dzeUVRckE5dzVDZTROVXJL?=
 =?utf-8?B?aGtJUWNUSW1ZZlV1OVJsUEE0eHgzK1g3bGJGRC92UkpBYnMwS1VKc0N6YTgr?=
 =?utf-8?B?aXdsTzE1NXdiNmxPcHg4MUpWVUwrbXVZQlc5M2lzZTRqSnVGc0VmWWNHQjNO?=
 =?utf-8?B?YThhVlhyUlRiVmUzVWVxQkN0eVdySWVhb3JUWjNxaGV1UFpuMmp1WkNOZ0Iy?=
 =?utf-8?B?bGVvcnVpYjY2VE45Q2VKaC9IYSs4WjRsRWdqdWEvdlBKSGFMcE5ZVDU5QjEw?=
 =?utf-8?B?MzVRV0FIWmJPNE1FSG5PRExad1BpQlhhbk9vT055cmJna2ZKTVY3NkpXZU9i?=
 =?utf-8?B?SDZhZEZyK1QvMlppQUdLcFVXdHZWNXdBclZ4WEQ2YTg5VkpmNzFxMEpFSFhh?=
 =?utf-8?B?MU1zY2NTMi8yaDhTdDQwMTROVHJlMkpVcGhjbk9LdEZ4QU05V1NxNU9JbTlr?=
 =?utf-8?B?ZzJDelZ2S0lmMDh0c3ljUFJDWmdHMXFvVkNTZTIxWFhhVkNhdnJhdXRkNklN?=
 =?utf-8?B?QnZMOVA1dEROVGtKd2lBQndFclBCVnVwVG8za2lsMmVtZlNPakIwNHJSVTkv?=
 =?utf-8?B?M2tVTG9DOVNHU003WjUvWkNsOFVyZ0RUTmFNRElkV09WZkJoZXVzKzNnSkpM?=
 =?utf-8?B?ZHFKM2l0SHc1VmVWZ25pVWdsWXpYYU5JUGZFZWVQdmYwMnNGRXNJNGNJZEF5?=
 =?utf-8?B?cnVpcSthalBrVWZjVWdDNTVla1k3TXp6S29yM1FrMHpwNFZBUVpERE50UnFH?=
 =?utf-8?B?WStUdldYQkRyRWZnc0l1eDhCVEp0Y2VlZk5VU1g0YnFpNCtOUS94WFM4MlN2?=
 =?utf-8?B?aG9Nb2NobFlqeXAveEhWNllYSEMyUGpkbENJYWVla3htMlNadUFKc3Q4Qlln?=
 =?utf-8?B?STBQY1h2TEFqNXQrYWZ1SkdjVnRpMFFURGtURmZsS3NwVFpHKzVMUWhWK0x5?=
 =?utf-8?B?VkMvdFRoam5JWlZZU05KdzRkNXVFQkdCam55b0ZkeC9tY3pRb0NBV21aUVI0?=
 =?utf-8?B?MXdPU2tHMTk2cU5BWTdIUVI5OVBCcjloWGZGL253TnVDUWx5Tnp3TEtHcnYx?=
 =?utf-8?B?UjZzaGx2b21ZOXVOd2tIMHhPSWhqME1wSm1Cd1NqLzJIMS9tbWMvd2d2Qk9D?=
 =?utf-8?B?dFNEd2tNd3RzSzBNcHJJMnJDTkQvYkxEbUl5ZDdramppdFJKaUhrSGVibzZ6?=
 =?utf-8?B?RkxaaEM4NXFKQjMzSEpRaGFIS3l2MXJtNVgzNHFXL2hwMCtnMGw5bkxpTVBJ?=
 =?utf-8?B?V1A1NGppYWVQVjFBSnZJRTJiVDVDWnRvTXcxL2hhMnYxQ0tTN3NZMHBGR3JJ?=
 =?utf-8?B?S3RiM0NxWGVESFBuUmRudTkvQ3BueXRRQXh2OGt0UTAxdEtLdFp4dkU2V2Q1?=
 =?utf-8?B?OUNaWTRiYy9yTHoyWWszbkRzSGQvSERKMStLY2ZNaDJBTkQ3TWFHVUorUmVI?=
 =?utf-8?B?bUV4b1JoYzdRdTNnQTJOYlNkazRLVkdRM1Uyd0VkdUROOXRmcWdGcDVRcmt5?=
 =?utf-8?B?MWVucVRBWTdIb0owNzdWck1aWThpck15UXVFUllTZVV1K3h6WjFTcFBMdW9R?=
 =?utf-8?B?OXpkRlkyWEY3U3BqVWdvWStYNmxFZ1ZZRXJHUFZBWkIwa2xLamJiSDI2anl1?=
 =?utf-8?B?N1dXeStIRHc5bjQyc2RSeUo3RTJNMWoxRkxCN3Z5SHdBRWtUbEpDVlVXQ3lS?=
 =?utf-8?B?aXFSZDhtVGRaK3M3NFlNd0VMcEsvVEpDMCtCTU5FRWNXWnI4VmFiWTNud2NT?=
 =?utf-8?B?d1FpNGVZKzdFVHFaRVU0U1ZjdktTS2FibTNXK1VVa3IzMzcvMklwS0lRWmhX?=
 =?utf-8?B?NWMwTUdZT0ZxeTBEWFNuY2NoRUIxZ0s2MWluNE11MndIQ0diSDAwVll4V0x6?=
 =?utf-8?B?YlQ2aUcraFVaMWdRLzkrWml1T0Z1ZWZHVm1WUkxEZkNJNnNqamdXaUQ0emRo?=
 =?utf-8?B?UU1YYVR2UElYZkdwcGIxUHMxOWpYNDFlL3g3VjB4Sm8xWEMzVWFUWHQ3OWZP?=
 =?utf-8?B?dWV4ejdLVm5Nd0lBVUpUYVZRMWZxY29wb0RQYkFFbkY0YTNWc2VSVDRCR3FM?=
 =?utf-8?Q?C3qjBlKvHnGt5CSUAb53qEs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5c9c3c-5ade-4320-5708-08dcf52c49f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2024 19:36:14.8830 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2BfOV1QFb/Tw2K/fJxoU6jicIfVO2e7bCh+FiUwEyUG0QIDRtDxU6qilYSoYZ7TpSOfNYy6nyyQs7epXMgkH37gs/7T+7aq4iZfxq6uBPtc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5292
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

On Fri, Oct 25, 2024 at 11:52:04AM -0700, Ashutosh Dixit wrote:
>Align with kernel commit c8507a25cebd ("drm/xe/oa/uapi: Define and parse OA
>sync properties") which adds OA syncs uapi.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>---
> include/drm-uapi/xe_drm.h | 29 ++++++++++++++++++++++++-----
> 1 file changed, 24 insertions(+), 5 deletions(-)
>
>diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
>index f0a450db95..4a8a4a63e9 100644
>--- a/include/drm-uapi/xe_drm.h
>+++ b/include/drm-uapi/xe_drm.h
>@@ -3,8 +3,8 @@
>  * Copyright © 2023 Intel Corporation
>  */
>
>-#ifndef _XE_DRM_H_
>-#define _XE_DRM_H_
>+#ifndef _UAPI_XE_DRM_H_
>+#define _UAPI_XE_DRM_H_
>
> #include "drm.h"
>
>@@ -134,7 +134,7 @@ extern "C" {
>  * redefine the interface more easily than an ever growing struct of
>  * increasing complexity, and for large parts of that interface to be
>  * entirely optional. The downside is more pointer chasing; chasing across
>- * the boundary with pointers encapsulated inside u64.
>+ * the __user boundary with pointers encapsulated inside u64.
>  *
>  * Example chaining:
>  *
>@@ -512,7 +512,9 @@ struct drm_xe_query_gt_list {
>  *    containing the following in mask:
>  *    ``DSS_COMPUTE    ff ff ff ff 00 00 00 00``
>  *    means 32 DSS are available for compute.
>- *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks
>+ *  - %DRM_XE_TOPO_L3_BANK - To query the mask of enabled L3 banks.  This type
>+ *    may be omitted if the driver is unable to query the mask from the
>+ *    hardware.
>  *  - %DRM_XE_TOPO_EU_PER_DSS - To query the mask of Execution Units (EU)
>  *    available per Dual Sub Slices (DSS). For example a query response
>  *    containing the following in mask:
>@@ -1483,6 +1485,7 @@ struct drm_xe_oa_unit {
> 	/** @capabilities: OA capabilities bit-mask */
> 	__u64 capabilities;
> #define DRM_XE_OA_CAPS_BASE		(1 << 0)
>+#define DRM_XE_OA_CAPS_SYNCS		(1 << 1)
>
> 	/** @oa_timestamp_freq: OA timestamp freq */
> 	__u64 oa_timestamp_freq;
>@@ -1632,6 +1635,22 @@ enum drm_xe_oa_property_id {
> 	 * to be disabled for the stream exec queue.
> 	 */
> 	DRM_XE_OA_PROPERTY_NO_PREEMPT,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_NUM_SYNCS: Number of syncs in the sync array
>+	 * specified in @DRM_XE_OA_PROPERTY_SYNCS
>+	 */
>+	DRM_XE_OA_PROPERTY_NUM_SYNCS,
>+
>+	/**
>+	 * @DRM_XE_OA_PROPERTY_SYNCS: Pointer to struct @drm_xe_sync array
>+	 * with array size specified via @DRM_XE_OA_PROPERTY_NUM_SYNCS. OA
>+	 * configuration will wait till input fences signal. Output fences
>+	 * will signal after the new OA configuration takes effect. For
>+	 * @DRM_XE_SYNC_TYPE_USER_FENCE, @addr is a user pointer, similar
>+	 * to the VM bind case.
>+	 */
>+	DRM_XE_OA_PROPERTY_SYNCS,
> };
>
> /**
>@@ -1698,4 +1717,4 @@ struct drm_xe_oa_stream_info {
> }
> #endif
>
>-#endif /* _XE_DRM_H_ */
>+#endif /* _UAPI_XE_DRM_H_ */
>-- 
>2.41.0
>
