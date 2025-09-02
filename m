Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76FB4CA1005
	for <igt-dev@archiver.kernel.org>; Tue,  2 Sep 2025 22:54:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51BD10E093;
	Tue,  2 Sep 2025 22:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pj1rAyPs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4A310E093
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Sep 2025 22:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756853644; x=1788389644;
 h=message-id:date:subject:to:references:cc:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3gpFVqiYWLm/kGmTYgdZQYKIHdV6GE/DgT5vd1PTMnc=;
 b=Pj1rAyPsyDwyj/wQMpCOQSE8QACBbHQO3VSpqcw5p5DKaC1aH8G1Gew4
 H2/Yj57F4dQth4TTXrK+tDk2YUzGlZE7w06UGJXgvw97IalAYAJsS53i9
 FIM9IXjCKPXXOsglH8f+loza0CL/7GRwec2hPkFUcUBZUhRVa9fNmchSL
 V/M9DA2Q6Bi0juddxoGPFk1SOD7pAWCUFNnO9ETfgDSftkRBtT1vaa6oa
 WQEsBqX8t7CxkE/jODpyEyP4A3lWUCqm9UMtja6pSK5582u9OqkV9XHnV
 iZX7W5zNfuaSfxOGR1nd6qEgFyX8ASVoV9jClWMoALckjYO6qpVKdY1om Q==;
X-CSE-ConnectionGUID: gWBKKWB+TPOZIrq4R7lvMQ==
X-CSE-MsgGUID: 1VSRFPkLRPCoTyPHCWdgiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59223708"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="59223708"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 15:54:03 -0700
X-CSE-ConnectionGUID: SIA5miKtRSuHoPhvwfNaAw==
X-CSE-MsgGUID: pSPmfjwAQ5ui+VSixN0F7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171569874"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 15:54:04 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 15:54:03 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 15:54:03 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.78)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 15:54:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KzKtYFerN4UkFzcg38O+T9IjgPOcHlFqkCw86P2IJtN+ASuHjDkTHngREWQfd0QZG6XNtpGdAf4YpfSEOkzgrLRPpM7BvTveWOkQSWcGtrfSGc7/EMDpgpDr7tS7u6kDWlMPviiXgRDwBPGtDBEHPyOiP2krgYIU7e3VtKe2xKDNJ3rJkn2l6x2jXzQ76F+/h5Kc69ukx2iLkvhmgABIBnwdvRWHTfeBD1w0ANH92m9FANEg6IRsxyOYaRYVM5Rj+CHJJccHJXCa8Vzi5Q5XyEKmQvYIzO+Ek1+CG3dTrN4jKRdN7nbAssCfGGc9ZuKRo2V97jm4M/qPH8mu5BzfCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OI2TeooyX9zOmivinG8W2IaF9fUyO/C25asc2E/GY/U=;
 b=MNjeIWcLlc2f0g/11QbATQRchMlKOOCxP1sLTCoCTW/3phAZyi2b6C0OBG6HfNRDGxTTFTEj4X8Dt/cE/TnZqPeqJH2y7Ylbo9OkUhMmDDF+T+1JSEMwo2ORBmt7+xZNXAwNPwfm1MfkdCw9d/fR9F8KtvM7T2bTpfwXxxiR60g0ihD0Dt0djMMvNq719kcwERcjRmJs+7kckaHs1UgHccZ7KF8NqEQXb5yDCfkF0AEpeU2CDn0y+ZMvCORzzpX83HB4L5DhbVwsTrjjUwP74Z5NoldV7TMsSw6khoq4gadCYa9mNuhFRQweRXTAjGBSkosxdYJuqQtdF34huUaZsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Tue, 2 Sep
 2025 22:53:59 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::ffee:f7f6:649e:9599]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::ffee:f7f6:649e:9599%4]) with mapi id 15.20.9073.021; Tue, 2 Sep 2025
 22:53:59 +0000
Message-ID: <4faa5a18-24a5-492f-a1dd-c6c108350664@intel.com>
Date: Tue, 2 Sep 2025 15:53:56 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/xe_exec_mix_modes: Remove absolute
 duration value
