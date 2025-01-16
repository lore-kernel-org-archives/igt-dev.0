Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC88BC02183
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jan 2025 04:52:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754FC10E8A9;
	Thu, 16 Jan 2025 04:52:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c13IbwV0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF7E510E8AB
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jan 2025 04:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737003122; x=1768539122;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kRs4JBXwqyTPLdEdLnozOMPw9g+boKBuTF8f+dG0Jms=;
 b=c13IbwV0BlMZeuE8yvHo5rTaNWp42p7yrsC4uXgzNR9gAPGxbGTKat2k
 LF0sKRNoIg4tfIAGR9MZqlOrq6cMIRuB8DWG9RZlHAWanEQJmv4JClUX8
 u7ewUNGFCJVpu/nb8w05uUWirzUVCBdVbcY8ZCA+PdAwDghOjBlp5Zl1A
 Md/YFY5VNbM4/9DtGXan38/V5qC8/EdtaEBW9Ac5bhQaVrIRgaTKMzxgh
 cEBTbOW+vCG9AanHtpDEBOaZH+F39FnfC77f9lTDG1vgw2k7UrYNYEvyJ
 1GxD/TP/IrVX8XhhCamk62iDENDGdvMX3ZE5Sz/Q5lXpQVNw4TS3HpdKH g==;
X-CSE-ConnectionGUID: 8cEyWCcJQIKIPmwR9b977g==
X-CSE-MsgGUID: TDTrEzwdRj+MFmOixpoEuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37486244"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37486244"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 20:52:02 -0800
X-CSE-ConnectionGUID: tORNbhT2QnCX0N64c01FDA==
X-CSE-MsgGUID: xsh4yHh4TWuoLBLsRAeAdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,208,1732608000"; d="scan'208";a="105952570"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 20:52:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 20:52:00 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 20:52:00 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 20:52:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wWiON8pmaxLhVyjsq568NuE+6NYgfj13E0tKRY6qyoYqQa2cvE4wFZcYCV0m0hoS+bCC6h5nPI3Glgjq/DAC4TwgUcpx3v9yh5K0BKrzi1erMFNqWHpLaNymVT2kuZn9v0PFEhObGG5YvQvzBj6V2/VlVkGFoaJv3GYhCXTEAdZhvTN/52sMGOsj375ETB/5ywvj/c1hvd5CcNA2TTfU5AcSSMn5rM+ikjm5nPi1Vn5k3vUElx5a8hKKi8ZRN4h5l3KMn9Iqzg9b48e6LuhkcYcQ9t+uW1/MxO68yS6pQ0tYumyroUBIcWFe50nymr4k4jkNGkNmU9EC+sVrGTViMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwJKX54k39N1SRX/obycFft/pXv1yvw6LmGcn0JMFsQ=;
 b=vtKYDCNiOyuPi5nOFCaPaq+kynpPLJDYUGkFULoMsok5TODadG7pMal5iE1ADc9+ZBKehC0srZMAdZWkcqyvP0hr8WzYr+0iDuUd4MzlQr/q2HFn8/EQc6dBikXCU94NjJhrpSdoSDX/6mzgLJV58AcNXFbs16Wk8+h0OnARqInY9/NKrWTxaNMslwCInrNjDHc/kwVtEL6/infskdSBeNCu0VUZzBHQelDdSarPZRvwY1qTvmBaY6aRTmlYK5E3InUS8NcYYOBOKTPe8Xs/2cAV6gE9c14JUozH6+uNxZNhQPrg96loDt3D1eo/Yv0kOwCswZlO2T72o4gBTb8q6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by MN2PR11MB4648.namprd11.prod.outlook.com (2603:10b6:208:26f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 04:51:57 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%7]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 04:51:57 +0000
Message-ID: <9187f0d6-c0f5-431e-accd-c0e3b50e7cc7@intel.com>
Date: Thu, 16 Jan 2025 10:21:52 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v8 1/2] tests/intel/kms_joiner: switch modeset
 between uj and bj
