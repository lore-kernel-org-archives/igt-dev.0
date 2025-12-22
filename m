Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F661E677ED
	for <igt-dev@archiver.kernel.org>; Mon, 22 Dec 2025 16:11:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FC810E6D6;
	Mon, 22 Dec 2025 16:11:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HbHhuB81";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 518A610E6D6
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Dec 2025 16:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766419887; x=1797955887;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=qzTaBtD8pGA8zxCWiVKPJ5DlrLRtbKZdM+zUTcu3NEs=;
 b=HbHhuB81osG0O2JCqmn9U4ujIABroksgg0Qsg11lGQs92f9JszNILYnP
 tT3UEnEXehUrycZCO2s9+GsjJzOdbjtYLiG18mU96AQo1/muMZkcb+PzD
 Hy799+Ujsi+DNG5rK76P4+/bPLI83oZC6sZ2B4VSMMTwvDcDYFOn7LKUq
 aXnVX6eZIcKu6ml7sj9Qv5JU4dGN4ubUv10NZEigVy9QeHbE+O2Ac4pKm
 yl2I+L5O4CmgxbUo5Dwqt7XqVpSObKtVNhzZARXycWfC16u40MomdTc6H
 jZVJDoyUQWx+pbWXN6iM9gubUpIhmWO4CBVrmLHnbOTonK2ETI7R3+yms g==;