To: Francois Dugast <francois.dugast@intel.com>
References: <20250204110634.976833-1-francois.dugast@intel.com>
Content-Language: en-US
CC: <igt-dev@lists.freedesktop.org>
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20250204110634.976833-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0054.namprd04.prod.outlook.com
 (2603:10b6:303:6a::29) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f415e0e-bcb2-4998-009f-08ddea739a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aDFkQVR1Yk5EMi9CWGpieGZhZVYyTENYTWc2bmxpRlZicTBFVlJDZ1JVTGUr?=
 =?utf-8?B?S2puN0N6a2UvMEtQbWZzYXdVWmdjTkp3ZEhQNFY2UWxUZTkyU2kwMllmdFJt?=
 =?utf-8?B?WTh5b2syTkphczd4WkVrWitySkE5WWk1dGh1YUxTeHBCUGh4bE1ZOUxNSCtU?=
 =?utf-8?B?Nnd1amViMnhEcWcrSWJGK2JXaEgrSjFpTjIya09LMU1QZWVNUXFXODI5aUhP?=
 =?utf-8?B?bmdQRlpacmNpYXg1c1J3WXM2VFVXbFRVa3c4RHE5ZndSVGFPUjVOdm16WTFD?=
 =?utf-8?B?UGhCRmlpaTluT3VKczU5VHRmencvQ2w4OWRPOVYvR3BiSFM2WlNCczMyTUNO?=
 =?utf-8?B?cEtHSEY2WVVkdDZiOXVPbmtmbkE1VEZTWHZpWFlCSmRkL0YzeEZnS3RpWHRP?=
 =?utf-8?B?TGFwYWpWWitoTEUzeUxBRlFtVDFVTnZyU3JrRzNYRmRuSkttcGdZeDZnOURL?=
 =?utf-8?B?eHRjY2JMN00yaTR1anFGRHFwc1JSYjhtdDhabW9uVGx6aitqeStXVlplUld5?=
 =?utf-8?B?bW1OUDJlREJVditBbzdLcjFMVEJvUjVSNUNPMk50am92VjFVSi9zTkMzMzhS?=
 =?utf-8?B?VjBGUWNhTk1qRGhmUFN4bXhuQ3NBbjBobFVwekJtamE4UUQ5MGJWLzA2TXFI?=
 =?utf-8?B?RlRrbDVwQ2JUcjFZaWszQWI5SGFuczRuQ3pkNU1sa1VCbzd4NjhCOUxNbU4y?=
 =?utf-8?B?ZDQzVk1kUWNPZDhxckxMRENYWGZCcU12R2F1aTdEVlNFUERmZFEyd0xsT2Iv?=
 =?utf-8?B?MHhJV1BlNGxwM0tWUmtpR3hOUUFLd3U3VjhOc2dxVW1FRmlJK2tVdjNtRElE?=
 =?utf-8?B?clN3bUJuekRuVjVOaWtFQWdsNmk0bkI1aDJEYXhkaGxRaHR5alN3RzZuMXZj?=
 =?utf-8?B?alVDL3pPSDNjZ2xWREFwRFFKaUh2bEhoMEZnWFMzS1Jicm05VWpwck1XOUQr?=
 =?utf-8?B?WnZvdXdqNkd4a0k3VVptc09TN09RQmlobk05ekR6akNqS1hpNFRadW1DMG5U?=
 =?utf-8?B?aTVoS29ZRmpZanRPMjZKYktya3kzNXM0blFWaEF6bnQxdE1UYzl3Z3dRL0J0?=
 =?utf-8?B?NXNTcDk2VHJjcHVFSmNOSEtzVHBsanI4eWZ3dlBFSjAyeEorYy9GYkY2aTlw?=
 =?utf-8?B?UktGQ1VMbWxZUWFQMTdNRTdObnB2YkJSWjI4ZFRFV1dSaWk4RzRrcm9STkdH?=
 =?utf-8?B?L2tFakRFZFpaOTVtMDQ3MlRZKzNIZjVxUUFmRGFncktjMkRtak9rOTFOdVRx?=
 =?utf-8?B?NFJTMFdIeC82Mkd2UmtJMUFyT0JObFhCOEVkK0xlZUtjc3ROcmhka2pOZUln?=
 =?utf-8?B?RXA5L1pvSjZPTVR5bG9BcHduL2kxY0VIeXJPb0NvYzdibkVSN3dTNDJUd2FF?=
 =?utf-8?B?eUpuc2JMdGhkWXdRNGlFTi80MmNvRkF0NnhTTlZLV3JjdFo5TjVxTVd2UWhq?=
 =?utf-8?B?SE01SmdpZWRKRC95TDJtdThRREdNUzE4U0Jqa1hXeDliS2IxUmNjZHZ1YWxO?=
 =?utf-8?B?b2pxa1B6ZE5XVUoyYjM2WHIrcTNHak9CK1czY09KdEF0L2pwTWh0WDIvdVhD?=
 =?utf-8?B?U3dFUEtnQXNBL0lZVU9PcGMzRDdRMTdHMmtmWEZPbldVNHlrZWovcmQ0RlpW?=
 =?utf-8?B?dTJTMm80WUFQZEcxY3Y3UVNkSW9zUmowNU96WXFNSnJlVlFoOXhtUmZUczdp?=
 =?utf-8?B?eHZ2R1pVR0dtYzVQL3V0L3hKNE04SGNmeENzMC9pYzI0V0RZcUpESHovRzRI?=
 =?utf-8?B?NlRCMGVKR3BtTlF0QngrS0pLcWUrSHRmaml1dFNvR0t2Y2d2QTc0eFYyNzNP?=
 =?utf-8?B?V2t0d0wrMkxDRnd4Z2wveHY4bWljRk0vcHZEWVVmMXhicm9iR2V5cmFpalJp?=
 =?utf-8?B?NGFYMEdBZkxvVGVsblhqZUh0L3h4YkdFN09CdldSQnRzalk1UUt0dTlRV3Qw?=
 =?utf-8?Q?f2vH0qHZhiU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGxBL0JRNldQaWVGRTgrV1BkdVA0bWRHRk8xN2pJSXlQekpIUWF3UlA5Q2pi?=
 =?utf-8?B?VVVvNWNUZGpyNE1RNE02aGFXUmNWOVBlM2VGWlBPekVXR21RWGhlMmtwN2RI?=
 =?utf-8?B?bGdrVWd1Q0l0L3QyZ3RqNVFZNmRleHduWmpJOE12ZXkyK0hWZXJTN01XYmEx?=
 =?utf-8?B?TTNPK09mVCs2Y3p2ZkdOdEtCcDRDa1N3QklVOWhiMThGeWRCV2RtY3I0a2Jo?=
 =?utf-8?B?UXlNM25TV2M2V0xJd3IyMy9VakFVWHpEc1BYOWNnek56R01yUkZBZDR1ajQ1?=
 =?utf-8?B?NytwZk5VY3R3NGxDL0pxR1Q2ZUNIdEpUODhueVFnSFZ5cm1zRC9xUEEzVlB1?=
 =?utf-8?B?WmkyNm9MUnFPbS83dFBZQzdaN3JkM2V6dUdMT0ZkU21UdGxGS2duK0VKbHRu?=
 =?utf-8?B?WWphWStEWHZFRXZCaWFtTFBHTTRoN1Q1Sm9xaWdkNXJkekt4R2NhZUpMa0xm?=
 =?utf-8?B?ajFxRy9ueW5ORDd3a2hydm8zQmJpdzNJOUJwZGozOWhUQTNqb0M4eUhaUG12?=
 =?utf-8?B?VFRraGxCQjN3djlDSVpURjB5dms5eFJBSjlVOEdTa3FNUG45dzhpTGtGZEdn?=
 =?utf-8?B?VHVOdFdYSjVlUWFoUFZRbDFaL3JGQ0J4cDhqdXY3a2lkRkxPb2Q5UXhnZjdB?=
 =?utf-8?B?MkViUjlUQlFHU3ZMbHVMTXQ1N3JlUWtGUmZ0SUJ5aHZ0SlpFNnRZZ2s4UmdL?=
 =?utf-8?B?MjZzMUI2QjROSW42N09ZOVVWV0JERkZXeXkrRThqdFVRVXhrNmtsb3RwdU5T?=
 =?utf-8?B?WFBQZi9tWFJ1U3NQajEyWUZLaTlKalBuZVRLRFBsSlVnTFIrbDgzSlU3T2ha?=
 =?utf-8?B?QUVEdWJYdVZBaGordHlud0FNNEU5M1hxRHZVdDdaanBPb3RJeG9CU0F1OWZk?=
 =?utf-8?B?MzRhVUdiSmx0MzRnVk9sTmJsbEZhck5qcGpzWGh3bWRrck1GdlR3RW1TMjF1?=
 =?utf-8?B?RFoycTlSTWZkN0I1UG5raFFsbDBsWUI5UmNlUGNMTG9SRlhTTzhqNE9LUHYy?=
 =?utf-8?B?ZU1lbG5xYUp4WlJhZUFoZjJ5b1NLMW13cDN6NXUrMlNUbjd4RzN6dVBCcVkx?=
 =?utf-8?B?UENOU0tMSTl3ZFJ1VGtMNlJYbVZFbDhrTU9CWTRFOHM5TEdsK1hqaGZ1ZWh5?=
 =?utf-8?B?YWp1eEJMRVBRdVRFY1kxOUNTT2gvN2VtT3cyVEo0TjdhMlRmVWRWbzRqdjVx?=
 =?utf-8?B?TllzWnBIS2d1ai9nRm1kaFBiMXYwMFRkNWxITzdiRHRiZWtIMXhqdnZqaUJM?=
 =?utf-8?B?WGJTOUR3YUc5Lzl1TUtQMVFZZGRHaWxhMjQyZHBMa1NqTUd0anJHVmJmaUpW?=
 =?utf-8?B?VndFY20wK0FGZkxERlBjL3VRTmZDeFFhQjhvdEdxMDNmTEpOcFZzcFFORklX?=
 =?utf-8?B?bEZKKzNBVXNubmxZNmJMY01TTHRNTnNSb1NVaE9BaVZqbkNBT3VJMUtaL1ZE?=
 =?utf-8?B?Y1VHZlEyUUQvTUwzMG9Odm9VazVmbXlLWDIzc2RSY3pSekdJbVNSREJweTBw?=
 =?utf-8?B?NTNSS2ZabTR5N0lLMGg3VmdLdVJZODZsWDNwYm5uYnlXNkduK0UzV29XWGNz?=
 =?utf-8?B?Q3NRWkNUTitPS0t2em94UWQ2cTI1anM2WktjbjZRVkhRVU9rQXFUR3pRWVZy?=
 =?utf-8?B?cElsQkJjWnA3V1ZDOC9Td0xjajRLTFZwNzBBRE94dXZEbFhnUGZ4dVoxSG16?=
 =?utf-8?B?emtUNlAvZFFiU0JFNVJyenhGeGNrM3g4ZG9hOEtGKzVhNzdDMmZQMlJ6L2NU?=
 =?utf-8?B?dEsxVnZaNjNKVy9GQ0s2YWd5WFlFZUtuY0s1UDA1aUZmWGRHaU1JYjR4SzhF?=
 =?utf-8?B?aHZSMnBWeEJHU0JCMkVJVGt6cUhQSW1uVGxTNG4wTW5IZXphOTh6d1lTUkhw?=
 =?utf-8?B?TTZyWVRqYUx6S2d4Q0lZdmZEMjIvY3h1M015eGcvQndIR0VGTUhzNUkwQjJ3?=
 =?utf-8?B?WUNMNUx6SzlEcHVMdi8xNjYySSt0dkFJc1RhNFNENGl2WHpzYlFwZ3cxMlUv?=
 =?utf-8?B?QitSTmVudHk1YkVYRFlGWGI0OVdRS2JpVm41VkZLQmJ3SWFmbHlkT0RIU01O?=
 =?utf-8?B?MDFYaUU2cUZwTjY2V0g0U1NvQ2hQbjd2VTBLbFFDQzltZUp6RXZ3cHovZHN1?=
 =?utf-8?Q?Sbml6rl7uwcbK9zpYapvU6PtY?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f415e0e-bcb2-4998-009f-08ddea739a56
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 22:53:59.6887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dncRbTGgPg2gIu/pfJ4fG5sftsexCWabwN9rqL/8VcfZgMF4AFTHvKsoWOcNm7SxMMFs0HYmULJORpIRC8bwxdp5GExwownp+QX72vQ70xc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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


