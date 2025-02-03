Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5730CC02194
	for <igt-dev@archiver.kernel.org>; Mon,  3 Feb 2025 14:13:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB22310E4EB;
	Mon,  3 Feb 2025 14:13:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HrpxFpaW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7000C10E4EB
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Feb 2025 14:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738591990; x=1770127990;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3z+A9PRjD2CZhdB8Wgyn2GK15H9ZxVoDqUu2h2cRIYs=;
 b=HrpxFpaWhQeAR8LYdCp3IsUsyM15Ht6zUH/MshPa7iko3klGv4NHoi9V
 zTFCewOI0aJijaCWiTaXmuGHiO5mrttYtbNe2gW7AJ6jVeC6PhOIHhWMM
 +eEQCBkHvZgXME1vyq2nP4Kn8URXJgGJ1TKsXsSNQ1nQpEYNOXCgiYklt
 zLgOM1SvBv+y0PCt9QDuc7Yq6bmge+NN9jfFd0AyMJL0MQ15gdOkJ+AT7
 HuhyFOBukrQJh0xjol6r9cENYUAD+qshNM/Kw8kQcuGTJkdDNkwUhduE5
 DFvaG8HQ0KLlVjw3lfCYqlH0sLzMES4NQl0NMgK/t9ML5M+bBIr9SlUfx w==;