X-CSE-ConnectionGUID: 9yEbPQ/iRGKxyt+z4Swm6Q==
X-CSE-MsgGUID: WmRnBG3XSvm5mzLpQHNg6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="79392653"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; d="scan'208,217";a="79392653"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 08:11:25 -0800
X-CSE-ConnectionGUID: Xhfsw0+CSGe5Oewoq7hugg==
X-CSE-MsgGUID: JQ1ZI2LjSS+o6u6pv7IXkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
 d="scan'208,217";a="199195330"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2025 08:11:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 08:11:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 22 Dec 2025 08:11:24 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 22 Dec 2025 08:11:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ieGRZ2UMHLcAVfxR+aAhmbYXCI7jKQ8jaAEGPc3JL4jrmTjhabBOB2wQT+lmE7IBWazbvzD9DbXuIwJviDh7D+Y+vubLuCG8kj3oLDM4caKU6d5Q8cgMcIPeWJMYM+Re/1sXmgOydif4doYmzmEePeHn+6/s6MiRlgMlnoesqfqA22zDY09MkbHeEiTvcAEqF7Q+2LBBCIWDyOLeWAao27pMwbQ/5h0cIn70RYpj5TjtZZXHf0TmEnmX+6yzxtr1W+oSToXG5AOF8LaiSsGf4HTa8ABQHcS/EFyE0H+/4HNZ/rlhYO/kuVEFUwwev7NTo8vdrBm1eObN5ExQeoJIwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pWPfQqf2Ifv4R/ZaePSh8gGG523W9WjRSXfb45UFANM=;
 b=Q0b06jHI6vfTnf1TYHSG3+n1GPQjRxU579czJba4tAhBZIK66UQHcfT5pd6LMHzT2sTzV2JfG8xjNmZ2td7SOnzdSB3HxfBTUCwHTFbOO8EQUJemeoE2UMqWqxfxKwc22KY8BdTO+UpeLpoUZSLLL0r9UNU8cVgyi+M1W4rDcQOQhLfcWu+6LoC31eNd2d6ohy1wWJ7cx5/592ZhLWHLhx4iEXM1DMwvqAcc50WOriYALT8ygi9NNkhxfY3VjN0eraqNNwjFM21HUCGtpI7eX96mPHaDAfIcIVc/efB3vJSS9UGLNCeJf1exXo3qfOC0+xAqWHvpr0Ey93bj6tuY6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9304.namprd11.prod.outlook.com (2603:10b6:208:57d::5)
 by CO1PR11MB5026.namprd11.prod.outlook.com (2603:10b6:303:9c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 16:11:15 +0000
Received: from IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6]) by IA3PR11MB9304.namprd11.prod.outlook.com
 ([fe80::3184:459:b760:70b6%6]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 16:11:15 +0000
Content-Type: multipart/alternative;
 boundary="------------D6oxcZ9lgRCosm0loslc82Ec"
Message-ID: <4658552f-cea0-4ce6-ab4b-1ca0a0cc41f1@intel.com>
Date: Mon, 22 Dec 2025 17:11:10 +0100
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOKclyBYZS5DSS5GdWxsOiBmYWlsdXJlIGZvciBpbnRlbC1jaTog?=
 =?UTF-8?Q?Add_xe=2Ewcl=2Ecore=2Eblocklist=2Etxt?=
To: <igt-dev@lists.freedesktop.org>
References: <20251218175456.65275-1-jakub1.kolakowski@intel.com>
 <176618590352.108745.9915286703591756044@a3b018990fe9>
Content-Language: pl
From: "Kolakowski, Jakub1" <jakub1.kolakowski@intel.com>
In-Reply-To: <176618590352.108745.9915286703591756044@a3b018990fe9>
X-ClientProxiedBy: VI1PR0102CA0085.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::26) To IA3PR11MB9304.namprd11.prod.outlook.com
 (2603:10b6:208:57d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9304:EE_|CO1PR11MB5026:EE_
X-MS-Office365-Filtering-Correlation-Id: ebdd9dfe-2ab1-40a7-125a-08de4174bb8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|8096899003|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azVPam1ZVDFwb0R3OFpTczBtRHZISnMyT3M3d2ppUi9vUnEwa1ZsR1J1Q0sw?=
 =?utf-8?B?TGo4RXdKMTlCZlRKd3htWTRQZjVCbUFGd1lYZzJjT05jN1VPSXFmRTVURm4v?=
 =?utf-8?B?MWFhQzJmN1kxQ0FIQ2d1dm0xL1VtNm95c1U0eUFmWTFzWi8xWGFRalVoUjhP?=
 =?utf-8?B?UUVPUHJvcW01YWlhNlJ4QWdRVDJvZU4xUXNsYkJWWm9BY0RXQjFrV2JybmJQ?=
 =?utf-8?B?Um01WUFRRjdzRWEzazI2ZTErZnhBTi9TbXduOTg0dkFKNUZNYnFIQ1BPKy9s?=
 =?utf-8?B?OEE5UW1nRlNjL2EwVGl6Z3Q3K2xMdDZ1RXIzSFR4ell5Y2Q3M3JMaUtGZHBK?=
 =?utf-8?B?c0VKcVBSZ2gzVldGcG1KNXlkTjBHS1ROTjNtakpCL1Z5M3h6TWhBMnR3ZGM5?=
 =?utf-8?B?RmJRVjVqT09TRU40VEpKZnZsL0hBVzV3UkZyWEJiSG1sNFRnaG1yVFFYckY1?=
 =?utf-8?B?WEkvVjYvZHFheVo0SnppQlZWZVNlZ08zWkxOSWJvMzdFM0cxNURwUTNzd3FI?=
 =?utf-8?B?SExJcXBEVzhnQVZYbFgvK2V2SkVZNlRTMWpmWFRhVFVLcFJ1WEZaQXVDMHBN?=
 =?utf-8?B?Q0JjUnNkTldjOHJFa3gwSFVWTllSU3JrZzJjVStLY05wSnk1c2ZoeUlwUFZH?=
 =?utf-8?B?OTY4TDZ6WTdIODhINmFmOTdQTlJQMi9hbnJqdFUwc2Z0VXZ0RHBXM3A1N0w0?=
 =?utf-8?B?dXBzRm0vbUJ4S1pUalo1RlZFR05iQTducmExVmRVclF0aHlXcVR4Mi9kZnNt?=
 =?utf-8?B?TE5tcWhXV0ZyUW9FTmtlczFYejB1OEF1TElTaE5WTFF0aW1GQ2V5UVNwbGg4?=
 =?utf-8?B?K2ZDRlRDWmY2K29veC9BNjNsektCRTRjTnNXVlZVRTFmclNZMitqbExXWWpu?=
 =?utf-8?B?NkhxQnNWaTNaRHBzUytoVTM3TDFoRlVTbU5RL1F3dWFtUnlMN0NIV0FTVUk3?=
 =?utf-8?B?bzlWKzZacHh0elhyUzMyWklLeHhDclgvMXpSU0lJTm1PRWwweUs4TjlJamtK?=
 =?utf-8?B?QnA1UVhiTE5wODExTE9qTkhjclh4RGZNbHZoTW9yUDNKbGNnaWNCZEFrL1R4?=
 =?utf-8?B?b3ppNHVPSi9keW1TOUFEaEpBRUVzL3lkbUttNjBYWUNISkFIUFk2T1pudmN5?=
 =?utf-8?B?TXNWZHhiTTY2VzVPZC9DN215a3Jrelh4WlRjN2tXRTIrOTRFZHlYKzNYM2pa?=
 =?utf-8?B?c0hvenpwbVFxSFRYSFN2ZEpZeDFSOEJ0K0ZEbE8vZlJXS2xhbkl0dStGSG50?=
 =?utf-8?B?V3NweGN5bVhBNTRWemdaV2VOOFIwQXBKd2dCajRPTldHRGVzNVRBTlpQVnRo?=
 =?utf-8?B?QkRFbzZkVXdRQ003ckZmSFk2Tjk0VlkvaEVyWkE4OWRGUzhQQ2N4WmJXU2k2?=
 =?utf-8?B?Wkh6MlczTXN5TkJveDhSWStVTHBMcFI0aHhlY3lTM0JicEFTM1Q0dXdlVFBl?=
 =?utf-8?B?Q045Z293VkEwVlhvSXExVzNZZlYrOUpnZUIyNy83VjNjbm9iRGdSanlrR0xB?=
 =?utf-8?B?WllNSDFZeDJjV1pYcDU2c1kyWktXd0NYL1d1QUlGT2tFaW5Ba2pZT1NpUEk0?=
 =?utf-8?B?L28wRXp6S2dWbkx5RlpvK2F5ejZSRzFFUmxLUS9uK1U5UWVOVWZGZ1EvR3lC?=
 =?utf-8?B?SmJMeXhib05jZkpuWkJ2RG1DQ3ViL0Q5R2hBVGhwc0xlc0xxdlc3aXgvR2Jn?=
 =?utf-8?B?WnBWb3ljMERUSUhXM1VSRGhDWTU5Q2luLzZNZHF1UmozaFVKNmNGcG4xK1hm?=
 =?utf-8?B?T2pjZXB2eXFHK1JObnJYZk1BRkhoZmVVVjB1blRDYXc3MEVNQ0VyVkkveFlE?=
 =?utf-8?B?UGJDc3VuSUsyaDU5Yjh5MDk0d3FsbDEya2QxeWcwK1JGZlRFWFJMZWRoN1pY?=
 =?utf-8?B?dDhXeUxUcVlmaFNNc3hMOUFLR29qY2EzMWozZ3lzSHYvU1E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9304.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dWhoaE5zUjBLczVLU2lYWjM3RjQwSGRsU2JubXVWWXd5Ui90dFJiZTlWN3lx?=
 =?utf-8?B?S0kwb0J4cjdMMVlaUGwvL3pmK1NmQU10b2NMR0ZFVjJnNFZ3V0dLSTgwaDd2?=
 =?utf-8?B?QWFNTW4wRkowQkZ2NG5GRFdEbzFRYVdrQisxN2hKMXVIOXAwbWxxaFhMaHgx?=
 =?utf-8?B?aHd3cGM5Rmp0Vmlwc0IxMFFSMUlaYTVsRVhYdVBhanNLYTFnRlMyWXExMmZS?=
 =?utf-8?B?bVNlVlMyNW5lZGh4cEZLRHJIVXNzOVAzUEF2Vk41eGJsbFBLbTlUaUp3aUZL?=
 =?utf-8?B?Tmk5c1RQL2lNS1JnSVowa3BvdUk0WjZ3ZXFpcm9aUkdmS05UUnhZckdmam5u?=
 =?utf-8?B?WEowQ2dzTE1oM0lyTC85dUpzSDF1STNiUDRJZld0cDBlNVZXTTVFR2FuZDNa?=
 =?utf-8?B?a2h6dlY5enNsS2JFbEVvTWNHRmRGZGpyWDVOV3QyZWxibWdoT1dEckVlaTFS?=
 =?utf-8?B?dDdiUWVEZkwvd0NFMUdBdUl0OXY3Nys5aFBlUW9acWFjSUo1YTFXVWRnQzd2?=
 =?utf-8?B?NkcrZmZsTDBZZ1VBbVZ1Mk1YZ2lFVmpTWHdtMElKd2VldXg1T09pb0RCWE9R?=
 =?utf-8?B?cGxxcEhLUDBVc3RVenZFZFhWUW8rRU0xMHlReWRqWlNUQUh1aDJ4dUdjaUUr?=
 =?utf-8?B?STdZVWNqZy9UcFc0dlpEa2FHdWFoMmpxdE9WSkZoOVNIcnQ1NUgrU3FlaXpF?=
 =?utf-8?B?dE9Da1ZWcWE2OEFra1kvdGhmNldBeDNRUUV4RE5Pa2dnT2w0M3ZRU21uMUlr?=
 =?utf-8?B?L0kzYkVkc2l0TlYzRnlnbzB3WEprd1BtdkhmeUg3bytROXAwUVVGWFpmNElm?=
 =?utf-8?B?V3BwZWlIQWIzQWFTWEh6VzRCVEZwOUp5U0d2T0Ruc0NUbjVLQ2FnWngrTHVG?=
 =?utf-8?B?MFZobzFMaStTYjVwb2lJS3pvV3cxaXZhazR6b2djNUZpQXlJdDh1NWE2YXVM?=
 =?utf-8?B?NXhWWmhhcUM5ckZ4SWE1YTNMODdIa29CS3hyb3pmMGcrSFczSjlVWC91T1Vo?=
 =?utf-8?B?ME5jK3BWemkrY1lCRnlkdWI0R2pzV2c0Y245d2dhV3ViQW5VT1Zqd2szbng4?=
 =?utf-8?B?dk1TWDBhOEVheldPWGxtZDUrY2NkMUovblhqUzJBSEtGRWtweDRGN0c1U0hC?=
 =?utf-8?B?dnJIZDVOWGVLMjN6RVlCM2RKQjZ0QnlEa1ZvRWU3ajlLeHh0bThBNi9ZQkkv?=
 =?utf-8?B?b2F1cHBFQXVoRHZEdjVtWkNlTEZybFhjazE1amN6RXRhejI4azJhRjdEYlZ5?=
 =?utf-8?B?TDl1UGt5RHZoVm16cjNWZ2xka3pHT0RxeUlqNGFwdGxpcTNrNDJMcjBzb3BK?=
 =?utf-8?B?SUhzd1MvekRiUnRyVFdoOEJyc0d3MWhnM2tnVmhiSVlGWmwvRWRIZHMzejlW?=
 =?utf-8?B?amYzS0hXSWVCNWxVd1pnTFVWVE1remNmSFJKUkZjckhPWnpRMkxZOVdqNmZB?=
 =?utf-8?B?U0xha3VQa2J2anp6aURocllwSnVPN2kxaTFOK0FJLzBhZFh4ZWNvdHN4Qm5h?=
 =?utf-8?B?amg0cTVTbEE5aVZGMGR6eFhQc3F0eUxYN2ZVRGxrbUNwZFp6OUt0TTFUK1o4?=
 =?utf-8?B?Y3VVNjBJdnZGcFRpRHhWd3dYbTdiWlhmWXlxUjhnSWhRZWxxNVhuY2ZnQjVl?=
 =?utf-8?B?MVJmbUNFNC9mb0pMOXhSRDI2QWxNeWEwV1BFMForKzNBUnVLZ2lVcmw4NEdo?=
 =?utf-8?B?ck9XRjNUVXovdFhycEdoR0NCWW9xMkZZQ0lGMTNnQ2h3QW9ia083N1l5eDFD?=
 =?utf-8?B?ZjNHdmpXeG1YelZ3cDBHVmVXUmpkbWVkSVFEWWhjR0xTamRNcTdEbE1Sdmdr?=
 =?utf-8?B?bmdNUG1STit3dEd1d0I1T3JQNngycW1TOHFraUozUVRHTlUwdG11RFozc044?=
 =?utf-8?B?d0pVWVRKMVo2ejR0dVJNdkRLTWFqQ09uQklFYnlLeHZEaG9KWDRRbUhoYXZ1?=
 =?utf-8?B?cWcyekpIN25maTNXUTkvZUU5S0Rzam5jMUFnTnE5OFZRWDRDRWpFSXR4SGRL?=
 =?utf-8?B?cnJWS2lyQWFzM0FXM1JUQmNXNHlWV3Nvak9wbFhiaG93UjJ6eGUwZzE1blpa?=
 =?utf-8?B?YXFpVVJCdDBSOGZVN25pWnl5K2hQNU9yV0VQRnE3N0kzc1UrUjN1Mk1qNDZY?=
 =?utf-8?B?WENYK1dLRXA3UGIzVkwxMkdyWXY2Mnd6UDlZMFE5OFo1dzBUd0FKK2o3OTdS?=
 =?utf-8?B?b2ltb2xRcm5ERXNYMFJzeXpObENlZ2gwU1lHb2JhR3VlKzhhZk1uUXQrNmsv?=
 =?utf-8?B?aEV6OFF1a1BBekMvWjdqWllZS2hSNng2eG5kM2YzMHRocGxqdlBzbTNUb3lj?=
 =?utf-8?B?Mm9haUMzeFlKNUpiRWVZcHJhdjBidlRSRTB3dXBKNncxS3dJTUFaMnEvUWU3?=
 =?utf-8?Q?vOEuLbdB6ek6crJo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ebdd9dfe-2ab1-40a7-125a-08de4174bb8a
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9304.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 16:11:15.6971 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWq0FWQGDIokcyo16bVg5Ilh6c+a7ZpnKCH491M9BrBAtDjcYGI9fnXUYC0X2IPR7RaICOdemmffEihPcvuf/9eRqOn8mqGnbEU7aHlVMsU=
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

--------------D6oxcZ9lgRCosm0loslc82Ec
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12/20/2025 12:11 AM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	intel-ci: Add xe.wcl.core.blocklist.txt
> *URL:* 	https://patchwork.freedesktop.org/series/159239/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/index.html
>
>
>   CI Bug Log - changes from XEIGT_8674_FULL -> XEIGTPW_14238_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with XEIGTPW_14238_FULL absolutely need 
> to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in XEIGTPW_14238_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> XEIGTPW_14238_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@testdisplay:
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@testdisplay.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@testdisplay.html>
>
not related
>
>  *
>
>
>     Known issues
>
> Here are the changes found in XEIGTPW_14238_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@fbdev@write:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@fbdev@write.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@fbdev@write.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html>
>         (Intel XE#1407
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407>) +2
>         other tests skip
>  *
>
>     igt@kms_big_fb@x-tiled-16bpp-rotate-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-addfb:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html>
>         (Intel XE#1467
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) +1
>         other test skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html>
>         (Intel XE#2191
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191>)
>  *
>
>     igt@kms_bw@linear-tiling-4-displays-1920x1080p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>)
>  *
>
>     igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +4
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html>
>         (Intel XE#2669
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +3
>         other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +3
>         other tests skip
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#4418
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418>)
>  *
>
>     igt@kms_chamelium_color@ctm-0-25:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_color@degamma:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_chamelium_color@degamma.html>
>         (Intel XE#306
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/306>)
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html>
>         (Intel XE#373
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/373>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) +5
>         other tests skip
>  *
>
>     igt@kms_content_protection@atomic:
>
>       o shard-bmg: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_content_protection@atomic.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) +1
>         other test fail
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-128x42:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +2
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-rapid-movement-max-size:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html>
>         (Intel XE#1424
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-512x512:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/309>) +2
>         other tests skip
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-atomic:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html>
>         (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>)
>  *
>
>     igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html>
>         (Intel XE#4210
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210>)
>  *
>
>     igt@kms_dp_linktrain_fallback@dsc-fallback:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc-fallback.html>
>         (Intel XE#4331
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_dsc@dsc-basic.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_fb_coherency@memset-crc:
>
>       o shard-bmg: NOTRUN -> CRASH
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_fb_coherency@memset-crc.html>
>         (Intel XE#6706
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706>) +1
>         other test crash
>  *
>
>     igt@kms_fb_coherency@memset-crc@mmap-offset-wc:
>
>       o shard-lnl: NOTRUN -> CRASH
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html>
>         (Intel XE#6706
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706>) +1
>         other test crash
>  *
>
>     igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html>
>         (Intel XE#4422
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422>)
>  *
>
>     igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#3321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321>) +1
>         other test fail
>  *
>
>     igt@kms_flip@2x-plain-flip-fb-recreate:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-recreate.html>
>         (Intel XE#1421
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421>) +1
>         other test skip
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +1
>         other test fail
>  *
>
>     igt@kms_flip@wf_vblank-ts-check:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +198 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +4
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293>)
>         +10 other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401> /
>         Intel XE#1745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745>) +1
>         other test skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html>
>         (Intel XE#1401
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html>
>         (Intel XE#651
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/651>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#656
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/656>) +19
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +20 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html>
>         (Intel XE#6312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@plane-fbc-rte:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_frontbuffer_tracking@plane-fbc-rte.html>
>         (Intel XE#2350
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350>)
>  *
>
>     igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +13 other tests skip
>  *
>
>     igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>)
>  *
>
>     igt@kms_hdr@static-swap:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_hdr@static-swap.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_hdr@static-swap.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) +1
>         other test abort
>  *
>
>     igt@kms_hdr@static-toggle:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_hdr@static-toggle.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>  *
>
>     igt@kms_joiner@basic-big-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_joiner@basic-big-joiner.html>
>         (Intel XE#6901
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901>)
>  *
>
>     igt@kms_joiner@basic-force-ultra-joiner:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_joiner@basic-force-ultra-joiner.html>
>         (Intel XE#6900
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900>)
>  *
>
>     igt@kms_joiner@invalid-modeset-force-ultra-joiner:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html>
>         (Intel XE#6911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911>)
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-yftiled:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (Intel XE#6912
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912>)
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html>
>         (Intel XE#6912
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912>)
>  *
>
>     igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html>
>         (Intel XE#599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/599>) +4
>         other tests skip
>  *
>
>     igt@kms_plane_multiple@tiling-y:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@kms_plane_multiple@tiling-y.html>
>         (Intel XE#5020
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html>
>         (Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) +3
>         other tests skip
>  *
>
>     igt@kms_pm_dc@dc6-psr:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html>
>         (Intel XE#2392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392>)
>  *
>
>     igt@kms_pm_rpm@basic-pci-d3-state:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html>
>         (Intel XE#6693
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693>) +2
>         other tests skip
>  *
>
>     igt@kms_pm_rpm@dpms-mode-unset-lpsp:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html>
>         (Intel XE#6693
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693>)
>  *
>
>     igt@kms_pm_rpm@package-g7:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_pm_rpm@package-g7.html>
>         (Intel XE#6814
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +5
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-a-edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4608
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@pr-cursor-plane-update-sf:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2893
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893>) +1
>         other test skip
>  *
>
>     igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +6
>         other tests skip
>  *
>
>     igt@kms_psr2_su@page_flip-nv12:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_psr2_su@page_flip-nv12.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2387
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387>)
>  *
>
>     igt@kms_psr2_su@page_flip-xrgb8888:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb8888.html>
>         (Intel XE#1128
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128> /
>         Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>)
>  *
>
>     igt@kms_psr@fbc-psr2-suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406>) +1
>         other test skip
>  *
>
>     igt@kms_psr@fbc-psr2-suspend@edp-1:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend@edp-1.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4609
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609>)
>  *
>
>     igt@kms_psr@psr-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_psr@psr-basic.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +8
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234>)
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#4692
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692>)
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +2
>         other tests skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>)
>  *
>
>     igt@kms_scaling_modes@scaling-mode-center:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) +1
>         other test skip
>  *
>
>     igt@kms_vrr@seamless-rr-switch-vrr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_eudebug@basic-vm-bind.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug@discovery-empty:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) +2
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@pagefault-read-stress:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_eudebug_online@pagefault-read-stress.html>
>         (Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>)
>  *
>
>     igt@xe_eudebug_online@pagefault-write-stress:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@xe_eudebug_online@pagefault-write-stress.html>
>         (Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665> /
>         Intel XE#6681
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681>)
>  *
>
>     igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug_sriov@deny-sriov:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html>
>         (Intel XE#5793
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793>)
>  *
>
>     igt@xe_evict@evict-beng-threads-large-multi-vm:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_evict@evict-beng-threads-large-multi-vm.html>
>         (Intel XE#688
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +3
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html>
>         (Intel XE#1392
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392>) +1
>         other test skip
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_compute_mode@twice-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_compute_mode@twice-basic.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +4
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +12 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@two-queues-priority:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-priority.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +13 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +8
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise:
>
>       o shard-lnl: NOTRUN -> WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvise.html>
>         (Intel XE#5786
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786>)
>  *
>
>     igt@xe_exec_system_allocator@once-mmap-race-nomemset:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-race-nomemset.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +9
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-multi-vma.html>
>         (Intel XE#6196
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196>)
>  *
>
>     igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-free-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>         +11 other tests skip
>  *
>
>     igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html>
>         -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +523 other tests skip
>  *
>
>     igt@xe_gt_freq@freq_suspend:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html>
>         (Intel XE#584
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/584>) +1
>         other test skip
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-lnl: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_module_load@load.html>)
>         -> (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@xe_module_load@load.html>,
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_module_load@load.html>)
>         (Intel XE#378
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/378>)
>  *
>
>     igt@xe_pm@d3cold-mmap-system:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_pm@d3cold-mmap-system.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284> /
>         Intel XE#366
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/366>)
>  *
>
>     igt@xe_pm@s2idle-d3cold-basic-exec:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) +1
>         other test skip
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-50:
>
>       o shard-lnl: NOTRUN -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-50.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) +2
>         other tests fail
>  *
>
>     igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_query@multigpu-query-pxp-status:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@xe_query@multigpu-query-pxp-status.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +1
>         other test skip
>  *
>
>     igt@xe_query@multigpu-query-topology-l3-bank-mask:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_query@multigpu-query-topology-l3-bank-mask.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>)
>  *
>
>     igt@xe_vm@out-of-memory:
>
>       o shard-lnl: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_vm@out-of-memory.html>
>         (Intel XE#5745
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745>)
>
>
>         Possible fixes
>
>  *
>
>     igt@fbdev@nullptr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@fbdev@nullptr.html>
>         (Intel XE#2134
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@fbdev@nullptr.html>
>         +2 other tests pass
>  *
>
>     igt@kms_addfb_basic@unused-handle:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_addfb_basic@unused-handle.html>
>         +528 other tests pass
>  *
>
>     igt@kms_async_flips@async-flip-with-page-flip-events-linear:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html>
>         (Intel XE#5993
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html>
>         +3 other tests pass
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>         (Intel XE#2291
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html>
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301> /
>         Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html>
>         +1 other test pass
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html>
>         +1 other test pass
>  *
>
>     igt@kms_pm_rpm@basic-rte:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html>
>         (Intel XE#6693
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_pm_rpm@basic-rte.html>
>         +2 other tests pass
>  *
>
>     igt@kms_vblank@ts-continuation-dpms-rpm:
>
>       o shard-lnl: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-rpm.html>
>         +3 other tests pass
>  *
>
>     igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         (Intel XE#2142
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html>
>         +1 other test pass
>  *
>
>     igt@xe_exec_balancer@twice-virtual-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_exec_balancer@twice-virtual-basic.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@xe_exec_balancer@twice-virtual-basic.html>
>         +7 other tests pass
>  *
>
>     igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>         (Intel XE#5625
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html>
>  *
>
>     igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>         (Intel XE#2229
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html>
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-90:
>
>       o shard-lnl: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@xe_pmu@engine-activity-accuracy-90.html>
>         +1 other test pass
>  *
>
>     igt@xe_sriov_auto_provisioning@selfconfig-basic:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.html>
>         (Intel XE#5937
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-basic.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#2370
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_big_fb@4-tiled-32bpp-rotate-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +4
>         other tests skip
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@kms_big_fb@linear-8bpp-rotate-90.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +3
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-32bpp-rotate-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +8
>         other tests skip
>  *
>
>     igt@kms_big_fb@y-tiled-addfb:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#2328
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html>
>         (Intel XE#607
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/607>)
>  *
>
>     igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>)
>         +10 other tests skip
>  *
>
>     igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#2314
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314> /
>         Intel XE#2894
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-1-displays-2160x1440p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_bw@linear-tiling-3-displays-1920x1080p:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>)
>         +11 other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#3432
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +11 other tests skip
>  *
>
>     igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>)
>  *
>
>     igt@kms_cdclk@plane-scaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_cdclk@plane-scaling.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>  *
>
>     igt@kms_chamelium_color@ctm-0-50:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_chamelium_color@ctm-limited-range:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_chamelium_color@ctm-limited-range.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +9
>         other tests skip
>  *
>
>     igt@kms_chamelium_hpd@dp-hpd-storm:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-storm.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>         +10 other tests skip
>  *
>
>     igt@kms_chamelium_sharpness_filter@filter-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html>
>         (Intel XE#6507
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507>)
>  *
>
>     igt@kms_content_protection@content-type-change:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_content_protection@content-type-change.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_content_protection@content-type-change.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_content_protection@dp-mst-lic-type-1:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html>
>         (Intel XE#2390
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@dp-mst-suspend-resume:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_content_protection@dp-mst-suspend-resume.html>
>         (Intel XE#6743
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_content_protection@legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@kms_content_protection@legacy.html>
>         (Intel XE#1178
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_content_protection@legacy.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_content_protection@mei-interface:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_content_protection@mei-interface.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_content_protection@mei-interface.html>
>         (Intel XE#2341
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341>)
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-256x85:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) +3
>         other tests skip
>  *
>
>     igt@kms_cursor_crc@cursor-offscreen-max-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x170:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_cursor_crc@cursor-random-512x512:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html>
>         (Intel XE#2321
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321>)
>  *
>
>     igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         DMESG-WARN
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html>
>         (Intel XE#5354
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354>)
>  *
>
>     igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#2286
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_dsc@dsc-with-bpc-formats:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@kms_dsc@dsc-with-bpc-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_dsc@dsc-with-formats:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_dsc@dsc-with-formats.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-dpms:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) +1
>         other test skip
>  *
>
>     igt@kms_flip@2x-flip-vs-panning-vs-hang:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         (Intel XE#2316
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_flip@flip-vs-suspend-interruptible:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) +5
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html>
>         (Intel XE#2293
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293> /
>         Intel XE#2380
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>)
>         +11 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +1
>         other test skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +12 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +3
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>         +19 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +21 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>)
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +7
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +22 other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) +4
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html>
>         (Intel XE#2312
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onoff.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>) +5
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +22 other tests skip
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>) ->
>         ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>)
>  *
>
>     igt@kms_joiner@invalid-modeset-ultra-joiner:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#6911
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_panel_fitting@legacy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-1/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#2486
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_panel_fitting@legacy.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_pipe_stress@stress-xrgb8888-ytiled:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html>
>         (Intel XE#4329
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_plane_lowres@tiling-y:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_plane_lowres@tiling-y.html>
>         (Intel XE#2393
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393>)
>  *
>
>     igt@kms_plane_multiple@2x-tiling-y:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html>
>         (Intel XE#5021
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html>
>         (Intel XE#4596
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596>)
>  *
>
>     igt@kms_plane_scaling@planes-downscale-factor-0-5:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         (Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html>
>         (Intel XE#6886
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886>)
>  *
>
>     igt@kms_pm_backlight@fade:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_pm_backlight@fade.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_pm_backlight@fade.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_pm_dc@dc3co-vpb-simulation:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#2391
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_pm_dc@dc3co-vpb-simulation.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_pm_dc@dc5-retention-flops:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_pm_dc@dc5-retention-flops.html>
>         (Intel XE#3309
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309>)
>  *
>
>     igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#6693
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html>
>         (Intel XE#1439
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439> /
>         Intel XE#3141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141> /
>         Intel XE#836
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/836>)
>  *
>
>     igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +5
>         other tests skip
>  *
>
>     igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>) +7
>         other tests skip
>  *
>
>     igt@kms_psr@psr-primary-page-flip:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +7
>         other tests skip
>  *
>
>     igt@kms_psr@psr2-no-drrs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_psr@psr2-no-drrs.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +9
>         other tests skip
>  *
>
>     igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414>)
>  *
>
>     igt@kms_rotation_crc@primary-rotation-270:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-270.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html>
>         (Intel XE#2330
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330>) +1
>         other test skip
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +1
>         other test skip
>  *
>
>     igt@kms_scaling_modes@scaling-mode-full-aspect:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>         (Intel XE#2413
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_sharpness_filter@filter-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_sharpness_filter@filter-basic.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_sharpness_filter@filter-basic.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) +2
>         other tests skip
>  *
>
>     igt@kms_sharpness_filter@invalid-filter-with-scaler:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaler.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#1729
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>)
>  *
>
>     igt@kms_tiled_display@basic-test-pattern-with-chamelium:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#2426
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@kms_vrr@cmrr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@kms_vrr@cmrr.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_vrr@cmrr.html>
>         (Intel XE#2168
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168>)
>  *
>
>     igt@kms_vrr@flip-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@kms_vrr@flip-basic.html>
>         (Intel XE#1499
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_vrr@flip-basic.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_compute@ccs-mode-basic:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@xe_compute@ccs-mode-basic.html>
>         (Intel XE#6599
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-ufence-reconnect:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>)
>  *
>
>     igt@xe_eudebug@basic-vm-bind-vm-destroy:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +6
>         other tests skip
>  *
>
>     igt@xe_eudebug@basic-vms:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug@basic-vms.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@xe_eudebug@basic-vms.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +5
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@single-step:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug_online@single-step.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@xe_eudebug_online@single-step.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) +3
>         other tests skip
>  *
>
>     igt@xe_eudebug_online@stopped-thread:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +7
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +5
>         other tests skip
>  *
>
>     igt@xe_exec_basic@multigpu-once-null-rebind:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>) +6
>         other tests skip
>  *
>
>     igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>)
>         +32 other tests skip
>  *
>
>     igt@xe_exec_multi_queue@one-queue-priority-smem:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-priority-smem.html>
>         (Intel XE#6874
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-priority-smem.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +28 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html>
>         (Intel XE#5007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007>) +1
>         other test skip
>  *
>
>     igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html>
>         (Intel XE#5007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>         +20 other tests skip
>  *
>
>     igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>)
>         +22 other tests skip
>  *
>
>     igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html>
>         (Intel XE#6281
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281>)
>  *
>
>     igt@xe_oa@oa-tlb-invalidate:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#2248
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>)
>  *
>
>     igt@xe_pm@d3cold-i2c:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@xe_pm@d3cold-i2c.html>
>         (Intel XE#5694
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694>)
>  *
>
>     igt@xe_pm@d3cold-multiple-execs:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +1
>         other test skip
>  *
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>) +1
>         other test skip
>  *
>
>     igt@xe_pxp@display-black-pxp-fb:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@xe_pxp@display-black-pxp-fb.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>)
>  *
>
>     igt@xe_pxp@pxp-termination-key-update-post-suspend:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html>
>         (Intel XE#4733
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) +2
>         other tests skip
>  *
>
>     igt@xe_query@multigpu-query-hwconfig:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_query@multigpu-query-hwconfig.html>
>         (Intel XE#944
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/944>) +5
>         other tests skip
>  *
>
>     igt@xe_sriov_flr@flr-each-isolation:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#6557
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557> /
>         Intel XE#6703
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703>) ->
>         FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html>
>         (Intel XE#6569
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569>)
>
>
>     Build changes
>
>   * IGT: IGT_8674 -> IGTPW_14238
>   * Linux: xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7 ->
>     xe-4268-d2fe88bbc66599aedc08d081a76460e34fb56786
>
> IGTPW_14238: 099599f25127a89bdaa7b01a924f6886b5ae01bb @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7: 
> e0eb6ad399f8369d978ca40f07cbf5c6c16647d7
> xe-4268-d2fe88bbc66599aedc08d081a76460e34fb56786: 
> d2fe88bbc66599aedc08d081a76460e34fb56786
>
--------------D6oxcZ9lgRCosm0loslc82Ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12/20/2025 12:11 AM, Patchwork
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:176618590352.108745.9915286703591=
756044@a3b018990fe9">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>intel-ci: Add xe.wcl.core.blocklist.txt</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/159239/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/159239/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14238/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from XEIGT_8674_FULL -&gt;
        XEIGTPW_14238_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with XEIGTPW_14238_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in XEIGTPW_14238_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        XEIGTPW_14238_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@testdisplay:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-10/igt@testdisplay.html" moz-do-not-send=3D"true">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14=
