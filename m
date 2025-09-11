Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F4BCAC58D
	for <igt-dev@archiver.kernel.org>; Thu, 11 Sep 2025 09:21:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B322910EA64;
	Thu, 11 Sep 2025 09:21:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cCbqzKzs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FE010EA64
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Sep 2025 09:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757582494; x=1789118494;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=B/ZpzznMqP+rSmR6Y4wnmdFFE9BnPThZJ5Dpd7w2tmg=;
 b=cCbqzKzsSSyy73XKppktc+xyRPJ0eq/Xsp2xSz/IdTpNzg3T3f5lqB/x
 Wq1IfeCi+NDX0jbDUThj97DfwYtrUQa2Or21xdVYYDgOCWm4eTXB1NXSW
 ucx5NX2gysct0nJdYG8Jd5sfNb7hGzZVRLKJ/8FuBhcq2qbgDxAhIzZKL
 OzLxZ5e1xHWUYsRF+Fwzc13AHucWUgOkmFlFIg3psMU4LNxlpgS3LXyxB
 CgRbRBzpGdDw7o13OcnsZubkh51IrXrwOlmnPBqeIxwICvToNFr4BtcaD
 aWqLnlvIhKe53AMn6vCn3iQtBuEaXDfu2mw69RnDq+fksGg3Mo7YMuwA9 A==;
X-CSE-ConnectionGUID: NYgnMaaqRS+Z07Lx0D8hjQ==
X-CSE-MsgGUID: Fp5FxWGsTDGy705k3pkJXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63542001"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="63542001"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:21:33 -0700
X-CSE-ConnectionGUID: s7dnjOhETsum3JWtMARPQg==
X-CSE-MsgGUID: D5/ECqq/QSOCCzLkNTE0Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="204403373"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 02:21:33 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:21:32 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 02:21:32 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.42)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 02:21:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sann9DW+8/Z94nK8bhuaH5/rry77JwhZYO2xwkN+/uI6KCuQYvW/T0FDUNJFUUtMAmCViS7mKwhZaE7lWKq272P4KUe2LRnEsSE6QfSMhYwqXML8niz37q5eSibts+Y2rH+fM6C7uq9g4o7qJmDMGHhW3pnAJ+Ngbw5KFfe33YKCyX1eLadYFg0yWAtIcVHsAaZvFcSyNZoZShnio6H78TMqJNufa/5zaa0ZRcUU47n5bvrjCitSdq0xSIuwnmRJ4IxlMwsnDoTqb+0OJJNIyLCBOqsADrcLP6dC0ge0Qnsu8pZ+g7xgf0Kh7gDU1NLK9mzwPr/RkBr4z/kqKcPaSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q/hlqz4YaWQ2BwnLYTsVqTL2nrBL3R/B9cBFso3Czwg=;
 b=L17LsCHD2vJhGkpJc0vOjEVEBPn5OZqwGsZMJUk1+n1pp/blL8P6R2Vzk4XRXlmPjIjaUubxF56YOrtsL4FbiE2zhfA85sKCKLFwHmElzAMoFbr8f+0urw+A+BeOQBE13Gircr6ry4ApmSOXIaFU/3pgcNma8PSzu5o+aQxidkgWdfxPPHg4IJN68f9vI5YuiObOwpWMSLzs0voK8ZlVkd4DjbvX9vMWFPyBbv3YVFDTnU4awRB0BOt1C6ylVVJzrZ2piMhhKK3//QOYcLfYDrSIJKPc3uncYUL1kLVQd8BLjNxlDuBuUfEmMS5vheYyt7VyriMSCtgY0ZpRSBCn0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DS0PR11MB7682.namprd11.prod.outlook.com (2603:10b6:8:dc::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9094.22; Thu, 11 Sep 2025 09:21:29 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 09:21:29 +0000
