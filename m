Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 503FDC282EC
	for <igt-dev@archiver.kernel.org>; Mon, 17 Mar 2025 09:42:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA7710E3BA;
	Mon, 17 Mar 2025 09:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="daIrb1XQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035C310E3BA
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Mar 2025 09:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742204529; x=1773740529;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=s8TcBthbbOqNubGrAKk+p1nInu2GyP69B29vjBsoIIc=;
 b=daIrb1XQGHHkkxhjnCNDXJWga31jn1M7sRqbguDN1KU3hylPzxqsifg0
 KEDYb8ntIm1eXe3GHuhZIMm/NaMIgnVYq1RiFqxU1dNAthJp5ZY0P+Ad/
 33hzJvqNLTZBWeKaWKWoAAjpp/w+rTS8FhYXmJ+BbXMXv/q4gGhj1mCDd
 EYzj8m/htsOVqfSb1WYU1ppBi5kfmImGSZU3wSuMxoxbheLQOFkzdUUtS
 H3h6yj2hk5Jb0Fa9Bjzg5LmwBkDtCbf9PWWGwlgxqqmEawcv1NG5zH72O
 1UY5YnEl5XndNcMCMN71zd805hQQbLoq5wuWq0YSXnjK2T2Lc+J9RS9eC Q==;
X-CSE-ConnectionGUID: vwsVNyxjRtO0nOnlER+Ebw==
X-CSE-MsgGUID: nQvmPo8pQiSo0SzLIjApiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11375"; a="43199702"
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="43199702"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2025 02:42:08 -0700
X-CSE-ConnectionGUID: T8A45EtTTfCb4bXrobky/g==
X-CSE-MsgGUID: Z29wEyvFTn+mp3E1UwI1jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,253,1736841600"; d="scan'208";a="152864470"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Mar 2025 02:42:08 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 17 Mar 2025 02:42:07 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 17 Mar 2025 02:42:07 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 17 Mar 2025 02:42:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ticiQd8Tr0noxTrMiugd3SCeiI7D14P26jW8kGbyEQ3PScuP8caOZbQZG0/7IgeW6SJCQ1uOIkXjTjqREs621/5wfl/aA4PP5xiV4V7X7LMbzL8UrgFFxZMTFcTmo9SW1kc2rw1zz/aRXYXLCSbq1huHe0r5MsMr5D3Lm+NQirr5dZ+RJLOhyoHdT83tGZyactd0hzxCgoNluRpftXp77Bc4/nJj+CRG8knL67bJsfj85zUHB/oqmfUfh32vCSmzOsu9UjcHPJYQb7KncU9aBOPU5fbYv09cRf5bQRs5zJj5MGi3DMuhOzoAmOBlL8HyqLIJEeIJ37qpgciB8dCiqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXVLCcUCZFfLnpc2T8tGyzPSEQzyz4o46XZ45PKoIX4=;
 b=G2GCIh8YjUGg6eW0QOwYwLiw2JVKSv4U9RwhwcRHnQMO69984HkAK4RIys6rKY/ynTEXV1u84cKcaptf2DSsOvsQO8MNMGAYDIoYv+BVWjCj3JElhwmoyzN1Yr8G3EJJlCx/bsazivuiDfFsQ5aSB4Sa5I3UEulToCsrt1KKka9PFNe6W/IkSmb5SVCeEjBpp7poNvM/ABbQwpQiXdjWEKnR3UBluEIbxT2YPAsda8vVZYOvBPvlvMK+jznA59X7DrbOIW55Dl0RcIp18MQ3yeQd+xowZu9m7x7fW5mMBVMnfpixz3N0TUvLch/anWCDxV+GeLMpRiWJx7SpNDnciA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH7PR11MB7549.namprd11.prod.outlook.com (2603:10b6:510:27b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Mon, 17 Mar
 2025 09:42:03 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 09:42:03 +0000
Message-ID: <9bb07aba-6bc1-4026-b214-99b178090263@intel.com>
Date: Mon, 17 Mar 2025 15:11:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH <i-g-t> v1 1/2] Add support for xe in runtime pm
To: Soham Purkait <soham.purkait@intel.com>, <igt-dev@lists.freedesktop.org>, 
 <vinay.belgaumkar@intel.com>
CC: <anshuman.gupta@intel.com>, <lucas.demarchi@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250317082823.1631744-1-soham.purkait@intel.com>
 <20250317082823.1631744-2-soham.purkait@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250317082823.1631744-2-soham.purkait@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH7PR11MB7549:EE_