238/shard-bmg-2/igt@testdisplay.html" moz-do-not-send=3D"true">ABORT</a></l=
i>
          </ul>
        </li>
      </ul>
    </blockquote>
    not related
    <blockquote type=3D"cite" cite=3D"mid:176618590352.108745.9915286703591=
756044@a3b018990fe9">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in XEIGTPW_14238_FULL that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@fbdev@write:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@fbdev@write.html" moz-do-not-send=3D"true">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
38/shard-bmg-5/igt@fbdev@write.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134" moz-do-no=
t-send=3D"true">Intel XE#2134</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407" moz-do-not-se=
nd=3D"true">Intel XE#1407</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@kms_big_fb@x-tiled-16bpp-rota=
te-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#=
2327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_big_fb@yf-tiled-64bpp-ro=
tate-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE=
#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-180.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel X=
E#1124</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-addfb:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1467" moz-do-not-send=3D"true">Intel XE#1467</a>)=
 +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_bw@connected-linear-tili=
ng-3-displays-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-se=
nd=3D"true">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2894" moz-do-not-send=3D"true">Intel XE#2894</a>) +1 ot=
her test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_bw@connected-linear-tilin=
g-3-displays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191" moz-do-not-send=
=3D"true">Intel XE#2191</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_bw@linear-tiling-4-displa=
ys-1920x1080p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">In=
tel XE#367</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true"=
>Intel XE#2887</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-ed=
p-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-bmg-ccs@pipe-b-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669" moz-do-=
not-send=3D"true">Intel XE#2669</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-do-not-send=
=3D"true">Intel XE#2652</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>) +3 other =
tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_ccs@random-ccs-data-y-til=
ed-gen12-rc-ccs-cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"tr=
ue">Intel XE#2887</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_cdclk@mode-transition-all=
-outputs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4418" moz-do-not-send=3D"true">Intel =
XE#4418</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-25:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_chamelium_color@ctm-0-25.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2325" moz-do-not-send=3D"true">Intel XE#2325</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@degamma:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_chamelium_color@degamma.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/306" moz-do-not-send=3D"true">Intel XE#306</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-af=
ter-hibernate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373" moz-do-not-send=3D"true">In=
tel XE#373</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm-disable.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Int=
el XE#2252</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@atomic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_content_protection@atomic=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178<=
/a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel=
 XE#2320</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-m=
