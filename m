Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C5AC3DA49
	for <igt-dev@archiver.kernel.org>; Tue, 16 Jul 2024 04:39:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9B0C10E486;
	Tue, 16 Jul 2024 04:39:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QJH4naet";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE33B10E2EC
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2024 04:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721104797; x=1752640797;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pQrTVxje3bK4lgKigozKvwmM/kCbXVfqvMfop/wXqYI=;
 b=QJH4naetkl3ynQv+b5jPJFrAdpvX1amJF/Yn+JwYIrEut3qrR1HIHzsP
 y3Ohp9sZ//IuR+1x9PXTMfv+n4nvBZFeOkxUQJZjwquoz2KR6dpFEQHXd
 IUMnOgpPbw29JhjaTAY3DJ6S3VpHUWVP4RWJlQVr0dbfZTtE9Ru3IUM5/
 jTO4zixtC6nNIFFjO8yW/eMDZ5cY+mFN2ilZ/xj7fxmwmQegXxEZL3pmZ
 OSThoFO3XGXkPc73OYK4NmKc1lFa9bVn9M4y6nDGN+z6l/s8JuoRU81rF
 3v1xQRO9z1Az3csjM0FoaD6zec4/tQu60MfQjklxZQ1lKEjXGH8DwqQ7p w==;
X-CSE-ConnectionGUID: KLHGk9FnRGihYdsHV3dcKg==
X-CSE-MsgGUID: +0s7TapXR5KNEcFYJhYDOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18657179"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="18657179"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2024 21:39:56 -0700
X-CSE-ConnectionGUID: X/il8ba9RZWDVCYerQ3uZg==
X-CSE-MsgGUID: BGfSXML2SHmjTcJ2c82RWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; d="scan'208";a="49756917"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jul 2024 21:39:56 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 21:39:55 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 21:39:55 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 21:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Goda2i0Elq5cSUwOipu7K5uw6MTAtd4O57qzyeHC+PZ6ffqsDZt5i9RBgIDT/aLS5iLCYUQJlYgLQiKERPo9QA2I7AF4Qs354VuecrGKNA2kn/OCXq9pymEQwihPhhulKnAZ0joANSsKoRZp3G8qwN5IFPoYP3AC2BeqPA5MLzAG4b62nZet/M9qk6S06lEW8wZ3t9ddIu/zmSEmg27Nen4ZV+NTXhstucjvgroenx1+LCma/PJkwqvdNFmfhEHzzQKua1500v0bTZF9n0bo/HNlqQwVMSx06SO1mXpfxhf4pMAaaGxqNvcWC2b6M0zfprwhV1QmwboGU2DbGtKHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U/bPH2+jPY9GiznoBjQsrUh48/D2qz8uEOHHoX6zWmc=;
 b=i/k8A1tSGjrrSVUk6FPKT9Hw2ItcmOJfLyqHb0nbm4jpITC+E85IwlZ/GjkGV6Bcj5Ng/kg+2lXc1QOoK+qMOgNNFzonQ4pSDQpcIX7yqEGdJc66HSa/lEQwzB2LqeshioYdtdt4RityBvkMmj2weEDyxsMB0lFblnOv4+ZwBAC55wuuPi4iIA0fN9AziuExZ2eBmYi6fAmqoQLVKqFGKmmMid0sOchxPVrgh0+1euCUyOt+j5U6Y9O85wddH//e1rzEuJRhXS+SuEwg9eDe+OCBu0N1gC12yrC5nXQg2UibDLn333Q5/3CUlOZK6rp0YhAmTAxd9W5nHQ6OEuncKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by PH7PR11MB7480.namprd11.prod.outlook.com (2603:10b6:510:268::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Tue, 16 Jul
 2024 04:39:53 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%2]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 04:39:53 +0000
Message-ID: <f946c7f7-cf96-4136-a829-033861de0621@intel.com>
Date: Tue, 16 Jul 2024 10:09:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t 4/5] tests/kms_plane_scaling: Improvise the plane
 scaling BW issues
To: Naladala Ramanaidu <ramanaidu.naladala@intel.com>,
 <igt-dev@lists.freedesktop.org>
CC: <kunal1.joshi@intel.com>
References: <20240715154628.583682-1-ramanaidu.naladala@intel.com>
 <20240715154628.583682-5-ramanaidu.naladala@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20240715154628.583682-5-ramanaidu.naladala@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0110.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::7) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|PH7PR11MB7480:EE_
