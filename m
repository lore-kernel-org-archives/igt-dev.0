Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94E75E77171
	for <igt-dev@archiver.kernel.org>; Thu,  5 Dec 2024 09:06:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B0F510EE01;
	Thu,  5 Dec 2024 09:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XU1GfpfH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5DA10EE01
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Dec 2024 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733389595; x=1764925595;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=RVqb2JmGk9NAtvasfwpaewu0XtQm9+qVbMsk00J81oU=;
 b=XU1GfpfHJ8S/qwzergVrSqomKXm9X0M5U1QpaZbJJUGILQTrJzfGn7vB
 a50DnZc39QWMpaHT7w0RT20kJfdd2KizL2MPUXbwcP4zmrdUnTNCh+hm4
 v5bzFOL9A+EF4MK9vFveNEp6F3wkmbZdbZuw302tQXsskV7NU0ln6SfUY
 dmF0j220MlQof1DSu3JR4Sd3vgaS/2bIyWfp30Q1zehLfL/wQfyL6c8OO
 WsPJy1pv+PsXWjbvSkLWgg/16jYHHVuvIhQV39wXkUhoAiFv9Q0t5LYqt
 nYZ46RmRWQ+Ag9EaMH5nSn4oedJvQ/jfYyFIltndn/OIt6PyUNPSqKzD8 w==;
X-CSE-ConnectionGUID: NCcx2bE6Qga/0+BHsO4qeA==
X-CSE-MsgGUID: qhVoa/1YRgutur/3uj4b1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="33572043"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="33572043"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 01:06:34 -0800
X-CSE-ConnectionGUID: qYnf51+iQV6hqaRIwqA+Fg==
X-CSE-MsgGUID: N7AfCccbT/+omTVRYaeKQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; d="scan'208";a="94383238"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 01:06:34 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 01:06:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 01:06:33 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 01:06:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgffzmK3PaYk8EXHAx2Zhhl1b2h8vOQXQuWaim/V5cj43pjX7YVZi7QdYTFtfPG69UYLXrmyfg67W1cvMPSGZwioHDkh0SbGTd46UFuupx1Pn7h6NF/hXb6OSqSJXbK2IBaVeTvzYLnwddGeHnFB2Ob9kFgZgzorcrdfphmOjrJ0ytIi0112+iDPSoBjnquekAeCPdm8vfXJWGv1TwsoOZ40kAtZjv7eykPquyI/lTh8jii2BzWDZT5ahS04BiYxg42WCxR1twc+D6MvMeSLj7cK9PdTD2eGWHq08kO5QUbKKdDBnVDgm3jxygeY7di7+Ynec/gnhWuSa0+XNGRRug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+GCHuoOFbmkvhbmzDHJ3HJuTP8bfkV6PSIrh79J15Sg=;
 b=d3PYV4sTTnOUj1GXxaAZmOfVKV4RQCp0rHzyOVJNdl/vS3PIOmIx9xYwnHVjTwRtd0LgZuasySkjofd/Px4sAcXfiSEu8ytgc9iP4xS/Gcv4BWkldvkGhh9Jk5YcYjAyXIhxZIir04rXq6DHDCct40/KjNgKb9iKzNXx61I12BTTijK+mub+JmYtlv66ZNudfEIGom/gmahtVSlyFi9xJ+NjjrxJhKOjv6JZc2YBc6uajKnvy8tvG1X50YlX9FBj2xttwqiuAjb+w5WHQKRXrMDIjioDKuDupWMaqETdZTY12pnQ7lXqqzbrELBXX9u4yg4bUM7Swcwq8YpnrbJmZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 09:06:29 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%7]) with mapi id 15.20.8207.017; Thu, 5 Dec 2024
 09:06:29 +0000
Message-ID: <7fc4b2d5-80b1-47ed-a3f1-5d4285758903@intel.com>
Date: Thu, 5 Dec 2024 14:36:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 1/2] tests/intel/dsc: Convert debug msg to info msg
To: "Samala, Pranay" <pranay.samala@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
References: <20241202085127.1785594-1-swati2.sharma@intel.com>
 <PH7PR11MB60538096EC53283FA21CC752E7352@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <PH7PR11MB60538096EC53283FA21CC752E7352@PH7PR11MB6053.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0249.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:21a::9) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|BL3PR11MB6362:EE_