X-MS-Office365-Filtering-Correlation-Id: 53d92929-9e0c-4c8f-bd39-08dd6537f8bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnZ1ZUIzTEpnTjJyVHJKSnNObHU2V0YrZSthc1JzbFAyVjRwcFlmcXF3dEtB?=
 =?utf-8?B?enVOUWVKZWN5YUozMTV4T0ZCNXQyZUFPY2M3VzZFZTlKcCtSSk15SWVzOHI3?=
 =?utf-8?B?b1FWTUdEbHhIaTZLVmRiYStNYlZHV2hkejBvVkdtUFF3blVVYkY0MzZNeWN0?=
 =?utf-8?B?WVdHWVN1V1N2U3lydzJkNnFLSVZQNHlYdUlvdGpXUEtmVmFBYkxwZXREV2Uz?=
 =?utf-8?B?eTR4ZWpCcGZEMlNHZnpyNzcrRE13eWZIQ1IxTnF0blpqU01CdDl4RWYvcDM4?=
 =?utf-8?B?bzhyR25CenFxcXE3MnVBSy9YR2lucDVPN1FqR0NtN3lsNmJqdGEwaisyU3NL?=
 =?utf-8?B?bHdjS2xBOE82emZXQVFzYStOQlVndjI3WDRGWFBUOTljcWJuMXY1Qm9LYWhw?=
 =?utf-8?B?MVRORkdBL25QbnpmbXM0dWsyNFVyWEFhdGdMK1RZcGVKQnhEM01lSTFUYndP?=
 =?utf-8?B?VmFKT094b0RpNWhEUDQ4UTFuT1ZldTc5Z3N1MSt5bE4rRVpRRGdzZWtSbm1Y?=
 =?utf-8?B?cUtBZGY2d0hNV3h5cEFiOCthaCtya0d2dVJjams3OTBiV3d0MFlGREpOb0lY?=
 =?utf-8?B?elRDem5kc2d2Q3gyblRlOFU2MTBsNjlsb1hYdklRakhCUFNxclNtT1FJcHA1?=
 =?utf-8?B?ZW1yVlNxU2todnd5RU81UkMzeGtxZWNQNzd0cVZJMlltM3BBUmlQdjUvMVBN?=
 =?utf-8?B?WGNSK1MwWUVZREduNVZOTWJrUGtTK0Rqcm5ScUx1ZldYMHYvOVhqUnFYRWdU?=
 =?utf-8?B?elQ1UVlmNzhHalVxb0ZTQWlzUjd6NC92RGxZRURUQ00yZXA1dC9Sc0hmSEkv?=
 =?utf-8?B?ODhiMWorQUFpRXNvUVRaNE9BZGdLN20zR0x2R3JGSFNQY016Sy94MVpxNGhm?=
 =?utf-8?B?anllVk9hWlVVcGVKSk5ETHdkeWNna0JrM2xKRUdBbTZja2hCeEMvcml4QU9i?=
 =?utf-8?B?TTlZcjZPSTE4SVlyWlh2UGo3SWhWRFlheE1YRkljWmswQ1VYYkI3YlRKZFJy?=
 =?utf-8?B?YVRlbFVkemRBWTZ3ckZWM1RKSTNqeG9uZGt3eDhaMVppem5oR1BkZWZtSWxJ?=
 =?utf-8?B?dERRK08rZTN1a28wYnVhVnZhZ0drVVdtcmpZRm1HV3FHcmh6MzNzWE9kOGpi?=
 =?utf-8?B?czBWNlk3MDlyMDk2WGxHT3ZVcC9aOWhETUZ2Um84ejYwai9NLzQ0MVowOUtV?=
 =?utf-8?B?WW83Qmw2SXMyQTBudE5EMkZZWHZ0b1FnVHI5Wmp0Z0RFaVBYMXYvLzJJaEtN?=
 =?utf-8?B?djdpd2cyTi9KN3prZVoxT1AxbUROSU1MRXdlcUxPalhvVEdkQytwOWFZS1Jz?=
 =?utf-8?B?cUJvUzFhL3NZdEdWVkpQQm1aUUV6bDNoZnhMYW1UalNFRTJoZmwrNmxwanFl?=
 =?utf-8?B?TGQzVWZ2YXdpR1EyTEM2UkFTcStwVG5RUmRxbjBXYlF3RXgrWFZiSi9pUEoz?=
 =?utf-8?B?WUtaalZodzFOS3hKU1VQdG1hd1kvNmFqeFk5Q1lMbkNOQkFMa3NVV3RtSFhH?=
 =?utf-8?B?bjZ3dmxWQVdmbjluR2toUzFDTm96eUhyM0d3K3ZkQWR0SFBzaVkzRENDdWNX?=
 =?utf-8?B?Vm5vTGVzcWtYMlNsMzVtU3VFSHNybW1lTUdpamRRclJVbGtOeExxQU9PMVQx?=
 =?utf-8?B?RE5NOFdLNitGcVVnMTVweGpIeHdBRXREMGJRTlIyN0d4bVA5SGQxa0FhaENK?=
 =?utf-8?B?WDlPMFdndXZSUVNXbW9IR3g1Wm5WRG82dFdMUDdRbUx4VUVlRDM4M1A3ODBD?=
 =?utf-8?B?UmlVTE1tV3pEbWtYdldtaEw0cFd3TzF0MW5xbXNxSjNUMlo1c0NHVDhOQy90?=
 =?utf-8?B?eEpVdUJWR1RURUNFbm5xdTI1eG1nbFYwVzIvbGxmSDJWYWZXNis0cjBTWXBY?=
 =?utf-8?Q?Zb2INPzLXINzj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STVGQUtibENKSE50NTRya1lVOU5HZUdFNnc0YnI1SVk1NllYR01VdWYveWNL?=
 =?utf-8?B?elczeXZoQWcxRXdCSzZhcHNNWnlMcVFSVFFEZHlKQWRqYmZydUQrdTRLblhp?=
 =?utf-8?B?bm56QUhqM0ZzY3M5MDVQUlJLMUE4QlJaem1zN3VISDBiRUlFSmU5Y2ZGdldE?=
 =?utf-8?B?TUloOHM2ZUFLMEFBdVBuUC9odkl3L0pWV1VmVUxrZVFWblRyRGRjdW8zVzFu?=
 =?utf-8?B?QVZFcmpQenR5WThFZkdhbDQxK3oyU2xaSmhBSDlXVXh1bFFsYlJ2ME5hb0Rx?=
 =?utf-8?B?N0RNWkh6aklIekZkMVhkY1ZEeUtYS05Bdy8rcjJWeW85d25pWEJkWEszU1lP?=
 =?utf-8?B?TjlPaVZtaFAzQlF2VUQwbFF2Y1Ercy9VMXZTdUJnRWhkdlJUMkNuMTRaR2U4?=
 =?utf-8?B?WFZkL0dpNG0rOUsxamx5RWtZZkhqM0cyS3E2My9jdmFVdklJbnFPU1h6eU8r?=
 =?utf-8?B?OWxkUDErQS9DYndjQWVMVDJpWE9HRlpnczdvUVlpdklPWkY3MVVsSUlreHZi?=
 =?utf-8?B?bk1pdXQ1UHNiS1MvQkJ2N2cyZGU1SW54aFVVa1B4R1YzOEpGWExvcCtFR2V6?=
 =?utf-8?B?TTJ2R1B3UzNyaVBCL2oyczc5bm9FeUtCQXNSQmdwdnNrZHNWcWgvRDhqQTZl?=
 =?utf-8?B?b1hlckluZ3RmU3Bnc3hkQXhLVkhIdktVUUZZaVVnRzJFWFJackxXZXVVNUsx?=
 =?utf-8?B?S3J1MWtWaHNQWDNuSEU5eDZDeHpNT0I4TXFTUnN0Q0FBejUwVGhOa1hjVFB3?=
 =?utf-8?B?MjBIN3JGdHIzRGRiSGZYMWw5emRZUzllcEl0WFlCdVlIc3RaY3JwckFFTzUy?=
 =?utf-8?B?d1B3dTFJOTF1RzYxZzZjdFdoak93TmdsSEVZSXhRUzhjdjViSnArS01ENVc4?=
 =?utf-8?B?ZjhPMUFqWkVZVFI4d1U1OEQ0NlY2SlF0ckFSMjVKbWcvc3k3Z2tIQ256djg3?=
 =?utf-8?B?QWZReVJiN1liU2d1WlNFRE96dThPa1JML1BmdHV5K3BDMlJ5SmV3YjliaXZp?=
 =?utf-8?B?ZU5VWWlxQS95OVhBSG9QUEZ4czR6Rnp5UWkzYTY4dHBROWR6NEtlMFRVbzN6?=
 =?utf-8?B?ZXdTdUdTbk1KaFNnRUF6RkdyQ1dzcnpWZmNEK3VBcnhBRWpLREUxYlV1U1Zu?=
 =?utf-8?B?OTdLRjN6dkI4bllTR25jZ1BhWFVEcDd0TFBnaURMNldHbjFGaTNBRDIvVGxF?=
 =?utf-8?B?QkhFc09pOGdDcVhFWnI3QUJWOXAzc3dCMHUxdStSSlFoaWpsdU4rcmhIaEh1?=
 =?utf-8?B?TzRLbE9oV3h1UEkvd0E1dWxENVdCR3NUWUhoR2c5VTFsSjl6bUY3R0xlRmx3?=
 =?utf-8?B?MUZxMVZzRU05bnYvU1pBaTFhekoxWUExRkhZWm13MEdLVXdoL1RRZ0VQTFRi?=
 =?utf-8?B?UC9rY2s2YTJPUDZVNlo5TFVOR2NXTUthNnlBN0N3V0Z1d2FuWXlXZVJRNXZE?=
 =?utf-8?B?MVBDQjlib0JKWTVrMHF5R2IzN0pxQ3Y2bEVjSjQxQy9rVjBMWVNLVktSYVN0?=
 =?utf-8?B?UGFyRzhCdzFKZ1U4Ukx0a3NCa01KNUwvUDU4WTJuOHJZVjhXU2FtdHg5Y2FC?=
 =?utf-8?B?Um5RSXpnemRlTnl2OU1UaFBsdWRZOGdLRkRPaUQzK0Rlc3NWUXl0Q3orOC9t?=
 =?utf-8?B?Q2lhUU43a1dkN0RhblRNRGc5K3J6ZVZ3YllKcXFOZVUvZVZiSGJzU1lrdEdO?=
 =?utf-8?B?NjJkSjNiTUppY1VYNk85RUd3R2NBakNJV1NJZGlQbnJIbUdlamowUFF0aDNv?=
 =?utf-8?B?YlRLelk0S3IwbFBRMTlEcndNNktjNVp5Rm8yc0czWlBrSSsyemQrcXkxendV?=
 =?utf-8?B?V1RpVjk5cTZXRklPbzk0cnJZTHg3TE0rNGVud3d3MHdoQWFTTjRSQ3ZmOTRF?=
 =?utf-8?B?S0FHeUk3V2EreVJMN1lROC96NG53NEROYmRSd2J5d2dNRUlVNXg5TWdKNFRJ?=
 =?utf-8?B?Tm03Sjk2VVNOelFrY0ZXL2RzTE40a0ZXUmFlQmJ3SWNCblVnQ05VdmtVeHoy?=
 =?utf-8?B?ZDRuL3VpTnN0cnRDNUxmU2F0S0MrelpFVW1mWXpYZ0paN3Q2SGprdzlsYWJQ?=
 =?utf-8?B?UmsyeWFVRnY3TXZOeFlIT1RNWU5qOU04T2M1ZHdsQTBXKzhuMjRSMVR5aFNG?=
 =?utf-8?Q?u5ZWljWJomr8BqA7JEc1ccSR+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d92929-9e0c-4c8f-bd39-08dd6537f8bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:42:03.0918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UY3BF8ptaMyyTy9jj/bnYTNJvsTUmN89GCSYC4/aOPmBwSvKkcMGJDmerMmcEUjb81fJBXrFiFarDzgjP45W6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7549
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

