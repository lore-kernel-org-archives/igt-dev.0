Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D0ED3B7EA
	for <igt-dev@archiver.kernel.org>; Tue,  9 Dec 2025 07:08:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADC010E122;
	Tue,  9 Dec 2025 07:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g5lfOj/P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A023A10E122
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Dec 2025 07:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765264106; x=1796800106;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=KTvfD73IbchY1uOtTYvaSGx2nfDqTrH7UUoPiiSUci8=;
 b=g5lfOj/PrWBIxKM9B4C/rijO8EEjdGUpInr2tus+DlFXgAPwlEUW3i0R
 8kQeEhwPOwQyET/mJV3Sut7gbwwlhzjEAbhJiKjKOiAvWMETWM4+o8w1L
 YRXOnPye2ke8jBmOas1ZLu5bCHhbhrsYjlNnnvdHp+YTAqnReFpJf4737
 eKX+7CBWiQoA/x+lEkXYCmyDb4OqM64ZOH5S7J2kR3Umfj9qLI67i1ZgQ
 iJvyfz2kIEgibafbJpW5eiIGBt1uVWsYbcLSfu9po5b62paUSOf4HW8L1
 Ey79r9HG28sDA9oTx8vV8U9YC1pTJjgvIR8uH4MjtmBNaqJfhRrVp8EOm g==;
X-CSE-ConnectionGUID: 9zNPEdUzSLW4J3Xyem4/6Q==
X-CSE-MsgGUID: d1J3ZcDPQYql4y7vF8R0/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="84822129"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="84822129"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 23:08:26 -0800
X-CSE-ConnectionGUID: r6NxpKVxRee4Bzb6cZi/jw==
X-CSE-MsgGUID: RhP9iNLKTNGH2gWnk9jCDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; d="scan'208";a="219499781"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Dec 2025 23:08:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 23:08:25 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 8 Dec 2025 23:08:25 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.60) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 8 Dec 2025 23:08:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bqFkw6TF+X7bv1hsXjtiML5fnlG7HdiRNq/ufnLBhpgSniWvDugM4Ak5756IgfJB/jjPLbHcGGrbC26Tx6ZwtVzG8rdk85N3ocXaAhS3q2YVjnJQG4ukPzUPSxCZLZzjqSVMS0rfWStO/ZJAXBxcbcKXFO9B3iETr59sB8AZLyltYZ40EU4yj+rjM+TzfG6sXsQR/PVzW/PYZeF0GK4hwzsW7vK/7i4S+RxyTO9ntdzIPXpr5kpMFdgHLXoe8Up7dwmIswBD6+0mny/D58ZisG4gM+nt6jG068DDLbxyTHsPmTXpFpTgl2bAoXDgyHsyAzT+6aJRixUKrivpzydGVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjT5nAmj7l9LuXu9dn9c1yMWL12bSq3n1KDwINnzm3o=;
 b=xg6R5M01thwLS4zs9usGfUNn2iAS8RG+J9VTUUqoeFf0Q5valErvVkmknRHEhHLAb8Y/mxcy3SFoSa1NP5h9+IfYkz71ihhNUiGpo7NBrgJ4ZZvR8PDavpdE34YlfWr8d+TMRg2NXsfbhQnegZnZFIuKbQEd64SZ1MrHmUTCPaxTbd4NnljYFPvzWi0RwSOEODek8dyhZfWsOi0Qe3CFRB6QSTHJD96HW+0UJ3nPhxC9mLmyGft/dm+qXOmnibTKwuyCJQToEmPAO5kpXfA0dOo08+2JkTbXX+4YLG831Ep8dikBjvruK8oA98iV5VaT6diBysK5zyRtH6+4byDfWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com (2603:10b6:a03:488::12)
 by SJ5PPF3D06B1BFF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::822) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 9 Dec
 2025 07:08:18 +0000
