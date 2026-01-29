Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CECD61020
	for <igt-dev@archiver.kernel.org>; Thu, 29 Jan 2026 15:08:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BFCB10E87C;
	Thu, 29 Jan 2026 15:08:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BMSizMMC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDC0610E87C
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jan 2026 15:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769699301; x=1801235301;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=NEkLlqp6BunVT9aHDJYBXTNqBzrkSpTawY7WJSLpbtw=;
 b=BMSizMMClTR85ARDwPtUh9pk+ocTkbC3WE3UshmyBuZIwDh+8zoMT1Fx
 +tHrmicRxgSfqVDb46ucHM/u7nfYQFGjs6hRRcljDGJOwggSgaaVYjijs
 DtEVWuVKgW0t0lgV22pHdqsKsEu5oJoW/v+h/CxUSmFMrxilcktkBxNnk
 1qDth4r1qd3u8v1cqZnrUhylLA+Or7XIJ5f52fGMX9vIApqMgdjX/u5Tp
 5pZuSiiBEHhDLqgl1YhSNFdZdDcV9l12ODNWAp8JEP9g67aka3bz3JNl/
 4TvxfQ0nViytwqWaVjgzieaq8xCOcYwptPhhj7gXkiNzregYxRTO3gNWa g==;
X-CSE-ConnectionGUID: ZbWB7YE7QoeIwKThOcJ1YQ==
X-CSE-MsgGUID: kfcInE2ARo21CHf+bAMS9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="96405538"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="96405538"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 07:08:20 -0800
X-CSE-ConnectionGUID: uMafKeVwS7yHdSTQs8K7uA==
X-CSE-MsgGUID: D3++woKtRim1km99uiLITg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="208708061"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 07:08:20 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 07:08:18 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 07:08:18 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.64) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 07:08:18 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gQ0WUw2KvXtlxkWZQppodW/l0eMl16zQjyXyHeFbjfdgS3CwD0NuM685oQHpN9pseFEWkjEFgXu7Uc0iO0adbp06kVVETKJqEGQ4YuTiWqi/H2lwHph4BcYJK+RnJSSJeS6XvZE+2eMjMJY0Uo1G0vKL8fHEAx4TwE4uWE39XswHShXX2Al/euVkaMI7ibw+QtXWu7rP0+i/YClE+Yx91b9CFqUbm+lptfntexkQG721kwyBpF4Tm76oD24cccTLVadPE7dhQVCjKx78JsbVwfqRnzS1abxbyLlXiArbjP5DldjkK6Lz9zgIj163LLW3PVgkECEcuWajkF5ySPtU7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0lJ89JJ08Vv6UpDjcAuQ/ZmGvD88VWeEijHkY6yCQY=;
 b=q4CoVpZAPCEalFBziAK558d52ayM3p2El8KpinChWfROn0miJpNjwg8jhfIwyeX9Ct2pAl8o6OzqEvYi0a4toZmZDdOmStlgIsycaCeiL0P9amAw6deslHQFRgE9SkyiSriGZjFvlzaBR5COU6q0h5P4M8RSy6cDkkUzED5loIGOo0fyNQzMyy8c6vlYfkLTHUQ10c/18/RhhKxm5/dE4eLjT8mSvyxrd1Bo0BAivghb3OtEO8WNMGuOmRPDueVakaBQLbsv4z89iy5YFOh+ZN8deOU9DQ38Sh1ridqQU1eGoA2xNgABAutjkDZBvyt0uI72F2PO8YCQvIEFgmnuAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by DM4PR11MB6333.namprd11.prod.outlook.com (2603:10b6:8:b4::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.7; Thu, 29 Jan 2026 15:08:11 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::d0b2:7271:ad7e:cb1a%5]) with mapi id 15.20.9564.010; Thu, 29 Jan 2026
 15:08:11 +0000
Message-ID: <2553cce8-fd48-488e-889d-302eccd69fde@intel.com>
Date: Thu, 29 Jan 2026 20:38:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_flip_scaled_crc: Move require checks at
 the beginning of the subtest
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>, Jeevan B
 <jeevan.b@intel.com>, <igt-dev@lists.freedesktop.org>,
 <swati2.sharma@intel.com>, <juha-pekka.heikkila@intel.com>,
 <ramanaidu.naladala@intel.com>
