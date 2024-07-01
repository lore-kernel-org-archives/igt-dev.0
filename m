Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93419C2BD09
	for <igt-dev@archiver.kernel.org>; Mon,  1 Jul 2024 16:27:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D68410E4A2;
	Mon,  1 Jul 2024 16:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvAcpbO5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B29010E4A2
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Jul 2024 16:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719851268; x=1751387268;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xwVHyh02ZfX74lgf3eGsvzO26O62wkNvORogjxeM27M=;
 b=RvAcpbO5Q6VugEfJ852+eLnTh0xTquMnEUIdLf1qtlRmAXtAIKF28WeR
 xr0BOaTKdlhJA6Pm7w3ITGq9rBrQC55XDoZ1bxQmwBU01EQ9qtJ5nMJmn
 MFxvEFbrGh9MKRP1ITeYWvkO0QfgDj6LvFNe1Q3pNHXDwZ7xgg+YcThLS
 8jTDAbJpwOnDtbLgi7TRpvMTM/BolsTCY/HGS8VKtxk1wU6krAy3/cW6i
 a1y4rr6g5iDrlyVQg77pgSeYHBesGqv08jFRSv2xtJIruNGfFcbTzkr2Q
 1a1Np8L1s2SBMqTa9YWm3qJ6a0d2lFBJEBYxXdcw+qPzTkw5JeW2gFpQc Q==;
X-CSE-ConnectionGUID: CP15CJx6S2S6e3m9joJJBQ==
X-CSE-MsgGUID: EGGBscoiRRS94RNSBRaIxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11120"; a="28120059"
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="28120059"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2024 09:27:48 -0700
X-CSE-ConnectionGUID: hg5anlDQTQKuutZaxGGjMw==
X-CSE-MsgGUID: WkmU6BddS5Sqt2TfYt9LgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,176,1716274800"; d="scan'208";a="46318340"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Jul 2024 09:27:48 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 1 Jul 2024 09:27:47 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 1 Jul 2024 09:27:47 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 1 Jul 2024 09:27:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=REmgPnuKt/BJuhRJV0w+b8sWIh2bhYm7m/QoAFrY4IvBAfQdRFeH4qcWwl33gYruF9yl9kgSrFMs6R6xkrPuNKHMxr7dmqcGXFl5pEJGtvtjPuw+yjsxkv1cizNkdw95gzBRg6yOmn8HwD1uuMUXhqxB88I+oajSSESxOodyB8q+Ipy8OnYwBwDyP/wMmSIbc26q2WJXAXuTcppwUIwhSNDLCpW+6CGlHIsZpvqAOMGxCZQHYWpTriPsN5fNcLSWX0ebAcTCTpbdeyL/Ze6Q/TMLdhaLFAx9m6DR7Qz++zcM2zOWLviArVKFp9kjZC8PTCCmV1iYSjyt6yWVi9IVmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O25gYv+VF2lspnSZFWogI9aLETLFeIcVSq9dmhNRDH4=;
 b=IPxw3xP0s0rbB/ho5nqibVbeivr6LcTJ25qcRy18hYsrKB8hkDLVmVwH5yHyb4l9Ad/yS9umwvNv+h1+Jyyo43s+ml4HA5fjmdXlQOn8ILv8n1p1cKdJUMw5Su0IqzPq+pBp5wQt/MYQsCob5FvSUZ5+uWRm2quJj3M7nqxAsiSsz9oeGSKy/3IuVIguIt0Jfyr5EEhtULhlMwEcuDIhn1EmrVB86B5W0pnRS8yzHCDrrLrx+tjv45HifHuVfQjbZUPWgf56PzBu5DbIqb210lMZEbFReoEj/dSXLhAGs8o5VQkmTSfogoO2TwFYhgYFmpPRPH0SUsi+DP0NQ4b93w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7719.29; Mon, 1 Jul 2024 16:27:44 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%3]) with mapi id 15.20.7719.022; Mon, 1 Jul 2024
 16:27:44 +0000