To: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>,
 <igt-dev@lists.freedesktop.org>
References: <20250110042752.32846-1-santhosh.reddy.guddati@intel.com>
 <20250110042752.32846-2-santhosh.reddy.guddati@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20250110042752.32846-2-santhosh.reddy.guddati@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PEPF00000181.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c04::51) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|MN2PR11MB4648:EE_
X-MS-Office365-Filtering-Correlation-Id: 2433e823-c478-4a9a-6d60-08dd35e98130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2lBR1BsMmxvaUVGbno0cUlaczRMMVBZaVB4cHc2ZDUvOHpVekJPWCt4M0xI?=
 =?utf-8?B?THB3SnJ3V2U0Rm00Yk1nN0lEbmdQYTllaG5GZm9RTDBtb1NxZkZ4WnlEQ1F5?=
 =?utf-8?B?ZDBsOTZYek9ua3JNSmw0dWw4WTA0NnNYMlIwQXlJYkZoUk5EWE1mdDdFcmt4?=
 =?utf-8?B?L0lsOWhsK1pJNEo4Z0tjdnZHaWQxOGVGNlpPWjhZSU9ldXhDTm15VnlIeUZY?=
 =?utf-8?B?a1NuNjJkbXFkU1lVQWNIVk9FY3hET0h2WmlRVlFUaG94bnZWRWZKVGwwa2s2?=
 =?utf-8?B?UTJHK0hlZnZDdTZCU2E0STlYWHU5OWRxaGZSeUh2SjgvQ0tkWXRRZVNqOXNP?=
 =?utf-8?B?Ukw3dTY1bVJmNTh4b3RsMUZjM0l5Y3pBTDFIU0F6VGt1KzlBOVh0NUxTd29t?=
 =?utf-8?B?V0Q1NTcxTVhwanBUMXFHNjBLcVVROGxJV3lDUjdJTVZ0WkhwbVRKZ2hNcUs1?=
 =?utf-8?B?NE05dDIzeER3WTQ3eURRNmdTMWYrb1RWOWM0TkVsVXJsc2Z4SDNkLzl5eEo1?=
 =?utf-8?B?WU94bTd1VmNOb1pXYTZON3d4TlJRUnFETjFoQ2FId0FSZ1MwdlBZb2NSWTFr?=
 =?utf-8?B?a3ErbldwOGlyTnk3c3BzLzFtb1U3RFpJeXViekRETkFQOVRtVHBTM0hJaTFE?=
 =?utf-8?B?cm1LNHFCbDBJV05UMmU2Tml5TGR1WDhKcjJUeHFlOGs2TzFnYXBqM1Q2elFI?=
 =?utf-8?B?TDZQdytoZmp6V0l2VEsyYVc4ditKTW8ydmdHU3V2S0FxYzU0ZjF2OUR3UE1a?=
 =?utf-8?B?eWl6TjVNTzhtTVhyNVo4dUJFK3R6cjU3Sk9TT3VtL29aYXNDVkwzaThCa3Vr?=
 =?utf-8?B?OEdVbmFvRjFRWTdUZnN1dWxIZjBBbHRDUjI1TmE0VmVOYzdKQUVNbk1zc09l?=
 =?utf-8?B?ODNnTDV6UzRuSG9KUy9mKyt0UGQ2M2FSeC9HY2tzWExhWkJwTXcrNkJadFVN?=
 =?utf-8?B?SzhTd09xVkpFUjNBWEl5SUg1SFBTY3YzU1JJYk94QWxpUkhiaFhZSFdGQVZF?=
 =?utf-8?B?WmF3L0Z6UHcrNWQvTEZDa2cwRHJNcjdCYVNvdW1EZTZ6bW5zS3U1R3MwRzRw?=
 =?utf-8?B?S0Mra1RNTDgzQWtMeHVBOWd5bE1xd2kwVHNxbDFqTjR1QU85djB6RkZydzJ4?=
 =?utf-8?B?RVduRDY1emJ0WWdRUVQrRmRTSytaT3ppRE5MNUNKcUJJT3VkQm43SU1NYXFU?=
 =?utf-8?B?MFRsVkUwTHhYYTdLTEdFelZmay85Nmt1a1lwN21PVnJKblhidXhsRWtUZXY5?=
 =?utf-8?B?R2pLMEdCVUUxNDl6aFI2QldSUWFaWmFvbGVoaVp4OXF3UStKNTVLUEt5aUNj?=
 =?utf-8?B?bThyQzhYd3pOaXZENEl5MFp1UkYybmNCOXk3WnVYUk5aODlaSUdjYzdOMTkx?=
 =?utf-8?B?bkg1VnFPTGw1WHEzUEtsVEZqQTVpZk45dFo2ZkI5RkpEeEtjYWtzajR3aGFU?=
 =?utf-8?B?WmJ0am0zYTF6STlONmdETk9vTGR0RjhrcFozYllQbzhPNjFIeWt2ckEzQ2FP?=
 =?utf-8?B?UklINDVlWXFXcXdqV1FJb2wwVjk2ZW00eGgxQTJob0VISTRJYngrc0luQTcw?=
 =?utf-8?B?UVpZaHd0YTl4OVloSEx4Qjl4OUN5THY1RmR3TEV2YWliUjRCOEZGU3h5aXVv?=
 =?utf-8?B?TCtJYVhKZDREZ2JyYzJPZnhUTXlVek42cVROOUJnNlcxK3ExS2RmYkd3SEEx?=
 =?utf-8?B?MGVHUGsvYVNvc3hRU0dnVFJLczFSbjJadVV1VTJ5VzQ4WWZ2NG8wclVyQkJ5?=
 =?utf-8?B?VERsSlFuMSt0SFJjT1RZYjFNYVFBZHdEcWJRUStldVdFcS9tRm9JR0Q5VWhI?=
 =?utf-8?B?cDVmNTRZbTIzT1BoNmZHYjRObXI1UFVDN1cvd3d1WHo2TVlHd3ZNM2o1bW4z?=
 =?utf-8?Q?ll/q5vHLWeqom?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1JWaitOYmJyRGQ3cTVOaTZKQmpGM0hNVWh1VWMvcTBrQ2ljZWVvTC9vZ3Az?=
 =?utf-8?B?MndwUlFSdTlIRStaL1FrSGF2b09kVTBsNWJ4ZmFZb2JSQzZRdG00WEw1eVhP?=
 =?utf-8?B?K3IyRVhlRW5URTFjSmMvcUZya1YwV1h5SXkrWkgrV3NwR0drbVZJRkNMZGtu?=
 =?utf-8?B?U1VMOW1GWmZSYXBwbkxMSWc3ckZOT3lzMjB4UHBNZm5OKy9rKzM3K0UwcFh0?=
 =?utf-8?B?a25CVXdCQzVrcm1xeU9GRmZrL0wxUWRBWHVYdlJCSHVCQjJDYVh4cXZ6S29M?=
 =?utf-8?B?azFHUGhvam5McThNWW5mcFlkMG1qNFQxUU95YUxtTGFsT3pTYi9yMFNvS0tB?=
 =?utf-8?B?SjBzdFcxOUkwQ3Eva29QcXZKOHcwQ3krVEpWai9IeUFRaGlndWVVY2hNaTZH?=
 =?utf-8?B?R1BsN3g1ckJ5Ry9DbkJraW5pdTJadjZtSzA4Mmoxc3lPVzA0Q0tuZFhicXJF?=
 =?utf-8?B?OWk4YVljSE1DMkUyZzV2ZGxndER3c0JaaTZJU0tkZFhkSzVjaVZ2bzlaUytm?=
 =?utf-8?B?eTRiQkxqc0h4dmJiZ1h1V2x0bW1QbTYxV1FCd2wzNHg4Qkd1RjE2VG9JNUhK?=
 =?utf-8?B?RnMxbUlUYTczelA3d2NHV1lqZktJK3djVklseEtHbXhoTmJCb0pnWmxONmJv?=
 =?utf-8?B?ZDVHVUc5TU1TZ3NhNjVZSm9FTTJqbm0vWmNtOUpXVmxVZEJSajB0aHdCV1FR?=
 =?utf-8?B?cnNsWk1PR0R0cUNvSG51WEw4VmRUak9vSDdCQUhjTzJ2ZzRBMnJaT3ljUld0?=
 =?utf-8?B?ZGRRcFhTdkx0VzhjcEpWNzEvV1RUbEpPQUFrTU1BMHRkdnExa01hMGVRZ1Jo?=
 =?utf-8?B?OFBFZ0dFd2hGMXdpQUhRUmhHU1ljZG9Pak5rZDBXaVVGSE1FMEw1bGhsNVZa?=
 =?utf-8?B?M3RmdHRxelYyTFdldjdMcW50a3VaZUV0T2N3Q0FaS2ttcHk4WkJYdUdCQmRH?=
 =?utf-8?B?L3JTamp1dHpqVjBIT2V1aytiZXRtU2o0UXJ3NElnZ2VyZjJmTkFEbytRSnY3?=
 =?utf-8?B?RHZ4UThjN2lFcGFkV053cll3cmt3ZVNGelNvRjl3cEI3YmFxQUZOcmJURmds?=
 =?utf-8?B?TXBrRnRxb2c4emdnRzhpY1dxOG1OVXZnY3RSdmw3UFVFMVJocS9vN1ZULytW?=
 =?utf-8?B?T3pBYllXbjlzSTg3YUMwSlUxV2VZVFJTeG92NlhDaFdZdmhscEVQaTRETmt6?=
 =?utf-8?B?V1d0SS9pdkk1YzdKRmhmRStkeUFGdCt4VmxUOWk4dWxFTHBpa1ljUmhKNWpV?=
 =?utf-8?B?RmxPaUlqSGdQMzFrTUhnZnd6MmE5Znk0bHhjSCtPYlhudUtWbGlSanZzUUIw?=
 =?utf-8?B?dFNKMXYrZHZmRkVGOGMvVEt4TG9iN2hkdzcvaysxNFA3WnZwbDJMYjg1L1Bh?=
 =?utf-8?B?Qmg3b1Fpa0VTNXVqNjJJTlJaK2lSdmRMdFdpTXRYNWVMME9ub3VDckhaR05v?=
 =?utf-8?B?Ymp3SWJUSDVDY3Foa3lrK1VmTVNSRURzTjl5R2xzUE1Ib2NFaW9ORG5WNGlT?=
 =?utf-8?B?RjQ3aFZ4TWJqQXB5MG5zQkZvK0VKaGs4MUJ0dENEajRNRzFHMFNZUU5xTldC?=
 =?utf-8?B?Z2JsL0FkdUt3Y0U5WS9wVjNic0F3WHBvKzJiNHlUOWZ2eWprZFRNMnA0TEFO?=
 =?utf-8?B?MGtuRVdESEdLY01yYk9SaTArMEFicGZweFNxMWxyS2c4RlRxclE4Z1RXODh3?=
 =?utf-8?B?YmhVdms0eDBtZ0lRcDk5OSsrbkx5M3NzaU1Sc00xdlNsWFh4TmlsWHVhRGRk?=
 =?utf-8?B?VHZBOG5VMkJnZG4ydHZzNTVHang1NTJ5TDU4SW1ONzQxTnNaU1BBRGJQTVVt?=
 =?utf-8?B?aWVnV1B5cmJnMEVpQkkrUFE3dFNpTFJvSU9acFlhSFZ4T3QvUDNNVkUxVVQy?=
 =?utf-8?B?N1Zrck43L1Bqb2RhUDJ6SVQzVlptSUMrditEaTFLR2MwY05sTGpIL2hhQ1R4?=
 =?utf-8?B?bU5CTW1NLys4aWZQZGV0WVppang0VFFIWW1ZRkZIT29IckFVNG8wSTF1UXVo?=
 =?utf-8?B?S1JidDJ1NDBYOWxkbkFNTmZpdk8zNUg0cFhsMzZDbVcwL1NrQjhWNUs3eG5F?=
 =?utf-8?B?UkNaaU02bjlMeWdnTmNITXRPdHJmb1N5UHRrTG1SSnpka2V6R1hBMG00MEs5?=
 =?utf-8?B?SzRKNnpXbUE3cm9IWFd6RjNBbXZXbFhYQzhiK3d4MDQrNDRpSVpWT0RIQnZr?=
 =?utf-8?B?VGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2433e823-c478-4a9a-6d60-08dd35e98130
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 04:51:57.1442 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BwWxNHPLcwdfln7EvGT473lFEeT7Lt+13GfmiLAPClOYAHsmTPXaVNyWp1E+7rdwYp1GNTJheoQCT+dTlz5ZIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4648
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


