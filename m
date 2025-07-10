Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3EC2C83F1A
	for <igt-dev@archiver.kernel.org>; Thu, 10 Jul 2025 07:23:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B073810E88F;
	Thu, 10 Jul 2025 07:23:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YVdX/6SO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE5310E88F
 for <igt-dev@lists.freedesktop.org>; Thu, 10 Jul 2025 07:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752132221; x=1783668221;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ObGQqgAAC6EChrwg11mmpvGzmUIMBwvHUPyTxfioe3w=;
 b=YVdX/6SOOL3pp4IsRiLiS5kxLC72G8vUlyJNxHWNRf6/Nf11m3y/fbkf
 61mBAk53ZJpkkGAijz23Pw6MrcczmCVw9H7VSCrpwJtoXNIU0QEvlpKS9
 fw2CXgbWu+d+qWzq6d67+dmyKoBo9asTur1abdC5SYTFXaSgPWiyuYhI4
 h0hO0phj9u+fM665zsAvzAtTsi2gma9nBcUD+MeSITsaLl6JwLs91oe0W
 XxCCdb26DIzWFxVm/gAll4eoy9aR6i37ZzQNbsvfN7FsgEsRU+Uvsifgz
 dC8/6fFJbpif4Dd5vPi26EeYieFMJbYsEGOWpXEi0ohD59L0y7ovWf0TT g==;