X-CSE-ConnectionGUID: Dtf+4HeWQhyODx2Kx8Qrng==
X-CSE-MsgGUID: lQpYHLy5QLu6oRntbEZ4gA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42834182"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="42834182"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 06:13:10 -0800
X-CSE-ConnectionGUID: Cc3jFAyTQKOel/iaLTTq4Q==
X-CSE-MsgGUID: YXi0k/lnQd6VAbg7MC21Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="114918809"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 06:13:09 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 06:13:09 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 06:13:09 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 06:13:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E5cPYk2GyII+3O6mN5KsfoJFPZ7bZasZlSUwrDeHtNNSW4TtA1gcvwURzvii318bgCUo06lpA0rCxVG20J9RdCX/fYUk0XEWz5IK6S4afJZN2iqAS4/8G24eJTo/epYtNBMnJR4pLSX344kr3Ekp2RR8QbbvxQgJSoabHOvV/SspZs7YMlGaVWfgVpgs46FQrUMW25gfoFtGlOcLUjhwbN/l1Sv7k4Vkb+PvREyi/EiuzfU0qHpHOLiKXxgP1pwgar4t8LG9q7x1lZM2SZy+51YpIE5iuc5fS4E5xtC3OGfnP+r9BAMA0s2JedJQjs8a5gtPraViU81903f3LDwe7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iuD7OifoCG+enLBC9imuJUopPkyEmV/e8wOdyyxYH9s=;
 b=tlKZcL/ikbk6mYy9oBxJ1sbAavCXXpF/qKq9zXZYrpzTbPD9eyikiP53gHAoIrnIupnLr4+fNEqUooHhCtU8bHSjYkrKEYK0JYkz3HCLaB0uBszTzNaNtwJZgRgxGgwA3hvR3fNB8s7O/2YW2MbkzCTrrkde7cST+Nu+qGEDJEhXASvkwKsJOf6kk8JYcM45DgxsJluuigeLQGHMWAwquZOdiJFBUiPN7uL+wil/iUS/vgcJi2HRbWp2yRQ70jZJW+K5vmm6EJTc3C4J33l+3bOu699BeaNIExy00rY7v6CV6wCNp3Mjwqf2WReOpdNkIl3vvLv2eEUN4A7F1YkcuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by SA2PR11MB5146.namprd11.prod.outlook.com (2603:10b6:806:116::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.23; Mon, 3 Feb
 2025 14:12:53 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.8398.017; Mon, 3 Feb 2025
 14:12:53 +0000
Message-ID: <fd581a1d-755c-4140-9be1-519ce90be050@intel.com>
Date: Mon, 3 Feb 2025 19:42:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 5/6] tests/intel/kms_cdclk.c: Modify skip condition
To: Swati Sharma <swati2.sharma@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <santhosh.reddy.guddati@intel.com>
References: <20241230190315.48821-1-swati2.sharma@intel.com>
 <20241230190315.48821-6-swati2.sharma@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20241230190315.48821-6-swati2.sharma@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0031.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::18) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|SA2PR11MB5146:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e8cf80e-e4c9-4c68-2c2c-08dd445cd94b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TTFVRjVZaDZGZ1ZhWTN3cTRMK25WeE5CVi9rdTVOVTFDNnBVY0NhcWJtZVdE?=
 =?utf-8?B?NWYzNHVJZHJmR2kzemY4S1FQRm5qaWYyUDlHbG5zR2NrUzlpblBVNXpsWmRC?=
 =?utf-8?B?YXYvNFpYT1VjYjhkdEtkcURzcUJ4WFZrV1JwbGI5azJrRURud1B3TUJ6QnZ3?=
 =?utf-8?B?RExuUUlDcHp1TFpjczRtdkx5NkVYSUpMa3RyU0kwYkFUTW1Za1pWT3FTYmxI?=
 =?utf-8?B?NzVWbjY4ZUVPQmJKS1hQd29QMkpaSnVLSTZLWm9oNi8ydTdsaEJqVmdXV0o2?=
 =?utf-8?B?TWFvMVJQd2RTcUtlTWNUL3RuL09hL1c3Rzc3cVdOaHpIZkhqZDc3QU50ZmpL?=
 =?utf-8?B?SjMwYVE0NFJJcnFvMHI3Uy9URERyTlUrSkdnNVMvV2VuOXBSanVWWFZwTiti?=
 =?utf-8?B?dHZFdXF3bGhrZkcvMGYwcTk3bmJraXM2U0JORG8yT2pXbFArUDN5Mk1DaHg5?=
 =?utf-8?B?U2gzTjR0VGNNMFd5c0RiQ2xOZmdpR21oOTA2dDJab1lxbHFYUEsrNlZCWlRS?=
 =?utf-8?B?UE1GMjdzcGlHdVp2ajVsV2Y5eUlscW9IR0pPNU1oU0dyZW00UWxPeTVnTXpD?=
 =?utf-8?B?Yi9aUENLWWpHYjRsaGR2TWZUckt2SWlaVnJqclVCWnVrSmlzNERQb1U4elJU?=
 =?utf-8?B?c0FiS3hNZCtnYUZuQk9oNno5bDRkVGJEdkhHdXVoSjBkUDJaTFFVd1RyT3h1?=
 =?utf-8?B?a1E0dTJQamp1MzdDR21STW9GeW9rMnVSVStZeHhJYWRjS2hoRzFkai9EUlVt?=
 =?utf-8?B?Sk5zVDlLSyt1cW9yeTV1dHFDTnJiOTRCWis0MzZuejVMNThFbk9ITXRzQjdx?=
 =?utf-8?B?elA0ZlZWbmZ6NjR6VCtCeStqY2VrTTd0SGlTdHM5S1BYSXJpRzNLMk5NTits?=
 =?utf-8?B?eTFhVTkrQzI3b2RJOVdPdEt1ZEhuR1RpaGRBY3ZmcHNxZ0FLZTJ3MnkrZnNz?=
 =?utf-8?B?VmtoYVRzTDVXcDZqM0dSWkZ4cHNTdVlYTFZKd21Zd1l5eHNnSHZLa3REM0dP?=
 =?utf-8?B?a3YvNG91THhUVFlwN0NGN0FPZXQwQktNQmlreTFpdnd5OEE0alpzT3haRVda?=
 =?utf-8?B?MGFIbmFnblorNHVIengrcC9xcWd2YzJJZnZXOTVuUllQRnFFT1g4MGlJUytm?=
 =?utf-8?B?R0U5bGp5azYvWEROYWFydTUzVHlkamc2UER0eFQ4VitMNUZQelRtWUJoZE94?=
 =?utf-8?B?VUtYWnRCY2Z5Y0hMUHNybFJnMFBOdmNiTVRJSlFyM0RmNlFMVXVHK3VaeFNs?=
 =?utf-8?B?UWR0MTkrMGo2ZFBtUy9yVGdrMUxZTzJYM1ZtelFVL2JiSVg5ZHF1L2lSaTRN?=
 =?utf-8?B?TWNkUFcwOTN3RVJrRUZZTnZuaWF2SmxXWVBHaGNWdG1jN3pxeGpjbkx3K2py?=
 =?utf-8?B?RnhqRW5vNmJyQ1NXMDJnV3BIckpyV2FVMTVJUzBrTTVUTFh0OTA4cHByM2Zw?=
 =?utf-8?B?QjlRc1ZLVjRTcHp1Vk9xdXJrMS84OElMMGtyRXAvRmdhYUtnMXJBZjljMzYz?=
 =?utf-8?B?SUFmQzg3MXpJd0NIa0VaaUNyQkJnckkxZW41a2puTWMzZ0pnUXFPejJ6QWdn?=
 =?utf-8?B?SFFKTEZFMXJvM2prTE0wdUx3M2Z5aVZFcnlONW41UnFiYWh0Mk80d1F4WktC?=
 =?utf-8?B?UTJvUFZXTDdpTVVlVG5TOGwxRmtnV1lvZmVSTXZrQ2p6cUt0UTJjbXN6WTFW?=
 =?utf-8?B?N25HVjJIZmdOdFZGRVFUa216c040dXBTUFA2cWNTNXJmc250YXA1T3ZQUFpC?=
 =?utf-8?B?M3RDY0pWZmJnUXoxRnNDek1SSFVyd0xjV014QTJWdGxHWHV4WitRQTN1TXB0?=
 =?utf-8?B?NzBOUFJSZXdrM2ZtMmZ4b05GaTQ5cTkrMzdGNlhjU2d2cEtibzY2TUNlaTlF?=
 =?utf-8?Q?XZCCUP7gHcRZQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STRQWUpXbEsrMldjbHRXYmZUVXYydll1MWV1RkFVQzdRdFFzS2NyeEFVM0c2?=
 =?utf-8?B?a2s1QU9NQStkNnNzNUROdndRREZCTEVuYjgyN1FhMEEvR2MyNmwwSCthWkRT?=
 =?utf-8?B?Rm5ZVGhqSjdoaGtwY04yTWNheGJWd21DSDJNTXV0UjA5MnlLVlVFMnhvR2h0?=
 =?utf-8?B?a0NzVzV4MDg5dTh6ei8wY0gweWgzSFVHVXpNM3BWMEtzL1V5SS9qRGRobmtk?=
 =?utf-8?B?YThONE53ampXR2RveFBOVlpORjlXZFZsNE12L1pQQ1JQcXZMM2hYdTh3ZnEw?=
 =?utf-8?B?SWdBa1JJWTlHQTdJaEpaUWo5SzRDaXI2SnkwMTZWWEZlUHZuTUp3VmpYeXBk?=
 =?utf-8?B?cURPZTU4N3RSQ3ZQbmlIc21nazRKbE9VUzlCMTdEM2hOSWVudWhBRjY4L3Jv?=
 =?utf-8?B?aE5sQmM4UnNzOVdINzJaVzY1SEQyWS9ndUwraHNZK0dUay9mdU5zdXhxcUdP?=
 =?utf-8?B?MlRYdE9MZ2NzMitkbytMMEhtNFVSV3VkcElvRk1oWk1tM0NVT2kvRlV5Y0xC?=
 =?utf-8?B?L2VaaG9PT1Fmald1cnFpZkZwdXlnWHM0ZzNxK3hKU2RoRFJ6NmllSXUrS0Q2?=
 =?utf-8?B?VUo4MHNETUhYSkp0T3hYa0E4RXM4cXFqVVJWU0U5T3RCUkJ6TWsxN2JUMnRa?=
 =?utf-8?B?TWtqVllaZWp2ZkYxQnA5Sm1GQlBBOStHZmpPbEdyUVZuTjhBU1haNG13cVMz?=
 =?utf-8?B?dmkrSDgyZkFZWS93dUtER3VmVGFOMkV2b3lXTTNLT01nRDJLWWhLNDhUcG94?=
 =?utf-8?B?SlJJMFhDTnJzVUdTSjJXb2F6NGJTaGFkLzRxeTZPdDBuQ3BndnBLdFJ5OHQ2?=
 =?utf-8?B?WHlOZHVHVFFKK0hQQVQzWW5aandmazVnZkVxT3Nub3lEV2Zvd2ZieXV4TnJn?=
 =?utf-8?B?cWZaQlBhWitGdU9KZkVoc3Z1SytQVE9jaFdPQllnNTJrQ2k5QjJyWFUzTHJv?=
 =?utf-8?B?NGQwckEyUFlNTEJ2SGd0L29jMm9kS0RjUmZxbkhoRUdtcXN1cWxTTkwvM3lv?=
 =?utf-8?B?amoyUWt2dU9sSkRMV1pLOVc3cFZ4cXZJeVZLeHlEMVRpaWcwYlYwUFdxcG5u?=
 =?utf-8?B?eUd2UUttWVNLVCt0UzF2VjRpdXFkS2dYd1IzRWV5TUIyMDRSeFNWVlJMOGoz?=
 =?utf-8?B?U01nb0pJR3R2UTJGZHNoQnJrYytTWGdwaXFIV2FFL2JuazNDM2tPYlpHQndm?=
 =?utf-8?B?ZWRlblpHTE14TXk0S1JYdGdMUXFuS0hQeUNUWDZ1UjBtZ0xoVVUzWENDQVQy?=
 =?utf-8?B?U2tNWVBUdlRTTmJJYVVnTmtmcTRQTGNoWm1IMi80eTRKRHF1K0g1SVlXeE14?=
 =?utf-8?B?N1crcnhYa1FmTXUyU0w4WGltZHRCSG5WZGxHVDdOa3NTR1NmVHYwUXZXVFo0?=
 =?utf-8?B?d0NOL2IzdXdHaGF6dk5jQlVON3lCYkprT1RCcHFBc2VRZFhjeWl1YzRVWVBY?=
 =?utf-8?B?LzZFci84YTNiMXhaSHlsRkxZRk40cjJ5NGZzb2szM01FeXZhRFVCR1AwMVBz?=
 =?utf-8?B?MmZJaDRHelBWY2RGT3pjZElubFYrVVkvSXdHS3pneFJCM0pQVmhLOFNqMjkw?=
 =?utf-8?B?ZzVsbE50VW1kUTdqeStMeXVyWWRGSWE2UmpxbmJSYnBhYlZwR0pKd3NrMHFV?=
 =?utf-8?B?NUVqeGY1dWkvcmJWRTBnYWZWT2JHVXV0UHlMTDl2bCtYVnY3Y3ZydUwrY3ll?=
 =?utf-8?B?UEFDd1hlcnRPN0JRTmxsK3R5VitsV2xkelUrN011QTBzVklhU1l4UFBsWFNk?=
 =?utf-8?B?OHRqOHMrTW1tT1pmYnhhNkNuNkM1TGdkY0EyZHg5TUw3SzZHbDU5VWxrVHdr?=
 =?utf-8?B?a0t0eEk3SSs4TlFqamNDbUZETkNveVI0K0NhZEtNN05laHZPakdkV2JQdkY1?=
 =?utf-8?B?aDZiWE9sWUlwN0MvQktWMlRQOGxQMUpMQ1lHTFVUK2JBQWZKQk1HL3VxbE1h?=
 =?utf-8?B?NXNTaGlURHpGZXFrN0I4VDhQdlE3ZnlrUTJqYXZFOVo2N29xVUJ3WDM5QXZo?=
 =?utf-8?B?YVBTNHBueitaa2hPWWZtcnFWQWE0UlZwUnFMaWdSWVQxN05VZjhKaGlnKzNs?=
 =?utf-8?B?akc4bm9UZEwwcXpib1FyV2U1cTJuN2I3M1pLNVhpaVBrVzhqTnpjeUJCRWxJ?=
 =?utf-8?B?bnU3T1VQSGUxZzAwTUEzcVBmTGYyY3lpckppTG5BcEZrcndhQ3cybE51bzhV?=
 =?utf-8?B?SkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e8cf80e-e4c9-4c68-2c2c-08dd445cd94b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 14:12:53.3158 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpsbU6leDRVt5TmlUvvcA65z+GkOJEi759keEWkyrlZIMpI2N9usfZw6+ANmln8zjAtsp3RH9Q6Clbq9KiWzW7u3vkgP69QayOmYvtcT0gc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5146
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


