Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E92D78319
	for <igt-dev@archiver.kernel.org>; Mon,  2 Dec 2024 13:03:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0476D10E1B3;
	Mon,  2 Dec 2024 13:03:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iW03TqQM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D06F10E1B3
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2024 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733144636; x=1764680636;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oqF8iaOhiarjDgX8jgv/VaheILgREdLHgYa5dRHyL0M=;
 b=iW03TqQM+MUpjJqq5AdHrc4YchUqciTAZKt+VU6wGNe/jWaYqVir4MJ3
 Ykw4zJtouWMIBN2k8dhZeksFR2vp8xPnSqX/RwiIL6I8NHnhox1Rmt+CS
 Q8x/3jEaKjjgyUyNDiAKjwNWpectBrT2+gyLoC+vvpl9Ydpq6b83q6Mwh
 svDx85zxIoMFiiz+kMZexTO4n/Oj3FruxnskV6AykH6vWf552jfYaOUiJ
 EFr+Br5NjvRLoYEVf4V0KJTkIes5EL2WWfwU+s4Ci5FlLOKK2sihj1pgn
 ZLCqIxHad4Gmr/+AsVOXEdapXXsjfZU8B+3XX8l2PuTDJhF3BMVIH43qn g==;
X-CSE-ConnectionGUID: ZcJD4e76RS22b9mwLWs5TQ==
X-CSE-MsgGUID: eKqae3x2T9iG7QRCbvLNLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="43794625"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="43794625"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2024 05:03:56 -0800
X-CSE-ConnectionGUID: odOrZ5XnTaOAid40OgmfUw==
X-CSE-MsgGUID: GOux5hSlRnu2DIrQIICI8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; d="scan'208";a="92930716"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Dec 2024 05:03:55 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 2 Dec 2024 05:03:55 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 2 Dec 2024 05:03:55 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 2 Dec 2024 05:03:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D1T5WYnirMyzoHBD1PuTfFgtCr0LjTakyUBsF3lilh0IxbicI6wVKSOKKoDeg4p6nEfmH6ysBM96TSAgm1P7Sbig71Rnkj+nYRPKNPEwUmwpYg6MZGe4toxmBDkwifoIfMbS97hYUrsNVaU3sVmz8Hdr18Vs0GxJv0ff6FLgPACA7F4dBbBCvD4J9GG8uV59UAbW1lTdCTimHTLpkAr8pGZGRnNVdgnmlk3EY9HeufLHLbLgwYBe2vysjvmoYLrJDPkrsKo4xlr7EzEl9/UZi29ATnOLHzNskCw4aOPMV2Fq0s3eLnU7TPX8lMqQvpCLdwRnvue/XqQPyDkgntvERA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCRNo+xIUBGz8k5sHD6RUOqGUyxptPEH83Q5TCcWNho=;
 b=Yb4EvWfhgJCxl5hnjZ6bjYy91/+VxyxT1UhFfSuBn+LrPGBBJO3YrVyjsR9GvHFwR3PyvlVY8DbS65yY6Z3dCf0g/lfIydpzGw9LDJs9RzCgXEBKtZI3KIygzaQxpE6rtNOKzor5Y8RRYAIOPwPCFJw6O2vcGSNf9IAFC57WtFt0Fh5NGtmmXi2OpqyPd7PmVDSRPZ87uKJqoumgtATa6hpcsLR6YDJHpMtPm445XE2a1dkScOfJqgOJUduwnttgBSZ/TeBNHDISAWW06he5LimcA8OUb8GV5snSsl08reUwquliUvS0LpZ4SwTD1PwDMNZFYjEfdF5a3CBz9TL3Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by CH3PR11MB7322.namprd11.prod.outlook.com (2603:10b6:610:14a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.17; Mon, 2 Dec
 2024 13:03:50 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 13:03:49 +0000
Message-ID: <ea50177f-e2dc-4451-bacc-fe8b62a3ccae@intel.com>
Date: Mon, 2 Dec 2024 14:03:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/4] lib/xe/xe_sriov_debugfs: Add debugfs get/set
 functions for u32, u64, bool
