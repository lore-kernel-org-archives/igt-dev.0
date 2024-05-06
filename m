Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1680DC25B10
	for <igt-dev@archiver.kernel.org>; Mon,  6 May 2024 20:32:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B6D310F691;
	Mon,  6 May 2024 20:32:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/cxjs2b";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD0410F68B
 for <igt-dev@lists.freedesktop.org>; Mon,  6 May 2024 20:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715027542; x=1746563542;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=IMqw7xWcYTdy7va+ZD0jxWp+PSDRCTB0+E1Nod7fQI8=;
 b=W/cxjs2b4qbyFLT6lMdnG2VdGdhsoNTvrSGH3jcpOAhKA5Bbwxxuvp0O
 znrMC9FAPseDH94rK2qe2aKjHAYNH/vclFobV/ZBKEIfvbAVvKAmYjHcD
 MeDaww34ExnLhhR9ZhP0+myjMFIp9UHHSCHY0sImlZxKJotRVrqE3sF3o
 +ttT/40sVXzH+p1bMDX1wmBJC3ML4WZr4SkEwqackm5wlMpUQ6mApLKa7
 AXA7mk+zY7gyWfTRvzCnTkNle5lnIPFD3hICtYCbut1EiDp8HLe0Jz2FU
 KsmpH+1wTlCJw1+Ux9kpJemWsWMNTN02eTFPk8IAW7JkLUpzwzuFH/g03 A==;
X-CSE-ConnectionGUID: UU+gtjceQVqyzoOyz9G+rA==
X-CSE-MsgGUID: IrV6BEupQ3+fCB4pMM3KZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="14575628"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="14575628"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 13:32:22 -0700
X-CSE-ConnectionGUID: CJskYYnqTtqS0JChLHMHtg==
X-CSE-MsgGUID: sYkBRP9qRWC9SiZEQ8Hl+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; d="scan'208";a="28369379"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 13:32:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 13:32:21 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 13:32:21 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 13:32:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kIM7aNpcdCpXBe6SUOC8Rpsby2wGmJFd4aiesK1TYVuXpi7uPnkLgbkEshx5lxYmRDpUujHNs+pmQaCF4iv3Cv+tnp4X6Xo24PFEDCQC2nJNc8dNbzyhp1F03bHgroFMonD7qs8RaookMYwnQuroJDPxawec/crcXPWGMbtPQhfL5JrWJgs3oTTX8hHwNPR3KlIbl0oQBR98lf45LtzfeeeNhMtj+jHuZYwXo0td4gC10k3HTJ2CTkgeEXtC4MeAioGD9KQ/jOQRk72Ki1pDYAPcXnl9EeJcwlVqkpB8ksYjHS3vedHHN3opwJU3864kRWusnG4T4f7FCoaKvJcONg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRPQzV+t+bQ6Kpc6zqFilhOw9fqoD+BkccJetFcBwGw=;
 b=JXlxsEDdSUbmapoOMX4vvgjN0Xr48o1qPvraXnNDK3URcgeDx9zx6o4Zp7itxgrahh0aAthCDgBwf+TF+iigI01JARXv6LCfsyMPIwwD2QXrP3wYTSAcVbV9WXKGPi8UWPhtXbdQOm/AMJGAm9HyKXreFUP7pXPSKC+l4d2nDY2uLey1MGG7E6Vchx8KxTnz6px5spZFrMWDOCXTN1MMdRYWpcmlpP6pu+0UFUrDLllN4k4Ov6VvrOGD1ei57IKGDnrn7LEQHuhFeUmhRQGVmG3V6h01xJEd2XurytcVwiVrUBG+zxVJWbdhdBletQyQCn73MX24tXxvN01HbBZIVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ0PR11MB4847.namprd11.prod.outlook.com (2603:10b6:a03:2d9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Mon, 6 May
 2024 20:32:18 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::24f2:8bf0:3dbd:dc8c%3]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 20:32:18 +0000
Date: Mon, 6 May 2024 13:32:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <igt-dev@lists.freedesktop.org>, Tvrtko Ursulin <tursulin@ursulin.net>
Subject: Re: [PATCH i-g-t v3 02/13] lib/igt_drm_fdinfo: Allow any number of
 spaces before unit
Message-ID: <Zjk+UJ79kIQCXfiJ@orsosgc001>
References: <20240504064643.25863-1-lucas.demarchi@intel.com>
 <20240504064643.25863-3-lucas.demarchi@intel.com>
 <Zjk9cSpBdzyTcz54@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <Zjk9cSpBdzyTcz54@orsosgc001>
X-ClientProxiedBy: MW4PR04CA0385.namprd04.prod.outlook.com
 (2603:10b6:303:81::30) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ0PR11MB4847:EE_
