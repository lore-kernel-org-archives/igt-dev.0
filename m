Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C77B1E77188
	for <igt-dev@archiver.kernel.org>; Tue, 24 Dec 2024 05:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6775810E046;
	Tue, 24 Dec 2024 05:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l/+swKSK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25DF10E046
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Dec 2024 05:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735019289; x=1766555289;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ydjseNYRC1uLAUGyycj+jN+yuZ7ls66LX+l1xhaolKI=;
 b=l/+swKSKSO9L0ozTiP9aA6hkaEcgfNRWTLooYoSoNoi7leLeN/Fa/6aO
 GlOJRr7NTa/faT3TsI0ALd+MzVrs9MYmpjl8q0WRcCYg0k2sl1hz6J9vZ
 NeOasH2q7LvERjzHubAcOBbogLj+IdQTjoMFhcFTHGBOBR18A+yJ6jg7D
 r9yA6e2cpDuAn7BgjGTt/7VgYFqifIn+LEoA7XAnv8UySgvrSYfkE1HMG
 i6R/pZKhqfIe3o7sgRZ6ITWBCtGU/2sKCjiWrqWNcy0zsdRSSSogHbQZp
 1R2SNLKNA7yQIeb9XXG62In57fSD+usrUzOSsNdJM4mWu4YN2mnMaEetr g==;
X-CSE-ConnectionGUID: d4KULQRHRbCjNy7pxDwaiw==
X-CSE-MsgGUID: mAa6wOO3QCGpT18ugPxgBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="39264616"
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; d="scan'208";a="39264616"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Dec 2024 21:48:08 -0800
X-CSE-ConnectionGUID: s1c6RbJHRNScgx0ja0SCqg==
X-CSE-MsgGUID: P4ObScMFS1OhvramRxz04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,259,1728975600"; d="scan'208";a="99765880"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Dec 2024 21:48:08 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 21:48:07 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 21:48:07 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.48) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 21:48:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J61+qMvzBfTBo4E6A+Sk1mlofRlUcZbqgN8kUF+EkDA3v7eNhMuK2Xwxlg23rCApjF5AWwlHhk5V4amCiFM2rb0ULAZKYxEkO7MEVO92lsmGt9oGC10AdMUN2yPlU/j71TeaQbz9KqVh3jut7HRyXKVWynJHpoHBClCmgCaffr2ya2RZZAxder6GfrVQsLAMbImYVOhizD6IgvZo25TnjsN0e93w2P8YzrpGgqMB2uvclvuszQK/TgLfCSdnToASbx7BZI+TK6OmvalXmU430Zf0rNE9Nm1BiO7HMLYnnYpegDT8tQPMET1yFB3czBF9wJ3O/g/yPdk+05IZpBp2cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZjHxntAVNlE0R/QOvjKCDIH0OH1uvJCJtGjjJ4OiyKo=;
 b=QzKISgYfz6gedIVY9hrrN56UITwqqehqNwqHK7UctCi5SdyIsLfnO+wY3RbjHF+t+JsUr2NXJJOvcpgacqvOUCHiH5UydRQtkpVnox4ty4tLerTr5Gdya7IK9RC1ngokLYMSnR9OJ253RgmWPchuu7cLhyZlou5VdoR2aDDm21/d9xQECj+jKjXqYQZsCAgS+WAJg+acJO1PwWoas0tk08V4foe356sSHDivyD355sRS5GcKhhLdIQl9XL9ThFvTWyeBnmzSoSVd7clFh3u636zIbwiX+AcxRyBrwu13wV7UtMmbpNJGohEldH+qFn0mlyLXTTkPIrLY8E1+t94PQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by CO1PR11MB5121.namprd11.prod.outlook.com (2603:10b6:303:98::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.18; Tue, 24 Dec
 2024 05:47:59 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%5]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 05:47:59 +0000
Message-ID: <4a5e38d8-2c15-4729-a70e-b4a6450785a8@intel.com>
Date: Tue, 24 Dec 2024 11:17:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel/kms_cdclk: Refactor mode setting and CD
 clock verification
