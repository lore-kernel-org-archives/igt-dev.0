Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79225C02198
	for <igt-dev@archiver.kernel.org>; Tue, 18 Feb 2025 07:14:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E88110E2A1;
	Tue, 18 Feb 2025 07:14:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H/mY2bcf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37EBD10E2A1
 for <igt-dev@lists.freedesktop.org>; Tue, 18 Feb 2025 07:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739862864; x=1771398864;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=SMQ8GYGbGp/R1JlgH+D82irpNQKOtytxQIIGr7I/EHk=;
 b=H/mY2bcfjzZQh6mRdJAi8ay+mc4beDAx4UwKHKaEb6ulRbt40P1e2QBK
 41GtcZeg+sPOKDJ3nnOgFHhiX+Kt55QEaqkdzOyfS69GBe/gjkw7zGNqa
 T3Wa11ay6Jagntwu5sZ6Z1fv0DPfM0dLfDHDbWkhb+5jcRNz10v/xIgQ4
 aeS1cu65qdgyEObysYhEY7zHBXI5e+4DEEfec9qrLa+W+bM2bWFtRhZKD
 2iYNd1l1+1kNV0TdEllZ4yeTD4boyc5HdN5ro8kCtk1tN3vIxJje304yK
 jMy9Zrhv+6JoPYezmfF+K0AyCbhlkmA9X4gP9K9qc/I68C5gFze55zowl w==;