Message-ID: <948ab9d1-5796-46cd-8a46-b1a807406eed@intel.com>
Date: Thu, 11 Sep 2025 14:51:22 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t,v3,1/3] tests/intel/xe_survivability: Add new
 xe_survivability test for i2c adapter
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, Kamil Konieczny
 <kamil.konieczny@linux.intel.com>
References: <20250910192031.1908588-5-sk.anirban@intel.com>
 <20250910192031.1908588-6-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250910192031.1908588-6-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0001.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DS0PR11MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: 442b0f86-bcee-40bf-67d5-08ddf1149745
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkpPUFo1NWszaWZNcXR3bEtUci94UEh5djBtUGNzMzdaL2ppVTlSZ2pySmtV?=
 =?utf-8?B?M0NJYzI0dTlpSW9IYVNoK2Zwd05VNDlkV1ZveWZMejB2RU1qKzZ6dDVYUjdh?=
 =?utf-8?B?RUNBWjIzNHZ5ZG93OXpBNURCNE5iVUdBUDdzd2NLaHFpdkpWUXk3alVqaC9D?=
 =?utf-8?B?L2V1ejZka3NIM3RHdkpuUDNNLzFZWmc4ekNrYXlMMXBNb0hieXQrSFB2eG5C?=
 =?utf-8?B?S0JZem94L05nU0h0WmNVVGx1Y2RPMFN6WkhXZ1plemwyVmxtZUl6QjBiZFpl?=
 =?utf-8?B?WDFmZ2ZkSk1BZXBRMThFR3FBaVJUV3FkVGpNU2doT3M1ZXlDdW8zUjlRclg5?=
 =?utf-8?B?eHZ0WW9BazZrdE55L045bU1UVHJvV2hQNDVxZXdBUTkzeTV2TGs2WHlwUjZS?=
 =?utf-8?B?ODdJSUFMS0lFNVFkRHVYTy9iNUMveTRkRU1tK0JiWGhldkJSQlZCOG9KZXZ1?=
 =?utf-8?B?d3czSzVvNVJ0VVFVSUY3bWhzNk00OUMzMDNuL0VzRUNkb3lJUWpCbi8ybjVW?=
 =?utf-8?B?YjdmTVBSSTNzb3ZDajF5clRveXNwTWJwS0VEUWNWelNMelh2NEpldFlFUjlM?=
 =?utf-8?B?djVPUC9NYnVuanB0bnV3cXFjRDl3UE5DWkl1WVp6Z2ZlcWg2VzY4Yjg4a2pG?=
 =?utf-8?B?RjRqQ2s1VStJTDZMSUNRNXFqYzdTdDY4MmtuR0JBc3RNb0N0Q2g5bGEzUDIz?=
 =?utf-8?B?RHhtd0VCV0NLSjlHbkNnT0lZZWphTFZTY0dFRGQ3eEdhOTV1TzQyT0NXS0pN?=
 =?utf-8?B?ejJUUG1XUFRuT2JqSTBtY1N2VkdvUnBIRkJZWG1NamcrME5nUzM5WEQ5QjBX?=
 =?utf-8?B?aWw1dG5rUkJiWlNtdi9JMHZ1bWlKeGtaR1M1a1N2T0JGYmU5bUFVMnRPRlhS?=
 =?utf-8?B?b0prbWkyMzZZaTJzYjM2OVEvNGh2Qm1HKzFBTjNYT3FvbGFoR1JCM1BHNVBq?=
 =?utf-8?B?ZmJyczdJVExZTlEvYUxlK2hyczU2V1drL1Z4SEVOTHBPN3lUZ3lPVEROb1Zn?=
 =?utf-8?B?OURMMlJkUXlZK0ZFOU9iRytFNzJXbmFZcTd0R3cvQlFPTjRCOHBSNC8wQlJK?=
 =?utf-8?B?cDV3SDY1OHVRTjVObWNuMTZ5SG0yZWdBaDJIemlma25GQ25Zb3lUYnVWSHdh?=
 =?utf-8?B?NStrbmlucFpKQ3Vzek1WRE9aeXFoVmp3ZUlLTXkzL25kSzRUb3VNNVJDMzhU?=
 =?utf-8?B?eXRDR29nZkNBUXk5Y0RIUGJDWElGSjBQRzE2UTg4U1BvdWR3RFBjcUhyRi9V?=
 =?utf-8?B?T3ViRDdxSFRoVjZ3Ukk3MloyTUNIdGlIb0JkSG5Tc0l1a0R1UUZSZ1NHcG1w?=
 =?utf-8?B?UWh6RkxQOWNIWW5YdnU5KzFWRVFaTVo1bmFPT2Q1aVh2UTROSUFYbVJQWHBz?=
 =?utf-8?B?T0NGQ1h3VWlDanRGRUZGQWRVeEJ0Qi8zcmZJSzhMakxEdHBJN3h1Tk1wa214?=
 =?utf-8?B?QU1BOG80K241WUxwZVJpQ3RMeDVOQjY0WmtvVzJJOExMWDIxZUx2MnBqL0t4?=
 =?utf-8?B?WVFkYm9VSDcxcEdrajVEYlBGaXlvTXkwMVkyVEpNUjNqdm93blZYT1NGZlhN?=
 =?utf-8?B?VkI5YVdieGkxdDhmWTFQcWsrMWxlcXFrUnlhR1BER0U1MEg2VWRHUjBtd2Jh?=
 =?utf-8?B?YTdCbmRTS3BjMzQ3US81WjV6THVZMVNPY3VWUUhLMnF5cDZXRURuN2RwTm5B?=
 =?utf-8?B?TStRU1M0UFlKeFFBM1RHTFJZNitMb1B2QkdzTDdpRjQ3SWljMG1rRzljdFlz?=
 =?utf-8?B?OXVrV3phUEVrT2RsUFJnTEZZRDlDTFVyUnhEeW9zNWxCYlc5TGYwUEJPMlpD?=
 =?utf-8?Q?4ZElylgE7FL+0aVaYvdNumvtdPzPMDlZSJo4A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWxXVVNmd05seCtNZXF4Ums5Y3RyaDh2ZEZPb09XZFFETGtBbk1LbU5UcWdQ?=
 =?utf-8?B?Ky9LTURoYVJEbHpjMW9YVXBWbVNPNGk1Q0VSYkY3cnY2QlI3di81b0k4VWE1?=
 =?utf-8?B?NEdRdUpzNkZFWUk4SlpyQmlRZEEvT0poa1hqdVk3S3BBNDcxeWFVcEtxcjVF?=
 =?utf-8?B?M0xCcHpNcmVOcDdXT2pJN3lYd2VhSGdKc1FIVmpIWnpWb3lMQTJMTERyejlJ?=
 =?utf-8?B?eU14SFkzcFlNbzR3dFFjVzhaNThaSVZPeGRrL1dWcFRKblJOV2szNWdpNjdj?=
 =?utf-8?B?OGxINUh6UFZVUVFXUDdmUVdwQU9pOFdNTmdEYm5LWHczUzQ3L0hHMEltWDhj?=
 =?utf-8?B?L1lvdEZkQlBzUUUzb0pZbFFuRG5NV0JoS09Rc05SRTU5NkdQM1Z6RVdCdXBp?=
 =?utf-8?B?ZlVXSTUxUFAyalNDTUpqS1FSZDBXa0tGRlRjRHVha0kzd25FUlAvVDNBMFdV?=
 =?utf-8?B?M3pMdEI5RS9zZXAveUpZMEhsNE5yMXVBcldmWmxDWlJZS3haY01hQjBmVmtt?=
 =?utf-8?B?dnYvdXplVWJ3dklQVWg1RW92aXRDVmEraEQyejF5Q0pKVEhoY3VoZkpiclJY?=
 =?utf-8?B?RWtwTmVoNEdlbC9NNm1kR1U4VEFNbVluUmdTVkJxdllRbHVpTUxDemlITnhH?=
 =?utf-8?B?QS80Q3JneVJVODgvbnNRUFpIVHNmUE9SdGlxRlRUVUNzNnZLQ1NIK2dFdHds?=
 =?utf-8?B?c1JaM3VqSW5JVXBPSmtGMmZyaUozTHNZUllyUlY4TTVBaS9nclRPdE5PRyto?=
 =?utf-8?B?NG9YNFpzZTZLSmNWWERiYzN4L2RvODI3NE1LUGtGVHVadlZlT2FOaHJBM1k3?=
 =?utf-8?B?cU9VR041RFBnb2l3MUhRMCtHZjExR2JRY3ZPNG81UWphL2lZdmlKRFVnVjMw?=
 =?utf-8?B?TlJtYXQzMXIwdkNuN1lEdElEUWhMbElmYzlYNng3WFRFajhlOEF4Z3lpR2Jp?=
 =?utf-8?B?alRPbWZZc2o1S0NjM3M2Mmswc1hIMFdkbmZ1OXA4VTFvclRScTZMczlCSFpZ?=
 =?utf-8?B?VFk1aThIc0t5YUN4VXpGL0U1RzVhQ3pUd1VYcWovRkphNm1XTHFZY0pVQytJ?=
 =?utf-8?B?WWFxU2Jnek1hWi96RzVJVnl3S3ZrRVNJRkdZUngvMWlDREpqYTZzVm81OGZi?=
 =?utf-8?B?SnJWMXFINitvcHZRTENObVdoTWJ0NmEwN0orQ1A1Q09sYldZMTZnajRVSlpp?=
 =?utf-8?B?NS9OS0JRdWVJYlJoYzRFSmxPMUlBMytMMzZWa3ZZQ01ORnVqWHl3VlMzNXQ0?=
 =?utf-8?B?N3BETnU3aisxbk1INkp3VURudDJ4U0JHOFFwUXAxY2ZJU0MrUFdkOTFWOXl6?=
 =?utf-8?B?R1gzd2V6bElmSUVNN1pOME4ySllZeEVXazFxYWRrSVFsYUVjK2dWTCtiYTNv?=
 =?utf-8?B?ejdLYy9mSjV1SURhR3FFT0JXdzRiQmxxT3JSV05PSkVmbEg4NHZWRDJNc08w?=
 =?utf-8?B?VThTZU1EZ1Y2bHg1T1FBS2UrK0VjQW14bjQydkFqM3ZKMUFtWjJDTjg5Vkoy?=
 =?utf-8?B?MHptRXdNMXJ5dDZwTG5zeFIrWFpJZlFQSHFsdTRNVXVJdFhDa01vdWl3NWs4?=
 =?utf-8?B?aytURHlNTldML0R1OFJiSTR0T2YxTWUxUm56d2hPRG1OelRMT3cxNUF6MVpw?=
 =?utf-8?B?aEswUGM2a1dpcHRaa05wTzY3ZzYxeVdpUUpCd1Juby9tS1FWZ2ZpK2trUE5n?=
 =?utf-8?B?bjRkUE12c21WQ3RyaXo2dkNhaUY1YmZpaSt0bldRZlhXZTN1MVg5bW1FdnNv?=
 =?utf-8?B?Mk9BeGJSSjY1OG15NTRTM1JlN2lVd2VuSUhzSDVlOEVqc1EyMDJiK1F5VlRE?=
 =?utf-8?B?a2M5V3cxK2FrTFpMYnltWEc2QVZvSENGM082aUhtc3pXUkp0dm5nbWtPNHRC?=
 =?utf-8?B?K2xGdUxNZVZHd3dqNTJvQmt1MVhHVktyVVRJRmZYenE4VW9HYk1tSVA5YW9D?=
 =?utf-8?B?aTBSMXRFcE51MmpTL0VrMFR4ZS9pdTdyL0M0WnNaVUJJbkFNVXZjWXFhaExB?=
 =?utf-8?B?b1lKU0pCcDNNc0tuRWR2bUxKZnZwUTZTY0c1M1BOQ0RjeFZrclJvRTRkZks0?=
 =?utf-8?B?ekVjdlp3QUc2Yi9QamNMMTYvVkZKQ0luSUZLWWNlaUxkOTdOd0UvbVdaQ0sw?=
 =?utf-8?Q?xBHoOiwEi6cnK0eK41h4S9sMC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 442b0f86-bcee-40bf-67d5-08ddf1149745
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 09:21:29.7283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jT2Rp+KxhvTHlT2VZLZEsN2RiGfnJYWHj05SBRdwZdBk86HFzO3bcAdUyu2BGEmWS7LEOiiD9ssMTv6042bZUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7682
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


