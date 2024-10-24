Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201F0D0BB65
	for <igt-dev@archiver.kernel.org>; Thu, 24 Oct 2024 06:53:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3F210E8B6;
	Thu, 24 Oct 2024 06:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QRli7Vef";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01A2010E8B6
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2024 06:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729752831; x=1761288831;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Y4mA92DX7qHzQCTIGhjeK76oeFMgHEVlMq4vkAmue44=;
 b=QRli7VefTgdTkNjbEnilovkch9BXO9VuSe9w/YKa0tmG3XlcTPsbtXGj
 pTYIJa98SI67aLYEYc91OmSxHsOJwGmjP8GT8GV3JOCTiWX6Hka0G6Tqk
 15jwUB6IpLW/Am2tK22gDbo07EbOotN8Qtbrq1NboZmDdBjQrAMBMzZiL
 4ByWgwLMC8v0ZSfUUFlif1JW4PzwUbpL8CLg/TGafZFg+iF09cn8tjkOn
 NcdmR7K1eC/fN3Neg6C8Q9KN6TGno3p6PvI085/Mb25cqcvgu26OGNXoO
 4umFdSX1+/fC3+El05qbmjsHvIEZMUnCZOYPKvyeSJJHNYeIV3ZrYE93w A==;
X-CSE-ConnectionGUID: RhhsBr94Taye1JDYKZMSIQ==
X-CSE-MsgGUID: MkdNOzf5T7OIBg5hzsmf5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39910597"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39910597"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 23:53:50 -0700
X-CSE-ConnectionGUID: rVcUJWu5SVq/Y/Dsubz3sg==
X-CSE-MsgGUID: ffsdFRZ5SHOPRjC9NVTlMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,228,1725346800"; d="scan'208";a="80599126"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Oct 2024 23:53:50 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 23 Oct 2024 23:53:48 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 23 Oct 2024 23:53:48 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 23:53:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzN67rOm0MONQkLdVjgQ20BuAbqhxUJZsU85Iof0HJYyCyX5tRSi6Euu3v0GAretF2BjrAEcSRm6qyvpQj2t8Fmj4Auz4rJhdPRsD6vCQdlGkoL5O8Me+seClKuU8Gpqgc3Z+PgyGNT1EOVGlfVIHlisp172zHYEooIbstMGq75XyjVk1YNbgKsxfspXKG7UKSNQuSQ7tnbvS3EtUd5UnWhts9fQKUCGAzeM8soA9rwhNeE1cThV+0Q8zc2ktXnIOuVVWGtJ7YaL78Kj6UZOi63U4ny1tsagyeTpOPTsMrP2GwbEbup5GAEB+zbM6s38b6y56ORfX4QRmLk7jFhmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+pWXBTdcPfis50PwPSGh787bnUneLCP5h22QwoFkVI=;
 b=HrlSH9IzZVNaRuGO8EFMxlYt2KSLKfdicW0EGflRZQns91ocTi8dNNhVJHig4XAKeT0YHy1euKP+MbqodNkrr6lyfMX4optZW9AU4SChIijm3f60sg+jvpfAW/xlZCVPmdYW/UjGwbncCVC1X0m4JG/4Zoe3ecNySXN+60wwqV+4wilDDh4J9NiZqi7pCVKuzy1L4SuoHMWzy/wJDSfErYia5myw+m4ZCvXPperKVKTfHT5ImSnfs1GvO7PsWLTXCM/pefwyIpsuJ7hup/+4HXloTDMFUXQSdS1Up+7W+X9gCfqgVPpcLKQhJix8giCcM3jQavpCgWRF1+ktQ+mWhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB2704.namprd11.prod.outlook.com (2603:10b6:805:53::11)
 by MW4PR11MB6886.namprd11.prod.outlook.com (2603:10b6:303:224::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Thu, 24 Oct
 2024 06:53:45 +0000
Received: from SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5]) by SN6PR11MB2704.namprd11.prod.outlook.com
 ([fe80::513d:aaea:b097:afb5%6]) with mapi id 15.20.8069.027; Thu, 24 Oct 2024
 06:53:45 +0000
Message-ID: <87759209-e404-45a3-9d56-29e0032ed9de@intel.com>
Date: Thu, 24 Oct 2024 12:23:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t v4 1/3] lib/igt_kms: Move backlight read and write
 to lib
To: "Thasleem, Mohammed" <mohammed.thasleem@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <bhanuprakash.modem@intel.com>, <suraj.kandpal@intel.com>,
 <pranay.samala@intel.com>
