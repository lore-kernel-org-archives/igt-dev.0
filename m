Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106FDC3064D
	for <igt-dev@archiver.kernel.org>; Wed, 26 Jun 2024 05:43:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD23C10E777;
	Wed, 26 Jun 2024 05:43:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y9pbAmzn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B4510E775
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Jun 2024 05:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719380598; x=1750916598;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=6WL9cQXaY03gUOf2wYQpoBL+FreAM0obzf1BITqpCuY=;
 b=Y9pbAmznl/BlMcFdXeem4Ztmxp+EFzFSFNkNT3FiyiSILy8kmtRuxUnL
 /jwpQhdYGIiuva/PQmyO7+hYt4Iz4EtUSv/B7bsKAcU39GwfMmbDqcOpe
 9IMXD1w2M/bVQfTCcO+9Dnl0O9g/MDI20mxf2zGsOd8dhx6Ah3cu/2H0l
 6gBKIcs+RbylPP8KByyWMVDqUyuIAMHfOQ8rHEMpRFnYNXfRIG58wb5ox
 3XZnMr3oYgKAvPeaahwZ/7toKVhVTMgU86o3jmj+9+fkhuH9z9djqeMQO
 xtLDwVrFuDSUv2oxyXdrpNyBEtkKm6o2BQksy28a3HipCWgiTXSoprWnW Q==;
X-CSE-ConnectionGUID: dJD6PWnLR/6Cksws1+r3uA==
X-CSE-MsgGUID: VDv0ahL8TtOi8qnQWVoXBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11114"; a="19323719"
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208,217";a="19323719"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2024 22:43:18 -0700
X-CSE-ConnectionGUID: cXKoVEoyTy+LtjzhxqkSXg==
X-CSE-MsgGUID: 8e3/00laTRaT77T+r9tQMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,266,1712646000"; d="scan'208,217";a="44322537"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Jun 2024 22:43:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 25 Jun 2024 22:43:16 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 25 Jun 2024 22:43:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 25 Jun 2024 22:43:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fuhrk7FfKLwjw2S7RsnvJLCSCIvzpBdb5D6MgvczSqAkcqcxU9lMf+21tAdMZWfSri/VhZQdsFdmyOP7hlkdsspQ2TJLkBke0pdsbUtqzkFF11JN7EoRK+x2TGRRBdZ471NdLX0d79W6xvlEOyVuFUxu5NgEsoLopptAs4IdreSXB6f0G4TVMnv03XVmb4+5zzYCrYs/UaUGYBQNTXqwcik/5wZSA2kExeQ9+Ee9Vz7YiqGiZBPnb+5GFoSoB7QUKRn1TiFfKi1dbtZ4GSDUl0K0Aw6KCKRZske7f5w4VyyMmAa/YC3e15vnxO/fZeC4EP3aFYMHa+nk61eAj/RhVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tujQb25XKTuvkfwyrRAUwEIv/Dc3T83rn0xRh4DP6Ek=;
 b=S5HOpWPvP8S1fSx9V+q/CgNnfep8KWLq79DXETqovGvhuwITzdsgiWP2VkmiSUFxUkBkG/gpDz4Jw+07VzxbPV/Ggm0IMoVRPaaosywDcVRg7LaCP8dB0G9+o++hFeycTfGtIuuugwDVEAjL3Op18yBQ8BKp7HVHOvxZy5vGRzSKo8iYNMbdNSwEkuGEkmkTDZ+g+pFWrsOAjkpu6mtWqQQOjbIdAAOs9DALjKnlDV9FYh25GzVUaQfcL0reGDp+JHXgGs7zGEVgl70uschYGPO33WAq2LNzKX80CSZh0fDgmz6RYWoAtw1bW6KhOwqR+d9A894QyEyQdF+8SY9UDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5690.namprd11.prod.outlook.com (2603:10b6:610:ed::9)
 by SJ2PR11MB8422.namprd11.prod.outlook.com (2603:10b6:a03:542::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Wed, 26 Jun
 2024 05:43:15 +0000
Received: from CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062]) by CH0PR11MB5690.namprd11.prod.outlook.com
 ([fe80::6b98:f467:da49:e062%5]) with mapi id 15.20.7698.025; Wed, 26 Jun 2024
 05:43:14 +0000