Hi Anirban

On 9/11/2025 12:50 AM, Sk Anirban wrote:
> Add i2c adapter presence check in survivability mode to ensure
> the Add-In Management Controller (AMC) can receive firmware updates
> when the device is in survivability mode.
> 
> v2: Create new file for test (Riana)
> v3: Update subject, description, nitpick (Kamil)
>      Use drm_close_driver() (Kamil)
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_survivability.c | 152 +++++++++++++++++++++++++++++++++
>   tests/meson.build              |   1 +
>   2 files changed, 153 insertions(+)
>   create mode 100644 tests/intel/xe_survivability.c
> 
> diff --git a/tests/intel/xe_survivability.c b/tests/intel/xe_survivability.c
> new file mode 100644
> index 000000000..6fb13b391
> --- /dev/null
> +++ b/tests/intel/xe_survivability.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +#include <dirent.h>
> +#include <fcntl.h>
> +#include <limits.h>
> +
> +#include "igt.h"
> +#include "igt_configfs.h"
> +#include "igt_device.h"
> +#include "igt_fs.h"
> +#include "igt_kmod.h"
> +#include "igt_sysfs.h"
> +#include "xe/xe_query.h"
> +
> +/**
> + * TEST: Comprehensive run-time survivability mode testing
> + * Category: Core
> + * Mega feature: General Core features
> + * Sub-category: survivability
> + * Functionality: survivability mode
> + * Description: validate runtime survivability mode functionality
> + * Test category: functionality test
> + */

  * TEST: Comprehensive survivability mode testing
  * Sub-category: Telemetry
  * Description: Validate survivability mode functionality
  * Test category: Functional tests