On 12/31/2024 12:33 AM, Swati Sharma wrote:
> Add vrefresh also as a parameter to check if highest and
> lowest refresh rates are identical.
>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   tests/intel/kms_cdclk.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
> index 67efdaa3f..fcbfa3f37 100644
> --- a/tests/intel/kms_cdclk.c
> +++ b/tests/intel/kms_cdclk.c
> @@ -223,7 +223,9 @@ static void test_mode_transition(data_t *data, enum pipe pipe, igt_output_t *out
>   		      mode_hi.vrefresh >= VREFRESH, "Mode >= 4K not found on output %s.\n",
>   		      igt_output_name(output));
>   
> -	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay && mode_hi.vdisplay == mode_lo.vdisplay,
> +	igt_skip_on_f(mode_hi.hdisplay == mode_lo.hdisplay &&
> +		      mode_hi.vdisplay == mode_lo.vdisplay &&

This can be part of patch were the condition is introduced Patch#3.

Regards,

Ankit

> +		      mode_hi.vrefresh == mode_lo.vrefresh,
>   		      "Highest and lowest mode resolutions are same; no transition\n");
>   
>   	primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -302,7 +304,8 @@ static void test_mode_transition_on_all_outputs(data_t *data)
>   		lowres_mode = *get_lowres_mode(output);
>   
>   		if (highres_mode.hdisplay == lowres_mode.hdisplay &&
> -		    highres_mode.vdisplay == lowres_mode.vdisplay) {
> +		    highres_mode.vdisplay == lowres_mode.vdisplay &&
> +		    highres_mode.vrefresh == lowres_mode.vrefresh) {
>   			igt_info("Highest and lowest mode resolutions are same on output %s; no transition will occur, skipping\n",
>   				  igt_output_name(output));
>   			continue;