On 2/4/2025 3:06 AM, Francois Dugast wrote:
> This absolute duration value was making implicit assumptions about
> execution speed, which can lead to issues in specific environments.
> Remove these assumptions and instead explicitly end the spinner and
> check the completion order of the jobs.
>
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> ---
>   tests/intel/xe_exec_mix_modes.c | 68 +++++++++++++++++++++++----------
>   1 file changed, 47 insertions(+), 21 deletions(-)
>
> diff --git a/tests/intel/xe_exec_mix_modes.c b/tests/intel/xe_exec_mix_modes.c
> index 59887d2aa..e65854d0d 100644
> --- a/tests/intel/xe_exec_mix_modes.c
> +++ b/tests/intel/xe_exec_mix_modes.c
> @@ -28,7 +28,7 @@
>   #define FLAG_EXEC_MODE_LR	(0x1 << 0)
>   #define FLAG_JOB_TYPE_SIMPLE	(0x1 << 1)
>   
> -#define NUM_INTERRUPTING_JOBS	5
> +#define NUM_INTERRUPTING_JOBS	1
>   #define USER_FENCE_VALUE	0xdeadbeefdeadbeefull
>   #define VM_DATA			0
>   #define SPIN_DATA		1
> @@ -76,7 +76,8 @@ enum job_type {
>   static void
>   run_job(int fd, struct drm_xe_engine_class_instance *hwe,
>   	enum engine_execution_mode engine_execution_mode,
> -	enum job_type job_type, bool allow_recursion)
> +	enum job_type job_type, bool allow_recursion,
> +	struct xe_spin *dma_fence_job_spin)
>   {
>   	struct drm_xe_sync sync[1] = {
>   		{ .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> @@ -95,9 +96,9 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
>   	uint32_t bo = 0;
>   	unsigned int vm_flags = 0;
>   	struct xe_spin_opts spin_opts = { .preempt = true };
> -	const uint64_t duration_ns = NSEC_PER_SEC / 2; /* 500ms */
>   	struct timespec tv;
>   	enum engine_execution_mode interrupting_engine_execution_mode;
> +	int64_t timeout_short = 1;
>   
>   	if (engine_execution_mode == EXEC_MODE_LR) {
>   		sync[0].type = DRM_XE_SYNC_TYPE_USER_FENCE;
> @@ -133,7 +134,6 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
>   
>   	if (job_type == SPINNER_INTERRUPTED) {
>   		spin_opts.addr = addr + (char *)&data[SPIN_DATA].spin - (char *)data;
> -		spin_opts.ctx_ticks = xe_spin_nsec_to_ticks(fd, 0, duration_ns);
>   		xe_spin_init(&data[SPIN_DATA].spin, &spin_opts);
>   		if (engine_execution_mode == EXEC_MODE_LR)
>   			sync[0].addr = addr + (char *)&data[SPIN_DATA].exec_sync - (char *)data;
> @@ -157,25 +157,51 @@ run_job(int fd, struct drm_xe_engine_class_instance *hwe,
>   		igt_gettime(&tv);
>   		for (int i = 0; i < NUM_INTERRUPTING_JOBS; i++)
>   		{
> -			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE, false);
> -			/**
> -			 * Executing a SIMPLE_BATCH_STORE job takes significantly less time than
> -			 * duration_ns.
> -			 * When a spinner is running in LR mode, the interrupting job preempts it
> -			 * in KMD and should complete fast, shortly after starting the spinner.
> -			 * When a spinner is running in dma fence mode, the interrupting job waits
> -			 * in KMD and should complete shortly after the spinner has ended.
> -			 * The checks below are to verify preempting/waiting happens as expected
> -			 * depending on the execution mode.
> -			 */
> -			if (engine_execution_mode == EXEC_MODE_LR)
> -				igt_assert_lt(igt_nsec_elapsed(&tv), 0.5 * duration_ns);
> -			else if (engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> -				 job_type == SPINNER_INTERRUPTED)
> -				igt_assert_lt(duration_ns, igt_nsec_elapsed(&tv));
> +			struct xe_spin *spin_arg;

initialize the pointer for when the first if clause below doesn't assign 
it.

Perhaps it requires a rebase, as I had to do it locally.

Otherwise:

Reviewed-by: Daniel Charles <daniel.charles@intel.com>

> +
> +			if (job_type == SPINNER_INTERRUPTED &&
> +			    engine_execution_mode == EXEC_MODE_DMA_FENCE &&
> +			    interrupting_engine_execution_mode == EXEC_MODE_LR)
> +				/**
> +				 * In this case, jobs in LR mode are submitted while a job in dma
> +				 * fence mode is running. It is expected that the KMD will wait
> +				 * for completion of the dma fence job before executing the jobs
> +				 * in LR mode. Provide a pointer to the spinner to the interrupting
> +				 * dma fence job so that it can check that it was blocked, then
> +				 * end the spinner, then check that it was unblocked and completed,
> +				 * see "if (dma_fence_job_spin) ... " below.
> +				 */
> +				spin_arg = &data[SPIN_DATA].spin;
> +
> +			run_job(fd, hwe, interrupting_engine_execution_mode, SIMPLE_BATCH_STORE,
> +				false, spin_arg);
> +
> +			if (job_type == SPINNER_INTERRUPTED &&
> +			    engine_execution_mode == EXEC_MODE_LR &&
> +			    interrupting_engine_execution_mode == EXEC_MODE_DMA_FENCE) {
> +				/**
> +				 * In that case, jobs in dma fence mode are submitted while a job
> +				 * in LR mode is running. It is expected that the KMD will preempt
> +				 * the LR mode job to execute the dma fence mode jobs. At this
> +				 * point the dma fence job has completed, check that the LR mode
> +				 * job is still running, meaning was successfully preempted.
> +				 */
> +				igt_assert_neq(0, __xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync,
> +								   USER_FENCE_VALUE,
> +								   0, &timeout_short));
> +			}
>   		}
>   	}
>   
> +	if (dma_fence_job_spin) {
> +		igt_assert_neq(0, __xe_wait_ufence(fd, &data[EXEC_DATA].exec_sync,
> +						   USER_FENCE_VALUE, 0, &timeout_short));
> +		xe_spin_end(dma_fence_job_spin);
> +	} else if (job_type == SPINNER_INTERRUPTED &&
> +		   engine_execution_mode == EXEC_MODE_LR) {
> +		xe_spin_end(&data[SPIN_DATA].spin);
> +	}
> +
>   	if (engine_execution_mode == EXEC_MODE_LR) {
>   		if (job_type == SPINNER_INTERRUPTED)
>   			xe_wait_ufence(fd, &data[SPIN_DATA].exec_sync, USER_FENCE_VALUE, 0, NSEC_PER_SEC);
> @@ -227,7 +253,7 @@ test_exec(int fd, struct drm_xe_engine_class_instance *hwe,
>   	else
>   		job_type = SPINNER_INTERRUPTED;
>   
> -	run_job(fd, hwe, engine_execution_mode, job_type, true);
> +	run_job(fd, hwe, engine_execution_mode, job_type, true, NULL);
>   }
>   
>   igt_main