Received: from SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525]) by SJ1PR11MB6129.namprd11.prod.outlook.com
 ([fe80::21c3:4b36:8cc5:b525%5]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 07:08:17 +0000
Message-ID: <09998878-3dd4-4ec3-9ce8-ed19663728ae@intel.com>
Date: Tue, 9 Dec 2025 12:38:12 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t,v5 09/13] tests/kms_color: Add helper for plane
 color pipeline tests
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>,
 <alex.hung@amd.com>
References: <20251205195312.1234330-1-swati2.sharma@intel.com>
 <20251205195312.1234330-10-swati2.sharma@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <20251205195312.1234330-10-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0031.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::8) To SJ1PR11MB6129.namprd11.prod.outlook.com
 (2603:10b6:a03:488::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6129:EE_|SJ5PPF3D06B1BFF:EE_
X-MS-Office365-Filtering-Correlation-Id: bbda11dd-5c27-46c2-6fe5-08de36f1ba56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?S0xSMzgwQlV1YWJHaUJyMEVVUW5CSXFoWGgwdlA0d0VmMWtxTzkxUTc4dkg2?=
 =?utf-8?B?VjIxV0VKMk5MWWJSMURVQzZRVHEwRGpTS1lTeFlNVG5CSys4TmNkT3F1bHVi?=
 =?utf-8?B?K2FMcTR2TkNzV01tdDZHbzA4NVhlMG1yTFB2Vk56dnl2ZHJCRVhCM0d1SHJF?=
 =?utf-8?B?TVZISHdRQW5CKzdEenMveTdPVlpMbXNQTENHMS9WMGlKQWZiY2x2R1ZqOTFm?=
 =?utf-8?B?dXV3OFY2M3hrYmgzVTBNeTA5Z0tKbXdRa1RaY2xnVmxKYkdHSUtFTHJhSmNK?=
 =?utf-8?B?WDJaZ0VOb2hMTko2eCtSckFlSEJsOUJZamhDSGlKMHRVbHl3bGhUdUZVVm9v?=
 =?utf-8?B?Rm5VeFcyRXFrQS9KK2l5WlhNcFp1UHZCelRmTXhFNVFvWWZIMmVYellpc1ZY?=
 =?utf-8?B?eStmRmZ3Vjc0TFg0Tlg2N0lmWGxUQjJTUWJSOTY5d3RlQjFKZUhvc1hZeVNK?=
 =?utf-8?B?TFJYTXNCdXZoZStwNC8xQ1FhYVdzNU05ejFML1F0Um0vclFDQ0tob1JiQS9R?=
 =?utf-8?B?M0FMbUMxRC8yMGY1SzlCL3NValJhYmVFMjdTbzFQT082UDB4dFNNWjRUNjRi?=
 =?utf-8?B?SVI2Q1FicU1UY3BDU1ZLV0ZmQ2pLVmFiS2gwTDJEL0I1Lzc0RGlscFQxS21D?=
 =?utf-8?B?ZUxZaHZVQXdrRm1tL1NPVnRjREJ0Y2x1UVRRdVFGaCtVQUFlVi9BQVFvYlRU?=
 =?utf-8?B?VTdqQzc3RXFTSU5rbVJhM0VybUJFY0p4M1pCK2JPak9xd1VtSjhEWUl3UW5C?=
 =?utf-8?B?bXp6Zlk1RlljODNGZDRza0wyQ2RLWXB2YkV3T2ZpNVpzcUIxV296SzRUcWJ3?=
 =?utf-8?B?dDFPWVZGenJLamdxbUQ5Y3BmbUhlSzRubHJPbEw1SGk3MXZpN1VwbjRCRG93?=
 =?utf-8?B?SzIzWkhoKy82V1lDckN5VVErTG90VnppL3QvME9lZ1FpK09YMFdnK1lrK3pi?=
 =?utf-8?B?QXhiQzZ5eEg5Q0dqd0tlckp5R3c2azBPVVhwTmRnTmtJSnV3SjlUMm0zVHdD?=
 =?utf-8?B?blMzYXpHSERNZVQvSldyOFlaZXVnMmNsVFFYeUp4ODJ5U1AxZXhBQ1lDajgy?=
 =?utf-8?B?aU92SUt6QmYybS8wU2pFamNPamx6cTUwUEpXcGwrNmw4M05aSkZMOG9GNHQ5?=
 =?utf-8?B?Q2VBeHdWQndCQm5pQzZuS2xPVXNoVk9lQ3VPVUMxNGw2dUoyU24zS09qMnVk?=
 =?utf-8?B?K3FCSmpxUFVXR2pMRjNBSkpnN0U0eGIyWkk1RGhQeW1mVnlkNkRzaXBNWUpS?=
 =?utf-8?B?L3htUjcrVGdHTGMyNldJOTdNQlF4Zm9QMWUwaUlucDZVOWZnOGpmb1FEU2R3?=
 =?utf-8?B?ek81REZSUXBJNVdydC9yVEphY2FUK2g0Nmw2MWRjSy9WL2NCR1BpcTNpd2NX?=
 =?utf-8?B?NjVvbCtYZU4xSDNMWGt1bnYvd3NuSmhuQnowc0k4ZnUrWVQyNVFRWE83b0hp?=
 =?utf-8?B?YU5QN1lzUkRtaXd2YTg0aHFSeFkwYWFqd1pIMVdGZFJER0R1SzBpdzlPUE5w?=
 =?utf-8?B?czNGckZ6Z29GTi9vSUg2d1J2U3dWV0hDWE1KVCtsTWdBcXh0Y2UrOTVnSEx2?=
 =?utf-8?B?S1pjMmdEdFRRRFVPczVmUDdLSXAwZS9nbE5XZmR2MWZEMGpNaE1XSks1MnpJ?=
 =?utf-8?B?TDBrdlVZalBBTVNUdVdOZk1EdnZOTVlYSUxXR0g4MWpjQjlhd1NTYjhkUk9h?=
 =?utf-8?B?TGRZZnpBaU1DcXVweVczaGtvRjdwQzMzNk82RXVTMXo1Wjl3WDlsaXNENEg1?=
 =?utf-8?B?eDNLamJ5RVY3azY2Ulg1Z0NpVWt5eWxyQ1U3NU5TUW9FalZjQlNmYlZYbG9I?=
 =?utf-8?B?bzdvbWNEeDRqUTFVVFkrQ0gyTlVuY3d5NVZNRjZvNVVTdlJiN1BoakRIclNL?=
 =?utf-8?B?YW5xOVZaNCtkanRKTzRTM0ZWaVl6V1BFOENkQ2owU2swSFVscWhVb2FMWGNk?=
 =?utf-8?Q?Tvm0NQtYJ62NVsdRQOnAzIgjwOYaUNro?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6129.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ek83ekdqYmVkcDJHcm56ZnlUb1pzMTlQQkFxN0VLTk5IMmF4dW82MG1yUTVE?=
 =?utf-8?B?czJxdFE1RktuTU9ONDJQSHBaVk5rak1NN25ieVlRY3lYNlZ3eVF4c3dUaXdw?=
 =?utf-8?B?TDBldm43Vjk0aENkWXpaWE9LQ045Y05BZVlQNDZxaW85OHhzR1gyd0ZMYmtj?=
 =?utf-8?B?RTVpV1lFVTkzZ0xXQnBaeFhOdDloTVNHQm1taHFFUW5yVUhLeGRzWDRtRVpB?=
 =?utf-8?B?OGlMNkpBUTVMdlJXdW1ZM3hBYWNhN2c0NlFCM1Z0MDJtL3R4Tlpvb3VCVlJU?=
 =?utf-8?B?cHlyTDFYaWdtemd6eU8xU0NSYlBCWWMxLzBabkM5RlAxbkQ3OU1xejVsUnBu?=
 =?utf-8?B?R2FpUEdBQWEyNE5RYTE0V3ZBVUxuaEdYT0lBYnl1L0pWUzBrYVk3ZGRjNVVD?=
 =?utf-8?B?cFVlanBIOUR1VjhwTkxGQzhjRmxoV0V3eWxiREtqSXNiampjQlo1dDNEZjla?=
 =?utf-8?B?anM1TTJKRk1hTHRWOVYzcTI2Tmw1R0lKUm1TYW1BcTh5VDUrMnBuaXR3V2Ju?=
 =?utf-8?B?bUh1V2duRXhJUXFzZGFWQUdlOER3Zk1xRFgvaFZEWXVVRTFRbGc5ODlCZHN1?=
 =?utf-8?B?Y0t0ZmtpWmZib0xONjNyOEpyaDV6WDdSZ2tyRGE2Q0ZPNUdPUW01cnVDMkkr?=
 =?utf-8?B?TWljL0UyRE84ZGRpbSs5clN2Uys2VEozWUNFLzBHNmJNMlE0NHJBOGVBWDZX?=
 =?utf-8?B?Q0cyTVhnYjQrOEtpeEJYdGFhMFIxYk1QdkdwMlJTOW9OZmo5Z0lqbnVzK1RF?=
 =?utf-8?B?TjA3UGxqVmQ4ZXJUM0FwVXk5N3R3M1BIbTJpdFp0WEptdjJuZWRyUm5ub3hi?=
 =?utf-8?B?Tzd2T0szNGNSYmY1NmhrdHZUU2xFSVZjcUpOWksxenRDeEJ1UkZNYlcrY1FB?=
 =?utf-8?B?enlmVUdmcGhvaUx2N21EWjc5YTkvMDZ5NktVWlJQeGZGTzRCT3ovNE83VWV0?=
 =?utf-8?B?NDg2VWV6STgvSTY3eE9FWEZraE11OEJTYUNLeWdNdDd2bmM0cGtoSlVQbmNu?=
 =?utf-8?B?ZGlqZUFzWXZDMDU4dEpxbGQyYWpvelJzNnd2NjF5VjlKU2hFdGsydjhOVGFt?=
 =?utf-8?B?NGowSkxIV1hUV3B3dWZ1aERYTVpKYzRiQVQyeFdBaFVyWWUzQWZhTFM5UU9G?=
 =?utf-8?B?YjY0aVg4eWIzcUF1N0haZ3pkcEpsWFhGY2pIUERhM3p0S0VpbEliRy9WWGVv?=
 =?utf-8?B?ek83MU91NlByUjh6anh4eDhHTG5laHV6SGxjWWF0aEJBZVNQdHRKQTNwR2Z3?=
 =?utf-8?B?MXhYZ2wzc1FaMjhuV0RocHBoNmVXQmtCcnRWZzN0RmhRL2pHbVlYVTc3UWFa?=
 =?utf-8?B?S0U2YlhidmtMUXpKd3pDYkx2eWo0YzhvdG9sVDUrRHBXVXBTUEl4WXdMYjNP?=
 =?utf-8?B?dWdZSE8wSWJuM1VjVFp3b0ErUWNKanYvV0lMb0tkbWd6ZmRVQ2dVT0FLa2gw?=
 =?utf-8?B?NTR2S21jTy9PMStJOHBGS0M1Qi9SZWRBaGNiVTlRZkFxeTJBZ2hQaFVPYmZT?=
 =?utf-8?B?WkJkL3RuQXh4M0ZJM1RKQTF6OTlZZmJqeDF5aDAvV1BWaG1UV1R0NWkyeFVm?=
 =?utf-8?B?c2h6a241bktzMUhCRFkwbXpJSUtGYmMwK0lYUTd6OUszWDJUelNzOTE4eUxs?=
 =?utf-8?B?d2JPOHl5dXJEQjJjWGhuYlg1WHVhTE1Vc244R0VqL1NNVytoWElPd1haRkR2?=
 =?utf-8?B?aHhselNHYmZPdzh5V1hxNXNTbDhwR0hMOXoweHVqaERHcE9RbGI0dExxL2Zk?=
 =?utf-8?B?dXhDbGtZSDN4cmp0U2tIbWc5RWFKRW1SQ0VGQ1JnSWhTdjRzeEVkb2w4ZW5m?=
 =?utf-8?B?SVZGZ2ViSnE3bVhRcUtDelBOblhtQkVVcjlWcVcya0Q5R0t2d3hlQlA3RlNw?=
 =?utf-8?B?NG1iK0dEV3Zaek9wVlRIdXEyY3JUWmFEKzUyNmJHS0ZvMWlEWjhJZWtnRmxr?=
 =?utf-8?B?cWFOZ1VVSThPUnBZNXNCTEZWQTVaZDFXRmdyQUcwK2RYd3JEY29OSFhwSUo2?=
 =?utf-8?B?Qmx2VVZIcDc0OVdnMjliZWVHZjd6T3k5VmtacEZxNk1XOVlCN1ZSNkoyTVRZ?=
 =?utf-8?B?blltNGxncjZGRHIzd014UGtoOStNcUE3WERzalJoMHlXaVIvT3ptUEFvWXRN?=
 =?utf-8?B?cEEvay8zZG4zQjlwcmxkOXdJbmdnaWdvbW9RZGxNaklkdHNjTS9FcVY4TGlv?=
 =?utf-8?Q?BgipRNJHYoZ5qOPmVQF2GBY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bbda11dd-5c27-46c2-6fe5-08de36f1ba56
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6129.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 07:08:17.8125 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EWweJeWd/vNoERRLrIxYXXBZJJhK2DfgRX1zOXLt/CXieI70hM/8ZcgeBQxg8PuV0zHj6hx2MJ/zja/mBATxFG1YnMa8QwH3MVP4WcnLtV8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3D06B1BFF
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



On 12/6/2025 1:23 AM, Swati Sharma wrote:
> Add a helper to run plane color pipeline tests across
> all pipes and outputs.
> 

+ on the primary plane

Reviewed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/kms_color.c | 38 ++++++++++++++++++++++++++++++++++++++
>   1 file changed, 38 insertions(+)
> 
> diff --git a/tests/kms_color.c b/tests/kms_color.c
> index 576fd5329..a47c71f33 100644
> --- a/tests/kms_color.c
> +++ b/tests/kms_color.c
> @@ -891,6 +891,10 @@ static void test_setup(data_t *data, enum pipe p)
>   					  data->primary->pipe->pipe,
>   					  IGT_PIPE_CRC_SOURCE_AUTO);
>   
> +	igt_display_require_output_on_pipe(&data->display, p);
> +	data->output = igt_get_single_output_for_pipe(&data->display, p);
> +	igt_require(data->output);
> +
>   	igt_display_reset(&data->display);
>   }
>   
> @@ -984,6 +988,40 @@ run_ctm_tests_for_pipe(data_t *data, enum pipe p,
>   	test_cleanup(data);
>   }
>   
> +__maybe_unused
> +static void run_plane_color_tests(data_t *data,
> +				  const color_t *fb_colors,
> +				  const color_t *exp_colors,
> +				  kms_colorop_t *colorops[])
> +{
> +	enum pipe pipe;
> +
> +	data->color_depth = 8;
> +	data->drm_format = DRM_FORMAT_XRGB8888;
> +
> +	for_each_pipe(&data->display, pipe) {
> +		test_setup(data, pipe);
> +
> +		data->mode = igt_output_get_mode(data->output);
> +
> +		if (!pipe_output_combo_valid(data, pipe)){
> +			test_cleanup(data);
> +			continue;
> +		}
> +
> +		 /* TODO: extend the test to multiple planes (HDR & SDR) */
> +		if (!igt_plane_has_prop(data->primary, IGT_PLANE_COLOR_PIPELINE))
> +			continue;
> +
> +		igt_dynamic_f("pipe-%s-%s",
> +			      kmstest_pipe_name(pipe),
> +			      igt_output_name(data->output))
> +			igt_assert(test_plane_colorops(data, fb_colors, exp_colors, colorops));
> +	}
> +
> +	test_cleanup(data);
> +}
> +
>   static void
>   run_deep_color_tests_for_pipe(data_t *data, enum pipe p)
>   {

