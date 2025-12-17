Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 452F6D6552B
	for <igt-dev@archiver.kernel.org>; Wed, 17 Dec 2025 09:57:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BC010EC04;
	Wed, 17 Dec 2025 09:57:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aOON/t28";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D939110EBFD
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Dec 2025 09:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765965427; x=1797501427;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Zec8y84EgBU9qsjfvdLni6kmy3YZ0dlyON1Qh5QJ+xM=;
 b=aOON/t28nRtbDWJoRavLRpNA6ZvSrb/V6WwZfLh5qtXvqIL7Lc0T0ySf
 IjR7X99RgKLeMRn0bePWKGjXttMG9L1hj46cd7/ShEnbsyMQz7Buk1vTv
 H2dfv6Wv6/kOkQr8I8mOf6XNBIe6w2o2zWNFDGqDU1iFNc052hTZVd8ol
 l/7vshk5V9WCWisRi6Edcq7GzR3/MicblMn6cTj4tKnFJjepDR87odhmm
 1VnjZRx1BARjJZ7H6W+7eZGLmru5y4jmex8IElqT+t1RdBxzrFwr9iDSe
 2clHSPG7G3GcfEocXxnmRC0B6FEbuzPry+nH+diaanq9uKmOnBkhu4WIR g==;
X-CSE-ConnectionGUID: ZEfLwaNNQqKCqrnut+i3aA==
X-CSE-MsgGUID: EZCjq+mgRquklgojwQgulQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67940904"
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="67940904"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:57:07 -0800
X-CSE-ConnectionGUID: hVU3zK/CSm+ygockjG0tVg==
X-CSE-MsgGUID: 5ssby0NhSLCne2najMygdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,155,1763452800"; d="scan'208";a="198259836"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 01:57:06 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 01:57:06 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 01:57:06 -0800
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.67)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 01:56:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bto5O1/7FAHcnPUGhTFaxcTZGR4JUXoSSh0V6vSEXau3z9bSCFsCkhoiO3coGdl+R7Zh8rR+MATqh5pMD0rPY4BxpFONRcMj5hUg5rAtamyIR0aP3nslfpUgYImwa9hOiUrKV4EOSzB1If+iUYqWDFfII2mAsvTUQ0vspW/2Sw6JiCo9arOWLGfkKwAAjS/5o+i/jE+qluDInvCy1pgtUUPPYzrWIgWnwAH2xgvAldhIvy+noPgFlSRtSkXebBnk60muAsHuFtnWUYsyDRVIGOPwJVvR6h2vhD2fr6hlYU2Rdmcw7Bm2dNr4gJEVqmb8WWSssrgs8FHh665XBFZJ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WOgxEEuoVIatbbnvL+BKp4nPIx9tw5A+9I477kKqpF0=;
 b=HlEllWKRWQDpcSDgPCIUySHyQss3mUQaQLRju0eg4Qk+j231qJG49JFcrW3FXfgGTigFB1akTVSF/1sajvZgQvdaRASx9TZGsSPk/IN5IrEnMkAb4VXRq52wdOYyS+IIw2/mYo8YcfebMTxzUCP4jFlx7IKyiLOiTTXqQ2DbtWQatRp2fmkZg/N0+BloZ00xIhw83LHapRbaODgOXHdXyQrBODWNqZQ2bBq0ptNTfGa2SovFZAMLZg4q16A9Tszeu9OjQ6sTGJgMhGdqpuEB9wFa6175kLT0pomOndA0m+MIWWcaop33Lj3WKeIoHDzXKPe8ZV73nboCPmadOdH61Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 09:56:20 +0000