Message-ID: <55599ec5-7be8-4568-91a3-f5c8d782e3e1@intel.com>
Date: Mon, 1 Jul 2024 21:57:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/8] tests/intel/xe_drm_fdinfo: Update basic test to
 include client utilization
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <igt-dev@lists.freedesktop.org>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20240621230102.238397-1-umesh.nerlige.ramappa@intel.com>
 <20240621230102.238397-2-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240621230102.238397-2-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0055.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ac::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CO1PR11MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: e27bb8f8-5859-454f-c4ec-08dc99eabc24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UWJ3L2ZweEt1citWREZhVzN1RTZ5Q1VHc2tlb0V5N1RUMTA0UUlqbFA0WmF3?=
 =?utf-8?B?Z0crN0tZQ0NyajZCQzkwbGg0K1hxY0dSTXBYYWRvWThKMjlRSVFZYldZcVc2?=
 =?utf-8?B?OVhXR2o5bFZNRjZDaGgxbXNLaEEwRkU1eUxHOHVWRTVFYThUKzVJdEFDSmtz?=
 =?utf-8?B?NldiSi9tQUpsc04rYzMzNWRXZHF6a1o1ZzBnNWpNbnpVa3gxLzN6QnpXTGM0?=
 =?utf-8?B?VEtiM2k5YUkwNk0xYmttNjI1SnA5YWw0a1dHNTU0VU5CK0F6bmJlY0U4T2t5?=
 =?utf-8?B?NUsrendvU09zN1crWTc0OW9MVXB2bTB3MGx2bTNSUUlSeVJuaTlkb1NjRFJu?=
 =?utf-8?B?WjFUUGt0QTIzZFZRSitnQXZzS3c1dWlBUllNYVRWUFN3dmhPd25WTDZjRmdr?=
 =?utf-8?B?cHFTMEtnaS9HL2hoUEc0QnFuaVNoRTZIUmlMYXB1bHVBZ2RRMS9QRmQ0YjBP?=
 =?utf-8?B?VkpjNDViSGhVU1FLdW5UQnFNQ1JlUjgvSUEzaFc3akNUT3J3S0NVR1F2akJl?=
 =?utf-8?B?SU0veWdPQWYrMCtzSmpoMGRWZlNUUDc1T01SVkJCRmZ1R1RVR3poL2JZWHlW?=
 =?utf-8?B?QmtOS2k5WVBSMkY1bWJUdjNXNXdVNG1aVkZXWGg5RkRYbWJQUnVoaXl6KzhZ?=
 =?utf-8?B?U1I5eXJXb1NVekZpQk0wRTUwZmRwZENpdlJYOVhxLzdUekZQdWpzQ2oyWlly?=
 =?utf-8?B?WGxTaGRpMW9iV2JtekNVZ3htcGVXanEvRjVUVTJsbnVnSzVrd1VwVzVMdXBY?=
 =?utf-8?B?WXAzZzBHNGxXcWpTYmZLOWJxY0lMYTZGaUppbmQva3ptSlNzZVBRaGRvcmNL?=
 =?utf-8?B?Qlk3SUtHK09na2ZKelc3RTFMVjBFekoxYnZuOG44NHhiU2FQMEtXZHR1eW5M?=
 =?utf-8?B?a3JUbDFvTVljUGR3M0VQeE1TYmNMVEh4ZG4vMGF6VzRwa0ozSUR5bFFab3Zh?=
 =?utf-8?B?empUOWlFRmR4UHg3cWFlR1RQKzVtUUtSL3BUZGZ5YkNMazVBVWw5cGo1Mm1s?=
 =?utf-8?B?cGJrRXBuNkVld2dGOGFYVVdXQUVGci9aQ2prT2swaGZXMHlTai8yaE9CSjIr?=
 =?utf-8?B?OGZDN0x4RnQwM2FuWk1rb0hyKy9EbGdZQmYwblRFLzhSWmQrbW1NSjR3UUo5?=
 =?utf-8?B?S3NBUFgwVHZYZHRXc1p6R013b2UwY215MzJ5NmtvQUdPRVdnY0NSYVQxcFJF?=
 =?utf-8?B?ZzJieTc4bmpxN3ZpcUREQUZVSlZsbzF4Wks1WE9WVStZaS8ydFdiTkVEL1U0?=
 =?utf-8?B?VXdtU3BmaWJRbDhWRmh4b3dCTTNYRTdmdVdiY1EraDdzVXQzN2JSZTZncGNx?=
 =?utf-8?B?NWYwbksrZ1RzOHJwajNvODlUN2dBQjBIUE5XRTFFUlZlNjdubFV5WW9Lbjdo?=
 =?utf-8?B?Z3VmeEE5UmhiblZoOE9JazZ5Qys0a3p5UXdPOGJuL1hKU1ZnYTcvMU5wbTdz?=
 =?utf-8?B?dTJkVWl5cUZJOGJIUWZycWtuSVlZYUtCMGN3Z1dtbStVSUs3b2VnQS9GSEdj?=
 =?utf-8?B?TTFXeG5xYldGN2RhdEJFWnZRejhuQ293akpTcGc4Y0Q5d2g5SzIwakZBa0U5?=
 =?utf-8?B?VUdNek5yYkJxUUJ4OWRDdHgwREVjWVZnZ1hydGQ5N3I1L3VzNWhvU2xhQVds?=
 =?utf-8?B?VFl0ektlTGV3TXM3ZTdDODA4R0xQbGp4TXQzbFZMTWpUTUUrTk5Dc3RZZGl3?=
 =?utf-8?B?Qmx1QTBjQU96ZWtoR3k4aEljM3JDSFJ5Vm5ubWxRb2E3UW5VbXpQUFBWQjFw?=
 =?utf-8?B?YmlSMVc4STBBTmY4V0pteDhOZUthekVWdVh3SlBWSS9uZnJKYlg2Q3cyUGhR?=
 =?utf-8?B?eldzcXdYdi9zT1hlM1NrQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlpCMmdBMjZnRk9CWitsOEdZTkZkL01EOU1COSswRkdockt1bHYzaWI2TkFX?=
 =?utf-8?B?TFJVU0RpZG5IWENISWUyK2IwQU9xS3dBdzRBRFlvK2NkMXBOdTNUVGpzR0Rp?=
 =?utf-8?B?L1ZCYUNobHJKbHNybG9lb0pHcjFIL0k3R2N0WjQ3VjhxV1pDVWlyMmIzWWdz?=
 =?utf-8?B?TlFNZFZMS3cyZHdFZWxGcEFRSDBWRVhlT29yNy9oOGVvV2YxeFhSZjBtYVZD?=
 =?utf-8?B?bnFDN0dXQUY2RTIwclhvMkZHV295c1BMd3hQZGdOYmpXbzViQS85a2JRTHZ3?=
 =?utf-8?B?dG11b0dMZmgvVW90dXFzbEptRXAvVlAzQmM3R0VEUlpYN3pTMUlEcGFvZEov?=
 =?utf-8?B?QmgrZ3o5WlpkMXIzVGt0aU82MWNHb3B1c1VDajgwbjJ2ZDZ4LzRBNEIrRDRy?=
 =?utf-8?B?cFFHMThQbUhWYXgwVlQzeGhwZTNlVmh2dkJBL0ZMc1RjMUNmdlYwMDI3Qnpv?=
 =?utf-8?B?ZzZ6dVA2aVlxWCtONzN3ajN1VlFDZGRVTndrckloYk1mVjc1aFBSUEFYREhY?=
 =?utf-8?B?TW9MWFFjRkZrVWplRDc1aENVWUNMbVlxc1VCMEdKeXMwZURvS2NmZnlsVmxH?=
 =?utf-8?B?aWlaY3Myc2Y1OUYzaW9uTk5ENCtNOUxmMDFpdjVRYmVZVmhIV25qYWZjSWhJ?=
 =?utf-8?B?SzRZaXNhRkRFU01PajlUVklJNU9UcUUxNVhXaEsvZFByUVJMVndxOWNWM0Vj?=
 =?utf-8?B?YVJudi9UdGlici8rOGFROGRKMVdaWWNwbU55dFpUdE52VVYxRGFMaHJZbVpM?=
 =?utf-8?B?d0czTFl2dDVQczVNL1dVU05rNzQvRk1POGdSc3V3cTVvTFBtY0loV0MwSCtn?=
 =?utf-8?B?NWNTTE1LWW1rWUlDSmRPaXpyU2gwQ01FTk83SVFmUVRXMHdOY0tXdXM2TGFH?=
 =?utf-8?B?bk9leHBPemRvUmdLUmV2MXB2UUJteFFzKytYODNLbzVYU3E4SVdsS0JkVmtw?=
 =?utf-8?B?dlhvV1VObU44TDNJdENUbDEwcjU3TXFvNlNOVHhNcFBrWG1NaHJjTlplbmhx?=
 =?utf-8?B?UW1ob2lJMGZIandLRWpmVEk4UWRTa2NWT0MvOU41ZHhjazMzdFBoY2tzQVk3?=
 =?utf-8?B?UVhoTFVLVUJuUzdlOGJZT0M4RXVSUFlKUGF5djdXWEVpUWxsbk1PS3VNUC8x?=
 =?utf-8?B?YXZ4TUl1Q1B2WkEwaDJZTndoTXdIK1NJc2dFbjNrNzhGUXZPSnk5V1AwZExS?=
 =?utf-8?B?RkFoWHIyVEZ6anZzcmJKeGVOVDJaeHJMaHJwZ0ZzUUhKSGJhMldHR3ZPd08y?=
 =?utf-8?B?R1A0QkZrSHk2Y2Z6ZHVXWVUwK0xreDdKT3dWMzRiSE14KzIrd0lNTEZTRzB3?=
 =?utf-8?B?VXQwRW45dlczNkY0M1JyYW1XV2NBd3N0OFpBR2w2dWh0RDVsN0JSTnd3Smtp?=
 =?utf-8?B?dXpJcjYxb2FMOWQrYlJGZVY0Q205aUJpQ1d5TkpzcXdUcXRZWldUSXVlY2Fa?=
 =?utf-8?B?WXZvc2xncnI1RGRCdm1ycmlPajliYmxLQWU1UEpTbkVLdE5veEEvdjM5UHNj?=
 =?utf-8?B?cU50dms4R1MrTnVLTlROa2xYMDRRQmVQVC9RSGlsSDdGU0FKNGtCZ0tNMkx4?=
 =?utf-8?B?b2pRR094cG5UNlFBeGtwcVhkbDF5M2RKb3ZxV3pabVBlaVVvSU9wUmVFUUhq?=
 =?utf-8?B?RzdjZEUwWFFVVnF3ekkvR2F2RHA1RU4reDJ5ZEFkVGZFb1RYcEt3TFkxMWpo?=
 =?utf-8?B?L0dmNHAzRlBvN2J5dWIyTGJLMHIwUVVONU1rTnJTbmZvV2xJSFpBb1FNNSt0?=
 =?utf-8?B?TU5seFhrd0RkZTl2WWxFZ0ExYzJoZEhoVjBzSWszamFhdlpOdFlnTVE0V3Vy?=
 =?utf-8?B?eVh1ZDk2eDRCay9IaXgvUDJzVXczWnZITHg2a2ltS3FSTm5MUi80ejZKYnBu?=
 =?utf-8?B?OEpKdEtUQjA2QkpLKzNOSXRDMnJCSXQ4ZExoYkkrcmpiQm41elVzYmkwQVd5?=
 =?utf-8?B?OEx6T1lWSVRtVFVTMm9hZlpHVm04YlZIUkJUeFhRZ0t4c3hxQU9ac3VJOXk3?=
 =?utf-8?B?NlkrbUdnY3lVUlBwQTVKNE12bm9TOU1IUncyOHIvRHdFZGRKTXdDY3Y3WWNB?=
 =?utf-8?B?Sm9nakNSNkVmTlIvUklQYkpaTUpiYytrV1Y3NU5VTVI3NmZXZlpKRnRlV1JJ?=
 =?utf-8?Q?WNzpcWANI0pbkQ1lIQlw7X11U?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e27bb8f8-5859-454f-c4ec-08dc99eabc24
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 16:27:44.1340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/UiwI8TDEQl/R3YbjhgWA87XD1Vm7K7XUeJKGxeSqCLtybsQ+kNunOzRHmdfQqBM+6zB9DhWSUIDYQje/P8xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5026
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

