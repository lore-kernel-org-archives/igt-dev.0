Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F83FC282EC
	for <igt-dev@archiver.kernel.org>; Fri, 14 Mar 2025 08:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5CE910E34F;
	Fri, 14 Mar 2025 08:41:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VOUbdQ+y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66E8810E34F
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Mar 2025 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741941708; x=1773477708;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=1Up8zrNyP/ak5mZTnjn7RpaiPbCYkNd7tBLDwhB9yAc=;
 b=VOUbdQ+ykMxUMbZBMJSMkRFis+fvPoEC9ntpPO6VwC0VU9OAZl4dqt92
 ZsLcXduWIcoFimui27SfMvUYLxp8dfdJ6tonFVzoDY5R5MeaeBRNbi+Ol
 ZbiUzt6KB+8lKXuivDziyN8BbZocrRHQcekT9rp8sIf/khZ8WSL9B/Xvb
 Pl/ykTTwK2A3bzC0oNSklDrGZ7aoPaPoIsfGt+E7sqyTQL5IFdsAFmpuQ
 LfQz65v3JsCmvvxYeOl5sp8GgTKbovEeolBwOw945W7X5xCXtH9NBQxkl
 oEZqSRkSGdnyw8ok9MP7KKoQHmF/D8I1rRoTohEV+6f8Fb3PdNtQj3+wJ A==;
X-CSE-ConnectionGUID: lCHMeZX9SImTgWjXAea5IA==
X-CSE-MsgGUID: w92NI8eLQdiA+uxBhIScbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11372"; a="53738975"
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="53738975"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2025 01:41:48 -0700
X-CSE-ConnectionGUID: 0jWLSqR4QOaBBIdMNBZezQ==
X-CSE-MsgGUID: DYbUMDdXTXahrUiXXMGAzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,246,1736841600"; d="scan'208";a="126243265"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Mar 2025 01:41:46 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 14 Mar 2025 01:41:45 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 14 Mar 2025 01:41:45 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 14 Mar 2025 01:41:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NbHC8Uw8818AbTt3+yPD0asjuqK/1EnZZCqsEmHaEHKjxNFh2pv4NFKoLqR0dFu/Lp/iEZCW5wy8zrrd/Ejyi28f39WGx3FkHaO6wWNQgYEFpO+l1TL7ffo5Y0Z64UXKW12Qm1HLfV6cX32f/mqZaRzQgCbPAx/nIXvHwPOaOzsRE5eyqDlR82+ZDtiezkeqWmJSf/MygLdj2fvcVmsU6ExyXDyzQc7E0wspFGCxZOmFQc+A35Vz43H8aol8andXSifA7gcPCBoP2l+9Mj44a3M2sJKwtSRlRdjvt44ccKnz0P5C+2Dv/nlxJitzJLuiObFRnliYqYrp7gumjuQRDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/TO3sgT+InEgQBBJH8hjcDStZWN8Ic7ejdKxxFgy4hI=;
 b=P/VMPqVaiF3E1K7GIGPmHqTgQJTy4ZILUS121PEAOaqZ3peMdwjd4/4q3HnbHT0QyLikqTo0eioK4JA7BnNHqHB7H9UvYtvzaavarGDXR+zj1yxMVTK20H5DnnOC61lu83rCPKOkRGVJ2VIqdQvZmc3ewrj0HNnXnfhn9XrkiAPZ7gU6DsJJ2imVfBheSg7ZBuMBOvKXvBDxXbeLLfjUF2jwWPRqL3CUYTT6n5WH/bNmsRj7c+7OYNNR1LCP0T8wRRdSMSrpkyoLarOtuizFJzraQxEDuIIgGAxuefbwbrAnbeBmWU/4/Hr+kWnbQsDKFSCfiomwbbxjlwne0M4Ifg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by PH8PR11MB6803.namprd11.prod.outlook.com (2603:10b6:510:1cb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.28; Fri, 14 Mar
 2025 08:41:42 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%6]) with mapi id 15.20.8511.026; Fri, 14 Mar 2025
 08:41:42 +0000
