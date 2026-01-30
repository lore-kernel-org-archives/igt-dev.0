Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DF18D49C71
	for <igt-dev@archiver.kernel.org>; Fri, 30 Jan 2026 08:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E11010E17E;
	Fri, 30 Jan 2026 08:20:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fhdtFsKV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F8010E17E
 for <igt-dev@lists.freedesktop.org>; Fri, 30 Jan 2026 08:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769761213; x=1801297213;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=j5YcmejvSe0VDXfvPRvHJayv/gZmCbze+yu4hYdRJio=;
 b=fhdtFsKV4CzlCp7QdjG8Zcz8usUxjQNIB2NK6MU0rmIOeNaWWht4rmhk
 ypQ9eIF3C89kDeugzvDN6GqNZAonYnY+0lm6+5kueRhJsQ8tPbCymVzzh
 h/eU6rFoMAvITtmRZi/kUNrUVgZsg+mvcb751RDd52b3WZS+0BhTseyej
 LvcANdfTAZ05zQb4WZ5RFPgW6UFGEs+N1zxHBjn77dz8jdTJ8TBFQncfD
 y5hUTqyb9CM9TM1dXjTl6hrsrH2qRuYeFaXqdIfK6Q7AoT+fkfW+kZ7e2
 I2QtQ4Sa29tnCin6kptG7J6pM2h80JachwIxGXTLXC/Y5DIl3q9/F3a/4 Q==;
X-CSE-ConnectionGUID: 1wYoSxIMRN6ytZa6Np82tw==
X-CSE-MsgGUID: SqFjwHJhSWmpy+Wdiy8KrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="74635605"
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; d="scan'208,217";a="74635605"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:20:12 -0800
X-CSE-ConnectionGUID: mur1588vSF2Wrk0MT5QwNg==
X-CSE-MsgGUID: 3ZY+4DlhRC2tjRsjFgEkng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,262,1763452800"; 
 d="scan'208,217";a="208907823"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 00:20:12 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:20:11 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 00:20:11 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.35) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 00:20:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GxxhFe91Ga7C2YcZE83PlvIknHDuFvEMNITcuR5EQW2oH34DDoY/bvQzAxL6MOrTPHvUak/jrzHQ6oFSnVASV/PCDH0B0TDhvEbQo8VFRhy2hy0jfCi5AlliCbrwBO1SxD7VSg/rXFuWEbbfRV+CtSc7GCGfd3/U741GPDfUSi5QG37dmn4GJr1qJtXUOUZlGkH7Tzogz++coIiZkLjAuiygG8vrFU11LQKBJCfnYOUbkIubBLCHHx3KorlLc12PLEqJh90Dm+Or4WTSqd3QnfJDwljES1X51LsaOWGXt1PtpPHhzPJHGVhVTK/wfxX1Unvoq5uxlyc1ipu2XI3wzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEeEbyYDnfZWJOPcH7TB+c7Tc2vIbLFkZoUgCTQASso=;
 b=fdOuiHGJ5nUZhnj5rXTl+ekj1Q1wpozmY50hHrIarSfdlDd0vXsho/+7q1bRUj1bebrMA8A/yp6UhY+kbRKanELNTszuHbZcp2FxIAIa5BrKJB7dvzsxQBd6BwTuuQ0J4dYqb24d+IXlgZUSUXF9AO8l0OtYGLHLuiTdo7pvSPzravSb4QEEV+O+ty++A9JzLuYA8GfdNZ9LWD6RHsdyN6SLw5s22+masuqGDmA6oGEhVFyJ/SfOhaupuomoKkAak9ajwCrHGMl/hq/X0HYBcaVHT+YyZ/bWKwj8OCFTYeEkZq2nBDH4GK6qGez6ABP7z3oDkyDHjOaaAUWHXb25ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by SA1PR11MB6783.namprd11.prod.outlook.com (2603:10b6:806:25f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 08:20:05 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9564.006; Fri, 30 Jan 2026
 08:20:04 +0000
Content-Type: multipart/alternative;
 boundary="------------iShqpqsXU0Oy2RpWHYNf1oiT"
Message-ID: <3d1fc545-237b-428c-978c-a3668ff0929f@intel.com>
Date: Fri, 30 Jan 2026 13:49:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v2] tests/intel/hwmon: Check temperature limit in
 hwmon-read