To: <igt-dev@lists.freedesktop.org>
References: <20241213060225.2144633-1-swati2.sharma@intel.com>
 <d8cdb59f-1a68-49ef-9b66-5508527c159f@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <d8cdb59f-1a68-49ef-9b66-5508527c159f@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0011.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::16) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|CO1PR11MB5121:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ab4ed7b-55a9-4b59-d1df-08dd23de85da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjRZd09FOWlwWW1oZXVQdS84UGJMSUxNZ1Bkc25iVjNJSUtxSTVibitVTUQw?=
 =?utf-8?B?d2RkRzlSUUdqbm8wUlZyeld4T25va1RENE1XNysrZEdwOXpSVG1uYjg5NzFS?=
 =?utf-8?B?VmtVUjNPM0MzSjh5ODdUdDFCWXRJcG9sQVgwY0pYWUNPV2psWE53WnYramFy?=
 =?utf-8?B?bTdYYWt4SUIxMmVta1FSNVYzdFJPRXNvNGVmNWM0czJSb2VFZm5BZnQwdkE1?=
 =?utf-8?B?c2tYS0xHc05uNTlZTWd4LzErbHFxZzRCVnMrY1NZS3pLOVg0WDIxRU84emxq?=
 =?utf-8?B?UmZqM1lsMDZ4SVJCMXowaWtiVG9kd3FoR3d5S2cwblJtRjYrcFVsMEdRYjF3?=
 =?utf-8?B?WlliNGhZdVF2WCtpeTRuSmRtZUJ2TGF0SXlYWmNwSVVhcFRkWnhHMTZJd3Zt?=
 =?utf-8?B?YjZOZWlwVHY1REs4UHI3am93S0RYdzU5VTJsa2piR2tZaHNKdmRoV1pzc3o4?=
 =?utf-8?B?TUIrbG5Rek94LzlOZVpMN1hLQkNoZTVtcUphWm40aXNRREtpQ25nc0xlSnBp?=
 =?utf-8?B?SVU0MENMN2hrYnVsaUNkMDFlaDNXbzhsL25yVFpKL0hWczZaeHIrZDBiYzBM?=
 =?utf-8?B?NllwTG1iYU5lSkF1Q0NJa1hNTzFsZmtsczlObEFpVHFZTHBOZ3FrbzFieEFQ?=
 =?utf-8?B?NWJvOUxiNkxERjNhWWE5QU1wdHpmUElNWkJCL0JVMURVdTI1L2VTdzlHWk1B?=
 =?utf-8?B?MlhJSHhwMlpGaVdkZmp4cXFodm5JZWdkWi84d0lCUDFlZlptTU9FTkZRYzY2?=
 =?utf-8?B?ellXaE8xaHR5VHNDN213WUtXY2Fsck8vWFdaVjE2M2t5M3Jtc3ZkU2s1bCtl?=
 =?utf-8?B?NGQyZ0NaYXpzRmFibVpvL1Q1RzJwOERpNGtJV1dDWkJ6NWhWTHdIZGdUSm43?=
 =?utf-8?B?cTlrSkZ6U1ZzNnZmemxmTHI0emdzM3Vla0NTaU9ObjN4bHlzRkQvVEIxSTY0?=
 =?utf-8?B?ZjRVK3BPYStOb3Njbm9nWjZOTTN2VmtUWUNmRUh2dnRCbnN1UjZHQlpNNEpt?=
 =?utf-8?B?WTV1OTVrUU5uaFFnLzlEWmRIRDl0c2UxQ1VONjJsbEZFS2dFNU5uZ0FvRjd3?=
 =?utf-8?B?aWdxcDF6STkvbithQW55ZVRNTGNOL3FLYXNhUlRzbUxIcXg5ZXoremlaWVg5?=
 =?utf-8?B?eFlFSlZONEhzbThtMlR4eUZnUkU4QzJyRUFFQWlZK2xmckIvQ3RWbzI3ZzV0?=
 =?utf-8?B?SHYzR1RRY1NKQ1pxdDFUZWc5WW1FUkFpeEg3UmIxZHM1VGxqTUEwd2VHalZq?=
 =?utf-8?B?dlNkaEFVd2tCWTEwMTJPMGxQSnVOTytsNjBVK3hDZjJTajBtSldwbmZoQXEv?=
 =?utf-8?B?OGhhKzc1MGZzNzBRV3JxZGtjNkJyQ1VseFd5M3ZibkNVbG1LaXhMeTBVMWpV?=
 =?utf-8?B?WEVZSUNwcGVJbHpTRll2NEp1TDgzUmhFazBPTHh6NVRGeSttNUJ3ZUIvK0NU?=
 =?utf-8?B?UnlPMS9MSDJoVGlNUldvUUh2aDBtQkdGQnlYSEdCS2JBckZMSm92dlFHUEk5?=
 =?utf-8?B?c1A4ekJqRUdjKzhXUWw3TDRNcDlpanlTSjNNdjVycUZ5MGZZcXIzZW1rY2lu?=
 =?utf-8?B?eW50c2g3THNUSzA0c0UyNmN5blk0QmFPeFBKRjUyK3BReUFvcms0SVFKcUNk?=
 =?utf-8?B?TTh4S21naDIzUkZsbkQvWWJ5VU9lSzR2L1E3ZUtBZTA3Vk1ScXlWbDI0Z0dW?=
 =?utf-8?B?dHkveHdUS3Y0VVJTRk8wZ3p5TVV1R2JrODBpSzhWVmR3RHEvcC9vRVI2Y0RL?=
 =?utf-8?B?aXBuSFhBdVFlNkN1Zjk1WVFheHBCMDNWTEZMcHFPZGRUQ3ZXVGJXc2ZOck4r?=
 =?utf-8?B?QUovYm8vMXJ5c1NEbDJPMXNId2pGMDFhTzJJZGIyVVBRb0RnVkp2RzR3c0lD?=
 =?utf-8?Q?l3meidP/TKlNK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?KzFpVEVYUy9SVUx2bmZOekZ3QmtieGEyY0grMEszOXRJUnZMaG9mZ2NtZWk0?=
 =?utf-8?B?cG81QmxpYXhsRHMrM0djaXhMMnNzZGdMTS9mb3U1WHpiTTBEek9CMW1zUmVa?=
 =?utf-8?B?RUVuUHFQam04QmUxUktpWW9hbVh6eFRucmIxd1lPTVcydU5KY3hlUDFsditR?=
 =?utf-8?B?OExoMGd4MWFTcVliNzlpcEppaEJQOUVkV2xhYjUvZGRhSXpUWEMxbjlReVlr?=
 =?utf-8?B?UXFyRjJ5OEx2Q2d4K2p0MXVtbFA5Y3dRQjFNckJrN3Nvek0yM09GNWMwODBE?=
 =?utf-8?B?TWd3NWYxczVDNks4Z0RWbGVzWVUvK3RQOFUySkhiTXRvRDdXUlhaaVg0b25z?=
 =?utf-8?B?azhrd0N6dEhDQkpmMGRPeG9VeU40ZlNSVHdXbXJ3QlM3NUIxNTU4bUhYOVky?=
 =?utf-8?B?SEVwTDlGaEtBYjZNbEJ1S1lUYXNXUXg5WWxnMEY2b3hHQTZrWjJsb3Z4aGM2?=
 =?utf-8?B?R3lzcjRITkhITDB1VG1tZlVuTnFjUDdyTDNGSjRIb3UwZlVpY1I4bWNXNmpw?=
 =?utf-8?B?YXVtbWd2Uy9FeCt0NThNNmhpSVZXTjJCUFZrRDBPTXh1L29xUDBueFlTR3FK?=
 =?utf-8?B?YWpZMVF5dVJlUERGcmNidWxMOGh0ak4wU1pINnFoSVlFNHU0WEtWRmcvRE03?=
 =?utf-8?B?bCtHbDEzbm1TK3Z1RmwvWlpQOWV0OTVnalFrb3cySXRvbTZEamNBTzV6TWRX?=
 =?utf-8?B?VVl6RFVRWXR2ZVgyL3phQWtrTXQwazdEVGtaMXQ3VzlaYm1KOTBwRERuaTMr?=
 =?utf-8?B?amxuaFE2SXQ3cjlZL2JpUW56TjVMYlZDSU9NTzRpVzRpRWFYaDBOT1NRQkNO?=
 =?utf-8?B?ZzNEMUlDWGQ0RjhjVGV2RDFPNFZrTUU1TUZMVysyNlNSaEdwanJLaHZhZjho?=
 =?utf-8?B?UGZXWTdaMkVOMUlYK1NiVXROM010TEYzaEhaZ3pHUXBDNCtuV09qVTUvYTJa?=
 =?utf-8?B?K3lrZDFnS3RDQ0JjRnppRjhIWXZTRzFkU1dWN3g4QmlMUVlZNDhsSXc5dTBC?=
 =?utf-8?B?N2VISjNZM1pMWldYcEp3K2VhaFNJSzJvRGtqdk9IM0Y2SU5NZmN6UHJpYXdu?=
 =?utf-8?B?eWYrMS9RSDhOWVVWU0lnaTMrNzJaR3FnanVsd1hmelp5WStLc0VrRVZNRUhP?=
 =?utf-8?B?MVZtYnJPWkFWZ1pqUmpWVWxuVmRNOUxjYWp5eGh2Szc1UDRFcjZxVDZlcU1W?=
 =?utf-8?B?TjEwbnJ5ajN5bWd2VzRZQ0xPaWhqbjhZc2o5blpKQk5RT2lSYjdyenpUdUJz?=
 =?utf-8?B?RlFnS3lWWkFTODBpS0YxNWJRMkRyOEhPREhNbG1xMUowcUpkcFBJZFNZMjZX?=
 =?utf-8?B?WnVRelJzT3ljVmlHTG41aWo3dWFRY1RZTUh6UmlYazd1RllYR3plWEI0TzR3?=
 =?utf-8?B?QzdxQXcydEF1ekhoMWhIQURSZ3kvM3pCaDFpMTRXcHJTVzJsMkNmRDFMVGtS?=
 =?utf-8?B?d3h3SUZsMVZPeXlSWURjK2xrNDB1N2xCTDFVakJsamZHTXE5dkNNa2JrR1RE?=
 =?utf-8?B?NjMrbG1hYnJMWithcGo0dDRneDZQelIzSlphYmdUVkl3OXBWM3U5MmVsVjZL?=
 =?utf-8?B?Zit6NWdRSDg2NVRkS0ZLemRrRTFrUldwajhXOFlCMy8rUXZDaXZhUWJwbnM1?=
 =?utf-8?B?Mk81MlVCa2pncU14Y0tJekthOTliYWF3dElyZi96aDJZdXRXUnM4MjFFcGtM?=
 =?utf-8?B?MzFZY1M2K0kyNGwzM0VrT05SbGN5RkloZUh1MmljdUorbzNidW5pL0lxY1Fk?=
 =?utf-8?B?VmRKVmVkMU9LUVBqTFlVbVpsZCtSODR3VEJZNkMxVEMwckdkeTRzeTBSU2tj?=
 =?utf-8?B?NUpKbm1RWTA0cXdqYU1IbHNpZmRCaTJCZjV5eWtFN1hLWldGL3ZobnN2YUFI?=
 =?utf-8?B?emhJTXhzakNUSkpmNEFMd3BIVWFUNUVDTlpzSDJ2MlI2MHQ0Q0F0KzVxYk1B?=
 =?utf-8?B?OHFvSDBaaHI2UCtwenZPdHhyZkxQeHBzMU0rM1V0UDRzaG9ZZHNjSjA5LzFJ?=
 =?utf-8?B?QlA2OWJvaElzaWZwOGFGWG52YktBcUQxcUw4Kys4cG9wZWdBZitwWm9HQlc2?=
 =?utf-8?B?REFLWlloTkEwWWdlenF0VnlNNENwaDdpcUFlR2Q2Um9PalJ3TUk0aHVSZnY1?=
 =?utf-8?B?bGl2d1grbVZNWS9ncGRWZTI3YU9rNFB5TENaeDFHa1ZQWlNCbzhjQW9ITEYv?=
 =?utf-8?Q?cSbCU+FLQltoxZghzeK956Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ab4ed7b-55a9-4b59-d1df-08dd23de85da
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 05:47:59.5584 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LvadwJ/zrr+NcvkTyEUBLUhN7vHs4NfiypiHFTISW3oXtz/9Ml8WnD0suKNlSYK3Bj6PDYqiHJsINjvCnRPz/H5wZnVgKW2Cj0z28GmjyAFkgp+6pssHwd//hAvF2cMJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5121
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