Hi Umesh

On 6/22/2024 4:30 AM, Umesh Nerlige Ramappa wrote:
> Add per client utilization related checks to basic test.
> 
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>   tests/intel/xe_drm_fdinfo.c | 40 +++++++++++++++++++++++++++++++------
>   1 file changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/intel/xe_drm_fdinfo.c b/tests/intel/xe_drm_fdinfo.c
> index 2ceafba24..e624029b8 100644
> --- a/tests/intel/xe_drm_fdinfo.c
> +++ b/tests/intel/xe_drm_fdinfo.c
> @@ -14,11 +14,11 @@
>   #include "xe/xe_spin.h"
>   /**
>    * TEST: xe drm fdinfo
> - * Description: Read and verify drm client memory consumption using fdinfo
> + * Description: Read and verify drm client memory consumption and engine utilization using fdinfo
>    * Category: Core
>    * Mega feature: General Core features
>    * Sub-category: driver
> - * Functionality: Per client memory statistics
> + * Functionality: Per client memory and engine utilization statistics
>    * Feature: SMI, core
>    * Test category: SysMan
>    *
> @@ -35,10 +35,17 @@
>    * Description: Create and compare active memory consumption by client
>    */
>   
> -IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption using fdinfo");
> +IGT_TEST_DESCRIPTION("Read and verify drm client memory consumption and engine utilization using fdinfo");
>   
>   #define BO_SIZE (65536)
>   
> +static const char *engine_map[] = {
> +	"rcs",
> +	"bcs",
> +	"vcs",
> +	"vecs",
> +	"ccs",
> +};
>   /* Subtests */
>   static void test_active(int fd, struct drm_xe_engine *engine)
>   {
> @@ -259,18 +266,21 @@ static void test_total_resident(int xe)
>   	xe_vm_destroy(xe, vm);
>   }
>   
> -static void basic(int xe)
> +static void basic(int xe, unsigned int num_classes)
>   {
>   	struct drm_xe_mem_region *memregion;
>   	uint64_t memreg = all_memory_regions(xe), region;
>   	struct drm_client_fdinfo info = { };
>   	unsigned int ret;
>   
> -	ret = igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0);
> +	ret = igt_parse_drm_fdinfo(xe, &info, engine_map,
> +				   ARRAY_SIZE(engine_map), NULL, 0);
>   	igt_assert_f(ret != 0, "failed with err:%d\n", errno);
>   
>   	igt_assert(!strcmp(info.driver, "xe"));
>   
> +	igt_assert_eq(info.num_engines, num_classes);
> +
>   	xe_for_each_mem_region(xe, memreg, region) {
>   		memregion = xe_mem_region(xe, region);
>   		igt_assert(info.region_mem[memregion->instance + 1].total >=
> @@ -289,19 +299,37 @@ static void basic(int xe)
>   
>   igt_main
>   {
> +	struct drm_xe_engine_class_instance *hwe;
> +	unsigned int num_engines = 0, num_classes = 0;
s/num_classes/num_engine_classes
> +	unsigned int classes[16] = { };
s/16/DRM_CLIENT_FDINFO_MAX_ENGINES

>   	int xe;
>   
>   	igt_fixture {
>   		struct drm_client_fdinfo info = { };
> +		unsigned int i;
>   
>   		xe = drm_open_driver(DRIVER_XE);
>   		igt_require_xe(xe);
>   		igt_require(igt_parse_drm_fdinfo(xe, &info, NULL, 0, NULL, 0));
> +		igt_require(info.num_engines);
> +
> +		xe_for_each_engine(xe, hwe) {
> +			num_engines++;
num_engines is not used anywhere in the series. Can be removed

With the above changes
Reviewed-by: Riana Tauro <riana.tauro@intel.com>


> +			igt_assert(hwe->engine_class < ARRAY_SIZE(classes));
> +			classes[hwe->engine_class]++;
> +		}
> +		igt_require(num_engines);
> +
> +		for (i = 0; i < ARRAY_SIZE(classes); i++) {
> +			if (classes[i])
> +				num_classes++;
> +		}
> +		igt_assert(num_classes);
>   	}
>   
>   	igt_describe("Check if basic fdinfo content is present");
>   	igt_subtest("basic")
> -		basic(xe);
> +		basic(xe, num_classes);
>   
>   	igt_describe("Create and compare total and resident memory consumption by client");
>   	igt_subtest("drm-total-resident")