X-MS-Office365-Filtering-Correlation-Id: 73bd6b34-1f60-4ee9-14bb-08dc6e0b9fcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d0NuRW1SeEtwTW94TXBJUG9UQWNEeDUxN1YvSzdKUFJBamFpdlhiRk4xenZB?=
 =?utf-8?B?dTFqRzE1ZysxYm95b2phUmljWndqVEZlWkRqb3RKcUJ1YmxlNFkraDg0SmdK?=
 =?utf-8?B?ZjlCNkRQakFSS2pNTEZUTjBHT2h2U1p6aVNiTHdGSEhLdFV3Ly9rWnNWOVNw?=
 =?utf-8?B?REF4NVVaOTNVQ1BtViswWGRYeDNMZUI5cis0UWpNN3ZwSWRwMVllRVVTTVhB?=
 =?utf-8?B?d1pQSUxlSm9USFZCT1lCQS9MMU9zV0VhN054RmRvcGNmRmVQV0FVZm5tYmtF?=
 =?utf-8?B?bitYN0ZlcWUybDNtZGxKRWxEdlh1ZjB2VzBVaWc4cnpGUFY0em04b2c0ZjFJ?=
 =?utf-8?B?NHpnMVpSWTV6RjNpUS9jb3lzd0V1azRWS1Y5aUppTHh6WDBDQXdaU2VtZDVm?=
 =?utf-8?B?a3lBbXFDQUdSK1hBRUhMeHNXUXVReUE5RlVGUEZUZWpmMHd6eWNqTysrdFdr?=
 =?utf-8?B?dm9MWERJMGRSZmFqemt5cUtQTVhIMXBNUnUwZlk2ZklKbFptWEE3NHhFTm1z?=
 =?utf-8?B?Zk56eHZkdTVWeEFSMkZKNytuWk4rMldHU1RTMkxuK1dNZ2FTUWlEOURuSisw?=
 =?utf-8?B?MllMNGphWm5WSGVna25VL0RYSWNjYjRuUHRRWU1tangyNVdqcElFS3Vta3pX?=
 =?utf-8?B?SGNVWE83ekw0Y0lSdTN4TGZNc2FqZ3dwbXJtR05tMWpSV2ZMaDdqTVRKNkdx?=
 =?utf-8?B?aEdJS1AzVDZPa0xZcjFKLzA3RHEvRkQvd2d2WWZJckw2Q044Q0NhTnJja1pE?=
 =?utf-8?B?WHMyWlJlU0NZbVhVK1p3QndpSkt6bk1TUGVKVjZldDNFcFhlRjBuc1UzVWNS?=
 =?utf-8?B?dGFXaU9LK1lJWEoxVUpXNjFsK0J5V09uV01HN2xQM0kvb3Y5bVNNdHMxZkI0?=
 =?utf-8?B?UkNhNk9HS1hkZVFybUNsM213NXZGcCtnTGtHK3dmY2NwU2lrckZMTDdFckRu?=
 =?utf-8?B?b2ZrSkNOZlZYN3VwcUVjdlhvZlJDMUQ2NGZIQ043L25MYnp4YTc1VjNsOTNQ?=
 =?utf-8?B?UEtQaTE4VjJVdjRmRDRFN1cvSDdCMmI1dnh0ZWdEZlJRZFM1N1M1YTYrRDRT?=
 =?utf-8?B?Unpmdzh4WEQ4Sm1PNTJEUDg2MnNtZS8xcWhjM0dhSExRV1BzOVJBZk44ZUJL?=
 =?utf-8?B?TnA3U1ZJQkhCRzZuOGZSS3g0d0FONVo5Mk1CQ0FxbElrQngvcnJFNHVpOE1a?=
 =?utf-8?B?cVlPakVQOWFDS2FxUGVRa2ZMdG5uT2ZGV0FJL0tDMEZjQWE4b25BZHV5cHEx?=
 =?utf-8?B?a0tCRGxaNC9Jemt1akJJeXR0Qmh6TDJGWFFxZmtiVHpDYllidThsTkVTOXA2?=
 =?utf-8?B?YmlML09jWW9jSlZUVHVtSERsb2tKNnpFR0FDYlQ5ZDlrWUJyYmVVbi9QZzlJ?=
 =?utf-8?B?a3B1UzhuQVJPZFFYZHFuSXhGcmg4WXVUbVVPaEZ2YXlhWGxxZWFURHk2Vkc5?=
 =?utf-8?B?Y1FXblZzSlhYVW54UzdsaFRvb3JJWUtRL2NpUHA3azNJN3VOREV1YmVsNXo3?=
 =?utf-8?B?Q01hVHlENEJxVTB1OVhJWnhtbURpV0VYbHkyZjVTMi82S21Dckk3Sm5WcnlZ?=
 =?utf-8?B?OXYrK3pUb2NkS1hacUU1YzBZcUM4UUQ5T0cxQ1I4NFhNYzZBU0FTZVpSclJm?=
 =?utf-8?B?ZCs3ZlRkZW8vMFo5dTNoSDJ1ZDBEZ3Q5eURVTHRtZmtMVU5GM1Vha3VIaU11?=
 =?utf-8?B?T0x2aXF3Y2p0WFJsWHlyeThaTkdIa0t6M0t4QjNmUkhpaXdVRTVtT0FRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aUdrM3Mwc3RTOFlYbWx5OU56aTluc2xFZzBVUllFSXp2RkpaNUhQSSt0dXpm?=
 =?utf-8?B?d2FISi9kemxiVm5KOU5LUndYSmpHSng0M0N5MytYYU9PZDlCZnFSdlVPY3Rz?=
 =?utf-8?B?WWZHLzMvWEZYTkp5dGF1UzR2dFJ4UTZjNHhDUnV1WUE5NFZsaWNDeElkUFda?=
 =?utf-8?B?OTRERkUzRE1HTHp1TURhSHdORjIvY3gwNXBpYUoyRW90OVpYb2x1Tkk1MjlY?=
 =?utf-8?B?Vy9scyt1ZDVGL3dWZWcxS0VNek4xYzZFcGNYSmdqRlgzd04wYkRGcWRjTTNM?=
 =?utf-8?B?U2F2NU5SWkgvQkFhdHV4QUN4b09CSmdLdXFubGg3NHBGUWdta0xadGVKczA1?=
 =?utf-8?B?N3NFRVJRMFVwK0NrYjRKUkVlNlh3cEtPZlBPZ0wyZ0JHdUdqK3BlS1RXVEFW?=
 =?utf-8?B?SlgxM28rTjljMTM0NDg0VEFaUVFjT0dRb2NBM0IyZXk4QitsU3hnWXpmQmto?=
 =?utf-8?B?TlJnVkdVaUtpb0tFOVhEc1I3eldWOGY3NDYzNmozRm9pOUk5a2ZRSngwa1BF?=
 =?utf-8?B?NnNENlpYN0RMY0ZoS2RUbHYyMnQvRkdnN05NUGQ1NWlwYzlwZTFaZW9Gcml6?=
 =?utf-8?B?dEo2enJXdXBVNjcvaW9seUhOSkdUNUJncTZOK0lCdGNRUkdqQWkybXNBcUE0?=
 =?utf-8?B?c2dvSlNxcElpT2ZoV0YwckxoWUd1K3NJeHZ6dENOckhpbTRwY2hrM2MvRVpF?=
 =?utf-8?B?TmJUbW1LK3F5cWpad0psb2hiV2d3SXQ0YzNIN01ESVowVW1YZTBVc091WkVU?=
 =?utf-8?B?OXF2T3BLRmFNWnNFQlJKMkR1ZnNnSzd4SjFZWWJ1eEhXRTE2K0tmbEFTMWMz?=
 =?utf-8?B?d1lqOGdkYU0vVEJKanVNZDFHTVd1M3VNaDZwcEdQUGNva25kUUxKVThhTkla?=
 =?utf-8?B?S2o2OTdVWndzOVNJRVdBaWhSclhqTVAyQURtcHBKVHI4Y3ZOM3pKbUEyd3Vz?=
 =?utf-8?B?aUhUajVTd3JhSWQxTndIWm9ZZkFiR0pTNm0yY0JRTjd5WkNNLzdYaU5MQVRN?=
 =?utf-8?B?ekhrR1ZVV2JrNjA5bnFYQnRiMEhRbmd5TGVKdUl5TlhscXI0OXRFWTlDajg5?=
 =?utf-8?B?QkQzckJrWlNlRXQ3QTcyeDNnbDhjSHFINXlUM0xWQkszV0NCdGN3aTZNemp3?=
 =?utf-8?B?T1VVaXdmdHRyKzAxMWg0YzJ4ZHlQQVFFYjRHd05hMjlGekNTZVB0Y3YrUFBZ?=
 =?utf-8?B?L3hXK1M5ek5Rd0xyTDBOcUtxSytmT2NRcVRKSnM2TVlyNnZuUFFob2JESDU5?=
 =?utf-8?B?NVNGTFpLNmJ4aGVkK1BSaHV4c3I0MXNqUGhRSXFCSE4zS2FoQnU2NUNTdHBB?=
 =?utf-8?B?YTlRUkw5ZnVPbTY4TG12Vnp0NmEwQ0IvRXZ6RnNnY1dGaUZpRlBlaFVsSkdD?=
 =?utf-8?B?YW9xOEVpOUpxaVg4WUJWWGthaW9zSFV2SWYyVnBKVnJ4azR4NlpLZ3cwcVV1?=
 =?utf-8?B?dEg4eXNNQk54dDdESlBUK3RQRkF2Qk1kdzRodTRlc21vb0VKK01aWHJZTldD?=
 =?utf-8?B?Vnd2ZHpIV2J0bk1zSTdrdXBxL1hTVEcrMW9LNjlLREhhM2ltcXdkNHdlNzMy?=
 =?utf-8?B?RmxHTno0OVR4Nm1GQTRSZVEvU0tiMVp1cW10djd0ZlgyYjN6UTVqemxtcmhY?=
 =?utf-8?B?cWVMTHErelNrUGl3ZnFlQ3JPSmk3MEhLNFEzTjNZSkV5V3dFZXBBVFRTNDIw?=
 =?utf-8?B?WVdXVkJLa3lPZzZFOGJjK3h5N3dxMzA5d1NIRmVRblB3clUvRVFEL2VHN1Qw?=
 =?utf-8?B?Ymx5RGE5RFRjK29ESGJCRk9uamZ3MTc3K282VWdMc05VbksrZERkMVVhbGtq?=
 =?utf-8?B?UlJuOG5pVHVxRVBtdVc3eThjUXdNS05yWnZBaENUTU1Ca0lVakFUL2J1OUpn?=
 =?utf-8?B?V2lmODc2ZUNPeEVFR3hHY2hybXdrQ2pjVUVkQ281a29FbnVWcVNtSFY1Rkhn?=
 =?utf-8?B?L3ZIbFJ6ZlZseEZWOWQvQ1Rka0tjalBWODU2ZE9jNFM3WUVzS08xNHJsRHph?=
 =?utf-8?B?ZmlnUkNvalIwRFVqWW03QU5JOW1XWDZxZjRPVDhGZ2lBeEVpVDdyaFRtaGFY?=
 =?utf-8?B?RjBVTzg3WTF1YSt1WU51NXpYOU05Z3Z6ejI3akVSTW01a2J4akpDMU9RR29P?=
 =?utf-8?B?Sm1jWG9qekcvTjlGVWJjYlAzM2l5WCtaS2ZHdmI3TkhSUXhpZ3J6TjNnUUhn?=
 =?utf-8?Q?OMD6w1Ex9tTt8qmfxOMBnWA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73bd6b34-1f60-4ee9-14bb-08dc6e0b9fcd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 20:32:18.6216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y5u+o+SKKRFN2otku3Ks85hMGgGFYWZtSGyJ0qci59s0T9f1k5tYJQG+R3yihkNHtRDgNDea/gCbf17QPfmB6D5pMfNUPlk6SBHx0dcqCfc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4847
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