References: <20241024045212.1697869-1-santhosh.reddy.guddati@intel.com>
 <20241024045212.1697869-2-santhosh.reddy.guddati@intel.com>
 <bbc2c90d-814d-44c9-937c-c9125fc25c4c@intel.com>
Content-Language: en-US
From: "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>
In-Reply-To: <bbc2c90d-814d-44c9-937c-c9125fc25c4c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0005.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:80::22) To SN6PR11MB2704.namprd11.prod.outlook.com
 (2603:10b6:805:53::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB2704:EE_|MW4PR11MB6886:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f91425-381a-43e6-4544-08dcf3f89ac2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OUg5QmRneThGc3FXazR1K2lXSTA3emNrc3lUZ0NEUWpndzhialdaZkNpeDU2?=
 =?utf-8?B?ZmhNRVpaQ0s2cmw5MFFzNE10dU5IT2JRL1I0L2hta2tlRnBjUDgyS2ZkQ05u?=
 =?utf-8?B?RUxib2ROQXpDYzR6K3RSbmREeU1FdjlKZi9MR2t6OWtIbW51TWNCUmRsTGRN?=
 =?utf-8?B?MHpYR2c2MWJaNk92bGU1WmdnV29yRVA2eDNCSzU1a3pjSHRRUnpzY00veSs0?=
 =?utf-8?B?SHFKOVNvNkhnNFBFSU9ZVjNXK3lXNG5USnZqbmkyNDBDVWJGemxGbXVldjZk?=
 =?utf-8?B?Z3ZhVDlHMUdMYkw3MzNnbVVUOG1GRVJ4VUJYb0RkNDhaMy8yZ0tXSUdCZWJD?=
 =?utf-8?B?MnVzazJBakt6MzBDdFhqK2E2akNZa1ZteWR3SC85RFpTaVVvNUhNL0R1Rlc5?=
 =?utf-8?B?eFJORDlsSlVXTmhwdEs0ZW5SSU5TcGZiR0VHb3dVT2pDby9TUUZLUEcrTUxB?=
 =?utf-8?B?cW41NUNpbjFlZXM1ckZBUDZlbU9zVm5uT3RQbGVHSnZ4WDFlc05uNGN0V3JH?=
 =?utf-8?B?dkV6MHhSSTIxTFNsNnFRKzR2NjR4S2tjSzVwcTRKV2VsbnVsSUIrM3BsTWFT?=
 =?utf-8?B?UncvVjUvS2NtWTlSNzdId1Jhbi9RZC9HVkdISmFUNVlBcUs5OU5GaXE3cS9p?=
 =?utf-8?B?UVlWZy8xekRveFUydE9GQnM2OUJnRXV1ZzZ6enppVU9RL1F0SlRORWFLWmVB?=
 =?utf-8?B?QkxOWHRHaW9PcW80bzk0Uk5iNzlDTGl3b3d0NlNPZDJpSU1iSStOVWptc1oy?=
 =?utf-8?B?RVZGSmVVQWVKaURwN1Q3c1ZRc2Jla3VWMmt2Y1o5UUYvL2VGL2RVYUdHc29M?=
 =?utf-8?B?dUVRTTBKbjl4NW1penQrd1hhMTdRdEt6bVc5aDN0Zi9XRHJ3czF2MllIZVZk?=
 =?utf-8?B?cnBrMTFCeTlnS05LUWxNcDZvQW9kMEhYeEcwdUVqb2NnKzNHbm9xdXJRYVhi?=
 =?utf-8?B?Q3ZvVzFJUlhDZjMwNUpMa0p3YlFoTG85RUdIaHQxaXE2U0pRc2hyTmFCdjdV?=
 =?utf-8?B?a1RaNVBCNjZDUGNpQTcvRHY1OFBQaTJYMitjdzlvdGNNc2x5Ykx1RXZCQ21l?=
 =?utf-8?B?ZWdjQklPeGRkRlc5YnZpclRPdjE2VlArWjUxc0RKT0dOSEZZdFUxUzAveGRK?=
 =?utf-8?B?SnVYZ1VxTzZqUE9lNVZTT3loNGYybTJ4aGQrZEdPZlZMMjdvbldGdnoxd3Iy?=
 =?utf-8?B?TXhwaWh6akhlc3FtWnZjK2ZYOFkzcDBUMnNFWWhiRkN6ODM0TmlXcHZUN25Q?=
 =?utf-8?B?UHJ6em9yRFgzVFdGL0toaXhPU1N5R2IydDI3b09lZENLb2lyOWo3Slk2Z0xG?=
 =?utf-8?B?SGx3OEV0ekE4RVg4VFJ0WUowRzFUbGdkQmFmUDc4dDBGUlZKb0hycE9vNXhV?=
 =?utf-8?B?MnR0Y212SEtENkpXb3lEbWxMMisvbmg1M2NWcENWL2VkbXZyQ2ZRVzFWb0JH?=
 =?utf-8?B?YnBBZlVITlJhWTlMRTFlZkcydkNCYUdWQTlNYVpmT0xRckw2S2szNm1RL01j?=
 =?utf-8?B?NXh2SmIvd3pxYURNM2swaWwzYkZNSk8zcXMwcDNXZit1N25qb0dPNmk4QnJ0?=
 =?utf-8?B?VzlubkZ6cWcxbis3akdJL3VmcE51T1dWUkpONmR4VXEvSVp2Q0ttRXF6YXhY?=
 =?utf-8?B?a25BQjNiRzVCTUFWRWl4V0o5S3daRzNZelM4Z3JPc01NUzJnajZ2aHpTUlIy?=
 =?utf-8?B?WG13WDZOUThsM0FPaWRBTlB0SnlIWHBFVzBUQW10dE5veW9KVExVU2NMT0cz?=
 =?utf-8?Q?/A4XhcFyA8iZ2t8Z8l0/4gE9S2X/R6v55IM8s+1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR11MB2704.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S20vNytnWHp3STNRV3J6TnhPd0xGVmxhRG9uZDQ3dzNuZmNEQnJVZDJld0pY?=
 =?utf-8?B?VDBlUkFNTnNBMCtxWVZoczgvTGFBa3dTSUxVM3NYR3ByeUdwbWlkZHgzN2tD?=
 =?utf-8?B?azd4M3pSclZSQ055UHJmYzR3RXV1cWFRMEh0OGtpL1YrOVJoMERMejRkWW91?=
 =?utf-8?B?V3JSeDVZbXdBOTBjSG9lTjBuM0ZWUXE2VmkvYkFSZFQ4WkxMeHFzNk9lZHY4?=
 =?utf-8?B?MmhGVTEvZDhQQk1ZYlZnRzlaQS9PSzUvQzZ6N05xS0lsMXhXTUMvNUVTMS9Q?=
 =?utf-8?B?aHdhUjZiUDVvMTZsTExrQUxZR0ZScnhYOWtLSk9JcmhNR2txcGt5REJMZ2I5?=
 =?utf-8?B?ak1QTGI4UUtQQUFuSlA1UGQrb1hwUUNtZWdUTlUrZ05yNkRTRis1REZzVHll?=
 =?utf-8?B?STVVdmJ0Wk13RlMydk53a3RVTXVFZW1VRXNoN2R5dTZzTTlGSnFqYlZmZHFz?=
 =?utf-8?B?RVlBMmd3bDdSUXNiaGpsalU4OWdlbm56V1V2U1ZMZ2VodzI2Q3pvajhJdWhv?=
 =?utf-8?B?SFNGOWZGY2J4eTVjU3ozWm4vbCszUDE5YThQOXJCUjFvQkRXenpYY3J3dVlz?=
 =?utf-8?B?eVY2RndHbERCaDhJKzZ3MUFCUlRIMkF3NWcveXRIeS9sOEdpYTB5U2lXc0Q2?=
 =?utf-8?B?THVBTFpQRjlpVGx5NU1IQ3FnWm9tMmNGVHdtc3F4bDl5L1lkdzFES1pDUXlW?=
 =?utf-8?B?b2o1bTNlRnRjK2NKS2tJb01XV2F1ZThQTnlvekVWUGI4SHFMU09yUDJ0dEZE?=
 =?utf-8?B?a2FLUE9sbzhRUEVtTlNMb1VmZC9Xek0zYkgzRE8rNEhWeVlDZG1WK1U1bSto?=
 =?utf-8?B?eURnQWl6N3lHS3VuRTJQTW5ucnlIRWhlRTlFcjRuTDNRUVg2bS94RjMzaUJ3?=
 =?utf-8?B?WUF0UVp2ekpJaWpPRVk4eHoxRmR0ODN4UlJudlcyR1BzdFVWZDdVWHROV2Iz?=
 =?utf-8?B?alBxc1ZQRmxraU0wcGRUdFUxdk9MSFU5RVlJZEoxd3ZJWTA3QXNwaFZ0RCtU?=
 =?utf-8?B?bnlBQ0o4QTBMZ09MZm5rODVCdjhsRUY4WXhqRy8yK2xPVWFRL3NzaEJieHE4?=
 =?utf-8?B?TjF6RVB4WHRnQmJDWjFWSVRaRWNlbDVPZjdZL0diUnBCVkdqVUN2VDZMMTRy?=
 =?utf-8?B?UjZqMmowRUYzTjZYaXJvOS90UU54ZU5Oc3JvQXJiVnNMSU1zczcyT2ZjNEk1?=
 =?utf-8?B?R0Q4ZEs2RkphWVZ6SzlLZXBEUkc4aytDdnhWemVWblJ0R2ZMNWV1aytiYVZC?=
 =?utf-8?B?alNxa0JyWEF2alcwQTM0bFlDemUwK3FWOGdmYWFMODRIazBJVE9zSTM5bjJP?=
 =?utf-8?B?dDVTYTMyRmlXRmxIWnRhcmI1TnVRRTE3MVRjUm8wR2xEYjZNK3d3NEx5SWxz?=
 =?utf-8?B?R09KeXZvWGpMcWpNYzRjcDJsd1BpN29icXIyUHNTNU1pQlFxR0tIQU4xa3hk?=
 =?utf-8?B?TklzT2VGdGdDdDJ6a1J1dmFyaEorVnhPUkxLa1haL2ZRWXBUby9qYzBibmta?=
 =?utf-8?B?M1Znd01SemtVcW5JNTNKSUwyZ3g1bXV2cGJpZEdpRDRWdStBRndoN0FyWmJj?=
 =?utf-8?B?VjFDS2ovUTNBa0k4RjFkcVZjZktmWkVUT1lkZkZPdXl1ZndBSkRUM0VJaEdi?=
 =?utf-8?B?RHhGT1prOUF6T1JSZHNjMFRMaGtKeHRsU2txVGhxZnRucXZVYUwxWllVMGhB?=
 =?utf-8?B?Ukk5bTZwWExQYzc4MHlQTFdVNXYzcDcrcGp3WmVHOEp1T0IycmRZNmo2MXpX?=
 =?utf-8?B?V1ZFaEhMREkrQ2lqSmh4S1lONjlyWFJ4VkU5dzUzNENXUjYyalBHNVplSVdU?=
 =?utf-8?B?Rmo5ZEhiaHp2eTBPZ1FRazF6eSt5TFpmQkk5MWJ5SHVEU0dISTN5TE00NGkv?=
 =?utf-8?B?eFRKemp5aVN0SUNRVHIwMUxzNDZ6dlVXZCt1MGdhdkNQcUxXTkZRV0xhdUU3?=
 =?utf-8?B?RzI2OU9kYWRsY2tPeCtFcnBTUlJJclgrOHFmZkV0RGpKRURyS0xoWW5hdWpr?=
 =?utf-8?B?dVJxMGMyczJtcUhaSGUyK29pKzh5VXRabld1bFg4ZTR1ckhoWEEyTitCcWNI?=
 =?utf-8?B?eU5kc1haMGQ5ZU05RE5TajBwVDg3L1NuSmdzaVE4SUI3SzBBYUlyMkM5Y2w0?=
 =?utf-8?B?WXBsMG9waFpsTjVrazRXblFxaHp3a1JLNXRoMkc2Wm5oNVRvVjl0U1RBMTJv?=
 =?utf-8?Q?E+sVQ+mqi3erNAD6b47K7R0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f91425-381a-43e6-4544-08dcf3f89ac2
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2704.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 06:53:45.6951 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f3MTQY821hdsakE+ib4MLo95sG5sWq30xG7uQUGaab0ClXYxCQ/qsQAPoUfqd5Z7U+7HRecGKwgN+b/hpb+tlk3MVhHDBFf8hyEoWBcAA+pedTO1ASSMuEYxBeVzpisN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6886
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



On 24-10-2024 12:05, Thasleem, Mohammed wrote:
> 
> On 10/24/2024 10:22 AM, Santhosh Reddy Guddati wrote:
>> move backlight_read and backlight_write functions from
>> kms_pm_backlight to library to reuse in other tests.
>>
>> move and rename struct context to intel_backlight_context_t.
>> -->Please format discription correctly and start new line with capital.
>>
>> v2: Rename backlight_read to igt_backlight_read and backlight_write to
>> backlight_write (Suraj).
>> Add a new member to intel_backlight_context_t to cache vendor specific
>> backlight path.
>>     -->please allin above line with v2
		Hi Thasleem,
	Thanks for the feedback, I will make sure to update the 	 
description while merging
>>
>>
>> Signed-off-by: Santhosh Reddy Guddati <santhosh.reddy.guddati@intel.com>
>> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>> ---
>>   lib/igt_kms.c | 66 +++++++++++++++++++++++++++++++++++++++++++++++++++
>>   lib/igt_kms.h | 12 ++++++++++
>>   2 files changed, 78 insertions(+)
>>
>> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
>> index bb35d4b82..5d8096a17 100644
>> --- a/lib/igt_kms.c
>> +++ b/lib/igt_kms.c
>> @@ -7119,3 +7119,69 @@ void igt_reset_link_params(int drm_fd, 
>> igt_output_t *output)
>>       temp = drmModeGetConnector(drm_fd, output->config.connector- 
>> >connector_id);
>>       drmModeFreeConnector(temp);
>>   }
>> +
>> +/**
>> + * igt_backlight_read:
>> + * @result:    Pointer to store the result
>> + * @fname:    Name of the file to read
>> + * @context:    Pointer to the context structure
>> + */
>> +int igt_backlight_read(int *result, const char *fname, 
>> igt_backlight_context_t *context)
>> +{
>> +    int fd;
>> +    char full[PATH_MAX];
>> +    char dst[64];
>> +    int r, e;
>> +
>> +    igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
>> +                context->backlight_dir_path,
>> +                context->path,
>> +                fname) < PATH_MAX);
>> +
>> +    fd = open(full, O_RDONLY);
>> +    if (fd == -1)
>> +        return -errno;
>> +
>> +    r = read(fd, dst, sizeof(dst));
>> +    e = errno;
>> +    close(fd);
>> +
>> +    if (r < 0)
>> +        return -e;
>> +
>> +    errno = 0;
>> +    *result = strtol(dst, NULL, 10);
>> +    return errno;
>> +}
>> +
>> +/**
>> + * igt_backlight_write:
>> + * @value:        Value to write
>> + * @fname:        Name of the file to write
>> + * @context:    Pointer to the context structure
>> + */
>> +int igt_backlight_write(int value, const char *fname, 
>> igt_backlight_context_t *context)
>> +{
>> +    int fd;
>> +    char full[PATH_MAX];
>> +    char src[64];
>> +    int len;
>> +
>> +    igt_assert(snprintf(full, PATH_MAX, "%s/%s/%s",
>> +                context->backlight_dir_path,
>> +                context->path,
>> +                fname) < PATH_MAX);
>> +
>> +    fd = open(full, O_WRONLY);
>> +    if (fd == -1)
>> +        return -errno;
>> +
>> +    len = snprintf(src, sizeof(src), "%i", value);
>> +    len = write(fd, src, len);
>> +    close(fd);
>> +
>> +    if (len < 0)
>> +        return len;
>> +
>> +    return 0;
>> +}
>> diff --git a/lib/igt_kms.h b/lib/igt_kms.h
>> index 2b26d2bbf..bd154d1c1 100644
>> --- a/lib/igt_kms.h
>> +++ b/lib/igt_kms.h
>> @@ -33,6 +33,7 @@
>>   #include <stdint.h>
>>   #include <stddef.h>
>>   #include <assert.h>
>> +#include <limits.h>
>>   #include <xf86drmMode.h>
>> @@ -513,6 +514,15 @@ typedef struct {
>>       uint16_t tile_h_size, tile_v_size;
>>   } igt_tile_info_t;
>> +/* Backlight context*/
>> +typedef struct {
>> +    int max;
>> +    int old;
>> +    igt_output_t *output;
>> +    char path[PATH_MAX];
>> +    char backlight_dir_path[PATH_MAX];
>> +} igt_backlight_context_t;
>> +
>>   void igt_display_reset_outputs(igt_display_t *display);
>>   void igt_display_require(igt_display_t *display, int drm_fd);
>>   void igt_display_fini(igt_display_t *display);
>> @@ -1253,5 +1263,7 @@ bool 
>> igt_has_force_link_training_failure_debugfs(int drmfd, igt_output_t 
>> *output
>>   int igt_get_dp_pending_lt_failures(int drm_fd, igt_output_t *output);
>>   int igt_get_dp_pending_retrain(int drm_fd, igt_output_t *output);
>>   void igt_reset_link_params(int drm_fd, igt_output_t *output);
>> +int igt_backlight_read(int *result, const char *fname, 
>> igt_backlight_context_t *context);
>> +int igt_backlight_write(int value, const char *fname, 
>> igt_backlight_context_t *context);
>>   #endif /* __IGT_KMS_H__ */