X-MS-Office365-Filtering-Correlation-Id: 75e0e43d-bc5a-45a3-6b4c-08dca5515605
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YVhRVThKUDliUlJ5dGpFY0UxVjZvWU0vVXJaTUI2SFlKbjd2ZkphNFNDOUts?=
 =?utf-8?B?bkkxbzZ5elc5Y0pHYkpFeVZjZy8zVUNVSHdsUVhZU0tVOVB2UHh5MWtQMExs?=
 =?utf-8?B?SGM0eXN5Q2MrSVJ4blVzb1hCTkEvYytPcDBuVldhd2E5aHZpMWtWQ1Q5aG8w?=
 =?utf-8?B?WmxUOVBaM3FKTFZvbk10dERsV3I2RlhCdWhsU3NPQXl0T3VGZG1RRnJjdzdS?=
 =?utf-8?B?M2tCamU0VGxKcTFsaVVnYlhOUW9WUWdwdDhVZ0hKNmhVc2RMN2c2T24wUkFN?=
 =?utf-8?B?RWlOakF6eTVoQjFja1QxUjRsc0IrWFNGNWdxVWgzRGFhMWY1MnhvM2JvdWgw?=
 =?utf-8?B?U20rVjd4R0JWcmJHcHpKcTZNTmNYdm5FbUtrdGs2a0hMZThpWWpaNlJVOUFp?=
 =?utf-8?B?Z3p1eCsvaXlQelZSNWxSZC9hbkpXK09lNXFaQjB2WW40VVJTRFRrcDgrSzVZ?=
 =?utf-8?B?VExwNGtjM1h0dzV4SGQzMVBOK24xQ0tOM080Zmd6S3AyRGZjVmNmUndyaGZ2?=
 =?utf-8?B?Nld4WmcrVnBWVWg1cHNKNlZERXAxNC9FU2hiT2V5S3JUcDV0TXV4WlVyMXg3?=
 =?utf-8?B?cFRSd3JzZXZYU3pJTUJxM2M3WjAzMnpwTGhtTTNpdWk2dlp0b2pnU1BSRE40?=
 =?utf-8?B?NDJFbC9xMHBGMjd2NVA1My9OQWJQdHR3bTNyQWVid0hrbGxaTWZYeHVLSURE?=
 =?utf-8?B?NHFYZjdkNXVtaTcrSWhKR05nTVo4eG5URnBadTlYNUtIRFpxR1M1Y09sZUYw?=
 =?utf-8?B?RlVFbjRKcC9WeWQ2aUYzUFY1T2lNcEFIM3J2S25mbXZxdHMxSDR0SGlhZkgv?=
 =?utf-8?B?R1dSSXh1QlJjZEtmaFR6a0hFTDdkUFZjdUpZdlYzNjk5eTJiWjR4amlaWU5Z?=
 =?utf-8?B?RTNhdVdZL1BwNzdhMjBveXFtU2ZPU1NSaXBoR1RyOUtuakdhRi93UjhPQjJS?=
 =?utf-8?B?UHhKNitSREVGdnVybzJ4Q1ZIU1Q1ZjlTZ3hiWlA4eXllM3U2ZkVSa0lXekxx?=
 =?utf-8?B?d0xCRktSMTdSaitPWnpzdnYrS3pqQ0tzdWZyN3BsaDYwWnBUT041V3hoODRZ?=
 =?utf-8?B?Zkw4ME84R3pLYm5IOTYvRDVidm1YYk90VExlM2t4OHJBQjdJTWVFUDBrT01z?=
 =?utf-8?B?Qml1TzEvUHZGeTZsUDlXaGNaZkR0K0I3TDFzejFOaUZpRWNKTzY2b1YyUDhZ?=
 =?utf-8?B?UmxZRG5qRXJhUnFrL1A2YkY4M21rbyt6d2dNRERRL2l5eVFMSkdySENVaSs1?=
 =?utf-8?B?ZGdKMHlobXc5cVkrRjI1bkNlQm5neHBEZFhqMjF3TmxlVHNKczF2RTBlQXAy?=
 =?utf-8?B?cDVrUHFpMjh1RXcrRVRZLzE5bURBN0hsS1J6cVV0YjlTWXVWSHVvMVc5cUVy?=
 =?utf-8?B?TXQvNW9FRUdGQmE3TGFiS3J1OE5GSWxOblFpNWg1SlhwY29DaE9UYW1YbHJl?=
 =?utf-8?B?RE00K3Z4Ly9WOVFoMVNNUmRoVjMyTHhZMXU2aks1RWdKNHhWRXdxYzdIUHNa?=
 =?utf-8?B?OGFKOU1VbFI0U2p1d1R4WGc0V0w2VEI5Z0FiaXdGR2NVVEsvajJEbFgycEl2?=
 =?utf-8?B?bzRlNWxsZnR4bzRhYVVnRUlrT2NVaXdDQW9EVzYvVG9raXBrL2lyNmN3YWFn?=
 =?utf-8?B?aDV3dXlJdkIzdmxERnhCdUxOZnlGVnpiK1ZpbUJudFpiOG1hVlhzajBBUDBN?=
 =?utf-8?B?WG9LYUlZWHZnV0tYNGVuQkc4TEhwWDJIM0V0eFp6bG1GYmFWRk8yZ1RaVzV1?=
 =?utf-8?B?N0UzYzZUaHFYdDh5K04zWlZZL3dnSmVTYkdaT2VIWjZoODVJNWs5bURVbUE2?=
 =?utf-8?B?c1I4ZDI0aExLeTFyZk1Ydz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmZJVjgyOWFXdlZoN3o1bHI5Yk5lUkpMZEp1bExuVUdyNUNGcGQ4aXJSR2JN?=
 =?utf-8?B?SGhIQzBNYXFuWDI1Tmw4NUUvT2RLQ2NvaDlDSVA3SFRqWmRhOE5DL3pmdzNw?=
 =?utf-8?B?akQzZk1oZGkzMkRvSk5DbnNDaTMzOUdmemU2TThxZ1ZqdXpWWFRyT1h1MDha?=
 =?utf-8?B?ODZOSk9tczdpUkhHdGJIcVVscDRWUG9EVE1ubTd3WXB2anhod21ncGxYRkpp?=
 =?utf-8?B?MDFpMDUyNjM0YVRxTld1bitFekVCMHgxcVpYTnhEM1ZPVkdSK0hKcFMybkNp?=
 =?utf-8?B?R21VdjN0eTMxZnB5cWt2S2FhNjF5ZTFnL0d1ckFBOUFMTCtKcmliUzNlaXJT?=
 =?utf-8?B?RjNZUWNKQjNKZE1vREhGemJMUDB6ckJ2UDlRVGVOZEhBaGVHV1lsaHd1UjZJ?=
 =?utf-8?B?WFc2dVYwUjJkRFErNjE1dkEzSEN0TDVWaTNmTlBOUGYwZGxEbTUyNHU3TnJY?=
 =?utf-8?B?Q0tuandBeG1qcDN6SDJaejZORFZlMFdxcDByQmRKeFZJSjNROE8xdkUvcjAz?=
 =?utf-8?B?MzZvOXFqd3NnL0ZpNHdNa20wVVVoZTdXUFdKUmYrTk15QXJCcnpPVFFIemxD?=
 =?utf-8?B?TStUV2hvdW9Zb1pqMXcydDhyTGFIenp1NW1wbU9zdnpETXk0SDM3SnIrYndM?=
 =?utf-8?B?MitTS2RBbFoxK0liYTVYemhtM0lmdXU5ZWhKQUovL1F0bk44YUhDaEFwUURv?=
 =?utf-8?B?NTNtZkFVNW1zNDV6VjUrdjdackVIeTlncUV1emdIU2lBT2pucXRjMWtvRmVH?=
 =?utf-8?B?UEdyaUNSVE5tVUo3VG5EaEhZL25KYVdMTXhOMnVwR3NNaHBWMkUrREtJVDUr?=
 =?utf-8?B?Q2NLOW9lQzcxdXBoWEVCclVUM2tiUDVXaE1idWR0d0k0ZUlpejRaVVNDTXpz?=
 =?utf-8?B?c21FeTBCeDdCWUtoR1dSQnJZMDRsR1NiS3NrUFJGdDlCSWh4RkpUQk9JTXhu?=
 =?utf-8?B?SUloa1A5TkRsQkJXNGRoWjZlZXBBN25vNitnQkVTWHAva09nVDhWeEhNWGRM?=
 =?utf-8?B?N3d6bGtyL1BwdklTN0huRnlpai91THBRamVoYkpCNURxdnBxWFQ4U29MckVa?=
 =?utf-8?B?ZW9YZnJvUklPV0p3STNiMDU2cTZtSGl5Y2YrQlZHR0J2MWxTbW1UK01JTkd1?=
 =?utf-8?B?bThkY0R5ZjlTNFptclRhNkdGOGQxb0lEcWZkaW4vV0l3enhkUGNmcHFkVmZO?=
 =?utf-8?B?bjFNSUJEenFtWDZvOTBTR3oyT1N4WGo0aEltY0I3dnp4ZVB4d2tjdjFGd0dr?=
 =?utf-8?B?WHMyNXU3VTdDZ05wdEEvZmVBT2FIcHd4R2RzbkQ1RCtsR0dQMEpXRG9zN1lG?=
 =?utf-8?B?eHllVzZrN0dUUmRBKzV2VElCVVp4UkhOamEzaFJEOFVUTjd3MTU2dGJHLzJR?=
 =?utf-8?B?M3NuOWVWVURiNEc2bXUvSmdyOHpiYUNiZ25UUXhmL3RJUmZxWTJjZmwwdk1s?=
 =?utf-8?B?bnYzbUxVWmNYTnoxNGZ1a1ZFZEZtM3cxYjJ3STNPNnBOYzlBT25tYlJSSjhh?=
 =?utf-8?B?NzJTdFd5LzZOdlFhWGtEZnFZVVdPZzAzeFBWSXNrbWFOOXExTDJRUzlRcGVo?=
 =?utf-8?B?bVc5Nkp3TmZEVkd0aEl5Nk84YUZZdnNFRHFTOTlkTWR2YWE4TVU2ZDJHemdH?=
 =?utf-8?B?NEZVN1Y5aExNSktyTDE0ZHhybDhlMWUzMFFsK3F1R0dlRSswb0FvRnFTMHVl?=
 =?utf-8?B?eXd1RXVUNm1kbXVhRHBhb2VwT3RNQTdVcmY2K1FYdnRmL2R5bGFoSW9wMnhx?=
 =?utf-8?B?ZXdVMSszU1YxNWpZS0tDMTVKWHRnbHE2ckpvclFCNlBDREhtQ1RzZnl6WFo1?=
 =?utf-8?B?dENrQ0VnQ2tNaGhGWDRodUthTi92SE50ekcrbW1tajFZZ3FRM04wWG5uSGRi?=
 =?utf-8?B?ZXpGSkZETlpGekJUN1VlMTNrU0g1NTk3MzFxNnd1VzNTaFovcmFRaCtrTDE0?=
 =?utf-8?B?NXhSckJpeVhUeWM0L2d2WTRrM1hpOEw3bXhiMVl2Y2t6Mll6NDhuRWx0eG14?=
 =?utf-8?B?RjZucEVQb2VQMHMvUU1qdDBObXdpcG4zdm5hdE13aUZrckExNlJ2T05TWllI?=
 =?utf-8?B?ZDFLRE02NzVaQmIrQmhCQUFHVVpHMnppTFp4MHN1V3NMNGYvTVFjVzhSTi83?=
 =?utf-8?B?L1VoUnpTYmllZEMxeksrQlZoLzUvWHFZQTF3T00wTnFHb1l5WHo1RzZmcFAw?=
 =?utf-8?B?MHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 75e0e43d-bc5a-45a3-6b4c-08dca5515605
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 04:39:53.7194 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UESrRn2Ij/u2ytyAJIiaD2JmYR2zW1wU4MHTJBWtMkbv3BAXasDtXcr1/OVPN9okhPre8DlwOZxsgNkvVN8uvxZAR0CjXTp+nqBuqSD1DyU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7480
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