Hi Soham

You need to re-order the patches. The lib patch needs to be first.
Every patch has to compile successfully.

adding this patch first will cause an error.

Thanks
Riana

On 3/17/2025 1:58 PM, Soham Purkait wrote:
> Add support for runtime power management
> for Xe driver along with existing i915
> support
> 
> v1 :  Updated references from "i915" to
>        "generic GPU driver" to include support
>        for the xe driver, ensuring clarity and
>        consistency
> 
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   tools/intel_pm_rpm.c | 28 ++++++++++++++++------------
>   1 file changed, 16 insertions(+), 12 deletions(-)
> 
> diff --git a/tools/intel_pm_rpm.c b/tools/intel_pm_rpm.c
> index 08c25ca8a..8c4778e4f 100644
> --- a/tools/intel_pm_rpm.c
> +++ b/tools/intel_pm_rpm.c
> @@ -35,7 +35,7 @@
>   #include "igt_pm.h"
>   
>   #define DONT_SET_AUTOSUSPEND_DELAY (1 << 0)
> -#define SET_I915_AUTOSUSPEND_DELAY (1 << 1)
> +#define SET_AUTOSUSPEND_DELAY (1 << 1)
>   
>   typedef struct {
>   	int drm_fd;
> @@ -47,8 +47,8 @@ typedef struct {
>   const char *help_str =
>   	"  --disable-display-wait\t\tDisable all screens and try to go into runtime pm.\n"
>   	"  --force-d3cold-wait\t\tForce dgfx gfx card to enter runtime D3Cold.\n"
> -	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set autosupend delay to"
> -	"  i915 autosuspend delay. Use --setup-d3cold=i915-auto-delay as optional argument.\n"
> +	"  --setup-d3cold\t\tEnable gfx card runtime pm and optionally set GPU driver's"
> +	"  autosuspend delay. Use --setup-d3cold=auto-delay as optional argument.\n"
>   	"  --help\t\tProvide help. Provide card name with IGT_DEVICE=drm:/dev/dri/card*.";
>   static struct option long_options[] = {
>   	{"disable-display-wait", 0, 0, 'd'},
> @@ -80,14 +80,14 @@ static void disable_all_displays(data_t *data)
>   static void
>   setup_gfx_card_d3cold(data_t *data, unsigned char setup_d3cold)
>   {
> -	struct pci_device *root, *i915;
> +	struct pci_device *root, *gpu_device;
>   
>   	root = igt_device_get_pci_root_port(data->drm_fd);
>   	if (setup_d3cold == DONT_SET_AUTOSUSPEND_DELAY) {
>   		igt_pm_enable_pci_card_runtime_pm(root, NULL);
> -	} else if (setup_d3cold == SET_I915_AUTOSUSPEND_DELAY) {
> -		i915 = igt_device_get_pci_device(data->drm_fd);
> -		igt_pm_enable_pci_card_runtime_pm(root, i915);
> +	} else if (setup_d3cold == SET_AUTOSUSPEND_DELAY) {
> +		gpu_device = igt_device_get_pci_device(data->drm_fd);
> +		igt_pm_enable_pci_card_runtime_pm(root, gpu_device);
>   	}
>   
>   	igt_info("Enabled pci devs runtime pm under Root port %04x:%02x:%02x.%01x\n",
> @@ -151,7 +151,8 @@ int main(int argc, char *argv[])
>   			goto exit;
>   		}
>   	} else {
> -		if (!igt_device_find_first_i915_discrete_card(&card)) {
> +		if (!igt_device_find_first_i915_discrete_card(&card) &&
> +		    !igt_device_find_first_xe_discrete_card(&card)) {
>   			igt_warn("No discrete gpu found\n");
>   			ret = EXIT_FAILURE;
>   			goto exit;
> @@ -169,8 +170,8 @@ int main(int argc, char *argv[])
>   			break;
>   		case 's':
>   			if (optarg) {
> -				if (!strcmp(optarg, "i915-auto-delay")) {
> -					setup_d3cold = SET_I915_AUTOSUSPEND_DELAY;
> +				if (!strcmp(optarg, "auto-delay")) {
> +					setup_d3cold = SET_AUTOSUSPEND_DELAY;
>   				} else	{
>   					usage(argv[0]);
>   					ret = EXIT_SUCCESS;
> @@ -203,7 +204,7 @@ int main(int argc, char *argv[])
>   		kmstest_set_vt_graphics_mode();
>   		igt_display_require(&data.display, data.drm_fd);
>   
> -		/* i915 disables RPM in case DMC is not loaded on kms supported cards */
> +		/* GPU driver disables RPM in case DMC is not loaded on kms supported cards */
>   		if (!igt_pm_dmc_loaded(data.debugfs_fd)) {
>   			igt_warn("dmc fw is not loaded, no runtime pm\n");
>   			ret = EXIT_FAILURE;
> @@ -215,7 +216,10 @@ int main(int argc, char *argv[])
>   		igt_setup_runtime_pm(data.drm_fd);
>   		disable_all_displays(&data);
>   		if (!igt_wait_for_pm_status(IGT_RUNTIME_PM_STATUS_SUSPENDED)) {
> -			__igt_debugfs_dump(data.drm_fd, "i915_runtime_pm_status", IGT_LOG_INFO);
> +			if (!strcmp("i915", card.driver))
> +				__igt_debugfs_dump(data.drm_fd,
> +						   "i915_runtime_pm_status",
> +						   IGT_LOG_INFO);
>   			ret = EXIT_FAILURE;
>   			goto exit;
>   		}