References: <20260121052158.491159-1-karthik.b.s@intel.com>
 <20260129143445.uxolu7ayg2ygl7h2@kamilkon-DESK.igk.intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20260129143445.uxolu7ayg2ygl7h2@kamilkon-DESK.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|DM4PR11MB6333:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f22bf44-dad3-493c-77ef-08de5f483776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|42112799006|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YllCRUtiKzFJTms2ZDNPL1RwbkJwM3RlMHlRb3pKa0tabzRRQjBmYUUzQVhw?=
 =?utf-8?B?M0NmT3NxenEydFpvS016SDYrZnNDaS9xUk45alNqaXVSeUcwQmswMzg1Yysx?=
 =?utf-8?B?TWwxK2k0aXE2LzNrUnRHS1pVSnRUM1ZiSzM3RnhyUU5FN0VGeGg3ci8zUUtE?=
 =?utf-8?B?N0NmWS9KMzU1OExaeDl6SWQxVVB1eTZsNTBMWUp4d3kzT2RnVXpxTGFuZ2hq?=
 =?utf-8?B?VTg4UXAvMktydklvMzE3b0lYSmEvNDBVYzJWbkdtbHkxMm1sQ2xyYWVtNk4v?=
 =?utf-8?B?dE9sSTRmWTFFWGJyVFN3ditHWDRmSW0vaE1sMysyelBad3BoNUV0SVZFQ09S?=
 =?utf-8?B?UUM3TTN2WmY3M0VuVmVhNnJ0Tkg1U3NGZ1VyY3JyM1dhanlOMU0vT08yWFVJ?=
 =?utf-8?B?Y1VySzJiR2FOYTdEVW5uT2RoN3FCZDVYeFd4Z3lTOTVkeXI4VFltbGV5bjZC?=
 =?utf-8?B?U3BNU1JOakkzMkVJR0RSSmZNL1lJMVp1MHR4WmR2bG5qUGliTVcyUmUzYm52?=
 =?utf-8?B?bHA0N09MRjFSZXdMMjdhWDhPNnFVdEtldU5jRFdUQ01xQ2VUekJkWlZsakpn?=
 =?utf-8?B?TWZ0QUYreG1XV2RaTkNHWTZIR080TzFFNSsxazBvT21UVUhjN2NUZnlvUTdm?=
 =?utf-8?B?Z2M4ZmhTVnF2NEJlWEY2MURNS1RaM0VHUWg0cE1mdWorb2NLNVZLOGJ0WXRw?=
 =?utf-8?B?NUhVVytmVGc1Q0xiWGhMbmpKREJqNi9wQzEwR1NqN0RsNEFXai9YZzU4MDdK?=
 =?utf-8?B?d2Q0ZEV3NzVzdWlpWWgybWFlb3Bjc1NnSEs0aDBhcVU3NFJPai9jSjJRTEdD?=
 =?utf-8?B?LzVnUWxXSG40d1JkbnFCdEM5cGk2MTNyRzhuUks2cE0wTU9WSDhaNWZxYkZa?=
 =?utf-8?B?a3VtNk40dm1Ocnd3TUZZTTNkYjh6TUdkem9TOUhCWlZrcVhLV0FDYmJkbGdT?=
 =?utf-8?B?S3ROMTUwaUdzWGN0djB2eEM5U3dIZyt3d0lqbS96bGhsdUxnZ004bFVkQWlY?=
 =?utf-8?B?L0Q0Q1VmdkxWSnFFMloxa2ljcmpGc3BEelpFZlNGNjhtR0w5cE83OW4rWjlM?=
 =?utf-8?B?b0piaVFWRE1wRWNzTTlEY1Y3TUtKWjdVRk1zVzZqN2FkdVg0NHgxeDg5ang0?=
 =?utf-8?B?OEU5cFBXT3ZyQ0ZvRENqZ1kvU29KM1dMRDVwM0FhVGtscCtieXpPTUZqcXBo?=
 =?utf-8?B?QThTVWdOck5jQ2FtR2JSUGh6ZU55NjdrbFdmRjl4b1Vla3Z2YlVHNGJET204?=
 =?utf-8?B?bkRtNDZFQ0NMd3FjNE95azlYRHhudFVlcUZDWDhvZDVIN1VMYWQ4dmorL0c4?=
 =?utf-8?B?dlRiWitiMUU3SGtEa1ptZnEzUkpjQ2trZWU1OHpxMTZ6Q0NjY1BpNU5ZRE1u?=
 =?utf-8?B?eXNYL2ZEbVFJNVJKNStWTE9UY215N0dlYUhtZmd3S3NyUytJYlhORkthSVA1?=
 =?utf-8?B?QWxPTDUzQ0liNjVDK2I2VkJUVTcrUDI0U2NVYWhrSE5XeXVISzJVd29HQzJ6?=
 =?utf-8?B?anpnd2dYSnJ2UnVKRXVyYzNBVklaK0NYeU1oK1p3VW5Ib0xyL1FDdEMxeUMy?=
 =?utf-8?B?VjBxYkoyYklvejdRYm1kUk1OUzdnT2tNQ2Z3ZFBtVlhLcVhUUmdZbWoremRi?=
 =?utf-8?B?LzJsanYvR2F6amMyb2YveGtlWjRRQzg1RmFYbEVjVFpTVEdJOHZ5cXQvRFFJ?=
 =?utf-8?B?K1M5RGFnbVhWTkR2anlyL3RPdWgxVmZ4Q3NzcUZVbEtWbjhaS1Z0WVBTTXQ3?=
 =?utf-8?B?aFEwUTZzbHlhMjl0VEkrMlVrOFJJZmwxR1FMc1ZWQjJESWZtNk4zanRqMEFn?=
 =?utf-8?B?citISnA0cURDSmRqaFo1Rld2RTE1ajNZZGQzOVRDYXl4UGxyOG9FRUcvZ3p6?=
 =?utf-8?B?RTgvQjdjWkF4MDZGRFdIUzJOakU4Nm9BeHpVaUJxVHpONmhJY2prMkxLQVRZ?=
 =?utf-8?B?TmJ5aXFnNFZ3NmtTanMwOFlwU1R6VnZPa0VqSmh5RFZaM2cvaU9wd3UxMWJ1?=
 =?utf-8?B?Y1Bhcit5bWFtZjV1NVU2R29UNWhIQ09NV0VjbGJuRnRjekk1dHo5YlVEWnFh?=
 =?utf-8?B?OXBVNGh2Wkk4eGM4NGZkMGlYekJocWNUSElidFpNdHhsOC9iZHcvTDZIc2hu?=
 =?utf-8?Q?ZCkI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(42112799006)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0tQZEVHaUIvbEFqNXByODFhUVB3V3lYTGFwREpsZ0VSbmZ5SEtvclJ2NEZk?=
 =?utf-8?B?aGcybnpOT1QzN1F0RWF1YytnZnZVbitJRWNEa2tMWTMrU1RtQSs5MkhwMUhx?=
 =?utf-8?B?UVdPL2FmM3hWTW5PMkhmVmJ3OEI0Syt3b3piVmo5a0grbzByeDVNRVBvdHF4?=
 =?utf-8?B?RFdaT3JVQzczMTFDK3lWKzQ4YWl6ekdSRWJiUWxsWDloY3YwRFo1ejFPYlE2?=
 =?utf-8?B?V1pMeFRKRmY4d01PRlVvaUZGZHVRWFZhc2I1alBHZTVPL3ZKMEdHUkNjaDNQ?=
 =?utf-8?B?dkp0U0RBRFBMWXBKQmtxaDVsaVl0ZDVKSkpDUUczQllPWEx6Wk1vOVQ0QTJp?=
 =?utf-8?B?Y3hmTWNtUlJwM1liYWJYOWZ5OWJmSlByQjd1RnViRW9aRisyTWpiaGM2SlhB?=
 =?utf-8?B?V3N3WmljZ1JuYlhLVEc5Nk9vWk1EdnZrYnhUcFQ0Ym1aeTRNRWtCTFlEK3V6?=
 =?utf-8?B?RjRYbzhVT0ZhK0lQRUVYMDNRQ3RLcWY4amhzOGY4ZXE0bjloYnhIRWZTdmxD?=
 =?utf-8?B?SGVxcHlLUVd0bllCSms0c1RrOU1mWU1RTEovUmhyVHpOZml2VlVjcTA3Y0Ft?=
 =?utf-8?B?NFZIdURuMW1aWW12M0Z1cjluYnVMd283RFJ6K3JRL09icVBmaVp4eXNtRVJo?=
 =?utf-8?B?bmNFa21GQlRUVTMvRGxTQkZNMHlyelMxeTBXTHlJQ09UODI4dmdjcEY0K2VO?=
 =?utf-8?B?SGhXNUxkY3RiZGJUR2lWazIvN3ZGTWhqS3NjWkF3MWNxc1o0M3UrTG1DY3Fu?=
 =?utf-8?B?RXR2eGlZb1VWeitCdHRnS2NQOHo3OVQ0SUdFNkpZSUVzc25tL3lSeFB5enVh?=
 =?utf-8?B?RE1aSi9lMk40MGNFaUJPL2dPUjlFTjVhZlNBbmZWcGJjUkE1bXVhYmZqWDQ5?=
 =?utf-8?B?TldhWllwNmNQSmI4ZjFKOExxK09IVXpwZmRGK2t3cHJzQi9qQmRMTVVNaGkz?=
 =?utf-8?B?MmZ6UUtkblJuREtzT0UwdmFQMHRId2ZFaFA1NjNTMWMwQWlEOTFVcXgrUldx?=
 =?utf-8?B?UE9NbTVRR0RQVDBNRkRvUzlYRVVPdk5PL05EUEt4ZGh3aEJ5QVJVZWZVUGpC?=
 =?utf-8?B?M2kweUFKRW1XRHlXbmo1OFFDMXRKOXJXamdvSVJyNGVkRGhTbzhhOVY3clhw?=
 =?utf-8?B?Mm1wNmQyWFlTblVIQWNlelFyN3NRZDg3SmZ4a2ZYTmkrT3pIUk8wekRTcGx4?=
 =?utf-8?B?MVBBZUNSeXVuQ0dEaFh0MkExMlN2VUJSMkJKcGtLQVJMeTNncnd5bVVER3RH?=
 =?utf-8?B?Ykk5Vk1meW5sTks5VzJQVEZYZmhJekt3NVhkcVhjTFM0QSt3K3R1NXZTQXk4?=
 =?utf-8?B?UHQ0aWhXcnlleDR4VkJyUEM2OU9CK09LVEFZVTZZamQzcWx6M29sRmR3aDlI?=
 =?utf-8?B?cWFXb1F1K3ozRFBvRTREcDdKZnBFcVBnRUVxVDg1b1lzQ3JPNXJaVFZOaTJa?=
 =?utf-8?B?MEdnMjJib0tiMjVLTHNoa2NDc1BrQzZ1NnJ1NmJKL0NndUhFRlI1cjhDNnor?=
 =?utf-8?B?KzNkQTh1UjJYWEk4QzFkUXB3V0NXSzB0eHNnaFhMdFdtRHprNWxhK1RVVlI5?=
 =?utf-8?B?VHRVMmdNdUxHZk1iSW5RZmVSZGJ3NDZGVWhodjZOdEh1RHFXTncrTlVyZXpj?=
 =?utf-8?B?cHJhOW91RWFCdUFJYnBTV2NKQVpMWWZqY3ZkMjJ1STduazdIY3ZRMUFzYjR6?=
 =?utf-8?B?NmZ6blF1anlSYWxHeHdaOTdaK2VDZTY3enM3MldidkluT08wb0pob0FtMENk?=
 =?utf-8?B?UmZ3ZHViaitmZStJRVFRZ2d1d2wyZXpJY2lxb0N6Sk4xYkFlb0ppUlNZdm9B?=
 =?utf-8?B?V2hYb2pjdEFTTDNCYjd4NkswOVdheFVZejVWK1ZZM0NsaHRvY2xFcnhLYXd1?=
 =?utf-8?B?NGFLeVh5bmRDS3ZlQVdhbGVHa3BNZ0VjN21sbmhHeVlsd3NGMVNzaHNwMG4v?=
 =?utf-8?B?Wi9YYVVhY0dncUhXaXk1bjgrQWQwVDFlSGZxSzNBRmlwd0JONnN5WE9aK08r?=
 =?utf-8?B?YmI2clFMeWlnYXdhTjNkZHd3bVRnU2tmYnlmR0M4bVlFMVhqNkh4aVhoUVNG?=
 =?utf-8?B?MUtFQ1RnV0tvOGRIWUJBMUdhOHhuck9vY2JQK2NFdGk4TkZQem11RmlXMjNs?=
 =?utf-8?B?YnNlVkk1MEE4NFI2NVJndnM4QURUbDBWWUV2aEE5U1JTZmswd1NGMUlLbUxI?=
 =?utf-8?B?bTdZcy96Y2pwSmRvSlhYRmwzSWlFQkxRcVNQWE9UbjBSMHZyWXlFOVd2ZDZN?=
 =?utf-8?B?YURyOXdpMFBBV2dNVU01c1U5YkhBcFRGKzVjOHBWMzZQYm9tNmpQSS9FK1Rp?=
 =?utf-8?B?TGZ4RHJ5YWh2eXQ3VWluc1MzQ0lkOVlSRTgwZGEvTXdUUTBHajFzUT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f22bf44-dad3-493c-77ef-08de5f483776
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 15:08:11.0765 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vN1l1G9O0GJ1wJ5BzmIDTsFfNztgtW4885bv9MLOMdUs4Zad9kmLVeSw2jiKQ5AmX58td9j4BudiWkf87XGXFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6333
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