ovement-max-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1424" moz-do-not-send=3D"true=
">Intel XE#1424</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding=
-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel =
XE#2321</a>) +1 other test
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding=
-512x512.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel =
XE#2321</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309" moz-do-not-send=3D"true">In=
tel XE#309</a>) +2 other tests
              skip</li>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.ht=
ml" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_cursor_legacy@2x-flip=
-vs-cursor-legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"tru=
e">Intel XE#2291</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html"=
 moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cu=
rsor-atomic.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4633" moz-do-not-send=3D"true">Int=
el XE#4633</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4210" moz-do-not-send=3D"true">Intel XE#4210<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_dp_linktrain_fallback@dsc=
-fallback.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4331" moz-do-not-send=3D"true">Intel=
 XE#4331</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_dsc@dsc-basic.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fb_coherency@memset-crc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_fb_coherency@memset-crc.h=
tml" moz-do-not-send=3D"true">CRASH</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6706" moz-do-not-send=3D"true">Intel XE#6706</=
a>) +1 other test
              crash</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fb_coherency@memset-crc@mmap-offset-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_fb_coherency@memset-crc@m=
map-offset-wc.html" moz-do-not-send=3D"true">CRASH</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6706" moz-do-not-send=3D"true">=
Intel XE#6706</a>) +1 other test
              crash</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</=
