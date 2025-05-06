Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C16C3ABBE
	for <igt-dev@archiver.kernel.org>; Tue,  6 May 2025 17:43:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3C0010E0DE;
	Tue,  6 May 2025 17:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="emiNKaI4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0331110E0DE
 for <igt-dev@lists.freedesktop.org>; Tue,  6 May 2025 17:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746553402; x=1778089402;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RuAJBl82lNSwnW+ExHdu7bjsl1Vn2YJkE9CFQVlmeig=;
 b=emiNKaI4UWtmG2YnEYxr9btXaJRAEdIq8J6iHNnIIUy4xV+XxD0RnBk8
 Gz1DGaURKx3eCBCAYT0J8xhG5mAV7V+Bil9xEbpkaycbdB0Tm82gTpyyC
 qm0mHdT28EfHVgmJwRSSXUnRloIJ6+1WpFlwb0Q6UWP2gdH/ELlQyhAf+
 fx+dd1fku/80ZyGDisFAi5OtuHCnY4NUzuEXvr7FTDFLPxdgZS0HhG+jB
 RT9z06uxlNAjb/j1X02apFlAyHSLq5uukx7EILUwxWjGF0FE49oxQYnKi
 DO2aPGPbCUwK4p6jRBXRYA1SlxkSfGiZQm/yPlXXeqcTTBlBDeXbA1Otp Q==;
X-CSE-ConnectionGUID: eTEFPnAgRFaSGWoxRf0FsA==
X-CSE-MsgGUID: xTC9f4HuQhaNgZLyh0dBeg==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="47950256"
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="47950256"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:43:18 -0700
X-CSE-ConnectionGUID: L/cm1C9bTl6jcdDXPQBmvQ==
X-CSE-MsgGUID: 8uCVWg3cSHSQMidXsLdnbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,267,1739865600"; d="scan'208";a="172883082"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2025 10:43:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 6 May 2025 10:43:16 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 6 May 2025 10:43:16 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 6 May 2025 10:43:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jFm6oyb0/0fkmcMvrVLhISvpUcMizyg4czPz3yEIfrMYPyzU56FDpmtpzwFcVZZebKAUyHjwwR6KPptciaLAw3Oo6Dyc7TDLzEo/q9dpowY5VG+xq/zsSZ2GyI2S3lBHpME+MbOVOIV39QnZ1bBOOgZXd1F50nYGVjDChGLR7tTgiGVSGQN8Vt3biVMZz6cPzKDNLGsqGEm10QMTmmsyPfgL/DWWp3RV5GkbUAsRRGQGXmQIVsYJPnxF9tCPC1OXC7w2/jw/Gx8KdsCBnZe2TR3fHdaYUB8YFCaCb/iqHceg3nDco+0U2D1bOfsqzNxbvqX9yZq/9yeKvr8xS0srxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNRudXGj4r3cLWuXqZFzQ6S7PIxeVwv3n16QJBD3+6s=;
 b=hEzCZXiiUFCFIhimwwwYMpJF54nIXO3poscnMOdJZObgmYdLzI/6BvEaApuY+lHBYFuZCqR8LOb3CnCCZsbEhgH/k9+UdsxSVrzjpMzKh3vhY6l4Vk6rw0gwHXLmJMOeeEeKsG3HPsiqFHJ53ZPrS7jnnWPs2Qa73sewKY2nUzWWMZqZyHhFeswguI/yG7CbG6BfjVa4oDg4sZOxZyNEgQz8JpBt5b83jXjsDYnSKIZVbqnpnIXD4ZUIoLry9JfdUl5pivdfUj5gMCDa79qpG8mapNcVh6ItKggfU0O6QGUSZENHuLCfuqsSTVHJKhAcXPYE+tskYXWtrgjk5PK02w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by LV3PR11MB8555.namprd11.prod.outlook.com (2603:10b6:408:1b0::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.22; Tue, 6 May
 2025 17:43:06 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%5]) with mapi id 15.20.8699.026; Tue, 6 May 2025
 17:43:06 +0000
Message-ID: <586f4724-c3a6-455f-a6bd-d3dfe0dee757@intel.com>
Date: Tue, 6 May 2025 13:43:02 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2 2/2] tests/intel/xe_fault_injection: Ignore
 faults for *guc*
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20250506140351.29612-1-satyanarayana.k.v.p@intel.com>
 <20250506140351.29612-3-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <20250506140351.29612-3-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW3PR06CA0020.namprd06.prod.outlook.com
 (2603:10b6:303:2a::25) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|LV3PR11MB8555:EE_