On Mon, May 06, 2024 at 01:28:33PM -0700, Umesh Nerlige Ramappa wrote:
>On Fri, May 03, 2024 at 11:46:32PM -0700, Lucas De Marchi wrote:
>>When parsing memory region, allow any number of spaces between value and
>>unit by using ignore_space() and adjusting constness of the variables.
>>
>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>---
>>lib/igt_drm_fdinfo.c | 7 ++++---
>>1 file changed, 4 insertions(+), 3 deletions(-)
>>
>>diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
>>index b3f6fc35a..3b2778eee 100644
>>--- a/lib/igt_drm_fdinfo.c
>>+++ b/lib/igt_drm_fdinfo.c
>>@@ -134,7 +134,8 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
>>			const char **region_map, unsigned int region_entries,
>>			uint64_t *val)
>>{
>>-	char *name, *p, *unit = NULL;
>>+	const char *name, *p, *unit = NULL;
>>+	char *end_ptr;
>>	ssize_t name_len;
>>	int found = -1;
>>	unsigned int i;
>>@@ -180,9 +181,9 @@ static int parse_region(char *line, struct drm_client_fdinfo *info,
>>		goto out;
>>
>>	p++;
>>-	*val = strtoull(p, &p, 10);
>>+	*val = strtoull(p, &end_ptr, 10);
>>
>>-	p = index(p, ' ');
>>+	p = ignore_space(end_ptr);
>>	if (!p)
>>		goto out;
>
>I think the next line of code here is
>
>	unit = ++p;
>
>but p should already be pointing to the unit after ignoring the spaces.

Looks like this is fixed in the next patch. Not sure why the next patch 
is a fixup!.

Maybe squash the patches into one and then this is 

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

>
>Regards,
>Umesh
>>
>>-- 
>>2.43.0
>>