p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-out-visible-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422" moz-do-not-se=
nd=3D"true">Intel XE#4422</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interr=
uptible.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_flip@2x-fli=
p-vs-absolute-wf_vblank-interruptible.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" mo=
z-do-not-send=3D"true">Intel XE#2316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interrupti=
ble.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_flip@2x-flip-vs=
-expired-vblank-interruptible.html" moz-do-not-send=3D"true">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321" moz-do-not=
-send=3D"true">Intel XE#3321</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_flip@2x-plain-flip-fb-rec=
reate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1421" moz-do-not-send=3D"true">Intel XE#=
1421</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html" =
moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_flip@flip-vs-expired-vbla=
nk@a-edp1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel =
XE#301</a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@wf_vblank-ts-check:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_flip@wf_vblank-ts-check.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a=
>) +198 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-d=
ownscaling:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32b=
pp-yftileccs-to-64bpp-yftile-downscaling.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293"=
 moz-do-not-send=3D"true">Intel XE#2293</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2=
380</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-dow=
nscaling@pipe-a-valid-mode:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2293" moz-do-not-send=3D"true">Intel XE#2293</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upsc=
aling:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401" moz-d=
o-not-send=3D"true">Intel XE#1401</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1745" moz-do-not-send=3D"true">Intel XE#1745</a=
>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upsc=
aling@pipe-a-default-mode:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-upscaling@pipe-a-default-mode.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1401" moz-do-not-send=3D"true">Intel XE#1401</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt=
:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651" moz-do-not-=
send=3D"true">Intel XE#651</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-r=
ender:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656" moz-do=
-not-send=3D"true">Intel XE#656</a>) +19 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"t=
rue">Intel XE#2311</a>) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-d=
o-not-send=3D"true">Intel XE#4141</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-shrfb-dr=
aw-mmap-wc:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312" =
moz-do-not-send=3D"true">Intel XE#6312</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw=
-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-primscrn-pri-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz=
-do-not-send=3D"true">Intel XE#2312</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2350" moz-do-not-send=3D"true">Intel=
 XE#2350</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mm=
ap-wc:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-mmap-wc.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-d=
o-not-send=3D"true">Intel XE#2313</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_hdr@invalid-hdr@pipe-a-hd=
mi-a-3.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6740" moz-do-not-send=3D"true">Intel X=
E#6740</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-swap:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_hdr@static-swap.html" moz-do-not-send=3D"=
true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14238/shard-bmg-9/igt@kms_hdr@static-swap.html" moz-do-not-send=3D"tru=
e">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6740" moz-do-not-send=3D"true">Intel XE#6740</a>) +1 other test
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@static-toggle:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@kms_hdr@static-toggle.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-big-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_joiner@basic-big-joiner.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6901" moz-do-not-send=3D"true">Intel XE#6901</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@basic-force-ultra-joiner:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_joiner@basic-force-ultra-=
joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6900" moz-do-not-send=3D"true">Intel XE=
#6900</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6911" moz-do-not-send=3D"true=
">Intel XE#6911</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb88=
88-yftiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6912" moz-do-not-send=3D"true">Inte=
l XE#6912</a>)</li>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb88=
88-yftiled.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6912" moz-do-not-send=3D"true">Inte=
l XE#6912</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_plane_lowres@tiling-x@pip=
e-b-edp-1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/599" moz-do-not-send=3D"true">Intel =
XE#599</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@tiling-y:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@kms_plane_multiple@tiling-y.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5020" moz-do-not-send=3D"true">Intel XE#5020</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-=
75@pipe-a:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" m=
oz-do-not-send=3D"true">Intel XE#6886</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc6-psr:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2392" moz-do-not-send=3D"true">Intel XE#2392</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_pm_rpm@basic-pci-d3-state.html" moz-do-no=
t-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_pm_rpm@basic-pci-d3-state.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6693" moz-do-not-send=3D"true">Intel XE#6693</a>) +2 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lp=
sp.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6693" moz-do-not-send=3D"true">Intel XE#669=
3</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@package-g7:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_pm_rpm@package-g7.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6814" moz-do-not-send=3D"true">Intel XE#6814</a>)</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-pla=
ne-move-continuous-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D=
"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +5 other t=
ests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-s=
f:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-no=
t-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2893" moz-do-not-send=3D"true">Intel XE#2893</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608" moz-do=
-not-send=3D"true">Intel XE#4608</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-s=
f@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf@pipe-a-edp-1.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
06" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4608" moz-do-not-send=3D"true">Intel X=
E#4608</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_psr2_sf@pr-cursor-plane-u=
pdate-sf.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel =
XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2893" moz-do-not-send=3D"true">Intel XE#2893</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_psr2_sf@psr2-plane-move-=
sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Int=
el XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1489" moz-do-not-send=3D"true">Intel XE#1489</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-nv12:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_psr2_su@page_flip-nv12.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387" moz=
-do-not-send=3D"true">Intel XE#2387</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_psr2_su@page_flip-xrgb888=
8.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1128" moz-do-not-send=3D"true">Intel XE#1128=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
 moz-do-not-send=3D"true">Intel XE#1406</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a>) =
+1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-psr2-suspend@edp-1:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend@edp-=
1.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609"=
 moz-do-not-send=3D"true">Intel XE#4609</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@kms_psr@psr-basic.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-=