X-MS-Office365-Filtering-Correlation-Id: 25a9906c-2d89-4769-0ccc-08dd150c1ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djBOd1lXOFFUQjNybHNpdjROLzFLY1VsQTZoWE9PT3pJOVUrRHpEZEp1RmIy?=
 =?utf-8?B?NzFHdm1DUWRTWjcwY2dTMkV6dFVpVmJXbUVYUmVQQ3Bud1cwcHd2V3ZaLzBw?=
 =?utf-8?B?M0JLNk5kYU5TdmxLRDhRQjJBQ2ZCMDlKVmxxR2xIcTRFTUFDS2VEWW9rS3pI?=
 =?utf-8?B?ejZHRjM5NitHMVF1RmdCQndlVWNsc1BFZVhVeXJqQ2FBa09xZ1ptQkNSeldp?=
 =?utf-8?B?bW55OHZGZHN6VHFUVkxlaXJsNnVvYUU5REJnbWlzWWU1cVk1dzBpbzNjMmg1?=
 =?utf-8?B?d1JZSUpJL2dWcnJ2eUhFb0xpNHFpckNOQU1SRXpiVDUvT0ZzN3FtcXcvMUsz?=
 =?utf-8?B?Q01LZ3hYZjhETXdpZ2hMRzFJNHEzVEg1Nk1oUDl2YWc1UDJSZDBFcmNWVEND?=
 =?utf-8?B?K0pWOU1jMlhoeG1LSjdhUndEeDVrR3Z5b0xoNDNhNmhqNnNZZlFVRjZWcHVO?=
 =?utf-8?B?YXc5SFhFcnNWa2N0TEVyRktHT21UYXZBKzVYRDErNnVGOGNzNlViMGduU25w?=
 =?utf-8?B?R2tIR0lNSXVGU21kODJZTTB5TWpqLzg1a09WMHJsTmpLUVVaNkdjU1huUmRL?=
 =?utf-8?B?NTJGVHUrbEViUE44czVIbEQySGFNMmJBYWZTWDJxdDJKNHAvNldIeUo5eDIx?=
 =?utf-8?B?WVNDODFPNlBTQkVhVDA0L1JMb2ZMZXN4RlBua2xGbklLb3pPcXFySFVvbUpu?=
 =?utf-8?B?WEJ5d1NHZ1Q2K01JUDRva2ZuUkZ4aUtGTXlZMXZxeHJTTmJNQXl4NjZldHZm?=
 =?utf-8?B?dEI2TTVsSzNyRlZYbkdLZVRrd3F5Sm1xVTdTRkNUMEFReWNiQXhLV2l6NTN4?=
 =?utf-8?B?Y29FWjd1dzZMcldVVHJpeHV4QVI1NVM0N05zNXF2UThXRkZMczlYUHZxL2g0?=
 =?utf-8?B?dzZTb0pDNjdwNEJveHZoM0I1RURYQUVTbVRyTUdjSE5aTVRFWnN3elIxTEtt?=
 =?utf-8?B?enlHUWtQQXdtWVExRVBHY2Y1TmxWZU5RY2ZHdHJqa216aVRDZW8wOFV3T1pT?=
 =?utf-8?B?bFpsQ0hJVzJXTFlnMFBTN3lqcXdSVEdrZC9RNllwMGhpSVNVWGhGN3MwTTFi?=
 =?utf-8?B?VGZkSjU3ZmdrcEJMY0dvRE1qTjBjcWQvUXZucW1CRFNzSHV4ZTdIY0dqUTN0?=
 =?utf-8?B?VEwySUJPZngzdUJUWU9nWVNxclpRcnpoV2NrRHg0SWxoV00yK0E3Z2cyeXU2?=
 =?utf-8?B?S1VSZ2owMUxlMGVUd2MrbEVzcElFaDdVNGVUd2VTVllTQ1F2dHBNaEtKVThp?=
 =?utf-8?B?ZEhWenRxSlhCckJBUTlpaFlNbXRYUS9lRWZPVGlrTTdOREJjcWxpVTR0NTBW?=
 =?utf-8?B?c3RxYk05MERONVlKRGFacXkwMldHZDZzTjVtOEtuUXN3a05YL2RiQnkyd2dy?=
 =?utf-8?B?Yk8zbnVPbWZtbmhIOHhVOFAvZXlaNWk4M0hUTFVxdi9kRXo5Z3owVTFQR2Zj?=
 =?utf-8?B?WXdtK1Z2aldjMUoyT2FOQ1M2bFFRRzIzS2xGL2diL3NkZ0FHVDg4anRqaTFw?=
 =?utf-8?B?YnR3Zm9BQkhzdUdCYVFWcWlrdkZPOWliUVg0dzlCMlZvY0hodlBQMkxwWkY1?=
 =?utf-8?B?YXdpYWhjN01oelBCbXlIemIxMU90Kytibkw2RG9GUjNWMDFLMmxsLytzTVJL?=
 =?utf-8?B?dzh4UlJ0RkRheDlFbFpVTTBGclZJcnBwcWtTcVVKMmV0R1grU3NPc3Z4SG90?=
 =?utf-8?B?Mk5CbEFXK0hiVFBObmxWQXA4bUltdW9Ma0ZKd3VZeEhBM3pwZGdGL09sVTZG?=
 =?utf-8?B?b3VFbktuWTBIdGtkSVpTc3hrQ0F1dXBveVdnOW5tQzZ5ZEFvb2RuczVsaTFI?=
 =?utf-8?B?UTBnWWZ5bW5tOWEvZjRpQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1g1QkE2VldlMFhVT0VLcGx0KzFZVUlxbHR5VC9td2p1UjcwSWdOYmNXNTJQ?=
 =?utf-8?B?cllCZEpoMEN1UFgxTGYxeE1vRHgyVmRhV2JqdUx1bmV3UzlraE1KMnMzREQ5?=
 =?utf-8?B?bzhRVEtDOU14NE8rRzYyWlJpV1Y1NzFscjNqbGovWUhmNXVaQUJRWmg5SHdB?=
 =?utf-8?B?aTdENGpjK1BiUjQ5aDVXQ3pkWk9Jd2dRc3VlRC8xakVha2dCQ1N3UUJhTnFr?=
 =?utf-8?B?NHBka0kyN3RuTkg1eHdjcEJITE50TzlaY0UzdjVsOWRHUGRlQU5QNEkvRWNt?=
 =?utf-8?B?Ym1acGMwaE9IcWlOazArOExxL0twKzdTeGZJVjR5aGNVTlJCUkFEbTdTWnVM?=
 =?utf-8?B?ckUxKzRYK2loVmZtN0o2b3ljWlpwQmJlWlJJM0ptRmRjZHNpRGNjMjhNQWtl?=
 =?utf-8?B?RXl1YTJuWDdlTFIya1AwS0ZuY0hWMGFUK0kydUV0cCs1U0Ura3RnYnVZUXhr?=
 =?utf-8?B?c3I0WHpra04zaXZvMFVOczZrbEs3RlBYTVl6TDRyRmw5S0cxalhzc1NYa1hW?=
 =?utf-8?B?SXJZV0dockZrOGNqTFo5aVFuQmpNcXZ3eWNLYWZESG01emE3K3RKTUVlTC9P?=
 =?utf-8?B?cDBIeE42aWxyaThXeTByZ0ZkT081TStDVlRwRmxHaGIwSkw2c0xYL1p3QkNq?=
 =?utf-8?B?ZTZKYTM1TTY5U1VwRmVuVXFkLzlWRENoMGJPOWpaOS9ycmFWQUN0Z3I1c0I3?=
 =?utf-8?B?ZlgxMG9ObXJTMEszN3I1WkJvZEprOGZqVUJKenZ1UmQvd1lIU0VHQTJjOWhI?=
 =?utf-8?B?S1hqbTU5M0JKa2NtWkZSSGQ1aFZobzd0aDBGYXJDajlkWWs4OHc4MFlYYTdo?=
 =?utf-8?B?dG1XN09hZW45WXQ2TVd4YXZZckNaUk4vVEw0MnBjZnZzOTF3eWo4SjBJeDFI?=
 =?utf-8?B?c3FnK3dCSDhSaTFnU1gvSEhXS2tzbFArdHBEZGVZUStLdUJ6LzR5cEh5TEEw?=
 =?utf-8?B?WjNqRld0cVFFZDBLbS9FdEFRa2RoUWJYN2lZaDlYaUJTcXhuY1Mzdjc4UEU1?=
 =?utf-8?B?ck1IU25ka0JPKzlyQ0NnWWVUWUdpaC9UdUluTlNEcUQ3U3FidXNwZXNGdnl1?=
 =?utf-8?B?V2JRdmk0UWhzdFdwTXVzSkxpUDhyeG4yaXRiTk9IdE82NWpLTzllajZXWUUw?=
 =?utf-8?B?eTBhcmNqVlNjU0I1bE9nZVZJbjFHb2lCenFRRW1sV1JmQmd3cXEzU0QvNzR5?=
 =?utf-8?B?TllWQzI0ZCtYaDRSQllUZXF5QnZKQ1pWdDhPdWRNdmNhK3VBeTBaUCswMkRS?=
 =?utf-8?B?UVpTOStCZElhblBiOThuVDdIdDJoU1lNNkRmOTNHOEw0TzRuNG04cVI1Nkgz?=
 =?utf-8?B?c3g3NmxvSjc1eHhOUmM2SlJuV09jemRBR1Y4K0dBT1hDeTdiL1phUjArWWFO?=
 =?utf-8?B?YkMrbmJrdUNiUVJvM3BoY3UraGhwWWk5TUZVNHY3SXZaVVZsM2NzVWVXajZP?=
 =?utf-8?B?VERKZnMwaklMbzlPNzE5NEw4OFRuNFR0RWRXNm5ZcStUMXlteWJSenB6ZzlN?=
 =?utf-8?B?S2x0OStCZWQ4cENxRGxJVWRDRmFqYmxOUlpPQ0J4WDlUTXN0SUFMaHZodjRz?=
 =?utf-8?B?NzlhMzlENzZUbjlDbkNPdGVLWGVnY3JyTlN3RHFOc1RZZUVnSWpLdjFNaTNu?=
 =?utf-8?B?dzZ0a0R6NWthSGJmL2EvOXZsZlZzUmJBWHBOUjgyOFVydEU5TUhYdHZoS2dO?=
 =?utf-8?B?SG1GWGVKWWJBNC9aT0lSMzJzL1NHNGl4cVJXdHQrdTNCSG1iSjE3ZzU4ZkJT?=
 =?utf-8?B?ZXpXVEQwVjVLYkl1Z2RuaFdubVF6eWVNK0RNM2VVcThPYWpiUWd4a0o0TTBO?=
 =?utf-8?B?MFB2czNEYW5DYUZ1bHZhMVBHVk4yQS8wZ3l1eXNxR1R4YW5sNFk4akluemN6?=
 =?utf-8?B?aVl4aDFieDJ5L1lSUG5mNEx3OXNRVjYrWTdHUHg1em9TaHgwOTVsNHgwS2JT?=
 =?utf-8?B?RE5vZWFwVUlqN2tSR2lxT2t2U1Btc3Rvdk1GTGtINXVYcXg2MUkxMEU1SXdD?=
 =?utf-8?B?dUNrOUpnaDlPZVFNUlFKVy9DaHVqbGEwTWdkVDV4ZmZjRzUxd3E0T2dZcDNj?=
 =?utf-8?B?aklhWkNoQWdRdFZiWSt4VjZKSWtyOEp2Q1FxYytyeEgzdEtETDF6eDFNL3pE?=
 =?utf-8?B?Q253MWpOQXQ0Smd1WDF5VDVYLy81eTdrUUgrT1NZVTZUL2xscFMxTGJrMUgy?=
 =?utf-8?B?QkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25a9906c-2d89-4769-0ccc-08dd150c1ab8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 09:06:29.1344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8LEpOtLnzfpjwYBZvVtFMSjF4F3y2+r+rXq6aAcidGiUhYhg8gFUxeoQQdw9gpJYSu+/laIeOZ7y9B/6H6Ya2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6362
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

