Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85185CA0ED1
	for <igt-dev@archiver.kernel.org>; Mon, 18 Aug 2025 17:21:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BD5710E4AD;
	Mon, 18 Aug 2025 17:21:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYhKQNwp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E3C910E4AD
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Aug 2025 17:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755537716; x=1787073716;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=jqi+YeiHEguLbA0fsZLYbwr1Na7XHAo6PQJKfz4iNmA=;
 b=nYhKQNwpeULQYvSGRgpZejgNPXEzXaKJyiuauQ23ytFjUm2U7p842ltL
 j4ZZcuSgHeLpGk/EHI4BhmogD2EhOzgQNtMOuYfglr4srPGU78kk37H0w
 sWzTfvLSfm9aYTpB4/SJZzniQ5VJ9yHKF2oXDaNqc9zjWzLcWxqYw982P
 9PfTXL2Yrs5wLJ994jraMEjhbZxgXXXaS98YH2E1uHRuVDtn7s1bmDv8G
 cKdOdw0dCVBKE8LCGt1cweIk9JuDHuwnR2SRJpdDlImlXeXCQTy3Ynm5p
 WbL8/xjYf32k6royVKbN/TT67cAzUy3fRK4YU2Hnho6xQ62jXpLo5SSlK Q==;
X-CSE-ConnectionGUID: LiBbkuu5RuOUwkXokQVRFg==
X-CSE-MsgGUID: HPamcCTVTfSaIcVTl2MUhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69217660"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="69217660"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:21:56 -0700
X-CSE-ConnectionGUID: 7OA4fxgeSsu12yt9aS/obw==
X-CSE-MsgGUID: PzfWHy49QVWV1U+e0bblwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; d="scan'208";a="198479705"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2025 10:21:56 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 10:21:55 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Mon, 18 Aug 2025 10:21:55 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.54) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 18 Aug 2025 10:21:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IJXI7kOVgXSq/FV8nDFKufTopkx+WOtY61hNvT8jNw81BhgidvRLasS3NINopSJDcnlm9NXIWnUynAO0atG4KevhExGTBmBIlwcuJ3uIktQ2L0C4LQedg9FGamnAUE6FbeRLX4+lJi/SW8iyO4DcPfBcNyrsE4yLg1EPKVFKNA8wOnTWN9kiEfoB6Xux2nNjeFUtRTmjQ9kYgYpniU0TXerHzXryXRQrvQD9HH6ErDp5b6foZt04UCX+2Z25M00TzOXstyQkU5eWU0fnzeUy34IbrtVagvMtEI4P+ray5U3IBuM2lIu2FiMJLPAmmTv1fakB3sRtWsCH04qk5Up/Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6yBwfVgBUXQtMEJlZB6k4J0R4fgsY2zkRgNCNR0Jr4=;
 b=yY6fDabKYYR0K6xPxsWsldk/Mb0LVCb/viCfJM9mce30XLMdQOSMIN3DOSrHuvFHmqwmeqwzqg3tjm4PVkosKvYdRZek8ENgzBZ0slMEdrdzUq457FnSZ4UcAN1PEednVubapo7TXq10XwzKepdAC+c9AJuI/CSsnvoyZeRf1A+3RSQxzVpzuOGWaZumo9NZ0HcAK2tW7C2skQu/0MSfPALwkfWg+PvvuewYQ8ZwFEe/vAkXVypOLK/Mj6UfiKBkt57tqZ/gQE0k59JuJrRKtgvYicwujqINqno5lu+lmP6jyrfNzo3magKpmq8/b2CJJH8KMr1MermNtxB7hNiS8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2760.namprd11.prod.outlook.com (2603:10b6:a02:c0::26)
 by PH3PPFBC2C58BB4.namprd11.prod.outlook.com (2603:10b6:518:1::d47)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Mon, 18 Aug
 2025 17:21:53 +0000
