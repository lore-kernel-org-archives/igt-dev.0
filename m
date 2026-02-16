Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDFDE63F25
	for <igt-dev@archiver.kernel.org>; Mon, 16 Feb 2026 04:16:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C27910E11E;
	Mon, 16 Feb 2026 04:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Eg1QO6wy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBFA10E11E
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Feb 2026 04:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771215398; x=1802751398;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PDqwBqa6MOgIOk4hqESuuPawLa3tTssulSNfa5kgbFI=;
 b=Eg1QO6wy1JKcI1RkpQMp2Hhv3mfJlRT2E1kSvrp7ByhU6hIh7MLxJrDe
 YXE+BZGYwOqpRPb4BkuQ03Ec0gHJyHkRN0aDWIZcs1yybGLt6FUaUSo7D
 AwsDeEYi9UMkG7MjtBNE0/rnBb1ToXal22spatTD3oAmmhTMgtS8HwYEl
 tKhFqLtzdVaeQr2Jva+P8vH7QQ18cqYiwbwEAjNnkP0JG+PRZjvYxkM/t
 BMTTFMG6fDNlufx1JIJHZRfTKEScO+5S1tiRBs+cvdHy0JlGEhlTjN02+
 bRUp27T7U6kLcp4QALeoEiyrMGMwmCQXWdj26HuABgOyxJEo/Vmjw3d5f g==;
X-CSE-ConnectionGUID: bS0ELy1ORSOBlJCL8AjXVw==
X-CSE-MsgGUID: fzeFQvKCQ0aKHfI5Jmf/nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11702"; a="72009006"
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="72009006"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 20:16:38 -0800
X-CSE-ConnectionGUID: ilwOXhrnToaNxyLnU81h9Q==
X-CSE-MsgGUID: LPJDYnH+QCmZ6frcBby7iQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,293,1763452800"; d="scan'208";a="212732155"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2026 20:16:38 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 15 Feb 2026 20:16:37 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Sun, 15 Feb 2026 20:16:37 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.22)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Sun, 15 Feb 2026 20:16:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjDnibQVtSh9owi6NGdpOmy7lRLud7rmsXauVNsd3HJUqQyvZQYiHPEWiymKaH5Q8pu0q66jA5GbenpoyBf64M1UKiX6NbvItR8gHqA5j0AmNGokNZj/4oY8VVmxbUHdavfz9+MBMM10dslhp4MK/ch3xRvVmPSfr/8gjZ7aQ/f/Gk1NjCQ0d9pAhqMv+5PRTYLk94LGciuNHTDU5Km03rGNwoZnQ7yTw73qg4S82wf+trjkeWE2gVEgEtn4dxiI9tubAJZUTc16x3qsB1etyFz94+GcHEAQB6Menfx+P15NTEm2lwZatjI8JTWOX/Kd/vyS3DGa6YmZPxp8DqnRtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUWJkMaQRasnNvDicAwHlppaeDPh8FpwKf5cN9eseDg=;
 b=PfoXPfcRX9WXIK4C17TV7ydmbT1IR7BLuQG0ePf7fgqAjgcxS4XWbEolmCaiSa8MCEp4jG+0xvCRpaBglvtjgKOm96nla8mbUYH4Voeh+R8J7NY00/GLRKHdeZWsj0i3DD2YMtai5kgsfH617eqXzHyGoGAGlLxlONon/vcg5ES8/O5uO3PaodNfkYKxi+eI/pjrACrN9VlBjlusYRC9544tbbDMHPFYRnoDmHBmQuOjy/uQLC6XyD76XLdcBSfjmZTVLpzeLTuR6OpvcQX4wO//iKL7kwjRZ5KlzBMOKB4TXSrp2ZEeo2Tby4oRANqUrnxariXX5q5MdXVsw2I03w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CH2PR11MB8865.namprd11.prod.outlook.com (2603:10b6:610:282::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 04:16:34 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9611.013; Mon, 16 Feb 2026
 04:16:34 +0000
Message-ID: <13d5fa0c-02a9-42d8-9932-0f41f9510864@intel.com>
Date: Mon, 16 Feb 2026 09:46:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 3/3] tests/intel/xe_madvise: Add purgeable BO
 madvise tests
To: "Gurram, Pravalika" <pravalika.gurram@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>, "Sharma, Nishit"
 <nishit.sharma@intel.com>
References: <20260212090921.2079711-1-arvind.yadav@intel.com>
 <20260212090921.2079711-4-arvind.yadav@intel.com>
 <BL1PR11MB552594265280ED17CDCB612E8461A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <BL1PR11MB552594265280ED17CDCB612E8461A@BL1PR11MB5525.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0051.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::13) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CH2PR11MB8865:EE_