++Karthik/Kamil for suggestions in Category/Mega features

Please check https://patchwork.freedesktop.org/series/153175/ also
and incorporate the changes

> +
> +static char bus_addr[NAME_MAX];
> +
> +static int find_i2c_adapter(struct pci_device *pci_xe)
> +{
> +	char device_path[PATH_MAX];
> +	struct dirent *dirent;
> +	int i2c_adapter = -1;
> +	DIR *device_dir;
> +	int ret;
> +
> +	igt_require(igt_kmod_load("i2c-dev", NULL) == 0);
> +
> +	snprintf(device_path, sizeof(device_path), "/sys/bus/pci/devices/%s/%s.%hu", bus_addr,
> +		 "i2c_designware", (pci_xe->bus << 8) | (pci_xe->dev));
> +	device_dir = opendir(device_path);
> +
> +	if (!device_dir)
> +		return -1;
> +
> +	while ((dirent = readdir(device_dir))) {
> +		if (strncmp(dirent->d_name, "i2c-", 4) == 0) {
> +			ret = sscanf(dirent->d_name, "i2c-%d", &i2c_adapter);
> +			igt_assert_f(ret == 1, "Failed to parse i2c adapter number");
> +			closedir(device_dir);
> +			return i2c_adapter;
> +		}
> +	}
> +
> +	closedir(device_dir);
> +	return i2c_adapter;
> +}
> +
> +static void restore(int sig)
> +{
> +	/* Restore after survivability mode */
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +static void set_survivability_mode(int configfs_device_fd, bool value)
> +{
> +	igt_kmod_unbind("xe", bus_addr);
> +	igt_sysfs_set_boolean(configfs_device_fd, "survivability_mode", value);
> +	igt_kmod_bind("xe", bus_addr);
> +}
> +
> +/**
> + * SUBTEST: i2c-functionality
> + * Description: Validate i2c adapter functionality in survivability mode
> + */
> +static void test_i2c_functionality(int configfs_device_fd, struct pci_device *pci_xe)
> +{
> +	int i2c_adapter_before = 1, i2c_adapter_after;
> +	char path[PATH_MAX];
> +	int fd;
> +
> +	/* Check i2c adapter before survivability mode */
> +	i2c_adapter_before = find_i2c_adapter(pci_xe);
> +
> +	/* Enable survivability mode */
> +	set_survivability_mode(configfs_device_fd, true);
> +
> +	/* check presence of survivability mode sysfs */
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +
> +	fd = open(path, O_RDONLY);
> +	igt_assert_f(fd >= 0, "Survivability mode not set\n");
> +	close(fd);

Move this to separate function to avoid duplication

> +
> +	/* Check i2c adapter after survivability mode */
> +	i2c_adapter_after = find_i2c_adapter(pci_xe);
> +	if (i2c_adapter_before >= 0) {
> +		igt_assert_f(i2c_adapter_after >= 0,
> +			     "i2c adapter disappeared in survivability mode (was %d)",
> +			     i2c_adapter_before);

i2c not initialized


Thanks
Riana

> +	}
> +}
> +
> +static int create_device_configfs_group(int configfs_fd)
> +{
> +	mode_t mode = S_IRWXU | S_IRGRP | S_IXGRP | S_IROTH | S_IXOTH;
> +	int configfs_device_fd;
> +
> +	configfs_device_fd = igt_fs_create_dir(configfs_fd, bus_addr, mode);
> +	igt_assert(configfs_device_fd);
> +
> +	return configfs_device_fd;
> +}
> +
> +static void set_bus_addr(int fd)
> +{
> +	struct pci_device *pci_dev;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +}
> +
> +igt_main
> +{
> +	int fd, configfs_fd, configfs_device_fd;
> +	struct pci_device *pci_xe;
> +
> +	igt_fixture {
> +		fd = drm_open_driver(DRIVER_XE);
> +		pci_xe = igt_device_get_pci_device(fd);
> +		set_bus_addr(fd);
> +		configfs_fd = igt_configfs_open("xe");
> +		igt_require(configfs_fd != -1);
> +		configfs_device_fd = create_device_configfs_group(configfs_fd);
> +		igt_require(IS_BATTLEMAGE(intel_get_drm_devid(fd)));
> +	}
> +
> +	igt_describe("Validate i2c adapter functionality in survivability mode");
> +	igt_subtest("i2c-functionality") {
> +		igt_install_exit_handler(restore);
> +		test_i2c_functionality(configfs_device_fd, pci_xe);
> +	}
> +
> +	igt_fixture {
> +		igt_fs_remove_dir(configfs_fd, bus_addr);
> +		close(configfs_device_fd);
> +		close(configfs_fd);
> +		drm_close_driver(fd);
> +	}
> +}
> diff --git a/tests/meson.build b/tests/meson.build
> index 5c01c64e9..8f264d8e8 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -329,6 +329,7 @@ intel_xe_progs = [
>   	'xe_sriov_auto_provisioning',
>   	'xe_sriov_flr',
>   	'xe_sriov_scheduling',
> +	'xe_survivability',
>   	'xe_sysfs_defaults',
>   	'xe_sysfs_preempt_timeout',
>   	'xe_sysfs_scheduler',