To: "Poosa, Karthik" <karthik.poosa@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <riana.tauro@intel.com>, <raag.jadav@intel.com>
References: <20260123183556.1649959-1-karthik.poosa@intel.com>
 <ca032654-19e4-4f22-a775-b0906aa852f8@intel.com>
 <9073233a-42bb-418b-bbc8-766619d5fdb0@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <9073233a-42bb-418b-bbc8-766619d5fdb0@intel.com>
X-ClientProxiedBy: MA5PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d6::6) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|SA1PR11MB6783:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e23efc8-e339-4566-77ca-08de5fd85ec7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MGExd2pzU0tEQ3hwN3A1WFo2MWdzb2tEYmJNNEtjSCs4YVBhalo1ckZ2eVNh?=
 =?utf-8?B?REZNYTV0VmlpUkNpc25SakpDQURXK0hNR1dUc0NtWGdjT0REd1hCSG92ZXR5?=
 =?utf-8?B?cDExUU1Fc25ZNUlva2IwUk1mbjE5V2crem4weCtBZjBWTWZhaGhSQUxmVWNq?=
 =?utf-8?B?T0wyQnRUZHc0WlJjRm1IaEZvei9sYUoxOFdUVnJlWHgvbHNpVzBweDlIc2Z6?=
 =?utf-8?B?UVNSTXppbTFuenVDd3paS2M1ODJrL0VUbWpYUTRIUUI3bFB6UkI3YmFuWkpp?=
 =?utf-8?B?QUE2RVRlcFh0TW41QzBkYzNvdTFVd3luK0FLL1VoSVAzcWJyajlkYzZHbjdt?=
 =?utf-8?B?TFRTS09ENlFFTk00Z0dtYXBYdjBzblRmS3d0NVJiS1prNk1XSFlYalJsdHVx?=
 =?utf-8?B?eFpoYkNOMy9sdTNPeVBkbXdNL3VjU0M2dm1zeEgwYlV6aGxDSm9qN3ljK0FS?=
 =?utf-8?B?RGd3eTBoRGtoVUFYZHd5ZHJzdDdKWmQvYTFGSjVKK2NjenFMaUpwMjlRQXhD?=
 =?utf-8?B?NjVURnorWFpEL1Z2cGpFdlR5Q3FqQ2lmL3RRNXREbmF6SVpoaDlCMDBBUnRJ?=
 =?utf-8?B?Ymc3VEZMNlU5TEVOSlV0N3pyUkhBYVZkRkpXaktjczR1dW50U0tUclE1amRP?=
 =?utf-8?B?MUx6Y2E2ZkNwd01rOU5STk9LNkV0UXEzbW9aaEVYYjlDQkRZcXRRTWhIMEd0?=
 =?utf-8?B?enhsQ05DY2lLRWlwYzlOcXFTUjA2U09CZzh5TGFuaDFoNHFIajFtbmlUa1pE?=
 =?utf-8?B?ZVFEVVNXV00xbG5GRUdRK25lMmFiNUVodDBrUUwyOVlFb1NlK0Zwbi9pVkt2?=
 =?utf-8?B?VG4xZkJuRUxjcHJDcVlXYzZ6Y25xUEs4K1lTVWVxN0RWNWROdUF0MkUwSHV1?=
 =?utf-8?B?cEdFTHREQmVxbTBoUDdFa0V2NmRYRDFWOXBibHJpUXVHcHk1dGRTa1VONU8z?=
 =?utf-8?B?cmk0dDdxSlBQTkdhU0txRU9lRitnTklzbXdrL0c5Z0I4T25hOTgrejBuSEVz?=
 =?utf-8?B?MDVHbXdSUjQwL1RSV0hVd05tR09haHJrSllZdC9GMWJJZjZXaDFacUtCRWZl?=
 =?utf-8?B?WDVFVDJYM3Q2eXkvUjZnK3BnczVUYzl4Z2tlbERlQ24ycVBxVVV5c1ZMUUNh?=
 =?utf-8?B?SlhYWUJOYk9mL1RxSi9uMG1ZYll2b1dPdkVDd1U2NzcxZXVoR3ZaZnRxMklL?=
 =?utf-8?B?QVNhN0ZuenphQ1l0Sk93U0FDbWN0Zkg5R0ZuenhydVQvSEViVE81cER4bEJn?=
 =?utf-8?B?M0JuL0hQTG1KQUxHcjUrOUZxbnkwcUNGUDRxZzVKK1huOVEwUGhBay9XNmhT?=
 =?utf-8?B?VVpXSGxYa1VBbGZ0QVo1RXBsRkRVb3JycjNlTlNKNnlyNmRhR2VjTnlyeHBM?=
 =?utf-8?B?dkdheXJCaDI1MHBiKytQSnNNaTduUENFUDVFdmNnenM1aE5iS3RhYm9TSy9P?=
 =?utf-8?B?dFpJWXVhTE9YeDFGMXU0ZzJiY3F5SVNZaTVsVXVadXdyak9ISnF6dWlCdThS?=
 =?utf-8?B?U2NYeGlhM0VpcHJKOXBiMzdsUC9OMTJ0MGFBZGYzaHduMmdrWHVsUlZXM0JJ?=
 =?utf-8?B?MVBKS1cybjZkUHlGaGVzQTZGRUlSK01Ld1FVME9tdlB0RzlXMTlzNFQ4UjZo?=
 =?utf-8?B?LzZwOGZoMXdqMSs0WlVWRWJ0c2VpVmQyZjgvLzl1OHZBRDNuRlpub1pvbnR1?=
 =?utf-8?B?RjVmRVBqTnRncERVZE1DUko1SnFZNzRPNFkrNXE3b0ZCdUdKM1cyeWdSQzky?=
 =?utf-8?B?RkN3b0cvL0cyWHZTYnJGK2tleE9Pbitzdm5QbHNPT0tDY2tpQXNZWkxVUjIy?=
 =?utf-8?B?c0U5VFdiRVNrYVhJN0xGOVM3MWFIL0hxQU5Ka2ptN0k1ZUtwelpiSHZqYmdx?=
 =?utf-8?B?eVFabVQrMWpDeDA1SXZibkc3NzVKZnlHNEt6aDZydXByNFcyeXAxVzhNOHJN?=
 =?utf-8?B?QmNRSW5QNHdRdDNaYjBNZVEzWTBQeHNlNnhFVFFtS1g3RUthNUpYek9kRU9h?=
 =?utf-8?B?ZElrUkIwcitSUXhqMmk0K1NKei9hWGxMa3phQmkrbXJseHhKV29FY2ZCYzI4?=
 =?utf-8?B?L04zNk1Pa2NETUVZQnVSb3dTM3BoMXA4YTZjNVhYYkZIVXIzN1MwYURYb1RT?=
 =?utf-8?Q?ZBLM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZUx6c1dBSzNQU252dUhzMFBQVmRGT2JvUEQvaWNGYk0rWDBuTk5kNGNVM2Jj?=
 =?utf-8?B?am92NUN2Um1pZmc4QTVST1JSdWtQRzVnR1J0b1N1ckF3dTlpY05BOHBmMHlZ?=
 =?utf-8?B?Um9JVnRUYzZsV2V3TzI2QWtSQTJxclBickNya1oxZ1k0RHpGU0s2Ym5qS3Ar?=
 =?utf-8?B?d2FqMGtwNENFeUtxZXFDOHdjZVNRdXpqSmxORVVjMDgyTlREbHZGRE4zbjhJ?=
 =?utf-8?B?ZjZvaWMvekpDYlRFWHdQQ09FSlkxY09malc4bVZ1bU5CcldNMU9oOE1TR3dv?=
 =?utf-8?B?cTZlNkhpVUV6RVdnN2JKUU0zdmJTOGpBN0RxUXE1clAxZDZqU1d3WFNDTHdY?=
 =?utf-8?B?NVhIeTA0TW1pUFNVdkd0anpKZ2FsV3hDYWpjS3VmaXFKMlc2c29SbEp1S09U?=
 =?utf-8?B?aCt4Zk1TSHBkeElTeGVLb1ptRUdiN3BpSkZYNEwzN2xxblRvUUN2Vkl4WHVp?=
 =?utf-8?B?TGtNcTJTa0JZbkJ0bGdNQ0xXcmlxOHZKczdvZDZ5aG5JMVBzRjVNRkFTajVm?=
 =?utf-8?B?am13RVY5S3F4ZUwyYU4yTktNSHN5Tyt6cFgzMjBka2piVW5EcHlNaFFEZXlF?=
 =?utf-8?B?eHltbzZEVm9FaXFhZ3Q4Zk16S1dCTWpUM0hVZkxMNmdFRWlDOHNNV1hGcHlo?=
 =?utf-8?B?dktSVG00TWJWS3RoeHZ4K2NQcUdZdkZYS2NmUzNQZWU2VFJpR0t5RkFmSEhx?=
 =?utf-8?B?NHNkTjQ4dDE3aUNWNEJ6Y3c4d1AwYUYycStFeGNIaHl2QVMzYjVSSkVJMFhG?=
 =?utf-8?B?dDR1MmxyM0QrY0lzTm9LTGtzcmpadTlRQjV2OXo0dmQreTAzNjUvc01IRjdj?=
 =?utf-8?B?ZnNLMjVwd0Q2NDQxVWVYSld5U3NsQnkrWDBMUFZ2OGhMMWdkM204OU9GZ0Ns?=
 =?utf-8?B?Umh4UWpKeWxqQzU0Sk9MenNOVDIvYWtOWjc5RnBUcGdqMXFjTXMza1dQTmVZ?=
 =?utf-8?B?bU4zb3J3WWtyMy9EY2N5V0tGUnByWDUxZjlGdXJicjduSlkwL25KcnRYbHVn?=
 =?utf-8?B?MWdIRmlRczZOT1lKTWIveUxxOUdBNXZTR0JzMGtWZGtlYW8zcEJqZkhjM1No?=
 =?utf-8?B?TWhDdUE4UHdyek45YzE5OExxQlZzdWltcEJzUGZXWE1TL29ISkZUZE1BNElm?=
 =?utf-8?B?dTdGcFZwUjFnM2pNbUFvS3ZCdXpBaE1XaHFDbGpuL0h5WmVCcWJrakYwQlZ5?=
 =?utf-8?B?REhsZXE5WSt1VWx0cDBISElxc2RJSnJKSTI0aUhnSU5pcENYN0hHZGFwTEdo?=
 =?utf-8?B?aDJDUUNOU2JBL0ZuUm1YcUdSRE5mSWlWZjFISWpZc2pVam81cHFKdmJZc1pw?=
 =?utf-8?B?MC9GbGRVS29VaHdLV21pZEhQek0zWjl1Q2NxZnlxQ3RGRWJobk1HMEt0NElL?=
 =?utf-8?B?Vm5mYUV5REJURmtnVFlMOXZoZzdoTnl2ZGtqYm1VZjhEeHpwQnRsUmlhTTk4?=
 =?utf-8?B?SkF3ckhSVktBcXM5Vk5GTFR0K0YyT3NjdnN2cEJQRnBjekhDYS94aU1aSXF0?=
 =?utf-8?B?YlNrck0yZkVxajRDZG1MQ1B5V3l6OVFoTW5TSDZQY1Zzblh0TXVMQzFGZVc5?=
 =?utf-8?B?MFBJS2lPRHEwRXYxeFBYYkxBT1VSV2UzWjR2R3VJL3FXMXJQUDNIU2Y0Uyt0?=
 =?utf-8?B?MnptUHRlVDVLTkp4QUdsOHFmV1ozVnEzUE1pZ0FwVmlYazZVQXoxTFN2Vlo1?=
 =?utf-8?B?SnZHenkvalBkVWxhTzNnUjlVWGxEc3VvQ0lmbERxYm1nVytSN216dzZOb3NQ?=
 =?utf-8?B?NkIrVmg5bjNMRExEdjZSbmFkb1g2Si91RjV0MnJZMEhCSVJrL0NONDNXckVm?=
 =?utf-8?B?VFdjd1dCd2psbkhLeUhiY0J1S1U4OVlEWnRtLzMyQmRIZ25HMUQ5SjVZQ1lx?=
 =?utf-8?B?cDRtbldtZ3M3VU9YZEt3cEVxYjBScGZtcE0rZ2g5NjVabXV5K21CaEF6WjNx?=
 =?utf-8?B?aGdPWlQrdnorWm1uS1h6NTI4MUpWclJiVDRLSWVROTRMa2dDYmk0bVlGRG5C?=
 =?utf-8?B?MmFpemZualFmbkNJOTl5VHJ5ZC9SeFNwQUMyQ0ZkUmVERzNvNXVQM3pVOGFq?=
 =?utf-8?B?b2cwbDdIVE1iaDVKS0dRMk5HS1k3QkQ3UTFvWFRDQ1psVFF2a0JaZ2lwaUpW?=
 =?utf-8?B?WGNySUlSa0dZVUdoOEV0cndqMnQ4VEw5ZnN0dWQ5V1N6YmZVSzZQd3VJZkFJ?=
 =?utf-8?B?cERscGU3UTdOYmNna0tmZ1NiTjJTN2F6Nmc4dFJUNFQ0THFPUFBZVWpLbXV5?=
 =?utf-8?B?NTdzcElnaVhsNm9NVEloT1FuK25rQWJ2T3hyMk56TW5DS1M4SzFDbkpNZ3V3?=
 =?utf-8?B?ZDlmSGZiNWpXREVJczRxcVlLdGt5Ym4wQnZ5aUlEUzRHQmRCTEl2ZlhDMXZJ?=
 =?utf-8?Q?WYUavqKfybE4sPEA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e23efc8-e339-4566-77ca-08de5fd85ec7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 08:20:04.4942 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 14+ztdFYOr+Jqp2JWwKNK6Z0Ls7JGrrb8TiBLVPBrNTc4Ow7qOPohf5DzkM+a637k/Y2I40Z0uIRHe1rlZX64EHhiXabkbE8edca9bOv5I0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6783
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