Content-Type: multipart/alternative;
 boundary="------------OeNyMnWP6rLwvGURVs4NPHHW"
Message-ID: <d3770d78-3334-47a3-a439-a6b1e4f684a3@intel.com>
Date: Wed, 26 Jun 2024 11:13:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH i-g-t] tests/kms_getfb: Skip getfb2-accept-ccs subtest on
 Xe2 platforms
To: Pranay Samala <pranay.samala@intel.com>, <igt-dev@lists.freedesktop.org>
CC: <sameer.lattannavar@intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>
References: <20240621043248.612664-1-pranay.samala@intel.com>
Content-Language: en-US
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20240621043248.612664-1-pranay.samala@intel.com>
X-ClientProxiedBy: MA0PR01CA0083.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::9) To CH0PR11MB5690.namprd11.prod.outlook.com
 (2603:10b6:610:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5690:EE_|SJ2PR11MB8422:EE_
X-MS-Office365-Filtering-Correlation-Id: 470f2f16-baba-4594-2c7b-08dc95a2df62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230038|1800799022|366014|376012;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eDBzazdvUnp0dTNuM0pTckFEdE9wTUhlUDJtUXladVJldkVjbXJmZTkyR25J?=
 =?utf-8?B?N2tUTld5ODYzNXF5WEc4QzlBSE4zbnpIaW9KWXNpeHlSVFRqakh5ZUIxdHRW?=
 =?utf-8?B?MmQwZmVYbjA1aWZmdXk2NGpNc3hqYkZRQWhBckhQTnoxY3A2enBPQXVrNTRj?=
 =?utf-8?B?R2I1U0drZW81T0l2MytrRGo3ZmNlT2ZoWGlOOGVCODg0WEwvUEVUL3J0WFpW?=
 =?utf-8?B?dnV4WnA5aHN2Y0NCdG9HalNnZHBBZHpLa2h1WUszV2hYOE9VbDVIWHlnd093?=
 =?utf-8?B?V1YzYXNtRmMzbzQyMklkQklRUWZqTnRYdlFNdTl0ejZtZU1kbnhPR3FBZTZt?=
 =?utf-8?B?Q05xRWtrZjZ0VEJ6QmVxajAwRzA1VGhoRkF6bE1pWTBaa1lEejFQSy85Qkc3?=
 =?utf-8?B?b1IxY2kxR01jaWFvSE11ZnZ0S0M1L0JXbG5IV2pWRHZscG1mWnZhUy81RjVI?=
 =?utf-8?B?cy9mOG5GYlMyNGdOMmg0UW10Mk1CRzRzZnhQNzR0ZTlzdjNjN1krcXlFYWUr?=
 =?utf-8?B?Tm54ZytGSHkrejhmRHlJbFVpYWpITjJWaklPS3lERUkvR2Y3YXZubDVubjdN?=
 =?utf-8?B?SU9taUNEVVllZ1V0aGdVRm9sdnp4TTBQamVVQVJlbC8rMGJNb3ZSOGo2QjZT?=
 =?utf-8?B?bVZDWmYrUXBQUys4dkhTaGM0RjRnNTUxdU9kRFVUT0RlRFp3ZDJQOG5xakZy?=
 =?utf-8?B?Tm1ueENBcVpiVGJnYXAvVlc3d1RnaHRwbUxZVU1abjdZS2laamU4cWNXRGJy?=
 =?utf-8?B?bmZPNXhNaWtRck1YUlVTOUI4N1RqdUFUeG81ZGduV0FCZFM2ZmpGYVhJKzZ2?=
 =?utf-8?B?c0JaQmRJRlJDMlJlQzBDeDhOTFkyUFNQWGV4Z2Q0L2JOSTl2ZzBtYUh5N05x?=
 =?utf-8?B?eDhyNS9CUHdZdkNBbFVNalFyYndpTkNXaFgyQmt1ZEthaStRaWw4bFlwQkhq?=
 =?utf-8?B?dmxielpJRHpUWFFRWVM2b00rQXE0YksyQnFiZnIxWUVaUzlYWVRySFBtS09L?=
 =?utf-8?B?V1IweTdCcXNXUFUrWlNWYWhyTHY4SXVIOWJqSjd3Ukx4azk3cmVaRldmZHFH?=
 =?utf-8?B?WXNxUFFhb0dZemhtMTQ5SE5mN0ZNbkU2QU81QWIvNElTaDRUaDRTb3JBdFVR?=
 =?utf-8?B?MUFGY09FYkRwMWZzREpQUVlTVVFybm5ZQWI5d0lrM2NmTkNPUjlsRGdqYU9j?=
 =?utf-8?B?OGlJUkIzTTBKZ0MydFcwSmFKUGFrYmx6K002YVpqV2tic1VxdDdpRldWVzJH?=
 =?utf-8?B?OU1DY2tmdDI4eHo1KzVzNEFhRXhZVFg1czdMUWVXdHRqZkpPV1B1QzNyL3N1?=
 =?utf-8?B?REJDQjc1VG9FTTJ6bVVLOGxGUVplWksyUmhCRnBFZHM5TUtjbndLZ3JNOExm?=
 =?utf-8?B?cWNCL0xFSlJpMlE0ck1Sem1YMTk2d1VsU0czQ2MwMUtZSExaaUZDUW5RNG9m?=
 =?utf-8?B?MFFueFNwc3FYazBKb2lKME1PM09RUnZpdk1ERjVwdkhBZ2wxSTVWbmJlekZk?=
 =?utf-8?B?cFlEWS92U1lIV2VuMFgyNUZXemIrK2cyT3NoTFBmZlBUMjlPcXBWNkNzMXBI?=
 =?utf-8?B?cXlDbWkvVmVxZExaZHhRS005RkIyMU1VN1dQcnh4MWxxSlp1UllEcGdkTGZE?=
 =?utf-8?B?NDhKcGZVRWp5MHhtV0RsY2ZiMGdxRVVaQnM1cnhZTW80MmJKekhXVlM4QnR2?=
 =?utf-8?Q?GKWdXWo9bUQb9IMPOjt0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5690.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230038)(1800799022)(366014)(376012); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUFuaFVqVGNOc243LzMydm5Vb0pjVGRKOTF0M1k1Y0orMGl6SWNFZEhvbU9X?=
 =?utf-8?B?aHhraG9objNUQ3JGZHVzUERRMFFlZFQ0dUJySXBwMUVtMDZCdXNUcHJackdZ?=
 =?utf-8?B?Ykx0YW9XTXNEZVIrUkhRTWZnbUdaWmw0a0xOMmRvQUFjQytMYmM3cUdPWXJu?=
 =?utf-8?B?Mlpaa3ZtMzkyTDFwMlFoUjhPYnlNRU1USXE3Ti9TdW1EcFR4d1ZHTU4rN3Va?=
 =?utf-8?B?TFpwUVRDUjNybkxqVmZ3eWNOaUtaNEc5M3JqL25KdEd6QUw0N1M3Q1Z5TEha?=
 =?utf-8?B?Rlk1T2lRMDc3d3RDNE9pUGhUVGdGb0poRWxPaThCMWlqYVgrN2NxOERsSHlI?=
 =?utf-8?B?b01wU1RtTHhMTjZPMERuRGw4NXRGbDBscXQxbUc4KzBtZXplZktIaE9PQW1I?=
 =?utf-8?B?dzFPdHBHa1dSWTRiRTNiQ0d6OEVHOGpvSitZOE1saGdNdGIyNU04TWd5c0xE?=
 =?utf-8?B?Qkd4Z3VtdDJ3YkFWUjZvb0lmczcyTEJMejVGd1VMTVJMOThjNXYyK0ExSmZu?=
 =?utf-8?B?Tml0bFU2RmhCZERERGF6S0gyeHVlN0N2OFlXKzFEVUE3R3J4cG5mcGhmUWtW?=
 =?utf-8?B?b0c5UmdQaTJraU1XbHV3YW83bHdSSzdWVDFXSm1qUzBjeU1XckZsWm1YVXR6?=
 =?utf-8?B?aVNac01XRmZlRFZ6S0tleDFGK2orK0NaZzRtTEZlZDhudlBWcExEKzE5QnNp?=
 =?utf-8?B?dzhuVUJpN0hXOHZNWVVXUHVGbE5sWU50MCtJZ09TU2tidy80aXFSeGJQdDVT?=
 =?utf-8?B?ZUIxQmtWSisyeDJmRlNuci83aGEwVVJEMjlaN2M4Qlk2bm0wRkoxNE5GaWwz?=
 =?utf-8?B?TStDZDhlNWQ1bFhqSWRpZDhSTW9kb0p4VEFNM216VDBmaUNPUUwvNzdPWlFT?=
 =?utf-8?B?MU5mZkhQRUhYTlJjTE1KdmVDRjJHK2p2UzhOTFBRS05leUZjMXQ2WGRPU3VZ?=
 =?utf-8?B?YkNrdXBjMlNCbGl3N0M1clBMMklsZHFnVFFFRzRsREJKdjNLQ0dwZjJ3ZHRN?=
 =?utf-8?B?OVdTVDdJejdDSm1EVWE0cS9mS09jZDd2d0ZScm1WWFBLUDhwR28wbmFwclVq?=
 =?utf-8?B?U3l6eTRLck12U2dIVkg3dWVubDdGeFNIU0VrQUxaVUM1ZnNGa0d0T2toejdn?=
 =?utf-8?B?WUE2RUlIenJ2M3Y5Nk1tMjlJTVFtQldQTGVacHNXWHd4WVA2alVxU2RFS3ln?=
 =?utf-8?B?R25wcTFaY3ZuSEY2elBYTGxFOGdoVUYrZ0JtbEoyVGpNOXNHMnBMRzg5eTJ2?=
 =?utf-8?B?MkVjTXlvU05HUDJtei9HT01CZGloUTAyYjBvZ2dHNk16eVV1RjRQVitTd3cx?=
 =?utf-8?B?OHQvQmt2VlZWQ2g3R2ZyRVlvMXRsWXN1OUZZNnBMYktBQ1VXZEI2eVYrcEtt?=
 =?utf-8?B?ZC9rbEF0SW5KTHNQbEIrUkQzdTM3TnJPMDJWN1RzZmVIN293Nlo3b0ZvNXRs?=
 =?utf-8?B?T0RreUdnNFlIYVBWM3lDYzl4eHRQb2Rwc0ViNDlMR1EzQndiMWNZTXlEUklP?=
 =?utf-8?B?alFITVpXTVNsN0JrcjRlMjdEcU5DTHBEeVlUYXE4SlRLZmNmTmxZT25TMWNJ?=
 =?utf-8?B?cHFyV0hvRjNYVVVKajhBU1poRy9SUW0rQzVHTWFmUzdmZG8rajdlM0hPREpl?=
 =?utf-8?B?dTUyUmhJL2FUQzd3cTR0aDc4Vm5SamMyM1VvVkQ1cmdPRi9uMG5mMEYzak1I?=
 =?utf-8?B?MHN1eTE5RkNrSWZDWUVOUFZwR2hpY0E3YUNFMXYxR3pwdjFPUmZ6SFl0YVBM?=
 =?utf-8?B?NUNjNjlDeE84bnpyeHpETWFrM0ZkZXNvdDdFejBZaXhUZ2c3bys1eTh4YTVU?=
 =?utf-8?B?WHVOc2U5UFF2OXJuamlRTWJ1QTVJRkZEbjNxbUxHTFhTUDFYTDQ3N1ZOVlRK?=
 =?utf-8?B?QTFqNWkvYzY3SWErUzVsN3ZSUDI5R3R4ZUFBYjhlZ0xjMHBCVHMrSTJ1QkVL?=
 =?utf-8?B?QVBNNlcxc2pzRDlSQkhqS3NmM3d6QUowQndNTE9FZUh3cDFFRjIwYjUvZUh3?=
 =?utf-8?B?ekdVOTRycXM0R0JnVFdGeTZHZHZNRlVIc0VVREdncFlqazVmdDMrcDFTaTJJ?=
 =?utf-8?B?Q0tuT21hY01ZMm13bEdNbVRmOW5lelAxbVhBN3VPU2FsbXdZeE13SWp0V3dJ?=
 =?utf-8?Q?2ZC+9w/s44hmR88i/qYXeg9tS?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 470f2f16-baba-4594-2c7b-08dc95a2df62
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5690.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2024 05:43:14.8106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FtY2ZY2WkTWw5k18u75Zsqyqll8WEKmXFEo8ZQNRjeHTkLzz/Z1lzIJwuDC8Ui7425Kqbn6168GbgKlUCpjfQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8422
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