X-MS-Office365-Filtering-Correlation-Id: 27cd22a8-d3a7-49fa-1eee-08de6d122bc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L1FUWTNxYWNaQjh1Sm42QWxuK3puMFJMTWxCa20wS050TENWOUljTXB6RnpV?=
 =?utf-8?B?UnNBeWRzdTdGNTNhUHo1ZUVEL3FWc2VIWnhOVjcrVnJEMlNvdXhYakhaSnZk?=
 =?utf-8?B?REhacTU1WUdLQkprYzV0TENSUGpDWC95RXEvbEEvUk13YlY1dDcrZ2dvcVhI?=
 =?utf-8?B?RkM3cW1iKzB5VFdCeUpkcjhQWFE1c1FFSFRuS2xkNUQ4Y2xhQnUvZTZIcjkx?=
 =?utf-8?B?VGs4a2dQSWJrenltbVo4dDFIeVMwdkhwOVgvNjg5UU4rNHU3b005dW01c0dy?=
 =?utf-8?B?c0J2RUQvM3dmUlo1MHNmYWcwSkFWSy9EeHUrSjlOakgwcG1wSUlXWWEzdVd3?=
 =?utf-8?B?UHk4Wkt4MWh5QURORms4R1A2eGxqYzNDU0NzTlkxeFFyU2R6N3VtRnJFbFM5?=
 =?utf-8?B?STNoamJXN0J3Z2VYNjZObS9pdldLYVdBTnhnUDdXeE9mTmU5Q0oybGpibVo1?=
 =?utf-8?B?VWxoYXlPenRtaUJ5d25PaThnTk5DYkJrM2N6KzV6NDZLcTlFTE9HZGd5c3A4?=
 =?utf-8?B?WmErckZzQXRkOUxJcnpyTUd5VWorSVZwWjJlenRRc2tYUXRaSjhPNWd4R1Fk?=
 =?utf-8?B?NnVRblJLMDRqOGV6Z0JSVU42MDF3aDNlbGRXTTIvYithVnJSWE5ZRzU4cDBi?=
 =?utf-8?B?Tnd0Ukh5OTBObmFBZG5TUVdpb2UrejF2RkxmM0dPVWxJU3dneVR1cUsvMWUx?=
 =?utf-8?B?SGFveEhDWXlMMEg2RDdyMGMyOE9zU3F2dEJYV05qWmJELzgzWDNlMnBCeTVY?=
 =?utf-8?B?cHBVRGxPMnlYTDRsTURpa3ZrdnVoKy9LYmYyUXkxbFo5WnNNM25ieVJoNDRM?=
 =?utf-8?B?a0VpcjJ6aGVhTGE1VXE4Z1kwTjBEdzhma0xldkpJMmpJRzQrVVd0dnphcW8r?=
 =?utf-8?B?SHViMTNPSVlpMGhYN3VZY1pQMFlHK2lGaUZTUnhCOXQ4MTFEcXNiQ0Z1b2kx?=
 =?utf-8?B?RW9WMmZzRmxrdkVSRWxFZWhGczZabktQeXNMc1NtbDZyUi8rblR0MjdYOG04?=
 =?utf-8?B?VWEyejVHa2hXc3JiMXdiYkJhWEVjZmpPQ2p2UXlXVEZoUFBvWlV1SUFodlZy?=
 =?utf-8?B?Rjg0OXVEUTh1NzB3V1k4cjJ5Tk1FTVFjOFVmdVlqeHJKaXk4UUdxMHBOSWtS?=
 =?utf-8?B?Wmd2dzRGdDJTMERBMTlyaU83Wi81dnFsS01xWWg1Z0hjaTYrQUpleUdWNVJN?=
 =?utf-8?B?SnhTS1pKVm83bWxkZnFVbWUweDFSakt0Rlk1UjU1K01YczljSVNXU1Y0MVI1?=
 =?utf-8?B?dWU3K3MzWDJlZXo5RWNpcjdOUEdDSENUc3NpNmUrV2FiQ3VVcHNQYjNGbzlY?=
 =?utf-8?B?OWFHUXFXbjdRVUwzekgvbWxtbXNzOXZIa0JVK1M1azREWklPT1p5Sm5UY1oy?=
 =?utf-8?B?VFFaK3BuTmRoeEpoOThxTjh6ZnNzS0NEbTRnSk9SZVJRMDJBb1JQOXZsN3J6?=
 =?utf-8?B?bjVoSDAwelpmMzdtS2g2cGhYWWtNTnc1T1E1MzNlZUJtb2cxRE5zOCtId1BP?=
 =?utf-8?B?SWQvNTRiMmRGSkltZm1hZlFLVnlITkRXa2laRndSMm8vS3FJSFJSSyszK0ty?=
 =?utf-8?B?ZFVxM0NTcGRIazBBYzZhYnQ2ZnZHTVVQNXk0b2dMV1d1ZFhNMTh1My8zTzAx?=
 =?utf-8?B?UlNDd0ROVEQvOGxVUUZIN2NiTzhER2REanlTMzhweVluYk5kbWZ2TklhT295?=
 =?utf-8?B?YVRCeitoQzd2eCtBNHNrQWZRQlhYeUF3TS9MSmQ2N3ZNcERvaGduOVNKS2J3?=
 =?utf-8?B?QWNPb3VCSEIvSlVZZXUyM2RZYnpTSjY0d0lWSitZaTdtcnh5ZjdGREFiSTFP?=
 =?utf-8?B?eUhtVzdkbGFnSTZqbUx1azlqZk9Hc1gvTVAzVks1djM1a3VXR3E5ZGw0RUYx?=
 =?utf-8?B?aFdMOGp2UUc2UXU4Z0xCU1o5dkNSYVg2UWNacnVzS3NjT1k3aWJSR2t6dm95?=
 =?utf-8?B?Qm44Y04rK2J2Y1hlbm1FVmhyd013Q29RaGprOENNWkpHdDZ6aHhCZjJzcHRQ?=
 =?utf-8?B?MExORmZSRmN3QWZwTHQvWW9vZ2hqelc3QmFycnFEeSt4TUlxYUpyaHJZYWlz?=
 =?utf-8?B?cEQ2M1VlakxyeUJHbVdkQjhGQnJVclhFbGdqc3pub3lvNm1IeXBHVmZvTndG?=
 =?utf-8?Q?QQmU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGZJTXNDNjY0Q2xUZWNpMkZDQkpDQXZOVmJJS21BL0pCazJvYWVWSnhTVFMv?=
 =?utf-8?B?Y1NWNTJwV2JUQzVGU2QydmdCVUNwTUMwSVhrYTdJTStDSnRhQVYvUnAvMXdU?=
 =?utf-8?B?NGtsdzZFZjFFWjFjb0RmSDBpdytTVmN0VmhnSjFIVnFlaFJEZnJkWEx3dENC?=
 =?utf-8?B?cXp5Mk0xa0Z1OTQ0bm84NTB1NDBqM1pBRFdPKzFLNytyYUNDRWxHMWhoU1Ns?=
 =?utf-8?B?enIydEs3cktTdXhWTHV0eTNmeG43dk1xcTRSbTZqQkQxaDhuSVA1dDdIVWx5?=
 =?utf-8?B?UzI3RzhZdW0xTlZNazVkcXNoYVFLZk5STmN3TnA2ZVVFd0MvM2txZzJkOUEx?=
 =?utf-8?B?eDhaSkZmS2VOZkw1MzRUdVdydFlyNHpwNFY2UkJIaW1MUkl5UEx3NlhXaHg1?=
 =?utf-8?B?RFFjVUNDU3M4N09LT3ltMllUNjNSbmMrL1U1YlBudHluTFVNMmx0YXdWRzdX?=
 =?utf-8?B?YzZHbnhCQXRkOWhLV2Q5L1Y0OFBYUkQraE5qVzY3V0lxR0owTW8zd0laVVJF?=
 =?utf-8?B?NXo1SDFqYWRadEhnMGhZZDZUN0h5aDQwZ1VvSVBScnVkbFkyaUNrT0hsQ1Rt?=
 =?utf-8?B?RXNZNHAzZ2xKWTVhT2hYV3hNcUw3SXFGd3dUS2dUdTBPYmhnakZKeTlDUTRW?=
 =?utf-8?B?OHBVMm4xcXM1OHluQ0w1ek5BWE4rMDRZRnBibmVnU1RvREVKUmcxK2s2MWlB?=
 =?utf-8?B?ZStQSUQ2OUJwaUxsVzRiSXBqZ2tmc1JCV29zNGhObXh3WWQ1VHIxdXVIS1Ns?=
 =?utf-8?B?MzVRQVo1TFcyM1NQY2FINE9iRytmdjRBY0FMVHdibnVXaTZFSFh3RkRrQStO?=
 =?utf-8?B?K0RSTzYyZU9WaStMOHhTMTFSTjlaUDVCVVBoaWJKZ0liVzN6N2VLZXhwVDh0?=
 =?utf-8?B?cm1ydWRHVlFiV0hGcklhUlF0RDBRRUdWWTBMT3BrcCtLU0ZsTzZLVFpPTUFz?=
 =?utf-8?B?TmVScnc2SEV0UmNlcXlvalYzL1NtNG1tVVNmZWlyZWdhM3g2bldwRW1wSHVM?=
 =?utf-8?B?aHRqY3VjNWJyVHBNUitZRTNmd1dIT3ZvamU3NDE2RWlzcmxzd0xPR0RkK2hC?=
 =?utf-8?B?QWVVR1krYmNPRG5UWGlIblIva0lYbGRNWTd6bXd3S3hTNmdCTjBDMUI2Z2dq?=
 =?utf-8?B?SUpCaXdMbExhYXc5YmJHRnI4b3gwUm1nb2svOEVUS042STFTMXJGbWFrNFQ3?=
 =?utf-8?B?TWl5YVFJcWxub3k2SUZJeTBtL0lnM3daVjBiSjZWc2kzakpCeUVYZUxxbWNp?=
 =?utf-8?B?MzFUOHdxM091MWlocWhyRnc5UUp2L1NSdGNvanlOUk05MzlPUHJaVGd6MitK?=
 =?utf-8?B?RllUNXN0M1Y3TnZ1VDg3VmVLVURPN3Rqb2VGbDBpeklKOVBiVFJqWjMyY0J1?=
 =?utf-8?B?UlJYS01xZ0JMclFlaTgwZE11UkdHOHBCUWtmYUxiRjVuVGp4Rkh6bmJqbDFu?=
 =?utf-8?B?RDY5bUdUQmxSTzRTTHFZWmxlNkFMOUlSVFFObXMva2Y0M1FrVFU1dno2MzlM?=
 =?utf-8?B?OWpqeS90R1RjZzNWOUZsM2d6VUZ0Wm9mUURaaHY4c25FV1VYVnBTaGhSSkxq?=
 =?utf-8?B?VE5KbzIxZXJwYkpUSC9zVTk3d0tnYWJLZVJ5NWU4QnhhQzRQdCtnM2lpcGlQ?=
 =?utf-8?B?SWpJY0J5L0ZDVkhrZXM2elFoclp5Y3VsY3hHTkp3blZzMjN1bVRlOGtGUVdL?=
 =?utf-8?B?dTlRWVY2UkpCUFRLU3I4OVZhN0hMU2pWZ1l1bjROb2s4ajFFUmJReEMvdW9P?=
 =?utf-8?B?R0dwaW54YWZUSFpKcmNFUnpreG5iWlBVUUhTRzZXVDArVE9NM0gxODJ1Q1RD?=
 =?utf-8?B?SWRtdEtiam5CLzBmdnZSZExJeDFLM1BZbjJ3M3FlSW12d0hoNWYyZXNJaG80?=
 =?utf-8?B?UVY2R2lYbGdicXFhTDByR2VOc2hBS3d0TWRRaGF3M3MyZVZMWE5UWUpzZlVa?=
 =?utf-8?B?bW51OFJaanF6YVZMZlJmUEFkOXN3YktWZzlIZ1RrRVp4UXJCUklpSXE1N0E1?=
 =?utf-8?B?RmFWNzdobVBBZzdPeVJlcy8xK29tOXpGUnV1Q3RVTW84SGgzSWlXenY3Tkxu?=
 =?utf-8?B?K0xKTFNqejJuSVNxRjJLQnpGWHhLWjNlaG50U28zTmRDT2pZaUc4clRTbXhY?=
 =?utf-8?B?UEQ3K3FSbUtEM1ZvTjFJUExWUmExcVhtZ2FSVGtMYTdEYnVaK2Y3OXB3NkR1?=
 =?utf-8?B?ZnVINHVrSjNVZlRwZDBJRHJpM1E5L2IzZktQT0dZb1dpRU1XK3l6dEIwa0VE?=
 =?utf-8?B?WTJOVUJUVFRXZkovcGx3SGY0azViMXgxQmtRSlArdG5EekRtLzhmWFhHTmZo?=
 =?utf-8?B?Y29UN1kwdzAvam5CV0plRGFtZlFodGQxWk56Q3dma2ZWZlU4dHNHUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 27cd22a8-d3a7-49fa-1eee-08de6d122bc5
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 04:16:34.8033 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKU0aCS4KXeRfjkvCPK7tFNjY6ZaJ1wzsz6D2xB2dChYVCKCBUYcDJXCGV88N2vS4Mfaoe3IrP0H8o2aJ3jwlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8865
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