On 02-12-2024 04:48 pm, Samala, Pranay wrote:
>> -----Original Message-----
>> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Swati
>> Sharma
>> Sent: Monday, December 2, 2024 2:21 PM
>> To: igt-dev@lists.freedesktop.org
>> Cc: Sharma, Swati2 <swati2.sharma@intel.com>
>> Subject: [PATCH i-g-t 1/2] tests/intel/dsc: Convert debug msg to info msg
>>
>> Convert `igt_debug` to `igt_info` to provide more context when skipping outputs
>> that doesn't fulfil dsc constraints.
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/intel/kms_dsc_helper.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/tests/intel/kms_dsc_helper.c b/tests/intel/kms_dsc_helper.c index
>> 0de09b8e9..cea4304e4 100644
>> --- a/tests/intel/kms_dsc_helper.c
>> +++ b/tests/intel/kms_dsc_helper.c
>> @@ -69,14 +69,14 @@ bool is_dsc_supported_by_source(int drmfd)  bool
>> is_dsc_supported_by_sink(int drmfd, igt_output_t *output)  {
>>   	if (!igt_is_dsc_supported_by_sink(drmfd, output->name)) {
>> -		igt_debug("DSC not supported on connector %s\n",
>> +		igt_info("DSC not supported on connector %s\n",
>>   			  output->name);
> Alignment should match open parenthesis.

This has been before, didn't make any change. May be we can have cleanup 
patch later for fixing all alignments.

>>   		return false;
>>   	}
>>
>>   	if (!output_is_internal_panel(output) &&
>>   	    !igt_is_fec_supported(drmfd, output->name)) {
>> -		igt_debug("DSC cannot be enabled without FEC on %s\n",
>> +		igt_info("DSC cannot be enabled without FEC on %s\n",
>>   			  output->name);
> Same goes here.
>>   		return false;
>>   	}
>> @@ -91,7 +91,7 @@ bool check_gen11_dp_constraint(int drmfd, igt_output_t
>> *output, enum pipe pipe)
>>
>>   	if ((connector->connector_type ==
>> DRM_MODE_CONNECTOR_DisplayPort) &&
>>   	    (pipe == PIPE_A) && IS_GEN11(devid)) {
>> -		igt_debug("DSC not supported on pipe A on external DP in gen11
>> platforms\n");
>> +		igt_info("DSC not supported on pipe %s on %s in gen11
>> platforms\n",
>> +kmstest_pipe_name(pipe), output->name);
> line length is 123 columns, exceeding 100 columns.
>>   		return false;
>>   	}
>>
>> @@ -126,7 +126,7 @@ void force_dsc_output_format(int drmfd, igt_output_t
>> *output,  static bool is_dsc_output_format_supported_by_source(int disp_ver,
>> enum dsc_output_format output_format)  {
>>   	if (disp_ver < 14 && output_format == DSC_FORMAT_YCBCR420) {
>> -		igt_debug("Output format DSC YCBCR420 not supported on D13
>> and older platforms\n");
>> +		igt_info("Output format DSC YCBCR420 not supported on D13
>> and older
>> +platforms\n");
>>   		return false;
>>   	}
>>
>> @@ -140,7 +140,7 @@ bool is_dsc_output_format_supported(int drmfd, int
>> disp_ver, igt_output_t *outpu
>>   		return false;
>>
>>   	if (!igt_is_dsc_output_format_supported_by_sink(drmfd, output->name,
>> output_format)) {
>> -		igt_debug("DSC %s output format not supported on connector
>> %s\n",
>> +		igt_info("DSC %s output format not supported on connector
>> %s\n",
>>   			  kmstest_dsc_output_format_str(output_format),
> Alignment should match open parenthesis.
>
> Regards,
> Pranay Samala
>> output->name);
>>   		return false;
>>   	}
>> @@ -182,7 +182,7 @@ void restore_force_dsc_fractional_bpp_en(void)
>>   static bool is_dsc_fractional_bpp_supported_by_source(int disp_ver)  {
>>   	if (disp_ver < 14) {
>> -		igt_debug("DSC fractional bpp not supported on D13 and older
>> platforms\n");
>> +		igt_info("DSC fractional bpp not supported on D13 and older
>> +platforms\n");
>>   		return false;
>>   	}
>>
>> @@ -195,7 +195,7 @@ bool is_dsc_fractional_bpp_supported(int disp_ver, int
>> drmfd, igt_output_t *outp
>>   		return false;
>>
>>   	if (!igt_is_dsc_fractional_bpp_supported_by_sink(drmfd, output->name))
>> {
>> -		igt_debug("DSC fractional bpp not supported on connector
>> %s\n", output->name);
>> +		igt_info("DSC fractional bpp not supported on connector %s\n",
>> +output->name);
>>   		return false;
>>   	}
>>
>> --
>> 2.25.1