--------------iShqpqsXU0Oy2RpWHYNf1oiT
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-01-2026 11:46 am, Poosa, Karthik wrote:
>
>
> On 28-01-2026 16:07, Mallesh, Koujalagi wrote:
>>
>>
>> On 24-01-2026 12:05 am, Karthik Poosa wrote:
>>> Improve hwmon-read test to check if current temperature
>>> is above critical temperature limit in hwmon-read test.
>>> This will help identify any thermal issues with the
>>> setups during test runs.
>>>
>>> v2:
>>>   - Address review comments. (Mallesh)
>>>   - Call check_temp_is_valid() only for temperature hwmon entries.
>> Please change check_if_temp_valid() function name
>>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>>> ---
>>>   tests/intel/intel_hwmon.c | 25 +++++++++++++++++++++++++
>>>   1 file changed, 25 insertions(+)
>>>
>>> diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
>>> index 103ae69cd..9deb48a00 100644
>>> --- a/tests/intel/intel_hwmon.c
>>> +++ b/tests/intel/intel_hwmon.c
>>> @@ -26,6 +26,28 @@
>>>   
>>>   IGT_TEST_DESCRIPTION("Tests for intel hwmon");
>>>   
>>> +static void check_if_temp_valid(int hwm, char *sysfs_name)
>>> +{
>>> +	char str[32] = {0};
>>> +	uint32_t cur_temp = 0;
>>> +	uint8_t ch = 0;
>>> +	s32 limit = 0;
>>> +
>>> +	/* Get the channel number and sysfs entry suffix. */
>>> +	igt_assert(sscanf(sysfs_name, "temp%hhu_%s", &ch, str) == 2);
>>
>> Buffer overflow when string length more than 31, we can use 
>> "temp%hhu_%31s" as defensive.
>>
> maximum length of hwmon sysfs attribute is 32 Bytes
>
> See: in drivers/hwmon/hwmon.c
>
>       #define MAX_SYSFS_ATTR_NAME_LENGTH      32
>
> So existing 32 bytes of str should suffice.
>
Agreed that hwmon sysfs attribute (32 bytes) which makes overflow unlikely.

Thanks,

-/Mallesh

>> Thanks,
>>
>> -/Mallesh
>>
>>> +
>>> +	/* If entry is tempX_input, check if it exceeds tempX_crit. */
>>> +	if (!strncmp("input", str, 5)) {
>>> +		sprintf(str, "temp%hhu_crit", ch);
>>> +		if (!faccessat(hwm, str, R_OK, 0)) {
>>> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, "%d", &cur_temp));
>>> +			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, "%d", &limit));
>>> +			igt_debug("current temp = %d limit = %d\n", cur_temp, limit);
>>> +			igt_assert_f(cur_temp <= limit, "current temperature exceeds limit!\n");
>>> +		}
>>> +	}
>>> +}
>>> +
>>>   static void hwmon_read(int hwm)
>>>   {
>>>   	struct dirent *de;
>>> @@ -43,6 +65,9 @@ static void hwmon_read(int hwm)
>>>   		igt_assert(igt_sysfs_scanf(hwm, de->d_name, "%127s", val) == 1);
>>>   		igt_debug("'%s': %s\n", de->d_name, val);
>>>   
>>> +		if (!strncmp(de->d_name, "temp", 4))
>>> +			check_if_temp_valid(hwm, de->d_name);
>>> +
>>>   	}
>>>   	closedir(dir);
>>>   }
--------------iShqpqsXU0Oy2RpWHYNf1oiT
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-01-2026 11:46 am, Poosa, Karthik
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:9073233a-42bb-418b-bbc8-766619d5fdb0@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 28-01-2026 16:07, Mallesh,
        Koujalagi wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:ca032654-19e4-4f22-a775-b0906aa852f8@intel.com">
        <p><br>
        </p>
        <div class="moz-cite-prefix">On 24-01-2026 12:05 am, Karthik
          Poosa wrote:<br>
        </div>
        <blockquote type="cite" cite="mid:20260123183556.1649959-1-karthik.poosa@intel.com">
          <pre wrap="" class="moz-quote-pre">Improve hwmon-read test to check if current temperature