Message-ID: <928e9288-da8a-4b74-a529-ffe5cfbd35ff@intel.com>
Date: Fri, 14 Mar 2025 14:11:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms: Fix documentation
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20250312084208.550521-1-swati2.sharma@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250312084208.550521-1-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MAXP287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:49::20) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|PH8PR11MB6803:EE_
X-MS-Office365-Filtering-Correlation-Id: 988efd3e-5deb-4094-e953-08dd62d40b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlFiY1BkNW5kQ3RGTndXQWRhSTV4d2FHdDloQ1ZVb1NuTmZoMm1qSnNKSnRW?=
 =?utf-8?B?RUxuUnVKRXJlbVJvR1BzMlhMRGs0bkZGMlZHM2NGVzlOMlY5WklKOUFSbzRp?=
 =?utf-8?B?eHQ3TWJUVGdLSnVZajR3ZXcyc2RZRXU4RzY1bC9EZnlxbm9TOFo5UmFGbTE0?=
 =?utf-8?B?K2x2emRFRThYUDZPd0tXSnU1SHFqeHR3QUJ0TDJneWdIa0JYQTRSZmFjVGNl?=
 =?utf-8?B?SkNTVkJONjJEYWNUWTdIMGZYZGczKyswK3RQSkRUZ251VWNEcE9RQzdrUFB2?=
 =?utf-8?B?UlNWVzFZYjRJVEZaY2VMT0F1L0Z4enIrSVV5T3FiOE05Z3lpcUxTM2xpeURJ?=
 =?utf-8?B?NGR1N08weUZNc1loeGhuN3Z6cUpqMS9wbUJuSDNuY1NRN0p1a254M2w3OUdm?=
 =?utf-8?B?STNjY2lLdWp1SldhWGlrdEZJNk4yclF3S1lkUUZkNFVYSXh2OTJkNWJEWG1z?=
 =?utf-8?B?L3hrcDM5NjZSSHlWbDJLTkdnUzArR29UUkZya2RtMUl3Y1N6bnRlM1ljQWpk?=
 =?utf-8?B?SkNYeERLQ1lkSUl2ZXBOU0dDS0xKOWY3K0dvd2h6VUNtYnMxR0VaMUIrTXdV?=
 =?utf-8?B?T3paN29PS0l2cWV2L0VhUTYvN0g0WDhLT1lWalN2UGs2bmgwS0E2V21jRHNx?=
 =?utf-8?B?dU9KMmt5NmFFVm80ZW1EOTEwQjVUTjErNndBaUdra2xXQ2pBSzUrUUJtSkpT?=
 =?utf-8?B?MFlabGc1amh0bzVEK1NucjhKNDllUWlzWkZyV2xUL0xFNXZHaFpxeVBKZDcw?=
 =?utf-8?B?cjRZQU1NdkNraWVaNTlRWDRtUW9meFNOU3B5clI2STRnS2g4TkI4WXlucEJN?=
 =?utf-8?B?Y0cwSitOYjVSRjA5RTlEQ05zWHB5L29DZ2d6UWZLMXYzV04yUjV0MzJKZXhD?=
 =?utf-8?B?SnphcWpNZTl0TzdkNmd6eXZqMERqaWhZMm1nOG94d0tKc1B1aS9YTXpYQUNw?=
 =?utf-8?B?UlN6RXVZelpEWURsMFQ1R2lJM2I0Uy9yeStaWHdvZzhHWmJMY3VrbU9HeE9G?=
 =?utf-8?B?VVUwaGpCUHpzWURtMEtmMzBZdnFNWUh5aER1d0tSSGl1OHBLcjhVUmlQbEk2?=
 =?utf-8?B?UXhUV1pyVE9zc3d0blVFS3hueGJOVjJQamN4QXRBWjFCV1dRa0lHS1pNZFli?=
 =?utf-8?B?Uko3OFl4TVN6YU1yT0hPR1JuUUZRYllyVCt6S0ZsUzlXdUpwc1JQOUZKb2x3?=
 =?utf-8?B?cE8zdzBKWFVwV29KcXhtMVVRckFpKzRuWmtxZENzTE1rZEtnUlJoangzYzZ4?=
 =?utf-8?B?aFhjZDlnRVhJY2JibHJxSzJ1R1pQOGlFVjhZWDhBZGRLcUpQa3FQMDU5Yktm?=
 =?utf-8?B?U1huRUFlQStMc0VIUTlsdDVUV1IxNzRFeDk2UVczd3ZtazlmeHl4eFl3R3Vj?=
 =?utf-8?B?NmRMaFdweTlPMG5qeUxSOWRtL0RTQTZsT2NXL1ViVmx0L0FhT3lKTGV4NUNI?=
 =?utf-8?B?a0xvaE9jQmFZNWhrSzRiZmY5T0djeXdjV1A0TWc5L1NkWjJFOFgwcFlndGVX?=
 =?utf-8?B?Z3BrcG41dWpLN0FNRkEzZll5MjNZM0dJOHVtRTRZSThuaGRha1ZtcXdJRElJ?=
 =?utf-8?B?Yjc5RXI2RDFqK2R2N0EyR0ltcE5vck90OTZGdDVqSzlkUy9ka2NHS1p2Q2FC?=
 =?utf-8?B?Y2tqajQ1M2VIQ0dBQ2VyS3BvRWhzT2xZTGNwM016c0l1WkZaV0pZeXlDbWlh?=
 =?utf-8?B?Z25YQVh5MGh4bDN2YkNvVThLYVBpaTFvamlhTHRyYjFqUENqRjJmeVNhL2Y2?=
 =?utf-8?B?THhyNm56bEtBRnJScFJKdjJoZm9GYkxhdkZHYzRMbU5nVldrZ2ZZdDBzczJo?=
 =?utf-8?B?WWxJNzZRUkdPODZSS3ZVb3M1VXhib01NNWlXTHlPbzlRZkYwL2V0aHBWVmhX?=
 =?utf-8?Q?vo08BK/Oq0cUV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L20rWTVjb2FEQTF1bW1EK0NSY0dMMXo2MlN4RUJqU1QvYWNjeU5Mb2FkWnh0?=
 =?utf-8?B?bSs0eVFLYTBnejk3UVJWbVc4WWMxUFJKc0IxVm1UaXd0NmZZWk5QcFN5VjZp?=
 =?utf-8?B?cjIrM0tsYVpLdkFNU21rS2FCdzRIMW9mRGNBVThMbllEYVZNdnlpTk9MKzJN?=
 =?utf-8?B?VDBadjVnMktkTTMzb250MlNveTdNUnNWWE1BM3BudURodnJwaFR0eXVXTkJO?=
 =?utf-8?B?K0Npa29IVFlmMW9HSnBPSUlHUXpUSDdUZGtob1VqdXF4V2MrVUtOL2pRWVZ2?=
 =?utf-8?B?c2lNZlVWNTlQdW5YNG53MVJleEJlWjFIL25aaXZVeUFOUEtlV0NQdDhQOTM5?=
 =?utf-8?B?b1FxYnhpL0xNUWVBUndTcWRNeFZnUzBmYTl5RGtiYVk3LzZGeUU4OG82UEhy?=
 =?utf-8?B?Vy9VdFFEaDFWaFBOV1Y1WkRBVndGdldRWXFqWGdZQUNCVWJ1Y3ZGQmN6M3lK?=
 =?utf-8?B?YVVRS0kvalRZUlRsZ3E0bGRFY0I5UWthVU5EeGlDRE4yeVZmTytMcnhpL3FN?=
 =?utf-8?B?MTRZMEpqQXRReDY3VFFRcVVQTzB5a3JOYUt2RkZmNmpKSEd5MDM0bGpkNXEy?=
 =?utf-8?B?a3BwVjg1K2RKckx5dmpoZjQ2ZTVzMERGTElETUVHMjlzc2NYNnd5dndlU2Rh?=
 =?utf-8?B?c20vMVlndmk3ckZGY1dBWi9scHlVTVAweVVINXEreWFoNGV1TDNQVHRqdWRU?=
 =?utf-8?B?U0dYSFRuRFU4cXE3V2YwbUxicjVNQnFZSUptalN4ZU1mZkI0K25NWG1NSFAz?=
 =?utf-8?B?UEtrUklRdVp6bVFyVXc5UE90MS9WL0ptWit3TitQczNZTlMxZ1Vlc20wWnEy?=
 =?utf-8?B?T01WYkZrZGtwS05DRlVTcDRTNlNSeWh4dEV1Zi8wZmtrZXM5dUk4ZUg1b2JX?=
 =?utf-8?B?UDBOTFFmT3dFWUZyWktwdmtURmd3dnpKQ2ttR1lPV1VoVXY1UEszdHRoV0V6?=
 =?utf-8?B?c09TR0RXbzU4OWI3ZTAxbE04SUs3NG8yKzdKcHl2UlFFMzFPRFZkUUZvb0Fn?=
 =?utf-8?B?Zlp3OGttYVdkM0VrcHJHb295SlZsYTlTdldNT2IyakJ5K0JtL2s4dGs1TjFD?=
 =?utf-8?B?ajNNR3NTVEh1Mi9wa2R3aVlxOTNQYTloUE5jaXVhZkV4Mkk0NkFIT3loaEp1?=
 =?utf-8?B?MXlXbS9tbHN4SXpMZ01ONnpkQ2F3YWlNeHlxNFV6WU9ZZkNYYXJmckhyamda?=
 =?utf-8?B?UnlPMHpBNGNWczMvZCtweW03cnloVG82VjZ3RlFqNFcxODRYSjlTZW90M0pL?=
 =?utf-8?B?cmpHWEVTaWF0Zi9xS0N0REtkSHVPY0YyV0tMRjJYUUkzY2lrZHN4QlRhNlhr?=
 =?utf-8?B?OXUxR2l0QmlUenVTWVFwZjc0TU9tL01pWHJHY0lGMmRXVjdlcEsvc1lMVmtT?=
 =?utf-8?B?aUYxUTZYN25xeExxQzBqVlBncFFaMHA1anRkSGFZRTRQZEVYMU5qMXYwV1hM?=
 =?utf-8?B?UC9SRVVlNkxlM2IxMU5TWGp5dkNDV1lLcngzVTN1d2cxQzhqaWg2ZkVmSEtl?=
 =?utf-8?B?UVg4bHN0UWgxY2RmS1IxUW5BbDNvNWZVWU02dHFNaUxSekJyWVgrM3l0OCtL?=
 =?utf-8?B?c2pCSVp2b2hpc3dHZ1pXVVRvYmpyc280c1BGMHVlUWl1MndqRTZWTUdoUUlx?=
 =?utf-8?B?VXlsNVBpU3lwYmxWcENQOEVnMnZCYTNtYXIzUVNLUWhXQmZoc1N3TzdaWk9o?=
 =?utf-8?B?SkVrU0tYMjgwNjh5Q1JVd2Qrc0pLTU0xQ2I3V0ROSE1raDArNGZpcG13WWtR?=
 =?utf-8?B?WHBJMUZhVXVRWlN5YnhtV2JjWlgxckZ3b0VkVEtjOEhjenJseXNWZ2QwT2p6?=
 =?utf-8?B?UkY0cElRRTJXbXNrbFRySkVRdXNTaVpsR051SGd1T1RsZkxvdWFudW5MZkU5?=
 =?utf-8?B?UW1CanRzL3NaZCtjeC9NZ254U1JyVURRSy9jYk85aVFtdy9pdzRqTnRNTy9I?=
 =?utf-8?B?SXpxRFpuSGRDek9seGRVSGlucjdDdUgwaU12RXRTL2lGWDREd1pFb2hLSlgx?=
 =?utf-8?B?TmZMaTYxb1RWbHVnYXpQUmtZVmpqL2JpaVpIaTBlR1kxdmJyQlF3SjQzY2pM?=
 =?utf-8?B?MWppQnhYQmw1dWJEd05mR2s2WDR2RllaQ0lncW13NnlrU2ZBVTZ4K29iZENi?=
 =?utf-8?Q?wy/+74+3wz8UQ/xGk/F0NCXk3?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 988efd3e-5deb-4094-e953-08dd62d40b07
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2025 08:41:41.8412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHN6Tb0/y/S5uEEO9U0fGm0SgjWDNy8GNMCaG2WNH+7+yjEv5yEWEf7GdPbi/9Kdtp0qXu0QCZTm3j14xEN5Ag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6803
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