send=3D"true">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a>) +8 =
other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_psr@psr2-primary-render.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" mo=
z-do-not-send=3D"true">Intel XE#2234</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@kms_psr_stress_test@flip-prim=
ary-invalidate-overlay.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=
=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4692" moz-do-not-send=3D"true">Intel XE#4692</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true=
">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3904" moz-do-not-send=3D"true">Intel XE#3904</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_rotation_crc@sprite-rotat=
ion-90-pos-100-0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true=
">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3904" moz-do-not-send=3D"true">Intel XE#3904</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-center:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_scaling_modes@scaling-mod=
e-center.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2413" moz-do-not-send=3D"true">Intel =
XE#2413</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-vr=
r.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499=
</a>)</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vr=
r.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1499" moz-do-not-send=3D"true">Intel XE#1499=
</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_eudebug@basic-vm-bind.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</a>) =
+1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-empty:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@xe_eudebug@discovery-empty.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</a=
>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_eudebug_online@breakpoint-=
many-sessions-tiles.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"t=
rue">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6665" moz-do-not-send=3D"true">Intel XE#6665</a>) +2 other tes=
ts
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@pagefault-read-stress:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_eudebug_online@pagefault-r=
ead-stress.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send=3D"true">Inte=
l XE#6665</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@pagefault-write-stress:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@xe_eudebug_online@pagefault-w=
rite-stress.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-send=3D"true">Int=
el XE#6665</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6681" moz-do-not-send=3D"true">Intel XE#6681</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:=
</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-sram-target-sram.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-=
send=3D"true">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6665" moz-do-not-send=3D"true">Intel XE#6665</a>) +1 =
other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_sriov@deny-sriov:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5793" moz-do-not-send=3D"true">Intel XE#5793</a=
>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_evict@evict-beng-threads-l=
arge-multi-vm.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/688" moz-do-not-send=3D"true">In=
tel XE#688</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecque=
ue-userptr-invalidate-race:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate-race.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1392" moz-do-not-send=3D"true">Intel XE#1392</a>) +1 other test
              skip</li>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr-invalidate-race.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2322" moz-do-not-send=3D"true">Intel XE#2322</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_compute_mode@twice-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_compute_mode@twice-ba=
sic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6557" moz-do-not-send=3D"true">Intel XE#65=
57</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3" moz-do-not-send=3D"true">Intel XE#6703</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-userptr=
:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_exec_multi_queue@many-queu=
es-preempt-mode-fault-userptr.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not=
-send=3D"true">Intel XE#6874</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@two-queues-priority:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@xe_exec_multi_queue@two-queue=
s-priority.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not-send=3D"true">Inte=
l XE#6874</a>) +13 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p=
>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_exec_system_allocator@many=
-execqueues-mmap-new-huge.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-se=
nd=3D"true">Intel XE#4943</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-stride-malloc-prefetch-madvi=
se:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_exec_system_allocator@many=
-stride-malloc-prefetch-madvise.html" moz-do-not-send=3D"true">WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786" moz-do-n=
ot-send=3D"true">Intel XE#5786</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@once-mmap-race-nomemset:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-race-nomem=
set.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_system_allo=
cator@once-mmap-race-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557" moz-do-not=
-send=3D"true">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +9=
 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp=
-multi-vma:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-uc-comp-multi-vma.html" moz-do-not-send=3D"true">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196" =
moz-do-not-send=3D"true">Intel XE#6196</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-free=
-huge:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@xe_exec_system_allocator@proc=
ess-many-execqueues-mmap-free-huge.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-d=
o-not-send=3D"true">Intel XE#4943</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lm=
em_ready:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-functio=
n-wait_for_lmem_ready.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@x=
e_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +523 =
other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_gt_freq@freq_suspend:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/584" moz-do-not-send=3D"true">Intel XE#584</a>) +1 =
other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-lnl: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html" moz-do-not-send=3D=
"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8=
674/shard-lnl-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-l=
nl-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe=
_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html=
" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html" moz-do-no=
t-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGT_8674/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_867=
4/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl=
-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-4/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/=
shard-lnl-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-1/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@=
load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-7/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGT_8674/shard-lnl-2/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGT_8674/shard-lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"tru=
e">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/=
shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-3=
/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGT_8674/shard-lnl-8/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_mo=
dule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14238/shard-lnl-7/igt@xe_module_load@load.html" moz-do-not-=
send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14238/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"=
true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14238/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/sh=
ard-lnl-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-=
5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@xe_module_load@load.html"=
 moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/IGTPW_14238/shard-lnl-2/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14238/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14238/shard-lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1423=
8/shard-lnl-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-=
lnl-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@xe_module_load=
@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_module_load@load.ht=
ml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/IGTPW_14238/shard-lnl-3/igt@xe_module_load@load.html" moz-=
do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14238/shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/IGTPW_14238/shard-lnl-3/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1=
4238/shard-lnl-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378"=
 moz-do-not-send=3D"true">Intel XE#378</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-mmap-system:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_pm@d3cold-mmap-system.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/366" moz-do=
-not-send=3D"true">Intel XE#366</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284=
</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-50:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-5/igt@xe_pmu@engine-activity-accura=
cy-50.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6251" moz-do-not-send=3D"true">Intel XE#=
6251</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post=
-termination-irq.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true=
">Intel XE#4733</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-pxp-status:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@xe_query@multigpu-query-pxp-s=
tatus.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true">Intel XE#9=
44</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-do-not-send=3D"true"=
>Intel XE#944</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_vm@out-of-memory:</p>
          <ul>
            <li>shard-lnl: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/IGTPW_14238/shard-lnl-4/igt@xe_vm@out-of-memory.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5745" moz-do-not-send=3D"true">Intel XE#5745</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@fbdev@nullptr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@fbdev@nullptr.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
34" moz-do-not-send=3D"true">Intel XE#2134</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@fbdev@nullptr.h=
tml" moz-do-not-send=3D"true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_addfb_basic@unused-handle:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_addfb_basic@unused-handle.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt=
@kms_addfb_basic@unused-handle.html" moz-do-not-send=3D"true">PASS</a> +528=
 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</=
p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-eve=
nts-linear.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5993" moz-do-not-send=3D"true">Inte=
l XE#5993</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/I=
GTPW_14238/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events=
-linear.html" moz-do-not-send=3D"true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.=
html" moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3862" moz-do-not-send=3D"true">Intel XE#=
3862</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14238/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz=
-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atom=
ic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2291" moz-do-not-send=3D"true">Intel XE#229=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
38/shard-bmg-10/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html" m=
oz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible=
.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE#301</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149" mo=
z-do-not-send=3D"true">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-8/igt@kms_flip@flip-vs-expi=
red-vblank-interruptible.html" moz-do-not-send=3D"true">PASS</a> +1 other t=
est pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible=
@a-edp1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/301" moz-do-not-send=3D"true">Intel XE=
#301</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14238/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.=
html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-8/igt@kms_flip@flip-vs-suspend.html" moz-do-not-sen=
d=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2049" moz-do-not-send=3D"true">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" moz-do-not-se=
nd=3D"true">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_flip@flip-vs-suspend.html" m=
oz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@basic-rte:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6693" moz-do-not-send=3D"true">Intel XE#6693</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_pm_r=
pm@basic-rte.html" moz-do-not-send=3D"true">PASS</a> +2 other tests pass</l=
i>
          </ul>
        </li>
        <li>
          <p>igt@kms_vblank@ts-continuation-dpms-rpm:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-rpm.html" moz=
-do-not-send=3D"true">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14238/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-=
rpm.html" moz-do-not-send=3D"true">PASS</a> +3 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp=
-1.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2142" moz-do-not-send=3D"true">Intel XE#214=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
38/shard-lnl-7/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html" mo=
z-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_balancer@twice-virtual-basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_exec_balancer@twice-virtual-basic.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6557" moz-do-not-send=3D"true">Intel XE#6557</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-no=
t-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@xe_exec_balancer@twice-virtu=
al-basic.html" moz-do-not-send=3D"true">PASS</a> +7 other tests pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-sing=
le-vma:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pa=
t-idx-uc-single-vma.html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5625" moz-do-not-send=3D"t=
rue">Intel XE#5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/IGTPW_14238/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madv=
ise-pat-idx-uc-single-vma.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kuni=
t.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2229" moz-do-not-send=3D"true">Intel XE#2229=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1423=
8/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html" moz-=
do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-90:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-90.html" moz-=
do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6251" moz-do-not-send=3D"true">Intel XE#6251</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-lnl-=
1/igt@xe_pmu@engine-activity-accuracy-90.html" moz-do-not-send=3D"true">PAS=
S</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_auto_provisioning@selfconfig-basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-basic.h=
tml" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5937" moz-do-not-send=3D"true">Intel XE#5937</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/s=
hard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-basic.html" moz-do-not=
-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing=
-internal-panels:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-tran=
sition-fencing-internal-panels.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370" moz-do-no=
t-send=3D"true">Intel XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_atomic_transition@plane-=
all-modeset-transition-fencing-internal-panels.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-=
4/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327"=
 moz-do-not-send=3D"true">Intel XE#2327</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-10/igt@kms_big_fb@linear-8bpp-rotate-90.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel XE#2327</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5=
/igt@kms_big_fb@linear-8bpp-rotate-90.html" moz-do-not-send=3D"true">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" mo=
z-do-not-send=3D"true">Intel XE#6703</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1124" moz-do-not-send=3D"true">Intel XE#1124</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg=
-5/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3" moz-do-not-send=3D"true">Intel XE#6703</a>) +8 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2328" moz-do-not-send=3D"true">Intel XE#2328</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_=
big_fb@y-tiled-addfb.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"=
true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238=
/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/607" moz-do-not-send=3D"true">Intel XE#607</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-=
1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124"=
 moz-do-not-send=3D"true">Intel XE#1124</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-256=
0x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2314" moz-do-not-send=3D"true">Intel X=
E#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2894" moz-do-not-send=3D"true">Intel XE#2894</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_bw@conne=
cted-linear-tiling-3-displays-2560x1440p.html" moz-do-not-send=3D"true">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703"=
 moz-do-not-send=3D"true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-2160x1440p.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/sh=