On 1/10/2025 9:57 AM, Santhosh Reddy Guddati wrote:
> Add a subtest to validate switching from ultra joiner to big joiner
> and vice-versa.
>
> v2: Add new subtests for switching without force joiner (Karthik).
>
> v3: Start with uj to bj switch, if not available switch to force mode.
>
> v4: Check for uj, bj support before starting dynamic tests (karthik)
>      call reset_connectors after forcing to uj.
>
> v5: Add a separate function to switch modes and execute test for each
>      connected supported output (karthik).
>
> v6: Add force_joiner and dsc supported checks, remove redundant checks
>      while setting modes (karthik).
>      Remove display_reset during switch-modeset, intentionally force
>      big joiner and then switch to ultra joiner.
>
> v7: Remove redundant switching modeset.
>
> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/intel/kms_joiner.c | 97 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 97 insertions(+)
>
> diff --git a/tests/intel/kms_joiner.c b/tests/intel/kms_joiner.c
> index 418ff26a6..086cfeb71 100644
> --- a/tests/intel/kms_joiner.c
> +++ b/tests/intel/kms_joiner.c
> @@ -71,6 +71,9 @@
>    * SUBTEST: invalid-modeset-force-ultra-joiner
>    * Description: Verify if the modeset on the other pipes are rejected when
>    *              the pipe A is active with force ultra joiner modeset.
> + *
> + * SUBTEST: switch-modeset-ultra-joiner-big-joiner
> + * Description: Verify switching between ultra joiner and big joiner modeset.
>    */
>   IGT_TEST_DESCRIPTION("Test joiner / force joiner");
>   
> @@ -161,6 +164,85 @@ static enum pipe setup_pipe(data_t *data, igt_output_t *output, enum pipe pipe,
>   	return master_pipe;
>   }
>   
> +static void set_joiner_mode(data_t *data, igt_output_t *output, drmModeModeInfo *mode)
> +{
> +	igt_plane_t *primary;
> +	igt_fb_t fb;
> +
> +	igt_info("Committing joiner mode for output %s with mode %dx%d@%d\n",
> +		  output->name, mode->hdisplay, mode->vdisplay, mode->vrefresh);
> +
> +	igt_output_set_pipe(output, PIPE_A);
> +	igt_output_override_mode(output, mode);
> +	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> +	igt_create_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
> +			      DRM_FORMAT_MOD_LINEAR, &fb);
> +	igt_plane_set_fb(primary, &fb);
> +	igt_display_commit2(&data->display, COMMIT_ATOMIC);
> +
> +	igt_display_reset(&data->display);
> +	igt_reset_connectors();
> +	igt_plane_set_fb(primary, NULL);
> +	igt_remove_fb(data->drm_fd, &fb);
> +}
> +
> +static void switch_modeset_ultra_joiner_big_joiner(data_t *data, igt_output_t *output)
> +{
> +	drmModeModeInfo bj_mode;
> +	drmModeModeInfo uj_mode;
> +	int status;
> +	bool ultrajoiner_found;
> +	enum pipe pipe;
> +	bool force_joiner_supported;
> +
> +	drmModeConnector *connector = output->config.connector;
> +
> +	ultrajoiner_found = ultrajoiner_mode_found(data->drm_fd, connector, max_dotclock, &uj_mode);
> +	force_joiner_supported = igt_has_force_joiner_debugfs(data->drm_fd, output->name) &&
> +				 is_dsc_supported_by_sink(data->drm_fd, output);
> +
> +	if (ultrajoiner_found) {
> +		igt_output_override_mode(output, &uj_mode);
> +	} else if (force_joiner_supported) {
> +		status = kmstest_force_connector_joiner(data->drm_fd, output->config.connector,
> +							JOINED_PIPES_ULTRA_JOINER);
> +		igt_assert_f(status, "Failed to toggle force joiner\n");
> +		uj_mode = *igt_output_get_mode(output);
> +	} else {
> +		igt_info("No ultra joiner mode found on output %s\n", output->name);
> +		return;
> +	}
> +
> +	igt_dynamic_f("pipe-%s-%s", kmstest_pipe_name(pipe), output->name) {
> +		set_joiner_mode(data, output, &uj_mode);
> +		/* Switch to big joiner mode */
> +		if (bigjoiner_mode_found(data->drm_fd, output->config.connector,
> +					 max_dotclock, &bj_mode)) {
> +			igt_output_override_mode(output, &bj_mode);
> +		} else {
> +			status = kmstest_force_connector_joiner(data->drm_fd,
> +								output->config.connector,
> +								JOINED_PIPES_BIG_JOINER);
> +			igt_assert_f(status, "Failed to toggle force joiner\n");
> +			bj_mode = *igt_output_get_mode(output);
> +		}
> +
> +		set_joiner_mode(data, output, &bj_mode);
> +
> +		/* Switch back to ultra joiner*/
> +		if (ultrajoiner_found) {
> +			igt_output_override_mode(output, &uj_mode);
> +		} else {
> +			status = kmstest_force_connector_joiner(data->drm_fd,
> +								output->config.connector,
> +								JOINED_PIPES_ULTRA_JOINER);
> +			igt_assert_f(status, "Failed to toggle force joiner\n");
> +		}
> +
> +		set_joiner_mode(data, output, &uj_mode);
> +	}
> +}
> +
>   static void test_single_joiner(data_t *data, int output_count, bool force_joiner)
>   {
>   	int i;
> @@ -593,6 +675,21 @@ igt_main
>   		}
>   	}
>   
> +	igt_describe("Verify modeset switch between ultra joiner and big joiner");
> +	igt_subtest_with_dynamic("switch-modeset-ultra-joiner-big-joiner") {
> +		igt_require_f(ultra_joiner_supported,
> +			      "Ultra joiner not supported on this platform\n");
> +		igt_require_f(data.ultra_joiner_output_count > 0 ||
> +			      data.non_ultra_joiner_output_count > 0,
> +				  "No ultra joiner or force ultra joiner output found\n");
> +		igt_require_f(data.n_pipes > 3,
> +			      "Minimum 4 pipes required\n");
> +
> +		for_each_connected_output(&data.display, output) {
> +			switch_modeset_ultra_joiner_big_joiner(&data, output);
> +		}
> +	}
> +
>   	igt_subtest_with_dynamic("invalid-modeset-force-ultra-joiner") {
>   		igt_require_f(ultra_joiner_supported,
>   			      "Ultra joiner not supported on this platform\n");