To: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kamil.konieczny@linux.intel.com>, <adam.miszczak@linux.intel.com>,
 <jakub1.kolakowski@intel.com>, <michal.wajdeczko@intel.com>,
 <michal.winiarski@intel.com>, <narasimha.c.v@intel.com>,
 <piotr.piorkowski@intel.com>, <satyanarayana.k.v.p@intel.com>,
 <tomasz.lis@intel.com>
References: <20241127200302.1376594-1-marcin.bernatowicz@linux.intel.com>
 <20241127200302.1376594-2-marcin.bernatowicz@linux.intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <20241127200302.1376594-2-marcin.bernatowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ZR2P278CA0003.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:50::6) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|CH3PR11MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: e4c86f61-87b2-429f-c8cb-08dd12d1c260
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0hBV3NHNytqZk5GM1ZjWFhFZXpadlpLWG5aajVQYldlVUVEOXhPYVJQbHBl?=
 =?utf-8?B?VnVjUm9KRXJ3cHQ3aWxmdUgxMnphaU8xYmNWeWo2dVdzTVFZYTUwSm9WWU5y?=
 =?utf-8?B?UU40WUNOOTkyTnQxSnFMb2JjS2pKcGtNbjZ6cThpQklaV1I1U1grZTRiajBD?=
 =?utf-8?B?UElZc3NyQmNhVHNhNFI1Z1AzUWc4WFZpd0ZOOU1ZS3ZJL0tqcVBpQUxLVi9L?=
 =?utf-8?B?dnU1b1pxck1HNGk2R09YeHlOR1FXa2QvOVhqdUczOFlCV0I1LzBzd3JMZTI0?=
 =?utf-8?B?ZSs2anBnM3FZVjlQZm8ySG42aktNNTFhQzYreXpmRW5SR29ZbFpudkpia29a?=
 =?utf-8?B?ckZJYVVHUFNDa1pNVEJZVnBULzdYbjBKMitBcXFGNnUyeW8wdEFRV0pRV2Q5?=
 =?utf-8?B?ZFMyUmZ0NDJaVlRIay9teUZrK1JnUTYyeUJtQjExeDlneU1WQUYvcEZhWmpV?=
 =?utf-8?B?cEpqbzNEcmpZL1o3cEIreTVSZUc3aWNzdFlseGx5bmhmTFNicysxdXlDK0Vv?=
 =?utf-8?B?ODhFaFVJTnFPZWU3aDZOSXprWXlaZUVWNjl3Q2dIbUtTdER5bUtDK0dCU3Ax?=
 =?utf-8?B?UXY5NS81YzY1Q3hjUkFDeU0rVzVMOVRKaUlETUVYSnlMUHR6UEZyMDhZQTV3?=
 =?utf-8?B?SGFzeGNzVkwrd1NjajdFdEJjSm13VXVMRVcrdTIyY1U2TE9zRDdzNmJTLzBy?=
 =?utf-8?B?ZmxuVVFNbEUwWmZYVUJod0N0K2hiQitXckZoSndVdXRKWVVSMzJ3aEJDYitr?=
 =?utf-8?B?bjlBS241UkFWd1BXQjEvangxTWhXMGNiT0M4U0RXOFdjU1BZYTNrK0FVUTN1?=
 =?utf-8?B?Z0lGcnhIV3g5Z2FLVW92WjVua3lEL1FSNWFSQWllQzFvNVZJMWhNaDRvWTlW?=
 =?utf-8?B?eTRMS3hrUE1lM3FRY3VrOWRyeTJWK09yTi9XWVZUeVRSekUwTGhBUmRlWmpm?=
 =?utf-8?B?SElmbThTQTA2QVN6STRkODltOEQ3UVNPQVhiZy9SaU1xdHR5T2Fpczl2dG9Y?=
 =?utf-8?B?enVVTjk0cURpdUFMV2NZaFBycGRpUFcwTEg4bEtLWGpjNVgwNU15UXloZzJt?=
 =?utf-8?B?WWpSMFpmTUI1aTFrZ2IvMDQvNmZHWkIzNGd4dElKN2tJY1EwT0RHV3hQWVVN?=
 =?utf-8?B?NWhFVEREdm8xUGJzTk9LdS9jQ3NpZW5nZTlCbGEyODdQSFpra1lMenRJdDcv?=
 =?utf-8?B?MWtqZFRMcE5DNm9LSGxBQzNuMnhQTWs3dVh0SG0vcHdtTERlWTZraWJCclJq?=
 =?utf-8?B?YURkaXphT255SjZiUkVqd1FSbUY5Y2hrd24xQVZtLzY0TGx0RkcraXZ2a1ND?=
 =?utf-8?B?VVVrRkJuWHZqempKTGc3eUY5Rjl5ck5rQUxlVTN2RWJ3eE8waktvVVVTM2Mv?=
 =?utf-8?B?RVJSOFpMaDlNZGZmN214eGJaRHRYOHVNeUExQ2M2MWpweEtNZkNjTWtkcDZ4?=
 =?utf-8?B?M3U3MVN3TDhZcUJWYzlWdkZZN2NGWW4xR3FwU20vV0JhTXFQVXl0TzF4RXQ4?=
 =?utf-8?B?Mks1VzM0cDN4bGIrOERsWnFoZGZ4S3ZhSUgvVDhzNXhKeHJNUVFSTk40M1ZC?=
 =?utf-8?B?MTFBNHBlaHlVYkx3K2tqVmNiUlR3WmlRTld2aG9qSlpsL2ZaeG9KUXNUclJV?=
 =?utf-8?B?TEFOVUszM1lIVHUxS216RU1lK2E1TWtXekhHTzBVTnBrWjVFNlZQNUd2NjZz?=
 =?utf-8?B?RFdaME5DVnR0VDMzVWFiNUV3bnA3dFJGTkF5VHJzT2tPNSs3KzZRMjlkOFg5?=
 =?utf-8?B?VzNPcUpkUU1pVDlkNTl5SWpjSE5PUyt5L2JHN1pKc0VMR093dWtISmlLNTA3?=
 =?utf-8?B?dytsYWpHbjdHVml6SUdQUT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bU5YdmU5Yll0a1dQd3g1L2o5clc0ajE4WURqMisvbGYwUDAzaHdLTHh4QlV6?=
 =?utf-8?B?U0Q4cWh5bEpIeGNDWGhXTGtUcDZzR1oyRzVmUWhyeXNZeVQ0S3ZHcG8wQmh3?=
 =?utf-8?B?N2o1L0xIZGFXbmxDTDUwN0ozZUR1dHNSYjhsUFFwUzhnYXQ3VzcveXQyeWZn?=
 =?utf-8?B?aTJNOUxRQ0EzT3MyNmdKeWNwajBaV241RCtCNFUvalUwdTRsWFdTcnMzNGhV?=
 =?utf-8?B?a3R2UW00NzdrWnRoL0VmZC9EcWxRT2tXNGYwTWhUNGZDUHp0SmNkTTBJcWpK?=
 =?utf-8?B?ZVpEemdVc1dTWEV5SVBNSTRZdXMvRkhnTXJZMm9QZkZ6SDlRd0NQTVdRNGNH?=
 =?utf-8?B?NXZocThFWXZCa2FIUkFsbEpHYTlhUWJoV2tibjF2R2ZrSVY1N0FRYnZYSEZh?=
 =?utf-8?B?R1JNVnk1ZWNtdktON2E2YUpLR2hrM0pSRlNQTWt3eUJTTE1jb0pDUWNQV1A5?=
 =?utf-8?B?aytCeFlCSXk3TkFqTTJ6ZlVkeXZ6cTNWd3RJeDdnbjhLcmh0OWs0enhsT3N6?=
 =?utf-8?B?T2QvNERjZSs4akRsSjkvUG9acVM3bDgzdEFyMDNLZVFDb1h3dkF5TzBaWmZr?=
 =?utf-8?B?SGRVTDlnR0FGR1pseDBuVWdQNDhTUXkvWFhucE1FZVFvNk9qQWlXQWJGOW5H?=
 =?utf-8?B?aVAzc1BIOFRwNzRKZUpLWHBEdWRBS0dwNVdKU0tqaERDM2gxSFNlOEFDNzhp?=
 =?utf-8?B?clo5TnNJSnQ1bHpmd3IvSTdKTWp5ZDMyRDY0UCthaDU1KzdWaFdlVWxhNWhK?=
 =?utf-8?B?UjNOWjhLaktLREx6RU9iOGYwS2xpU09YVnBIeXZzdFZwZ2VONittdzRvSm9O?=
 =?utf-8?B?aUFwSElIT1NwL2RlT25pV1VGUWxuT0xFaDFZNXRFSFhndHhVWisvb0V5dk54?=
 =?utf-8?B?RVRBRDNySFNEaFJrTWpPRmZORXNTZTlqbUVxdEJOd3JBSCtwVHZ0ZUpXdy9n?=
 =?utf-8?B?bHlTMUFpVU01TWZ5Q1YvZUl6SXRaOGNhSy9LS01xaENlNHp4QmhQTFl2Ykt1?=
 =?utf-8?B?Y3l0SldrRXdhQkRrT2J2MWJzMFl0TUNMWEQ4SjVDekltbkRiTEM3KzdLZDV1?=
 =?utf-8?B?S0FVbVBiOXNxZjBlMEM5dnNkRDVkMFRqVDdkb0xlYUZ3TWxPUGY5aUhleENP?=
 =?utf-8?B?WkRJYXVKV2tLTVNEQU5EUlZoTmgyQ0pXTFZMQVJEakRRd3NHSFhQYjk3K053?=
 =?utf-8?B?QW5yZUw1Z1B5UnhGM1YyNThDYjJtMzZERzk4YWFmZjlIRXdpKytsM0c4Rmdr?=
 =?utf-8?B?RktJamdRU1RPNFI0aVpRMmdNamVmUHBEUkNoaHkyY2xaQ3hPbU1mdmpwVUxR?=
 =?utf-8?B?VUpBaXQrQzd4RWhrbW1hdmZLRlZRa2hJbTcxbWRoUWZmM1R2ajFTUmtEdjBM?=
 =?utf-8?B?ZjdVakljNXdzNUUybDlIQmJuRDFhV1BKb01oMU1FNndZU3ZuamVHempXVmgy?=
 =?utf-8?B?UTJWV2FqTmFCY0VUM2s2YVp4dXdsYUY4VVAzbGJFak5WaEJKMW9zYVBSdXUz?=
 =?utf-8?B?UDR6MW1zeS8rSFBiSk5nOUJ1cnE2bTk0Nm5mN01zRnR2dVkvZXJWM1lReDQ4?=
 =?utf-8?B?ZnFKM3ZWc2JGU2xLeDNDc2NqVER5UXU3U0Y4OEJleEZLTVNpNTZDa09admpJ?=
 =?utf-8?B?dURtRmVOTS9sVjJZbEdRdkt4elg4TkhOUTJaNUlRd0c3b3grUERnWmVGd1Zx?=
 =?utf-8?B?UGhrNjMza0l4Yms2c00yWWxFWjE3U00xZlFJeEhvN1VwOXFPbU15V2FLQTlM?=
 =?utf-8?B?dEdvVmdLaEhNTzc5ZFkyU0FFU3lOblYrbHVKZmlxanJWem4vMUJvNXRhd3ZT?=
 =?utf-8?B?RlZzbmNEUUxNTU9mTFNvaFNBWnh3WUZJL0F4Q2V0aHkwemlCbWdPZHN0T1RC?=
 =?utf-8?B?bHNtcDdGVGZmUWp1Z0x5cUNvbnNsMUdmaytSMmFlN291NDBYYUhBUGtsRE5Z?=
 =?utf-8?B?MStzREtEektadStxWk5wS085RnV3OGtIWTY0YmZ1VVRaQUFRWmsyaHdxalZm?=
 =?utf-8?B?RmFSV2x0aGEwZCtMNE1ocVY2eTV4QSt0RGdFVHZLTWlua1I4RVpqQ2pRbHRT?=
 =?utf-8?B?NkhjVlE4aldoT1p2M2xRZTVhVjU3YStXMGhPOWNocUdBWHlaazFZM21VSkVO?=
 =?utf-8?Q?nxUtuz2ZI1mqId1YQwbJ7pbn7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4c86f61-87b2-429f-c8cb-08dd12d1c260
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 13:03:48.9594 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sdYpRGicMagIvHtXFkg/HbK/U4uvlyvtRTe89MHGEXq5IGiH2ALcsQGHAIQb6rLFi9vAKJRYLf0dhWEUnJEuWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7322
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

