Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E82CA0EE0
	for <igt-dev@archiver.kernel.org>; Wed, 13 Aug 2025 13:02:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A40B10E710;
	Wed, 13 Aug 2025 13:02:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B/C9BiN+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F02C110E70C
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Aug 2025 13:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755090129; x=1786626129;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zY9vFEoDHihgZW5LIWZCmBEeT/c4snPOOT3YIn68dYc=;
 b=B/C9BiN+8+CO068RuZuQGSYuPzOJMCA+69r+cyNeYSNv//5ytuy9Nizo
 VEFk8eq6W3ZNfjGHMUhKgSV74FvokjHGOcJW2IaFo4O7Hx/MI1YfLx086
 LWb87qRNnVEJSo9bYW1fLOmOQTdLIk88YexDnATUWSBpnAwWQ85RDPmhO
 RFF+3Zi4uxYyr0+qGWS51cE8yUkH20yuWaPMNMQzkiNo9fsAEojbyINze
 8XxOC0pBqjB3LTVfH4VEjMiEyvHpZowOAST8/Tv8dJFXsn2a4lHN/sNsA
 inyJvAo65n96qmvPWPwz5GDsKFaqWvzGfLWNkyobRZikvRbQkoBfqBko4 g==;
X-CSE-ConnectionGUID: 8Z75T6zOQQ+KcGCG+zu4hQ==
X-CSE-MsgGUID: RuysolZaTVGTFEvo8CJ/bA==
X-IronPort-AV: E=McAfee;i="6800,10657,11520"; a="57283895"
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="57283895"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 06:01:53 -0700
X-CSE-ConnectionGUID: 4TH29SaLS5aCr0+NY2//WA==
X-CSE-MsgGUID: NLj2dVpCS6Gr/IqgJHUsqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,285,1747724400"; d="scan'208";a="166449354"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2025 06:01:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 13 Aug 2025 06:01:53 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 13 Aug 2025 06:01:53 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.68)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 13 Aug 2025 06:01:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SPJVW1zTIdubKk2mf6y3JNe/+aNFP6oxHymvhPWuMEPIFgHcjCdYzOKVorPRzhB8jBGzPzG1ozKvlK4lsS4kNc/5uOfni71q9OwBW06IKyPxs8PLkIZ+kxcVoE3gF5XgBe4tlTSeFq3JbxCM/VfLjUgZ54SrbhEb/rWJM12kYLIAGpJaUFViNjM9SSyGd09bp8OWDbSt7MPDduV/Q6UYDKSLpQ5Q7K1rLgR9KmGtY7eDw+efDcJHb/7WOX3SlunheIFKNqtOfLCjGaWc/4uF2FejmVr/fcn1lmg7MDGJFdW1ppinjeOzP31HLE4DhEPraubixtJuElJ6RrIGv5peLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HfuM/CSNdyRMQOFEkEjjnnaaV2/T/H1bff1Hc4aCPHw=;
 b=lcA3w+u/eok+B8cQHsbdi/tXfJeKf80xCcNZzjH/52LN0BQeaGP4+K8YmHF5bdrG1jmuLgcEq9+0objnhDYs19h/URBm2FaVz3BeCV/vXgWKYgQnaco9DI4OVkYnfJoW/MwWXOYBHkYQ1dFczuo9V778k5TGjYRMrZt9TOOBwvqKcsUleAnBxsK9ZL8rnAbV+ONIbscErXaQ0ew19tCsSu/fdLP5BlIDbHAc3g8Bd711E9uGTNOiSDrGrvTmE9CLHZBm5hG2//mW7rnCDmgZfylbkyftpW1MYvfYUXMaiggyjXnl5s/V0E0c8d1ph/wUE7h+Mb0WdW0l45riKfu4EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5979.namprd11.prod.outlook.com (2603:10b6:208:386::9)
 by DM4PR11MB5993.namprd11.prod.outlook.com (2603:10b6:8:5c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 13:01:49 +0000
Received: from BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372]) by BL1PR11MB5979.namprd11.prod.outlook.com
 ([fe80::b0f6:fbc:94be:2372%4]) with mapi id 15.20.9031.014; Wed, 13 Aug 2025
 13:01:49 +0000
Message-ID: <aac2592f-b4a0-4e88-894c-e076b2383118@intel.com>
Date: Wed, 13 Aug 2025 18:31:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/intel-ci/xe.bmg.display.blocklist: update bmg
 blocklist
