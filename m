Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04BD8C369BA
	for <igt-dev@archiver.kernel.org>; Wed, 16 Apr 2025 19:10:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796C910E068;
	Wed, 16 Apr 2025 19:10:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jMRS4Sp3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012D010E068
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Apr 2025 19:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744830646; x=1776366646;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ax5Fiy2cA1CNhyFJHS9+1Jug27p9lvpDlwNVrApIdn0=;
 b=jMRS4Sp3+qJNpSmTUMO8KJqQXhc7/tRoQ7AjT9E4KemSVkx3Y6tCTOqX
 FcgFV4NTtTG4m/J0YZikl4fawvvLl7RprBGUtnJkbmk2aKWhSyt3Cb0En
 MArKYTXi6Sf7dhgZRvldiYEMxQWJNCdkS3vHGhtrhDUsWrIPA3A8AKB64
 jByzJdIpu+X0ddDQ0QOiUBKhJMcr4nrhJDDjqCU8KjTmKJwcTwYHmhWhG
 2vYlj9sXQ19NtmLV2jd3vLeLIImvq6a3Ik2LS/X1+2Jf++lVrC6IoMni1
 oiGT1gVImauVqrCxn9u2o1ihnLu/DEzyuwa7HnApvhfPJyJPTNJywBkvT w==;
X-CSE-ConnectionGUID: QYk7i8t5RMSPPhfmnSNsWQ==
X-CSE-MsgGUID: adH82bGSRDCOp+dTgWXSvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="57769724"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="57769724"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:10:45 -0700
X-CSE-ConnectionGUID: iVF3U6v4TQqtrG+G5Kn36g==
X-CSE-MsgGUID: 1YLvvLdmRxeNLvn6Y4aD4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="135651113"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 12:10:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 16 Apr 2025 12:10:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 16 Apr 2025 12:10:44 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 16 Apr 2025 12:10:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H+yiwg0jsTWYd5dU8eoAZ3dIYVEavibbF3O6LOlm895VMglndHY1QfiybyUmubQpNbrFd67ZzAg45G5gr6tTAW2cEihADZEWPW48shFG26U2q5fjI+SUGaS7D/9VeaRU8stOMI5ewtyvTtLF855VDnisXOhWsw39hM2mHcZxjQFYRcjchG9pO0QPC5jVg6ZlwkraSWke0sGi3g2tDzTlQOiIY4TN8H4OWjVOG98FGGB6D8kPWSoZ87+AxMurvfFkKw43wE9f8eHs6lzv6tY2qcsu/OyWVQCrB0TzOla97gS0fPEQzEocqC7VUP/j+8oaOjFyQ1od//ryLSXZ5TAObQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b1QRPEvvaHKh7u2tSfS1B0WOqy6lCttYjMUrunRSXuA=;
 b=tSp1vgcE/cs71z7XtHJfbNHl3h4KZh5bWTnbT8GVuzkB1UbJIhCrBwoetOaTv/bKlZoR8CFujSPhMwW9niibWzaO8syFFr7yNISr6dP/powRYKmLDfK1aDbHRHJry6U/2RiZprSpdf/71WYpM1oHv0+yIFfaU5biLCHjr9pVHSHPXRF34/FBTz5VBegPNCvxtU2T1tlYdK8Z0lgzDdJ7e867OW4t3OyG9g+/U4xUX/Xk025IxrdLXBYl1jzpktnfuGDnXNlz4qOmXX7p30AirCHv+Y66cM9NdlkOHmGrBiH3o8T9JhB9StDu23z1iKpjUJWifEjHe7EbLXCjoo4QMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7717.namprd11.prod.outlook.com (2603:10b6:510:2b8::8)
 by MW6PR11MB8440.namprd11.prod.outlook.com (2603:10b6:303:242::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Wed, 16 Apr
 2025 19:10:41 +0000
Received: from PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848]) by PH7PR11MB7717.namprd11.prod.outlook.com
 ([fe80::a546:1ad2:2379:b848%7]) with mapi id 15.20.8632.025; Wed, 16 Apr 2025
 19:10:41 +0000
Message-ID: <58b6c688-b52c-4e28-9a64-c592d255a1f1@intel.com>
Date: Wed, 16 Apr 2025 12:10:40 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] lib/xe/spin: Use READ_ONCE, WRITE_ONCE macros in Xe spin
 library