Received: from BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7]) by BYAPR11MB2760.namprd11.prod.outlook.com
 ([fe80::edff:94fd:b8f9:34c7%7]) with mapi id 15.20.9031.014; Mon, 18 Aug 2025
 17:21:53 +0000
Message-ID: <7fab4892-f391-480c-b380-7a838b9b700f@intel.com>
Date: Mon, 18 Aug 2025 22:51:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v3 2/2] lib/igt_kms: Add helper to get count of
 connected outputs
To: <igt-dev@lists.freedesktop.org>
References: <20250818161649.2157822-1-pranay.samala@intel.com>
 <20250818161649.2157822-3-pranay.samala@intel.com>
Content-Language: en-US
From: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>
In-Reply-To: <20250818161649.2157822-3-pranay.samala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To BYAPR11MB2760.namprd11.prod.outlook.com
 (2603:10b6:a02:c0::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2760:EE_|PH3PPFBC2C58BB4:EE_
X-MS-Office365-Filtering-Correlation-Id: e761e2cc-9a87-4389-babb-08ddde7bb97c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm9SY3ZUN3c1VmpSOG1lY3p4WTNvUVlTK09GUDZXbUFnV3p1blorTkxkUml1?=
 =?utf-8?B?WDFzY3I0WDFKOUFBVjY5RU92MUNnaHRZSThmY3dFMFFiSVRBRFI1c1VDZDd5?=
 =?utf-8?B?TVlnUUMyWXdUb1RnT3hwVkJmNk85L2twUVNpeGJZL2RISkZ0bXZERDY2USs3?=
 =?utf-8?B?R1pwMkVBYWJlQVpOMHFRYkF1RkErYkxsTFNzalMyWkxER3laT3kwZ1BaM2ky?=
 =?utf-8?B?VklVUFFoRGUzTC9KMjIzZllZaU5Ya09GcGl0YUpoS0NJWWZacTZ2QWxxL3dk?=
 =?utf-8?B?Nk5NcmxoZnVyRDRSL1oyWm5WcXAvWCt2bHZ5aytmTnVwS0NDMTlybzNQbTRj?=
 =?utf-8?B?NHNuWkQyTFduRmtIK0kyWjdkMXQ2dlZtNENyQnk3dkplT2Q3OXhWRFh0SGtF?=
 =?utf-8?B?OHVZWmFyL25KZ3lOMlhvVWdBVitpWGY0UGtoNzE1QWN2cVB6cDdjTis1TW4x?=
 =?utf-8?B?Y0Y1SzVXemJubGJTT082UjJGYWNiSEZHd0pLVHdRZC81UVpPUk1sRm9CQm9i?=
 =?utf-8?B?TEVrNTJJS0lQNGxXQjBNWXZ2OHdCTXVSdW1GZzhXdkgxVkQyTWtxSjBzcEEv?=
 =?utf-8?B?M2dhRlpDWDA0NlFtTjFuUUZDazU5OFRxSmhLQWUvQ2I4NHpTdWVaNGtoM3V2?=
 =?utf-8?B?VE04MjdrNG5uT2VSaWgvN0Q2bW5nMUgyNHpFMmZQV1pjam1pbDNrc2pLU2Rk?=
 =?utf-8?B?blEycWErNGNkVldneHZ4QmdmT2xVQlB3YkJraDBiRktHaENNSzVCa0VMcjl4?=
 =?utf-8?B?MzVrY1VxV0s1TTVjVUdHeVVHdFVpcjhmSmNHUjJodkVQYkNacWZkSW5YR29z?=
 =?utf-8?B?Sk85RlQvNTZkMkdUSE1zK09QTldEZWhVYW95Ly91cFkzNFRaZ0plYy9oSFhi?=
 =?utf-8?B?dS9zdlFOMkRGZTlrRkw2bnpyS29QdG1xY3lHZDAzdjhwdUlPRDRsYnJhTFJl?=
 =?utf-8?B?YXhEM2QzMjhnYmF4eUxxTUlNYk5OWVkvcGVONVNWa2dsVXZNS1V6RkswRnlr?=
 =?utf-8?B?cWRwNzkxdjhIZzhtVjJiZTc0ejY3akI2K0VlbFdJU3pKU2JRcXpyT0M3cXBX?=
 =?utf-8?B?bEk0YVl3Z0h6K3JycmRXbFUyMk9BQ1FoSlJwbWh5NFRMZzVRUytuMFNuelZ3?=
 =?utf-8?B?N0U2Smd1enFOdGhMcUdUYUlzV09hVjZucHBiaDdpZHVWUy9SODhOcGhuOGI3?=
 =?utf-8?B?T2pYM2I5eWQwWFNnMERDMnJrTmRPY00zUFFNOCtEZHl2TE5JejJoeTJ5UUlm?=
 =?utf-8?B?SE5TYUg3d3BFb0k3K1lpNUxJemdIZytIQVN6ZDFDQTVaSTgrbVdQdm41b0N6?=
 =?utf-8?B?RStPeDRiL05EckRCRS9ZVmdaYmFuZENjMEplZ1Y2L3RjQWhtdGV2N2tKU2Iz?=
 =?utf-8?B?NEhLK3h3QmNtdGEwRExrM0R0QkdVdTRaY2NvdTlQazNmUzRESEdtWnF2MDgy?=
 =?utf-8?B?NkJhU3FzaGpoV2F4WjFMREVucGdaV1l2eEZXa0s1QVNNdnBqb0tUYUttbits?=
 =?utf-8?B?Zlhuam1FWHVOSkxyaUJyUUZHSjdqOTdsOU5QV3FMdXJSSzFhVC9JbTFxSDd4?=
 =?utf-8?B?cFE1WDNwazZFaGJDWEd0UWY0MU9FSWhqV2YrUWlIeUxNYThPWVdPclA2SWxn?=
 =?utf-8?B?a1UyZ2RucDlveGN5VFZ6eFkrVDBqRXJ3OFc4THpBeVNJQkQ2VjhFVzVOSWVD?=
 =?utf-8?B?RDBHeCs4UVlFMndrRTVYQzdJU3BvUTFsZGRWV0dIRnhodTU0ampPQU0ycFhx?=
 =?utf-8?B?NnBKak1WajM0U01VcWxJL0g2M3lYeUpXcFArVXRCUWxPMW5ubDh4ZXFjV0sv?=
 =?utf-8?B?SUd4KzZBT3RjdnVwRkNlSDkrRGhSaVV0VzM0YUxsMCtMUEpCN1BEbCtTdS96?=
 =?utf-8?B?czNpRnRmRnRoNk1SZElBNldMSmZWOWZ0OUFUcDJaVFhoODZwY2tjdXhIWlVI?=
 =?utf-8?Q?qQzWkYJKXUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2760.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEpXRFFGdmRVbG80RmhzaUVqRnpPUXBXejY1KzRBRE9KblRaNzQraXd0QWlo?=
 =?utf-8?B?UGFnb1IzR05ZdUNVRG5YalB1MzRrZ3VKWDRySUtuZkhCZmY5RHpWaExKelg5?=
 =?utf-8?B?WWlCc2pweEhJbUhBQ1hFaHZJTElPYjU3a0VEOXY3L3MvWDNLdW1WTmlnTDBh?=
 =?utf-8?B?YnJrOGFTWU5aV3ZxN1dCRE4vajdBRnFhTHdxTWt4ajZyN3BLZExmZm5yckl5?=
 =?utf-8?B?NTZFS3ZXMXBTRDhBMkhJTG9ZbllTZjhpa0dlN3hIbVR5T3NoYlNQQTBleno4?=
 =?utf-8?B?UXQ1V0ZzaTRFbjdYaytIZ2JkbUZMWDl2QmM2dFp1a3JDNk1QUTYra2xCOHQz?=
 =?utf-8?B?ZzVjVkdiVlV1dmxqOVFEc3lEN1MyaFJtWHRHQVVzMk5JL0dMUHV5TFBFajh1?=
 =?utf-8?B?eldLWXdmeW5mcDZsZ3MzVEFvRFp5WExhMmk4SWhhOW5IWmdVSFhDSFh3NkIx?=
 =?utf-8?B?Y1g0UEZETVNPMFk5amZyQTdFcUJuTXgxRDlPcVJPdVBUR25CL1ovTzZuYmVi?=
 =?utf-8?B?Y1NMRWNvRXc0cEJxMHp6WDZ2ckRuc1NPZ21mY0dLUEZVbFlEVzc3VjRacWlP?=
 =?utf-8?B?WWdCL05GUWFacTNqN3FiVi9ISnRPWXdVMi9qaHFRVnQzbFhFcXhiUTlKYndv?=
 =?utf-8?B?dDJuZU16U3ZsTmc1RHdHNXVmUmlEMUdxQUs5TnFBTDV6VzZkQy9xR2tRd2Vo?=
 =?utf-8?B?amZwblNtSnY4RkQ1QkpZMjVNV01OWkZ0c01hNTRNMU9tdjhGYjFJMHpjenFh?=
 =?utf-8?B?b2RFaWplU2JaN2pIbFhFZjRIMVBQYlFOQlMxNXJLQWNHUjYvSDFHVFVHclRi?=
 =?utf-8?B?eVdrTVBobnFSQThBd2k5SUNXR2RnQTVXbWFRQW52M2NvYWRsOXRoOGFPeWFV?=
 =?utf-8?B?czhuUjZkc0ZMSE8vWCszSmUwTE0wK3N4Z0ppS2pxN25IYWV2T1h1SHJQTitv?=
 =?utf-8?B?LzRXYTJqblBIQlUwNGxoMTc2N3JXYzgyQUluSXpmZENyVnkrY3Q4dm82elpV?=
 =?utf-8?B?UVdDY1UzU1Fzc1o5b1JSSkRacjZEWjFZYWlINnFOTUZNejIyR3BGZ2VPaUdU?=
 =?utf-8?B?dGZackN0eE03YkcyVU5vY3pOTEFOdmVmVDc0SjRUYXlDRHo1Rk1WT0N4NlFw?=
 =?utf-8?B?ZGhqTHg0OGxIeHdzOU42S1Z5MWxHeHVOaW5vRDlpQWk1YWdVb0lvaWVRdXlt?=
 =?utf-8?B?MzBheTBseHNuWVQ3dkxpdTJac2FsUWwyMEFzZFB5eFZoVTEwYnJrbGVwZEpL?=
 =?utf-8?B?M2RXR25aSENsVzl1dlNDRVhoT0ljL05UdmdoK2lLaU56UmwzUW1Uclg0L3F6?=
 =?utf-8?B?S1FUTzBKY0FyOGJpSmZtV2k2UXdNK2pFL1A1c05QRGZqY1ZYUHBJYzFlbllr?=
 =?utf-8?B?UVJsNUE0czRqQTJoanUwMUI3UEtNRjNkbVh2MW1QWnZhQUlmdUpvWnlrbDE5?=
 =?utf-8?B?cHNpdUNiRnRDcnVhV3o2UnpUQ2E3bEtVc1FWajU2UzhEQUVXeU0wNGNxY3Rj?=
 =?utf-8?B?b2ZWaW9WbGRpdEswSGhndHRWU2hyK3NyNnI2ektJNW9BQjRZcmE5RTRLbkZW?=
 =?utf-8?B?UCt5WXBjMUhrbENPK1Rwa01ic24zbUVPcHhGcmFFUHJlVmdrUTZJeHJKZk03?=
 =?utf-8?B?dGVKMUd5MlVMbVhYeDlzOHlTWXNhQldnR0x1UnZvYVliS1FKa1RZYlJwVlJY?=
 =?utf-8?B?RHh4NWVKMmdJdmF6RWt2MmNEU3laZjdqNS9tdURvUEJMeFhPUzdMNnIxVzBU?=
 =?utf-8?B?c0VZTis5ajJIalUxTHJhVFM3NEhRUUc4aHc1R3FDQ08wbktmcHJxYkVRSEVT?=
 =?utf-8?B?TXo4NUlndEdIUkFLQU9DS0hBRFR4dUlhRXpPaTQ4eXB3dGg1RytWcDRyazFI?=
 =?utf-8?B?ZXV5ejAyL1dwUkNNNmVzLytPSm92TjFBaXF3YjlVL2JaTTVtczJzT0RRRkV1?=
 =?utf-8?B?WFVZU0hWVjZaaHhHQVQ2RG5uNlNjMkIrZWtNd2RVTEhPRXJjUkw2S0drb1V4?=
 =?utf-8?B?bUMzUjZwNEU2NW5TUndtaVVBcTJXa293VUczcUkzK01SVDlYdzR0akdSUUpt?=
 =?utf-8?B?L2txQjlHb3BPZjBhaUtLcTJISHBPYTh1RXRxSW15S045UFVBNDdEV0krWUlm?=
 =?utf-8?B?Y2h4Z25zTnQwSkhCQ0t2UVBXNGplK1VIZ2tQK3NCMEtRTFhkUnJxRU1aUTZV?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e761e2cc-9a87-4389-babb-08ddde7bb97c
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2760.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2025 17:21:53.4353 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1Ft5QJvw7QhbsVX4XgqWGaFZ60qygqN9gHP8OXj+VPgXq1MuQKUFc+ptsrRjbiqy6n0GB7EiPSJRGEqUpLiFxv4rQWRsGNabRqUdrb6AXDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFBC2C58BB4
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

Hi Pranay,

On 8/18/2025 9:46 PM, Pranay Samala wrote:
> Introduce a new helper function to return the number of
> actively connected outputs in a given igt_display_t instance.
>
> Signed-off-by: Pranay Samala <pranay.samala@intel.com>
> ---
>   lib/igt_kms.c | 19 +++++++++++++++++++
>   lib/igt_kms.h |  1 +
>   2 files changed, 20 insertions(+)
>
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 7191bf92e..60e49037c 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -7519,3 +7519,22 @@ drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output)
>   
>   	return blob;
>   }
> +
> +/**
> + * igt_get_connected_output_count:
> + * @display: pointer to igt_display_t
> + *
> + * Get the number of actively connected outputs.
> + *
> + * Returns: the count of connected outputs.
> + */
> +int igt_get_connected_output_count(igt_display_t *display)
The value here is always non-negative. Using uint32_t instead of int 
could make the intent clearer.
> +{
> +	int conn_outputs = 0;
> +
> +	for (int i = 0; i < display->n_outputs; i++) {
> +		if (igt_output_is_connected(&display->outputs[i]))
> +			conn_outputs++;
> +	}
> +	return conn_outputs;
> +}
> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
> index f140ad91a..0dc0d622a 100644
> --- a/lib/igt_kms.h
> +++ b/lib/igt_kms.h
> @@ -1285,6 +1285,7 @@ void igt_set_link_params(int drm_fd, igt_output_t *output,
>   			   char *link_rate, char *lane_count);
>   int igt_backlight_read(int *result, const char *fname, igt_backlight_context_t *context);
>   int igt_backlight_write(int value, const char *fname, igt_backlight_context_t *context);
> +int igt_get_connected_output_count(igt_display_t *display);
>   
>   drmModePropertyBlobRes *igt_get_writeback_formats_blob(igt_output_t *output);

Overall looks good to me.

LGTM,

Reviewed-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>

>   