On 23-12-2024 12:20, Nautiyal, Ankit K wrote:
> 
> On 12/13/2024 11:32 AM, Swati Sharma wrote:
>> Add conditions to filter valid outputs. Encapsulate the
>> mode-setting functionality in the set_mode function to reduce
>> redundancy. Remove redundant framebuffer and size setting
>> operations for the plane. Simplify the CD clock frequency
>> checks to ensure it increases after the mode transition. Clean
>> up unnecessary plane operations and redundant framebuffer
>> handling. Enhance the readability and modularity of the mode
>> transition logic to handle multiple outputs more effectively.
> 
> This patch is doing more things along with refactoring like skipping if 
> there is only one mode, and checking if there are minimum 2 displays.
> 
> So lets refactor be one patch, with no functional change.
> 
> Then add other enhancements etc.
> 
> 
>>
>> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
>> ---
>>   tests/intel/kms_cdclk.c | 112 +++++++++++++++++++---------------------
>>   1 file changed, 54 insertions(+), 58 deletions(-)
>>
>> diff --git a/tests/intel/kms_cdclk.c b/tests/intel/kms_cdclk.c
>> index 382b3e9d1..93276f45e 100644
>> --- a/tests/intel/kms_cdclk.c
>> +++ b/tests/intel/kms_cdclk.c
>> @@ -54,6 +54,7 @@ IGT_TEST_DESCRIPTION("Test cdclk features : crawling 
>> and squashing");
>>   #define VDISPLAY_4K    2160
>>   #define VREFRESH    60
>>   #define MAX_CDCLK_4K    307200
>> +#define MIN_DISPLAYS    2
>>   /* Test flags */
>>   enum {
>> @@ -269,90 +270,86 @@ static void test_mode_transition(data_t *data, 
>> enum pipe pipe, igt_output_t *out
>>       igt_remove_fb(display->drm_fd, &fb);
>>   }
>> +
>> +static void set_mode(data_t *data, drmModeModeInfo *mode, int count,
>> +             struct igt_fb fb, igt_output_t **valid_outputs)
> 
> let count be after data, as this is count of modes and valid outputs. 
> Perhaps a better order will be:
> 
> set_mode(data_t *data, int count, drmModeModeInfo *mode, igt_output_t 
> **valid_outputs, struct igt_fb fb)
> 
>> +{
>> +    igt_display_t *display = &data->display;
>> +    igt_pipe_t *pipe;
>> +    igt_plane_t *plane;
>> +
>> +    for (int k = 0; k < count; k++) {
> 
> lets use i for iterator.
> 
> 
>> +        pipe = &display->pipes[k];
>> +        plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +
>> +        igt_output_override_mode(valid_outputs[k], &mode[k]);
>> +
>> +        igt_plane_set_fb(plane, &fb);
>> +        igt_fb_set_size(&fb, plane, mode[k].hdisplay, mode[k].vdisplay);
>> +        igt_plane_set_size(plane, mode[k].hdisplay, mode[k].vdisplay);
>> +    }
>> +}
>> +
>>   static void test_mode_transition_on_all_outputs(data_t *data)
>>   {
>>       igt_display_t *display = &data->display;
>>       int debugfs_fd = data->debugfs_fd;
>> -    drmModeModeInfo *mode, *mode_hi, *mode_lo;
>> +    drmModeModeInfo *mode, mode_hi[IGT_MAX_PIPES] = {0}, 
>> mode_lo[IGT_MAX_PIPES] = {0};
>> +    igt_output_t *valid_outputs[IGT_MAX_PIPES] = {NULL};
>>       igt_output_t *output;
>> -    int valid_outputs = 0;
>> +    int count = 0;
>>       int cdclk_ref, cdclk_new;
>>       uint16_t width = 0, height = 0;
>>       struct igt_fb fb;
>> -    igt_pipe_t *pipe;
>> -    igt_plane_t *plane;
>> -    int i = 0, j = 0;
>>       do_cleanup_display(display);
>>       igt_display_reset(display);
>> -    for_each_connected_output(&data->display, output)
>> -        valid_outputs++;
>> -
>> -    i = 0;
>>       for_each_connected_output(display, output) {
>> -        mode = igt_output_get_mode(output);
>> -        igt_assert(mode);
>> +        const drmModeModeInfo *highres_mode;
>> +        const drmModeModeInfo *lowres_mode;
>> -        width = max(width, mode->hdisplay);
>> -        height = max(height, mode->vdisplay);
>> +        highres_mode = get_highres_mode(output);
 >> Can we move the get_highres_mode from test functions to lib and re 
use in other tests kms_dsc, kms_display_modes, in fact here we are 
restricting highest modes to 4k, imho it would be good to sort the modes
to get highest mode.

>> +        igt_require(highres_mode != NULL);
>> +        mode_hi[count] = *highres_mode;
>> -        mode_hi = get_highres_mode(output);
>> -        igt_require(mode_hi != NULL);
>> +        lowres_mode = get_lowres_mode(output);
>> +        mode_lo[count] = *lowres_mode;
> 
> I think it will be better to set the mode_hi and mode_lo later after we 
> set valid_output.
> 
> If both are equal we are overwriting mode_hi and mode_lo.
> 
> 
>> -        igt_output_set_pipe(output, i);
>> -        igt_output_override_mode(output, mode_hi);
>> -        i++;
>> -    }
>> -    igt_require(intel_pipe_output_combo_valid(display));
>> -    igt_display_reset(display);
>> +        if (mode_hi[count].hdisplay == mode_lo[count].hdisplay &&
>> +            mode_hi[count].vdisplay == mode_lo[count].vdisplay) {
> In line with above comment, use highres_mode and lowres_mode to compare.
>> +            igt_debug("Highest and lowest mode resolutions are same; 
>> no transition\n");
>> +            continue;
>> +        }
>> -    igt_create_pattern_fb(data->drm_fd, width, height, 
>> DRM_FORMAT_XRGB8888,
>> -                  DRM_FORMAT_MOD_LINEAR, &fb);
>> -    i = 0;
>> -    for_each_connected_output(display, output) {
>> -        pipe = &display->pipes[i];
>> -        plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> +        valid_outputs[count++] = output;
>> +    }
>> -        mode = NULL;
>> +    igt_skip_on_f(count < MIN_DISPLAYS,
>> +              "Number of valid outputs (%d) must be greater than or 
>> equal to the "
>> +              "minimum required displays (%d)\n", count, MIN_DISPLAYS);
> 
> I think what we mean here is that the count should be more than 1, 
> meaning there should be more than 1 output.
> 
> We dont need to have a macro MIN_DISPLAYS as count >= 1 is self 
> explanatory.
> 
> Regards,
> 
> Ankit
> 
>> -        igt_output_set_pipe(output, i);
>> -        mode = igt_output_get_mode(output);
>> +    for (int i = 0; i < count; i++) {
>> +        mode = igt_output_get_mode(valid_outputs[i]);
>>           igt_assert(mode);
>> -        mode_lo = get_lowres_mode(output);
>> +        width = max(width, mode->hdisplay);
>> +        height = max(height, mode->vdisplay);
>> -        igt_output_override_mode(output, mode_lo);
>> -        igt_plane_set_fb(plane, &fb);
>> -        igt_fb_set_size(&fb, plane, mode_lo->hdisplay, mode_lo- 
>> >vdisplay);
>> -        igt_plane_set_size(plane, mode_lo->hdisplay, mode_lo->vdisplay);
>> -        i++;
>> +        igt_output_set_pipe(valid_outputs[i], i);
>> +        igt_output_override_mode(valid_outputs[i], &mode_hi[i]);
>>       }
>> -    igt_display_commit2(display, COMMIT_ATOMIC);
>> -    cdclk_ref = get_current_cdclk_freq(debugfs_fd);
>> -
>> -    j = 0;
>> -    for_each_connected_output(display, output) {
>> -        pipe = &display->pipes[j];
>> -        plane = igt_pipe_get_plane_type(pipe, DRM_PLANE_TYPE_PRIMARY);
>> -
>> -        mode = NULL;
>> -
>> -        igt_output_set_pipe(output, j);
>> -        mode = igt_output_get_mode(output);
>> -        igt_assert(mode);
>> +    igt_require(intel_pipe_output_combo_valid(display));
>> -        mode_hi = get_highres_mode(output);
>> -        igt_require(mode_hi != NULL);
>> +    igt_create_pattern_fb(data->drm_fd, width, height, 
>> DRM_FORMAT_XRGB8888,
>> +                  DRM_FORMAT_MOD_LINEAR, &fb);
>> -        igt_output_override_mode(output, mode_hi);
>> -        igt_plane_set_fb(plane, &fb);
>> -        igt_fb_set_size(&fb, plane, mode_hi->hdisplay, mode_hi- 
>> >vdisplay);
>> -        igt_plane_set_size(plane, mode_hi->hdisplay, mode_hi->vdisplay);
>> -        j++;
>> -    }
>> +    set_mode(data, mode_lo, count, fb, valid_outputs);
>> +    igt_display_commit2(display, COMMIT_ATOMIC);
>> +    cdclk_ref = get_current_cdclk_freq(debugfs_fd);
>> +    set_mode(data, mode_hi, count, fb, valid_outputs);
>>       igt_display_commit2(display, COMMIT_ATOMIC);
>>       cdclk_new = get_current_cdclk_freq(debugfs_fd);
>>       igt_info("CD clock frequency %d -> %d\n", cdclk_ref, cdclk_new);
>> @@ -360,7 +357,6 @@ static void 
>> test_mode_transition_on_all_outputs(data_t *data)
>>       /* cdclk should bump */
>>       igt_assert_lt(cdclk_ref, cdclk_new);
>> -    igt_plane_set_fb(plane, NULL);
>>       do_cleanup_display(display);
>>       igt_remove_fb(data->drm_fd, &fb);
>>   }