X-CSE-ConnectionGUID: 72OdXDjJRtGlntDyT4dGWQ==
X-CSE-MsgGUID: 6Ur5uovSRFCY/FMfuT8Kaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="39781424"
X-IronPort-AV: E=Sophos;i="6.13,295,1732608000"; d="scan'208";a="39781424"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2025 23:14:23 -0800
X-CSE-ConnectionGUID: BbM8tIACRISaYP/7kUEuxA==
X-CSE-MsgGUID: PFgtxdtJTxatECycjIUBqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145221335"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Feb 2025 23:14:19 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Feb 2025 23:14:17 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Feb 2025 23:14:17 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Feb 2025 23:14:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zDQ2y80yaz/piBykjiaU/xfzr/bJxR4d7bI4IzqQe4tafo90+WRvHyKk29T3dlnlPKhbllmi3QBAluFYUz7QqpHLuV+8aTAUSZtbAhZgS6qyqvR9d9BRMnKyKoWJ6aOwHqAczo4xP8DzNr5maVIBk8OdBeKNgnl2+Lu9jO7kYOP/EbwTb6wsdX9LZ9DTFkgfK8rrRZ/3aRsy4Q3fg4C4UEXuOiig2nR83rPfcXFQuy64313aJj5POvYXAC7w6F7KilQHN4HxAhKLkyjl0DwMUjmOldTLU/dxgSg1AuH6ZT4y6aIS3/aG97DOz4ynm15ROI7tAN2gXCAXEAU4I31hQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMIhdRsTApUxWVyUe/VFe5nQDsSw1yAZ6dMYSgRQf4A=;
 b=R8POq84P239fdbYehDJX6qbWXXq/GY9GY6VO73gY0Wz6lctmCsf/jvmYiaT4NtLFmdN5ELHSGv+HWLG8JFcG1LCi3VRP9d5eIT81HnEb3jAGGKBVphozac4nYGPHxVBJlCGNdKlOTYyvEwHRPLhxWST76FanC8VQ66PWk7Xnt9Bp6u1zgHiHAh3PXgCwL0SuLKVJgyjNBUXT97RIt9VFpEZM6E7/VFBXDTBzBlfxNqB6fUZ1N0R2EP1tZW4n+hYM5/S9i8+V40PnaF7oAD4UrAlp1xjrkPthBsvnkuwu9g355gFc+Pd/C28g6JPFaWacY/JcmUtrDx1up4VEqisTEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by MW4PR11MB7162.namprd11.prod.outlook.com (2603:10b6:303:212::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Tue, 18 Feb
 2025 07:14:01 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 07:14:01 +0000
Message-ID: <8bea967b-722e-4042-8033-5cf80e4fa54f@intel.com>
Date: Tue, 18 Feb 2025 12:43:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/i915_fb_tiling: convert to subtest
 basic-x-tiling
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250217173149.157360-1-kamil.konieczny@linux.intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250217173149.157360-1-kamil.konieczny@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0156.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::26) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|MW4PR11MB7162:EE_
X-MS-Office365-Filtering-Correlation-Id: 14d501c1-eaee-43c8-84fa-08dd4febd1b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cEZGRkpmdkRDUkl1ZlVhZ3ljRE9pZ0krSk82dVpiSGlLL1g3dHArMk1OVVJH?=
 =?utf-8?B?aUxweGpDYWY2SWJ0eDJMSEEwWlhqWWZ3b3U5dm5KMDVLbC9UZGNqR3I5OUJO?=
 =?utf-8?B?c1RHWGYvM2FQQ2lGV3JleW53NWtmV1pXeno2WXhJbWxPUzBPZDFQekRsVFV0?=
 =?utf-8?B?L254cFQ3MnZEYkQzcEdsUCtrWEZKOVcwb3lpK1ljYmtIeW1WbUR1SDFqeE5V?=
 =?utf-8?B?M1pCY0dIbXY2dHkvODBnQTY0dWplQjkraFRBSmNGZUV5c3BkcmFvTzJXLzlC?=
 =?utf-8?B?TTM5YkIzZXRoK2g5bUp4TkdDcWVKK0VyYzZRVlRmNk9PRFJ1MEQrTVpQNXAx?=
 =?utf-8?B?SUxPMzQrUm9YNGFURUVhZEpLOUZ2dWxVQUxpVHBQZmhpeStiSWRpa2RReXUv?=
 =?utf-8?B?ZkM0WEQxZDkyTGwxUGNZTm56WDdxdC9Obnl3RjNRSFZFU3RJVXZ1Z3BVejA5?=
 =?utf-8?B?Y1ZlZk9lTVdiNjBjbldYM0drclFpUENKVFJxaFlxaVFZMlpFMnZqTk0zeDBI?=
 =?utf-8?B?SmxGTWY1OTBMcXJEeWVRb0RGMytSQjh4TWpCejZHYnliUFFTRC8wY0JaMFJQ?=
 =?utf-8?B?VjlFLytHOEQxdWMwLy9WWUtyWEFzK3FWRmp6V1F0d0xGZFJnYW9tSU5naTky?=
 =?utf-8?B?TGRnT2xmemdWKzlIdDRNdytaUkx1RG0wYUNST1BCaGhMSHJTVUpLSjJBTXE0?=
 =?utf-8?B?MEhIVUtIc2sxTndIOHBtMDJsY0RnK1kxbkVXUXJQMnFYMjlMUFVTYVI2blQ1?=
 =?utf-8?B?clBLNm12M2ExOVd2RzNnN1UzNWU4UWZraVJRa0J4NXNaVHJTWGgvMW1oOFc0?=
 =?utf-8?B?ZWJzNXRxUmVyanVLS3pJWnpXUG52Z3hYMzBGS1hBWXBtcXoxWG9xajhpL2xM?=
 =?utf-8?B?aHFNRkNjeUxuUUd3aVVHYysybGZsOHVNWFNRQ1R1NVY5YUp4NVgzemdKY2hv?=
 =?utf-8?B?NmVlazdaVE9URWx2N3dBd1ozWVJpckRPT1o3YW12OTlmaWVvR01DTXVTZ3BV?=
 =?utf-8?B?Y0VsbEFXcEZFY3h0YWRLSDAwVC8zdHlyNmFCNHNzV0JNZGpsQUhPNHlDVXQ1?=
 =?utf-8?B?UE1jZHp3cXZFcHIxUTNndEFzNlRhU0RqdmRiODdaVlhadVpST1JWc0lUMGE5?=
 =?utf-8?B?OUxQY3V4MVdEWERpbmZrREtRUys5T1QvRVlkMFI2VEtGNnlTQmd6UGxxcmtC?=
 =?utf-8?B?REx3YVVYUG96R2doc3JiYzhzZmNKemZtTFVmSlJwanRuUjc4QXJlaE1XT1NL?=
 =?utf-8?B?VjRtdXcvMDdvaTdhalV1Tk54ZEt6VHN3Z0d4L09EUFp5MzZNdnhrNWQrY2o3?=
 =?utf-8?B?RTZPdktha2pZNStnRXF1cWFYNXBpVUNhY3F2L1VDdk0vRCtjMVNaWTlSelVB?=
 =?utf-8?B?S2tkSmluNWxGMnJ6WGNLWXJoS29peE1ickxySTE2VWlDcko1MXpST2pScThL?=
 =?utf-8?B?Skp6UW1tSW94T1ZGMENhaUtzZHBuNUpuR01YVjVWK1dxeWdtTVhwN2dWcU1D?=
 =?utf-8?B?UWlhRzZZWkJHOCtacm1ydmMxYi9HYjNZbkRCT04yUkV3MHRZVndMM1F5cDVs?=
 =?utf-8?B?bjlpeDJBZ3pzWG5LNHhzNWlrd2svUHdrWnRZUDdJeHFOQkZmQnpkNEk0dE5P?=
 =?utf-8?B?MUFYUFE2OU0zMWFRTy9RZkkydjdtNVVZbVhFd1VFWEs2T3hpSjdKMkpqMVlG?=
 =?utf-8?B?V3NEbUxhV0NhcnJIT1BaczYvOWd3R1VFeU9TeStvWmNXa2xDb1NqQUpYclJm?=
 =?utf-8?B?OG44KzBjS0drRW9VYVllTlRvTitPZW00T2ppZXZ4czZ5aUlNcFcwWXBEay8x?=
 =?utf-8?B?SENtQ0gvclpNaXd5ek9zazM1amQ4aktFRXZyV0kxTjJ2dERyUUU1YWxYbnZE?=
 =?utf-8?Q?RqB8xSWf3LUXH?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WC9tajhpai8yd2wwL0tzeGNVclBvTjhoQzFlZkhJQ05OaE5RWS9BL0VKMVg4?=
 =?utf-8?B?elRCWXc4REpBS1Y5UWZnNWxTWlVvclEzWnIrNjJMdG05SFVQaDdvUTNabzRU?=
 =?utf-8?B?TVdjMFJtZ0pMZUVJZGtCNG5kb0JlbmdBcXJXdzFsdkZLcFFKZlFVUjcraW5i?=
 =?utf-8?B?NGZyeFN5bTU0aDV5cHd4Z0F3QlZXTllDMEZWSWJJWmtHeFlTRWRwRU1IUWti?=
 =?utf-8?B?TU8yVFVYYUxFM1dmLzlGNjA3dFI0UkpWQ0pWQUo5Vk1XVjdsaXNnaFBRMmlV?=
 =?utf-8?B?bFZTQUYzNXQvbU1peElUbmxtdlY3MVhtbGFGTjFKZkl5Z0NnLzhOQ3R3QW10?=
 =?utf-8?B?REt1bHNoeXAvOE5Jdjk3SEhDOWRFYzB5d2JDbE9LYjVUT3o4MDhoTzVRYmE4?=
 =?utf-8?B?aE9wZVJPb3o3YncyNExQbk1qYXRFekhXTVlFMDltcHhLTVZpZVJhbFJUQ1Fr?=
 =?utf-8?B?TVBLYlQ4N0Nubm4zcUtSV1JjUDZoZmJPSHZ2L2I1NWJHSkt5MTVmTDlVSVRu?=
 =?utf-8?B?VElSRmJSakdjb1JGbC96akhPNENieTQvU21PWFJ4SXp6Z3U3clFnQUorV0g2?=
 =?utf-8?B?R1VCTWZxSHFxNWc2R09jOUcyaVM2a3hoUVZha2xqU3c1d3hhdUxVTjJJVk02?=
 =?utf-8?B?ZThzVS9LQnVzWjYzdzhnMTQxTjB2Y3Z5VGpCMjE2YlVneUlIcEt3cVVZaWI3?=
 =?utf-8?B?VndNWDZwT0I0VFFHOXZYUFg2b1g3eEVzdVlvOS9rNXlGZjR0bDVaL0NpaXNw?=
 =?utf-8?B?cy9nc2Q2bmRqZ05QTnpqVTVCcmZBM1EvRFplUUxSUWIxK3NoWUxWU0k0ZXFB?=
 =?utf-8?B?cENrTHoyUy8zUnloN2tvRGk3b0Zxd2ZvY0VncjJZU1FkdkxmSzhDR0ZFUUhI?=
 =?utf-8?B?OEhoQ2tqUmVRMk1xZGRpQ3hEL1NBME95TlRuejl6VDZ0blRSYU9KNUNGeWRy?=
 =?utf-8?B?VThRZTNUbFdKQUI2UVJWVnVOS3JWYzlrakI2d09SMnRiVm1XdzgvT3BzZ0M3?=
 =?utf-8?B?bjVFdHhjR1lQMXkrSVEvNWZxOHdGaGNuY3RNN0diWFJzblRWZURHSm5tVkNl?=
 =?utf-8?B?OFVmaUE5RTNTZE1IWWM0MEt6MkdxSjRpbEtaRnhEYlpYbVQ4UHFVVDNQVHFF?=
 =?utf-8?B?UEl1U3VXN3RwZHpheCtKeHhFY3EzWmVHamtTV01EWTl5azc5VHdnZ1hDWEJa?=
 =?utf-8?B?cGUrRmp6RUJiYVJUS0l2dnNNMkc4VUluL3JTZXh5aWNlRno1Y0JoN1poOHg0?=
 =?utf-8?B?SEg0aC9CQUtnb3g4cVdCM0J2OUR5YVN6ZG1ZaHk1U25xVVIyVWxVRmpKVWxO?=
 =?utf-8?B?UEMydnhHQ3NTUW5wbC9ZSVIwalNLd09qeFVHc25lNExicFhrWEZuRzFpVkRW?=
 =?utf-8?B?OE9jdEJHMVpmVUh3L0ZqMDdBOTJMWmo3cEpPRU1TUjVFMUdEUTFCSmVBZW1S?=
 =?utf-8?B?Qmk5ZDhuYm1JaFdlRExGQzZnY1pBNUF3MGFKU3dIY09La01ZM3k3TnE5RG1R?=
 =?utf-8?B?Y29idGhNOWtnTmhLclRsdWxYR2lLRDV5bDZFb054Q1VlUkoyZlhTazAwNGVi?=
 =?utf-8?B?dzlBSHRON3pjL2QxWFB6RE8waGt2TEdMZFY3UTRKSVpSU0pMNWhtcU91TDNC?=
 =?utf-8?B?b3BDTndIa0svL05vMUU4VnFMVjJNUjMxVEZQMVpwWHkrc1ZqRGl6ZWd3MzJr?=
 =?utf-8?B?dVUwMXVrYVRUWldvclVOdVp1cmkwL211UlMyYXZsRXU2MlZXeFBRTFZxRzd5?=
 =?utf-8?B?eDdjdHRjenZFZ1l3MzkvQ2FSSWZHQ2xNOUhHcVhPSUpELy9uNnY2bm9zUm50?=
 =?utf-8?B?VzVvaFFHVnlheDdPbzFVb05nKytuMUFTbE1RWW9DUzYrUVF2ZVRZRDI2bk12?=
 =?utf-8?B?Y2xWTitQYllUMXZCVnhIcFB3UWp4ME5OQXlQdG5ia0p3RjVMOEw1aDBpaXFs?=
 =?utf-8?B?OEJwZHpCL1paYmlDVFM5aVlZWFVyRXhMYkxuS2l6R1M0ZGNGdkdkdVY5bmhu?=
 =?utf-8?B?NE5IQ09BUFVlM1UyMW9abWprU3N6MHI4YmorM0dyMlQrZklib2dEYWRyOVFM?=
 =?utf-8?B?ejFxWjVFN1ppMjNHa3RydW9vOGttU0dnOHF4SERKdGMzRS8wOEIxdWVOY1ZZ?=
 =?utf-8?B?aWwzcjQ4R2JIdyt2K2h6L3VwaUQyREY5bXVkeEVhbmhWakJ3N2YwNkUzZG0x?=
 =?utf-8?B?K3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14d501c1-eaee-43c8-84fa-08dd4febd1b0
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 07:14:01.3471 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: upBIDg4XqUy/oWmE1bg1kd1pPk6zXPtf+J5mrVMwJpX9US8plkwHkeVZjmEIlU0ctkaUM3JD6nMhsDknf+sGHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7162
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