To: Matthew Brost <matthew.brost@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250416161025.361516-1-matthew.brost@intel.com>
Content-Language: en-US
From: "Randhawa, Jagmeet" <jagmeet.randhawa@intel.com>
In-Reply-To: <20250416161025.361516-1-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0355.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::30) To PH7PR11MB7717.namprd11.prod.outlook.com
 (2603:10b6:510:2b8::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7717:EE_|MW6PR11MB8440:EE_
X-MS-Office365-Filtering-Correlation-Id: 88a863df-c9ba-4b70-91a1-08dd7d1a6122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0dFL3JLdHFEWXp3Szk0UlJGTGJoN3pSeEFaVHVxNWFrVmVnbmh0bmVERlhT?=
 =?utf-8?B?REZIaGQ4dERNbkg2WVJ5WnFwdmVXaU1Na1QvUzZxa2kwcnEwbi9laEY2RTdP?=
 =?utf-8?B?OUM1ZmlkbVNBRDhwZXhWam8yWmFaUWlVOUJlS21hOGhOOEkxQWovcG5SN3Q5?=
 =?utf-8?B?a1ZVZElzWWV2QmF3NnluVnZwVmVzR3M0VlZGQkozaGJjN0N5Q3o1c25JOGY3?=
 =?utf-8?B?NHdPVUU1WW96empkclAxQXdOKzZTM0pFTlhjcW4vVlJZalRSYjV0TjM5VHk4?=
 =?utf-8?B?dmdqemdjWDBXbUsvMFBZOEh1d1pSdTNpcFV2VWVTOFU3WWozOTk5OXNHRGt2?=
 =?utf-8?B?czcrMkJ6ZVIvUHpqMTkxTVZjeFJ3TkxBeC94OWV0ZWlSOFJFcnhqWEJ6VHE2?=
 =?utf-8?B?cVpGa3dqQnc4Ti9kNGNsc01FNWtjSFNHVGZXRFdBdmp0NE9NcEtBT282a3lG?=
 =?utf-8?B?bVFKY01kNy8vWDhuOUFzSkdEVnpXWTU3QkVycFMxbDUvajJrd01HV2dwRjdk?=
 =?utf-8?B?VGZxUUxFbGJIcER2WnhQOTdibTVpNmNOSDN0VGdjdnVQZEpCSW44M1k4aFp5?=
 =?utf-8?B?U2QyZHVxSXlHODRmU3BxNC9vWnpUdXZmNnpNVEwvNURHeDMwU3dXVGNXdTJC?=
 =?utf-8?B?R1NDbWJSb1BIL0FWQkF6NDhIZndqV2NOZGJ1YW9ETExIajRCSlNva3VtY0t6?=
 =?utf-8?B?NC94UWFGUk5JdzFCL2d5Z3hIL1JmVDdNZkdDSUI3U2FuMnhDRTJzKzRhWFAx?=
 =?utf-8?B?WExMa3dVQXBHUFhyY3V5R2xTWlpxcVpvWVVCblM1OTg2UmRQcjVBNDAwSnNI?=
 =?utf-8?B?cUNReFFqOTc0VzJKZUh4aGI5R2FqTzVGNm0vMHNkcThWdGJEbEMyMXpFK3lk?=
 =?utf-8?B?b1pIMk8vQjgrQnRISG1HZ0lrSGZNOWtKSzFhY2ZlOHBrQ1Q5SDJTS1J0Zks4?=
 =?utf-8?B?TXA1cHhlQzhvQkNLMmlZUm5tRHAzbEZkWTljOEdUQWVwSXJkaEpETzBkTGwr?=
 =?utf-8?B?Z2dwRkl1NDh4K2hrUlhWTUk0QkxtNHZZS0V5Q0pZV1hYaDg1dVJGa3lzL1N6?=
 =?utf-8?B?VytHL2ZmaU5jVjlQSWdvK2tMeG5ZUk5VOEo4UVZqazJEeGhWVHZqTmNyczc3?=
 =?utf-8?B?UjRVa1Jub1RmNkVGZjg1YVloTFlLWXBXbjU3Y1NiZzlIYnJjS3ZhOWZjRlU4?=
 =?utf-8?B?ZFllb2Z1blhKaFhNWS83QzJud3YrcFBwS2RWRnppL1BpcnRTeDhDdXV6am9o?=
 =?utf-8?B?NWdsK055cDAzaXd3SE1lcTRDOEx0NFhJc0IvTzAwWld1TjRrdzV6UDM1YmE5?=
 =?utf-8?B?KzBlc0hCWTIvOXB4RjF3OWw5b09sSGRJRmNFTk5EUzNVVVd5MVlnWUZWWlVZ?=
 =?utf-8?B?TDV4NzAycEFRb1FoV2s2UHk1bXdSdG92NUs1Zm5QYjVsWEZnbnFRQmd6NnYx?=
 =?utf-8?B?bzY5bXQ5TE5RbDkrU244ZHJkaDUyZzZPTThnMVBJbDZrSW9wUXJUOGFRbUkz?=
 =?utf-8?B?ZzdRMmxtMWNjWkxqbU41bHQ3MEFObHVsWkhTeHV0UzFpeFlONHFZS0l0TENs?=
 =?utf-8?B?WDdUU2V0VGxQeVRlajh2UzFZSnN5L09yUzZFRVdUUDZxWmRRamk0ZHVIeXls?=
 =?utf-8?B?em0yK3VDVDgzRmVNYXV5d1RZZFVmMGpiTXQ2RjV1WFZxaitGaUdkc2lNaFhT?=
 =?utf-8?B?Y0tlQ3krNzI5azBZV1RFQ0N4SkFKaFpaYzFxMG5USDN6UEx2c2R0RFQ0TUxq?=
 =?utf-8?B?MlYzVWg1QjAwajRRV0ptMFVoUkkyK3ZuVVpsOExpM3VDRkJOMW84UDhFVTQr?=
 =?utf-8?B?NmxBa0taVHVPMzU4eDFMTVJRTXc4NXAwRHFGSmY5UnBaV1diZ0ZoVjRBT084?=
 =?utf-8?B?MHhTeFhtdzFidFY5TnprQUZvbkcyVHJJWWZIVGh4MmNQZWJXM0h5QlBjamgv?=
 =?utf-8?Q?kCrAkkBZWOA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7717.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akIwU3I1YlE1MmtEQVd6a3oreHhGZGVicHpvRHgwSFlsd0JQUFUrdzVpVlly?=
 =?utf-8?B?WmhrU2NkeEVocmZONWNIbEJ4MXY0dHAza2VsazNRTkl3b1NRNmFrbkRBNHBw?=
 =?utf-8?B?b3dYSktwMjgxTDFFamZidy9zeG1pbG15WEVXN2NYd0lyaEtGV1YzQ0hNOVU1?=
 =?utf-8?B?bGtlTmNTbm5iZUFkL05hZjNOdU1tZ05xQTExOEZpaUovMXVYK09GRFFLQ21m?=
 =?utf-8?B?RmIwZlVMaGtaUkJXN09wMGVOYWZKS1dYRmRVTGhaaGljNWx3a3hiMTA2RW5B?=
 =?utf-8?B?N2hTY1RMRkJVTUdIQVdmZHU1TjgyczhmeDZQcUdoQ0F2OTEyLzNzdTBLdGwx?=
 =?utf-8?B?NXRMaC91UUlOeUllOHZrNlJ2bHJGUVc5dW1FTG12SXl5eW5yb1BHL04wMVZv?=
 =?utf-8?B?WWdOM2ZoK2dFSVNHaHRIWno2K01sRUJ6MUltNVF0dXhDQjlaRFd4Z2JzcENW?=
 =?utf-8?B?dmdWNGpPY1QydUVGQ0FXcnZHaHpEV2xHWVRWRlFVRnR0aUMwbnNNNDl2VVhG?=
 =?utf-8?B?MzVQWWlLZW5qZ0JVbEw3VXFNYis2NFRicnVta0RxWG1JbWZRT1dpWVRZQzdv?=
 =?utf-8?B?TEZ3SENEWmdXY202cExLbE5Tb3VtRWNsaHFlUU1GMnhtZmRMNllPU1pqMnJ6?=
 =?utf-8?B?dHdnbjN6bVJOVzJ1TE9adWpGTVlMTzRYWXBzZ05NcWdpRC9XbUlUS3cyY3p2?=
 =?utf-8?B?RU5GTFFoUTZ3eWFNaWI2WGVkU1ZGYUNWdU5UbFVGTTFoTnJZTTRzc0txczZY?=
 =?utf-8?B?aUlVTXdCMU90SC9ZbGNieDluQytMY0w5d0NqU0VWK2RWRjNQeGxBTUJRVEVw?=
 =?utf-8?B?U3ZkT2tYOS9XY3lxeHlCaVI4eHI3UHlHMmhMUVlralRVcUtydm5lSU02SkFl?=
 =?utf-8?B?b0E5bmlHQkNTQ2ZOTTBlUnhsOWN4WGdFd0l3enRKSEZrSytHZkR6UEhQMU1K?=
 =?utf-8?B?a2NLdE5LbjJlb1RHcjE0UXZ5MEpMSEtGekdhWVNaQ2JOODRUV0RIaVFJZEpC?=
 =?utf-8?B?eXBmWGlzbWZWdW5CNjJPcElTcDhYOEtqV1g1K3BGQmV3ZzBDMVczbGZONG9n?=
 =?utf-8?B?NWZJR04zNzQ4akVkU1liK0dQK29Fc0xxNWU2OUhWYmtwSzZDNWltVStBb0dW?=
 =?utf-8?B?RTFodGI4cnZUdE5uZVozWDJxT2l5OTc4cUgyVDdETWNPV0JJZ0ZYWUNTN1Rw?=
 =?utf-8?B?ZWRYOWY3YWZVa1cxL2VjTzFyM1d0TmYzSTQ5TGdtK0swNE1xdGhOUkNoWDc1?=
 =?utf-8?B?bUU2THB2cXM1SzMxZnpJZ1hBZEE5R1V3YnFnYlozL0oyV3B5RjZkMkt0UjNI?=
 =?utf-8?B?eVErRWQ0STF3eVNkQTQ4dDBiWC9NQjBFeXhaRmtKT2VGZmRiOUpHcWVickhH?=
 =?utf-8?B?WER3ajVGdTBsMm01QzI2MnA0VENONW4zSVF4dDliTXNPQ0VYci9TRG5FcTd6?=
 =?utf-8?B?WDZnNk4xQ1crWm1SZS9DSGdFakQ3RFlnNFBnQWNrSUZxcS82azVqQVIxMEFo?=
 =?utf-8?B?NzBOakhjYTIraHRlWlhQTWlIcSswTHhYTjk1dm5iR29mNUN0LzdLSHc0UTRn?=
 =?utf-8?B?bktkQVR1eitTTTZuSWh1V24zL2ZITlRmL0dyVkNRNHV2azlQQmk4V2Yyc0k1?=
 =?utf-8?B?SEFGUktXajNLZEVMVXRGN25BeTV3MlVhNGwxQXJCeWQrWWJuNmVkVU5CR0l6?=
 =?utf-8?B?MU5zNTg2WEQzRjhlTHcrV2RuaXlSR2FRQ3VZa2NnYXZVazlPUWkxNXJWZnJV?=
 =?utf-8?B?clhBV2dGdmdWaE45OElhRFVjZU9qdmpjd0loTGhKNVpqWDJ6Z0puMXZ1N2lB?=
 =?utf-8?B?bC9admtpb1U2TExwK09SWXVIcmxBRlpyQitQUmY5d3U2bnEyT1p3V2g0Wmpa?=
 =?utf-8?B?ZTloSE9xVEx0WEh4RGZBYWtJRkRCZjlZSnpwK1lFTFZGTisxTCt3YlpJV1JX?=
 =?utf-8?B?bmhoT2ZGV3VNd2Y1b0ZHMVlPMDhqYTFVdWIvOXh2a3lkNnZsRFBVdSttQmpu?=
 =?utf-8?B?RHZpM1Zqbm9jWG1DT1dSd3BMOEY5TjQwNFYwMWpZWEtKeTU1clk1bUkwU0Vr?=
 =?utf-8?B?Y3BvTjdqd2JLWWY0WGZ4NVViSHppRTdGMTVDbmRFbjJYTVdud3Z4dDNRMnEy?=
 =?utf-8?B?bFNDbERvNDN3TDcwanZRd0UyTWNTSGIxZWwzRjRDMnlzZkZRcnl5c2ZBdE51?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88a863df-c9ba-4b70-91a1-08dd7d1a6122
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 19:10:41.0303 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SGqwfHYsuJSwocARATVl/Eu9Y9BCrqL9wfHt2HQdjZNFr1jccf8oWg1wKrN9H12tNbqWoX4WZUy+h5kkmwKogT/mgwY65R9U8qEXX3OtGT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8440
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


On 4/16/2025 9:10 AM, Matthew Brost wrote:
> Without the READ_ONCE macro is xe_spin_started(), a compiler may choose
> to read the value of spin->start exactly once rather than every call of
> xe_spin_started(). If the initial read is before the GPU batch execution
> flips spin->start to a non-zero value, the test will hang forever. This
> was shown on Chrome.
>
> For uniformity, update xe_spin_end to use WRITE_ONCE too.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   lib/xe/xe_spin.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 0de0b1f2e9..65c29284aa 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -145,7 +145,7 @@ void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>    */
>   bool xe_spin_started(struct xe_spin *spin)
>   {
> -	return spin->start != 0;
> +	return READ_ONCE(spin->start) != 0;
>   }
>   
>   /**
> @@ -162,7 +162,7 @@ void xe_spin_wait_started(struct xe_spin *spin)
>   
>   void xe_spin_end(struct xe_spin *spin)
>   {
> -	spin->end = 0;
> +	WRITE_ONCE(spin->end, 0);
>   }
>   
>   /**
Reviewed-by: Jagmeet Randhawa <jagmeet.randhawa@intel.com>