To: Kunal Joshi <kunal1.joshi@intel.com>, <igt-dev@lists.freedesktop.org>
CC: Karthik B S <karthik.b.s@intel.com>, Jari Tahvanainen
 <jari.tahvanainen@intel.com>
References: <20250704053801.230707-1-kunal1.joshi@intel.com>
Content-Language: en-US
From: "Sharma, Swati2" <swati2.sharma@intel.com>
In-Reply-To: <20250704053801.230707-1-kunal1.joshi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0059.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:270::10) To BL1PR11MB5979.namprd11.prod.outlook.com
 (2603:10b6:208:386::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5979:EE_|DM4PR11MB5993:EE_
X-MS-Office365-Filtering-Correlation-Id: 409a580c-29e6-492c-464b-08ddda699088
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WU5SNWxMOTBsWFA3eUxXWjEzQkdRU2RzR1NzdStaNUR3eEd4ZnVhSGg5TEEr?=
 =?utf-8?B?aVNjN0x5SzVvSHp4enZpeERXS1BQU0cyQVlGNytpQlZvM2lOYlMrb2xqSEpX?=
 =?utf-8?B?SnYrK0UxYkZIYTRJMFpYcmVFTitvb2ZVdlRaRmtLQjJXRjlKVlY1aUhXNGtX?=
 =?utf-8?B?anRVWUxrTktNYldTazNGZVZ2MHlpZHlCMkdRM3dQc1NiYkcxN3l0ejhuZEZx?=
 =?utf-8?B?aTVDMkR4TXJ5YkhHZUNrcUU4MWZQTU01alFIZXFKL2kwN1lEVHh0Tnc4NkJl?=
 =?utf-8?B?bnhxZ0I1MnoxeWtsMXRnY2JqblBUT2sxUjBLSmNNV1BZWVNyT2FvUS80dlhX?=
 =?utf-8?B?a3JzSDAxWS9CN3c5OWN3bVZUNzZhbGdCUVBjVWFsSmdUYVl4OUowR0crYW9k?=
 =?utf-8?B?T0QxYkgyaWVyMThjN0ZoeVRvMEhoMHlmV2JBWEU0bTRWM3FSbkdNVi9NZVpv?=
 =?utf-8?B?eHkwMzBpN3FXbTMxcmU3M0NNS1V0QUwrb28wOWlpQ3NBQ2srZUtOSjdMRkxO?=
 =?utf-8?B?d2FQTUx2MlpxZ1VoQ1AzdFY0SzU3RUxvNk5JYlJjTmlZSk43YXN5ZUs2aXZI?=
 =?utf-8?B?ZkJndG9NdEZodXhkQWFCZVQ1MjZYRWdBd25PQkw3dTd1ZGR1N0RxVXdkL2tL?=
 =?utf-8?B?d2ZHZVNGR084cEJ3L0phODJLSUVMOG0wZC8yZ3o2RTlIaXdmaStSZXk2Y2o5?=
 =?utf-8?B?QkZkZmtFdUljQjJlckhqcVZnSjMyejgyVlNGYWlUbDVCTng5U0RUQldvbGRr?=
 =?utf-8?B?RDIvaTE3VjdnYTN2R0FkR0ovQVg3N0RlTE1aUHB2YlNsZ3k1bER1WENYanli?=
 =?utf-8?B?dUlOWENzUUZDQ0YvN0ZRNTZJM2pqS1M1S1kyZ2lhUjZwTW9FTWNnSjg1V1FW?=
 =?utf-8?B?R2duZ1lndDFPeU9SQUNjanJBZVNDWlphZU1KR3hhV1NMRVJVb0ltemNycm4w?=
 =?utf-8?B?eEhSeU1lYlpvM2J2Y1MvdDBLZ05pUHl4ZnJZRHk0cmcwaVhLb2gyQ2VXQVhp?=
 =?utf-8?B?V3o4eUpFdVREcmJESm5lVHdRY0dXaU95YUhvZGdOZFExdFJrMWgxcWdEV1U2?=
 =?utf-8?B?V2NCUjZDckUxNDd5ZHZLZDhCZjVnY1dQcUV3YW0ycUoxalJhZ1k4M2N1bU9J?=
 =?utf-8?B?dERNNTB0RnlnRU4vVitlT3BMUEY0dnZTcHdzRjNOZUV2bEZaRVZ5OWk2NC8r?=
 =?utf-8?B?dnBnSi9QWmZ4aS94SHcvdHFlQ3RQaWZFMzcwMnBDUWROSEF2Y0JtOHdkYys1?=
 =?utf-8?B?YmVHVFR6OXNXSCsvaWNlM3RQZ1U1RGYyZE1qZlRrdGd5dDlNdUpqVDdXb1lT?=
 =?utf-8?B?WDlOVEkwalg4S3JDdWN0MHFKY1l2TE95ODdOM0RBbis1cjhHMHY4NjBWNjRv?=
 =?utf-8?B?anBRdkJTZTBkaWIvMlBMVXRGWG9ETnRYWUhOOHpJQVU0YldjWjdxYnJ2UGhV?=
 =?utf-8?B?RTNkY2h3NTdkUWdtUEkweVNjaWlhbHNGTjU2T1hYQ2FueS9uMlJoNHhVREI1?=
 =?utf-8?B?NHkrckZZNHVhR01LdGRiODhVUGNLejVRbmtqeDU3R1JjUzdlTXQzODhRSmRW?=
 =?utf-8?B?MFZtYUJnZC8yb1haN1dIeFlyVmpHa2xOeFp3MFpIUW85WEVEai82NDFMWDJK?=
 =?utf-8?B?b3ZEdlYrT3ZRRG44SEpMMFVmcHdGdWFVdm4vOTNML0xMeTYxWUVJc1ZZWTBJ?=
 =?utf-8?B?S2ozYmxBN2J3S2lxNEMrdU90YzBKZXgrUlZHMW1XQkFnbkszY0RHdTNGaXd2?=
 =?utf-8?B?N2NyNlQvK255M0hxMms3N2d2SVZsVVpCeGt3enlTOCtXcURTcjc1ZVh4UEtR?=
 =?utf-8?B?dzNDejlYdE9NL3JCeU5BYWU0TC9seGRNL2d0OG5xbmY4dStGZzFVMStML2gw?=
 =?utf-8?Q?WPv5OftJzXKW3?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5979.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjZ4cHYrNVpzVjZJT2lUQW0yZGhQZzJBRU83c2d5YVFKWGZXV2xyb0E2eTZR?=
 =?utf-8?B?TWVqTlNvN0VkMlpia2I5V2phMGoxeVQ1ZFlNSmd1RXRCQTk5V1RzT0JiVUt2?=
 =?utf-8?B?bGJuRWdkdnk3Nk8wOG80OVhCaTBkVEx2amZ1VG1jUWZWWmhIWlZIMGVLWmor?=
 =?utf-8?B?UHFyVlY3RVZLRVhjYmlsVHpsTkVFdXhEUFBiM2lhMllwbThvTUZLREZ6NnBG?=
 =?utf-8?B?cVhXcExYT1JZeExQL1N0OWxIbEtEbXlvTkxlbzdIQVUwM1Z0T1FuMjZ1aW50?=
 =?utf-8?B?b05Ed3VGN3NFakx5YjEyTmdvNGgvdTR6WjJaMU52MlpCZ2M0d1F6TWxFUUh2?=
 =?utf-8?B?RDZONmorR20wa2VacURlb3kvS0dzaW0zbFpadlNVQkFVTGtMS25LVWozNGJ2?=
 =?utf-8?B?R3hpMmZPZVVjM0NOZnFiMnlmZmRSNkl1OWhUWHRzalEzSjFnUHpXOU44RkZX?=
 =?utf-8?B?WTdhdk1oVVRVdGVRbFR4SjQ3VjdPR0g0NkNOVy9ONWhWMXdVYXltSmxXMHBL?=
 =?utf-8?B?Z2FhWFNJOG1PZERoTXZrVU5JaHdmQkc2ZGlRTjlWWm9jNVQ2dThwOCtzdDh5?=
 =?utf-8?B?Q2dWYVY1aXNjTXo4cXM3Sm5ranB5eGJPalFaNjU3cUpUejRZLzNXaVBXdGsz?=
 =?utf-8?B?MkFvNVprWmdKMk5yaTlhYmpxSkZQalNEdFY4TStZYSt2SUlYRlJtSm9XanV1?=
 =?utf-8?B?VG9lYXY4YnRhZ05CRy92OStGRG9IZUdzVUlZQlZ2a00zM0ltdGRET1pVMTNS?=
 =?utf-8?B?OXJ5UHpXM2k0cUVmQU1ld2pPZzY0NjBHSjNuRmxycGliT1pOZUxMdmdWcW1o?=
 =?utf-8?B?M0pFTXdZQVhTMERwdzV2MWRGTzRyUTU4WVVwOVg2OHRYbHlDVC9FMzMvdjhJ?=
 =?utf-8?B?bkNNamUzSEJVUXRaamNueDFIRkZoR0NtMk91OUFIRHIyR0lkUitGcmxxSHdq?=
 =?utf-8?B?M0FXZzhzQW4zdmlDS2ZwUkRza0FPSjdTL2FXK3RsaW1xTFNLNkg0dVpsaG0w?=
 =?utf-8?B?MkFaVUZHWUk4bkthRXNRMjk5VWdPemJJNWNnVkRvekd2R0s2MnFPSGlWRFJP?=
 =?utf-8?B?OElOK1FIV1QvNlFWNk1rc1hQZzFzUkk5RHdxR25ZUzN0TnRueDZRSnVvWmMy?=
 =?utf-8?B?MWloOGpsYzBJVlpZZzdScnF2UlFIdDQyODl3ZThxVHRVT0tRZmFvUEg1U2Zx?=
 =?utf-8?B?TU00WDRobUkvb3lEcGI1MlhDeFJlTkcrOXFmeU5BZThVbXZIVWJTbktLbGM5?=
 =?utf-8?B?TzFPMjNrbzVHNWtpOUhPZE9uaWlrWlZyOUFsbDBpUUFYZVNMYjRRMXo4SFhn?=
 =?utf-8?B?bUlpUHdxcEZnWU9wNnlDY3g1QmpISXh0V1pMaE8zK3MzQkNVdHMzV3RxNUdT?=
 =?utf-8?B?amlzK2c3VkgvVmRPMkRiVEtQTmVBWVZCY3Z6ME1HQjhDaTROTkRmcm5MdnZm?=
 =?utf-8?B?Y2RSWTJFZHJaMG5RdFlLaklYUUs1azMwRG42RTNVT2ZVUHhyYXF3eHBocm5v?=
 =?utf-8?B?dTJheWhsNVBDekxkYnN5Q0RFNFpLOXVrLzdZZ05VeFA3MVNndmEyL2VrYTBr?=
 =?utf-8?B?dkpKcDlVZVdPbnBQODIwZ0srY2RUTG96RE5NNTdyOHVSQ0VvTUdGanBEY0VE?=
 =?utf-8?B?NmdnOCsydmxseVlkMDZSOC95clZyWXdDTTRVT3JVQ0lBT0RzWUxrK3RyZ0pv?=
 =?utf-8?B?V3gxUFpZcHErZHdVelJIYUxZeFZ0dFJTSzkrdjg3VUt1S2tGL2xtMjlNWEJT?=
 =?utf-8?B?b2NrSExxb3VtUFQvWVQxREk4WlJMT1pKWEI2OWFPUExKVmJpVlpPMXgxQVli?=
 =?utf-8?B?ZHgxQjltN2hhd0ViZlpBUGEzT0pCeTZVTnpsYlU3dDA3Q2dyaXJMK0xxTEJy?=
 =?utf-8?B?T0dNeUdVeU1Ic2ZtWTVaU05LZlRxVnVNUWZUanRMMnNXanJtdVJwdUN5UERP?=
 =?utf-8?B?WHVWcEl4Y3N3KzdPaFlhWWpDcy9LWWcxVUJhTzRjN1Rxd1RTSTVGN3UxVHFO?=
 =?utf-8?B?aTBpdWhtSDVYNHVQaGJwdWxQeFF4TEpPOGVqYXBEaEtrWkNpL3NnUkV6WVpX?=
 =?utf-8?B?cllMWEd4cjZaUStZRTBncEI2MGw0Zjk2c3RPbXFmaGZ3bGZ4blQ0Vzc5QWVS?=
 =?utf-8?B?L1RDRUNSbzN1MzUra3p2b3ZOcXozbHVtNkRYeGEvUVpFeGcwNEZNemUzUDJC?=
 =?utf-8?B?MWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 409a580c-29e6-492c-464b-08ddda699088
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5979.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 13:01:48.9359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6fYUY68q/GVn98YPmkJ/jcMjzoMssgPT8W5foyoc79dGq1ZBhzAJ62f05WZ6mTP2K2/Pf3WH23iB68Qmc1NNMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5993
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

Hi Kunal,

Firstly, update subject :
     intel-ci: Update BMG KMS blocklist

On 04-07-2025 11:08 am, Kunal Joshi wrote:
> update bmg blocklist with unsupported
> or tests which are expected to skip
s/unsupported/unsupported tests
>
> Cc: Karthik B S <karthik.b.s@intel.com>
> Cc: Swati Sharma <swati2.sharma@intel.com>
> Signed-off-by: Kunal Joshi <kunal1.joshi@intel.com>
> Signed-off-by: Jari Tahvanainen <jari.tahvanainen@intel.com>
> ---
>   tests/intel-ci/xe.bmg.display.blocklist.txt | 25 ++++++++++++++++++---
>   1 file changed, 22 insertions(+), 3 deletions(-)
>
> diff --git a/tests/intel-ci/xe.bmg.display.blocklist.txt b/tests/intel-ci/xe.bmg.display.blocklist.txt
> index f145d6c0d..d315ca1a0 100644
> --- a/tests/intel-ci/xe.bmg.display.blocklist.txt
> +++ b/tests/intel-ci/xe.bmg.display.blocklist.txt
> @@ -9,8 +9,9 @@ igt@(?!.*kms|testdisplay|.*display-vs-wb-transient)(.*)
>   igt@kms_(big_fb|ccs|rotation_crc)@.*(y|yf)-(tiled|tile).*
>   igt@kms_(plane_lowres|frontbuffer_tracking|plane_multiple)@.*tiling-y.*
>   igt@kms_flip_scaled_crc@.*(yf|y)tile.*
> -igt@kms_async_flips@invalid-async-flip
> +igt@kms_async_flips@invalid-async-flip.*
Since https://patchwork.freedesktop.org/series/151648/ is merged, we 
should be able to run these tests now.
>   igt@kms_addfb_basic@addfb25-y-tiled-small-legacy
> +igt@kms_pipe_stress@.*ytiled$
>   #########################################
>   # Valid skip :- 90/270 rotation is not supported
>   ##########################################
> @@ -61,6 +62,14 @@ igt@kms_cursor_crc@cursor-(offscreen|onscreen|random|rapid-movement|sliding)-512
>   # Valid skip as BMG doesn't have eDP supported
>   ##########################################
>   igt@kms_vrr@seamless-rr-switch-vrr
> +igt@kms_vrr@cmrr.*
> +igt@kms_atomic_transition@.*-internal-panels$
> +igt@.*psr.*
> +igt@kms_pm_backlight@.*
> +igt@kms_pm_power_saving@.*
> +igt@kms_scaling_modes@.*
> +igt@kms_panel_fitting@.*
> +igt@.*@.*(?!no-)drrs.*
>   #########################################
>   # no VGA connectors in BMG
>   #########################################
> @@ -71,6 +80,7 @@ igt@.*chamelium.*vga.*
>   igt@kms_content_protection@content-type-change
>   igt@kms_content_protection@lic-type-1
>   igt@kms_content_protection@type1
> +igt@kms_content_protection@mei-interface
>   #########################################
>   # Expected skip as BMG doesn't have PORT_A/B
>   #########################################
> @@ -88,6 +98,7 @@ igt@kms_getfb@getfb-reject-ccs
>   # Expected skip for graphics ver >= 20
>   #########################################
>   igt@kms_getfb@getfb2-accept-ccs
> +igt@kms_vrr@lobf
>   ##########################################
>   # Valid skip :- Feature is not enabled on kernel
>   ##########################################
> @@ -97,13 +108,17 @@ igt@kms_writeback@.*
>   #########################################
>   igt@kms_pm_dc@deep-pkgc
>   igt@kms_pm_dc@dc6-dpms
> -
> +#########################################
> +# Valid skip :- BMG has only one cdclk (WA)
> +#########################################
> +igt@kms_cdclk@.*
>   ##########################################
> -# Valid skip :- DG2 & MTL specific
> +# Valid skip :- DG2 & MTL & LNL specific
>   ##########################################
>   igt@kms_ccs@.*-dg2-.*
>   igt@kms_ccs@.*-mtl-.*
>   igt@kms_flip_scaled_crc@.*dg2rcccs.*
> +igt@kms_ccs@.*-lnl-.*
>   ##########################################
>   # Valid skip :- Simulation specific
>   ##########################################
> @@ -156,3 +171,7 @@ igt@kms_bw@linear-tiling-.*-display.*
>   #########################################
>   igt@kms_big_fb@linear-max-hw-stride.*hflip
>   #########################################
> +# Valid skip : intel_display_ver(data.devid) >= 30
Add - after :
> +#########################################
> +igt@kms_pm_dc@dc5-retention-flops$
> +#########################################