Received: from PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2]) by PH7PR11MB8252.namprd11.prod.outlook.com
 ([fe80::9f66:9d6f:3199:78b2%3]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 09:56:19 +0000
Message-ID: <ee5f9c83-0199-4977-ab99-61de463ca1f4@intel.com>
Date: Wed, 17 Dec 2025 15:26:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/1] tests/i915_pm_rps: Improve error reporting for
 sysfs write failures
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>
References: <20251215132132.1195570-3-mallesh.koujalagi@intel.com>
 <20251215132132.1195570-4-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20251215132132.1195570-4-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0103.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d1::7) To PH7PR11MB8252.namprd11.prod.outlook.com
 (2603:10b6:510:1aa::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB8252:EE_|SJ0PR11MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 423c44fb-cfbb-4ee2-686d-08de3d5286f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlBiQVl1L1BacXE0TVBEamJzejFNTFJkSTdXOVREMVI1aXBoK01aWFRTbHZZ?=
 =?utf-8?B?UEk4dUV5d3l0cGZ4MXhNeHBrbEpUOW5Ya0Y5UUFhWDEzclh3RkVveUo2UHdQ?=
 =?utf-8?B?WUUxempTUHo5a09WK3V3NzgwWnpSV2E3R0hMNDZ5OWU1Uk1MRFQ3M3BtOTdR?=
 =?utf-8?B?UEdxNGtzZDR1TEhrZFhoNmUrR1FxeE1YbklqeUZMcHlxbW9QamhKQnQ1MzAz?=
 =?utf-8?B?SW5uRlYxa0UrNWFXdFE5NFYxMWVzQ1AxU1lRbi9jcmtlQXIySGp1THR4SERK?=
 =?utf-8?B?TXhNMEE5TzgzN2hRa2dLNmNMNUR0dTltcVBOLytzUUF3OXBvYXJDMFc3djNR?=
 =?utf-8?B?R0tjN3VVemJiYnZmNmZsVUhkM1NwRzJ3S2ZDa2VEa1lQSVNncUNkeVJTVHVG?=
 =?utf-8?B?d1RmMGMyZGFqRWxjZHBHc3QwRFZYeFR1WTZXNmpJSllaRlhDZWIvS1Z1MjV6?=
 =?utf-8?B?Rld3MlFMZlF6MTNGaFVvNytUdXFUZE0rV29qRURPMitsODlSeWQ3RVMxQUpR?=
 =?utf-8?B?UFgvOWVIa3RQVmFkZkpQdExHVy93SFMwK2VxcE8vbTBSWlErNVBmbkFnOEtn?=
 =?utf-8?B?aWJYRkE1TlU5Uy9pL2s1bjZqMWpDUTR0WEpOUEx1Q1drdjlOVEIrdStQTVBy?=
 =?utf-8?B?bXk5R3Z2UXV4SmpFSzNhSncrTnVTaytQOVhCbTVRYlV1SloreGR3SGdueDVQ?=
 =?utf-8?B?U0JZWEdneGtxVFZCbi94a043cEN4TUkrRXlaQUo0T2ZnbFJLTDdleDBobGVL?=
 =?utf-8?B?MVJ3RmNRNldLc05mWHpaTmN3amF4RlZHSDZSWkdYY0JjSnZmTU5PMWsva3Jt?=
 =?utf-8?B?amVSV3o5K2VsUmlBYUVOR1dsdTBoY09Ebm5ITVgyMXhwY0Z0bmljN25VbkQ2?=
 =?utf-8?B?eTVZSnNBRXd3Wm4xK05WZzRETS9Wb3FaaUlrd3NMV2xrL0IwZ3ZvMFkwMDgz?=
 =?utf-8?B?eml3YmxOQTN1dGthMXJETUVSVk9pcUE5aHdKRDM5M2hneGNReUQzckVMY3Na?=
 =?utf-8?B?RHI4bEhjSmF4MUpJWWRPRkM1MTZ5QlhWWkNVYzA2WDF2T0pTQytDYmZLbHdN?=
 =?utf-8?B?Z1RxNjlWNGtOcHhkY3lVMzFrcEFqN0dVOFBCM1RRdEhTYk5EWFBPeVBjNWd1?=
 =?utf-8?B?eE1ac21pclEwalJ4enRhODVCS1ZLWXZ5Q3lPUkhUOTNIY0FiMkI0aVB4eUt4?=
 =?utf-8?B?R2tZT0Urcy8zd29Wczl0aEdFMTFGWTgzWEExb0FWL3cwbEZRUmZIbUZZWWFW?=
 =?utf-8?B?T3hWcWFVdm5sVS96bnlOYlM5ZHM1M1M3bFkwWGhsaDBzRU84NkZZdUdYRkdk?=
 =?utf-8?B?eFBjMVRzdnpNZ0ticENZMnVvVDhNTUJaeGg0cGV1N1BHdndJMlRzQmhSR2N1?=
 =?utf-8?B?OWQxM1dHUjFIejdoNmZiSEptM3RNQ25NMW1hUlpCeUdtR2tvODNhZDFoc0Zu?=
 =?utf-8?B?alFTZFhxaWR0RThPRUxiZE16U1BlMldBcEdCVlU4QWhwUFQ5YXJvWG9SbSti?=
 =?utf-8?B?OVE4cjRFU2RsY2dLWnl0eEplYVV4VGNjTWo2NjhaRDJaQXpQS1p0R0hRV2x4?=
 =?utf-8?B?V1NQK0hFcjB4czg2YTFabTViVE8xV21JS2Rsb1h1ZzJJNGk4UVE0ZG1STy9u?=
 =?utf-8?B?czcxMXVSRjRaSEwvL2xva0RxbE1OL280RU1CWStyYS9ud0pRZ3pBdWMvQlB4?=
 =?utf-8?B?TUp4dGdUdmVBTEVNMlhycnFqU1R1THM4bkpuOEx4SzErVkdCdWhNMjdMZjJC?=
 =?utf-8?B?d0lhQ3B4SzdaMkFBS2hGazFDa2hQR1BuTFZuTW1sa3JBc1RFYjVVUU9qczJm?=
 =?utf-8?B?bTNqWHliTXVwdUVKTitTVmdUM2dUWXRFSlFIRG1XcnJrVHZraXhjeE40YjZl?=
 =?utf-8?B?WHVDaWVvK1ByWTh6K1laZXBNdWFsWVBaU2VUMVB3QnZVTElVaGVncVJHYnVo?=
 =?utf-8?Q?6hYFXrCiUReCCbiecOourK6c8gDW5IjF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB8252.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkY0eWxkbHBZMCtMRU54eXRWSFc0cFVLL3BxRkk5SS9BVDU5WUxyNHp3Z0Ns?=
 =?utf-8?B?ZEhMWG9JYXdxK2lRNWhnbzl3TFFrRGxLazVhKys5REZ5cDlzUjlyS2pNMm5Y?=
 =?utf-8?B?ajJiKzdYd1hmcFhCRWRheDlUMU1SYnhYdVZPQnJOb0pMYzJqQUY3RVMvVE96?=
 =?utf-8?B?bjUyTzZrNFptN0FsakZ2UkwxckRoN2EwbHkxSW9xVzRUWVVDQ25oY0JrYTZu?=
 =?utf-8?B?UGN6YlFsQmx6bGlvaE9IR2JaSXI4UmluK20wOGhaMGJyc3pQeEVnT3dzRkFQ?=
 =?utf-8?B?RGlwWkhZaERiTGExaFhWTEZSVEVPTG1rSlJZbzZJNnQ1WU9sckk1SjlNbEtr?=
 =?utf-8?B?K0NhYnVvdG4xMUk5bHdJeFUzajFSMXpacWlNODNoVlkyTHJxZTJHNy9qUkEr?=
 =?utf-8?B?c2NEYXR1ckYyVXpGOVlKYXZnLzZJS0dBVHZWUjNOUTNPWUlTd0JYcnZER2Iw?=
 =?utf-8?B?KzI3MDlYM2xMVlZPcGEzRVJpY2UzYXlvek1CUlU2U1BtVHhGbzRCQTcycXMv?=
 =?utf-8?B?eGZvMTlzbXAySW9OMEtucDYwMGZJYUx2anUvUnJxSXlGakZRZHJFTmRMUldF?=
 =?utf-8?B?VEphbzFJSzJTNkRpcmRpeVF1MU1jS0l3Y3NTVTNlU3k2V2FVMkNLLzY3emJh?=
 =?utf-8?B?QVpmN1hyb0swN3pjL1BGV3JIQWx0T3VoOHNyUnloaFVxeUR3ZmFvdG83MXNx?=
 =?utf-8?B?WGJvMXl2TjRjaTRsODA0TnNjZUovWkttaVN4RWsyR1BTcG16dlZVTjlYU0tQ?=
 =?utf-8?B?elBRdjBGa3M5RTljUXRuU3Rzc3hjTWVBRmdQWVlnaEtNY2JxMGtpbzVDcFFj?=
 =?utf-8?B?UEFuYUhtN3ZJOFNURXFyMTI0S203TlcxM2s4RW01Y1NLcGFpSEN5MmtTbUhG?=
 =?utf-8?B?aXhFSjZvc21Ec1ZKTzZRME10bjBjZmhDSDFjSU5RRUl2dmt5ak5MVWNCcW9Q?=
 =?utf-8?B?WmUvMkNCcERiODNHNmJTUjZINlk0RVZ1Q2pXbXg4Q2FrS0twWCt5NFA4NnVq?=
 =?utf-8?B?a3FiUG1CUEZ2MlUyaWt2enlQSEJUT0hxbGVGQXlYeXZXUEZPdVd4M2s4OGZt?=
 =?utf-8?B?SHQxQVBkaldmKzBVMnNOMzZXdzRpQ09ndTJ2Y0V2UWkrOFlyYk1uMmMvbmM5?=
 =?utf-8?B?cVNVdEpkUEIwRXg4N29GaXZDWjVNMUppWjY0OFMwTlRreGk0dVhER1BTZVNL?=
 =?utf-8?B?VDcreWMxY1BZckg0akh1ajd2QzVFWnd3aFVydEtldDRXWlhrODl1Z0tDaXVN?=
 =?utf-8?B?UnFQczRURWwvR0RERXlvQSs5aUpZYkZtMGFMNkJyejVkUVpXS0xITmtLR04r?=
 =?utf-8?B?bFYwbmFNY3NDcUxaVHVOQm5UemxXVjNxaTVzc3Q1YXp1Zks2TVF0dUphenVB?=
 =?utf-8?B?WnpDQ1lVUzM1ZnUrTWcyUlhtSFJRYTAxQXdPV1lNQVpuNUVWVE1sdGhpaVRs?=
 =?utf-8?B?blBiRXc5b2ZpZDFsRFZBam0zM0tYUHU3bUl4QjlEUW1Zdk1ac1RFT09FV3VY?=
 =?utf-8?B?VUc1KzZZenBWT09IdWhtUEo5Um84dXljV1JBMTltNWV2T2F3TlI3eUlJZjZv?=
 =?utf-8?B?MWhEd0RPdi9ZSTFnTlh1K28yUE92RkdlclNGdC9HRkVuWW90dTJjTTVPQkQz?=
 =?utf-8?B?Z25xMUdOT2cySTFIM3VXK3JsUlNmbXRBYUozWkpSUGJpem43TU9IdzR0cnVP?=
 =?utf-8?B?eVNYNW5jamVWb3pxRFcwckNZMlFyeVY0cURqSEJRalk5aEFydHRac1Y0MzlS?=
 =?utf-8?B?L0FjbjgyQ2Z2V3pURHJsbHRPUEltNWhoU2tBR0YrMHhUUTV4aGJFVVB3czJm?=
 =?utf-8?B?ZHRJZDV0WlI2ZDdZOGZNV3htK2NTTk1VN24ySkd6SkR1YWVObWd3RmpZRVNz?=
 =?utf-8?B?UkJhcnRQY2Qwd0wzMjl2NlJuTE5yeFFKMXlPam0vWnlrQXpjTDNKK0ZOMWJj?=
 =?utf-8?B?eWg4Tkw1L2hyK3J3Z1ZhbUF0Q1JucHFOam8yNndra1ZIM0RmTnlydVNMM3VC?=
 =?utf-8?B?YW1ncjVsbDZWNlpsZFdQNWNVeFROYmxRMzkrcitXVkt3NXIyQTJTY0tJUita?=
 =?utf-8?B?YjZvM0pCeDdCZ0IvOHhyVVlZN21kZGcxOGQ3ZmJNNUxqUVBIOTd6MnJLR05T?=
 =?utf-8?Q?TAdahlkCtFICD/tuWQ945iWWz?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 423c44fb-cfbb-4ee2-686d-08de3d5286f2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB8252.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 09:56:19.6945 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVp2DCJ0pNbMzepYnYb2ZXPflxPdICMYlbVBS5yDD1NMLrtxQ7QUFPp17T/o7eL/kNdqVWqui48qptWI9hZTbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
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

Hi Mallesh,

On 15-12-2025 06:51 pm, Mallesh Koujalagi wrote:
> Add detailed error logging when writing to RPS sysfs files fails.
> This helps diagnose issues where frequency writes are rejected by
> the kernel, particularly after events like GPU resets or during
> frequency transistions.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   tests/intel/i915_pm_rps.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
>
> diff --git a/tests/intel/i915_pm_rps.c b/tests/intel/i915_pm_rps.c
> index f97a716be..02c807399 100644
> --- a/tests/intel/i915_pm_rps.c
> +++ b/tests/intel/i915_pm_rps.c
> @@ -201,6 +201,15 @@ static void wait_freq_settle(int gt_id)
>   	}
>   }
>   
> +static const char *get_sysfs_filename(FILE *filp, int gt_id)
> +{
> +	for (int i = 0; i < NUMFREQ; i++) {
> +		if (sysfs_files[gt_id][i].filp == filp)
> +			return sysfs_files[gt_id][i].name;
> +	}
> +	return "unknown";
> +}
> +
>   static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int gt_id)
>   {
>   	int ret, orig;
> @@ -217,7 +226,10 @@ static int do_writeval(FILE *filp, int val, int lerrno, bool readback_check, int
>   	} else {
>   		if (ret < 0) {
>   			int freqs[NUMFREQ];
> +			const char *filename = get_sysfs_filename(filp, gt_id);
>   
> +			igt_warn("GT%d: Failed to write rps_%s_freq_mhz with value %d, errno=%d (%s)\n",
> +				 gt_id, filename, val, errno, strerror(errno));
>   			read_freqs(freqs, gt_id);
>   			dump(freqs, gt_id);
>   		}
I’m concerned this might not fully resolve the failure scenario. For 
instance, if min > max, the system will return a failure along with the 
target value and sysfs details, but we won’t know whether max was modified.
My suggestion is to print all sysfs values when a failure occurs. 
Additionally, there’s a sysfs path that contains the default 
values—consider comparing the current values against those defaults.


Thanks,

Anirban