ard-bmg-10/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/367" moz-do-not-send=3D"true">Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-1920x1080p.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true">Intel XE#367</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shar=
d-bmg-5/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2652" moz-do-not-send=3D"true">Intel XE#2652</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-=
not-send=3D"true">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-t=
iled-lnl-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">In=
tel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-=
cc.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
38/shard-bmg-9/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">Intel XE#2887</a>) +11 =
other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-cc=
s.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3432" moz-do-not-send=3D"true">Intel XE#3432=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1423=
8/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +2 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-r=
c-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"true">Intel XE#=
2887</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14238/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>=
) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard=
-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2652" moz-do-not-send=3D"true">Intel XE#2652</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">I=
ntel XE#787</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@plane-scaling:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_cdclk@plane-scaling.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_c=
dclk@plane-scaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2724" moz-do-not-send=3D"tr=
ue">Intel XE#2724</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-0-50:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-3/igt@kms_chamelium_color@ctm-0-50.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2325" moz-do-not-send=3D"true">Intel XE#2325</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@=
kms_chamelium_color@ctm-0-50.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-=
send=3D"true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-limited-range:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-b=
mg-7/igt@kms_chamelium_color@ctm-limited-range.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325" moz-do-not-send=3D"true">Intel XE#2325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel XE#2252</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/=
shard-bmg-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +9 other t=
ests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/ig=
t@kms_chamelium_hpd@dp-hpd-storm.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-=
not-send=3D"true">Intel XE#2252</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/s=
hard-bmg-7/igt@kms_chamelium_sharpness_filter@filter-basic.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6507" moz-do-not-send=3D"true">Intel XE#6507</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@content-type-change:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@kms_content_protection@content-type-change.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2341" moz-do-not-send=3D"true">Intel XE#2341</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/sh=
ard-bmg-5/igt@kms_content_protection@content-type-change.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-1.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shar=
d-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2390" moz-do-not-send=3D"true">Intel XE#2390</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_content_protection@dp-mst-suspend-resume.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6743" moz-do-not-send=3D"true">Intel XE#6743</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/=
shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-3/igt@kms_content_protection@legacy.html" moz-do-no=
t-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178" moz-do-not-send=3D"true">Intel XE#1178</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt=
@kms_content_protection@legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-no=
t-send=3D"true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_content_protection@mei-interface:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_content_protection@mei-interface.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bm=
g-10/igt@kms_content_protection@mei-interface.html" moz-do-not-send=3D"true=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2341" moz-do-not-send=3D"true">Intel XE#2341</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-256x85.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-=
bmg-10/igt@kms_cursor_crc@cursor-offscreen-256x85.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2320" moz-do-not-send=3D"true">Intel XE#2320</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-max-size.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">Intel XE#2320</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shar=
d-bmg-5/igt@kms_cursor_crc@cursor-offscreen-max-size.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x170:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2321" moz-do-not-send=3D"true">Intel XE#2321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bm=
g-5/igt@kms_cursor_crc@cursor-random-512x170.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6=
703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-random-512x512:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bm=
g-7/igt@kms_cursor_crc@cursor-random-512x512.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
321" moz-do-not-send=3D"true">Intel XE#2321</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-vary=
ing-size:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tra=
nsitions-varying-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D=
"true">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14238/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-at=
omic-transitions-varying-size.html" moz-do-not-send=3D"true">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354" moz-=
do-not-send=3D"true">Intel XE#5354</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p=
>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-toggle.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2286" moz-do-not-send=3D"true">Intel=
 XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IG=
TPW_14238/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-t=
oggle.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#=
6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-bpc-formats:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@=
kms_dsc@dsc-with-bpc-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-=
send=3D"true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-formats:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-1/igt@kms_dsc@dsc-with-formats.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2244" moz-do-not-send=3D"true">Intel XE#2244</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_=
dsc@dsc-with-formats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"=
true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-dpms:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-dpms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316" moz-do-not-send=3D"=
true">Intel XE#2316</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2316" moz-do-not-send=3D"true">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg=
-5/igt@kms_flip@2x-flip-vs-panning-vs-hang.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3" moz-do-not-send=3D"true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html" =
moz-do-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2049" moz-do-not-send=3D"true">Intel XE#2049</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597" m=
oz-do-not-send=3D"true">Intel XE#2597</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_flip@flip-vs-sus=
pend-interruptible.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"tr=
ue">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-down=
scaling:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bp=
p-yftile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"=
true">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-yftile-=
to-16bpp-yftile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-s=
end=3D"true">Intel XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380</a>) +5 o=
ther tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upsc=
aling:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bp=
p-yftile-upscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send=3D"tr=
ue">Intel XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@k=
ms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +2 other=
 tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-down=
scaling:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bp=
p-yftile-downscaling.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2293" moz-do-not-send=3D"=
true">Intel XE#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2380" moz-do-not-send=3D"true">Intel XE#2380</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt=
@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6557" moz-do-not-send=3D"true">Intel XE#6557</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-no=
t-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-msflip-blt=
:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-ind=
fb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">I=
ntel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-ind=
fb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">I=
ntel XE#2312</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-b=
lt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri=
-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14238/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-p=
ri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"tru=
e">Intel XE#4141</a>) +11 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-=
indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"true">=
Intel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur=
-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true"=
>Intel XE#2312</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-bl=
t:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-=
shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">=
Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14238/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri=
-shrfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"true"=
>Intel XE#4141</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:=
</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shr=
fb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-do-not-send=3D"true">I=
ntel XE#4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/IGTPW_14238/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrf=
b-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">In=
tel XE#6703</a>) +12 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-msflip-=
blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-=
indfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true=
">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14238/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primsc=
rn-indfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"t=
rue">Intel XE#6703</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-=
blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true=
">Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14238/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scnds=
crn-indfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"=
true">Intel XE#2311</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-dra=
w-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
pri-shrfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D=
"true">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14238/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-s=
cndscrn-pri-shrfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not=
-send=3D"true">Intel XE#2311</a>) +19 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-msflip-=
blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D"true=
">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGTPW_14238/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndsc=
rn-shrfb-msflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"t=
rue">Intel XE#6703</a>) +21 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-=
blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
shrfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6557" moz-do-not-send=3D"true=
">Intel XE#6557</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt@k=
ms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2311" moz-do-not-send=3D"true">Intel XE#2311</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-dra=
w-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
spr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-do-not-send=3D=
"true">Intel XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-s=
cndscrn-spr-indfb-draw-render.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not=
-send=3D"true">Intel XE#2312</a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-b=
lt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-s=
hrfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true"=
>Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14238/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn=
-shrfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"tru=
e">Intel XE#6703</a>) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw=
-blt:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-c=
ur-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"tru=
e">Intel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndsc=
rn-cur-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D=
"true">Intel XE#2312</a>) +4 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-onof=
f:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-c=
ur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2312" moz-do-not-send=3D"true">=
Intel XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14238/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-=
cur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true"=
>Intel XE#2313</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-r=
ender.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#=
6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_=
14238/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313" moz-do-not-send=3D"true">Intel XE#2313</a>=
) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@k=
ms_hdr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-do-not-se=
nd=3D"true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_hdr@invalid-hdr.html" moz-do-not-send=3D"=
true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_hdr@i=
nvalid-hdr.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6740" moz-do-not-send=3D"true">Int=
el XE#6740</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_joiner@invalid-modeset-ultra-joiner.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6911" moz-do-not-send=3D"true">Intel XE#6911</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard=
-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_panel_fitting@legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-1/igt@kms_panel_fitting@legacy.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2486" moz-do-not-send=3D"true">Intel XE#2486</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_=
panel_fitting@legacy.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"=
true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4329" moz-do-not-send=3D"true">Intel XE#4329</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-=
bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_lowres@tiling-y:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_plane_lowres@tiling-y.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@k=
ms_plane_lowres@tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393" moz-do-not-se=
nd=3D"true">Intel XE#2393</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_multiple@2x-tiling-y:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5021" moz-do-not-send=3D"true">Intel XE#5021</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/i=
gt@kms_plane_multiple@2x-tiling-y.html" moz-do-not-send=3D"true">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596" moz-do=
-not-send=3D"true">Intel XE#4596</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-5=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6886" moz-do-not-send=3D"true">Intel XE#6886<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238=
/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-=
75:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downsc=
ale-factor-0-75.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true"=
>Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/IGTPW_14238/shard-bmg-9/igt@kms_plane_scaling@planes-upscale-20x20-down=
scale-factor-0-75.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6886" moz-do-not-send=3D"tru=
e">Intel XE#6886</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@fade:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_pm_backlight@fade.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@kms_p=
m_backlight@fade.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send=3D"true"=
>Intel XE#870</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-n=
ot-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2391" moz-do-not-send=3D"true">Intel XE#2391</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/ig=
t@kms_pm_dc@dc3co-vpb-simulation.html" moz-do-not-send=3D"true">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-=
not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_dc@dc5-retention-flops:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/ig=
t@kms_pm_dc@dc5-retention-flops.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309" moz-do-n=
ot-send=3D"true">Intel XE#3309</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" =
moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6693" moz-do-not-send=3D"true">Intel XE#6693</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-=
bmg-4/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1439" moz-do-not-send=3D"true">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3141" moz-do-not-send=3D"true">In=
tel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/836" moz-do-not-send=3D"true">Intel XE#836</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</=
p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-s=
f-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Inte=
l XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1489" moz-do-not-send=3D"true">Intel XE#1489</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_psr2_=
sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Inte=
l XE#6703</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-ar=
ea.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#140=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703=
" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-1/igt@kms_psr2_sf@pr-pr=
imary-plane-update-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-no=
t-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489" moz-do-not-send=3D"true">Intel XE#1489</a>) +=
7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=
=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_psr@psr-primary-page-flip.html=
" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-d=
o-not-send=3D"true">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a=
>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-no-drrs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1406" moz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2234" moz-do-not-send=3D"true">=
Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2850" moz-do-not-send=3D"true">Intel XE#2850</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_p=
sr@psr2-no-drrs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +9 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_psr_stress_test@flip-primary-invalidate-o=
verlay.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2414" moz-do-not-send=3D"true">Intel XE#2414</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_psr_stres=
s_test@flip-primary-invalidate-overlay.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" m=
oz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#670=
3</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-o=
verlay.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-9/igt@kms_psr_stres=
s_test@invalidate-primary-flip-overlay.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406" m=
oz-do-not-send=3D"true">Intel XE#1406</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2414" moz-do-not-send=3D"true">Intel XE#241=
4</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-rotation-270:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-270.html" m=
oz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Intel XE#3414</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904" moz-do-n=
ot-send=3D"true">Intel XE#3904</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_rotation_crc@primary-ro=
tation-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Inte=
l XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-18=
0.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1423=
8/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2330" moz-do-not-send=3D"true">Intel XE#2330</a>) +1 oth=
er test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg=
-8/igt@kms_rotation_crc@sprite-rotation-90.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/341=
4" moz-do-not-send=3D"true">Intel XE#3414</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3904" moz-do-not-send=3D"true">Intel XE=
#3904</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-full-aspect.ht=
ml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2413" moz-do-not-send=3D"true">Intel XE#2413</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/sh=
ard-bmg-5/igt@kms_scaling_modes@scaling-mode-full-aspect.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_sharpness_filter@filter-basic.html" moz-d=
o-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2=
/igt@kms_sharpness_filter@filter-basic.html" moz-do-not-send=3D"true">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503" m=
oz-do-not-send=3D"true">Intel XE#6503</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scal=
er.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6503" moz-do-not-send=3D"true">Intel XE#650=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
38/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-scaler.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html" mo=
z-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1729" moz-do-not-send=3D"true">Intel XE#1729</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bm=
g-9/igt@kms_tiled_display@basic-test-pattern.html" moz-do-not-send=3D"true"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
426" moz-do-not-send=3D"true">Intel XE#2426</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-cha=
melium.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2426" moz-do-not-send=3D"true">Intel XE=
#2426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW=
_14238/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</=
a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@cmrr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@kms_vrr@cmrr.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@kms_vrr@cmrr.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2168" moz-do-not-send=3D"true">Intel XE#2168</a>)=
</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_vrr@flip-basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@kms_vrr@flip-basic.html" moz-do-not-send=3D"t=
rue">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499" moz-do-not-send=3D"true">Intel XE#1499</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@kms_vrr@fl=
ip-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel =
XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_compute@ccs-mode-basic:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_compute@ccs-mode-basic.html" moz-do-not-se=
nd=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@x=
e_compute@ccs-mode-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599" moz-do-not-se=
nd=3D"true">Intel XE#6599</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-ufence-reconnect:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-reconnect.htm=
l" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6557" moz-do-not-send=3D"true">Intel XE#6557</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-=
do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@xe_eudebug@basic-vm-bi=
nd-ufence-reconnect.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"t=
rue">Intel XE#4837</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vm-bind-vm-destroy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-vm-destroy.html" moz=
-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg=
-5/igt@xe_eudebug@basic-vm-bind-vm-destroy.html" moz-do-not-send=3D"true">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/670=
3" moz-do-not-send=3D"true">Intel XE#6703</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@basic-vms:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug@basic-vms.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-8/igt@xe_eudeb=
ug@basic-vms.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">In=
tel XE#4837</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@single-step:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_eudebug_online@single-step.html" moz-do-no=
t-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-2/igt=
@xe_eudebug_online@single-step.html" moz-do-not-send=3D"true">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-no=
t-send=3D"true">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6665" moz-do-not-send=3D"true">Intel XE#6665</a>) +=
3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@stopped-thread:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665" moz-do-not-se=
nd=3D"true">Intel XE#6665</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_eudebug_online@stopped-thread=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703<=
/a>) +7 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-=
mmap:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-null-defer-mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"tru=
e">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-ma=
ny-vm-null-defer-mmap.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D=
"true">Intel XE#6703</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_exec_basic@multigpu-once-null-rebind.html"=
 moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard=