On 3/12/2025 2:12 PM, Swati Sharma wrote:
> Missed few KMS binaries, drop 'Functionality' and 'Test category'
> from them too.
>
> Fixes: 25039689b609 ("tests/kms: Drop 'Functionality' and 'Test category' from
> documentation")
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_psr2_su.c   | 3 ---
>   tests/kms_prime.c           | 3 ---
>   tests/kms_rmfb.c            | 2 --
>   tests/kms_universal_plane.c | 3 ---
>   4 files changed, 11 deletions(-)
>
> diff --git a/tests/intel/kms_psr2_su.c b/tests/intel/kms_psr2_su.c
> index 0099daf1d..e9bc6f6c6 100644
> --- a/tests/intel/kms_psr2_su.c
> +++ b/tests/intel/kms_psr2_su.c
> @@ -28,7 +28,6 @@
>    * Description: Test PSR2 selective update
>    * Driver requirement: i915, xe
>    * Mega feature: PSR
> - * Test category: functionality test
>    */
>   
>   #include "igt.h"
> @@ -43,11 +42,9 @@
>   /**
>    * SUBTEST: frontbuffer-XRGB8888
>    * Description: Test that selective update works when screen changes
> - * Functionality: fbt, psr2, selective_update
>    *
>    * SUBTEST: page_flip-%s
>    * Description: Test the selective update with %arg[1] when screen changes
> - * Functionality: pixel_formats, psr2, selective_update
>    *
>    * arg[1]:
>    *
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 7f46c6842..1d011327c 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -26,9 +26,7 @@
>    * Category: Display
>    * Description: Prime tests, focusing on KMS side
>    * Driver requirement: i915, xe
> - * Functionality: hybrid, kms_gem_interop
>    * Mega feature: General Display Features
> - * Test category: functionality test
>    */
>   
>   #include "igt.h"
> @@ -51,7 +49,6 @@
>    * SUBTEST: basic-crc-%s
>    * Description: Make a dumb color buffer, export to another device and compare
>    *              the CRCs with a buffer native to that device
> - * Functionality: crc, hybrid, kms_gem_interop
>    *
>    * arg[1]:
>    *
> diff --git a/tests/kms_rmfb.c b/tests/kms_rmfb.c
> index e4203bdd4..acda4b528 100644
> --- a/tests/kms_rmfb.c
> +++ b/tests/kms_rmfb.c
> @@ -27,9 +27,7 @@
>    * Description: This tests rmfb and close-fd behavior. In these cases the
>    *              framebuffers should be removed from the crtc.
>    * Driver requirement: i915, xe
> - * Functionality: kms_gem_interop
>    * Mega feature: General Display Features
> - * Test category: functionality test
>    */
>   
>   #include "igt.h"
> diff --git a/tests/kms_universal_plane.c b/tests/kms_universal_plane.c
> index 7e80b1389..8e0b4dda0 100644
> --- a/tests/kms_universal_plane.c
> +++ b/tests/kms_universal_plane.c
> @@ -26,9 +26,7 @@
>    * Category: Display
>    * Description: Check pageflip & modeset on universal plane
>    * Driver requirement: i915, xe
> - * Functionality: plane
>    * Mega feature: General Display Features
> - * Test category: functionality test
>    */
>   
>   #include "igt.h"
> @@ -41,7 +39,6 @@
>   /**
>    * SUBTEST: cursor-fb-leak
>    * Description: Check for cursor leaks after performing cursor operations
> - * Functionality: cursor, plane
>    *
>    * SUBTEST: disable-primary-vs-flip
>    * Description: Check pageflips while primary plane is disabled before IOCTL or