Hi Kamil,

Thank you for the review. Will fix these during merge.

Thanks and Regards,
Karthik.B.S

On 1/29/2026 8:04 PM, Kamil Konieczny wrote:
> Hi Karthik,
> On 2026-01-21 at 10:51:58 +0530, Karthik B S wrote:
>
> add 'intel/' after 'test/' in subject:
>
> [PATCH i-g-t] tests/intel/kms_flip_scaled_crc: Move require checks at the beginning of the subtest
>
>> Previously, setup_fb() contained the igt_require() for format + modifier,
>> causing the dynamic test to be intialized only to skip eventually if the
> s/intialized/initialized/
>
>> combination is unsupported.
>> This patch moves format/modifier checks to the per-subtest level.
>>
>> Additionally, linear framebuffers combined with REFLECT_X rotation are
>> not supported on Intel platforms prior to gen35. To make this explicit and
>> reduce CI run time, the test now performs an early skip for this
>> combination, clearly stating the reason in the skip message.
> +cc Jeevan B <jeevan.b@intel.com>
>
>> Signed-off-by: Karthik B S <karthik.b.s@intel.com>
>> ---
>>   tests/intel/kms_flip_scaled_crc.c | 15 ++++++++++++---
>>   1 file changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/tests/intel/kms_flip_scaled_crc.c b/tests/intel/kms_flip_scaled_crc.c
>> index 954b46b5f..91e5793f4 100644
>> --- a/tests/intel/kms_flip_scaled_crc.c
>> +++ b/tests/intel/kms_flip_scaled_crc.c
>> @@ -670,9 +670,6 @@ const struct {
>>   static void setup_fb(data_t *data, struct igt_fb *newfb, uint32_t width,
>>   		     uint32_t height, uint64_t format, uint64_t modifier)
>>   {
>> -	igt_require(igt_display_has_format_mod(&data->display, format,
>> -					       modifier));
>> -
>>   	igt_create_color_fb(data->drm_fd, width, height,
>>   			    format, modifier, 0, 1, 0, newfb);
>>   }
>> @@ -901,6 +898,18 @@ int igt_main()
>>   	for (int index = 0; index < ARRAY_SIZE(flip_scenario_test); index++) {
>>   		igt_describe(flip_scenario_test[index].describe);
>>   		igt_subtest_with_dynamic(flip_scenario_test[index].name) {
>> +			igt_require(igt_display_has_format_mod(&data.display,
>> +							       flip_scenario_test[index].firstformat,
>> +							       flip_scenario_test[index].firstmodifier));
>> +			igt_require(igt_display_has_format_mod(&data.display,
>> +							       flip_scenario_test[index].secondformat,
>> +							       flip_scenario_test[index].secondmodifier));
>> +
>> +			if(flip_scenario_test[index].secondmodifier == DRM_FORMAT_MOD_LINEAR &&
> Add space after 'if':
> 			if (flip_scenario_test[index].secondmodifier == DRM_FORMAT_MOD_LINEAR &&
>
>> +			   flip_scenario_test[index].secondrotation & IGT_REFLECT_X)
>> +				igt_require_f(data.gen >= 35,
>> +					      "Linear fb with REFLECT_X unsupported");
> Add newline at end of message:
> "Linear fb with REFLECT_X unsupported\n");
>
> Without it in report there is:
>
> Linear fb with REFLECT_X unsupportedSubtest flip-P016-linear-to-P016-linear-reflect-x: SKIP (0.000s)
>
> Regards,
> Kamil
>
>> +
>>   			free_fbs(&data);
>>   			for_each_pipe(&data.display, pipe) {
>>   				bool found = false;
>> -- 
>> 2.43.0
>>