On 13-02-2026 15:18, Gurram, Pravalika wrote:
>
>> -----Original Message-----
>> From: Yadav, Arvind <arvind.yadav@intel.com>
>> Sent: Thursday, 12 February, 2026 02:39 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Brost, Matthew <matthew.brost@intel.com>; Ghimiray, Himal Prasad
>> <himal.prasad.ghimiray@intel.com>; thomas.hellstrom@linux.intel.com;
>> Sharma, Nishit <nishit.sharma@intel.com>; Gurram, Pravalika
>> <pravalika.gurram@intel.com>
>> Subject: [PATCH i-g-t v2 3/3] tests/intel/xe_madvise: Add purgeable BO
>> madvise tests
>>
>> Create a dedicated IGT test app for purgeable buffer object madvise
>> functionality. Tests validate the DRM_XE_VMA_PURGEABLE_STATE ioctl for
>> marking VMA-backed BOs as DONTNEED/WILLNEED and verifying correct
>> purge behavior under memory pressure.
>>
>> Tests:
>> - dontneed-before-mmap: SIGBUS on mmap access after purge
>> - dontneed-after-mmap: SIGBUS on existing mapping after purge
>> - dontneed-before-exec: GPU exec behavior with purged data BO
>> - dontneed-after-exec: Purge after successful GPU write
>> - per-vma-tracking: Shared BO needs all VMAs DONTNEED to purge
>> - per-vma-protection: WILLNEED VMA in one VM protects shared BO
>>
>> v2:
>>     - Move tests from xe_exec_system_allocator.c to dedicated
>>       xe_madvise.c (Thomas Hellström).
>>     - Fix trigger_memory_pressure to use scalable overpressure
>>      (25% of VRAM, minimum 64MB instead of fixed 64MB). (Pravalika)
>>     - Add MAP_FAILED check in trigger_memory_pressure.
>>     - Touch all pages in allocated chunks, not just first 4KB. (Pravalika)
>>     - Add 100ms sleep before freeing BOs to allow shrinker time
>>       to process memory pressure.  (Pravalika)
>>     - Rename 'bo2' to 'handle' for clarity in trigger_memory_pressure.
>>       (Pravalika)
>>     - Add NEEDS_VISIBLE_VRAM flag to purgeable_setup_simple_bo
>>       for consistent CPU mapping support on discrete GPUs.  (Pravalika)
>>     - Add proper NULL mmap handling in test_dontneed_before_mmap
>>        with cleanup and early return.  (Pravalika)
>>
>> Cc: Nishit Sharma <nishit.sharma@intel.com>
>> Cc: Pravalika Gurram <pravalika.gurram@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   tests/intel/xe_madvise.c | 747
>> +++++++++++++++++++++++++++++++++++++++
>>   tests/meson.build        |   1 +
>>   2 files changed, 748 insertions(+)
>>   create mode 100644 tests/intel/xe_madvise.c
>>
>> diff --git a/tests/intel/xe_madvise.c b/tests/intel/xe_madvise.c new file mode
>> 100644 index 000000000..c08c7922e
>> --- /dev/null
>> +++ b/tests/intel/xe_madvise.c
>> @@ -0,0 +1,747 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +/**
>> + * TEST: Validate purgeable BO madvise functionality
>> + * Category: Core
>> + * Mega feature: General Core features
>> + * Sub-category: Memory management tests
>> + * Functionality: madvise, purgeable
>> + */
>> +
>> +#include <fcntl.h>
>> +#include <setjmp.h>
>> +#include <signal.h>
>> +#include <string.h>
>> +#include <sys/mman.h>
>> +#include <unistd.h>
>> +
>> +#include "igt.h"
>> +#include "lib/igt_syncobj.h"
>> +#include "lib/intel_reg.h"
>> +#include "xe_drm.h"
>> +
>> +#include "xe/xe_ioctl.h"
>> +#include "xe/xe_query.h"
>> +
>> +/* Purgeable test constants */
>> +#define PURGEABLE_ADDR		0x1a0000
>> +#define PURGEABLE_ADDR2		0x2b0000
>> +#define PURGEABLE_BATCH_ADDR	0x3c0000
>> +#define PURGEABLE_BO_SIZE	4096
>> +#define PURGEABLE_FENCE_VAL	0xbeef
>> +#define PURGEABLE_TEST_PATTERN	0xc0ffee
>> +#define PURGEABLE_DEAD_PATTERN	0xdead
>> +
>> +/**
>> + * trigger_memory_pressure - Fill VRAM + 25% to force purgeable reclaim
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle (unused, kept for API compatibility)
>> + *
>> + * Allocates BOs in a temporary VM until VRAM is overcommitted,
>> + * forcing the kernel to purge DONTNEED-marked BOs.
>> + */
>> +static void trigger_memory_pressure(int fd, uint32_t vm) {
>> +	uint64_t vram_size, overpressure;
>> +	const uint64_t chunk = 8ull << 20; /* 8 MiB */
>> +	int max_objs, n = 0;
>> +	uint32_t *handles;
>> +	uint64_t total;
>> +	void *p;
>> +	uint32_t handle, temp_vm;
>> +
>> +	/* Use a separate VM so pressure BOs don't affect the test VM */
>> +	temp_vm = xe_vm_create(fd, 0, 0);
>> +
>> +	vram_size = xe_visible_vram_size(fd, 0);
>> +	/* Scale overpressure to 25% of VRAM, minimum 64MB */
>> +	overpressure = vram_size / 4;
>> +	if (overpressure < (64 << 20))
>> +		overpressure = 64 << 20;
>> +
>> +	max_objs = (vram_size + overpressure) / chunk + 1;
>> +	handles = malloc(max_objs * sizeof(*handles));
>> +	igt_assert(handles);
>> +
>> +	total = 0;
>> +	while (total < vram_size + overpressure && n < max_objs) {
>> +		handle = xe_bo_create(fd, temp_vm, chunk,
>> +				      vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +		handles[n++] = handle;
>> +		total += chunk;
>> +
>> +		p = xe_bo_map(fd, handle, chunk);
>> +		igt_assert(p != MAP_FAILED);
>> +
>> +		/* Fault in all pages so they actually consume VRAM */
>> +		memset(p, 0xCD, chunk);
>> +		munmap(p, chunk);
>> +	}
>> +
>> +	/* Allow shrinker time to process pressure */
>> +	usleep(100000);
>> +
>> +	for (int i = 0; i < n; i++)
>> +		gem_close(fd, handles[i]);
>> +
>> +	free(handles);
>> +
>> +	xe_vm_destroy(fd, temp_vm);
>> +}
>> +
>> +static jmp_buf jmp;
>> +
>> +__noreturn static void sigtrap(int sig) {
>> +	siglongjmp(jmp, sig);
>> +}
>> +
>> +/**
>> + * purgeable_mark_and_verify_purged - Mark DONTNEED, pressure, check
>> +purged
>> + * @fd: DRM file descriptor
>> + * @vm: VM handle
>> + * @addr: Virtual address of the BO
>> + * @size: Size of the BO
>> + *
>> + * Returns true if the BO was purged under memory pressure.
>> + */
>> +static bool purgeable_mark_and_verify_purged(int fd, uint32_t vm,
>> +uint64_t addr, size_t size) {
>> +	uint32_t retained;
>> +
>> +	/* Mark as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	if (retained != 1)
>> +		return false;
>> +
>> +	/* Trigger memory pressure */
>> +	trigger_memory_pressure(fd, vm);
>> +
>> +	/* Verify purged */
>> +	retained = xe_vm_madvise_purgeable(fd, vm, addr, size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	return retained == 0;
>> +}
>> +
>> +/**
>> + * purgeable_setup_simple_bo - Setup VM and bind a single BO
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bo: Output BO handle
>> + * @addr: Virtual address to bind at
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag
>> + *
>> + * Helper to create VM, BO, and bind it at the specified address.
>> + */
>> +static void purgeable_setup_simple_bo(int fd, uint32_t *vm, uint32_t *bo,
>> +				      uint64_t addr, size_t size, bool
>> use_scratch) {
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +
>> +	*vm = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*bo = xe_bo_create(fd, *vm, size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	xe_vm_bind_async(fd, *vm, 0, *bo, 0, addr, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC); }
>> +
>> +/**
>> + * purgeable_setup_batch_and_data - Setup VM with batch and data BOs
>> +for GPU exec
>> + * @fd: DRM file descriptor
>> + * @vm: Output VM handle
>> + * @bind_engine: Output bind engine handle
>> + * @batch_bo: Output batch BO handle
>> + * @data_bo: Output data BO handle
>> + * @batch: Output batch buffer pointer
>> + * @data: Output data buffer pointer
>> + * @batch_addr: Batch virtual address
>> + * @data_addr: Data virtual address
>> + * @batch_size: Batch buffer size
>> + * @data_size: Data buffer size
>> + *
>> + * Helper to create VM, bind engine, batch and data BOs, and bind them.
>> + */
>> +static void purgeable_setup_batch_and_data(int fd, uint32_t *vm,
>> +					   uint32_t *bind_engine,
>> +					   uint32_t *batch_bo,
>> +					   uint32_t *data_bo,
>> +					   uint32_t **batch,
>> +					   uint32_t **data,
>> +					   uint64_t batch_addr,
>> +					   uint64_t data_addr,
>> +					   size_t batch_size,
>> +					   size_t data_size)
>> +{
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = PURGEABLE_FENCE_VAL,
>> +	};
>> +	uint64_t vm_sync = 0;
>> +
>> +	*vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE,
>> 0);
>> +	*bind_engine = xe_bind_exec_queue_create(fd, *vm, 0);
>> +
>> +	/* Create and bind batch BO */
>> +	*batch_bo = xe_bo_create(fd, *vm, batch_size, vram_if_possible(fd,
>> 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	*batch = xe_bo_map(fd, *batch_bo, batch_size);
>> +
>> +	sync.addr = to_user_pointer(&vm_sync);
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *batch_bo, 0, batch_addr,
>> batch_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Create and bind data BO */
>> +	*data_bo = xe_bo_create(fd, *vm, data_size, vram_if_possible(fd, 0),
>> +
>> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	*data = xe_bo_map(fd, *data_bo, data_size);
>> +
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, *vm, *bind_engine, *data_bo, 0, data_addr,
>> data_size, &sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC); }
>> +
>> +/**
>> + * purgeable_setup_two_vms_shared_bo - Setup two VMs with one shared
>> BO
>> + * @fd: DRM file descriptor
>> + * @vm1: Output first VM handle
>> + * @vm2: Output second VM handle
>> + * @bo: Output shared BO handle
>> + * @addr1: Virtual address in VM1
>> + * @addr2: Virtual address in VM2
>> + * @size: Size of the BO
>> + * @use_scratch: Whether to use scratch page flag for VMs
>> + *
>> + * Helper to create two VMs and bind one shared BO in both VMs.
>> + * Returns mapped pointer to the BO.
>> + */
>> +static void *purgeable_setup_two_vms_shared_bo(int fd, uint32_t *vm1,
>> uint32_t *vm2,
>> +					       uint32_t *bo, uint64_t addr1,
>> +					       uint64_t addr2, size_t size,
>> +					       bool use_scratch)
>> +{
>> +	struct drm_xe_sync sync = {
>> +		.type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		.flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		.timeline_value = 1,
>> +	};
>> +	uint64_t sync_val = 0;
>> +	void *map;
>> +
>> +	/* Create two VMs */
>> +	*vm1 = xe_vm_create(fd, use_scratch ?
>> DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +	*vm2 = xe_vm_create(fd, use_scratch ?
>> +DRM_XE_VM_CREATE_FLAG_SCRATCH_PAGE : 0, 0);
>> +
>> +	/* Create shared BO */
>> +	*bo = xe_bo_create(fd, 0, size, vram_if_possible(fd, 0),
>> +
>> DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +
>> +	map = xe_bo_map(fd, *bo, size);
>> +	memset(map, 0xAB, size);
>> +
>> +	/* Bind BO in VM1 */
>> +	sync.addr = to_user_pointer(&sync_val);
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm1, 0, *bo, 0, addr1, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	/* Bind BO in VM2 */
>> +	sync_val = 0;
>> +	xe_vm_bind_async(fd, *vm2, 0, *bo, 0, addr2, size, &sync, 1);
>> +	xe_wait_ufence(fd, &sync_val, 1, 0, NSEC_PER_SEC);
>> +
>> +	return map;
>> +}
>> +
>> +/**
>> + * SUBTEST: dontneed-before-mmap
>> + * Description: Mark BO as DONTNEED before mmap, verify mmap fails or
>> +SIGBUS on access
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_mmap(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, false);
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
>> +
>> +	/*
>> +	 * Kernel may either fail the mmap or succeed but SIGBUS on access.
>> +	 * Both are valid — handle like gem_madvise.
>> +	 */
>> +	map = __gem_mmap__device_coherent(fd, bo, 0, bo_size,
>> PROT_READ | PROT_WRITE);
> Why the i915 mmap is used here we have xe_bo_map and xe call also and also please assert based on the condition like if it should not access but still its able to accessing
> then its issue you should assert here.
> as suggested before can you please split the each test into the each commits


Sure, I will make make separate patch for each test case.

>> +	if (!map) {
>> +		/* mmap failed on purged BO - acceptable behavior */
>> +		gem_close(fd, bo);
>> +		xe_vm_destroy(fd, vm);
>> +		return;
>> +	}
>> +
>> +	/* mmap succeeded - access must trigger SIGBUS */
>> +	{
>> +		sighandler_t old_sigsegv, old_sigbus;
>> +		char *ptr = (char *)map;
>> +		int sig;
>> +
>> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>> +		switch (sig) {
>> +		case SIGBUS:
>> +			break;
>> +		case 0:
>> +			*ptr = 0;
>> +			__attribute__ ((fallthrough));
>> +		default:
>> +			igt_assert_f(false,
>> +				     "Access to purged mmap should trigger
>> SIGBUS, got sig=%d\n",
>> +				     sig);
>> +			break;
>> +		}
>> +
>> +		signal(SIGBUS, old_sigbus);
>> +		signal(SIGSEGV, old_sigsegv);
>> +		munmap(map, bo_size);
>> +	}
>> +
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: dontneed-after-mmap
>> + * Description: Mark BO as DONTNEED after mmap, verify SIGBUS on
>> +accessing purged mapping
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_mmap(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm;
>> +	uint64_t addr = PURGEABLE_ADDR;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	void *map;
>> +
>> +	purgeable_setup_simple_bo(fd, &vm, &bo, addr, bo_size, true);
>> +
>> +	map = xe_bo_map(fd, bo, bo_size);
>> +	memset(map, 0xAB, bo_size);
>> +
>> +	if (!purgeable_mark_and_verify_purged(fd, vm, addr, bo_size))
>> +		igt_skip("Unable to induce purge on this platform/config");
>> +
> Where your access the bo here may flow here should be
> do mmap -> Induce the purge  -> then do the mmap -> then catch the signal


i915 is having  same pattern: mmap FIRST, then purge, then access the 
EXISTING mapping.
We will align the flow with that behavior.


Thanks,
Arvind

>> +	/* Access purged mapping - should trigger SIGBUS/SIGSEGV */
>> +	{
>> +		sighandler_t old_sigsegv, old_sigbus;
>> +		char *ptr = (char *)map;
>> +		int sig;
>> +
>> +		old_sigsegv = signal(SIGSEGV, (__sighandler_t)sigtrap);
>> +		old_sigbus = signal(SIGBUS, (__sighandler_t)sigtrap);
>> +
>> +		sig = sigsetjmp(jmp, SIGBUS | SIGSEGV);
>> +		if (sig == SIGBUS || sig == SIGSEGV) {
>> +			/* Expected - purged mapping access failed */
>> +		} else if (sig == 0) {
>> +			*ptr = 0;
>> +			igt_assert_f(false, "Access to purged mapping should
>> trigger signal\n");
>> +		} else {
>> +			igt_assert_f(false, "unexpected signal %d\n", sig);
>> +		}
>> +
>> +		signal(SIGBUS, old_sigbus);
>> +		signal(SIGSEGV, old_sigsegv);
>> +	}
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: dontneed-before-exec
>> + * Description: Mark BO as DONTNEED before GPU exec, verify GPU
>> +behavior with SCRATCH_PAGE
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_before_exec(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = PURGEABLE_ADDR;
>> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +	size_t data_size = PURGEABLE_BO_SIZE;
>> +	size_t batch_size = PURGEABLE_BO_SIZE;
>> +	struct drm_xe_sync sync[1] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = PURGEABLE_FENCE_VAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	int b, ret;
>> +
>> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>> &batch_bo,
>> +				       &bo, &batch, &data, batch_addr,
>> +				       data_addr, batch_size, data_size);
>> +
>> +	/* Prepare batch */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = PURGEABLE_DEAD_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	/* Phase 1: Purge data BO, batch BO still valid */
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>> +data_size));
>> +
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	vm_sync = 0;
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +
>> +	/*
>> +	 * VM has SCRATCH_PAGE — exec may succeed with the GPU write
>> +	 * landing on scratch instead of the purged data BO.
>> +	 */
>> +	ret = __xe_exec(fd, &exec);
>> +	if (ret == 0) {
>> +		int64_t timeout = NSEC_PER_SEC;
>> +
>> +		__xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL,
>> +				 exec_queue, &timeout);
>> +	}
>> +
>> +	/*
>> +	 * Don't purge the batch BO — GPU would fetch zeroed scratch
>> +	 * instructions and trigger an engine reset.
>> +	 */
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: dontneed-after-exec
>> + * Description: Mark BO as DONTNEED after GPU exec, verify memory
>> +becomes inaccessible
>> + * Test category: functionality test
>> + */
>> +static void test_dontneed_after_exec(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr = PURGEABLE_ADDR;
>> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +	size_t data_size = PURGEABLE_BO_SIZE;
>> +	size_t batch_size = PURGEABLE_BO_SIZE;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = PURGEABLE_FENCE_VAL },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 2,
>> +		.syncs = to_user_pointer(sync),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint32_t syncobj;
>> +	int b, ret;
>> +
>> +	purgeable_setup_batch_and_data(fd, &vm, &bind_engine,
>> &batch_bo,
>> +				       &bo, &batch, &data, batch_addr,
>> +				       data_addr, batch_size, data_size);
>> +	memset(data, 0, data_size);
>> +
>> +	syncobj = syncobj_create(fd, 0);
>> +
>> +	/* Prepare batch to write to data BO */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = 0xfeed0001;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	/* Use only syncobj for exec (not USER_FENCE) */
>> +	sync[1].handle = syncobj;
>> +	exec.num_syncs = 1;
>> +	exec.syncs = to_user_pointer(&sync[1]);
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
>> +	igt_assert_eq(data[0], 0xfeed0001);
>> +
>> +	igt_assert(purgeable_mark_and_verify_purged(fd, vm, data_addr,
>> +data_size));
>> +
>> +	/* Prepare second batch (different value) */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr;
>> +	batch[b++] = data_addr >> 32;
>> +	batch[b++] = 0xfeed0002;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	if (ret == 0) {
>> +		/* Exec succeeded, but wait may fail on purged BO (both
>> behaviors valid) */
>> +		syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL);
>> +	}
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	syncobj_destroy(fd, syncobj);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm);
>> +}
>> +
>> +/**
>> + * SUBTEST: per-vma-tracking
>> + * Description: One BO in two VMs becomes purgeable only when both
>> VMAs
>> +are DONTNEED
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_tracking(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t bo, vm1, vm2;
>> +	uint64_t addr1 = PURGEABLE_ADDR;
>> +	uint64_t addr2 = PURGEABLE_ADDR2;
>> +	size_t bo_size = PURGEABLE_BO_SIZE;
>> +	uint32_t retained;
>> +	void *map;
>> +
>> +	map = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +						addr1, addr2,
>> +						bo_size, false);
>> +
>> +	/* Mark VMA1 as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Verify BO NOT purgeable (VMA2 still WILLNEED) */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Mark both VMAs as DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, addr2, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure and verify BO was purged */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, addr1, bo_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	munmap(map, bo_size);
>> +	gem_close(fd, bo);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>> +/**
>> + * SUBTEST: per-vma-protection
>> + * Description: WILLNEED VMA protects BO from purging; both DONTNEED
>> +makes BO purgeable
>> + * Test category: functionality test
>> + */
>> +static void test_per_vma_protection(int fd, struct
>> +drm_xe_engine_class_instance *hwe) {
>> +	uint32_t vm1, vm2, exec_queue, bo, batch_bo, bind_engine;
>> +	uint64_t data_addr1 = PURGEABLE_ADDR;
>> +	uint64_t data_addr2 = PURGEABLE_ADDR2;
>> +	uint64_t batch_addr = PURGEABLE_BATCH_ADDR;
>> +	size_t data_size = PURGEABLE_BO_SIZE;
>> +	size_t batch_size = PURGEABLE_BO_SIZE;
>> +	struct drm_xe_sync sync[2] = {
>> +		{ .type = DRM_XE_SYNC_TYPE_USER_FENCE,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL,
>> +		  .timeline_value = PURGEABLE_FENCE_VAL },
>> +		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ,
>> +		  .flags = DRM_XE_SYNC_FLAG_SIGNAL },
>> +	};
>> +	struct drm_xe_exec exec = {
>> +		.num_batch_buffer = 1,
>> +		.num_syncs = 1,
>> +		.syncs = to_user_pointer(&sync[1]),
>> +	};
>> +	uint32_t *data, *batch;
>> +	uint64_t vm_sync = 0;
>> +	uint32_t retained, syncobj;
>> +	int b, ret;
>> +
>> +	/* Create two VMs and bind shared data BO */
>> +	data = purgeable_setup_two_vms_shared_bo(fd, &vm1, &vm2, &bo,
>> +						 data_addr1, data_addr2,
>> +						 data_size, true);
>> +	memset(data, 0, data_size);
>> +	bind_engine = xe_bind_exec_queue_create(fd, vm2, 0);
>> +
>> +	/* Create and bind batch BO in VM2 */
>> +	batch_bo = xe_bo_create(fd, vm2, batch_size, vram_if_possible(fd, 0),
>> +
>> 	DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>> +	batch = xe_bo_map(fd, batch_bo, batch_size);
>> +
>> +	sync[0].addr = to_user_pointer(&vm_sync);
>> +	vm_sync = 0;
>> +	xe_vm_bind_async(fd, vm2, bind_engine, batch_bo, 0, batch_addr,
>> batch_size, sync, 1);
>> +	xe_wait_ufence(fd, &vm_sync, PURGEABLE_FENCE_VAL, 0,
>> NSEC_PER_SEC);
>> +
>> +	/* Mark VMA1 as DONTNEED, VMA2 stays WILLNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm1, data_addr1, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should survive (VMA2 protects) */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* GPU workload - should succeed */
>> +	b = 0;
>> +	batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> +	batch[b++] = data_addr2;
>> +	batch[b++] = data_addr2 >> 32;
>> +	batch[b++] = PURGEABLE_TEST_PATTERN;
>> +	batch[b++] = MI_BATCH_BUFFER_END;
>> +
>> +	syncobj = syncobj_create(fd, 0);
>> +	sync[1].handle = syncobj;
>> +	exec_queue = xe_exec_queue_create(fd, vm2, hwe, 0);
>> +	exec.exec_queue_id = exec_queue;
>> +	exec.address = batch_addr;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	igt_assert_eq(ret, 0);
>> +	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
>> +
>> +	munmap(data, data_size);
>> +	data = xe_bo_map(fd, bo, data_size);
>> +	igt_assert_eq(data[0], PURGEABLE_TEST_PATTERN);
>> +
>> +	/* Mark both VMAs DONTNEED */
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_DONTNEED);
>> +	igt_assert_eq(retained, 1);
>> +
>> +	/* Trigger pressure - BO should be purged */
>> +	trigger_memory_pressure(fd, vm1);
>> +
>> +	retained = xe_vm_madvise_purgeable(fd, vm2, data_addr2, data_size,
>> +
>> DRM_XE_VMA_PURGEABLE_STATE_WILLNEED);
>> +	igt_assert_eq(retained, 0);
>> +
>> +	/* GPU workload - should fail or succeed with NULL rebind */
>> +	batch[3] = PURGEABLE_DEAD_PATTERN;
>> +
>> +	ret = __xe_exec(fd, &exec);
>> +	/* Exec on purged BO — may succeed (scratch rebind) or fail, both OK
>> +*/
>> +
>> +	munmap(data, data_size);
>> +	munmap(batch, batch_size);
>> +	gem_close(fd, bo);
>> +	gem_close(fd, batch_bo);
>> +	syncobj_destroy(fd, syncobj);
>> +	xe_exec_queue_destroy(fd, bind_engine);
>> +	xe_exec_queue_destroy(fd, exec_queue);
>> +	xe_vm_destroy(fd, vm1);
>> +	xe_vm_destroy(fd, vm2);
>> +}
>> +
>> +int igt_main()
>> +{
>> +	struct drm_xe_engine_class_instance *hwe;
>> +	int fd;
>> +
>> +	igt_fixture() {
>> +		fd = drm_open_driver(DRIVER_XE);
>> +		xe_device_get(fd);
>> +	}
>> +
>> +	igt_subtest("dontneed-before-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_mmap(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("dontneed-after-mmap")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_mmap(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("dontneed-before-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_before_exec(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("dontneed-after-exec")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_dontneed_after_exec(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("per-vma-tracking")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_tracking(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_subtest("per-vma-protection")
>> +		xe_for_each_engine(fd, hwe) {
>> +			test_per_vma_protection(fd, hwe);
>> +			break;
>> +		}
>> +
>> +	igt_fixture() {
>> +		xe_device_put(fd);
>> +		drm_close_driver(fd);
>> +	}
>> +}
>> diff --git a/tests/meson.build b/tests/meson.build index
>> 0ad728b87..9d41d7de6 100644
>> --- a/tests/meson.build
>> +++ b/tests/meson.build
>> @@ -313,6 +313,7 @@ intel_xe_progs = [
>>   	'xe_huc_copy',
>>   	'xe_intel_bb',
>>   	'xe_live_ktest',
>> +	'xe_madvise',
>>   	'xe_media_fill',
>>   	'xe_mmap',
>>           'xe_module_load',
>> --
>> 2.43.0