X-MS-Office365-Filtering-Correlation-Id: eecdf95d-e3fb-4a66-474d-08dd8cc57532
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NXZxOG0zMHUzS0dkWUpLVmJsVDJ3UU5Id052R3RvRk15OVN5NWRvc09JT09x?=
 =?utf-8?B?aTlWeXJLSEZqOWpsSDQ3Vm1VdU9NclZ5TDVCUEZDMzdWQkRSQllYN2hUVkpx?=
 =?utf-8?B?eG0ybjV2dTVOaklMZTVYRDVsM3d0RGZ6SWNjTldNMnBaRDFoMWkzdjJ1U0VW?=
 =?utf-8?B?YitPc2pHempCWEpveGxDaGVZYmljWnVOTkpzYnlFNWRGUndlR2RxSXNpRFFp?=
 =?utf-8?B?VUtCQmJ5bjF3Tjc3M1M0bDFGSXArQ20xMUErYlhHcFhtVG1XUEZqUTZBeHQz?=
 =?utf-8?B?Ni9sbnY3MFYyR3p6TUdzckxxNGtKS2dQUW9Ob2xxeGx5ajY4eXpvZkRMZndS?=
 =?utf-8?B?amhvQjFaNzA4bnhDQjlQYXh5U09vUXZKZ2w2MU1SUVZPTXYybnZ5aG5QMDJ5?=
 =?utf-8?B?ZmJPQzFvQzVPVitnR2Nha0thWjFtSzhVaEsyV0g3YjdKRHdDWlYzSGFac216?=
 =?utf-8?B?ZFptVWlGT2pydHZJeVlyY25DSmxpWWN0enphN0pHZ0tBOUE4S2hGUTE3UHJj?=
 =?utf-8?B?Nnh5RzVndE1vQnVkSXIrdlpJakR0NzI4TXBrY0Q5WFNjUm0zNnNWMzFqYnZO?=
 =?utf-8?B?MGNnVUZJQ0tHK3hMRW0vcG9LYm85Z2dhNjJtdFc2QU5HV09QdUpmZmphTTZ2?=
 =?utf-8?B?NHNXMFIrSDFjbVpiNXF6WitxaG9WZ2FqVVAxemJQbEVFUVZTTlpVNWpEWE5n?=
 =?utf-8?B?RDVZcnRhWWRBYndDY0gxSnVQRTBRdEh0NHdTWURsQXRYVnhaYXBiaUp3YW1D?=
 =?utf-8?B?b0xrOXgvQ3RQd3JUWUpTRHg5NzNTL0d2WDhKSEl0S0VuQ3RxMkhnZjF5Vmx5?=
 =?utf-8?B?ckxjdzZ3cStUekk3bFdSM3hQdmtvMmplc0tENS84RVNpcnBtWjdwTjJDeWJL?=
 =?utf-8?B?Y0JRNGZyaW11MHB4N2cvWmZZeU9vRjl6UzdBSkIyWk5UbTV5T1JJOXZYZi9u?=
 =?utf-8?B?OU9pTk9yS3AxMlVkME5weTZpRTdMZnBtRGxDTjdtREZkdm9vZ0dYUVhHU0U4?=
 =?utf-8?B?b2s1L2N6UDFOKzJrZWh2K1RCeGQ4aHNsdlNaeGJjeWZXV2VUejlyaEJaYWY4?=
 =?utf-8?B?Sm1oK0h5a296cTBacTVyOERWZUVkZ3h4VmFZNHBaUzJOcWhjWUpGR2w4R1lo?=
 =?utf-8?B?ZVNrUmR6OTFuUGoxT1FybHRpcFhOWDc3SEpQUnEwQnlZV3phcjhUMlFYYW9Z?=
 =?utf-8?B?TkdSR1ZGN1RMemprMnFHakp1Z0tqbjREbUpYVlVXUUdpL0tKOVQ0RGl4eVFD?=
 =?utf-8?B?RHhIUSt0MXFSeWxKdUZLZDNRTDRwN1ZrSjB0MGJ0cElMT2JuY2hkOVI2bkkx?=
 =?utf-8?B?c3FERExydHRORnM2QkVkU3M1a3dVKzJGV0R4SUlyYm1FQ1MwZ1l1cW1kaHlJ?=
 =?utf-8?B?SEJZcXdhY25ORWNManphMm96U09TQ21FelE4Rzh1ZFR3OEZLUGp6S3kzd3Nu?=
 =?utf-8?B?ZmhwY01kWHdnVmpRelluaStZVlNHYTcrckZ1cVBpaGx1TDVWY0FHU01VMGNa?=
 =?utf-8?B?ZTM0Ni85MmVEdUY2d0ZhVXowUmxQSnB1eUNna2V5ZDJuUjRoUkUvZWJtV3ZT?=
 =?utf-8?B?ckZyYmdkMnFtZzdjZXoxSEdiM1YwTklqTm9kQmY3QXN6THBabEo2c0FiTG9M?=
 =?utf-8?B?ajlVZDdmbmdUVHhiTVRZNklSWHNnek1tWUJWbmN4eTVhNHRXUEJidmlKMWJm?=
 =?utf-8?B?elVPSm9wdUQ4ZGQ2WnQ1RUFza05yK3djM05iVTY5MENhMExyY1FYZ2VtZlpG?=
 =?utf-8?B?eUZuKzZ6WXFpemdYWXFWK1NLQmkxZUdwclJRdjdnR1FoTnhNaHZpVlBIMSti?=
 =?utf-8?B?OHh1am1KR2xJK2M5L2hQMWxtRkQxWEJYWGV5YkQrb2VUVnRIZWFiVzdVZmN6?=
 =?utf-8?B?bWFEMEtCbk9OaGFOTCtaMS9Pa2g0cGN5ZjNDZnRIUCs3UXEvUjhSY3U2aGVi?=
 =?utf-8?Q?OwjX0jUSm2Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0NzOWdaSGJUckRGc2ZiSUdrZVZkbUg4d0JIUkhIVS81by81M2VtOGQ5TDhQ?=
 =?utf-8?B?ZWpZR1czZlZsWkdyVmJCS29ocGpIUys2VDZJbDNNeEFPcmErSnliSGgwSXRn?=
 =?utf-8?B?N2hHZXBjbEptWjBiNE9CZldXeThhS3ljZ1JkeXNKNWZsc1YvdVhueTNtQ29k?=
 =?utf-8?B?R2RnWjNoMUlkUnNQckx5VjhuVnArT0JDVjAzRmNLUTlDOVRzTEFUUXpZWWpJ?=
 =?utf-8?B?WTUwbTFQc3JSenZETjNadG85REZIdWwrNkt0WG1vWmgyNlRKUEFhQnpTYnhy?=
 =?utf-8?B?UmpLbGdKV21GVTFDeVdJaUNIUjEwOFJQU09sOEhJWmxxdXpudHorMmVpS3ps?=
 =?utf-8?B?Zk04NjZYTHRkRkRiRXpnVjhRT2R6UHJ2eW5vVzlieTZkbmZmL1hQZmw0SXZx?=
 =?utf-8?B?RitSenk5a0dwOHRnclQrQXBMWDVnUDd4UjFidFFHZUJ0Z1JaTk4yZjYyQ0Fo?=
 =?utf-8?B?dVA1WEo4cmlIMkQ2UzFmUXhqNUthWG1CTHpGTkFhcjdYOVdaMEt5MFNKcUxB?=
 =?utf-8?B?MUZQdm1hSjdyUkl1Uzl4OWJyOVQvUytIRlBKakRXSGNMcWluOGsyTmhyWXYz?=
 =?utf-8?B?c0Nra0k2dHcvTXZVMnk3RmFFMGgyT0QwRlVOMDJnTXZBSGdzVEZ1K2IrZzc1?=
 =?utf-8?B?eVpnQW1NQjF4djY4aTcyaVJvcHQ5Q0VJZHFZd01ncWVaeVdqZzFxZjZsdWF0?=
 =?utf-8?B?SmRyYlY5TlY0REZZM2lhMU9IMG9ITHFZQjQycGpybHZ1bldhZVNlNDJCWWxz?=
 =?utf-8?B?c0lyaGhJN2pkdUx3T1NWNnh1dXBSUkRTc0lNUzk3ellWUmcxZmsvaGxQVDNa?=
 =?utf-8?B?eWlsWEVNN0ZyRDRIQTc1Yk9lS2NzOSt0NGpzVTRyWVFWalM4aldEcGlrN2xn?=
 =?utf-8?B?Uys2bnFHdy9vUzYyRXF0a3ZaZWlCWEdtenRmYllyV2JUSytGcUx2YXdVU3BM?=
 =?utf-8?B?YlRxWGk4ZTcxbHhkRFFsSzg0VEdxdzJnWjFaR3NiWnNJTEZaTUJYSU03NnlK?=
 =?utf-8?B?MjQ2WDBuMVgyMndtbVlQRVRRRzd1NTVtVHpRYytuQVBiMVBLNnBzekg0Nlc2?=
 =?utf-8?B?SXp2LzJPd3FPZm14R1hnVk9qUklwY0hEU0piQnE1Z3BSZ1pyWGtKQUhPVWt2?=
 =?utf-8?B?SDRobDMwQmVQRVcyblJFWHdZTDhvQ3I1WDJaYVc1SHYreEE4YTd1dHZ5SlpX?=
 =?utf-8?B?Tmx4UmlhOXNncjFYNHJtb2Z1MVUydURLU0xrMTJ6N3JtUGFLelcxYXFKR1E5?=
 =?utf-8?B?N3UyRWxodWs2d3NGVGd4cklZc292bnFhL0N5alVmYTEvRkdLVjg2RlZqTEdm?=
 =?utf-8?B?ZWV6VmRRM25HT0FFUGs4aXZnVmV1NXg5T3hwODJGdU1hajF1TFJpK2ppSjJp?=
 =?utf-8?B?VXBMYVNEZldZeGJGQVRocHBhSzdOem1LcytaYnByZUw2NkVKUkZqcURYeTFQ?=
 =?utf-8?B?clBWanFINVNwSFVtREg4eWpWVzVpY2wrZ2ZkREpZNCttQmp4eDltZ212M2FS?=
 =?utf-8?B?QTgra1c0V0ZsdlA1Y2Z5ZTFDOEVyRmkvQUlqSFc0T2psZmFkdHBwUm1mS2tv?=
 =?utf-8?B?dS9CbDQzL3M4czdYVUR6YXBrVGJlTkgvUEFXMHhqWDMxOU1KWk9iYTFyWUZr?=
 =?utf-8?B?czJIM1NrY05TVGhpeE1HME9yclJlUmpqRlVOQmlFeXNjV1dtVDRlWmdXSEZh?=
 =?utf-8?B?ODc2cDlCaTdLNEhiN3hUR1U4UWU5VnRSRFB5dnZqRlhQaUl3TW5tRGNOZnRR?=
 =?utf-8?B?Z3FWMFZMRjJnbXgvWEJWaVJIZURQQTRxZlBCNjBoZUFtam13aHNORHBORW1v?=
 =?utf-8?B?RzcwTGpXbWJKTkFnV1lnQ1ZBR2tIYkJRNzVqRTMyOUJKY1BVMWlaSkdGT0pv?=
 =?utf-8?B?YmZCbWFENmNpUzk0aVQ1a0Q1c3J1QnZJaGxaekR2ODhSdldNZjRnYVhpaFZi?=
 =?utf-8?B?QStuL1QxWnpYZ0VNSHdRTEREdDJ2TEVtWkNUV0k2S1lHTGhWM1BZZ1QvYjVw?=
 =?utf-8?B?SnR0cXV4WHErQ05JcUovMmZ0R05KaE5aS0JmZVg1MFlxdGl5NTBSWUkyVFRw?=
 =?utf-8?B?L0UzV1RSRGF6LzJuQmNQWW1Wd2JFbm5CeTZVNW1NeGRyK2xvYS9XTDRhWW9t?=
 =?utf-8?Q?PNnTN91eV6Z56nSKVEqeQKzZj?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eecdf95d-e3fb-4a66-474d-08dd8cc57532
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 17:43:06.1152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvoVHfbPUgzbLWwwEgY9Zm/vx1r32ZHydY1jk+HyCwfpgG2U60H7+j+k6F7kU9iLp7UHGJhyPCI/KZqsAuBWhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8555
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

Reviewed-by: Zhanjun Dong <zhanjun.dong@intel.com>

Regards,
Zhanjun Dong

On 2025-05-06 10:03 a.m., Satyanarayana K V P wrote:
> Add some more guc fault messages in the dmesg ignore list.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> ---
>   tests/intel/xe_fault_injection.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/intel/xe_fault_injection.c b/tests/intel/xe_fault_injection.c
> index 82d730a7c..10374d23e 100644
> --- a/tests/intel/xe_fault_injection.c
> +++ b/tests/intel/xe_fault_injection.c
> @@ -83,6 +83,8 @@ static void ignore_faults_in_dmesg(const char function_name[])
>   	if (function_is_part_of_guc(function_name)) {
>   		strcat(regex, "|GT[0-9a-fA-F]*: GuC init failed with -ENOMEM");
>   		strcat(regex, "|GT[0-9a-fA-F]*: Failed to initialize uC .-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: Failed to enable GuC CT	.-ENOMEM");
> +		strcat(regex, "|GT[0-9a-fA-F]*: GuC PC query task state failed:	-ENOMEM");
>   	}
>   
>   	igt_emit_ignore_dmesg_regex(regex);