X-CSE-ConnectionGUID: B/gQ40D4Tsm2C2WGr7NQMg==
X-CSE-MsgGUID: HH98kDCKQjOJQEWkMMUfAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54257360"
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="54257360"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:23:40 -0700
X-CSE-ConnectionGUID: Mr091Y+MRtm/C95Lx/YBSw==
X-CSE-MsgGUID: 4XsIOddFRn2GrbuiKSRM5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,300,1744095600"; d="scan'208";a="160324913"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2025 00:23:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 00:23:39 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 10 Jul 2025 00:23:39 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.64)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 10 Jul 2025 00:23:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/jTfP3cfjaziX75dvCpxmupho+5NIUoaoSCW6SAj/o7R7IMzln6EbPJZBVZmdmRd3lv3z/uJMznK2vM8Vo54F2a/b3Q8Nwp8ApxmXUZCAWushgAwbBLFC67Qww47PRdQPvEJISpGGL8OgkLxKnuMuoXABI6L/fYqWvcEuMFgeB9nHmaYcOKDveEh0g708xdU0WSvRZ33U849K6X5SODDe90SWxvvO8VjXfMh6v2EtT5KlIJ2YHYFFESBYFMcYTyc16NMzpOEkrqCM0tyy31zFcIsgQdbTCoiitX5GXr87U+prEEkqpyHdsEl+eyekzQVbRZ35x+S4xDzJaN+8eiGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jnebCrDsYpqN8/DtVfx+T4Xi2eYqQcbVtIqEvSfs3mg=;
 b=x3JUJidhO3huhtdH/WTtIl59A6/kNPo/LoMPUIx802ddRkVJJe04kCQtLaPzTwoeVQbhGsiGAsLfOQk9kwWL9i2Q6tpDZKacbTT4oGjbF9APNRboqy9+z1e/Ks/Nrpu8rXoVKSPVe5f8nbxJd+1ZZttoeu6yhQs4CjMzBpiXo9M9wzjPoCeEY6nP2XFDn7orsrZ0fPxZO0LWpdXe5g6Ffd5iX9t2AGuZymz+7jprZyP7vPKPyxYBng1rA53Vzk4NVRW/DxkzbV0PsLEeAwFmfvlKV/3WE+pwqA/Sze2vN/wKpEszZIgPhMnzQIrVolIcF7LteDFouIWbACZK+MysBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 PH3PPF5D8CD6E8B.namprd11.prod.outlook.com (2603:10b6:518:1::d25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Thu, 10 Jul
 2025 07:23:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 07:23:22 +0000
Message-ID: <f054aafd-37fc-42ac-a343-d29ba8a05b6a@intel.com>
Date: Thu, 10 Jul 2025 12:53:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [i-g-t] tests/intel/xe_wedged: Add new test csc-wedged
To: Sk Anirban <sk.anirban@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20250708092302.2553111-2-sk.anirban@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250708092302.2553111-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|PH3PPF5D8CD6E8B:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b43072c-a610-41cc-a45e-08ddbf82a6a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YmRiVUxzbkhEVXZ6ZVY1a2NRTERibCtFN1NzbFJYT0I5UVRwbEJoRTJLNDRl?=
 =?utf-8?B?RlRHbWtSMDFsdmRNeElZMVFSaTFaNlROaUZhV3kvTmYzc1VWMXlpMFpzOXgx?=
 =?utf-8?B?Tk1xdXFnQ0ZkSUhiTFQyamMyemphVGM1bmNCakE0WmhsbERsNlIyVkI5L0Jv?=
 =?utf-8?B?UXVtSmV0Q05BQVI3ZnRTclFBSVNSYjAzNncyUTZwRFBnMjFiRFZ2NUY0SGVT?=
 =?utf-8?B?aFdBN1FlL0pHQXVhR29hMUlaMnZwdU5LUkVFenlaak5LYUpnOXZaaHFsMC9u?=
 =?utf-8?B?WkZURXJBUndlRmdxZGZFTmVGQ1E4eXV4WmpYUWxGaHhNTncycFZnWVNxSmhR?=
 =?utf-8?B?WkptcFUxMU5SU1pDR2Y5N0VCdlR0Vys5WEFhbng4YXJ4ZXE3aENiV2tBbzRv?=
 =?utf-8?B?WGY3elhzeHBKZDZwZWF3SHNybXFmcmdMTnh3T0xOc2JEZU41dFhyYWUrbEJy?=
 =?utf-8?B?ZXVJNGY1RVBGeUxaTXN4SnJjZDZWbjM1WXNUS1MwUUc5a2Y4dkw4cDdqZVNl?=
 =?utf-8?B?Wk1HNWVXZ25CRnovTFVNWDM3ang1OGd4bHNNRmt5blo3eUFJZjQ2Z0diYTFq?=
 =?utf-8?B?ajlRaGFNK2V6bHRacWE2YitnWm9SVGpVWk9heW8rUXJBMG43OGtuQUx5eFBV?=
 =?utf-8?B?MGhKNnFrVVJHbFZCckdYTzFCbkVhL0lKSG1RRnFqTU92SVVMMDgrVWM1dUhC?=
 =?utf-8?B?TkdNM3ZNWFNISlA4ZVFRQi9ZK0QxTDJSU1hRa3hDR3pZSGFiaEp6alV3SmNX?=
 =?utf-8?B?NHZSZkZCK3BoRmNsQ3hEVFk1Ulo3K3FVZFZJK01oRjFWOWF4ekRQVnVPTGNh?=
 =?utf-8?B?eHlkWU8xNlk2T0U5RmVGb1NSYk5GOE9tS05qaWdPdVpvVHhQZkp2SWRCejZC?=
 =?utf-8?B?UGpPb2s5QWprN0FQVmx0UlZjZFB5dXhtZ1ZaVHBPSWhtOVY1Vkw0MklFYUFm?=
 =?utf-8?B?OEhIRVl5UHhEczgzRTVrbHdZTEY0b2VxdDNGK2FoY21LOHMvZldUd3ZpMDkr?=
 =?utf-8?B?SGdvYnhRVDYvcjkyZmUvaDBlL1ZiOEhMODZ0OWdPZ0M5NTV2K0Fxc0xGYitj?=
 =?utf-8?B?eXNpY3ViTjltZWlucUZJVXZjazlFNmtIeEN3K3ZUaTBmRHZ5ZHBOaEJJSXdB?=
 =?utf-8?B?NDBYTDZGSUJEQmR6L3ZEOW5DanZkaDZnWlJNMVlhWnZ1MkZUMWszeXVGL1VR?=
 =?utf-8?B?KzVZTlRZRjcyNlBBL2I1Ulp2V24vMmd0NEVPZmJ6QUFKUld5bDE4eU9McCtI?=
 =?utf-8?B?a2xGNFNST3hQdlRqdGhtRXlVMlF5QUJGeThXSCtUU3pYeXdaVUc4ZkNnM1Vt?=
 =?utf-8?B?b0ZzOFJuZjkrMVltWVlncnVTNXVDalhrczdYOXdNZzk4V1oxcStndXo3Ni8z?=
 =?utf-8?B?UlAzR3pla1VaK0VXVHdDOXd1M1p4Zi85OGo4WG9HMkJhZTIxZVo2RnJjSTNZ?=
 =?utf-8?B?ZmpWSnNPUGptVnk0SXpNZnF5OG53QmJHZFpqMGxLRGorcnVjS0JMUkhOdDFj?=
 =?utf-8?B?NlNnRG9KYVBXYjZ6THhWUzg2a3ppM3hRL3BCVTJ3bFhPckwvSzhkdW5tUGVz?=
 =?utf-8?B?ckR4bjZTaVRQZHJVZWhwb2JNdGVXa0tFbFhNVTYzZDFJdkhUTFFJYkVuNElN?=
 =?utf-8?B?a1kyaisxMHRIV3grV3R5a0t1YjVONEJzRDV2c3RqMHVQeHU3bS81MHhSRjds?=
 =?utf-8?B?QThrUzFtZ1RNWVkrT1pGR01Ob1RDMGJUNFFMODNxUmszRGtIMkxXT2xIb1hi?=
 =?utf-8?B?KzlHRFVOUlBDOXh2OE5lOVhQaXRJMnNMelVWYjVua21PUjhqbnozR0hnMUQy?=
 =?utf-8?B?bHZadHhHVjBQN3pSb3cyME5tT0pwdlZOUDVuZkdLM2hhN1ZjQ2p1Z2FoRHFT?=
 =?utf-8?B?NWFUYWxpNmdRSThWdVF1aUErR3V5Q3FBTjc5WUl5Tng0bUxmbUpSSTd2Zm9p?=
 =?utf-8?Q?u6uTWND0ZCQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1IyazdncE9WcmVycC9qakR1R1QrRFNINWplWXNmeVZjbnJxR3FRZ3MxQjdF?=
 =?utf-8?B?c1dmOHRBbDc4SHRVTTFvUHYvRGhWY25td3Z0cnZJSUxyNDE1UWI0K3lYUXY4?=
 =?utf-8?B?Tjk4OHlYOS9HV3E0YnZ2cWZlMzZnejlEa3Rlai9LRWRBMkJvYzVYdXVtc0M4?=
 =?utf-8?B?RWJqdUpSY2UzN3NYbnVCWUp6SEIreWlrblVwRjlqZ0dCMmNDMHNZTzJCQ0M1?=
 =?utf-8?B?UjAza0k3ZnhqYUZFRWRhdHpGeXJ6QkNsOU4vNDF2aytodEN0d3pJSXc3alFl?=
 =?utf-8?B?VitldmdlVi9KbmtMTHJWUlgwY2NLU0laSWpWbTVCLzlHWWo0TkxuTCtkSmhN?=
 =?utf-8?B?MnFCRHdUNFI3TDZVVXFvMjNSekNJdW1PeXJhem5RNGFzeXlBcE1xTWNIbXB1?=
 =?utf-8?B?ZWxFa291VFptWW85NFdhZEtQeVBoRUlCUXZuTUJLY2dxeTVuR0tDTHpPa0Zp?=
 =?utf-8?B?eDF4UHRGM3ZmUzRmTjNycS91bHRqekFHNDBJRHg2NFg4a3ZHbEhiaFAxeGJX?=
 =?utf-8?B?R1ZqQlVwUTlyNUNTZ2xyeUVaaUdlNWJjdmtnM0tMUXdLbHhGUWNrT1VyYitB?=
 =?utf-8?B?ODNTWG9VdXlNcnVoWXVFWkxDSEdNZzljN0J0N3FmWmx6OERwSXFiQkk3b0pz?=
 =?utf-8?B?dC9XWnVUTGd6Zmd4aHhxektFQ1V6eXhsSmcxdXExeS9JK1ZsVFliVDRSOGZV?=
 =?utf-8?B?TU5sSEpic0haYWhwL21FZ3ZKK25yd3Y3ZW9vZnJKbXNkOGZFY242L2FHd2Nw?=
 =?utf-8?B?R0M5cFZJcFNhUDd3anZRZ3lwMkZIZUliak5zZ2Q0cUtlVnE3OTV2b2JpWVNV?=
 =?utf-8?B?M3dBT2JUdG5BNlN1NVVSSmNQRkp0cUx1R0ZQNkhmeWVkR1dtSTZxaHBHK3pV?=
 =?utf-8?B?WDBMUjNyUkpzUmtvdU9kVUJjZC84Vk5HN0pQamFFWTlwSXFlOW42YitqaWow?=
 =?utf-8?B?ZHd6WkNjMm5WMHQrckFvT0piYWp2Nlg2cTZLRDY2MWppT2xyaUxibzdkZEUw?=
 =?utf-8?B?ZjJJeE1uNXJzMW5DNm93RUQzZ0ZyV3NxNTJLR0tESHZEVzlhTDd2aHh6RTkw?=
 =?utf-8?B?cS8wU09iOFJwVk0xT2xCZ2RNVityYTZhV0VXZDE1QTIvNTVVVkJCeHBxQTRz?=
 =?utf-8?B?Zlk0MHVSNG56aFRWSDh2a0t0REU1QkRrOFBFZ0E0Y2ZCbHYyS3I1eVArL2ZC?=
 =?utf-8?B?UCtMYjNBUGV3dy9wUDFVRDFUeUprWFIyTDErYkVmMnkwK3dXY2lBUUcyWG9s?=
 =?utf-8?B?NVdkT2Z4REJnNnFoU1g1a0dveUNSVGo2Tk0ralAwRWlLMzZtOWhzd0ZZZllP?=
 =?utf-8?B?S2wvNEpjdmRKT3pXSEoxMDN6cXhBSWxWMXdRUFVqVlN3c0pTT3ZRczRvOEJI?=
 =?utf-8?B?WTcrV0ZycE13c0hIQmp3TjJxd0s2dTdRdWVQUXNUKzduWEVKWkJ5OHAyc3Jx?=
 =?utf-8?B?R1E3ZXhGaHU3VTZ5cHlWbWo3QXFLZHl4UDhNRzRVZUNMMlpER0xrWTE1TmdY?=
 =?utf-8?B?Z0hNTkJXdFRzUHl0c3E2UTEvVUZRVUNPL1lQbmVkT2hFOXNDZzFxWEpXbmlN?=
 =?utf-8?B?ZEsvRDhDeGY1cEw3RkMxRE82SVVremI4c3MxcThUSUMxL25PT0NmaHFWTDZ3?=
 =?utf-8?B?eDRBeXBIeGh6R3Vtb292cTV6L3kyTUl1WUkxNGdnNzIvWEpKMHBVMUk2Y3Vw?=
 =?utf-8?B?L0dWdFgyRU1Da2RqMlV4UTlsY2JHN2pIMGlrS2NISWJ5blZ3TFRWTHhnNnBF?=
 =?utf-8?B?SGdJVXRSM25jcVkzNzdUUUdXWTFhbmpuSThFL2NJT3htekpYdW8zVlFPdnRM?=
 =?utf-8?B?MFpYNXdjV3M0WEd1UDhZc0g1ZGhLK0N0emFpUy9MaDQydlpkbHprM2dIMjk2?=
 =?utf-8?B?NUNUc0x0eHpTUlY0MmxtaHE5NFFrUEcwZWdzQ3hWU01GcUdFZnFuZW9LM2cw?=
 =?utf-8?B?SWp4NUhNcHJ6WGZXYlNDRGgzQlRZWFJrdmpLdDBVTzc0YURvaTAweFNkUnJm?=
 =?utf-8?B?bGoyaU9JZ25BU0t4ZktoZTdzc2xyTjREQzV1bXZWZ3JJdTl1L3dDRnRZRTUy?=
 =?utf-8?B?WkRBc0FZblAvTjU0M1hBL295a3FSb0Rtb1BibzNFZlhwWmUrbThqRTZ6MVdk?=
 =?utf-8?Q?9NwULY24/m0l+0Nhva1LEVSQ7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b43072c-a610-41cc-a45e-08ddbf82a6a5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 07:23:22.3108 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YIEOFg4eslXRjRw17K1wPiKet/VQCZUO0CuXI+/4L8ENfYOi005WI2FQN8Nl7mqcWcdlHpCrD8Fr+wMHwPj9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF5D8CD6E8B
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

On 7/8/2025 2:53 PM, Sk Anirban wrote:
> Inject a CSC error through uevent to cause the Xe device to enter a wedged

Add details about survivability mode. What is the expectation of the test

Add a link to kernel patches

> state. To return the device to a normal state, reload the driver, as
> the wedged state can only be resolved by rebinding/reprobing the driver.
> 
> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>   tests/intel/xe_wedged.c | 85 +++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 85 insertions(+)
> 
> diff --git a/tests/intel/xe_wedged.c b/tests/intel/xe_wedged.c
> index 7fc7ca9eb..b29e9bcb5 100644
> --- a/tests/intel/xe_wedged.c
> +++ b/tests/intel/xe_wedged.c
> @@ -14,6 +14,7 @@
>   
>   #include <limits.h>
>   #include <dirent.h>
> +#include <libudev.h>
>   
>   #include "igt.h"
>   #include "igt_device.h"
> @@ -46,6 +47,46 @@ static void force_wedged(int fd)
>   	sleep(1);
>   }
>   
> +static void force_wedged_csc_error(int fd)
> +{
> +	igt_debugfs_write(fd, "inject_csc_hw_error/probability", "100");
> +	igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +
> +	xe_force_gt_reset_sync(fd, 0);
> +	sleep(1);
> +}
> +
> +static char bus_addr[NAME_MAX];> +
> +static int check_survivability_mode(int fd)
> +{
> +	struct pci_device *pci_dev;
> +	char path[PATH_MAX];
> +	int dirfd;
> +
> +	pci_dev = igt_device_get_pci_device(fd);
> +	snprintf(bus_addr, sizeof(bus_addr), "%04x:%02x:%02x.%01x",
> +		 pci_dev->domain, pci_dev->bus, pci_dev->dev, pci_dev->func);
> +	snprintf(path, PATH_MAX, "/sys/bus/pci/devices/%s/survivability_mode", bus_addr);
> +	dirfd = open(path, O_RDONLY);
> +
> +	return dirfd;
> +}
> +
> +static void intercept_udev_events(struct udev_device *device)
> +{
> +	const char *dev_path = udev_device_get_property_value(device, "DEVPATH");
> +	const char *wedged = udev_device_get_property_value(device, "WEDGED");
> +
> +	igt_assert_f(wedged && !strcmp(wedged, "vendor-specific"),
> +		     "Expected WEDGED property to be 'vendor-specific', got '%s'",
> +		     wedged);
> +
> +	igt_assert_f(dev_path && strstr(dev_path, bus_addr),
> +		     "Expected bus address '%s' to be part of DEVPATH '%s'",
> +		     bus_addr, dev_path);
> +}
> +
>   static int simple_ioctl(int fd)
>   {
>   	int ret;
> @@ -208,6 +249,11 @@ simple_hang(int fd, struct drm_xe_sync *sync)
>    * SUBTEST: basic-wedged-read
>    * Description: Read wedged_mode debugfs
>    */
> +/**
> + * SUBTEST: csc-wedged
> + * Description: Force Xe device wedged after injecting a failure in CSC
> + */
> +
>   igt_main
>   {
>   	struct drm_xe_engine_class_instance *hwe;
> @@ -300,12 +346,51 @@ igt_main
>   		igt_assert_f(str[0] != '\0', "Failed to read wedged_mode from debugfs!\n");
>   	}
>   
> +	igt_subtest("csc-wedged") {
> +		struct udev *udev = udev_new();
> +		struct udev_monitor *monitor;

We can use this instead

struct udev_monitor *mon = igt_watch_uevents();


> +		struct udev_device *device;
> +
> +		igt_require(igt_debugfs_exists(fd, "inject_csc_hw_error/probability",
> +					       O_RDWR));
> +
> +		igt_assert_f(check_survivability_mode(fd) < 0,
> +			     "survivability_mode sysfs available");

why?
> +
> +		igt_debugfs_write(fd, "inject_csc_hw_error/verbose", "1");
> +		igt_assert_eq(simple_ioctl(fd), 0);
Is this required?
> +		ignore_wedged_in_dmesg();

Ignoring the interrupt message and runtime survivability also might be 
needed. Can check once kernel patches are merged
> +
> +		monitor = udev_monitor_new_from_netlink(udev, "kernel");
> +		udev_monitor_enable_receiving(monitor);
> +
> +		force_wedged_csc_error(fd);
> +
> +		device = udev_monitor_receive_device(monitor);


> +		intercept_udev_events(device);
> +
> +		igt_assert_f(check_survivability_mode(fd) >= 0,
> +			     "survivability_mode sysfs not available");

you can add both of this in a single function 
(check_runtime_survivability_mode)

Thanks
Riana

> +
> +		drm_close_driver(fd);
> +		igt_kmod_rebind("xe", pci_slot);
> +		fd = drm_open_driver(DRIVER_XE);
> +		igt_assert_eq(simple_ioctl(fd), 0);
> +		xe_for_each_engine(fd, hwe)
> +			simple_exec(fd, hwe);
> +	}
> +
>   	igt_fixture {
>   		if (igt_debugfs_exists(fd, "fail_gt_reset/probability", O_RDWR)) {
>   			igt_debugfs_write(fd, "fail_gt_reset/probability", "0");
>   			igt_debugfs_write(fd, "fail_gt_reset/times", "1");
>   		}
>   
> +		if (igt_debugfs_exists(fd, "inject_csc_hw_error/probability", O_RDWR)) {
> +			igt_debugfs_write(fd, "inject_csc_hw_error/probability", "0");
> +			igt_debugfs_write(fd, "inject_csc_hw_error/times", "1");
> +		}
> +
>   		/* Tests might have failed, force a rebind before exiting */
>   		drm_close_driver(fd);
>   		igt_kmod_rebind("xe", pci_slot);