is above critical temperature limit in hwmon-read test.
This will help identify any thermal issues with the
setups during test runs.

v2:
 - Address review comments. (Mallesh)
 - Call check_temp_is_valid() only for temperature hwmon entries.</pre>
        </blockquote>
        Please change&nbsp;<span style="white-space: pre-wrap">check_if_temp_valid() function name</span>
        <blockquote type="cite" cite="mid:20260123183556.1649959-1-karthik.poosa@intel.com">
          <pre wrap="" class="moz-quote-pre">Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com" moz-do-not-send="true">&lt;karthik.poosa@intel.com&gt;</a>
---
 tests/intel/intel_hwmon.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tests/intel/intel_hwmon.c b/tests/intel/intel_hwmon.c
index 103ae69cd..9deb48a00 100644
--- a/tests/intel/intel_hwmon.c
+++ b/tests/intel/intel_hwmon.c
@@ -26,6 +26,28 @@
 
 IGT_TEST_DESCRIPTION(&quot;Tests for intel hwmon&quot;);
 
+static void check_if_temp_valid(int hwm, char *sysfs_name)
+{
+	char str[32] = {0};
+	uint32_t cur_temp = 0;
+	uint8_t ch = 0;
+	s32 limit = 0;
+
+	/* Get the channel number and sysfs entry suffix. */
+	igt_assert(sscanf(sysfs_name, &quot;temp%hhu_%s&quot;, &amp;ch, str) == 2);</pre>
        </blockquote>
        <p>Buffer overflow when string length more than 31, we can use&nbsp;<span style="white-space: pre-wrap">&quot;temp%hhu_%31s&quot; as defensive. </span></p>
      </blockquote>
      <p>maximum length of hwmon sysfs attribute is 32 Bytes</p>
      <p>See:&nbsp;in drivers/hwmon/hwmon.c</p>
      <p>&nbsp; &nbsp; &nbsp; #define MAX_SYSFS_ATTR_NAME_LENGTH&nbsp; &nbsp; &nbsp; 32</p>
      <p>So existing 32 bytes of str should suffice.</p>
    </blockquote>
    <p>Agreed that hwmon sysfs attribute (32 bytes) which makes overflow
      unlikely.</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:9073233a-42bb-418b-bbc8-766619d5fdb0@intel.com">
      <blockquote type="cite" cite="mid:ca032654-19e4-4f22-a775-b0906aa852f8@intel.com">
        <p>Thanks,</p>
        <p>-/Mallesh</p>
        <blockquote type="cite" cite="mid:20260123183556.1649959-1-karthik.poosa@intel.com">
          <pre wrap="" class="moz-quote-pre">+
+	/* If entry is tempX_input, check if it exceeds tempX_crit. */
+	if (!strncmp(&quot;input&quot;, str, 5)) {
+		sprintf(str, &quot;temp%hhu_crit&quot;, ch);
+		if (!faccessat(hwm, str, R_OK, 0)) {
+			igt_assert_lt(0, igt_sysfs_scanf(hwm, sysfs_name, &quot;%d&quot;, &amp;cur_temp));
+			igt_assert_lt(0, igt_sysfs_scanf(hwm, str, &quot;%d&quot;, &amp;limit));
+			igt_debug(&quot;current temp = %d limit = %d\n&quot;, cur_temp, limit);
+			igt_assert_f(cur_temp &lt;= limit, &quot;current temperature exceeds limit!\n&quot;);
+		}
+	}
+}
+
 static void hwmon_read(int hwm)
 {
 	struct dirent *de;
@@ -43,6 +65,9 @@ static void hwmon_read(int hwm)
 		igt_assert(igt_sysfs_scanf(hwm, de-&gt;d_name, &quot;%127s&quot;, val) == 1);
 		igt_debug(&quot;'%s': %s\n&quot;, de-&gt;d_name, val);
 
+		if (!strncmp(de-&gt;d_name, &quot;temp&quot;, 4))
+			check_if_temp_valid(hwm, de-&gt;d_name);
+
 	}
 	closedir(dir);
 }
</pre>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------iShqpqsXU0Oy2RpWHYNf1oiT--