Hi Kamil,

Patch LGTM
Reviewed-by: Swati Sharma <swati2.sharma@intel.com>

On 17-02-2025 11:01 pm, Kamil Konieczny wrote:
> Refactor test and create one subtest basic-x-tiling.
> It should improve debugs logs in case of fails or skips,
> also it shows which format is used for testing.
>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>   tests/intel/i915_fb_tiling.c | 36 +++++++++++++++++++++++-------------
>   1 file changed, 23 insertions(+), 13 deletions(-)
>
> diff --git a/tests/intel/i915_fb_tiling.c b/tests/intel/i915_fb_tiling.c
> index 849e37164..8d95416f7 100644
> --- a/tests/intel/i915_fb_tiling.c
> +++ b/tests/intel/i915_fb_tiling.c
> @@ -32,28 +32,38 @@
>    * Functionality: object tiling
>    * Feature: mapping
>    *
> - * SUBTEST:
> + * SUBTEST: basic-x-tiling
>    */
>   
>   IGT_TEST_DESCRIPTION("Object tiling must be fixed after framebuffer creation.");
>   
> -igt_simple_main
> +igt_main
>   {
> -	int drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +	int drm_fd;
>   	struct igt_fb fb;
> -	int ret;
>   
> -	igt_require(gem_available_fences(drm_fd) > 0);
> +	igt_fixture {
> +		drm_fd = drm_open_driver_master(DRIVER_INTEL);
> +		igt_require(gem_available_fences(drm_fd) > 0);
> +	}
>   
> -	igt_create_fb(drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
> -		      I915_FORMAT_MOD_X_TILED, &fb);
> +	igt_subtest("basic-x-tiling") {
> +		int ret, ret2;
>   
> -	ret = __gem_set_tiling(drm_fd, fb.gem_handle, I915_TILING_X, fb.strides[0]);
> -	igt_assert_eq(ret, 0);
> +		igt_create_fb(drm_fd, 512, 512, DRM_FORMAT_XRGB8888,
> +			      I915_FORMAT_MOD_X_TILED, &fb);
>   
> -	ret = __gem_set_tiling(drm_fd, fb.gem_handle, I915_TILING_NONE, fb.strides[0]);
> -	igt_assert_eq(ret, -EBUSY);
> +		ret = __gem_set_tiling(drm_fd, fb.gem_handle, I915_TILING_X, fb.strides[0]);
>   
> -	igt_remove_fb(drm_fd, &fb);
> -	drm_close_driver(drm_fd);
> +		if (!ret)
> +			ret2 = __gem_set_tiling(drm_fd, fb.gem_handle, I915_TILING_NONE, fb.strides[0]);
> +
> +		igt_remove_fb(drm_fd, &fb);
> +
> +		igt_assert_eq(ret, 0);
> +		igt_assert_eq(ret2, -EBUSY);
> +	}
> +
> +	igt_fixture
> +		drm_close_driver(drm_fd);
>   }