-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html" moz-do-not-send=3D=
"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2322" moz-do-not-send=3D"true">Intel XE#2322</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-prior=
ity-smem:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fa=
ult-dyn-priority-smem.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D=
"true">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/IGTPW_14238/shard-bmg-3/igt@xe_exec_multi_queue@one-queue-preempt=
-mode-fault-dyn-priority-smem.html" moz-do-not-send=3D"true">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874" moz-do-not=
-send=3D"true">Intel XE#6874</a>) +32 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_multi_queue@one-queue-priority-smem:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-8/igt@xe_exec_multi_queue@one-queue-priority-smem.h=
tml" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6874" moz-do-not-send=3D"true">Intel XE#6874</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/s=
hard-bmg-5/igt@xe_exec_multi_queue@one-queue-priority-smem.html" moz-do-not=
-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +28 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-hu=
ge.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#670=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_142=
38/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html" mo=
z-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5007" moz-do-not-send=3D"true">Intel XE#5007</a>) +1 o=
ther test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge-nomemset:<=
/p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-new-hu=
ge-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5007" moz-do-not-send=3D"true">Int=
el XE#5007</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
IGTPW_14238/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-new-huge=
-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel=
 XE#6703</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemse=
t:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-7/igt@xe_exec_system_allocator@many-execqueues-mmap=
-huge-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-send=3D"true">=
Intel XE#4943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/IGTPW_14238/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mma=
p-huge-nomemset.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"true"=
>Intel XE#6703</a>) +20 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-exec=
queues-mmap-free-huge-nomemset:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-ma=
ny-large-execqueues-mmap-free-huge-nomemset.html" moz-do-not-send=3D"true">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/67=
03" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@xe_exec_system=
_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.=
html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4943" moz-do-not-send=3D"true">Intel XE#4943</=
a>) +22 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queu=
e_add:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_=
pxp_exec_queue_add.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"tr=
ue">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/IGTPW_14238/shard-bmg-4/igt@xe_fault_injection@exec-queue-create-fai=
l-xe_pxp_exec_queue_add.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281" moz-do-not-send=
=3D"true">Intel XE#6281</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_oa@oa-tlb-invalidate:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-4/igt@xe_oa@oa-tlb-invalidate.html" moz-do-not-send=
=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2248" moz-do-not-send=3D"true">Intel XE#2248</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@xe_oa=
@oa-tlb-invalidate.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-send=3D"tr=
ue">Intel XE#6703</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-i2c:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_pm@d3cold-i2c.html" moz-do-not-send=3D"tru=
e">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-10/igt@xe_pm@d3col=
d-i2c.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5694" moz-do-not-send=3D"true">Intel XE#=
5694</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@d3cold-multiple-execs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-2/igt@xe_pm@d3cold-multiple-execs.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-5/igt@x=
e_pm@d3cold-multiple-execs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-se=
nd=3D"true">Intel XE#6703</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_pm@s3-d3cold-basic-exec.html" moz-do-not-s=
end=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/igt@x=
e_pm@s3-d3cold-basic-exec.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284" moz-do-not-se=
nd=3D"true">Intel XE#2284</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@display-black-pxp-fb:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html" moz-do-not-=
send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-3/igt@x=
e_pxp@display-black-pxp-fb.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733" moz-do-not-se=
nd=3D"true">Intel XE#4733</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspen=
d.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4733" moz-do-not-send=3D"true">Intel XE#4733=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_1423=
8/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html" moz-=
do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) +2 oth=
er tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_query@multigpu-query-hwconfig:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_query@multigpu-query-hwconfig.html" moz-do=
-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6703" moz-do-not-send=3D"true">Intel XE#6703</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_14238/shard-bmg-4/=
igt@xe_query@multigpu-query-hwconfig.html" moz-do-not-send=3D"true">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944" moz-=
do-not-send=3D"true">Intel XE#944</a>) +5 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-each-isolation:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/IGT_8674/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html" moz-do-=
not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6557" moz-do-not-send=3D"true">Intel XE#6557</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703" moz-do-not-se=
nd=3D"true">Intel XE#6703</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/IGTPW_14238/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.=
html" moz-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6569" moz-do-not-send=3D"true">Intel XE#6569</=
a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>IGT: IGT_8674 -&gt; IGTPW_14238</li>
        <li>Linux: xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7
          -&gt; xe-4268-d2fe88bbc66599aedc08d081a76460e34fb56786</li>
      </ul>
      <p>IGTPW_14238: 099599f25127a89bdaa7b01a924f6886b5ae01bb @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-4267-e0eb6ad399f8369d978ca40f07cbf5c6c16647d7:
        e0eb6ad399f8369d978ca40f07cbf5c6c16647d7<br>
        xe-4268-d2fe88bbc66599aedc08d081a76460e34fb56786:
        d2fe88bbc66599aedc08d081a76460e34fb56786</p>
    </blockquote>
  </body>
</html>

--------------D6oxcZ9lgRCosm0loslc82Ec--