--------------OeNyMnWP6rLwvGURVs4NPHHW
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 6/21/2024 10:02 AM, Pranay Samala wrote:
> The getfb2-accept-ccs subtest tests on ccs modifiers.
> With Xe2 platforms we no more have the ccs modifiers.
>
> Adding a check to verify the platform. If it is
> Xe2 platform then test will skip, otherwise it
> will execute further.
>
> Signed-off-by: Pranay Samala<pranay.samala@intel.com>
> ---
>   tests/kms_getfb.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
> index bb9679bc9..81829ca3b 100644
> --- a/tests/kms_getfb.c
> +++ b/tests/kms_getfb.c
> @@ -161,6 +161,9 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
>   	igt_require(has_addfb2_iface(fd));
>   	devid = intel_get_drm_devid(fd);
>   
> +	igt_require_f(intel_graphics_ver(devid) < 20,
> +		      "No ccs modifiers on Xe2\n");
> +

Hi Pranay,

I see that getfb tests are skipping on legacy platforms with this patch.
https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11292/index.html?testfilter=kms_getfb

This should be resolved by replacing 'intel_graphics_ver' with 
'intel_display_ver'. Could you please update this.

Thanks,
Karthik.B.S
>   	if (HAS_FLATCCS(devid)) {
>   		add.modifier[0] = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
>   		add.pitches[0] = ALIGN(add.width * 4, 4 * 512);
--------------OeNyMnWP6rLwvGURVs4NPHHW
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 6/21/2024 10:02 AM, Pranay Samala
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240621043248.612664-1-pranay.samala@intel.com">
      <pre class="moz-quote-pre" wrap="">The getfb2-accept-ccs subtest tests on ccs modifiers.
With Xe2 platforms we no more have the ccs modifiers.

Adding a check to verify the platform. If it is
Xe2 platform then test will skip, otherwise it
will execute further.

Signed-off-by: Pranay Samala <a class="moz-txt-link-rfc2396E" href="mailto:pranay.samala@intel.com">&lt;pranay.samala@intel.com&gt;</a>
---
 tests/kms_getfb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/kms_getfb.c b/tests/kms_getfb.c
index bb9679bc9..81829ca3b 100644
--- a/tests/kms_getfb.c
+++ b/tests/kms_getfb.c
@@ -161,6 +161,9 @@ static void get_ccs_fb(int fd, struct drm_mode_fb_cmd2 *ret)
 	igt_require(has_addfb2_iface(fd));
 	devid = intel_get_drm_devid(fd);
 
+	igt_require_f(intel_graphics_ver(devid) &lt; 20,
+		      &quot;No ccs modifiers on Xe2\n&quot;);
+</pre>
    </blockquote>
    <p>Hi Pranay,</p>
    I see that getfb tests are skipping on legacy platforms with this
    patch.<br>
<a class="moz-txt-link-freetext" href="https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11292/index.html?testfilter=kms_getfb">https://intel-gfx-ci.01.org/tree/drm-tip/IGTPW_11292/index.html?testfilter=kms_getfb</a><br>
    <p>This should be resolved by replacing 'intel_graphics_ver' with '<span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">intel_display_ver'. Could you please update this.<br>
        </span></span></p>
    <span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">Thanks,</span></span><br>
    <span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">Karthik.B.S<br>
      </span></span>
    <blockquote type="cite" cite="mid:20240621043248.612664-1-pranay.samala@intel.com">
      <pre class="moz-quote-pre" wrap="">
 	if (HAS_FLATCCS(devid)) {
 		add.modifier[0] = I915_FORMAT_MOD_4_TILED_DG2_RC_CCS;
 		add.pitches[0] = ALIGN(add.width * 4, 4 * 512);
</pre>
    </blockquote>
  </body>
</html>

--------------OeNyMnWP6rLwvGURVs4NPHHW--