On 11/27/2024 21:02, Marcin Bernatowicz wrote:
> Add helper functions to get and set SR-IOV debugfs attributes for u32,
> u64, and boolean types.
>
> Functions added:
> - __xe_sriov_pf_debugfs_get_u32
> - __xe_sriov_pf_debugfs_set_u32
> - __xe_sriov_pf_debugfs_get_u64
> - __xe_sriov_pf_debugfs_set_u64
> - __xe_sriov_pf_debugfs_get_boolean
> - __xe_sriov_pf_debugfs_set_boolean
>
> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
> Cc: Adam Miszczak <adam.miszczak@linux.intel.com>
> Cc: Jakub Kolakowski <jakub1.kolakowski@intel.com>
> Cc: Lukasz Laguna <lukasz.laguna@intel.com>
> Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Narasimha C V <narasimha.c.v@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> ---
>   lib/xe/xe_sriov_debugfs.c | 194 ++++++++++++++++++++++++++++++++++++++
>   lib/xe/xe_sriov_debugfs.h |  18 ++++
>   2 files changed, 212 insertions(+)
>
> diff --git a/lib/xe/xe_sriov_debugfs.c b/lib/xe/xe_sriov_debugfs.c
> index c87f91492..038912f23 100644
> --- a/lib/xe/xe_sriov_debugfs.c
> +++ b/lib/xe/xe_sriov_debugfs.c
> @@ -9,6 +9,7 @@
>   #include "drmtest.h"
>   #include "igt_debugfs.h"
>   #include "igt_sriov_device.h"
> +#include "igt_sysfs.h"
>   #include "xe/xe_query.h"
>   #include "xe/xe_sriov_debugfs.h"
>   #include "xe/xe_sriov_provisioning.h"
> @@ -204,3 +205,196 @@ cleanup:
>   
>   	return ret;
>   }
> +
> +static int xe_sriov_pf_debugfs_path_open(int pf, unsigned int vf_num,
> +					 unsigned int gt_num)
> +{
> +	char path[PATH_MAX];
> +
> +	if (igt_debug_on_f(!xe_sriov_pf_debugfs_path(pf, vf_num, gt_num, path,
> +						     sizeof(path)),
> +			   "path: %s\n", path))
> +		return -1;
> +
> +	return open(path, O_RDONLY);

O_RDWR?

> +}
> +
> +/**
> + * __xe_sriov_pf_debugfs_get_u32:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @attr: debugfs attribute name
> + * @value: pointer to read value
> + *
> + * Reads SR-IOV debugfs attribute @attr for given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success and negative error on failure.
> + */
> +int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint32_t *value)
> +{
> +	bool ret;
> +	int dir;
> +
> +	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
> +	if (igt_debug_on(dir < 0))
> +		return false;

return dir;

> +
> +	ret = __igt_sysfs_get_u32(dir, attr, value);
> +	close(dir);
> +
> +	return ret ? 0 : -1;
> +}
> +
> +/**
> + * __xe_sriov_pf_debugfs_set_u32:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @attr: debugfs attribute name
> + * @value: u32 value to be set
> + *
> + * Writes @value to SR-IOV debugfs attribute @attr for given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success and negative error on failure.
> + */
> +int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint32_t value)
> +{
> +	bool ret;
> +	int dir;
> +
> +	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
> +	if (igt_debug_on(dir < 0))
> +		return dir;
> +
> +	ret = __igt_sysfs_set_u32(dir, attr, value);
> +	close(dir);
> +
> +	return ret ? 0 : -1;
> +}
> +
> +/**
> + * __xe_sriov_pf_debugfs_get_u64:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @attr: debugfs attribute name
> + * @value: pointer to read value
> + *
> + * Reads SR-IOV debugfs attribute @attr for given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success and negative error on failure.
> + */
> +int __xe_sriov_pf_debugfs_get_u64(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint64_t *value)
> +{
> +	bool ret;
> +	int dir;
> +
> +	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
> +	if (igt_debug_on(dir < 0))
> +		return dir;
> +
> +	ret = __igt_sysfs_get_u64(dir, attr, value);
> +	close(dir);
> +
> +	return ret ? 0 : -1;
> +}
> +
> +/**
> + * __xe_sriov_pf_debugfs_set_u64:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @attr: debugfs attribute name
> + * @value: u64 value to be set
> + *
> + * Writes @value to SR-IOV debugfs attribute @attr for given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success and negative error on failure.
> + */
> +int __xe_sriov_pf_debugfs_set_u64(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint64_t value)
> +{
> +	bool ret;
> +	int dir;
> +
> +	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
> +	if (igt_debug_on(dir < 0))
> +		return dir;
> +
> +	ret = __igt_sysfs_set_u64(dir, attr, value);
> +	close(dir);
> +
> +	return ret ? 0 : -1;
> +}
> +
> +/**
> + * __xe_sriov_pf_debugfs_get_boolean:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @attr: debugfs attribute name
> + * @value: pointer to read value
> + *
> + * Reads SR-IOV debugfs attribute @attr for given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success and negative error on failure.
> + */
> +int __xe_sriov_pf_debugfs_get_boolean(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, const char *attr,
> +				      bool *value)
> +{
> +	bool ret;
> +	int dir;
> +
> +	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
> +	if (igt_debug_on(dir < 0))
> +		return dir;
> +
> +	ret = __igt_sysfs_get_boolean(dir, attr, value);
> +	close(dir);
> +
> +	return ret ? 0 : -1;
> +}
> +
> +/**
> + * __xe_sriov_pf_debugfs_set_boolean:
> + * @pf: PF device file descriptor
> + * @vf_num: VF number (1-based) or 0 for PF
> + * @gt_num: GT number
> + * @attr: debugfs attribute name
> + * @value: u64 value to be set
> + *
> + * Writes @value to SR-IOV debugfs attribute @attr for given PF device @pf,
> + * VF number @vf_num on GT @gt_num.
> + *
> + * Return: 0 on success and negative error on failure.
> + */
> +int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, const char *attr,
> +				      bool value)
> +{
> +	bool ret;
> +	int dir;
> +
> +	dir = xe_sriov_pf_debugfs_path_open(pf, vf_num, gt_num);
> +	if (igt_debug_on(dir < 0))
> +		return dir;
> +
> +	ret = __igt_sysfs_set_boolean(dir, attr, value);
> +	close(dir);
> +
> +	return ret ? 0 : -1;
> +}
> diff --git a/lib/xe/xe_sriov_debugfs.h b/lib/xe/xe_sriov_debugfs.h
> index 856445e76..2db965f9b 100644
> --- a/lib/xe/xe_sriov_debugfs.h
> +++ b/lib/xe/xe_sriov_debugfs.h
> @@ -16,5 +16,23 @@ int xe_sriov_pf_debugfs_read_provisioned_ranges(int pf_fd, enum xe_sriov_shared_
>   						unsigned int gt_id,
>   						struct xe_sriov_provisioned_range **ranges,
>   						unsigned int *nr_ranges);
> +int __xe_sriov_pf_debugfs_get_u32(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint32_t *value);
> +int __xe_sriov_pf_debugfs_set_u32(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint32_t value);
> +int __xe_sriov_pf_debugfs_get_u64(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint64_t *value);
> +int __xe_sriov_pf_debugfs_set_u64(int pf, unsigned int vf_num,
> +				  unsigned int gt_num, const char *attr,
> +				  uint64_t value);
> +int __xe_sriov_pf_debugfs_get_boolean(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, const char *attr,
> +				      bool *value);
> +int __xe_sriov_pf_debugfs_set_boolean(int pf, unsigned int vf_num,
> +				      unsigned int gt_num, const char *attr,
> +				      bool value);
>   
>   #endif /* __XE_SRIOV_DEBUGFS_H__ */