On 7/15/2024 9:16 PM, Naladala Ramanaidu wrote:
> Anticipating bandwidth issues, we expect many tests to fail. To
> address these failures, we will switch to the next lowest display
> modes. Higher display modes will be identified as insufficient for
> downscaling operations on plane scaling. As a solution, we
> will implement a fix: when bandwidth is inadequate for current
> modes, the system will automatically attempt the next lower
> display mode.
>
> Signed-off-by: Naladala Ramanaidu <ramanaidu.naladala@intel.com>
> ---
>   tests/kms_plane_scaling.c | 82 +++++++++++++++++++--------------------
>   1 file changed, 40 insertions(+), 42 deletions(-)
>
> diff --git a/tests/kms_plane_scaling.c b/tests/kms_plane_scaling.c
> index 1702ec8c8..020d72953 100644
> --- a/tests/kms_plane_scaling.c
> +++ b/tests/kms_plane_scaling.c
> @@ -582,54 +582,52 @@ static void check_scaling_pipe_plane_rot(data_t *d, igt_plane_t *plane,
>   	int w, h;
>   	int width, height;
>   
> -	mode = igt_output_get_mode(output);
> -
> -	if (is_clip_clamp == true) {
> -		width = mode->hdisplay + 100;
> -		height = mode->vdisplay + 100;
> -	} else {
> -		width = get_width(mode, sf_plane1);
> -		height = get_height(mode, sf_plane1);
> -	}
> -
> -	if (is_upscale) {
> -		w = width;
> -		h = height;
> -	} else {
> -		w = mode->hdisplay;
> -		h = mode->vdisplay;
> +	for_each_connector_mode(output) {
> +		mode = &output->config.connector->modes[j__];
> +		if (is_upscale) {
> +			w = get_width(mode, sf_plane1);
> +			h = get_height(mode, sf_plane1);
> +		} else {
> +			if (is_clip_clamp == true) {
> +				width = mode->hdisplay + 100;
> +				height = mode->vdisplay + 100;
> +			} else {
> +				width = get_width(mode, sf_plane1);
> +				height = get_height(mode, sf_plane1);
> +			}
> +			w = mode->hdisplay;
> +			h = mode->vdisplay;
> +		}
> +		/*
> +		 * guarantee even value width/height to avoid fractional
> +		 * uv component in chroma subsampling for yuv 4:2:0 formats
> +		 */
> +		w = ALIGN(w, 2);
> +		h = ALIGN(h, 2);
> +		igt_create_fb(display->drm_fd, w, h, pixel_format,
> +				modifier, &d->fb[0]);
> +		igt_plane_set_fb(plane, &d->fb[0]);
> +		igt_fb_set_position(&d->fb[0], plane, 0, 0);
> +		igt_fb_set_size(&d->fb[0], plane, w, h);
> +		igt_plane_set_position(plane, 0, 0);
> +
> +		if (is_upscale)
> +			igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> +		else
> +			igt_plane_set_size(plane, width, height);
> +
> +		if (rot != IGT_ROTATION_0)
> +			igt_plane_set_rotation(plane, rot);
> +		commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> +		if (commit_ret == 0)
> +			break;
>   	}
>   
> -	/*
> -	 * guarantee even value width/height to avoid fractional
> -	 * uv component in chroma subsampling for yuv 4:2:0 formats
> -	 * */
> -	w = ALIGN(w, 2);
> -	h = ALIGN(h, 2);
> -
> -	igt_create_fb(display->drm_fd, w, h, pixel_format, modifier, &d->fb[0]);
> -
> -	igt_plane_set_fb(plane, &d->fb[0]);
> -	igt_fb_set_position(&d->fb[0], plane, 0, 0);
> -	igt_fb_set_size(&d->fb[0], plane, w, h);
> -	igt_plane_set_position(plane, 0, 0);
> -
> -	if (is_upscale)
> -		igt_plane_set_size(plane, mode->hdisplay, mode->vdisplay);
> -	else
> -		igt_plane_set_size(plane, width, height);
> -
> -	if (rot != IGT_ROTATION_0)
> -		igt_plane_set_rotation(plane, rot);
> -	commit_ret = igt_display_try_commit2(display, COMMIT_ATOMIC);
> -
>   	igt_plane_set_fb(plane, NULL);
>   	igt_plane_set_position(plane, 0, 0);
>   	cleanup_fbs(d);
> -
>   	igt_skip_on_f(commit_ret == -ERANGE || commit_ret == -EINVAL,
> -		      "Unsupported scaling factor with fb size %dx%d\n",
> -		      w, h);
> +			"Unsupported scaling factor with fb size %dx%d\n", w, h);

I think this is unintended change.

Otherwise looks good to me.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


>   	igt_assert_eq(commit_ret, 0);
>   }
>   
